Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Liezhi.Yang@windriver.com>) id 1SwVE1-0001vC-Cf
	for openembedded-core@lists.openembedded.org;
	Wed, 01 Aug 2012 11:28:21 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id q719GcLG000406
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 1 Aug 2012 02:16:38 -0700 (PDT)
Received: from usp-ub10.corp.ad.wrs.com (128.224.163.69) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.2.309.2; Wed, 1 Aug 2012 02:16:37 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 1 Aug 2012 17:14:53 +0800
Message-ID: <a57a3366ba6949f512af826480d02a4d8355f8c0.1343811985.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.1
In-Reply-To: <cover.1343811985.git.liezhi.yang@windriver.com>
References: <cover.1343811985.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Cc: Zhenfeng.Zhao@windriver.com
Subject: [PATCH 1/2] createrepo 0.4.11: add rpm-createsolvedb.py
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
X-List-Received-Date: Wed, 01 Aug 2012 09:28:38 -0000
Content-Type: text/plain

Move scripts/rpm-createsolvedb.py to
meta/recipes-support/createrepo/createrepo/ since we should wrap it to
use the native python.

[YOCTO #2822]

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta/classes/rootfs_rpm.bbclass                    |    2 +-
 .../createrepo/createrepo}/rpm-createsolvedb.py    |    0
 .../createrepo/createrepo_0.4.11.bb                |    4 +++-
 3 files changed, 4 insertions(+), 2 deletions(-)
 rename {scripts => meta/recipes-support/createrepo/createrepo}/rpm-createsolvedb.py (100%)

diff --git a/meta/classes/rootfs_rpm.bbclass b/meta/classes/rootfs_rpm.bbclass
index c9258df..a03e9f3 100644
--- a/meta/classes/rootfs_rpm.bbclass
+++ b/meta/classes/rootfs_rpm.bbclass
@@ -17,7 +17,7 @@ do_rootfs[depends] += "rpmresolve-native:do_populate_sysroot"
 do_rootfs[depends] += "opkg-native:do_populate_sysroot"
 
 # Creating the repo info in do_rootfs
-#do_rootfs[depends] += "createrepo-native:do_populate_sysroot"
+do_rootfs[depends] += "createrepo-native:do_populate_sysroot"
 
 do_rootfs[recrdeptask] += "do_package_write_rpm"
 
diff --git a/scripts/rpm-createsolvedb.py b/meta/recipes-support/createrepo/createrepo/rpm-createsolvedb.py
similarity index 100%
rename from scripts/rpm-createsolvedb.py
rename to meta/recipes-support/createrepo/createrepo/rpm-createsolvedb.py
diff --git a/meta/recipes-support/createrepo/createrepo_0.4.11.bb b/meta/recipes-support/createrepo/createrepo_0.4.11.bb
index 7a4d059..dcddcf8 100644
--- a/meta/recipes-support/createrepo/createrepo_0.4.11.bb
+++ b/meta/recipes-support/createrepo/createrepo_0.4.11.bb
@@ -6,12 +6,13 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=18810669f13b87348459e611d31ab760"
 
 RDEPENDS_${PN}_virtclass-native += "libxml2-native rpm-native"
 
-PR = "r4"
+PR = "r5"
 
 SRC_URI= "http://createrepo.baseurl.org/download/${BP}.tar.gz \
           file://fix-native-install.patch \
           file://python-scripts-should-use-interpreter-from-env.patch \
 	  file://createrepo-rpm549.patch \
+	  file://rpm-createsolvedb.py \
          "
 
 SRC_URI[md5sum] = "3e9ccf4abcffe3f49af078c83611eda2"
@@ -21,4 +22,5 @@ BBCLASSEXTEND = "native"
 
 do_install () {
 	oe_runmake -e 'DESTDIR=${D}' install
+	install -m 0755 ${WORKDIR}/rpm-createsolvedb.py ${D}${bindir}/
 }
-- 
1.7.1



