Return-Path: <hprajapati@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 037EBCC6B01
	for <webhook@archiver.kernel.org>; Thu,  2 Apr 2026 03:58:14 +0000 (UTC)
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.8401.1775102290440654590
 for <openembedded-core@lists.openembedded.org>;
 Wed, 01 Apr 2026 20:58:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=NU8DCzgw;
 spf=pass (domain: mvista.com, ip: 209.85.214.170, mailfrom: hprajapati@mvista.com)
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-2b24fcc2b5dso2441335ad.1
        for <openembedded-core@lists.openembedded.org>; Wed, 01 Apr 2026 20:58:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1775102290; x=1775707090; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Dg3lvzrlyPvlcoNy0udjTWrQBhIM6cqzoEdLlQm89bw=;
        b=NU8DCzgwBnOZVJHFjy3o4Zb02Nda1dcFX8p3oU9tz+hqQJWOKmaaCEO1udzaIceVnp
         a8k8na+4wyrObxPLSSyZG8x4FBOVHHxe/7KwFf9bZJmGNFZKVHl4YLSuWir3Rz+iBoyS
         vRwqz6utTF8tHbbwT1R+6qH79C1dghaGlV7U4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775102290; x=1775707090;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Dg3lvzrlyPvlcoNy0udjTWrQBhIM6cqzoEdLlQm89bw=;
        b=tTipqctOl6cRBDPIxxhWYfp6EyhVDeY/zv7mguLqWaePUDyYn+dvEOFx9kKezyTCaa
         9veITEayimF/+a1W9QvGOg1G1uHHtMrO0bLNabJo86GuO3w9K+C8DvgFw0S+yrAtiryM
         ogmWp5lL1//bzwEntYRBfkd7cp6y3A6EP+76wvnu6GLym8C9ETOZRtt7z4lPBQumkIc5
         /6Ed5gceVrC9GxhcZp/5XPd2/Ag1G3Qj2RYFEknvrWsMgydaYviTARREECQdUnC3kY81
         5OQ4u0ilq2glXkt1pZpkmDrWiNawUibi81M7Pm1OVu2lkoQ50ZWnvjieTjuSawBS8byU
         tiiA==
X-Gm-Message-State: AOJu0Yyr31V53mOnVlTk034AThe8oreQqhbCIhznnY7K1UgKjvu3nsLV
	E8qFsy10Dp4rvEFLYiyMwc6/vTpni0s8vrxLYiTrw6RF/fs5+Zk9aCm4KSoF17/sK+ufidc3eUE
	gxBBNPPs=
X-Gm-Gg: ATEYQzzUzDL0AcUN2BQY5IHyk0EKgl31hm7BZCjJn2fI1JqJugRqg2TVtmeWPEAfGDY
	xHUWeKlrrjyBFcc+lAl1ORt/GZr0vQ4O4rlTY3LN+KHlVBr+yu3kziPmCJsH5sv60BNUl7Uty5W
	RVRcTM2xddFNSo7tF+0Yq5RbT5Gtyi2hWV1mMK1o7oLHtYrD6u4CXBJu7jwPDErvy6lK0bo5ZT8
	adxVBDy70CaAC9wPxSAgmuoVPhy9L5qVIRKStn/evwF9WhyC365H3OsjeH7YetKwFWgQnQRIOJv
	EUPN+9nHV+QC6Z56QKOj/0ws9CZ6RhuJ4gXqLMQoqd/BnZUbfAqm5Iuenm4z3UkQPjPLXvswVNr
	gagFoPkGndDfMeV794sCrFw5vT/DINDig/x5X0uQxXlqRY0U2KUIxv4Q7eau0vbacMCzyCtFJLl
	OaP8Ffn1GPEupFoMiCbLj9NaCFHpbtFMGK1gc=
X-Received: by 2002:a17:903:2f0e:b0:2b2:5099:2f3e with SMTP id d9443c01a7336-2b2758798a2mr17351155ad.4.1775102289571;
        Wed, 01 Apr 2026 20:58:09 -0700 (PDT)
Received: from MVIN00013.mvista.com ([43.249.234.172])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b2747a7115sm12186095ad.36.2026.04.01.20.58.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Apr 2026 20:58:09 -0700 (PDT)
From: Hitendra Prajapati <hprajapati@mvista.com>
To: openembedded-core@lists.openembedded.org
Cc: Hitendra Prajapati <hprajapati@mvista.com>
Subject: [kirkstone][PATCH] vim: Fix CVE-2026-33412
Date: Thu,  2 Apr 2026 09:28:01 +0530
Message-ID: <20260402035801.53200-1-hprajapati@mvista.com>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 02 Apr 2026 03:58:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/234470

Pick patch from [1] also mentioned in NVD report with [2]
[1] https://github.com/vim/vim/commit/645ed6597d1ea896c712cd7ddbb6edee79577e9a
[2] https://nvd.nist.gov/vuln/detail/CVE-2026-33412

Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
---
 .../vim/files/CVE-2026-33412.patch            | 61 +++++++++++++++++++
 meta/recipes-support/vim/vim.inc              |  1 +
 2 files changed, 62 insertions(+)
 create mode 100644 meta/recipes-support/vim/files/CVE-2026-33412.patch

diff --git a/meta/recipes-support/vim/files/CVE-2026-33412.patch b/meta/recipes-support/vim/files/CVE-2026-33412.patch
new file mode 100644
index 0000000000..62daa308b5
--- /dev/null
+++ b/meta/recipes-support/vim/files/CVE-2026-33412.patch
@@ -0,0 +1,61 @@
+From 645ed6597d1ea896c712cd7ddbb6edee79577e9a Mon Sep 17 00:00:00 2001
+From: pyllyukko <pyllyukko@maimed.org>
+Date: Thu, 19 Mar 2026 19:58:05 +0000
+Subject: [PATCH] patch 9.2.0202: [security]: command injection via newline in
+ glob()
+
+Problem:  The glob() function on Unix-like systems does not escape
+          newline characters when expanding wildcards. A maliciously
+          crafted string containing '\n' can be used as a command
+          separator to execute arbitrary shell commands via
+          mch_expand_wildcards(). This depends on the user's 'shell'
+          setting.
+Solution: Add the newline character ('\n') to the SHELL_SPECIAL
+          definition to ensure it is properly escaped before being
+          passed to the shell (pyllyukko).
+
+closes: #19746
+
+Github Advisory:
+https://github.com/vim/vim/security/advisories/GHSA-w5jw-f54h-x46c
+
+Signed-off-by: pyllyukko <pyllyukko@maimed.org>
+Signed-off-by: Christian Brabandt <cb@256bit.org>
+
+CVE: CVE-2026-33412
+Upstream-Status: Backport [https://github.com/vim/vim/commit/645ed6597d1ea896c712cd7ddbb6edee79577e9a]
+Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
+---
+ src/os_unix.c | 2 +-
+ src/version.c | 2 ++
+ 2 files changed, 3 insertions(+), 1 deletion(-)
+
+diff --git a/src/os_unix.c b/src/os_unix.c
+index cf195e62e1..d767956b1a 100644
+--- a/src/os_unix.c
++++ b/src/os_unix.c
+@@ -7106,7 +7106,7 @@ mch_expandpath(
+ # define SEEK_END 2
+ #endif
+ 
+-#define SHELL_SPECIAL (char_u *)"\t \"&'$;<>()\\|"
++# define SHELL_SPECIAL (char_u *)"\t \"&'$;<>()\\|\n"
+ 
+     int
+ mch_expand_wildcards(
+diff --git a/src/version.c b/src/version.c
+index 4f3912aedd..712a3e637c 100644
+--- a/src/version.c
++++ b/src/version.c
+@@ -724,6 +724,8 @@ static char *(features[]) =
+ 
+ static int included_patches[] =
+ {   /* Add new patch number below this line */
++/**/
++    1684,
+ /**/
+     1683,
+ /**/
+-- 
+2.50.1
+
diff --git a/meta/recipes-support/vim/vim.inc b/meta/recipes-support/vim/vim.inc
index 289f31be70..fc9b4db055 100644
--- a/meta/recipes-support/vim/vim.inc
+++ b/meta/recipes-support/vim/vim.inc
@@ -16,6 +16,7 @@ SRC_URI = "git://github.com/vim/vim.git;branch=master;protocol=https \
            file://disable_acl_header_check.patch \
            file://0001-src-Makefile-improve-reproducibility.patch \
            file://no-path-adjust.patch \
+           file://CVE-2026-33412.patch \
            "
 
 PV .= ".1683"
-- 
2.50.1


