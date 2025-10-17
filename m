Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D9C08CCD195
	for <webhook@archiver.kernel.org>; Fri, 17 Oct 2025 16:18:41 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.web10.20529.1760717910871656310
 for <openembedded-core@lists.openembedded.org>;
 Fri, 17 Oct 2025 09:18:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=KIYbD2Bn;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 25CE81A1483
	for <openembedded-core@lists.openembedded.org>; Fri, 17 Oct 2025 16:18:29 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id EE981606DB;
	Fri, 17 Oct 2025 16:18:28 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 2669A102F2326;
	Fri, 17 Oct 2025 18:18:21 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1760717908; h=from:subject:date:message-id:to:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=xtxEsTNIl2yqpdQklCoSAFiwCDicLHqJ8h9ymDksu/0=;
	b=KIYbD2BnbsXoo/grnRPmXZwM/mhZibpyYpdx6at/YpGKhyjCAdu32MLonJrRkzy1gcylv/
	mkp1EB2nFtOYN8fWh/8yzsljbdqNsN2GyAbV0QmjTRSDn2tPyzHs/2lfFHvA5dWYsIOquB
	jo0Njca7q2p72GxnExlH/t7xyRUBJEPRWzKzIhHSBqfQi58WJYAtqGGic5DBAmvx0md58c
	VxqHoleHekxcjTsj7NH1L5+sJGKvkb0W81g9m32WKJcsgFqae0Gzabcw3faY6suAnA0eGG
	SncvV4EQgvSo/wiXS3dBnCu602GjdG/vkGZGUI0FQIQlK97mYeB8xpNJ0Ogy1w==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 17 Oct 2025 18:18:19 +0200
Message-Id: <DDKQEKP5R8RA.185ZCAGQ6EA07@bootlin.com>
Subject: Re: [OE-core][PATCH V3 2/2] systemd: upgrade from 257.8 to 258
From: "Mathieu Dubois-Briand" <mathieu.dubois-briand@bootlin.com>
To: <Qi.Chen@windriver.com>, <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.19.0-0-gadd9e15e475d
References: <20251016084700.1537381-1-Qi.Chen@windriver.com>
 <20251016084700.1537381-2-Qi.Chen@windriver.com>
In-Reply-To: <20251016084700.1537381-2-Qi.Chen@windriver.com>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 17 Oct 2025 16:18:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/225024

On Thu Oct 16, 2025 at 10:47 AM CEST, Chen Qi via lists.openembedded.org wr=
ote:
> From: Chen Qi <Qi.Chen@windriver.com>
>
> 258 Release Changes:
> https://github.com/systemd/systemd/releases/tag/v258
>
> The 'runlevel', 'initctl', 'telinit' related contents are removed
> because they are offically removed in v258.
>
> Disable tests explicitly. This is because we're not installing any
> tests. There's no point building them out. And this puts extra burden
> on making things compile for musl.
>
> gcrypt and gnutls PACKAGECONFIGs are removed as "OpenSSL is now the only
> supported cryptography backend for systemd-resolved and systemd-importd."
>
> musl changes:
> 1. This version has big changes in musl patches. The goal is to
>    help maintenance. I want patches to be more easily applied
>    to new versions. The count of files modified by musl specific
>    patches decreased from 113 (v257) to 34 (v258).
> 2. All patches are re-evaluated.
>    This version of systemd introduces big changes in header
>    files and other places. So the previous musl patches are
>    re-evaluated one by one. Those that are dropped are considered not
>    needed. A few new ones are added. There are some notable ones.
>    0012-do-not-disable-buffer-in-writing-files.patch is dropped because
>    there is not runtime error.
>    0016-Fix-the-segfault-for-glob-related-codes-and-define-d.patch is
>    added because this version of systemd uses strv_free to free gl_pathv
>    instead of relying on globfree provided by libc.
>
> Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
> ---

Hi Chen,

Thanks for the new version. Still, we get some errors with post install
scripts:

ERROR: core-image-sato-1.0-r0 do_rootfs: Postinstall scriptlets of ['bluez5=
', 'ofono', 'connman', 'xserver-nodm-init', 'avahi-daemon', 'rpcbind', 'run=
-postinsts'] have failed. If the intention is to defer them to first boot,
then please place them into pkg_postinst_ontarget:${PN} ().
Deferring to first boot via 'exit 1' is no longer supported.
Details of the failure are in /srv/pokybuild/yocto-worker/qa-extras2/build/=
build/tmp/work/qemux86_64-poky-linux/core-image-sato/1.0/temp/log.do_rootfs=
.
ERROR: Logfile of failure stored in: /srv/pokybuild/yocto-worker/qa-extras2=
/build/build/tmp/work/qemux86_64-poky-linux/core-image-sato/1.0/temp/log.do=
_rootfs.2882514
NOTE: recipe core-image-sato-1.0-r0: task do_rootfs: Failed
ERROR: Task (/srv/pokybuild/yocto-worker/qa-extras2/build/layers/openembedd=
ed-core/meta/recipes-sato/images/core-image-sato.bb:do_rootfs) failed with =
exit code '1'

https://autobuilder.yoctoproject.org/valkyrie/#/builders/26/builds/2590

Can you have a look at these, please?

Thanks,
Mathieu

--=20
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


