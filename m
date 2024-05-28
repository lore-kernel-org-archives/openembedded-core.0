Return-Path: <vanusuri@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 83AEAC25B7C
	for <webhook@archiver.kernel.org>; Tue, 28 May 2024 09:24:21 +0000 (UTC)
Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com [209.85.208.179])
 by mx.groups.io with SMTP id smtpd.web10.17887.1716888259496855021
 for <openembedded-core@lists.openembedded.org>;
 Tue, 28 May 2024 02:24:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=We6u/umD;
 spf=pass (domain: mvista.com, ip: 209.85.208.179, mailfrom: vanusuri@mvista.com)
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-2e9819a6327so6677611fa.1
        for <openembedded-core@lists.openembedded.org>; Tue, 28 May 2024 02:24:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1716888258; x=1717493058; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=U8qsob4j0ToWBEUU5r5PFlwFY8bh2rfHlEHIZujg/ps=;
        b=We6u/umDMob0OvaE70afhQrzzPidzMs9KVvpzHvAlgEFQ7i388HS8lRrmSiHOVSjS3
         9E+FFyCxIflOXVDTlcPIIbS2G7hXrCaIz80z+8OL7sFjlTiUpVX+m26tRPcg800vW8d2
         Mgv+xbsNdGuIYIPsdkUKBN/rp1BCEva5pht8A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716888258; x=1717493058;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=U8qsob4j0ToWBEUU5r5PFlwFY8bh2rfHlEHIZujg/ps=;
        b=ZycDI2Dfr8cXm/O/veFS6vCVYAAmUMJGgCsx/cV50XyqDLKFW7lY7ZPZkicsL5UmNL
         An9bQV+8CeB8VAW+SNAXVKDnsuQVIvRcW20Y5SpWdKh0Zmu4eWLaJjepN44DQ3Xm1vPH
         I2dVh/UOmvuQOHuiA1QE3G69LOx2ufMTasvVOz2TR495VYM3cTzdAQZthWvzyCn2lG/h
         doxqI+b9LT/ySt0WPxAu9SGDF790TyrQMDg7RXzc9fytGvDJtFAx3nfemWPv3lSdI9xC
         qM2te0kKlEsskwhUn7lx7zDTk021fNFN7GzSJDrIRsq3xLi+xzrf8097aUWciQcwaecZ
         xfLg==
X-Forwarded-Encrypted: i=1; AJvYcCWJFGlxhpd/zW19pjRlb/evY/gvjASNE9u7MCKRH0q5n+guvH5kj8n+QLvvNQfUauwQPdnOO/gMjznfGjZo1vxKuNe1cfuRyTGNbVP6q4SLQpyl8WJoJKg2
X-Gm-Message-State: AOJu0Yxm051oKnm4n2MisYjukLmlutlFY4PZs0YiDcN91SzyY1aICyzB
	Q+twF9W412rfpK+bflA02LFp+Eeb4LJW/WcFbf0xuTwWT7WIcQxy7R+4tKEB/Pk7wTDSllaST3u
	Vt6L91KILILQZX0YoqfnTQYlYkwJHEA2wmGtePA==
X-Google-Smtp-Source: AGHT+IF0AUsbRPl4bp1p/wMrcLL36rAi6UpCVReiO40PxXlLn/nd6E3s0DKSwvQHzUB5SiO9QgASDcf8fm6jsznOYuY=
X-Received: by 2002:a2e:b05a:0:b0:2e7:c29:dadc with SMTP id
 38308e7fff4ca-2e95b24e06amr58209201fa.34.1716888257494; Tue, 28 May 2024
 02:24:17 -0700 (PDT)
MIME-Version: 1.0
References: <20240419133544.3010310-1-soumya.sambu@windriver.com>
 <AS1PR10MB569780C784F31D36500770E6FD0D2@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
 <BYAPR11MB3397DAA98F10A7A3C9CFCCE881172@BYAPR11MB3397.namprd11.prod.outlook.com>
In-Reply-To: <BYAPR11MB3397DAA98F10A7A3C9CFCCE881172@BYAPR11MB3397.namprd11.prod.outlook.com>
From: Vijay Anusuri <vanusuri@mvista.com>
Date: Tue, 28 May 2024 14:54:05 +0530
Message-ID: <CANQUz1_KpA+ajU0KGFfq=i3rSe6ZRzz4bBeG7RbumL_KGFx3AQ@mail.gmail.com>
Subject: Re: [OE-core][kirkstone][PATCH 1/1] util-linux: Fix CVE-2024-28085
To: "Sambu, Soumya" <Soumya.Sambu@windriver.com>
Cc: "Marko, Peter" <Peter.Marko@siemens.com>, 
	"openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="000000000000b51b4906198032e7"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 28 May 2024 09:24:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/199964

--000000000000b51b4906198032e7
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Soumya,

Along with Debian, Suse also fixed the issue with those 4 dependent commits
(https://bugzilla.suse.com/show_bug.cgi?id=3D1221831).

Debian added the "--disable-use-tty-group" configure option during build
along with patch for complete fix (
https://launchpad.net/ubuntu/+source/util-linux/2.37.2-4ubuntu3.4). We
already have that configure option in the recipe file.

I think we can go ahead with the debian patch fix.

Thanks & Regards,
Vijay

On Thu, Apr 25, 2024 at 8:56=E2=80=AFAM Sambu, Soumya <Soumya.Sambu@windriv=
er.com>
wrote:

> Hi Peter,
>
> Thank you for providing the details.
>
> Based on the information regarding the vulnerability report and the commi=
t
> history provided, it appears that our code is indeed vulnerable as the
> commit introducing the vulnerability still exists in our codebase.
>
> Our util-linux version in the kirkstone branch is v2.37.4, and the
> vulnerable code was introduced in commit cdd3cc7fa4 back in 2013.
>
> I've also noted that Debian is also fixing the CVE, along with the
> dependent commits mentioned in the offending commits list. They have
> already added upstream patches to address CVE-2024-28085 (839ff33b), as
> detailed in their commit here:
> https://salsa.debian.org/debian/util-linux/-/commit/839ff33b8002189411b67=
9cc9ee99d1a99e099cb
> .
>
> Please review the provided information, and let me know if there's
> anything else we need to consider.
>
> Best Regards,
> Soumya
> ------------------------------
> *From:* Marko, Peter <Peter.Marko@siemens.com>
> *Sent:* Friday, April 19, 2024 10:11 PM
> *To:* Sambu, Soumya <Soumya.Sambu@windriver.com>;
> openembedded-core@lists.openembedded.org <
> openembedded-core@lists.openembedded.org>; vanusuri@mvista.com <
> vanusuri@mvista.com>
> *Subject:* RE: [OE-core][kirkstone][PATCH 1/1] util-linux: Fix
> CVE-2024-28085
>
> CAUTION: This email comes from a non Wind River email account!
> Do not click links or open attachments unless you recognize the sender an=
d
> know the content is safe.
>
> Identical patch was already submitted and then requested to be ignored
> because the issue is apparently introduced by one of the added patches.
> https://lists.openembedded.org/g/openembedded-core/message/197670
>
> Since the vulnerability report claims that our version IS vulnerable, it
> would be interesting to know where the truth is...
> https://github.com/skyler-ferrante/CVE-2024-28085 -> The vulnerable code
> was introduced in commit cdd3cc7fa4 (2013).
>
> Peter
>

--000000000000b51b4906198032e7
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div><div><div>Hi Soumya,<br><br></div>Along with Debian, =
Suse also fixed the issue with those 4 dependent commits (<a href=3D"https:=
//bugzilla.suse.com/show_bug.cgi?id=3D1221831">https://bugzilla.suse.com/sh=
ow_bug.cgi?id=3D1221831</a>).<br><br></div><div>Debian added the &quot;-<sp=
an style=3D"font-family:arial,sans-serif">-disable-use-tty-group&quot; conf=
igure option during build along with patch for complete fix (</span><a href=
=3D"https://launchpad.net/ubuntu/+source/util-linux/2.37.2-4ubuntu3.4">http=
s://launchpad.net/ubuntu/+source/util-linux/2.37.2-4ubuntu3.4</a>). We alre=
ady have that configure option in the recipe file.<br></div><div><br></div>=
I think we can go ahead with the debian patch fix.<br><br></div><div>Thanks=
 &amp; Regards,</div><div>Vijay<br></div></div><br><div class=3D"gmail_quot=
e"><div dir=3D"ltr" class=3D"gmail_attr">On Thu, Apr 25, 2024 at 8:56=E2=80=
=AFAM Sambu, Soumya &lt;<a href=3D"mailto:Soumya.Sambu@windriver.com">Soumy=
a.Sambu@windriver.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_qu=
ote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,20=
4);padding-left:1ex"><div class=3D"msg5272032167267536200">




<div dir=3D"ltr">
<div style=3D"text-align:left;text-indent:0px;margin:0px;font-family:Aptos,=
Aptos_EmbeddedFont,Aptos_MSFontService,Calibri,Helvetica,sans-serif;font-si=
ze:12pt;color:rgb(0,0,0)">
Hi Peter,</div>
<div style=3D"text-align:left;text-indent:0px;margin:0px;font-family:Aptos,=
Aptos_EmbeddedFont,Aptos_MSFontService,Calibri,Helvetica,sans-serif;font-si=
ze:12pt;color:rgb(0,0,0)">
<br>
</div>
<div style=3D"text-align:left;text-indent:0px;margin:0px;font-family:Aptos,=
Aptos_EmbeddedFont,Aptos_MSFontService,Calibri,Helvetica,sans-serif;font-si=
ze:12pt;color:rgb(0,0,0)">
Thank you for providing the details.</div>
<div style=3D"text-align:left;text-indent:0px;margin:0px;font-family:Aptos,=
Aptos_EmbeddedFont,Aptos_MSFontService,Calibri,Helvetica,sans-serif;font-si=
ze:12pt;color:rgb(0,0,0)">
<br>
</div>
<div style=3D"text-align:left;text-indent:0px;margin:0px;font-family:Aptos,=
Aptos_EmbeddedFont,Aptos_MSFontService,Calibri,Helvetica,sans-serif;font-si=
ze:12pt;color:rgb(0,0,0)">
Based on the information regarding the vulnerability report and the commit =
history provided, it appears that our code is indeed vulnerable as the comm=
it introducing the vulnerability still exists in our codebase.</div>
<div style=3D"text-align:left;text-indent:0px;margin:0px;font-family:Aptos,=
Aptos_EmbeddedFont,Aptos_MSFontService,Calibri,Helvetica,sans-serif;font-si=
ze:12pt;color:rgb(0,0,0)">
<br>
</div>
<div style=3D"text-align:left;text-indent:0px;margin:0px;font-family:Aptos,=
Aptos_EmbeddedFont,Aptos_MSFontService,Calibri,Helvetica,sans-serif;font-si=
ze:12pt;color:rgb(0,0,0)">
Our util-linux version in the kirkstone branch is v2.37.4, and the vulnerab=
le code was introduced in commit cdd3cc7fa4 back in 2013.</div>
<div style=3D"text-align:left;text-indent:0px;margin:0px;font-family:Aptos,=
Aptos_EmbeddedFont,Aptos_MSFontService,Calibri,Helvetica,sans-serif;font-si=
ze:12pt;color:rgb(0,0,0)">
<br>
</div>
<div style=3D"text-align:left;text-indent:0px;margin:0px;font-family:Aptos,=
Aptos_EmbeddedFont,Aptos_MSFontService,Calibri,Helvetica,sans-serif">
<span style=3D"font-size:12pt;color:rgb(0,0,0)">I&#39;ve also noted that De=
bian is also fixing the CVE, along with the dependent commits mentioned in =
the offending commits list. They have already added upstream patches to add=
ress CVE-2024-28085 (839ff33b),
 as detailed in their commit here: </span><span style=3D"font-size:16px;col=
or:rgb(51,51,51);background-color:rgb(255,255,255)">=C2=A0</span><span styl=
e=3D"font-size:16px;color:rgb(0,0,0)"><a href=3D"https://salsa.debian.org/d=
ebian/util-linux/-/commit/839ff33b8002189411b679cc9ee99d1a99e099cb" id=3D"m=
_5272032167267536200OWAc39f4baa-9701-2936-4c46-6143bb8957d1" style=3D"margi=
n:0px;text-align:left" target=3D"_blank">https://salsa.debian.org/debian/ut=
il-linux/-/commit/839ff33b8002189411b679cc9ee99d1a99e099cb</a></span><span =
style=3D"font-size:12pt;color:rgb(0,0,0)">.</span></div>
<div style=3D"text-align:left;text-indent:0px;margin:0px;font-family:Aptos,=
Aptos_EmbeddedFont,Aptos_MSFontService,Calibri,Helvetica,sans-serif;font-si=
ze:12pt;color:rgb(0,0,0)">
<br>
</div>
<div style=3D"text-align:left;text-indent:0px;margin:0px;font-family:Aptos,=
Aptos_EmbeddedFont,Aptos_MSFontService,Calibri,Helvetica,sans-serif;font-si=
ze:12pt;color:rgb(0,0,0)">
Please review the provided information, and let me know if there&#39;s anyt=
hing else we need to consider.</div>
<div style=3D"text-align:left;text-indent:0px;margin:0px;font-family:Aptos,=
Aptos_EmbeddedFont,Aptos_MSFontService,Calibri,Helvetica,sans-serif;font-si=
ze:12pt;color:rgb(0,0,0)">
<br>
</div>
<div style=3D"text-align:left;text-indent:0px;margin:0px;font-family:Aptos,=
Aptos_EmbeddedFont,Aptos_MSFontService,Calibri,Helvetica,sans-serif;font-si=
ze:12pt;color:rgb(0,0,0)">
Best Regards,</div>
<div style=3D"text-align:left;text-indent:0px;margin:0px;font-family:Aptos,=
Aptos_EmbeddedFont,Aptos_MSFontService,Calibri,Helvetica,sans-serif;font-si=
ze:12pt;color:rgb(0,0,0)">
Soumya</div>
<div id=3D"m_5272032167267536200appendonsend"></div>
<hr style=3D"display:inline-block;width:98%">
<div id=3D"m_5272032167267536200divRplyFwdMsg" dir=3D"ltr"><font face=3D"Ca=
libri, sans-serif" style=3D"font-size:11pt" color=3D"#000000"><b>From:</b> =
Marko, Peter &lt;<a href=3D"mailto:Peter.Marko@siemens.com" target=3D"_blan=
k">Peter.Marko@siemens.com</a>&gt;<br>
<b>Sent:</b> Friday, April 19, 2024 10:11 PM<br>
<b>To:</b> Sambu, Soumya &lt;<a href=3D"mailto:Soumya.Sambu@windriver.com" =
target=3D"_blank">Soumya.Sambu@windriver.com</a>&gt;; <a href=3D"mailto:ope=
nembedded-core@lists.openembedded.org" target=3D"_blank">openembedded-core@=
lists.openembedded.org</a> &lt;<a href=3D"mailto:openembedded-core@lists.op=
enembedded.org" target=3D"_blank">openembedded-core@lists.openembedded.org<=
/a>&gt;; <a href=3D"mailto:vanusuri@mvista.com" target=3D"_blank">vanusuri@=
mvista.com</a> &lt;<a href=3D"mailto:vanusuri@mvista.com" target=3D"_blank"=
>vanusuri@mvista.com</a>&gt;<br>
<b>Subject:</b> RE: [OE-core][kirkstone][PATCH 1/1] util-linux: Fix CVE-202=
4-28085</font>
<div>=C2=A0</div>
</div>
<div><font size=3D"2"><span style=3D"font-size:11pt">
<div>CAUTION: This email comes from a non Wind River email account!<br>
Do not click links or open attachments unless you recognize the sender and =
know the content is safe.<br>
<br>
Identical patch was already submitted and then requested to be ignored beca=
use the issue is apparently introduced by one of the added patches.<br>
<a href=3D"https://lists.openembedded.org/g/openembedded-core/message/19767=
0" target=3D"_blank">https://lists.openembedded.org/g/openembedded-core/mes=
sage/197670</a><br>
<br>
Since the vulnerability report claims that our version IS vulnerable, it wo=
uld be interesting to know where the truth is...<br>
<a href=3D"https://github.com/skyler-ferrante/CVE-2024-28085" target=3D"_bl=
ank">https://github.com/skyler-ferrante/CVE-2024-28085</a> -&gt; The vulner=
able code was introduced in commit cdd3cc7fa4 (2013).<br>
<br>
Peter<br>
</div>
</span></font></div>
</div>

</div></blockquote></div>

--000000000000b51b4906198032e7--

