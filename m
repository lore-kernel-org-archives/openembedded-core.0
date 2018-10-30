Return-Path: <Bruce.Ashfield@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id EEB7579CCD
	for <openembedded-core@lists.openembedded.org>;
	Tue, 30 Oct 2018 19:05:15 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id w9UJ4Zjf025965
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 30 Oct 2018 12:04:51 -0700
Received: from yow-bashfiel-d4.wrs.com (128.224.56.94) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.408.0; Tue, 30 Oct 2018 12:04:27 -0700
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: <richard.purdie@linuxfoundation.org>
Date: Tue, 30 Oct 2018 15:04:26 -0400
Message-ID: <1540926266-21324-1-git-send-email-bruce.ashfield@windriver.com>
X-Mailer: git-send-email 2.5.0
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH v3][master-next] kernel: use olddefconfig as the primary target for KERNEL_CONFIG_COMMAND
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
X-List-Received-Date: Tue, 30 Oct 2018 19:05:16 -0000
Content-Type: text/plain

As was warned by commit 312ee68752fa [kconfig: announce removal of
oldnoconfig if used], oldnoconfig has been removed from the 4.20 kernel.

So we switch our default mode to olddefconfig.

commit fb16d8912 [kconfig: replace 'oldnoconfig' with 'olddefconfig',
and keep the old name as an alias] introduced olddefconfig in the 3.10
kernel, we shuffle oldnoconfig to the fallback target.

The fallback mode allows kernels between 3.10 and the currently listed
oldest kernel of 3.2 to continue to configure.

Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
---

v3: dropped 'yes' from the pipeline

v2: Tweaked to add a fallback mode as suggested by Andre McCurdy

Not for the release, just wanted to get this in the queue for
when master reopens so we'll be ready for 4.20+ kernel versions

Tested by configuring linux-yocto*

Bruce


 meta/classes/kernel.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
index e04d2fe00434..880c5ef17283 100644
--- a/meta/classes/kernel.bbclass
+++ b/meta/classes/kernel.bbclass
@@ -492,7 +492,7 @@ sysroot_stage_all () {
 	:
 }
 
-KERNEL_CONFIG_COMMAND ?= "oe_runmake_call -C ${S} CC="${KERNEL_CC}" O=${B} oldnoconfig"
+KERNEL_CONFIG_COMMAND ?= "oe_runmake_call -C ${S} CC="${KERNEL_CC}" O=${B} olddefconfig || oe_runmake -C ${S} O=${B} CC="${KERNEL_CC}" oldnoconfig"
 
 python check_oldest_kernel() {
     oldest_kernel = d.getVar('OLDEST_KERNEL')
-- 
2.5.0


