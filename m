Received: from mail-ie0-f175.google.com ([209.85.223.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <bruce.ashfield@gmail.com>) id 1TLDvA-0005lj-Rx
	for openembedded-core@lists.openembedded.org;
	Mon, 08 Oct 2012 16:03:06 +0200
Received: by mail-ie0-f175.google.com with SMTP id c13so9645374ieb.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 08 Oct 2012 06:49:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
	:references:in-reply-to:references;
	bh=Azl8+73QL0SMoYHnjTvaTZeo4oBajueM3ZncGQaSOtk=;
	b=T0ais3CrL1ypY5ZAV62aOFFFnLuXXpwKJ3/1aGeDsh+1RcshmMmXR/vNj+xMM1Md3L
	/i/QKVmhO6pKHS1BPQDaED/uBLcToDhg76h6pNnunU34EYF5NKPgC2742NaG07H2qcEF
	JcdhUNXEwMt0zgcw38Ryy1y9nH8bkLQleH2dAgXKjLIJ8fkjde5tx9toVObuIVyMPOxM
	VnfIjqG2vWEl8cTHR0QPxYQV9DtoB0xd+yNW1UcoJaDoCc5veZdREJCosearTSeuKZ/T
	hTbREvyj4izbsITHSahddQQK9rhT8lXSu5gkzWvr9sHkqfLFnwYlHFhFvDgfTOYQZ33K
	KV5A==
Received: by 10.50.190.131 with SMTP id gq3mr6057945igc.68.1349704194184;
	Mon, 08 Oct 2012 06:49:54 -0700 (PDT)
Received: from localhost.localdomain ([96.44.93.233])
	by mx.google.com with ESMTPS id uj11sm1664431igb.15.2012.10.08.06.49.51
	(version=SSLv3 cipher=OTHER); Mon, 08 Oct 2012 06:49:53 -0700 (PDT)
Sender: Bruce Ashfield <bruce.ashfield@gmail.com>
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: richard.purdie@linuxfoundation.org
Date: Mon,  8 Oct 2012 09:49:38 -0400
Message-Id: <000119d8eb8450b6cb8a419869b2097bfd91fdb8.1349703933.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 1.7.5.4
In-Reply-To: <cover.1349703933.git.bruce.ashfield@windriver.com>
References: <cover.1349703933.git.bruce.ashfield@windriver.com>
In-Reply-To: <cover.1349703933.git.bruce.ashfield@windriver.com>
References: <cover.1349703933.git.bruce.ashfield@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/1] linux-yocto/3.4: perf: parallel build and tools fixes
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 08 Oct 2012 14:03:07 -0000

korg commit 42dcd1f4e [perf tools: Fix parallel build] fixes parallel
build issues that are being seen in the autobuilder.

We also have a fix from Tom:

[
    perf annotate: replace 'expand' with equivalent sed expression

    We don't have 'expand' in our userspace so we need to accomplish the
    same thing using 'sed', which we do have.
]

So we apply it to all BSP branches and kernel types.

Signed-off-by: Tom Zanussi <tom.zanussi@intel.com>
Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
---
 meta/recipes-kernel/linux/linux-yocto-rt_3.4.bb   |    6 +++---
 meta/recipes-kernel/linux/linux-yocto-tiny_3.4.bb |    2 +-
 meta/recipes-kernel/linux/linux-yocto_3.4.bb      |   12 ++++++------
 3 files changed, 10 insertions(+), 10 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_3.4.bb b/meta/recipes-kernel/linux/linux-yocto-rt_3.4.bb
index c8bf028..91dc54f 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_3.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_3.4.bb
@@ -8,9 +8,9 @@ LINUX_KERNEL_TYPE = "preempt-rt"
 
 KMETA = "meta"
 
-SRCREV_machine ?= "6d7122966eaae849ba3f2e1ccb94cdab17a46fbd"
-SRCREV_machine_qemuppc ?= "8b2acbc859c616dfcad79f786bacb856f370f4c2"
-SRCREV_meta ?= "5bdc655034a58a7147176a8a882d81e2fd51e4b9"
+SRCREV_machine ?= "5705c8037d2c47938034ead87c70ae3ebef552f7"
+SRCREV_machine_qemuppc ?= "c8b651aab5d2d5c0839cdedc0c0ec5dc09cf47c0"
+SRCREV_meta ?= "a201268353c030d9fafe00f2041976f7437d9386"
 
 PR = "${INC_PR}.0"
 PV = "${LINUX_VERSION}+git${SRCPV}"
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_3.4.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_3.4.bb
index a0c8ffb..60b877f 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_3.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_3.4.bb
@@ -12,7 +12,7 @@ LINUX_VERSION ?= "3.4.11"
 
 KMETA = "meta"
 
-SRCREV_machine ?= "3fa06aa29078fdb2af431de2d3fdae7d281ba85f"
+SRCREV_machine ?= "449f7f520350700858f21a5554b81cc8ad23267d"
 SRCREV_meta ?= "a201268353c030d9fafe00f2041976f7437d9386"
 
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_3.4.bb b/meta/recipes-kernel/linux/linux-yocto_3.4.bb
index 6b1f0fd..3383147 100644
--- a/meta/recipes-kernel/linux/linux-yocto_3.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_3.4.bb
@@ -3,12 +3,12 @@ require recipes-kernel/linux/linux-yocto.inc
 KBRANCH_DEFAULT = "standard/base"
 KBRANCH = "${KBRANCH_DEFAULT}"
 
-SRCREV_machine_qemuarm ?= "8f05f1d8adbf1551a80225049dd381ffbb64a6c5"
-SRCREV_machine_qemumips  ?= "fb23a2ed7b94548b1736fdb55efb26f88bc5c171"
-SRCREV_machine_qemuppc ?= "cdecf5940d81330680ce1517a7bc101556792e71"
-SRCREV_machine_qemux86 ?= "3fa06aa29078fdb2af431de2d3fdae7d281ba85f"
-SRCREV_machine_qemux86-64 ?= "3fa06aa29078fdb2af431de2d3fdae7d281ba85f"
-SRCREV_machine ?= "3fa06aa29078fdb2af431de2d3fdae7d281ba85f"
+SRCREV_machine_qemuarm ?= "8ee53c3b82ada3cdfd7d25f07d3975834ac9a9b2"
+SRCREV_machine_qemumips  ?= "caf99a20e3c3ba036ed1bb46875059a0d24e4fbd"
+SRCREV_machine_qemuppc ?= "7833f1549c3d44cce8aea38b65cd501229aad492"
+SRCREV_machine_qemux86 ?= "449f7f520350700858f21a5554b81cc8ad23267d"
+SRCREV_machine_qemux86-64 ?= "449f7f520350700858f21a5554b81cc8ad23267d"
+SRCREV_machine ?= "449f7f520350700858f21a5554b81cc8ad23267d"
 SRCREV_meta ?= "a201268353c030d9fafe00f2041976f7437d9386"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto-3.4.git;protocol=git;nocheckout=1;branch=${KBRANCH},meta;name=machine,meta"
-- 
1.7.5.4



