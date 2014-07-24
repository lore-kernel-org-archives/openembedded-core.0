Return-Path: <Bruce.Ashfield@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 2D737617B8
	for <openembedded-core@lists.openembedded.org>;
	Thu, 24 Jul 2014 20:42:29 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.5) with ESMTP id s6OKgE2T017272
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 24 Jul 2014 13:42:15 -0700 (PDT)
Received: from yow-bashfiel-d3.wrs.com (128.224.56.46) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.169.1; Thu, 24 Jul 2014 13:42:14 -0700
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: <richard.purdie@linuxfoundation.org>
Date: Thu, 24 Jul 2014 16:41:49 -0400
Message-ID: <5ddc19f30f36725aa8832b5c73755d2848ffa608.1406234258.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 1.8.1.2
In-Reply-To: <cover.1406234258.git.bruce.ashfield@windriver.com>
References: <cover.1406234258.git.bruce.ashfield@windriver.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 3/8] linux-yocto: x86_64: expand kernel stack to 16K
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
X-List-Received-Date: Thu, 24 Jul 2014 20:42:29 -0000
Content-Type: text/plain

Updating to backport the following mainline commit:

[
    x86_64: expand kernel stack to 16K

    commit 6538b8ea886e472f4431db8ca1d60478f838d14b upstream

    While I play inhouse patches with much memory pressure on qemu-kvm,
    3.14 kernel was randomly crashed. The reason was kernel stack overflow.

    When I investigated the problem, the callstack was a little bit deeper
    by involve with reclaim functions but not direct reclaim path.

   ....
]

Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
---
 meta/recipes-kernel/linux/linux-yocto-rt_3.14.bb   |  4 ++--
 meta/recipes-kernel/linux/linux-yocto-tiny_3.14.bb |  2 +-
 meta/recipes-kernel/linux/linux-yocto_3.14.bb      | 14 +++++++-------
 3 files changed, 10 insertions(+), 10 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_3.14.bb b/meta/recipes-kernel/linux/linux-yocto-rt_3.14.bb
index 61f9dbc9a14e..da84c787f0ec 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_3.14.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_3.14.bb
@@ -3,8 +3,8 @@ require recipes-kernel/linux/linux-yocto.inc
 KBRANCH = "standard/preempt-rt/base"
 KBRANCH_qemuppc = "standard/preempt-rt/qemuppc"
 
-SRCREV_machine ?= "568f018a22474939695a31709802bb8863c483d9"
-SRCREV_machine_qemuppc ?= "6af424a3a76a7fcf0cc7718b93f7a9db52383c25"
+SRCREV_machine ?= "a70496be11fee0166481b1917745496e7eed863f"
+SRCREV_machine_qemuppc ?= "e8684b6b9919daea3e87c1e28efec0b3f39a3da7"
 SRCREV_meta ?= "b2af4e3528e65583c98f3a08c6edb0cad7a120b0"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto-3.14.git;bareclone=1;branch=${KBRANCH},meta;name=machine,meta"
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_3.14.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_3.14.bb
index 98381606ebb0..3c116e4be0ad 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_3.14.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_3.14.bb
@@ -8,7 +8,7 @@ LINUX_VERSION ?= "3.14.5"
 
 KMETA = "meta"
 
-SRCREV_machine ?= "686b9ddf58ea6b533be70fe9f4a6407557b263d2"
+SRCREV_machine ?= "5bee7e1583d4f075ac5a96d121271b347b384fd7"
 SRCREV_meta ?= "b2af4e3528e65583c98f3a08c6edb0cad7a120b0"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
diff --git a/meta/recipes-kernel/linux/linux-yocto_3.14.bb b/meta/recipes-kernel/linux/linux-yocto_3.14.bb
index 02909b79c029..031d2e546185 100644
--- a/meta/recipes-kernel/linux/linux-yocto_3.14.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_3.14.bb
@@ -10,13 +10,13 @@ KBRANCH_qemux86  = "standard/common-pc/base"
 KBRANCH_qemux86-64  = "standard/common-pc-64/base"
 KBRANCH_qemumips64 = "standard/mti-malta64"
 
-SRCREV_machine_qemuarm ?= "e3cbee86dcbc6c9b23a7cf69fe579da77c3836d1"
-SRCREV_machine_qemumips ?= "431de4758042fab2d62269574bb4ec3a783b43a0"
-SRCREV_machine_qemuppc ?= "1fc7009c9c8de594d75090b188c11a6ddd0d369e"
-SRCREV_machine_qemux86 ?= "116dacb5cebba538bc70e8056ebfa81d7ca6c061"
-SRCREV_machine_qemux86-64 ?= "686b9ddf58ea6b533be70fe9f4a6407557b263d2"
-SRCREV_machine_qemumips64 ?= "966c54ceb8cb797eafe987f9a16d306735057b42"
-SRCREV_machine ?= "686b9ddf58ea6b533be70fe9f4a6407557b263d2"
+SRCREV_machine_qemuarm ?= "ed834b297cd5d36b303d36119549b90789e2890e"
+SRCREV_machine_qemumips ?= "12eba41a9a3bb017dcb45e721f20d7e68903b1c3"
+SRCREV_machine_qemuppc ?= "e2dbfaf796b18b0b9918f194e2a4c9e9eded0c2c"
+SRCREV_machine_qemux86 ?= "e8eb08d85050a944582e974cd461f741191bd07c"
+SRCREV_machine_qemux86-64 ?= "5bee7e1583d4f075ac5a96d121271b347b384fd7"
+SRCREV_machine_qemumips64 ?= "4ecb96fcb1826a127d6afbf67b8e69cccd7ccc8e"
+SRCREV_machine ?= "5bee7e1583d4f075ac5a96d121271b347b384fd7"
 SRCREV_meta ?= "b2af4e3528e65583c98f3a08c6edb0cad7a120b0"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto-3.14.git;bareclone=1;branch=${KBRANCH},${KMETA};name=machine,meta"
-- 
1.8.1.2


