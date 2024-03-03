Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F2391C5475B
	for <webhook@archiver.kernel.org>; Sun,  3 Mar 2024 14:10:42 +0000 (UTC)
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
 by mx.groups.io with SMTP id smtpd.web10.73575.1709475032745499989
 for <openembedded-core@lists.openembedded.org>;
 Sun, 03 Mar 2024 06:10:33 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile-fr.20230601.gappssmtp.com header.s=20230601 header.b=BNoFvxZO;
 spf=pass (domain: smile.fr, ip: 209.85.218.52, mailfrom: yoann.congal@smile.fr)
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-a44d084bfe1so139439866b.1
        for <openembedded-core@lists.openembedded.org>; Sun, 03 Mar 2024 06:10:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile-fr.20230601.gappssmtp.com; s=20230601; t=1709475031; x=1710079831; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=2joqAN3CHM/BXGGU1VMoqXPUKuWRukpv6HSnkyfUiWY=;
        b=BNoFvxZO7xfBmHPYNaDOhdjy7w85K5mR/XwsknNCzVlOQ90Q4lmlrSBOkkVShHmHaQ
         eZgB37Ff2KqlTH7hqm42WXlXmox2j//oDANdt6BVZoXXMmxAewq+DFuLf68b7SJ5lTSc
         MDvExFsvIksISdSCgbVQOuUVQSbUNoPzom3QsO42rY/Ojc7eZpgvKKmyfLuLpaArvD/R
         hfVJMb9wpMjW5yRaDjBVulbYkNgYP5NQAE2V4u8O7BjCK09+7f9MHC1ZnXC8Z/2F3ysu
         A9LpYjtCn/FeeYgZEKd+aqGk5E00ehiZLDQi3/ty9S+URREfyY5Pi0TLzqF9o7t1IX03
         vcBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709475031; x=1710079831;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2joqAN3CHM/BXGGU1VMoqXPUKuWRukpv6HSnkyfUiWY=;
        b=tWU2Hw3ju4xPnd9Pl0xR5akHCezJINjgOBuC9pAVoC8BwKL509DBVihooJjgQDMIH2
         363KAGsCRPtPb7HpkIz1eLff6eQysyZBUStNbDqbNS+TKfYX9r0m+nZvj7QytTSzdZQu
         WhilyUzHI7XdQ1ahMe5LFo/K3isnKgfISRCAJy/Kk41cXfKPjdWF4V5ubGMo5G3buNrM
         3oAKWdjKdXvR3/1JWzfb5IXeSinCFGdiSgcmf7VNF1baO1oqwybaH92izST4ION5kqPQ
         WIHqzKIUCO3514I099a4HrSv/qXpMsrSN+Z0FvGP5P/b8/A+LcB7H5phJs1ZDT4ABU0L
         sbgw==
X-Forwarded-Encrypted: i=1; AJvYcCVbamGc+gvYPnZ+eWKNJdyXpYLCwpgcCe0SPXjFgv872g2MgelDcn5ivykLIH+Co1QwDsDzuT9oLRyZUaTUL29ldpcPPJ27JyWfmMGQ59rvSN3QtAtMh7qH
X-Gm-Message-State: AOJu0YwqfJce25gTz9xEHxD0WJvNza4E2lL4UibNuMMHO4QEeBMf+aOI
	gztqy5NifDjlqTfF9oXmOmWKYh6+xewum/Y4v+nFEpURXNBlNDii0Ot8qbPLOL/Lz1sQ9AmOT1r
	5W5wIDa4kect2UCCalVGGBw42XJ78/4+wV80pOA==
X-Google-Smtp-Source: AGHT+IE+c6z2CCJk4vob/JRmsonXXxTADRDBn4hwBvnDZHhabqI5OJnZ/O1mrlU9RirN1aj2M5OY0dTPEf9jYwndaso=
X-Received: by 2002:a17:906:eb16:b0:a45:3ad3:1f93 with SMTP id
 mb22-20020a170906eb1600b00a453ad31f93mr315627ejb.44.1709475031023; Sun, 03
 Mar 2024 06:10:31 -0800 (PST)
MIME-Version: 1.0
References: <20240303111845.7A4DE106912@builder.sakoman.com>
 <f9e113a874a6c71e73bed3a062da1b06520dcabb.camel@posteo.net>
 <d30f4cd0293437624736e21d82d14081f0c23d48.camel@linuxfoundation.org> <AS1PR10MB5697DA05C2BBC97F0BAFF040FD5C2@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
In-Reply-To: <AS1PR10MB5697DA05C2BBC97F0BAFF040FD5C2@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
From: Yoann CONGAL <yoann.congal@smile.fr>
Date: Sun, 3 Mar 2024 15:10:05 +0100
Message-ID: <CAMSfU+7uTvEZwb2vGME5UksGOnT+56m6_SSa8YR=A3bwmLHN_Q@mail.gmail.com>
Subject: Re: [yocto-security] OE-core CVE metrics for master on Sun 03 Mar
 2024 01:00:01 AM HST
To: peter.marko@siemens.com
Cc: "richard.purdie@linuxfoundation.org" <richard.purdie@linuxfoundation.org>, 
	=?UTF-8?B?U2ltb25lIFdlacOf?= <simone.p.weiss@posteo.com>, 
	Steve Sakoman <steve@sakoman.com>, 
	"openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>, 
	"yocto-security@lists.yoctoproject.org" <yocto-security@lists.yoctoproject.org>
Content-Type: multipart/alternative; boundary="000000000000fa20d10612c22ba3"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 03 Mar 2024 14:10:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/196564

--000000000000fa20d10612c22ba3
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le dim. 3 mars 2024 =C3=A0 14:18, Peter Marko via lists.yoctoproject.org
<peter.marko=3Dsiemens.com@lists.yoctoproject.org> a =C3=A9crit :

> I already mentioned this last week.
> https://lists.openembedded.org/g/openembedded-core/message/196199
>
> I think that partial NVD DB update is not working properly as things whic=
h
> were corrected by NVD are still showing up in patchmetrics but not in ema=
il
> reports.
>

The yocto-metrics repo shows that CVE-2022-3563 has been "Unpatched" since
its creation 31/10/2023.
+1 on the "partial NVD DB update is not working properly" hyptohesis

Looking into this, I've started to look at the NVD API: IIUC, a partial
update is done by requesting every CVE that have a lastModified field after
our last update.

But from the NVD API doc:
https://nvd.nist.gov/developers/vulnerabilities#cves-lastModDates

> A CVE's lastModified *does* *not* change when any of the follow actions
> occur:
> [...]
> The NVD modifies a CPE record previously associated with the CVE record


If I read that correctly, this means that CVEs CPE updated by the NVD
(which is what we frequently request to the NVD) would not have their
lastModified
field updated and then, missed by the partial update. Sounds like a bug, no=
?

For example:
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2023-6779
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2023-6780
> kirkstone has glibc 2.35 and nvd recently fixed these to >=3D 2.37 and th=
ese
> ate still in patchmetrics.
>
> Email reports maybe use different (not-broken yet) NVD DB cache or make
> full update instead of incremental?
>
> Peter
>
> -----Original Message-----
> From: yocto-security@lists.yoctoproject.org <
> yocto-security@lists.yoctoproject.org> On Behalf Of Richard Purdie via
> lists.yoctoproject.org
> Sent: Sunday, March 3, 2024 13:36
> To: Simone Wei=C3=9F <simone.p.weiss@posteo.com>; Steve Sakoman <
> steve@sakoman.com>; openembedded-core@lists.openembedded.org;
> yocto-security@lists.yoctoproject.org
> Subject: Re: [yocto-security] OE-core CVE metrics for master on Sun 03 Ma=
r
> 2024 01:00:01 AM HST
>
> > On Sun, 2024-03-03 at 11:49 +0000, Simone Wei=C3=9F wrote:
> > > quick check: No news for any old issue, except cpio, which is dispute=
d
> > > by the maintainer.
> >
> > Thanks, that is really useful to know!
> >
> > >
> > > > Full list:  Found 41 unpatched CVEs
> >
> > I'm a bit puzzled/worried that our patch metrics page says 50 rather
> than 41:
> >
> >
> https://autobuilder.yocto.io/pub/non-release/patchmetrics/cve-status-mast=
er.txt
> >
> >:/
> >
> > Does anyone know why?
> >
> > Cheers,
> >
> > Richard
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#1091):
> https://lists.yoctoproject.org/g/yocto-security/message/1091
> Mute This Topic: https://lists.yoctoproject.org/mt/104700791/4316185
> Group Owner: yocto-security+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/yocto-security/unsub [
> yoann.congal@smile.fr]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--=20
Yoann Congal
Smile ECS - Tech expert

--000000000000fa20d10612c22ba3
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">Le=C2=A0dim. 3 mars 2024 =C3=A0=C2=A0=
14:18, Peter Marko via <a href=3D"http://lists.yoctoproject.org" target=3D"=
_blank">lists.yoctoproject.org</a> &lt;peter.marko=3D<a href=3D"mailto:siem=
ens.com@lists.yoctoproject.org" target=3D"_blank">siemens.com@lists.yoctopr=
oject.org</a>&gt; a =C3=A9crit=C2=A0:<br></div><blockquote class=3D"gmail_q=
uote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,2=
04);padding-left:1ex">I already mentioned this last week.<br>
<a href=3D"https://lists.openembedded.org/g/openembedded-core/message/19619=
9" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/g/op=
enembedded-core/message/196199</a><br>
<br>
I think that partial NVD DB update is not working properly as things which =
were corrected by NVD are still showing up in patchmetrics but not in email=
 reports.<br></blockquote><div><br></div><div>The yocto-metrics repo shows =
that CVE-2022-3563 has been &quot;Unpatched&quot; since its creation 31/10/=
2023.</div><div>+1 on the &quot;partial NVD DB update is not working proper=
ly&quot; hyptohesis<br></div><div><br></div><div>Looking into this, I&#39;v=
e started to look at the NVD API: IIUC, a partial update is done by request=
ing every CVE that have a <span class=3D"gmail-json-obj">lastModified field=
 after our last update.<br></span></div><div><br></div><div>But from the NV=
D API doc: <a href=3D"https://nvd.nist.gov/developers/vulnerabilities#cves-=
lastModDates">https://nvd.nist.gov/developers/vulnerabilities#cves-lastModD=
ates</a></div><div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0p=
x 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
							A CVE&#39;s <span class=3D"gmail-json-obj">lastModified</span> <b>do=
es</b> <b>not</b> change when any of the follow actions occur:=20
						<br>[...]<br>The NVD modifies a CPE record previously associated with=
 the CVE record</blockquote></div><div><br></div><div>If I read that correc=
tly, this means that CVEs CPE updated by the NVD (which is what we frequent=
ly request to the NVD) would not have their <span class=3D"gmail-json-obj">=
lastModified field updated and then, missed by the partial update. Sounds l=
ike a bug, no?<br></span></div><div><br></div><blockquote class=3D"gmail_qu=
ote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,20=
4);padding-left:1ex">

For example:<br>
<a href=3D"https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2023-6779=
" rel=3D"noreferrer" target=3D"_blank">https://web.nvd.nist.gov/view/vuln/d=
etail?vulnId=3DCVE-2023-6779</a><br>
<a href=3D"https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2023-6780=
" rel=3D"noreferrer" target=3D"_blank">https://web.nvd.nist.gov/view/vuln/d=
etail?vulnId=3DCVE-2023-6780</a><br>
kirkstone has glibc 2.35 and nvd recently fixed these to &gt;=3D 2.37 and t=
hese ate still in patchmetrics.<br>
<br>
Email reports maybe use different (not-broken yet) NVD DB cache or make ful=
l update instead of incremental?<br>
<br>
Peter<br>
<br>
-----Original Message-----<br>
From: <a href=3D"mailto:yocto-security@lists.yoctoproject.org" target=3D"_b=
lank">yocto-security@lists.yoctoproject.org</a> &lt;<a href=3D"mailto:yocto=
-security@lists.yoctoproject.org" target=3D"_blank">yocto-security@lists.yo=
ctoproject.org</a>&gt; On Behalf Of Richard Purdie via <a href=3D"http://li=
sts.yoctoproject.org" rel=3D"noreferrer" target=3D"_blank">lists.yoctoproje=
ct.org</a><br>
Sent: Sunday, March 3, 2024 13:36<br>
To: Simone Wei=C3=9F &lt;<a href=3D"mailto:simone.p.weiss@posteo.com" targe=
t=3D"_blank">simone.p.weiss@posteo.com</a>&gt;; Steve Sakoman &lt;<a href=
=3D"mailto:steve@sakoman.com" target=3D"_blank">steve@sakoman.com</a>&gt;; =
<a href=3D"mailto:openembedded-core@lists.openembedded.org" target=3D"_blan=
k">openembedded-core@lists.openembedded.org</a>; <a href=3D"mailto:yocto-se=
curity@lists.yoctoproject.org" target=3D"_blank">yocto-security@lists.yocto=
project.org</a><br>
Subject: Re: [yocto-security] OE-core CVE metrics for master on Sun 03 Mar =
2024 01:00:01 AM HST<br>
<br>
&gt; On Sun, 2024-03-03 at 11:49 +0000, Simone Wei=C3=9F wrote:<br>
&gt; &gt; quick check: No news for any old issue, except cpio, which is dis=
puted <br>
&gt; &gt; by the maintainer.<br>
&gt;<br>
&gt; Thanks, that is really useful to know!<br>
&gt;<br>
&gt; &gt; <br>
&gt; &gt; &gt; Full list:=C2=A0 Found 41 unpatched CVEs<br>
&gt;<br>
&gt; I&#39;m a bit puzzled/worried that our patch metrics page says 50 rath=
er than 41:<br>
&gt;<br>
&gt; <a href=3D"https://autobuilder.yocto.io/pub/non-release/patchmetrics/c=
ve-status-master.txt" rel=3D"noreferrer" target=3D"_blank">https://autobuil=
der.yocto.io/pub/non-release/patchmetrics/cve-status-master.txt</a><br>
&gt;<br>
&gt;:/<br>
&gt;<br>
&gt; Does anyone know why?<br>
&gt;<br>
&gt; Cheers,<br>
&gt;<br>
&gt; Richard<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#1091): <a href=3D"https://lists.yoctoproject.org/g/yoct=
o-security/message/1091" rel=3D"noreferrer" target=3D"_blank">https://lists=
.yoctoproject.org/g/yocto-security/message/1091</a><br>
Mute This Topic: <a href=3D"https://lists.yoctoproject.org/mt/104700791/431=
6185" rel=3D"noreferrer" target=3D"_blank">https://lists.yoctoproject.org/m=
t/104700791/4316185</a><br>
Group Owner: <a href=3D"mailto:yocto-security%2Bowner@lists.yoctoproject.or=
g" target=3D"_blank">yocto-security+owner@lists.yoctoproject.org</a><br>
Unsubscribe: <a href=3D"https://lists.yoctoproject.org/g/yocto-security/uns=
ub" rel=3D"noreferrer" target=3D"_blank">https://lists.yoctoproject.org/g/y=
octo-security/unsub</a> [<a href=3D"mailto:yoann.congal@smile.fr" target=3D=
"_blank">yoann.congal@smile.fr</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div><br clear=3D"all"><br><span class=3D"gmail_signature_pre=
fix">-- </span><br><div dir=3D"ltr" class=3D"gmail_signature"><div dir=3D"l=
tr"><font face=3D"Raleway, regular">Yoann Congal</font><div><font face=3D"R=
aleway, regular">Smile ECS - Tech expert<br></font></div></div></div></div>

--000000000000fa20d10612c22ba3--

