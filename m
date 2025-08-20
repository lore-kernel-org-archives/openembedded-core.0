Return-Path: <vanusuri@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3C8DFCA0EDC
	for <webhook@archiver.kernel.org>; Wed, 20 Aug 2025 10:53:11 +0000 (UTC)
Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
 by mx.groups.io with SMTP id smtpd.web10.16960.1755687182278254574
 for <openembedded-core@lists.openembedded.org>;
 Wed, 20 Aug 2025 03:53:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=gR4U0Ptr;
 spf=pass (domain: mvista.com, ip: 209.85.216.51, mailfrom: vanusuri@mvista.com)
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-32326e09f58so7049422a91.2
        for <openembedded-core@lists.openembedded.org>; Wed, 20 Aug 2025 03:53:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1755687181; x=1756291981; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=so09ACULOWpbGwRNgy+IMOs5wE1s1qKBKERQBioAkSk=;
        b=gR4U0PtrmqLpBGewSK224mSmxAAJd9jRm34yyl9peAkT3PkOKx/LI6HdaWGFjIXPJ2
         ANwgx1e8fZSW2Fmk8urMDw1xww7cHjfqvMFKqEMuUN6w77zdpaXX3p154ZNqRgtFxbrr
         liJGDctjZ3M4BgPXYvic/2Q4bIML1WySy71pg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755687181; x=1756291981;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=so09ACULOWpbGwRNgy+IMOs5wE1s1qKBKERQBioAkSk=;
        b=MgT9i47Hxq4MJyZM8mFvvJGpe3sqUlP6JKpg7bg5hn/oGMk+cmRMMqTgfAeogq63Bs
         nhSB++MDEoOx371WEEumAOPxdxyVdjZwWLrUCfYuGWUkR1U8lzyy8yhcJ1FP6BgHLinx
         G9OLa1KAf+sgUwjL1fYMFSfM2CULfuHgVLBFchbcIj7Qeo3aeHvYY+IaLz33jXFKuqpH
         XuBPN+8dRPrbTNV3DhjlJML2f0Ku3qPNpZktV8iaRquoHval6bI2aTcriWoT11Hpzmjs
         g1WAgCEik7UNbxEXXQc7Op+iHV9o7N+wywn7q7XXbqS4MMRvgeM7zs0SbcOrJOMVxdZW
         4mFA==
X-Gm-Message-State: AOJu0Yy5tB6Tj9VG4JFNEZg8R5tx1fdZ2PjYPRis3O3a9ADWlkQi5WHV
	ZOeGdY56qzACRMj9EuHl8YY3LMRhqbKLe+qs85/99EBcqTmnBSFrFJKTXEjIFLrQgt7kCRN2OF6
	qxipytZE=
X-Gm-Gg: ASbGncsRQlyefVLGcVwkRIDd6a7vQenhhwvK5cgc2NUPR+iOQ2a1+VC9rM5jEGlS5GM
	DGw1zXxEMh8ZarLeoYiO/hejjYM78Qd4GsYhdZtN0XErb6UAxvyw/ywbiwObqiPDmDGAEbzmh+A
	tLW/QOT3eeO/hmnOtOoGi9wY7zGUjgjc0iXs3Jp+BATmXza8ra0EAY06bLzOdaG9w776ifGE/Gn
	QFGZ2giJjSIBW1gipSgzOPwYEIe2eXWPc301YIe4WTc61y3+dO/ESoZO3welrXpUw+nTMwlkYRD
	DhDP92zUlMHGf+BS5p9x/oyXLLhlUxnIWiPW1n1bHALrCcmhThS0PVUxj1EcdGPQtDUFFVcwf3D
	qEPjc9zGDvVUQgQbQa+MSxFkv9Ad3Iik9Ncxl/x/fMw==
X-Google-Smtp-Source: AGHT+IEcR2ajjch4ScKKP8C4/Puno4BWxpYw9x66F84IAeP6/g12NQk3mOsSH9Q07OlHm74xntGzPw==
X-Received: by 2002:a17:90b:4c4b:b0:31e:d2a5:c08d with SMTP id 98e67ed59e1d1-324e1453e1bmr3607790a91.33.1755687181161;
        Wed, 20 Aug 2025 03:53:01 -0700 (PDT)
Received: from MVIN00020.mvista.com ([49.207.204.8])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-324e254cbd1sm1976663a91.16.2025.08.20.03.52.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Aug 2025 03:53:00 -0700 (PDT)
From: vanusuri@mvista.com
To: openembedded-core@lists.openembedded.org
Cc: Vijay Anusuri <vanusuri@mvista.com>
Subject: [OE-core][kirkstone][PATCH 2/3] xserver-xorg: Fix for CVE-2025-49179
Date: Wed, 20 Aug 2025 16:22:31 +0530
Message-Id: <20250820105232.201407-2-vanusuri@mvista.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250820105232.201407-1-vanusuri@mvista.com>
References: <20250820105232.201407-1-vanusuri@mvista.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 20 Aug 2025 10:53:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/222170

From: Vijay Anusuri <vanusuri@mvista.com>

import patch from debian to fix
  CVE-2025-49179

Upstream-Status: Backport [import from debian xorg-server_21.1.7-3+deb12u10.diff.gz
Upstream commit https://gitlab.freedesktop.org/xorg/xserver/-/commit/2bde9ca49a8fd9a1e6697d5e7ef837870d66f5d4]

Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
---
 .../xserver-xorg/CVE-2025-49179.patch         | 67 +++++++++++++++++++
 .../xorg-xserver/xserver-xorg_21.1.8.bb       |  1 +
 2 files changed, 68 insertions(+)
 create mode 100644 meta/recipes-graphics/xorg-xserver/xserver-xorg/CVE-2025-49179.patch

diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xorg/CVE-2025-49179.patch b/meta/recipes-graphics/xorg-xserver/xserver-xorg/CVE-2025-49179.patch
new file mode 100644
index 0000000000..a3d9ccbe16
--- /dev/null
+++ b/meta/recipes-graphics/xorg-xserver/xserver-xorg/CVE-2025-49179.patch
@@ -0,0 +1,67 @@
+From 2bde9ca49a8fd9a1e6697d5e7ef837870d66f5d4 Mon Sep 17 00:00:00 2001
+From: Olivier Fourdan <ofourdan@redhat.com>
+Date: Mon, 28 Apr 2025 11:47:15 +0200
+Subject: [PATCH] record: Check for overflow in
+ RecordSanityCheckRegisterClients()
+
+The RecordSanityCheckRegisterClients() checks for the request length,
+but does not check for integer overflow.
+
+A client might send a very large value for either the number of clients
+or the number of protocol ranges that will cause an integer overflow in
+the request length computation, defeating the check for request length.
+
+To avoid the issue, explicitly check the number of clients against the
+limit of clients (which is much lower than an maximum integer value) and
+the number of protocol ranges (multiplied by the record length) do not
+exceed the maximum integer value.
+
+This way, we ensure that the final computation for the request length
+will not overflow the maximum integer limit.
+
+CVE-2025-49179
+
+This issue was discovered by Nils Emmerich <nemmerich@ernw.de> and
+reported by Julian Suleder via ERNW Vulnerability Disclosure.
+
+Signed-off-by: Olivier Fourdan <ofourdan@redhat.com>
+Reviewed-by: Peter Hutterer <peter.hutterer@who-t.net>
+Part-of: <https://gitlab.freedesktop.org/xorg/xserver/-/merge_requests/2024>
+
+Upstream-Status: Backport [import from debian xorg-server_21.1.7-3+deb12u10.diff.gz
+Upstream commit https://gitlab.freedesktop.org/xorg/xserver/-/commit/2bde9ca49a8fd9a1e6697d5e7ef837870d66f5d4]
+CVE: CVE-2025-49179
+Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
+---
+ record/record.c | 8 ++++++++
+ 1 file changed, 8 insertions(+)
+
+diff --git a/record/record.c b/record/record.c
+index e123867..d57be5b 100644
+--- a/record/record.c
++++ b/record/record.c
+@@ -45,6 +45,7 @@ and Jim Haggerty of Metheus.
+ #include "inputstr.h"
+ #include "eventconvert.h"
+ #include "scrnintstr.h"
++#include "opaque.h"
+ 
+ #include <stdio.h>
+ #include <assert.h>
+@@ -1298,6 +1299,13 @@ RecordSanityCheckRegisterClients(RecordContextPtr pContext, ClientPtr client,
+     int i;
+     XID recordingClient;
+ 
++    /* LimitClients is 2048 at max, way less that MAXINT */
++    if (stuff->nClients > LimitClients)
++	return BadValue;
++
++    if (stuff->nRanges > (MAXINT - 4 * stuff->nClients) / SIZEOF(xRecordRange))
++	return BadValue;
++
+     if (((client->req_len << 2) - SIZEOF(xRecordRegisterClientsReq)) !=
+         4 * stuff->nClients + SIZEOF(xRecordRange) * stuff->nRanges)
+         return BadLength;
+-- 
+2.25.1
+
diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.8.bb b/meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.8.bb
index 67e146bf97..279351eff1 100644
--- a/meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.8.bb
+++ b/meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.8.bb
@@ -41,6 +41,7 @@ SRC_URI += "file://0001-xf86pciBus.c-use-Intel-ddx-only-for-pre-gen4-hardwar.pat
            file://CVE-2025-49176-2.patch \
            file://CVE-2025-49177.patch \
            file://CVE-2025-49178.patch \
+           file://CVE-2025-49179.patch \
            "
 SRC_URI[sha256sum] = "38aadb735650c8024ee25211c190bf8aad844c5f59632761ab1ef4c4d5aeb152"
 
-- 
2.25.1


