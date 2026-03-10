Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 191C1FD2D71
	for <webhook@archiver.kernel.org>; Tue, 10 Mar 2026 12:55:38 +0000 (UTC)
Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com [209.85.215.176])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.39378.1773147333608541603
 for <openembedded-core@lists.openembedded.org>;
 Tue, 10 Mar 2026 05:55:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=RNwCyBVj;
 spf=pass (domain: gmail.com, ip: 209.85.215.176, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-pg1-f176.google.com with SMTP id 41be03b00d2f7-c73a5473bbdso1107760a12.2
        for <openembedded-core@lists.openembedded.org>; Tue, 10 Mar 2026 05:55:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773147333; cv=none;
        d=google.com; s=arc-20240605;
        b=csNH2nNhf0q+KohRbc+c70s9NJe3Axp0ne+o3mOq1huM4fxTyKRkVRmMcSuWZ9FHZC
         U+wGd3wy6SC4QPPd8NDrD+ZjFLvbXKCWQ36rNFuvmywtVfqS6vrxw0x4o6hkKcqEOZi5
         wxXEAP97pTEc/Q4K7sTjCQHR59V0f+jAaAgOY7jKtSXWwU+bef5+1WbqyXQbMD6eGQyI
         Fv0D9EjTi6peEue48QVFe/gQG38J5SauFqKtvb0z6e1vx5TIi0q9tGcYRmRi2K2B2upu
         /QKBnk2ic2Q6SJBku9IaGwkDJd4kKu05XcLddtqO+awHpzPx6PiQmuqzLGiQQg221c2f
         ovkA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=0632jUQIkahuvCcWNQpLJ2BjyB/085tQObNPgTNSpio=;
        fh=MVnIlZW9+NjPZHu+Gdyu415aph4LTJxRkcWuatbgDH0=;
        b=GhBUZfXyHxsiOO5BqipEvfSceBXa3mjhv+1pE2n7PcYQuK7dB277VbagZmdbt6peW3
         JvHcUFhOduRmPHoUp6UoRKEHuvYcIrWFRBLhAJhXQVPIemd9qGBE4C6WntR4bnJt++Mp
         GC+fcMkkwcDHSA6zy6c2Wtle7N7udFV50pO0UQHpFcPVqz2sQjg1AVJqs0hR7LN6NqtG
         jc+PE++YGYnkmHPwJppjAN1usE/bZTK0BPffQY2kvkA6W5SZTZhymxZCW2rD4gFTbVVg
         p+XP/N7sj8ub4mz+xBSSIdw580etKev8pYi7cSnmrV4E7QqwpN4+66kx7w5Y+l2xaMaO
         agZw==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773147333; x=1773752133; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=0632jUQIkahuvCcWNQpLJ2BjyB/085tQObNPgTNSpio=;
        b=RNwCyBVjnmiKAmtTesytDZEPF8oQfJ6KSVFcYEMSaabgcwnedeLC+YJND3tP6GX6DR
         aTHeR0ex1QcQkVomhAnGmVV7+MNsmnVWffDYczlleFD47UcUQsWbeow6NtloXP/Jeec2
         yhn6hRk6OAAwI5Q7J3BLPV5hoZlefXPxLHLUIHBnGsEJi8arkeiQpdB8kMtc9Xit3hGc
         icxNB586kaEh1fIgIFMeGmwQtJXyJ0kKqQVK61j4a1Q6CwtFQ8jC0Pi/Qdjz9ZO4tYRo
         rYzFDR4jsMBrTSwYdHREensV1tnDVZ1qBMgkNN0ofekv8tmVQZZ5RZOePQhF8yYu/gE5
         iMtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773147333; x=1773752133;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0632jUQIkahuvCcWNQpLJ2BjyB/085tQObNPgTNSpio=;
        b=JQjlYVBOH5/V4697sEKtGHSCFI8T+tgV6uihfpq8c8qc0lqgOCB+Ulg+e+ZIvFE0Vq
         LPlvfE2iAqOgs5cYj3p+ynzBEk7r3ciC9Uw6/l1v5ocr+aMjYIaqQEfxpHdjGsgrWbVf
         wclqRiArvkb+EO+Vi4oHCpj9iy3VGi0VpbFW92pwyLriWAe/KSeYJPTdeYaydtUpr3Nr
         4EYjTMthXdrMoBKI2WCsM8ulHKG4NUbyBBgHpBS9cZ41LAGPCKNu/jdVSWGWxtzkFapr
         uUdRFZqw5xm9gbDxeM/QPWM5n+JpLnYtg9+Bec+d5Cxl+JXM9ZoAUyK3mVOxcr2JroVI
         zlIQ==
X-Gm-Message-State: AOJu0YzOe9JANNTklPAjaLgIsoidScpc6vgeQuyzcO/eEo4U7JDtm7wS
	OA+KKdfMs4bDgs2jRgvnzBH33m85eMVY9Ew4a3ahJ4k4koxDCwRhhKvrxkEhLiFCmMELNu7tzwT
	zfY2QAKlIW7zGFFHYdbw/PSjC1TkYLPvdIbjW/40=
X-Gm-Gg: ATEYQzzFqS+oKkRdg4xYbDrHdvkPB2ZZiIHHM5QB9UL3Da9alnTXk1yLnSShQtv0hLD
	Sk3BRCx1aOfZM36i+ROzv2z2qGQgMy52JHeaVFZC+XADyGJQ7E7Pgd+LP95cbrXe3Gdpc3lhkvQ
	tlQ0prs8RXBwjfQc8DCAxCjmcxketokaxIUdyJ5FflxiMYGxblSBYfdWEO4mDmeqebskN9VuaJN
	LE0fXzOQnwfJu/tpcgUpI+/KIJ7P1KcgssHoxzTwCO4/0OnYVlKP/rHUP3+fuTS4QkGudf61HgD
	gWyXBACG+uuQoqHDfqvqGruRmL9UHF+Y3mDPCxie
X-Received: by 2002:a05:6a20:a110:b0:398:99cd:b9a with SMTP id
 adf61e73a8af0-39899cd0e0cmr5791505637.37.1773147332931; Tue, 10 Mar 2026
 05:55:32 -0700 (PDT)
MIME-Version: 1.0
References: <20260310113351.194882-1-mikko.rapeli@linaro.org>
 <CADkTA4Ofx5RBm-Zxa9+8HOT7edDMCSV2RdAf7xcE7MFfN2cHiQ@mail.gmail.com> <abATcQuhfbPrfcYr@nuoska>
In-Reply-To: <abATcQuhfbPrfcYr@nuoska>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Tue, 10 Mar 2026 08:55:19 -0400
X-Gm-Features: AaiRm52XCLPQuzjtLB6hZoAFsiyNbPga1Vh8_6qglJprFiKYqEZW70LsLfFSzKo
Message-ID: <CADkTA4PUa4J1t1ZKh5dwAzqZC_T_uJCOcCi-rF08Un_vMcD6TQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] kernel-yocto.bbclass: capture merge_config.sh
 output to task log
To: Mikko Rapeli <mikko.rapeli@linaro.org>
Cc: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000e9f439064cab08fb"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 10 Mar 2026 12:55:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/232779

--000000000000e9f439064cab08fb
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 10, 2026 at 8:49=E2=80=AFAM Mikko Rapeli <mikko.rapeli@linaro.o=
rg>
wrote:

> Hi,
>
> On Tue, Mar 10, 2026 at 08:41:46AM -0400, Bruce Ashfield wrote:
> > On Tue, Mar 10, 2026 at 7:34=E2=80=AFAM Mikko Rapeli via lists.openembe=
dded.org
> > <mikko.rapeli=3Dlinaro.org@lists.openembedded.org> wrote:
> >
> > > With https://lists.yoctoproject.org/g/linux-yocto/message/16359
> > > updates to merge_config.sh in kern-tools-native the output
> > > is useful and not too verbose. Thus capture it to normal
> > > do_kernel_configme task logs.
> > >
> > > Signed-off-by: Mikko Rapeli <mikko.rapeli@linaro.org>
> > > ---
> > >  meta/classes-recipe/kernel-yocto.bbclass | 7 +------
> > >  1 file changed, 1 insertion(+), 6 deletions(-)
> > >
> > > diff --git a/meta/classes-recipe/kernel-yocto.bbclass
> > > b/meta/classes-recipe/kernel-yocto.bbclass
> > > index e53bf1519418..d981ca0e30e6 100644
> > > --- a/meta/classes-recipe/kernel-yocto.bbclass
> > > +++ b/meta/classes-recipe/kernel-yocto.bbclass
> > > @@ -492,14 +492,9 @@ do_kernel_configme() {
> > >                 bbfatal_log "Could not find configuration queue
> > > (${meta_dir}/config.queue)"
> > >         fi
> > >
> > > -       CFLAGS=3D"${CFLAGS} ${TOOLCHAIN_OPTIONS}" HOSTCC=3D"${BUILD_C=
C}
> > > ${BUILD_CFLAGS} ${BUILD_LDFLAGS}" HOSTCPP=3D"${BUILD_CPP}"
> CC=3D"${KERNEL_CC}"
> > > LD=3D"${KERNEL_LD}" OBJCOPY=3D"${KERNEL_OBJCOPY}" STRIP=3D"${KERNEL_S=
TRIP}"
> > > ARCH=3D${ARCH} merge_config.sh -O ${B} ${config_flags} ${configs} >
> > > ${meta_dir}/cfg/merge_config_build.log 2>&1
> > > +       CFLAGS=3D"${CFLAGS} ${TOOLCHAIN_OPTIONS}" HOSTCC=3D"${BUILD_C=
C}
> > > ${BUILD_CFLAGS} ${BUILD_LDFLAGS}" HOSTCPP=3D"${BUILD_CPP}"
> CC=3D"${KERNEL_CC}"
> > > LD=3D"${KERNEL_LD}" OBJCOPY=3D"${KERNEL_OBJCOPY}" STRIP=3D"${KERNEL_S=
TRIP}"
> > > ARCH=3D${ARCH} merge_config.sh -O ${B} ${config_flags} ${configs}
> > >         if [ $? -ne 0 -o ! -f ${B}/.config ]; then
> > >                 bberror "Could not generate a .config for
> > > ${KMACHINE}-${LINUX_KERNEL_TYPE}"
> > > -               if [ ${KCONF_AUDIT_LEVEL} -gt 1 ]; then
> > > -                       bbfatal_log "`cat
> > > ${meta_dir}/cfg/merge_config_build.log`"
> > > -               else
> > > -                       bbfatal_log "Details can be found at:
> > > ${S}/${meta_dir}/cfg/merge_config_build.log"
> > > -               fi
> > >
> >
> > There are tools built on having the log around in a file. So we can't
> merge
> > this as-is.
>
> Which tools? Why aren't these tools part of oe-core?




> Standard practice of oe-core is to have details in task logs. I do not
> think extra log locations should be used or logs hidden behind other
> variables or switches.
>
>
Thanks, but I'm not sure why you are educating me on something
I've been involved with for a very long time.

Bruce




> Cheers,
>
> -Mikko
>


--=20
- Thou shalt not follow the NULL pointer, for chaos and madness await thee
at its end
- "Use the force Harry" - Gandalf, Star Trek II

--000000000000e9f439064cab08fb
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small"><br></div></div><br><div class=3D"gmail_quote gmail_quote_con=
tainer"><div dir=3D"ltr" class=3D"gmail_attr">On Tue, Mar 10, 2026 at 8:49=
=E2=80=AFAM Mikko Rapeli &lt;<a href=3D"mailto:mikko.rapeli@linaro.org">mik=
ko.rapeli@linaro.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quo=
te" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204=
);padding-left:1ex">Hi,<br>
<br>
On Tue, Mar 10, 2026 at 08:41:46AM -0400, Bruce Ashfield wrote:<br>
&gt; On Tue, Mar 10, 2026 at 7:34=E2=80=AFAM Mikko Rapeli via <a href=3D"ht=
tp://lists.openembedded.org" rel=3D"noreferrer" target=3D"_blank">lists.ope=
nembedded.org</a><br>
&gt; &lt;mikko.rapeli=3D<a href=3D"mailto:linaro.org@lists.openembedded.org=
" target=3D"_blank">linaro.org@lists.openembedded.org</a>&gt; wrote:<br>
&gt; <br>
&gt; &gt; With <a href=3D"https://lists.yoctoproject.org/g/linux-yocto/mess=
age/16359" rel=3D"noreferrer" target=3D"_blank">https://lists.yoctoproject.=
org/g/linux-yocto/message/16359</a><br>
&gt; &gt; updates to merge_config.sh in kern-tools-native the output<br>
&gt; &gt; is useful and not too verbose. Thus capture it to normal<br>
&gt; &gt; do_kernel_configme task logs.<br>
&gt; &gt;<br>
&gt; &gt; Signed-off-by: Mikko Rapeli &lt;<a href=3D"mailto:mikko.rapeli@li=
naro.org" target=3D"_blank">mikko.rapeli@linaro.org</a>&gt;<br>
&gt; &gt; ---<br>
&gt; &gt;=C2=A0 meta/classes-recipe/kernel-yocto.bbclass | 7 +------<br>
&gt; &gt;=C2=A0 1 file changed, 1 insertion(+), 6 deletions(-)<br>
&gt; &gt;<br>
&gt; &gt; diff --git a/meta/classes-recipe/kernel-yocto.bbclass<br>
&gt; &gt; b/meta/classes-recipe/kernel-yocto.bbclass<br>
&gt; &gt; index e53bf1519418..d981ca0e30e6 100644<br>
&gt; &gt; --- a/meta/classes-recipe/kernel-yocto.bbclass<br>
&gt; &gt; +++ b/meta/classes-recipe/kernel-yocto.bbclass<br>
&gt; &gt; @@ -492,14 +492,9 @@ do_kernel_configme() {<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0bbfa=
tal_log &quot;Could not find configuration queue<br>
&gt; &gt; (${meta_dir}/config.queue)&quot;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0fi<br>
&gt; &gt;<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0CFLAGS=3D&quot;${CFLAGS} ${TOOLCHAIN_=
OPTIONS}&quot; HOSTCC=3D&quot;${BUILD_CC}<br>
&gt; &gt; ${BUILD_CFLAGS} ${BUILD_LDFLAGS}&quot; HOSTCPP=3D&quot;${BUILD_CP=
P}&quot; CC=3D&quot;${KERNEL_CC}&quot;<br>
&gt; &gt; LD=3D&quot;${KERNEL_LD}&quot; OBJCOPY=3D&quot;${KERNEL_OBJCOPY}&q=
uot; STRIP=3D&quot;${KERNEL_STRIP}&quot;<br>
&gt; &gt; ARCH=3D${ARCH} merge_config.sh -O ${B} ${config_flags} ${configs}=
 &gt;<br>
&gt; &gt; ${meta_dir}/cfg/merge_config_build.log 2&gt;&amp;1<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0CFLAGS=3D&quot;${CFLAGS} ${TOOLCHAIN_=
OPTIONS}&quot; HOSTCC=3D&quot;${BUILD_CC}<br>
&gt; &gt; ${BUILD_CFLAGS} ${BUILD_LDFLAGS}&quot; HOSTCPP=3D&quot;${BUILD_CP=
P}&quot; CC=3D&quot;${KERNEL_CC}&quot;<br>
&gt; &gt; LD=3D&quot;${KERNEL_LD}&quot; OBJCOPY=3D&quot;${KERNEL_OBJCOPY}&q=
uot; STRIP=3D&quot;${KERNEL_STRIP}&quot;<br>
&gt; &gt; ARCH=3D${ARCH} merge_config.sh -O ${B} ${config_flags} ${configs}=
<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if [ $? -ne 0 -o ! -f ${B}/.conf=
ig ]; then<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0bber=
ror &quot;Could not generate a .config for<br>
&gt; &gt; ${KMACHINE}-${LINUX_KERNEL_TYPE}&quot;<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if [ ${KC=
ONF_AUDIT_LEVEL} -gt 1 ]; then<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0bbfatal_log &quot;`cat<br>
&gt; &gt; ${meta_dir}/cfg/merge_config_build.log`&quot;<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0else<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0bbfatal_log &quot;Details can be found at:<br>
&gt; &gt; ${S}/${meta_dir}/cfg/merge_config_build.log&quot;<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0fi<br>
&gt; &gt;<br>
&gt; <br>
&gt; There are tools built on having the log around in a file. So we can&#3=
9;t merge<br>
&gt; this as-is.<br>
<br>
Which tools? Why aren&#39;t these tools part of oe-core?</blockquote><div><=
br></div><div><br></div><blockquote class=3D"gmail_quote" style=3D"margin:0=
px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
Standard practice of oe-core is to have details in task logs. I do not<br>
think extra log locations should be used or logs hidden behind other<br>
variables or switches.<br>
<br></blockquote><div><br></div><div><div class=3D"gmail_default" style=3D"=
font-size:small">Thanks, but I&#39;m not sure why you are educating me on s=
omething=C2=A0</div><div class=3D"gmail_default" style=3D"font-size:small">=
I&#39;ve been involved with for a very long time.</div><div class=3D"gmail_=
default" style=3D"font-size:small"><br></div><div class=3D"gmail_default" s=
tyle=3D"font-size:small">Bruce</div><br></div><div><br></div><div>=C2=A0</d=
iv><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bord=
er-left:1px solid rgb(204,204,204);padding-left:1ex">
Cheers,<br>
<br>
-Mikko<br>
</blockquote></div><div><br clear=3D"all"></div><div><br></div><span class=
=3D"gmail_signature_prefix">-- </span><br><div dir=3D"ltr" class=3D"gmail_s=
ignature">- Thou shalt not follow the NULL pointer, for chaos and madness a=
wait thee at its end<br>- &quot;Use the force Harry&quot; - Gandalf, Star T=
rek II<br><br></div></div>

--000000000000e9f439064cab08fb--

