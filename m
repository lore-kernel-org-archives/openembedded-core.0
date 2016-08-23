Return-Path: <ulfalizer@gmail.com>
Received: from mail-wm0-f67.google.com (mail-wm0-f67.google.com [74.125.82.67])
	by mail.openembedded.org (Postfix) with ESMTP id D528D6E660
	for <openembedded-core@lists.openembedded.org>;
	Tue, 23 Aug 2016 20:31:10 +0000 (UTC)
Received: by mail-wm0-f67.google.com with SMTP id o80so19643317wme.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 23 Aug 2016 13:31:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=pCRL13wJtSiplXc2i/OSArgUZwfvWVgkZVgPKIgEUgw=;
	b=W11mfp9WzVOrlb+NvDVmamcdhBAfYIyn2oHNoxwIZ5RMkyIlcBhv15hjC1TJFmJeEf
	DDsTlxlkSkgsg9kbjrpNXgrjMsxvZYcpRrJ6ngGMtFs1Rbp2fAENgatOFQbV6UhfHnk0
	oPql2edYz+atKd5H4QpiQeQ0lfi1cIU7IpjFQ+aK7YECvsQzhTITZh0GSKmB6irdRR1Q
	x1hE8Py4B5UIfrapGsRo5yhNpkk0KcscIjoFEcofeT9TGKihmdcx0qt+fL2xVCcjC9tx
	2qMGxEpH9Sae0BuBPfreAf5mOkg+KZauszMHga5ehpn8Z4evdxz9cwdwMoTMGPIlyGU4
	gPEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=pCRL13wJtSiplXc2i/OSArgUZwfvWVgkZVgPKIgEUgw=;
	b=GyoHNX1O9IIEayiEb5AcarKSEPDZv2dG4tBa9s2BmHo55V1Tvk+pLmkoAsvjF50p28
	sxg1lYfKvLGNC7R6QEfLETk/U5Q6UIcb/V3E+WUzXHTMKWFitcSYeMfX0n2U7aaNAlsj
	gQWwi7xaPPXn7IHnDiZBCRipLUapDUFrfZwvmcW/+fxS32VEMDPXth9e835sfdBETD/o
	E1NxFAbCH8ZzocLJ0xdAJUHEnlmLAjfE5XbgRveR3SvmaSIwgsOjYkvVkP6LrpToCtAg
	DRSnJiV3rzcv2L5ZC/Eu5BWRXMb8VVs1vsVWvSMmoXHzlsdAnC738i4mRhwzcr3eKNaO
	nf3A==
X-Gm-Message-State: AEkoousPM0RYZDpQXKsyo1vIaK+toTR6aDraThSEbO7eryxmMLKTAKNQ4CCV/YseGuFR5g==
X-Received: by 10.28.88.144 with SMTP id m138mr20432896wmb.79.1471984270785;
	Tue, 23 Aug 2016 13:31:10 -0700 (PDT)
Received: from huvuddator.home (ip5f5bfeda.dynamic.kabel-deutschland.de.
	[95.91.254.218])
	by smtp.gmail.com with ESMTPSA id i1sm5769635wjf.12.2016.08.23.13.31.09
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 23 Aug 2016 13:31:09 -0700 (PDT)
From: Ulf Magnusson <ulfalizer@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 23 Aug 2016 22:30:48 +0200
Message-Id: <1471984248-6943-1-git-send-email-ulfalizer@gmail.com>
X-Mailer: git-send-email 2.5.0
Subject: [PATCH v2] useradd.bblass: Simplify target overrides
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
X-List-Received-Date: Tue, 23 Aug 2016 20:31:12 -0000

The current style might be a leftover from when _class-target did not
exist.

Also change the assignment to SSTATECLEANFUNCS to an append, which makes
more sense. useradd.bbclass is the only user of SSTATECLEANFUNCS as of
writing, so it won't make any functional difference.
---
 meta/classes/useradd.bbclass | 31 ++++++++-----------------------
 1 file changed, 8 insertions(+), 23 deletions(-)

diff --git a/meta/classes/useradd.bbclass b/meta/classes/useradd.bbclass
index 8d51fb5..25526ef 100644
--- a/meta/classes/useradd.bbclass
+++ b/meta/classes/useradd.bbclass
@@ -3,11 +3,7 @@ inherit useradd_base
 # base-passwd-cross provides the default passwd and group files in the
 # target sysroot, and shadow -native and -sysroot provide the utilities
 # and support files needed to add and modify user and group accounts
-DEPENDS_append = "${USERADDDEPENDS}"
-USERADDDEPENDS = " base-files shadow-native shadow-sysroot shadow"
-USERADDDEPENDS_class-cross = ""
-USERADDDEPENDS_class-native = ""
-USERADDDEPENDS_class-nativesdk = ""
+DEPENDS_append_class-target = " base-files shadow-native shadow-sysroot shadow"
 
 # This preinstall function can be run in four different contexts:
 #
@@ -157,28 +153,17 @@ if test "x${STAGING_DIR_TARGET}" != "x"; then
 fi
 }
 
-SSTATECLEANFUNCS = "userdel_sysroot_sstate"
-SSTATECLEANFUNCS_class-cross = ""
-SSTATECLEANFUNCS_class-native = ""
-SSTATECLEANFUNCS_class-nativesdk = ""
+SSTATECLEANFUNCS_append_class-target = " userdel_sysroot_sstate"
 
 do_install[prefuncs] += "${SYSROOTFUNC}"
-SYSROOTFUNC = "useradd_sysroot"
-SYSROOTFUNC_class-cross = ""
-SYSROOTFUNC_class-native = ""
-SYSROOTFUNC_class-nativesdk = ""
-SSTATEPREINSTFUNCS += "${SYSROOTPOSTFUNC}"
-SYSROOTPOSTFUNC = "useradd_sysroot_sstate"
-SYSROOTPOSTFUNC_class-cross = ""
-SYSROOTPOSTFUNC_class-native = ""
-SYSROOTPOSTFUNC_class-nativesdk = ""
-
-USERADDSETSCENEDEPS = "${MLPREFIX}base-passwd:do_populate_sysroot_setscene pseudo-native:do_populate_sysroot_setscene shadow-native:do_populate_sysroot_setscene ${MLPREFIX}shadow-sysroot:do_populate_sysroot_setscene"
-USERADDSETSCENEDEPS_class-cross = ""
-USERADDSETSCENEDEPS_class-native = ""
-USERADDSETSCENEDEPS_class-nativesdk = ""
+SYSROOTFUNC_class-target = "useradd_sysroot"
+SYSROOTFUNC = ""
+
+SSTATEPREINSTFUNCS_append_class-target = " useradd_sysroot_sstate"
+
 do_package_setscene[depends] += "${USERADDSETSCENEDEPS}"
 do_populate_sysroot_setscene[depends] += "${USERADDSETSCENEDEPS}"
+USERADDSETSCENEDEPS_class-target = "${MLPREFIX}base-passwd:do_populate_sysroot_setscene pseudo-native:do_populate_sysroot_setscene shadow-native:do_populate_sysroot_setscene ${MLPREFIX}shadow-sysroot:do_populate_sysroot_setscene"
 
 # Recipe parse-time sanity checks
 def update_useradd_after_parse(d):
-- 
2.5.0


