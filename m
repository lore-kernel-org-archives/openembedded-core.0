Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 79F9071B1D
	for <openembedded-core@lists.openembedded.org>;
	Fri,  1 Dec 2017 05:14:21 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id vB15EMVC006365
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 Nov 2017 21:14:22 -0800 (PST)
Received: from pek-lpg-core1.wrs.com (128.224.156.132) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.3.361.1; Thu, 30 Nov 2017 21:14:21 -0800
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 1 Dec 2017 13:13:53 +0800
Message-ID: <2b4e2875e667df753c33418eefc437d9d0da6216.1512104695.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1512104695.git.liezhi.yang@windriver.com>
References: <cover.1512104695.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/1 V2] targetcontrol.py: use oe.types.boolean for QEMU_USE_KVM
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
X-List-Received-Date: Fri, 01 Dec 2017 05:14:21 -0000
Content-Type: text/plain

So that both QEMU_USE_KVM = "True" and "1" will work.

[YOCTO #12343]

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta/classes/testimage.bbclass | 2 +-
 meta/lib/oeqa/targetcontrol.py | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/classes/testimage.bbclass b/meta/classes/testimage.bbclass
index 45bb2bd..7260ad4 100644
--- a/meta/classes/testimage.bbclass
+++ b/meta/classes/testimage.bbclass
@@ -215,7 +215,7 @@ def testimage_main(d):
     # Get use_kvm
     qemu_use_kvm = d.getVar("QEMU_USE_KVM")
     if qemu_use_kvm and \
-       (qemu_use_kvm == 'True' and 'x86' in machine or \
+       (oe.types.boolean(qemu_use_kvm) and 'x86' in machine or \
         d.getVar('MACHINE') in qemu_use_kvm.split()):
         kvm = True
     else:
diff --git a/meta/lib/oeqa/targetcontrol.py b/meta/lib/oeqa/targetcontrol.py
index f63936c..3fc3870 100644
--- a/meta/lib/oeqa/targetcontrol.py
+++ b/meta/lib/oeqa/targetcontrol.py
@@ -107,7 +107,7 @@ class QemuTarget(BaseTarget):
         dump_dir = d.getVar("TESTIMAGE_DUMP_DIR")
         qemu_use_kvm = d.getVar("QEMU_USE_KVM")
         if qemu_use_kvm and \
-           (qemu_use_kvm == "True" and "x86" in d.getVar("MACHINE") or \
+           (oe.types.boolean(qemu_use_kvm) and "x86" in d.getVar("MACHINE") or \
             d.getVar("MACHINE") in qemu_use_kvm.split()):
             use_kvm = True
         else:
-- 
2.7.4


