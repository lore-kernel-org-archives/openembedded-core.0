Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by mx.groups.io with SMTP id smtpd.web08.3933.1631747749606685057
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Sep 2021 16:15:53 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: intel.com, ip: 192.55.52.120, mailfrom: anuj.mittal@intel.com)
X-IronPort-AV: E=McAfee;i="6200,9189,10108"; a="220565499"
X-IronPort-AV: E=Sophos;i="5.85,296,1624345200"; 
   d="scan'208";a="220565499"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Sep 2021 16:15:53 -0700
X-IronPort-AV: E=Sophos;i="5.85,296,1624345200"; 
   d="scan'208";a="433597285"
Received: from chgan-mobl.gar.corp.intel.com (HELO anmitta2-mobl1.gar.corp.intel.com) ([10.215.238.104])
  by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Sep 2021 16:15:51 -0700
From: "Anuj Mittal" <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [hardknott][PATCH 04/17] apr: Security fix for CVE-2021-35940
Date: Thu, 16 Sep 2021 07:15:28 +0800
Message-Id: <2b1a8731359d990b3a8eec6403d689144a516207.1631747352.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <cover.1631747352.git.anuj.mittal@intel.com>
References: <cover.1631747352.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Armin Kuster <akuster808@gmail.com>

An out-of-bounds array read in the apr_time_exp*() functions was fixed in the
Apache Portable Runtime 1.6.3 release (CVE-2017-12613). The fix for this issue
was not carried forward to the APR 1.7.x branch, and hence version 1.7.0 regressed
compared to 1.6.3 and is vulnerable to the same issue.

Signed-off-by: Armin Kuster <akuster808@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit d52b78c75323fb254b5d0216f9183573b353abd3)
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 .../apr/apr/CVE-2021-35940.patch              | 58 +++++++++++++++++++
 meta/recipes-support/apr/apr_1.7.0.bb         |  1 +
 2 files changed, 59 insertions(+)
 create mode 100644 meta/recipes-support/apr/apr/CVE-2021-35940.patch

diff --git a/meta/recipes-support/apr/apr/CVE-2021-35940.patch b/meta/recipes-support/apr/apr/CVE-2021-35940.patch
new file mode 100644
index 0000000000..00befdacee
--- /dev/null
+++ b/meta/recipes-support/apr/apr/CVE-2021-35940.patch
@@ -0,0 +1,58 @@
+
+SECURITY: CVE-2021-35940 (cve.mitre.org)
+
+Restore fix for CVE-2017-12613 which was missing in 1.7.x branch, though
+was addressed in 1.6.x in 1.6.3 and later via r1807976.
+
+The fix was merged back to 1.7.x in r1891198.
+
+Since this was a regression in 1.7.0, a new CVE name has been assigned
+to track this, CVE-2021-35940.
+
+Thanks to Iveta Cesalova <icesalov redhat.com> for reporting this issue.
+
+https://svn.apache.org/viewvc?view=revision&revision=1891198
+
+Upstream-Status: Backport
+CVE: CVE-2021-35940
+Signed-off-by: Armin Kuster <akuster@mvista.com>
+
+
+Index: time/unix/time.c
+===================================================================
+--- a/time/unix/time.c	(revision 1891197)
++++ b/time/unix/time.c	(revision 1891198)
+@@ -142,6 +142,9 @@
+     static const int dayoffset[12] =
+     {306, 337, 0, 31, 61, 92, 122, 153, 184, 214, 245, 275};
+ 
++    if (xt->tm_mon < 0 || xt->tm_mon >= 12)
++        return APR_EBADDATE;
++
+     /* shift new year to 1st March in order to make leap year calc easy */
+ 
+     if (xt->tm_mon < 2)
+Index: time/win32/time.c
+===================================================================
+--- a/time/win32/time.c	(revision 1891197)
++++ b/time/win32/time.c	(revision 1891198)
+@@ -54,6 +54,9 @@
+     static const int dayoffset[12] =
+     {0, 31, 59, 90, 120, 151, 181, 212, 243, 273, 304, 334};
+ 
++    if (tm->wMonth < 1 || tm->wMonth > 12)
++        return APR_EBADDATE;
++
+     /* Note; the caller is responsible for filling in detailed tm_usec,
+      * tm_gmtoff and tm_isdst data when applicable.
+      */
+@@ -228,6 +231,9 @@
+     static const int dayoffset[12] =
+     {306, 337, 0, 31, 61, 92, 122, 153, 184, 214, 245, 275};
+ 
++    if (xt->tm_mon < 0 || xt->tm_mon >= 12)
++        return APR_EBADDATE;
++
+     /* shift new year to 1st March in order to make leap year calc easy */
+ 
+     if (xt->tm_mon < 2)
diff --git a/meta/recipes-support/apr/apr_1.7.0.bb b/meta/recipes-support/apr/apr_1.7.0.bb
index 82317396cd..b70edfaf42 100644
--- a/meta/recipes-support/apr/apr_1.7.0.bb
+++ b/meta/recipes-support/apr/apr_1.7.0.bb
@@ -24,6 +24,7 @@ SRC_URI = "${APACHE_MIRROR}/apr/${BPN}-${PV}.tar.bz2 \
            file://libtoolize_check.patch \
            file://0001-Add-option-to-disable-timed-dependant-tests.patch \
            file://autoconf270.patch \
+           file://CVE-2021-35940.patch \
            "
 
 SRC_URI[md5sum] = "7a14a83d664e87599ea25ff4432e48a7"
-- 
2.31.1

