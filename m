Return-Path: <Bruce.Ashfield@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id A8573617B8
	for <openembedded-core@lists.openembedded.org>;
	Thu, 24 Jul 2014 20:42:26 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.5) with ESMTP id s6OKgHTP017281
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 24 Jul 2014 13:42:17 -0700 (PDT)
Received: from yow-bashfiel-d3.wrs.com (128.224.56.46) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.169.1; Thu, 24 Jul 2014 13:42:17 -0700
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: <richard.purdie@linuxfoundation.org>
Date: Thu, 24 Jul 2014 16:41:53 -0400
Message-ID: <974789dcabd98e31aa7240903e2527ad161a5c45.1406234258.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 1.8.1.2
In-Reply-To: <cover.1406234258.git.bruce.ashfield@windriver.com>
References: <cover.1406234258.git.bruce.ashfield@windriver.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 7/8] linux-yocto/3.14: libata and generic CPU modalias handling
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
X-List-Received-Date: Thu, 24 Jul 2014 20:42:27 -0000
Content-Type: text/plain

Updating the 3.14 yocto kernel to incorporate the following fix
and feature of interest.

   5724bf17acbf x86: align x86 arch with generic CPU modalias handling
   6b9a52451a78 cpu: add generic support for CPU feature based module
  38367de316bb libata: support the ata host which implements a queue depth less than 32

[YOCTO: #6489]

Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
---
 meta/recipes-kernel/linux/linux-yocto-rt_3.14.bb   |  4 ++--
 meta/recipes-kernel/linux/linux-yocto-tiny_3.14.bb |  2 +-
 meta/recipes-kernel/linux/linux-yocto_3.14.bb      | 14 +++++++-------
 3 files changed, 10 insertions(+), 10 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_3.14.bb b/meta/recipes-kernel/linux/linux-yocto-rt_3.14.bb
index da84c787f0ec..77215f6a517e 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_3.14.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_3.14.bb
@@ -3,8 +3,8 @@ require recipes-kernel/linux/linux-yocto.inc
 KBRANCH = "standard/preempt-rt/base"
 KBRANCH_qemuppc = "standard/preempt-rt/qemuppc"
 
-SRCREV_machine ?= "a70496be11fee0166481b1917745496e7eed863f"
-SRCREV_machine_qemuppc ?= "e8684b6b9919daea3e87c1e28efec0b3f39a3da7"
+SRCREV_machine ?= "8ef1733b66a1646b85338a310f787e0057a6a4e9"
+SRCREV_machine_qemuppc ?= "3079c794c30b0de82bc87b19cf477d82405a9094"
 SRCREV_meta ?= "b2af4e3528e65583c98f3a08c6edb0cad7a120b0"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto-3.14.git;bareclone=1;branch=${KBRANCH},meta;name=machine,meta"
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_3.14.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_3.14.bb
index 3c116e4be0ad..e28054fc4cf4 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_3.14.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_3.14.bb
@@ -8,7 +8,7 @@ LINUX_VERSION ?= "3.14.5"
 
 KMETA = "meta"
 
-SRCREV_machine ?= "5bee7e1583d4f075ac5a96d121271b347b384fd7"
+SRCREV_machine ?= "5724bf17acbf54cf61003ab242448fd96d189384"
 SRCREV_meta ?= "b2af4e3528e65583c98f3a08c6edb0cad7a120b0"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
diff --git a/meta/recipes-kernel/linux/linux-yocto_3.14.bb b/meta/recipes-kernel/linux/linux-yocto_3.14.bb
index 031d2e546185..7b8b65382775 100644
--- a/meta/recipes-kernel/linux/linux-yocto_3.14.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_3.14.bb
@@ -10,13 +10,13 @@ KBRANCH_qemux86  = "standard/common-pc/base"
 KBRANCH_qemux86-64  = "standard/common-pc-64/base"
 KBRANCH_qemumips64 = "standard/mti-malta64"
 
-SRCREV_machine_qemuarm ?= "ed834b297cd5d36b303d36119549b90789e2890e"
-SRCREV_machine_qemumips ?= "12eba41a9a3bb017dcb45e721f20d7e68903b1c3"
-SRCREV_machine_qemuppc ?= "e2dbfaf796b18b0b9918f194e2a4c9e9eded0c2c"
-SRCREV_machine_qemux86 ?= "e8eb08d85050a944582e974cd461f741191bd07c"
-SRCREV_machine_qemux86-64 ?= "5bee7e1583d4f075ac5a96d121271b347b384fd7"
-SRCREV_machine_qemumips64 ?= "4ecb96fcb1826a127d6afbf67b8e69cccd7ccc8e"
-SRCREV_machine ?= "5bee7e1583d4f075ac5a96d121271b347b384fd7"
+SRCREV_machine_qemuarm ?= "b38b84aebf889d84e65e81ac11122b977f0c5155"
+SRCREV_machine_qemumips ?= "c9d827207d8dfab330787659b2842485dbd36d77"
+SRCREV_machine_qemuppc ?= "58b7cb00580985410ba8491c61e80d2572552ed9"
+SRCREV_machine_qemux86 ?= "5b327970eb1dba02c65cb8330dc8f3049c4fa580"
+SRCREV_machine_qemux86-64 ?= "5724bf17acbf54cf61003ab242448fd96d189384"
+SRCREV_machine_qemumips64 ?= "34837892b66eaa034cd3e3d339cab0ea6f594511"
+SRCREV_machine ?= "5724bf17acbf54cf61003ab242448fd96d189384"
 SRCREV_meta ?= "b2af4e3528e65583c98f3a08c6edb0cad7a120b0"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto-3.14.git;bareclone=1;branch=${KBRANCH},${KMETA};name=machine,meta"
-- 
1.8.1.2


