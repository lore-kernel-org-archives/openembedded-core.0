Return-Path: <Bruce.Ashfield@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 6CE9265C8F
	for <openembedded-core@lists.openembedded.org>;
	Mon, 17 Dec 2018 03:39:55 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id wBH3du34021441
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Sun, 16 Dec 2018 19:39:56 -0800 (PST)
Received: from yow-bashfiel-d4.wrs.com (128.224.56.94) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.408.0; Sun, 16 Dec 2018 19:39:55 -0800
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: <richard.purdie@linuxfoundation.org>
Date: Sun, 16 Dec 2018 22:38:21 -0500
Message-ID: <81a4f0860dc7264bbb0f155c2f991f491b2931b8.1545017775.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 2.5.0
In-Reply-To: <cover.1545017774.git.bruce.ashfield@windriver.com>
References: <cover.1545017774.git.bruce.ashfield@windriver.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 09/17] linux-yocto/4.18: integrate CVE fixes
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
X-List-Received-Date: Mon, 17 Dec 2018 03:39:55 -0000
Content-Type: text/plain

Integrating the following CVE fixes into the 4.18 tree:

  e78a46f375fe cdrom: fix improper type cast, which can leat to information leak.
  4815231b9b65 btrfs: tree-checker: Verify block_group_item
  6dfe2fe5dd52 btrfs: Introduce mount time chunk <-> dev extent mapping check
  ccd06dcdc11b btrfs: Verify that every chunk has corresponding block group at mount time
  7cf70b1e759a btrfs: Check that each block group has corresponding chunk at mount time
  166bbd6ff86b btrfs: validate type when reading a chunk
  ecf31c809599 ip: frags: fix crash in ip_do_fragment()
  02fc22c5eb30 ip: use rb trees for IP frag queue.
  72dd075ee367 net: modify skb_rbtree_purge to return the truesize of all purged skbs.
  7a9f904c49aa ip: discard IPv4 datagrams with overlapping segments.
  abea198657b7 f2fs: fix to do sanity check with i_extra_isize
  408c425c41e4 f2fs: fix to do sanity check with node footer and iblocks
  5e4ccef734c3 f2fs: fix to do sanity check with user_block_count

Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
---
 meta/recipes-kernel/linux/linux-yocto-rt_4.18.bb   |  2 +-
 meta/recipes-kernel/linux/linux-yocto-tiny_4.18.bb |  4 ++--
 meta/recipes-kernel/linux/linux-yocto_4.18.bb      | 16 ++++++++--------
 3 files changed, 11 insertions(+), 11 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_4.18.bb b/meta/recipes-kernel/linux/linux-yocto-rt_4.18.bb
index 4bb25488d94e..66da7e9e08de 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_4.18.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_4.18.bb
@@ -11,7 +11,7 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "5b9223498c5870c46d9c8bb87db649d00dad7abe"
+SRCREV_machine ?= "420a1d5ae972845413713ce882570f772423049f"
 SRCREV_meta ?= "5a99020e693eebe662ae0c4c08b65afedbd5cde3"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine \
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_4.18.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_4.18.bb
index d8e0a40f7b69..2f1e935110d9 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_4.18.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_4.18.bb
@@ -15,8 +15,8 @@ DEPENDS += "openssl-native util-linux-native"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine_qemuarm ?= "5b8abdbe6fb783fe30c835ff63008eb43257f32c"
-SRCREV_machine ?= "218a2500084b70dfe9cedd3856ec572563d55ace"
+SRCREV_machine_qemuarm ?= "26f444925aa62171e79a155bec72f055502cbce2"
+SRCREV_machine ?= "e78a46f375febc5f9305b6f94ae12fbf00b46330"
 SRCREV_meta ?= "5a99020e693eebe662ae0c4c08b65afedbd5cde3"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
diff --git a/meta/recipes-kernel/linux/linux-yocto_4.18.bb b/meta/recipes-kernel/linux/linux-yocto_4.18.bb
index 6097e434154a..d01bbfd70382 100644
--- a/meta/recipes-kernel/linux/linux-yocto_4.18.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_4.18.bb
@@ -11,14 +11,14 @@ KBRANCH_qemux86  ?= "v4.18/standard/base"
 KBRANCH_qemux86-64 ?= "v4.18/standard/base"
 KBRANCH_qemumips64 ?= "v4.18/standard/mti-malta64"
 
-SRCREV_machine_qemuarm ?= "eb0ef26f2bac0cd84961eba7038e8ff10c6a6fb1"
-SRCREV_machine_qemuarm64 ?= "218a2500084b70dfe9cedd3856ec572563d55ace"
-SRCREV_machine_qemumips ?= "7f7ea78d7b783413033d6adf45ec8952f8c98d60"
-SRCREV_machine_qemuppc ?= "218a2500084b70dfe9cedd3856ec572563d55ace"
-SRCREV_machine_qemux86 ?= "218a2500084b70dfe9cedd3856ec572563d55ace"
-SRCREV_machine_qemux86-64 ?= "218a2500084b70dfe9cedd3856ec572563d55ace"
-SRCREV_machine_qemumips64 ?= "db0ce433d9b74830d5b8dd3171ffbd7b1119cbfa"
-SRCREV_machine ?= "218a2500084b70dfe9cedd3856ec572563d55ace"
+SRCREV_machine_qemuarm ?= "fc10a65e12d9c6d1e0c63e19688727bc72922cdd"
+SRCREV_machine_qemuarm64 ?= "e78a46f375febc5f9305b6f94ae12fbf00b46330"
+SRCREV_machine_qemumips ?= "d3ecc257838be6d1a15e1eb114ee960283bacf33"
+SRCREV_machine_qemuppc ?= "e78a46f375febc5f9305b6f94ae12fbf00b46330"
+SRCREV_machine_qemux86 ?= "e78a46f375febc5f9305b6f94ae12fbf00b46330"
+SRCREV_machine_qemux86-64 ?= "e78a46f375febc5f9305b6f94ae12fbf00b46330"
+SRCREV_machine_qemumips64 ?= "48c3bf17f2c4699c9ee442c62ecdaad85fdb4232"
+SRCREV_machine ?= "e78a46f375febc5f9305b6f94ae12fbf00b46330"
 SRCREV_meta ?= "5a99020e693eebe662ae0c4c08b65afedbd5cde3"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRANCH}; \
-- 
2.5.0


