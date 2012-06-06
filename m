Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mark.hatle@windriver.com>) id 1ScHgJ-0002GD-Hu
	for openembedded-core@lists.openembedded.org;
	Wed, 06 Jun 2012 16:57:57 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail1.windriver.com (8.14.3/8.14.3) with ESMTP id q56ElSX3008583
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 6 Jun 2012 07:47:28 -0700 (PDT)
Received: from localhost.localdomain (172.25.34.61) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.1.255.0;
	Wed, 6 Jun 2012 07:47:27 -0700
From: Mark Hatle <mark.hatle@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 6 Jun 2012 09:53:14 -0500
Message-ID: <7778cab45de11f7677bc0ac9749e41cc6dc84759.1338994308.git.mark.hatle@windriver.com>
X-Mailer: git-send-email 1.7.3.4
In-Reply-To: <cover.1338994308.git.mark.hatle@windriver.com>
References: <cover.1338994308.git.mark.hatle@windriver.com>
MIME-Version: 1.0
X-Originating-IP: [172.25.34.61]
Subject: [PATCH 3/6] shadow-native: Disable nscd support
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
X-List-Received-Date: Wed, 06 Jun 2012 14:57:58 -0000
Content-Type: text/plain

Disabling nscd support prevents error messages when shadow utilities attempt
to trigger nscd to reload.  This does nothing unless the user is root, and even
if they are root, it's the wrong action to perform when creating a target fs.

Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
---
 .../shadow/shadow-native_4.1.4.3.bb                |    5 +++--
 1 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-extended/shadow/shadow-native_4.1.4.3.bb b/meta/recipes-extended/shadow/shadow-native_4.1.4.3.bb
index fece9c6..1e071f1 100644
--- a/meta/recipes-extended/shadow/shadow-native_4.1.4.3.bb
+++ b/meta/recipes-extended/shadow/shadow-native_4.1.4.3.bb
@@ -7,7 +7,7 @@ LICENSE = "BSD | Artistic-1.0"
 LIC_FILES_CHKSUM = "file://COPYING;md5=08c553a87d4e51bbed50b20e0adcaede \
                     file://src/passwd.c;firstline=8;endline=30;md5=2899a045e90511d0e043b85a7db7e2fe"
 
-PR = "r5"
+PR = "r6"
 
 SRC_URI = "http://pkg-shadow.alioth.debian.org/releases/${BPN}-${PV}.tar.bz2 \
            file://shadow.automake-1.11.patch \
@@ -27,7 +27,8 @@ inherit autotools gettext native
 EXTRA_OECONF += "--without-audit \
                  --without-libcrack \
                  --without-libpam \
-                 --without-selinux"
+                 --without-selinux \
+                 --without-nscd"
 
 do_install_append() {
 	# Enable CREATE_HOME by default.
-- 
1.7.3.4



