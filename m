Received: from mail.cvg.de ([62.153.82.30])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <enrico.scholz@sigma-chemnitz.de>) id 1RlNnA-0001WV-Tj
	for openembedded-core@lists.openembedded.org;
	Thu, 12 Jan 2012 17:46:21 +0100
Received: from ensc-virt.intern.sigma-chemnitz.de
	(ensc-virt.intern.sigma-chemnitz.de [192.168.3.24])
	by mail.cvg.de (8.14.4/8.14.4) with SMTP id q0CGck6m001131
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Thu, 12 Jan 2012 17:38:47 +0100
Received: by ensc-virt.intern.sigma-chemnitz.de (sSMTP sendmail emulation);
	Thu, 12 Jan 2012 17:38:46 +0100
From: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
To: openembedded-core@lists.openembedded.org
Date: Thu, 12 Jan 2012 17:38:14 +0100
Message-Id: <1326386296-1526-3-git-send-email-enrico.scholz@sigma-chemnitz.de>
X-Mailer: git-send-email 1.7.7.5
In-Reply-To: <1326386296-1526-1-git-send-email-enrico.scholz@sigma-chemnitz.de>
References: <1326386296-1526-1-git-send-email-enrico.scholz@sigma-chemnitz.de>
X-DSPAM-Result: Innocent
X-DSPAM-Probability: 0
X-DSPAM-Confidence: 1
X-Spam-Score: -5.8
X-Spam-Level: -----
X-Spam-Tests: AWL,BAYES_00,SPF_NEUTRAL,T_RP_MATCHES_RCVD,DSPAM_INNOCENT
X-Scanned-By: MIMEDefang 2.72 on 62.153.82.30
Cc: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
Subject: [PATCH 2/4] distcc: honor x11 DISTRO_FEATURE
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
X-List-Received-Date: Thu, 12 Jan 2012 16:46:21 -0000

'distcc' can be used on headless system and it is desirable to avoid
building of the gnome/gtk+ stacks.

Signed-off-by: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
---
 meta/recipes-devtools/distcc/distcc_2.18.3.bb |    5 +++--
 1 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-devtools/distcc/distcc_2.18.3.bb b/meta/recipes-devtools/distcc/distcc_2.18.3.bb
index ec6ffb3..8ceff9d 100644
--- a/meta/recipes-devtools/distcc/distcc_2.18.3.bb
+++ b/meta/recipes-devtools/distcc/distcc_2.18.3.bb
@@ -8,7 +8,7 @@ PR = "r7"
 
 DEPENDS = "avahi ${GTKDEP}"
 GTKDEP_libc-uclibc = ""
-GTKDEP = "gtk+"
+GTKDEP = "${@base_contains('DISTRO_FEATURES', 'x11', 'gtk+', '', d)}"
 
 RRECOMMENDS_${PN} = "avahi-daemon"
 
@@ -28,7 +28,8 @@ inherit autotools pkgconfig update-rc.d
 
 INITSCRIPT_NAME = "distcc"
 
-EXTRA_OECONF = "--with-gtk"
+EXTRA_OECONF = "${@base_contains('DISTRO_FEATURES', 'x11', \
+  '--with-gtk', '--without-gtk --without-gnome', d)}"
 EXTRA_OECONF_libc-uclibc = "--without-gtk --without-gnome"
 do_install_append() {
     install -d ${D}${sysconfdir}/init.d/
-- 
1.7.7.5



