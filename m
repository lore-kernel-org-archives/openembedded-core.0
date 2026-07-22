Return-Path: <sdoshi@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 90421C4453A
	for <webhook@archiver.kernel.org>; Wed, 22 Jul 2026 20:21:53 +0000 (UTC)
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.9340.1784751709481774513
 for <openembedded-core@lists.openembedded.org>;
 Wed, 22 Jul 2026 13:21:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=dki46wsR;
 spf=pass (domain: mvista.com, ip: 209.85.214.178, mailfrom: sdoshi@mvista.com)
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-2cc97653887so142290145ad.1
        for <openembedded-core@lists.openembedded.org>; Wed, 22 Jul 2026 13:21:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1784751709; x=1785356509; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=GXIjjXqI3cbzQV0/tVsAPHqGpmPpZylgmBRha3OZrxU=;
        b=dki46wsR+heO/mJUPMSeYUqe/DF4zDfKEERo0ovLhkH95wfjjEO07okGxuEZY4gw3U
         JjydD9zVTRqOQJDkYfp+xkfDeKZwVamPHvJjY6UxL52cvkdh4+O6gE58QwJhOQZm5RKZ
         2/60Hs2UiVaPh+dMOtPjWVb0Nr/XYNt+ooOyA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784751709; x=1785356509;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GXIjjXqI3cbzQV0/tVsAPHqGpmPpZylgmBRha3OZrxU=;
        b=pbX/inVFbFEtqkC8bnaf5ztX1fBKk1KMo789CHEhsljKXigyOQGDV2j3nLSk1yGUFs
         nk8U08bq5JEB9xUQvlKncu8pwvdf9ysyp+ZjsOJL8JmcabwvnU/TE8ZFwsL9BlcRbnBo
         74ZerFXL0hnNthVE6Yu59Bky2hfPP84+tBtVffdjsIyJWczS/VA1PqpNAQGZwEqyglK1
         lgFdxUVepJmchN9CIP3D4rURR2x/bpDUobhKN3Biw644lckUDEy4Iysz3XJgSL/zutvS
         p0OJAukM/Ime2TwSuzIbuWIkv3jyXTvays2JuQDq1CgYXIOtPALc9AZt+/833ne8qHBa
         tYfw==
X-Gm-Message-State: AOJu0YzieZUCns5JFpXbjIebF9r/MyRUZZqWMygtRTRoI1tgy17WXYT3
	rZzktpYA+iXUox4qBJrW0EI/4iynOgkDkuRpUD4YgHCfYsqbFkyyNhoxenKZJ/nNuSpbiKhqeIZ
	euUNEqa0=
X-Gm-Gg: AR+sD102ukWk/KWmL4WY2pboEInzkci/3K59ZLNan8clnBREO3oDfIxDP5YyYY4BFEC
	Nxu41CSrjVmkOuI9uhmgyYrjogK2bpfw3lTCPllfKH5kl5l/eGG5H8qsJmFFD2MhYrU27LFg0zD
	1J59/aWbPkb+VXrB//890svVdVPXPjjgRwR5ehOGWrwJrlR/3LWtNEK85JNA4a7N6qzVgBi1XQl
	gCfoBkg9SkMBuPez6Tk14M9Y5cX8DRHrkhTWMAF8QVilGZOPNO7aDjl68AeZvjdX03kl/oMEQ2S
	lK08w18N+VPyxsyFXyOIAXrt2+GfxGBALMHUsPcMvY8jsFRfS53RC8QjO9xhB5+DPywE85gjfmz
	0lHEMLYqEvncxKU8pR6RZ2EjcmktansOTE3PtVurNWUSoqXzO5sMGdq4MGSYOwxpoqtsLMJEOiz
	CH3cy+redGHybJ
X-Received: by 2002:a17:903:1c3:b0:2ca:e5c:7fba with SMTP id d9443c01a7336-2cfa74b2e2fmr3542445ad.39.1784751708798;
        Wed, 22 Jul 2026 13:21:48 -0700 (PDT)
Received: from MVIN00030.mvista.com ([157.32.46.199])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3147d47960dsm11699468eec.0.2026.07.22.13.21.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jul 2026 13:21:48 -0700 (PDT)
From: Siddharth <sdoshi@mvista.com>
To: openembedded-core@lists.openembedded.org
Cc: Siddharth Doshi <sdoshi@mvista.com>
Subject: [OE-core][scarthgap][PATCH 01/13] vim: Security Fix for CVE-2026-28422
Date: Thu, 23 Jul 2026 01:48:53 +0530
Message-Id: <20260722201905.491897-1-sdoshi@mvista.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 22 Jul 2026 20:21:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/241745

From: Siddharth Doshi <sdoshi@mvista.com>

Picking patch as per [1], and same patch is mentioned in [2]

References:
[1] https://nvd.nist.gov/vuln/detail/CVE-2026-28422
[2] https://security-tracker.debian.org/tracker/CVE-2026-28422

Signed-off-by: Siddharth Doshi <sdoshi@mvista.com>
---
 .../vim/files/CVE-2026-28422.patch            | 44 +++++++++++++++++++
 meta/recipes-support/vim/vim.inc              |  1 +
 2 files changed, 45 insertions(+)
 create mode 100644 meta/recipes-support/vim/files/CVE-2026-28422.patch

diff --git a/meta/recipes-support/vim/files/CVE-2026-28422.patch b/meta/recipes-support/vim/files/CVE-2026-28422.patch
new file mode 100644
index 0000000000..89f219ccf6
--- /dev/null
+++ b/meta/recipes-support/vim/files/CVE-2026-28422.patch
@@ -0,0 +1,44 @@
+From fcf19885004325f5a52db6bd6893cb5b387799d3 Mon Sep 17 00:00:00 2001
+From: Christian Brabandt <cb@256bit.org>
+Date: Tue, 24 Feb 2026 20:29:20 +0000
+Subject: [PATCH 01/17] patch 9.2.0078: [security]: stack-buffer-overflow in
+ build_stl_str_hl()
+
+Problem:  A stack-buffer-overflow occurs when rendering a statusline
+          with a multi-byte fill character on a very wide terminal.
+          The size check in build_stl_str_hl() uses the cell width
+          rather than the byte length, allowing the subsequent fill
+          loop to write beyond the 4096-byte MAXPATHL buffer
+          (ehdgks0627, un3xploitable).
+Solution: Update the size check to account for the byte length of
+          the fill character (using MB_CHAR2LEN).
+
+Github Advisory:
+https://github.com/vim/vim/security/advisories/GHSA-gmqx-prf2-8mwf
+
+Signed-off-by: Christian Brabandt <cb@256bit.org>
+
+Upstream-Status: Backport [https://github.com/vim/vim/commit/4e5b9e31cb7484ad156fba995fdce3c9b075b5fd]
+CVE: CVE-2026-28422
+Signed-off-by: Siddharth Doshi <sdoshi@mvista.com>
+---
+ src/buffer.c | 3 ++-
+ 1 file changed, 2 insertions(+), 1 deletion(-)
+
+diff --git a/src/buffer.c b/src/buffer.c
+index 0feafc590d..363dd0e04a 100644
+--- a/src/buffer.c
++++ b/src/buffer.c
+@@ -5293,7 +5293,8 @@ build_stl_str_hl(
+ 	}
+ 	width = maxwidth;
+     }
+-    else if (width < maxwidth && outputlen + maxwidth - width + 1 < outlen)
++    else if (width < maxwidth &&
++	    outputlen + (maxwidth - width) * MB_CHAR2LEN(fillchar) + 1 < outlen)
+     {
+ 	// Find how many separators there are, which we will use when
+ 	// figuring out how many groups there are.
+-- 
+2.44.4
+
diff --git a/meta/recipes-support/vim/vim.inc b/meta/recipes-support/vim/vim.inc
index 9a4b21f530..16edebf1e9 100644
--- a/meta/recipes-support/vim/vim.inc
+++ b/meta/recipes-support/vim/vim.inc
@@ -33,6 +33,7 @@ SRC_URI = "git://github.com/vim/vim.git;branch=master;protocol=https \
            file://CVE-2026-45130.patch \
            file://CVE-2026-46483.patch \
            file://CVE-2026-28420.patch \
+           file://CVE-2026-28422.patch \
            "
 
 PV .= ".1683"
-- 
2.34.1


