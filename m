Return-Path: <Qi.Chen@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 5D7E0600B3
	for <openembedded-core@lists.openembedded.org>;
	Tue,  4 Dec 2018 04:57:51 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id wB44vq23023944
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 3 Dec 2018 20:57:52 -0800 (PST)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.163.141) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.408.0; Mon, 3 Dec 2018 20:57:51 -0800
From: Chen Qi <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 4 Dec 2018 13:04:46 +0800
Message-ID: <f7c5083f7a1f59bacdd55d166bb9fef20e578c8e.1543899860.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1543899860.git.Qi.Chen@windriver.com>
References: <cover.1543899860.git.Qi.Chen@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/1] testimage: fix boolean checking for QEMU_USE_KVM
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
X-List-Received-Date: Tue, 04 Dec 2018 04:57:51 -0000
Content-Type: text/plain

If QEMU_USE_KVM is set to a list of machines, when doing testimage
for a machine outside the list, we will get the following error.

  Exception: ValueError: Invalid boolean value 'intel-corei7-64 intel-core2-32 qemux86 qemux86-64'

This is because oe.types.boolean raises error if the parameter
is not values like 'true', 'false', etc.

Fix the boolean checking to avoid the exception.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 meta/classes/testimage.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/testimage.bbclass b/meta/classes/testimage.bbclass
index 82cbb06..80e457b 100644
--- a/meta/classes/testimage.bbclass
+++ b/meta/classes/testimage.bbclass
@@ -231,7 +231,7 @@ def testimage_main(d):
     qemu_use_kvm = d.getVar("QEMU_USE_KVM")
     if qemu_use_kvm and \
        (d.getVar('MACHINE') in qemu_use_kvm.split() or \
-        oe.types.boolean(qemu_use_kvm) and 'x86' in machine):
+        qemu_use_kvm.lower() in ('yes', 'y', 'true', 't', '1') and 'x86' in machine):
         kvm = True
     else:
         kvm = False
-- 
1.9.1


