Return-Path: <nora.schiffer@ew.tq-group.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BDB0BC531D0
	for <webhook@archiver.kernel.org>; Mon, 27 Jul 2026 08:03:44 +0000 (UTC)
Received: from www537.your-server.de (www537.your-server.de [188.40.3.216])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.26293.1785139415345255300
 for <openembedded-core@lists.openembedded.org>;
 Mon, 27 Jul 2026 01:03:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ew.tq-group.com header.s=default2602 header.b=NtmGby6z;
 spf=pass (domain: ew.tq-group.com, ip: 188.40.3.216, mailfrom: nora.schiffer@ew.tq-group.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=ew.tq-group.com; s=default2602; h=MIME-Version:Content-Transfer-Encoding:
	Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID;
	bh=hzqljcOECDg3yW6ZQ26cnirf6DWwu6lqpSlMYbE7OOA=; b=NtmGby6zgnl4oMot66xCcEdZcH
	HYuTkxzbuoiDw6SBU1EERqkcTqWCcYtrDeOOr41RLXNMh8BqCtYagzGgR7FI3/qJlVTLc/1LY7tf9
	ZflYaIS5INxrUMSfrE0O5cP5dHj8ATMVW4k/NzK6rvdYJu4aOH8YYohFUBCgHpzigG9Slu0IRe3t0
	ow4GHKJEX9OFXDBbhdeXrWWV88jBehlr9cjE/Xc87bdrMX614WoGgpDWCVfqKFDE/VOSitIiliHNS
	22S8ncqvPMvzpMbq3pFIHYfJYXJVLgRH0gGVGJRnjCIMObgnb0vl3pBOudGSMBXBrqvitXf3dRVfq
	d1/HaVCw==;
Received: from sslproxy08.your-server.de ([78.47.166.52])
	by www537.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96.2)
	(envelope-from <nora.schiffer@ew.tq-group.com>)
	id 1woGJA-000301-1g;
	Mon, 27 Jul 2026 10:03:32 +0200
Received: from localhost ([127.0.0.1])
	by sslproxy08.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <nora.schiffer@ew.tq-group.com>)
	id 1woGJA-00030S-23;
	Mon, 27 Jul 2026 10:03:32 +0200
Message-ID: <69f7557723a0141ed957ffe24aba08cd3065f60f.camel@ew.tq-group.com>
Subject: Re: [OE-core] [PATCH 2/3] kernel-fit-image: reintroduce option to
 replace kernel image
From: Nora Schiffer <nora.schiffer@ew.tq-group.com>
To: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Cc: oss@ew.tq-group.com, openembedded-core@lists.openembedded.org
Date: Mon, 27 Jul 2026 10:03:31 +0200
In-Reply-To: <DK7O7LEQJGUL.2565TJL3V1PLS@bootlin.com>
References: <20260723124944.69070-1-nora.schiffer@ew.tq-group.com>
	 <20260723124944.69070-3-nora.schiffer@ew.tq-group.com>
	 <DK7O7LEQJGUL.2565TJL3V1PLS@bootlin.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.3-0ubuntu1.1 
MIME-Version: 1.0
X-Virus-Scanned: Clear (ClamAV 1.4.3/28074/Mon Jul 27 08:25:14 2026)
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 27 Jul 2026 08:03:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/242059

On Sat, 2026-07-25 at 15:02 +0200, Mathieu Dubois-Briand wrote:
> On Thu Jul 23, 2026 at 2:49 PM CEST, Nora Schiffer via lists.openembedded=
.org wrote:
> > A similar feature was added in commit 9c8ef2119949 ("kernel-fit-image:
> > control kernel section with FIT_LINUX_BIN") and subsequently reverted i=
n
> > commit 6eae261b6f52 ("Revert "kernel-fit-image: control kernel section
> > with FIT_LINUX_BIN"") due to its incomplete implementation and lack of
> > tests. Reintroduce an improved version:
> >=20
> > - The FIT_LINUX_BIN variable (which had been left unused) is renamed to
> >   FIT_KERNEL_FILENAME. It can now actually be used to select a differen=
t
> >   file from DEPLOY_DIR_IMAGE. The file will be compressed using
> >   FIT_KERNEL_COMP_ALG as part of the FIT image recipe, rather than than
> >   letting the kernel recipe handle this through
> >   kernel-fit-extra-artifacts.bbclass.
> > - Alternatively, FIT_KERNEL_FILENAME_COMPRESSED can be used to select a
> >   pre-compressed file from DEPLOY_DIR_IMAGE. In this case,
> >   FIT_KERNEL_COMP_ALG only controls the "compression" field of the
> >   generated FIT image.
> > - To preserve backwards compatibility, FIT_KERNEL_FILENAME_COMPRESSED
> >   defaults to "linux.bin". As a special case, the compression algorithm
> >   will be read from "linux_comp" for linux.bin. This behavior is
> >   considered deprecated and relying on it results in a warning.
> > - Add tests.
> >=20
> > To resolve the new deprecation warning, it is usually sufficient to set
> > KERNEL_IMAGETYPE to the desired type ("Image" on many archs) and set
> > FIT_KERNEL_FILENAME to the same value.
> >=20
> > Signed-off-by: Nora Schiffer <nora.schiffer@ew.tq-group.com>
> > ---
>=20
> Hi Nora,
>=20
> Thanks for your patch.
>=20
> It looks like the test_fit_image_kernel_filename selftest is failing on
> arm hosts:

Hi Mathieu,

I believe I know how to fix this, but it is unclear to me what exact
configuration is built here. Is there any way I can replicate the same
autobuilder configuration, so I can run the tests myself before submitting =
v2?

Best,
Nora



>=20
> 2026-07-24 21:31:27,684 - oe-selftest - INFO - fitimage.KernelFitImageRec=
ipeTests.test_fit_image_kernel_filename (subunit.RemotedTestCase)
> 2026-07-24 21:31:27,685 - oe-selftest - INFO -  ... FAIL
> ...
> ERROR: linux-yocto-fitimage-1.0-r0 do_compile: Error executing a python f=
unction in exec_func_python() autogenerated:
>=20
> The stack trace of python calls that resulted in this exception/failure w=
as:
> File: 'exec_func_python() autogenerated', lineno: 2, function: <module>
>      0001:
>  *** 0002:do_compile(d)
>      0003:
> File: '/srv/pokybuild/yocto-worker/oe-selftest-armhost/build/layers/opene=
mbedded-core/meta/classes-recipe/kernel-fit-image.bbclass', lineno: 129, fu=
nction: do_compile
>      0125:
>      0126:    elif kernel_compressed:
>      0127:        kernel_path =3D os.path.join(kernel_deploydir, kernel_c=
ompressed)
>      0128:        kernel_name =3D os.path.basename(kernel_compressed)
>  *** 0129:        shutil.copyfile(kernel_path, kernel_name)
>      0130:
>      0131:    # FIT_KERNEL_FILENAME or FIT_KERNEL_FILENAME_COMPRESSED was=
 set
>      0132:    if kernel_name:
>      0133:        root_node.fitimage_emit_section_kernel("kernel-1", kern=
el_name, kernel_comp_alg,
> File: '/usr/lib/python3.14/shutil.py', lineno: 313, function: copyfile
>      0309:
>      0310:    if not follow_symlinks and _islink(src):
>      0311:        os.symlink(os.readlink(src), dst)
>      0312:    else:
>  *** 0313:        with open(src, 'rb') as fsrc:
>      0314:            try:
>      0315:                with open(dst, 'wb') as fdst:
>      0316:                    # macOS
>      0317:                    if _HAS_FCOPYFILE:
> Exception: FileNotFoundError: [Errno 2] No such file or directory: '/srv/=
pokybuild/yocto-worker/oe-selftest-armhost/build/build-st-1142023/tmp/deplo=
y/images/qemuarm64/bzImage'
>=20
> https://autobuilder.yoctoproject.org/valkyrie/#/builders/23/builds/4420
>=20
> Can you have a look at the issue?
>=20
> Thanks,
> Mathieu
>=20

--=20
TQ-Systems GmbH | M=C3=BChlstra=C3=9Fe 2, Gut Delling | 82229 Seefeld, Germ=
any
Amtsgericht M=C3=BCnchen, HRB 105018
Gesch=C3=A4ftsf=C3=BChrer: Detlef Schneider, R=C3=BCdiger Stahl, Stefan Sch=
neider
https://www.tq-group.com/

