Received: from mga11.intel.com (mga11.intel.com [])
 by mx.groups.io with SMTP id smtpd.web12.36963.1614009640008517381
 for <openembedded-core@lists.openembedded.org>;
 Mon, 22 Feb 2021 08:00:59 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=fail (domain: intel.com, ip: <nil>, mailfrom: anuj.mittal@intel.com)
IronPort-SDR: jh2IVpexFPV7kNj0WXuMRFNOIvwGwWsmEtITGldt578aNs1AmmffNLhS+QAL1atrlOm4YilXXq
 f4te/seYi+Ow==
X-IronPort-AV: E=McAfee;i="6000,8403,9903"; a="181049522"
X-IronPort-AV: E=Sophos;i="5.81,197,1610438400"; 
   d="scan'208";a="181049522"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Feb 2021 08:00:58 -0800
IronPort-SDR: gMEdyFYmeMs/f29bloif3aTu0LYYi0m/cdPg98wqu0q2IY5BFZNdQ+iEF8nWvIiJDfaVYI0Qyq
 TsAcgz/zkadQ==
X-IronPort-AV: E=Sophos;i="5.81,197,1610438400"; 
   d="scan'208";a="430301909"
Received: from yrajendx-mobl1.gar.corp.intel.com (HELO anmitta2-mobl1.gar.corp.intel.com) ([10.255.147.39])
  by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Feb 2021 08:00:57 -0800
From: "Anuj Mittal" <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [gatesgarth][PATCH 12/30] opkg: Fix build reproducibility issue
Date: Tue, 23 Feb 2021 00:00:15 +0800
Message-Id: <8ca725351bbb9a8909bb2345118c6f261d1e152e.1614009417.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <cover.1614009417.git.anuj.mittal@intel.com>
References: <cover.1614009417.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Richard Purdie <richard.purdie@linuxfoundation.org>

A build date was leaking into the generated docs and makefile used for
ptests leading to reproducibility issues each time the month changed.

Add a patch to use SOURCE_DATE_EPOCH to derive it if available.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 6a9ca7aec4991eabd425e32fdf85f51bb1686b8b)
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 .../opkg/opkg/sourcedateepoch.patch           | 25 +++++++++++++++++++
 meta/recipes-devtools/opkg/opkg_0.4.3.bb      |  1 +
 2 files changed, 26 insertions(+)
 create mode 100644 meta/recipes-devtools/opkg/opkg/sourcedateepoch.patch

diff --git a/meta/recipes-devtools/opkg/opkg/sourcedateepoch.patch b/meta/recipes-devtools/opkg/opkg/sourcedateepoch.patch
new file mode 100644
index 0000000000..285d258c63
--- /dev/null
+++ b/meta/recipes-devtools/opkg/opkg/sourcedateepoch.patch
@@ -0,0 +1,25 @@
+Having CLEAN_DATE come from the current date doesn't allow for build
+reproducibility. Add the option of using SOURCE_DATE_EPOCH if set
+which for OE, it will be.
+
+Upstream-Status: Pending
+RP 2021/2/2
+
+Index: opkg-0.4.4/configure.ac
+===================================================================
+--- opkg-0.4.4.orig/configure.ac
++++ opkg-0.4.4/configure.ac
+@@ -281,7 +281,12 @@ AC_FUNC_UTIME_NULL
+ AC_FUNC_VPRINTF
+ AC_CHECK_FUNCS([memmove memset mkdir regcomp strchr strcspn strdup strerror strndup strrchr strstr strtol strtoul sysinfo utime])
+ 
+-CLEAN_DATE=`date +"%B %Y" | tr -d '\n'`
++1607446883
++if [ ! -z "$SOURCE_DATE_EPOCH" ]; then
++    CLEAN_DATE=`LC_ALL=C date -d @$SOURCE_DATE_EPOCH +"%B %Y" | tr -d '\n'`
++else
++    CLEAN_DATE=`date +"%B %Y" | tr -d '\n'`
++fi
+ 
+ AC_SUBST([CLEAN_DATE])
+ 
diff --git a/meta/recipes-devtools/opkg/opkg_0.4.3.bb b/meta/recipes-devtools/opkg/opkg_0.4.3.bb
index 46b7aa2523..ea01d473fc 100644
--- a/meta/recipes-devtools/opkg/opkg_0.4.3.bb
+++ b/meta/recipes-devtools/opkg/opkg_0.4.3.bb
@@ -14,6 +14,7 @@ PE = "1"
 SRC_URI = "http://downloads.yoctoproject.org/releases/${BPN}/${BPN}-${PV}.tar.gz \
            file://opkg.conf \
            file://0001-opkg_conf-create-opkg.lock-in-run-instead-of-var-run.patch \
+           file://sourcedateepoch.patch \
            file://run-ptest \
 "
 
-- 
2.29.2

