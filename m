Return-Path: <ross.burton@intel.com>
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com
	[209.85.128.41])
	by mail.openembedded.org (Postfix) with ESMTP id 89DE87E467
	for <openembedded-core@lists.openembedded.org>;
	Tue, 16 Jul 2019 12:47:24 +0000 (UTC)
Received: by mail-wm1-f41.google.com with SMTP id l2so18572353wmg.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 16 Jul 2019 05:47:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=QML8oMC1xdNQ8GtgkyHCi1A53x2hZgPAYn8XJL+6Ojc=;
	b=ostOXA4utUOvf2oDj3a5v20vyU479bD4QGnLRoGm9LdGmBAgs9dm6TIZiR0WMIA2QO
	qjMw47F0RwVwJ/mXciA9UaeSSKuWJdkUN/5267dbuTTnnbtPPd3qA3uyYjw5ZlHYyqW4
	UUJbhd1N0iOuSmJQu+m1PEyOdeHioL4nv9QFBcP2iF4dTDMfiV948/qQpe6ugpwUCz8T
	scTpE1xQbbxoBRCcvOxgodavugpQdet875TUL72/6AuBWd4gh1XuYE7R0xzXBLzLtYm3
	Coj3fyUVymM4B9daKMOkAyqFGK6Z+OyETwDOP+XTdxuCn3lt5eSiY6yLiZgs5GsbZrDZ
	5pDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=QML8oMC1xdNQ8GtgkyHCi1A53x2hZgPAYn8XJL+6Ojc=;
	b=km3VePBPDZv0XNUVWFt8GMk+tamHXEDaO2of7kCAVm3S5DioZG2RVU27zPOaKmJard
	sb77R26uk/R3/jqa7rC8B5/nxSxE9habFR/ahQ9CM2a6rHQaHlPskgyvZCYOGg7TuRSn
	VRSCQ20E3zUO07vUYB0Y7L19Ni7hQNvzZ1nKX4TJPHOPQkb1h/BExXKxM4iIKbsYBYwx
	xFGhrYu8n/VQy8HFcBf3zNr7CnWWY/u9CJv2T3HTFpAZR7NGnoTYbz+5L5LdeSbKtA9i
	h6oslxwr7OrRXWwBn4ZiF+lLPbzryEovmt3wzGnn14SwHAqdc2zAEbnsQz7MvU/R6xSh
	WdgA==
X-Gm-Message-State: APjAAAX5GgoQ9axTaQxZ/tb7HlKEAHAL8Y9MxOH1kRakuSf5A5GtgxZD
	EIQpqLqdnxAXgPNsDVxqOwPfy7v7Dho=
X-Google-Smtp-Source: APXvYqwntbCOZ4wlONvCZVtSm+kV8akbYf+ogs/ZYmjjjPA2w+VPHD+iX2PRNQai3PTy8RJbXnLvJQ==
X-Received: by 2002:a1c:9a46:: with SMTP id c67mr29919399wme.11.1563281245030; 
	Tue, 16 Jul 2019 05:47:25 -0700 (PDT)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35]) by smtp.gmail.com with ESMTPSA id
	m7sm17012436wrx.65.2019.07.16.05.47.24
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Tue, 16 Jul 2019 05:47:24 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 16 Jul 2019 13:47:21 +0100
Message-Id: <20190716124721.22289-1-ross.burton@intel.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Subject: [PATCH] glibc: exclude child recipes from CVE scanning
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
X-List-Received-Date: Tue, 16 Jul 2019 12:47:24 -0000
Content-Transfer-Encoding: 8bit

As glibc will be scanned for CVEs, we don't need to scan glibc-locale,
glibc-mtrace, and glibc-scripts which are all separate recipes for technical
reasons.

Exclude the recipes by setting CVE_PRODUCT in the recipe, instead of using the
global whitelist.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/classes/cve-check.bbclass            | 4 +---
 meta/recipes-core/glibc/glibc-locale.inc  | 3 +++
 meta/recipes-core/glibc/glibc-mtrace.inc  | 3 +++
 meta/recipes-core/glibc/glibc-scripts.inc | 3 +++
 4 files changed, 10 insertions(+), 3 deletions(-)

diff --git a/meta/classes/cve-check.bbclass b/meta/classes/cve-check.bbclass
index 5979edf3d17..19ac48cfd49 100644
--- a/meta/classes/cve-check.bbclass
+++ b/meta/classes/cve-check.bbclass
@@ -37,9 +37,7 @@ CVE_CHECK_COPY_FILES ??= "1"
 CVE_CHECK_CREATE_MANIFEST ??= "1"
 
 # Whitelist for packages (PN)
-CVE_CHECK_PN_WHITELIST = "\
-    glibc-locale \
-"
+CVE_CHECK_PN_WHITELIST ?= ""
 
 # Whitelist for CVE and version of package. If a CVE is found then the PV is
 # compared with the version list, and if found the CVE is considered
diff --git a/meta/recipes-core/glibc/glibc-locale.inc b/meta/recipes-core/glibc/glibc-locale.inc
index bf5eaee9380..ef06389ff94 100644
--- a/meta/recipes-core/glibc/glibc-locale.inc
+++ b/meta/recipes-core/glibc/glibc-locale.inc
@@ -98,3 +98,6 @@ do_install() {
 inherit libc-package
 
 BBCLASSEXTEND = "nativesdk"
+
+# Don't scan for CVEs as glibc will be scanned
+CVE_PRODUCT = ""
diff --git a/meta/recipes-core/glibc/glibc-mtrace.inc b/meta/recipes-core/glibc/glibc-mtrace.inc
index d703c14bdc1..ef9d60ec239 100644
--- a/meta/recipes-core/glibc/glibc-mtrace.inc
+++ b/meta/recipes-core/glibc/glibc-mtrace.inc
@@ -11,3 +11,6 @@ do_install() {
 	install -d -m 0755 ${D}${bindir}
 	install -m 0755 ${SRC}/mtrace ${D}${bindir}/
 }
+
+# Don't scan for CVEs as glibc will be scanned
+CVE_PRODUCT = ""
diff --git a/meta/recipes-core/glibc/glibc-scripts.inc b/meta/recipes-core/glibc/glibc-scripts.inc
index 2a2b41507ed..14a14e45126 100644
--- a/meta/recipes-core/glibc/glibc-scripts.inc
+++ b/meta/recipes-core/glibc/glibc-scripts.inc
@@ -18,3 +18,6 @@ do_install() {
 # sotruss script requires sotruss-lib.so (given by libsotruss package), 
 # to produce trace of the library calls.
 RDEPENDS_${PN} += "libsotruss"
+
+# Don't scan for CVEs as glibc will be scanned
+CVE_PRODUCT = ""
-- 
2.20.1


