Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A6A2DC83F25
	for <webhook@archiver.kernel.org>; Wed, 23 Jul 2025 06:22:54 +0000 (UTC)
Received: from mail-yw1-f180.google.com (mail-yw1-f180.google.com [209.85.128.180])
 by mx.groups.io with SMTP id smtpd.web10.7572.1753251766523092931
 for <openembedded-core@lists.openembedded.org>;
 Tue, 22 Jul 2025 23:22:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=D4tBB4FP;
 spf=pass (domain: gmail.com, ip: 209.85.128.180, mailfrom: raj.khem@gmail.com)
Received: by mail-yw1-f180.google.com with SMTP id 00721157ae682-718425f1172so63676507b3.0
        for <openembedded-core@lists.openembedded.org>; Tue, 22 Jul 2025 23:22:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753251766; x=1753856566; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ohw9GlfdaxjHoFcMy7oaihtGh4jxCRsFUNRgY1LNncc=;
        b=D4tBB4FPyjxn+74yjsrHORc20XMqzw0DRCRTocKNW2RkCizcgtq/fLLnJj2FH49XO7
         IR2HWaWDnhy7CuVstOxmVLvg7yW3pqz6L1m0GH+7p/1AL/e62ELAabhIg+X2d0mTn0qE
         TXiK8RCUhrcKr+LSXT43Nyf8KnAaw2M+ERar5UGFe9ahckmSDiaRJ/f6AlwcfIu3YMg5
         00LEhE2cGEu63VxbAW8GxfxOWcLW4zO+fm8/BrWPI1Ewu8VjgwDT0l98dPu5z12RAxNO
         DOQMPoZxqAkL370ieWCRsoJUlWxhoCImFKktzTKVa8pbCqs46diDWehiOJt609NloZB7
         uIBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753251766; x=1753856566;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ohw9GlfdaxjHoFcMy7oaihtGh4jxCRsFUNRgY1LNncc=;
        b=BBsj262W3IZaARhtj9+qpDIcTQk+AE2cPgFcpYz/1Kn13QaNG51ma/G6//YP6AI0oU
         1WeNwEm/hXfKyMyy80Yw/CLs5p0YMwSO5cSd0c44XIR57M7f6PelllVAHRNIW3MpO9hn
         sSeViGNqdb8m+GJT3RumKBrI/fpd2h44BoIPV9UQ/ppY9PkuJq2r+9LBhwTuTtOseEex
         GZImFSJiOHxRAxdMW0y9gSRBhoq+Oz6QBX5MDe41RHAZbyCNg+yQdP0s7DA9MEgf8wqs
         wbagbKp/qtryx/ZVmmNcJT4rfRrmgnPjUH6/kTlIjmxkTGfYY58Wdm7QDvS99cI2ZNMn
         Gv3g==
X-Gm-Message-State: AOJu0YyRV2yu/pE1HPJSJiL/Qwrg0/cBqPKlkflJcNoFyXDLcup4Ck4Z
	CNItoXuDVG8xu0+hRR0t5XW4H8SDIEZq3Jt0BlYMYqU6L6nvwpN7KAccBb8kznkmaYayGJaL49I
	i7x3906OSndYAIgLezMWRci8wbezqRgRsfHO7
X-Gm-Gg: ASbGncv4av35Hc+EnD8vRYRFSwoMP+9Kdjx9ezEJwzXuUUoqw9ftnU9kJX/MN62QegP
	mdmkghPy7VkEedxrQ7UVDOltajlOCg0C1d/t7oErRQ5AlGFreSKSmqWTV9RBrApxKCe3sKP23zj
	ci4aZhUZfzcEbrv3QUcMDKFz8uktBiRAn/YHg1FA6IJP1+XK+wamAcvmRzp8yTgQmUmGCpRtk4B
	KfYXA==
X-Google-Smtp-Source: AGHT+IHtuLIMq3HevAKHSpSuUZKDtWNqCdWUIY1XpIRkBZSopPAfzuTqaAwA+hdU7bqk1X6iNpbTz4D+tSjj/4D1iWU=
X-Received: by 2002:a05:690c:6e0e:b0:718:2154:62df with SMTP id
 00721157ae682-719b42f4ac2mr23588817b3.35.1753251765457; Tue, 22 Jul 2025
 23:22:45 -0700 (PDT)
MIME-Version: 1.0
References: <20250510084400.269726-1-ross.burton@arm.com> <20250510084400.269726-8-ross.burton@arm.com>
 <AS1PR10MB5697CDCCFB1F944F706B775BFD56A@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
 <AS1PR10MB5697200926409DD54A0C65DCFD5FA@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
In-Reply-To: <AS1PR10MB5697200926409DD54A0C65DCFD5FA@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 22 Jul 2025 23:22:19 -0700
X-Gm-Features: Ac12FXwpia49JzBG_r_3u7LF2CF6EtBG0406rUotMxRD-z-izeVCKtFnZ97ai5Q
Message-ID: <CAMKF1spK=rZHyR1ojekro9aUvY1UmYY+WY70qaLVv=mtDDPRkQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 08/23] oeqa/sdk: add helpers to check for and
 install packages
To: "Marko, Peter" <Peter.Marko@siemens.com>
Cc: "openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>, 
	"ross.burton@arm.com" <ross.burton@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 23 Jul 2025 06:22:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/220791

On Tue, Jul 22, 2025 at 11:14=E2=80=AFPM Marko, Peter <Peter.Marko@siemens.=
com> wrote:
>
> Khem,
>
> you mentioned the maturin test failure problem on IRC yesterday.
> This is the commit which broke it.

most likely seems to be the culprit.

> I'll propose a patch shortly.
>

Thanks for help

> Peter
>
> > -----Original Message-----
> > From: Marko, Peter (FT D EU SK BFS1)
> > Sent: Wednesday, July 16, 2025 15:54
> > To: ross.burton@arm.com; openembedded-core@lists.openembedded.org
> > Subject: RE: [OE-core] [PATCH 08/23] oeqa/sdk: add helpers to check for=
 and
> > install packages
> >
> > Hi Ross,
> >
> > I have a problem when running oe-selftest after this commit.
> > When I updated past this commit and commit which uses it:
> > https://git.openembedded.org/openembedded-
> > core/commit/?id=3D11277efd057685558a744e98082b5709e849dd2a
> >
> > I get following failure (on Debian12 VM):
> > =3D=3D=3D
> > Traceback (most recent call last):
> >   File "/home/projects/builds/poky-build/poky/meta/lib/oeqa/core/case.p=
y", line 54,
> > in _oeSetUp
> >     self.setUpMethod()
> >   File "/home/projects/builds/poky-build/poky/meta/lib/oeqa/sdk/cases/m=
aturin.py",
> > line 35, in setUp
> >     self.ensure_host_package("python3-maturin")
> >   File "/home/projects/builds/poky-build/poky/meta/lib/oeqa/sdk/case.py=
", line 47,
> > in ensure_host_package
> >     self._run('devtool sdk-install %s' % recipe)
> >   File "/home/projects/builds/poky-build/poky/meta/lib/oeqa/sdk/case.py=
", line 17,
> > in _run
> >     return subprocess.check_output(". %s > /dev/null; %s;" % \
> >            ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
> >   File "/usr/lib/python3.11/subprocess.py", line 466, in check_output
> >     return run(*popenargs, stdout=3DPIPE, timeout=3Dtimeout, check=3DTr=
ue,
> >            ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
> >   File "/usr/lib/python3.11/subprocess.py", line 571, in run
> >     raise CalledProcessError(retcode, process.args,
> > oeqa.utils.subprocesstweak.OETestCalledProcessError: <exception str() f=
ailed>
> >
> > Stdout:
> > Trying to install python3-maturin-native...
> > =3D=3D=3D
> >
> > See below for comment in code which I see as problematic.
> >
> > > -----Original Message-----
> > > From: openembedded-core@lists.openembedded.org <openembedded-
> > > core@lists.openembedded.org> On Behalf Of Ross Burton via
> > > lists.openembedded.org
> > > Sent: Saturday, May 10, 2025 10:44
> > > To: openembedded-core@lists.openembedded.org
> > > Subject: [OE-core] [PATCH 08/23] oeqa/sdk: add helpers to check for a=
nd install
> > > packages
> > >
> > > The existing tests simply look at the manifest to determine if a test
> > > should be ran or not based on dependencies. Whilst this works for
> > > Traditional SDKs, it fails for Extensible SDKs if they've been built =
in
> > > minimal mode, where the manifest will be empty.  However, minimal eSD=
Ks
> > > might well have available sstate to install the missing dependencies.
> > >
> > > Add a pair of helper functions to ensure that a package is available,=
 or
> > > skip the test.  This handles nativesdk- vs -native (SDK vs eSDK) and
> > > will try to sdk-install missing dependencies into an eSDK if they're =
not
> > > already installed.
> > >
> > > Signed-off-by: Ross Burton <ross.burton@arm.com>
> > > ---
> > >  meta/lib/oeqa/sdk/case.py | 58
> > > +++++++++++++++++++++++++++++++++++++++
> > >  1 file changed, 58 insertions(+)
> > >
> > > diff --git a/meta/lib/oeqa/sdk/case.py b/meta/lib/oeqa/sdk/case.py
> > > index 46a3789f572..1fd3b3b5695 100644
> > > --- a/meta/lib/oeqa/sdk/case.py
> > > +++ b/meta/lib/oeqa/sdk/case.py
> > > @@ -7,8 +7,10 @@
> > >  import os
> > >  import subprocess
> > >  import shutil
> > > +import unittest
> > >
> > >  from oeqa.core.case import OETestCase
> > > +from oeqa.sdkext.context import OESDKExtTestContext
> > >
> > >  class OESDKTestCase(OETestCase):
> > >      def _run(self, cmd):
> > > @@ -16,6 +18,62 @@ class OESDKTestCase(OETestCase):
> > >                  (self.tc.sdk_env, cmd), shell=3DTrue, executable=3D"=
/bin/bash",
> > >                  stderr=3Dsubprocess.STDOUT, universal_newlines=3DTru=
e)
> > >
> > > +    def ensure_host_package(self, *packages, recipe=3DNone):
> > > +        """
> > > +        Check that the host variation of one of the packages listed =
is available
> > > +        in the SDK (nativesdk-foo for SDK, foo-native for eSDK). The=
 package is
> > > +        a list for the case where debian-renaming may have occured, =
and the
> > > +        manifest could contain 'foo' or 'libfoo'.
> > > +
> > > +        If testing an eSDK and the package is not found, then try to=
 install the
> > > +        specified recipe to install it from sstate.
> > > +        """
> > > +
> > > +        # In a SDK the manifest is correct. In an eSDK the manifest =
may be
> > > +        # correct (type=3Dfull) or not include packages that exist i=
n sstate but
> > > +        # not installed yet (minimal) so we should try to install th=
e recipe.
> > > +        for package in packages:
> > > +            if isinstance(self.tc, OESDKExtTestContext):
> > > +                package =3D package + "-native"
> > > +            else:
> > > +                package =3D "nativesdk-" + package
> > > +
> > > +            if self.tc.hasHostPackage(package):
> > > +                break
> > > +        else:
> > > +            if isinstance(self.tc, OESDKExtTestContext):
> > > +                recipe =3D (recipe or packages[0]) + "-native"
> > > +                print("Trying to install %s..." % recipe)
> > > +                self._run('devtool sdk-install %s' % recipe)
> >
> >
> > The comment above says "try to install", however there is no check for =
failure and
> > skipping the test in such case.
> > Before using this code the testscases were skipped unconditionally and =
didn't try
> > to install anything.
> > Here it looks like it should always fail if the package is not part of =
sdk (and
> > python3-maturin is not part of minimal/sato sdk images on autobuilder).
> >
> > I'm struggling to understand how this passes autobuilder tests green an=
d my
> > pribate builds are red.
> > Autobuilder logs show that the maturin tests were skipped and python3-m=
aturin is
> > never built.
> > Do you have a hint for me how this code can skip the recipe?
> >
> > I was thinking about installing it on my host, but python3-maturin is o=
nly available
> > from Debian 13 (which is not released yet).
> >
> > Would it be fine if I submit a patch doing try/except around this line?
> > Or am I just missing something vital to understand the code and failure=
?
> >
> > > +            else:
> > > +                raise unittest.SkipTest("Test %s needs one of %s" % =
(self.id(), ",
> > > ".join(packages)))
> > > +
> > > +    def ensure_target_package(self, *packages, multilib=3DFalse, rec=
ipe=3DNone):
> > > +        """
> > > +        Check that at least one of the packages listed is available =
in the SDK,
> > > +        adding the multilib prefix if required. The target package i=
s a list for
> > > +        the case where debian-renaming may have occured, and the man=
ifest
> > could
> > > +        contain 'foo' or 'libfoo'.
> > > +
> > > +        If testing an eSDK and the package is not found, then try to=
 install the
> > > +        specified recipe to install it from sstate.
> > > +        """
> > > +
> > > +        # In a SDK the manifest is correct. In an eSDK the manifest =
may be
> > > +        # correct (type=3Dfull) or not include packages that exist i=
n sstate but
> > > +        # not installed yet (minimal) so we should try to install th=
e recipe.
> > > +        for package in packages:
> > > +            if self.tc.hasTargetPackage(package, multilib=3Dmultilib=
):
> > > +                break
> > > +        else:
> > > +            if isinstance(self.tc, OESDKExtTestContext):
> > > +                recipe =3D recipe or packages[0]
> > > +                print("Trying to install %s..." % recipe)
> > > +                self._run('devtool sdk-install %s' % recipe)
> > > +            else:
> > > +                raise unittest.SkipTest("Test %s needs one of %s" % =
(self.id(), ",
> > > ".join(packages)))
> > > +
> > > +
> > >      def fetch(self, workdir, dl_dir, url, archive=3DNone):
> > >          if not archive:
> > >              from urllib.parse import urlparse
> > > --
> > > 2.43.0
>

