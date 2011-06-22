Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mark.hatle@windriver.com>) id 1QZREz-00084r-Cz
	for openembedded-core@lists.openembedded.org;
	Wed, 22 Jun 2011 19:29:28 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id p5MHPoY9026884
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Jun 2011 10:25:50 -0700 (PDT)
Received: from localhost.localdomain (172.25.34.61) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.1.255.0;
	Wed, 22 Jun 2011 10:25:49 -0700
From: Mark Hatle <mark.hatle@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 22 Jun 2011 12:36:29 -0500
Message-ID: <7b79e04d0a76dbcb8070f561c7bac8b9f39acb51.1308763995.git.mark.hatle@windriver.com>
X-Mailer: git-send-email 1.7.3.4
In-Reply-To: <cover.1308763995.git.mark.hatle@windriver.com>
References: <cover.1308763995.git.mark.hatle@windriver.com>
MIME-Version: 1.0
X-Originating-IP: [172.25.34.61]
Subject: [PATCH 35/40] db: Fix file ownership
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

Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
---
 meta/recipes-support/db/db_5.1.19.bb |    6 ++++++
 1 files changed, 6 insertions(+), 0 deletions(-)

diff --git a/meta/recipes-support/db/db_5.1.19.bb b/meta/recipes-support/db/db_5.1.19.bb
index fc87c31..c5047b6 100644
--- a/meta/recipes-support/db/db_5.1.19.bb
+++ b/meta/recipes-support/db/db_5.1.19.bb
@@ -80,6 +80,10 @@ do_configure() {
 	oe_runconf
 }
 
+FIX_OWNERS = "chown -R root:root ${D}"
+FIX_OWNERS_virtclass-native = ""
+FIX_OWNERS_virtclass-nativesdk = ""
+
 do_install_append() {
 	mkdir -p ${D}/${includedir}/db51
 	#mv ${D}/${includedir}/db_185.h ${D}/${includedir}/db51/.
@@ -98,6 +102,8 @@ do_install_append() {
 		test ! -d "${D}/${docdir}" || rm -rf "${D}/${docdir}"
 		mv "${D}/${prefix}/docs" "${D}/${docdir}"
 	fi
+
+	test -n "${FIX_OWNERS}" && eval ${FIX_OWNERS} || :
 }
 
 BBCLASSEXTEND = "native nativesdk"
-- 
1.7.3.4



