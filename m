Return-Path: <Qi.Chen@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 5A26271B27
	for <openembedded-core@lists.openembedded.org>;
	Fri, 26 Oct 2018 05:02:30 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id w9Q52TkB016124
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 25 Oct 2018 22:02:29 -0700 (PDT)
Received: from [128.224.162.218] (128.224.162.218) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.408.0;
	Thu, 25 Oct 2018 22:02:28 -0700
To: Victor Kamensky <kamensky@cisco.com>,
	<openembedded-core@lists.openembedded.org>
References: <20181026045303.10592-1-kamensky@cisco.com>
From: ChenQi <Qi.Chen@windriver.com>
Message-ID: <71927521-2b7f-7ca9-e428-7a8a52c44eca@windriver.com>
Date: Fri, 26 Oct 2018 13:08:39 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.4.0
MIME-Version: 1.0
In-Reply-To: <20181026045303.10592-1-kamensky@cisco.com>
X-Originating-IP: [128.224.162.218]
Subject: Re: [PATCH] sysklogd: add alternatives for klogd and syslogd
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 26 Oct 2018 05:02:30 -0000
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit

On 10/26/2018 12:53 PM, Victor Kamensky via Openembedded-core wrote:
> Otherwise when used in presense of busybox that provides
> its own version of klogd and syslogd, image packaging
> complains that klogd exists and it is not syymbolic link.
> Failure happens only if image packaging script install
> sysklogd package first followed by installtion of busybox
> package.

Hi Victor,

I think this problem has been fixed by the following commit.

"""
commit ef11c54ba99af261a70ec31091216cdd1556da24
Author: Richard Purdie <richard.purdie@linuxfoundation.org>
Date:   Wed Sep 5 17:39:31 2018 +0100

     busybox: Put klogd/syslogd alternative links in syslog package

     Currently these are in ${PN} and ${PN}-syslog may get replaced by
     other packages but update-alternatives would error in the postinst
     if other files were installed first. Avoid the problems by putting
     the links in the correct package.

     Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
"""

For the current status, the update-alternatives operations for syslogd 
and klogd should be in the busybox-syslog package, which conflicts with 
sysklogd package.

Could you please help check this?

Best Regards,
Chen Qi

>   If during packaging reverse installtion order
> happens, busybox first followed by sysklogd, packaging
> succeed.
>
> Note this fix along with recently committed
> 55ba9dc1f8 sysklogd: Re-enable alternatives for syslogd.8 man page
> effectively reverts this commit
> 988aad01b2 sysklogd: don't use update-alternatives
>
> Signed-off-by: Victor Kamensky <kamensky@cisco.com>
> ---
> Hi Guys,
>
> Here is more details. Example of failure that I observe:
>
> update-alternatives: Error: not linking /home/wd8/oe/20181021/build/tmp-glibc/work/intel_corei7_64-oe-linux/kdevel-console-devel-image/1.0-r0/rootfs/sbin/klogd to /usr/lib/busybox/sbin/klogd since /home/wd8/oe/20181021/build/tmp-glibc/work/intel_corei7_64-oe-linux/kdevel-console-devel-image/1.0-r0/rootfs/sbin/klogd exists and is not a link
>
> Also 988aad01b2 says:
>
>> Using update-alternatives for managing init scripts has proved to be
>> problematic. And, sysklogd rconflicts with other syslog daemons so there
>> is no point in using update-alternatives from this perspective, either.
> I am not sure why "managing init scripts has proved to be problematic" and
> syslogd and klogd are not really init script per se, aren't they? Also
> klogd and syslogd actually come from busybox, not busybox-syslog as listed
> in sysklogd RCONFLICTS. Maybe it what has changed since 988aad01b2.
> busybox-syslog now contains only init script for syslog and its
> configuration.
>
> Adding Markus for further comments.
>
>   meta/recipes-extended/sysklogd/sysklogd.inc | 5 +++++
>   1 file changed, 5 insertions(+)
>
> diff --git a/meta/recipes-extended/sysklogd/sysklogd.inc b/meta/recipes-extended/sysklogd/sysklogd.inc
> index f151dd87f7..4393a39180 100644
> --- a/meta/recipes-extended/sysklogd/sysklogd.inc
> +++ b/meta/recipes-extended/sysklogd/sysklogd.inc
> @@ -60,9 +60,14 @@ FILES_${PN} += "${@bb.utils.contains('DISTRO_FEATURES','systemd','${exec_prefix}
>   
>   ALTERNATIVE_PRIORITY = "100"
>   
> +ALTERNATIVE_${PN} = "syslogd klogd"
> +
>   ALTERNATIVE_${PN}-doc = "syslogd.8"
>   ALTERNATIVE_LINK_NAME[syslogd.8] = "${mandir}/man8/syslogd.8"
>   
> +ALTERNATIVE_LINK_NAME[syslogd] = "${base_sbindir}/syslogd"
> +ALTERNATIVE_LINK_NAME[klogd] = "${base_sbindir}/klogd"
> +
>   pkg_prerm_${PN} () {
>   	if test "x$D" = "x"; then
>   	if test "$1" = "upgrade" -o "$1" = "remove"; then



