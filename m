Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DB64FC8303D
	for <webhook@archiver.kernel.org>; Fri,  4 Jul 2025 15:29:18 +0000 (UTC)
Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
 by mx.groups.io with SMTP id smtpd.web11.14867.1751642955328418437
 for <openembedded-core@lists.openembedded.org>;
 Fri, 04 Jul 2025 08:29:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=C3STy7wG;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.173, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-74801bc6dc5so884292b3a.1
        for <openembedded-core@lists.openembedded.org>; Fri, 04 Jul 2025 08:29:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1751642954; x=1752247754; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+JqPf9UrISb6OWhmAEy3Jy9M8LXjbaDuVFu7tcMGfsc=;
        b=C3STy7wGvSPi1wyPDMGktoewVegFBdY5H2LyebPyDSYOwF1zFtPQovD2GFRxYWVbsP
         4+Ivm57LVujJUMQEAVOktHSkW0Pr6AAy1gITtz8/whkzYlldW5qLAMVMTLAhUxHV+Cx7
         CofFvxyQIcmX/fN2b628J6RR2wGlzW8kaqEja1hMZUBLwzM+14rSo2xzOGZerCN3cakF
         1RvYXPheJD/1gUrnDdF5/kTB2Ii9Dh4Wl+/uHjXdYQvqP+MD62huP2wWUnHPZsoO/7Fh
         IIbwOs9PWpt89s+6QIpYvLBzfYiydYmD3ZYV2wdtsi6Koh7TykMriJufWI4ECZZqIn3k
         sxqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751642954; x=1752247754;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+JqPf9UrISb6OWhmAEy3Jy9M8LXjbaDuVFu7tcMGfsc=;
        b=HkJxO8cndLkj6gMkU7ofBu1WiMumMRc1d7yUhgynC8980U93NyaOd+6q8bQ7WAkSTd
         9a5cW4U0kiBmOTk539Ud2GnxHEohEBAfom3xp4fNnaXQaHu7+Q2M0A4fSjrdru8OlK93
         vIW8g55eCBU0JfEAV4H/rGEOd+kc8P18XplXZ5nMjtigpI2Rz5nlcNBzIpiJyOjKC059
         lANwMUMp6MRaV03qlfCfDVgnaA4mpKAWpkNDz82+RALAZqimJIcUyt2parUSqc9ttVpz
         cfuOFllQYkqgTjAWHrGMvsUA0MTVAiO7JRP0240MHvGkTlwvqJSVTRrYTgYz1Wi0xfa8
         WCAA==
X-Gm-Message-State: AOJu0YxQYWgW8bnGJH0vfBKhcKyCXuuH+Si3LkWsrNqyyU87OtjtYxRg
	vbJKefFvL4FXdw1LhU9I/S+12Sez3GwjXTo9pEcbxDXChs3YJxbI71uY3jZUKmFLMXCD46Dub/g
	2DICq
X-Gm-Gg: ASbGncv7KkaA4gqK29X0ttpi86fz2EDSQxXQqKQ5hCINPJQw5tphQ42R1gOi/2L8Vod
	FUC90hhzZuZrNgh44eCXnVYZw0GYAwejqMFxuz9RsMs1Sy0tSC4Kt65sV8qafcpUpgMIIRgYP4X
	dbITkkKlnWOle7h3Rrwr31BIwKsdxE854hlfcIXiSY+8giHQPE4/Pndv20+kGA8TlwYNh1tYdHb
	xitFiQfb1MZPW3aLZSc4FOfT28+3kmJQ1TbXy0JSwyj42zyduUACBwMbDPO7bCwS7Jo+uMD9DjP
	d0kjz+HK6QLuh/CD67czcoXsu280WrB5wUNXcz480faSTSt3BgG/HA==
X-Google-Smtp-Source: AGHT+IG8pGP8JkJZTcrt1aqId+GCuT15eE74QWQ+Xs05Tvgz5IKS36SOJoVLY37iTLhbBpVDFrv04A==
X-Received: by 2002:a05:6a00:2301:b0:74a:cd4d:c0a6 with SMTP id d2e1a72fcca58-74ce5057cf2mr5718552b3a.5.1751642954375;
        Fri, 04 Jul 2025 08:29:14 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:d985:cb7d:ae84:68cc])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-74ce42a1ca0sm2424232b3a.138.2025.07.04.08.29.13
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Jul 2025 08:29:14 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 8/9] xwayland: fix CVE-2025-49178
Date: Fri,  4 Jul 2025 08:28:54 -0700
Message-ID: <24cf72e0fac261e335016e0b490f1fc10992bbbf.1751641924.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1751641924.git.steve@sakoman.com>
References: <cover.1751641924.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 04 Jul 2025 15:29:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/219947

From: Archana Polampalli <archana.polampalli@windriver.com>

A flaw was found in the X server's request handling. Non-zero 'bytes to ignore'
in a client's request can cause the server to skip processing another client's
request, potentially leading to a denial of service.

Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../xwayland/xwayland/CVE-2025-49179.patch    | 69 +++++++++++++++++++
 .../xwayland/xwayland_22.1.8.bb               |  1 +
 2 files changed, 70 insertions(+)
 create mode 100644 meta/recipes-graphics/xwayland/xwayland/CVE-2025-49179.patch

diff --git a/meta/recipes-graphics/xwayland/xwayland/CVE-2025-49179.patch b/meta/recipes-graphics/xwayland/xwayland/CVE-2025-49179.patch
new file mode 100644
index 0000000000..48c7ed8c13
--- /dev/null
+++ b/meta/recipes-graphics/xwayland/xwayland/CVE-2025-49179.patch
@@ -0,0 +1,69 @@
+From 9d205323894af62b9726fcbaeb5fc69b3c9f61ba Mon Sep 17 00:00:00 2001
+From: Olivier Fourdan <ofourdan@redhat.com>
+Date: Mon, 28 Apr 2025 11:47:15 +0200
+Subject: [PATCH]  record: Check for overflow in
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
+(cherry picked from commit 2bde9ca49a8fd9a1e6697d5e7ef837870d66f5d4)
+
+Part-of: <https://gitlab.freedesktop.org/xorg/xserver/-/merge_requests/2026>
+
+CVE: CVE-2025-49179
+
+Upstream-Status: Backport [https://gitlab.freedesktop.org/xorg/xserver/-/commit/9d205323894af62b9726fcbaeb5fc69b3c9f61ba]
+
+Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
+---
+ record/record.c | 8 ++++++++
+ 1 file changed, 8 insertions(+)
+
+diff --git a/record/record.c b/record/record.c
+index e123867..018e53f 100644
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
++        return BadValue;
++
++    if (stuff->nRanges > (MAXINT - 4 * stuff->nClients) / SIZEOF(xRecordRange))
++        return BadValue;
++
+     if (((client->req_len << 2) - SIZEOF(xRecordRegisterClientsReq)) !=
+         4 * stuff->nClients + SIZEOF(xRecordRange) * stuff->nRanges)
+         return BadLength;
+--
+2.40.0
diff --git a/meta/recipes-graphics/xwayland/xwayland_22.1.8.bb b/meta/recipes-graphics/xwayland/xwayland_22.1.8.bb
index caca8ab0f6..691b017662 100644
--- a/meta/recipes-graphics/xwayland/xwayland_22.1.8.bb
+++ b/meta/recipes-graphics/xwayland/xwayland_22.1.8.bb
@@ -48,6 +48,7 @@ SRC_URI = "https://www.x.org/archive/individual/xserver/xwayland-${PV}.tar.xz \
            file://CVE-2025-49176-0002.patch \
            file://CVE-2025-49177.patch \
            file://CVE-2025-49178.patch \
+           file://CVE-2025-49179.patch \
 "
 SRC_URI[sha256sum] = "d11eeee73290b88ea8da42a7d9350dedfaba856ce4ae44e58c045ad9ecaa2f73"
 
-- 
2.43.0


