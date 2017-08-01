Return-Path: <ross.burton@intel.com>
Received: from mail-wm0-f49.google.com (mail-wm0-f49.google.com [74.125.82.49])
	by mail.openembedded.org (Postfix) with ESMTP id 300FF60796
	for <openembedded-core@lists.openembedded.org>;
	Tue,  1 Aug 2017 09:25:24 +0000 (UTC)
Received: by mail-wm0-f49.google.com with SMTP id t201so8994209wmt.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 01 Aug 2017 02:25:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id;
	bh=+K0wS09NJoAooaxVLWbtvMfVPHHLP2MwStDnSn877y4=;
	b=iRwhtR+fvZ7aQma/BD+nwCD6PvjsmeOGj+7rA42iGb0bwfmfnrkJsXpiHJI1Yrisew
	gFU94tdhghgeBDMjIu6dMWbCnYp+h/SntduVQBJY3COsV4zMi5FrXb9Q8vQ+RbhUeHz0
	WmMrg92K+5X3GPy3blKbiWoycEATSVyA45uYO4T9SXu4hpOcDWgRPrhe2yE4VSTm0K2G
	Lm1Qt8RZr/LqQNs/i3PRrTWZ6GvRcQSOyHvF+6hjbieHkxBbutzezBbXD8VJeTW4OAt0
	kY30O/wzrgmRvZ5ji91I19x1/pDS21nIW1e9mRhmXhKln4gqdygVQyDpQJN5+JPfM2y/
	b9qA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=+K0wS09NJoAooaxVLWbtvMfVPHHLP2MwStDnSn877y4=;
	b=rFzeVZi5wCpNLA4O7F3xQKpujAesZt6OFDmSa9yKwE6qvoui02tFHXw3QHO8Zl0F5N
	krR4+pTZFYFmVdrL1UALmcFjIKGCV/x1OjQBWEVkUZroXfE2N4ryJUQdH90qAKHeIXQh
	Gef6N7asKtGqOB16NwCcUtYapZgn7+KTGCDcX58XnpXVoZ/eSzrTLoW2r6lX2pREGOCz
	ncikOuf5GQxkW+j9bvSNBfC6SoevGfKIPtMTt7WWLuEm7lAmQSRWfq7SWGN9yTj2kZUN
	lX8ayYlVm887TPQvT/TG9Ez7JXstpS0BjYa0+kkCVJ52F/B6fI4gw2h8Rn4rILhOh8dG
	Ub7g==
X-Gm-Message-State: AIVw110njQ7MW2E5zg8PZItyeEFv2VHF4jyWZRa1cFXQ3fO9aUnkizEL
	JOywsz+S+WcwU6j8J/g=
X-Received: by 10.28.196.71 with SMTP id u68mr979642wmf.18.1501579525356;
	Tue, 01 Aug 2017 02:25:25 -0700 (PDT)
Received: from flashheart.burtonini.com (home.burtonini.com. [81.2.106.35])
	by smtp.gmail.com with ESMTPSA id
	l25sm6495887wrb.44.2017.08.01.02.25.24
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 01 Aug 2017 02:25:24 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  1 Aug 2017 10:25:21 +0100
Message-Id: <20170801092521.16558-1-ross.burton@intel.com>
X-Mailer: git-send-email 2.11.0
Subject: [PATCH][V2] re2c: fix build race
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
X-List-Received-Date: Tue, 01 Aug 2017 09:25:25 -0000

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-support/re2c/re2c/mkdir.patch | 36 ++++++++++++++++++++++++++++++
 meta/recipes-support/re2c/re2c_0.16.bb     |  2 +-
 2 files changed, 37 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-support/re2c/re2c/mkdir.patch

diff --git a/meta/recipes-support/re2c/re2c/mkdir.patch b/meta/recipes-support/re2c/re2c/mkdir.patch
new file mode 100644
index 00000000000..d59f01b36c0
--- /dev/null
+++ b/meta/recipes-support/re2c/re2c/mkdir.patch
@@ -0,0 +1,36 @@
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
+index 3b3b2c5e..0707fc5a 100644
+--- a/Makefile.am
++++ b/Makefile.am
+@@ -187,6 +187,7 @@ CLEANFILES = \
+ 	$(DOC)
+ 
+ $(AUTOGEN_PARSER): $(CUSTOM_PARSER)
++	$(AM_V_at)$(MKDIR_P) $(dir $@)
+ 	$(AM_V_GEN) if test $(BISON) = "no"; \
+ 	then \
+ 		cp $(top_srcdir)/$(BOOTSTRAP_PARSER) $@ && \
+@@ -211,6 +212,7 @@ $(BOOTSTRAP_PARSER): $(CUSTOM_PARSER)
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


