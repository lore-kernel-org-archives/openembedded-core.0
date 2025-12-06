Return-Path: <david.partain@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7440DD3B7CB
	for <webhook@archiver.kernel.org>; Sat,  6 Dec 2025 09:09:30 +0000 (UTC)
Received: from mail-ua1-f48.google.com (mail-ua1-f48.google.com [209.85.222.48])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.2472.1764987920094209691
 for <openembedded-core@lists.openembedded.org>;
 Fri, 05 Dec 2025 18:25:20 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ridgerun.com header.s=google header.b=JPqWA/2W;
 spf=pass (domain: ridgerun.com, ip: 209.85.222.48, mailfrom: daniel.chaves@ridgerun.com)
Received: by mail-ua1-f48.google.com with SMTP id a1e0cc1a2514c-93728bac144so1596895241.2
        for <openembedded-core@lists.openembedded.org>; Fri, 05 Dec 2025 18:25:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ridgerun.com; s=google; t=1764987919; x=1765592719; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=ZeijqZXYalFthr3B+IZ/yTyEWXrlxjWa9R/SHWrkqdk=;
        b=JPqWA/2W9YLdkwzJ69Rxg0u8mwzTaBejv7SqWX9k4dRlUUhlhp6xK0Fof0z0/HHe0e
         y/441cRDNgBx0LaEkI3ibTfOlkk290rskVBmqugAYfS3n2HKb8cRQ2S1VMVLkz+a/oKz
         4V0KI3bp+3Zre0IEoeuZDnEBR08M79vBcc4ALLfURPdsLmOQNH+gXzffuvA124nc+o+4
         QDTpmdO0PFhDQ06cvXzPd+gn6CrjCM6UgfTfsr4ci0qEDr37WxZuF1yfaT/hRepVynX4
         LorKGDdfTZngdh3lv8vURk4bSxS3jT3kHHYt+DR6pawOK2sDstZDsstVmbltpjTjc67B
         uBSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764987919; x=1765592719;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ZeijqZXYalFthr3B+IZ/yTyEWXrlxjWa9R/SHWrkqdk=;
        b=u479u5p4u9Mt9YnyY6qpUGfgbHn1psnE+xp7683ix6x0+wgU6fSJnZ+Eb3bvF/h7TC
         baH6DKTTqxqFlUPxHWF5+XeGqoZs6Bkbh8yhamIL7tY6O93UiNYpUD7hUwZz3ZEiHnD+
         3zwPDMXBn4bSueshLAj2+EDEQGrZ3hFYf85IFnOQNjCp/Gtpgr0ui11Rf0Y8K73f0wgn
         4V6hgWjSquY6DK/3ETyUHzd/jOHmOlXYXajBQW8tIN81IOP+ooip59KvB/SGnVqKJUpO
         QmPumJy9rXcIWT29DTey1E8JGlToIb6UxpTxqdSkggH2kRn/EbuWbOynI9QD9NLo7mbK
         LFUw==
X-Gm-Message-State: AOJu0YzGMqGLrt//+8zbfnHSNkr/VF5QWUNsrqQzv/pWAUhbI0CEp/jb
	CjQ4ogQAHKPpivx0krgXyc8RgCZO1obIkWp1ZZ8k7LbYQlX/SJz1ODn42U10YYNt4Dygz0PbTTH
	gJq8EITQ3ufcgvUv/PBnMvNTCOkNVqLbj6B+xxOMj0eNGel3fN0IP/uOOq3bVkRnxMxRAdINp1E
	P/JvwKOoc2kofPM/7BaxPnF/Om8WGwSgvkMNLfh87rvtmZrXKc9ShDw/JrsciYFVM5
X-Gm-Gg: ASbGnctHKaWpsBMGA/Fp/NL6eMwvjj8Q8UiRFkOSrfE1McjhOHRgYGwvASWtZWIdsrW
	sQxhXvEh1B+ziw6CqvC4/d+dgbMgkhoPiYxnjwdjhul6pOTbEJgJZtodmFgZ8ymUvA4dMN2RQu6
	Xho7KTPDUkMYMhgLzPo4gaxCepk+JgmMKIFG7j72HiXRM8aHw9BeATJ42d6SLUy7nrG0tr83+D7
	Cwqtk0wXRiBf4L0RUQ13bK4jlbJzLd2g2wPlPiM7DKyn/dLlSVIBTbVrggh1YwFp5XAHReH
X-Google-Smtp-Source: AGHT+IEFgQ1dZ5NlQ3xle5rYCtyRGEjFCEfWQNquz5ge0oKffRCozCdmrlozMOvurWBtmn0jBt5fIf3EQHsjbQXLiG0=
X-Received: by 2002:a17:90b:2750:b0:349:9dc4:fa35 with SMTP id
 98e67ed59e1d1-349a2622069mr871497a91.25.1764987427372; Fri, 05 Dec 2025
 18:17:07 -0800 (PST)
MIME-Version: 1.0
From: Daniel Chaves <daniel.chaves@ridgerun.com>
Date: Fri, 5 Dec 2025 20:16:56 -0600
X-Gm-Features: AWmQ_bmrMgPCR0Oj44h8QFJYBvmr4NRsG32txi-mQSwqupaAb4I9CFIDESZUaK8
Message-ID: <CAA0fTuhkdJY0chq---MwVMO=w3XU58Ebx4r3-L-iHmadv+f2og@mail.gmail.com>
Subject: Re: [OE-core] sharing sstate in bitbake-setup
To: Yocto-mailing-list <yocto@lists.yoctoproject.org>, 
	Alexander Kanavin <alex.kanavin@gmail.com>
Cc: ",openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>, 
	Joshua Watt <jpewhacker@gmail.com>
Content-Type: multipart/alternative; boundary="000000000000a44faa06453f2819"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 06 Dec 2025 09:09:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/227360

--000000000000a44faa06453f2819
Content-Type: text/plain; charset="UTF-8"

If your goal is to share hash equivalence data through a database, follow
the "Hash Equivalence Server Setup" instructions here:
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

`bitbake-hashserv --bind ${BB_HASHSERVE} --database
"${BB_HASHSERVE}.replace('.sock', '.db')"`



RidgeRun Embedded SW Engineer

Contact us: support@ridgerun.com
Developers wiki: https://developer.ridgerun.com/
Website: https://www.ridgerun.com/

-- 
This email and any attachments are intended for the sole use of the named 
recipient(s) and contain(s) confidential information that may be 
proprietary, privileged, or copyrighted under applicable law. If you are 
not the intended recipient, do not read, copy, or forward this email 
message or any attachments, delete this email message and any attachments 
immediately.

--000000000000a44faa06453f2819
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div><div style=3D"color:rgb(69,71,73);background-color:rg=
b(255,255,255);font-family:&quot;Droid Sans Mono&quot;,&quot;monospace&quot=
;,monospace;font-weight:normal;font-size:14px;line-height:19px;white-space:=
pre"><br><div><span style=3D"color:rgb(69,71,73)">If your goal is to share =
hash equivalence data through a database, follow the &quot;Hash Equivalence=
 Server Setup&quot; instructions here:</span></div><div><span style=3D"colo=
r:rgb(75,131,205);text-decoration:underline"><a href=3D"https://docs.yoctop=
roject.org/dev/_sources/dev-manual/hashequivserver.rst.txt">https://docs.yo=
ctoproject.org/dev/_sources/dev-manual/hashequivserver.rst.txt</a></span>.<=
/div><br><div><span style=3D"color:rgb(69,71,73)">Make sure to look at the =
</span><span style=3D"color:rgb(119,119,119)">`</span><span style=3D"color:=
rgb(171,101,38)">bind</span><span style=3D"color:rgb(119,119,119)">`</span>=
<span style=3D"color:rgb(69,71,73)"> and </span><span style=3D"color:rgb(11=
9,119,119)">`</span><span style=3D"color:rgb(171,101,38)">database</span><s=
pan style=3D"color:rgb(119,119,119)">`</span><span style=3D"color:rgb(69,71=
,73)"> options used when starting </span><span style=3D"color:rgb(119,119,1=
19)">`</span><span style=3D"color:rgb(171,101,38)">bitbake-hashserv</span><=
span style=3D"color:rgb(119,119,119)">`</span><span style=3D"color:rgb(69,7=
1,73)">. Then, on the client side, the configuration would look something l=
ike this:</span></div><br><div><span style=3D"color:rgb(119,119,119)">```</=
span></div><div><span style=3D"color:rgb(69,71,73)">BB_HASHSERVE =3D &quot;=
&lt;bind address of the running BitBake hash server&gt;&quot;</span></div><=
div><span style=3D"color:rgb(69,71,73)">BB_SIGNATURE_HANDLER =3D &quot;OEEq=
uivHash&quot;</span></div><div><span style=3D"color:rgb(119,119,119)">```</=
span></div><br><div><span style=3D"color:rgb(69,71,73)">So, in that scenari=
o the site.conf for Bitbake Setup could enable a bind address of </span><sp=
an style=3D"color:rgb(119,119,119)">`</span><span style=3D"color:rgb(171,10=
1,38)">unix://${TOPDIR}/../hashserv.sock</span><span style=3D"color:rgb(119=
,119,119)">`</span><span style=3D"color:rgb(69,71,73)"> to the BB_HASHSERVE=
.</span></div><br><div><span style=3D"color:rgb(69,71,73)">And the server c=
an be started with something like:</span></div><div><span style=3D"color:rg=
b(69,71,73)"><br></span></div><div><span style=3D"color:rgb(119,119,119)">`=
</span><span style=3D"color:rgb(171,101,38)">bitbake-hashserv --bind ${BB_H=
ASHSERVE} --database &quot;${BB_HASHSERVE}.replace(&#39;.sock&#39;, &#39;.d=
b&#39;)&quot;</span><span style=3D"color:rgb(119,119,119)">`</span></div><b=
r></div><br><br>RidgeRun Embedded SW Engineer<br><br>Contact us: <a href=3D=
"mailto:support@ridgerun.com">support@ridgerun.com</a><br>Developers wiki: =
<a href=3D"https://developer.ridgerun.com/">https://developer.ridgerun.com/=
</a><br>Website: <a href=3D"https://www.ridgerun.com/">https://www.ridgerun=
.com/</a><br><br></div><div><div dir=3D"ltr" class=3D"gmail_signature" data=
-smartmail=3D"gmail_signature"><div dir=3D"ltr"><div dir=3D"ltr" style=3D"m=
argin-left:0pt" align=3D"left"><table style=3D"border:none;border-collapse:=
collapse"><tbody><tr style=3D"height:105.98699999999998pt"><td colspan=3D"2=
" style=3D"border-left:solid #ffffff 1pt;border-right:solid #ffffff 1pt;bor=
der-bottom:solid #ffffff 1pt;border-top:solid #ffffff 1pt;vertical-align:mi=
ddle;padding:5pt 5pt 5pt 5pt;overflow:hidden"><br></td><td style=3D"border-=
left:solid #ffffff 1pt;border-right:solid #ffffff 1pt;border-bottom:solid #=
ffffff 1pt;border-top:solid #ffffff 1pt;vertical-align:middle;padding:5pt 5=
pt 5pt 5pt;overflow:hidden"><br></td></tr></tbody></table></div></div></div=
></div></div>

<br>
<span style=3D"color:rgb(0,0,0);font-family:&quot;Work Sans&quot;,sans-seri=
f;font-size:9.33333px;text-align:justify">This email and any attachments ar=
e intended for the sole use of the named recipient(s) and contain(s) confid=
ential information that may be proprietary, privileged, or copyrighted unde=
r applicable law. If you are not the intended recipient, do not read, copy,=
 or forward this email message or any attachments, delete this email messag=
e and any attachments immediately.</span><br>

--000000000000a44faa06453f2819--

