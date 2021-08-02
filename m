Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by mx.groups.io with SMTP id smtpd.web09.17006.1627890765018628590
 for <openembedded-core@lists.openembedded.org>;
 Mon, 02 Aug 2021 00:52:52 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: intel.com, ip: 192.55.52.136, mailfrom: anuj.mittal@intel.com)
X-IronPort-AV: E=McAfee;i="6200,9189,10063"; a="193002008"
X-IronPort-AV: E=Sophos;i="5.84,288,1620716400"; 
   d="scan'208";a="193002008"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Aug 2021 00:52:52 -0700
X-IronPort-AV: E=Sophos;i="5.84,288,1620716400"; 
   d="scan'208";a="478651463"
Received: from chewchoo-mobl1.gar.corp.intel.com (HELO anmitta2-mobl1.gar.corp.intel.com) ([10.215.228.46])
  by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Aug 2021 00:52:51 -0700
From: "Anuj Mittal" <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [hardknott][PATCH 06/37] pseudo: Add uninative configuration sanity check
Date: Mon,  2 Aug 2021 15:51:53 +0800
Message-Id: <496f0cd63aaeedbff625eb687f20ace951faf6f1.1627890114.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <cover.1627890114.git.anuj.mittal@intel.com>
References: <cover.1627890114.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Richard Purdie <richard.purdie@linuxfoundation.org>

When building pseudo-native to work with uninative, we need to ensure the
configuration will work on all supported target systems. This means
"new clone" semantics, xattr and statvfs support in particular. It is
extremely unlikely we'd run on a system without any of these but add
a check just to be sure when uninative is enabled.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit ea5b208ee25752bea6037cd0f3b28da7d2c9905e)
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 meta/recipes-devtools/pseudo/pseudo.inc | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/meta/recipes-devtools/pseudo/pseudo.inc b/meta/recipes-devtools/pseudo/pseudo.inc
index 65d6e5068d..e6512bc6e6 100644
--- a/meta/recipes-devtools/pseudo/pseudo.inc
+++ b/meta/recipes-devtools/pseudo/pseudo.inc
@@ -112,6 +112,19 @@ do_compile_prepend_class-nativesdk () {
 	fi
 }
 
+do_compile_append_class-native () {
+	if [ '${@bb.data.inherits_class('uninative', d)}' = 'True' ]; then
+		for i in PSEUDO_PORT_UNIX_SYNCFS PSEUDO_PORT_UIDS_GENERIC PSEUDO_PORT_LINUX_NEWCLONE PSEUDO_PORT_LINUX_XATTR PSEUDO_PORT_LINUX_STATVFS; do
+			grep $i.1 ${S}/pseudo_ports.h
+			if [ $? != 0 ]; then
+				echo "$i not enabled in pseudo which is incompatible with uninative"
+				exit 1
+			fi
+		done
+	fi
+}
+
+
 do_install () {
 	oe_runmake 'DESTDIR=${D}' ${MAKEOPTS} 'LIB=lib/pseudo/lib$(MARK64)' install
 }
-- 
2.31.1

