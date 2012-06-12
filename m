Received: from masterfoo.zenlinux.com ([207.192.74.254])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <scott.a.garman@intel.com>) id 1SeY08-0002Me-M1
	for openembedded-core@lists.openembedded.org;
	Tue, 12 Jun 2012 22:47:44 +0200
Received: from localhost (c-76-105-137-48.hsd1.or.comcast.net [76.105.137.48])
	(using TLSv1 with cipher DHE-RSA-AES128-SHA (128/128 bits))
	(No client certificate requested)
	by masterfoo.zenlinux.com (Postfix) with ESMTP id D1DFF2FE86
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Jun 2012 16:37:03 -0400 (EDT)
From: Scott Garman <scott.a.garman@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 12 Jun 2012 13:36:39 -0700
Message-Id: <df83a9480ba7b2fd2bcc0a92932d51434d7795a0.1339533128.git.scott.a.garman@intel.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1339533128.git.scott.a.garman@intel.com>
References: <cover.1339533128.git.scott.a.garman@intel.com>
In-Reply-To: <cover.1339533128.git.scott.a.garman@intel.com>
References: <cover.1339533128.git.scott.a.garman@intel.com>
X-MasterFoo-MailScanner-Information: Please contact the ISP for more
	information
X-MailScanner-ID: D1DFF2FE86.A5CCB
X-MasterFoo-MailScanner: Found to be clean
X-MasterFoo-MailScanner-SpamCheck: not spam
X-MasterFoo-MailScanner-From: scott.a.garman@intel.com
X-Spam-Status: No
Subject: [PATCH 08/16] webkit-gtk: Use glib as unicode backend to avoid browser crash
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
X-List-Received-Date: Tue, 12 Jun 2012 20:47:44 -0000

From: Zhai Edwin <edwin.zhai@intel.com>

webkit-gtk depends on ICU for the unicode, but ICU is not safe when build and
target system owns different endian. ICU's community is not responsive to make
a patch for this, so glib is used as work around here.

[YOCTO #1570] got fixed

Signed-off-by: Zhai Edwin <edwin.zhai@intel.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-sato/webkit/webkit-gtk_svn.bb |   10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-sato/webkit/webkit-gtk_svn.bb b/meta/recipes-sato/webkit/webkit-gtk_svn.bb
index 7db573d..9381486 100644
--- a/meta/recipes-sato/webkit/webkit-gtk_svn.bb
+++ b/meta/recipes-sato/webkit/webkit-gtk_svn.bb
@@ -10,12 +10,13 @@ LIC_FILES_CHKSUM = "file://Source/WebCore/rendering/RenderApplet.h;endline=22;md
 DEPENDS = "zlib enchant gnome-keyring libsoup-2.4 curl icu libxml2 cairo libxslt libxt libidn gnutls gtk+ gstreamer gst-plugins-base flex-native gperf-native perl-native-runtime sqlite3"
 DEPENDS += " ${@base_contains('DISTRO_FEATURES', 'opengl', 'virtual/libgl', '', d)}"
 DEPENDS_darwin8 = "curl icu libxml2 cairo libxslt libidn gnutls gtk+ gstreamer flex-native gperf-native perl-native-runtime sqlite3"
+DEPENDS_append_qemuppc += "pango"
 
 SRCREV_FORMAT = "source"
 
 SRCREV = "101488"
 PV = "1.7.2+svnr${SRCPV}"
-PR = "r4"
+PR = "r5"
 
 SRC_URI = "\
   svn://svn.webkit.org/repository/webkit/trunk/;module=Source;proto=http;name=source \
@@ -47,6 +48,13 @@ EXTRA_OECONF = "\
                 UNICODE_CFLAGS=-D_REENTRANT \
                "
 
+#default unicode backend icu breaks in cross-compile when target and host owns different endian type
+EXTRA_OECONF_append_qemuppc += "--with-unicode-backend=glib"
+
+CPPFLAGS_append_qemuppc += "-I${STAGING_INCDIR}/pango-1.0 \
+                            -I${STAGING_LIBDIR}/glib-2.0/include \
+                            -I${STAGING_INCDIR}/glib-2.0"
+
 EXTRA_AUTORECONF = " -I Source/autotools "
 
 
-- 
1.7.9.5



