Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id A13F76FBB9
	for <openembedded-core@lists.openembedded.org>;
	Fri, 10 Oct 2014 08:25:59 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.14.9/8.14.5) with ESMTP id s9A8Q0QE019768
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Fri, 10 Oct 2014 01:26:00 -0700 (PDT)
Received: from pek-hjia-d1.corp.ad.wrs.com (128.224.162.194) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.174.1; Fri, 10 Oct 2014 01:26:00 -0700
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>, <ross.burton@intel.com>
Date: Fri, 10 Oct 2014 16:25:55 +0800
Message-ID: <10652fecec41469cc331205c31857c05bbf4e474.1412929437.git.hongxu.jia@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1412929437.git.hongxu.jia@windriver.com>
References: <cover.1412929437.git.hongxu.jia@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/1] sdk.py: fix write target sdk manifest failed based on ipk
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
X-List-Received-Date: Fri, 10 Oct 2014 08:26:00 -0000
Content-Type: text/plain

bitbake meta-toolchain
ls tmp/deploy/sdk/poky-glibc-x86_64-meta-toolchain-i586-toolchain-1.7.manifest -al
...
|-rw-rw-r-- 1 root root 0 Oct 10 15:05 tmp/deploy/sdk/poky-glibc-x86_64-
meta-toolchain-i586-toolchain-1.7.manifest
...

The manifest is empty, the reason is target's ipk config path is
d.getVar('IPKGCONF_TARGET') rather than d.getVar('IPKGCONF_Target')

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 meta/lib/oe/sdk.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/lib/oe/sdk.py b/meta/lib/oe/sdk.py
index ca349c4..c57a4419 100644
--- a/meta/lib/oe/sdk.py
+++ b/meta/lib/oe/sdk.py
@@ -303,7 +303,7 @@ def sdk_list_installed_packages(d, target, format=None, rootfs_dir=None):
         os_var = ["SDK_OS", None][target is True]
         return RpmPkgsList(d, rootfs_dir, arch_var, os_var).list(format)
     elif img_type == "ipk":
-        conf_file_var = ["IPKGCONF_SDK", "IPKGCONF_Target"][target is True]
+        conf_file_var = ["IPKGCONF_SDK", "IPKGCONF_TARGET"][target is True]
         return OpkgPkgsList(d, rootfs_dir, d.getVar(conf_file_var, True)).list(format)
     elif img_type == "deb":
         return DpkgPkgsList(d, rootfs_dir).list(format)
-- 
1.9.1


