Received: from mail-da0-f43.google.com ([209.85.210.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <kergoth@gmail.com>) id 1Top4B-00076a-Kr
	for openembedded-core@lists.openembedded.org;
	Sat, 29 Dec 2012 06:34:41 +0100
Received: by mail-da0-f43.google.com with SMTP id u36so5060869dak.16
	for <openembedded-core@lists.openembedded.org>;
	Fri, 28 Dec 2012 21:19:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
	:references:in-reply-to:references;
	bh=4RbpM9sruiuob0eQ19Mug2JGojxLAswGpbDSjqzgYy0=;
	b=iiJCw5mEtI7lC76pIOwVF/GoNjchKLCoJxBW4VzpaDa8oP65y7c6SqVKZRuDEiaDwV
	XwfGGyi8Cqezlhn/5qnqOYQlcfReK6orvCJdCvl+b5vF8oKFOI7GJstpGNXgPENygovK
	2Ugm5bh6Jqm74oYqWxCZ+3L4J7J2MQihzLrWpPR/09fsVQka5T/tuMGf04H4jni2m1mg
	iy0k7HJFzaUWbam6Ww0oHp4S/k+g/HRnSEi3GIzQqzmNEj3iQvXs9/OwHVHEEIjSCAhg
	62i+sU9wUNCXeaKs5tTQAqYtAVRuGVMp5Veo0rAyErumkyWl1dIphrj0eVR0LA48SuPQ
	wL6g==
X-Received: by 10.68.228.2 with SMTP id se2mr111553072pbc.93.1356758382615;
	Fri, 28 Dec 2012 21:19:42 -0800 (PST)
Received: from precise64.alm.mentorg.com (nat-lmt.mentorg.com. [139.181.28.34])
	by mx.google.com with ESMTPS id vs3sm20848581pbc.61.2012.12.28.21.19.40
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 28 Dec 2012 21:19:41 -0800 (PST)
From: Christopher Larson <kergoth@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 28 Dec 2012 22:19:25 -0700
Message-Id: <f20574f0dceb52ddfb093c4867536859cc9c25e1.1356758000.git.chris_larson@mentor.com>
X-Mailer: git-send-email 1.8.0
In-Reply-To: <cover.1356758000.git.chris_larson@mentor.com>
References: <cover.1356758000.git.chris_larson@mentor.com>
In-Reply-To: <cover.1356758000.git.chris_larson@mentor.com>
References: <cover.1356758000.git.chris_larson@mentor.com>
Cc: Christopher Larson <chris_larson@mentor.com>
Subject: [PATCH 3/6] chkconfig: don't inherit autotools
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
X-List-Received-Date: Sat, 29 Dec 2012 05:34:41 -0000

From: Christopher Larson <chris_larson@mentor.com>

This buildsystem is not autoconf/automake, but make.

While we're at it, also make the install not hardcode the path to
/usr/share/locale.

Signed-off-by: Christopher Larson <chris_larson@mentor.com>
---
 .../recipes-extended/chkconfig/chkconfig_1.3.58.bb | 24 ++++++++++++++--------
 1 file changed, 15 insertions(+), 9 deletions(-)

diff --git a/meta/recipes-extended/chkconfig/chkconfig_1.3.58.bb b/meta/recipes-extended/chkconfig/chkconfig_1.3.58.bb
index fd7bd1a..7915594 100644
--- a/meta/recipes-extended/chkconfig/chkconfig_1.3.58.bb
+++ b/meta/recipes-extended/chkconfig/chkconfig_1.3.58.bb
@@ -12,23 +12,29 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=5574c6965ae5f583e55880e397fbb018"
 
 DEPENDS = "libnewt popt"
 
-PR = "r4"
+PR = "r5"
 
 SRC_URI = "http://fedorahosted.org/releases/c/h/chkconfig/${BPN}-${PV}.tar.bz2"
 
 SRC_URI[md5sum] = "c2039ca67f2749fe0c06ef7c6f8ee246"
 SRC_URI[sha256sum] = "18b497d25b2cada955c72810e45fcad8280d105f17cf45e2970f18271211de68"
 
-inherit autotools gettext
+inherit gettext
 
-# Makefile uses RPM_OPT_fLAGS to construct CFLAGS
+# Makefile uses RPM_OPT_FLAGS to construct CFLAGS
 #
-EXTRA_OEMAKE += 'RPM_OPT_FLAGS="${CFLAGS}" MANDIR="${mandir}" \
-                 BINDIR="${base_sbindir}" SBINDIR="${sbindir}"'
-
-do_install_append() {
-    mkdir -p ${D}${sysconfdir}/chkconfig.d
-    rm -f ${D}${sbindir}/update-alternatives
+EXTRA_OEMAKE = "\
+    'RPM_OPT_FLAGS=${CFLAGS}' \
+    'LDFLAGS=${LDFLAGS}' \
+    'BINDIR=${base_sbindir}' \
+    'SBINDIR=${sbindir}' \
+    'MANDIR=${mandir}' \
+"
+
+do_install() {
+	oe_runmake 'DESTDIR=${D}' 'INSTALLNLSDIR=${D}${datadir}/locale' install
+	mkdir -p ${D}${sysconfdir}/chkconfig.d
+	rm -f ${D}${sbindir}/update-alternatives
 }
 
 do_install_append_linuxstdbase() {
-- 
1.8.0



