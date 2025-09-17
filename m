Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D9743CAC599
	for <webhook@archiver.kernel.org>; Wed, 17 Sep 2025 15:10:53 +0000 (UTC)
Received: from mail-yw1-f178.google.com (mail-yw1-f178.google.com [209.85.128.178])
 by mx.groups.io with SMTP id smtpd.web10.26012.1758121850155684257
 for <openembedded-core@lists.openembedded.org>;
 Wed, 17 Sep 2025 08:10:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Rf6Y6G6e;
 spf=pass (domain: gmail.com, ip: 209.85.128.178, mailfrom: raj.khem@gmail.com)
Received: by mail-yw1-f178.google.com with SMTP id 00721157ae682-72ce9790acdso59334777b3.0
        for <openembedded-core@lists.openembedded.org>; Wed, 17 Sep 2025 08:10:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758121849; x=1758726649; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=0zdZO3/gQIIdIIPxJgK7kFyXVqYgwwoKZo9yHaU+jPQ=;
        b=Rf6Y6G6eNpTdpFlhqgOQGLW2Et9VqqVBI9UrtuA9gSo/H8b21CzYdIHNa/OQ83wbyZ
         PnBZ/2SZBaKZBOHDelsmMskXDTv4cKI0wk6wcWZY4ATm95sE+l0jwmVl/iWibXZGnKsU
         fCclP+TbamCjZEFVaG73Yb+RDJ6gZDAZok2p+phtbRHwbas8sEqcNti+dXd7ldLRWitP
         C49QkWWKqJq9u6NTHoCqjP5uPAHY5bzdAi40V4B9fRHnfuGzqb0G+bs/jOVyhQz2H/fp
         KAqSzsDHi621XV+hum2kA1oHj8aAK15BKRbfeuGBtbtv+wZ/JCyRtSokwk5Mkl/ewhoI
         AHeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758121849; x=1758726649;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0zdZO3/gQIIdIIPxJgK7kFyXVqYgwwoKZo9yHaU+jPQ=;
        b=Y2h/8PxgnbGoOBDVdyp4ihNPL7YcAQZicSqaHINeOLFs4bc9ekqT13fxPGLve0RdVo
         B8KpRjxCUl9LO1/9Dg0PS+KTvguIic15OaLn/zHgzfDUB2vBstuDqFThdDlgEILId3LR
         pKR0KWYC+K2UwCyzdmgSGA7Hhtfpwu53BOloXnD9iIRnuILhOr+eLFr2LrviXC86yVRn
         smfUuKMRMvg9TBEpQ64+8kFL68ihDfm4n7ICybKqOD04y50zO8jhYS+1HXhwLB+liekj
         83DjLxn+rjvZDMbKQg3gqEF2aIisk1knDtyvVzrzdMCJcTLkCjefuiQlLwf4qRtH45QF
         bmwQ==
X-Forwarded-Encrypted: i=1; AJvYcCW9Ks6sq5zZtjdtxao0o8v5i+WX6SKqZhqZWpmvn0GDNbOJqv6br8AsUzHh5lSxaTofP0Cqc9FyAlMaRwtEWgNcfA==@lists.openembedded.org
X-Gm-Message-State: AOJu0YyRCIO5PcpyDZ95rHm30wMGtWFVcfKPZiIjQ1+OTDuM2u/uAuCH
	7hz0dL0pOkhxoHT9Ns+q/E0POQHFM8OxCYrB7N+U819PXY5ew+5d+F4oViiFhin7ouqsjSpQzDk
	Px7rlUIdPGI0LrQyEQGQA4OAhu37z/EI=
X-Gm-Gg: ASbGncvTGx4g6EqKkTga+7O4PIGvBNRYtNu+h4UOoveVmmukqOdakp+LT8SDd0iuNnD
	htwftVVEeiO0CAfonhQMBew01OIqfnhgostG9BRrvUsgniWUgDJ11JnV9smQTkLUS2VGjXBqspo
	XBswXBfmZxBdhkaJBxIYuApjhM+FtpPIJTPOJj5JWv1TOIZUZBCLTHGZFIheZOpf8Derv4cHrYA
	A7hhzQtdvhebvhV5xQHzZkcg4L6ehqldapdq8fijwpxgw+X1ObwS6atHe7BCevZrtnjeZO7vDbT
	16Hcl5iYNe6JbdYqgeVm58OrSeX1KR3IM+gBa+BS5z1G20OzAJsRfTK6VFfjxb06qXQE
X-Google-Smtp-Source: AGHT+IHMyJTnzavamGO5YLBBdRUMHtnTpgPzhBELAAqDZxC44z6+TEp3LN4z5AwR4ffE8qABLR5Y5qLHIYqzqpGBctI=
X-Received: by 2002:a05:690c:6a89:b0:71f:f24f:ccd9 with SMTP id
 00721157ae682-738921618b8mr25433527b3.36.1758121848874; Wed, 17 Sep 2025
 08:10:48 -0700 (PDT)
MIME-Version: 1.0
References: <20250911085123.1551425-1-alex.kanavin@gmail.com>
 <20250911085123.1551425-15-alex.kanavin@gmail.com> <P12O2T.G9TC7LOZ6AEG@t-online.de>
 <CAMKF1sokUU3n1uDAXTD8ebxFTsSVmZX-4B9iSB1mFQ+3vp7K=Q@mail.gmail.com>
 <CANNYZj994mKx9TLP+1uYf3YDK1ArbkzAJHtyrERhYX5NFT-=EA@mail.gmail.com>
 <18661636B9C9FA43.26272@lists.openembedded.org> <18661644E619375D.26272@lists.openembedded.org>
 <bf58632b-e6b1-48a0-a598-07db4184204a@gmail.com>
In-Reply-To: <bf58632b-e6b1-48a0-a598-07db4184204a@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 17 Sep 2025 08:10:37 -0700
X-Gm-Features: AS18NWB1PZumdBP99yJolFl9Rn9mmRoQgT5Utjo0EOJQAXhv3rK1xl3sK3b1sfc
Message-ID: <CAMKF1spkFDgxHRBgO7Mph9NPqerRSd1FeJjpTY2wiTZwwEj6qw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 15/16] xkeyboard-config: update 2.44 -> 2.45
To: =?UTF-8?B?QsO2c3rDtnJtw6lueWkgWm9sdMOhbg==?= <zboszor@gmail.com>
Cc: alex.kanavin@gmail.com, f_l_k@t-online.de, 
	openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000462a03063f00a4a2"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 17 Sep 2025 15:10:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/223612

--000000000000462a03063f00a4a2
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 17, 2025 at 6:57=E2=80=AFAM B=C3=B6sz=C3=B6rm=C3=A9nyi Zolt=C3=
=A1n <zboszor@gmail.com>
wrote:

> 2025. 09. 17. 15:53 keltez=C3=A9ssel, Zoltan Boszormenyi via
> lists.openembedded.org =C3=ADrta:
> > 2025. 09. 17. 15:52 keltez=C3=A9ssel, Zoltan Boszormenyi via
> lists.openembedded.org =C3=ADrta:
> >> It's not transient. It happens if I try to build xkeyboard-config-nati=
ve
> >> after -c cleanall. Wasn't there a way/bbappend to turn absolute symlin=
ks
> >
> > Sorry, I meant bbclass.
>
> I found it. Adding inherit relative_symlinks to the recipe fixes it.
>


Thanks for digging. Send a patch please


> >
> >> to relative ones under ${WORKDIR}/image?
> >>
> >> 2025. 09. 16. 10:46 keltez=C3=A9ssel, Alexander Kanavin via
> lists.openembedded.org =C3=ADrta:
> >>> I think these are both transient issues that happen when build
> >>> directory is reused between the old and the new version. Not
> >>> xkeyboard-config fault per se, it just rearranges the install set in =
a
> >>> way that triggers a bug somewhere in oe-core :-/
> >>>
> >>> Alex
> >>>
> >>> On Tue, 16 Sept 2025 at 07:43, Khem Raj <raj.khem@gmail.com> wrote:
> >>>> I am seeing a build failure for xkeyboard-config-native
> >>>>
> >>>> ERROR: xkeyboard-config-native-2.45-r0 do_populate_sysroot: sstate
> >>>> found an absolute path symlink
> >>>>
> /mnt/stash/tmp/work/x86_64-linux/xkeyboard-config-native/2.45/sysroot-des=
tdir/mnt/stash/tmp/work/x86_64-linux/xkeyboard-config-native/2.45/recipe-sy=
sroot-native/usr/share/X11/xkb
>
> >>>>
> >>>> pointing at
> >>>>
> /mnt/stash/tmp/work/x86_64-linux/xkeyboard-config-native/2.45/recipe-sysr=
oot-native/usr/share/xkeyboard-config-2.
> >>>> Please replace this with a relative link.
> >>>> ERROR: xkeyboard-config-native-2.45-r0 do_populate_sysroot: Failing
> >>>> task due to absolute path symlinks
> >>>> ERROR: Logfile of failure stored in:
> >>>>
> /mnt/stash/tmp/work/x86_64-linux/xkeyboard-config-native/2.45/temp/log.do=
_populate_sysroot.726640
>
> >>>>
> >>>> NOTE: recipe xkeyboard-config-native-2.45-r0: task
> do_populate_sysroot: Failed
> >>>> ERROR: Task
> >>>>
> (virtual:native:/mnt/jenkins/workspace/Yocto-world-arm/sources/poky/meta/=
recipes-graphics/xorg-lib/xkeyboard-config_2.45.bb:
> do_populate_sysroot)
> >>>> failed with exit code '1'
> >>>>
> >>>> On Mon, Sep 15, 2025 at 10:32=E2=80=AFPM Markus Volk via
> >>>> lists.openembedded.org <f_l_k=3Dt-online.de@lists.openembedded.org>
> >>>> wrote:
> >>>>> I'm seeing issues with symlink creation:
> >>>>> | Installing symlink pointing to xkeyboard-config-2.pc to
> >>>>>
> /home/flk/poky/build/tmp/work/corei7-64-poky-linux/xkeyboard-config/2.45/=
image/usr/share/pkgconfig/xkeyboard-config.pc
>
> >>>>>
> >>>>> | Installing symlink pointing to base to
> >>>>>
> /home/flk/poky/build/tmp/work/corei7-64-poky-linux/xkeyboard-config/2.45/=
image/usr/share/xkeyboard-config-2/rules/xorg
> >>>>> | Installing symlink pointing to base.lst to
> >>>>>
> /home/flk/poky/build/tmp/work/corei7-64-poky-linux/xkeyboard-config/2.45/=
image/usr/share/xkeyboard-config-2/rules/xorg.lst
> >>>>> | Installing symlink pointing to base.xml to
> >>>>>
> /home/flk/poky/build/tmp/work/corei7-64-poky-linux/xkeyboard-config/2.45/=
image/usr/share/xkeyboard-config-2/rules/xorg.xml
> >>>>> | Installing symlink pointing to xkeyboard-config-2.7 to
> >>>>>
> /home/flk/poky/build/tmp/work/corei7-64-poky-linux/xkeyboard-config/2.45/=
image/usr/share/man/man7/xkeyboard-config.7
> >>>>> | Installing symlink pointing to /usr/share/xkeyboard-config-2 to
> >>>>>
> /home/flk/poky/build/tmp/work/corei7-64-poky-linux/xkeyboard-config/2.45/=
image/usr/share/X11/xkb
> >>>>> | ln: failed to create symbolic link
> >>>>>
> '/home/flk/poky/build/tmp/work/corei7-64-poky-linux/xkeyboard-config/2.45=
/image/usr/share/X11/xkb/symbols/en':
>
> >>>>> No such file or directory
> >>>>>
> >>>>> On Thu, Sep 11 2025 at 10:51:22 +02:00:00, Alexander Kanavin via
> >>>>> lists.openembedded.org <alex.kanavin=3D
> gmail.com@lists.openembedded.org> wrote:
> >>>>>
> >>>>> From: Alexander Kanavin <alex@linutronix.de> License-update:
> disclaimer and
> >>>>> copyright clarifications per
> >>>>>
> https://gitlab.freedesktop.org/xkeyboard-config/xkeyboard-config/-/merge_=
requests/821
> >>>>> Replace manual symlink creation with a meson option. Drop no-op
> autoconf options.
> >>>>> Adjust packaging as this is where upstream installs now.
> Signed-off-by: Alexander
> >>>>> Kanavin <alex@linutronix.de> --- ...oard-config_2.44.bb =3D>
> xkeyboard-config_2.45.bb}
> >>>>> | 13 ++++--------- 1 file changed, 4 insertions(+), 9 deletions(-)
> rename
> >>>>> meta/recipes-graphics/xorg-lib/{xkeyboard-config_2.44.bb =3D>
> >>>>> xkeyboard-config_2.45.bb} (65%) diff --git
> >>>>> a/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.44.bb
> >>>>> b/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.45.bb
> similarity index 65%
> >>>>> rename from meta/recipes-graphics/xorg-lib/xkeyboard-config_2.44.bb
> rename to
> >>>>> meta/recipes-graphics/xorg-lib/xkeyboard-config_2.45.bb index
> >>>>> 52d074fd5ed..857ccc75160 100644 ---
> >>>>> a/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.44.bb +++
> >>>>> b/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.45.bb @@ -10,23
> +10,18 @@
> >>>>> HOMEPAGE =3D "http://freedesktop.org/wiki/Software/XKeyboardConfig"
> BUGTRACKER =3D
> >>>>> "https://bugs.freedesktop.org/enter_bug.cgi?product=3Dxkeyboard-con=
fig"
> LICENSE =3D "MIT
> >>>>> & MIT" -LIC_FILES_CHKSUM =3D
> "file://COPYING;md5=3D8fc8ae699974c360e2e2e883a63ce264"
> >>>>> +LIC_FILES_CHKSUM =3D
> "file://COPYING;md5=3Dfaa756e04053029ddc602caf99e5ef1d" SRC_URI =3D
> >>>>>
> "${XORG_MIRROR}/individual/data/xkeyboard-config/${BPN}-${PV}.tar.xz"
> >>>>> -SRC_URI[sha256sum] =3D
> >>>>> "54d2c33eeebb031d48fa590c543e54c9bcbd0f00386ebc6489b2f47a0da4342a"
> >>>>> +SRC_URI[sha256sum] =3D
> >>>>> "169e075a92d957a57787c199e84e359df2931b7196c1c5b4a3d576ee6235a87c"
> SECTION =3D
> >>>>> "x11/libs" DEPENDS =3D "util-macros libxslt-native" -EXTRA_OECONF =
=3D
> >>>>> "--with-xkb-rules-symlink=3Dxorg --disable-runtime-deps" -
> -FILES:${PN} +=3D
> >>>>> "${datadir}/X11/xkb" +FILES:${PN} +=3D "${datadir}/X11/xkb
> >>>>> ${datadir}/xkeyboard-config-2" inherit meson pkgconfig gettext
> python3native
> >>>>> -do_install:append () { - install -d ${D}${datadir}/X11/xkb/compile=
d
> - cd
> >>>>> ${D}${datadir}/X11/xkb/rules && ln -sf base xorg -} +EXTRA_OEMESON
> +=3D
> >>>>> "-Dxorg-rules-symlinks=3Dtrue" BBCLASSEXTEND +=3D "native"
> >>>>> --
> >>>>> 2.39.5
> >>>>>
> >>>>>
> >>>>>
> >>>>>
> >>>>>
> >>>>>
> >>>>>
> >>
> >>
> >>
> >>
> >
> >
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#223606):
> https://lists.openembedded.org/g/openembedded-core/message/223606
> > Mute This Topic: https://lists.openembedded.org/mt/115184776/3617728
> > Group Owner: openembedded-core+owner@lists.openembedded.org
> > Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> zboszor@gmail.com]
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >
>
>

--000000000000462a03063f00a4a2
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><br></div><div><br><div class=3D"gmail_quote gmail_quote_container"><d=
iv dir=3D"ltr" class=3D"gmail_attr">On Wed, Sep 17, 2025 at 6:57=E2=80=AFAM=
 B=C3=B6sz=C3=B6rm=C3=A9nyi Zolt=C3=A1n &lt;<a href=3D"mailto:zboszor@gmail=
.com">zboszor@gmail.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_=
quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1=
ex">2025. 09. 17. 15:53 keltez=C3=A9ssel, Zoltan Boszormenyi via <a href=3D=
"http://lists.openembedded.org" rel=3D"noreferrer" target=3D"_blank">lists.=
openembedded.org</a> =C3=ADrta:<br>
&gt; 2025. 09. 17. 15:52 keltez=C3=A9ssel, Zoltan Boszormenyi via <a href=
=3D"http://lists.openembedded.org" rel=3D"noreferrer" target=3D"_blank">lis=
ts.openembedded.org</a> =C3=ADrta:<br>
&gt;&gt; It&#39;s not transient. It happens if I try to build xkeyboard-con=
fig-native<br>
&gt;&gt; after -c cleanall. Wasn&#39;t there a way/bbappend to turn absolut=
e symlinks<br>
&gt;<br>
&gt; Sorry, I meant bbclass.<br>
<br>
I found it. Adding inherit relative_symlinks to the recipe fixes it.<br>
</blockquote><div dir=3D"auto"><br></div><div dir=3D"auto"><br></div><div d=
ir=3D"auto">Thanks for digging. Send a patch please</div><div dir=3D"auto">=
<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;bord=
er-left:1px #ccc solid;padding-left:1ex"><br>
&gt;<br>
&gt;&gt; to relative ones under ${WORKDIR}/image?<br>
&gt;&gt;<br>
&gt;&gt; 2025. 09. 16. 10:46 keltez=C3=A9ssel, Alexander Kanavin via <a hre=
f=3D"http://lists.openembedded.org" rel=3D"noreferrer" target=3D"_blank">li=
sts.openembedded.org</a> =C3=ADrta:<br>
&gt;&gt;&gt; I think these are both transient issues that happen when build=
<br>
&gt;&gt;&gt; directory is reused between the old and the new version. Not<b=
r>
&gt;&gt;&gt; xkeyboard-config fault per se, it just rearranges the install =
set in a<br>
&gt;&gt;&gt; way that triggers a bug somewhere in oe-core :-/<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; Alex<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; On Tue, 16 Sept 2025 at 07:43, Khem Raj &lt;<a href=3D"mailto:=
raj.khem@gmail.com" target=3D"_blank">raj.khem@gmail.com</a>&gt; wrote:<br>
&gt;&gt;&gt;&gt; I am seeing a build failure for xkeyboard-config-native<br=
>
&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt; ERROR: xkeyboard-config-native-2.45-r0 do_populate_sysroot=
: sstate<br>
&gt;&gt;&gt;&gt; found an absolute path symlink<br>
&gt;&gt;&gt;&gt; /mnt/stash/tmp/work/x86_64-linux/xkeyboard-config-native/2=
.45/sysroot-destdir/mnt/stash/tmp/work/x86_64-linux/xkeyboard-config-native=
/2.45/recipe-sysroot-native/usr/share/X11/xkb <br>
&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt; pointing at <br>
&gt;&gt;&gt;&gt; /mnt/stash/tmp/work/x86_64-linux/xkeyboard-config-native/2=
.45/recipe-sysroot-native/usr/share/xkeyboard-config-2.<br>
&gt;&gt;&gt;&gt; Please replace this with a relative link.<br>
&gt;&gt;&gt;&gt; ERROR: xkeyboard-config-native-2.45-r0 do_populate_sysroot=
: Failing<br>
&gt;&gt;&gt;&gt; task due to absolute path symlinks<br>
&gt;&gt;&gt;&gt; ERROR: Logfile of failure stored in:<br>
&gt;&gt;&gt;&gt; /mnt/stash/tmp/work/x86_64-linux/xkeyboard-config-native/2=
.45/temp/log.do_populate_sysroot.726640 <br>
&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt; NOTE: recipe xkeyboard-config-native-2.45-r0: task do_popu=
late_sysroot: Failed<br>
&gt;&gt;&gt;&gt; ERROR: Task <br>
&gt;&gt;&gt;&gt; (virtual:native:/mnt/jenkins/workspace/Yocto-world-arm/sou=
rces/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.45.bb:do_popula=
te_sysroot)<br>
&gt;&gt;&gt;&gt; failed with exit code &#39;1&#39;<br>
&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt; On Mon, Sep 15, 2025 at 10:32=E2=80=AFPM Markus Volk via<b=
r>
&gt;&gt;&gt;&gt; <a href=3D"http://lists.openembedded.org" rel=3D"noreferre=
r" target=3D"_blank">lists.openembedded.org</a> &lt;f_l_k=3D<a href=3D"mail=
to:t-online.de@lists.openembedded.org" target=3D"_blank">t-online.de@lists.=
openembedded.org</a>&gt;<br>
&gt;&gt;&gt;&gt; wrote:<br>
&gt;&gt;&gt;&gt;&gt; I&#39;m seeing issues with symlink creation:<br>
&gt;&gt;&gt;&gt;&gt; | Installing symlink pointing to xkeyboard-config-2.pc=
 to <br>
&gt;&gt;&gt;&gt;&gt; /home/flk/poky/build/tmp/work/corei7-64-poky-linux/xke=
yboard-config/2.45/image/usr/share/pkgconfig/xkeyboard-config.pc <br>
&gt;&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;&gt; | Installing symlink pointing to base to <br>
&gt;&gt;&gt;&gt;&gt; /home/flk/poky/build/tmp/work/corei7-64-poky-linux/xke=
yboard-config/2.45/image/usr/share/xkeyboard-config-2/rules/xorg<br>
&gt;&gt;&gt;&gt;&gt; | Installing symlink pointing to base.lst to <br>
&gt;&gt;&gt;&gt;&gt; /home/flk/poky/build/tmp/work/corei7-64-poky-linux/xke=
yboard-config/2.45/image/usr/share/xkeyboard-config-2/rules/xorg.lst<br>
&gt;&gt;&gt;&gt;&gt; | Installing symlink pointing to base.xml to <br>
&gt;&gt;&gt;&gt;&gt; /home/flk/poky/build/tmp/work/corei7-64-poky-linux/xke=
yboard-config/2.45/image/usr/share/xkeyboard-config-2/rules/xorg.xml<br>
&gt;&gt;&gt;&gt;&gt; | Installing symlink pointing to xkeyboard-config-2.7 =
to <br>
&gt;&gt;&gt;&gt;&gt; /home/flk/poky/build/tmp/work/corei7-64-poky-linux/xke=
yboard-config/2.45/image/usr/share/man/man7/xkeyboard-config.7<br>
&gt;&gt;&gt;&gt;&gt; | Installing symlink pointing to /usr/share/xkeyboard-=
config-2 to <br>
&gt;&gt;&gt;&gt;&gt; /home/flk/poky/build/tmp/work/corei7-64-poky-linux/xke=
yboard-config/2.45/image/usr/share/X11/xkb<br>
&gt;&gt;&gt;&gt;&gt; | ln: failed to create symbolic link <br>
&gt;&gt;&gt;&gt;&gt; &#39;/home/flk/poky/build/tmp/work/corei7-64-poky-linu=
x/xkeyboard-config/2.45/image/usr/share/X11/xkb/symbols/en&#39;: <br>
&gt;&gt;&gt;&gt;&gt; No such file or directory<br>
&gt;&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;&gt; On Thu, Sep 11 2025 at 10:51:22 +02:00:00, Alexander K=
anavin via <br>
&gt;&gt;&gt;&gt;&gt; <a href=3D"http://lists.openembedded.org" rel=3D"noref=
errer" target=3D"_blank">lists.openembedded.org</a> &lt;alex.kanavin=3D<a h=
ref=3D"mailto:gmail.com@lists.openembedded.org" target=3D"_blank">gmail.com=
@lists.openembedded.org</a>&gt; wrote:<br>
&gt;&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;&gt; From: Alexander Kanavin &lt;<a href=3D"mailto:alex@lin=
utronix.de" target=3D"_blank">alex@linutronix.de</a>&gt; License-update: di=
sclaimer and <br>
&gt;&gt;&gt;&gt;&gt; copyright clarifications per <br>
&gt;&gt;&gt;&gt;&gt; <a href=3D"https://gitlab.freedesktop.org/xkeyboard-co=
nfig/xkeyboard-config/-/merge_requests/821" rel=3D"noreferrer" target=3D"_b=
lank">https://gitlab.freedesktop.org/xkeyboard-config/xkeyboard-config/-/me=
rge_requests/821</a> <br>
&gt;&gt;&gt;&gt;&gt; Replace manual symlink creation with a meson option. D=
rop no-op autoconf options. <br>
&gt;&gt;&gt;&gt;&gt; Adjust packaging as this is where upstream installs no=
w. Signed-off-by: Alexander <br>
&gt;&gt;&gt;&gt;&gt; Kanavin &lt;<a href=3D"mailto:alex@linutronix.de" targ=
et=3D"_blank">alex@linutronix.de</a>&gt; --- ...<a href=3D"http://oard-conf=
ig_2.44.bb" rel=3D"noreferrer" target=3D"_blank">oard-config_2.44.bb</a> =
=3D&gt; <a href=3D"http://xkeyboard-config_2.45.bb" rel=3D"noreferrer" targ=
et=3D"_blank">xkeyboard-config_2.45.bb</a>} <br>
&gt;&gt;&gt;&gt;&gt; | 13 ++++--------- 1 file changed, 4 insertions(+), 9 =
deletions(-) rename <br>
&gt;&gt;&gt;&gt;&gt; meta/recipes-graphics/xorg-lib/{<a href=3D"http://xkey=
board-config_2.44.bb" rel=3D"noreferrer" target=3D"_blank">xkeyboard-config=
_2.44.bb</a> =3D&gt; <br>
&gt;&gt;&gt;&gt;&gt; <a href=3D"http://xkeyboard-config_2.45.bb" rel=3D"nor=
eferrer" target=3D"_blank">xkeyboard-config_2.45.bb</a>} (65%) diff --git <=
br>
&gt;&gt;&gt;&gt;&gt; a/meta/recipes-graphics/xorg-lib/<a href=3D"http://xke=
yboard-config_2.44.bb" rel=3D"noreferrer" target=3D"_blank">xkeyboard-confi=
g_2.44.bb</a> <br>
&gt;&gt;&gt;&gt;&gt; b/meta/recipes-graphics/xorg-lib/<a href=3D"http://xke=
yboard-config_2.45.bb" rel=3D"noreferrer" target=3D"_blank">xkeyboard-confi=
g_2.45.bb</a> similarity index 65% <br>
&gt;&gt;&gt;&gt;&gt; rename from meta/recipes-graphics/xorg-lib/<a href=3D"=
http://xkeyboard-config_2.44.bb" rel=3D"noreferrer" target=3D"_blank">xkeyb=
oard-config_2.44.bb</a> rename to <br>
&gt;&gt;&gt;&gt;&gt; meta/recipes-graphics/xorg-lib/<a href=3D"http://xkeyb=
oard-config_2.45.bb" rel=3D"noreferrer" target=3D"_blank">xkeyboard-config_=
2.45.bb</a> index <br>
&gt;&gt;&gt;&gt;&gt; 52d074fd5ed..857ccc75160 100644 --- <br>
&gt;&gt;&gt;&gt;&gt; a/meta/recipes-graphics/xorg-lib/<a href=3D"http://xke=
yboard-config_2.44.bb" rel=3D"noreferrer" target=3D"_blank">xkeyboard-confi=
g_2.44.bb</a> +++ <br>
&gt;&gt;&gt;&gt;&gt; b/meta/recipes-graphics/xorg-lib/<a href=3D"http://xke=
yboard-config_2.45.bb" rel=3D"noreferrer" target=3D"_blank">xkeyboard-confi=
g_2.45.bb</a> @@ -10,23 +10,18 @@ <br>
&gt;&gt;&gt;&gt;&gt; HOMEPAGE =3D &quot;<a href=3D"http://freedesktop.org/w=
iki/Software/XKeyboardConfig" rel=3D"noreferrer" target=3D"_blank">http://f=
reedesktop.org/wiki/Software/XKeyboardConfig</a>&quot; BUGTRACKER =3D <br>
&gt;&gt;&gt;&gt;&gt; &quot;<a href=3D"https://bugs.freedesktop.org/enter_bu=
g.cgi?product=3Dxkeyboard-config" rel=3D"noreferrer" target=3D"_blank">http=
s://bugs.freedesktop.org/enter_bug.cgi?product=3Dxkeyboard-config</a>&quot;=
 LICENSE =3D &quot;MIT <br>
&gt;&gt;&gt;&gt;&gt; &amp; MIT&quot; -LIC_FILES_CHKSUM =3D &quot;file://COP=
YING;md5=3D8fc8ae699974c360e2e2e883a63ce264&quot; <br>
&gt;&gt;&gt;&gt;&gt; +LIC_FILES_CHKSUM =3D &quot;file://COPYING;md5=3Dfaa75=
6e04053029ddc602caf99e5ef1d&quot; SRC_URI =3D <br>
&gt;&gt;&gt;&gt;&gt; &quot;${XORG_MIRROR}/individual/data/xkeyboard-config/=
${BPN}-${PV}.tar.xz&quot; <br>
&gt;&gt;&gt;&gt;&gt; -SRC_URI[sha256sum] =3D <br>
&gt;&gt;&gt;&gt;&gt; &quot;54d2c33eeebb031d48fa590c543e54c9bcbd0f00386ebc64=
89b2f47a0da4342a&quot; <br>
&gt;&gt;&gt;&gt;&gt; +SRC_URI[sha256sum] =3D <br>
&gt;&gt;&gt;&gt;&gt; &quot;169e075a92d957a57787c199e84e359df2931b7196c1c5b4=
a3d576ee6235a87c&quot; SECTION =3D <br>
&gt;&gt;&gt;&gt;&gt; &quot;x11/libs&quot; DEPENDS =3D &quot;util-macros lib=
xslt-native&quot; -EXTRA_OECONF =3D <br>
&gt;&gt;&gt;&gt;&gt; &quot;--with-xkb-rules-symlink=3Dxorg --disable-runtim=
e-deps&quot; - -FILES:${PN} +=3D <br>
&gt;&gt;&gt;&gt;&gt; &quot;${datadir}/X11/xkb&quot; +FILES:${PN} +=3D &quot=
;${datadir}/X11/xkb <br>
&gt;&gt;&gt;&gt;&gt; ${datadir}/xkeyboard-config-2&quot; inherit meson pkgc=
onfig gettext python3native <br>
&gt;&gt;&gt;&gt;&gt; -do_install:append () { - install -d ${D}${datadir}/X1=
1/xkb/compiled - cd <br>
&gt;&gt;&gt;&gt;&gt; ${D}${datadir}/X11/xkb/rules &amp;&amp; ln -sf base xo=
rg -} +EXTRA_OEMESON +=3D <br>
&gt;&gt;&gt;&gt;&gt; &quot;-Dxorg-rules-symlinks=3Dtrue&quot; BBCLASSEXTEND=
 +=3D &quot;native&quot;<br>
&gt;&gt;&gt;&gt;&gt; -- <br>
&gt;&gt;&gt;&gt;&gt; 2.39.5<br>
&gt;&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;&gt;<br>
&gt;&gt;<br>
&gt;&gt;<br>
&gt;&gt;<br>
&gt;&gt;<br>
&gt;<br>
&gt;<br>
&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt; Links: You receive all messages sent to this group.<br>
&gt; View/Reply Online (#223606): <a href=3D"https://lists.openembedded.org=
/g/openembedded-core/message/223606" rel=3D"noreferrer" target=3D"_blank">h=
ttps://lists.openembedded.org/g/openembedded-core/message/223606</a><br>
&gt; Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/11518477=
6/3617728" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.=
org/mt/115184776/3617728</a><br>
&gt; Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openemb=
edded.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org=
</a><br>
&gt; Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-=
core/unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded=
.org/g/openembedded-core/unsub</a> [<a href=3D"mailto:zboszor@gmail.com" ta=
rget=3D"_blank">zboszor@gmail.com</a>]<br>
&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt;<br>
<br>
</blockquote></div></div>

--000000000000462a03063f00a4a2--

