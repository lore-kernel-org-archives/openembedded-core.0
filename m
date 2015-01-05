Return-Path: <akuster808@gmail.com>
Received: from pdbfp1 (mail-pd0-f195.google.com [209.85.192.195])
	by mail.openembedded.org (Postfix) with ESMTP id 6957A72828
	for <openembedded-core@lists.openembedded.org>;
	Mon,  5 Jan 2015 20:40:51 +0000 (UTC)
Received: by pdbfp1 with SMTP id fp1so25355492pdb.4
	for <openembedded-core@lists.openembedded.org>;
	Mon, 05 Jan 2015 12:40:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references;
	bh=FUn/jZZO1kZwDGXAw2SDc10upi4phzuMAugQoEGbKxo=;
	b=VHT60YY4EIFwXCAxBhmuOpikH2gnGqg5eKSZc7fgN3RNkJTHpDa2S+KpBpV4/iNYvA
	Q1ne74wUj5ok+/mXrvxKrvCViX3jOI/QKnn2q4L8WeGrm75McmOpKqJTJeMWOhIian7n
	Z7ktOnh9YSG+hFV78z5dsKFgLlajoopoMf4J4vrKibaOQOWmqreoMj8sfqstsmQomPBZ
	h2g50XIU2Q/eynslsxbjUrgsAUPnkcEEtInoPXIirSrJFES0Z9BqZYoDlMA8bBshIIpP
	3+BwVAYkucIZHlxwXHkwoTBO1JhXyO3BOrM+ZCu+lDtIdxnAVl5Jylbmq3ejppHRujBx
	U2AQ==
X-Received: by 10.66.63.106 with SMTP id f10mr127105473pas.0.1420490452833;
	Mon, 05 Jan 2015 12:40:52 -0800 (PST)
Received: from bigisland.hsd1.ca.comcast.net
	(c-76-20-92-207.hsd1.ca.comcast.net. [76.20.92.207])
	by mx.google.com with ESMTPSA id rn15sm592657pab.10.2015.01.05.12.40.50
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 05 Jan 2015 12:40:51 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org,
	richard.purdie@linuxfoundation.org
Date: Mon,  5 Jan 2015 12:40:39 -0800
Message-Id: <e491e13f5ed896cd176335649f189176880019e6.1420490240.git.akuster808@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <4424464b88e41cee5acfde9076de68a2303f043e.1420490240.git.akuster808@gmail.com>
References: <4424464b88e41cee5acfde9076de68a2303f043e.1420490240.git.akuster808@gmail.com>
In-Reply-To: <cover.1420490240.git.akuster808@gmail.com>
References: <cover.1420490240.git.akuster808@gmail.com>
Subject: [PATCH 05/12] linux-yocto/3.10: 8250/8250_dw: fix compile failure due to stable/Yocto conflict
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
X-List-Received-Date: Mon, 05 Jan 2015 20:40:52 -0000

From: Bruce Ashfield <bruce.ashfield@windriver.com>

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

(From OE-Core rev: 4b4d1f38ea54ef8545e726ac9e181da08a2bad05)

Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
Signed-off-by: Ross Burton <ross.burton@intel.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta/recipes-kernel/linux/linux-yocto-rt_3.10.bb   |  4 ++--
 meta/recipes-kernel/linux/linux-yocto-tiny_3.10.bb |  2 +-
 meta/recipes-kernel/linux/linux-yocto_3.10.bb      | 14 +++++++-------
 3 files changed, 10 insertions(+), 10 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_3.10.bb b/meta/recipes-kernel/linux/linux-yocto-rt_3.10.bb
index 1075972..ad55a2e 100644
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
index a53ce54..9e33aa6 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_3.10.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_3.10.bb
@@ -9,7 +9,7 @@ LINUX_VERSION ?= "3.10.55"
 
 KMETA = "meta"
 
-SRCREV_machine ?= "8e055f3b669c65e83ba7128c248c632eedafad72"
+SRCREV_machine ?= "3677ea7f9476458aa6dec440243de3a6fb1343a9"
 SRCREV_meta ?= "f79a00265eefbe2fffc2cdb03f67235497a9a87e"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
diff --git a/meta/recipes-kernel/linux/linux-yocto_3.10.bb b/meta/recipes-kernel/linux/linux-yocto_3.10.bb
index ea69856..e612d36 100644
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
1.9.1


