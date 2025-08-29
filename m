Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E5C97CA0FF0
	for <webhook@archiver.kernel.org>; Fri, 29 Aug 2025 18:49:19 +0000 (UTC)
Received: from mail-qv1-f54.google.com (mail-qv1-f54.google.com [209.85.219.54])
 by mx.groups.io with SMTP id smtpd.web11.17757.1756483268547045729
 for <openembedded-core@lists.openembedded.org>;
 Fri, 29 Aug 2025 09:01:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=UJkLGe50;
 spf=pass (domain: gmail.com, ip: 209.85.219.54, mailfrom: rmmuniz@gmail.com)
Received: by mail-qv1-f54.google.com with SMTP id 6a1803df08f44-70dfe0ff970so15050876d6.1
        for <openembedded-core@lists.openembedded.org>; Fri, 29 Aug 2025 09:01:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756483267; x=1757088067; darn=lists.openembedded.org;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=4VpKo3trUolITcCV9WGx8UxQ9GU1fu8r0gZtIslNKQc=;
        b=UJkLGe50KbBKtVGDEA5dajvSeFEnN7px8c4un5/le5fxEL0bimtRR2FB4oa49ltQG1
         lA2jyqr2ImYxfb4Tol2BErod344Mr2Ec0IKOMUml92MLpF7dZ/cX0GMlZd93PAzCUDzw
         IV5yN+myAY1uGd5RABIj2uLwXK/ChLlVa71bHunCcJBmdoprTt24DuJdRxOtUSBeNFm3
         eibwDM72eOwRpOmV6gFMgr/dZx0EsR/6812VcU207XvDYXq1tt9nUE1EaFtQjb47ZG5Q
         iA42IOBdcV725shvjAnRRKIZ00GygIebzGHVELWquqwnxCGUCDB+p3otcMBIPzmzW3sn
         ijTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756483267; x=1757088067;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=4VpKo3trUolITcCV9WGx8UxQ9GU1fu8r0gZtIslNKQc=;
        b=UF0rzIfkfnFTQKexe+Wud1twENUah/UizB5cgo9DIiijIB3j5HLQM4QWYtK0e4Wzwb
         mj0izmjRrxgjKnAON5XmZKYno5haXEyxxs6glrgh0EzYp3IiMwVS53A6K3Nl7NKh3mtV
         x2t1FjUsnzZGxyu6CQwrZtjjHfhpfbPBuge3XHDlqIN0fOtngTJeYjQCEQXATP0FFgvm
         i2jCY1igVi23LUhzONOLCQap2jnlIq3U6Heu6pRlyHctOK2qGV2fIT/9O0obJjht37lC
         +5hAzweyLdwa5hbUHxNwieNVdVg8VnpKs2JY2/Oftwg2meK1xmTD1SE1cyfu4J+AJynJ
         61ow==
X-Gm-Message-State: AOJu0YxC+DAhP+w5gheNz5jNlyF/p7fU7VoT7He1/03QBlFIe5S5pDJc
	95VzkL1wRPvLRpzj8TqitMKVHWtEGx3xmub7Df+Oya3UwAEQiAz241tYRdKnkyeY2hcj+dTyRR4
	hajrOpZBjrrRjGkYUCqqV/D9My7Moq9bFm9TGdbU=
X-Gm-Gg: ASbGncuUOhTHrMZSQjhqAeofFidYh9ZvYRkj7gZnspx7VGcfnhkZrxFqo7HN2WKSUBT
	YoGmIh8EfywYDpEYDb6QkTDidWaNcvmjHE3qWTLz9GY9LxeRiWpQzpEoq7am0ZIfJGczNsDpeBC
	ClHIse7OvmPQuAKoSe9zr6xpCsRcpJTK8vQWXZN9DjlFneau5bgYsuaAdQmlVQnCDW7wVMy/DEu
	hlaTv9LHRD+lwgo
X-Google-Smtp-Source: AGHT+IHq6+cvCVf1Vvoq/kPAyLSqsu4y40a9AhwXNBZPNGNwxYP9eQ+fiqIRRM00b2rdsFtz7lBPhNuf6xk+G/G4cjQ=
X-Received: by 2002:a05:620a:2894:b0:7e6:856d:bcb with SMTP id
 af79cd13be357-7ea10f94df7mr3748284685a.6.1756482824781; Fri, 29 Aug 2025
 08:53:44 -0700 (PDT)
MIME-Version: 1.0
From: Rene Muniz <rmmuniz@gmail.com>
Date: Fri, 29 Aug 2025 11:53:33 -0400
X-Gm-Features: Ac12FXyEN8rqvBKazrmWUo6LHpSKTjGRnjl5EmnIjMScJ2FX_8qPaX15FAzTnCA
Message-ID: <CAPyN=MLstOTnbM0OMYaw12uHbes0NUz5Z9uRM4KOQQndg2_W3A@mail.gmail.com>
Subject: Walnascar backport: python3-evdev_1.9.2.bb
To: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000d34c5c063d83065b"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 29 Aug 2025 18:49:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/222620

--000000000000d34c5c063d83065b
Content-Type: text/plain; charset="UTF-8"

Dear, is it possible to backport the recipe python3-evdev_1.9.2.bb to
Walnascar? The reason is that python3-evdev_1.9.1.bb seems broken, by just
importing the lib we got an error:

Python 3.13.4 (main, Jun  3 2025, 15:34:24) [GCC 14.3.0] on linux
Type "help", "copyright", "credits" or "license" for more information.
>>> import evdev
Traceback (most recent call last):
  File "<python-input-0>", line 1, in <module>
    import evdev
  File "/usr/lib/python3.13/site-packages/evdev/__init__.py", line 8, in
<module>
    from . import (
    ...<2 lines>...
    )
  File "/usr/lib/python3.13/site-packages/evdev/ecodes.py", line 78, in
<module>
    for k, v in g[prefix].items():
                ~^^^^^^^^
KeyError: 'UI_FF'

Tested python3-evdev_1.9.2.bb present in master
46866b0022690f7408d0c5d7d3a22ba03e3af1a7 and it works great.

Thanks in advance, best regards,
Rene

--000000000000d34c5c063d83065b
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Dear, is it possible to backport the recipe <a href=3D"htt=
p://python3-evdev_1.9.2.bb">python3-evdev_1.9.2.bb</a> to Walnascar? The re=
ason is that <a href=3D"http://python3-evdev_1.9.1.bb">python3-evdev_1.9.1.=
bb</a> seems broken, by just importing the lib we got an error:<br><br><fon=
t face=3D"monospace">Python 3.13.4 (main, Jun =C2=A03 2025, 15:34:24) [GCC =
14.3.0] on linux<br>Type &quot;help&quot;, &quot;copyright&quot;, &quot;cre=
dits&quot; or &quot;license&quot; for more information.<br>&gt;&gt;&gt; imp=
ort evdev<br>Traceback (most recent call last):<br>=C2=A0 File &quot;&lt;py=
thon-input-0&gt;&quot;, line 1, in &lt;module&gt;<br>=C2=A0 =C2=A0 import e=
vdev<br>=C2=A0 File &quot;/usr/lib/python3.13/site-packages/evdev/__init__.=
py&quot;, line 8, in &lt;module&gt;<br>=C2=A0 =C2=A0 from . import (<br>=C2=
=A0 =C2=A0 ...&lt;2 lines&gt;...<br>=C2=A0 =C2=A0 )<br>=C2=A0 File &quot;/u=
sr/lib/python3.13/site-packages/evdev/ecodes.py&quot;, line 78, in &lt;modu=
le&gt;<br>=C2=A0 =C2=A0 for k, v in g[prefix].items():<br>=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ~^^^^^^^^<br>KeyError: &#39;UI_FF&#3=
9;</font><br><br>Tested <font face=3D"monospace"><a href=3D"http://python3-=
evdev_1.9.2.bb">python3-evdev_1.9.2.bb</a></font> present in master <font f=
ace=3D"monospace">46866b0022690f7408d0c5d7d3a22ba03e3af1a7</font> and it wo=
rks great.<br><br>Thanks in advance, best regards,<br>Rene</div>

--000000000000d34c5c063d83065b--

