Return-Path: <kergoth@gmail.com>
Received: from mail-we0-f174.google.com (mail-we0-f174.google.com
	[74.125.82.174])
	by mail.openembedded.org (Postfix) with ESMTP id 4DBCF714A6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 17 Sep 2014 01:22:07 +0000 (UTC)
Received: by mail-we0-f174.google.com with SMTP id t60so659718wes.5
	for <openembedded-core@lists.openembedded.org>;
	Tue, 16 Sep 2014 18:22:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=B/ezW9I2BPREvO+Je3rQCYXYY8fisdBKa28KiC+XboU=;
	b=rhJbglAWT4KXgF15Bo8FgPGYkeVPTL5jnS8czfXpS6EuAn44/C2LT5VKWqlBL/yZA9
	M/b+KtPRugGsaSXrS+AqyOEy79PQ6SNAyxPyxP3FpA+cBUOoyxFwH3HO2aiwzBT/YSlC
	AaT+KQW0uCV4TqW/envdF9fEHSIWNhHMxxK9xLroAAbDvc8TQVi57jBsmddQwOkolcid
	DOWH0KHSzzNJKQWnWzrORx2aaNhCrZzx8AAcQBfM62DuBr+QazgNhO9mwxIRf6uCMtV+
	jvUhC6C1FYanfRXrsU9byoxFWXoLuhkZnAcDkqzZ7LeHhoZ+aolgwH7y96Ze9bea2+43
	1HNg==
X-Received: by 10.194.188.110 with SMTP id fz14mr448176wjc.70.1410916928581;
	Tue, 16 Sep 2014 18:22:08 -0700 (PDT)
Received: from amyr.alm.mentorg.com (nat-lmt.mentorg.com. [139.181.28.34])
	by mx.google.com with ESMTPSA id c7sm3677154wib.12.2014.09.16.18.22.06
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 16 Sep 2014 18:22:07 -0700 (PDT)
From: Christopher Larson <kergoth@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 16 Sep 2014 18:22:02 -0700
Message-Id: <1410916922-29133-1-git-send-email-kergoth@gmail.com>
X-Mailer: git-send-email 1.8.3.4
Cc: Christopher Larson <chris_larson@mentor.com>
Subject: [PATCH] flex: fix the deps for ptest builds
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
X-List-Received-Date: Wed, 17 Sep 2014 01:22:11 -0000

From: Christopher Larson <chris_larson@mentor.com>

Building the tests for flex requires flex-native and bison-native, but the
attempt to add this dependency was done incorrectly. Use an inline python
conditional based on PTEST_ENABLED instead.

Signed-off-by: Christopher Larson <chris_larson@mentor.com>
---
 meta/recipes-devtools/flex/flex.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/flex/flex.inc b/meta/recipes-devtools/flex/flex.inc
index 54e4ec3..a4a26e2 100644
--- a/meta/recipes-devtools/flex/flex.inc
+++ b/meta/recipes-devtools/flex/flex.inc
@@ -5,6 +5,7 @@ HOMEPAGE = "http://sourceforge.net/projects/flex/"
 
 SECTION = "devel"
 LICENSE = "BSD"
+DEPENDS += "${@'bison-native flex-native' if '${PTEST_ENABLED}' == '1' else ''}"
 
 SRC_URI = "${SOURCEFORGE_MIRROR}/flex/flex-${PV}.tar.bz2 \
            file://run-ptest \
@@ -28,7 +29,6 @@ do_install_append_class-nativesdk() {
 }
 
 RDEPENDS_${PN} += "m4"
-DEPENDS_${PN}-ptest += "bison-native flex-native"
 
 do_compile_ptest() {
 	for i in `find ${S}/tests/ -type d |grep -Ev "concatenated-options|reject|table-opts" | awk -F/ '{print $NF}'`; \
-- 
1.8.3.4


