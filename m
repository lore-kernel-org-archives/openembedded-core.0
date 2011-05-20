Received: from mail-pv0-f175.google.com ([74.125.83.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1QNDDh-0002v5-RL
	for openembedded-core@lists.openembedded.org;
	Fri, 20 May 2011 02:05:34 +0200
Received: by mail-pv0-f175.google.com with SMTP id 30so1479835pvc.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 May 2011 17:02:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:from:to:cc:subject:date:message-id:x-mailer
	:in-reply-to:references:in-reply-to:references;
	bh=AvJK8KfmY/47IqoWJisILUfkEgMg6jBrQxHkHMWnXPQ=;
	b=jX9SNd19bqVFsmVDIC+WfBHlJoFClCcViuX+xj71+QaPftoBlA/SN8aBf4VYB5otsq
	lYA5L9Qe2DHDb+raNdQgLebgOfJQlAqk3HswxIc/07g6Qw4mBC+0rVZDwtNckid2ZUmi
	0ehxFBzDT13XA1lLkEIcPsGogE3lxxizK7OoY=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	b=G55SxxwU4hl/7n5P/PXzG2XdEZzZSl0oX9iT8HmgeRndtDeIUEDYMm9aq9cheLikiv
	zoe9hAV/PXaj0FmfxZaHQEOaZa735Jdy4ZUhvKhho4U6gP55M+oP6vWEZRBCI4pJICdE
	wPMIyNXhO1Thn6A2gg0P7DBN32H1lJZCD0hwg=
Received: by 10.68.69.114 with SMTP id d18mr5835194pbu.275.1305849758102;
	Thu, 19 May 2011 17:02:38 -0700 (PDT)
Received: from localhost.localdomain
	(99-57-141-118.lightspeed.sntcca.sbcglobal.net [99.57.141.118])
	by mx.google.com with ESMTPS id w1sm2072427pbf.1.2011.05.19.17.02.35
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 19 May 2011 17:02:36 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: OE core <openembedded-core@lists.openembedded.org>
Date: Thu, 19 May 2011 17:02:20 -0700
Message-Id: <d95f77d22bbe7bf5718516f667b3e1433757c861.1305849572.git.raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.4.1
In-Reply-To: <2cc9510de67bbf735856adb033c2eb352ffedc04.1305849572.git.raj.khem@gmail.com>
References: <2cc9510de67bbf735856adb033c2eb352ffedc04.1305849572.git.raj.khem@gmail.com>
In-Reply-To: <cover.1305849572.git.raj.khem@gmail.com>
References: <cover.1305849572.git.raj.khem@gmail.com>
Subject: [PATCHv2 2/3] distcc_2.18.3.bb: Fix compilation on uclibc
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
X-List-Received-Date: Fri, 20 May 2011 00:05:34 -0000

We enable gtk/gnome in distcc that code uses loadavg()
a function unimplemented in uclibc. Therefore for uclibc
we disable gnome and gtk+ features in distcc

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-devtools/distcc/distcc_2.18.3.bb |   15 ++++++++++-----
 1 files changed, 10 insertions(+), 5 deletions(-)

diff --git a/meta/recipes-devtools/distcc/distcc_2.18.3.bb b/meta/recipes-devtools/distcc/distcc_2.18.3.bb
index 1f5c2af..e73ce16 100644
--- a/meta/recipes-devtools/distcc/distcc_2.18.3.bb
+++ b/meta/recipes-devtools/distcc/distcc_2.18.3.bb
@@ -6,7 +6,8 @@ LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f"
 PR = "r6"
 
-DEPENDS = "avahi gtk+"
+DEPENDS = "avahi"
+DEPENDS_append-libc-glibc = " gtk+ "
 RRECOMMENDS_${PN} = "avahi-daemon"
 
 # Upstream change this patch periodically so store locally
@@ -24,17 +25,21 @@ inherit autotools pkgconfig update-rc.d
 
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



