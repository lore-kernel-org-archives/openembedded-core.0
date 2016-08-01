Return-Path: <maxin.john@intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 609F96FFF7
	for <openembedded-core@lists.openembedded.org>;
	Mon,  1 Aug 2016 15:35:13 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 01 Aug 2016 08:35:14 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.28,455,1464678000"; d="scan'208";a="1033006303"
Received: from linux.intel.com ([10.54.29.200])
	by fmsmga002.fm.intel.com with ESMTP; 01 Aug 2016 08:35:15 -0700
Received: from mbabyjoh-desk.fi.intel.com (mbabyjoh-desk.ger.corp.intel.com
	[10.237.72.71])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by linux.intel.com (Postfix) with ESMTP id 87CB86A4080
	for <openembedded-core@lists.openembedded.org>;
	Mon,  1 Aug 2016 08:35:01 -0700 (PDT)
From: "Maxin B. John" <maxin.john@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  1 Aug 2016 18:34:49 +0300
Message-Id: <1470065689-27089-1-git-send-email-maxin.john@intel.com>
X-Mailer: git-send-email 2.4.0
Subject: [PATCH] piglit: fix build failure with gold linker
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
X-List-Received-Date: Mon, 01 Aug 2016 15:35:16 -0000

When we use gold linker while DISTRO set to "nodistro", piglit build
fails with the following error:

| ../../../../lib/libpiglitutil_gl.so.0: error: undefined reference to
'dlsym'
| ../../../../lib/libpiglitutil_gl.so.0: error: undefined reference to
'dlerror'
| ../../../../lib/libpiglitutil_gl.so.0: error: undefined reference to
'dlopen'
| collect2: error: ld returned 1 exit status

Fix it by providing '-ldl' to LDFLAGS.

[YOCTO #9851]

Signed-off-by: Maxin B. John <maxin.john@intel.com>
---
 meta/recipes-graphics/piglit/piglit_git.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-graphics/piglit/piglit_git.bb b/meta/recipes-graphics/piglit/piglit_git.bb
index 811f7af..df90c4d 100644
--- a/meta/recipes-graphics/piglit/piglit_git.bb
+++ b/meta/recipes-graphics/piglit/piglit_git.bb
@@ -30,6 +30,8 @@ do_compile[dirs] =+ "${B}/temp/"
 PACKAGECONFIG ??= ""
 PACKAGECONFIG[freeglut] = "-DPIGLIT_USE_GLUT=1,-DPIGLIT_USE_GLUT=0,freeglut,"
 
+LDFLAGS_append = " ${@bb.utils.contains('DISTRO_FEATURES', 'ld-is-gold', '-ldl', '', d)}"
+
 do_configure_prepend() {
    if [ "${@bb.utils.contains('PACKAGECONFIG', 'freeglut', 'yes', 'no', d)}" = "no" ]; then
         sed -i -e "/^#.*include <GL\/freeglut_ext.h>$/d" ${S}/src/piglit/glut_wrap.h
-- 
2.4.0


