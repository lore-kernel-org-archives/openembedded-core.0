Return-Path: <Kai.Kang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 458ED6077F
	for <openembedded-core@lists.openembedded.org>;
	Fri,  5 Jul 2013 10:18:26 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id r65AISaH020871
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Fri, 5 Jul 2013 03:18:28 -0700 (PDT)
Received: from pek-kkang-d1.wrs.com (128.224.162.231) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server
	(TLS) id 14.2.342.3; Fri, 5 Jul 2013 03:18:27 -0700
From: Kai Kang <kai.kang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 5 Jul 2013 18:18:10 +0800
Message-ID: <ad3f4d6ee33d595f6771547a94c65e99c9a56c8f.1373019324.git.kai.kang@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1373019324.git.kai.kang@windriver.com>
References: <cover.1373019324.git.kai.kang@windriver.com>
MIME-Version: 1.0
X-Originating-IP: [128.224.162.231]
Cc: wenzhong.fan@windriver.com
Subject: [PATCH 1/2] webkit: set COMPATIBLE_HOST for mips64
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 05 Jul 2013 10:18:26 -0000
Content-Type: text/plain

webkit packages can NOT be built for mips64 with 64 bit userspace. Set
COMPATIBLE_HOST to to block them build for such platform.

Signed-off-by: Kai Kang <kai.kang@windriver.com>
---
 meta/recipes-sato/web/web-webkit_git.bb      |    3 +++
 meta/recipes-sato/webkit/webkit-gtk_1.8.3.bb |    3 +++
 2 files changed, 6 insertions(+)

diff --git a/meta/recipes-sato/web/web-webkit_git.bb b/meta/recipes-sato/web/web-webkit_git.bb
index 0c79324..b335800 100644
--- a/meta/recipes-sato/web/web-webkit_git.bb
+++ b/meta/recipes-sato/web/web-webkit_git.bb
@@ -21,6 +21,9 @@ S = "${WORKDIR}/git"
 
 EXTRA_OECONF = "--enable-libowl"
 
+# web-webkit could NOT be built on MIPS64 with 64 bits userspace
+COMPATIBLE_HOST_mips64 = "mips64.*-linux-gnun32"
+
 inherit autotools pkgconfig
 
 FILES_${PN} += "${datadir}/web2"
diff --git a/meta/recipes-sato/webkit/webkit-gtk_1.8.3.bb b/meta/recipes-sato/webkit/webkit-gtk_1.8.3.bb
index ed98b30..5691d3f 100644
--- a/meta/recipes-sato/webkit/webkit-gtk_1.8.3.bb
+++ b/meta/recipes-sato/webkit/webkit-gtk_1.8.3.bb
@@ -31,6 +31,9 @@ SRC_URI = "\
 SRC_URI[md5sum] = "dcbf9d5e2e6391f857c29a57528b32a6"
 SRC_URI[sha256sum] = "ada02d636af61aed38f142d3cded662d141ce71264f624c4eb873621a74cc9e7"
 
+# webkit-gtk can NOT be built on MIPS64 with 64 bits userspace
+COMPATIBLE_HOST_mips64 = "mips64.*-linux-gnun32"
+
 inherit autotools lib_package gtk-doc pkgconfig
 
 S = "${WORKDIR}/webkit-${PV}/"
-- 
1.7.9.5


