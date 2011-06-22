Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mark.hatle@windriver.com>) id 1QZRF2-000854-Lw
	for openembedded-core@lists.openembedded.org;
	Wed, 22 Jun 2011 19:29:29 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id p5MHPrao026902
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Jun 2011 10:25:53 -0700 (PDT)
Received: from localhost.localdomain (172.25.34.61) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.1.255.0;
	Wed, 22 Jun 2011 10:25:53 -0700
From: Mark Hatle <mark.hatle@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 22 Jun 2011 12:36:31 -0500
Message-ID: <5ce881c3697d8314d75b4399cab7c035336a3c6c.1308763995.git.mark.hatle@windriver.com>
X-Mailer: git-send-email 1.7.3.4
In-Reply-To: <cover.1308763995.git.mark.hatle@windriver.com>
References: <cover.1308763995.git.mark.hatle@windriver.com>
MIME-Version: 1.0
X-Originating-IP: [172.25.34.61]
Subject: [PATCH 37/40] dropbear: Don't patch in configure
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
X-List-Received-Date: Wed, 22 Jun 2011 17:29:30 -0000
Content-Type: text/plain

We need to avoid applying a patch in configure, because a rebuild could
trigger this, without triggering do_patch.

Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
---
 meta/recipes-core/dropbear/dropbear.inc     |    4 +++-
 meta/recipes-core/dropbear/dropbear_0.52.bb |    2 +-
 2 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-core/dropbear/dropbear.inc b/meta/recipes-core/dropbear/dropbear.inc
index e9290ff..c9c41d2 100644
--- a/meta/recipes-core/dropbear/dropbear.inc
+++ b/meta/recipes-core/dropbear/dropbear.inc
@@ -32,13 +32,15 @@ EXTRA_OEMAKE = 'MULTI=1 SCPPROGRESS=1 PROGRAMS="${SBINCOMMANDS} ${BINCOMMANDS}"'
 
 DISTRO_TYPE = "${@base_contains("IMAGE_FEATURES", "debug-tweaks", "debug", "",d)}"
 
-do_configure_prepend() {
+do_debug_patch() {
 	if [ "${DISTRO_TYPE}" = "debug" ]; then
 		bbnote "WARNING: applying allow-nopw.patch which allows password-less logins!"
 		patch -p1 < ${WORKDIR}/allow-nopw.patch
 	fi
 }
 
+addtask do_debug_patch after do_patch before do_configure
+
 do_install() {
 	install -d ${D}${sysconfdir} \
 		   ${D}${sysconfdir}/init.d \
diff --git a/meta/recipes-core/dropbear/dropbear_0.52.bb b/meta/recipes-core/dropbear/dropbear_0.52.bb
index 912054c..78d6cf1 100644
--- a/meta/recipes-core/dropbear/dropbear_0.52.bb
+++ b/meta/recipes-core/dropbear/dropbear_0.52.bb
@@ -3,4 +3,4 @@ require dropbear.inc
 SRC_URI[md5sum] = "1c69ec674481d7745452f68f2ea5597e"
 SRC_URI[sha256sum] = "e3a2ca49ed85ce562240c0ac06e2f72826d7e52a83e80d91c067c8b97bf5c108"
 
-PR = "r1"
+PR = "r2"
-- 
1.7.3.4



