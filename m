Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1QMpFw-0003uj-Pf
	for openembedded-core@lists.openembedded.org;
	Thu, 19 May 2011 00:30:16 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 18 May 2011 15:27:19 -0700
X-ExtLoop1: 1
Received: from unknown (HELO swold-MOBL.bigsur.com) ([10.255.12.160])
	by orsmga002.jf.intel.com with ESMTP; 18 May 2011 15:27:19 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 18 May 2011 15:26:35 -0700
Message-Id: <b814b3a8c5a1b6cc8f7be64208f0f21a0d94c8c1.1305756950.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.3.4
In-Reply-To: <fc7402495a8a30b203d5535e73383bc4412e2a1f.1305756950.git.sgw@linux.intel.com>
References: <fc7402495a8a30b203d5535e73383bc4412e2a1f.1305756950.git.sgw@linux.intel.com>
In-Reply-To: <cover.1305756950.git.sgw@linux.intel.com>
References: <cover.1305756950.git.sgw@linux.intel.com>
Subject: [PATCH 06/30] linux-yocto: fix gcc 4.6.0 compilation failures
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 18 May 2011 22:30:17 -0000

From: Bruce Ashfield <bruce.ashfield@windriver.com>

Fixes bug: [YOCTO #1035]
Fixes bug: [YOCTO #1036]

Fixes gcc 4.6.0 compliation issues by importing the upstream change:

Author: Michal Marek <mmarek@suse.cz>
Date:   Mon May 2 12:13:01 2011 +0000

    kbuild: Fix passing -Wno-* options to gcc 4.4+

    Starting with 4.4, gcc will happily accept -Wno-<anything> in the
    cc-option test and complain later when compiling a file that has some
    other warning. This rather unexpected behavior is intentional as per
    http://gcc.gnu.org/PR28322, so work around it by testing for support of
    the opposite option (without the no-). Introduce a new Makefile function
    cc-disable-warning that does this and update two uses of cc-option in
    the toplevel Makefile.

    Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>
    Signed-off-by: Michal Marek <mmarek@suse.cz>
    Tested-by: Stephen Rothwell <sfr@canb.auug.org.au>
    Integrated-by: Bruce Ashfield <bruce.ashfield@windriver.com>

:100644 100644 0ef00bd... 1d8e7e9... M  Documentation/kbuild/makefiles.txt
:100644 100644 7bd863e0.. 74bac80... M  Makefile
:100644 100644 ed2773e... ba25c44... M  scripts/Kbuild.include

Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
---
 meta/recipes-kernel/linux/linux-yocto_git.bb |   12 ++++++------
 1 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto_git.bb b/meta/recipes-kernel/linux/linux-yocto_git.bb
index 3e828c2..5c3c448 100644
--- a/meta/recipes-kernel/linux/linux-yocto_git.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_git.bb
@@ -14,12 +14,12 @@ KMETA = meta
 LINUX_VERSION ?= "2.6.37"
 LINUX_VERSION_EXTENSION ?= "-yocto-${LINUX_KERNEL_TYPE}"
 
-SRCREV_machine_qemuarm = "b0375c21e29453458f9aa9986dc3f1ec69bf1aef"
-SRCREV_machine_qemumips = "f5d26f2eda2be8b942172cda8f27de33ebf38ec3"
-SRCREV_machine_qemuppc = "7eb6c68d977d9039a2b5a734172b064a9d19cdc1"
-SRCREV_machine_qemux86 = "ad62d1aab734513cd96c8f4517f816420a218e77"
-SRCREV_machine_qemux86-64 = "b906f358fd404a1e74a961f25079274e0d933ee1"
-SRCREV_machine = "b906f358fd404a1e74a961f25079274e0d933ee1"
+SRCREV_machine_qemuarm = "8776b242fe2db7b4570e11496e9105b51212a446"
+SRCREV_machine_qemumips = "8f8a5e034d7e98ed871fa7ed487fbf72a79229a5"
+SRCREV_machine_qemuppc = "d9c6b3e576184f0c4223b6251c57b16ac1bac428"
+SRCREV_machine_qemux86 = "b2afed7ecd54918b73db7f30062aaaf02fdaba54"
+SRCREV_machine_qemux86-64 = "86bbbc079652d87392322fbfc14f6bd8792b0f38"
+SRCREV_machine = "0974631b821b70aee3613723ed0d4d6ba8da91c6"
 SRCREV_meta = "79669230fd82a3e7e254cf8b596a2388a4333e62"
 
 PR = "r18"
-- 
1.7.3.4



