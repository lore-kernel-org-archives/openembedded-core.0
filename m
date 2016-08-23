Return-Path: <ulfalizer@gmail.com>
Received: from mail-wm0-f67.google.com (mail-wm0-f67.google.com [74.125.82.67])
	by mail.openembedded.org (Postfix) with ESMTP id C07A8731B3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 23 Aug 2016 21:02:16 +0000 (UTC)
Received: by mail-wm0-f67.google.com with SMTP id i5so19710534wmg.2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 23 Aug 2016 14:02:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=ANr+lyFZiI7o+gwMdDv7ZZtoth8ZDDq11aqgbm+LHk8=;
	b=g8NeKCxj1tgcwWzqAZ/XpeoQsnG9fE2xl9nMza6wXkx8T9sjfLHP48MtwvyRiPd7yd
	F+s5tEuM6Bhb7nI3pGtOmNqu9QlyRDoXhJJZKA8rgGcquZPxGpfaw4EadyYzrk95r0d0
	7NFowdis+h+yVF/AZ8BxK2c0ffqIIn0ADMRrGpt9O2XAuSEbdqMFOLZUnlRZHd8iJIhi
	3xTH4KDOLwNbUbF/vTjPSWDv3NmPx8qfe+PSam0/C5jqW6eUE2j52ZNCOY0PkOopMww1
	4ljSjBVyuE/XP/VcasU/AgJx0M0fVmx+4JQ2kXFtg9EPtrHLPZj54iG7I5igtqkh4cYr
	mQAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=ANr+lyFZiI7o+gwMdDv7ZZtoth8ZDDq11aqgbm+LHk8=;
	b=XhoG5xZlwCLlMukFFZChUX0hdQRUZyj2KvPjpo2Vaj74TPFm/GEW+PIB6NVxgMHjEU
	AqMIwEHf5blUHyGSYotNIez2NOaFQnSFcpb/ZqnBMx21ZuRc3TokJ01T/5kKJ5F1wwhP
	Mdteq0Dn1cvcP7bDCZrqoVhtcWZcFa5lTZ0z2owrpVjos3rIAO3sx7TTy2rYfY9cMIlY
	sfCKstuYkXfg5d3tfFbBUj0EHNl5B5qtPoEbYxll9uqQOui/huiXb/zvwOalAZwTEnok
	WBh9JoaWSFAdrpU2W/5bcJWWJU2CMeRmSd1PzVNPDt0MqKlmsoNZ4KAJtemcLh1oTo3o
	ateA==
X-Gm-Message-State: AEkoousFizltMqDdRfLZBWGPBE9KrfHGfvwGV0zEMQwGUj6fVseq4POFX9CVcXvfcfJDEg==
X-Received: by 10.28.226.85 with SMTP id z82mr22221968wmg.101.1471986136866;
	Tue, 23 Aug 2016 14:02:16 -0700 (PDT)
Received: from huvuddator.home (ip5f5bfeda.dynamic.kabel-deutschland.de.
	[95.91.254.218]) by smtp.gmail.com with ESMTPSA id
	v134sm29611957wmf.10.2016.08.23.14.02.16
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 23 Aug 2016 14:02:16 -0700 (PDT)
From: Ulf Magnusson <ulfalizer@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 23 Aug 2016 23:02:08 +0200
Message-Id: <1471986128-8054-2-git-send-email-ulfalizer@gmail.com>
X-Mailer: git-send-email 2.5.0
In-Reply-To: <1471986128-8054-1-git-send-email-ulfalizer@gmail.com>
References: <1471986128-8054-1-git-send-email-ulfalizer@gmail.com>
Subject: [PATCH v4 1/1] useradd.bblass: Simplify target overrides
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
X-List-Received-Date: Tue, 23 Aug 2016 21:02:17 -0000

The current style might be a leftover from when _class-target did not
exist.

Also change the assignment to SSTATECLEANFUNCS to an append, which makes
more sense. useradd.bbclass is the only user of SSTATECLEANFUNCS as of
writing, so it won't make any functional difference.

Signed-off-by: Ulf Magnusson <ulfalizer@gmail.com>
---
 meta/classes/useradd.bbclass | 32 +++++++++-----------------------
 1 file changed, 9 insertions(+), 23 deletions(-)

diff --git a/meta/classes/useradd.bbclass b/meta/classes/useradd.bbclass
index 8d51fb5..e24b1c5 100644
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
@@ -157,28 +153,18 @@ if test "x${STAGING_DIR_TARGET}" != "x"; then
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
+USERADDSETSCENEDEPS = ""
 
 # Recipe parse-time sanity checks
 def update_useradd_after_parse(d):
-- 
2.5.0


