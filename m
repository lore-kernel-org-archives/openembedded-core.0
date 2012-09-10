Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Liezhi.Yang@windriver.com>) id 1TAz0G-00043L-4B
	for openembedded-core@lists.openembedded.org;
	Mon, 10 Sep 2012 10:05:56 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id q8A7rQ3k024554
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 10 Sep 2012 00:53:26 -0700 (PDT)
Received: from fc17-64.wrs.com (128.224.163.124) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.2.309.2;
	Mon, 10 Sep 2012 00:53:25 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 10 Sep 2012 15:58:52 +0800
Message-ID: <d9e6edb763de4f7a4a66b64c0ae38bb6861948c0.1347247613.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.11.2
In-Reply-To: <cover.1347247613.git.liezhi.yang@windriver.com>
References: <cover.1347247613.git.liezhi.yang@windriver.com>
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
X-List-Received-Date: Mon, 10 Sep 2012 08:05:56 -0000
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
 meta/classes/package_rpm.bbclass                   | 10 +++++-----
 meta/recipes-extended/sat-solver/sat-solver_git.bb |  2 +-
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/meta/classes/package_rpm.bbclass b/meta/classes/package_rpm.bbclass
index 742f292..43cdd57 100644
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
 
@@ -1113,8 +1113,8 @@ python do_package_rpm () {
     rpmbuild = d.getVar('RPMBUILD', True)
     targetsys = d.getVar('TARGET_SYS', True)
     targetvendor = d.getVar('TARGET_VENDOR', True)
-    package_arch = d.getVar('PACKAGE_ARCH', True) or ""
-    if package_arch not in "all any noarch".split() and not package_arch.endswith("-nativesdk"):
+    package_arch = (d.getVar('PACKAGE_ARCH', True) or "").replace("-", "_")
+    if package_arch not in "all any noarch".split() and not package_arch.endswith("_nativesdk"):
         ml_prefix = (d.getVar('MLPREFIX', True) or "").replace("-", "_")
         d.setVar('PACKAGE_ARCH_EXTEND', ml_prefix + package_arch)
     else:
diff --git a/meta/recipes-extended/sat-solver/sat-solver_git.bb b/meta/recipes-extended/sat-solver/sat-solver_git.bb
index e1054e9..67503b7 100644
--- a/meta/recipes-extended/sat-solver/sat-solver_git.bb
+++ b/meta/recipes-extended/sat-solver/sat-solver_git.bb
@@ -47,7 +47,7 @@ do_archgen () {
 			all | any | noarch)
 				continue;;
 		esac
-		INSTALL_PLATFORM_ARCHS="$each_arch $INSTALL_PLATFORM_ARCHS"
+		INSTALL_PLATFORM_ARCHS="`echo $each_arch | sed 's/-/_/g'` $INSTALL_PLATFORM_ARCHS"
 	done
 
 	echo "/* Automatically generated by the sat-solver recipe */" > src/core-arch.h
-- 
1.7.11.2



