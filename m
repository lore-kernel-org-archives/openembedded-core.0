Received: from mail-iw0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1Q5W04-0004qV-AJ
	for openembedded-core@lists.openembedded.org;
	Fri, 01 Apr 2011 06:30:20 +0200
Received: by iwn10 with SMTP id 10so3431324iwn.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 31 Mar 2011 21:28:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:from:to:cc:subject:date:message-id:x-mailer
	:in-reply-to:references;
	bh=pBJL75S3Wk0ll824grgBJrBZ5f954vQntapkPp30boE=;
	b=q/QhohIq4Bodud34B6R2zw3DyO/jbrjkPS/943+NOcMRDy/eJnR2DTOKTsDNXpg6Sc
	0AVYPrCG52SlYP0jmD+BvbWgj59VxAE1wz3u2hObWRKnmIVviqA88p9lgmxsh/N7lzgj
	0Q0ue2J6qigQPFtiY2Sys5ff+xh61vBq/lRos=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	b=kXVBSxVVnh8Ofkywkn6Hb/wf/u69AuYku57d/uhQgV0l4/dwH8yy8sVl75b78gD/nH
	tLsmsH6EDSHdeTVrWL1YH8VsU0wg2MeQ4sT+U4iVhKrpvFSYIQ7ibDwq0PmGRBg0+tIY
	4aZenGW4bQiNRNWDtjHfRfiiQb9yrDjLrB4os=
Received: by 10.42.18.197 with SMTP id y5mr4528871ica.423.1301632099203;
	Thu, 31 Mar 2011 21:28:19 -0700 (PDT)
Received: from localhost.localdomain
	(99-57-141-118.lightspeed.sntcca.sbcglobal.net [99.57.141.118])
	by mx.google.com with ESMTPS id 13sm1181744ibo.25.2011.03.31.21.28.17
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 31 Mar 2011 21:28:18 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: OE core <openembedded-core@lists.openembedded.org>
Date: Thu, 31 Mar 2011 21:28:10 -0700
Message-Id: <9778c2218ffe94c96e816b203ded8569b19a1faf.1301631488.git.raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.4.1
In-Reply-To: <cover.1301631488.git.raj.khem@gmail.com>
References: <cover.1301631488.git.raj.khem@gmail.com>
Subject: [PATCH 02/46] classes: Use virtual/libintl instead of gettext
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
X-List-Received-Date: Fri, 01 Apr 2011 04:30:20 -0000

uclibc can use a proxy-libintl to provide dummy
gettext functionality so we need to make sure
we operate on virtual/libintl

gettext class is fixed so we can always use
inherit gettext to create proper dependencies
on gettext

insane class check for virtual/libintl and
error message is enhanced to print out gettext
package name it reports. Code is rearranged
for cosmetics.

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/classes/autotools.bbclass |    8 +++++++-
 meta/classes/gettext.bbclass   |    8 ++++----
 meta/classes/insane.bbclass    |   23 +++++++++++------------
 3 files changed, 22 insertions(+), 17 deletions(-)

diff --git a/meta/classes/autotools.bbclass b/meta/classes/autotools.bbclass
index bc891f9..c128c39 100644
--- a/meta/classes/autotools.bbclass
+++ b/meta/classes/autotools.bbclass
@@ -134,7 +134,13 @@ autotools_do_configure() {
 			    echo "no" | glib-gettextize --force --copy
 			  fi
 			else if grep "^[[:space:]]*AM_GNU_GETTEXT" $CONFIGURE_AC >/dev/null; then
-			  cp ${STAGING_DATADIR}/gettext/config.rpath ${S}/
+			  if ! echo ${EXTRA_OECONF} | grep -q "\-\-disable-nls"; then
+			    if [ -e ${STAGING_DATADIR}/gettext/config.rpath ]; then
+			      cp ${STAGING_DATADIR}/gettext/config.rpath ${S}/
+			    else
+			      oenote config.rpath not found in target sysroot. gettext is not staged. Usually happens when building with uclibc
+			    fi
+			  fi
 			fi
 
 			fi
diff --git a/meta/classes/gettext.bbclass b/meta/classes/gettext.bbclass
index a40e74f..f49b595 100644
--- a/meta/classes/gettext.bbclass
+++ b/meta/classes/gettext.bbclass
@@ -3,15 +3,15 @@ def gettext_after_parse(d):
     if bb.data.getVar('USE_NLS', d, 1) == 'no':
         cfg = oe_filter_out('^--(dis|en)able-nls$', bb.data.getVar('EXTRA_OECONF', d, 1) or "", d)
         cfg += " --disable-nls"
-        depends = bb.data.getVar('DEPENDS', d, 1) or ""
-        bb.data.setVar('DEPENDS', oe_filter_out('^(virtual/libiconv|virtual/libintl)$', depends, d), d)
+        depends = bb.data.getVar('DEPENDS', d, True) or ""
+        bb.data.setVar('DEPENDS', oe_filter_out('^(virtual/libiconv|virtual/libintl|gettext|gettext-native)$', depends, d), d)
         bb.data.setVar('EXTRA_OECONF', cfg, d)
 
 python () {
     gettext_after_parse(d)
 }
 
-DEPENDS_GETTEXT = "gettext gettext-native"
+DEPENDS_GETTEXT = "virtual/libintl gettext-native"
 
-DEPENDS =+ "${DEPENDS_GETTEXT}"
+DEPENDS_append = " ${DEPENDS_GETTEXT}"
 EXTRA_OECONF += "--enable-nls"
diff --git a/meta/classes/insane.bbclass b/meta/classes/insane.bbclass
index 8124384..a2bcaae 100644
--- a/meta/classes/insane.bbclass
+++ b/meta/classes/insane.bbclass
@@ -553,10 +553,6 @@ python do_package_qa () {
     bb.note("DONE with PACKAGE QA")
 }
 
-
-# The Staging Func, to check all staging
-#addtask qa_staging after do_populate_sysroot before do_build
-do_populate_sysroot[postfuncs] += "do_qa_staging "
 python do_qa_staging() {
     bb.note("QA checking staging")
 
@@ -564,10 +560,6 @@ python do_qa_staging() {
         bb.fatal("QA staging was broken by the package built above")
 }
 
-# Check broken config.log files, for packages requiring Gettext which don't
-# have it in DEPENDS and for correct LIC_FILES_CHKSUM
-#addtask qa_configure after do_configure before do_compile
-do_configure[postfuncs] += "do_qa_configure "
 python do_qa_configure() {
     configs = []
     workdir = bb.data.getVar('WORKDIR', d, True)
@@ -585,21 +577,28 @@ Rerun configure task after fixing this. The path was '%s'""" % root)
         if "configure.in" in files:
             configs.append(os.path.join(root, "configure.in"))
 
-    if "gettext" not in bb.data.getVar('P', d, True) and "gcc-runtime" not in bb.data.getVar('P', d, True):
+    cnf = bb.data.getVar('EXTRA_OECONF', d, True) or ""
+    if "gettext" not in bb.data.getVar('P', d, True) and "gcc-runtime" not in bb.data.getVar('P', d, True) and "--disable-nls" not in cnf:
        if bb.data.inherits_class('native', d) or bb.data.inherits_class('cross', d) or bb.data.inherits_class('crosssdk', d) or bb.data.inherits_class('nativesdk', d):
           gt = "gettext-native"
        elif bb.data.inherits_class('cross-canadian', d):
           gt = "gettext-nativesdk"
        else:
-          gt = "gettext"
+          gt = "virtual/libintl"
        deps = bb.utils.explode_deps(bb.data.getVar('DEPENDS', d, True) or "")
        if gt not in deps:
           for config in configs:
               gnu = "grep \"^[[:space:]]*AM_GNU_GETTEXT\" %s >/dev/null" % config
               if os.system(gnu) == 0:
-                 bb.fatal("""Gettext required but not in DEPENDS for file %s.
-Missing inherit gettext?""" % config)
+                 bb.fatal("""%s required but not in DEPENDS for file %s. Missing inherit gettext?""" % (gt, config))
 
     if not package_qa_check_license(workdir, d):
         bb.fatal("Licensing Error: LIC_FILES_CHKSUM does not match, please fix")
 }
+do_populate_sysroot[postfuncs] += "do_qa_staging "
+
+# Check broken config.log files, for packages requiring Gettext which don't
+# have it in DEPENDS and for correct LIC_FILES_CHKSUM
+#addtask qa_configure after do_configure before do_compile
+
+do_configure[postfuncs] += "do_qa_configure "
-- 
1.7.4.1



