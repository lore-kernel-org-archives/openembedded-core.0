Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1RNtOx-0000xK-J8 for openembedded-core@lists.openembedded.org;
	Tue, 08 Nov 2011 22:40:15 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id pA8LY1E1006745
	for <openembedded-core@lists.openembedded.org>;
	Tue, 8 Nov 2011 21:34:01 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 06668-01 for <openembedded-core@lists.openembedded.org>;
	Tue,  8 Nov 2011 21:33:57 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id pA8LXoga006739
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 8 Nov 2011 21:33:52 GMT
Message-ID: <1320788033.10843.116.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Tue, 08 Nov 2011 21:33:53 +0000
X-Mailer: Evolution 3.2.1- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: [PATCH] Allow use of dash as /bin/sh
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
X-List-Received-Date: Tue, 08 Nov 2011 21:40:15 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

We've had the check for dash as /bin/sh for a long time. Dash has been
around long enough now that most major issues have been identified and
fixed from  build perspective.

This patch fixes a bashism in the openjade-native recipe. It also
adjusts libtool so that the header at the script is used and not the
value of $SHELL. This is because many Makefiles change $SHELL so dash
can get used to execute what is otherwise configured as a bash shell
script. Since we don't need to execute scipts this way on any system I'm
aware of us building upon, the simplest fix is just to remove $SHELL.

With these two changes the dash check can be removed and we can allow
builds with dash as /bin/sh

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>

[Note: I know I need to add the description of the libtool change above
into the prefix.patch]
---
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
index 1b20324..7737990 100644
--- a/meta/recipes-devtools/libtool/libtool/prefix.patch
+++ b/meta/recipes-devtools/libtool/libtool/prefix.patch
@@ -18,7 +18,7 @@ Index: libtool-2.4/libltdl/m4/libtool.m4
  
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




