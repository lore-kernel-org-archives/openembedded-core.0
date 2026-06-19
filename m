Return-Path: <vanusuri@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 10332CD98F2
	for <webhook@archiver.kernel.org>; Fri, 19 Jun 2026 14:08:05 +0000 (UTC)
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.43188.1781878082077579423
 for <openembedded-core@lists.openembedded.org>;
 Fri, 19 Jun 2026 07:08:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=iLyVYQU8;
 spf=pass (domain: mvista.com, ip: 209.85.214.179, mailfrom: vanusuri@mvista.com)
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-2c69921bd15so10465105ad.1
        for <openembedded-core@lists.openembedded.org>; Fri, 19 Jun 2026 07:08:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1781878081; x=1782482881; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Z/p+FZtdgmhkMuTC054lnL+ogxcPAQJ50K9GeWIGmlk=;
        b=iLyVYQU8EpVIUoakFuW8Ghs/z+2z46qv4jpG9zh5NTRPkvcmfJrEyQjW+iyv0OAlaH
         AWzl/oY/XTeaQFvDFkgop9Q0L5F+Dgx3fBp0W37Jrnqy+dydMLOWFhUJ+JB/GxKM+tub
         kPDbe2Kihg14ji5qb/GcVw3LBzl2ajLio9/lk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781878081; x=1782482881;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Z/p+FZtdgmhkMuTC054lnL+ogxcPAQJ50K9GeWIGmlk=;
        b=K6mdGalSo/3MV7zSp1AmHlN1NoS8BZEzAWII8+Vr+lCFoz338u9kSHDb2iHMNznkWs
         Ehk6lvOxjFqLk2/F0WzbxGuLg7s7cRDXCa8djyNKFEWELd0cWg5kNQVoxx6UgK94y79U
         J4kU6U0asxMc+1OK1WsU+mDrj0zVywRk+mFINqNBzxLkPUJQayp/ffkFQeAvAp7ALsAv
         5pCGjyNc9mUtUGZ5RcCa1bh/0DP57Ub8wAYr94bIfsbaQ5h5iKR7nczlNhNJFhmvuwOq
         bxJxYdrpZyXtDqLXZH7f6huJOzJRe2eTziO/SdMGsE8ZHXMQheHZJEhPYGtpdadQub4H
         a2SA==
X-Gm-Message-State: AOJu0Yy/itGJXT8fNzuJrc+EVGDZWyAt2CaOClODWDgJasdMjA2uAJ1S
	YkX/MXO8TCrDPOD+OKcwXh42cKS2KkohdTlw3JYYtF6twuNF4Tlo9MO9vzshCLgDjAnQGUsXwuE
	VePDyfRk=
X-Gm-Gg: AfdE7cmpEEoZhQtXcTzJaXR4VZ4Hz69jFYtRHEORdV1123PZiJgVcRiVf5A0QmjXuwL
	tWmxMQNJEspwZHJzKCUMMaFHknTy/1Y4M0/SNgvqqNo8mXuID5ffubLNcrTrQiKi+Spa08ocye1
	qP/rN1j1gQHHb4gtdBbsg/lFBzMyekiBliBXB+5NfD75+v0zUouFvv4Pwozmhdnokz0qgpLYNhd
	tqqpHOyDYEb6IZlB4KfEnfgqnXV5DJSYuvcnrJYz1eGXodm6lb0hMRcTseZAp0/RS6mUQu+7rLJ
	CzQoeTREmf+87WiUmSBZrLVN2aRBnRXzCeJPGllblYWzDIA31fUOXA7Aah/OAak9h8GgszmaV6X
	/ozx2G/eoTrNue2w7Pe1igGg9sL9zEZyPldO+gAoRNa0SlgPsghC3rgCT4/9DTH616Gj5iXrw6u
	bRGL+vzAQOFyq+BDz33Ni0BiyXjjif
X-Received: by 2002:a17:902:f610:b0:2c2:bd0d:3cf0 with SMTP id d9443c01a7336-2c719016be9mr44955315ad.25.1781878081132;
        Fri, 19 Jun 2026 07:08:01 -0700 (PDT)
Received: from MVIN00352.mvista.com ([2401:4900:1f29:42a9:d9f6:7cbc:746a:c8a6])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c7209e1c7esm25591835ad.57.2026.06.19.07.07.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Jun 2026 07:08:00 -0700 (PDT)
From: Vijay Anusuri <vanusuri@mvista.com>
To: openembedded-core@lists.openembedded.org
Cc: Vijay Anusuri <vanusuri@mvista.com>
Subject: [OE-core][scarthgap][patch 1/5] xwayland: Fix CVE-2026-33999
Date: Fri, 19 Jun 2026 19:37:46 +0530
Message-ID: <20260619140750.914225-1-vanusuri@mvista.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 19 Jun 2026 14:08:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/239172

Pick patch according to [2]

[1] https://lists.x.org/archives/xorg-announce/2026-April/003679.html
[2] https://security-tracker.debian.org/tracker/CVE-2026-33999

Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
---
 .../xwayland/xwayland/CVE-2026-33999.patch    | 49 +++++++++++++++++++
 .../xwayland/xwayland_23.2.5.bb               |  1 +
 2 files changed, 50 insertions(+)
 create mode 100644 meta/recipes-graphics/xwayland/xwayland/CVE-2026-33999.patch

diff --git a/meta/recipes-graphics/xwayland/xwayland/CVE-2026-33999.patch b/meta/recipes-graphics/xwayland/xwayland/CVE-2026-33999.patch
new file mode 100644
index 0000000000..cd3bf47397
--- /dev/null
+++ b/meta/recipes-graphics/xwayland/xwayland/CVE-2026-33999.patch
@@ -0,0 +1,49 @@
+From b024ae1749ee58c6fbf863b9a1f5dc440fee2e1b Mon Sep 17 00:00:00 2001
+From: Peter Harris <pharris2@rocketsoftware.com>
+Date: Thu, 15 Jan 2026 15:54:09 -0500
+Subject: [PATCH] xkb: fix buffer re-use in _XkbSetCompatMap
+
+If the "compat" buffer has previously been truncated, there will be
+unused space in the buffer. The code uses this space, but does not
+update the number of valid entries in the buffer.
+
+In the best case, this leads to the new compat entries being ignored. In the
+worst case, if there are any "skipped" compat entries, the number of
+valid entries will be corrupted, potentially leading to a buffer read
+overrun when processing a future request.
+
+Set the number of used "compat" entries when re-using previously
+allocated space in the buffer.
+
+CVE-2026-33999, ZDI-CAN-28593
+
+This vulnerability was discovered by:
+Jan-Niklas Sohn working with TrendAI Zero Day Initiative
+
+Signed-off-by: Peter Harris <pharris2@rocketsoftware.com>
+Acked-by: Olivier Fourdan <ofourdan@redhat.com>
+Part-of: <https://gitlab.freedesktop.org/xorg/xserver/-/merge_requests/2176>
+
+Upstream-Status: Backport [https://gitlab.freedesktop.org/xorg/xserver/-/commit/b024ae1749ee58c6fbf863b9a1f5dc440fee2e1b]
+CVE: CVE-2026-33999
+Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
+---
+ xkb/xkb.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/xkb/xkb.c b/xkb/xkb.c
+index 137d70d..2b9004a 100644
+--- a/xkb/xkb.c
++++ b/xkb/xkb.c
+@@ -3004,7 +3004,7 @@ _XkbSetCompatMap(ClientPtr client, DeviceIntPtr dev,
+                 return BadAlloc;
+             }
+         }
+-        else if (req->truncateSI) {
++        else if (req->truncateSI || req->firstSI + req->nSI > compat->num_si) {
+             compat->num_si = req->firstSI + req->nSI;
+         }
+         sym = &compat->sym_interpret[req->firstSI];
+-- 
+2.43.0
+
diff --git a/meta/recipes-graphics/xwayland/xwayland_23.2.5.bb b/meta/recipes-graphics/xwayland/xwayland_23.2.5.bb
index 362b110a0b..65f1ed2ae0 100644
--- a/meta/recipes-graphics/xwayland/xwayland_23.2.5.bb
+++ b/meta/recipes-graphics/xwayland/xwayland_23.2.5.bb
@@ -35,6 +35,7 @@ SRC_URI = "https://www.x.org/archive/individual/xserver/xwayland-${PV}.tar.xz \
            file://CVE-2025-62230-0001.patch \
            file://CVE-2025-62230-0002.patch \
            file://CVE-2025-62231.patch \
+           file://CVE-2026-33999.patch \
 "
 SRC_URI[sha256sum] = "33ec7ff2687a59faaa52b9b09aa8caf118e7ecb6aed8953f526a625ff9f4bd90"
 
-- 
2.43.0


