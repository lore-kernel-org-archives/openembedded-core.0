Return-Path: <anibal@limonsoftware.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D81B2C83030
	for <webhook@archiver.kernel.org>; Mon,  7 Jul 2025 20:13:38 +0000 (UTC)
Received: from mail-yw1-f177.google.com (mail-yw1-f177.google.com [209.85.128.177])
 by mx.groups.io with SMTP id smtpd.web11.2210.1751919218059250094
 for <openembedded-core@lists.openembedded.org>;
 Mon, 07 Jul 2025 13:13:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@limonsoftware-com.20230601.gappssmtp.com header.s=20230601 header.b=v0fZvp80;
 spf=pass (domain: limonsoftware.com, ip: 209.85.128.177, mailfrom: anibal@limonsoftware.com)
Received: by mail-yw1-f177.google.com with SMTP id 00721157ae682-710fd2d0372so34922507b3.0
        for <openembedded-core@lists.openembedded.org>; Mon, 07 Jul 2025 13:13:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=limonsoftware-com.20230601.gappssmtp.com; s=20230601; t=1751919217; x=1752524017; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=nyg8BcKFfNZj9TxosSiRDxCbZJuYdySx7aw/Y1sQRRM=;
        b=v0fZvp80+OsDiZfa18S4wuCIDhKrms78cM9oJzL6D41EUivs3+fnPCzVCCaFNomRt9
         bnEVh/LI9qbQS8n8He0vIarJzrmvHHyYrZsNRFCn2Vsgjya3/AZDibXKlZ3jhOX8plyZ
         q07knrMyr9on/zegcuh2CeF4f+jyRKzOr+XvtKoHZSWTpK86489q5lfiwHyGKhK3FIvt
         oOhlA1nBZOgaadL0pw/dbDvjJFZZottukWozLXbZ0KLu4KADgB9e4Z+GzVMZJgZPplOE
         39IiIyczuvWgbSehxUN9skV9mBqxw2rIzl8FMGQI278FAOauDq3qYjVCD+dHqEPRx1m2
         hEkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751919217; x=1752524017;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nyg8BcKFfNZj9TxosSiRDxCbZJuYdySx7aw/Y1sQRRM=;
        b=XMj5bWsG1dRIg8SBJFBglceaZP5UsxUQAEEM0aVkSIgcu07aOpuGSPM6neJnUNs6vH
         l3s3CanOugeY9GKLtImvkd6OTnx9+vfg81kO9NoNbCniUZYagQlRVz43CzwhCX+MC3xu
         SSzYJGUFmMtSKbSHREhTlUR6farKuI/6OXi6xST7AcmOZ1b4WK388uqiWYofPuMwgpVI
         Q9yiMfFKkgMiwPFAKxXZliiN+7K6wm2HkmYm3g9hppSujIfkBnOr8TIK3HpusyE/4a8D
         YosDcftraH2h7u5ktIdZDFaIclQgwBFsnyhsfifBJle75wZgaULRw2DgvVnfZKWP0d6+
         gj8Q==
X-Gm-Message-State: AOJu0YxWjjenK7N4n7mqx2ZpR3kKRXH38TN/Hm2LuM7YmwGUvyLwKwUh
	t/UK+bLPW430+Ko3x4Y7aSLLU99sUHulFz/FzQy5Yi4VbtYIfqkX6CxrL2R9ejp+FarkoP6ANny
	KY1/rux1TwVIiExztciMOZaosJ6u4vdz83W/z5+rWZw==
X-Gm-Gg: ASbGnctpFp0zw8nALeSyNODN08OTpEF/cYKldUzDXj/TkZfbndHTls098L1emdXpUv8
	7jr5sHNewShR/oLLGE8FHVhv3FeCl3n0PlrLvST/084/0sxBD6CAmySR3Y09tVIQqgoBG4bs2vh
	aZLlcSGzTO7v7hf9a/DCGMZyUXcqM6cOvrcD5bCZkgr+/k7A==
X-Google-Smtp-Source: AGHT+IH/bV9pl5MTOC/Ct22H2PTI030TSIfbFjps/ej59CfUrv/J7d1a7VgfhtCecuRAdXA9eEfRAzPn8bQ6ULX9WKY=
X-Received: by 2002:a05:690c:30c:b0:715:966:f67b with SMTP id
 00721157ae682-717a033fd2bmr962887b3.5.1751919217087; Mon, 07 Jul 2025
 13:13:37 -0700 (PDT)
MIME-Version: 1.0
References: <20250701221135.966025-1-anibal@limonsoftware.com> <CAMKF1spy2XGxWkw5A4V1JJZd0szCfa2zw96KDVEQsensmqhfRg@mail.gmail.com>
In-Reply-To: <CAMKF1spy2XGxWkw5A4V1JJZd0szCfa2zw96KDVEQsensmqhfRg@mail.gmail.com>
From: Anibal Limon <anibal@limonsoftware.com>
Date: Mon, 7 Jul 2025 14:13:25 -0600
X-Gm-Features: Ac12FXzRmB-XLIoSWqFyhO0FSQcMv-_kM2yhoQ0kc-jwbKhZZxa0_2EGISQt8sE
Message-ID: <CAOU5ZMtbng8G2_C6zTyWMr8mHqpRrYOK1viYNq88SwpwgvhAFg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] recipes-core: initrdscripts overlayroot allow
 boot partition
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-core@lists.openembedded.org, alhe@linux.microsoft.com, 
	johannes.schneider@leica-geosystems.com
Content-Type: multipart/alternative; boundary="0000000000009c272c06395c7aaa"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 07 Jul 2025 20:13:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/219994

--0000000000009c272c06395c7aaa
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Khem,

Yes, let me look into the current tests for this one.

Regards!,
Anibal

On Mon, Jul 7, 2025 at 10:19=E2=80=AFAM Khem Raj <raj.khem@gmail.com> wrote=
:

> On Tue, Jul 1, 2025 at 3:11=E2=80=AFPM Anibal Limon via lists.openembedde=
d.org
> <anibal=3Dlimonsoftware.com@lists.openembedded.org> wrote:
> >
> > Test if /boot is previously mounted on the OLDROOT and move it
> > into NEWROOT (ro).
>
> While change looks innocuous, I am curious what prompted this change.
> Secondly, these changes can have subtle side-effects
> for that it would be good to have a testcase so this behaviour does not
> regress.
>
> >
> > Signed-off-by: Anibal Limon <anibal@limonsoftware.com>
> > ---
> >  .../initrdscripts/initramfs-framework/overlayroot        | 9 +++++++--
> >  1 file changed, 7 insertions(+), 2 deletions(-)
> >
> > diff --git
> a/meta/recipes-core/initrdscripts/initramfs-framework/overlayroot
> b/meta/recipes-core/initrdscripts/initramfs-framework/overlayroot
> > index 0d41432878..db164d9846 100644
> > --- a/meta/recipes-core/initrdscripts/initramfs-framework/overlayroot
> > +++ b/meta/recipes-core/initrdscripts/initramfs-framework/overlayroot
> > @@ -38,10 +38,10 @@
> >  PATH=3D/sbin:/bin:/usr/sbin:/usr/bin
> >
> >  # We get OLDROOT from the rootfs module
> > -OLDROOT=3D"/rootfs"
> > +OLDROOT=3D"${ROOTFS_DIR}"
> >
> > -NEWROOT=3D"${RWMOUNT}/root"
> >  RWMOUNT=3D"/overlay"
> > +NEWROOT=3D"${RWMOUNT}/root"
> >  ROMOUNT=3D"${RWMOUNT}/rofs"
> >  UPPER_DIR=3D"${RWMOUNT}/upper"
> >  WORK_DIR=3D"${RWMOUNT}/work"
> > @@ -115,4 +115,9 @@ mount -n --move /proc ${NEWROOT}/proc
> >  mount -n --move /sys ${NEWROOT}/sys
> >  mount -n --move /dev ${NEWROOT}/dev
> >
> > +# Mount/move boot if is already mounted
> > +if mountpoint -q ${OLDROOT}/boot; then
> > +    mount -n --move ${OLDROOT}/boot ${NEWROOT}/boot
> > +fi
> > +
> >  exec chroot ${NEWROOT}/ ${bootparam_init:-/sbin/init} ||
> exit_gracefully "Couldn't chroot into overlay"
> > --
> > 2.39.5
> >
> >
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#219735):
> https://lists.openembedded.org/g/openembedded-core/message/219735
> > Mute This Topic: https://lists.openembedded.org/mt/113938218/1997914
> > Group Owner: openembedded-core+owner@lists.openembedded.org
> > Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> raj.khem@gmail.com]
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >
>

--0000000000009c272c06395c7aaa
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi=C2=A0Khem,<div><br></div><div>Yes, let me look into the=
 current tests for this one.</div><div><br></div><div>Regards!,</div><div>A=
nibal</div></div><br><div class=3D"gmail_quote gmail_quote_container"><div =
dir=3D"ltr" class=3D"gmail_attr">On Mon, Jul 7, 2025 at 10:19=E2=80=AFAM Kh=
em Raj &lt;<a href=3D"mailto:raj.khem@gmail.com">raj.khem@gmail.com</a>&gt;=
 wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px =
0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">On Tue, =
Jul 1, 2025 at 3:11=E2=80=AFPM Anibal Limon via <a href=3D"http://lists.ope=
nembedded.org" rel=3D"noreferrer" target=3D"_blank">lists.openembedded.org<=
/a><br>
&lt;anibal=3D<a href=3D"mailto:limonsoftware.com@lists.openembedded.org" ta=
rget=3D"_blank">limonsoftware.com@lists.openembedded.org</a>&gt; wrote:<br>
&gt;<br>
&gt; Test if /boot is previously mounted on the OLDROOT and move it<br>
&gt; into NEWROOT (ro).<br>
<br>
While change looks innocuous, I am curious what prompted this change.<br>
Secondly, these changes can have subtle side-effects<br>
for that it would be good to have a testcase so this behaviour does not reg=
ress.<br>
<br>
&gt;<br>
&gt; Signed-off-by: Anibal Limon &lt;<a href=3D"mailto:anibal@limonsoftware=
.com" target=3D"_blank">anibal@limonsoftware.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 .../initrdscripts/initramfs-framework/overlayroot=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 | 9 +++++++--<br>
&gt;=C2=A0 1 file changed, 7 insertions(+), 2 deletions(-)<br>
&gt;<br>
&gt; diff --git a/meta/recipes-core/initrdscripts/initramfs-framework/overl=
ayroot b/meta/recipes-core/initrdscripts/initramfs-framework/overlayroot<br=
>
&gt; index 0d41432878..db164d9846 100644<br>
&gt; --- a/meta/recipes-core/initrdscripts/initramfs-framework/overlayroot<=
br>
&gt; +++ b/meta/recipes-core/initrdscripts/initramfs-framework/overlayroot<=
br>
&gt; @@ -38,10 +38,10 @@<br>
&gt;=C2=A0 PATH=3D/sbin:/bin:/usr/sbin:/usr/bin<br>
&gt;<br>
&gt;=C2=A0 # We get OLDROOT from the rootfs module<br>
&gt; -OLDROOT=3D&quot;/rootfs&quot;<br>
&gt; +OLDROOT=3D&quot;${ROOTFS_DIR}&quot;<br>
&gt;<br>
&gt; -NEWROOT=3D&quot;${RWMOUNT}/root&quot;<br>
&gt;=C2=A0 RWMOUNT=3D&quot;/overlay&quot;<br>
&gt; +NEWROOT=3D&quot;${RWMOUNT}/root&quot;<br>
&gt;=C2=A0 ROMOUNT=3D&quot;${RWMOUNT}/rofs&quot;<br>
&gt;=C2=A0 UPPER_DIR=3D&quot;${RWMOUNT}/upper&quot;<br>
&gt;=C2=A0 WORK_DIR=3D&quot;${RWMOUNT}/work&quot;<br>
&gt; @@ -115,4 +115,9 @@ mount -n --move /proc ${NEWROOT}/proc<br>
&gt;=C2=A0 mount -n --move /sys ${NEWROOT}/sys<br>
&gt;=C2=A0 mount -n --move /dev ${NEWROOT}/dev<br>
&gt;<br>
&gt; +# Mount/move boot if is already mounted<br>
&gt; +if mountpoint -q ${OLDROOT}/boot; then<br>
&gt; +=C2=A0 =C2=A0 mount -n --move ${OLDROOT}/boot ${NEWROOT}/boot<br>
&gt; +fi<br>
&gt; +<br>
&gt;=C2=A0 exec chroot ${NEWROOT}/ ${bootparam_init:-/sbin/init} || exit_gr=
acefully &quot;Couldn&#39;t chroot into overlay&quot;<br>
&gt; --<br>
&gt; 2.39.5<br>
&gt;<br>
&gt;<br>
&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt; Links: You receive all messages sent to this group.<br>
&gt; View/Reply Online (#219735): <a href=3D"https://lists.openembedded.org=
/g/openembedded-core/message/219735" rel=3D"noreferrer" target=3D"_blank">h=
ttps://lists.openembedded.org/g/openembedded-core/message/219735</a><br>
&gt; Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/11393821=
8/1997914" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.=
org/mt/113938218/1997914</a><br>
&gt; Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openemb=
edded.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org=
</a><br>
&gt; Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-=
core/unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded=
.org/g/openembedded-core/unsub</a> [<a href=3D"mailto:raj.khem@gmail.com" t=
arget=3D"_blank">raj.khem@gmail.com</a>]<br>
&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt;<br>
</blockquote></div>

--0000000000009c272c06395c7aaa--

