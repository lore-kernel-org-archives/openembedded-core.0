Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A1667C83F0C
	for <webhook@archiver.kernel.org>; Fri,  4 Jul 2025 15:10:58 +0000 (UTC)
Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
 by mx.groups.io with SMTP id smtpd.web10.14470.1751641857387629230
 for <openembedded-core@lists.openembedded.org>;
 Fri, 04 Jul 2025 08:10:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=Bp3xU1B4;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.169, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-749068b9b63so669489b3a.0
        for <openembedded-core@lists.openembedded.org>; Fri, 04 Jul 2025 08:10:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1751641857; x=1752246657; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ekHKzbNntvRoPyGRF/56B+P7k/K3XscMgPrXKgFCN6M=;
        b=Bp3xU1B4YHSc7Dvqd2+eY7xirM67vPtBlGpXaQINkIvceRgP5djTaHkZ9xbfWJ6BkY
         twan8o5FfDGzz2l0LpZySPDU1OaKIg/3l+x0qpb9FPqfLOY3OO4ywxJ9yrYWb2W00mpv
         +WByatRrTBRRRWfIJndb7BxCV62152sY54hOOPh17WLJtZHz/0D95cTbqXMvmLYSwfLf
         0if782ojGIOlbmpkgki20wxXwD3/Sg6SPWL1jTHmpUafbO6qw1tZ5FSdobbESGKRHybY
         6kmzyKYSsEbJLNfST1SN2uFMJlE08/nE6Y+oKaB+ymr2mGzhMO4k+ex4L+ej7aMdVkmA
         hENQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751641857; x=1752246657;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ekHKzbNntvRoPyGRF/56B+P7k/K3XscMgPrXKgFCN6M=;
        b=LnuRDUW+5v6OPNjOuIaV5QaXZvgaKAdB73G2IrrEfR/Hl/AvFgSIvsaYkcfqdWyH+c
         a53QwgCv6tvN5/3wf0BFZmUTwAaKPYLUhw1uwNzBvq44t0mZTMq/YwhbSV78PANDX1m3
         luABGtKxK1nAFTwReA0s7obD0+g44DGsNx1Ku7xr4nvzlYn23hi4+ginEJD8VtpgDw07
         09iwOFFQDQk4Ks3JGVtO3rBoemX4m08EYSB1H9Ts+CN/gzmCBCBCcWSdCOD9WkSTphxH
         STsntaTSi9Y23+0V7hCpuH2/2V+V6BUYwNGjcjRP2dvSE4S8z+ThBjZvD01LSDolVDhZ
         nu4Q==
X-Gm-Message-State: AOJu0YzKeyoSuAxT1+bJhpXiPkF/AhhnnqdHd/PvpKrqPB+eT47X8hCg
	CW8z2G6FrWeAb0ktlgb8wFFpW6Cd8FAWq8Ww8e/GZs+m6DB34IuYFL1yfGKJ86J/EDZEeWpOURh
	FoCcQ
X-Gm-Gg: ASbGncvPe626lTQHJ4gFHbi+H/rm4Mpf0+/nISZu2wCsQ9rJzkZJjJccNjV9s8YXhU0
	UPuJkSHQT7tWFrkoBQPjcfsVWZkIfG6VHBWG2rPar7jwS0kR33AmpatxKGeWB2dVYIRY9bxwgbp
	0qFk5nt94Qvy9ZPSqo71y0jACa59uygnFkoPlDypEyI2A3nhiSLR5oypGeIHUMAUXfErvI8QHQz
	SfD9yZ+LNAKXNrd/qtUPuPXnbXVP2AsrbdO1F+TRAaA4vwvNfwP9CcdTF6zR8sXQ9LXj3luJQor
	jWMMgWT43ZOsN7Emq7uYfQDVvSKQBei8FfeTgpg6TNBhxUJiO+UQSg==
X-Google-Smtp-Source: AGHT+IHvtumROupt+HsDHe6ziJ20KB0RUF1rC8/Q3myQkxy5pQ5fOGrYe1VNYKYOo7vHukphTkc9HQ==
X-Received: by 2002:a05:6a00:3d56:b0:748:f1ba:9af8 with SMTP id d2e1a72fcca58-74ce69f212emr4480321b3a.21.1751641856543;
        Fri, 04 Jul 2025 08:10:56 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:d985:cb7d:ae84:68cc])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-74ce417e869sm2159592b3a.82.2025.07.04.08.10.56
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Jul 2025 08:10:56 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 10/11] xwayland: fix CVE-2025-49179
Date: Fri,  4 Jul 2025 08:10:33 -0700
Message-ID: <de28bff9b54b2725d8c06c4760e0ed2b59d3fa61.1751641631.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1751641631.git.steve@sakoman.com>
References: <cover.1751641631.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 04 Jul 2025 15:10:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/219936

From: Archana Polampalli <archana.polampalli@windriver.com>

A flaw was found in the X Record extension. The RecordSanityCheckRegisterClients
function does not check for an integer overflow when computing request length,
which allows a client to bypass length checks.

Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../xwayland/xwayland/CVE-2025-49179.patch    | 69 +++++++++++++++++++
 .../xwayland/xwayland_23.2.5.bb               |  1 +
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
diff --git a/meta/recipes-graphics/xwayland/xwayland_23.2.5.bb b/meta/recipes-graphics/xwayland/xwayland_23.2.5.bb
index e150961882..490e1ca05f 100644
--- a/meta/recipes-graphics/xwayland/xwayland_23.2.5.bb
+++ b/meta/recipes-graphics/xwayland/xwayland_23.2.5.bb
@@ -29,6 +29,7 @@ SRC_URI = "https://www.x.org/archive/individual/xserver/xwayland-${PV}.tar.xz \
            file://CVE-2025-49176-0002.patch \
            file://CVE-2025-49177.patch \
            file://CVE-2025-49178.patch \
+           file://CVE-2025-49179.patch \
 "
 SRC_URI[sha256sum] = "33ec7ff2687a59faaa52b9b09aa8caf118e7ecb6aed8953f526a625ff9f4bd90"
 
-- 
2.43.0


