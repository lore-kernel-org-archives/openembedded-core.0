Return-Path: <david.partain@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 56329D3B7CE
	for <webhook@archiver.kernel.org>; Sat,  6 Dec 2025 09:10:30 +0000 (UTC)
Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.2716.1764989365557989150
 for <openembedded-core@lists.openembedded.org>;
 Fri, 05 Dec 2025 18:49:25 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ridgerun.com header.s=google header.b=REZeNxta;
 spf=pass (domain: ridgerun.com, ip: 209.85.216.45, mailfrom: daniel.chaves@ridgerun.com)
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-343dd5aa6e7so2929691a91.0
        for <openembedded-core@lists.openembedded.org>; Fri, 05 Dec 2025 18:49:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ridgerun.com; s=google; t=1764989365; x=1765594165; darn=lists.openembedded.org;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=lAfEMF2k2oEiasN3jSdKxazvNkUpiXd43BuoELISIRo=;
        b=REZeNxtaCnHVS0WhKSlVJRolcvEKSkO3Zz7tqtpVwQ32kSjGqP2589QnM5qKmP3Pz/
         haPnM5ordJz/B52XomiTAY9qlz96UDbn7E2qDIZjw8zK3lHSZt52zZD6NI2CDkfpVbdY
         VtaXIX+dZd7+NR7SvvPgGn36QPEnrkcQyxZu5tkWoyjcXCrUMiMTwztnmR4rQfWUct7g
         Lsa4tQShR0R4GAzmxt6U3P3qc0ODopp2W56ERoey7yXaPGw0RUVqdm+kBNV93gjJI9EX
         ZeNKV5v600PrNnHDFs01rHg1uh9mQxozcdHmMJwqCNbAvAmjEotaB0L+1fTCCUGFkifP
         VJUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764989365; x=1765594165;
        h=to:subject:message-id:date:from:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=lAfEMF2k2oEiasN3jSdKxazvNkUpiXd43BuoELISIRo=;
        b=qLZ6N2iw+Ah1PnreOdmgKc+Gjwq6v5VDqucsIbLhjzq1wcdNB1iMdRSTLixQGjXEYx
         98Ogt0n9Rbpgrp4Ug3PulxnxWdE5x5r4DwB83cH9m30XP8TCp0dDkjRRwe0cAiFvM366
         fEiiVisLlyu1gvsjgEudEojrgYGYBvU3LaXwFxb1ubBUcST5dmTxBA3xVrrhbwVDSSmv
         GsGILJ+oYkxIv8lYWhg7Txx4XxAUXHLNzrugo/DBsAxXSNEKCwxeD/mTl2mOnRc4DEyL
         oLUJ/M2mApO9GMTxfKR8UvatWev8eEN5X5s/m/4vzFgMuNpB6YHbPtUlfO+al8AGmzjG
         q3EQ==
X-Gm-Message-State: AOJu0YzVxU77jmeJKQYnengKE69hIL2qzQCY7LJ//JAFQ1C3FwP894Q2
	NuxhWcs5Cz0oZg9KrB7YUCrRKTwnKRkjol/i4n5TC6GV6Yz81fP3JY/oHtz2tUdF/GTk3AH2xsW
	MV7ZtYqw9OOD+enuzRifZMtJBw7R9vk4FtPJ3I0DzlI+ZOhRJyRpNA8GAXMQXlrDa86lPNJhZHi
	9NPyapqbfMTvIpySLNdVUrhvucDpJgPZr3ztt4sIL/T+GVmjFRk7a1yxWiW8Ychf6k
X-Gm-Gg: ASbGnctWR4jUlDmAJY++MdV0VKG8jF50aTuC4poe2tMi6cJSfBFUw/8iS1/VtGH0hfn
	hKcPVfrsv2r1nS8FtDvaiGQiN/VK1UVlGkQMepBCnUldKJpFNPGZWPo3f/wWEBEdlIz1Cuq/kdy
	a/O2ZE4jNANiDzLr2hYbChpjEeLSVJGotoNLZtHsQ2lIFAVrbV2+WmcYi/SgoQuIKcpoNazY9fk
	/lqeSF5Ax6gSA4jYAzFjigABydMh04A3O6cMBPDcIsCmrP6SZaB9FiIT0xifZg7YrJ1D1e+
X-Google-Smtp-Source: AGHT+IGMMuVI3sAczrZUGebwvL/rB4rZXtbKMPIdGWzI5r76icpn9uRmdERCuzOfCKtJ6WUwb8JXJq/woMjQMXRrYlk=
X-Received: by 2002:a17:90b:57c8:b0:341:1ac:84e0 with SMTP id
 98e67ed59e1d1-349a2511ccfmr927188a91.11.1764989364867; Fri, 05 Dec 2025
 18:49:24 -0800 (PST)
MIME-Version: 1.0
From: Daniel Chaves <daniel.chaves@ridgerun.com>
Date: Fri, 5 Dec 2025 20:49:14 -0600
X-Gm-Features: AWmQ_bkVfkXEDvgy--t-su3WulfYKjZlS9ii8wmpEalWaw52OOTstR2karKxP04
Message-ID: <CAA0fTui_RB=YAZUWwG8rPMs9izeBPUCEnBW+NLkXY3MQ2kAAew@mail.gmail.com>
Subject: Re: sharing sstate in bitbake-setup Inbox
To: "openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>, 
	Joshua Watt <jpewhacker@gmail.com>, Richard Purdie <richard.purdie@linuxfoundation.org>, 
	Alexander Kanavin <alex.kanavin@gmail.com>
Content-Type: multipart/alternative; boundary="0000000000002021fd06453f9cd3"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 06 Dec 2025 09:10:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/227364

--0000000000002021fd06453f9cd3
Content-Type: text/plain; charset="UTF-8"

Hi, Alexander, I saw your question about integrating the hash equivalence
server setup into Bitbake Setup. I've have actually tinkered with the basic
hash equivalence setup, and after diving into the documentation for the
hash equivalence looks like we could share hash equivalence data through
following the "Hash Equivalence Server Setup" instructions here:
https://docs.yoctoproject.org/dev/_sources/dev-manual/hashequivserver.rst.txt
.

Look at the `bind` and `database` options used when starting `
bitbake-hashserv`. Then, on the client side, the configuration would look
something like this:

```
BB_HASHSERVE = "<bind address of the running BitBake hash server>"
BB_SIGNATURE_HANDLER = "OEEquivHash"
```

So, in that scenario the site.conf for Bitbake Setup could enable a bind
address of `unix://${TOPDIR}/../hashserv.sock` to the BB_HASHSERVE.

And the server can be started with something like:

`bitbake-hashserv --bind unix://${TOPDIR}/../hashserv.sock --database
${TOPDIR}/../hashserv.db`

Hope that helps.
Regards
Daniel

RidgeRun Embedded SW Engineer
Contact us: support@ridgerun.com
Developers wiki: https://developer.ridgerun.com/
Website: https://www.ridgerun.com

-- 
This email and any attachments are intended for the sole use of the named 
recipient(s) and contain(s) confidential information that may be 
proprietary, privileged, or copyrighted under applicable law. If you are 
not the intended recipient, do not read, copy, or forward this email 
message or any attachments, delete this email message and any attachments 
immediately.

--0000000000002021fd06453f9cd3
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_quote"><div dir=3D"ltr"><div><div dir=
=3D"ltr"><div><div style=3D"color:rgb(69,71,73);background-color:rgb(255,25=
5,255);font-weight:normal;font-size:14px;line-height:19px;white-space:pre-w=
rap"><div><span style=3D"color:rgb(69,71,73);font-family:arial,sans-serif">=
Hi, Alexander, I saw your question about integrating the hash equivalence s=
erver setup into Bitbake Setup. I&#39;ve have actually tinkered with the ba=
sic hash equivalence setup, and after diving into the documentation for the=
 hash equivalence looks like we could share hash equivalence data through f=
ollowing the &quot;Hash Equivalence Server Setup&quot; instructions here:</=
span></div><div><span style=3D"color:rgb(75,131,205);text-decoration:underl=
ine;font-family:arial,sans-serif"><a href=3D"https://docs.yoctoproject.org/=
dev/_sources/dev-manual/hashequivserver.rst.txt" target=3D"_blank">https://=
docs.yoctoproject.org/dev/_sources/dev-manual/hashequivserver.rst.txt</a></=
span><span style=3D"font-family:arial,sans-serif">.</span></div><span style=
=3D"font-family:arial,sans-serif"><br></span><div><span style=3D"color:rgb(=
69,71,73);font-family:arial,sans-serif">Look at the </span><span style=3D"c=
olor:rgb(119,119,119);font-family:arial,sans-serif">`</span><span style=3D"=
color:rgb(171,101,38);font-family:arial,sans-serif">bind</span><span style=
=3D"color:rgb(119,119,119);font-family:arial,sans-serif">`</span><span styl=
e=3D"color:rgb(69,71,73);font-family:arial,sans-serif"> and </span><span st=
yle=3D"color:rgb(119,119,119);font-family:arial,sans-serif">`</span><span s=
tyle=3D"color:rgb(171,101,38);font-family:arial,sans-serif">database</span>=
<span style=3D"color:rgb(119,119,119);font-family:arial,sans-serif">`</span=
><span style=3D"color:rgb(69,71,73);font-family:arial,sans-serif"> options =
used when starting </span><span style=3D"color:rgb(119,119,119);font-family=
:arial,sans-serif">`</span><span style=3D"color:rgb(171,101,38);font-family=
:arial,sans-serif">bitbake-hashserv</span><span style=3D"color:rgb(119,119,=
119);font-family:arial,sans-serif">`</span><span style=3D"color:rgb(69,71,7=
3);font-family:arial,sans-serif">. Then, on the client side, the configurat=
ion would look something like this:</span></div><span style=3D"font-family:=
arial,sans-serif"><br></span><div><span style=3D"color:rgb(119,119,119);fon=
t-family:arial,sans-serif">```</span></div><div><span style=3D"color:rgb(69=
,71,73);font-family:arial,sans-serif">BB_HASHSERVE =3D &quot;&lt;bind addre=
ss of the running BitBake hash server&gt;&quot;</span></div><div><span styl=
e=3D"color:rgb(69,71,73);font-family:arial,sans-serif">BB_SIGNATURE_HANDLER=
 =3D &quot;OEEquivHash&quot;</span></div><div><span style=3D"color:rgb(119,=
119,119);font-family:arial,sans-serif">```</span></div><span style=3D"font-=
family:arial,sans-serif"><br></span><div><span style=3D"color:rgb(69,71,73)=
;font-family:arial,sans-serif">So, in that scenario the site.conf for Bitba=
ke Setup could enable a bind address of </span><span style=3D"color:rgb(119=
,119,119);font-family:arial,sans-serif">`</span><span style=3D"color:rgb(17=
1,101,38);font-family:arial,sans-serif">unix://${TOPDIR}/../hashserv.sock</=
span><span style=3D"color:rgb(119,119,119);font-family:arial,sans-serif">`<=
/span><span style=3D"color:rgb(69,71,73);font-family:arial,sans-serif"> to =
the BB_HASHSERVE.</span></div><span style=3D"font-family:arial,sans-serif">=
<br></span><div><span style=3D"color:rgb(69,71,73);font-family:arial,sans-s=
erif">And the server can be started with something like:</span></div><div><=
span style=3D"color:rgb(69,71,73);font-family:arial,sans-serif"><br></span>=
</div><div><span style=3D"color:rgb(119,119,119);font-family:arial,sans-ser=
if">`</span><span style=3D"color:rgb(171,101,38);font-family:arial,sans-ser=
if">bitbake-hashserv --bind </span><span style=3D"color:rgb(119,119,119);fo=
nt-family:arial,sans-serif"></span><span style=3D"color:rgb(171,101,38);fon=
t-family:arial,sans-serif">unix://${TOPDIR}/../hashserv.sock</span><span st=
yle=3D"color:rgb(119,119,119);font-family:arial,sans-serif"></span><span st=
yle=3D"color:rgb(171,101,38);font-family:arial,sans-serif"> --database </sp=
an><span style=3D"color:rgb(171,101,38);font-family:arial,sans-serif">${TOP=
DIR}/../hashserv.db</span><span style=3D"color:rgb(119,119,119);font-family=
:arial,sans-serif">`</span></div><span style=3D"font-family:arial,sans-seri=
f"><br></span></div><span style=3D"font-family:arial,sans-serif">Hope that =
helps.</span></div><div><span style=3D"font-family:arial,sans-serif">Regard=
s<br></span></div><div><span style=3D"font-family:arial,sans-serif">Daniel<=
/span></div><div><span style=3D"font-family:arial,sans-serif"><br>RidgeRun =
Embedded SW Engineer<br>Contact us: <a href=3D"mailto:support@ridgerun.com"=
 target=3D"_blank">support@ridgerun.com</a><br>Developers wiki: <a href=3D"=
https://developer.ridgerun.com/" target=3D"_blank">https://developer.ridger=
un.com/</a><br>Website: <a href=3D"https://www.ridgerun.com/" target=3D"_bl=
ank">https://www.ridgerun.com</a><br><br></span></div></div></div></div></d=
iv><div><div dir=3D"ltr" class=3D"gmail_signature" data-smartmail=3D"gmail_=
signature"><div dir=3D"ltr"><div dir=3D"ltr" style=3D"margin-left:0pt" alig=
n=3D"left"><table style=3D"border:none;border-collapse:collapse"><tbody><tr=
 style=3D"height:105.98699999999998pt"><td colspan=3D"2" style=3D"border-le=
ft:solid #ffffff 1pt;border-right:solid #ffffff 1pt;border-bottom:solid #ff=
ffff 1pt;border-top:solid #ffffff 1pt;vertical-align:middle;padding:5pt 5pt=
 5pt 5pt;overflow:hidden"><br></td><td style=3D"border-left:solid #ffffff 1=
pt;border-right:solid #ffffff 1pt;border-bottom:solid #ffffff 1pt;border-to=
p:solid #ffffff 1pt;vertical-align:middle;padding:5pt 5pt 5pt 5pt;overflow:=
hidden"><p dir=3D"ltr" style=3D"line-height:1.7999999999999998;margin-right=
:3.75pt;margin-top:0pt;margin-bottom:0pt"><span style=3D"font-size:8pt;font=
-family:&#39;Work Sans&#39;,sans-serif;color:#073763;background-color:#ffff=
ff;font-weight:400;font-style:normal;font-variant:normal;text-decoration:no=
ne;vertical-align:baseline;white-space:pre;white-space:pre-wrap">=C2=A0</sp=
an></p></td></tr></tbody></table></div></div></div></div></div>

<br>
<span style=3D"color:rgb(0,0,0);font-family:&quot;Work Sans&quot;,sans-seri=
f;font-size:9.33333px;text-align:justify">This email and any attachments ar=
e intended for the sole use of the named recipient(s) and contain(s) confid=
ential information that may be proprietary, privileged, or copyrighted unde=
r applicable law. If you are not the intended recipient, do not read, copy,=
 or forward this email message or any attachments, delete this email messag=
e and any attachments immediately.</span><br>

--0000000000002021fd06453f9cd3--

