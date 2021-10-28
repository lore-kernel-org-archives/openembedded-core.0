Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 98019C433EF
	for <webhook@archiver.kernel.org>; Thu, 28 Oct 2021 10:36:53 +0000 (UTC)
Received: from mail-ua1-f50.google.com (mail-ua1-f50.google.com
 [209.85.222.50])
 by mx.groups.io with SMTP id smtpd.web08.11195.1635417412191250949
 for <openembedded-core@lists.openembedded.org>;
 Thu, 28 Oct 2021 03:36:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=jMtiXXFh;
 spf=pass (domain: gmail.com, ip: 209.85.222.50,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-ua1-f50.google.com with SMTP id z22so8220244uaq.12
        for <openembedded-core@lists.openembedded.org>;
 Thu, 28 Oct 2021 03:36:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=W1Pl8XgKdm+RfGxnsz4XLGxqizPwjZwCFLkOYIpD4ys=;
        b=jMtiXXFhVVSxxJMhcAuqB18tn615ToBbbfCksu5Hx8NG5xlm0Xv7S2zhFJs+u/W6wq
         pxN4cncoQOtMc0rIwtfzGuKcJE0Y7lVdNB1wtEQbgvrQxZUI3tjAK33/AftHnyH7JTju
         s9zhQrCrNcz+9xTJ9ii0C/THMPSjjsGasJ46PI6EUd+m3pRbNsi8avXlcq+K20NI1Z08
         XbW2twlsJ077mn/Up1ba7P6zV93Ktyr0pulyw4zWtyzjUK42rp5vaxkKPUUgbhk/5i6W
         7QZEFXXI0SpAmw2sX9HHBwQ6xLqhas4NuOVsM8NTaws6D5vEpZrjAQh2cOsF12i8IY4+
         Ye8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=W1Pl8XgKdm+RfGxnsz4XLGxqizPwjZwCFLkOYIpD4ys=;
        b=golFyuE4gF5egowwL5+UwalhJY9mK6BwMpV/BY3p1W1fqeFDHid7Ytzn4YnQ2Z+NQP
         EotIUjW/vCLGsZO9m43uB1R1S7AIQ22whagFcDljG3DSmHu1aCnQHMKnJKNaqxgBye/X
         QWoBBjgmolFQ4BSuXNt114TIv3bdEPcjNKTx22pmh/7JJ5UeRjawuHhbvCsND2VTVcmq
         u44jJ4g3pkgHKRf+gswRXLGbUpVbS0qnUyrfyKLgmx7azUvWKKt/OyfI7eIoP2Sm/CId
         iOCfBG8aIMPDEHXugXt7xf4lzCZjp7vFIhVjwAMWwF4IgLpXNvS0CjegekHN07mYlJkq
         /TcQ==
X-Gm-Message-State: AOAM531/rIDpFlI7sUTnIuFMKXBD9GGF0jmYuKdfzkCVWn4wBs9iQ+qN
	BxSZzjRRjxQI35Lbcr8j7zn5WzR6+D3aw/agxVA=
X-Google-Smtp-Source: 
 ABdhPJwsAAnbozmd892kTbrNdoBVGU9om3aUzIY1XD6lIerru0ZkTQ9XZtqTspLKBmnr9xj3Iy1CSPhZKQum25oicjo=
X-Received: by 2002:a05:6102:a30:: with SMTP id
 16mr3413041vsb.1.1635417411330;
 Thu, 28 Oct 2021 03:36:51 -0700 (PDT)
MIME-Version: 1.0
References: <20211027091252.5781-1-jay.shen.teoh@intel.com>
 <CANPvuRmrxFqVk4Mmz=cDrbwUZ1RPLRpD8=aF241LguR=uFjrDQ@mail.gmail.com>
 <CAMKF1sqCVwThX=i1LzTF52u8oGzNmJ7gA7VJxYg9eqnOt7GGzg@mail.gmail.com>
 <BL1PR11MB5367289A3AAA022BB7F6F195BB869@BL1PR11MB5367.namprd11.prod.outlook.com>
 <CANNYZj-Ejox8Nm+inugABfyD2oAS+HcXe1KiRX0E7tKrW=Ja=w@mail.gmail.com>
 <BL1PR11MB5367158FCC6E65266141EF81BB869@BL1PR11MB5367.namprd11.prod.outlook.com>
In-Reply-To: 
 <BL1PR11MB5367158FCC6E65266141EF81BB869@BL1PR11MB5367.namprd11.prod.outlook.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Thu, 28 Oct 2021 12:36:40 +0200
Message-ID: 
 <CANNYZj-XFdwRg=AdgfdGnjjkrd=LL8--A3SDrXfEN0oBXOd-Mw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] oeqa/runtime/parselogs: whitelist drm failure
 in common errors list
To: "Teoh, Jay Shen" <jay.shen.teoh@intel.com>
Cc: Khem Raj <raj.khem@gmail.com>, Jose Quaresma <quaresma.jose@gmail.com>,
	OE-core <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="000000000000dca48b05cf6749c7"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 28 Oct 2021 10:36:53 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/157590

--000000000000dca48b05cf6749c7
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

I think the whole line doesn't have to match, it's enough if the string is
in it somewhere. You can verify by making the message even shorter, and
checking that it still works.

Alex

On Thu, 28 Oct 2021 at 12:15, Teoh, Jay Shen <jay.shen.teoh@intel.com>
wrote:

> "[drm] Cannot find any crtc or sizes",
> "[drm] Cannot find any crtc or sizes - going 1024x768",
>
>
>
> Both lines are covering difference case, the first line covers the case
> when no fallback size is set, and second line covers the case when fallba=
ck
> size is set.
>
>
>
> Thanks,
>
> Jay
>
>
>
> *From:* Alexander Kanavin <alex.kanavin@gmail.com>
> *Sent:* Thursday, 28 October, 2021 6:10 PM
> *To:* Teoh, Jay Shen <jay.shen.teoh@intel.com>
> *Cc:* Khem Raj <raj.khem@gmail.com>; Jose Quaresma <
> quaresma.jose@gmail.com>; OE-core <
> openembedded-core@lists.openembedded.org>
> *Subject:* Re: [OE-core] [PATCH] oeqa/runtime/parselogs: whitelist drm
> failure in common errors list
>
>
>
> But then you can remove the previous line, right?
>
>
>
> Alex
>
>
>
> On Thu, 28 Oct 2021 at 12:08, Teoh, Jay Shen <jay.shen.teoh@intel.com>
> wrote:
>
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
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#157587):
> https://lists.openembedded.org/g/openembedded-core/message/157587
> Mute This Topic: https://lists.openembedded.org/mt/86623483/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> alex.kanavin@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--000000000000dca48b05cf6749c7
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>I think the whole line doesn&#39;t have to match, it&=
#39;s enough if the string is in it somewhere. You can verify by making the=
 message even shorter, and checking that it still works.</div><div><br></di=
v><div>Alex<br></div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" =
class=3D"gmail_attr">On Thu, 28 Oct 2021 at 12:15, Teoh, Jay Shen &lt;<a hr=
ef=3D"mailto:jay.shen.teoh@intel.com">jay.shen.teoh@intel.com</a>&gt; wrote=
:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.=
8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">





<div style=3D"overflow-wrap: break-word;" lang=3D"EN-MY">
<div class=3D"gmail-m_-9053818079378523232WordSection1">
<p class=3D"MsoNormal">&quot;[drm] Cannot find any crtc or sizes&quot;,<br>
&quot;[drm] Cannot find any crtc or sizes - going 1024x768&quot;,<u></u><u>=
</u></p>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
<p class=3D"MsoNormal">Both lines are covering difference case, the first l=
ine covers the case when no fallback size is set, and second line covers th=
e case when fallback size is set.
<u></u><u></u></p>
<p class=3D"MsoNormal"><span><u></u>=C2=A0<u></u></span></p>
<p class=3D"MsoNormal"><span>Thanks,<u></u><u></u></span></p>
<p class=3D"MsoNormal"><span>Jay<u></u><u></u></span></p>
<p class=3D"MsoNormal"><span><u></u>=C2=A0<u></u></span></p>
<div style=3D"border-color:currentcolor currentcolor currentcolor blue;bord=
er-style:none none none solid;border-width:medium medium medium 1.5pt;paddi=
ng:0cm 0cm 0cm 4pt">
<div>
<div style=3D"border-color:rgb(225,225,225) currentcolor currentcolor;borde=
r-style:solid none none;border-width:1pt medium medium;padding:3pt 0cm 0cm"=
>
<p class=3D"MsoNormal"><b><span lang=3D"EN-US">From:</span></b><span lang=
=3D"EN-US"> Alexander Kanavin &lt;<a href=3D"mailto:alex.kanavin@gmail.com"=
 target=3D"_blank">alex.kanavin@gmail.com</a>&gt;
<br>
<b>Sent:</b> Thursday, 28 October, 2021 6:10 PM<br>
<b>To:</b> Teoh, Jay Shen &lt;<a href=3D"mailto:jay.shen.teoh@intel.com" ta=
rget=3D"_blank">jay.shen.teoh@intel.com</a>&gt;<br>
<b>Cc:</b> Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com" target=3D"_bl=
ank">raj.khem@gmail.com</a>&gt;; Jose Quaresma &lt;<a href=3D"mailto:quares=
ma.jose@gmail.com" target=3D"_blank">quaresma.jose@gmail.com</a>&gt;; OE-co=
re &lt;<a href=3D"mailto:openembedded-core@lists.openembedded.org" target=
=3D"_blank">openembedded-core@lists.openembedded.org</a>&gt;<br>
<b>Subject:</b> Re: [OE-core] [PATCH] oeqa/runtime/parselogs: whitelist drm=
 failure in common errors list<u></u><u></u></span></p>
</div>
</div>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
<div>
<div>
<p class=3D"MsoNormal">But then you can remove the previous line, right?<u>=
</u><u></u></p>
</div>
<div>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
</div>
<div>
<p class=3D"MsoNormal">Alex<u></u><u></u></p>
</div>
</div>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
<div>
<div>
<p class=3D"MsoNormal">On Thu, 28 Oct 2021 at 12:08, Teoh, Jay Shen &lt;<a =
href=3D"mailto:jay.shen.teoh@intel.com" target=3D"_blank">jay.shen.teoh@int=
el.com</a>&gt; wrote:<u></u><u></u></p>
</div>
<blockquote style=3D"border-color:currentcolor currentcolor currentcolor rg=
b(204,204,204);border-style:none none none solid;border-width:medium medium=
 medium 1pt;padding:0cm 0cm 0cm 6pt;margin-left:4.8pt;margin-right:0cm">
<p class=3D"MsoNormal" style=3D"margin-bottom:12pt"><br>
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
<u></u><u></u></p>
</blockquote>
</div>
</div>
</div>
</div>

<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#157587): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/157587" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/157587</a><br>
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

--000000000000dca48b05cf6749c7--

