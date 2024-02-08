Return-Path: <jermain.horsman@nedap.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 99974C48260
	for <webhook@archiver.kernel.org>; Thu,  8 Feb 2024 13:40:47 +0000 (UTC)
Subject: Re: [PATCH 5/5] oe-setup-build: add a tool for discovering config templates and setting up builds
To: openembedded-core@lists.openembedded.org
From: "Jermain Horsman" <jermain.horsman@nedap.com>
X-Originating-Location: Groenlo, Gelderland, NL (149.3.168.10)
X-Originating-Platform: Windows Firefox 122
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Thu, 08 Feb 2024 05:40:41 -0800
References: <20240131123908.1098544-5-alex@linutronix.de>
In-Reply-To: <20240131123908.1098544-5-alex@linutronix.de>
Message-ID: <28123.1707399641733383554@lists.openembedded.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 08 Feb 2024 13:40:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/195152

I just tried to run the selftest on bblayers using oe-core and not poky and=
 I noticed some failures,
which I thought I'd share.

>          # The revision-under-test may not necessarily be available on th=
e
> remote server,
> -        # so replace it with a revision that has a yocto-4.0 tag.
> +        # so replace it with a revision that has a yocto-4.1 tag.
>          import json
>          with open(jsonfile) as f:
>              data =3D json.load(f)
>          for s in data['sources']:
> -            data['sources'][s]['git-remote']['rev'] =3D
> '00cfdde791a0176c134f31e5a09eff725e75b905'
> +            data['sources'][s]['git-remote']['rev'] =3D
> '5200799866b92259e855051112520006e1aaaac0'

First I got a failure here, as this is not a valid reference on oe-core, on=
ly on poky is this valid.

> +def setup_build_env(args):
> +    templates =3D discover_templates(args.layerlist)
> +    if not templates:
> +        return
> +
> +    template =3D find_template(args.c, templates)
> +    if not template:
> +        return
> +    builddir =3D args.b if args.b else template["buildpath"]
> +    no_shell =3D args.no_shell
> +    coredir =3D
> os.path.abspath(os.path.join(os.path.dirname(os.path.realpath(__file__)),
> '..'))
> +    cmd =3D "TEMPLATECONF=3D{} . {} {}".format(template["templatepath"],
> os.path.join(coredir, 'oe-init-build-env'), builddir)
> +    if not no_shell:
> +        cmd =3D cmd + " && {}".format(os.environ['SHELL'])
> +    print("Running:", cmd)
> +    subprocess.run(cmd, shell=3DTrue, executable=3Dos.environ['SHELL'])
> +

2024-02-08 13:14:26,793 - oe-selftest - INFO - =3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
2024-02-08 13:14:26,793 - oe-selftest - INFO - FAIL: test_bitbakelayers_set=
up (bblayers.BitbakeLayers)
2024-02-08 13:14:26,794 - oe-selftest - INFO - ----------------------------=
------------------------------------------
2024-02-08 13:14:26,794 - oe-selftest - INFO - Traceback (most recent call =
last):
  File "/home/builder/workdir/openembedded-core-contrib/meta/lib/oeqa/selft=
est/cases/bblayers.py", line 189, in test_bitbakelayers_setup
    result =3D runCmd(cmd)
  File "/home/builder/workdir/openembedded-core-contrib/meta/lib/oeqa/utils=
/commands.py", line 212, in runCmd
    raise AssertionError("Command '%s' returned non-zero exit status %d:\n%=
s" % (command, result.status, exc_output))
AssertionError: Command '/home/builder/workdir/build-st/test-layer-checkout=
/setup-build --layerlist /home/builder/workdir/build-st/test-layer-checkout=
/.oe-layers.json setup -c meta-default --no-shell' returned non-zero exit s=
tatus 1:
Available build configurations:

1. meta-default
This configuration does not have a description.

Re-run with 'list -v' to see additional information.
Running: TEMPLATECONF=3D/home/builder/workdir/build-st/test-layer-checkout/=
openembedded-core-contrib/meta/conf/templates/default . /home/builder/workd=
ir/openembedded-core-contrib/oe-init-build-env /home/builder/workdir/build-=
st/build-meta-default
Traceback (most recent call last):
  File "/home/builder/workdir/build-st/test-layer-checkout/setup-build", li=
ne 119, in <module>
    args.func(args)
  File "/home/builder/workdir/build-st/test-layer-checkout/setup-build", li=
ne 98, in setup_build_env
    subprocess.run(cmd, shell=3DTrue, executable=3Dos.environ['SHELL'])
  File "/usr/lib/python3.9/os.py", line 679, in __getitem__
    raise KeyError(key) from None
KeyError: 'SHELL'


I'm not entirely sure what was going on here, the SHELL variable was set in=
 the shell environment, however it was not in os.environ.

