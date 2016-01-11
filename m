Return-Path: <Qi.Chen@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 5416A758DB
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Jan 2016 05:58:41 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id u0B5wfps014689
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <openembedded-core@lists.openembedded.org>;
	Sun, 10 Jan 2016 21:58:42 -0800
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.246) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.248.2; Sun, 10 Jan 2016 21:58:41 -0800
From: Chen Qi <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 11 Jan 2016 13:58:41 +0800
Message-ID: <74217f6a4fc24123cf89a4bc6ca74258e4171501.1452491844.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1452491844.git.Qi.Chen@windriver.com>
References: <cover.1452491844.git.Qi.Chen@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 4/7] at: upgrade to 3.18
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
X-List-Received-Date: Mon, 11 Jan 2016 05:58:43 -0000
Content-Type: text/plain

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 .../at/at/fix_parallel_build_error.patch            | 21 ++++++++++++++-------
 .../at/{at_3.1.16.bb => at_3.1.18.bb}               |  6 +++---
 2 files changed, 17 insertions(+), 10 deletions(-)
 rename meta/recipes-extended/at/{at_3.1.16.bb => at_3.1.18.bb} (91%)

diff --git a/meta/recipes-extended/at/at/fix_parallel_build_error.patch b/meta/recipes-extended/at/at/fix_parallel_build_error.patch
index 66ff3e1..100f889 100644
--- a/meta/recipes-extended/at/at/fix_parallel_build_error.patch
+++ b/meta/recipes-extended/at/at/fix_parallel_build_error.patch
@@ -13,16 +13,23 @@ Upstream-Status: Pending
 
 Signed-off-by: Scott Garman <scott.a.garman@intel.com>
 
-Index: at-3.1.12/Makefile.in
-===================================================================
---- at-3.1.12.orig/Makefile.in
-+++ at-3.1.12/Makefile.in
-@@ -83,6 +83,8 @@ y.tab.c y.tab.h: parsetime.y
+---
+ Makefile.in | 2 ++
+ 1 file changed, 2 insertions(+)
+
+diff --git a/Makefile.in b/Makefile.in
+index dd3c2f8..7897e45 100644
+--- a/Makefile.in
++++ b/Makefile.in
+@@ -82,6 +82,8 @@ y.tab.c y.tab.h: parsetime.y
  lex.yy.c: parsetime.l
  	$(LEX) -i parsetime.l
  
 +parsetime.l: y.tab.h
 +
- atrun: atrun.in
- 	configure
+ atd.service: atd.service.in
+ 	sed -e 's![@]sbindir[@]!$(sbindir)!g' < $< > $@
  
+-- 
+1.9.1
+
diff --git a/meta/recipes-extended/at/at_3.1.16.bb b/meta/recipes-extended/at/at_3.1.18.bb
similarity index 91%
rename from meta/recipes-extended/at/at_3.1.16.bb
rename to meta/recipes-extended/at/at_3.1.18.bb
index b11b587..e83ea32 100644
--- a/meta/recipes-extended/at/at_3.1.16.bb
+++ b/meta/recipes-extended/at/at_3.1.18.bb
@@ -15,7 +15,7 @@ PAM_DEPS = "libpam libpam-runtime pam-plugin-env pam-plugin-limits"
 RCONFLICTS_${PN} = "atd"
 RREPLACES_${PN} = "atd"
 
-SRC_URI = "${DEBIAN_MIRROR}/main/a/at/at_${PV}.orig.tar.gz \
+SRC_URI = "${DEBIAN_MIRROR}/main/a/at/at_${PV}.orig.tar.gz;subdir=${BP} \
     file://fix_parallel_build_error.patch \
     file://posixtm.c \
     file://posixtm.h \
@@ -30,8 +30,8 @@ SRC_URI = "${DEBIAN_MIRROR}/main/a/at/at_${PV}.orig.tar.gz \
 PAM_SRC_URI = "file://pam.conf.patch \
                file://configure-add-enable-pam.patch"
 
-SRC_URI[md5sum] = "d05da75d9b75d93917ffb16ab48b1e19"
-SRC_URI[sha256sum] = "cb9af59c6a54edce9536ba629841055409d1f89d8ae26494727a97141fb4d5c1"
+SRC_URI[md5sum] = "f67a7aab557cd5b4a1311079a08acebe"
+SRC_URI[sha256sum] = "dbd5c8cb8edd53ef467363c3af0391c08769f1dbbd4d5002c59a4cd4cac11d52"
 
 EXTRA_OECONF += "ac_cv_path_SENDMAIL=/bin/true \
                  --with-daemon_username=root \
-- 
1.9.1


