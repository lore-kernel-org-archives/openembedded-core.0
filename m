Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id EA50178372
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 Nov 2017 06:58:56 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id vAE6wvbk000716
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 13 Nov 2017 22:58:58 -0800
Received: from pek-lpg-core1.windriver.com (128.224.156.132) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.3.361.1; Mon, 13 Nov 2017 22:58:57 -0800
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 14 Nov 2017 14:57:36 +0800
Message-ID: <09182bb829b79804f26ee1a0eb83115cb6cef51f.1510642397.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1510642397.git.liezhi.yang@windriver.com>
References: <cover.1510642397.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/1] targetcontrol.py: make QEMU_USE_KVM = "1" work
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
X-List-Received-Date: Tue, 14 Nov 2017 06:58:57 -0000
Content-Type: text/plain

It only could be set to "True", which was not common in oe, e.g.:
* Works
QEMU_USE_KVM = "True"

* Didn't work, this would surprise user.
QEMU_USE_KVM = "1"

Make it work with both 1 and True now, the "True" is for compatibility.

[YOCTO #12343]

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta/classes/testimage.bbclass | 2 +-
 meta/lib/oeqa/targetcontrol.py | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/classes/testimage.bbclass b/meta/classes/testimage.bbclass
index 45bb2bd..66b4baf 100644
--- a/meta/classes/testimage.bbclass
+++ b/meta/classes/testimage.bbclass
@@ -215,7 +215,7 @@ def testimage_main(d):
     # Get use_kvm
     qemu_use_kvm = d.getVar("QEMU_USE_KVM")
     if qemu_use_kvm and \
-       (qemu_use_kvm == 'True' and 'x86' in machine or \
+       (qemu_use_kvm in ('True', '1') and 'x86' in machine or \
         d.getVar('MACHINE') in qemu_use_kvm.split()):
         kvm = True
     else:
diff --git a/meta/lib/oeqa/targetcontrol.py b/meta/lib/oeqa/targetcontrol.py
index f63936c..1625569 100644
--- a/meta/lib/oeqa/targetcontrol.py
+++ b/meta/lib/oeqa/targetcontrol.py
@@ -107,7 +107,7 @@ class QemuTarget(BaseTarget):
         dump_dir = d.getVar("TESTIMAGE_DUMP_DIR")
         qemu_use_kvm = d.getVar("QEMU_USE_KVM")
         if qemu_use_kvm and \
-           (qemu_use_kvm == "True" and "x86" in d.getVar("MACHINE") or \
+           (qemu_use_kvm in ("True", "1") and "x86" in d.getVar("MACHINE") or \
             d.getVar("MACHINE") in qemu_use_kvm.split()):
             use_kvm = True
         else:
-- 
2.7.4


