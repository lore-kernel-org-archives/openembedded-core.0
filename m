Return-Path: <Kai.Kang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id BDDB66C3AA
	for <openembedded-core@lists.openembedded.org>;
	Thu,  4 Apr 2019 07:52:16 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com ([147.11.189.41])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id x347qGEc000716
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 4 Apr 2019 00:52:16 -0700 (PDT)
Received: from msp-lpggp1.wrs.com (172.25.34.110) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.439.0;
	Thu, 4 Apr 2019 00:52:10 -0700
From: <kai.kang@windriver.com>
To: <raj.khem@gmail.com>
Date: Thu, 4 Apr 2019 03:52:05 -0400
Message-ID: <20190404075205.108547-1-kai.kang@windriver.com>
X-Mailer: git-send-email 2.20.0
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH] virglrenderer: remove link option -Bsymbolic
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
X-List-Received-Date: Thu, 04 Apr 2019 07:52:16 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

From: Kai Kang <kai.kang@windriver.com>

When gcc compile options '-O2 -fvisibility=default' are applied, it
fails to compile virglrenderer for x86:

| ld: gallium/auxiliary/.libs/libgallium.a(u_cpu_detect.o): relocation
  R_386_GOTOFF against undefined symbol `util_cpu_caps' can not be used
  when making a shared object
| ld: final link failed: bad value
| collect2: error: ld returned 1 exit status

Remove link option '-Bsymbolic' to fix the failure.

Signed-off-by: Kai Kang <kai.kang@windriver.com>
---
 .../0001-Remove-link-option-Bsymbolic.patch   | 34 +++++++++++++++++++
 .../virglrenderer/virglrenderer_0.7.0.bb      |  1 +
 2 files changed, 35 insertions(+)
 create mode 100644 meta/recipes-graphics/virglrenderer/virglrenderer/0001-Remove-link-option-Bsymbolic.patch

diff --git a/meta/recipes-graphics/virglrenderer/virglrenderer/0001-Remove-link-option-Bsymbolic.patch b/meta/recipes-graphics/virglrenderer/virglrenderer/0001-Remove-link-option-Bsymbolic.patch
new file mode 100644
index 0000000000..faefa16aae
--- /dev/null
+++ b/meta/recipes-graphics/virglrenderer/virglrenderer/0001-Remove-link-option-Bsymbolic.patch
@@ -0,0 +1,34 @@
+When gcc compile options '-O2 -fvisibility=default' are applied, it fails to
+compile virglrenderer for x86:
+
+| ld: gallium/auxiliary/.libs/libgallium.a(u_cpu_detect.o): relocation
+  R_386_GOTOFF against undefined symbol `util_cpu_caps' can not be used
+  when making a shared object
+| ld: final link failed: bad value
+| collect2: error: ld returned 1 exit status
+
+Remove link option '-Bsymbolic' to fix the failure.
+
+Upstream-Status: Submitted [https://gitlab.freedesktop.org/virgl/virglrenderer/merge_requests/213]
+
+Signed-off-by: Kai Kang <kai.kang@windriver.com>
+---
+ src/Makefile.am | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/src/Makefile.am b/src/Makefile.am
+index 9b668c8..7a421b8 100644
+--- a/src/Makefile.am
++++ b/src/Makefile.am
+@@ -48,7 +49,7 @@ endif
+ lib_LTLIBRARIES = libvirglrenderer.la
+ noinst_LTLIBRARIES = libvrend.la
+ 
+-GM_LDFLAGS = -Wl,-Bsymbolic -version-number 0:2 -no-undefined
++GM_LDFLAGS = -version-number 0:2 -no-undefined
+ 
+ libvirglrenderer_la_SOURCES = virglrenderer.c
+ libvirglrenderer_ladir = $(libdir)
+-- 
+2.20.1
+
diff --git a/meta/recipes-graphics/virglrenderer/virglrenderer_0.7.0.bb b/meta/recipes-graphics/virglrenderer/virglrenderer_0.7.0.bb
index 225a0b8b0c..afc709bc48 100644
--- a/meta/recipes-graphics/virglrenderer/virglrenderer_0.7.0.bb
+++ b/meta/recipes-graphics/virglrenderer/virglrenderer_0.7.0.bb
@@ -9,6 +9,7 @@ SRCREV = "402c228861c9893f64cffbbcb4cb23044b8c721c"
 SRC_URI = "git://anongit.freedesktop.org/virglrenderer \
            file://0001-vtest-add-missing-includes.patch \
            file://0001-Makefile.am-explicitly-link-with-libdrm.patch \
+           file://0001-Remove-link-option-Bsymbolic.patch \
            "
 
 S = "${WORKDIR}/git"
-- 
2.20.0


