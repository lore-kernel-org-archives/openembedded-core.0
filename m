Received: from masterfoo.zenlinux.com ([207.192.74.254])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <scott.a.garman@intel.com>) id 1SgiFl-0008Qm-Jk
	for openembedded-core@lists.openembedded.org;
	Mon, 18 Jun 2012 22:08:49 +0200
Received: from localhost (c-76-105-137-48.hsd1.or.comcast.net [76.105.137.48])
	(using TLSv1 with cipher DHE-RSA-AES128-SHA (128/128 bits))
	(No client certificate requested)
	by masterfoo.zenlinux.com (Postfix) with ESMTP id 35EC230467
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Jun 2012 15:58:04 -0400 (EDT)
From: Scott Garman <scott.a.garman@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 18 Jun 2012 12:57:56 -0700
Message-Id: <87eae0851e5334734df40a833596c6cbc6715f7f.1340038108.git.scott.a.garman@intel.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1340038108.git.scott.a.garman@intel.com>
References: <cover.1340038108.git.scott.a.garman@intel.com>
In-Reply-To: <cover.1340038108.git.scott.a.garman@intel.com>
References: <cover.1340038108.git.scott.a.garman@intel.com>
X-MasterFoo-MailScanner-Information: Please contact the ISP for more
	information
X-MailScanner-ID: 35EC230467.25659
X-MasterFoo-MailScanner: Found to be clean
X-MasterFoo-MailScanner-SpamCheck: not spam
X-MasterFoo-MailScanner-From: scott.a.garman@intel.com
X-Spam-Status: No
Subject: [PATCH 2/6] webkit-gtk: Apply work around for all PowerPC targets
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 18 Jun 2012 20:08:50 -0000

From: Gary Thomas <gary@mlbassoc.com>

The current patch for bug #1570 only applies to qemuppc but should be
applicable for all PowerPC targets.  Also update the patch so that
only one language backend, either ICU or PANGO, is built.

Also remove some old customizations (dependencies on darwin) as these
should now be handled in a layer specific .bbappend file.

Signed-off-by: Gary Thomas <gary@mlbassoc.com>
---
 meta/recipes-sato/webkit/webkit-gtk_svn.bb |   15 +++++++++------
 1 file changed, 9 insertions(+), 6 deletions(-)

diff --git a/meta/recipes-sato/webkit/webkit-gtk_svn.bb b/meta/recipes-sato/webkit/webkit-gtk_svn.bb
index 9381486..716afce 100644
--- a/meta/recipes-sato/webkit/webkit-gtk_svn.bb
+++ b/meta/recipes-sato/webkit/webkit-gtk_svn.bb
@@ -7,10 +7,13 @@ LIC_FILES_CHKSUM = "file://Source/WebCore/rendering/RenderApplet.h;endline=22;md
                     file://Source/WebKit/gtk/webkit/webkit.h;endline=21;md5=b4fbe9f4a944f1d071dba1d2c76b3351 \
                     file://Source/JavaScriptCore/parser/Parser.h;endline=23;md5=2f3cff0ad0a9c486da5a376928973a90"
 
-DEPENDS = "zlib enchant gnome-keyring libsoup-2.4 curl icu libxml2 cairo libxslt libxt libidn gnutls gtk+ gstreamer gst-plugins-base flex-native gperf-native perl-native-runtime sqlite3"
+# Choice of language backends - icu has issues on Big Endian machines so use pango
+ICU_LIB = "icu"
+ICU_LIB_powerpc = "pango"
+
+DEPENDS = "zlib enchant gnome-keyring libsoup-2.4 curl libxml2 cairo libxslt libxt libidn gnutls \
+           gtk+ gstreamer gst-plugins-base flex-native gperf-native perl-native-runtime sqlite3 ${ICU_LIB}"
 DEPENDS += " ${@base_contains('DISTRO_FEATURES', 'opengl', 'virtual/libgl', '', d)}"
-DEPENDS_darwin8 = "curl icu libxml2 cairo libxslt libidn gnutls gtk+ gstreamer flex-native gperf-native perl-native-runtime sqlite3"
-DEPENDS_append_qemuppc += "pango"
 
 SRCREV_FORMAT = "source"
 
@@ -48,10 +51,10 @@ EXTRA_OECONF = "\
                 UNICODE_CFLAGS=-D_REENTRANT \
                "
 
-#default unicode backend icu breaks in cross-compile when target and host owns different endian type
-EXTRA_OECONF_append_qemuppc += "--with-unicode-backend=glib"
+#default unicode backend icu breaks in cross-compile when target and host are different endian type
+EXTRA_OECONF_append_powerpc += "--with-unicode-backend=glib"
 
-CPPFLAGS_append_qemuppc += "-I${STAGING_INCDIR}/pango-1.0 \
+CPPFLAGS_append_powerpc += "-I${STAGING_INCDIR}/pango-1.0 \
                             -I${STAGING_LIBDIR}/glib-2.0/include \
                             -I${STAGING_INCDIR}/glib-2.0"
 
-- 
1.7.9.5



