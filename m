Return-Path: <Bruce.Ashfield@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id D7CA17171C
	for <openembedded-core@lists.openembedded.org>;
	Wed,  1 Oct 2014 04:43:45 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.9/8.14.5) with ESMTP id s914hkKo005844
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 30 Sep 2014 21:43:46 -0700 (PDT)
Received: from yow-bashfiel-d3.wrs.com (128.224.56.46) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.174.1; Tue, 30 Sep 2014 21:43:45 -0700
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: <richard.purdie@linuxfoundation.org>
Date: Wed, 1 Oct 2014 00:43:33 -0400
Message-ID: <520c246cc0c17fe5dc7b0c851627a38437b163f7.1412137857.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 1.8.1.2
In-Reply-To: <cover.1412137857.git.bruce.ashfield@windriver.com>
References: <cover.1412137857.git.bruce.ashfield@windriver.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 3/6] linux-yocto/3.14: revert BFP feature, and fix intel-common -rt
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
X-List-Received-Date: Wed, 01 Oct 2014 04:43:52 -0000
Content-Type: text/plain

The BPF feature is causing build failures, so we are reverting it
for now.

In this update we also have the following fix for -rt:

  fb6271a942b5 intel: Remove the standard ktype nesting

Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
---
 meta/recipes-kernel/linux/linux-yocto-rt_3.14.bb   |  6 +++---
 meta/recipes-kernel/linux/linux-yocto-tiny_3.14.bb |  4 ++--
 meta/recipes-kernel/linux/linux-yocto_3.14.bb      | 16 ++++++++--------
 3 files changed, 13 insertions(+), 13 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_3.14.bb b/meta/recipes-kernel/linux/linux-yocto-rt_3.14.bb
index 1a756ecb3f2b..fba32450fc2b 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_3.14.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_3.14.bb
@@ -3,9 +3,9 @@ KBRANCH_qemuppc ?= "standard/preempt-rt/qemuppc"
 
 require recipes-kernel/linux/linux-yocto.inc
 
-SRCREV_machine ?= "1f000ea7a3aed269c78a8650672f05ff2447feb5"
-SRCREV_machine_qemuppc ?= "01a649de749d9e82291063bd23301a6e7530e100"
-SRCREV_meta ?= "0bd3ec19b64191efc9d0ba83d05c9f7f9bf4473a"
+SRCREV_machine ?= "546062dedb3339ef1932e01a5639f2448c04cc8a"
+SRCREV_machine_qemuppc ?= "93fc25319476f21750eb6c1e94978cad963c4bd7"
+SRCREV_meta ?= "fb6271a942b57bdc40c6e49f0203be153699f81c"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto-3.14.git;bareclone=1;branch=${KBRANCH},meta;name=machine,meta"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_3.14.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_3.14.bb
index 7b6d0e0f649f..ca541c116148 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_3.14.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_3.14.bb
@@ -8,8 +8,8 @@ LINUX_VERSION ?= "3.14.19"
 
 KMETA = "meta"
 
-SRCREV_machine ?= "dbe5b52e93ff114b2c0f5da6f6af91f52c18f2b8"
-SRCREV_meta ?= "0bd3ec19b64191efc9d0ba83d05c9f7f9bf4473a"
+SRCREV_machine ?= "0ca8f6b51728ca26129b4260be388ef2b7f366a8"
+SRCREV_meta ?= "fb6271a942b57bdc40c6e49f0203be153699f81c"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_3.14.bb b/meta/recipes-kernel/linux/linux-yocto_3.14.bb
index 7ef71f3e20b3..365a70fd9a9b 100644
--- a/meta/recipes-kernel/linux/linux-yocto_3.14.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_3.14.bb
@@ -10,14 +10,14 @@ KBRANCH_qemux86  ?= "standard/common-pc/base"
 KBRANCH_qemux86-64 ?= "standard/common-pc-64/base"
 KBRANCH_qemumips64 ?= "standard/mti-malta64"
 
-SRCREV_machine_qemuarm ?= "c21684fb4fad62bceafcc97ae592d1d1bd52cf36"
-SRCREV_machine_qemumips ?= "626a3a63414413e652daf3288903a58973d34520"
-SRCREV_machine_qemuppc ?= "a5e37ff008b4bf2c0cb573f54376cb8b48a79016"
-SRCREV_machine_qemux86 ?= "a39fd81fa54776b2ac8c288251846890c3124dee"
-SRCREV_machine_qemux86-64 ?= "dbe5b52e93ff114b2c0f5da6f6af91f52c18f2b8"
-SRCREV_machine_qemumips64 ?= "c14d3c68c725205a5724cffe9f6f688d1bc38b6e"
-SRCREV_machine ?= "dbe5b52e93ff114b2c0f5da6f6af91f52c18f2b8"
-SRCREV_meta ?= "0bd3ec19b64191efc9d0ba83d05c9f7f9bf4473a"
+SRCREV_machine_qemuarm ?= "0ed31872de2c0e62e9843fa714cb0f8e5f53b70c"
+SRCREV_machine_qemumips ?= "c3537ecd101c8494a1da5534ad934f25d6fa256e"
+SRCREV_machine_qemuppc ?= "df6daa113d535fd46668ba3bb0970c959f103f76"
+SRCREV_machine_qemux86 ?= "1d678e0d4ecd53b973a70fb087dc1275b4de4e0c"
+SRCREV_machine_qemux86-64 ?= "0ca8f6b51728ca26129b4260be388ef2b7f366a8"
+SRCREV_machine_qemumips64 ?= "6aa17794bc6795847dae3b60f9d9be01dac874ec"
+SRCREV_machine ?= "0ca8f6b51728ca26129b4260be388ef2b7f366a8"
+SRCREV_meta ?= "fb6271a942b57bdc40c6e49f0203be153699f81c"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto-3.14.git;bareclone=1;branch=${KBRANCH},${KMETA};name=machine,meta"
 
-- 
1.8.1.2


