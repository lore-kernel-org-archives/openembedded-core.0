Return-Path: <vanusuri@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8DB74CD4F35
	for <webhook@archiver.kernel.org>; Tue, 12 May 2026 08:59:53 +0000 (UTC)
Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.70957.1778576388879249203
 for <openembedded-core@lists.openembedded.org>;
 Tue, 12 May 2026 01:59:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=GYBoY7AM;
 spf=pass (domain: mvista.com, ip: 209.85.216.41, mailfrom: vanusuri@mvista.com)
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-367cbac9cb1so3139903a91.3
        for <openembedded-core@lists.openembedded.org>; Tue, 12 May 2026 01:59:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1778576388; x=1779181188; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=MSwkedX+xx02CuijYEttIbmEfOfIE8Z0Ne5Wp25M9Is=;
        b=GYBoY7AM92XJAtbqhIPoiym116nOV/jndQaPkSSwIPAHtN6e8+wYQlbxSPYszzKiOA
         oG8hscu9AGRkEylXHLlmKTvcffEw7tnjlUpLGg3dN43yDLe49PSlIVSCatuGu3pM8ooH
         LfLi+5Q0JDcwvAB95uv/L5n+Pm/17snrT0sJI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778576388; x=1779181188;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MSwkedX+xx02CuijYEttIbmEfOfIE8Z0Ne5Wp25M9Is=;
        b=BmYJUK2J38ZUn53KTLeboSWJ9dgsXzgx2GVxf5+p3Td7/dEaB4/fW8WjPdVcO3QuDC
         YjXUMaSHw8WNd1yf1cw9HF8pRT2VzqeQALkPJJiFRST0L6L3u+uRNfyTnHSo351LNazG
         qSaNtioJwvfUzY5HbBQzvVR7ltzR+QviOADnkEjdq6Sc85A09ssd0yhp/vwaiBW0Ugu/
         5prTjTz7FmC19Za39XI5jgjdOPWSWdy2HsvzoqDfY9fbHp4EMnxBG53ZY4+Kdb3Nd/j/
         Zciz+mZ9bbgNGuaD7QpjUIaaRaSHEjkeI4fStoPECbCfnJPDEy2xWbMO409mRyuImAgY
         TUnw==
X-Gm-Message-State: AOJu0Yzgh4mf5YrxIkD10pAnlJkkZUduxMSxMGep7XfCBj3O8B9YHlbN
	Cv/dfHNHXCuQ9f5wJC9M+mRjpw84eCaTs1cplbE7ZpG5qZB1GJjkbS9lhD914PHovESGiqubS2v
	PGXJl
X-Gm-Gg: Acq92OENvq+F6pag5PAEGZ1o1+vs4uG1TYKokAPWeQTULW+MWdM842DGu6/FLZ0xFFb
	fl4F1Uq5/eiBtUXbPceTEzzI+BZFJbxYyFqcxTvERRai+c5kSip8JBkjvvWkRS5FpjJDgecrKth
	D1MVOcvzCnkIYfiZlr/k8phOlXud2pQqs871Kh8WtlsjOQvRIQj+xLUSPd10OOAGYY8GROiGZLV
	6tQaJRHbw4oHv89LgNzlIYTVuTjhw5exvEp5+tqukg3Hr+wiuZ+aZYRnTJp5EEnoSGuu2klFvBw
	6BVaHNUxnF0G8PpFqxalu3x/2Z24Vdpk/dVBwalaOLsBDAGMgvSDrBOa+w81eTuWA1/IPp3IRM6
	WwVYK46AR6kYez3qcDvOvCM2BuONyUWD8PP/e/ne+slRe5kqKYZE5KFdzWftricFPzXSvulpmrg
	WqEr66uF1obp4J0tpUTZ0KbA9c1D4=
X-Received: by 2002:a17:90b:5683:b0:361:45df:f5 with SMTP id 98e67ed59e1d1-365abe8a5b2mr31325648a91.16.1778576387672;
        Tue, 12 May 2026 01:59:47 -0700 (PDT)
Received: from MVIN00352.. ([2401:4900:1cc4:80a8:e6ce:e2c9:e8fb:6a6e])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-367d623fcfasm13591380a91.2.2026.05.12.01.59.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 May 2026 01:59:46 -0700 (PDT)
From: Vijay Anusuri <vanusuri@mvista.com>
To: openembedded-core@lists.openembedded.org
Cc: Vijay Anusuri <vanusuri@mvista.com>
Subject: [OE-core][scarthgap][patch 1/5] xserver-xorg: Fix CVE-2026-33999
Date: Tue, 12 May 2026 14:29:19 +0530
Message-ID: <20260512085923.820545-1-vanusuri@mvista.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 12 May 2026 08:59:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/236863

Pick patch according to [1]

[1] https://lists.x.org/archives/xorg-announce/2026-April/003677.html
[2] https://security-tracker.debian.org/tracker/CVE-2026-33999

Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
---
 .../xserver-xorg/CVE-2026-33999.patch         | 49 +++++++++++++++++++
 .../xorg-xserver/xserver-xorg_21.1.18.bb      |  1 +
 2 files changed, 50 insertions(+)
 create mode 100644 meta/recipes-graphics/xorg-xserver/xserver-xorg/CVE-2026-33999.patch

diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xorg/CVE-2026-33999.patch b/meta/recipes-graphics/xorg-xserver/xserver-xorg/CVE-2026-33999.patch
new file mode 100644
index 0000000000..cd3bf47397
--- /dev/null
+++ b/meta/recipes-graphics/xorg-xserver/xserver-xorg/CVE-2026-33999.patch
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
diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.18.bb b/meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.18.bb
index 7f6197a0b4..ef7f5c5bdb 100644
--- a/meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.18.bb
+++ b/meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.18.bb
@@ -5,6 +5,7 @@ SRC_URI += "file://0001-xf86pciBus.c-use-Intel-ddx-only-for-pre-gen4-hardwar.pat
             file://0002-xkb-Make-the-RT_XKBCLIENT-resource-private.patch \
             file://0003-xkb-Free-the-XKB-resource-when-freeing-XkbInterest.patch \
             file://0004-xkb-Prevent-overflow-in-XkbSetCompatMap.patch \
+            file://CVE-2026-33999.patch \
             "
 SRC_URI[sha256sum] = "c878d1930d87725d4a5bf498c24f4be8130d5b2646a9fd0f2994deff90116352"
 
-- 
2.43.0


