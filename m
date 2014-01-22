Return-Path: <ross.burton@intel.com>
Received: from mail-vb0-f47.google.com (mail-vb0-f47.google.com
	[209.85.212.47])
	by mail.openembedded.org (Postfix) with ESMTP id 3785960E7C
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Jan 2014 17:57:12 +0000 (UTC)
Received: by mail-vb0-f47.google.com with SMTP id p6so416837vbe.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Jan 2014 09:57:13 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=mNxtTxpcr5621PsH9K2e8xrZDF5n+CI7R1s+eXNMLSM=;
	b=W/SDPDFQWagjYLm6nDZQy/C2zbb6GKR/XCrVj6jUDY16VA4gGSPwToxps47mz/cDBj
	L78If/9S3b5hGUzywVmhtU00spELpXEFLfonyy5RmOZylZvZtjPoMS9Eg4J7lTT7evO9
	2pkxgtzmF1jIod7vmpjK32NZbCOYiLIyBVS/pb1Z1MMvt3RLhqUWzuE/kD337xgqcUmW
	axu8iP+ii2EdLDlJzt0WOoII5iUm5NUTk4NuSrlnM6k6otMbtVzdW3Ri1iX8oZLhDPVj
	UjWbefo/uo5/Ya4+uvYLWhrhTTrWyigGXlAdIln3ckHK9qOlNzsfjAMXq7qVhZeo2oBR
	3H1Q==
X-Gm-Message-State: ALoCoQlz9sR2BK2nZDoDcrTdf7sWcclKsg3BSTegpU2c+uI2gxbBIZZMcYB6B3Vxqd6E8kEpujbE
X-Received: by 10.58.100.100 with SMTP id ex4mr1817992veb.2.1390413432674;
	Wed, 22 Jan 2014 09:57:12 -0800 (PST)
MIME-Version: 1.0
Received: by 10.220.96.84 with HTTP; Wed, 22 Jan 2014 09:56:52 -0800 (PST)
In-Reply-To: <008701cee4ce$d0b805c0$72281140$@cn.fujitsu.com>
References: <5278C502.1080100@cn.fujitsu.com>
	<008701cee4ce$d0b805c0$72281140$@cn.fujitsu.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 22 Jan 2014 17:56:52 +0000
Message-ID: <CAJTo0LYvzkHrODzpx7CMWM1hEGAjXDEtukvP8aNbCDYHvY7t8Q@mail.gmail.com>
To: Li Zhijian <lizhijian@cn.fujitsu.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2] systemd.bbclass: only restart the service when it is active at systemd_postinst
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
X-List-Received-Date: Wed, 22 Jan 2014 17:57:13 -0000
Content-Type: text/plain; charset=UTF-8

Whoops, this fell out of my inbox.   Whilst the is-active check now
means that the service is restarted on upgrades, if the package is
being installed it's now not started if AUTO_ENABLE is set to true.

I think the logic should be "$D unset and (auto enable or is-active)"

Ross

On 19 November 2013 02:26, Li Zhijian <lizhijian@cn.fujitsu.com> wrote:
> ping...
>
> --
> Best regards.
> Li Zhijian
>
>  |-----Original Message-----
>  |From: openembedded-core-bounces@lists.openembedded.org
>  |[mailto:openembedded-core-bounces@lists.openembedded.org] On Behalf Of
>  |Li Zhijian
>  |Sent: Tuesday, November 05, 2013 6:14 PM
>  |To: Patches and discussions about the oe-core layer
>  |Subject: [OE-core] [PATCH v2] systemd.bbclass: only restart the service
>  |when it is active at systemd_postinst
>  |
>  |From: Li Zhijian <lizhijian@cn.fujitsu.com>
>  |
>  |If systemd_postinst is installed as a delayed package scriptlet (installed
>  |to /etc/rpm-postints/${PN})
>  |which would be executed at the first time of OS startup. And then this
> script
>  |would block when it is
>  |trying to call systemctl to restart service.
>  |
>  |It seems that it is not a good timing to restart service at run-postinsts.
>  |I test serval services which has supported systemd(uuidd/avahi-daemon),
>  |all of them
>  |will block the startup.
>  |
>  |Steps to reproduce:
>  |1) Installed systemd_postinst as a delayed package scriptlet
>  |   i.e. Append Following lines to meta/recipes-core/busybox/busybox.inc
>  |pkg_postinst_${PN}-syslog () {
>  |       if [ "x$D" != "x" ] ; then
>  |               exit 1
>  |       fi
>  |}
>  |2) build a rootfs
>  |$ bitbake core-image-minimal
>  |3) startup this rootfs
>  |
>  |OS would block at /etc/rpm-postinsts/busybox-syslog, like follows
>  |[ ***] A start job is running ro Run pending postinsts
>  |
>  |This patch can fix the block problem, and make the service is consistent
>  |with the original status
>  |
>  |Signed-off-by: Li Zhijian <lizhijian@cn.fujitsu.com>
>  |---
>  | meta/classes/systemd.bbclass |    3 ++-
>  | 1 files changed, 2 insertions(+), 1 deletions(-)
>  |
>  |diff --git a/meta/classes/systemd.bbclass b/meta/classes/systemd.bbclass
>  |index 3700b2e..1feac06 100644
>  |--- a/meta/classes/systemd.bbclass
>  |+++ b/meta/classes/systemd.bbclass
>  |@@ -32,7 +32,8 @@ fi
>  | if type systemctl >/dev/null 2>/dev/null; then
>  |      systemctl $OPTS ${SYSTEMD_AUTO_ENABLE} ${SYSTEMD_SERVICE}
>  | -    if [ -z "$D" -a "${SYSTEMD_AUTO_ENABLE}" = "enable" ]; then
>  |+     if [ -z "$D" ] && systemctl is-active ${SYSTEMD_SERVICE}
>  |&>/dev/null; then
>  |+             # if service is active, restart it
>  |              systemctl restart ${SYSTEMD_SERVICE}
>  |      fi
>  | fi
>  |--
>  |1.7.1
>  |
>  |
>  |
>  |
>  |_______________________________________________
>  |Openembedded-core mailing list
>  |Openembedded-core@lists.openembedded.org
>  |http://lists.openembedded.org/mailman/listinfo/openembedded-core
>
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

