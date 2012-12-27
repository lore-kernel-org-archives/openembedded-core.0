Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Qi.Chen@windriver.com>) id 1To3tc-0002hs-L6
	for openembedded-core@lists.openembedded.org;
	Thu, 27 Dec 2012 04:12:49 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id qBR2vgTj023581
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 26 Dec 2012 18:57:42 -0800 (PST)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.163.154) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.2.318.4; Wed, 26 Dec 2012 18:57:41 -0800
From: <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 27 Dec 2012 10:57:38 +0800
Message-ID: <27d5c357543048d3a675d573ddc658f6c3f333bf.1356576405.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1356576405.git.Qi.Chen@windriver.com>
References: <cover.1356576405.git.Qi.Chen@windriver.com>
MIME-Version: 1.0
Cc: Zhenfeng.Zhao@windriver.com
Subject: [PATCH 1/4] sysvinit: add ROOTFS_READ_ONLY variable to rcS-default
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
X-List-Received-Date: Thu, 27 Dec 2012 03:12:55 -0000
Content-Type: text/plain

From: Chen Qi <Qi.Chen@windriver.com>

This variable indicates whether the rootfs is intended to be read-only
or not. Changing this value from 'no' to 'yes' on a currently running
system with read-write rootfs and rebooting will give the user a working
system with read-only rootfs.

However, it is not suggested to change its value. Normally, if a read-only
rootfs is required, we should build an image with 'read-only-rootfs' image
feature.

[YOCTO #3406]

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 meta/recipes-core/sysvinit/sysvinit/rcS-default |    4 ++++
 meta/recipes-core/sysvinit/sysvinit_2.88dsf.bb  |    2 +-
 2 files changed, 5 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-core/sysvinit/sysvinit/rcS-default b/meta/recipes-core/sysvinit/sysvinit/rcS-default
index 3c9dea9..88907a5 100644
--- a/meta/recipes-core/sysvinit/sysvinit/rcS-default
+++ b/meta/recipes-core/sysvinit/sysvinit/rcS-default
@@ -23,3 +23,7 @@ FSCKFIX=yes
 #TICKADJ=10000
 # Enable caching in populate-volatile.sh
 VOLATILE_ENABLE_CACHE=yes
+# Indicate whether the rootfs is intended to be read-only or not.
+# Setting ROOTFS_READ_ONLY to yes and rebooting will give you a read-only rootfs.
+# Normally you should not change this value.
+ROOTFS_READ_ONLY=no
\ No newline at end of file
diff --git a/meta/recipes-core/sysvinit/sysvinit_2.88dsf.bb b/meta/recipes-core/sysvinit/sysvinit_2.88dsf.bb
index de073b8..bf6a29b 100644
--- a/meta/recipes-core/sysvinit/sysvinit_2.88dsf.bb
+++ b/meta/recipes-core/sysvinit/sysvinit_2.88dsf.bb
@@ -5,7 +5,7 @@ SECTION = "base"
 LICENSE = "GPLv2+"
 LIC_FILES_CHKSUM = "file://COPYING;md5=751419260aa954499f7abaabaa882bbe \
                     file://COPYRIGHT;endline=15;md5=349c872e0066155e1818b786938876a4"
-PR = "r9"
+PR = "r10"
 
 RDEPENDS_${PN} = "${PN}-inittab"
 
-- 
1.7.9.5



