Received: from mga12.intel.com (mga12.intel.com [])
 by mx.groups.io with SMTP id smtpd.web10.3016.1596793522486784343
 for <openembedded-core@lists.openembedded.org>;
 Fri, 07 Aug 2020 02:45:24 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=fail (domain: intel.com, ip: <nil>, mailfrom: chee.yang.lee@intel.com)
IronPort-SDR: HBBxpg1Xzymq4VMe3vTIrN9ON8eJogX9EXPWsjzSp16m9gIiIFTEoa9+zlCh8z4Bpo2T28RiLZ
 eXwkg3t9wauw==
X-IronPort-AV: E=McAfee;i="6000,8403,9705"; a="132602547"
X-IronPort-AV: E=Sophos;i="5.75,445,1589266800"; 
   d="scan'208";a="132602547"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Aug 2020 02:45:24 -0700
IronPort-SDR: 3WleSrLZAa5XNT84JJUyaMRWajS/fVcknziE0MWompmO0uzjKcdUlFjtoELX6chO+bO3qGot05
 lfs581nbs50g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.75,445,1589266800"; 
   d="scan'208";a="333496893"
Received: from andromeda01.png.intel.com (HELO guest1-ubuntu1804.png.intel.com) ([10.221.183.10])
  by orsmga007.jf.intel.com with ESMTP; 07 Aug 2020 02:45:23 -0700
From: "Lee Chee Yang" <chee.yang.lee@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH][dunfell 4/4] webkitgtk: fix CVE-2020-13753
Date: Fri,  7 Aug 2020 17:45:19 +0800
Message-Id: <20200807094519.6436-4-chee.yang.lee@intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200807094519.6436-1-chee.yang.lee@intel.com>
References: <20200807094519.6436-1-chee.yang.lee@intel.com>

From: Lee Chee Yang <chee.yang.lee@intel.com>

Signed-off-by: Lee Chee Yang <chee.yang.lee@intel.com>
---
 .../webkit/webkitgtk/CVE-2020-13753.patch         | 15 +++++++++++++++
 meta/recipes-sato/webkit/webkitgtk_2.28.2.bb      |  1 +
 2 files changed, 16 insertions(+)
 create mode 100644 meta/recipes-sato/webkit/webkitgtk/CVE-2020-13753.patch

diff --git a/meta/recipes-sato/webkit/webkitgtk/CVE-2020-13753.patch b/meta/recipes-sato/webkit/webkitgtk/CVE-2020-13753.patch
new file mode 100644
index 0000000000..d8504c2b36
--- /dev/null
+++ b/meta/recipes-sato/webkit/webkitgtk/CVE-2020-13753.patch
@@ -0,0 +1,15 @@
+Upstream-Status: Backport [https://trac.webkit.org/changeset/262368/webkit?format=diff&new=262368]
+CVE: CVE-2020-13753
+Signed-off-by: Chee Yang Lee <chee.yang.lee@intel.com>
+
+Index: a/Source/WebKit/UIProcess/Launcher/glib/BubblewrapLauncher.cpp
+===================================================================
+--- a/Source/WebKit/UIProcess/Launcher/glib/BubblewrapLauncher.cpp	(revision 262367)
++++ b/Source/WebKit/UIProcess/Launcher/glib/BubblewrapLauncher.cpp	(revision 262368)
+@@ -642,5 +642,5 @@
+         int r;
+         if (rule.arg)
+-            r = seccomp_rule_add(seccomp, SCMP_ACT_ERRNO(EPERM), scall, 1, rule.arg);
++            r = seccomp_rule_add(seccomp, SCMP_ACT_ERRNO(EPERM), scall, 1, *rule.arg);
+         else
+             r = seccomp_rule_add(seccomp, SCMP_ACT_ERRNO(EPERM), scall, 0);
diff --git a/meta/recipes-sato/webkit/webkitgtk_2.28.2.bb b/meta/recipes-sato/webkit/webkitgtk_2.28.2.bb
index 288c715cc3..9cfec83ec7 100644
--- a/meta/recipes-sato/webkit/webkitgtk_2.28.2.bb
+++ b/meta/recipes-sato/webkit/webkitgtk_2.28.2.bb
@@ -19,6 +19,7 @@ SRC_URI = "https://www.webkitgtk.org/releases/${BPN}-${PV}.tar.xz \
            file://cross-compile.patch \
            file://0001-Fix-build-with-musl.patch \
            file://include_array.patch \
+           file://CVE-2020-13753.patch \
            "
 SRC_URI[md5sum] = "ec0ef870ca37e3a5ebbead2f268a28ec"
 SRC_URI[sha256sum] = "b9d23525cfd8d22c37b5d964a9fe9a8ce7583042a2f8d3922e71e6bbc68c30bd"
-- 
2.17.1

