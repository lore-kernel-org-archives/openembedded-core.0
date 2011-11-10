Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mark.hatle@windriver.com>) id 1ROZQG-0002NN-As
	for openembedded-core@lists.openembedded.org;
	Thu, 10 Nov 2011 19:32:24 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id pAAIQ6uV024451
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 10 Nov 2011 10:26:07 -0800 (PST)
Received: from localhost.localdomain (172.25.34.61) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.1.255.0;
	Thu, 10 Nov 2011 10:26:06 -0800
From: Mark Hatle <mark.hatle@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 10 Nov 2011 12:30:40 -0600
Message-ID: <7f6e526f7386df8b243af0fda0faf23231faa4f3.1320949721.git.mark.hatle@windriver.com>
X-Mailer: git-send-email 1.7.3.4
In-Reply-To: <cover.1320949721.git.mark.hatle@windriver.com>
References: <cover.1320949721.git.mark.hatle@windriver.com>
MIME-Version: 1.0
X-Originating-IP: [172.25.34.61]
Subject: [PATCH 3/5] wpa-supplicant: Avoid blocking the post install script at cross rootfs time.
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
X-List-Received-Date: Thu, 10 Nov 2011 18:32:24 -0000
Content-Type: text/plain

We only want to reload dbus, if we're install on the target -- not on the host.

Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
---
 .../wpa-supplicant/wpa-supplicant-0.7.inc          |    4 ++--
 .../wpa-supplicant/wpa-supplicant_0.7.3.bb         |    2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant-0.7.inc b/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant-0.7.inc
index cd62d8f..ccdc4c3 100644
--- a/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant-0.7.inc
+++ b/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant-0.7.inc
@@ -66,9 +66,9 @@ do_install () {
 }
 
 pkg_postinst_wpa-supplicant () {
-	# can't do this offline
+	# If we're offline, we don't need to do this.
 	if [ "x$D" != "x" ]; then
-		exit 1
+		exit 0
 	fi
 
 	DBUSPID=`pidof dbus-daemon`
diff --git a/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant_0.7.3.bb b/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant_0.7.3.bb
index 03bd937..98eba77 100644
--- a/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant_0.7.3.bb
+++ b/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant_0.7.3.bb
@@ -1,6 +1,6 @@
 require wpa-supplicant-0.7.inc
 
-PR = "r4"
+PR = "r5"
 
 SRC_URI[md5sum] = "f516f191384a9a546e3f5145c08addda"
 SRC_URI[sha256sum] = "d0cd50caa85346ccc376dcda5ed3c258eef19a93b3cade39d25760118ad59443"
-- 
1.7.3.4



