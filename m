Return-Path: <unitexe70@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 766B5C282C5
	for <webhook@archiver.kernel.org>; Fri, 28 Feb 2025 04:42:06 +0000 (UTC)
Received: from mail-pj1-f67.google.com (mail-pj1-f67.google.com [209.85.216.67])
 by mx.groups.io with SMTP id smtpd.web11.8895.1740717721727447539
 for <openembedded-core@lists.openembedded.org>;
 Thu, 27 Feb 2025 20:42:01 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=lfkJwzBN;
 spf=pass (domain: gmail.com, ip: 209.85.216.67, mailfrom: unitexe70@gmail.com)
Received: by mail-pj1-f67.google.com with SMTP id 98e67ed59e1d1-2f42992f608so2693624a91.0
        for <openembedded-core@lists.openembedded.org>; Thu, 27 Feb 2025 20:42:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740717721; x=1741322521; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=1LVzMpAQiHG1xM09EbeyiGNKFMtqj917WX9jv0+NcPA=;
        b=lfkJwzBNIb9NWQpWmrijJzWRv36iJ+DNFly026ma405Cr9UMraEdvqyIb5XQuTUx8V
         emSd6WtUqQsTqUStZ2KVFF7qfQSmVDrUoZJqEMmGXlnlYqNvicyo1W8O8QRlaa8HOamR
         VPE3mG5/HlGipcz+YsBiQhvCcerTMwzXqNV9DUbZe3cXHGMSCFYGYH6EqwIgAeB2tzlI
         w2I7VgYZErDrXVqyglwRhlRvJX+yNadfdyepnM4XUFjbaqcARDIDAoKdLdgO4OTkkrmC
         KvrU4Uo79xBn3KXzxzm1MGr6QCvNZG3w6JNhHCFtNwOY6cU3Uv3pQ2ThhjI4gJfx+XE0
         mHFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740717721; x=1741322521;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1LVzMpAQiHG1xM09EbeyiGNKFMtqj917WX9jv0+NcPA=;
        b=qtj912h60FBowZZCJSJMDBoonr9OUWtNUTAprdEs1nqWgxXD8DAZgbx4HTTbVwseQt
         ffIVnON3blmcoqMOVY6OEpkCKk1st4g9K+wUKfxjcuiZuRkIk39INv4h1QQsVUAZMzoT
         zvWIPBZFzSOTjBQD5uz9GUfYTe66LkV7rbSUOF6CHhT7SWP+95tUHGmAr4la7hWLXtRs
         o52tk5SWraMwuLF9j+Lhf7GIuZHhdWTKbL+WlWxPhZMVeRwXrRa0tmtFIrbR9uJDG07i
         njHfOloFnwE4QbVQaabypjrLTcESQrrrTipo2a8d78NZpvSo2LmbgMwmnLCsUkrQ0QCz
         d04A==
X-Gm-Message-State: AOJu0YwUowEj7HpBidC2JadPqIn3IPouhk1iYnUD+OkPTpEapQWBAeWR
	yvfybiKh2mLFc2NBLXgHVvbrjbH4acMyNeAmBLGVPpmQv9qazzFXyTNZttKttxgvSxD8V/qMAJF
	3z2TZOqQOlqj+F7XsU3eGSe22fl0=
X-Gm-Gg: ASbGncvBof9p4P6OBqI54uEHiZPvBOjgeccDkcHN2DbqFHUX5Hgv9unVGBPCzv7gb/I
	HU24anzCqmnWAAbJGZ+6cmVYpJqjmWZcYG4XH5gwHg6TZOwRmFfDCPi6LXpzK/2rZTI8by1nOIu
	TmyPZsuR9RCCK61sTkb7QR0KExJ85XwGApyUdyAQi1
X-Google-Smtp-Source: AGHT+IG1ksxGpl4m3mOcgb6xTZVpVoiYGKPGrpqELfDnuDXb7wnZwjIQ1CgfX5xnjkoBsOCkP+cw1Bx4sWUb6vG7Pws=
X-Received: by 2002:a17:90b:3a89:b0:2f8:4a3f:dd2d with SMTP id
 98e67ed59e1d1-2febab7875fmr3586970a91.15.1740717721079; Thu, 27 Feb 2025
 20:42:01 -0800 (PST)
MIME-Version: 1.0
References: <CAGqXGjRc_f+zs4aK_k9_tnJ55-UgedCLbuME08naD2u1DJqDVQ@mail.gmail.com>
 <AS1PR10MB5697AB4F79404B07AF1AD950FDC12@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
 <CAGqXGjQPQgxhCRMuuK9jZm8tct=VTbyer3-y-7nN6LSdPWGZzg@mail.gmail.com>
 <AS1PR10MB5697367DAE0E3A48DE16218AFDC32@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
 <AS1PR10MB569790848859A0B73E177B87FDCD2@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
In-Reply-To: <AS1PR10MB569790848859A0B73E177B87FDCD2@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
From: unit exe <unitexe70@gmail.com>
Date: Thu, 27 Feb 2025 22:41:49 -0600
X-Gm-Features: AQ5f1JqNXjN-HbqqbL5ghAe_K6co8yuf74d1HHGuj8Q6ydegyDNP08d3jgHQI4k
Message-ID: <CAGqXGjRrUDf9Cw5BiEHGU5gtGYANDQg2N9+_+Ws+bgBOeXPgFg@mail.gmail.com>
Subject: Re: [OE-core] Broken python3-grpcio on main branch
To: "Marko, Peter" <Peter.Marko@siemens.com>
Cc: "openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="0000000000006b555d062f2c6d88"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 28 Feb 2025 04:42:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/212047

--0000000000006b555d062f2c6d88
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

You're right, this is not a problem with your patches. My b, I should have
opened a new thread.

The instrument_server.py is a gRPC server I wrote to control instruments
via SCPI that I am adding to the image.

You're also right about the import issue. I created a
python3-protobuf_5.29.3.bb recipe and it resolved the issue.

Will look into sending a patch, thanks.

On Thu, Feb 27, 2025 at 5:42=E2=80=AFPM Marko, Peter <Peter.Marko@siemens.c=
om>
wrote:

> I have checked this and I think that this is not a problem with my
> unbundling patches.
>
> It seems that you=E2=80=99re trying to import feature with is available s=
ince
> protobuf v27, while we still have v25 in oe.
>
> I don=E2=80=99t know where you have your instrument_server.py script from=
.
>
> But maybe you could send patches to upgrade grpcio and protobuf if you
> need newer version of them=E2=80=A6
>
>
>
> Peter
>
>
>
> *From:* Marko, Peter (FT D EU SK BFS1)
> *Sent:* Tuesday, February 25, 2025 9:23
> *To:* unit exe <unitexe70@gmail.com>
> *Cc:* openembedded-core@lists.openembedded.org
> *Subject:* RE: [OE-core] Broken python3-grpcio on main branch
>
>
>
> I guess the unbundling experiment didn=E2=80=99t work out very well.
>
> I=E2=80=99ll send a revert in the evening.
>
>
>
> Peter
>
>
>
> *From:* unit exe <unitexe70@gmail.com>
> *Sent:* Tuesday, February 25, 2025 2:18
> *To:* Marko, Peter (FT D EU SK BFS1) <Peter.Marko@siemens.com>
> *Cc:* openembedded-core@lists.openembedded.org
> *Subject:* Re: [OE-core] Broken python3-grpcio on main branch
>
>
>
> With the revert I have confirmed that this error goes away. However, I am
> experiencing a new error when I attempt to launch a simple gRPC server. N=
ot
> sure how related this is.
>
>
>
> root@radxa-zero-3e:~# python3 /usr/bin/instrument_server.py
> Traceback (most recent call last):
>   File "/usr/bin/instrument_server.py", line 4, in <module>
>     import instrument_pb2
>   File "/usr/bin/instrument_pb2.py", line 9, in <module>
>     from google.protobuf import runtime_version as _runtime_version
> ImportError: cannot import name 'runtime_version' from 'google.protobuf'
> (/usr/lib/python3.13/site-packages/google/protobuf/__init__.py)
>
>
>
> On the styhead branch, I get no such error and the gRPC server works fine=
.
>
>
>
> On Sun, Feb 23, 2025 at 5:05=E2=80=AFAM Marko, Peter <Peter.Marko@siemens=
.com>
> wrote:
>
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
>

--0000000000006b555d062f2c6d88
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>You&#39;re right, this is not a problem with your pat=
ches. My b, I should have opened a new thread.</div><div><br></div><div>The=
 instrument_server.py is a gRPC server I wrote to control instruments via S=
CPI that I am adding to the image.</div><div><br></div><div>You&#39;re also=
 right about the import issue. I created a <a href=3D"http://python3-protob=
uf_5.29.3.bb">python3-protobuf_5.29.3.bb</a> recipe and it resolved the iss=
ue.</div><div><br></div><div>Will look into sending a patch, thanks.</div><=
/div><br><div class=3D"gmail_quote gmail_quote_container"><div dir=3D"ltr" =
class=3D"gmail_attr">On Thu, Feb 27, 2025 at 5:42=E2=80=AFPM Marko, Peter &=
lt;<a href=3D"mailto:Peter.Marko@siemens.com">Peter.Marko@siemens.com</a>&g=
t; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0p=
x 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><div c=
lass=3D"msg-1726937236101775962">





<div lang=3D"EN-US" style=3D"overflow-wrap: break-word;">
<div class=3D"m_-1726937236101775962WordSection1">
<p class=3D"MsoNormal"><span style=3D"font-size:10pt;font-family:&quot;Aria=
l&quot;,sans-serif">I have checked this and I think that this is not a prob=
lem with my unbundling patches.<u></u><u></u></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:10pt;font-family:&quot;Aria=
l&quot;,sans-serif">It seems that you=E2=80=99re trying to import feature w=
ith is available since protobuf v27, while we still have v25 in oe.<u></u><=
u></u></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:10pt;font-family:&quot;Aria=
l&quot;,sans-serif">I don=E2=80=99t know where you have your instrument_ser=
ver.py script from.<u></u><u></u></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:10pt;font-family:&quot;Aria=
l&quot;,sans-serif">But maybe you could send patches to upgrade grpcio and =
protobuf if you need newer version of them=E2=80=A6<u></u><u></u></span></p=
>
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
-family:&quot;Calibri&quot;,sans-serif"> Marko, Peter (FT D EU SK BFS1)
<br>
<b>Sent:</b> Tuesday, February 25, 2025 9:23<br>
<b>To:</b> unit exe &lt;<a href=3D"mailto:unitexe70@gmail.com" target=3D"_b=
lank">unitexe70@gmail.com</a>&gt;<br>
<b>Cc:</b> <a href=3D"mailto:openembedded-core@lists.openembedded.org" targ=
et=3D"_blank">openembedded-core@lists.openembedded.org</a><br>
<b>Subject:</b> RE: [OE-core] Broken python3-grpcio on main branch<u></u><u=
></u></span></p>
</div>
</div>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
<p class=3D"MsoNormal"><span style=3D"font-size:10pt;font-family:&quot;Aria=
l&quot;,sans-serif">I guess the unbundling experiment didn=E2=80=99t work o=
ut very well.<u></u><u></u></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:10pt;font-family:&quot;Aria=
l&quot;,sans-serif">I=E2=80=99ll send a revert in the evening.<u></u><u></u=
></span></p>
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
-family:&quot;Calibri&quot;,sans-serif"> unit exe &lt;<a href=3D"mailto:uni=
texe70@gmail.com" target=3D"_blank">unitexe70@gmail.com</a>&gt;
<br>
<b>Sent:</b> Tuesday, February 25, 2025 2:18<br>
<b>To:</b> Marko, Peter (FT D EU SK BFS1) &lt;<a href=3D"mailto:Peter.Marko=
@siemens.com" target=3D"_blank">Peter.Marko@siemens.com</a>&gt;<br>
<b>Cc:</b> <a href=3D"mailto:openembedded-core@lists.openembedded.org" targ=
et=3D"_blank">openembedded-core@lists.openembedded.org</a><br>
<b>Subject:</b> Re: [OE-core] Broken python3-grpcio on main branch<u></u><u=
></u></span></p>
</div>
</div>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
<div>
<div>
<p class=3D"MsoNormal">With the revert I have confirmed that this error goe=
s away. However, I am experiencing a new error when I attempt to launch a s=
imple gRPC server. Not sure how related this is.<u></u><u></u></p>
</div>
<div>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
</div>
<div>
<p class=3D"MsoNormal">root@radxa-zero-3e:~# python3 /usr/bin/instrument_se=
rver.py <br>
Traceback (most recent call last):<br>
=C2=A0 File &quot;/usr/bin/instrument_server.py&quot;, line 4, in &lt;modul=
e&gt;<br>
=C2=A0 =C2=A0 import instrument_pb2<br>
=C2=A0 File &quot;/usr/bin/instrument_pb2.py&quot;, line 9, in &lt;module&g=
t;<br>
=C2=A0 =C2=A0 from google.protobuf import runtime_version as _runtime_versi=
on<br>
ImportError: cannot import name &#39;runtime_version&#39; from &#39;google.=
protobuf&#39; (/usr/lib/python3.13/site-packages/google/protobuf/__init__.p=
y)<u></u><u></u></p>
</div>
<div>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
</div>
<div>
<p class=3D"MsoNormal">On the styhead branch, I get no such error and the g=
RPC server works fine.<u></u><u></u></p>
</div>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
<div>
<div>
<p class=3D"MsoNormal">On Sun, Feb 23, 2025 at 5:05<span style=3D"font-fami=
ly:&quot;Arial&quot;,sans-serif">=E2=80=AF</span>AM Marko, Peter &lt;<a hre=
f=3D"mailto:Peter.Marko@siemens.com" target=3D"_blank">Peter.Marko@siemens.=
com</a>&gt; wrote:<u></u><u></u></p>
</div>
<blockquote style=3D"border-width:medium medium medium 1pt;border-style:non=
e none none solid;border-color:currentcolor currentcolor currentcolor rgb(2=
04,204,204);padding:0in 0in 0in 6pt;margin:5pt 0in 5pt 4.8pt">
<div>
<div>
<div>
<p class=3D"MsoNormal"><span style=3D"font-size:10pt;font-family:&quot;Aria=
l&quot;,sans-serif">I have sent a revert of problematic commit.</span><u></=
u><u></u></p>
<p class=3D"MsoNormal"><span style=3D"font-size:10pt;font-family:&quot;Aria=
l&quot;,sans-serif">Sorry for this trouble.</span><u></u><u></u></p>
<p class=3D"MsoNormal"><span style=3D"font-size:10pt;font-family:&quot;Aria=
l&quot;,sans-serif">=C2=A0</span><u></u><u></u></p>
<p class=3D"MsoNormal"><span style=3D"font-size:10pt;font-family:&quot;Aria=
l&quot;,sans-serif">Peter</span><u></u><u></u></p>
<p class=3D"MsoNormal"><span style=3D"font-size:10pt;font-family:&quot;Aria=
l&quot;,sans-serif">=C2=A0</span><u></u><u></u></p>
<div style=3D"border-width:medium medium medium 1.5pt;border-style:none non=
e none solid;padding:0in 0in 0in 4pt;border-color:currentcolor currentcolor=
 currentcolor blue">
<div>
<div style=3D"border-width:1pt medium medium;border-style:solid none none;p=
adding:3pt 0in 0in;border-color:currentcolor">
<p class=3D"MsoNormal"><b><span style=3D"font-size:11pt;font-family:&quot;C=
alibri&quot;,sans-serif">From:</span></b><span style=3D"font-size:11pt;font=
-family:&quot;Calibri&quot;,sans-serif">
<a href=3D"mailto:openembedded-core@lists.openembedded.org" target=3D"_blan=
k">openembedded-core@lists.openembedded.org</a> &lt;<a href=3D"mailto:opene=
mbedded-core@lists.openembedded.org" target=3D"_blank">openembedded-core@li=
sts.openembedded.org</a>&gt;
<b>On Behalf Of </b>unit exe via <a href=3D"http://lists.openembedded.org" =
target=3D"_blank">
lists.openembedded.org</a><br>
<b>Sent:</b> Sunday, February 23, 2025 0:05<br>
<b>To:</b> <a href=3D"mailto:openembedded-core@lists.openembedded.org" targ=
et=3D"_blank">
openembedded-core@lists.openembedded.org</a><br>
<b>Subject:</b> [OE-core] Broken python3-grpcio on main branch</span><u></u=
><u></u></p>
</div>
</div>
<p class=3D"MsoNormal">=C2=A0<u></u><u></u></p>
<div>
<div>
<p class=3D"MsoNormal">Hello,<u></u><u></u></p>
</div>
<div>
<p class=3D"MsoNormal">=C2=A0<u></u><u></u></p>
</div>
<div>
<p class=3D"MsoNormal">I am building with the main branch of meta-openembed=
ded commit=C2=A029897344f7c9846e00856f46c4b3b47117a69499 and trying to impo=
rt the grpc python module. This results in this error:<u></u><u></u></p>
</div>
<div>
<p class=3D"MsoNormal">=C2=A0<u></u><u></u></p>
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
<p class=3D"MsoNormal">=C2=A0<u></u><u></u></p>
</div>
<div>
<p class=3D"MsoNormal">I see this error on rpi5 too. If I build with the st=
yhead branch (uses grpcio 1.66 instead of 1.70) I get no such error.<u></u>=
<u></u></p>
</div>
<div>
<p class=3D"MsoNormal">=C2=A0<u></u><u></u></p>
</div>
<div>
<p class=3D"MsoNormal">Any suggestions on how to fix this or debug the issu=
e further?<u></u><u></u></p>
</div>
</div>
</div>
</div>
</div>
</div>
</blockquote>
</div>
</div>
</div>
</div>
</div>
</div>

</div></blockquote></div>

--0000000000006b555d062f2c6d88--

