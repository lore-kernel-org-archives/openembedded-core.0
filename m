Return-Path: <unitexe70@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 16053C021A4
	for <webhook@archiver.kernel.org>; Tue, 25 Feb 2025 01:18:03 +0000 (UTC)
Received: from mail-pl1-f196.google.com (mail-pl1-f196.google.com [209.85.214.196])
 by mx.groups.io with SMTP id smtpd.web11.1420.1740446274255371092
 for <openembedded-core@lists.openembedded.org>;
 Mon, 24 Feb 2025 17:17:54 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=X0HMs1GD;
 spf=pass (domain: gmail.com, ip: 209.85.214.196, mailfrom: unitexe70@gmail.com)
Received: by mail-pl1-f196.google.com with SMTP id d9443c01a7336-220c8eb195aso110356635ad.0
        for <openembedded-core@lists.openembedded.org>; Mon, 24 Feb 2025 17:17:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740446274; x=1741051074; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Bvlj41/bevch83lNN7R13cum5R3idihWGtk+iRh0LDQ=;
        b=X0HMs1GD61kgOytGV823NeFQqby8TQ0QZd0yJahePgCqHIeqBJRqYkTqu21YgnrKlk
         1tT4cDyR3K198bzKKEwaDhNwkUfsg8Ko+eiMryrIL0wYOa7f9iYp/Jd3EN+lE/rvzd2D
         8/JV7mZlaqNZKPiQR3FSVu276CyD1bZexZn6ENeqmiUEzrG7+ueMZq5vkxOWpkRHPVmh
         FcW8CgU+d+0OKWp2Tp//KwR3bbcBNOJtX01IYPyDBoRMsO1n71QK1ceZew29aVDRALEc
         iMcdkYDoCiUv3GoQmDyBUiePCXLb6uQI4ZwbLA/aJczePfjI/wszsYotrdnON2MDWb2X
         dgzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740446274; x=1741051074;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Bvlj41/bevch83lNN7R13cum5R3idihWGtk+iRh0LDQ=;
        b=YFYikmdumfSQkYFF4/324g4Wj9GLVz9KMmKMbW+ab42lm5VwW/xtde7ENZQsdidP7j
         Zoifj3zOVVWzG4qUKtPqczImhxNnoBqUAjaxs3K2KFmJEFseyQofhSOQCuQfXIrPKlW8
         JbeszFj/ADCEyQVUoZdNcBDKT89SoGJBGvz8aDETtWZLQmcAR6Pc5Us7D2u0c4BeSnJf
         lMgdtlssXs+HrPFrALLMB7NYT2OW5J8/zBzlKvLb1e9iG6DYZ/TGakCer+A5slTM2ahg
         DxkdKP9q78Gnhn/QSCAAYKY4qkUj+LHW0xhASTm96hWhtwoiQXC+nLCS+iGVE+TACosy
         /80Q==
X-Gm-Message-State: AOJu0Yzgj5loqmGWYn7ZNmYUgW9jHldsMnKYvwxPNfo5qR3akbCC06D2
	pISpjcpn/NIh6btqbVO5SARy7nyfoX/IJnISCb9m55gmIGfzA0Fs8CE8peL2n+fkfVJbmvkCqoo
	CAnVO5q4pNOCIgCUz5s9y3blW9q0=
X-Gm-Gg: ASbGncs+gEn2qfztpJq2N4V3zf9IW5B/HtZkaljGlMt2ba3zJuK1J+7yM/dbqxgVvq7
	4gloNxmxxPMzert/FYXo8b92NaYz2+PDMlHhHLG5qBQtlSee1B3eu7Mkk1MsmYUXhUNUVTt33wx
	fcU3YJGe6Lp0KlKpCe6c+1OFm1fERdh8T3Nc88doPM
X-Google-Smtp-Source: AGHT+IFbbU3drveiLFg1NBjV3wMmmPmajFdnh/8NM+Ve7nApl87YryQWNAZc5mI7xodjDrOkRlrcX3QosI9rWXv/zRA=
X-Received: by 2002:a17:902:f687:b0:220:bd01:6507 with SMTP id
 d9443c01a7336-2219ff5e8damr224417145ad.25.1740446273596; Mon, 24 Feb 2025
 17:17:53 -0800 (PST)
MIME-Version: 1.0
References: <CAGqXGjRc_f+zs4aK_k9_tnJ55-UgedCLbuME08naD2u1DJqDVQ@mail.gmail.com>
 <AS1PR10MB5697AB4F79404B07AF1AD950FDC12@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
In-Reply-To: <AS1PR10MB5697AB4F79404B07AF1AD950FDC12@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
From: unit exe <unitexe70@gmail.com>
Date: Mon, 24 Feb 2025 19:17:41 -0600
X-Gm-Features: AWEUYZk9mHs0untlK7ppSX2aCiWztgCpitiFCoc_ilTZY5F22tGuJWxw1d7yc7k
Message-ID: <CAGqXGjQPQgxhCRMuuK9jZm8tct=VTbyer3-y-7nN6LSdPWGZzg@mail.gmail.com>
Subject: Re: [OE-core] Broken python3-grpcio on main branch
To: "Marko, Peter" <Peter.Marko@siemens.com>
Cc: "openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="000000000000e373ad062eed39b8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 25 Feb 2025 01:18:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/211860

--000000000000e373ad062eed39b8
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

With the revert I have confirmed that this error goes away. However, I am
experiencing a new error when I attempt to launch a simple gRPC server. Not
sure how related this is.

root@radxa-zero-3e:~# python3 /usr/bin/instrument_server.py
Traceback (most recent call last):
  File "/usr/bin/instrument_server.py", line 4, in <module>
    import instrument_pb2
  File "/usr/bin/instrument_pb2.py", line 9, in <module>
    from google.protobuf import runtime_version as _runtime_version
ImportError: cannot import name 'runtime_version' from 'google.protobuf'
(/usr/lib/python3.13/site-packages/google/protobuf/__init__.py)

On the styhead branch, I get no such error and the gRPC server works fine.

On Sun, Feb 23, 2025 at 5:05=E2=80=AFAM Marko, Peter <Peter.Marko@siemens.c=
om>
wrote:

> I have sent a revert of problematic commit.
>
> Sorry for this trouble.
>
>
>
> Peter
>
>
>
> *From:* openembedded-core@lists.openembedded.org <
> openembedded-core@lists.openembedded.org> *On Behalf Of *unit exe via
> lists.openembedded.org
> *Sent:* Sunday, February 23, 2025 0:05
> *To:* openembedded-core@lists.openembedded.org
> *Subject:* [OE-core] Broken python3-grpcio on main branch
>
>
>
> Hello,
>
>
>
> I am building with the main branch of meta-openembedded
> commit 29897344f7c9846e00856f46c4b3b47117a69499 and trying to import the
> grpc python module. This results in this error:
>
>
>
> root@radxa-zero-3e:~# python3
> Python 3.13.2 (main, Feb  4 2025, 14:51:09) [GCC 14.2.0] on linux
> Type "help", "copyright", "credits" or "license" for more information.
> >>> import grpc
> Traceback (most recent call last):
>   File "<python-input-0>", line 1, in <module>
>     import grpc
>   File "/usr/lib/python3.13/site-packages/grpc/__init__.py", line 22, in
> <module>
>     from grpc import _compression
>   File "/usr/lib/python3.13/site-packages/grpc/_compression.py", line 20,
> in <module>
>     from grpc._cython import cygrpc
> ImportError: /usr/lib/python3.13/site-packages/grpc/_cython/
> cygrpc.cpython-313-aarch64-linux-gnu.so: undefined symbol:
> _ZN4absl12lts_2024072212log_internal17kUnsignedCharNullE
>
>
>
> I see this error on rpi5 too. If I build with the styhead branch (uses
> grpcio 1.66 instead of 1.70) I get no such error.
>
>
>
> Any suggestions on how to fix this or debug the issue further?
>

--000000000000e373ad062eed39b8
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">With the revert I have confirmed that thi=
s error goes away. However, I am experiencing a new error when I attempt to=
 launch a simple gRPC server. Not sure how related this is.</div><div dir=
=3D"ltr"><br></div><div dir=3D"ltr">root@radxa-zero-3e:~# python3 /usr/bin/=
instrument_server.py <br>Traceback (most recent call last):<br>=C2=A0 File =
&quot;/usr/bin/instrument_server.py&quot;, line 4, in &lt;module&gt;<br>=C2=
=A0 =C2=A0 import instrument_pb2<br>=C2=A0 File &quot;/usr/bin/instrument_p=
b2.py&quot;, line 9, in &lt;module&gt;<br>=C2=A0 =C2=A0 from google.protobu=
f import runtime_version as _runtime_version<br>ImportError: cannot import =
name &#39;runtime_version&#39; from &#39;google.protobuf&#39; (/usr/lib/pyt=
hon3.13/site-packages/google/protobuf/__init__.py)</div><div dir=3D"ltr"><b=
r></div><div>On the styhead branch, I get no such error and the gRPC server=
 works fine.</div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"=
gmail_attr">On Sun, Feb 23, 2025 at 5:05=E2=80=AFAM Marko, Peter &lt;<a hre=
f=3D"mailto:Peter.Marko@siemens.com" target=3D"_blank">Peter.Marko@siemens.=
com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"marg=
in:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1e=
x"><div>





<div lang=3D"EN-US">
<div>
<p class=3D"MsoNormal"><span style=3D"font-size:10pt;font-family:&quot;Aria=
l&quot;,sans-serif">I have sent a revert of problematic commit.<u></u><u></=
u></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:10pt;font-family:&quot;Aria=
l&quot;,sans-serif">Sorry for this trouble.<u></u><u></u></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:10pt;font-family:&quot;Aria=
l&quot;,sans-serif"><u></u>=C2=A0<u></u></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:10pt;font-family:&quot;Aria=
l&quot;,sans-serif">Peter<u></u><u></u></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:10pt;font-family:&quot;Aria=
l&quot;,sans-serif"><u></u>=C2=A0<u></u></span></p>
<div style=3D"border-width:medium medium medium 1.5pt;border-style:none non=
e none solid;border-color:currentcolor currentcolor currentcolor blue;paddi=
ng:0in 0in 0in 4pt">
<div>
<div style=3D"border-width:1pt medium medium;border-style:solid none none;b=
order-color:rgb(225,225,225) currentcolor currentcolor;padding:3pt 0in 0in"=
>
<p class=3D"MsoNormal"><b><span style=3D"font-size:11pt;font-family:&quot;C=
alibri&quot;,sans-serif">From:</span></b><span style=3D"font-size:11pt;font=
-family:&quot;Calibri&quot;,sans-serif"> <a href=3D"mailto:openembedded-cor=
e@lists.openembedded.org" target=3D"_blank">openembedded-core@lists.openemb=
edded.org</a> &lt;<a href=3D"mailto:openembedded-core@lists.openembedded.or=
g" target=3D"_blank">openembedded-core@lists.openembedded.org</a>&gt;
<b>On Behalf Of </b>unit exe via <a href=3D"http://lists.openembedded.org" =
target=3D"_blank">lists.openembedded.org</a><br>
<b>Sent:</b> Sunday, February 23, 2025 0:05<br>
<b>To:</b> <a href=3D"mailto:openembedded-core@lists.openembedded.org" targ=
et=3D"_blank">openembedded-core@lists.openembedded.org</a><br>
<b>Subject:</b> [OE-core] Broken python3-grpcio on main branch<u></u><u></u=
></span></p>
</div>
</div>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
<div>
<div>
<p class=3D"MsoNormal">Hello,<u></u><u></u></p>
</div>
<div>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
</div>
<div>
<p class=3D"MsoNormal">I am building with the main branch of meta-openembed=
ded commit=C2=A029897344f7c9846e00856f46c4b3b47117a69499 and trying to impo=
rt the grpc python module. This results in this error:<u></u><u></u></p>
</div>
<div>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
</div>
<div>
<p class=3D"MsoNormal">root@radxa-zero-3e:~# python3<br>
Python 3.13.2 (main, Feb =C2=A04 2025, 14:51:09) [GCC 14.2.0] on linux<br>
Type &quot;help&quot;, &quot;copyright&quot;, &quot;credits&quot; or &quot;=
license&quot; for more information.<br>
&gt;&gt;&gt; import grpc<br>
Traceback (most recent call last):<br>
=C2=A0 File &quot;&lt;python-input-0&gt;&quot;, line 1, in &lt;module&gt;<b=
r>
=C2=A0 =C2=A0 import grpc<br>
=C2=A0 File &quot;/usr/lib/python3.13/site-packages/grpc/__init__.py&quot;,=
 line 22, in &lt;module&gt;<br>
=C2=A0 =C2=A0 from grpc import _compression<br>
=C2=A0 File &quot;/usr/lib/python3.13/site-packages/grpc/_compression.py&qu=
ot;, line 20, in &lt;module&gt;<br>
=C2=A0 =C2=A0 from grpc._cython import cygrpc<br>
ImportError: /usr/lib/python3.13/site-packages/grpc/_cython/<a href=3D"http=
://cygrpc.cpython-313-aarch64-linux-gnu.so" target=3D"_blank">cygrpc.cpytho=
n-313-aarch64-linux-gnu.so</a>: undefined symbol: _ZN4absl12lts_2024072212l=
og_internal17kUnsignedCharNullE<u></u><u></u></p>
</div>
<div>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
</div>
<div>
<p class=3D"MsoNormal">I see this error on rpi5 too. If I build with the st=
yhead branch (uses grpcio 1.66 instead of 1.70) I get no such error.<u></u>=
<u></u></p>
</div>
<div>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
</div>
<div>
<p class=3D"MsoNormal">Any suggestions on how to fix this or debug the issu=
e further?<u></u><u></u></p>
</div>
</div>
</div>
</div>
</div>

</div></blockquote></div>
</div>

--000000000000e373ad062eed39b8--

