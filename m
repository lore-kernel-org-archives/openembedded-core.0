Return-Path: <david.partain@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 56A25D3B7CC
	for <webhook@archiver.kernel.org>; Sat,  6 Dec 2025 09:10:00 +0000 (UTC)
Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.2531.1764988180057368894
 for <openembedded-core@lists.openembedded.org>;
 Fri, 05 Dec 2025 18:29:40 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ridgerun.com header.s=google header.b=YdH1/BPl;
 spf=pass (domain: ridgerun.com, ip: 209.85.216.43, mailfrom: daniel.chaves@ridgerun.com)
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-34381ec9197so2430841a91.1
        for <openembedded-core@lists.openembedded.org>; Fri, 05 Dec 2025 18:29:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ridgerun.com; s=google; t=1764988179; x=1765592979; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=0TXIJPBCx3WkcL4gjr3mTBO8SNIvzCY7RD+Nl9+cwos=;
        b=YdH1/BPlMkmzOydwlBPoiS5xs5FtvOX3tf7rRYsNDAUjHkC6877VbYMDFvofECwGcv
         wlany/+Z2OQyWdxPF9Dsmj5b5tILRKO9OTWW5gees/EUySRsMLddQxFyvWXBktPbFOjQ
         5ob71gcx490BvTDLHrAzUBLNpDRmUSgnEGw//Ty7d0IvEU6y0nnlc/UJrpM9Kap6gkK1
         tid5eoDgkj9Ta3T+5bju2WmLAvGLpeFXqXXe/tEPvtQIQXAy2nXUM4vgpeOc4B/8/gsO
         YUg4n1/9vemNkdg7v9FvRyJ2S3XwUEupf2Rya4tu2ahd5AkLREJJ3KByIATI58X5R7UA
         XhFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764988179; x=1765592979;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=0TXIJPBCx3WkcL4gjr3mTBO8SNIvzCY7RD+Nl9+cwos=;
        b=P/LiNg6iL3CNYETCd6mUBWSLClvH4rp1B20PkPvokYUGKHs9wFlOu+QUDgywZBk05R
         Lt3HPPerJmSR7jWVPlaXLjTk2iIyzStUlH3L5YM1PyjU0ZCoqRqc78onr+1Pv8fSTHxI
         vkax2hx/hyiqhccHFCDKMuZaxZp5JYNtaRrLBugKqSHNIPUcgBMqEeUqXNBEoKVmH0VF
         aYtuU945JIHjtZ/q8sTBBUAl+ctTojG5sIbU3zuYu638nItKKatd4xT9UNC81lJD/c7n
         tqaElmHu3YXnu3SJdu1ltY9PLpxZJE11EhndQQ33bBEkURNRn4ySyp8IIINlAU2KNBgK
         RQyA==
X-Gm-Message-State: AOJu0YzTlaPUIyVo+TkppW7GthyXDhX6tut1OVOwOHe6pAvbfDYWZ9af
	3V1LmFWiLTa5/juqcncheQIwxjNl/vimWMHADNoZj/Dd6QgecZmlwUU7sF1bM3IP2qDZ4nLpLt7
	EbMU23bXdoLpLQvnH8y17CbT1H17EkWjBna3Jd3O32P7pUTu/JYTHLW/gX8v/x8x85bGDUBVepP
	FRD5n6yf73KFIdZUxADH5japGxf3MfG7URyuWAt//ezDmAHJ0R
X-Gm-Gg: ASbGncuP3bn51CVPwMuA01JlVKwUF9U0cvonQxRVlccwwlOsqci4fyK5a4uS0zNUV7z
	OL5GJqW6HeRTePjkpesUP7aSu16Jkpq1oQBSgr7M1oM5lM9t3+YLZVAzDBkIXFb3AMif5j6q/ev
	IOxLI3YY67XYeM/V1JgjHyOIdAuTbFTLsf9bElKMgsejVjidOffFwoyfof205ZgQWe05JIP0AZh
	5+9t8xLO8Lq6p0V9s0s7PQSRJMgkRV38STZOD/U9fokXozylGQlMjNLkZwpvBVm6MhIlrb1qvsO
	OHDyh4o=
X-Google-Smtp-Source: AGHT+IEuBNlyNtf834kvWhlgydTFyN630k39be3dC191tkhD4bttAcG3xPM/zVycJYkyF3QnVZ/30N4OULZdkPQLSs4=
X-Received: by 2002:a17:90b:3e50:b0:340:bc27:97b8 with SMTP id
 98e67ed59e1d1-349a254f647mr829355a91.10.1764988179278; Fri, 05 Dec 2025
 18:29:39 -0800 (PST)
MIME-Version: 1.0
From: Daniel Chaves <daniel.chaves@ridgerun.com>
Date: Fri, 5 Dec 2025 20:29:28 -0600
X-Gm-Features: AWmQ_bkhwxLlKJfKMH0yTrrTfqzy-lNtwsgJZpJhe6DjOI3nBRtYUip3-3wAm-E
Message-ID: <CAA0fTuhc0F4xS2KtoiN9jXvsNUmN6FVnb6CJc-Qs4p19jzt3YQ@mail.gmail.com>
Subject: Re: sharing sstate in bitbake-setup
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: ",openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="000000000000757fdb06453f553a"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 06 Dec 2025 09:10:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/227362

--000000000000757fdb06453f553a
Content-Type: text/plain; charset="UTF-8"

Hi, Alexander, if your goal is to share hash equivalence data through a
database, you might follow the "Hash Equivalence Server Setup" instructions
here:
https://docs.yoctoproject.org/dev/_sources/dev-manual/hashequivserver.rst.txt
.

Make sure to look at the `bind` and `database` options used when starting `
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

--000000000000757fdb06453f553a
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div><div dir=3D"ltr"><div><div style=3D"color:rgb(69,71,7=
3);background-color:rgb(255,255,255);font-weight:normal;font-size:14px;line=
-height:19px;white-space:pre-wrap"><div><span style=3D"color:rgb(69,71,73);=
font-family:arial,sans-serif">Hi, Alexander, if your goal is to share hash =
equivalence data through a database, you might follow the &quot;Hash Equiva=
lence Server Setup&quot; instructions here:</span></div><div><span style=3D=
"color:rgb(75,131,205);text-decoration:underline;font-family:arial,sans-ser=
if"><a href=3D"https://docs.yoctoproject.org/dev/_sources/dev-manual/hasheq=
uivserver.rst.txt" target=3D"_blank">https://docs.yoctoproject.org/dev/_sou=
rces/dev-manual/hashequivserver.rst.txt</a></span><span style=3D"font-famil=
y:arial,sans-serif">.</span></div><span style=3D"font-family:arial,sans-ser=
if"><br></span><div><span style=3D"color:rgb(69,71,73);font-family:arial,sa=
ns-serif">Make sure to look at the </span><span style=3D"color:rgb(119,119,=
119);font-family:arial,sans-serif">`</span><span style=3D"color:rgb(171,101=
,38);font-family:arial,sans-serif">bind</span><span style=3D"color:rgb(119,=
119,119);font-family:arial,sans-serif">`</span><span style=3D"color:rgb(69,=
71,73);font-family:arial,sans-serif"> and </span><span style=3D"color:rgb(1=
19,119,119);font-family:arial,sans-serif">`</span><span style=3D"color:rgb(=
171,101,38);font-family:arial,sans-serif">database</span><span style=3D"col=
or:rgb(119,119,119);font-family:arial,sans-serif">`</span><span style=3D"co=
lor:rgb(69,71,73);font-family:arial,sans-serif"> options used when starting=
 </span><span style=3D"color:rgb(119,119,119);font-family:arial,sans-serif"=
>`</span><span style=3D"color:rgb(171,101,38);font-family:arial,sans-serif"=
>bitbake-hashserv</span><span style=3D"color:rgb(119,119,119);font-family:a=
rial,sans-serif">`</span><span style=3D"color:rgb(69,71,73);font-family:ari=
al,sans-serif">. Then, on the client side, the configuration would look som=
ething like this:</span></div><span style=3D"font-family:arial,sans-serif">=
<br></span><div><span style=3D"color:rgb(119,119,119);font-family:arial,san=
s-serif">```</span></div><div><span style=3D"color:rgb(69,71,73);font-famil=
y:arial,sans-serif">BB_HASHSERVE =3D &quot;&lt;bind address of the running =
BitBake hash server&gt;&quot;</span></div><div><span style=3D"color:rgb(69,=
71,73);font-family:arial,sans-serif">BB_SIGNATURE_HANDLER =3D &quot;OEEquiv=
Hash&quot;</span></div><div><span style=3D"color:rgb(119,119,119);font-fami=
ly:arial,sans-serif">```</span></div><span style=3D"font-family:arial,sans-=
serif"><br></span><div><span style=3D"color:rgb(69,71,73);font-family:arial=
,sans-serif">So, in that scenario the site.conf for Bitbake Setup could ena=
ble a bind address of </span><span style=3D"color:rgb(119,119,119);font-fam=
ily:arial,sans-serif">`</span><span style=3D"color:rgb(171,101,38);font-fam=
ily:arial,sans-serif">unix://${TOPDIR}/../hashserv.sock</span><span style=
=3D"color:rgb(119,119,119);font-family:arial,sans-serif">`</span><span styl=
e=3D"color:rgb(69,71,73);font-family:arial,sans-serif"> to the BB_HASHSERVE=
.</span></div><span style=3D"font-family:arial,sans-serif"><br></span><div>=
<span style=3D"color:rgb(69,71,73);font-family:arial,sans-serif">And the se=
rver can be started with something like:</span></div><div><span style=3D"co=
lor:rgb(69,71,73);font-family:arial,sans-serif"><br></span></div><div><span=
 style=3D"color:rgb(119,119,119);font-family:arial,sans-serif">`</span><spa=
n style=3D"color:rgb(171,101,38);font-family:arial,sans-serif">bitbake-hash=
serv --bind </span><span style=3D"color:rgb(119,119,119);font-family:arial,=
sans-serif"></span><span style=3D"color:rgb(171,101,38);font-family:arial,s=
ans-serif">unix://${TOPDIR}/../hashserv.sock</span><span style=3D"color:rgb=
(119,119,119);font-family:arial,sans-serif"></span><span style=3D"color:rgb=
(171,101,38);font-family:arial,sans-serif"> --database </span><span style=
=3D"color:rgb(171,101,38);font-family:arial,sans-serif">${TOPDIR}/../hashse=
rv.db</span><span style=3D"color:rgb(119,119,119);font-family:arial,sans-se=
rif">`</span></div><span style=3D"font-family:arial,sans-serif"><br></span>=
</div><span style=3D"font-family:arial,sans-serif"><br></span></div><div><s=
pan style=3D"font-family:arial,sans-serif"><br>RidgeRun Embedded SW Enginee=
r<br>Contact us: <a href=3D"mailto:support@ridgerun.com" target=3D"_blank">=
support@ridgerun.com</a><br>Developers wiki: <a href=3D"https://developer.r=
idgerun.com/" target=3D"_blank">https://developer.ridgerun.com/</a><br>Webs=
ite: <a href=3D"https://www.ridgerun.com/" target=3D"_blank">https://www.ri=
dgerun.com</a></span></div></div></div><div><div dir=3D"ltr" class=3D"gmail=
_signature" data-smartmail=3D"gmail_signature"><div dir=3D"ltr"><div dir=3D=
"ltr" style=3D"margin-left:0pt" align=3D"left"><table style=3D"border:none;=
border-collapse:collapse"><tbody><tr style=3D"height:105.98699999999998pt">=
<td colspan=3D"2" style=3D"border-left:solid #ffffff 1pt;border-right:solid=
 #ffffff 1pt;border-bottom:solid #ffffff 1pt;border-top:solid #ffffff 1pt;v=
ertical-align:middle;padding:5pt 5pt 5pt 5pt;overflow:hidden"></td><td styl=
e=3D"border-left:solid #ffffff 1pt;border-right:solid #ffffff 1pt;border-bo=
ttom:solid #ffffff 1pt;border-top:solid #ffffff 1pt;vertical-align:middle;p=
adding:5pt 5pt 5pt 5pt;overflow:hidden"></td></tr></tbody></table></div></d=
iv></div></div></div>

<br>
<span style=3D"color:rgb(0,0,0);font-family:&quot;Work Sans&quot;,sans-seri=
f;font-size:9.33333px;text-align:justify">This email and any attachments ar=
e intended for the sole use of the named recipient(s) and contain(s) confid=
ential information that may be proprietary, privileged, or copyrighted unde=
r applicable law. If you are not the intended recipient, do not read, copy,=
 or forward this email message or any attachments, delete this email messag=
e and any attachments immediately.</span><br>

--000000000000757fdb06453f553a--

