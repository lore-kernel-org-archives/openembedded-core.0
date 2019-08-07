Return-Path: <ricardo.neri-calderon@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 3D4517F407
	for <openembedded-core@lists.openembedded.org>;
	Wed,  7 Aug 2019 01:52:12 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	06 Aug 2019 18:45:08 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,353,1559545200"; d="scan'208";a="185841509"
Received: from unknown (HELO luv-build.sc.intel.com) ([172.25.110.25])
	by orsmga002.jf.intel.com with ESMTP; 06 Aug 2019 18:45:07 -0700
From: Ricardo Neri <ricardo.neri-calderon@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  6 Aug 2019 18:44:39 -0700
Message-Id: <1565142279-8439-6-git-send-email-ricardo.neri-calderon@linux.intel.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1565142279-8439-1-git-send-email-ricardo.neri-calderon@linux.intel.com>
References: <1565142279-8439-1-git-send-email-ricardo.neri-calderon@linux.intel.com>
Subject: [PATCH 5/5] runqemu: Add support to handle EnrollDefaultKeys PK/KEK1 certificate
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

The EnrollDefaultKeys.efi application (distributed in ovmf-shell-image)
expects the hypervisor to provide a Platform Key and first Key Exchange
Key certificate.

For QEMU, this is done by adding an OEM string in the Type 11 SMBIOS
table. The string contains the EnrollDefaultKeys application GUID followed
by the certificate string. For now, the string is passed in the command
line until QEMU understands OEM strings from regular files (please see
https://bugs.launchpad.net/qemu/+bug/1826200).

If runqemu detects it is given an OVMF binary with support for Secure Boot
(i.e., ovmf.secboot* binaries), extract the certificate string from the
OvmfPkKek1.pem certificate and modify the command-line parameters to
provide the key. Such certificate is created when building OVMF with
support for Secure Boot.

Cc: Ross Burton <ross.burton@intel.com>
Cc: Patrick Ohly <patrick.ohly@intel.com>
Signed-off-by: Ricardo Neri <ricardo.neri-calderon@linux.intel.com>
---
 scripts/runqemu | 32 ++++++++++++++++++++++++++++++++
 1 file changed, 32 insertions(+)

diff --git a/scripts/runqemu b/scripts/runqemu
index 9d6a2e86d4..df3c8aad08 100755
--- a/scripts/runqemu
+++ b/scripts/runqemu
@@ -148,6 +148,10 @@ class BaseConfig(object):
         # Setting one also adds "-vga std" because that is all that
         # OVMF supports.
         self.ovmf_bios = []
+        # When enrolling default Secure Boot keys, the hypervisor
+        # must provide the Platform Key and the first Key Exchange Key
+        # certificate in the Type 11 SMBIOS table.
+        self.ovmf_secboot_pkkek1 = ''
         self.qemuboot = ''
         self.qbconfload = False
         self.kernel = ''
@@ -638,6 +642,23 @@ class BaseConfig(object):
         if not os.path.exists(self.rootfs):
             raise RunQemuError("Can't find rootfs: %s" % self.rootfs)
 
+    def setup_pkkek1(self):
+        """
+        Extract from PEM certificate the Platform Key and first Key
+        Exchange Key certificate string. The hypervisor needs to provide
+        it in the Type 11 SMBIOS table
+        """
+        pemcert = '%s/%s' % (self.get('DEPLOY_DIR_IMAGE'), 'OvmfPkKek1.pem')
+        try:
+            with open(pemcert, 'r') as pemfile:
+                key = pemfile.read().replace('\n', ''). \
+                      replace('-----BEGIN CERTIFICATE-----', ''). \
+                      replace('-----END CERTIFICATE-----', '')
+                self.ovmf_secboot_pkkek1 = key
+
+        except FileNotFoundError:
+            raise RunQemuError("Can't open PEM certificate %s " % pemcert)
+
     def check_ovmf(self):
         """Check and set full path for OVMF firmware and variable file(s)."""
 
@@ -648,6 +669,8 @@ class BaseConfig(object):
                 path = '%s/%s.%s' % (self.get('DEPLOY_DIR_IMAGE'), ovmf, suffix)
                 if os.path.exists(path):
                     self.ovmf_bios[index] = path
+                    if ovmf.endswith('secboot'):
+                        self.setup_pkkek1()
                     break
             else:
                 raise RunQemuError("Can't find OVMF firmware: %s" % ovmf)
@@ -914,6 +937,8 @@ class BaseConfig(object):
             print('ROOTFS: [%s]' % self.rootfs)
         if self.ovmf_bios:
             print('OVMF: %s' % self.ovmf_bios)
+        if (self.ovmf_secboot_pkkek1):
+            print('SECBOOT PKKEK1: [%s...]' % self.ovmf_secboot_pkkek1[0:100])
         print('CONFFILE: [%s]' % self.qemuboot)
         print('')
 
@@ -1262,6 +1287,13 @@ class BaseConfig(object):
 
         self.qemu_opt += ' ' + self.qemu_opt_script
 
+        if self.ovmf_secboot_pkkek1:
+			# Provide the Platform Key and first Key Exchange Key certificate as an
+			# OEM string in the SMBIOS Type 11 table. Prepend the certificate string
+			# with "application prefix" of the EnrollDefaultKeys.efi application
+            self.qemu_opt += ' -smbios type=11,value=4e32566d-8e9e-4f52-81d3-5bb9715f9727:' \
+                             + self.ovmf_secboot_pkkek1
+
         # Append qemuparams to override previous settings
         if self.qemuparams:
             self.qemu_opt += ' ' + self.qemuparams
-- 
2.20.1


