Return-Path: <gudnimar@noxmedical.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A4036C4345F
	for <webhook@archiver.kernel.org>; Sun,  5 May 2024 12:11:24 +0000 (UTC)
Received: from usb-smtp-delivery-118.mimecast.com (usb-smtp-delivery-118.mimecast.com [170.10.151.118])
 by mx.groups.io with SMTP id smtpd.web11.16238.1714911078806377282
 for <openembedded-core@lists.openembedded.org>;
 Sun, 05 May 2024 05:11:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@noxmedical.com header.s=mimecast20231107 header.b=EyR4miH5;
 spf=pass (domain: noxmedical.com, ip: 170.10.151.118, mailfrom: gudnimar@noxmedical.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=noxmedical.com;
	s=mimecast20231107; t=1714911078;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type;
	bh=GlVZFz+fSDcVmp3Kj9B91JYpu55CgUk8LQKjfXvNAog=;
	b=EyR4miH5md/TBE/QCuCIB01xb2fJiwMPsJTgdeoNPP8IQZXjH69oXr15bXKmRTmVBju1tr
	o/zH1b36W79f3Zyue76GSyb+YbZwsD/lSF/VjkzprM0Ywa+6QJ+FIfCHnLruoToLREmHOw
	EfnwN/H6cwEPpsRrrWsK4WsdTRXPb3Q=
Received: from mail-lj1-f198.google.com (mail-lj1-f198.google.com
 [209.85.208.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 usb-mta-9-wwIRlQVUNvKP_EcRQd23Nw-1; Sun, 05 May 2024 05:11:13 -0700
X-MC-Unique: wwIRlQVUNvKP_EcRQd23Nw-1
Received: by mail-lj1-f198.google.com with SMTP id 38308e7fff4ca-2e345cdb52bso1386731fa.3
        for <openembedded-core@lists.openembedded.org>; Sun, 05 May 2024 05:11:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714911071; x=1715515871;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5JMq1rwqj1hcMr9Pw48KkY6vPiaQ7lmTstAWyFDNqWY=;
        b=JE5qjA8O84hCZ7U9modL+gs4sDKVMqlq4Hb6v0X5D0cYu/WafVYziXTt2tnSa70rVc
         D5dWkAPP4ZE1XsKNGPXnsU99KGlX/5dej8A8o7TzaNDu+9ZsJ0FvIc/QvCGdgHxmKZzU
         VdRjt1nx6R27rIFsUo/bvpjzPAdJo6lXGJSFyOESrsaaJiqSy5BGFx8TQthlPgmR3Nts
         7kNQXhqiYee/wO0uGNzza5l1JM2C4JLX7GKsjydLI+BO6UYKEuGSrEYqKsG4+yMWfmlJ
         +349t0C1rT09xAmCVO5fUvdR6YcHeuDwNj6SUfZlO5haAa0mQxn1AUmJ4d7bG0nmoc0/
         KDng==
X-Gm-Message-State: AOJu0YwRemB45/xk/uua6r4eDuPXqZnOsYvuKXJu6iYmDyLg6cDv/hrG
	BNzsLre722GFWha40dJMojthNXArnF5kHNE+kjmpI49m5QyM8lijHbpuVHsy2QOGQT4d6+KbdhC
	qKyITDcywC+QHRlLutFRhtxUUi5zCHwnTfVe5Jsgj59qy7mHOPHFQg2WHkatvzqrpeNI0R7sYfe
	KL3VlP308+6c4rGFSdMj2d7f9q/h6dnCjIPiUlezQz3D7brTldsuy0UgyBTKsd84ECFok=
X-Received: by 2002:a2e:7d0f:0:b0:2e1:a40b:af2d with SMTP id y15-20020a2e7d0f000000b002e1a40baf2dmr5942815ljc.22.1714911071096;
        Sun, 05 May 2024 05:11:11 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF088g0iEnOpRhAf+8y0uURyTIJdqyfWFh1y+gQst0/bj0eFFY7FkC6XZNAonP7wRzG5U6Wjw==
X-Received: by 2002:a2e:7d0f:0:b0:2e1:a40b:af2d with SMTP id y15-20020a2e7d0f000000b002e1a40baf2dmr5942782ljc.22.1714911070342;
        Sun, 05 May 2024 05:11:10 -0700 (PDT)
Received: from gudni-virtual-machine.localdomain ([81.15.100.92])
        by smtp.gmail.com with ESMTPSA id s2-20020a5d4242000000b003472489d26fsm8110448wrr.19.2024.05.05.05.11.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 May 2024 05:11:08 -0700 (PDT)
From: =?UTF-8?q?Gu=C3=B0ni=20M=C3=A1r=20Gilbert?= <gudnimar@noxmedical.com>
To: openembedded-core@lists.openembedded.org
Cc: =?UTF-8?q?Gu=C3=B0ni=20M=C3=A1r=20Gilbert?= <gudnimar@noxmedical.com>
Subject: [PATCH] python3-pyopenssl: drop python3-six from RDEPENDS
Date: Sun,  5 May 2024 12:10:45 +0000
Message-Id: <20240505121045.4609-1-gudnimar@noxmedical.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: noxmedical.com
Content-Type: multipart/alternative;
	boundary="MCBoundary=_12405050511160881"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 05 May 2024 12:11:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/199021

--MCBoundary=_12405050511160881
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Python 2.7 support was dropped in version 22.0.0
python3-six was dropped as a dependency in 22.0.0

Signed-off-by: Gu=C3=B0ni M=C3=A1r Gilbert <gudnimar@noxmedical.com>
---
 meta/recipes-devtools/python/python3-pyopenssl_24.1.0.bb | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta/recipes-devtools/python/python3-pyopenssl_24.1.0.bb b/met=
a/recipes-devtools/python/python3-pyopenssl_24.1.0.bb
index e714ad838e..9ef3145bf8 100644
--- a/meta/recipes-devtools/python/python3-pyopenssl_24.1.0.bb
+++ b/meta/recipes-devtools/python/python3-pyopenssl_24.1.0.bb
@@ -15,7 +15,6 @@ FILES:${PN}-tests =3D "${libdir}/${PYTHON_DIR}/site-packa=
ges/OpenSSL/test"
=20
 RDEPENDS:${PN}:class-target =3D " \
     python3-cryptography \
-    python3-six \
     python3-threading \
 "
 RDEPENDS:${PN}-tests =3D "${PN}"
--=20
2.34.1

Disclaimer

The information contained in this communication from the sender is confiden=
tial. It is intended solely for use by the recipient and others authorized =
to receive it. If you are not the recipient, you are hereby notified that a=
ny disclosure, copying, distribution or taking action in relation of the co=
ntents of this information is strictly prohibited and may be unlawful.

This email has been scanned for viruses and malware, and may have been auto=
matically archived by Mimecast, a leader in email security and cyber resili=
ence. Mimecast integrates email defenses with brand protection, security aw=
areness training, web security, compliance and other essential capabilities=
. Mimecast helps protect large and small organizations from malicious activ=
ity, human error and technology failure; and to lead the movement toward bu=
ilding a more resilient world. To find out more, visit our website.

--MCBoundary=_12405050511160881
Content-Transfer-Encoding: quoted-printable
Content-Type: text/html; charset=UTF-8

<html><head><style type=3D"text/css">.style1 {font-family: "Times New Roman=
";}</style></head><body>Python 2.7 support was dropped in version 22.0.0<BR=
>
python3-six was dropped as a dependency in 22.0.0<BR>
<BR>
Signed-off-by: Gu&eth;ni M&aacute;r Gilbert &lt;gudnimar@noxmedical.com&gt;=
<BR>
---<BR>
 meta/recipes-devtools/python/python3-pyopenssl_24.1.0.bb | 1 -<BR>
 1 file changed, 1 deletion(-)<BR>
<BR>
diff --git a/meta/recipes-devtools/python/python3-pyopenssl_24.1.0.bb b/met=
a/recipes-devtools/python/python3-pyopenssl_24.1.0.bb<BR>
index e714ad838e..9ef3145bf8 100644<BR>
--- a/meta/recipes-devtools/python/python3-pyopenssl_24.1.0.bb<BR>
+++ b/meta/recipes-devtools/python/python3-pyopenssl_24.1.0.bb<BR>
@@ -15,7 +15,6 @@ FILES:${PN}-tests =3D &quot;${libdir}/${PYTHON_DIR}/site-=
packages/OpenSSL/test&quot;<BR>
 <BR>
 RDEPENDS:${PN}:class-target =3D &quot; \<BR>
     python3-cryptography \<BR>
-    python3-six \<BR>
     python3-threading \<BR>
 &quot;<BR>
 RDEPENDS:${PN}-tests =3D &quot;${PN}&quot;<BR>
-- <BR>
2.34.1<BR>

<br><br><p style=3D"font-family: Verdana; font-size:10pt; color:#666666;"><=
/p><p style=3D"font-family: Verdana; font-size:8pt; color:#666666;">Warning=
:  Copyright Nox Health.  This communication is confidential and may contai=
n privileged information.  By the use of email over the Internet or other c=
ommunication systems, Nox Health is not waiving either confidentiality of, =
or legal privilege in, the content of the email and of any attachments.  If=
 the recipient of this message is not the intended addressee, please call N=
ox Health immediately by calling (+1) 888.505.0280</p></body></html>

--MCBoundary=_12405050511160881--


