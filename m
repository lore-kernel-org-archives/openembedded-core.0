Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Liezhi.Yang@windriver.com>) id 1T9CFM-00020T-F9
	for openembedded-core@lists.openembedded.org;
	Wed, 05 Sep 2012 11:50:08 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id q859bi9w029898
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 5 Sep 2012 02:37:44 -0700 (PDT)
Received: from usp-ub10.corp.ad.wrs.com (128.224.163.69) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.2.309.2; Wed, 5 Sep 2012 02:37:44 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 5 Sep 2012 17:31:41 +0800
Message-ID: <a30f2ce625990ccfb3e1e06794b353dc1f1257cb.1346837268.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.1
In-Reply-To: <cover.1346837268.git.liezhi.yang@windriver.com>
References: <cover.1346837268.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Cc: Zhenfeng.Zhao@windriver.com
Subject: [RFC PATCH 2/2] package_ipk.bbclass: use "--force-arch" when install package
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
X-List-Received-Date: Wed, 05 Sep 2012 09:50:09 -0000
Content-Type: text/plain

This is for fixing the problem:
1) bitbake core-image-sato-sdk with MACHINE=qemux86
2) bitbake core-image-sato with with MACHINE=crownbay

The qemux86's PACKAGE_ARCH is i586, the crownbay's is core2, but several
i586 packages will be installed into crownbay's rootfs though there are
core2 packages. For example, there are:

xserver-xorg_1.11.2-r4_i586.ipk
xserver-xorg_1.9.3-r1_core2.ipk

The crownbay.conf says:
PREFERRED_VERSION_xserver-xorg ?= "1.9.3"

What the crownbay's image needs is xserver-xorg_1.9.3-r1_core2.ipk, but
the xserver-xorg_1.11.2-r4_i586.ipk will be installed, this is
incorrect.

This is caused by opkg's selecting mechanism: when more than one
candidate is found, it will use the higher version one and ignore the
arch priority.

we have several conf files which set the PREFERRED_VERSION_pkg = "..." ,
but there is no such a mechanism which can let us tell the opkg to
install the preferred version. When the preferred version is higher,
this is OK, but if the preferred version is lower, there would be
problems:

1) Most of the packages are core2 in the image, but several of them are
   i586, though we have built the core2 ones, this seems strange.

2) What's worse is that the image may not work since the preferred
   version pkg is not installed.

We have set the arch priority clearly in the opkg.conf, I think that
respect to the arch priority is reasonable during the image generation,
use the "--force-arch" would fix the problem.

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta/classes/package_ipk.bbclass |    6 ++++--
 1 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/meta/classes/package_ipk.bbclass b/meta/classes/package_ipk.bbclass
index e94586e..c274296 100644
--- a/meta/classes/package_ipk.bbclass
+++ b/meta/classes/package_ipk.bbclass
@@ -71,7 +71,8 @@ package_tryout_install_multilib_ipk() {
 	multilib_tryout_dirs=""
 	for item in ${MULTILIB_VARIANTS}; do
 		local target_rootfs="${MULTILIB_TEMP_ROOTFS}/${item}"
-		local ipkg_args="-f ${INSTALL_CONF_IPK} -o ${target_rootfs} --force_overwrite"
+		local ipkg_args="-f ${INSTALL_CONF_IPK} -o ${target_rootfs} \
+				--force_overwrite --force-arch"
 		local selected_pkg=""
 		local pkgname_prefix="${item}-"
 		local pkgname_len=${#pkgname_prefix}
@@ -139,7 +140,8 @@ package_install_internal_ipk() {
 
 	mkdir -p ${target_rootfs}${localstatedir}/lib/opkg/
 
-	local ipkg_args="-f ${conffile} -o ${target_rootfs} --force-overwrite --force_postinstall"
+	local ipkg_args="-f ${conffile} -o ${target_rootfs} --force-overwrite \
+			--force_postinstall --force-arch"
 
 	opkg-cl ${ipkg_args} update
 
-- 
1.7.1



