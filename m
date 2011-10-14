Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1REaUd-0002YD-80
	for openembedded-core@lists.openembedded.org;
	Fri, 14 Oct 2011 07:39:39 +0200
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 13 Oct 2011 22:33:38 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.69,344,1315206000"; d="scan'208";a="73540467"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.15.120])
	by fmsmga001.fm.intel.com with ESMTP; 13 Oct 2011 22:33:38 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 13 Oct 2011 22:33:20 -0700
Message-Id: <861cfb880b9964e1698d22d1265caedf9a52d424.1318570250.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.6.2
In-Reply-To: <cover.1318570250.git.sgw@linux.intel.com>
References: <cover.1318570250.git.sgw@linux.intel.com>
In-Reply-To: <cover.1318570250.git.sgw@linux.intel.com>
References: <cover.1318570250.git.sgw@linux.intel.com>
Subject: [CONSOLIDATED PULL 22/28] bash: update to 4.2
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
X-List-Received-Date: Fri, 14 Oct 2011 05:39:40 -0000

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 .../bash/bash-4.2/execute_cmd.patch                |   15 +++++++
 meta/recipes-extended/bash/bash_4.1.bb             |   38 ------------------
 meta/recipes-extended/bash/bash_4.2.bb             |   41 ++++++++++++++++++++
 3 files changed, 56 insertions(+), 38 deletions(-)
 create mode 100644 meta/recipes-extended/bash/bash-4.2/execute_cmd.patch
 delete mode 100644 meta/recipes-extended/bash/bash_4.1.bb
 create mode 100644 meta/recipes-extended/bash/bash_4.2.bb

diff --git a/meta/recipes-extended/bash/bash-4.2/execute_cmd.patch b/meta/recipes-extended/bash/bash-4.2/execute_cmd.patch
new file mode 100644
index 0000000..bd55787
--- /dev/null
+++ b/meta/recipes-extended/bash/bash-4.2/execute_cmd.patch
@@ -0,0 +1,15 @@
+--- execute_cmd.c.orig	Fri Jun  3 13:34:42 2011
++++ execute_cmd.c	Fri Jun  3 13:36:41 2011
+@@ -2202,7 +2202,11 @@
+   /* If the `lastpipe' option is set with shopt, and job control is not
+      enabled, execute the last element of non-async pipelines in the
+      current shell environment. */
+-  if (lastpipe_opt && job_control == 0 && asynchronous == 0 && pipe_out == NO_PIPE && prev > 0)
++  if (lastpipe_opt && 
++#if defined(JOB_CONTROL)
++		job_control == 0 && 
++#endif
++		asynchronous == 0 && pipe_out == NO_PIPE && prev > 0)
+     {
+       lstdin = move_to_high_fd (0, 0, 255);
+       if (lstdin > 0)
diff --git a/meta/recipes-extended/bash/bash_4.1.bb b/meta/recipes-extended/bash/bash_4.1.bb
deleted file mode 100644
index c146014..0000000
--- a/meta/recipes-extended/bash/bash_4.1.bb
+++ /dev/null
@@ -1,38 +0,0 @@
-require bash.inc
-
-PR = "r2"
-
-SRC_URI = "${GNU_MIRROR}/bash/${BPN}-${PV}.tar.gz;name=tarball \
-           ${GNU_MIRROR}/bash/bash-4.1-patches/bash41-001;apply=yes;striplevel=0;name=patch001 \
-           ${GNU_MIRROR}/bash/bash-4.1-patches/bash41-002;apply=yes;striplevel=0;name=patch002 \
-           ${GNU_MIRROR}/bash/bash-4.1-patches/bash41-003;apply=yes;striplevel=0;name=patch003 \
-           ${GNU_MIRROR}/bash/bash-4.1-patches/bash41-004;apply=yes;striplevel=0;name=patch004 \
-           ${GNU_MIRROR}/bash/bash-4.1-patches/bash41-005;apply=yes;striplevel=0;name=patch005 \
-           ${GNU_MIRROR}/bash/bash-4.1-patches/bash41-006;apply=yes;striplevel=0;name=patch006 \
-           ${GNU_MIRROR}/bash/bash-4.1-patches/bash41-007;apply=yes;striplevel=0;name=patch007 \
-           "
-
-SRC_URI[tarball.md5sum] = "9800d8724815fd84994d9be65ab5e7b8"
-SRC_URI[tarball.sha256sum] = "3f627124a83c6d34db503a923e20710d370573a29dd5d11d6f116d1aee7be1da"
-
-SRC_URI[patch001.md5sum] = "582dea5671b557f783e18629c2f77b68"
-SRC_URI[patch001.sha256sum] = "a6e47fa108f853d0f0999520509c11680d37c8b7823b92b96d431766dd620278"
-
-SRC_URI[patch002.md5sum] = "118d465095d4a4706eb1d34696a2666a"
-SRC_URI[patch002.sha256sum] = "322e229de186b3bd87dedabfbad8386716f103e87ff00cd1b2db844e0dff78f8"
-
-SRC_URI[patch003.md5sum] = "120f7cf039a40d35fe375e59d6f17adc"
-SRC_URI[patch003.sha256sum] = "91763dddbbb98c3ff7deb3faea3b3ad6e861e7bfd2e46c045c0d1d85d1b3256d"
-
-SRC_URI[patch004.md5sum] = "336ee037fc2cc1e2350b05097fbdc87c"
-SRC_URI[patch004.sha256sum] = "78c063ba34c1f390a5bf2e5727624ca2e253bbef49ce187cabb240eee7f4ff9e"
-
-SRC_URI[patch005.md5sum] = "9471e666797f0b03eb2175ed752a9550"
-SRC_URI[patch005.sha256sum] = "519639d8d1664be74d7ec15879d16337fe8c71af8d648b02f84ccdd4fb739c1a"
-
-SRC_URI[patch006.md5sum] = "fb80ccd58cb1e34940f3adf4ce6e4a1e"
-SRC_URI[patch006.sha256sum] = "5986abcf33c0b087bd5670f1ae6a6400a8ce6ab7e7c4de18b9826d0ee10f2c49"
-
-SRC_URI[patch007.md5sum] = "192a8b161d419a1d0d211169f1d1046e"
-SRC_URI[patch007.sha256sum] = "74012a2c28ba4fb532c3eb69155ac870aac8d53990fa4e1e52cdc173d4c205a7"
-
diff --git a/meta/recipes-extended/bash/bash_4.2.bb b/meta/recipes-extended/bash/bash_4.2.bb
new file mode 100644
index 0000000..a0f5e4e
--- /dev/null
+++ b/meta/recipes-extended/bash/bash_4.2.bb
@@ -0,0 +1,41 @@
+require bash.inc
+
+PR = "r0"
+
+SRC_URI = "${GNU_MIRROR}/bash/${BPN}-${PV}.tar.gz;name=tarball \
+           ${GNU_MIRROR}/bash/bash-4.2-patches/bash42-001;apply=yes;striplevel=0;name=patch001 \
+           ${GNU_MIRROR}/bash/bash-4.2-patches/bash42-002;apply=yes;striplevel=0;name=patch002 \
+           ${GNU_MIRROR}/bash/bash-4.2-patches/bash42-003;apply=yes;striplevel=0;name=patch003 \
+           ${GNU_MIRROR}/bash/bash-4.2-patches/bash42-004;apply=yes;striplevel=0;name=patch004 \
+           ${GNU_MIRROR}/bash/bash-4.2-patches/bash42-005;apply=yes;striplevel=0;name=patch005 \
+           ${GNU_MIRROR}/bash/bash-4.2-patches/bash42-006;apply=yes;striplevel=0;name=patch006 \
+           ${GNU_MIRROR}/bash/bash-4.2-patches/bash42-007;apply=yes;striplevel=0;name=patch007 \
+           ${GNU_MIRROR}/bash/bash-4.2-patches/bash42-008;apply=yes;striplevel=0;name=patch008 \
+           ${GNU_MIRROR}/bash/bash-4.2-patches/bash42-009;apply=yes;striplevel=0;name=patch009 \
+           ${GNU_MIRROR}/bash/bash-4.2-patches/bash42-010;apply=yes;striplevel=0;name=patch010 \
+           file://execute_cmd.patch;striplevel=0 \
+           "
+
+SRC_URI[tarball.md5sum] = "3fb927c7c33022f1c327f14a81c0d4b0"
+SRC_URI[tarball.sha256sum] = "a27a1179ec9c0830c65c6aa5d7dab60f7ce1a2a608618570f96bfa72e95ab3d8"
+SRC_URI[patch001.md5sum] = "1100bc1dda2cdc06ac44d7e5d17864a3"
+SRC_URI[patch001.sha256sum] = "8d6ca028576c4af23e660a2fbc2112221a11c8a785c0b37f033967e5cd12b47a"
+SRC_URI[patch002.md5sum] = "30e7948079921d3261efcc6a40722135"
+SRC_URI[patch002.sha256sum] = "febac927e199aceeba2004908d971d4afb49b521796c3f42d1166f9fbbfbcef9"
+SRC_URI[patch003.md5sum] = "9ea06decec43a198f3d7cf29acc602f8"
+SRC_URI[patch003.sha256sum] = "5a0a7c15018c87348ea87cb0beea14345faf878dbb0e25c17fa70677194cb4cd"
+SRC_URI[patch004.md5sum] = "fb48f6134d7b013135929476aa0c250c"
+SRC_URI[patch004.sha256sum] = "4e34b0f830d2583d56e14225a66937abc81f45bbafcd2eb49daf61c9462140c1"
+SRC_URI[patch005.md5sum] = "e70e45de33426b38153b390be0dbbcd4"
+SRC_URI[patch005.sha256sum] = "a81749e73004b81cfdf0fe075bec365dc1fef756ee5e3fd142821e317d1459a0"
+SRC_URI[patch006.md5sum] = "ce4e5c484993705b27daa151eca242c2"
+SRC_URI[patch006.sha256sum] = "c91148945a2ddafa792682d7c8668c59e7e645eae1334b15b0d5d9ad22634bd1"
+SRC_URI[patch007.md5sum] = "88d1f96db29461767602e2546803bda7"
+SRC_URI[patch007.sha256sum] = "405826acf443dd1084f236a15cb76d7f0ee2dbe5edff45c5fb836db571fb7e95"
+SRC_URI[patch008.md5sum] = "24c574bf6d6a581e300823d9c1276af6"
+SRC_URI[patch008.sha256sum] = "23080d11a60a78941210e2477f6bca066b45db03defa60da86fd765107ba2437"
+SRC_URI[patch009.md5sum] = "4c5835f2fbab36c4292bb334977e5b6d"
+SRC_URI[patch009.sha256sum] = "e7ed5440b4c19765786e90e4f1ded43195d38b3e4d1c4b39fcc23de9a74ccb20"
+SRC_URI[patch010.md5sum] = "0a51602b535ef661ee707be6c8bdb373"
+SRC_URI[patch010.sha256sum] = "acfc5482c25e6923116fcf4b4f7f6345b80f75ad7299749db4b736ad67aa43dc"
+
-- 
1.7.6.2



