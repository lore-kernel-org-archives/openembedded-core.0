Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A96E2CCF9F8
	for <webhook@archiver.kernel.org>; Fri,  7 Nov 2025 11:51:40 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.9482.1762516291599354005
 for <openembedded-core@lists.openembedded.org>;
 Fri, 07 Nov 2025 03:51:32 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=plgun4JJ;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id E16004E41595
	for <openembedded-core@lists.openembedded.org>; Fri,  7 Nov 2025 11:51:29 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id A878F606A6;
	Fri,  7 Nov 2025 11:51:29 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 2321611852424;
	Fri,  7 Nov 2025 12:51:27 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1762516289; h=from:subject:date:message-id:to:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=aLO3D6Cq649NXU/DAxj2xvk8VZmIpUWU2fMWZlZH5tU=;
	b=plgun4JJUJmBOXbaoGCrLQYMKwv8XiQUqX5qj/6Maram5Ce1pOGNfT25uI0+t/18FIc1Dy
	f0adG43NhfR3fejVMYjZ57+6UiosA/qoHPktgJLPTXXoasFkQRSaKkrsoitLeBNyIRUSL7
	MI/bCXwb4GtwHy8xNW5iST/gDiUUdUcD7mGZWs7uweVBe2zLDjait69hngnRWPMmsbivgX
	bJedQyqF5OXlIi4ezb3+rc9dEMLp+fVImmvKeRs7ZWEh/Lb23A2P830GqR0hwKe/kJbEk/
	y94TkG5p+ZxHe696NOs2uoYLLZdlWjqlB4um46hF+ZiCeXF55txTP9QbX1d2qw==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 07 Nov 2025 12:51:27 +0100
Message-Id: <DE2FVODBMUDF.2XW0SJDUUG1HA@bootlin.com>
Subject: Re: [OE-core] [PATCH 06/29] dnf: upgrade 4.23.0 -> 4.24.0
From: "Mathieu Dubois-Briand" <mathieu.dubois-briand@bootlin.com>
To: <wangmy@fujitsu.com>, <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.19.0-0-gadd9e15e475d
References: <20251105234712.446-1-wangmy@fujitsu.com>
 <20251105234712.446-6-wangmy@fujitsu.com>
In-Reply-To: <20251105234712.446-6-wangmy@fujitsu.com>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 07 Nov 2025 11:51:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/226035

On Thu Nov 6, 2025 at 12:46 AM CET, wangmy via lists.openembedded.org wrote=
:
> From: Wang Mingyu <wangmy@fujitsu.com>
>
> 0001-Do-not-hardcode-etc-and-systemd-unit-directories.patch
> refreshed for 4.24.0
>
> Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
> ---

Hi Wang,

Thanks for the update.

It look likes this is breaking dnf while generating images:

ERROR: core-image-minimal-1.0-r0 do_rootfs: Could not invoke dnf. Command '=
/srv/pokybuild/yocto-worker/genericx86-64/build/build/tmp/work/genericx86_6=
4-poky-linux/core-image-minimal/1.0/recipe-sysroot-native/usr/bin/dnf -v --=
rpmverbosity=3Dinfo -y -c /srv/pokybuild/yocto-worker/genericx86-64/build/b=
uild/tmp/work/genericx86_64-poky-linux/core-image-minimal/1.0/rootfs/etc/dn=
f/dnf.conf --setopt=3Dreposdir=3D/srv/pokybuild/yocto-worker/genericx86-64/=
build/build/tmp/work/genericx86_64-poky-linux/core-image-minimal/1.0/rootfs=
/etc/yum.repos.d --installroot=3D/srv/pokybuild/yocto-worker/genericx86-64/=
build/build/tmp/work/genericx86_64-poky-linux/core-image-minimal/1.0/rootfs=
 --setopt=3Dlogdir=3D/srv/pokybuild/yocto-worker/genericx86-64/build/build/=
tmp/work/genericx86_64-poky-linux/core-image-minimal/1.0/temp --repofrompat=
h=3Doe-repo,/srv/pokybuild/yocto-worker/genericx86-64/build/build/tmp/work/=
genericx86_64-poky-linux/core-image-minimal/1.0/oe-rootfs-repo makecache --=
refresh' returned 1:
Traceback (most recent call last):
  File "/srv/pokybuild/yocto-worker/genericx86-64/build/build/tmp/work/gene=
ricx86_64-poky-linux/core-image-minimal/1.0/recipe-sysroot-native/usr/bin/d=
nf.real", line 56, in <module>
    from dnf.cli import main
  File "/srv/pokybuild/yocto-worker/genericx86-64/build/build/tmp/work/gene=
ricx86_64-poky-linux/core-image-minimal/1.0/recipe-sysroot-native/usr/lib/p=
ython3.13/site-packages/dnf/__init__.py", line 30, in <module>
    import dnf.base
  File "/srv/pokybuild/yocto-worker/genericx86-64/build/build/tmp/work/gene=
ricx86_64-poky-linux/core-image-minimal/1.0/recipe-sysroot-native/usr/lib/p=
ython3.13/site-packages/dnf/base.py", line 35, in <module>
    from dnf.db.history import SwdbInterface
  File "/srv/pokybuild/yocto-worker/genericx86-64/build/build/tmp/work/gene=
ricx86_64-poky-linux/core-image-minimal/1.0/recipe-sysroot-native/usr/lib/p=
ython3.13/site-packages/dnf/db/history.py", line 287, in <module>
    class SwdbInterface(object):
    ...<243 lines>...
            return result
  File "/srv/pokybuild/yocto-worker/genericx86-64/build/build/tmp/work/gene=
ricx86_64-poky-linux/core-image-minimal/1.0/recipe-sysroot-native/usr/lib/p=
ython3.13/site-packages/dnf/db/history.py", line 430, in SwdbInterface
    persistence=3Dlibdnf.transaction.TransactionPersistence_UNKNOWN):
                ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
AttributeError: module 'libdnf.transaction' has no attribute 'TransactionPe=
rsistence_UNKNOWN'. Did you mean: 'TransactionItemState_UNKNOWN'?


https://autobuilder.yoctoproject.org/valkyrie/#/builders/4/builds/2699
https://autobuilder.yoctoproject.org/valkyrie/#/builders/3/builds/2745

Can you have a look at this error?

Thanks,
Mathieu

--=20
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


