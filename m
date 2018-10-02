Return-Path: <Kai.Kang@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id E3BC6745B4
	for <openembedded-core@lists.openembedded.org>;
	Tue,  2 Oct 2018 17:08:43 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id w92H89Fl029630
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 2 Oct 2018 10:08:19 -0700
Received: from pek-hostel-deb02.wrs.com (128.224.153.152) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.408.0; Tue, 2 Oct 2018 10:07:58 -0700
From: <kai.kang@windriver.com>
To: <richard.purdie@linuxfoundation.org>
Date: Wed, 3 Oct 2018 00:27:13 +0800
Message-ID: <c1e08ec385eb8ad6edf8b975b8f7edcc6b021529.1538492159.git.kai.kang@windriver.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <cover.1538492159.git.kai.kang@windriver.com>
References: <cover.1538492159.git.kai.kang@windriver.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 3/4] libcheck: avoid multilib install file conflict
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
X-List-Received-Date: Tue, 02 Oct 2018 17:08:44 -0000
Content-Type: text/plain

From: Kai Kang <kai.kang@windriver.com>

The first line of output of '$CC --version' is written to check_stdint.h
as a comment line. It causes multilib install file conflict.

Do not echo compiler version info to check_stdint.h to fix the issue.

Signed-off-by: Kai Kang <kai.kang@windriver.com>
---
 ...echo-compiler-info-to-check_stdint.h.patch | 19 +++++++++++++++++++
 .../libcheck/libcheck_0.12.0.bb               |  3 ++-
 2 files changed, 21 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-support/libcheck/libcheck/not-echo-compiler-info-to-check_stdint.h.patch

diff --git a/meta/recipes-support/libcheck/libcheck/not-echo-compiler-info-to-check_stdint.h.patch b/meta/recipes-support/libcheck/libcheck/not-echo-compiler-info-to-check_stdint.h.patch
new file mode 100644
index 0000000000..3c7572700d
--- /dev/null
+++ b/meta/recipes-support/libcheck/libcheck/not-echo-compiler-info-to-check_stdint.h.patch
@@ -0,0 +1,19 @@
+Do not echo compiler info in a comment line to check_stdint.h which causes
+multilib install file conflict.
+
+Upstream-Status: Pending
+
+Signed-off-by: Kai Kang <kai.kang@windriver.com>
+
+diff --git a/m4/ax_create_stdint_h.m4 b/m4/ax_create_stdint_h.m4
+index 33a21f8..eacc37a 100644
+--- a/m4/ax_create_stdint_h.m4
++++ b/m4/ax_create_stdint_h.m4
+@@ -272,7 +272,6 @@ echo "#ifndef" $_ac_stdint_h >$ac_stdint
+ echo "#define" $_ac_stdint_h "1" >>$ac_stdint
+ echo "#ifndef" _GENERATED_STDINT_H >>$ac_stdint
+ echo "#define" _GENERATED_STDINT_H '"'$PACKAGE $VERSION'"' >>$ac_stdint
+-echo "/* generated $ac_cv_stdint_message */" >>$ac_stdint
+ if test "_$ac_cv_header_stdint_t" != "_" ; then
+ echo "#define _STDINT_HAVE_STDINT_H" "1" >>$ac_stdint
+ echo "#include <stdint.h>" >>$ac_stdint
diff --git a/meta/recipes-support/libcheck/libcheck_0.12.0.bb b/meta/recipes-support/libcheck/libcheck_0.12.0.bb
index e646d43968..3bb48a75a3 100644
--- a/meta/recipes-support/libcheck/libcheck_0.12.0.bb
+++ b/meta/recipes-support/libcheck/libcheck_0.12.0.bb
@@ -5,7 +5,8 @@ SECTION = "devel"
 LICENSE  = "LGPLv2.1+"
 LIC_FILES_CHKSUM = "file://COPYING.LESSER;md5=2d5025d4aa3495befef8f17206a5b0a1"
 
-SRC_URI = "https://github.com/${BPN}/check/releases/download/${PV}/check-${PV}.tar.gz"
+SRC_URI = "https://github.com/${BPN}/check/releases/download/${PV}/check-${PV}.tar.gz \
+           file://not-echo-compiler-info-to-check_stdint.h.patch"
 SRC_URI[md5sum] = "31b17c6075820a434119592941186f70"
 SRC_URI[sha256sum] = "464201098bee00e90f5c4bdfa94a5d3ead8d641f9025b560a27755a83b824234"
 UPSTREAM_CHECK_URI = "https://github.com/libcheck/check/releases/"
-- 
2.18.0


