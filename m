Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0C753C83038
	for <webhook@archiver.kernel.org>; Wed,  2 Jul 2025 03:13:01 +0000 (UTC)
Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
 by mx.groups.io with SMTP id smtpd.web10.15058.1751425974152065311
 for <openembedded-core@lists.openembedded.org>;
 Tue, 01 Jul 2025 20:12:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=fx7cgvbE;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.175, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-74b50c71b0aso188388b3a.0
        for <openembedded-core@lists.openembedded.org>; Tue, 01 Jul 2025 20:12:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1751425973; x=1752030773; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zBuDlhW0QIiEDtNtEUtOkn4zZFNZI3jsa4VOwWgwTwQ=;
        b=fx7cgvbE7qF94Z+wkh4OZQgEloE9ZCB9BJuIs8/Ksk4TRXQHex9wslWIuV5AzKpK4d
         bveDkZF0VzNql5oph8pKVK3n48M8bpxd7RZp9r+KVHSFnCjpefDULgiIq+KFle239adF
         u3ohIAxtQuXbvADGdbjiyIBQcPBzANa8d5FhBlZU+qz2bXRu3lK5cGaM3+pBmcBA3qIQ
         7rZ2dLuVuNdYErTSSXZRXcldKekR572mFRznn8ni1W8ya7/+AyIW1Iauv9k2pduaSgVw
         TVjlkyfBxIkmNSQNuV+PjS23J8yAP8p1s8kQh3cmBfeEUxERRXZ+0INfAB3TF4MBImTC
         UX/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751425973; x=1752030773;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zBuDlhW0QIiEDtNtEUtOkn4zZFNZI3jsa4VOwWgwTwQ=;
        b=gqjzRFI6GyD3vFdH8hMaBeWPyiIyXIxn1ams97VtJdyjSUwdvpTrOYmS0Qv4dY01E1
         QeNF6+jPysSB4+onnSOmTvyxnZStu+yryYwwD1fyoVRzOovrPrTMaEQYs5OJnCTIvm05
         CkhgzR1PGFu9+TGOyRdkm9NrViEt78kp4Mk5my50hy5FTBZIFCeaDmpYwVuxxv2CSsjO
         Pv/2Dqov7Fb8b76yUdazjk9KCOF8F/AxfeHN0F+bimDJg8mBOMNC/G1xFCAKKxfQdaNk
         E9YONuOAHytFnx15qAUYzN+0TuhS+4HZ2rWLzJKC2jTBg2e6UwH+RfAf1mqx8h3gi2mE
         LsUQ==
X-Gm-Message-State: AOJu0YyVxrD8RbJe3vKWFjm5Vah2bE/XbYYpNbGLixH6vGwcOWg7THG+
	wUV/hm7eRFCta1fvvoja352oBzi46d6CcHiHeiTvzhBNd7PvjbfsrgE9d/evv+9/zETU5ffIrk1
	G5BEo
X-Gm-Gg: ASbGnctSV2cf+KhZkKUFTR/P2SXMW71SD0gERrRXwqIdkTaeL2NoM+xuw+Pd1nGOVkI
	F8uqZQaeNi/E581qmRzZLyspZvIvieGcdHl2+yYX+EHSQ0M+lrinUxIzkbO5ge4avbu4c82FKMF
	CQalnf0WKgQthm2buSBR3TedvxBUwMH05SkAmkTOMbNMEQHYuiihfenrdfZhgZAT+13MwunUqYz
	UpR9Ti/notJCAGBum9bj1V6tRyieqedznwVeGP1oqmsQru/2aExe1S4raW4CiEd6byp8qpBti/b
	eN7J2e22TKWphEhrMUrRLHFBPqjubu+0+5h9FJuW5DHwHFOoHWFIsmv0Ra/fv/PE
X-Google-Smtp-Source: AGHT+IHiNS292cJJBG7eDPFkk7uSfnRut0eI8AvRLbLLCRB+EPcjS4ntlhvhMvGmHodvEjUZ2oQ2cA==
X-Received: by 2002:a05:6a20:d80a:b0:216:5f67:98f7 with SMTP id adf61e73a8af0-222d7f071ffmr2122195637.33.1751425973348;
        Tue, 01 Jul 2025 20:12:53 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:34f8:320a:2e39:118e])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-74af58069a9sm13633241b3a.174.2025.07.01.20.12.52
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Jul 2025 20:12:52 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][walnascar 18/19] linux-yocto: refresh CVE exclusion list for 6.12.31
Date: Tue,  1 Jul 2025 20:12:03 -0700
Message-ID: <2b8fb722cd3cbc8f41315b2d88302bcf77bb681b.1751425749.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1751425749.git.steve@sakoman.com>
References: <cover.1751425749.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 02 Jul 2025 03:13:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/219772

From: Ross Burton <ross.burton@arm.com>

Signed-off-by: Ross Burton <ross.burton@arm.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 890041f5ed06be1c0a655030af35484d98fe3e7a)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../linux/cve-exclusion_6.12.inc              | 26 ++++++++++++-------
 1 file changed, 17 insertions(+), 9 deletions(-)

diff --git a/meta/recipes-kernel/linux/cve-exclusion_6.12.inc b/meta/recipes-kernel/linux/cve-exclusion_6.12.inc
index d33880eae0..199ea019d5 100644
--- a/meta/recipes-kernel/linux/cve-exclusion_6.12.inc
+++ b/meta/recipes-kernel/linux/cve-exclusion_6.12.inc
@@ -1,11 +1,11 @@
 
 # Auto-generated CVE metadata, DO NOT EDIT BY HAND.
-# Generated at 2025-05-29 10:54:43.823437+00:00 for kernel version 6.12.30
-# From cvelistV5 cve_2025-05-29_1000Z-1-g4f2590b715f
+# Generated at 2025-06-05 16:29:20.725105+00:00 for kernel version 6.12.31
+# From cvelistV5 cve_2025-06-05_1600Z
 
 
 python check_kernel_cve_status_version() {
-    this_version = "6.12.30"
+    this_version = "6.12.31"
     kernel_version = d.getVar("LINUX_VERSION")
     if kernel_version != this_version:
         bb.warn("Kernel CVE status needs updating: generated for %s but kernel is %s" % (this_version, kernel_version))
@@ -5054,8 +5054,6 @@ CVE_STATUS[CVE-2023-53023] = "fixed-version: Fixed from version 6.2"
 
 CVE_STATUS[CVE-2023-53024] = "fixed-version: Fixed from version 6.2"
 
-CVE_STATUS[CVE-2023-53025] = "fixed-version: Fixed from version 6.2"
-
 CVE_STATUS[CVE-2023-53026] = "fixed-version: Fixed from version 6.2"
 
 CVE_STATUS[CVE-2023-53028] = "fixed-version: Fixed from version 6.1.8"
@@ -12564,8 +12562,6 @@ CVE_STATUS[CVE-2025-37780] = "cpe-stable-backport: Backported in 6.12.25"
 
 CVE_STATUS[CVE-2025-37781] = "cpe-stable-backport: Backported in 6.12.25"
 
-CVE_STATUS[CVE-2025-37782] = "cpe-stable-backport: Backported in 6.12.25"
-
 CVE_STATUS[CVE-2025-37783] = "fixed-version: only affects 6.14 onwards"
 
 CVE_STATUS[CVE-2025-37784] = "cpe-stable-backport: Backported in 6.12.25"
@@ -12660,8 +12656,6 @@ CVE_STATUS[CVE-2025-37830] = "cpe-stable-backport: Backported in 6.12.26"
 
 CVE_STATUS[CVE-2025-37831] = "cpe-stable-backport: Backported in 6.12.26"
 
-CVE_STATUS[CVE-2025-37832] = "cpe-stable-backport: Backported in 6.12.26"
-
 CVE_STATUS[CVE-2025-37833] = "cpe-stable-backport: Backported in 6.12.26"
 
 CVE_STATUS[CVE-2025-37834] = "cpe-stable-backport: Backported in 6.12.26"
@@ -12978,6 +12972,20 @@ CVE_STATUS[CVE-2025-37991] = "cpe-stable-backport: Backported in 6.12.28"
 
 CVE_STATUS[CVE-2025-37992] = "cpe-stable-backport: Backported in 6.12.30"
 
+CVE_STATUS[CVE-2025-37993] = "cpe-stable-backport: Backported in 6.12.29"
+
+CVE_STATUS[CVE-2025-37994] = "cpe-stable-backport: Backported in 6.12.29"
+
+CVE_STATUS[CVE-2025-37995] = "cpe-stable-backport: Backported in 6.12.29"
+
+CVE_STATUS[CVE-2025-37996] = "fixed-version: only affects 6.14 onwards"
+
+CVE_STATUS[CVE-2025-37997] = "cpe-stable-backport: Backported in 6.12.29"
+
+CVE_STATUS[CVE-2025-37998] = "cpe-stable-backport: Backported in 6.12.29"
+
+CVE_STATUS[CVE-2025-37999] = "cpe-stable-backport: Backported in 6.12.29"
+
 CVE_STATUS[CVE-2025-38049] = "cpe-stable-backport: Backported in 6.12.23"
 
 # CVE-2025-38104 needs backporting (fixed from 6.15)
-- 
2.43.0


