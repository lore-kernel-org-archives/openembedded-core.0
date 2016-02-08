Return-Path: <ross.burton@intel.com>
Received: from mail-wm0-f52.google.com (mail-wm0-f52.google.com [74.125.82.52])
	by mail.openembedded.org (Postfix) with ESMTP id E4B3F6FFC8
	for <openembedded-core@lists.openembedded.org>;
	Mon,  8 Feb 2016 22:45:59 +0000 (UTC)
Received: by mail-wm0-f52.google.com with SMTP id g62so153852wme.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 08 Feb 2016 14:46:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id;
	bh=EqFQM2DPtBdl7h9+3JnzkyynPJzomcCYYSUXThfvNa8=;
	b=byYfJmIDwie3Y/6InMGMnbhZLN/3dv/5QcUkUIpwE1yE0KECgGI0oPnsv5sVlOtaDm
	mBrcG6f+y+M9JrW0OxIL0Fjpc/EIhQiwViFIm9SZZh1Zry9oFZxA2tvEnjRF6LJJVHRg
	UsrWcUACZqJFfxEhsUmqt5U1uKH9KlmwgglNvSBMobM5jaeXxmahyNef+MjDqK/Rnnvb
	a2Tn/ca6ZxMlLosgcLOyJBY6xmvTvY9f5S+1HJS6oHYlN09+YyrhJvvCD0RPymhaGGFL
	Gie/ZhSBhwAHbPoQSgPJuaPCN2Dnd+gb92nscoKqcaFzFkpRUvOgn3q4bPafIj3XQslk
	H2lA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=EqFQM2DPtBdl7h9+3JnzkyynPJzomcCYYSUXThfvNa8=;
	b=RoIMWXEBwg2F+dmy29VGkWZRsl5YzumwlvziOeS/FFoE2o7GsLn5Ux2cpq3SpM9phx
	tmtsDGj6VZ8dwMOllpEk2MyKDzNWSFlkrI0lZZLcKvEFsuiD6Ijh2oek5J3tZ4V0SU7T
	pjRHd8mtXr7JOwvClNTXvbI9Wg/my7f0qN8DVMMMB8gdwCv/zNNpYuRIPIGnWV98SXSa
	TTzbWuVDdmNJWvmEJ7GJtCTamuqr36+3dUaU85ub4yZzwtcSNdKRG5c7hh2lloTsG/Ug
	mr4RKguYkpu2EQvsliQCGeeQ99ZbI2U6+6tiRb5Qnj8PP/7sKtkw149w+Njd+RplZncJ
	oxGQ==
X-Gm-Message-State: AG10YOQi+/3i3YQz2eMi1Akt7HSxDFRCVbPEt4wDGROoG6QPRBNxCAKvp+8axXAcRPluDOu+
X-Received: by 10.28.132.146 with SMTP id g140mr1168559wmd.49.1454971559652;
	Mon, 08 Feb 2016 14:45:59 -0800 (PST)
Received: from flashheart.burtonini.com (home.burtonini.com. [81.2.106.35])
	by smtp.gmail.com with ESMTPSA id
	193sm14661553wmg.16.2016.02.08.14.45.58
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 08 Feb 2016 14:45:59 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  8 Feb 2016 22:45:56 +0000
Message-Id: <1454971556-27794-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 2.7.0
Subject: [PATCH] tune-corei7.inc: tell qemu to emulate a matching processor
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 08 Feb 2016 22:46:00 -0000

If tune-corei7 is in use then the target binaries may contain instructions that
qemu-x86-64 can't execute by default, resulting in errors on rootfs construction:

NOTE: Running intercept scripts:
NOTE: > Executing update_font_cache intercept ...
qemu: uncaught target signal 4 (Illegal instruction) - core dumped

In this case the instruction is popcnt, part of SSE4.2, so tell Qemu to emulate
the CPU that the tune targets (in this case, Nehalem). Also pass check=false as
the Nehalem machine supports VME but user-space qemu doesn't, which produces a
warning unless CPUID checking is disabled.

[ YOCTO #8888 ]

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/conf/machine/include/tune-corei7.inc | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta/conf/machine/include/tune-corei7.inc b/meta/conf/machine/include/tune-corei7.inc
index d245d9f..153a21b 100644
--- a/meta/conf/machine/include/tune-corei7.inc
+++ b/meta/conf/machine/include/tune-corei7.inc
@@ -11,6 +11,7 @@ DEFAULTTUNE ?= "corei7-64"
 # Pull in the previous tune in to pull in PACKAGE_EXTRA_ARCHS
 require conf/machine/include/tune-core2.inc
 
+
 # Extra tune features
 TUNEVALID[corei7] = "Enable corei7 specific processor optimizations"
 TUNE_CCARGS .= "${@bb.utils.contains('TUNE_FEATURES', 'corei7', ' -march=corei7 -mtune=corei7 -mfpmath=sse -msse4.2', '', d)}"
@@ -21,15 +22,18 @@ TUNE_FEATURES_tune-corei7-32 = "${TUNE_FEATURES_tune-x86} corei7"
 BASE_LIB_tune-corei7-32 = "lib"
 TUNE_PKGARCH_tune-corei7-32 = "corei7-32"
 PACKAGE_EXTRA_ARCHS_tune-corei7-32 = "${PACKAGE_EXTRA_ARCHS_tune-core2} corei7-32"
+QEMU_EXTRAOPTIONS_corei7-32 = " -cpu Nehalem,check=false"
 
 AVAILTUNES += "corei7-64"
 TUNE_FEATURES_tune-corei7-64 = "${TUNE_FEATURES_tune-x86-64} corei7"
 BASE_LIB_tune-corei7-64 = "lib64"
 TUNE_PKGARCH_tune-corei7-64 = "corei7-64"
 PACKAGE_EXTRA_ARCHS_tune-corei7-64 = "${PACKAGE_EXTRA_ARCHS_tune-core2-64} corei7-64"
+QEMU_EXTRAOPTIONS_corei7-64 = " -cpu Nehalem,check=false"
 
 AVAILTUNES += "corei7-64-x32"
 TUNE_FEATURES_tune-corei7-64-x32 = "${TUNE_FEATURES_tune-x86-64-x32} corei7"
 BASE_LIB_tune-corei7-64-x32 = "libx32"
 TUNE_PKGARCH_tune-corei7-64-x32 = "corei7-64-x32"
 PACKAGE_EXTRA_ARCHS_tune-corei7-64-x32 = "${PACKAGE_EXTRA_ARCHS_tune-core2-64-x32} corei7-64-x32"
+QEMU_EXTRAOPTIONS_corei7-64-x32 = " -cpu Nehalem,check=false"
-- 
2.7.0


