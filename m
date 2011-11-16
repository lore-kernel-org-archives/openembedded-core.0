Received: from sirius.lasnet.de ([78.47.116.19])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <jluebbe@lasnet.de>) id 1RQni6-0003wZ-Ow
	for openembedded-core@lists.openembedded.org;
	Wed, 16 Nov 2011 23:12:02 +0100
Received: from f053153178.adsl.alicedsl.de ([78.53.153.178]
	helo=polaris.fritz.box) by sirius.lasnet.de with esmtpsa 
	(Cipher TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32) (Exim 4.69 #1)
	id 1RQnbt-0001dG-Pg by authid <polaris@lasnet.de> with
	srv_auth_cram_md5 for <openembedded-core@lists.openembedded.org>;
	Wed, 16 Nov 2011 23:05:40 +0100
From: Jan Luebbe <jluebbe@debian.org>
To: openembedded-core@lists.openembedded.org
Date: Wed, 16 Nov 2011 23:05:30 +0100
Message-Id: <1321481130-14072-1-git-send-email-jluebbe@debian.org>
X-Mailer: git-send-email 1.7.7.2
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on sirius.lasnet.de
X-Spam-Level: 
X-Spam-Status: No, score=-4.3 required=5.0 tests=ALL_TRUSTED,AWL,BAYES_00
	autolearn=ham version=3.2.5
Subject: [PATCH] libpcap: use binconfig class to deploy pcap-config
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
X-List-Received-Date: Wed, 16 Nov 2011 22:12:02 -0000

This fixes building of tcpdump on hosts where libpcap-dev is installed.
Also introduce INC_PR.

Signed-off-by: Jan Luebbe <jluebbe@debian.org>
---
 meta/recipes-connectivity/libpcap/libpcap.inc      |    4 +++-
 meta/recipes-connectivity/libpcap/libpcap_1.1.1.bb |    2 +-
 2 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-connectivity/libpcap/libpcap.inc b/meta/recipes-connectivity/libpcap/libpcap.inc
index 2737dbe..84001e5 100644
--- a/meta/recipes-connectivity/libpcap/libpcap.inc
+++ b/meta/recipes-connectivity/libpcap/libpcap.inc
@@ -10,9 +10,11 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=1d4b0366557951c84a94fabe3529f867 \
                     file://pcap.h;beginline=1;endline=34;md5=8d6cf7e17d5745010d633e30bc529ea9"
 DEPENDS = "flex-native bison-native"
 
+INC_PR = "r1"
+
 SRC_URI = "http://www.tcpdump.org/release/libpcap-${PV}.tar.gz"
 
-inherit autotools
+inherit autotools binconfig
 
 EXTRA_OECONF = "--with-pcap=linux"
 
diff --git a/meta/recipes-connectivity/libpcap/libpcap_1.1.1.bb b/meta/recipes-connectivity/libpcap/libpcap_1.1.1.bb
index de04290..2700bb7 100644
--- a/meta/recipes-connectivity/libpcap/libpcap_1.1.1.bb
+++ b/meta/recipes-connectivity/libpcap/libpcap_1.1.1.bb
@@ -1,6 +1,6 @@
 require libpcap.inc
 
-PR = "r0"
+PR = "${INC_PR}.0"
 
 SRC_URI += "file://aclocal.patch \
             file://ieee80215-arphrd.patch"
-- 
1.7.7.2



