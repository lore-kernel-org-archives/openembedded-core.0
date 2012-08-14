Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Liezhi.Yang@windriver.com>) id 1T1DrI-0005HL-0F
	for openembedded-core@linuxtogo.org; Tue, 14 Aug 2012 11:56:20 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id q7E9iOxr027996
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 14 Aug 2012 02:44:24 -0700 (PDT)
Received: from usp-ub10.corp.ad.wrs.com (128.224.163.69) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.2.309.2; Tue, 14 Aug 2012 02:44:24 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 14 Aug 2012 17:41:02 +0800
Message-ID: <2f34f5001c3178381fae4ea3ca795a65136e08e9.1344929471.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.1
In-Reply-To: <cover.1344929471.git.liezhi.yang@windriver.com>
References: <cover.1344929471.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Cc: openembedded-core@linuxtogo.org, Zhenfeng.Zhao@windriver.com
Subject: [PATCH 2/2] rootfs_deb: move the lock from WORKDIR to DEPLOY_DIR_DEB
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
X-List-Received-Date: Tue, 14 Aug 2012 09:56:20 -0000
Content-Type: text/plain

* There would be race issue if we put the lock to the WORKDIR, for
  example:
  bitbake core-image-sato core-image-sato-sdk

  If the lock is in their own WORKDIR, the apt-rootfs.conf and
  Packages.gz maybe be written by two tasks at the same time, which
  would cause unexpected errors.

* Create ${target_rootfs}/etc since the "tar -C" needs it.

Note:
  * The rpm has put the lock to DEPLOY_DIR_RPM
  * The ipk doesn't need it since it has locks for each deploy directory
    and put the opkg.conf in his own WORKDIR, which doesn't like deb put
    the apt-rootfs.conf in ${STAGING_ETCDIR_NATIVE}/apt/.

[YOCTO #2495]

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta/classes/populate_sdk_deb.bbclass |    3 ++-
 meta/classes/rootfs_deb.bbclass       |    2 +-
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/meta/classes/populate_sdk_deb.bbclass b/meta/classes/populate_sdk_deb.bbclass
index 6f89dcf..f2d0621 100644
--- a/meta/classes/populate_sdk_deb.bbclass
+++ b/meta/classes/populate_sdk_deb.bbclass
@@ -6,12 +6,13 @@ DEB_SDK_ARCH = "${@[d.getVar('SDK_ARCH', True), "i386"]\
                 [d.getVar('SDK_ARCH', True) in \
                 ["x86", "i486", "i586", "i686", "pentium"]]}"
 
-do_populate_sdk[lockfiles] += "${WORKDIR}/deb.lock"
+do_populate_sdk[lockfiles] += "${DEPLOY_DIR_DEB}/deb.lock"
 
 populate_sdk_post_deb () {
 
 	local target_rootfs=$1
 
+	mkdir -p ${target_rootfs}/etc
 	tar -cf - -C ${STAGING_ETCDIR_NATIVE} -ps apt | tar -xf - -C ${target_rootfs}/etc
 }
 
diff --git a/meta/classes/rootfs_deb.bbclass b/meta/classes/rootfs_deb.bbclass
index 750a8ca..881fdbd 100644
--- a/meta/classes/rootfs_deb.bbclass
+++ b/meta/classes/rootfs_deb.bbclass
@@ -8,7 +8,7 @@ ROOTFS_PKGMANAGE_BOOTSTRAP  = "run-postinsts"
 do_rootfs[depends] += "dpkg-native:do_populate_sysroot apt-native:do_populate_sysroot"
 do_rootfs[recrdeptask] += "do_package_write_deb"
 
-do_rootfs[lockfiles] += "${WORKDIR}/deb.lock"
+do_rootfs[lockfiles] += "${DEPLOY_DIR_DEB}/deb.lock"
 
 DEB_POSTPROCESS_COMMANDS = ""
 
-- 
1.7.1



