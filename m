Return-Path: <vanusuri@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1E4BFCA0EDC
	for <webhook@archiver.kernel.org>; Thu, 14 Aug 2025 13:58:53 +0000 (UTC)
Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
 by mx.groups.io with SMTP id smtpd.web11.23240.1755179928584953930
 for <openembedded-core@lists.openembedded.org>;
 Thu, 14 Aug 2025 06:58:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=ekoqFaTk;
 spf=pass (domain: mvista.com, ip: 209.85.210.176, mailfrom: vanusuri@mvista.com)
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-76e2ebe86ecso1249708b3a.3
        for <openembedded-core@lists.openembedded.org>; Thu, 14 Aug 2025 06:58:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1755179927; x=1755784727; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=tGMBgqrHySVNe7Aq1GWQ+YU4zIoJCGxZiBdEqXCVjEY=;
        b=ekoqFaTksTyCUtnu1k8J2InX+jJmUVouGY+79u2npth76fI9PJEX1FdL+sNjRwQqEd
         l+nWwI9deQ6iA06nPn1GilK14gXj3gHkXy6WoohZl7Q/jIafzEFS880FMJ63qZhtPef/
         7goYHdYMFV3yJx/QN7rvWS0W9/7UMXFeeyiA0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755179927; x=1755784727;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tGMBgqrHySVNe7Aq1GWQ+YU4zIoJCGxZiBdEqXCVjEY=;
        b=I5skZiRMhGuOo+XH31Wa8BMdgfQRENBtBNkePahuaRSErZkiCfBTmCJI0LKFnoKSzE
         PIxgBQtdu6GQCLqJtawFhFhMbuXm1gfTh8zhjltLGbmm5Y+umKLTMX4EADqbs0vIhOf8
         v2+af1U7GEwcXHU5FBDcxS1ZfJ8forNcsR7Qo5WzR7qVO6lxoogk7p33EYjwnDY5CnQ9
         33RBIG1/ZDqIIpJIrdL3+CMmqvoZ6xZcRuFJU8JOryrUo4o/5pnCbK4vSif4N1Yw7upT
         O+MhBrYhK4MxPb+UsTBjroMFq/nzfrN0j5IILvh0gRgRXc8Hr/QJNIGRcr2x0u6dHwH/
         KFjw==
X-Gm-Message-State: AOJu0Ywf2hb4XokirZoh6F83HWm9K1+qozARLDIh+IqSBs30nQP9bc+6
	I4xpfpXeRS9cnXJ8F+c6oNQ5znhfixccL6anq+cYqUm7698FV9M6cNTdmxgLO033oyj6gPSs0th
	Fot6+r7M=
X-Gm-Gg: ASbGncvJItJWtJCHI6Eaa5A5Dfeo9cxwx21FTu5Koysjjtsfq6VgbA2sDGEyQd8KM2J
	4vyOk1q4S0zfobhchBjlcZqSG/+dctI+W/jQDIBsDWEhndr0FR2Olg1dnIRDYWCsoLwt5mKfcUK
	DKUo8oMgu1y3kdMM9cJj6NOYmF1D5BeuJV85npbVJXs+FMTQ87ekdR7K9IlxgeIfjkDsdS3NZ9h
	o5U+nYr6dVABLd/fm+bOL4kl6hf3qYT6yEM/u8VOTYGAUBbQzYAzOgT6pxQDOcaAmZ4bPNV0pCa
	WrQIgIFv9uL5WCQG4eZumCmxTHscSLG9DhJv4T345Zdc6kq5efJ/E7fJSnxFyaRRzsQo/axI8ks
	R41pOKIUGIoT7ozu+xidbDCY0oeDVTyNnlw==
X-Google-Smtp-Source: AGHT+IExgBbqUrxmrYom5ZHeXgfOFt0IoPfwFMJpOVjTm368mWU0hMkS4nz2UWZZLPTvx8RGhrsL5w==
X-Received: by 2002:a05:6a20:3d89:b0:232:57c8:1bf4 with SMTP id adf61e73a8af0-240bcfbdc2emr5328856637.9.1755179927426;
        Thu, 14 Aug 2025 06:58:47 -0700 (PDT)
Received: from localhost.localdomain ([49.207.229.79])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3233100c1d0sm1919591a91.17.2025.08.14.06.58.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Aug 2025 06:58:46 -0700 (PDT)
From: vanusuri@mvista.com
To: openembedded-core@lists.openembedded.org
Cc: Vijay Anusuri <vanusuri@mvista.com>
Subject: [OE-core][kirkstone][PATCH 1/3] xserver-xorg: Fix for CVE-2025-49175
Date: Thu, 14 Aug 2025 19:28:29 +0530
Message-Id: <20250814135831.981377-1-vanusuri@mvista.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=y
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 14 Aug 2025 13:58:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/221864

From: Vijay Anusuri <vanusuri@mvista.com>

Upstream-Status: Backport from https://gitlab.freedesktop.org/xorg/xserver/-/commit/0885e0b26225c90534642fe911632ec0779eebee

Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
---
 .../xserver-xorg/CVE-2025-49175.patch         | 91 +++++++++++++++++++
 .../xorg-xserver/xserver-xorg_21.1.8.bb       |  1 +
 2 files changed, 92 insertions(+)
 create mode 100644 meta/recipes-graphics/xorg-xserver/xserver-xorg/CVE-2025-49175.patch

diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xorg/CVE-2025-49175.patch b/meta/recipes-graphics/xorg-xserver/xserver-xorg/CVE-2025-49175.patch
new file mode 100644
index 0000000000..2f56a8f6b9
--- /dev/null
+++ b/meta/recipes-graphics/xorg-xserver/xserver-xorg/CVE-2025-49175.patch
@@ -0,0 +1,91 @@
+From 0885e0b26225c90534642fe911632ec0779eebee Mon Sep 17 00:00:00 2001
+From: Olivier Fourdan <ofourdan@redhat.com>
+Date: Fri, 28 Mar 2025 09:43:52 +0100
+Subject: [PATCH] render: Avoid 0 or less animated cursors
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+Animated cursors use a series of cursors that the client can set.
+
+By default, the Xserver assumes at least one cursor is specified
+while a client may actually pass no cursor at all.
+
+That causes an out-of-bound read creating the animated cursor and a
+crash of the Xserver:
+
+ | Invalid read of size 8
+ |    at 0x5323F4: AnimCursorCreate (animcur.c:325)
+ |    by 0x52D4C5: ProcRenderCreateAnimCursor (render.c:1817)
+ |    by 0x52DC80: ProcRenderDispatch (render.c:1999)
+ |    by 0x4A1E9D: Dispatch (dispatch.c:560)
+ |    by 0x4B0169: dix_main (main.c:284)
+ |    by 0x4287F5: main (stubmain.c:34)
+ |  Address 0x59aa010 is 0 bytes after a block of size 0 alloc'd
+ |    at 0x48468D3: reallocarray (vg_replace_malloc.c:1803)
+ |    by 0x52D3DA: ProcRenderCreateAnimCursor (render.c:1802)
+ |    by 0x52DC80: ProcRenderDispatch (render.c:1999)
+ |    by 0x4A1E9D: Dispatch (dispatch.c:560)
+ |    by 0x4B0169: dix_main (main.c:284)
+ |    by 0x4287F5: main (stubmain.c:34)
+ |
+ | Invalid read of size 2
+ |    at 0x5323F7: AnimCursorCreate (animcur.c:325)
+ |    by 0x52D4C5: ProcRenderCreateAnimCursor (render.c:1817)
+ |    by 0x52DC80: ProcRenderDispatch (render.c:1999)
+ |    by 0x4A1E9D: Dispatch (dispatch.c:560)
+ |    by 0x4B0169: dix_main (main.c:284)
+ |    by 0x4287F5: main (stubmain.c:34)
+ |  Address 0x8 is not stack'd, malloc'd or (recently) free'd
+
+To avoid the issue, check the number of cursors specified and return a
+BadValue error in both the proc handler (early) and the animated cursor
+creation (as this is a public function) if there is 0 or less cursor.
+
+CVE-2025-49175
+
+This issue was discovered by Nils Emmerich <nemmerich@ernw.de> and
+reported by Julian Suleder via ERNW Vulnerability Disclosure.
+
+Signed-off-by: Olivier Fourdan <ofourdan@redhat.com>
+Reviewed-by: José Expósito <jexposit@redhat.com>
+Part-of: <https://gitlab.freedesktop.org/xorg/xserver/-/merge_requests/2024>
+
+Upstream-Status: Backport [https://gitlab.freedesktop.org/xorg/xserver/-/commit/0885e0b26225c90534642fe911632ec0779eebee]
+CVE: CVE-2025-49175
+Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
+---
+ render/animcur.c | 3 +++
+ render/render.c  | 2 ++
+ 2 files changed, 5 insertions(+)
+
+diff --git a/render/animcur.c b/render/animcur.c
+index f906cd8130..1194cee7e7 100644
+--- a/render/animcur.c
++++ b/render/animcur.c
+@@ -305,6 +305,9 @@ AnimCursorCreate(CursorPtr *cursors, CARD32 *deltas, int ncursor,
+     int rc = BadAlloc, i;
+     AnimCurPtr ac;
+ 
++    if (ncursor <= 0)
++        return BadValue;
++
+     for (i = 0; i < screenInfo.numScreens; i++)
+         if (!GetAnimCurScreen(screenInfo.screens[i]))
+             return BadImplementation;
+diff --git a/render/render.c b/render/render.c
+index 113f6e0c5a..fe9f03c8c8 100644
+--- a/render/render.c
++++ b/render/render.c
+@@ -1799,6 +1799,8 @@ ProcRenderCreateAnimCursor(ClientPtr client)
+     ncursor =
+         (client->req_len -
+          (bytes_to_int32(sizeof(xRenderCreateAnimCursorReq)))) >> 1;
++    if (ncursor <= 0)
++        return BadValue;
+     cursors = xallocarray(ncursor, sizeof(CursorPtr) + sizeof(CARD32));
+     if (!cursors)
+         return BadAlloc;
+-- 
+GitLab
+
diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.8.bb b/meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.8.bb
index 6790eb0921..565489a926 100644
--- a/meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.8.bb
+++ b/meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.8.bb
@@ -36,6 +36,7 @@ SRC_URI += "file://0001-xf86pciBus.c-use-Intel-ddx-only-for-pre-gen4-hardwar.pat
            file://CVE-2025-26601-3.patch \
            file://CVE-2025-26601-4.patch \
            file://CVE-2022-49737.patch \
+           file://CVE-2025-49175.patch \
            "
 SRC_URI[sha256sum] = "38aadb735650c8024ee25211c190bf8aad844c5f59632761ab1ef4c4d5aeb152"
 
-- 
2.25.1


