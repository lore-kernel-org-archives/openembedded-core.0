Received: from mail-pz0-f47.google.com ([209.85.210.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1QNZ1r-00017w-Nv
	for openembedded-core@lists.openembedded.org;
	Sat, 21 May 2011 01:22:48 +0200
Received: by pzk36 with SMTP id 36so1940223pzk.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 20 May 2011 16:19:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:from:to:cc:subject:date:message-id:x-mailer
	:in-reply-to:references:in-reply-to:references;
	bh=Iyhmaa0M6w9fHFGdsL9PRT4Mz3jm1Oq+mJunv87cOLg=;
	b=c+iXf8yYS6aPEyz4LbKYDtYfkftJmPiJtPw7aX/JBp1usq8dmOMJ/1o+LixgkCKATy
	AoPDryazXQ2+YUMr+S00TlcFtkPcFerfkClPCHdWgI3hSvy1HiBVeYMVbZibi1Fuc3eA
	7dWuFEAa8fsHvFM8ooRk9bWhujzQAkQQMVdnM=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	b=nvXVzS++4dy4yBc5qmxkjWBOZD+Qdt36FgUmtvaS9CE+cKeHGLQOAvJPDcTEOcsEih
	Vr1Tz1jfEOSnmjQorpiPBUUdBTrEc6ukMBy2s1NKs79kVZXlxscCpfS4kl4i5J+Elez4
	aY5Di1ueBN4Cy5TnUkEAZJS2kSoWjW6sR2+sc=
Received: by 10.142.13.5 with SMTP id 5mr20402wfm.426.1305933588070;
	Fri, 20 May 2011 16:19:48 -0700 (PDT)
Received: from localhost.localdomain
	(99-57-141-118.lightspeed.sntcca.sbcglobal.net [99.57.141.118])
	by mx.google.com with ESMTPS id x15sm2787929wfd.0.2011.05.20.16.19.46
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 20 May 2011 16:19:47 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: OE core <openembedded-core@lists.openembedded.org>
Date: Fri, 20 May 2011 16:19:32 -0700
Message-Id: <63425ea09b30c9cca10c25bc559ed6f22022c4b6.1305933509.git.raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.4.1
In-Reply-To: <43cfb965113150ea56c55c3880b67ba272b3c719.1305933509.git.raj.khem@gmail.com>
References: <43cfb965113150ea56c55c3880b67ba272b3c719.1305933509.git.raj.khem@gmail.com>
In-Reply-To: <cover.1305933509.git.raj.khem@gmail.com>
References: <cover.1305933509.git.raj.khem@gmail.com>
Subject: [PATCH 2/2] distcc_2.18.3.bb: Fix compilation on uclibc
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
X-List-Received-Date: Fri, 20 May 2011 23:22:48 -0000

We enable gtk/gnome in distcc that code uses loadavg()
a function unimplemented in uclibc. Therefore for uclibc
we disable gnome and gtk+ features in distcc

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-devtools/distcc/distcc_2.18.3.bb |   17 ++++++++++++-----
 1 files changed, 12 insertions(+), 5 deletions(-)

diff --git a/meta/recipes-devtools/distcc/distcc_2.18.3.bb b/meta/recipes-devtools/distcc/distcc_2.18.3.bb
index 1f5c2af..a15858c 100644
--- a/meta/recipes-devtools/distcc/distcc_2.18.3.bb
+++ b/meta/recipes-devtools/distcc/distcc_2.18.3.bb
@@ -6,7 +6,10 @@ LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f"
 PR = "r6"
 
-DEPENDS = "avahi gtk+"
+DEPENDS = "avahi ${GTKDEP}"
+GTKDEP-libc-uclibc = ""
+GTKDEP = "gtk+"
+
 RRECOMMENDS_${PN} = "avahi-daemon"
 
 # Upstream change this patch periodically so store locally
@@ -24,17 +27,21 @@ inherit autotools pkgconfig update-rc.d
 
 INITSCRIPT_NAME = "distcc"
 
-EXTRA_OECONF = " --with-gtk "
-
+EXTRA_OECONF_libc-glibc = " --with-gtk "
+EXTRA_OECONF_libc-uclibc = " --without-gtk --without-gnome "
 do_install_append() {
     install -d ${D}${sysconfdir}/init.d/
     install -d ${D}${sysconfdir}/default
     install -m 0755 ${WORKDIR}/distcc ${D}${sysconfdir}/init.d/
     install -m 0755 ${WORKDIR}/default ${D}${sysconfdir}/default/distcc
+    ${DESKTOPINSTALL}
+}
+DESKTOPINSTALL = ""
+DESKTOPINSTALL_libc-glibc () {
+    install -d ${D}${datadir}/distcc/
     install -m 0644 ${WORKDIR}/distccmon-gnome.desktop ${D}${datadir}/distcc/
 }
-
-PACKAGES += "distcc-distmon-gnome"
+PACKAGES_append_libc-glibc = " distcc-distmon-gnome"
 
 FILES_${PN} = " ${sysconfdir} \
 		${bindir}/distcc \
-- 
1.7.4.1



