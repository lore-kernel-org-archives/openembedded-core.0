Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Paul.Gortmaker@windriver.com>) id 1SkgD7-0007Hn-6Y
	for openembedded-core@lists.openembedded.org;
	Fri, 29 Jun 2012 20:46:30 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail1.windriver.com (8.14.3/8.14.3) with ESMTP id q5TIZVZG002375
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 29 Jun 2012 11:35:32 -0700 (PDT)
Received: from yow-pgortmak-d2.corp.ad.wrs.com (128.224.146.165) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.1.255.0; Fri, 29 Jun 2012 11:35:31 -0700
From: Paul Gortmaker <paul.gortmaker@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 29 Jun 2012 14:35:14 -0400
Message-ID: <1340994915-14947-3-git-send-email-paul.gortmaker@windriver.com>
X-Mailer: git-send-email 1.7.9.6
In-Reply-To: <1340994915-14947-1-git-send-email-paul.gortmaker@windriver.com>
References: <1340994915-14947-1-git-send-email-paul.gortmaker@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 2/3] u-boot: make FILESDIR a shared setting.
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
X-List-Received-Date: Fri, 29 Jun 2012 18:46:30 -0000
Content-Type: text/plain

The setting is the same in all recipes, so move it to
the shared settings in u-boot.inc

Signed-off-by: Paul Gortmaker <paul.gortmaker@windriver.com>
---
 meta/recipes-bsp/u-boot/u-boot.inc           |    1 +
 meta/recipes-bsp/u-boot/u-boot_2011.03.bb    |    2 --
 meta/recipes-bsp/u-boot/u-boot_2011.06.bb    |    2 --
 meta/recipes-bsp/u-boot/u-boot_2012.04.01.bb |    2 --
 4 files changed, 1 insertion(+), 6 deletions(-)

diff --git a/meta/recipes-bsp/u-boot/u-boot.inc b/meta/recipes-bsp/u-boot/u-boot.inc
index 0ed5fd9..eed02b3 100644
--- a/meta/recipes-bsp/u-boot/u-boot.inc
+++ b/meta/recipes-bsp/u-boot/u-boot.inc
@@ -57,6 +57,7 @@ do_install () {
 }
 
 FILES_${PN} = "/boot"
+FILESDIR = "${@os.path.dirname(d.getVar('FILE',1))}/u-boot-git/${MACHINE}"
 
 do_deploy () {
     install -d ${DEPLOYDIR}
diff --git a/meta/recipes-bsp/u-boot/u-boot_2011.03.bb b/meta/recipes-bsp/u-boot/u-boot_2011.03.bb
index e99bc2c..ed38f54 100644
--- a/meta/recipes-bsp/u-boot/u-boot_2011.03.bb
+++ b/meta/recipes-bsp/u-boot/u-boot_2011.03.bb
@@ -10,8 +10,6 @@ LICENSE = "GPLv2+"
 LIC_FILES_CHKSUM = "file://COPYING;md5=1707d6db1d42237583f50183a5651ecb \
                     file://README;beginline=1;endline=22;md5=3a00ef51d3fc96e9d6c1bc4708ccd3b5"
 
-FILESDIR = "${@os.path.dirname(d.getVar('FILE',1))}/u-boot-git/${MACHINE}"
-
 # This revision corresponds to the tag "v2011.03"
 # We use the revision in order to avoid having to fetch it from the repo during parse
 SRCREV = "19b54a701811220221fc4d5089a2bb18892018ca"
diff --git a/meta/recipes-bsp/u-boot/u-boot_2011.06.bb b/meta/recipes-bsp/u-boot/u-boot_2011.06.bb
index 680401f..da61852 100644
--- a/meta/recipes-bsp/u-boot/u-boot_2011.06.bb
+++ b/meta/recipes-bsp/u-boot/u-boot_2011.06.bb
@@ -10,8 +10,6 @@ LICENSE = "GPLv2+"
 LIC_FILES_CHKSUM = "file://COPYING;md5=1707d6db1d42237583f50183a5651ecb \
                     file://README;beginline=1;endline=22;md5=5ba4218ac89af7846802d0348df3fb90"
 
-FILESDIR = "${@os.path.dirname(d.getVar('FILE',1))}/u-boot-git/${MACHINE}"
-
 # This revision corresponds to the tag "v2011.06"
 # We use the revision in order to avoid having to fetch it from the repo during parse
 SRCREV = "b1af6f532e0d348b153d5c148369229d24af361a"
diff --git a/meta/recipes-bsp/u-boot/u-boot_2012.04.01.bb b/meta/recipes-bsp/u-boot/u-boot_2012.04.01.bb
index dbdc663..25cc8c9 100644
--- a/meta/recipes-bsp/u-boot/u-boot_2012.04.01.bb
+++ b/meta/recipes-bsp/u-boot/u-boot_2012.04.01.bb
@@ -14,8 +14,6 @@ DEFAULT_PREFERENCE = "-1"
 LICENSE = "GPLv2+"
 LIC_FILES_CHKSUM = "file://COPYING;md5=1707d6db1d42237583f50183a5651ecb"
 
-FILESDIR = "${@os.path.dirname(d.getVar('FILE',1))}/u-boot-git/${MACHINE}"
-
 # This revision corresponds to the tag "v2012.04.01"
 # We use the revision in order to avoid having to fetch it from the
 # repo during parse
-- 
1.7.9.6



