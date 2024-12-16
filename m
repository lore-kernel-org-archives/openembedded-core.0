Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ED9A8E77180
	for <webhook@archiver.kernel.org>; Mon, 16 Dec 2024 13:29:59 +0000 (UTC)
Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
 by mx.groups.io with SMTP id smtpd.web11.56318.1734355791666942960
 for <openembedded-core@lists.openembedded.org>;
 Mon, 16 Dec 2024 05:29:51 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=e1eqjGzE;
 spf=pass (domain: gmail.com, ip: 209.85.216.42, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-2ee50ffcf14so3970618a91.0
        for <openembedded-core@lists.openembedded.org>; Mon, 16 Dec 2024 05:29:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1734355791; x=1734960591; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=BqmQsmYHQEfixQSAJdEDyLZte+f0VdQPpthnfwOWKUI=;
        b=e1eqjGzEzuzkynx6h5Am2KqoxMvAehwO95N9dT9KUy3qnhtLmxSO3/9WqT9qzxZ1qV
         Q3qiMKn8KWsTyq24UN5Wp3hCUwgvM7bddawt3BXXU6Pa+bMclbM5vsyp0HgaYfbmHLF/
         pKCvU541ZVumo3gGHV/eKF4Tm3KVrTdvqNJ6GcPr9Q/hnheUF4EeisP9uk+kIiXtqHoc
         9S2vp8Gr1iPs6w4Nk+S+J0nruvHHOHJOEJTkP3nwa9CkMwKfv0VDiM/NmUMRftH9QEvI
         lzCjqyqWUiRAZLTASqtrV31iKAoGObLblUan6M+R3p24zjxc8y6RgsIgXF+sxP7j3N6i
         XwGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734355791; x=1734960591;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BqmQsmYHQEfixQSAJdEDyLZte+f0VdQPpthnfwOWKUI=;
        b=sDSUY5zFdV+blhwcTOOVk+GeOzOllssm9lSLWdI+nlCJbbD72vS7DvzVfte1ktyghj
         5XJVLq4AUWPeKFd+BBt5eQn+9DbbfSWWI6I5a9fsbGJgD/+H+BRAiyGrPjQz9cMrjsXb
         ETikl3/VeAjBTJ9Uj+O0v7w9Qr73ekytjudPiHrLMD/RcoBOXPX2Xz/DWMRHQ8bAalus
         V7nZGQy/ycUGGPxPBMrGMLHR8JJ1LxAcgF0PmbhN2SsUocoOaK6oaL4zgA1x46fHY6Xu
         2R+gr+2QBzUwCcPC82YWdZiZw7KbNi8siv4/06xgzF+DK1Yz6rjjj5ndawvxPvBrR0d/
         DHOQ==
X-Gm-Message-State: AOJu0Yy1yepxElYWPBmhbuF66FC0zsrLRmuBynm7dzMHa+1ZFzAj7pZA
	PVmN5K5KC2jJKy/ThrwI5tLv+TH/NKT6n+pBn/TLN5JDRrbqyUDaO8xEza+Hla5+CMGHItlXYqk
	/KEr5zqGVogFoWEWHhIUDIzRfZA9Pi4f6
X-Gm-Gg: ASbGncsXvu+ayusESzYr41EzrIKcq5s65qng/oSMnAAZFRLaBRYbEocSglOHL29fGau
	kcfBncQ8q6+V8AAKQoA55gaHfir6St+C/QCGWA/0=
X-Google-Smtp-Source: AGHT+IEc7kjtEN8K5pY8JQ0PIZ5t2WbBHG/2PZvXfWx21iMxNasOIvzikxXen7/4OpUc65U6bubG9gRfCkpmGCWUTWY=
X-Received: by 2002:a17:90b:1645:b0:2f2:a90e:74ef with SMTP id
 98e67ed59e1d1-2f2a90e847cmr11471118a91.1.1734355790919; Mon, 16 Dec 2024
 05:29:50 -0800 (PST)
MIME-Version: 1.0
References: <20241216-kmeta-audit-vartrue-v1-1-51bbb0b2085a@bootlin.com> <CADkTA4N6oZ6JbzK6bYE6bgC3FwY5tu2a+WKhEipzhpArNhyvLA@mail.gmail.com>
In-Reply-To: <CADkTA4N6oZ6JbzK6bYE6bgC3FwY5tu2a+WKhEipzhpArNhyvLA@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Mon, 16 Dec 2024 08:29:39 -0500
Message-ID: <CADkTA4MQecma7amP9At6=DiJrCMisx43cfwFUB2kA2=wUt96Kg@mail.gmail.com>
Subject: Re: [PATCH] kernel-yocto: use oe.types.boolean on KMETA_AUDIT
To: Antonin Godard <antonin.godard@bootlin.com>
Cc: openembedded-core@lists.openembedded.org, 
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: multipart/alternative; boundary="000000000000d5038b0629632c4e"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 16 Dec 2024 13:29:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/208763

--000000000000d5038b0629632c4e
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Dec 16, 2024 at 8:21=E2=80=AFAM Bruce Ashfield <bruce.ashfield@gmai=
l.com>
wrote:

>
>
> On Mon, Dec 16, 2024 at 6:35=E2=80=AFAM Antonin Godard <antonin.godard@bo=
otlin.com>
> wrote:
>
>> Following commit a39a1f7cf78ad1ca07438bce634a47e970f25047
>> ("kernel-yocto: allow early exit to configuration audit"), we can
>> disable auditing of the kernel configuration by setting KMETA_AUDIT
>> empty.
>>
>> Since the default value of this variables is "yes", use
>> oe.types.boolean() so that it will also be disabled when setting it to
>> "no", and avoid potential confusion.
>>
>
> That isn't the intent of the variable. It is being used as a flag here,
> but it can also be used to encode other information.
>
> Quite literally, if it is set to anything, the audit should happen. Only
> when it is unset should it not.
>

I hit send too soon. It's Monday.

What I wanted to add was this question: Is that still the behaviour with
the boolean call ? If so, no concerns from me.

Bruce



>
> Bruce
>
>
>>
>> Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
>> ---
>>  meta/classes-recipe/kernel-yocto.bbclass | 4 +++-
>>  1 file changed, 3 insertions(+), 1 deletion(-)
>>
>> diff --git a/meta/classes-recipe/kernel-yocto.bbclass
>> b/meta/classes-recipe/kernel-yocto.bbclass
>> index
>> a5d89dc2c8bc912539f7c9ffc25a2576920f580a..1493ba20a0c25df556df41fa4137ab=
17f67c91e7
>> 100644
>> --- a/meta/classes-recipe/kernel-yocto.bbclass
>> +++ b/meta/classes-recipe/kernel-yocto.bbclass
>> @@ -568,7 +568,9 @@ python do_config_analysis() {
>>  python do_kernel_configcheck() {
>>      import re, string, sys, subprocess
>>
>> -    audit_flag =3D d.getVar( "KMETA_AUDIT" )
>> +    audit_flag =3D False
>> +    if d.getVar("KMETA_AUDIT"):
>> +        audit_flag =3D oe.types.boolean(d.getVar("KMETA_AUDIT"))
>>      if not audit_flag:
>>         bb.note( "kernel config audit disabled, skipping .." )
>>         return
>>
>> ---
>> base-commit: e345b34703d4fa5e0bc9a82ac33b7c1fd84f99fe
>> change-id: 20241216-kmeta-audit-vartrue-6650cb20f762
>>
>> Best regards,
>> --
>> Antonin Godard <antonin.godard@bootlin.com>
>>
>>
>
> --
> - Thou shalt not follow the NULL pointer, for chaos and madness await the=
e
> at its end
> - "Use the force Harry" - Gandalf, Star Trek II
>
>

--=20
- Thou shalt not follow the NULL pointer, for chaos and madness await thee
at its end
- "Use the force Harry" - Gandalf, Star Trek II

--000000000000d5038b0629632c4e
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small"><br></div></div><br><div class=3D"gmail_quote gmail_quote_con=
tainer"><div dir=3D"ltr" class=3D"gmail_attr">On Mon, Dec 16, 2024 at 8:21=
=E2=80=AFAM Bruce Ashfield &lt;<a href=3D"mailto:bruce.ashfield@gmail.com">=
bruce.ashfield@gmail.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail=
_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204=
,204);padding-left:1ex"><div dir=3D"ltr"><div dir=3D"ltr"><div style=3D"fon=
t-size:small"><br></div></div><br><div class=3D"gmail_quote"><div dir=3D"lt=
r" class=3D"gmail_attr">On Mon, Dec 16, 2024 at 6:35=E2=80=AFAM Antonin God=
ard &lt;<a href=3D"mailto:antonin.godard@bootlin.com" target=3D"_blank">ant=
onin.godard@bootlin.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_=
quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,=
204);padding-left:1ex">Following commit a39a1f7cf78ad1ca07438bce634a47e970f=
25047<br>
(&quot;kernel-yocto: allow early exit to configuration audit&quot;), we can=
<br>
disable auditing of the kernel configuration by setting KMETA_AUDIT<br>
empty.<br>
<br>
Since the default value of this variables is &quot;yes&quot;, use<br>
oe.types.boolean() so that it will also be disabled when setting it to<br>
&quot;no&quot;, and avoid potential confusion.<br></blockquote><div><br></d=
iv><div><div style=3D"font-size:small">That isn&#39;t the intent of the var=
iable. It is being used as a flag here,</div><div style=3D"font-size:small"=
>but it can also be used to encode other information.</div><div style=3D"fo=
nt-size:small"><br></div><div style=3D"font-size:small">Quite literally, if=
 it is set to anything, the audit should happen. Only</div><div style=3D"fo=
nt-size:small">when it is unset should it not.</div></div></div></div></blo=
ckquote><div><br></div><div><div class=3D"gmail_default" style=3D"font-size=
:small">I hit send too soon. It&#39;s Monday.</div><div class=3D"gmail_defa=
ult" style=3D"font-size:small"><br></div><div class=3D"gmail_default" style=
=3D"font-size:small">What I wanted to add was this question: Is that still =
the behaviour with the boolean=C2=A0call ? If so, no concerns from me.</div=
><div class=3D"gmail_default" style=3D"font-size:small"><br></div><div clas=
s=3D"gmail_default" style=3D"font-size:small">Bruce</div><br></div><div>=C2=
=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8e=
x;border-left:1px solid rgb(204,204,204);padding-left:1ex"><div dir=3D"ltr"=
><div class=3D"gmail_quote"><div><div style=3D"font-size:small"><br></div><=
div style=3D"font-size:small">Bruce</div><div style=3D"font-size:small">=C2=
=A0</div></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0p=
x 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
Signed-off-by: Antonin Godard &lt;<a href=3D"mailto:antonin.godard@bootlin.=
com" target=3D"_blank">antonin.godard@bootlin.com</a>&gt;<br>
---<br>
=C2=A0meta/classes-recipe/kernel-yocto.bbclass | 4 +++-<br>
=C2=A01 file changed, 3 insertions(+), 1 deletion(-)<br>
<br>
diff --git a/meta/classes-recipe/kernel-yocto.bbclass b/meta/classes-recipe=
/kernel-yocto.bbclass<br>
index a5d89dc2c8bc912539f7c9ffc25a2576920f580a..1493ba20a0c25df556df41fa413=
7ab17f67c91e7 100644<br>
--- a/meta/classes-recipe/kernel-yocto.bbclass<br>
+++ b/meta/classes-recipe/kernel-yocto.bbclass<br>
@@ -568,7 +568,9 @@ python do_config_analysis() {<br>
=C2=A0python do_kernel_configcheck() {<br>
=C2=A0 =C2=A0 =C2=A0import re, string, sys, subprocess<br>
<br>
-=C2=A0 =C2=A0 audit_flag =3D d.getVar( &quot;KMETA_AUDIT&quot; )<br>
+=C2=A0 =C2=A0 audit_flag =3D False<br>
+=C2=A0 =C2=A0 if d.getVar(&quot;KMETA_AUDIT&quot;):<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 audit_flag =3D oe.types.boolean(d.getVar(&quot=
;KMETA_AUDIT&quot;))<br>
=C2=A0 =C2=A0 =C2=A0if not audit_flag:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 bb.note( &quot;kernel config audit disabled, sk=
ipping ..&quot; )<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 return<br>
<br>
---<br>
base-commit: e345b34703d4fa5e0bc9a82ac33b7c1fd84f99fe<br>
change-id: 20241216-kmeta-audit-vartrue-6650cb20f762<br>
<br>
Best regards,<br>
-- <br>
Antonin Godard &lt;<a href=3D"mailto:antonin.godard@bootlin.com" target=3D"=
_blank">antonin.godard@bootlin.com</a>&gt;<br>
<br>
</blockquote></div><div><br clear=3D"all"></div><div><br></div><span class=
=3D"gmail_signature_prefix">-- </span><br><div dir=3D"ltr" class=3D"gmail_s=
ignature">- Thou shalt not follow the NULL pointer, for chaos and madness a=
wait thee at its end<br>- &quot;Use the force Harry&quot; - Gandalf, Star T=
rek II<br><br></div></div>
</blockquote></div><div><br clear=3D"all"></div><div><br></div><span class=
=3D"gmail_signature_prefix">-- </span><br><div dir=3D"ltr" class=3D"gmail_s=
ignature">- Thou shalt not follow the NULL pointer, for chaos and madness a=
wait thee at its end<br>- &quot;Use the force Harry&quot; - Gandalf, Star T=
rek II<br><br></div></div>

--000000000000d5038b0629632c4e--

