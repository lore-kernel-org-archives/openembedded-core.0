Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1QHOIU-0000gE-Hg for openembedded-core@lists.openembedded.org;
	Wed, 04 May 2011 00:42:26 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p43Mdm1s022798;
	Tue, 3 May 2011 23:39:48 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 22736-01; Tue,  3 May 2011 23:39:44 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p43Mdh7A022792
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Tue, 3 May 2011 23:39:43 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <20110503180447.GB5436@sakrah.homelinux.org>
References: <cover.1303889119.git.sgw@linux.intel.com>
	<ed1614da74a5bf5820855d9d5bd9ab6213bc36de.1303889119.git.sgw@linux.intel.com>
	<1303981290.21461.39.camel@rex>
	<BANLkTimx4ry=vZdiNzYna1EE121Q85mUOA@mail.gmail.com>
	<1304424898.21461.107.camel@rex>
	<20110503180447.GB5436@sakrah.homelinux.org>
Date: Tue, 03 May 2011 23:39:39 +0100
Message-ID: <1304462379.21461.144.camel@rex>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.2 
X-Virus-Scanned: amavisd-new at rpsys.net
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 36/52] gettext.bbclass: Use _append instead of =+
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
X-List-Received-Date: Tue, 03 May 2011 22:42:26 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2011-05-03 at 11:04 -0700, Khem Raj wrote:
> This has the same problem It empties out DEPENDS_GETTEXT after they have
> have already been added to DEPENDS via virtclass e.g. when you build
> gcc-runtime-nativesdk it will report a dep loop since now it depends on
> virtual/gettext-nativesdk (added by gettext class)
> and virtual/gettext-nativesdk depends on compilerlibs
> provided by gcc-runtime-nativesdk. This was same problem I was trying to
> circumvent

Ok, how about this version:

diff --git a/meta/classes/base.bbclass b/meta/classes/base.bbclass
index 4f20bc2..3b83e42 100644
--- a/meta/classes/base.bbclass
+++ b/meta/classes/base.bbclass
@@ -89,9 +89,11 @@ def base_dep_prepend(d):
 			deps += " virtual/${TARGET_PREFIX}gcc virtual/${TARGET_PREFIX}compilerlibs virtual/libc "
 	return deps
 
-DEPENDS_prepend="${@base_dep_prepend(d)} "
-DEPENDS_virtclass-native_prepend="${@base_dep_prepend(d)} "
-DEPENDS_virtclass-nativesdk_prepend="${@base_dep_prepend(d)} "
+BASEDEPENDS = "${@base_dep_prepend(d)}"
+
+DEPENDS_prepend="${BASEDEPENDS} "
+DEPENDS_virtclass-native_prepend="${BASEDEPENDS} "
+DEPENDS_virtclass-nativesdk_prepend="${BASEDEPENDS} "
 
 FILESPATH = "${@base_set_filespath([ "${FILE_DIRNAME}/${PF}", "${FILE_DIRNAME}/${P}", "${FILE_DIRNAME}/${PN}", "${FILE_DIRNAME}/${BP}", "${FILE_DIRNAME}/${BPN}", "${FILE_DIRNAME}/files", "${FILE_DIRNAME}" ], d)}"
 # THISDIR only works properly with imediate expansion as it has to run
diff --git a/meta/classes/gettext.bbclass b/meta/classes/gettext.bbclass
index a40e74f..6f79e5e 100644
--- a/meta/classes/gettext.bbclass
+++ b/meta/classes/gettext.bbclass
@@ -1,17 +1,17 @@
-def gettext_after_parse(d):
-    # Remove the NLS bits if USE_NLS is no.
-    if bb.data.getVar('USE_NLS', d, 1) == 'no':
-        cfg = oe_filter_out('^--(dis|en)able-nls$', bb.data.getVar('EXTRA_OECONF', d, 1) or "", d)
-        cfg += " --disable-nls"
-        depends = bb.data.getVar('DEPENDS', d, 1) or ""
-        bb.data.setVar('DEPENDS', oe_filter_out('^(virtual/libiconv|virtual/libintl)$', depends, d), d)
-        bb.data.setVar('EXTRA_OECONF', cfg, d)
+def gettext_dependencies(d):
+    if d.getVar('USE_NLS', True) == 'no':
+        return ""
+    if bb.data.getVar('INHIBIT_DEFAULT_DEPS', d, True) and not oe.utils.inherits(d, 'cross-canadian'):
+        return ""
+    return d.getVar('DEPENDS_GETTEXT', False)
 
-python () {
-    gettext_after_parse(d)
-}
+def gettext_oeconf(d):
+    # Remove the NLS bits if USE_NLS is no.
+    if d.getVar('USE_NLS', True) == 'no':
+        return '--disable-nls'
+    return "--enable-nls"
 
-DEPENDS_GETTEXT = "gettext gettext-native"
+DEPENDS_GETTEXT = "virtual/gettext gettext-native"
 
-DEPENDS =+ "${DEPENDS_GETTEXT}"
-EXTRA_OECONF += "--enable-nls"
+BASEDEPENDS =+ "${@gettext_dependencies(d)}"
+EXTRA_OECONF += "${@gettext_oeconf(d)}"



