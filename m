Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9A17ED185D9
	for <webhook@archiver.kernel.org>; Thu,  8 Jan 2026 11:31:01 +0000 (UTC)
Received: from mail-qv1-f46.google.com (mail-qv1-f46.google.com [209.85.219.46])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.4491.1767871857353859018
 for <openembedded-core@lists.openembedded.org>;
 Thu, 08 Jan 2026 03:30:57 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Sx9YhfK9;
 spf=pass (domain: gmail.com, ip: 209.85.219.46, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qv1-f46.google.com with SMTP id 6a1803df08f44-88fdac49a85so31518096d6.0
        for <openembedded-core@lists.openembedded.org>; Thu, 08 Jan 2026 03:30:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767871856; x=1768476656; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=nkccwx7d4REG42efmtBU5T4hNLyKJOR7cNFha/1b3bY=;
        b=Sx9YhfK9zi0W1Jx1rh3d5KKsTWrEiZnfPyiZhv06728Im6Z/z96PoFEzEXoH5lwPMm
         ArXwLYjWZifBzR4cY2Mri4qQEhV1JQGW8Xw3t5mibEn2qmUkikodqzAu9LLHP2KgOFj5
         I3WCV0WD9+Dn6xMiHZaPpgNzcfuiZ3JsvPqeGzPVeQfouIjf4xNApnElL93LrAHM49t4
         yhaLoKE9IG23T71mf/G3YcTOj/noRRhFQowdmrD4VCTfqDfRrTCWYPw4YkuF/4SIFuF7
         8flONgcRhC01UZqKSSo5GWZx9pK1WzyIqxxCQDo7sJBVhpmHlp7f/knTGGeId5Y+yJ4L
         uS5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767871856; x=1768476656;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nkccwx7d4REG42efmtBU5T4hNLyKJOR7cNFha/1b3bY=;
        b=hTvTiMBuX7Ii3WRnpoZzs7TwO+wuM3rfMKlFzQuuSV/sAkMC2Z5HtS1hxuCY8UrJUm
         GAW0Iaj6jouMWKU30QXlSWJNqriGaXk8tLVrb6I+ypHTdRO08r0o4Bvw2m+cstdMxRsh
         uHmlwbfCeTL/tt+y2I6wEy4EmWwA9MTz4C7Sj9KAMRycJeEiJ91FOQNUIV5b4a+Cz0yz
         61nELSRYMVtnwqS/SN3n8DrGUBY1ckhlVP6O+BRrN0/b7PnVwKRmWfh6tNsgoCy3X63E
         t83jn7TaiU57R/xakM9+NKA/iPI79/a5ZWhjOa5Ws2EeWPpL6kNDk+6JJxSjg+teOvCH
         0qjg==
X-Gm-Message-State: AOJu0Yx1Eq6soSrnbuQBAdoDcZM1arYhDg4meEzZ1RYyUjmPie6IRLZI
	VXEb+BVnQ1Knt//g95ZaGhpvcVOiPQeHdP3SS6ms8CPeRglIJutfWfDwMXsoPE6Tqz7DdJnmPG/
	Ijd2yMHyT5NKqZD8VPXkFKVDNUjAK9eY=
X-Gm-Gg: AY/fxX5Cd6fYU5OMcNPfsCPSu8oqshh4UMwH+/ftKEuYsujhxnVxfnH3TEOS1cZ1s/C
	GupKxAu47J+D6MtQEzQsks2/6Ku1R261bwL477CnMQOiE8+HkuVMBzPQkn+IZPKx2+DL71xJ4HN
	KBYDOUYtzE5b4cqcSQh49em9qLUWgHg68kxtpHHqX7HXPzRGH4dyzkq15B9vQ6kLm0MQGj/+FBO
	SpKcf7dSKd8o7pl/Gt5/J9L3BbE4rKiaKbyr1l2Q9YzXqcPzUJyDVb/4EL2SM3bj/mo4OBcDoNG
	lm6bwsnTR66THNl9jt1CyMyIu1u53Q==
X-Google-Smtp-Source: AGHT+IGuegbGD54QHLCU2bFAY3ebygxrehCMmOQerH5ICH9Q76WNmMWxYRaqMmbd/0f0gCQVtQVvW/VRyCofScgws6k=
X-Received: by 2002:a05:6214:5410:b0:88f:e333:4a9c with SMTP id
 6a1803df08f44-890842cbee7mr68827636d6.51.1767871856293; Thu, 08 Jan 2026
 03:30:56 -0800 (PST)
MIME-Version: 1.0
References: <20260107231104.3104004-2-t.f.g.geelen@gmail.com>
In-Reply-To: <20260107231104.3104004-2-t.f.g.geelen@gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Thu, 8 Jan 2026 12:30:45 +0100
X-Gm-Features: AQt7F2oXGxS0Y1XBF16ovENxLc_JuIwfc_ihg6P27out1SKUmoJWQw4un3EoPY8
Message-ID: <CANNYZj966Rkm++z3+Q7jB30rRPdVATHVA2ApUZfiTcPH7tzPbw@mail.gmail.com>
Subject: Re: [RFC] devtool: Add test-image plugin for testing packages via
 devtool via images.
To: Tom Geelen <t.f.g.geelen@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 08 Jan 2026 11:31:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/229059

This looks alright, but it really does need tests, in
meta/lib/oeqa/selftest/cases/devtool.py

Alex

On Thu, 8 Jan 2026 at 00:12, Tom Geelen <t.f.g.geelen@gmail.com> wrote:
>
> Based of a feature of AUH this is a plugin to run a testimage directly with one packages installed that you are working on via devtool.
>
> Inputs would be a:
> - target image
> - target packages
>
> The tool will take care to make sure it also installs the minimal necessary dependencies to be able to run ptest on the target image.
> Logs will be captured and stored in the devtool workspace for easy access.
>
> Minimal example to test:
> - modify a package via devtool
> - call this new method with said package and for instance core-image-minimal
>
> Signed-off-by: Tom Geelen <t.f.g.geelen@gmail.com>
> ---
>  scripts/lib/devtool/testimage.py | 122 +++++++++++++++++++++++++++++++
>  1 file changed, 122 insertions(+)
>  create mode 100644 scripts/lib/devtool/testimage.py
>
> diff --git a/scripts/lib/devtool/testimage.py b/scripts/lib/devtool/testimage.py
> new file mode 100644
> index 0000000000..809bd4bfb2
> --- /dev/null
> +++ b/scripts/lib/devtool/testimage.py
> @@ -0,0 +1,122 @@
> +# Development tool - test-image plugin
> +#
> +# Copyright (C) 2026 Authors
> +#
> +# SPDX-License-Identifier: GPL-2.0-only
> +
> +"""Devtool plugin containing the test-image subcommand.
> +
> +Builds a target image, installs specified package(s) from the workspace or
> +layer, and runs the image's test suite via the BitBake `testimage` task.
> +"""
> +
> +import os
> +import logging
> +
> +from devtool import setup_tinfoil, parse_recipe, DevtoolError
> +from devtool.build_image import build_image_task
> +
> +logger = logging.getLogger('devtool')
> +
> +
> +def _collect_install_packages(tinfoil, config, package_names):
> +    """Return list of packages to install, including -ptest when available.
> +
> +    package_names: list of PN values (typically recipe names).
> +    """
> +    install = []
> +    for pn in package_names:
> +        rd = parse_recipe(config, tinfoil, pn, True)
> +        if not rd:
> +            # parse_recipe already logs errors
> +            raise DevtoolError(f'Unable to find or parse recipe for package {pn}')
> +
> +        install.append(pn)
> +        packages_var = rd.getVar('PACKAGES') or ''
> +        packages = packages_var.split()
> +        ptest_pkg = f'{pn}-ptest'
> +        if ptest_pkg in packages:
> +            install.append(ptest_pkg)
> +            logger.info('Including ptest package %s', ptest_pkg)
> +        else:
> +            logger.debug('No ptest package found for %s', pn)
> +    return install
> +
> +
> +def test_image(args, config, basepath, workspace):
> +    """Entry point for the devtool 'test-image' subcommand."""
> +
> +    if not args.imagename:
> +        raise DevtoolError('Image recipe to test must be specified')
> +    if not args.package:
> +        raise DevtoolError('Package(s) to install must be specified via -p/--package')
> +
> +    package_names = [p.strip() for p in args.package.split(',') if p.strip()]
> +    if not package_names:
> +        raise DevtoolError('No valid package name(s) provided')
> +
> +    # Prepare a bbappend with IMAGE_INSTALL and testimage variables
> +    tinfoil = setup_tinfoil(basepath=basepath)
> +    try:
> +        install_pkgs = _collect_install_packages(tinfoil, config, package_names)
> +    finally:
> +        tinfoil.shutdown()
> +
> +    logdir = os.path.join(config.workspace_path, 'testimage-logs')
> +    try:
> +        os.makedirs(logdir, exist_ok=True)
> +    except Exception as exc:
> +        raise DevtoolError(f'Failed to create test logs directory {logdir}: {exc}')
> +
> +    pkg_append = ' '.join(sorted(set(install_pkgs)))
> +    extra_append = [
> +        f'TEST_LOG_DIR = "{logdir}"',
> +        # Ensure changes to these vars retrigger testimage and are visible
> +        'TESTIMAGE_UPDATE_VARS:append = " TEST_LOG_DIR IMAGE_CLASSES TEST_SUITES DISTRO_FEATURES"',
> +        # Ensure runtime test framework is enabled even if image/distro omitted it
> +        'IMAGE_CLASSES:append = " testimage"',
> +        'TEST_SUITES = "ping ssh ptest"',
> +        'DISTRO_FEATURES:append = " ptest"',
> +        'TEST_RUNQEMUPARAMS = "slirp"',
> +        # Ensure requested packages (and -ptest where available) are installed
> +        f'IMAGE_INSTALL:append = " {pkg_append}"',
> +    ]
> +
> +    logger.info('Building and testing image %s with packages: %s',
> +                args.imagename, ' '.join(install_pkgs))
> +
> +    # Reuse build_image_task to run -c testimage with our bbappend
> +    result, _outputdir = build_image_task(
> +        config,
> +        basepath,
> +        workspace,
> +        args.imagename,
> +        add_packages=install_pkgs,
> +        task='testimage',
> +        extra_append=extra_append,
> +    )
> +
> +    if result == 0:
> +        logger.info('Testimage completed. Logs are in %s', logdir)
> +    return result
> +
> +
> +def register_commands(subparsers, context):
> +    """Register devtool subcommands from the test-image plugin"""
> +    parser = subparsers.add_parser(
> +        'test-image',
> +        help='Build image, install package(s), and run testimage',
> +        description=(
> +            'Builds an image, installs specified package(s), and runs the\n'
> +            'BitBake testimage task to validate on-target functionality.'
> +        ),
> +        group='testbuild',
> +        order=-9,
> +    )
> +    parser.add_argument('imagename', help='Image recipe to test')
> +    parser.add_argument(
> +        '-p', '--package', '--packages',
> +        help='Package(s) to install into the image (comma-separated)',
> +        metavar='PACKAGES',
> +    )
> +    parser.set_defaults(func=test_image)
> --
> 2.43.0
>

