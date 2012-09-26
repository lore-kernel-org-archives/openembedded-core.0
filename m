Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Xin.Ouyang@windriver.com>) id 1TGlwa-0005zr-QR
	for openembedded-core@lists.openembedded.org;
	Wed, 26 Sep 2012 09:22:06 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id q8Q79ERW010395
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 26 Sep 2012 00:09:14 -0700 (PDT)
Received: from Xouyang-Ubuntu.corp.ad.wrs.com (128.224.162.239) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.2.309.2; Wed, 26 Sep 2012 00:09:13 -0700
From: Xin Ouyang <Xin.Ouyang@windriver.com>
To: <openembedded-core@lists.openembedded.org>,
	<openembedded-core@www.linuxtogo.org>
Date: Wed, 26 Sep 2012 15:09:13 +0800
Message-ID: <1348643353-32175-1-git-send-email-Xin.Ouyang@windriver.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Subject: [PATCH] at: atd remove useless --make-pidfile option.
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
X-List-Received-Date: Wed, 26 Sep 2012 07:22:06 -0000
Content-Type: text/plain

For start-stop-daemon, --make-pidfile is used when starting a
program that does not create its own pid file.
atd would create its own /var/run/atd.pid, so remove this option.

Signed-off-by: Xin Ouyang <Xin.Ouyang@windriver.com>
---
 meta/recipes-extended/at/at_3.1.13.bb |    2 +-
 meta/recipes-extended/at/files/S99at  |    2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-extended/at/at_3.1.13.bb b/meta/recipes-extended/at/at_3.1.13.bb
index a391d6e..3580e09 100644
--- a/meta/recipes-extended/at/at_3.1.13.bb
+++ b/meta/recipes-extended/at/at_3.1.13.bb
@@ -11,7 +11,7 @@ PAM_DEPS = "libpam libpam-runtime pam-plugin-env pam-plugin-limits"
 
 RCONFLICTS_${PN} = "atd"
 RREPLACES_${PN} = "atd"
-PR = "r3"
+PR = "r4"
 
 SRC_URI = "${DEBIAN_MIRROR}/main/a/at/at_${PV}.orig.tar.gz \
     file://configure.patch \
diff --git a/meta/recipes-extended/at/files/S99at b/meta/recipes-extended/at/files/S99at
index bcfcbda..386f8a4 100644
--- a/meta/recipes-extended/at/files/S99at
+++ b/meta/recipes-extended/at/files/S99at
@@ -7,7 +7,7 @@ umask 077
 
 start() {
 	echo -n "Starting atd: "
-	start-stop-daemon --start --quiet --make-pidfile --pidfile /var/run/atd.pid --background --exec /usr/sbin/atd -- -f
+	start-stop-daemon --start --quiet --pidfile /var/run/atd.pid --background --exec /usr/sbin/atd -- -f
 	echo "OK"
 }
 stop() {
-- 
1.7.9.5



