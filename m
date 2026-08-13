Return-Path: <fabien.thomas@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5444CC5DF70
	for <webhook@archiver.kernel.org>; Thu, 13 Aug 2026 15:22:34 +0000 (UTC)
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.21611.1786634545907526658
 for <openembedded-core@lists.openembedded.org>;
 Thu, 13 Aug 2026 08:22:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=nGp4N/W3;
 spf=pass (domain: smile.fr, ip: 209.85.221.52, mailfrom: fabien.thomas@smile.fr)
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-47f3b39f2a1so2086236f8f.2
        for <openembedded-core@lists.openembedded.org>; Thu, 13 Aug 2026 08:22:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1786634544; x=1787239344; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=jWcupkKXEk1DDuBsNoKcen203SZmkMyjR8KKJICYHyk=;
        b=nGp4N/W3FVMRO0zPxiHeBgnVdrT7csk9PRIBsQ5dBuQbl4IKLGw7H4nN7DjiOov+st
         jYUyd68M5KqKRfEoWE2Ecf4jVV4vEbm3kG45pxNMF98iYJ+Wb/LHEwQAeLMpCVt8OT1r
         qYYWUO8qO25N69v1/keLMy5ikt19InHg2hoZQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786634544; x=1787239344;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=jWcupkKXEk1DDuBsNoKcen203SZmkMyjR8KKJICYHyk=;
        b=riTBIv93tNALhQBWtW7+R58m05LCMv/7AYGrXE87QXxdcwRQyXNvve7XDNIIxwwopc
         UvcIc2iB3gbsBd038MytA4jNMSCMa2Ip9Set3MKTYZCzBl1fEOq00sc8RJi8j7h5dcFz
         P4UVhF0frcKrJtSfa6ryjISTJIdbDgPvVqpAQPwT4lp+vWDs3ABjRw1xdZxDr21aWlkv
         mgNTq7mDDzvfXZUu33zE8z9VIAqSUrsqwltQAnIupINBOzqrMOIwielP99TE7QpmYIC5
         O/mdFp79gLavpINR0l+3cXHATOMmvDaLC72LXegBpySz661qCHkBa57cy8es8T522/62
         IQRw==
X-Gm-Message-State: AOJu0Yxmg4va+w+5pqFmjAzjlgRIV04HzYMyvC/lZ0k9gF4ug56TZ2dh
	/WIycLH0kLJdHEX7CfblqVafU3bN5Qnrm4E7z6Du3UbNEKD6cPVWbkC46SWTShgOvDEeZ8v2MAX
	kiMs09Pe/IQ==
X-Gm-Gg: AR+sD11sJvOD8V5mwmHeiJGQmXgjV97PVy4+7y2Fr9SW2Lj8xwsZmZ5Dd1f0+TwBSUn
	YTOf/Iw9WkisRaeWLnzxDFcex4LJjnrRnKfaYkgIWK1EK4Fhr9ayWSz5OVCerFN+YxSIc4kHbCP
	Ji4tdCt1xiWmTBasTzCXjvkxCe5CJp4dVJDwvwx+UEvo8DKG9a/5TXjHrE6gGt5wGXsGYY1v1Hh
	69nzikR9Qq/H5VCIDXz5PWQLQy1OllwqcYWHBFPb1LuL/7PSmBLPEJ2a+Gsl8swUek1XMPp9+V6
	9FEZXUlTn+Q0u5J8hUkUASYAqFRCx+vfmB8s6apwCTYnov8N525z7VF02VC23QdXlI4WgQgD0eL
	derSBQqg+eSoRy6082y2ML5X78rzzpPR9PmI5gczeIE+H1e9OD/VObGVRSdoyPDOKDrAVF1WvVo
	ZFkqxqKppzZRvvduSjs3Rg6T8YdJcD4Temt2o9kt5JLYOlix2SuMK66BIWwBB9mlfmPcyJU2uz+
	1JuiJud/6pc0FCrWVIfox+VFpHiBXc/ucvcsjQYtlrffSqZ4jMxgIAmCJM1VpGGvq/OjNCuWK51
	Dl5UeQzAOlPdpAy6APR66/TTDLitGqAV5+uVBUez
X-Received: by 2002:a05:6000:98f:b0:481:511c:8d45 with SMTP id ffacd0b85a97d-48159ffd2aemr10111564f8f.20.1786634543927;
        Thu, 13 Aug 2026 08:22:23 -0700 (PDT)
Received: from FRSMI25-GIGUE (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4815f21a068sm110450f8f.12.2026.08.13.08.22.23
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Aug 2026 08:22:23 -0700 (PDT)
From: Fabien Thomas <fabien.thomas@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][wrynose 03/17] libarchive: fix CVE-2026-14164
Date: Thu, 13 Aug 2026 17:21:53 +0200
Message-ID: <444439890165ed1ceb7dbf68655d320c554e6acd.1786633048.git.fabien.thomas@smile.fr>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <cover.1786633048.git.fabien.thomas@smile.fr>
References: <cover.1786633048.git.fabien.thomas@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 13 Aug 2026 15:22:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/243360

From: Daniel Turull <daniel.turull@ericsson.com>

Backport patch to fix CVE-2026-14164.

References:
  https://nvd.nist.gov/vuln/detail/CVE-2026-14164

Upstream fix:
  https://github.com/libarchive/libarchive/commit/f774f03b40cb109348e5c6d52b59c864e3cfa8e8

Tested with ptest:
Before: PASSED: 5, FAILED: 0, SKIPPED: 0
After: PASSED: 5, FAILED: 0, SKIPPED: 0

Signed-off-by: Daniel Turull <daniel.turull@ericsson.com>
Signed-off-by: Fabien Thomas <fabien.thomas@smile.fr>
---
 .../libarchive/CVE-2026-14164.patch           | 53 +++++++++++++++++++
 .../libarchive/libarchive_3.8.7.bb            |  1 +
 2 files changed, 54 insertions(+)
 create mode 100644 meta/recipes-extended/libarchive/libarchive/CVE-2026-14164.patch

diff --git a/meta/recipes-extended/libarchive/libarchive/CVE-2026-14164.patch b/meta/recipes-extended/libarchive/libarchive/CVE-2026-14164.patch
new file mode 100644
index 0000000000..b734fc448f
--- /dev/null
+++ b/meta/recipes-extended/libarchive/libarchive/CVE-2026-14164.patch
@@ -0,0 +1,53 @@
+From edbac77e8e544286fe7581bc398781c949ee5a22 Mon Sep 17 00:00:00 2001
+From: "Dustin L. Howett" <dustin@howett.net>
+Date: Sun, 24 May 2026 12:43:00 -0500
+Subject: [PATCH] Merge pull request #3071 from stoeckmann/rar5_doublefree
+
+rar5: Avoid dangling pointers in init_unpack
+(cherry picked from commit 42453cf16255800726b4efedab25138639ceef20)
+
+Conflicts Resolved:
+
+libarchive/archive_read_support_format_rar5.c (1 conflict):
+- The stable branch's init_unpack() already unconditionally NULLs
+  rar->cstate.window_buf and rar->cstate.filtered_buf right after free()
+  (the core CVE fix), but still retained the redundant else-branch that
+  re-NULLed them when window_size <= 0. Removed that dead else-branch to
+  match the upstream fix, and omitted upstream's added
+  `if(...== NULL) return ARCHIVE_FATAL;` calloc failure checks, since
+  init_unpack() is void-returning in this stable version and predates
+  that hardening.
+
+Assisted-by: kiro:claude-sonnet-5
+
+Changes from upstream commit f774f03b40cb:
+  - libarchive/archive_read_support_format_rar5.c: adapted from upstream
+
+CVE: CVE-2026-14164
+Upstream-Status: Backport [https://github.com/libarchive/libarchive/commit/f774f03b40cb109348e5c6d52b59c864e3cfa8e8]
+
+Signed-off-by: Daniel Turull <daniel.turull@ericsson.com>
+---
+ libarchive/archive_read_support_format_rar5.c | 6 +++---
+ 1 file changed, 3 insertions(+), 3 deletions(-)
+
+diff --git a/libarchive/archive_read_support_format_rar5.c b/libarchive/archive_read_support_format_rar5.c
+index 63dd97b3..271aa0cb 100644
+--- a/libarchive/archive_read_support_format_rar5.c
++++ b/libarchive/archive_read_support_format_rar5.c
+@@ -2568,12 +2568,12 @@ static void init_unpack(struct rar5* rar) {
+ 	free(rar->cstate.window_buf);
+ 	free(rar->cstate.filtered_buf);
+ 
++	rar->cstate.window_buf = NULL;
++	rar->cstate.filtered_buf = NULL;
++
+ 	if(rar->cstate.window_size > 0) {
+ 		rar->cstate.window_buf = calloc(1, rar->cstate.window_size);
+ 		rar->cstate.filtered_buf = calloc(1, rar->cstate.window_size);
+-	} else {
+-		rar->cstate.window_buf = NULL;
+-		rar->cstate.filtered_buf = NULL;
+ 	}
+ 
+ 	clear_data_ready_stack(rar);
diff --git a/meta/recipes-extended/libarchive/libarchive_3.8.7.bb b/meta/recipes-extended/libarchive/libarchive_3.8.7.bb
index e8c3a3bfe3..ecb13a6772 100644
--- a/meta/recipes-extended/libarchive/libarchive_3.8.7.bb
+++ b/meta/recipes-extended/libarchive/libarchive_3.8.7.bb
@@ -31,6 +31,7 @@ EXTRA_OECONF += "--enable-largefile --without-iconv"
 
 SRC_URI = "https://libarchive.org/downloads/libarchive-${PV}.tar.gz \
            file://run-ptest \
+           file://CVE-2026-14164.patch \
           "
 UPSTREAM_CHECK_URI = "https://www.libarchive.org/"
 

