Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mark.hatle@windriver.com>) id 1ROZQI-0002NZ-1j
	for openembedded-core@lists.openembedded.org;
	Thu, 10 Nov 2011 19:32:26 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id pAAIQ8ao024459
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 10 Nov 2011 10:26:08 -0800 (PST)
Received: from localhost.localdomain (172.25.34.61) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.1.255.0;
	Thu, 10 Nov 2011 10:26:08 -0800
From: Mark Hatle <mark.hatle@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 10 Nov 2011 12:30:42 -0600
Message-ID: <4a94ca52b23be310c05f95cd39608b15ddfe720d.1320949721.git.mark.hatle@windriver.com>
X-Mailer: git-send-email 1.7.3.4
In-Reply-To: <cover.1320949721.git.mark.hatle@windriver.com>
References: <cover.1320949721.git.mark.hatle@windriver.com>
MIME-Version: 1.0
X-Originating-IP: [172.25.34.61]
Subject: [PATCH 5/5] sudo: Avoid post install scripts
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
X-List-Received-Date: Thu, 10 Nov 2011 18:32:26 -0000
Content-Type: text/plain

The post install script was removed, and the install_append updated
to ensure the permissions are set correctly.

Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
---
 meta/recipes-extended/sudo/sudo.inc      |    8 --------
 meta/recipes-extended/sudo/sudo_1.8.3.bb |    5 ++++-
 2 files changed, 4 insertions(+), 9 deletions(-)

diff --git a/meta/recipes-extended/sudo/sudo.inc b/meta/recipes-extended/sudo/sudo.inc
index 72a7c16..83dd209 100644
--- a/meta/recipes-extended/sudo/sudo.inc
+++ b/meta/recipes-extended/sudo/sudo.inc
@@ -29,11 +29,3 @@ do_install_prepend (){
 	mkdir -p ${D}/${localstatedir}/lib
 }
 
-pkg_postinst_${PN} () {
-	if [ "x$D" != "x" ]; then
-		exit 1
-	fi
-
-	chmod 4111 /usr/bin/sudo
-	chmod 0440 /etc/sudoers
-}
diff --git a/meta/recipes-extended/sudo/sudo_1.8.3.bb b/meta/recipes-extended/sudo/sudo_1.8.3.bb
index 0ac0851..99fe5b9 100644
--- a/meta/recipes-extended/sudo/sudo_1.8.3.bb
+++ b/meta/recipes-extended/sudo/sudo_1.8.3.bb
@@ -1,6 +1,6 @@
 require sudo.inc
 
-PR = "r0"
+PR = "r1"
 
 SRC_URI = "http://ftp.sudo.ws/sudo/dist/sudo-${PV}.tar.gz \
            file://libtool.patch \
@@ -23,4 +23,7 @@ do_install_append () {
 			break
 		fi
 	done
+
+	chmod 4111 $D/usr/bin/sudo
+	chmod 0440 $D/etc/sudoers
 }
-- 
1.7.3.4



