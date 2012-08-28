Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Liezhi.Yang@windriver.com>) id 1T6O5M-0001QB-Or
	for openembedded-core@lists.openembedded.org;
	Tue, 28 Aug 2012 17:52:13 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id q7SFdw5Z008445
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 28 Aug 2012 08:39:58 -0700 (PDT)
Received: from localhost.localdomain (128.224.163.124) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.2.309.2; Tue, 28 Aug 2012 08:39:58 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 28 Aug 2012 23:45:22 +0800
Message-ID: <d44a05ea08917e27279740f258bdf28424a7e055.1346138100.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.11.2
In-Reply-To: <cover.1346138100.git.liezhi.yang@windriver.com>
References: <cover.1346138100.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Cc: Zhenfeng.Zhao@windriver.com
Subject: [PATCH 1/1] package_rpm.bbclass: fix the arch (replace "-" with "_")
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
X-List-Received-Date: Tue, 28 Aug 2012 15:52:13 -0000
Content-Type: text/plain

rpm can't use the "-" as the arch, which causes problem, e.g., when
MACHINE = "beagleboard":

* The arch should be armv7a-vfp-neon, but rpm only takes the armv7a,
  this is incorrect since it is mixed with real arch armv7a.

* The nativesdk's arch should be i686-nativesdk (or x86_64-nativesdk),
  but rpm only takes the i686 (or x86_64), this in incorrect since it is
  mixed with the arch i686 (or x86_64).

Replace "-" with "_" when rpm package and the rootfs generation would
fix the problem, I think this is fine since it doesn't change the tune's
arch, the package manager doesn't care about the arch's name, but it
needs a unify arch system to avoid confusing. This is similar to what we
have done on the deb which fixed the arch i486, i586 and so on to i386.

[YOCTO #2328]

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta/classes/package_rpm.bbclass | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/meta/classes/package_rpm.bbclass b/meta/classes/package_rpm.bbclass
index 9abad5e..87dd367 100644
--- a/meta/classes/package_rpm.bbclass
+++ b/meta/classes/package_rpm.bbclass
@@ -27,12 +27,12 @@ package_update_index_rpm () {
 	fi
 
 	# Update target packages
-	base_archs="${PACKAGE_ARCHS}"
-	ml_archs="${MULTILIB_PACKAGE_ARCHS}"
+	base_archs="`echo ${PACKAGE_ARCHS} | sed 's/-/_/g'`"
+	ml_archs="`echo ${MULTILIB_PACKAGE_ARCHS} | sed 's/-/_/g'`"
 	package_update_index_rpm_common "${RPMCONF_TARGET_BASE}" base_archs ml_archs
 
 	# Update SDK packages
-	base_archs="${SDK_PACKAGE_ARCHS}"
+	base_archs="`echo ${SDK_PACKAGE_ARCHS} | sed 's/-/_/g'`"
 	package_update_index_rpm_common "${RPMCONF_HOST_BASE}" base_archs
 }
 
@@ -1118,7 +1118,7 @@ python do_package_rpm () {
     rpmbuild = d.getVar('RPMBUILD', True)
     targetsys = d.getVar('TARGET_SYS', True)
     targetvendor = d.getVar('TARGET_VENDOR', True)
-    package_arch = d.getVar('PACKAGE_ARCH', True) or ""
+    package_arch = (d.getVar('PACKAGE_ARCH', True) or "").replace("-", "_")
     if package_arch not in "all any noarch".split():
         ml_prefix = (d.getVar('MLPREFIX', True) or "").replace("-", "_")
         d.setVar('PACKAGE_ARCH_EXTEND', ml_prefix + package_arch)
-- 
1.7.11.2



