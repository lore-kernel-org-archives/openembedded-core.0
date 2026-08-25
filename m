Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7685DC61DBE
	for <webhook@archiver.kernel.org>; Tue, 25 Aug 2026 11:31:54 +0000 (UTC)
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.19457.1787657509586460968
 for <openembedded-core@lists.openembedded.org>;
 Tue, 25 Aug 2026 04:31:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=A3VZBOZv;
 spf=pass (domain: smile.fr, ip: 209.85.221.51, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-47fe2d179e2so2378640f8f.1
        for <openembedded-core@lists.openembedded.org>; Tue, 25 Aug 2026 04:31:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787657507; cv=none;
        d=google.com; s=arc-20260327;
        b=MMZ/fmiAfYNPuFlnS4Vb6htL7NzBIv+HBvVIKDZDS0AuDIGV9gn1tKg3lZ67Xm87yx
         f7b1SvGokSOTJuww3qy+EAF9ERR8vMpVS76R/a9Mr7NEDykxzcv2mAFb9lhM6pes+bMU
         cQc5fGK7RkqurUZs4YNF9Gf1fPSSDOuIVCA9t3sUEqsOJ286QJV8sHj3wuStSEWNqYJ3
         cNllz6VnRdjpbgcMIkYIU7GJe09Y92JnW2mzvLtHoo5E4+bObHQLHEOpsV868/hmkMe2
         m4RsWewVwzqpKN6A+uKs8aQRayPkmMhjK9mjUcGzFfLZuj6qdY57FLNV7h74VIEG4vYb
         VcjQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=KrkmVJl8k7GcJ6FzvidGGKJWxitdMAqxRs1L9iQDB9U=;
        fh=EB1BAZfZqa0jfpR2inTgR20WzZDm1QaQlo82ad5gPcQ=;
        b=ZlIr0CTfdOP8w+S2nc+xu67xGpqjmVbbQmTSHFXP981UTM/yNnIiBjY0gjyBw2vdK+
         kxUCB5nVWO4t436wgvcjNTjtiqT1wKimkOByD2SuTtb4YfTYCLEQX/ogBJqa086frSTc
         FxBYsDS2hoX3GywL1xo5rqdYldHlsXHTdu/+K8c1nqP/ucyF1Q/cevX0YpXXwMlcGtgJ
         rh+uIv0X2AlUmQoZtT3UY4d/uNeEjAHaHNtT8drjmj90lJFrGWXgGd8Ye1Zz/uF/oEmk
         dSuBJEONlrmqe/7JLidcELixMl7VegAXghmOKRtVGLLVgtepS0i4VcvHiyPPb8MlZ8FZ
         uUTg==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1787657507; x=1788262307; darn=lists.openembedded.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KrkmVJl8k7GcJ6FzvidGGKJWxitdMAqxRs1L9iQDB9U=;
        b=A3VZBOZvhkuplF0YrIukLDh1eYe3yG1/22eO3nWlUOIxETrt0ZMd+Jfc8IOe/Pf9Z7
         gETgu9BiOrBuETc+WqE9g9YqMh7k3gIhxdvdsGHqe8e4uR3RieCr9Decv7EZ9TEovIgS
         oiQ7DkwswnJe2NKdiO2gwIxHXPJDwodrSI+4c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787657507; x=1788262307;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=KrkmVJl8k7GcJ6FzvidGGKJWxitdMAqxRs1L9iQDB9U=;
        b=AeBE1S1sDM0nHgqb79+izh7ePz0Diaktxu9QbR5JpPuGh4hPBVB+K6hr8eTToMaxEd
         9PaalSN/clKoFjJKkktfrxCvHk5KYcKkka4F+hB6KNr9q4yTK+SRRqoQX2rl8e4peVvc
         28G57w8np3b/zW4s05OxSO2yfH86UavKqQWz4b8usJ0fCFNFnJZtpfwv8o+Ofg0enezs
         6SHgl/Ytiwe2LUQJ94wVzkNArxjyVV+9Gb8qBhdQZBFKdmxKqTcJfdYBNva0CFUS4/u9
         QbU5lYaitW2WOcjDaXhLaUihpWcA2Tf0Xt8ehGi2qXDqimw9/Y+o4uT7+A/WJoICh8oE
         EDQA==
X-Gm-Message-State: AFuF++kxAhPYIaUZ/BwXbBo7Dmow/4OTbh8VVSqlUXkGqhxYbalJpvnV
	eaSwmRclsou8rD1Q2M8mxI2pW2KrE2zbIOtEgBpPrO+9yQoT1Ma3qzhw0MhoP4rciNGEaAZPDkU
	QRuZkUkCX4rDBOX2cYom30wUjYlkGiVGHaJc8gyhjAg==
X-Gm-Gg: AR+sD11uTvLD6++iuLI6+5Z8jZWoYGGUSPXxAbX/HyxQweryRqVKDoVVkd78ZYkRWoi
	zEILcIs92rJYJYFizIRe0HDN9HufOBIFDQWDFRC2UCX0ApcUygg32/MKncoopMntTFxEE9V7oGS
	fWquMpamEZD8UGE2tAolDORzz+hCAY18Lf/LT36yOkAoJqk0TvrvcA6ML5X+vwL+DzL/XXtuDsi
	NmAHFcn2LVg1kC9GuHncsW1OI5xnJDd3sPV1poIqTQj/jd+0Iwa4RGzt4BxaOhMXsmiMc8A6+3w
	5RjwLLe3ZtLMX4qvuGKwCVbpw2SRRMzTp/cDkXUguX391Y8=
X-Received: by 2002:a05:6000:2284:b0:482:bd9c:64ee with SMTP id
 ffacd0b85a97d-482c8111c39mr29360345f8f.6.1787657507390; Tue, 25 Aug 2026
 04:31:47 -0700 (PDT)
MIME-Version: 1.0
References: <20260722101230.34771-1-hthakar@cisco.com> <DK5AB0SRDKFY.7NIL8TCKZUUN@smile.fr>
 <18C4DECEC4DDFC1A.1355869@lists.openembedded.org> <PH7PR11MB85986421972394BF2C2D53E8ADA42@PH7PR11MB8598.namprd11.prod.outlook.com>
In-Reply-To: <PH7PR11MB85986421972394BF2C2D53E8ADA42@PH7PR11MB8598.namprd11.prod.outlook.com>
From: Yoann Congal <yoann.congal@smile.fr>
Date: Tue, 25 Aug 2026 13:31:19 +0200
X-Gm-Features: AcwNN1WcRszbDaO7pXxYO-FAKzPhJCabj743m29R5fNtMXQRY1UQHIz74m74_Vs
Message-ID: <CAMSfU+6-0HABPr=nm0kjkj=ByF1_PbU+O-ZrGyQ4zVp-OGgCqA@mail.gmail.com>
Subject: Re: [OE-core][scarthgap][PATCH 1/4] wget: Fix CVE-2026-58469
To: "Hetvi Thakar -X (hthakar - E INFOCHIPS PRIVATE LIMITED at Cisco)" <hthakar@cisco.com>
Cc: "openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="000000000000b560a80659dd725e"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 25 Aug 2026 11:31:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/244231

--000000000000b560a80659dd725e
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le jeu. 20 ao=C3=BBt 2026 =C3=A0 11:11, Hetvi Thakar -X (hthakar - E INFOCH=
IPS
PRIVATE LIMITED at Cisco) <hthakar@cisco.com> a =C3=A9crit :

> Hi Yoann,
> I hope you're doing well.
> I wanted to follow up on the patch below. It appears it may have been
> missed during the review process. Could you please take a look when you
> have a chance and share your feedback?
> Thank you for your time.
>
Hello,

It was not missed. I've answered that it lacked a master equivalent before
I can consider it for wrynose.
Has this changed? In that case, can you provide a link to the master commit
equivalent to this patch?

Regards,


> Regards,
> Hetvi
>
> ------------------------------
> *From:* openembedded-core@lists.openembedded.org <
> openembedded-core@lists.openembedded.org> on behalf of Hetvi Thakar -X
> (hthakar - E INFOCHIPS PRIVATE LIMITED at Cisco) via
> lists.openembedded.org <hthakar=3Dcisco.com@lists.openembedded.org>
> *Sent:* 23 July 2026 14:15
> *To:* Yoann Congal <yoann.congal@smile.fr>;
> openembedded-core@lists.openembedded.org <
> openembedded-core@lists.openembedded.org>
> *Cc:* xe-linux-external (Internal Group) <xe-linux-external@cisco.com>
> *Subject:* Re: [OE-core][scarthgap][PATCH 1/4] wget: Fix CVE-2026-58469
>
> Hi,
>
> I reviewed the earlier series.
> It looks like the follow-up upstream regression fixes for
> CVE-2026-58469 and CVE-2026-58472 were not included in the backport.
> These follow-up commits are required to complete the backport, and I
> have included them in my series .
> I kindly request you to review my series as well.
>
> Thanks,
> Hetvi Thakar
> ------------------------------
> *From:* Yoann Congal <yoann.congal@smile.fr>
> *Sent:* 22 July 2026 23:13
> *To:* Hetvi Thakar -X (hthakar - E INFOCHIPS PRIVATE LIMITED at Cisco) <
> hthakar@cisco.com>; openembedded-core@lists.openembedded.org <
> openembedded-core@lists.openembedded.org>
> *Cc:* xe-linux-external (Internal Group) <xe-linux-external@cisco.com>
> *Subject:* Re: [OE-core][scarthgap][PATCH 1/4] wget: Fix CVE-2026-58469
>
> On Wed Jul 22, 2026 at 12:12 PM CEST, Hetvi Thakar -X (hthakar - E
> INFOCHIPS PRIVATE LIMITED at Cisco) via lists.openembedded.org wrote:
> > From: Hetvi Thakar <hthakar@cisco.com>
> >
> > This patch applies the upstream fix as referenced in [2],
> > using the commit shown in [1].
> >
> > It also includes the upstream follow-up fixes referenced in [3]
> > and [4]. These correct the trailing whitespace check introduced
> > by the original fix and add the required <ctype.h> include for
> > isspace().
> >
> > [1]
> https://gitlab.com/gnuwget/wget/-/commit/37a40fcb450153f69537c7cbc2a7a4fb=
0b6f7826
> > [2] https://nvd.nist.gov/vuln/detail/CVE-2026-58469
> > [3]
> https://gitlab.com/gnuwget/wget/-/commit/7b1cdecc49bc77bde220fc575c8a0038=
6c3f3bcf
> > [4]
> https://gitlab.com/gnuwget/wget/-/commit/82d945ff5dc9942b78b2bf736aac298c=
24fe00a1
> >
> > Signed-off-by: Hetvi Thakar <hthakar@cisco.com>
>
> Hello,
>
> I received another similar series 2 hours before yours:
> https://patchwork.yoctoproject.org/project/oe-core/list/?series=3D48993
> Can you help review it?
>
> Regards,
> --
> Yoann Congal
> Smile ECS
>
>

--=20
Yoann Congal
Smile ECS

--000000000000b560a80659dd725e
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote g=
mail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">Le=C2=A0jeu. 20=
 ao=C3=BBt 2026 =C3=A0=C2=A011:11, Hetvi Thakar -X (hthakar - E INFOCHIPS P=
RIVATE LIMITED at Cisco) &lt;<a href=3D"mailto:hthakar@cisco.com">hthakar@c=
isco.com</a>&gt; a =C3=A9crit=C2=A0:<br></div><blockquote class=3D"gmail_qu=
ote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,20=
4);padding-left:1ex"><div class=3D"msg-6246323116425286917">




<div dir=3D"ltr">
<div style=3D"text-align:left;text-indent:0px;line-height:20px;margin-top:1=
em;margin-bottom:1em;font-family:Aptos,Aptos_EmbeddedFont,Aptos_MSFontServi=
ce,Calibri,Helvetica,sans-serif;font-size:11pt;color:rgb(0,0,0)">
Hi Yoann,</div>
<div style=3D"text-align:left;text-indent:0px;line-height:20px;margin-top:1=
em;margin-bottom:1em;font-family:Aptos,Aptos_EmbeddedFont,Aptos_MSFontServi=
ce,Calibri,Helvetica,sans-serif;font-size:11pt;color:rgb(0,0,0)">
I hope you&#39;re doing well.</div>
<div style=3D"text-align:left;text-indent:0px;line-height:20px;margin-top:1=
em;margin-bottom:1em;font-family:Aptos,Aptos_EmbeddedFont,Aptos_MSFontServi=
ce,Calibri,Helvetica,sans-serif;font-size:11pt;color:rgb(0,0,0)">
I wanted to follow up on the patch below. It appears it may have been misse=
d during the review process. Could you please take a look when you have a c=
hance and share your feedback?</div>
<div style=3D"text-align:left;text-indent:0px;line-height:20px;margin-top:1=
em;margin-bottom:1em;font-family:Aptos,Aptos_EmbeddedFont,Aptos_MSFontServi=
ce,Calibri,Helvetica,sans-serif;font-size:11pt;color:rgb(0,0,0)">
Thank you for your time.</div></div></div></blockquote><div>Hello,</div><di=
v><br></div><div>It was not missed. I&#39;ve answered that it lacked a mast=
er equivalent before I can consider it for wrynose.</div><div>Has this chan=
ged? In that case, can you provide a link to the master commit equivalent t=
o this patch?</div><div><br></div><div>Regards,</div><div>=C2=A0</div><bloc=
kquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:=
1px solid rgb(204,204,204);padding-left:1ex"><div class=3D"msg-624632311642=
5286917"><div dir=3D"ltr">
<div style=3D"text-align:left;text-indent:0px;line-height:20px;margin-top:1=
em;margin-bottom:1em;font-family:Aptos,Aptos_EmbeddedFont,Aptos_MSFontServi=
ce,Calibri,Helvetica,sans-serif;font-size:11pt;color:rgb(0,0,0)">
Regards,<br>
Hetvi</div>
<div style=3D"font-family:Aptos,Aptos_EmbeddedFont,Aptos_MSFontService,Cali=
bri,Helvetica,sans-serif;font-size:11pt;color:rgb(0,0,0)">
<br>
</div>
<div id=3D"m_-6246323116425286917appendonsend"></div>
<hr style=3D"display:inline-block;width:98%">
<div id=3D"m_-6246323116425286917divRplyFwdMsg" dir=3D"ltr"><font face=3D"C=
alibri, sans-serif" style=3D"font-size:11pt" color=3D"#000000"><b>From:</b>=
 <a href=3D"mailto:openembedded-core@lists.openembedded.org" target=3D"_bla=
nk">openembedded-core@lists.openembedded.org</a> &lt;<a href=3D"mailto:open=
embedded-core@lists.openembedded.org" target=3D"_blank">openembedded-core@l=
ists.openembedded.org</a>&gt; on behalf of Hetvi Thakar -X (hthakar - E INF=
OCHIPS PRIVATE
 LIMITED at Cisco) via <a href=3D"http://lists.openembedded.org" target=3D"=
_blank">lists.openembedded.org</a> &lt;hthakar=3D<a href=3D"mailto:cisco.co=
m@lists.openembedded.org" target=3D"_blank">cisco.com@lists.openembedded.or=
g</a>&gt;<br>
<b>Sent:</b> 23 July 2026 14:15<br>
<b>To:</b> Yoann Congal &lt;<a href=3D"mailto:yoann.congal@smile.fr" target=
=3D"_blank">yoann.congal@smile.fr</a>&gt;; <a href=3D"mailto:openembedded-c=
ore@lists.openembedded.org" target=3D"_blank">openembedded-core@lists.opene=
mbedded.org</a> &lt;<a href=3D"mailto:openembedded-core@lists.openembedded.=
org" target=3D"_blank">openembedded-core@lists.openembedded.org</a>&gt;<br>
<b>Cc:</b> xe-linux-external (Internal Group) &lt;<a href=3D"mailto:xe-linu=
x-external@cisco.com" target=3D"_blank">xe-linux-external@cisco.com</a>&gt;=
<br>
<b>Subject:</b> Re: [OE-core][scarthgap][PATCH 1/4] wget: Fix CVE-2026-5846=
9</font>
<div>=C2=A0</div>
</div>

<div dir=3D"ltr">
<div style=3D"font-family:Aptos,Aptos_EmbeddedFont,Aptos_MSFontService,Cali=
bri,Helvetica,sans-serif;font-size:11pt;color:rgb(0,0,0)">
Hi,</div>
<div style=3D"font-family:Aptos,Aptos_EmbeddedFont,Aptos_MSFontService,Cali=
bri,Helvetica,sans-serif;font-size:11pt;color:rgb(0,0,0)">
<br>
</div>
<div style=3D"font-family:Aptos,Aptos_EmbeddedFont,Aptos_MSFontService,Cali=
bri,Helvetica,sans-serif;font-size:11pt;color:rgb(0,0,0)">
I reviewed the earlier series.</div>
<div style=3D"font-family:Aptos,Aptos_EmbeddedFont,Aptos_MSFontService,Cali=
bri,Helvetica,sans-serif;font-size:11pt;color:rgb(0,0,0)">
It looks like the follow-up upstream regression fixes for</div>
<div style=3D"font-family:Aptos,Aptos_EmbeddedFont,Aptos_MSFontService,Cali=
bri,Helvetica,sans-serif;font-size:11pt;color:rgb(0,0,0)">
CVE-2026-58469 and CVE-2026-58472 were not included in the backport.</div>
<div style=3D"font-family:Aptos,Aptos_EmbeddedFont,Aptos_MSFontService,Cali=
bri,Helvetica,sans-serif;font-size:11pt;color:rgb(0,0,0)">
These follow-up commits are required to complete the backport, and I</div>
<div style=3D"font-family:Aptos,Aptos_EmbeddedFont,Aptos_MSFontService,Cali=
bri,Helvetica,sans-serif;font-size:11pt;color:rgb(0,0,0)">
have included them in my series .</div>
<div style=3D"font-family:Aptos,Aptos_EmbeddedFont,Aptos_MSFontService,Cali=
bri,Helvetica,sans-serif;font-size:11pt;color:rgb(0,0,0)">
I kindly request you to review my series as well.</div>
<div style=3D"font-family:Aptos,Aptos_EmbeddedFont,Aptos_MSFontService,Cali=
bri,Helvetica,sans-serif;font-size:11pt;color:rgb(0,0,0)">
<br>
</div>
<div style=3D"font-family:Aptos,Aptos_EmbeddedFont,Aptos_MSFontService,Cali=
bri,Helvetica,sans-serif;font-size:11pt;color:rgb(0,0,0)">
Thanks,</div>
<div style=3D"font-family:Aptos,Aptos_EmbeddedFont,Aptos_MSFontService,Cali=
bri,Helvetica,sans-serif;font-size:11pt;color:rgb(0,0,0)">
Hetvi Thakar</div>
<div id=3D"m_-6246323116425286917x_appendonsend"></div>
<hr style=3D"display:inline-block;width:98%">
<div id=3D"m_-6246323116425286917x_divRplyFwdMsg" dir=3D"ltr"><font face=3D=
"Calibri, sans-serif" color=3D"#000000" style=3D"font-size:11pt"><b>From:</=
b> Yoann Congal &lt;<a href=3D"mailto:yoann.congal@smile.fr" target=3D"_bla=
nk">yoann.congal@smile.fr</a>&gt;<br>
<b>Sent:</b> 22 July 2026 23:13<br>
<b>To:</b> Hetvi Thakar -X (hthakar - E INFOCHIPS PRIVATE LIMITED at Cisco)=
 &lt;<a href=3D"mailto:hthakar@cisco.com" target=3D"_blank">hthakar@cisco.c=
om</a>&gt;; <a href=3D"mailto:openembedded-core@lists.openembedded.org" tar=
get=3D"_blank">openembedded-core@lists.openembedded.org</a> &lt;<a href=3D"=
mailto:openembedded-core@lists.openembedded.org" target=3D"_blank">openembe=
dded-core@lists.openembedded.org</a>&gt;<br>
<b>Cc:</b> xe-linux-external (Internal Group) &lt;<a href=3D"mailto:xe-linu=
x-external@cisco.com" target=3D"_blank">xe-linux-external@cisco.com</a>&gt;=
<br>
<b>Subject:</b> Re: [OE-core][scarthgap][PATCH 1/4] wget: Fix CVE-2026-5846=
9</font>
<div>=C2=A0</div>
</div>
<div><font size=3D"2"><span style=3D"font-size:11pt">
<div>On Wed Jul 22, 2026 at 12:12 PM CEST, Hetvi Thakar -X (hthakar - E INF=
OCHIPS PRIVATE LIMITED at Cisco) via <a href=3D"http://lists.openembedded.o=
rg" target=3D"_blank">lists.openembedded.org</a> wrote:<br>
&gt; From: Hetvi Thakar &lt;<a href=3D"mailto:hthakar@cisco.com" target=3D"=
_blank">hthakar@cisco.com</a>&gt;<br>
&gt;<br>
&gt; This patch applies the upstream fix as referenced in [2],<br>
&gt; using the commit shown in [1].<br>
&gt;<br>
&gt; It also includes the upstream follow-up fixes referenced in [3]<br>
&gt; and [4]. These correct the trailing whitespace check introduced<br>
&gt; by the original fix and add the required &lt;ctype.h&gt; include for<b=
r>
&gt; isspace().<br>
&gt;<br>
&gt; [1] <a href=3D"https://gitlab.com/gnuwget/wget/-/commit/37a40fcb450153=
f69537c7cbc2a7a4fb0b6f7826" target=3D"_blank">
https://gitlab.com/gnuwget/wget/-/commit/37a40fcb450153f69537c7cbc2a7a4fb0b=
6f7826</a><br>
&gt; [2] <a href=3D"https://nvd.nist.gov/vuln/detail/CVE-2026-58469" target=
=3D"_blank">https://nvd.nist.gov/vuln/detail/CVE-2026-58469</a><br>
&gt; [3] <a href=3D"https://gitlab.com/gnuwget/wget/-/commit/7b1cdecc49bc77=
bde220fc575c8a00386c3f3bcf" target=3D"_blank">
https://gitlab.com/gnuwget/wget/-/commit/7b1cdecc49bc77bde220fc575c8a00386c=
3f3bcf</a><br>
&gt; [4] <a href=3D"https://gitlab.com/gnuwget/wget/-/commit/82d945ff5dc994=
2b78b2bf736aac298c24fe00a1" target=3D"_blank">
https://gitlab.com/gnuwget/wget/-/commit/82d945ff5dc9942b78b2bf736aac298c24=
fe00a1</a><br>
&gt;<br>
&gt; Signed-off-by: Hetvi Thakar &lt;<a href=3D"mailto:hthakar@cisco.com" t=
arget=3D"_blank">hthakar@cisco.com</a>&gt;<br>
<br>
Hello,<br>
<br>
I received another similar series 2 hours before yours:<br>
<a href=3D"https://patchwork.yoctoproject.org/project/oe-core/list/?series=
=3D48993" target=3D"_blank">https://patchwork.yoctoproject.org/project/oe-c=
ore/list/?series=3D48993</a><br>
Can you help review it?<br>
<br>
Regards,<br>
-- <br>
Yoann Congal<br>
Smile ECS<br>
<br>
</div>
</span></font></div>
</div>
</div>

</div></blockquote></div><div><br clear=3D"all"></div><br><span class=3D"gm=
ail_signature_prefix">-- </span><br><div dir=3D"ltr" class=3D"gmail_signatu=
re"><div dir=3D"ltr"><font face=3D"Raleway, regular">Yoann Congal</font><di=
v><font face=3D"Raleway, regular">Smile ECS</font></div></div></div></div>

--000000000000b560a80659dd725e--

