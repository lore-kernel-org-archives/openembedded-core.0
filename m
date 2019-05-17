Return-Path: <ross.burton@intel.com>
Received: from mail-pg1-f193.google.com (mail-pg1-f193.google.com
	[209.85.215.193])
	by mail.openembedded.org (Postfix) with ESMTP id DF3097CFF8
	for <openembedded-core@lists.openembedded.org>;
	Fri, 17 May 2019 23:37:47 +0000 (UTC)
Received: by mail-pg1-f193.google.com with SMTP id 145so3981214pgg.9
	for <openembedded-core@lists.openembedded.org>;
	Fri, 17 May 2019 16:37:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=dl5sliaXb7sIYiMQ6MQvajX5QPzo2QhReiOI0mJxMlU=;
	b=Hb5Z0zBx0taasZwdg4fLE4tX2m3/NLkindKEfA4FPMeRVY+8Z7vdneGngkVhIN5Ayv
	QPDaZLVbBPC2n2VMaMX8g6CwuP/cdMPPxgcW5C+8sSozP/bPP0qw8b1f6C2Pw43n9col
	I2zGL9OKXohG/ydKCz9+DdAdLRJRy2lJr+r1YBOzjSa2MG+vZFA5/vw0MXyqVMMUHhcR
	x4k0+L/MF5gJt4dKsVW1vd6FBhDt/XpA0E0wuh9hCxDhFWOMkkaA5kUn5xAVhbDuir/6
	pLjiUwx7WM+whxKtuoI07PjsV7yA5wleQGA+Ugag/v7J0kBM2gHzpwW4an6Co3Zrg5J/
	5WfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=dl5sliaXb7sIYiMQ6MQvajX5QPzo2QhReiOI0mJxMlU=;
	b=MTSP/E6+1kPy33nuRJUzTTPhRsTaTDpQeQQyJ+AJxPX6FDENhWezMlcKMyUecdiU/m
	cvY2ZbEC6fvmZieEp9k5YmksDeiuQJ52FMpYniZS0innegmvg7eyK8lgFp5RBb96aojq
	q+gkrTif1gvqk4clPhZRsNm+IG6yFaEQYqEGprSuWuH/Dmr45aYSV979Hpiw6iqSMDg1
	v6PDbd/F6W2V2zeSSaYg/pU/BtrsZfwWlcSdm6IWZ2EfsvEmc989OJYhUvPgttXlK2r2
	Pz5Ffz+ObdxZlwwtTlA1NEDw3daXfcGGc34arAWCu7Vcv7oY4Migkc2RaN6YdRE+pNsy
	H8Jg==
X-Gm-Message-State: APjAAAVXetM8KZzTVhPkUJB8WRRAZNk8+NyCqSjn3bQ83d5OiGJX4PzA
	Ov2nredukOrCysJmvcJg5lbRkX7Ao20=
X-Google-Smtp-Source: APXvYqzmj+tkfTGt459AKpYjcsYJCGmsmNz3YK5xbGAowzMT/+iL+9kd66ZnHp17fFyM5HcfPO0i5A==
X-Received: by 2002:aa7:90ce:: with SMTP id k14mr62698461pfk.239.1558136268694;
	Fri, 17 May 2019 16:37:48 -0700 (PDT)
Received: from blackadder.jf.intel.com (fmdmzpr04-ext.fm.intel.com.
	[192.55.54.39]) by smtp.gmail.com with ESMTPSA id
	s18sm14734195pgg.64.2019.05.17.16.37.47
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 17 May 2019 16:37:47 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 17 May 2019 16:37:43 -0700
Message-Id: <20190517233743.9646-1-ross.burton@intel.com>
X-Mailer: git-send-email 2.20.1 (Apple Git-117)
MIME-Version: 1.0
Subject: [PATCH v2] insane: add sanity checks to SRC_URI
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
X-List-Received-Date: Fri, 17 May 2019 23:37:48 -0000
Content-Transfer-Encoding: 8bit

The SRC_URI almost definitely shouldn't be using ${PN}, and GitHub */archive/*
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


