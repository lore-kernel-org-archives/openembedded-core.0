Return-Path: <ross.burton@intel.com>
Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com
	[209.85.215.174])
	by mail.openembedded.org (Postfix) with ESMTP id D98847DF84
	for <openembedded-core@lists.openembedded.org>;
	Fri, 17 May 2019 22:49:06 +0000 (UTC)
Received: by mail-pg1-f174.google.com with SMTP id i21so3932415pgi.12
	for <openembedded-core@lists.openembedded.org>;
	Fri, 17 May 2019 15:49:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=a4RpvoDG91oue+ZpGvhXtVjzqC0PzdZfM0vUyMmi9qM=;
	b=RziiYO8CvKa5k3aytkxVIsrNCZ47jDjPoZ28qa94nZ8sqzBgbNUCcVLn1l+RB6wwju
	bgIkKiNCbmmeMSX4UKfwLyYDHyZs4JqTz4K9aXL0fLlVfA3HbhyNKvR7+j1a9n9ysAsM
	Oy7SMKYtBFMfAoy/AUZQHUUmaeOzi1GCTRI/JbdnBB3pIpHMAx5lOLeNUUzd1cP5iD7G
	/gHX0DsUcG+KCnBYS0WX6QjH5drfBfG/y+JWKdA5++GQaqQq74tet8PidrDqVqAjJzbR
	RkE0JVmmUgEpyxHP36EOAzfOODuHn66nS+GwrxqastmH5WIGDUmqbyipICvR/UvX388y
	9kDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=a4RpvoDG91oue+ZpGvhXtVjzqC0PzdZfM0vUyMmi9qM=;
	b=hF4e4jcdyfl2g3IJwnMSxtZDfxyeuhxTHFReSRxWzVI6H8LqF3t10pUGX79th0DXth
	xD9Sw36fW5kQi6AiSMgll2kj8KEivmlC91WdFPv1GNZJoITLuOyibYQZbhUvezjz+Wtp
	v77fbiCnLmbMYqNXv3Shyr2qor/hCINZGvyPuQOYMdrHnyQfNpkwX9xOuY/EpdSz53TW
	3Vz5LCaJSlvlG3hFcHAhRr9a2pW1EwbD8QgVHd2YEkDxKizxgoakGXC+7vCQBQdS5bUL
	DIF4a7EGtrOd0Dm5Jjh40g3j2Sb7GVQ+bgkvzhkF7JtayybQdK4FFXx+3zGpMzygHiFm
	82sQ==
X-Gm-Message-State: APjAAAVU8JhTR3pMZf3O4cp1OgtzF6ZY30FX2mzkjpwWQY5b2ClaHB0j
	k9m+CCNU2UghMIzacQII+vDVRkqkpeI=
X-Google-Smtp-Source: APXvYqyc0fQRhb6CBye8hTaMLiCsgG0bY0ggYF3+BbbSTBBOBUhhm6FC3br1V/6B+cGgt2rJoqEb2w==
X-Received: by 2002:a62:198e:: with SMTP id 136mr45245391pfz.180.1558133347606;
	Fri, 17 May 2019 15:49:07 -0700 (PDT)
Received: from blackadder.jf.intel.com (jfdmzpr05-ext.jf.intel.com.
	[134.134.139.74]) by smtp.gmail.com with ESMTPSA id
	a6sm12024913pgd.67.2019.05.17.15.49.04
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 17 May 2019 15:49:05 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 17 May 2019 15:48:59 -0700
Message-Id: <20190517224859.8270-1-ross.burton@intel.com>
X-Mailer: git-send-email 2.20.1 (Apple Git-117)
MIME-Version: 1.0
Subject: [PATCH] insane: add sanity checks to SRC_URI
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
X-List-Received-Date: Fri, 17 May 2019 22:49:07 -0000
Content-Transfer-Encoding: 8bit

The SRC_URI almost definitely shouldn't be using ${BPN}, and GitHub */archive/*
tarballs are dynamically generated so the checksums will change over time.

Detect both of these, and emit a QA warning if found.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/classes/insane.bbclass | 13 ++++++++++++-
 1 file changed, 12 insertions(+), 1 deletion(-)

diff --git a/meta/classes/insane.bbclass b/meta/classes/insane.bbclass
index 9ca5aefe544..59bb8be5470 100644
--- a/meta/classes/insane.bbclass
+++ b/meta/classes/insane.bbclass
@@ -25,7 +25,7 @@ QA_SANE = "True"
 WARN_QA ?= "ldflags useless-rpaths rpaths staticdev libdir xorg-driver-abi \
             textrel already-stripped incompatible-license files-invalid \
             installed-vs-shipped compile-host-path install-host-path \
-            pn-overrides infodir build-deps \
+            pn-overrides infodir build-deps src-uri-bad \
             unknown-configure-option symlink-to-sysroot multilib \
             invalid-packageconfig host-user-contaminated uppercase-pn patch-fuzz \
             "
@@ -898,6 +898,17 @@ def package_qa_check_host_user(path, name, d, elf, messages):
             return False
     return True
 
+QARECIPETEST[src-uri-bad] = "package_qa_check_src_uri"
+def package_qa_check_src_uri(pn, d, messages):
+    import re
+
+    if "${PN}" in d.getVar("SRC_URI", False):
+        package_qa_handle_error("src-uri-bad", "%s: SRC_URI uses PN not BPN" % pn, d)
+
+    pn = d.getVar("SRC_URI")
+    if re.search(r"github\.com/.+/.+/archive/.+", pn):
+        package_qa_handle_error("src-uri-bad", "%s: SRC_URI uses unstable GitHub archives" % pn, d)
+
 
 # The PACKAGE FUNC to scan each package
 python do_package_qa () {
-- 
2.20.1 (Apple Git-117)


