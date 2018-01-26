Return-Path: <Bruce.Ashfield@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 5EF6C78432
	for <openembedded-core@lists.openembedded.org>;
	Fri, 26 Jan 2018 13:59:26 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id w0QDxRQD003793
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Fri, 26 Jan 2018 05:59:27 -0800 (PST)
Received: from yow-bashfiel-d4.wrs.com (128.224.56.94) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.361.1; Fri, 26 Jan 2018 05:59:27 -0800
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: <richard.purdie@linuxfoundation.org>
Date: Fri, 26 Jan 2018 08:59:13 -0500
Message-ID: <dd437b9490d16f62560de45ce9f0a43416dad826.1516973739.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 2.5.0
In-Reply-To: <cover.1516973739.git.bruce.ashfield@windriver.com>
References: <cover.1516973739.git.bruce.ashfield@windriver.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 02/12] linux-yocto/4.9: fix aufs build
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
X-List-Received-Date: Fri, 26 Jan 2018 13:59:27 -0000
Content-Type: text/plain

The aufs4 core code was missing some changes to build against
the 4.9 fs subsystem. This commit resyncs with the upstream
repo, and we can once again build against 4.9.

Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
---
 meta/recipes-kernel/linux/linux-yocto-rt_4.9.bb   |  4 ++--
 meta/recipes-kernel/linux/linux-yocto-tiny_4.9.bb |  4 ++--
 meta/recipes-kernel/linux/linux-yocto_4.9.bb      | 18 +++++++++---------
 3 files changed, 13 insertions(+), 13 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_4.9.bb b/meta/recipes-kernel/linux/linux-yocto-rt_4.9.bb
index 2fb2aa063874..3e08cd6fe645 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_4.9.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_4.9.bb
@@ -11,8 +11,8 @@ python () {
         raise bb.parse.SkipPackage("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "56b06caa70f42d31067f33204a89417b3818aa77"
-SRCREV_meta ?= "d15398f64655e36b444d69b3bed43444608abf55"
+SRCREV_machine ?= "c83e63d1a6da1218b61d352a866bc174554f71a9"
+SRCREV_meta ?= "a2dfb1610d9dad34652a3c27c6c9d8751ed67af6"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto-4.9.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-4.9;destsuffix=${KMETA}"
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_4.9.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_4.9.bb
index 3e6702977516..398209ef9a3c 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_4.9.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_4.9.bb
@@ -9,8 +9,8 @@ LINUX_VERSION ?= "4.9.71"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine ?= "3061011aade2678733665bccd553fdcd60165671"
-SRCREV_meta ?= "d15398f64655e36b444d69b3bed43444608abf55"
+SRCREV_machine ?= "a87b8d53730b5736575c738390abc498a31ba735"
+SRCREV_meta ?= "a2dfb1610d9dad34652a3c27c6c9d8751ed67af6"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_4.9.bb b/meta/recipes-kernel/linux/linux-yocto_4.9.bb
index e97355cbca20..1fdd7bf1d54f 100644
--- a/meta/recipes-kernel/linux/linux-yocto_4.9.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_4.9.bb
@@ -11,15 +11,15 @@ KBRANCH_qemux86  ?= "standard/base"
 KBRANCH_qemux86-64 ?= "standard/base"
 KBRANCH_qemumips64 ?= "standard/mti-malta64"
 
-SRCREV_machine_qemuarm ?= "0638cb025fd0d8192dbc0acc09018d6fec9f1597"
-SRCREV_machine_qemuarm64 ?= "3061011aade2678733665bccd553fdcd60165671"
-SRCREV_machine_qemumips ?= "a8971e1548188eb07b88896c7f9d590abb92ed98"
-SRCREV_machine_qemuppc ?= "3061011aade2678733665bccd553fdcd60165671"
-SRCREV_machine_qemux86 ?= "3061011aade2678733665bccd553fdcd60165671"
-SRCREV_machine_qemux86-64 ?= "3061011aade2678733665bccd553fdcd60165671"
-SRCREV_machine_qemumips64 ?= "3cff06df7c72b53af99045fcbcdaf2f9285adc1a"
-SRCREV_machine ?= "3061011aade2678733665bccd553fdcd60165671"
-SRCREV_meta ?= "d15398f64655e36b444d69b3bed43444608abf55"
+SRCREV_machine_qemuarm ?= "7e0dc801cf0ab19827fd33214fe6036d80258653"
+SRCREV_machine_qemuarm64 ?= "a87b8d53730b5736575c738390abc498a31ba735"
+SRCREV_machine_qemumips ?= "69371c276be034fff40b5652184401d8dc2262a1"
+SRCREV_machine_qemuppc ?= "a87b8d53730b5736575c738390abc498a31ba735"
+SRCREV_machine_qemux86 ?= "a87b8d53730b5736575c738390abc498a31ba735"
+SRCREV_machine_qemux86-64 ?= "a87b8d53730b5736575c738390abc498a31ba735"
+SRCREV_machine_qemumips64 ?= "b3159328d2dd0c53cf81b702c4f9cd520649c84a"
+SRCREV_machine ?= "a87b8d53730b5736575c738390abc498a31ba735"
+SRCREV_meta ?= "a2dfb1610d9dad34652a3c27c6c9d8751ed67af6"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto-4.9.git;name=machine;branch=${KBRANCH}; \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-4.9;destsuffix=${KMETA}"
-- 
2.5.0


