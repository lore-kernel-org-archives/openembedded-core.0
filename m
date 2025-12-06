Return-Path: <david.partain@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 55522D3B7CA
	for <webhook@archiver.kernel.org>; Sat,  6 Dec 2025 09:09:40 +0000 (UTC)
Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.2399.1764987938562096698
 for <openembedded-core@lists.openembedded.org>;
 Fri, 05 Dec 2025 18:25:38 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ridgerun.com header.s=google header.b=YQIX14rJ;
 spf=pass (domain: ridgerun.com, ip: 209.85.216.41, mailfrom: daniel.chaves@ridgerun.com)
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-340a5c58bf1so1861714a91.2
        for <openembedded-core@lists.openembedded.org>; Fri, 05 Dec 2025 18:25:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ridgerun.com; s=google; t=1764987938; x=1765592738; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=uxTBNwAGWwrfNZxmPRpSKIy2ahwRmVMwRdQFTrC/TDQ=;
        b=YQIX14rJXfBMM0YQCggLLURR7Gys88q3T7oNpG6eivLhNfnNxybLc0V2m0myEoQDDz
         QUl70Eae8XOfd0ceNr0KQpHoeV3nl6yGdE3lelCV3kiyOuO9+U8XTeI2YbuUsaAO5NGb
         dq8wZB1+EFwvTs0yt+HVb5YsXMTvaADLhJYrLUEgIRu0cDpS73B+Mm+B65zQVwTbjRAz
         CP1Pn1ATQI/TeDKpSuvyCZMUnndpjP2F8H9+iXlG0PGQjHIeCOE22yhM0FB9yUb40S8Y
         eIGChmqVBm3InILOlOmfS9CoGPCiGpR4KQcN+SyiLwN7w88XNj3pNe0r6L1KxYdgsKpc
         Pzug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764987938; x=1765592738;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=uxTBNwAGWwrfNZxmPRpSKIy2ahwRmVMwRdQFTrC/TDQ=;
        b=imrnFdPBFBw804NEWBPDJZoZSwleoVdgdyn8unpNTkwNgq8htEhkOJP2fl0RjfT27E
         vRJR8LQJvWbbGRwE/f3ghD6TlCFcbf9kUXBuLhAz0I8cUtZLA7gin3lAOjMCE6Nnz08N
         pexcsdxnAafHth8UVhxEAqIAaFbXV3Ai0sBKDqC/M99axCqOaxvIJCuXf3PxZhz1dGXl
         XN95HU10XB9FpPpW0brZZjxaJHh9D+q938okH3jE+nSaq/59e0b7Okj+iowhhVW3Mcuh
         v7DNEpJA+NTnsJO09EK36bfPLpVrxg9ZJ5nYdoEU7+5rLWmUzBlSFkyQrHCbnXJgUdi6
         SOfA==
X-Forwarded-Encrypted: i=1; AJvYcCV2pYK92PNRtYlktTAkzOsKq7CoNkFWFRdG1YT9wEQgydhP4CVPvL8SmGm6nZqSMps+QiSaW88dQaPg/kGkNIP/3w==@lists.openembedded.org
X-Gm-Message-State: AOJu0YyXKOsgKF9YgEI4Mhg571hSfRhdDzpwI1+3C8ICymsul+RgDEP0
	zZfnWBhD0981c1YNLj0beDRVThZ11wwe75J1ZvInR8xl2XY6zQyygMcOrY2ZjppGXWOMsiDXCXT
	VNYDRwXvGfNZPdO1B09impj6O7d93nFtEDxltHRqIccZ9tYiszLDYOjAkTacoWYGFGb7TR/D8bO
	UoYf2LdTnwXVf3zQT9LPVn+hZ1aLVtVfsVV65B0L8tPiIgqX4QRhNJJPwOuyQsr74o
X-Gm-Gg: ASbGncuBZ2pRmMpAWBvlOh85/vCnTrCUrO6IvrF0F+2VRjamrqCgBSWu5QboXTJG6+R
	yEFb98ChmcPdqs2CKUG6T55aYuzOVQey8H+YG5R5v2iimOXhNMp/AJCqQZGbA7C5PnywJ9pSf8w
	CCahrBKt4H3dUdc1qnw/rFgdTnrVAJJQejfOAuzIfl3hIZRsL6i/2xQbxTOKG17xH95bpqwtkW6
	Hou+jwURLM1EMrE/mZzOfVNfl/6AZ9y20fBeFTxL2Wdn7xgZR5oHIj33+prtinFSVGEUSLj
X-Google-Smtp-Source: AGHT+IHoQJWObTvyy7S6WhP+H8D95dhfjMLhT41oMcDIGEaNNZqSrfEGlY9S35hnnqmS5Lnz8gMVklt0cbn0oh4ZHOs=
X-Received: by 2002:a17:90b:258b:b0:32e:a8b7:e9c with SMTP id
 98e67ed59e1d1-349a26a40eemr792756a91.29.1764987937907; Fri, 05 Dec 2025
 18:25:37 -0800 (PST)
MIME-Version: 1.0
From: Daniel Chaves <daniel.chaves@ridgerun.com>
Date: Fri, 5 Dec 2025 20:25:27 -0600
X-Gm-Features: AWmQ_bnunKLQcFQLkKJ-DbY0Ti-I4rWY-yH0AsTBeUeppc8Zgv0BUXbmFN-j_ic
Message-ID: <CAA0fTugFKYioq65z1vbpoMh2TkqqT__i=25RE3UCq5QrwukopA@mail.gmail.com>
Subject: Re: [OE-core] sharing sstate in bitbake-setup
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: Yocto-mailing-list <yocto@lists.yoctoproject.org>, 
	",openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>, 
	Joshua Watt <jpewhacker@gmail.com>
Content-Type: multipart/alternative; boundary="0000000000001273e406453f478f"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 06 Dec 2025 09:09:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/227361

--0000000000001273e406453f478f
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

--0000000000001273e406453f478f
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div><div style=3D"color:rgb(69,71,73);ba=
ckground-color:rgb(255,255,255);font-weight:normal;font-size:14px;line-heig=
ht:19px;white-space:pre-wrap"><div><span style=3D"color:rgb(69,71,73);font-=
family:arial,sans-serif">Hi, Alexander, if your goal is to share hash equiv=
alence data through a database, you might follow the &quot;Hash Equivalence=
 Server Setup&quot; instructions here:</span></div><div><span style=3D"colo=
r:rgb(75,131,205);text-decoration:underline;font-family:arial,sans-serif"><=
a href=3D"https://docs.yoctoproject.org/dev/_sources/dev-manual/hashequivse=
rver.rst.txt" target=3D"_blank">https://docs.yoctoproject.org/dev/_sources/=
dev-manual/hashequivserver.rst.txt</a></span><span style=3D"font-family:ari=
al,sans-serif">.</span></div><span style=3D"font-family:arial,sans-serif"><=
br></span><div><span style=3D"color:rgb(69,71,73);font-family:arial,sans-se=
rif">Make sure to look at the </span><span style=3D"color:rgb(119,119,119);=
font-family:arial,sans-serif">`</span><span style=3D"color:rgb(171,101,38);=
font-family:arial,sans-serif">bind</span><span style=3D"color:rgb(119,119,1=
19);font-family:arial,sans-serif">`</span><span style=3D"color:rgb(69,71,73=
);font-family:arial,sans-serif"> and </span><span style=3D"color:rgb(119,11=
9,119);font-family:arial,sans-serif">`</span><span style=3D"color:rgb(171,1=
01,38);font-family:arial,sans-serif">database</span><span style=3D"color:rg=
b(119,119,119);font-family:arial,sans-serif">`</span><span style=3D"color:r=
gb(69,71,73);font-family:arial,sans-serif"> options used when starting </sp=
an><span style=3D"color:rgb(119,119,119);font-family:arial,sans-serif">`</s=
pan><span style=3D"color:rgb(171,101,38);font-family:arial,sans-serif">bitb=
ake-hashserv</span><span style=3D"color:rgb(119,119,119);font-family:arial,=
sans-serif">`</span><span style=3D"color:rgb(69,71,73);font-family:arial,sa=
ns-serif">. Then, on the client side, the configuration would look somethin=
g like this:</span></div><span style=3D"font-family:arial,sans-serif"><br><=
/span><div><span style=3D"color:rgb(119,119,119);font-family:arial,sans-ser=
if">```</span></div><div><span style=3D"color:rgb(69,71,73);font-family:ari=
al,sans-serif">BB_HASHSERVE =3D &quot;&lt;bind address of the running BitBa=
ke hash server&gt;&quot;</span></div><div><span style=3D"color:rgb(69,71,73=
);font-family:arial,sans-serif">BB_SIGNATURE_HANDLER =3D &quot;OEEquivHash&=
quot;</span></div><div><span style=3D"color:rgb(119,119,119);font-family:ar=
ial,sans-serif">```</span></div><span style=3D"font-family:arial,sans-serif=
"><br></span><div><span style=3D"color:rgb(69,71,73);font-family:arial,sans=
-serif">So, in that scenario the site.conf for Bitbake Setup could enable a=
 bind address of </span><span style=3D"color:rgb(119,119,119);font-family:a=
rial,sans-serif">`</span><span style=3D"color:rgb(171,101,38);font-family:a=
rial,sans-serif">unix://${TOPDIR}/../hashserv.sock</span><span style=3D"col=
or:rgb(119,119,119);font-family:arial,sans-serif">`</span><span style=3D"co=
lor:rgb(69,71,73);font-family:arial,sans-serif"> to the BB_HASHSERVE.</span=
></div><span style=3D"font-family:arial,sans-serif"><br></span><div><span s=
tyle=3D"color:rgb(69,71,73);font-family:arial,sans-serif">And the server ca=
n be started with something like:</span></div><div><span style=3D"color:rgb=
(69,71,73);font-family:arial,sans-serif"><br></span></div><div><span style=
=3D"color:rgb(119,119,119);font-family:arial,sans-serif">`</span><span styl=
e=3D"color:rgb(171,101,38);font-family:arial,sans-serif">bitbake-hashserv -=
-bind </span><span style=3D"color:rgb(119,119,119);font-family:arial,sans-s=
erif"></span><span style=3D"color:rgb(171,101,38);font-family:arial,sans-se=
rif">unix://${TOPDIR}/../hashserv.sock</span><span style=3D"color:rgb(119,1=
19,119);font-family:arial,sans-serif"></span><span style=3D"color:rgb(171,1=
01,38);font-family:arial,sans-serif"> --database </span><span style=3D"colo=
r:rgb(171,101,38);font-family:arial,sans-serif">${TOPDIR}/../hashserv.db</s=
pan><span style=3D"color:rgb(119,119,119);font-family:arial,sans-serif">`</=
span></div><span style=3D"font-family:arial,sans-serif"><br></span></div><s=
pan style=3D"font-family:arial,sans-serif"><br></span></div><div><span styl=
e=3D"font-family:arial,sans-serif"><br>RidgeRun Embedded SW Engineer<br>Con=
tact us: <a href=3D"mailto:support@ridgerun.com" target=3D"_blank">support@=
ridgerun.com</a><br>Developers wiki: <a href=3D"https://developer.ridgerun.=
com/" target=3D"_blank">https://developer.ridgerun.com/</a><br>Website: <a =
href=3D"https://www.ridgerun.com/" target=3D"_blank">https://www.ridgerun.c=
om</a></span></div><div><div dir=3D"ltr" class=3D"gmail_signature" data-sma=
rtmail=3D"gmail_signature"><div dir=3D"ltr"><div dir=3D"ltr" style=3D"margi=
n-left:0pt" align=3D"left"><table style=3D"border:none;border-collapse:coll=
apse"><tbody><tr style=3D"height:105.98699999999998pt"><td colspan=3D"2" st=
yle=3D"border-left:solid #ffffff 1pt;border-right:solid #ffffff 1pt;border-=
bottom:solid #ffffff 1pt;border-top:solid #ffffff 1pt;vertical-align:middle=
;padding:5pt 5pt 5pt 5pt;overflow:hidden"><span style=3D"font-family:arial,=
sans-serif"><br></span></td><td style=3D"border-left:solid #ffffff 1pt;bord=
er-right:solid #ffffff 1pt;border-bottom:solid #ffffff 1pt;border-top:solid=
 #ffffff 1pt;vertical-align:middle;padding:5pt 5pt 5pt 5pt;overflow:hidden"=
><span style=3D"font-family:arial,sans-serif"><br></span></td></tr></tbody>=
</table></div></div></div></div></div>
</div>

<br>
<span style=3D"color:rgb(0,0,0);font-family:&quot;Work Sans&quot;,sans-seri=
f;font-size:9.33333px;text-align:justify">This email and any attachments ar=
e intended for the sole use of the named recipient(s) and contain(s) confid=
ential information that may be proprietary, privileged, or copyrighted unde=
r applicable law. If you are not the intended recipient, do not read, copy,=
 or forward this email message or any attachments, delete this email messag=
e and any attachments immediately.</span><br>

--0000000000001273e406453f478f--

