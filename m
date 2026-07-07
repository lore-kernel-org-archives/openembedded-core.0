Return-Path: <leon.anavi@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0129EC43458
	for <webhook@archiver.kernel.org>; Tue,  7 Jul 2026 11:04:55 +0000 (UTC)
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.170823.1783422294197643922
 for <openembedded-core@lists.openembedded.org>;
 Tue, 07 Jul 2026 04:04:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=I4Wy3R7b;
 spf=pass (domain: konsulko.com, ip: 209.85.214.177, mailfrom: leon.anavi@konsulko.com)
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-2cc7ef7ec27so30590985ad.1
        for <openembedded-core@lists.openembedded.org>; Tue, 07 Jul 2026 04:04:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783422293; cv=none;
        d=google.com; s=arc-20260327;
        b=HIb9J69ZiRc1ONA4o/faBwS6hKqrc8sz+OcCa+06h1nIb06daz1PkUWBA5R1lJjz2q
         OHDiq/opIGMEGZ+HPWYxmGHCJvj24hDl7LYV4mFCv2uPoqLr+ARLgxeK2xDvkn09JfAO
         xMz2BAkJBT0YTES7yE5AT28rpGqRxQfr++HSz7IlrPxYJa0iQ+90+ICZRdtI1YElB3Y9
         WbIOKvoG7KVdE5Igu+WIGefJJdTKMutnbIlpDdakEWD9JQ1o0DLiN/WxpnWzZwUv2vlb
         bsOJXWIPrXvHFMilEgJQrLVhkDkQPShFqZq79Jz5rsF0HOJTMXgaXySTD0jca4f5uy1u
         gbfw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=IBxIc00FcqyZc+Al6qVqaKav0/dX0sJ2Vm0YROnqKHg=;
        fh=E22hnrDeFOhblX6O88lo3ne3xDOhxPQXcBK1pwgmqrY=;
        b=b4CSMzbv/QVhK6JtR8mJ0xask6UPMm2SgrETmiuMnKS6pdVH8ZG3RN12MmfuATOxMj
         ZC9tiEZD9yEkS/1QdEUxkZVp+An40CPXgxUk6sROOf4gxwKlHaKtvislWbZAqRt4VcvO
         FIEzKnAmeAL/v35ppgGgFkFeWdlEvzsOqY/etxCK/WOD1qbyNj8QCyeKnUCxq4TAbdHK
         gX0Jx7ioExYbmlffByS/IApzJjI35poKLqNZYiJdYk2pRfFTmFLKNToe44Dyb0RFejAc
         TA4tK8V1J8/FqglI3Y8dbKIizBs6vuV+OsP6EeHJdJNn49Y1OfVm5IFuX9PDtmyaal/P
         qUTg==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1783422293; x=1784027093; darn=lists.openembedded.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=IBxIc00FcqyZc+Al6qVqaKav0/dX0sJ2Vm0YROnqKHg=;
        b=I4Wy3R7bQVBSoPFWXXKxQt4yOa19K8Y3m+ENkHCC/AWNDag9M90G/0j3rQBsah47AS
         ghAZZV0JWcHEe9qUFlliih+24RCLufGHz/cWE0O1sMcrdn/bV/jQr/qSEYGowX3iUCsC
         j5ggq7kaygDaw2jvLG18C0z5UzofTHcfnP9zo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783422293; x=1784027093;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=IBxIc00FcqyZc+Al6qVqaKav0/dX0sJ2Vm0YROnqKHg=;
        b=VJEXsP0kRubmE5ObOSqu0sKk7To4VYVf7EH6HQS4AZf1+1dp9wi8o1Q4g/LxGfzG2e
         yR73CD+tuayXuMwajjunt0k+IWdZaOmxePjf4DWQeu4SERndkxPlKuXP5QwjFRt6a4ke
         dOuVU9FHBLaZI1mezmcKPzUoaI937U7FhlokfbHH6WE+dX5yH/avcvoyOREYggWEXcL2
         paoLnmjO8iF3fmtBhxPv4LVLaH37UkrNFqgvm3sFH+bY+I5BBLPvIuuc2MkKznHLZNQe
         uVg75M2B7IzbFNXgSNhFpKktirbnZ1NlBBVykIMJkAWy5no7Scs+0Lqu96fUPbKfK5bq
         GDcQ==
X-Gm-Message-State: AOJu0YzAGL0YE5QsQDUUxjiBb1IcFQo0maIabd8XhNOrvbud1v/miOm3
	6M7seHAlg/in8PCkDLQp9okAqs6VgHEVPXcc1E/xfWhG5RM/Kyn+6gH44o4Gx4Vg0ETuZ69vifu
	eJYigJuhL0VhOSp1chzDB9YmnH7p3viE/0FG3YrKvpw==
X-Gm-Gg: AfdE7cl4teNMIvLf7HK6sscKeNIkB4pvpvIfCjVUwIfbtTP9ijE59dHiR73l1DEjrH1
	pYtwbDDrMSIpd0dYNBOcsT+fc+T2dpvm7KrAe1Su4M1LPwWLaD2B9g/0+3U4JxoZHwg2ckrwnY2
	e6Vf7nqBC4o3m7M344o5laTJ+qb7pNYPwL9GXMlCC9Swc5n1At33x37iVCKBAcpq6KwG9A8mvpf
	5ddIXQ4Sih6Up6i0XXBV6IZIRYyLzXsozhOkGzozhkx1QvDlvkVKfF7QNbKsjiO/vQ2ul+y6goI
	pzZX+C8p68O4OJqHfQlHmjLt30YenKMMM1BF9r2FY54iDL4tvx8Okm7UndcgulHbjE0iP3G4I17
	/L2EIdEo=
X-Received: by 2002:a17:903:3904:b0:2c6:c9de:cd0e with SMTP id
 d9443c01a7336-2ccbf042ea7mr48329815ad.23.1783422293431; Tue, 07 Jul 2026
 04:04:53 -0700 (PDT)
MIME-Version: 1.0
References: <20260703142916.2868287-1-leon.anavi@konsulko.com> <40bc682b0d30a05ea7043ca1a5ac1699c72ae268.camel@pbarker.dev>
In-Reply-To: <40bc682b0d30a05ea7043ca1a5ac1699c72ae268.camel@pbarker.dev>
From: Leon Anavi <leon.anavi@konsulko.com>
Date: Tue, 7 Jul 2026 14:04:42 +0300
X-Gm-Features: AVVi8CcZp7zvZWNyZnuMgQqAbTsxn3cLwB33e4teEl1_Kh_PLoC-2HK463Jhae0
Message-ID: <CALtQ3O1769bnQtb68yuBWOAMhxEyo7+Jp5+U0=S+2X94ruRLFA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] meta: Add pam to the defaults if using systemd
To: Paul Barker <paul@pbarker.dev>
Cc: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="00000000000048e7820656035c4a"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 07 Jul 2026 11:04:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/240380

--00000000000048e7820656035c4a
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Paul,

On Mon, Jul 6, 2026 at 12:52=E2=80=AFPM Paul Barker <paul@pbarker.dev> wrot=
e:

> On Fri, 2026-07-03 at 17:29 +0300, Leon Anavi via lists.openembedded.org
> wrote:
> > Add pam to the list of DISTRO_FEATURES_DEFAULTS if variable
> > VIRTUAL-RUNTIME_init_manager has been set to systemd. Otherwise
> > having systemd in conjunction with wayland but without pam leads
> > to a conflict with the REQUIRED_DISTRO_FEATURES for weston related
> > recipes.
> >
> > This adjustment is required following these recent changes that
> > switched VIRTUAL-RUNTIME_init_manager to systemd by default and added
> > wayland to DISTRO_FEATURES_DEFAULTS which affects "nodistro":
> >
> > - 159148f4de2595556fef6e8678578df83383857b
> >   meta: Support opting out of any distro features
> >   (Please note that this commit also extended DISTRO_FEATURES_DEFAULTS
> >   with wayland and vulkan.)
> >
> > - 0b4061c5d50261f826d0edb4b478d2d305274b7c
> >   conf: Switch to systemd by default and simplify init manager selectio=
n
> >
> > This fixes issues with test_machine_world when running the
> > yocto-check-layer script for BSP layers that include weston in the
> > dependency chain, for example meta-tegra:
> >
> > ERROR: Required build target 'meta-world-pkgdata' has no buildable
> providers.
> > Missing or unbuildable dependency chain was: ['meta-world-pkgdata',
> 'l4t-graphics-demos', 'weston']
> >
> > The weston recipe has pam in REQUIRED_DISTRO_FEATURES if systemd is
> > enabled. Therefore, it makes sense to also add pam to the defaults
> > through DISTRO_FEATURES_DEFAULTS.
> >
> > Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
> > ---
> >  meta/conf/distro/include/default-distrovars.inc | 1 +
> >  1 file changed, 1 insertion(+)
> >
> > diff --git a/meta/conf/distro/include/default-distrovars.inc
> b/meta/conf/distro/include/default-distrovars.inc
> > index 69c6db589b..2eadfcbd74 100644
> > --- a/meta/conf/distro/include/default-distrovars.inc
> > +++ b/meta/conf/distro/include/default-distrovars.inc
> > @@ -29,6 +29,7 @@ DISTRO_FEATURES_DEFAULTS ?=3D " \
> >      acl alsa bluetooth debuginfod ext2 ipv4 ipv6 \
> >      wifi xattr nfs zeroconf pci 3g nfc x11 vfat seccomp pulseaudio \
> >      gobject-introspection-data ldconfig opengl ptest multiarch wayland
> vulkan \
> > +    ${@oe.utils.conditional('VIRTUAL-RUNTIME_init_manager', 'systemd',
> 'pam', '', d)} \
> >      "
> >  IMAGE_FEATURES ?=3D ""
>
> Hi Leon,
>
> I'm not sure we want to enable pam for everyone using systemd, there may
> be many systemd users who don't use weston.
>
> If we do want to enable pam whenever systemd is in use, the better place
> to do it is in meta/conf/distro/include/init-manager-systemd.inc.
>

Thank you for the feedback. I incorporated your suggestions into
init-manager-systemd.inc and submitted v2 of the patch. I also updated the
commit message to reflect the new approach:
https://lists.openembedded.org/g/openembedded-core/message/240374

Best regards, Leon


>
> An alternative, though not the most satisfying, may be to add a
> REQUIRED_DISTRO_FEATURES check to the l4t-graphics-demos recipe in
> meta-tegra.
>
> Best regards,
>
> --
> Paul Barker
>
>

--00000000000048e7820656035c4a
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Hi=C2=A0Paul,<br><br></div><div class=3D"=
gmail_quote gmail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">On=
 Mon, Jul 6, 2026 at 12:52=E2=80=AFPM Paul Barker &lt;<a href=3D"mailto:pau=
l@pbarker.dev">paul@pbarker.dev</a>&gt; wrote:<br></div><blockquote class=
=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rg=
b(204,204,204);padding-left:1ex">On Fri, 2026-07-03 at 17:29 +0300, Leon An=
avi via <a href=3D"http://lists.openembedded.org" rel=3D"noreferrer" target=
=3D"_blank">lists.openembedded.org</a><br>
wrote:<br>
&gt; Add pam to the list of DISTRO_FEATURES_DEFAULTS if variable<br>
&gt; VIRTUAL-RUNTIME_init_manager has been set to systemd. Otherwise<br>
&gt; having systemd in conjunction with wayland but without pam leads<br>
&gt; to a conflict with the REQUIRED_DISTRO_FEATURES for weston related<br>
&gt; recipes.<br>
&gt; <br>
&gt; This adjustment is required following these recent changes that<br>
&gt; switched VIRTUAL-RUNTIME_init_manager to systemd by default and added<=
br>
&gt; wayland to DISTRO_FEATURES_DEFAULTS which affects &quot;nodistro&quot;=
:<br>
&gt; <br>
&gt; - 159148f4de2595556fef6e8678578df83383857b<br>
&gt;=C2=A0 =C2=A0meta: Support opting out of any distro features<br>
&gt;=C2=A0 =C2=A0(Please note that this commit also extended DISTRO_FEATURE=
S_DEFAULTS<br>
&gt;=C2=A0 =C2=A0with wayland and vulkan.)<br>
&gt; <br>
&gt; - 0b4061c5d50261f826d0edb4b478d2d305274b7c<br>
&gt;=C2=A0 =C2=A0conf: Switch to systemd by default and simplify init manag=
er selection<br>
&gt; <br>
&gt; This fixes issues with test_machine_world when running the<br>
&gt; yocto-check-layer script for BSP layers that include weston in the<br>
&gt; dependency chain, for example meta-tegra:<br>
&gt; <br>
&gt; ERROR: Required build target &#39;meta-world-pkgdata&#39; has no build=
able providers.<br>
&gt; Missing or unbuildable dependency chain was: [&#39;meta-world-pkgdata&=
#39;, &#39;l4t-graphics-demos&#39;, &#39;weston&#39;]<br>
&gt; <br>
&gt; The weston recipe has pam in REQUIRED_DISTRO_FEATURES if systemd is<br=
>
&gt; enabled. Therefore, it makes sense to also add pam to the defaults<br>
&gt; through DISTRO_FEATURES_DEFAULTS.<br>
&gt; <br>
&gt; Signed-off-by: Leon Anavi &lt;<a href=3D"mailto:leon.anavi@konsulko.co=
m" target=3D"_blank">leon.anavi@konsulko.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 meta/conf/distro/include/default-distrovars.inc | 1 +<br>
&gt;=C2=A0 1 file changed, 1 insertion(+)<br>
&gt; <br>
&gt; diff --git a/meta/conf/distro/include/default-distrovars.inc b/meta/co=
nf/distro/include/default-distrovars.inc<br>
&gt; index 69c6db589b..2eadfcbd74 100644<br>
&gt; --- a/meta/conf/distro/include/default-distrovars.inc<br>
&gt; +++ b/meta/conf/distro/include/default-distrovars.inc<br>
&gt; @@ -29,6 +29,7 @@ DISTRO_FEATURES_DEFAULTS ?=3D &quot; \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 acl alsa bluetooth debuginfod ext2 ipv4 ipv6 \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 wifi xattr nfs zeroconf pci 3g nfc x11 vfat seccom=
p pulseaudio \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 gobject-introspection-data ldconfig opengl ptest m=
ultiarch wayland vulkan \<br>
&gt; +=C2=A0 =C2=A0 ${@oe.utils.conditional(&#39;VIRTUAL-RUNTIME_init_manag=
er&#39;, &#39;systemd&#39;, &#39;pam&#39;, &#39;&#39;, d)} \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &quot;<br>
&gt;=C2=A0 IMAGE_FEATURES ?=3D &quot;&quot;<br>
<br>
Hi Leon,<br>
<br>
I&#39;m not sure we want to enable pam for everyone using systemd, there ma=
y<br>
be many systemd users who don&#39;t use weston.<br>
<br>
If we do want to enable pam whenever systemd is in use, the better place<br=
>
to do it is in meta/conf/distro/include/init-manager-systemd.inc.<br></bloc=
kquote><div><br></div><div>Thank you for the feedback. I incorporated your =
suggestions into init-manager-systemd.inc and submitted v2 of the patch. I =
also updated the commit message to reflect the new approach:<br><a href=3D"=
https://lists.openembedded.org/g/openembedded-core/message/240374">https://=
lists.openembedded.org/g/openembedded-core/message/240374</a><br><br>Best r=
egards, Leon</div><div><span style=3D"background-color:transparent">=C2=A0<=
/span></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0=
.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
An alternative, though not the most satisfying, may be to add a<br>
REQUIRED_DISTRO_FEATURES check to the l4t-graphics-demos recipe in<br>
meta-tegra.<br>
<br>
Best regards,<br>
<br>
-- <br>
Paul Barker<br>
<br>
</blockquote></div></div>

--00000000000048e7820656035c4a--

