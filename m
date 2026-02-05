Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 501AEEC1E88
	for <webhook@archiver.kernel.org>; Thu,  5 Feb 2026 09:51:10 +0000 (UTC)
Received: from mail-qv1-f44.google.com (mail-qv1-f44.google.com [209.85.219.44])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.17123.1770285063268255272
 for <openembedded-core@lists.openembedded.org>;
 Thu, 05 Feb 2026 01:51:03 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=RmcNQNmg;
 spf=pass (domain: gmail.com, ip: 209.85.219.44, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qv1-f44.google.com with SMTP id 6a1803df08f44-88a288811a4so8621996d6.3
        for <openembedded-core@lists.openembedded.org>; Thu, 05 Feb 2026 01:51:03 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1770285062; cv=none;
        d=google.com; s=arc-20240605;
        b=QCUhQB66BSrEMFbuB1z+bKBUabtf2RbZmut+kg/8UnI/FUndqQ2vMEDgEmFZfsZTSZ
         xz4X1KZc9jcvYYWSg0s6o7W9OkJX0/xJ/q29zZ5DaD2+34eoAmyH6hVTAEZdL1dpRWil
         BJYwui+fPp3WTr1QJh5aqqB+LCPzsMe6E8ujXBxhwjMQlQEpdt9zkdfViqGnZrjuklio
         O9nsY0ovkGaPy5pPaxRgmVS5AYnVxzeWCymXQ6u3DIRyE1ngHInP2PfWHW2aekt61UmM
         uwGOyoehcNZI88/YYCDisVUHijzq/gIrhr77phvKd04KUHJPnrpd8dUIbEBIodgiAi0l
         KGEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=o/JRClAOmK1az+E4qXW7lnFgxIOMe6aUFyGylElzZds=;
        fh=GUvEGEcNGOV3jMOSaxLlPgkLl8zb/XGrvGx7aKAQ9fA=;
        b=lo1J6Wv6LP5qYJfwSRSgrqSPLLC89SFS6G6BfdNI8Zn9x2S9TkAMJYzbZ8Ql6yA4FU
         gbZlIHM/XzfoO5FtG5CoFOD0s228CsEmEnRI3twIZir97LdRudgUCyaN1dmbiMg+E9UC
         hL3WOvLtCKRWm443KkP+3xSxj+7epA/lGMe78gl5eGHo2xQm6m3o6c2f0xQ8995zWYHR
         VJCUKqtwx+0ekz+KxTkPWTxoE+89niz+GERsHkc5WUzT4cTlDjGS88pKNATs09kOkZLZ
         Oc/HOwGeYZ70pOThljJu6/fHxC7hydSZQ/AHSoc18qjDJNu8VEeeXxn/AbyUiApB6xqF
         x3Eg==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770285062; x=1770889862; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=o/JRClAOmK1az+E4qXW7lnFgxIOMe6aUFyGylElzZds=;
        b=RmcNQNmgkZG8uatjxpGvCkggpNbAd8Pjpm2SKy++1HvUiOKMmF/KbBzMnsxNjZwv38
         aH82AuQvZQzH/z6CXCXGQyKEQ4nnqToEnfD1qQwwssOPtE3oX71y8ruC/38HlxKHTmFF
         94qUqg5o/4RYPvkWwR/dct/jKsOjjUNLrKPQkq3B5O6XrmRF37Rs/Ijf0tKWn8pIp3wt
         DIoPx9Qkl6lkQWUeg8tn3ZZnYslM0qe5Hoo76RuT2ZBdRhq/DOWzgTPoWl87nJaGu6XZ
         Cn8aeH/j6gDNzMSQYH5O2fMjLCdDOOV0E17pwmNUQl4BV1o81h7IHl3EAG2CqPAQnaxS
         fJuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770285062; x=1770889862;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=o/JRClAOmK1az+E4qXW7lnFgxIOMe6aUFyGylElzZds=;
        b=w2sqa+tKvJzZkADAK2IY1wIhZrwwyXIpnUCgBgCFiDY2SZCt2fX5EAJRELwZwv4hw7
         pJXhXw9feKTDnvog9mXU+lMJyPc3kUPt3HZUk3GJmO2bW1zVlL5ywqcmUNvmB7iVLEWF
         KNSjgkwNNWx5ud6iMPa+02tRrL6hMIiZUgfdOEUbj3KfgzBzAvDTb+JtHrKIyywDH9ob
         CG/PqHk4oTnTHp6LCIqgd4kTc4+fMi7Y5F+9kCcp1wXPYu8S5vk9YGCPvu2Z+LNYAniV
         CXEt/Xu5YYBKBgkGrXsFCbsCxKEvbaLpqgrj8k7awEWMTWKWs9Wob4hfzh4awzIez0WZ
         XP2A==
X-Gm-Message-State: AOJu0Ywf7Mz4awMoGhVLWPFV8+ppCtHrWpgI1xgn/ZSfF9zUCnw1rjDa
	pt6Ywd5T9g/N7xdTNR7fvGPfjBXZ3dKlkluRPSNQjehrINUFE1WVK5HSwUM31DiRSsgGb/UO7Jf
	9zMKmYsnEAAm2CZokg/0V7p0zFdmQKo0=
X-Gm-Gg: AZuq6aJVILbVDxqwYIOYbpQLSD9BXSJHTxAPzWiGbuGvhO6lJZYur7r9sK9w/uK2aIJ
	tz9gxO72En6qlR0XGHkSDxibVY6Bd1YcZdoGtZ118Ycmcux2uQDoAD3lbYsO15EqiGhe9oAwdq8
	yzLfoATxD9BBnG0cH1is2yiiDkedynkF5Jtue4q2WwQ46gHWVA8n6JVY7pv+wsw7erRCwYhej3U
	IN0xio4yvjYeAKfLTzG2BLs1juV3jdADVc32IIoV2XZ6UW9Q0/nWG5Lcrce6mWqO1o/SfcqqWZR
	hg2mHt5qzz7uxa4l5VAHmUcitVMr2Q==
X-Received: by 2002:a05:6214:27c2:b0:890:7e6e:df22 with SMTP id
 6a1803df08f44-895221d8482mr81814226d6.65.1770285062035; Thu, 05 Feb 2026
 01:51:02 -0800 (PST)
MIME-Version: 1.0
References: <20260129035353.8982-1-liuyd.fnst@fujitsu.com> <20260129035353.8982-7-liuyd.fnst@fujitsu.com>
 <CANNYZj9TRt0GqyafY0eD+bwuTBUb3iEeBFD16po7kxPHwQJ-Kg@mail.gmail.com>
 <TY3PR01MB1011061788269D6E4EAC2C8999B9FA@TY3PR01MB10110.jpnprd01.prod.outlook.com>
 <OS3PR01MB101063210892B4305F30BCF669B99A@OS3PR01MB10106.jpnprd01.prod.outlook.com>
In-Reply-To: <OS3PR01MB101063210892B4305F30BCF669B99A@OS3PR01MB10106.jpnprd01.prod.outlook.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Thu, 5 Feb 2026 10:50:50 +0100
X-Gm-Features: AZwV_QiIoQjRLEAyDdGZX9Ns0P4ccy_cqCfUDoVcclRCqpJB8MFdrgc4JNaW644
Message-ID: <CANNYZj8-gEgL9Vu5XhWAttKdpKO+Py7XkwRM2b-Es7OfjH7HmA@mail.gmail.com>
Subject: Re: [OE-core][PATCH 6/6] orc: Enable hotdoc to produce doc
To: "Yiding Liu (Fujitsu)" <liuyd.fnst@fujitsu.com>
Cc: "openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 05 Feb 2026 09:51:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/230569

Hello,

sorry for not saying this explicitly, as you've found other recipes
with hotdoc support, can you look into enabling it there as well?

Alex

On Thu, 5 Feb 2026 at 03:59, Yiding Liu (Fujitsu)
<liuyd.fnst@fujitsu.com> wrote:
>
> Ping
> ________________________________
> =E5=8F=91=E4=BB=B6=E4=BA=BA: Liu, Yiding/=E5=88=98 =E4=B9=99=E4=B8=81 <li=
uyd.fnst@fujitsu.com>
> =E5=8F=91=E9=80=81=E6=97=B6=E9=97=B4: 2026=E5=B9=B41=E6=9C=8830=E6=97=A5 =
10:19
> =E6=94=B6=E4=BB=B6=E4=BA=BA: Alexander Kanavin <alex.kanavin@gmail.com>
> =E6=8A=84=E9=80=81: openembedded-core@lists.openembedded.org <openembedde=
d-core@lists.openembedded.org>
> =E4=B8=BB=E9=A2=98: =E5=9B=9E=E5=A4=8D: [OE-core][PATCH 6/6] orc: Enable =
hotdoc to produce doc
>
> Hi Alex
>
>      I search the changelog in git log, and found that besides orc, gstre=
amer1.0-vaapi,  gstreamer1.0-plugins-base and gstreamer1.0 used hotdoc in n=
ew version.
>
> Liu
> ________________________________
> =E5=8F=91=E4=BB=B6=E4=BA=BA: Alexander Kanavin <alex.kanavin@gmail.com>
> =E5=8F=91=E9=80=81=E6=97=B6=E9=97=B4: 2026=E5=B9=B41=E6=9C=8829=E6=97=A5 =
19:26
> =E6=94=B6=E4=BB=B6=E4=BA=BA: Liu, Yiding/=E5=88=98 =E4=B9=99=E4=B8=81 <li=
uyd.fnst@fujitsu.com>
> =E6=8A=84=E9=80=81: openembedded-core@lists.openembedded.org <openembedde=
d-core@lists.openembedded.org>
> =E4=B8=BB=E9=A2=98: Re: [OE-core][PATCH 6/6] orc: Enable hotdoc to produc=
e doc
>
> Thanks for looking into this. Are there other recipes in oe-core that
> have hotdoc support? You can perhaps unpack everything (without
> building it), and then grep in WORKDIR for hotdoc.
>
> If there's just orc, we could probably add hotdoc to meta-openembedded fi=
rst.
>
> The pending patch needs to be submitted upstream.
>
> Alex
>
> On Thu, 29 Jan 2026 at 04:54, Yiding Liu (Fujitsu) via
> lists.openembedded.org <liuyd.fnst=3Dfujitsu.com@lists.openembedded.org>
> wrote:
> >
> > Signed-off-by: Liu Yiding <liuyd.fnst@fujitsu.com>
> > ---
> >  .../orc/orc/0001-Fix-hotdoc-run-error.patch   | 37 +++++++++++++++++++
> >  meta/recipes-devtools/orc/orc_0.4.42.bb       |  5 ++-
> >  2 files changed, 41 insertions(+), 1 deletion(-)
> >  create mode 100644 meta/recipes-devtools/orc/orc/0001-Fix-hotdoc-run-e=
rror.patch
> >
> > diff --git a/meta/recipes-devtools/orc/orc/0001-Fix-hotdoc-run-error.pa=
tch b/meta/recipes-devtools/orc/orc/0001-Fix-hotdoc-run-error.patch
> > new file mode 100644
> > index 0000000000..277ce038f8
> > --- /dev/null
> > +++ b/meta/recipes-devtools/orc/orc/0001-Fix-hotdoc-run-error.patch
> > @@ -0,0 +1,36 @@
> > +Subject: [PATCH] Fix hotdoc run error.
> > +
> > +Fix the following error.
> > +| Running custom install script 'tmp/work/x86-64-v3-poky-linux/orc/0.4=
.42/recipe-sysroot-native/usr/bin/meson.real --internal hotdoc --install or=
c-doc/html --docdir /usr/share/doc/orc/html --name orc --builddir tmp/work/=
x86-64-v3-poky-linux/orc/0.4.42/build/doc tmp/work/x86-64-v3-poky-linux/orc=
/0.4.42/recipe-sysroot-native/usr/bin/hotdoc run --conf-file orc-doc.json'
> > +| --- stdout ---
> > +|
> > +| --- stderr ---
> > +| ERROR: [doc-tree]: (index-extension-not-found): tmp/work/x86-64-v3-p=
oky-linux/orc/0.4.42/sources/orc-0.4.42/doc/sitemap.txt:8:10: No extension =
named c for index page
> > +| 00006:                tutorial.md
> > +| 00007:                opcodes.md
> > +| 00008:        c-index
> > +|               ^
> > +| 00009:
> > +|
> > +
> > +Remove c-index as it is not in the doc directory.
> > +
> > +Upstream-Status: Pending
> > +
> > +Signed-off-by: Liu Yiding <liuyd.fnst@fujitsu.com>
> > +---
> > + doc/sitemap.txt | 1 -
> > + 1 file changed, 1 deletion(-)
> > +
> > +diff --git a/doc/sitemap.txt b/doc/sitemap.txt
> > +index 568b367..40a7f99 100644
> > +--- a/doc/sitemap.txt
> > ++++ b/doc/sitemap.txt
> > +@@ -5,4 +5,3 @@ index.md
> > +               concepts.md
> > +               tutorial.md
> > +               opcodes.md
> > +-      c-index
> > +--
> > +2.43.0
> > +
> > diff --git a/meta/recipes-devtools/orc/orc_0.4.42.bb b/meta/recipes-dev=
tools/orc/orc_0.4.42.bb
> > index f56b9058c2..b73c8df04d 100644
> > --- a/meta/recipes-devtools/orc/orc_0.4.42.bb
> > +++ b/meta/recipes-devtools/orc/orc_0.4.42.bb
> > @@ -4,11 +4,14 @@ DESCRIPTION =3D "Optimised Inner Loop Runtime Compile=
r is a Library and set of too
> >  LICENSE =3D "BSD-2-Clause & BSD-3-Clause"
> >  LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D1400bd9d09e8af56b9ec982b3d8=
5797e"
> >
> > -SRC_URI =3D "http://gstreamer.freedesktop.org/src/orc/orc-${PV}.tar.xz=
"
> > +SRC_URI =3D "http://gstreamer.freedesktop.org/src/orc/orc-${PV}.tar.xz=
 \
> > +           file://0001-Fix-hotdoc-run-error.patch \
> > +          "
> >  SRC_URI[sha256sum] =3D "7ec912ab59af3cc97874c456a56a8ae1eec520c385ec44=
7e8a102b2bd122c90c"
> >
> >  inherit meson pkgconfig
> >
> > +DEPENDS =3D "hotdoc-native"
> >  # distinguish from apache:orc
> >  CVE_PRODUCT =3D "gstreamer:orc"
> >
> > --
> > 2.43.0
> >
> >
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#230118): https://lists.openembedded.org/g/openembed=
ded-core/message/230118
> > Mute This Topic: https://lists.openembedded.org/mt/117521454/1686489
> > Group Owner: openembedded-core+owner@lists.openembedded.org
> > Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [=
alex.kanavin@gmail.com]
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >

