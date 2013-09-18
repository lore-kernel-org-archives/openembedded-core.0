Return-Path: <Bruce.Ashfield@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 2FE1A6110C
	for <openembedded-core@lists.openembedded.org>;
	Wed, 18 Sep 2013 18:24:46 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id r8IIOlHd027947
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 18 Sep 2013 11:24:47 -0700 (PDT)
Received: from yow-bashfiel-d3.wrs.com (128.224.130.112) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.2.347.0; Wed, 18 Sep 2013 11:24:46 -0700
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: <richard.purdie@linuxfoundation.org>
Date: Wed, 18 Sep 2013 14:24:40 -0400
Message-ID: <f63644605cb7a7ae493e2b49a7d5419fab9a401b.1379528498.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <cover.1379528498.git.bruce.ashfield@windriver.com>
References: <cover.1379528498.git.bruce.ashfield@windriver.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/3] linux-yocto/3.10: mips configuration changes
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
X-List-Received-Date: Wed, 18 Sep 2013 18:24:46 -0000
Content-Type: text/plain

Updating the 3.10 SRCREV to import the following MIPS configuration changes

   4f689aa meta: remove ftrace/ftrace-disable feature
   3058d81 mips: have the mips BSPs disable function tracing instead of ftrace
   935f43f meta: add ftrace/ftrace-function-tracer-disable feature
   0d72a03 mti-malta64: Default to support o32 and n32 userspace binaries

The first three changes improve the ftrace disabling fragments, to allow tracepoints
and ftrace to be enabled, while only disabling dynamic ftrace. This allows tools
that required tracepoints (like lttng) to be built against MIPS.

The mti-malta64 change adds n32 and o32 support to the default configuration to
support a broader range of userspace binaries.

[YOCTO #5215]

Signed-off-by: Tom Zanussi <tom.zanussi@intel.com>
Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
---
 meta/recipes-kernel/linux/linux-yocto-rt_3.10.bb   |    2 +-
 meta/recipes-kernel/linux/linux-yocto-tiny_3.10.bb |    2 +-
 meta/recipes-kernel/linux/linux-yocto_3.10.bb      |    2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_3.10.bb b/meta/recipes-kernel/linux/linux-yocto-rt_3.10.bb
index 1a2870c..65fb5f0 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_3.10.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_3.10.bb
@@ -5,7 +5,7 @@ KBRANCH_qemuppc = "standard/preempt-rt/qemuppc"
 
 SRCREV_machine ?= "4de6b6b24c44ef644b46405a85c550128d4a779a"
 SRCREV_machine_qemuppc ?= "24a1786e5ed0d479638af5738375e396bf4c922c"
-SRCREV_meta ?= "285f93bf942e8f6fa678ffc6cc53696ed5400718"
+SRCREV_meta ?= "4f689aa30a2c9cf5dceb2fa3696d2cb208ee9173"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto-3.10.git;bareclone=1;branch=${KBRANCH},meta;name=machine,meta"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_3.10.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_3.10.bb
index f9009c1..4b33f3c 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_3.10.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_3.10.bb
@@ -10,7 +10,7 @@ LINUX_VERSION ?= "3.10.11"
 KMETA = "meta"
 
 SRCREV_machine ?= "702040ac7c7ec66a29b4d147665ccdd0ff015577"
-SRCREV_meta ?= "285f93bf942e8f6fa678ffc6cc53696ed5400718"
+SRCREV_meta ?= "4f689aa30a2c9cf5dceb2fa3696d2cb208ee9173"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_3.10.bb b/meta/recipes-kernel/linux/linux-yocto_3.10.bb
index 77fa3db..3e8b476 100644
--- a/meta/recipes-kernel/linux/linux-yocto_3.10.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_3.10.bb
@@ -10,7 +10,7 @@ SRCREV_machine_qemux86 ?= "702040ac7c7ec66a29b4d147665ccdd0ff015577"
 SRCREV_machine_qemux86-64 ?= "702040ac7c7ec66a29b4d147665ccdd0ff015577"
 SRCREV_machine_qemumips64 ?= "6b3a777e3724d30ba03d88d75698fa0734c5a73f"
 SRCREV_machine ?= "702040ac7c7ec66a29b4d147665ccdd0ff015577"
-SRCREV_meta ?= "285f93bf942e8f6fa678ffc6cc53696ed5400718"
+SRCREV_meta ?= "4f689aa30a2c9cf5dceb2fa3696d2cb208ee9173"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto-3.10.git;bareclone=1;branch=${KBRANCH},${KMETA};name=machine,meta"
 
-- 
1.7.10.4


