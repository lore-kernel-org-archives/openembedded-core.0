Return-Path: <ross.burton@intel.com>
Received: from mail-wm0-f41.google.com (mail-wm0-f41.google.com [74.125.82.41])
	by mail.openembedded.org (Postfix) with ESMTP id 2E3517858F
	for <openembedded-core@lists.openembedded.org>;
	Mon, 31 Jul 2017 14:53:20 +0000 (UTC)
Received: by mail-wm0-f41.google.com with SMTP id m85so78282124wma.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 31 Jul 2017 07:53:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id;
	bh=aAA7bB5ryK0pJnDd04fb/t/olurSbOqMJNGiDbO8TL0=;
	b=gHXkUTSnNxF1uFPjiTnw3lfVCp/ZpwkxGGZNIo1YecHVXw7bYdP+xOtoWrtYwg0IEQ
	G4O1ImI6bcfBswz/HqfFSD0zLDEG7kr7/8vRugkX2o9Ujfw7138+StUJI97hC66VE6OE
	07dwlbbQGoEQ0BkJFBJbfxIw1lKkLsHl0PBzS1twDnHMnVz6Cdq0anT40MNxO2g+rtvT
	aHAnKNZ/9y2/aHPDoE6Dup8DLEvUxUCc56/t6KNXDPuq14Ozi1kvXDRqewwy7EEnUSF8
	sS9z/16AVVRdRmht2Ax8+IBwUvHCSpzuIRugFGNUIcl6Gg8GlhUSCpYB3Vw6FXGqLw2D
	PLpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=aAA7bB5ryK0pJnDd04fb/t/olurSbOqMJNGiDbO8TL0=;
	b=s2aoXrnD69VF9yKlGq5u7jwCHl8IErEKBqbzOwlWGtVifzwlDfBXZxBL7xM9kgjoCy
	1zKI3jep1tjUFwl6d9DuDQwjiQ8zh2Y2xcS1+D6a3lbABu+DKY4oBlQKosVJ2uTyN+51
	LbDJrjT5RZxQjnanndRUKpyNBH/TBHCwfp3rFbFEnH8jUMG7x4aLeukz18RCcB4Kt5kR
	CW822TSNW56AD194CRRaGgD/z5Q8jXtVoNzx6tdC270O4LPCoTvnHOBAw0F8UWdqC0/4
	7pG9qo4T7AEXzDDOTo3JJMCU1dHnoELjtxfa1uMqRr6bbhT4JgMGrjwp3Oc+kUGEIOlM
	QMGQ==
X-Gm-Message-State: AIVw1132mk6LDcMwjj2bOUWg802Sp8vIaVOdlILG6n9Wpy7GE/zXWo+H
	qnDEI3rfaSJk5i46Fbk=
X-Received: by 10.28.186.198 with SMTP id k189mr11233777wmf.181.1501512801655; 
	Mon, 31 Jul 2017 07:53:21 -0700 (PDT)
Received: from flashheart.burtonini.com (home.burtonini.com. [81.2.106.35])
	by smtp.gmail.com with ESMTPSA id
	y73sm1028474wmh.46.2017.07.31.07.53.20
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 31 Jul 2017 07:53:20 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 31 Jul 2017 15:53:16 +0100
Message-Id: <20170731145316.31565-1-ross.burton@intel.com>
X-Mailer: git-send-email 2.11.0
Subject: [PATCH] re2c: fix build race
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
X-List-Received-Date: Mon, 31 Jul 2017 14:53:21 -0000

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-support/re2c/re2c/mkdir.patch | 28 ++++++++++++++++++++++++++++
 meta/recipes-support/re2c/re2c_0.16.bb     |  2 +-
 2 files changed, 29 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-support/re2c/re2c/mkdir.patch

diff --git a/meta/recipes-support/re2c/re2c/mkdir.patch b/meta/recipes-support/re2c/re2c/mkdir.patch
new file mode 100644
index 00000000000..da582942dd7
--- /dev/null
+++ b/meta/recipes-support/re2c/re2c/mkdir.patch
@@ -0,0 +1,28 @@
+Upstream-Status: Submitted (https://github.com/skvadrik/re2c/pull/191)
+Signed-off-by: Ross Burton <ross.burton@intel.com>
+
+From bccc10c60523f88c8f81413151cdcd612eb16198 Mon Sep 17 00:00:00 2001
+From: Ross Burton <ross.burton@intel.com>
+Date: Mon, 31 Jul 2017 15:43:41 +0100
+Subject: [PATCH] Makefile.am: create target directory before writing into it
+
+In some situations src/parse/ may not exist before a file is copied into the
+directory. Ensure that this doesn't happen by creating the directory first.
+---
+ re2c/Makefile.am | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/re2c/Makefile.am b/re2c/Makefile.am
+index 3b3b2c5e..2ff58c19 100644
+--- a/Makefile.am
++++ b/Makefile.am
+@@ -211,6 +211,7 @@ $(BOOTSTRAP_PARSER): $(CUSTOM_PARSER)
+ 		$(top_srcdir)/$(CUSTOM_PARSER);
+ 
+ .re.cc:
++	$(AM_V_at)$(MKDIR_P) $(dir $@)
+ 	$(AM_V_GEN) if test -x $(RE2C); \
+ 	then \
+ 		$(top_builddir)/$(RE2C) $(RE2CFLAGS) -o $@ $< && \
+-- 
+2.11.0
diff --git a/meta/recipes-support/re2c/re2c_0.16.bb b/meta/recipes-support/re2c/re2c_0.16.bb
index e82502c5f2d..50dd7b7d261 100644
--- a/meta/recipes-support/re2c/re2c_0.16.bb
+++ b/meta/recipes-support/re2c/re2c_0.16.bb
@@ -6,7 +6,7 @@ LICENSE = "PD"
 LIC_FILES_CHKSUM = "file://README;beginline=146;md5=881056c9add17f8019ccd8c382ba963a"
 
 SRC_URI = "${SOURCEFORGE_MIRROR}/${BPN}/${BPN}-${PV}.tar.gz \
-"
+           file://mkdir.patch"
 SRC_URI[md5sum] = "3bf508fabd52ed7334647d0ccb956e8d"
 SRC_URI[sha256sum] = "48c12564297641cceb5ff05aead57f28118db6277f31e2262437feba89069e84"
 
-- 
2.11.0


