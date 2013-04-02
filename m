Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Qi.Chen@windriver.com>) id 1UMsCu-0000Hn-Ap
	for openembedded-core@lists.openembedded.org;
	Tue, 02 Apr 2013 05:48:24 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r323VDIH028278
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 1 Apr 2013 20:31:13 -0700 (PDT)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.163.154) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.2.342.3; Mon, 1 Apr 2013 20:31:13 -0700
From: <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 2 Apr 2013 11:31:21 +0800
Message-ID: <40756f91f56034eef88d0338fb8975ca31db9213.1364872107.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1364872107.git.Qi.Chen@windriver.com>
References: <cover.1364872107.git.Qi.Chen@windriver.com>
MIME-Version: 1.0
Cc: qingtao.cao@windriver.com
Subject: [PATCH 1/2] image.bbclass: allow override for ROOTFS_BOOTSTRAP_INSTALL
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
X-List-Received-Date: Tue, 02 Apr 2013 03:48:24 -0000
Content-Type: text/plain

From: Chen Qi <Qi.Chen@windriver.com>

Previously, if 'package-management' is in IMAGE_FEATURES, this variable
is set to "", otherwise, it's ${ROOTFS_PKGMANAGE_BOOTSTRAP}. It works fine
with deb and ipk, because their postinsts rely on their package managers.
However, rpm is a little different, as its postinsts are just shell scripts.

We should allow rootfs_rpm.bbclass to override this variable, otherwise,
rpm-postinsts will not be installed on target if 'package-management' is
in IMAGE_FEATURES.

[YOCTO #4160]

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 meta/classes/image.bbclass |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/image.bbclass b/meta/classes/image.bbclass
index 9721a6b..fb7b64e 100644
--- a/meta/classes/image.bbclass
+++ b/meta/classes/image.bbclass
@@ -21,7 +21,7 @@ IMAGE_FEATURES ?= ""
 IMAGE_FEATURES[type] = "list"
 
 # rootfs bootstrap install
-ROOTFS_BOOTSTRAP_INSTALL = "${@base_contains("IMAGE_FEATURES", "package-management", "", "${ROOTFS_PKGMANAGE_BOOTSTRAP}",d)}"
+ROOTFS_BOOTSTRAP_INSTALL ?= "${@base_contains("IMAGE_FEATURES", "package-management", "", "${ROOTFS_PKGMANAGE_BOOTSTRAP}",d)}"
 
 # packages to install from features
 FEATURE_INSTALL = "${@' '.join(oe.packagegroup.required_packages(oe.data.typed_value('IMAGE_FEATURES', d), d))}"
-- 
1.7.9.5



