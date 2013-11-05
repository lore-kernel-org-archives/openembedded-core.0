Return-Path: <lizhijian@cn.fujitsu.com>
Received: from song.cn.fujitsu.com (unknown [222.73.24.84])
	by mail.openembedded.org (Postfix) with ESMTP id B4ED66D12A
	for <openembedded-core@lists.openembedded.org>;
	Tue,  5 Nov 2013 10:11:46 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="4.93,638,1378828800"; 
   d="scan'208";a="8951811"
Received: from unknown (HELO tang.cn.fujitsu.com) ([10.167.250.3])
	by song.cn.fujitsu.com with ESMTP; 05 Nov 2013 18:08:21 +0800
Received: from fnstmail02.fnst.cn.fujitsu.com (tang.cn.fujitsu.com [127.0.0.1])
	by tang.cn.fujitsu.com (8.14.3/8.13.1) with ESMTP id rA5ABhZX015409
	for <openembedded-core@lists.openembedded.org>;
	Tue, 5 Nov 2013 18:11:43 +0800
Received: from [127.0.0.1] ([10.167.226.56])
	by fnstmail02.fnst.cn.fujitsu.com (Lotus Domino Release 8.5.3)
	with ESMTP id 2013110518095219-2776552 ;
	Tue, 5 Nov 2013 18:09:52 +0800 
Message-ID: <5278C460.3090204@cn.fujitsu.com>
Date: Tue, 05 Nov 2013 18:11:44 +0800
From: Li Zhijian <lizhijian@cn.fujitsu.com>
Organization: fnst-ulinux
User-Agent: Mozilla/5.0 (Windows NT 6.1;
	rv:24.0) Gecko/20100101 Thunderbird/24.1.0
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <5277790C.1060208@cn.fujitsu.com>
In-Reply-To: <5277790C.1060208@cn.fujitsu.com>
X-MIMETrack: Itemize by SMTP Server on mailserver/fnst(Release 8.5.3|September
	15, 2011) at 2013/11/05 18:09:52,
	Serialize by Router on mailserver/fnst(Release 8.5.3|September 15,
	2011) at 2013/11/05 18:09:52,
	Serialize complete at 2013/11/05 18:09:52
Subject: Re: [PATCH 1/1] systemd.bbclass: only restart the service when it is running at systemd_postinst
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
X-List-Received-Date: Tue, 05 Nov 2013 10:11:51 -0000
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset=ISO-8859-1; format=flowed

This patch is incorrect, please ignore it

i would send v2 soon.


at 2013/11/4 18:38, Li Zhijian wrote:
> From: Li Zhijian <lizhijian@cn.fujitsu.com>
>
> If systemd_postinst is installed as a delayed package scriptlet (installed to /etc/rpm-postints/${PN})
> which would be executed at the first time of OS startup. And then this script would block when it is
> trying to call systemctl to restart service.
>
> It seems that it is not a good timing to restart service at run-postinsts.
> I test serval services which has supported systemd(uuidd/avahi-daemon), all of them
> will block the startup.
>
> Steps to reproduce:
> 1) Installed systemd_postinst as a delayed package scriptlet
>     i.e. Append Following lines to meta/recipes-core/busybox/busybox.inc
> pkg_postinst_${PN}-syslog () {
>         if [ "x$D" != "x" ] ; then
>                 exit 1
>         fi
> }
> 2) build a rootfs
> # bitbake core-image-minimal
> 3) startup this rootfs
>
> OS would block at /etc/rpm-postinsts/busybox-syslog, like follows
> [ ***] A start job is running ro Run pending postinsts
>
> This patch can fix the block problem, and make the service is consistent with the original status
>
> Signed-off-by: Li Zhijian <lizhijian@cn.fujitsu.com>
> ---
>   meta/classes/systemd.bbclass |    3 ++-
>   1 files changed, 2 insertions(+), 1 deletions(-)
>
> diff --git a/meta/classes/systemd.bbclass b/meta/classes/systemd.bbclass
> index 8084251..9fef667 100644
> --- a/meta/classes/systemd.bbclass
> +++ b/meta/classes/systemd.bbclass
> @@ -30,7 +30,8 @@ fi
>   if type systemctl >/dev/null 2>/dev/null; then
>   	systemctl $OPTS ${SYSTEMD_AUTO_ENABLE} ${SYSTEMD_SERVICE}
>   -	if [ -z "$D" -a "${SYSTEMD_AUTO_ENABLE}" = "enable" ]; then
> +	if [ -z "$D" ] && [ systemctl status ${SYSTEMD_SERVICE} &>/dev/null ]; then
Should be:

if [ -z "$D" ] && systemctl status ${SYSTEMD_SERVICE} &>/dev/null; then

-- 
Best regards.
Li Zhijian

> +		# if service is running, restart it
>   		systemctl restart ${SYSTEMD_SERVICE}
>   	fi
>   fi


-- 
Best regards.
Li Zhijian (8555)



