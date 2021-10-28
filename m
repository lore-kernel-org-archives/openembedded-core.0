Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 63444C433F5
	for <webhook@archiver.kernel.org>; Thu, 28 Oct 2021 10:09:50 +0000 (UTC)
Received: from mail-vk1-f170.google.com (mail-vk1-f170.google.com
 [209.85.221.170])
 by mx.groups.io with SMTP id smtpd.web09.11374.1635415789687140068
 for <openembedded-core@lists.openembedded.org>;
 Thu, 28 Oct 2021 03:09:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=YKrKqame;
 spf=pass (domain: gmail.com, ip: 209.85.221.170,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-vk1-f170.google.com with SMTP id o64so2711350vke.5
        for <openembedded-core@lists.openembedded.org>;
 Thu, 28 Oct 2021 03:09:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=nEoYrlk1uRa/qwZGDvboz/PwzTwEutdnHXocwAzNh6U=;
        b=YKrKqame+8a3bVbYQDdws3MPqU2W4SxJFoWbeW29gJ9XQm8jWEJ/ErdjKSSYt5u0Yd
         MK4nC2LRrWP5W+iFdZhYrNqu7MXo8qK188W7LVEoH4pqYlJtLn23ArcM9HsGfK9Nvlq5
         g6Jqg7mJd/r0tTSWVbMhqcNynoY3leupbP7+hWDlppd6x1+26Tk0gsu3jRs9JbnmvHB8
         sc+MyD0/My4SqWsRuFyLvqN/MAvp2Bh52kr6yPD7CCsskUehBTajavrJinLSCv412STQ
         IK9SsBYP+msJlkWAGJXhxZP3c63fEoRYKGdiGcA3HEJBq6GPwEnFJs5EfNfCp+xFILm9
         jwvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=nEoYrlk1uRa/qwZGDvboz/PwzTwEutdnHXocwAzNh6U=;
        b=WwLR9QIKFDfW1iOvY2ZYfbxGEncQljYrnERBANOfupJ8HMKdTcRLCxTDhbip35wBIx
         HL62e0sJZC/eUoLLct9pz0hK49UMWuVdO+g0dle9Y8na5xrUjzyDmBKKRWyPvyjz57z1
         mLDxp6mYvjC1dMgo0TBOu3TgC+Rps2Nj/qMrogS8klqoBTxLOIhd793Z+jnyXahYOWGx
         sJzyXFqCMPDKzMSGatgSjtuCnfKUD4d5vMkBCeN1NpFLXSIVDoNfsiAF5vGKWbMDmrsy
         gx8StYpOBSYSKLneKLanGuBhjHFMCtYb5XCm1n5kc7UIR4dWJN6Q9UPorq2IaCQDh/pG
         SAuQ==
X-Gm-Message-State: AOAM530Ll0wELb/1y0EfVMT8fb8ueJK6iwKYgTeVxG6G00gieWEEJi6H
	e3Fu3oeaZHkJDYLRB2vDpdfBFb1grdzO9uWk49o=
X-Google-Smtp-Source: 
 ABdhPJy4a1sbvNZ9J4uSvRXfNtno06YZnHQzer16J03Rvuf1HoMj6G4zab5KIFx4t5CIL814qz/Dy2IhqONjX8D8Iao=
X-Received: by 2002:a1f:7246:: with SMTP id n67mr2615175vkc.15.1635415788808;
 Thu, 28 Oct 2021 03:09:48 -0700 (PDT)
MIME-Version: 1.0
References: <20211027091252.5781-1-jay.shen.teoh@intel.com>
 <CANPvuRmrxFqVk4Mmz=cDrbwUZ1RPLRpD8=aF241LguR=uFjrDQ@mail.gmail.com>
 <CAMKF1sqCVwThX=i1LzTF52u8oGzNmJ7gA7VJxYg9eqnOt7GGzg@mail.gmail.com>
 <BL1PR11MB5367289A3AAA022BB7F6F195BB869@BL1PR11MB5367.namprd11.prod.outlook.com>
In-Reply-To: 
 <BL1PR11MB5367289A3AAA022BB7F6F195BB869@BL1PR11MB5367.namprd11.prod.outlook.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Thu, 28 Oct 2021 12:09:37 +0200
Message-ID: 
 <CANNYZj-Ejox8Nm+inugABfyD2oAS+HcXe1KiRX0E7tKrW=Ja=w@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] oeqa/runtime/parselogs: whitelist drm failure
 in common errors list
To: "Teoh, Jay Shen" <jay.shen.teoh@intel.com>
Cc: Khem Raj <raj.khem@gmail.com>, Jose Quaresma <quaresma.jose@gmail.com>,
	OE-core <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="00000000000026ee7105cf66e9c1"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 28 Oct 2021 10:09:50 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/157586

--00000000000026ee7105cf66e9c1
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

But then you can remove the previous line, right?

Alex

On Thu, 28 Oct 2021 at 12:08, Teoh, Jay Shen <jay.shen.teoh@intel.com>
wrote:

>
>
> > -----Original Message-----
> > From: Khem Raj <raj.khem@gmail.com>
> > Sent: Thursday, 28 October, 2021 12:17 AM
> > To: Jose Quaresma <quaresma.jose@gmail.com>
> > Cc: Teoh, Jay Shen <jay.shen.teoh@intel.com>; OE-core <openembedded-
> > core@lists.openembedded.org>
> > Subject: Re: [OE-core] [PATCH] oeqa/runtime/parselogs: whitelist drm
> failure in
> > common errors list
> >
> > On Wed, Oct 27, 2021 at 2:24 AM Jose Quaresma <quaresma.jose@gmail.com>
> > wrote:
> > >
> > >
> > >
> > > Teoh, Jay Shen <jay.shen.teoh@intel.com> escreveu no dia quarta,
> > 27/10/2021 =C3=A0(s) 10:12:
> > >>
> > >> From: Teoh Jay Shen <jay.shen.teoh@intel.com>
> > >>
> > >> Add the following line to common_errors list.
> > >>
> > >>   [drm] Cannot find any crtc or sizes
> > >>
> > >> This message is not harmful, it extended the coverage for drm error
> message.
> > >>
> > >> Signed-off-by: Teoh Jay Shen <jay.shen.teoh@intel.com>
> > >> ---
> > >>  meta/lib/oeqa/runtime/cases/parselogs.py | 1 +
> > >>  1 file changed, 1 insertion(+)
> > >>
> > >> diff --git a/meta/lib/oeqa/runtime/cases/parselogs.py
> > b/meta/lib/oeqa/runtime/cases/parselogs.py
> > >> index 2b8893d842..96da0b4f5c 100644
> > >> --- a/meta/lib/oeqa/runtime/cases/parselogs.py
> > >> +++ b/meta/lib/oeqa/runtime/cases/parselogs.py
> > >> @@ -32,6 +32,7 @@ common_errors =3D [
> > >>      "Failed to load module \"fbdev\"",
> > >>      "Failed to load module fbdev",
> > >>      "Failed to load module glx",
> > >> +    "[drm] Cannot find any crtc or sizes",
> > >>      "[drm] Cannot find any crtc or sizes - going 1024x768",
> > >
> > >
> > > I think this one ^ can be removed
> >
> > will the first entry cover the case when a fallback size is set ?
>
> In that case, it won't cover it. That's why I am adding a new line to
> expand the coverage
>
> >
> > >
> > >>
> > >>      "_OSC failed (AE_NOT_FOUND); disabling ASPM",
> > >>      "Open ACPI failed (/var/run/acpid.socket) (No such file or
> directory)",
> > >> --
> > >> 2.33.1
> > >>
> > >>
> > >>
> > >>
> > >
> > >
> > > --
> > > Best regards,
> > >
> > > Jos=C3=A9 Quaresma
> > >
> > >
> > >
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#157584):
> https://lists.openembedded.org/g/openembedded-core/message/157584
> Mute This Topic: https://lists.openembedded.org/mt/86623483/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> alex.kanavin@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--00000000000026ee7105cf66e9c1
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>But then you can remove the previous line, right?</di=
v><div><br></div><div>Alex<br></div></div><br><div class=3D"gmail_quote"><d=
iv dir=3D"ltr" class=3D"gmail_attr">On Thu, 28 Oct 2021 at 12:08, Teoh, Jay=
 Shen &lt;<a href=3D"mailto:jay.shen.teoh@intel.com">jay.shen.teoh@intel.co=
m</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin=
:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"=
><br>
<br>
&gt; -----Original Message-----<br>
&gt; From: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com" target=3D"_bl=
ank">raj.khem@gmail.com</a>&gt;<br>
&gt; Sent: Thursday, 28 October, 2021 12:17 AM<br>
&gt; To: Jose Quaresma &lt;<a href=3D"mailto:quaresma.jose@gmail.com" targe=
t=3D"_blank">quaresma.jose@gmail.com</a>&gt;<br>
&gt; Cc: Teoh, Jay Shen &lt;<a href=3D"mailto:jay.shen.teoh@intel.com" targ=
et=3D"_blank">jay.shen.teoh@intel.com</a>&gt;; OE-core &lt;openembedded-<br=
>
&gt; <a href=3D"mailto:core@lists.openembedded.org" target=3D"_blank">core@=
lists.openembedded.org</a>&gt;<br>
&gt; Subject: Re: [OE-core] [PATCH] oeqa/runtime/parselogs: whitelist drm f=
ailure in<br>
&gt; common errors list<br>
&gt; <br>
&gt; On Wed, Oct 27, 2021 at 2:24 AM Jose Quaresma &lt;<a href=3D"mailto:qu=
aresma.jose@gmail.com" target=3D"_blank">quaresma.jose@gmail.com</a>&gt;<br=
>
&gt; wrote:<br>
&gt; &gt;<br>
&gt; &gt;<br>
&gt; &gt;<br>
&gt; &gt; Teoh, Jay Shen &lt;<a href=3D"mailto:jay.shen.teoh@intel.com" tar=
get=3D"_blank">jay.shen.teoh@intel.com</a>&gt; escreveu no dia quarta,<br>
&gt; 27/10/2021 =C3=A0(s) 10:12:<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt; From: Teoh Jay Shen &lt;<a href=3D"mailto:jay.shen.teoh@intel=
.com" target=3D"_blank">jay.shen.teoh@intel.com</a>&gt;<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt; Add the following line to common_errors list.<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt;=C2=A0 =C2=A0[drm] Cannot find any crtc or sizes<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt; This message is not harmful, it extended the coverage for drm=
 error message.<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt; Signed-off-by: Teoh Jay Shen &lt;<a href=3D"mailto:jay.shen.t=
eoh@intel.com" target=3D"_blank">jay.shen.teoh@intel.com</a>&gt;<br>
&gt; &gt;&gt; ---<br>
&gt; &gt;&gt;=C2=A0 meta/lib/oeqa/runtime/cases/parselogs.py | 1 +<br>
&gt; &gt;&gt;=C2=A0 1 file changed, 1 insertion(+)<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt; diff --git a/meta/lib/oeqa/runtime/cases/parselogs.py<br>
&gt; b/meta/lib/oeqa/runtime/cases/parselogs.py<br>
&gt; &gt;&gt; index 2b8893d842..96da0b4f5c 100644<br>
&gt; &gt;&gt; --- a/meta/lib/oeqa/runtime/cases/parselogs.py<br>
&gt; &gt;&gt; +++ b/meta/lib/oeqa/runtime/cases/parselogs.py<br>
&gt; &gt;&gt; @@ -32,6 +32,7 @@ common_errors =3D [<br>
&gt; &gt;&gt;=C2=A0 =C2=A0 =C2=A0 &quot;Failed to load module \&quot;fbdev\=
&quot;&quot;,<br>
&gt; &gt;&gt;=C2=A0 =C2=A0 =C2=A0 &quot;Failed to load module fbdev&quot;,<=
br>
&gt; &gt;&gt;=C2=A0 =C2=A0 =C2=A0 &quot;Failed to load module glx&quot;,<br=
>
&gt; &gt;&gt; +=C2=A0 =C2=A0 &quot;[drm] Cannot find any crtc or sizes&quot=
;,<br>
&gt; &gt;&gt;=C2=A0 =C2=A0 =C2=A0 &quot;[drm] Cannot find any crtc or sizes=
 - going 1024x768&quot;,<br>
&gt; &gt;<br>
&gt; &gt;<br>
&gt; &gt; I think this one ^ can be removed<br>
&gt; <br>
&gt; will the first entry cover the case when a fallback size is set ?<br>
<br>
In that case, it won&#39;t cover it. That&#39;s why I am adding a new line =
to expand the coverage<br>
<br>
&gt; <br>
&gt; &gt;<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt;=C2=A0 =C2=A0 =C2=A0 &quot;_OSC failed (AE_NOT_FOUND); disabli=
ng ASPM&quot;,<br>
&gt; &gt;&gt;=C2=A0 =C2=A0 =C2=A0 &quot;Open ACPI failed (/var/run/acpid.so=
cket) (No such file or directory)&quot;,<br>
&gt; &gt;&gt; --<br>
&gt; &gt;&gt; 2.33.1<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt;<br>
&gt; &gt;<br>
&gt; &gt;<br>
&gt; &gt; --<br>
&gt; &gt; Best regards,<br>
&gt; &gt;<br>
&gt; &gt; Jos=C3=A9 Quaresma<br>
&gt; &gt;<br>
&gt; &gt; <br>
&gt; &gt;<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#157584): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/157584" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/157584</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/86623483/1686=
489" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/mt=
/86623483/1686489</a><br>
Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openembedded=
.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org</a><=
br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-core/=
unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/=
g/openembedded-core/unsub</a> [<a href=3D"mailto:alex.kanavin@gmail.com" ta=
rget=3D"_blank">alex.kanavin@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div>

--00000000000026ee7105cf66e9c1--

