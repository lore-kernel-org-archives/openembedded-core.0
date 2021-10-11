Return-Path: <mingli.yu@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D7D0BC433F5
	for <webhook@archiver.kernel.org>; Mon, 11 Oct 2021 08:30:36 +0000 (UTC)
Received: from mail5.wrs.com (mail5.wrs.com [192.103.53.11])
 by mx.groups.io with SMTP id smtpd.web12.9085.1633941035348682919
 for <openembedded-core@lists.openembedded.org>;
 Mon, 11 Oct 2021 01:30:36 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: windriver.com, ip: 192.103.53.11, mailfrom: mingli.yu@windriver.com)
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.corp.ad.wrs.com
 [147.11.82.252])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id 19B8UXU7002368
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
 Mon, 11 Oct 2021 01:30:33 -0700
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Mon, 11 Oct 2021 01:30:32 -0700
Received: from pek-lpg-core2.corp.ad.wrs.com (128.224.153.41) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2242.12 via Frontend Transport; Mon, 11 Oct 2021 01:30:31 -0700
From: <mingli.yu@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH] packagedata.py: silence a DeprecationWarning
Date: Mon, 11 Oct 2021 16:28:48 +0800
Message-ID: <20211011082848.12434-1-mingli.yu@windriver.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mail5.wrs.com id
 19B8UXU7002368
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 11 Oct 2021 08:30:36 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/156812

From: Mingli Yu <mingli.yu@windriver.com>

Use regex strings (r=E2=80=99=E2=80=99) to silence below deprecation warn=
ing [1]:
 $ cat tmp/work/intel_x86_64-wrs-linux/linux-yocto/5.10.x+gitAUTOINC+917c=
420111_373c02c3ca-r0/temp/log.do_deploy
 [snip]
 /build/layers/oe-core/meta/lib/oe/packagedata.py:22: DeprecationWarning:=
 invalid escape sequence \s
 r =3D re.compile("(^.+?):\s+(.*)")
 [snip]

[1] https://docs.python.org/3/library/re.html

Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
---
 meta/lib/oe/packagedata.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/lib/oe/packagedata.py b/meta/lib/oe/packagedata.py
index 02c81e5a52..212f048bc6 100644
--- a/meta/lib/oe/packagedata.py
+++ b/meta/lib/oe/packagedata.py
@@ -19,7 +19,7 @@ def read_pkgdatafile(fn):
         import re
         with open(fn, 'r') as f:
             lines =3D f.readlines()
-        r =3D re.compile("(^.+?):\s+(.*)")
+        r =3D re.compile(r"(^.+?):\s+(.*)")
         for l in lines:
             m =3D r.match(l)
             if m:
--=20
2.17.1


