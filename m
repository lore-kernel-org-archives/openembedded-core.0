Return-Path: <david.partain@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 544D2D3B7CD
	for <webhook@archiver.kernel.org>; Sat,  6 Dec 2025 09:10:10 +0000 (UTC)
Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.2749.1764989274401079686
 for <openembedded-core@lists.openembedded.org>;
 Fri, 05 Dec 2025 18:47:54 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ridgerun.com header.s=google header.b=YabSXQO3;
 spf=pass (domain: ridgerun.com, ip: 209.85.216.49, mailfrom: daniel.chaves@ridgerun.com)
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-34585428e33so2860463a91.3
        for <openembedded-core@lists.openembedded.org>; Fri, 05 Dec 2025 18:47:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ridgerun.com; s=google; t=1764989274; x=1765594074; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=0k9LHe06/7JqMxIHxNpr6CR/1A7Rzx873V89vP5j0wc=;
        b=YabSXQO3q98gVchoq0/myOJVJStyW82QSMdc7Zhfilo32Uq0mzCOYnD9bliJ6zXCqf
         Iv+y4ccat7zTQ0smHD2lL7oyrimR8uMJ6+BAsl81GhmpAVExcbm7dsetcJOZdHxVazBC
         KmxROVczxSdqHvtRnKOaWiBD3EQ1yKMEOfcNM/RNmU8I8yhDw1BhIpotH24DTAGj1+rp
         B4oOpauoERIavOT9Yg4fMZShaaBo35K7cicTtzez5ZEhiaF5JythxvYc7+sBt1XKXnTh
         IqkQ8JToGKdR1OIzR0t0i4zYWJmG+qEzMzLJ3kwbXaMCN4ZZfwaPz/cy0MPZDZB6p9IA
         wRDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764989274; x=1765594074;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=0k9LHe06/7JqMxIHxNpr6CR/1A7Rzx873V89vP5j0wc=;
        b=dxaacpcTuWsVtypowA3jqt1ac37Zth0uDUosaP25uSJBfUykFBbdHk+O7XsgkeK6Ui
         ta/HgWHOQG9Tf0MV/0XtAFAZl0AJz6pKEB6hd5YlqXoL9zrUDwj1X5S/roLa2ptXPs5d
         GyjtG1MroKwegRGyKODkg4UndQ81dmahvCnGIa6XczeW/NsyDwA7F0c26DHdLaX/bA4e
         dzpIHAjF3uLhb+FDp0IAOcJ7vF/5C8OTu6cprf4t9h/5+c13zbjxd5bWi4Ctuy0jj1Q4
         8hZDXSpMXUEYzozsLojAgEgOetdkjwqosXi2Xzk06F5H1S+s+AbDh9zgdGhfiaaRJ2Xa
         l8YA==
X-Gm-Message-State: AOJu0YzvYsKAZUMhVphOJhDP/v+pe9dVZ16RWrMxXzzurAEtqsJNNUdk
	liOQhUSWcQ6gHqqAxeJQkqgCP6R7kMyEYxC4KAVFZJxhXGjhoU22GyVq3d1MsHBT+YyNRknR8e8
	jBT8v9qKtdlF0PBODScYibF8Zd3WHfqmxfRL0sDgFq0i4I/+b77toD6qFgtBfXW6FJeAS7gSjZ5
	6shuIcuHAfUq+RmkasV+oR1pn55xIVhVRmGj2ycjXA0w8uoRN3
X-Gm-Gg: ASbGncu4jql6QLpzpuklyojFRr2ohKb6y+rTwnVNB922aSBD9sPSbvOVgJGK02r6PG6
	jDdmn9pDKxQ4Fx42TvJQ89me3zqFTM0omcdlLJzE1M3Uvd5XLlER0wntl1mP/LikM9XQfkWu60f
	V+7C+tQVPi1OvaDbP3AaI4cJWWn7N8iCe6kAHHaFo8S0zBOMC/lUhfh0mJNm4O57tSQUyluDDgk
	zdGr8YpVTWshwjNXPLvMGOwhnVyn1jv3CrYdPRoGYZ9E8a/JrQCRgqUXeax/TQyNih0wI0S
X-Google-Smtp-Source: AGHT+IH2Dfv67z5BknR7IEyeZHZwVANotbBMl8mATTsuLzcLOKZfe+KoqepwZh21kHodDNKbHPc3UoFKjphiyQYjPCQ=
X-Received: by 2002:a17:90b:5903:b0:349:162d:ae1e with SMTP id
 98e67ed59e1d1-349a260b09amr949468a91.33.1764989273761; Fri, 05 Dec 2025
 18:47:53 -0800 (PST)
MIME-Version: 1.0
From: Daniel Chaves <daniel.chaves@ridgerun.com>
Date: Fri, 5 Dec 2025 20:47:42 -0600
X-Gm-Features: AWmQ_bkbHP25EkHmuX2iYhT7mRycSyUQYHUsFQKkeeZjGx8LsUa3cF2uQqis8FI
Message-ID: <CAA0fTuhhzqNPnpw35s17p3tB55605Bso2DviWfwDjC08pCYoAg@mail.gmail.com>
Subject: Re: sharing sstate in bitbake-setup
To: Yocto-mailing-list <yocto@lists.yoctoproject.org>
Cc: ",openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>, 
	Joshua Watt <jpewhacker@gmail.com>, Richard Purdie <richard.purdie@linuxfoundation.org>, 
	Alexander Kanavin <alex.kanavin@gmail.com>
Content-Type: multipart/alternative; boundary="000000000000b1fab306453f969e"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 06 Dec 2025 09:10:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/227363

--000000000000b1fab306453f969e
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

--000000000000b1fab306453f969e
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_quote gmail_quote_container"><div dir=
=3D"ltr"><div><div dir=3D"ltr"><div><div style=3D"color:rgb(69,71,73);backg=
round-color:rgb(255,255,255);font-weight:normal;font-size:14px;line-height:=
19px;white-space:pre-wrap"><div><span style=3D"color:rgb(69,71,73);font-fam=
ily:arial,sans-serif">Hi, Alexander, I saw your question about integrating =
the hash equivalence server setup into Bitbake Setup. I&#39;ve have actuall=
y tinkered with the basic hash equivalence setup, and after diving into the=
 documentation for the hash equivalence looks like we could share hash equi=
valence data through following the &quot;Hash Equivalence Server Setup&quot=
; instructions here:</span></div><div><span style=3D"color:rgb(75,131,205);=
text-decoration:underline;font-family:arial,sans-serif"><a href=3D"https://=
docs.yoctoproject.org/dev/_sources/dev-manual/hashequivserver.rst.txt" targ=
et=3D"_blank">https://docs.yoctoproject.org/dev/_sources/dev-manual/hashequ=
ivserver.rst.txt</a></span><span style=3D"font-family:arial,sans-serif">.</=
span></div><span style=3D"font-family:arial,sans-serif"><br></span><div><sp=
an style=3D"color:rgb(69,71,73);font-family:arial,sans-serif">Look at the <=
/span><span style=3D"color:rgb(119,119,119);font-family:arial,sans-serif">`=
</span><span style=3D"color:rgb(171,101,38);font-family:arial,sans-serif">b=
ind</span><span style=3D"color:rgb(119,119,119);font-family:arial,sans-seri=
f">`</span><span style=3D"color:rgb(69,71,73);font-family:arial,sans-serif"=
> and </span><span style=3D"color:rgb(119,119,119);font-family:arial,sans-s=
erif">`</span><span style=3D"color:rgb(171,101,38);font-family:arial,sans-s=
erif">database</span><span style=3D"color:rgb(119,119,119);font-family:aria=
l,sans-serif">`</span><span style=3D"color:rgb(69,71,73);font-family:arial,=
sans-serif"> options used when starting </span><span style=3D"color:rgb(119=
,119,119);font-family:arial,sans-serif">`</span><span style=3D"color:rgb(17=
1,101,38);font-family:arial,sans-serif">bitbake-hashserv</span><span style=
=3D"color:rgb(119,119,119);font-family:arial,sans-serif">`</span><span styl=
e=3D"color:rgb(69,71,73);font-family:arial,sans-serif">. Then, on the clien=
t side, the configuration would look something like this:</span></div><span=
 style=3D"font-family:arial,sans-serif"><br></span><div><span style=3D"colo=
r:rgb(119,119,119);font-family:arial,sans-serif">```</span></div><div><span=
 style=3D"color:rgb(69,71,73);font-family:arial,sans-serif">BB_HASHSERVE =
=3D &quot;&lt;bind address of the running BitBake hash server&gt;&quot;</sp=
an></div><div><span style=3D"color:rgb(69,71,73);font-family:arial,sans-ser=
if">BB_SIGNATURE_HANDLER =3D &quot;OEEquivHash&quot;</span></div><div><span=
 style=3D"color:rgb(119,119,119);font-family:arial,sans-serif">```</span></=
div><span style=3D"font-family:arial,sans-serif"><br></span><div><span styl=
e=3D"color:rgb(69,71,73);font-family:arial,sans-serif">So, in that scenario=
 the site.conf for Bitbake Setup could enable a bind address of </span><spa=
n style=3D"color:rgb(119,119,119);font-family:arial,sans-serif">`</span><sp=
an style=3D"color:rgb(171,101,38);font-family:arial,sans-serif">unix://${TO=
PDIR}/../hashserv.sock</span><span style=3D"color:rgb(119,119,119);font-fam=
ily:arial,sans-serif">`</span><span style=3D"color:rgb(69,71,73);font-famil=
y:arial,sans-serif"> to the BB_HASHSERVE.</span></div><span style=3D"font-f=
amily:arial,sans-serif"><br></span><div><span style=3D"color:rgb(69,71,73);=
font-family:arial,sans-serif">And the server can be started with something =
like:</span></div><div><span style=3D"color:rgb(69,71,73);font-family:arial=
,sans-serif"><br></span></div><div><span style=3D"color:rgb(119,119,119);fo=
nt-family:arial,sans-serif">`</span><span style=3D"color:rgb(171,101,38);fo=
nt-family:arial,sans-serif">bitbake-hashserv --bind </span><span style=3D"c=
olor:rgb(119,119,119);font-family:arial,sans-serif"></span><span style=3D"c=
olor:rgb(171,101,38);font-family:arial,sans-serif">unix://${TOPDIR}/../hash=
serv.sock</span><span style=3D"color:rgb(119,119,119);font-family:arial,san=
s-serif"></span><span style=3D"color:rgb(171,101,38);font-family:arial,sans=
-serif"> --database </span><span style=3D"color:rgb(171,101,38);font-family=
:arial,sans-serif">${TOPDIR}/../hashserv.db</span><span style=3D"color:rgb(=
119,119,119);font-family:arial,sans-serif">`</span></div><span style=3D"fon=
t-family:arial,sans-serif"><br></span></div><span style=3D"font-family:aria=
l,sans-serif">Hope that helps.</span></div><div><span style=3D"font-family:=
arial,sans-serif">Regards<br></span></div><div><span style=3D"font-family:a=
rial,sans-serif">Daniel</span></div><div><span style=3D"font-family:arial,s=
ans-serif"><br>RidgeRun Embedded SW Engineer<br>Contact us: <a href=3D"mail=
to:support@ridgerun.com" target=3D"_blank">support@ridgerun.com</a><br>Deve=
lopers wiki: <a href=3D"https://developer.ridgerun.com/" target=3D"_blank">=
https://developer.ridgerun.com/</a><br>Website: <a href=3D"https://www.ridg=
erun.com/" target=3D"_blank">https://www.ridgerun.com</a></span></div></div=
></div></div></div><div><div dir=3D"ltr" class=3D"gmail_signature" data-sma=
rtmail=3D"gmail_signature"><div dir=3D"ltr"><div dir=3D"ltr" style=3D"margi=
n-left:0pt" align=3D"left"><table style=3D"border:none;border-collapse:coll=
apse"><tbody><tr style=3D"height:105.98699999999998pt"><td colspan=3D"2" st=
yle=3D"border-left:solid #ffffff 1pt;border-right:solid #ffffff 1pt;border-=
bottom:solid #ffffff 1pt;border-top:solid #ffffff 1pt;vertical-align:middle=
;padding:5pt 5pt 5pt 5pt;overflow:hidden"></td><td style=3D"border-left:sol=
id #ffffff 1pt;border-right:solid #ffffff 1pt;border-bottom:solid #ffffff 1=
pt;border-top:solid #ffffff 1pt;vertical-align:middle;padding:5pt 5pt 5pt 5=
pt;overflow:hidden"><br></td></tr></tbody></table></div></div></div></div><=
/div>

<br>
<span style=3D"color:rgb(0,0,0);font-family:&quot;Work Sans&quot;,sans-seri=
f;font-size:9.33333px;text-align:justify">This email and any attachments ar=
e intended for the sole use of the named recipient(s) and contain(s) confid=
ential information that may be proprietary, privileged, or copyrighted unde=
r applicable law. If you are not the intended recipient, do not read, copy,=
 or forward this email message or any attachments, delete this email messag=
e and any attachments immediately.</span><br>

--000000000000b1fab306453f969e--

