Return-Path: <alexandre.belloni@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 08007C83F2E
	for <webhook@archiver.kernel.org>; Thu, 31 Aug 2023 16:03:39 +0000 (UTC)
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net [217.70.183.197])
 by mx.groups.io with SMTP id smtpd.web10.1718.1693497811643928055
 for <openembedded-core@lists.openembedded.org>;
 Thu, 31 Aug 2023 09:03:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=F70o1oYB;
 spf=pass (domain: bootlin.com, ip: 217.70.183.197, mailfrom: alexandre.belloni@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 7DE431C0003;
	Thu, 31 Aug 2023 16:03:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1693497808;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=HbGztEr6l1gvNNzJbFCZx/C5RmTeDg6/9csnGiHn3QY=;
	b=F70o1oYBhnwe0peFMuv6p7XBxmxKqquWkXeGlL+zO7GhCMvxEjpqOomUPXoyyrPo7D+2Ox
	TqyoQI3ooMda/u9dq0Kjr53u4gTN6x1uuFAa3mh+hzdo8RfTrk4BtGh6hwNwHEKnUjPfip
	CMtFomgZmRyu6OOHec+JqLz13YoQ0eOj9P76UtKFZ4lgCsErIpof+c+xT8av80ssGya9kd
	OK5gDSVSrdrYLgxe/TsEQ1zg0NN2erUnQIiaCLYAOvCTL5STgEoUIgL/8fyfeqBVg8Rvi4
	6qy/bdUl81mQAWA95NILvnR26+bHHKYo3q3vDU2H64S+sdleT6LQUZkIYXn6iQ==
Date: Thu, 31 Aug 2023 18:03:28 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: wangmy <wangmy@fujitsu.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [PATCH] createrepo-c: upgrade 0.21.1 -> 1.0.0
Message-ID: <20230831160328ad6b371b@mail.local>
References: <1693448992-27476-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1693448992-27476-1-git-send-email-wangmy@fujitsu.com>
X-GND-Sasl: alexandre.belloni@bootlin.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 31 Aug 2023 16:03:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/186979

Hello,

On 31/08/2023 10:29:52+0800, wangmy wrote:
> From: Wang Mingyu <wangmy@fujitsu.com>
> 
> 0001-src-cmd_parser.c-add-a-missing-parameter-name.patch
> removed since it's included in 1.0.0
> 
> Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>

This causes failures on the AB:

https://autobuilder.yoctoproject.org/typhoon/#/builders/15/builds/8000/steps/12/logs/stdio

ERROR: core-image-minimal-1.0-r0 do_rootfs: Could not invoke dnf. Command '/home/pokybuild/yocto-worker/poky-tiny/build/build/tmp/work/qemux86-poky-linux-musl/core-image-minimal/1.0/recipe-sysroot-native/usr/bin/dnf -v --rpmverbosity=info -y -c /home/pokybuild/yocto-worker/poky-tiny/build/build/tmp/work/qemux86-poky-linux-musl/core-image-minimal/1.0/rootfs/etc/dnf/dnf.conf --setopt=reposdir=/home/pokybuild/yocto-worker/poky-tiny/build/build/tmp/work/qemux86-poky-linux-musl/core-image-minimal/1.0/rootfs/etc/yum.repos.d --installroot=/home/pokybuild/yocto-worker/poky-tiny/build/build/tmp/work/qemux86-poky-linux-musl/core-image-minimal/1.0/rootfs --setopt=logdir=/home/pokybuild/yocto-worker/poky-tiny/build/build/tmp/work/qemux86-poky-linux-musl/core-image-minimal/1.0/temp --repofrompath=oe-repo,/home/pokybuild/yocto-worker/poky-tiny/build/build/tmp/work/qemux86-poky-linux-musl/core-image-minimal/1.0/oe-rootfs-repo makecache --refresh' returned 1:
DNF version: 4.16.1
cachedir: /home/pokybuild/yocto-worker/poky-tiny/build/build/tmp/work/qemux86-poky-linux-musl/core-image-minimal/1.0/rootfs/var/cache/dnf
Added oe-repo repo from /home/pokybuild/yocto-worker/poky-tiny/build/build/tmp/work/qemux86-poky-linux-musl/core-image-minimal/1.0/oe-rootfs-repo
Making cache files for all metadata files.
oe-repo: has expired and will be refreshed.
repo: downloading from remote: oe-repo
oe-repo                                         101 MB/s | 281 kB     00:00    
loading repo 'oe-repo' failure: Opening repository primary data has failed: No such file or directory
Error: Loading repository 'oe-repo' has failed

> ---
>  ...arser.c-add-a-missing-parameter-name.patch | 39 -------------------
>  ...repo-c_0.21.1.bb => createrepo-c_1.0.0.bb} |  3 +-
>  2 files changed, 1 insertion(+), 41 deletions(-)
>  delete mode 100644 meta/recipes-devtools/createrepo-c/createrepo-c/0001-src-cmd_parser.c-add-a-missing-parameter-name.patch
>  rename meta/recipes-devtools/createrepo-c/{createrepo-c_0.21.1.bb => createrepo-c_1.0.0.bb} (92%)
> 
> diff --git a/meta/recipes-devtools/createrepo-c/createrepo-c/0001-src-cmd_parser.c-add-a-missing-parameter-name.patch b/meta/recipes-devtools/createrepo-c/createrepo-c/0001-src-cmd_parser.c-add-a-missing-parameter-name.patch
> deleted file mode 100644
> index 0d1c6b08fb..0000000000
> --- a/meta/recipes-devtools/createrepo-c/createrepo-c/0001-src-cmd_parser.c-add-a-missing-parameter-name.patch
> +++ /dev/null
> @@ -1,39 +0,0 @@
> -From 970b901e1999f415da8bac205f526c808ddad0ba Mon Sep 17 00:00:00 2001
> -From: Alexander Kanavin <alex@linutronix.de>
> -Date: Mon, 8 May 2023 10:40:43 +0200
> -Subject: [PATCH] src/cmd_parser.c: add a missing parameter name
> -MIME-Version: 1.0
> -Content-Type: text/plain; charset=UTF-8
> -Content-Transfer-Encoding: 8bit
> -
> -This resolves the following error with older versions of gcc:
> -| /srv/storage/alex/yocto/build-32/tmp/work/x86_64-linux/createrepo-c-native/0.21.1-r0/git/src/cmd_parser.c: In function ‘duplicated_nevra_option_parser’:
> -| /srv/storage/alex/yocto/build-32/tmp/work/x86_64-linux/createrepo-c-native/0.21.1-r0/git/src/cmd_parser.c:76:32: error: parameter name omitted
> -|    76 | duplicated_nevra_option_parser(const gchar *,
> -|       |                                ^~~~~~~~~~~~~
> -| /srv/storage/alex/yocto/build-32/tmp/work/x86_64-linux/createrepo-c-native/0.21.1-r0/git/src/cmd_parser.c:78:32: error: parameter name omitted
> -|    78 |                                gpointer,
> -|       |                                ^~~~~~~~
> -
> -Upstream-Status: Submitted [https://github.com/rpm-software-management/createrepo_c/pull/366]
> -Signed-off-by: Alexander Kanavin <alex@linutronix.de>
> ----
> - src/cmd_parser.c | 4 ++--
> - 1 file changed, 2 insertions(+), 2 deletions(-)
> -
> -diff --git a/src/cmd_parser.c b/src/cmd_parser.c
> -index 97c9ea7..63af7ea 100644
> ---- a/src/cmd_parser.c
> -+++ b/src/cmd_parser.c
> -@@ -73,9 +73,9 @@ struct CmdOptions _cmd_options = {
> - 
> - 
> - gboolean
> --duplicated_nevra_option_parser(const gchar *,
> -+duplicated_nevra_option_parser(const gchar *option_name,
> -                                const gchar *value,
> --                               gpointer,
> -+                               gpointer data,
> -                                GError **error)
> - {
> -     if (!g_strcmp0(value, "keep"))
> diff --git a/meta/recipes-devtools/createrepo-c/createrepo-c_0.21.1.bb b/meta/recipes-devtools/createrepo-c/createrepo-c_1.0.0.bb
> similarity index 92%
> rename from meta/recipes-devtools/createrepo-c/createrepo-c_0.21.1.bb
> rename to meta/recipes-devtools/createrepo-c/createrepo-c_1.0.0.bb
> index 57f23b8dfd..9b109327c8 100644
> --- a/meta/recipes-devtools/createrepo-c/createrepo-c_0.21.1.bb
> +++ b/meta/recipes-devtools/createrepo-c/createrepo-c_1.0.0.bb
> @@ -7,11 +7,10 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
>  SRC_URI = "git://github.com/rpm-software-management/createrepo_c;branch=master;protocol=https \
>             file://0001-Do-not-set-PYTHON_INSTALL_DIR-by-running-python.patch \
>             file://0001-include-rpm-rpmstring.h.patch \
> -           file://0001-src-cmd_parser.c-add-a-missing-parameter-name.patch \
>             file://time64fix.patch \
>             "
>  
> -SRCREV = "0652d7303ce236e596c83c29ccc9bee7868fce6e"
> +SRCREV = "0cc13920991b2fb8f87fb9d352bd3394c2983289"
>  
>  S = "${WORKDIR}/git"
>  
> -- 
> 2.34.1
> 

> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#186929): https://lists.openembedded.org/g/openembedded-core/message/186929
> Mute This Topic: https://lists.openembedded.org/mt/101066825/3617179
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alexandre.belloni@bootlin.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

