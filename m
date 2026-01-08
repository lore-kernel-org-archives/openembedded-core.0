Return-Path: <t.f.g.geelen@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A3F41D1D469
	for <webhook@archiver.kernel.org>; Thu,  8 Jan 2026 14:54:32 +0000 (UTC)
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.8094.1767884070716563150
 for <openembedded-core@lists.openembedded.org>;
 Thu, 08 Jan 2026 06:54:31 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=cy6BTu6M;
 spf=pass (domain: gmail.com, ip: 209.85.167.53, mailfrom: t.f.g.geelen@gmail.com)
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-59b6df3d6b4so2638923e87.0
        for <openembedded-core@lists.openembedded.org>; Thu, 08 Jan 2026 06:54:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767884069; x=1768488869; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=djikb9T9ArMPZxPrh3Bt5xWDOMi/CwHLDOSX6Pxl6zc=;
        b=cy6BTu6Mx6r1g7r8T+GHUuIpPVDXn6iKQQOdPBn5+N1RJWLs2DSAuRbbRAm+NIocx3
         tnmeHqMYusa10fngkpXdu+hp9WwUuYaHtj88/JhPoCYwcoPlOet7iCEAX/4170I3w8kg
         Y+FpPjq/YYIhmWjifnhATM+CZ2RxqXZXC+z4nas94CYeIpvi9KtluG6TqVx99ZmZyv8c
         X6QnETl6iaXuzAhqv5Tjr0kC79WNQH98mWbOXrZYJJWNUmDKyG1oIx+TvmJBG0aB0BeC
         MSMEP4Bm70FUB9gw8xAU5er45HRPH1VfVoUIhkcJny0BUhg5vHX0mwlN2LqhgEFaCfaZ
         TO2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767884069; x=1768488869;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=djikb9T9ArMPZxPrh3Bt5xWDOMi/CwHLDOSX6Pxl6zc=;
        b=C8RW/T7GAB62FqhE1CsWeguNoRdoo8jgns5ObQWQ6y5rz6fdzkVuwPSHu9NNBCUqmH
         /LZPLc39pzm4JiRj/VPjDA/Cqq1fIc25szVnsd0EKjy+i1NTn1JDrk8+9uqLjigVKP9M
         ZH7Ea05YIL+VGutmv3Sxh3/TvYPF+cNfZL3Otapz15r4CbO+EbPQrptJZWmUIFAN6Ato
         Ar6dVeRClKUl8+Czl9YhRQvKDgFZYRJMxtlPPuddVXrc8t/SynhqufThcWfJV+R7zonF
         dJwZUzynPb7aJEakeJxCwqTso8a3VRsi78Pt9GUzqIDRu7xM5XrnP7BCuHeaUnk3/2vg
         C1HQ==
X-Gm-Message-State: AOJu0YwDP6LnPs565ozZXsZXFYQNbS82vdjfHxNEfoGUd798qoqnYFqd
	YP9VYfk3sRcAssCxLfPFhy/9bjMa964hI3GyPoK/LE3p2oG//qQG6o/CT56MlzvhdDa/knn+fBl
	rXW5veRW9eb/b0cKsC0Dpb1JjamJqsOk=
X-Gm-Gg: AY/fxX6u10ZQEu6qA0GkiWqz8+kJREQ3Wx7DpcPKx7UxoqBJtxZFjmeAVID28aEcxgb
	GxRm33O4E4HWQe6+ao3ZL8uI0/B0aV1loO7r9sCmUJU6SduSgI/XQv2jh2cL63/T8PhCP/FTW8w
	XhRO9YAeCIt85NOCKvveis3XXlVwx26HICAPm/TN5CBe+bhHpqEUbuIjs2nYYQs4ZmW72hblwqX
	ofyO46/j4DmFbXIwVLQE9NGTMX+Z3WzUqdNC8m4bpoBaToh4JBwwkRMwIkk6xZu9CPKCg==
X-Google-Smtp-Source: AGHT+IHxlTYNXlIcT9YSiLE204128b7iMTbDRcvBBkmav1KaMGZ7eVeMYRbDfinCifsbdT8I+p6fTX6qE6YsjmYm07k=
X-Received: by 2002:a05:6512:3d07:b0:599:fe3:785 with SMTP id
 2adb3069b0e04-59b6f0460d3mr2459842e87.52.1767884068439; Thu, 08 Jan 2026
 06:54:28 -0800 (PST)
MIME-Version: 1.0
References: <20260107231104.3104004-2-t.f.g.geelen@gmail.com> <CANNYZj966Rkm++z3+Q7jB30rRPdVATHVA2ApUZfiTcPH7tzPbw@mail.gmail.com>
In-Reply-To: <CANNYZj966Rkm++z3+Q7jB30rRPdVATHVA2ApUZfiTcPH7tzPbw@mail.gmail.com>
From: Tom Geelen <t.f.g.geelen@gmail.com>
Date: Thu, 8 Jan 2026 15:54:15 +0100
X-Gm-Features: AQt7F2ro3vx5_-jLe_ja-evUr5GRpf0BLCV0aunHqCjP1DWilfjqA7mjHTsLvKE
Message-ID: <CAJo0Az4eSU6S54zJKB2My+jBx-Gpgp_p3Yeks=XC+0AHSDD_pw@mail.gmail.com>
Subject: Re: [RFC] devtool: Add test-image plugin for testing packages via
 devtool via images.
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000e747f10647e19502"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 08 Jan 2026 14:54:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/229081

--000000000000e747f10647e19502
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Thanks for the review. I'll add tests before submitting a new revision.

Tom

On Thu, Jan 8, 2026 at 12:30=E2=80=AFPM Alexander Kanavin <alex.kanavin@gma=
il.com>
wrote:

> This looks alright, but it really does need tests, in
> meta/lib/oeqa/selftest/cases/devtool.py
>
> Alex
>
> On Thu, 8 Jan 2026 at 00:12, Tom Geelen <t.f.g.geelen@gmail.com> wrote:
> >
> > Based of a feature of AUH this is a plugin to run a testimage directly
> with one packages installed that you are working on via devtool.
> >
> > Inputs would be a:
> > - target image
> > - target packages
> >
> > The tool will take care to make sure it also installs the minimal
> necessary dependencies to be able to run ptest on the target image.
> > Logs will be captured and stored in the devtool workspace for easy
> access.
> >
> > Minimal example to test:
> > - modify a package via devtool
> > - call this new method with said package and for instance
> core-image-minimal
> >
> > Signed-off-by: Tom Geelen <t.f.g.geelen@gmail.com>
> > ---
> >  scripts/lib/devtool/testimage.py | 122 +++++++++++++++++++++++++++++++
> >  1 file changed, 122 insertions(+)
> >  create mode 100644 scripts/lib/devtool/testimage.py
> >
> > diff --git a/scripts/lib/devtool/testimage.py
> b/scripts/lib/devtool/testimage.py
> > new file mode 100644
> > index 0000000000..809bd4bfb2
> > --- /dev/null
> > +++ b/scripts/lib/devtool/testimage.py
> > @@ -0,0 +1,122 @@
> > +# Development tool - test-image plugin
> > +#
> > +# Copyright (C) 2026 Authors
> > +#
> > +# SPDX-License-Identifier: GPL-2.0-only
> > +
> > +"""Devtool plugin containing the test-image subcommand.
> > +
> > +Builds a target image, installs specified package(s) from the workspac=
e
> or
> > +layer, and runs the image's test suite via the BitBake `testimage` tas=
k.
> > +"""
> > +
> > +import os
> > +import logging
> > +
> > +from devtool import setup_tinfoil, parse_recipe, DevtoolError
> > +from devtool.build_image import build_image_task
> > +
> > +logger =3D logging.getLogger('devtool')
> > +
> > +
> > +def _collect_install_packages(tinfoil, config, package_names):
> > +    """Return list of packages to install, including -ptest when
> available.
> > +
> > +    package_names: list of PN values (typically recipe names).
> > +    """
> > +    install =3D []
> > +    for pn in package_names:
> > +        rd =3D parse_recipe(config, tinfoil, pn, True)
> > +        if not rd:
> > +            # parse_recipe already logs errors
> > +            raise DevtoolError(f'Unable to find or parse recipe for
> package {pn}')
> > +
> > +        install.append(pn)
> > +        packages_var =3D rd.getVar('PACKAGES') or ''
> > +        packages =3D packages_var.split()
> > +        ptest_pkg =3D f'{pn}-ptest'
> > +        if ptest_pkg in packages:
> > +            install.append(ptest_pkg)
> > +            logger.info('Including ptest package %s', ptest_pkg)
> > +        else:
> > +            logger.debug('No ptest package found for %s', pn)
> > +    return install
> > +
> > +
> > +def test_image(args, config, basepath, workspace):
> > +    """Entry point for the devtool 'test-image' subcommand."""
> > +
> > +    if not args.imagename:
> > +        raise DevtoolError('Image recipe to test must be specified')
> > +    if not args.package:
> > +        raise DevtoolError('Package(s) to install must be specified vi=
a
> -p/--package')
> > +
> > +    package_names =3D [p.strip() for p in args.package.split(',') if
> p.strip()]
> > +    if not package_names:
> > +        raise DevtoolError('No valid package name(s) provided')
> > +
> > +    # Prepare a bbappend with IMAGE_INSTALL and testimage variables
> > +    tinfoil =3D setup_tinfoil(basepath=3Dbasepath)
> > +    try:
> > +        install_pkgs =3D _collect_install_packages(tinfoil, config,
> package_names)
> > +    finally:
> > +        tinfoil.shutdown()
> > +
> > +    logdir =3D os.path.join(config.workspace_path, 'testimage-logs')
> > +    try:
> > +        os.makedirs(logdir, exist_ok=3DTrue)
> > +    except Exception as exc:
> > +        raise DevtoolError(f'Failed to create test logs directory
> {logdir}: {exc}')
> > +
> > +    pkg_append =3D ' '.join(sorted(set(install_pkgs)))
> > +    extra_append =3D [
> > +        f'TEST_LOG_DIR =3D "{logdir}"',
> > +        # Ensure changes to these vars retrigger testimage and are
> visible
> > +        'TESTIMAGE_UPDATE_VARS:append =3D " TEST_LOG_DIR IMAGE_CLASSES
> TEST_SUITES DISTRO_FEATURES"',
> > +        # Ensure runtime test framework is enabled even if image/distr=
o
> omitted it
> > +        'IMAGE_CLASSES:append =3D " testimage"',
> > +        'TEST_SUITES =3D "ping ssh ptest"',
> > +        'DISTRO_FEATURES:append =3D " ptest"',
> > +        'TEST_RUNQEMUPARAMS =3D "slirp"',
> > +        # Ensure requested packages (and -ptest where available) are
> installed
> > +        f'IMAGE_INSTALL:append =3D " {pkg_append}"',
> > +    ]
> > +
> > +    logger.info('Building and testing image %s with packages: %s',
> > +                args.imagename, ' '.join(install_pkgs))
> > +
> > +    # Reuse build_image_task to run -c testimage with our bbappend
> > +    result, _outputdir =3D build_image_task(
> > +        config,
> > +        basepath,
> > +        workspace,
> > +        args.imagename,
> > +        add_packages=3Dinstall_pkgs,
> > +        task=3D'testimage',
> > +        extra_append=3Dextra_append,
> > +    )
> > +
> > +    if result =3D=3D 0:
> > +        logger.info('Testimage completed. Logs are in %s', logdir)
> > +    return result
> > +
> > +
> > +def register_commands(subparsers, context):
> > +    """Register devtool subcommands from the test-image plugin"""
> > +    parser =3D subparsers.add_parser(
> > +        'test-image',
> > +        help=3D'Build image, install package(s), and run testimage',
> > +        description=3D(
> > +            'Builds an image, installs specified package(s), and runs
> the\n'
> > +            'BitBake testimage task to validate on-target
> functionality.'
> > +        ),
> > +        group=3D'testbuild',
> > +        order=3D-9,
> > +    )
> > +    parser.add_argument('imagename', help=3D'Image recipe to test')
> > +    parser.add_argument(
> > +        '-p', '--package', '--packages',
> > +        help=3D'Package(s) to install into the image (comma-separated)=
',
> > +        metavar=3D'PACKAGES',
> > +    )
> > +    parser.set_defaults(func=3Dtest_image)
> > --
> > 2.43.0
> >
>

--000000000000e747f10647e19502
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Thanks for the review. I&#39;ll add tests before submittin=
g a new revision.<div><br></div><div>Tom</div></div><br><div class=3D"gmail=
_quote gmail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">On Thu,=
 Jan 8, 2026 at 12:30=E2=80=AFPM Alexander Kanavin &lt;<a href=3D"mailto:al=
ex.kanavin@gmail.com">alex.kanavin@gmail.com</a>&gt; wrote:<br></div><block=
quote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1=
px solid rgb(204,204,204);padding-left:1ex">This looks alright, but it real=
ly does need tests, in<br>
meta/lib/oeqa/selftest/cases/devtool.py<br>
<br>
Alex<br>
<br>
On Thu, 8 Jan 2026 at 00:12, Tom Geelen &lt;<a href=3D"mailto:t.f.g.geelen@=
gmail.com" target=3D"_blank">t.f.g.geelen@gmail.com</a>&gt; wrote:<br>
&gt;<br>
&gt; Based of a feature of AUH this is a plugin to run a testimage directly=
 with one packages installed that you are working on via devtool.<br>
&gt;<br>
&gt; Inputs would be a:<br>
&gt; - target image<br>
&gt; - target packages<br>
&gt;<br>
&gt; The tool will take care to make sure it also installs the minimal nece=
ssary dependencies to be able to run ptest on the target image.<br>
&gt; Logs will be captured and stored in the devtool workspace for easy acc=
ess.<br>
&gt;<br>
&gt; Minimal example to test:<br>
&gt; - modify a package via devtool<br>
&gt; - call this new method with said package and for instance core-image-m=
inimal<br>
&gt;<br>
&gt; Signed-off-by: Tom Geelen &lt;<a href=3D"mailto:t.f.g.geelen@gmail.com=
" target=3D"_blank">t.f.g.geelen@gmail.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 scripts/lib/devtool/testimage.py | 122 +++++++++++++++++++++++++=
++++++<br>
&gt;=C2=A0 1 file changed, 122 insertions(+)<br>
&gt;=C2=A0 create mode 100644 scripts/lib/devtool/testimage.py<br>
&gt;<br>
&gt; diff --git a/scripts/lib/devtool/testimage.py b/scripts/lib/devtool/te=
stimage.py<br>
&gt; new file mode 100644<br>
&gt; index 0000000000..809bd4bfb2<br>
&gt; --- /dev/null<br>
&gt; +++ b/scripts/lib/devtool/testimage.py<br>
&gt; @@ -0,0 +1,122 @@<br>
&gt; +# Development tool - test-image plugin<br>
&gt; +#<br>
&gt; +# Copyright (C) 2026 Authors<br>
&gt; +#<br>
&gt; +# SPDX-License-Identifier: GPL-2.0-only<br>
&gt; +<br>
&gt; +&quot;&quot;&quot;Devtool plugin containing the test-image subcommand=
.<br>
&gt; +<br>
&gt; +Builds a target image, installs specified package(s) from the workspa=
ce or<br>
&gt; +layer, and runs the image&#39;s test suite via the BitBake `testimage=
` task.<br>
&gt; +&quot;&quot;&quot;<br>
&gt; +<br>
&gt; +import os<br>
&gt; +import logging<br>
&gt; +<br>
&gt; +from devtool import setup_tinfoil, parse_recipe, DevtoolError<br>
&gt; +from devtool.build_image import build_image_task<br>
&gt; +<br>
&gt; +logger =3D logging.getLogger(&#39;devtool&#39;)<br>
&gt; +<br>
&gt; +<br>
&gt; +def _collect_install_packages(tinfoil, config, package_names):<br>
&gt; +=C2=A0 =C2=A0 &quot;&quot;&quot;Return list of packages to install, i=
ncluding -ptest when available.<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 package_names: list of PN values (typically recipe name=
s).<br>
&gt; +=C2=A0 =C2=A0 &quot;&quot;&quot;<br>
&gt; +=C2=A0 =C2=A0 install =3D []<br>
&gt; +=C2=A0 =C2=A0 for pn in package_names:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 rd =3D parse_recipe(config, tinfoil, pn, =
True)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 if not rd:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 # parse_recipe already logs=
 errors<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 raise DevtoolError(f&#39;Un=
able to find or parse recipe for package {pn}&#39;)<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 install.append(pn)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 packages_var =3D rd.getVar(&#39;PACKAGES&=
#39;) or &#39;&#39;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 packages =3D packages_var.split()<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 ptest_pkg =3D f&#39;{pn}-ptest&#39;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 if ptest_pkg in packages:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 install.append(ptest_pkg)<b=
r>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 <a href=3D"http://logger.in=
fo" rel=3D"noreferrer" target=3D"_blank">logger.info</a>(&#39;Including pte=
st package %s&#39;, ptest_pkg)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 else:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 logger.debug(&#39;No ptest =
package found for %s&#39;, pn)<br>
&gt; +=C2=A0 =C2=A0 return install<br>
&gt; +<br>
&gt; +<br>
&gt; +def test_image(args, config, basepath, workspace):<br>
&gt; +=C2=A0 =C2=A0 &quot;&quot;&quot;Entry point for the devtool &#39;test=
-image&#39; subcommand.&quot;&quot;&quot;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 if not args.imagename:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 raise DevtoolError(&#39;Image recipe to t=
est must be specified&#39;)<br>
&gt; +=C2=A0 =C2=A0 if not args.package:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 raise DevtoolError(&#39;Package(s) to ins=
tall must be specified via -p/--package&#39;)<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 package_names =3D [p.strip() for p in args.package.spli=
t(&#39;,&#39;) if p.strip()]<br>
&gt; +=C2=A0 =C2=A0 if not package_names:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 raise DevtoolError(&#39;No valid package =
name(s) provided&#39;)<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 # Prepare a bbappend with IMAGE_INSTALL and testimage v=
ariables<br>
&gt; +=C2=A0 =C2=A0 tinfoil =3D setup_tinfoil(basepath=3Dbasepath)<br>
&gt; +=C2=A0 =C2=A0 try:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 install_pkgs =3D _collect_install_package=
s(tinfoil, config, package_names)<br>
&gt; +=C2=A0 =C2=A0 finally:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 tinfoil.shutdown()<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 logdir =3D os.path.join(config.workspace_path, &#39;tes=
timage-logs&#39;)<br>
&gt; +=C2=A0 =C2=A0 try:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 os.makedirs(logdir, exist_ok=3DTrue)<br>
&gt; +=C2=A0 =C2=A0 except Exception as exc:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 raise DevtoolError(f&#39;Failed to create=
 test logs directory {logdir}: {exc}&#39;)<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 pkg_append =3D &#39; &#39;.join(sorted(set(install_pkgs=
)))<br>
&gt; +=C2=A0 =C2=A0 extra_append =3D [<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 f&#39;TEST_LOG_DIR =3D &quot;{logdir}&quo=
t;&#39;,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 # Ensure changes to these vars retrigger =
testimage and are visible<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 &#39;TESTIMAGE_UPDATE_VARS:append =3D &qu=
ot; TEST_LOG_DIR IMAGE_CLASSES TEST_SUITES DISTRO_FEATURES&quot;&#39;,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 # Ensure runtime test framework is enable=
d even if image/distro omitted it<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 &#39;IMAGE_CLASSES:append =3D &quot; test=
image&quot;&#39;,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 &#39;TEST_SUITES =3D &quot;ping ssh ptest=
&quot;&#39;,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 &#39;DISTRO_FEATURES:append =3D &quot; pt=
est&quot;&#39;,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 &#39;TEST_RUNQEMUPARAMS =3D &quot;slirp&q=
uot;&#39;,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 # Ensure requested packages (and -ptest w=
here available) are installed<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 f&#39;IMAGE_INSTALL:append =3D &quot; {pk=
g_append}&quot;&#39;,<br>
&gt; +=C2=A0 =C2=A0 ]<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 <a href=3D"http://logger.info" rel=3D"noreferrer" targe=
t=3D"_blank">logger.info</a>(&#39;Building and testing image %s with packag=
es: %s&#39;,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 args.imagenam=
e, &#39; &#39;.join(install_pkgs))<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 # Reuse build_image_task to run -c testimage with our b=
bappend<br>
&gt; +=C2=A0 =C2=A0 result, _outputdir =3D build_image_task(<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 config,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 basepath,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 workspace,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 args.imagename,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 add_packages=3Dinstall_pkgs,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 task=3D&#39;testimage&#39;,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 extra_append=3Dextra_append,<br>
&gt; +=C2=A0 =C2=A0 )<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 if result =3D=3D 0:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 <a href=3D"http://logger.info" rel=3D"nor=
eferrer" target=3D"_blank">logger.info</a>(&#39;Testimage completed. Logs a=
re in %s&#39;, logdir)<br>
&gt; +=C2=A0 =C2=A0 return result<br>
&gt; +<br>
&gt; +<br>
&gt; +def register_commands(subparsers, context):<br>
&gt; +=C2=A0 =C2=A0 &quot;&quot;&quot;Register devtool subcommands from the=
 test-image plugin&quot;&quot;&quot;<br>
&gt; +=C2=A0 =C2=A0 parser =3D subparsers.add_parser(<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 &#39;test-image&#39;,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 help=3D&#39;Build image, install package(=
s), and run testimage&#39;,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 description=3D(<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &#39;Builds an image, insta=
lls specified package(s), and runs the\n&#39;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &#39;BitBake testimage task=
 to validate on-target functionality.&#39;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 ),<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 group=3D&#39;testbuild&#39;,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 order=3D-9,<br>
&gt; +=C2=A0 =C2=A0 )<br>
&gt; +=C2=A0 =C2=A0 parser.add_argument(&#39;imagename&#39;, help=3D&#39;Im=
age recipe to test&#39;)<br>
&gt; +=C2=A0 =C2=A0 parser.add_argument(<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 &#39;-p&#39;, &#39;--package&#39;, &#39;-=
-packages&#39;,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 help=3D&#39;Package(s) to install into th=
e image (comma-separated)&#39;,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 metavar=3D&#39;PACKAGES&#39;,<br>
&gt; +=C2=A0 =C2=A0 )<br>
&gt; +=C2=A0 =C2=A0 parser.set_defaults(func=3Dtest_image)<br>
&gt; --<br>
&gt; 2.43.0<br>
&gt;<br>
</blockquote></div>

--000000000000e747f10647e19502--

