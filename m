Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B76E3CA0FF6
	for <webhook@archiver.kernel.org>; Tue, 26 Aug 2025 13:44:46 +0000 (UTC)
Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com [209.85.215.175])
 by mx.groups.io with SMTP id smtpd.web11.65033.1756215883992268488
 for <openembedded-core@lists.openembedded.org>;
 Tue, 26 Aug 2025 06:44:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=nrkM6p9B;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.175, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f175.google.com with SMTP id 41be03b00d2f7-b4c3c36643aso107531a12.3
        for <openembedded-core@lists.openembedded.org>; Tue, 26 Aug 2025 06:44:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1756215883; x=1756820683; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QLiMs93Pv6Gz/RzSIqksohSxxjTDmF/o/a2FK6INxzE=;
        b=nrkM6p9BfRC9Xjz3J7AADcT2rNBswS3KMvvZBjNL7/aXqktKO7+X+XYVScuhXxvY/9
         KoYazP6clO6Q6++s8JFDCUcOay7S4tF+EtQ+Cj4wNAmq1ZP9gk7i7U+heeV4X2SWGLNP
         G641zundxAZGxl6RUjrDfB2E2qgBiXPhq9bO7rDU1NNAFQgipqqMQrlvbo9JKIUks6lL
         WbeO+/QXqK8lfnAOGBBNqTl2qJ5eqDPDroNzbe1GgUqWizQTdpzYA9oKNGeXWGF4sPtG
         0yC+tA366Q/caMSQm7l9Qu5aQqObuvzyObfdcRuzX1q/drr0A77EDJ+uVTvYDqBJMBt+
         jUjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756215883; x=1756820683;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QLiMs93Pv6Gz/RzSIqksohSxxjTDmF/o/a2FK6INxzE=;
        b=L+Vhm8akhv/szg69XXK4+rMCFBpSDtXMWZOhQ/BatcbQtp+Ho/D6D/3Rtz/z2a+2AJ
         aLQygfdELO8UT3+ftbqyDUe88ktU8mL/MoTJTVTLe68lLeZA/6VplmP0aky5OcPKkxmn
         4X+KBubjLgOBc6QPs8U67Tl+BCNCOH3saHfBOC9KDwaY3IhFQY0u2Qn6MsWPIm6OfQF9
         kM0eI/t4B290C8VQxo9AM+z6Mc0HSx1YXcotFLooO5e654gQW58Byiz3Ud5rBogfwgyj
         Nu0mcJHRiol5l74qCEeAHGlOMrMcRHhPcTMHPIit0dsBuAD2wVSstPkkfSbfFR0RY6QU
         U2Hw==
X-Gm-Message-State: AOJu0YwEyBoNgjcr47pzY3DB9LpAy5XZvl1KbTw4RjnQajzg6yBoVC8N
	pxdvzLoVHBRgthPVgCJQ5lhSbKF2RYOLNwB7EK7G5HZwyOCCz1NA+VXdTBe/wXahbd56K9haCu9
	/rL13
X-Gm-Gg: ASbGncvoEJ9Zofx30AT7j2002EQYc72vDYjYUIeLK0qRgoEPfWUHrO1YAeOJ5RHVryX
	vb1dRDRXT9A1zxK4cSJZubZVfXxmDJKhwaBSDG19iTJcuswbLjK0M5Z/poGbnPhFj26hjtzKcPu
	WFSqGXu+CzS17Hb8ZGUIfF4hNbnmkn2eHdem9wtG/9hR66tyV0ju9dWXqSxTjwmJzOPJi7dorR7
	rJzGAL9z0Bm5sCviPOfnQcjLXPeyNLWgmQ9f/R6/n4ARvXGfvhyI6yX8mHxOUY29+GdjIrBJXr3
	PetNChUGggv7D5HOT/hnus1fvHHdH04WytcaH+Q2SX7KyMQXOUdqmW1KxoSoHybIq3JaBcNQ3mK
	eW0058mM3REIW6A==
X-Google-Smtp-Source: AGHT+IExs14nZfdeSbWO8/dqF9El2YIQP+Ha5RZYERcMokGbTIodTija2GoBUJ1pDTDYhwlmEZYQKA==
X-Received: by 2002:a17:902:c40d:b0:248:79d4:93bb with SMTP id d9443c01a7336-24879d49735mr16116015ad.31.1756215883085;
        Tue, 26 Aug 2025 06:44:43 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:1687:ddce:d4c7:f578])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-24668779fa9sm96941595ad.27.2025.08.26.06.44.42
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Aug 2025 06:44:42 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 3/9] xserver-xorg: Fix for CVE-2025-49179
Date: Tue, 26 Aug 2025 06:44:25 -0700
Message-ID: <da1b72e407190a81ac3bcc74a0ea51b4160cb5a9.1756215756.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1756215756.git.steve@sakoman.com>
References: <cover.1756215756.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 26 Aug 2025 13:44:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/222464

From: Vijay Anusuri <vanusuri@mvista.com>

import patch from debian to fix
  CVE-2025-49179

Upstream-Status: Backport [import from debian xorg-server_21.1.7-3+deb12u10.diff.gz
Upstream commit https://gitlab.freedesktop.org/xorg/xserver/-/commit/2bde9ca49a8fd9a1e6697d5e7ef837870d66f5d4]

Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
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
2.43.0


