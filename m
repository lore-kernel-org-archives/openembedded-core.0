Return-Path: <gudnimar@noxmedical.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 36A98C10F1A
	for <webhook@archiver.kernel.org>; Sun, 12 May 2024 10:00:52 +0000 (UTC)
Received: from usb-smtp-delivery-118.mimecast.com (usb-smtp-delivery-118.mimecast.com [170.10.153.118])
 by mx.groups.io with SMTP id smtpd.web11.32430.1715508044313182984
 for <openembedded-core@lists.openembedded.org>;
 Sun, 12 May 2024 03:00:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@noxmedical.com header.s=mimecast20231107 header.b=X+TEsze2;
 spf=pass (domain: noxmedical.com, ip: 170.10.153.118, mailfrom: gudnimar@noxmedical.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=noxmedical.com;
	s=mimecast20231107; t=1715508043;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type;
	bh=44QbAXzgwraeXFqSBGMJqwG6MLJc1olUc6dIrgAn8So=;
	b=X+TEsze2B05lyk3KYkLB/QKJyVZeycNxFmft2i7puTC1xfszb3etozh5SmzVMetpTvqXOS
	CB9P/8d3/ukrvGCbC1+bxiZvlAL19rScRjuXltbeRSOx9Q1agarjMZ1fjahr5eeAFTNJ8W
	SdbAGHpFxmGr6S/MZS5uHezvA4UZIlI=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 usb-mta-32-SzV-TO-iOeyBm16VpaQplg-1; Sun, 12 May 2024 03:00:39 -0700
X-MC-Unique: SzV-TO-iOeyBm16VpaQplg-1
Received: by mail-wr1-f72.google.com with SMTP id ffacd0b85a97d-34dc34c758fso1836046f8f.0
        for <openembedded-core@lists.openembedded.org>; Sun, 12 May 2024 03:00:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715508037; x=1716112837;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rcxzvAIRYwl60i6GqzXw1Dfx0NZXxZ7mRUjmUPd6ktA=;
        b=kT/Nv+wX7jbcV/g/Lczw50wG/wCgJ0MSJlRN+5rAVlQAGWrRlNI51fGDdPZKvGmsR4
         ZDezP4JOeABvxyEPSKR3c8kbxCd0yn4JCINyG6v6q1UHq2JS32g7S/cJVBToqbzSQ093
         xPa+VL8f3Fxl9+5IBeelPviwn2qm5qhvNLb8I8VXnhtaO2B0sm5BpuOHetE+TXO4ndYI
         f5X0aZn9z61t3hGbs0gLHoKtvgaYTesbCJ/dvKzl18fyzQnZ3U7S5NyqVv0xOKJppq62
         iGA9eI0MNsR2q7NJmEhOgOY72UZh91f4gGUY7KZStJB4MRq6Ai1ZS2/WlzN86RCkbSYe
         7k8g==
X-Gm-Message-State: AOJu0Yzqrtp2hRoEZl3DdpXMuV/Ue5If8wBtmSpnZdLYo8lKwlzvaTtK
	xY9UCxdImIYsDw+T6K2miqx22yDCsf/1n/mis4CjkwJfW/bwhMFd7KAIt6kRvHCVCHJEB5zWMP0
	uFwzCdyK57Wa+qBWwHsT9e2r8fpKdeo6arlmTyXJsWpHbebZqRVS4hsHM5JorIbZyb0hx7Lq8yc
	PnL+EtOeO+uxdRKWVGJttC/qpBEcYt3AIOPIf9PObI88VIQw0fZAuVEAlm4nu6p374hd0=
X-Received: by 2002:a05:6000:180e:b0:34d:b1c2:65ea with SMTP id ffacd0b85a97d-3504a9689e9mr4889461f8f.54.1715508037503;
        Sun, 12 May 2024 03:00:37 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHz9G7nEk1a9Mpl9NwezkeZMoabZ1q93jWtCTUMfTmP8ai17TsBxZJqPvufcCN1Mt533SG0+A==
X-Received: by 2002:a05:6000:180e:b0:34d:b1c2:65ea with SMTP id ffacd0b85a97d-3504a9689e9mr4889444f8f.54.1715508036875;
        Sun, 12 May 2024 03:00:36 -0700 (PDT)
Received: from gudni-virtual-machine.localdomain ([81.15.100.92])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3502baacf7esm8636246f8f.77.2024.05.12.03.00.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 May 2024 03:00:36 -0700 (PDT)
From: =?UTF-8?q?Gu=C3=B0ni=20M=C3=A1r=20Gilbert?= <gudnimar@noxmedical.com>
To: openembedded-core@lists.openembedded.org
Cc: =?UTF-8?q?Gu=C3=B0ni=20M=C3=A1r=20Gilbert?= <gudnimar@noxmedical.com>
Subject: [PATCH] python3-pycparser: cleanup RDEPENDS
Date: Sun, 12 May 2024 09:59:58 +0000
Message-Id: <20240512095958.4050-1-gudnimar@noxmedical.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: noxmedical.com
Content-Type: multipart/alternative;
	boundary="MCBoundary=_12405120300412421"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 12 May 2024 10:00:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/199213

--MCBoundary=_12405120300412421
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

- Drop python3-pprint, the source code no longer imports this module
- Drop python3-ply, ply package is bunled into pycparser, making the extern=
al python3-ply
dependency not useful. This seems to have been changed a long time ago in v=
ersion 2.09 (2012.12.27)

Note about python3-netclient: It can be removed at a later date. There is o=
ne 'unused' import
for base64 in the ply source. Once that is cleaned up, python3-netclient ca=
n be removed.

Signed-off-by: Gu=C3=B0ni M=C3=A1r Gilbert <gudnimar@noxmedical.com>
---
 meta/recipes-devtools/python/python3-pycparser_2.22.bb | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/meta/recipes-devtools/python/python3-pycparser_2.22.bb b/meta/=
recipes-devtools/python/python3-pycparser_2.22.bb
index 9a5abc42bd..0be39ea383 100644
--- a/meta/recipes-devtools/python/python3-pycparser_2.22.bb
+++ b/meta/recipes-devtools/python/python3-pycparser_2.22.bb
@@ -11,9 +11,7 @@ BBCLASSEXTEND =3D "native nativesdk"
=20
 RDEPENDS:${PN}:class-target +=3D "\
     python3-netclient \
-    python3-ply \
-    python3-pprint \
-    "
+"
=20
 RSUGGESTS:${PN}:class-target +=3D "\
     cpp \
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

--MCBoundary=_12405120300412421
Content-Transfer-Encoding: quoted-printable
Content-Type: text/html; charset=UTF-8

<html><head><style type=3D"text/css">.style1 {font-family: "Times New Roman=
";}</style></head><body>- Drop python3-pprint, the source code no longer im=
ports this module<BR>
- Drop python3-ply, ply package is bunled into pycparser, making the extern=
al python3-ply<BR>
dependency not useful. This seems to have been changed a long time ago in v=
ersion 2.09 (2012.12.27)<BR>
<BR>
Note about python3-netclient: It can be removed at a later date. There is o=
ne 'unused' import<BR>
for base64 in the ply source. Once that is cleaned up, python3-netclient ca=
n be removed.<BR>
<BR>
Signed-off-by: Gu&eth;ni M&aacute;r Gilbert &lt;gudnimar@noxmedical.com&gt;=
<BR>
---<BR>
 meta/recipes-devtools/python/python3-pycparser_2.22.bb | 4 +---<BR>
 1 file changed, 1 insertion(+), 3 deletions(-)<BR>
<BR>
diff --git a/meta/recipes-devtools/python/python3-pycparser_2.22.bb b/meta/=
recipes-devtools/python/python3-pycparser_2.22.bb<BR>
index 9a5abc42bd..0be39ea383 100644<BR>
--- a/meta/recipes-devtools/python/python3-pycparser_2.22.bb<BR>
+++ b/meta/recipes-devtools/python/python3-pycparser_2.22.bb<BR>
@@ -11,9 +11,7 @@ BBCLASSEXTEND =3D &quot;native nativesdk&quot;<BR>
 <BR>
 RDEPENDS:${PN}:class-target +=3D &quot;\<BR>
     python3-netclient \<BR>
-    python3-ply \<BR>
-    python3-pprint \<BR>
-    &quot;<BR>
+&quot;<BR>
 <BR>
 RSUGGESTS:${PN}:class-target +=3D &quot;\<BR>
     cpp \<BR>
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

--MCBoundary=_12405120300412421--


