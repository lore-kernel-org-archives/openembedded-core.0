Return-Path: <Alexandru.Moise@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id A9DC277074
	for <openembedded-core@lists.openembedded.org>;
	Tue,  5 Apr 2016 07:30:58 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id u357UwFq011216
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 5 Apr 2016 00:30:58 -0700 (PDT)
Received: from obsrwr.corp.ad.wrs.com (128.224.124.191) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.248.2; Tue, 5 Apr 2016 00:30:57 -0700
From: Alexandru Moise <alexandru.moise@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 5 Apr 2016 10:33:33 +0300
Message-ID: <1459841613-18118-1-git-send-email-alexandru.moise@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH] libtool: fix contaminated path to lt_truncate_bin
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
X-List-Received-Date: Tue, 05 Apr 2016 07:30:59 -0000
Content-Type: text/plain

lt_truncate_bin path is contaminated by the path from the sysroot
directory for the build host.

Steps to reproduce this issue:
$ bitbake -c cleanall libtool
$ bitbake coreutils-native
$ bitbake libtool

$ grep -in "lt_truncate_bin=" tmp/work/*/libtool/*/image/usr/bin/libtool

Signed-off-by: Alexandru Moise <alexandru.moise@windriver.com>
---
 meta/recipes-devtools/libtool/libtool_2.4.6.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-devtools/libtool/libtool_2.4.6.bb b/meta/recipes-devtools/libtool/libtool_2.4.6.bb
index 45f1b2f..3851ec7 100644
--- a/meta/recipes-devtools/libtool/libtool_2.4.6.bb
+++ b/meta/recipes-devtools/libtool/libtool_2.4.6.bb
@@ -10,6 +10,7 @@ SYSROOT_PREPROCESS_FUNCS += "libtool_sysroot_preprocess"
 do_install_append () {
         sed -e 's@--sysroot=${STAGING_DIR_HOST}@@g' \
             -e 's@${STAGING_DIR_HOST}@@g' \
+            -e 's@${STAGING_DIR_NATIVE}@@g' \
             -e 's@^\(sys_lib_search_path_spec="\).*@\1${libdir} ${base_libdir}"@' \
             -e 's@^\(compiler_lib_search_dirs="\).*@\1${libdir} ${base_libdir}"@' \
             -e 's@^\(compiler_lib_search_path="\).*@\1${libdir} ${base_libdir}"@' \
-- 
2.7.4


