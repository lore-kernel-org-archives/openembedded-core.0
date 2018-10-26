Return-Path: <kamensky@cisco.com>
Received: from alln-iport-4.cisco.com (alln-iport-4.cisco.com [173.37.142.91])
	by mail.openembedded.org (Postfix) with ESMTP id 41E3260069
	for <openembedded-core@lists.openembedded.org>;
	Fri, 26 Oct 2018 07:29:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=cisco.com; i=@cisco.com; l=4481; q=dns/txt; s=iport;
	t=1540538941; x=1541748541;
	h=date:from:to:cc:subject:in-reply-to:message-id:
	references:mime-version;
	bh=B2zUu1Q2TgHweyT1+0dSDWGS2mSfvhwBNOoTkgoETSE=;
	b=EwYYQu5szIAkqseS/UtAGS30v6EFKwjTzqX47lMmTMBcnRMCJEWXiifA
	ZWV3pIsalG0b7zawrD3J/FPIzVOWE3J7X4Zutr5OCWPmrthQWS1j7CDdS
	0LH5mv/qdQhctfVfYlUJPzhKNjKyWdaqwnAQsFTuMQV511ywZFwNlK/X+ M=;
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: =?us-ascii?q?A0BCAADhwdJb/5xdJa1jGQEBAQEBAQE?=
	=?us-ascii?q?BAQEBAQcBAQEBAQGBZYIFZn8ojGyLOIFoJZkWCwEBJ4RFAoMTITgWAQMBAQI?=
	=?us-ascii?q?BAQJtHAyFOgEBAQECATgCPwULCxQELlcGE4MigXkID6d5ih2LZxeCAIFEgl+?=
	=?us-ascii?q?DEAsEGIciAohUEj+GLI8qCYZpgx+HD4FShHeJe4kygzmJfgIECwIUgVohgVV?=
	=?us-ascii?q?NIxWDJwmLEIVeHzABAQiNHwEB?=
X-IronPort-AV: E=Sophos;i="5.54,427,1534809600"; d="scan'208";a="191815368"
Received: from rcdn-core-5.cisco.com ([173.37.93.156])
	by alln-iport-4.cisco.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	26 Oct 2018 07:29:00 +0000
Received: from sjc-ads-6991 (sjc-ads-6991.cisco.com [10.30.218.111])
	by rcdn-core-5.cisco.com (8.15.2/8.15.2) with ESMTPS id w9Q7SxNE014529
	(version=TLSv1 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Fri, 26 Oct 2018 07:29:00 GMT
Date: Fri, 26 Oct 2018 00:28:59 -0700 (PDT)
From: Victor Kamensky <kamensky@cisco.com>
To: ChenQi <Qi.Chen@windriver.com>
In-Reply-To: <71927521-2b7f-7ca9-e428-7a8a52c44eca@windriver.com>
Message-ID: <alpine.LRH.2.00.1810252234430.5649@sjc-ads-6991.cisco.com>
References: <20181026045303.10592-1-kamensky@cisco.com>
	<71927521-2b7f-7ca9-e428-7a8a52c44eca@windriver.com>
User-Agent: Alpine 2.00 (LRH 1167 2008-08-23)
MIME-Version: 1.0
X-Outbound-SMTP-Client: 10.30.218.111, sjc-ads-6991.cisco.com
X-Outbound-Node: rcdn-core-5.cisco.com
Cc: openembedded-core@lists.openembedded.org
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
X-List-Received-Date: Fri, 26 Oct 2018 07:29:00 -0000
Content-Type: TEXT/PLAIN; format=flowed; charset=US-ASCII

Hi Chen,

On Fri, 26 Oct 2018, ChenQi wrote:

> On 10/26/2018 12:53 PM, Victor Kamensky via Openembedded-core wrote:
>> Otherwise when used in presense of busybox that provides
>> its own version of klogd and syslogd, image packaging
>> complains that klogd exists and it is not syymbolic link.
>> Failure happens only if image packaging script install
>> sysklogd package first followed by installtion of busybox
>> package.
>
> Hi Victor,
>
> I think this problem has been fixed by the following commit.
>
> """
> commit ef11c54ba99af261a70ec31091216cdd1556da24
> Author: Richard Purdie <richard.purdie@linuxfoundation.org>
> Date:   Wed Sep 5 17:39:31 2018 +0100
>
>    busybox: Put klogd/syslogd alternative links in syslog package
>
>    Currently these are in ${PN} and ${PN}-syslog may get replaced by
>    other packages but update-alternatives would error in the postinst
>    if other files were installed first. Avoid the problems by putting
>    the links in the correct package.
>
>    Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> """
>
> For the current status, the update-alternatives operations for syslogd and 
> klogd should be in the busybox-syslog package, which conflicts with sysklogd 
> package.
>
> Could you please help check this?

Thank you! That helps. I see it now. Apprently busybox.bbappend
from meta-selinux layer:

http://git.yoctoproject.org/cgit/cgit.cgi/meta-selinux/tree/recipes-core/busybox/busybox_selinux.inc

is effectively undoing effect of above commit in my workspace.

meta-selinux is doing it because of

http://git.yoctoproject.org/cgit/cgit.cgi/meta-selinux/commit/?id=521ca9c9cf370840e9f8c808a7955aa5da7c356e

It seems changes similar to above Richard's commit needed to
be applied there as well. After applying that to busybox_selinux.inc
in meta-selinux my problem goes away.

No need for proposed below patch.

Thanks,
Victor

> Best Regards,
> Chen Qi
>
>>   If during packaging reverse installtion order
>> happens, busybox first followed by sysklogd, packaging
>> succeed.
>> 
>> Note this fix along with recently committed
>> 55ba9dc1f8 sysklogd: Re-enable alternatives for syslogd.8 man page
>> effectively reverts this commit
>> 988aad01b2 sysklogd: don't use update-alternatives
>> 
>> Signed-off-by: Victor Kamensky <kamensky@cisco.com>
>> ---
>> Hi Guys,
>> 
>> Here is more details. Example of failure that I observe:
>> 
>> update-alternatives: Error: not linking 
>> /home/wd8/oe/20181021/build/tmp-glibc/work/intel_corei7_64-oe-linux/kdevel-console-devel-image/1.0-r0/rootfs/sbin/klogd 
>> to /usr/lib/busybox/sbin/klogd since 
>> /home/wd8/oe/20181021/build/tmp-glibc/work/intel_corei7_64-oe-linux/kdevel-console-devel-image/1.0-r0/rootfs/sbin/klogd 
>> exists and is not a link
>> 
>> Also 988aad01b2 says:
>> 
>>> Using update-alternatives for managing init scripts has proved to be
>>> problematic. And, sysklogd rconflicts with other syslog daemons so there
>>> is no point in using update-alternatives from this perspective, either.
>> I am not sure why "managing init scripts has proved to be problematic" and
>> syslogd and klogd are not really init script per se, aren't they? Also
>> klogd and syslogd actually come from busybox, not busybox-syslog as listed
>> in sysklogd RCONFLICTS. Maybe it what has changed since 988aad01b2.
>> busybox-syslog now contains only init script for syslog and its
>> configuration.
>> 
>> Adding Markus for further comments.
>>
>>   meta/recipes-extended/sysklogd/sysklogd.inc | 5 +++++
>>   1 file changed, 5 insertions(+)
>> 
>> diff --git a/meta/recipes-extended/sysklogd/sysklogd.inc 
>> b/meta/recipes-extended/sysklogd/sysklogd.inc
>> index f151dd87f7..4393a39180 100644
>> --- a/meta/recipes-extended/sysklogd/sysklogd.inc
>> +++ b/meta/recipes-extended/sysklogd/sysklogd.inc
>> @@ -60,9 +60,14 @@ FILES_${PN} += 
>> "${@bb.utils.contains('DISTRO_FEATURES','systemd','${exec_prefix}
>>     ALTERNATIVE_PRIORITY = "100"
>>   +ALTERNATIVE_${PN} = "syslogd klogd"
>> +
>>   ALTERNATIVE_${PN}-doc = "syslogd.8"
>>   ALTERNATIVE_LINK_NAME[syslogd.8] = "${mandir}/man8/syslogd.8"
>>   +ALTERNATIVE_LINK_NAME[syslogd] = "${base_sbindir}/syslogd"
>> +ALTERNATIVE_LINK_NAME[klogd] = "${base_sbindir}/klogd"
>> +
>>   pkg_prerm_${PN} () {
>>   	if test "x$D" = "x"; then
>>   	if test "$1" = "upgrade" -o "$1" = "remove"; then
>
>
>

