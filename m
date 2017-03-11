Return-Path: <armccurdy@gmail.com>
Received: from mail-pg0-f67.google.com (mail-pg0-f67.google.com [74.125.83.67])
	by mail.openembedded.org (Postfix) with ESMTP id D484E77552
	for <openembedded-core@lists.openembedded.org>;
	Sat, 11 Mar 2017 01:31:39 +0000 (UTC)
Received: by mail-pg0-f67.google.com with SMTP id 77so11906117pgc.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 10 Mar 2017 17:31:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=3NBQfzSe1Bw5Ba2CE/t2Q5AibODjC8ZPlJEBUh8/i0M=;
	b=myiPA/ljlqI2e9dycotg227Hm0QTZGhj1mM/eLi1LGiIWoMXRotkF/g0Bo+nYOS1yI
	QKKzubDv9ILXwrs1btN92UHUW2Dn0SexuYnnbOLamwKlzeRN8FuWoNMKwA9KoJaUbQ4y
	gLAFnNaV1z+OXuWG969Ock7xbx9LdX0P/1rwqMkksOTp7sSzQYK3lf2XFOmV+IDJw6Q+
	MkkBEWhXJR3Ohn254Cmt78M8xvFdCx3yNxyyXphRjBdSsy49ziz3XzeuwEjqQKer9x5O
	5fO4FgOif+PgEIBmp9sbLg3BdRWE2f/Q4fZigsrTiktAC6DbAvuQtpZHGBMpP4/cp2HS
	CPkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=3NBQfzSe1Bw5Ba2CE/t2Q5AibODjC8ZPlJEBUh8/i0M=;
	b=lyazoQqikxw48oqpvtXPEKWKco39aTharcp+D2qe8PvmkjRYx3jbcVAcNe4kQf7cda
	cioJcPD3PelLz/+nS86+lqqfQkYu7LhS3oZLV3P2MgD51PasFJoYr9mETOP6+ZiKFj2z
	mX5kw+MPf/eI82RWydeDSgxLmohg9MZGlVUoihys9yqGLz13WfIXVtlkID9tW4zcQ8Rp
	w2YQKHpGrnT6q/4eJyAA8cjWNHWrCoS5uy2btkX8k4taq4gMhX6MTBn6yS+HWQ1WlQ0b
	0T1XO+q+RUV9WjyCoQTgU96rtSYfZK6/gjm+N5JSiJfY5UmSaAr6l4d17BIWkkjHl/EA
	smhQ==
X-Gm-Message-State: AMke39l0eHOMyquhdSt9wcblPYF1pk/4qR0YjzrqSaaN8O+fPStbq/ZUfNkZGRQiSii/EA==
X-Received: by 10.84.241.203 with SMTP id t11mr30066424plm.48.1489195900859;
	Fri, 10 Mar 2017 17:31:40 -0800 (PST)
Received: from e6520.cablelabs.com
	(50-204-102-64-static.hfc.comcastbusiness.net. [50.204.102.64])
	by smtp.gmail.com with ESMTPSA id
	a78sm20797149pfc.25.2017.03.10.17.31.38
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 10 Mar 2017 17:31:39 -0800 (PST)
From: Andre McCurdy <armccurdy@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 10 Mar 2017 17:31:19 -0800
Message-Id: <1489195879-5397-1-git-send-email-armccurdy@gmail.com>
X-Mailer: git-send-email 1.9.1
Subject: [PATCH] feature-arm-thumb.inc: fix ARM_THUMB_SUFFIX for armv8
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
X-List-Received-Date: Sat, 11 Mar 2017 01:31:40 -0000

The current definition for ARM_THUMB_SUFFIX doesn't consider armv8
and will therefore cause TUNE_PKGARCH to be set incorrectly for
machines which inherit arch-armv8 and don't include aarch64 in
TUNE_FEATURES (ie when building for 32bit ARMv8).

Also fix typo in comments and improve TUNEVALID[thumb] wording.

Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
---
 meta/conf/machine/include/arm/feature-arm-thumb.inc | 17 +++++++----------
 1 file changed, 7 insertions(+), 10 deletions(-)

diff --git a/meta/conf/machine/include/arm/feature-arm-thumb.inc b/meta/conf/machine/include/arm/feature-arm-thumb.inc
index 6d4747b..0b47cca 100644
--- a/meta/conf/machine/include/arm/feature-arm-thumb.inc
+++ b/meta/conf/machine/include/arm/feature-arm-thumb.inc
@@ -1,17 +1,14 @@
-TUNEVALID[thumb] = "Use thumb instructions instead of ARM"
-ARM_THUMB_OPT = "${@['arm', 'thumb'][d.getVar('ARM_INSTRUCTION_SET') == 'thumb']}"
-ARM_THUMB_SUFFIX .= "${@bb.utils.contains('TUNE_FEATURES', 'armv4',  't',  '', d)}"
-ARM_THUMB_SUFFIX .= "${@bb.utils.contains('TUNE_FEATURES', 'armv5',  't',  '', d)}"
-ARM_THUMB_SUFFIX .= "${@bb.utils.contains('TUNE_FEATURES', 'armv6',  't',  '', d)}"
-ARM_THUMB_SUFFIX .= "${@bb.utils.contains('TUNE_FEATURES', 'armv7a', 't2', '', d)}"
-ARM_THUMB_SUFFIX .= "${@bb.utils.contains('TUNE_FEATURES', 'armv7r', 't2', '', d)}"
-ARM_THUMB_SUFFIX .= "${@bb.utils.contains('TUNE_FEATURES', 'armv7m', 't2', '', d)}"
-ARM_THUMB_SUFFIX .= "${@bb.utils.contains('TUNE_FEATURES', 'armv7ve', 't2', '', d)}"
+
+TUNEVALID[thumb] = "Support Thumb instructions"
+
+ARM_THUMB_SUFFIX = "${@bb.utils.contains_any('TUNE_FEATURES', 'armv4 armv5 armv6', 't', 't2', d)}"
 
 # If the device supports ARM, then respect ARM_THUMB_OPT (which can be "arm" or "thumb")
-# If the defice doesn't support ARM, then always set "thumb" even when
+# If the device doesn't support ARM, then always set "thumb" even when
 # some recipe explicitly sets ARM_INSTRUCTION_SET to "arm"
+ARM_THUMB_OPT = "${@['arm', 'thumb'][d.getVar('ARM_INSTRUCTION_SET') == 'thumb']}"
 ARM_M_OPT = "${@bb.utils.contains('TUNE_FEATURES', 'arm', '${ARM_THUMB_OPT}', 'thumb', d)}"
+
 python () {
     if bb.utils.contains('TUNE_FEATURES', 'thumb', False, True, d):
         return
-- 
1.9.1


