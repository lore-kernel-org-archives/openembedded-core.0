Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 056CCC5DF71
	for <webhook@archiver.kernel.org>; Tue,  2 Jun 2026 09:01:10 +0000 (UTC)
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.20696.1780390865436331135
 for <openembedded-core@lists.openembedded.org>;
 Tue, 02 Jun 2026 02:01:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=VFPZHL6e;
 spf=pass (domain: bootlin.com, ip: 185.171.202.116, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 498D5C6247E
	for <openembedded-core@lists.openembedded.org>; Tue,  2 Jun 2026 09:01:05 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id DEFE9603BC;
	Tue,  2 Jun 2026 09:01:02 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id C9D801088817C;
	Tue,  2 Jun 2026 11:01:01 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1780390862; h=from:subject:date:message-id:to:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=USTldiNqw/vIG8NLEfMNyF0V8V40CuaRulwzG8UbaNM=;
	b=VFPZHL6eIFqHqd/g3EQBgF3PzYl8JvPdCY5VQHS3gHGha3U1J2DXJIxDpqOrROStBFCFxP
	31JP8FdxbCywIIi/eYehcnqE2ycUEZoTyJaMh0fDzbgnhw2KCq0kF+XRIOEEIRxhjOmDnk
	MBsFTo5WlKjGrUwwojP3U2AXGoIzuCFFzFr4zHsx3rqwSxaXEWhpecgG5MkRaQvHOUACy5
	FUbZJBqKXxqQ9wZ5rXXHMK7rk2MFCtvlsX0NGnZIUwY6xLW7cG+RNcUmjJXhjJiBfLyrJG
	r11XUZqLhQ/tTqPZ7nAwN9Vu+uXWh0drn8Ihz2R2UzHra58DM766G8XYH5iGHA==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 02 Jun 2026 11:01:01 +0200
Message-Id: <DIYFVYFWGIGJ.1GE117T1IOCR9@bootlin.com>
Subject: Re: [OE-core] [PATCH v2] qemuboot.bbclass: add missing task
 dependency on kernel deploy
From: "Mathieu Dubois-Briand" <mathieu.dubois-briand@bootlin.com>
To: <sivakumar.bs@gmail.com>, <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260601165912.533636-1-sivakumar.bs@gmail.com>
In-Reply-To: <20260601165912.533636-1-sivakumar.bs@gmail.com>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 02 Jun 2026 09:01:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/238020

On Mon Jun 1, 2026 at 6:59 PM CEST, Siva Balasubramanian via lists.openembe=
dded.org wrote:
> do_write_qemuboot_conf had no dependency on the kernel deploy task,
> so if the kernel was rebuilt without invalidating the rootfs sstate,
> the task was skipped and .qemuboot.conf was left stale while new
> image artifacts were deployed with a new timestamp suffix.
>
> Add do_write_qemuboot_conf[depends] on KERNEL_DEPLOY_DEPEND, which
> is the same variable used by do_build[depends] in image.bbclass for
> the same reason. Since KERNEL_DEPLOY_DEPEND is defined with ?=3D it
> correctly handles firmware and baremetal images that override it to
> their own deploy target.
>
> Fixes: https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D14520
> Signed-off-by: Siva Balasubramanian <sivakumar.bs@gmail.com>
> ---
>  meta/classes-recipe/qemuboot.bbclass | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/meta/classes-recipe/qemuboot.bbclass b/meta/classes-recipe/q=
emuboot.bbclass
> index 56106b1958..db971d50bd 100644
> --- a/meta/classes-recipe/qemuboot.bbclass
> +++ b/meta/classes-recipe/qemuboot.bbclass
> @@ -128,6 +128,7 @@ inherit image-artifact-names
> =20
>  # Create qemuboot.conf
>  addtask do_write_qemuboot_conf after do_rootfs before do_image
> +do_write_qemuboot_conf[depends] +=3D "${KERNEL_DEPLOY_DEPEND}"
> =20
>  def qemuboot_vars(d):
>      build_vars =3D ['MACHINE', 'TUNE_ARCH', 'DEPLOY_DIR_IMAGE',

So I struggle to understand why, but it looks lie this patch is
responsible of this error on the autobuilder:

Parsing recipes...ERROR: Unable to parse /srv/pokybuild/yocto-worker/a-full=
/build/layers/openembedded-core/meta/recipes-extended/baremetal-example/bar=
emetal-helloworld_git.bb
Traceback (most recent call last):
  File "/srv/pokybuild/yocto-worker/a-full/build/layers/bitbake/lib/bb/cook=
er.py", line 2334, in parse_next
    raise result
ValueError: not enough values to unpack (expected 2, got 1)

ERROR: Parsing halted due to errors, see error messages above

https://autobuilder.yoctoproject.org/valkyrie/#/builders/29/builds/3909

Any clue about what might be wrong is welcome.

Thanks,
Mathieu

--=20
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


