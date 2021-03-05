Received: from mga09.intel.com (mga09.intel.com [])
 by mx.groups.io with SMTP id smtpd.web09.7663.1614918143328449753
 for <openembedded-core@lists.openembedded.org>;
 Thu, 04 Mar 2021 20:22:24 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=fail (domain: intel.com, ip: <nil>, mailfrom: anuj.mittal@intel.com)
IronPort-SDR: ZVfTcCxHRn4HMhVC27yQ5OC7ZsJoMv374d4FLUNmZdjiSAzl6Vd7hX+nWlVcsI7vRrIdPUi7m+
 Y1+x4eFKPnnQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9913"; a="187670855"
X-IronPort-AV: E=Sophos;i="5.81,224,1610438400"; 
   d="scan'208";a="187670855"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Mar 2021 20:22:05 -0800
IronPort-SDR: +vwxv6yAW+07FtU+BrOFuiw9RL0CG2OFNxay7xpjhQVxdmhA466gNRfDOdNHi5+2oiUO9Ola2U
 xNzxwEEbrWeA==
X-IronPort-AV: E=Sophos;i="5.81,224,1610438400"; 
   d="scan'208";a="408128767"
Received: from selvan2x-mobl1.gar.corp.intel.com (HELO anmitta2-mobl1.gar.corp.intel.com) ([10.255.147.249])
  by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Mar 2021 20:22:04 -0800
From: "Anuj Mittal" <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [gatesgarth][PATCH 05/52] git: Fix determinism issue
Date: Fri,  5 Mar 2021 12:20:41 +0800
Message-Id: <2cd9be5a0ea9e8532259a77cf4308ebb6991268d.1614917620.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <cover.1614917620.git.anuj.mittal@intel.com>
References: <cover.1614917620.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Richard Purdie <richard.purdie@linuxfoundation.org>

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 9ae740939f8315c64fe7571f912404127a29dc89)
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 meta/recipes-devtools/git/git.inc           |  3 +-
 meta/recipes-devtools/git/git/fixsort.patch | 31 +++++++++++++++++++++
 2 files changed, 33 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-devtools/git/git/fixsort.patch

diff --git a/meta/recipes-devtools/git/git.inc b/meta/recipes-devtools/git/git.inc
index 544e23c844..586a305b27 100644
--- a/meta/recipes-devtools/git/git.inc
+++ b/meta/recipes-devtools/git/git.inc
@@ -7,7 +7,8 @@ DEPENDS = "openssl curl zlib expat"
 PROVIDES_append_class-native = " git-replacement-native"
 
 SRC_URI = "${KERNELORG_MIRROR}/software/scm/git/git-${PV}.tar.gz;name=tarball \
-           ${KERNELORG_MIRROR}/software/scm/git/git-manpages-${PV}.tar.gz;name=manpages"
+           ${KERNELORG_MIRROR}/software/scm/git/git-manpages-${PV}.tar.gz;name=manpages \
+           file://fixsort.patch"
 
 S = "${WORKDIR}/git-${PV}"
 
diff --git a/meta/recipes-devtools/git/git/fixsort.patch b/meta/recipes-devtools/git/git/fixsort.patch
new file mode 100644
index 0000000000..07a487e8ca
--- /dev/null
+++ b/meta/recipes-devtools/git/git/fixsort.patch
@@ -0,0 +1,31 @@
+[PATCH] generate-configlist.sh: Fix determinism issue
+
+Currently git binaries are not entirely reproducible, at least partly 
+due to config-list.h differing in order depending on the system's
+locale settings. Under different locales, the entries:
+
+"sendemail.identity",
+"sendemail.<identity>.*",
+
+would differ in order for example and this leads to differences in 
+the debug symbols for the binaries.
+
+This can be fixed by specifying the C locale for the sort in the
+shell script generating the header.
+
+Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
+Upstream-Status: Submitted [https://public-inbox.org/git/f029a942dd3d50d85e60bd37d8e454524987842f.camel@linuxfoundation.org/T/#u]
+
+Index: git-2.30.0/generate-configlist.sh
+===================================================================
+--- git-2.30.0.orig/generate-configlist.sh
++++ git-2.30.0/generate-configlist.sh
+@@ -9,7 +9,7 @@ static const char *config_name_list[] =
+ EOF
+ 	grep -h '^[a-zA-Z].*\..*::$' Documentation/*config.txt Documentation/config/*.txt |
+ 	sed '/deprecated/d; s/::$//; s/,  */\n/g' |
+-	sort |
++	LC_ALL=C sort |
+ 	sed 's/^.*$/	"&",/'
+ 	cat <<EOF
+ 	NULL,
-- 
2.29.2

