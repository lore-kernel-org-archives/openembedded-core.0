Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1ROPOT-0005br-QH
	for openembedded-core@lists.openembedded.org;
	Thu, 10 Nov 2011 08:49:57 +0100
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 09 Nov 2011 23:43:24 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.69,488,1315206000"; d="scan'208";a="83351249"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.12.14])
	by fmsmga001.fm.intel.com with ESMTP; 09 Nov 2011 23:43:23 -0800
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  9 Nov 2011 23:43:13 -0800
Message-Id: <427ed0f2e79d702701bbf3c0ff4a73248b57619f.1320910946.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.6.4
In-Reply-To: <cover.1320910946.git.sgw@linux.intel.com>
References: <cover.1320910946.git.sgw@linux.intel.com>
In-Reply-To: <cover.1320910946.git.sgw@linux.intel.com>
References: <cover.1320910946.git.sgw@linux.intel.com>
Subject: [CONSOLIDATED PULL (v2) 31/33] Allow use of dash as /bin/sh
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
X-List-Received-Date: Thu, 10 Nov 2011 07:50:02 -0000

From: Richard Purdie <richard.purdie@linuxfoundation.org>

We've had the check for dash as /bin/sh for a long time. Dash has been
around long enough now that most major issues have been identified and
fixed from  build perspective.

This patch fixes a bashism in the openjade-native recipe. It also
adjusts libtool so that the header at the script is used and not the
value of $SHELL. This is because many Makefiles change $SHELL so dash
can get used to execute what is otherwise configured as a bash shell
script. Since we don't need to execute scripts this way on any system I'm
aware of us building upon, the simplest fix is just to remove $SHELL.

With these two changes the dash check can be removed and we can allow
builds with dash as /bin/sh

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>

[Note: I know I need to add the description of the libtool change above
into the prefix.patch]
---
 meta/classes/sanity.bbclass                        |    3 ---
 meta/recipes-devtools/libtool/libtool/prefix.patch |   11 ++++++++++-
 .../openjade/openjade-native_1.3.2.bb              |    4 +++-
 3 files changed, 13 insertions(+), 5 deletions(-)

diff --git a/meta/classes/sanity.bbclass b/meta/classes/sanity.bbclass
index 3f42b4f..838448f 100644
--- a/meta/classes/sanity.bbclass
+++ b/meta/classes/sanity.bbclass
@@ -331,9 +331,6 @@ def check_sanity(e):
     if not data.getVar( 'DISPLAY', e.data, True ) and data.getVar( 'IMAGETEST', e.data, True ) == 'qemu':
         messages = messages + 'qemuimagetest needs a X desktop to start qemu, please set DISPLAY correctly (e.g. DISPLAY=:1.0)\n'
 
-    if os.path.basename(os.readlink('/bin/sh')) == 'dash':
-        messages = messages + "Using dash as /bin/sh causes various subtle build problems, please use bash instead (e.g. 'dpkg-reconfigure dash' on an Ubuntu system.\n"
-
     omask = os.umask(022)
     if omask & 0755:
         messages = messages + "Please use a umask which allows a+rx and u+rwx\n"
diff --git a/meta/recipes-devtools/libtool/libtool/prefix.patch b/meta/recipes-devtools/libtool/libtool/prefix.patch
index 1b20324..e6eca1f 100644
--- a/meta/recipes-devtools/libtool/libtool/prefix.patch
+++ b/meta/recipes-devtools/libtool/libtool/prefix.patch
@@ -8,6 +8,15 @@ Originally by: RP
 Updated: Date: 2010/06/28
 Nitin A Kamble <nitin.a.kamble@intel.com>
 
+It also adjusts libtool so that the header at the script is used for 
+script execution and not thevalue of $SHELL. This is because many 
+Makefiles change $SHELL so dash can get used to execute what is 
+otherwise configured as a bash shell script. Since we don't need to 
+execute scipts this way on any system I'm aware of us building upon, 
+the simplest fix is just to remove $SHELL.
+
+Updated: Date: 2011/11/09
+RP
 
 Index: libtool-2.4/libltdl/m4/libtool.m4
 ===================================================================
@@ -18,7 +27,7 @@ Index: libtool-2.4/libltdl/m4/libtool.m4
  
  # Always use our own libtool.
 -LIBTOOL='$(SHELL) $(top_builddir)/libtool'
-+LIBTOOL='$(SHELL) $(top_builddir)'
++LIBTOOL='$(top_builddir)'
 +LIBTOOL="$LIBTOOL/${host_alias}-libtool"
  AC_SUBST(LIBTOOL)dnl
  
diff --git a/meta/recipes-devtools/openjade/openjade-native_1.3.2.bb b/meta/recipes-devtools/openjade/openjade-native_1.3.2.bb
index 6cc6bb5..0cce46e 100644
--- a/meta/recipes-devtools/openjade/openjade-native_1.3.2.bb
+++ b/meta/recipes-devtools/openjade/openjade-native_1.3.2.bb
@@ -53,7 +53,9 @@ do_install() {
 
 	install -d ${D}${datadir}/sgml/openjade-${PV}
 	install -m 644 dsssl/catalog ${D}${datadir}/sgml/openjade-${PV}
-	install -m 644 dsssl/*.{dtd,dsl,sgm} ${D}${datadir}/sgml/openjade-${PV}
+	install -m 644 dsssl/*.dtd ${D}${datadir}/sgml/openjade-${PV}
+	install -m 644 dsssl/*.dsl ${D}${datadir}/sgml/openjade-${PV}
+	install -m 644 dsssl/*.sgm ${D}${datadir}/sgml/openjade-${PV}
 
 	install -d ${datadir}/sgml/openjade-${PV}
 	install -m 644 dsssl/catalog ${datadir}/sgml/openjade-${PV}/catalog
-- 
1.7.6.4



