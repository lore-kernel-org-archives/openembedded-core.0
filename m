Return-Path: <jussi.kukkonen@intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id CE32D607AA
	for <openembedded-core@lists.openembedded.org>;
	Wed,  2 Dec 2015 12:08:00 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by fmsmga101.fm.intel.com with ESMTP; 02 Dec 2015 04:08:01 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.20,373,1444719600"; d="scan'208";a="862974063"
Received: from theory.fi.intel.com ([10.237.72.196])
	by orsmga002.jf.intel.com with ESMTP; 02 Dec 2015 04:08:00 -0800
From: Jussi Kukkonen <jussi.kukkonen@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  2 Dec 2015 14:11:38 +0200
Message-Id: <1449058298-1397-1-git-send-email-jussi.kukkonen@intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <CAJTo0LYaiLUi0oR-2PMBxXTrV_Jupv8H-FbNMLYxVmqkK_GEVw@mail.gmail.com>
References: <CAJTo0LYaiLUi0oR-2PMBxXTrV_Jupv8H-FbNMLYxVmqkK_GEVw@mail.gmail.com>
Subject: [PATCHv2 10/10] dropbear: Upgrade 2015.68 -> 2015.70
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
X-List-Received-Date: Wed, 02 Dec 2015 12:08:02 -0000

Tweak a pam patch to make it apply on current source.

Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
---


Changes since v1:
* Fix the pam options.h patch

I've force pushed the branch with this change.

Thanks,
Jussi


 .../dropbear/0005-dropbear-enable-pam.patch        | 26 ++++++++++++++--------
 meta/recipes-core/dropbear/dropbear_2015.68.bb     |  4 ----
 meta/recipes-core/dropbear/dropbear_2015.70.bb     |  5 +++++
 3 files changed, 22 insertions(+), 13 deletions(-)
 delete mode 100644 meta/recipes-core/dropbear/dropbear_2015.68.bb
 create mode 100644 meta/recipes-core/dropbear/dropbear_2015.70.bb

diff --git a/meta/recipes-core/dropbear/dropbear/0005-dropbear-enable-pam.patch b/meta/recipes-core/dropbear/dropbear/0005-dropbear-enable-pam.patch
index c408c57..539cb12 100644
--- a/meta/recipes-core/dropbear/dropbear/0005-dropbear-enable-pam.patch
+++ b/meta/recipes-core/dropbear/dropbear/0005-dropbear-enable-pam.patch
@@ -1,28 +1,36 @@
-Subject: [PATCH 5/6] dropbear enable pam
+From b8cece92ba19aa77ac013ea161bfe4c7147747c9 Mon Sep 17 00:00:00 2001
+From: Jussi Kukkonen <jussi.kukkonen@intel.com>
+Date: Wed, 2 Dec 2015 11:36:02 +0200
+Subject: Enable pam
 
-dropbear: We need modify file option.h besides enabling pam in \
+We need modify file option.h besides enabling pam in
 configure if we want dropbear to support pam.
 
 Upstream-Status: Pending
 
 Signed-off-by: Xiaofeng Yan <xiaofeng.yan@windriver.com>
+Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
 ---
  options.h | 4 ++--
  1 file changed, 2 insertions(+), 2 deletions(-)
 
-Index: dropbear-2013.62/options.h
-===================================================================
---- dropbear-2013.62.orig/options.h	2014-01-14 21:53:02.803262009 +0000
-+++ dropbear-2013.62/options.h	2014-01-14 21:53:56.119263462 +0000
-@@ -192,9 +192,9 @@
-  * PAM challenge/response.
-  * You can't enable both PASSWORD and PAM. */
+diff --git a/options.h b/options.h
+index 94261f6..90bfe2f 100644
+--- a/options.h
++++ b/options.h
+@@ -208,10 +208,10 @@ If you test it please contact the Dropbear author */
  
+ /* This requires crypt() */
+ #ifdef HAVE_CRYPT
 -#define ENABLE_SVR_PASSWORD_AUTH
 +/*#define ENABLE_SVR_PASSWORD_AUTH*/
+ #endif
  /* PAM requires ./configure --enable-pam */
 -/*#define ENABLE_SVR_PAM_AUTH */
 +#define ENABLE_SVR_PAM_AUTH
  #define ENABLE_SVR_PUBKEY_AUTH
  
  /* Whether to take public key options in 
+-- 
+2.1.4
+
diff --git a/meta/recipes-core/dropbear/dropbear_2015.68.bb b/meta/recipes-core/dropbear/dropbear_2015.68.bb
deleted file mode 100644
index 1b749d7..0000000
--- a/meta/recipes-core/dropbear/dropbear_2015.68.bb
+++ /dev/null
@@ -1,4 +0,0 @@
-require dropbear.inc
-
-SRC_URI[md5sum] = "7664ac10f7cc2301c530eb80c756fc5d"
-SRC_URI[sha256sum] = "55ea7c1e904ffe4b1cdbe1addca8291a2533d7d285fd22ac33608e9502a62446"
diff --git a/meta/recipes-core/dropbear/dropbear_2015.70.bb b/meta/recipes-core/dropbear/dropbear_2015.70.bb
new file mode 100644
index 0000000..3da8d5f
--- /dev/null
+++ b/meta/recipes-core/dropbear/dropbear_2015.70.bb
@@ -0,0 +1,5 @@
+require dropbear.inc
+
+SRC_URI[md5sum] = "0b0a1d9be6a094710d884209562a626c"
+SRC_URI[sha256sum] = "62a8cc3df1d0f136d46f50d4f8d92f7ab7ce1addac76b25446b3f6aaf80bf257"
+
-- 
2.1.4


