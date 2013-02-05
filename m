Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <bruce.ashfield@windriver.com>) id 1U2l8G-00044T-Ls
	for openembedded-core@lists.openembedded.org;
	Tue, 05 Feb 2013 17:12:31 +0100
Received: from yow-bashfiel-d3.corp.ad.wrs.com (yow-bashfiel-d3.wrs.com
	[128.224.147.67])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r15FuZtM028089;
	Tue, 5 Feb 2013 07:56:37 -0800 (PST)
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: richard.purdie@linuxfoundation.org
Date: Tue,  5 Feb 2013 10:56:35 -0500
Message-Id: <4aa36f477cf4648ad4a957d7b465db4434add386.1360079063.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <cover.1360079063.git.bruce.ashfield@windriver.com>
References: <cover.1360079063.git.bruce.ashfield@windriver.com>
In-Reply-To: <cover.1360079063.git.bruce.ashfield@windriver.com>
References: <cover.1360079063.git.bruce.ashfield@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 3/3] linux-yocto: KERNEL_FEATURES should reference full scc files
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
X-List-Received-Date: Tue, 05 Feb 2013 16:12:34 -0000

Some existing KERNEL_FEATURE references use a shorcut notation, but mapping
these shortcuts to actual .scc files in the tree are not obvious. So we clarify
where they are found by referencing the full .scc filename in the KERNEL_FEATURE
addtions.

Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
---
 meta/recipes-kernel/linux/linux-yocto-rt_3.2.bb |    8 ++++----
 meta/recipes-kernel/linux/linux-yocto-rt_3.4.bb |   10 +++++-----
 meta/recipes-kernel/linux/linux-yocto_3.2.bb    |    8 ++++----
 meta/recipes-kernel/linux/linux-yocto_3.4.bb    |   12 +++++-------
 4 files changed, 18 insertions(+), 20 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_3.2.bb b/meta/recipes-kernel/linux/linux-yocto-rt_3.2.bb
index 0c82e16..1f1b8de 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_3.2.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_3.2.bb
@@ -23,7 +23,7 @@ SRC_URI = "git://git.yoctoproject.org/linux-yocto-3.2.git;protocol=git;bareclone
 COMPATIBLE_MACHINE = "(qemux86|qemux86-64|qemuarm)"
 
 # Functionality flags
-KERNEL_FEATURES_append = "features/netfilter"
-KERNEL_FEATURES_append = " features/taskstats"
-KERNEL_FEATURES_append_qemux86 = " cfg/sound"
-KERNEL_FEATURES_append_qemux86-64 = " cfg/sound"
+KERNEL_FEATURES_append = "features/netfilter/netfilter.scc"
+KERNEL_FEATURES_append = " features/taskstats/taskstats.scc"
+KERNEL_FEATURES_append_qemux86 = " cfg/sound.scc"
+KERNEL_FEATURES_append_qemux86-64 = " cfg/sound.scc"
diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_3.4.bb b/meta/recipes-kernel/linux/linux-yocto-rt_3.4.bb
index ca9aa42..c58efe7 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_3.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_3.4.bb
@@ -23,8 +23,8 @@ SRC_URI = "git://git.yoctoproject.org/linux-yocto-3.4.git;protocol=git;bareclone
 COMPATIBLE_MACHINE = "(qemux86|qemux86-64|qemuarm)"
 
 # Functionality flags
-KERNEL_FEATURES_append = " features/netfilter"
-KERNEL_FEATURES_append = " features/taskstats"
-KERNEL_FEATURES_append_qemux86 = " cfg/sound"
-KERNEL_FEATURES_append_qemux86-64 = " cfg/sound"
-KERNEL_FEATURES_append = " ${@bb.utils.contains("TUNE_FEATURES", "mx32", " cfg/x32", "" ,d)}"
+KERNEL_FEATURES_append = " features/netfilter/netfilter.scc"
+KERNEL_FEATURES_append = " features/taskstats/taskstats.scc"
+KERNEL_FEATURES_append_qemux86 = " cfg/sound.scc"
+KERNEL_FEATURES_append_qemux86-64 = " cfg/sound.scc"
+KERNEL_FEATURES_append = " ${@bb.utils.contains("TUNE_FEATURES", "mx32", " cfg/x32.scc", "" ,d)}"
diff --git a/meta/recipes-kernel/linux/linux-yocto_3.2.bb b/meta/recipes-kernel/linux/linux-yocto_3.2.bb
index 77508fc..d080a69 100644
--- a/meta/recipes-kernel/linux/linux-yocto_3.2.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_3.2.bb
@@ -27,7 +27,7 @@ SRC_URI = "git://git.yoctoproject.org/linux-yocto-3.2;protocol=git;bareclone=1;b
 COMPATIBLE_MACHINE = "qemuarm|qemux86|qemuppc|qemumips|qemux86-64"
 
 # Functionality flags
-KERNEL_FEATURES_append=" features/netfilter"
-KERNEL_FEATURES_append=" features/taskstats"
-KERNEL_FEATURES_append_qemux86=" cfg/sound"
-KERNEL_FEATURES_append_qemux86-64=" cfg/sound"
+KERNEL_FEATURES_append=" features/netfilter/netfilter.scc"
+KERNEL_FEATURES_append=" features/taskstats/taskstats.scc"
+KERNEL_FEATURES_append_qemux86=" cfg/sound.scc"
+KERNEL_FEATURES_append_qemux86-64=" cfg/sound.scc"
diff --git a/meta/recipes-kernel/linux/linux-yocto_3.4.bb b/meta/recipes-kernel/linux/linux-yocto_3.4.bb
index 4ab8c73..ab975f2 100644
--- a/meta/recipes-kernel/linux/linux-yocto_3.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_3.4.bb
@@ -23,10 +23,8 @@ KMETA = "meta"
 COMPATIBLE_MACHINE = "qemuarm|qemux86|qemuppc|qemumips|qemux86-64"
 
 # Functionality flags
-KERNEL_REVISION_CHECKING=""
-KERNEL_FEATURES_append = " features/netfilter"
-KERNEL_FEATURES_append_qemux86=" cfg/sound"
-KERNEL_FEATURES_append_qemux86-64=" cfg/sound"
-KERNEL_FEATURES_append_qemux86=" cfg/paravirt_kvm"
-#KERNEL_FEATURES_append_qemux86-64=" cfg/paravirt_kvm"
-KERNEL_FEATURES_append = " ${@bb.utils.contains("TUNE_FEATURES", "mx32", " cfg/x32", "" ,d)}"
+KERNEL_FEATURES_append = " features/netfilter/netfilter.scc"
+KERNEL_FEATURES_append_qemux86=" cfg/sound.scc"
+KERNEL_FEATURES_append_qemux86-64=" cfg/sound.scc"
+KERNEL_FEATURES_append_qemux86=" cfg/paravirt_kvm.scc"
+KERNEL_FEATURES_append = " ${@bb.utils.contains("TUNE_FEATURES", "mx32", " cfg/x32.scc", "" ,d)}"
-- 
1.7.10.4



