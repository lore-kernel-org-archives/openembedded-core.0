Return-Path: <u.oelmann@pengutronix.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E7AB0C433EF
	for <webhook@archiver.kernel.org>; Fri, 11 Feb 2022 16:21:14 +0000 (UTC)
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [85.220.165.71])
 by mx.groups.io with SMTP id smtpd.web09.9478.1644596473249248594
 for <openembedded-core@lists.openembedded.org>;
 Fri, 11 Feb 2022 08:21:14 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: pengutronix.de, ip: 85.220.165.71, mailfrom: u.oelmann@pengutronix.de)
Received: from dude.hi.pengutronix.de ([2001:67c:670:100:1d::7])
	by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <u.oelmann@pengutronix.de>)
	id 1nIYfV-0002F0-GQ; Fri, 11 Feb 2022 17:21:09 +0100
Received: from uol by dude.hi.pengutronix.de with local (Exim 4.94.2)
	(envelope-from <u.oelmann@pengutronix.de>)
	id 1nIYfT-00CsYO-TB; Fri, 11 Feb 2022 17:21:07 +0100
References: 
 <20220210161738.17989-1-stefan.herbrechtsmeier-oss@weidmueller.com>
 <20220210161738.17989-2-stefan.herbrechtsmeier-oss@weidmueller.com>
User-agent: mu4e 1.6.9; emacs 29.0.50
From: Ulrich =?utf-8?Q?=C3=96lmann?= <u.oelmann@pengutronix.de>
To: Stefan Herbrechtsmeier <stefan.herbrechtsmeier-oss@weidmueller.com>
Cc: Stefan Herbrechtsmeier <stefan.herbrechtsmeier@weidmueller.com>,
 openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [PATCH 2/4] wic: rawcopy: Add support for packed images
Date: Fri, 11 Feb 2022 17:17:33 +0100
In-reply-to: 
 <20220210161738.17989-2-stefan.herbrechtsmeier-oss@weidmueller.com>
Message-ID: <6r7da11ij0.fsf@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::7
X-SA-Exim-Mail-From: u.oelmann@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: openembedded-core@lists.openembedded.org
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 11 Feb 2022 16:21:14 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/161657

Hi Stefan!

On Thu, Feb 10 2022 at 17:17 +0100, "Stefan Herbrechtsmeier" <stefan.herbre=
chtsmeier-oss@weidmueller.com> wrote:
> From: Stefan Herbrechtsmeier <stefan.herbrechtsmeier@weidmueller.com>
>
> Add support for packed images to wic rawcopy handler do minimize disk
> usage in deploy directory and reuse of packed images between wic and
> swupdate. Add `unpack` to sourceparams to unpack an bz2, gz and xz
> archives.
>
> Example:
> part / --source rawcopy --sourceparams=3D"file=3Dcore-image-minimal-qemu.=
ext4.gz,unpack"
>
> Signed-off-by: Stefan Herbrechtsmeier <stefan.herbrechtsmeier@weidmueller=
.com>
>
> ---
>
>  scripts/lib/wic/plugins/source/rawcopy.py | 28 ++++++++++++++++++++++-
>  1 file changed, 27 insertions(+), 1 deletion(-)
>
> diff --git a/scripts/lib/wic/plugins/source/rawcopy.py b/scripts/lib/wic/=
plugins/source/rawcopy.py
> index fa7b1eb8ac..7816e00e49 100644
> --- a/scripts/lib/wic/plugins/source/rawcopy.py
> +++ b/scripts/lib/wic/plugins/source/rawcopy.py
> @@ -4,6 +4,8 @@
>=20=20
>  import logging
>  import os
> +import signal
> +import subprocess
>=20=20
>  from wic import WicError
>  from wic.pluginbase import SourcePlugin
> @@ -38,6 +40,24 @@ class RawCopyPlugin(SourcePlugin):
>=20=20
>          exec_cmd(cmd)
>=20=20
> +    @staticmethod
> +    def do_image_uncompression(src, dst, workdir):
> +        def subprocess_setup():
> +            # Python installs a SIGPIPE handler by default. This is usua=
lly not what
> +            # non-Python subprocesses expect.
> +            # SIGPIPE errors are known issues with gzip/bash
> +            signal.signal(signal.SIGPIPE, signal.SIG_DFL)
> +
> +        decompressor =3D {
> +            ".bz2": "bzip2",
> +            ".gz": "gzip",
> +            ".xz": "xz"
> +        }.get(os.path.splitext(src)[1])
> +        if not decompressor:
> +            raise WicError("Compression not support")

Here is a small typo: s/support/supported/ .

And what about substituting "Compression" by "Compressor" to express
that not compression in general but only this individual compressor is
currently unsupported? (Or even better: in addition explicitely name the
currently unsupported compressor in the error message?)

Best regards
Ulrich


> +        cmd =3D "%s -dc %s > %s" % (decompressor, src, dst)
> +        subprocess.call(cmd, preexec_fn=3Dsubprocess_setup, shell=3DTrue=
, cwd=3Dworkdir)
> +
>      @classmethod
>      def do_prepare_partition(cls, part, source_params, cr, cr_workdir,
>                               oe_builddir, bootimg_dir, kernel_dir,
> @@ -56,7 +76,13 @@ class RawCopyPlugin(SourcePlugin):
>          if 'file' not in source_params:
>              raise WicError("No file specified")
>=20=20
> -        src =3D os.path.join(kernel_dir, source_params['file'])
> +        if 'unpack' in source_params:
> +            img =3D os.path.join(kernel_dir, source_params['file'])
> +            src =3D os.path.join(cr_workdir, os.path.splitext(source_par=
ams['file'])[0])
> +            RawCopyPlugin.do_image_uncompression(img, src, cr_workdir)
> +        else:
> +            src =3D os.path.join(kernel_dir, source_params['file'])
> +
>          dst =3D os.path.join(cr_workdir, "%s.%s" % (os.path.basename(sou=
rce_params['file']), part.lineno))
>=20=20
>          if not os.path.exists(os.path.dirname(dst)):
--=20
Pengutronix e.K.                           | Ulrich =C3=96lmann            =
   |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |
Peiner Str. 6-8, 31137 Hildesheim, Germany | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |

