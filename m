Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 716FBC531C9
	for <webhook@archiver.kernel.org>; Sat, 25 Jul 2026 13:02:32 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.39301.1784984546184712534
 for <openembedded-core@lists.openembedded.org>;
 Sat, 25 Jul 2026 06:02:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=trSqS/ru;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id BEEED1A1223
	for <openembedded-core@lists.openembedded.org>; Sat, 25 Jul 2026 13:02:23 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 8501C60398;
	Sat, 25 Jul 2026 13:02:23 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 6429211C1017B;
	Sat, 25 Jul 2026 15:02:21 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1784984542; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=OpfbppdY8K1HM3AyYWSqiSy8B6mb2GBvC3qVY8VoR5M=;
	b=trSqS/rukGR0qQ2zCEv+SZMAA2MzWMf3GVR0of6oZlVwGU3G0+QrSOolrJWnUQyYuwFCyE
	54MvcNCMF2BZU5WDPES8pRRBY3gbUZ0FlFOS6e/KYqwP2aLPbufRPbIagF7p3LOMlSaCGe
	8v20yfWoXWXSkAZFifhYj/lwWMOKosn6Sok+1DJAbkqo4dnG/Po2UiiXsoqtNeamr2ccoG
	YOQNTGtZTeuUj5eJ3U2J4Yv/zC9lLbQHA2Px2I5J3/p1a1mxKg8nIc4/NV8IpwHNpu/P0q
	6a40QO+E7LxGXlbNMSK/TYMo9Z3d8lXdWBHWd3onWPWnKN1esYf2U98TKl6XFw==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sat, 25 Jul 2026 15:02:20 +0200
Message-Id: <DK7O7LEQJGUL.2565TJL3V1PLS@bootlin.com>
Subject: Re: [OE-core] [PATCH 2/3] kernel-fit-image: reintroduce option to
 replace kernel image
Cc: <oss@ew.tq-group.com>
From: "Mathieu Dubois-Briand" <mathieu.dubois-briand@bootlin.com>
To: <nora.schiffer@ew.tq-group.com>,
 <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260723124944.69070-1-nora.schiffer@ew.tq-group.com>
 <20260723124944.69070-3-nora.schiffer@ew.tq-group.com>
In-Reply-To: <20260723124944.69070-3-nora.schiffer@ew.tq-group.com>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 25 Jul 2026 13:02:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/241970

On Thu Jul 23, 2026 at 2:49 PM CEST, Nora Schiffer via lists.openembedded.o=
rg wrote:
> A similar feature was added in commit 9c8ef2119949 ("kernel-fit-image:
> control kernel section with FIT_LINUX_BIN") and subsequently reverted in
> commit 6eae261b6f52 ("Revert "kernel-fit-image: control kernel section
> with FIT_LINUX_BIN"") due to its incomplete implementation and lack of
> tests. Reintroduce an improved version:
>
> - The FIT_LINUX_BIN variable (which had been left unused) is renamed to
>   FIT_KERNEL_FILENAME. It can now actually be used to select a different
>   file from DEPLOY_DIR_IMAGE. The file will be compressed using
>   FIT_KERNEL_COMP_ALG as part of the FIT image recipe, rather than than
>   letting the kernel recipe handle this through
>   kernel-fit-extra-artifacts.bbclass.
> - Alternatively, FIT_KERNEL_FILENAME_COMPRESSED can be used to select a
>   pre-compressed file from DEPLOY_DIR_IMAGE. In this case,
>   FIT_KERNEL_COMP_ALG only controls the "compression" field of the
>   generated FIT image.
> - To preserve backwards compatibility, FIT_KERNEL_FILENAME_COMPRESSED
>   defaults to "linux.bin". As a special case, the compression algorithm
>   will be read from "linux_comp" for linux.bin. This behavior is
>   considered deprecated and relying on it results in a warning.
> - Add tests.
>
> To resolve the new deprecation warning, it is usually sufficient to set
> KERNEL_IMAGETYPE to the desired type ("Image" on many archs) and set
> FIT_KERNEL_FILENAME to the same value.
>
> Signed-off-by: Nora Schiffer <nora.schiffer@ew.tq-group.com>
> ---

Hi Nora,

Thanks for your patch.

It looks like the test_fit_image_kernel_filename selftest is failing on
arm hosts:

2026-07-24 21:31:27,684 - oe-selftest - INFO - fitimage.KernelFitImageRecip=
eTests.test_fit_image_kernel_filename (subunit.RemotedTestCase)
2026-07-24 21:31:27,685 - oe-selftest - INFO -  ... FAIL
...
ERROR: linux-yocto-fitimage-1.0-r0 do_compile: Error executing a python fun=
ction in exec_func_python() autogenerated:

The stack trace of python calls that resulted in this exception/failure was=
:
File: 'exec_func_python() autogenerated', lineno: 2, function: <module>
     0001:
 *** 0002:do_compile(d)
     0003:
File: '/srv/pokybuild/yocto-worker/oe-selftest-armhost/build/layers/openemb=
edded-core/meta/classes-recipe/kernel-fit-image.bbclass', lineno: 129, func=
tion: do_compile
     0125:
     0126:    elif kernel_compressed:
     0127:        kernel_path =3D os.path.join(kernel_deploydir, kernel_com=
pressed)
     0128:        kernel_name =3D os.path.basename(kernel_compressed)
 *** 0129:        shutil.copyfile(kernel_path, kernel_name)
     0130:
     0131:    # FIT_KERNEL_FILENAME or FIT_KERNEL_FILENAME_COMPRESSED was s=
et
     0132:    if kernel_name:
     0133:        root_node.fitimage_emit_section_kernel("kernel-1", kernel=
_name, kernel_comp_alg,
File: '/usr/lib/python3.14/shutil.py', lineno: 313, function: copyfile
     0309:
     0310:    if not follow_symlinks and _islink(src):
     0311:        os.symlink(os.readlink(src), dst)
     0312:    else:
 *** 0313:        with open(src, 'rb') as fsrc:
     0314:            try:
     0315:                with open(dst, 'wb') as fdst:
     0316:                    # macOS
     0317:                    if _HAS_FCOPYFILE:
Exception: FileNotFoundError: [Errno 2] No such file or directory: '/srv/po=
kybuild/yocto-worker/oe-selftest-armhost/build/build-st-1142023/tmp/deploy/=
images/qemuarm64/bzImage'

https://autobuilder.yoctoproject.org/valkyrie/#/builders/23/builds/4420

Can you have a look at the issue?

Thanks,
Mathieu

--=20
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


