Return-Path: <Bruce.Ashfield@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id D7D6C7171E
	for <openembedded-core@lists.openembedded.org>;
	Wed,  1 Oct 2014 04:43:48 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.9/8.14.5) with ESMTP id s914hl7d005856
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 30 Sep 2014 21:43:47 -0700 (PDT)
Received: from yow-bashfiel-d3.wrs.com (128.224.56.46) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.174.1; Tue, 30 Sep 2014 21:43:46 -0700
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: <richard.purdie@linuxfoundation.org>
Date: Wed, 1 Oct 2014 00:43:34 -0400
Message-ID: <77eae784b6a4c8bef67d025c7567b739d8d21748.1412137857.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 1.8.1.2
In-Reply-To: <cover.1412137857.git.bruce.ashfield@windriver.com>
References: <cover.1412137857.git.bruce.ashfield@windriver.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 4/6] linux-yocto/3.14/3.17: allmodconfig/allyesconfig build fixes
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

It was found that some of the recent feature merges for 3.14/3.17 are
not allmodconfig and allyesconfig safe.

Since this is a basic test before kernel patches are submitted, we've
fixed the features to meet this standard.

Integrating the following fixes from Paul Gortmaker:

  b4213d81ea3f fat: don't use obsolete random32 call in namei_vfat
  2cc7eba15c1f cryptodev: stomp dynamic version numbering for in tree builds
  5d1dda7aae4b Target/dif: Introduce protection-passthough-only mode
  3d9772d8facf vhost: fix compile fail due to reallocated acked_features field.
  efad59d3a174 virtio-scsi.h: Add virtio_scsi_cmd_req_pi + VIRTIO_SCSI_F_T10_PI bits
  902f34d36102 aufs: apply aufs3-mmap.patch from 3.14 branch
  30efc2e9484e aufs: import core files from aufs3.14 20140915
  e42f87adef10 Revert "aufs: aufs3-mmap.patch"
  a818774bd338 Revert "aufs: core aufs filesystem"

Signed-off-by: Paul Gortmaker <paul.gortmaker@windriver.com>
Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
---
 meta/recipes-kernel/linux/linux-yocto-rt_3.14.bb   |  4 ++--
 meta/recipes-kernel/linux/linux-yocto-tiny_3.14.bb |  2 +-
 meta/recipes-kernel/linux/linux-yocto-tiny_3.17.bb |  2 +-
 meta/recipes-kernel/linux/linux-yocto_3.14.bb      | 14 +++++++-------
 meta/recipes-kernel/linux/linux-yocto_3.17.bb      | 14 +++++++-------
 5 files changed, 18 insertions(+), 18 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_3.14.bb b/meta/recipes-kernel/linux/linux-yocto-rt_3.14.bb
index fba32450fc2b..b2ad078bcad4 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_3.14.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_3.14.bb
@@ -3,8 +3,8 @@ KBRANCH_qemuppc ?= "standard/preempt-rt/qemuppc"
 
 require recipes-kernel/linux/linux-yocto.inc
 
-SRCREV_machine ?= "546062dedb3339ef1932e01a5639f2448c04cc8a"
-SRCREV_machine_qemuppc ?= "93fc25319476f21750eb6c1e94978cad963c4bd7"
+SRCREV_machine ?= "0a875ce52aa7a42ddabdb87038074381bb268e77"
+SRCREV_machine_qemuppc ?= "b993661d41f08846daa28b14f89c8ae3e94225bd"
 SRCREV_meta ?= "fb6271a942b57bdc40c6e49f0203be153699f81c"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto-3.14.git;bareclone=1;branch=${KBRANCH},meta;name=machine,meta"
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_3.14.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_3.14.bb
index ca541c116148..79bd6935a22c 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_3.14.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_3.14.bb
@@ -8,7 +8,7 @@ LINUX_VERSION ?= "3.14.19"
 
 KMETA = "meta"
 
-SRCREV_machine ?= "0ca8f6b51728ca26129b4260be388ef2b7f366a8"
+SRCREV_machine ?= "902f34d36102a4b2008b776ecae686f80d307e12"
 SRCREV_meta ?= "fb6271a942b57bdc40c6e49f0203be153699f81c"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_3.17.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_3.17.bb
index c2bd4a1f6547..9c33985fab98 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_3.17.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_3.17.bb
@@ -8,7 +8,7 @@ LINUX_VERSION ?= "3.17-rc6"
 
 KMETA = "meta"
 
-SRCREV_machine ?= "460fa8aefe8c4f695245ad3a21da96af2c341f21"
+SRCREV_machine ?= "8b5bc69a2e44100313cf2a5073a07f495a6ff08e"
 SRCREV_meta ?= "6050ee24b0b51ccaf35894afc5def0b59f434977"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
diff --git a/meta/recipes-kernel/linux/linux-yocto_3.14.bb b/meta/recipes-kernel/linux/linux-yocto_3.14.bb
index 365a70fd9a9b..a2f4b4dccf0b 100644
--- a/meta/recipes-kernel/linux/linux-yocto_3.14.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_3.14.bb
@@ -10,13 +10,13 @@ KBRANCH_qemux86  ?= "standard/common-pc/base"
 KBRANCH_qemux86-64 ?= "standard/common-pc-64/base"
 KBRANCH_qemumips64 ?= "standard/mti-malta64"
 
-SRCREV_machine_qemuarm ?= "0ed31872de2c0e62e9843fa714cb0f8e5f53b70c"
-SRCREV_machine_qemumips ?= "c3537ecd101c8494a1da5534ad934f25d6fa256e"
-SRCREV_machine_qemuppc ?= "df6daa113d535fd46668ba3bb0970c959f103f76"
-SRCREV_machine_qemux86 ?= "1d678e0d4ecd53b973a70fb087dc1275b4de4e0c"
-SRCREV_machine_qemux86-64 ?= "0ca8f6b51728ca26129b4260be388ef2b7f366a8"
-SRCREV_machine_qemumips64 ?= "6aa17794bc6795847dae3b60f9d9be01dac874ec"
-SRCREV_machine ?= "0ca8f6b51728ca26129b4260be388ef2b7f366a8"
+SRCREV_machine_qemuarm ?= "127b621f2a4d3b1111e24423c12fac001e047c1c"
+SRCREV_machine_qemumips ?= "c3b9f1b2397f0847ab4844d1cdb8e02574434d78"
+SRCREV_machine_qemuppc ?= "73e2411cdd91764d0601c0869857f53381c2a177"
+SRCREV_machine_qemux86 ?= "e19a1b40de44e756defdfb40349342d8037609bd"
+SRCREV_machine_qemux86-64 ?= "902f34d36102a4b2008b776ecae686f80d307e12"
+SRCREV_machine_qemumips64 ?= "1c4d70272dde4b695697dd8705a031420480f712"
+SRCREV_machine ?= "902f34d36102a4b2008b776ecae686f80d307e12"
 SRCREV_meta ?= "fb6271a942b57bdc40c6e49f0203be153699f81c"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto-3.14.git;bareclone=1;branch=${KBRANCH},${KMETA};name=machine,meta"
diff --git a/meta/recipes-kernel/linux/linux-yocto_3.17.bb b/meta/recipes-kernel/linux/linux-yocto_3.17.bb
index c424070da2d0..68208ebeb909 100644
--- a/meta/recipes-kernel/linux/linux-yocto_3.17.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_3.17.bb
@@ -10,13 +10,13 @@ KBRANCH_qemux86  ?= "standard/common-pc"
 KBRANCH_qemux86-64 ?= "standard/common-pc-64/base"
 KBRANCH_qemumips64 ?= "standard/mti-malta64"
 
-SRCREV_machine_qemuarm ?= "b3934b47d8a16fe323546d7dca3529bf75ef6245"
-SRCREV_machine_qemumips ?= "9b74a60868ec2e45ecaea70547331b1ef6776b14"
-SRCREV_machine_qemuppc ?= "d63220db68089d0604cadd2d0c3d345dfb0dfdb1"
-SRCREV_machine_qemux86 ?= "460fa8aefe8c4f695245ad3a21da96af2c341f21"
-SRCREV_machine_qemux86-64 ?= "460fa8aefe8c4f695245ad3a21da96af2c341f21"
-SRCREV_machine_qemumips64 ?= "9faa5776183318eb41c191bacd05913166d19eb5"
-SRCREV_machine ?= "460fa8aefe8c4f695245ad3a21da96af2c341f21"
+SRCREV_machine_qemuarm ?= "787dbffa74ebb7e0f3d8ade959623c69c9c066a0"
+SRCREV_machine_qemumips ?= "417faf05188f982bb1d47709f7c152a5cf116a0d"
+SRCREV_machine_qemuppc ?= "975512c7f6caa812869c4fa0ed1788072bf383f6"
+SRCREV_machine_qemux86 ?= "8b5bc69a2e44100313cf2a5073a07f495a6ff08e"
+SRCREV_machine_qemux86-64 ?= "8b5bc69a2e44100313cf2a5073a07f495a6ff08e"
+SRCREV_machine_qemumips64 ?= "39878abc7e56c23cd4bc87b2c5d812d489903dee"
+SRCREV_machine ?= "8b5bc69a2e44100313cf2a5073a07f495a6ff08e"
 SRCREV_meta ?= "6050ee24b0b51ccaf35894afc5def0b59f434977"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto-3.17.git;bareclone=1;branch=${KBRANCH},${KMETA};name=machine,meta"
-- 
1.8.1.2


