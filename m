Return-Path: <Bruce.Ashfield@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 0604C7318A
	for <openembedded-core@lists.openembedded.org>;
	Tue, 30 Aug 2016 16:49:15 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id u7UGnD5j009305
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK);
	Tue, 30 Aug 2016 09:49:13 -0700
Received: from yow-bashfiel-d4.wrs.com (128.224.56.94) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.248.2; Tue, 30 Aug 2016 09:49:12 -0700
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: <richard.purdie@linuxfoundation.org>
Date: Tue, 30 Aug 2016 12:49:00 -0400
Message-ID: <c50e7f2d790ac08c77060101f16129a4d02adc34.1472574514.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 2.5.0
In-Reply-To: <cover.1472574514.git.bruce.ashfield@windriver.com>
References: <cover.1472574514.git.bruce.ashfield@windriver.com>
MIME-Version: 1.0
Cc: saul.wold@intel.com, openembedded-core@lists.openembedded.org
Subject: [PATCH 2/9] perf: adapt to Makefile.config
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
X-List-Received-Date: Tue, 30 Aug 2016 16:49:16 -0000
Content-Type: text/plain

commit 4842576cd857 [perf tools: Move config/Makefile into Makefile.config]
relocated the configuration Makefile of perf. As such, we need to adapt
our fixup routines to work with the Makefile no matter where it is.

Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
---
 meta/recipes-kernel/perf/perf.bb | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-kernel/perf/perf.bb b/meta/recipes-kernel/perf/perf.bb
index d4855488aeb0..88e3a0a78cd7 100644
--- a/meta/recipes-kernel/perf/perf.bb
+++ b/meta/recipes-kernel/perf/perf.bb
@@ -133,11 +133,17 @@ do_configure_prepend () {
     # with each other if its in the shared source directory
     #
     if [ -e "${S}/tools/perf/config/Makefile" ]; then
+        perfconfig="${S}/tools/perf/config/Makefile"
+    fi
+    if [ -e "${S}/tools/perf/Makefile.config" ]; then
+        perfconfig="${S}/tools/perf/Makefile.config"
+    fi
+    if [ -n "${perfconfig}" ]; then
         # Match $(prefix)/$(lib) and $(prefix)/lib
         sed -i -e 's,^libdir = \($(prefix)/.*lib\),libdir ?= \1,' \
                -e 's,^perfexecdir = \(.*\),perfexecdir ?= \1,' \
                -e 's,\ .config-detected, $(OUTPUT)/config-detected,g' \
-            ${S}/tools/perf/config/Makefile
+            ${perfconfig}
     fi
     # The man pages installation is "$(INSTALL) -d -m 755 $(DESTDIR)$(man1dir)"
     # in ${S}/tools/perf/Documentation/Makefile, if the mandir set to '?=', it
@@ -214,6 +220,7 @@ RDEPENDS_${PN}-tests =+ "python"
 RSUGGESTS_SCRIPTING = "${@perf_feature_enabled('perf-scripting', '${PN}-perl ${PN}-python', '',d)}"
 RSUGGESTS_${PN} += "${PN}-archive ${PN}-tests ${RSUGGESTS_SCRIPTING}"
 
+#FILES_${PN} += "${libexecdir}/perf-core ${exec_prefix}/libexec/perf-core /usr/lib64/traceevent ${libdir}/traceevent"
 FILES_${PN} += "${libexecdir}/perf-core ${exec_prefix}/libexec/perf-core ${libdir}/traceevent"
 FILES_${PN}-archive = "${libdir}/perf/perf-core/perf-archive"
 FILES_${PN}-tests = "${libdir}/perf/perf-core/tests ${libexecdir}/perf-core/tests"
-- 
2.5.0


