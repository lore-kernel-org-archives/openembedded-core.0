Return-Path: <Bruce.Ashfield@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 438886ACEC
	for <openembedded-core@lists.openembedded.org>;
	Mon, 13 Oct 2014 03:54:13 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.9/8.14.5) with ESMTP id s9D3sAsC012590
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Sun, 12 Oct 2014 20:54:11 -0700 (PDT)
Received: from yow-bashfiel-d3.wrs.com (128.224.56.46) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.174.1; Sun, 12 Oct 2014 20:54:10 -0700
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: <richard.purdie@linuxfoundation.org>
Date: Sun, 12 Oct 2014 23:53:57 -0400
Message-ID: <9111a8eebb89ea3af262d06c06c7ca0db89f97db.1413172183.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 1.8.1.2
In-Reply-To: <cover.1413172183.git.bruce.ashfield@windriver.com>
References: <cover.1413172183.git.bruce.ashfield@windriver.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/3] linux-yocto/3.10: 8250/8250_dw: fix compile failure due to stable/Yocto conflict
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
X-List-Received-Date: Mon, 13 Oct 2014 03:54:19 -0000
Content-Type: text/plain

Updating the SRCREVs for the following fix:

   8250/8250_dw: fix compile failure due to stable/Yocto conflict

    As of merge 60a9d9fc565e4503dbb8705803e83d906afc4ad2, "Merge
    tag 'v3.10.48' into standard/base" the 8250_dw.c fails to
    compile due to an undeclared variable.

    This happens because stable brought in:

     -------------------------
     commit 6d5e79331417886196cb3a733bdb6645ba85bc42
     Author: Tim Kryger <tim.kryger@linaro.org>
     Date:   Tue Oct 1 10:18:08 2013 -0700

        serial: 8250_dw: Improve unwritable LCR workaround

        commit c49436b657d0a56a6ad90d14a7c3041add7cf64d upstream.

     [...]

        [wangnan: backport to 3.10.43:
          - adjust context
          - remove unneeded local var]
        Signed-off-by: Wang Nan <wangnan0@huawei.com>
        Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
     ------------------------

    ...which deletes the p->private_data declaration since it became
    unused at that point, however in Yocto, we also have this:

     -----------------------
     commit 0e02b050c3cafbcbf9952125089a27e02d6ecea9
     Author: David Daney <david.daney@cavium.com>
     Date:   Wed Jun 19 20:37:27 2013 +0000

        tty/8250_dw: Add support for OCTEON UARTS.

     [...]

        Signed-off-by: Ralf Baechle <ralf@linux-mips.org>
        (cherry picked from commit d5f1af7ece96cf52e0b110c72210ac15c2f65438)
        Signed-off-by: Darren Hart <dvhart@linux.intel.com>
     -----------------------

    ...which _adds_ another user of the p->private_data.

    Here we restore the declaration in order that 8250_dw compiles.

    Signed-off-by: Ong Boon Leong <boon.leong.ong@intel.com>
    [PG: add root cause info to commit log.]
    Signed-off-by: Paul Gortmaker <paul.gortmaker@windriver.com>
    Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>

Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
---
 meta/recipes-kernel/linux/linux-yocto-rt_3.10.bb   |  4 ++--
 meta/recipes-kernel/linux/linux-yocto-tiny_3.10.bb |  2 +-
 meta/recipes-kernel/linux/linux-yocto_3.10.bb      | 14 +++++++-------
 3 files changed, 10 insertions(+), 10 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_3.10.bb b/meta/recipes-kernel/linux/linux-yocto-rt_3.10.bb
index 10759720580c..ad55a2ed8082 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_3.10.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_3.10.bb
@@ -3,8 +3,8 @@ KBRANCH_qemuppc ?= "standard/preempt-rt/qemuppc"
 
 require recipes-kernel/linux/linux-yocto.inc
 
-SRCREV_machine ?= "0abce5181274dbf37788ab8d2c62e135defd9956"
-SRCREV_machine_qemuppc ?= "c31f38edf5dec2c295632199dbfe3f5a221f7c16"
+SRCREV_machine ?= "cbaa8c8b83a7da70b94cc6cc1a25090071af4c3f"
+SRCREV_machine_qemuppc ?= "41338ab2a1c19435e24bbd162ff6b3f8b90d7afa"
 SRCREV_meta ?= "f79a00265eefbe2fffc2cdb03f67235497a9a87e"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto-3.10.git;bareclone=1;branch=${KBRANCH},meta;name=machine,meta"
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_3.10.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_3.10.bb
index a53ce544a39b..9e33aa692b63 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_3.10.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_3.10.bb
@@ -9,7 +9,7 @@ LINUX_VERSION ?= "3.10.55"
 
 KMETA = "meta"
 
-SRCREV_machine ?= "8e055f3b669c65e83ba7128c248c632eedafad72"
+SRCREV_machine ?= "3677ea7f9476458aa6dec440243de3a6fb1343a9"
 SRCREV_meta ?= "f79a00265eefbe2fffc2cdb03f67235497a9a87e"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
diff --git a/meta/recipes-kernel/linux/linux-yocto_3.10.bb b/meta/recipes-kernel/linux/linux-yocto_3.10.bb
index ea6985659598..e612d36e28d0 100644
--- a/meta/recipes-kernel/linux/linux-yocto_3.10.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_3.10.bb
@@ -10,13 +10,13 @@ KBRANCH_qemux86  ?= "standard/common-pc/base"
 KBRANCH_qemux86-64  ?= "standard/common-pc-64/base"
 KBRANCH_qemumips64 ?= "standard/mti-malta64"
 
-SRCREV_machine_qemuarm ?= "a4195791d27ef50feb454765149ea34621ef8ed7"
-SRCREV_machine_qemumips ?= "ff747b3dff7dfa643b3447a348b901cacc5b6a16"
-SRCREV_machine_qemuppc ?= "46e30d608f4268b0ea77362398aae91f1d410ee3"
-SRCREV_machine_qemux86 ?= "8e055f3b669c65e83ba7128c248c632eedafad72"
-SRCREV_machine_qemux86-64 ?= "8e055f3b669c65e83ba7128c248c632eedafad72"
-SRCREV_machine_qemumips64 ?= "42457c568170cb11a9011382ebca4677f22b35c1"
-SRCREV_machine ?= "8e055f3b669c65e83ba7128c248c632eedafad72"
+SRCREV_machine_qemuarm ?= "9c8da40f662806406940decf972841c1b86895a5"
+SRCREV_machine_qemumips ?= "96adff9ce54c009ba90c3ddcaa6d16beb7a9c2b3"
+SRCREV_machine_qemuppc ?= "cf3a9a021e2abb3b19807b2ba3c29c1d0918730b"
+SRCREV_machine_qemux86 ?= "3677ea7f9476458aa6dec440243de3a6fb1343a9"
+SRCREV_machine_qemux86-64 ?= "3677ea7f9476458aa6dec440243de3a6fb1343a9"
+SRCREV_machine_qemumips64 ?= "89ab3082e01c4d98f9d14630aa904dba641c5373"
+SRCREV_machine ?= "3677ea7f9476458aa6dec440243de3a6fb1343a9"
 SRCREV_meta ?= "f79a00265eefbe2fffc2cdb03f67235497a9a87e"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto-3.10.git;bareclone=1;branch=${KBRANCH},${KMETA};name=machine,meta"
-- 
1.8.1.2


