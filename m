Return-Path: <ricardo.neri-calderon@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 2D4117F3AE
	for <openembedded-core@lists.openembedded.org>;
	Wed,  7 Aug 2019 01:52:12 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	06 Aug 2019 18:45:07 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,353,1559545200"; d="scan'208";a="185841504"
Received: from unknown (HELO luv-build.sc.intel.com) ([172.25.110.25])
	by orsmga002.jf.intel.com with ESMTP; 06 Aug 2019 18:45:07 -0700
From: Ricardo Neri <ricardo.neri-calderon@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  6 Aug 2019 18:44:38 -0700
Message-Id: <1565142279-8439-5-git-send-email-ricardo.neri-calderon@linux.intel.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1565142279-8439-1-git-send-email-ricardo.neri-calderon@linux.intel.com>
References: <1565142279-8439-1-git-send-email-ricardo.neri-calderon@linux.intel.com>
Subject: [PATCH 4/5] ovmf: Generate test Platform key and first Key Exchange Key
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
X-List-Received-Date: Wed, 07 Aug 2019 01:52:12 -0000

Commit from EDK2 be9470b3c91f ("OvmfPkg/EnrollDefaultKeys: enroll
PK/KEK1 from the Type 11 SMBIOS table") mandates that a Platform Key
and first Key Exchange Key certificate is provided to the
EnrollDefaultKeys application.

Previously, the application was using a hard-coded certificate
from Red Hat embedded in the application.

Create a certificate that QEMU can subsequently pass to
EnrollDefaultKeys when running qemu-shell-image.

Cc: Ross Burton <ross.burton@intel.com>
Cc: Patrick Ohly <patrick.ohly@intel.com>
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Signed-off-by: Ricardo Neri <ricardo.neri-calderon@linux.intel.com>
---
 meta/recipes-core/ovmf/ovmf_git.bb | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/meta/recipes-core/ovmf/ovmf_git.bb b/meta/recipes-core/ovmf/ovmf_git.bb
index 834ee32466..7944ee97d4 100644
--- a/meta/recipes-core/ovmf/ovmf_git.bb
+++ b/meta/recipes-core/ovmf/ovmf_git.bb
@@ -217,6 +217,7 @@ FILES_ovmf-shell-efi = " \
 
 DEPLOYDEP = ""
 DEPLOYDEP_class-target = "qemu-system-native:do_populate_sysroot"
+DEPLOYDEP_class-target += " ${@bb.utils.contains('PACKAGECONFIG', 'secureboot', 'openssl-native:do_populate_sysroot', '', d)}"
 do_deploy[depends] += "${DEPLOYDEP}"
 
 do_deploy() {
@@ -232,6 +233,13 @@ do_deploy_class-target() {
         ; do
         qemu-img convert -f raw -O qcow2 ${WORKDIR}/ovmf/$i.fd ${DEPLOYDIR}/$i.qcow2
     done
+
+    if ${@bb.utils.contains('PACKAGECONFIG', 'secureboot', 'true', 'false', d)}; then
+        # Create a test Platform Key and first Key Exchange Key to use with EnrollDefaultKeys
+        openssl req -new -x509 -newkey rsa:2048 -keyout ${DEPLOYDIR}/OvmfPkKek1.key \
+                -out ${DEPLOYDIR}/OvmfPkKek1.crt -nodes -days 20 -subj "/CN=OVMFSecBootTest"
+        openssl x509 -in ${DEPLOYDIR}/OvmfPkKek1.crt -out ${DEPLOYDIR}/OvmfPkKek1.pem -outform PEM
+    fi
 }
 addtask do_deploy after do_compile before do_build
 
-- 
2.20.1


