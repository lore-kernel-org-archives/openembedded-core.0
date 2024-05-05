Return-Path: <gudnimar@noxmedical.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 95448C4345F
	for <webhook@archiver.kernel.org>; Sun,  5 May 2024 12:02:14 +0000 (UTC)
Received: from usb-smtp-delivery-118.mimecast.com (usb-smtp-delivery-118.mimecast.com [170.10.151.118])
 by mx.groups.io with SMTP id smtpd.web10.15877.1714910529737709622
 for <openembedded-core@lists.openembedded.org>;
 Sun, 05 May 2024 05:02:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@noxmedical.com header.s=mimecast20231107 header.b=OyJJ+oTS;
 spf=pass (domain: noxmedical.com, ip: 170.10.151.118, mailfrom: gudnimar@noxmedical.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=noxmedical.com;
	s=mimecast20231107; t=1714910529;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type;
	bh=7dklbMX0fZDMhxBPnYHR6OB+2bUqhpVwWWdOrL4fhuU=;
	b=OyJJ+oTS1HZH4AMjBZLqyWiAgm6mHeijDPI06r+UlQEi8A2A6y0NWeDl6EZehQFocTs6Z3
	4MkBO1QKdP7UHuNzjJlPO1XkiRr/Qgb/MdVywp1TegYlXGcKBJpEJ/z6qn0dL4iSFrNyxU
	KvUEBdfqzcIQI7RSGSIwM9T3yvMAn0c=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 usb-mta-1-NtGg8yKbNhmR24txIIilZg-1; Sun, 05 May 2024 05:02:04 -0700
X-MC-Unique: NtGg8yKbNhmR24txIIilZg-1
Received: by mail-wr1-f70.google.com with SMTP id ffacd0b85a97d-34dc34c758fso708242f8f.0
        for <openembedded-core@lists.openembedded.org>; Sun, 05 May 2024 05:02:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714910522; x=1715515322;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hzqsl6QryUi+1etp5lOplMnWjzeGrl03tOxet8CyTK0=;
        b=wVwEnUZamoF3ClNv7sKytNYH2le6XNLCyV90ync5PI9xymNx1eG0F4xWoYqi+g8Xkz
         paHZ12HtTHSee+unaMlDACjE/wvjDH0/vTP3sFucqZw2gqgvhYTvy3lDjtn3BInLx8gG
         AO5uYIByJI2mHE2RvSP9U9XbUFTw3JzjlJAaIw/VO3+E0de/kSn2tlZRykx/kINuX0rN
         ClUbqmz3hpeoVJ7Ddx6M4hvPKAl9fKx93EPqSpB8SZ8GeGuHOUnaX2jCk+j5pkMeqQmm
         AWyq9E6U0OIX7iTM4weMuH6OLY87uM21JOeO+7S1M7QNaf22ndvyqhPDAeR5vHPmImjO
         AaTw==
X-Gm-Message-State: AOJu0YyzE0L4LqF5TAcRYk0agVJs7tnXZadzzuHAjgGYslYwJGytJEws
	HmaUcPRfGS6FC3bqD73N2DvQ4RM53Kon7/D9VQAmFz5sBzCEI/xcNodtq7o8g2Kj78zvSxmFQWW
	HcySqeSZGH9eBiYgQGqT001Wffmeht1rH6FtDfpXIA+ru88BDPHEISU3FJHPKdBGrBJhoTMkQTK
	IxuU0ZXH2IZ4M/Srv+KmxiqOVyqTpxNyW1fxRdjtkmCd+gv8NLnGDf3bI+gWhhJjP69R8=
X-Received: by 2002:a05:600c:4f83:b0:41b:dca6:a3fa with SMTP id n3-20020a05600c4f8300b0041bdca6a3famr5870300wmq.39.1714910522019;
        Sun, 05 May 2024 05:02:02 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEIUbbFJtD0QrJNEQvaK1hCEufDZD61WSoCkWhSp8QR8EACdXHBp81f0xPMv5OcGC6GGwv99w==
X-Received: by 2002:a05:600c:4f83:b0:41b:dca6:a3fa with SMTP id n3-20020a05600c4f8300b0041bdca6a3famr5870282wmq.39.1714910521471;
        Sun, 05 May 2024 05:02:01 -0700 (PDT)
Received: from gudni-virtual-machine.localdomain ([81.15.100.92])
        by smtp.gmail.com with ESMTPSA id u21-20020a05600c139500b004190d7126c0sm16148942wmf.38.2024.05.05.05.02.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 May 2024 05:02:00 -0700 (PDT)
From: =?UTF-8?q?Gu=C3=B0ni=20M=C3=A1r=20Gilbert?= <gudnimar@noxmedical.com>
To: openembedded-core@lists.openembedded.org
Cc: =?UTF-8?q?Gu=C3=B0ni=20M=C3=A1r=20Gilbert?= <gudnimar@noxmedical.com>
Subject: [PATCH] python3-bcrypt: drop python3-six from RDEPENDS
Date: Sun,  5 May 2024 12:01:45 +0000
Message-Id: <20240505120145.4167-1-gudnimar@noxmedical.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: noxmedical.com
Content-Type: multipart/alternative;
	boundary="MCBoundary=_12405050502070381"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 05 May 2024 12:02:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/199020

--MCBoundary=_12405050502070381
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Python 2.7 support was dropped in version 3.2.0 and
python3-six dependency was subsequently dropped in version 3.2.1

Signed-off-by: Gu=C3=B0ni M=C3=A1r Gilbert <gudnimar@noxmedical.com>
---
 meta/recipes-devtools/python/python3-bcrypt_4.1.2.bb | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta/recipes-devtools/python/python3-bcrypt_4.1.2.bb b/meta/re=
cipes-devtools/python/python3-bcrypt_4.1.2.bb
index 93fa645f33..57b08b3700 100644
--- a/meta/recipes-devtools/python/python3-bcrypt_4.1.2.bb
+++ b/meta/recipes-devtools/python/python3-bcrypt_4.1.2.bb
@@ -33,5 +33,4 @@ RDEPENDS:${PN}:class-target +=3D "\
     python3-cffi \
     python3-ctypes \
     python3-shell \
-    python3-six \
 "
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

--MCBoundary=_12405050502070381
Content-Transfer-Encoding: quoted-printable
Content-Type: text/html; charset=UTF-8

<html><head><style type=3D"text/css">.style1 {font-family: "Times New Roman=
";}</style></head><body>Python 2.7 support was dropped in version 3.2.0 and=
<BR>
python3-six dependency was subsequently dropped in version 3.2.1<BR>
<BR>
Signed-off-by: Gu&eth;ni M&aacute;r Gilbert &lt;gudnimar@noxmedical.com&gt;=
<BR>
---<BR>
 meta/recipes-devtools/python/python3-bcrypt_4.1.2.bb | 1 -<BR>
 1 file changed, 1 deletion(-)<BR>
<BR>
diff --git a/meta/recipes-devtools/python/python3-bcrypt_4.1.2.bb b/meta/re=
cipes-devtools/python/python3-bcrypt_4.1.2.bb<BR>
index 93fa645f33..57b08b3700 100644<BR>
--- a/meta/recipes-devtools/python/python3-bcrypt_4.1.2.bb<BR>
+++ b/meta/recipes-devtools/python/python3-bcrypt_4.1.2.bb<BR>
@@ -33,5 +33,4 @@ RDEPENDS:${PN}:class-target +=3D &quot;\<BR>
     python3-cffi \<BR>
     python3-ctypes \<BR>
     python3-shell \<BR>
-    python3-six \<BR>
 &quot;<BR>
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

--MCBoundary=_12405050502070381--


