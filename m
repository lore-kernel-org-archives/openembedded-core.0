Return-Path: <Jackie.Huang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 2E40F65C88
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Oct 2014 08:36:39 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.9/8.14.5) with ESMTP id s9M8adpP019402
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Oct 2014 01:36:39 -0700 (PDT)
Received: from pek-hostel-vm11.wrs.com (128.224.153.181) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.174.1; Wed, 22 Oct 2014 01:36:38 -0700
From: <jackie.huang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 22 Oct 2014 04:36:37 -0400
Message-ID: <1413966997-3361-1-git-send-email-jackie.huang@windriver.com>
X-Mailer: git-send-email 2.0.0
MIME-Version: 1.0
Subject: [PATCH] linux-firmware: resolve linux-firmware and microcode-ctl file conflicts
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
X-List-Received-Date: Wed, 22 Oct 2014 08:36:40 -0000
Content-Type: text/plain

From: Yue Tao <yue.tao@windriver.com>

Use alternatives mechanism to prevent linux-firmware and microcode-ctl bin
files from causing conflicts.

The error is :

error: file /lib/firmware/amd-ucode/microcode_amd.bin from install of
linux-firmware conflicts with file from package microcode-ctl-firmware

error: file /lib/firmware/amd-ucode/microcode_amd_fam15h.bin from
install of linux-firmware conflicts with file from package microcode-ctl-firmware

Signed-off-by: Yue Tao <yue.tao@windriver.com>
---
 meta/recipes-kernel/linux-firmware/linux-firmware_git.bb | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/meta/recipes-kernel/linux-firmware/linux-firmware_git.bb b/meta/recipes-kernel/linux-firmware/linux-firmware_git.bb
index a107f80..28d71f5 100644
--- a/meta/recipes-kernel/linux-firmware/linux-firmware_git.bb
+++ b/meta/recipes-kernel/linux-firmware/linux-firmware_git.bb
@@ -228,3 +228,8 @@ python populate_packages_prepend () {
     firmware_pkgs = oe.utils.packages_filter_out_system(d)
     d.appendVar('RDEPENDS_linux-firmware', ' ' + ' '.join(firmware_pkgs))
 }
+
+ALTERNATIVE_PRIORITY = "100"
+ALTERNATIVE_${PN} = "microcode_amd.bin microcode_amd_fam15h.bin"
+ALTERNATIVE_LINK_NAME[microcode_amd.bin] = "/lib/firmware/amd-ucode/microcode_amd.bin"
+ALTERNATIVE_LINK_NAME[microcode_amd_fam15h.bin] = "/lib/firmware/amd-ucode/microcode_amd_fam15h.bin"
-- 
2.0.0


