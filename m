Return-Path: <Ming.Liu@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 57E3360E7C
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 Jan 2014 05:40:38 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.5) with ESMTP id s0N5edPn024226
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Jan 2014 21:40:39 -0800 (PST)
Received: from pek-lpgbuild1.wrs.com (128.224.153.21) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.2.347.0; Wed, 22 Jan 2014 21:40:38 -0800
From: Ming Liu <ming.liu@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 23 Jan 2014 13:40:33 +0800
Message-ID: <1390455633-26958-1-git-send-email-ming.liu@windriver.com>
X-Mailer: git-send-email 1.8.3.3
MIME-Version: 1.0
Subject: [PATCH] quilt: add ac_cv_path_BASH to CACHED_CONFIGUREVARS also for native
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
X-List-Received-Date: Thu, 23 Jan 2014 05:40:39 -0000
Content-Type: text/plain

A issue was fixed in target recipe with commit: 95893404

[
    quilt: added ac_cv_path_BASH to CACHED_CONFIGUREVARS

    On Fedora 17, bash has moved to /usr/bin/bash and the configure process finds it
    on the host machine there, this ensures that it is set correctly for the target.

    [YOCTO #2363]

    Signed-off-by: Saul Wold <sgw@linux.intel.com>
]

But it's also impacting native package in the case that the sstate is used
between Fedora 17(or later) and other hosts.

Signed-off-by: Ming Liu <ming.liu@windriver.com>
---
 meta/recipes-devtools/quilt/quilt-0.61.inc | 2 ++
 meta/recipes-devtools/quilt/quilt_0.61.bb  | 2 --
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-devtools/quilt/quilt-0.61.inc b/meta/recipes-devtools/quilt/quilt-0.61.inc
index f751ac8..7c8136f 100644
--- a/meta/recipes-devtools/quilt/quilt-0.61.inc
+++ b/meta/recipes-devtools/quilt/quilt-0.61.inc
@@ -31,6 +31,8 @@ RDEPENDS_${PN} = "bash"
 EXTRA_OE_MAKE_ARGS_darwin ?= ""
 EXTRA_OE_MAKE_ARGS ?= "BUILD_ROOT=${D}"
 
+CACHED_CONFIGUREVARS += "ac_cv_path_BASH=${base_bindir}/bash"
+
 # quilt ignores DESTDIR
 do_install () {
 	oe_runmake ${EXTRA_OE_MAKE_ARGS} install
diff --git a/meta/recipes-devtools/quilt/quilt_0.61.bb b/meta/recipes-devtools/quilt/quilt_0.61.bb
index 565e46a..3a08d13 100644
--- a/meta/recipes-devtools/quilt/quilt_0.61.bb
+++ b/meta/recipes-devtools/quilt/quilt_0.61.bb
@@ -5,8 +5,6 @@ SRC_URI += "file://aclocal.patch \
             file://gnu_patch_test_fix_target.patch \
            "
 
-CACHED_CONFIGUREVARS += "ac_cv_path_BASH=${base_bindir}/bash"
-
 # fix build-distro specific perl path in the target perl scripts
 do_install_append() {
 	for perlscript in ${D}${datadir}/quilt/scripts/remove-trailing-ws ${D}${datadir}/quilt/scripts/dependency-graph ${D}${datadir}/quilt/scripts/edmail ${D}${bindir}/guards
-- 
1.8.3.3


