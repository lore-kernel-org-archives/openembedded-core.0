Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Liezhi.Yang@windriver.com>) id 1UVhIo-00088T-8M
	for openembedded-core@lists.openembedded.org;
	Fri, 26 Apr 2013 13:59:03 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r3QBfCJ1024095
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 26 Apr 2013 04:41:12 -0700 (PDT)
Received: from pek-hostel-vm02.wrs.com (128.224.153.172) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.2.342.3; Fri, 26 Apr 2013 04:41:12 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 26 Apr 2013 07:41:08 -0400
Message-ID: <4aa663aaedff33870a96a676b9394ff79fe49eac.1366963971.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <cover.1366963971.git.liezhi.yang@windriver.com>
References: <cover.1366963971.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/1] glib-2.0-native: do_compile failed on opensuse 12.2 64bit
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 26 Apr 2013 11:59:04 -0000
Content-Type: text/plain

The error message:
  File "/path/to/glib-2.34.3/gio/gdbus-2.0/codegen/parser.py", line 25, in <module>
    import xml.parsers.expat

ImportError: No module named xml.parsers.expat
make[2]: *** [gdbus-daemon-generated.h] Error 1

This is because opensuse 12.2 doesn't install the expat.py (one of
python's lib) by default, but our native python provides it, use the
native python would fix the problem.

[YOCTO #4424]

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta/recipes-core/glib-2.0/glib-2.0_2.34.3.bb |    2 +-
 meta/recipes-core/glib-2.0/glib.inc           |    2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-core/glib-2.0/glib-2.0_2.34.3.bb b/meta/recipes-core/glib-2.0/glib-2.0_2.34.3.bb
index 7795524..50f8968 100644
--- a/meta/recipes-core/glib-2.0/glib-2.0_2.34.3.bb
+++ b/meta/recipes-core/glib-2.0/glib-2.0_2.34.3.bb
@@ -45,7 +45,7 @@ RDEPENDS_${PN}-ptest_append_libc-glibc = "\
            "
 
 do_configure_prepend() {
-	sed -i -e '1s,#!.*,#!${USRBINPATH}/env python,' ${S}/gio/gdbus-2.0/codegen/gdbus-codegen.in
+	sed -i -e '1s,#!.*,#!${PYTHON},' ${S}/gio/gdbus-2.0/codegen/gdbus-codegen.in
 }
 
 do_install_append() {
diff --git a/meta/recipes-core/glib-2.0/glib.inc b/meta/recipes-core/glib-2.0/glib.inc
index 42c34c3..0b09131 100644
--- a/meta/recipes-core/glib-2.0/glib.inc
+++ b/meta/recipes-core/glib-2.0/glib.inc
@@ -21,7 +21,7 @@ PACKAGES =+ "${PN}-utils ${PN}-bash-completion ${PN}-codegen"
 LEAD_SONAME = "libglib-2.0.*"
 FILES_${PN}-utils = "${bindir}/* ${datadir}/glib-2.0/gettext"
 
-inherit autotools gettext gtk-doc pkgconfig ptest
+inherit autotools gettext gtk-doc pkgconfig ptest pythonnative
 
 S = "${WORKDIR}/glib-${PV}"
 
-- 
1.7.10.4



