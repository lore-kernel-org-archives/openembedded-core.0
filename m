Return-Path: <martin.jansa@gmail.com>
Received: from mail-ea0-f176.google.com (mail-ea0-f176.google.com
	[209.85.215.176])
	by mail.openembedded.org (Postfix) with ESMTP id 4F6CA615AB
	for <openembedded-core@lists.openembedded.org>;
	Fri,  1 Nov 2013 12:12:09 +0000 (UTC)
Received: by mail-ea0-f176.google.com with SMTP id q16so1978205ead.7
	for <openembedded-core@lists.openembedded.org>;
	Fri, 01 Nov 2013 05:12:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=/KzBcY9BlcNP+gvCgX9N9JA9Ocl7sH6tpjRR5tqaTLI=;
	b=fIUrBIhDWrD/8rxdoX56DQmO4rdUL3SLE54nt6L0YfCZ0P4aZDJOe7p5MDbVfQRLdx
	vyWl1y7+QbfdZ+YCobpcuiU3tBuQjdk8q3D63nxVrL1mxCbR8q4mxNxYv7NiVXtXhaLn
	J80nz2HRuv781ZRhTziO2B1IgeCYtAbf/Rfi5SKd1ifNRJ0tEGkeAGTnSH0+W3a3rzdi
	ajatjONF+WmXMuHBs3TzICCzGWlFKcTflJs+UL6WpJwcWKWJZH8RuHvfbz0kh2G7ctuJ
	PNPs3/ZBNh91aDaU1Mb2YNV23jdq461kgWhqNXZbB/3VQABibUsYuQYV6824AvEaKF9T
	1aiA==
X-Received: by 10.14.212.72 with SMTP id x48mr2766791eeo.0.1383307930791;
	Fri, 01 Nov 2013 05:12:10 -0700 (PDT)
Received: from localhost (ip-89-176-104-107.net.upcbroadband.cz.
	[89.176.104.107]) by mx.google.com with ESMTPSA id
	bn13sm7002387eeb.11.2013.11.01.05.12.10 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 01 Nov 2013 05:12:10 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  1 Nov 2013 13:12:12 +0100
Message-Id: <1383307932-4041-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.4.2
Subject: [RFC][PATCH] packagegroup.bbclass: Drop build-time dependencies
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
X-List-Received-Date: Fri, 01 Nov 2013 12:12:09 -0000

* RFC because:
  packagegroup.bbclass inherits allarch and by default sets
  PACKAGE_ARCH = "all", but then it has runtime-dependency on
  TUNE_PKGARCH packages and different signatures, so instead
  of setting INHIBIT_DEFAULT_DEPS in addition to inherit allarch
  I would like to drop default allarch completely.
* drop virtual/kernel dependency from packagegroup-core-boot
  because kernel isn't needed to build packagegroup and building
  it doesn't influence if it's included in image or not.

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/classes/packagegroup.bbclass                         | 4 ++++
 meta/recipes-core/packagegroups/packagegroup-core-boot.bb | 1 -
 2 files changed, 4 insertions(+), 1 deletion(-)

diff --git a/meta/classes/packagegroup.bbclass b/meta/classes/packagegroup.bbclass
index 9bc9cc2..bd212fd 100644
--- a/meta/classes/packagegroup.bbclass
+++ b/meta/classes/packagegroup.bbclass
@@ -11,6 +11,10 @@ PACKAGES = "${PN}"
 # need to be set to MACHINE_ARCH after inheriting packagegroup.bbclass
 inherit allarch
 
+# allarch.bbclass does that only when PACKAGE_ARCH = "all", 
+# but we don't want any build time dependencies even for MACHINE_ARCH packagegroups
+INHIBIT_DEFAULT_DEPS = "1"
+
 # This automatically adds -dbg and -dev flavours of all PACKAGES
 # to the list. Their dependencies (RRECOMMENDS) are handled as usual
 # by package_depchains in a following step.
diff --git a/meta/recipes-core/packagegroups/packagegroup-core-boot.bb b/meta/recipes-core/packagegroups/packagegroup-core-boot.bb
index 486385a..5455899 100644
--- a/meta/recipes-core/packagegroups/packagegroup-core-boot.bb
+++ b/meta/recipes-core/packagegroups/packagegroup-core-boot.bb
@@ -5,7 +5,6 @@
 SUMMARY = "Minimal boot requirements"
 DESCRIPTION = "The minimal set of packages required to boot the system"
 LICENSE = "MIT"
-DEPENDS = "virtual/kernel"
 PR = "r11"
 
 inherit packagegroup
-- 
1.8.4.2


