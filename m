Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <bruce.ashfield@windriver.com>) id 1QMjk1-0004qb-AX
	for openembedded-core@lists.openembedded.org;
	Wed, 18 May 2011 18:36:58 +0200
Received: from localhost.localdomain (yow-bashfiel-d2.ottawa.windriver.com
	[128.224.146.167])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id p4IGX8HJ015331;
	Wed, 18 May 2011 09:33:10 -0700 (PDT)
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: richard.purdie@linuxfoundation.org
Date: Wed, 18 May 2011 12:33:00 -0400
Message-Id: <1305736382-18321-1-git-send-email-bruce.ashfield@windriver.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <cover.1305736112.git.bruce.ashfield@windriver.com>
References: <cover.1305736112.git.bruce.ashfield@windriver.com>
Cc: yocto@yoctoproject.org, openembedded-core@lists.openembedded.org,
	saul.wold@intel.com
Subject: [PATCH 0/2] linux-yocto: fix gcc 4.6.0 compilation failures
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
X-List-Received-Date: Wed, 18 May 2011 16:36:58 -0000

From 92ad9ce8e770b46df38ed015486c76efe502f382 Mon Sep 17 00:00:00 2001
Message-Id: <92ad9ce8e770b46df38ed015486c76efe502f382.1305736112.git.bruce.ashfield@windriver.com>
In-Reply-To: <cover.1305736112.git.bruce.ashfield@windriver.com>
References: <cover.1305736112.git.bruce.ashfield@windriver.com>
From: Bruce Ashfield <bruce.ashfield@windriver.com>
Date: Wed, 18 May 2011 12:07:44 -0400
Subject: [PATCH 1/2] linux-yocto: fix gcc 4.6.0 compilation failures

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
1.7.0.4



