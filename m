Received: from heian.cn.fujitsu.com (heian.cn.fujitsu.com [183.91.158.132])
 by mx.groups.io with SMTP id smtpd.web09.7761.1611035140707082031
 for <openembedded-core@lists.openembedded.org>;
 Mon, 18 Jan 2021 21:45:41 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: cn.fujitsu.com, ip: 183.91.158.132, mailfrom: wangmy@cn.fujitsu.com)
X-IronPort-AV: E=Sophos;i="5.79,357,1602518400"; 
   d="scan'208";a="103607724"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
  by heian.cn.fujitsu.com with ESMTP; 19 Jan 2021 13:45:37 +0800
Received: from G08CNEXMBPEKD05.g08.fujitsu.local (unknown [10.167.33.204])
	by cn.fujitsu.com (Postfix) with ESMTP id 0CCD34CE603F
	for <openembedded-core@lists.openembedded.org>; Tue, 19 Jan 2021 13:45:32 +0800 (CST)
Received: from localhost.localdomain.localdomain (10.167.225.33) by
 G08CNEXMBPEKD05.g08.fujitsu.local (10.167.33.204) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Tue, 19 Jan 2021 13:45:30 +0800
From: "Wang Mingyu" <wangmy@cn.fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Wang Mingyu <wangmy@cn.fujitsu.com>
Subject: [OE-core] [PATCH] ghostscript: CVE-2013-6629 Security Advisory
Date: Tue, 19 Jan 2021 13:45:25 +0800
Message-ID: <1611035125-38834-2-git-send-email-wangmy@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1611035125-38834-1-git-send-email-wangmy@cn.fujitsu.com>
References: <1611035125-38834-1-git-send-email-wangmy@cn.fujitsu.com>
MIME-Version: 1.0
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD06.g08.fujitsu.local (10.167.33.205) To
 G08CNEXMBPEKD05.g08.fujitsu.local (10.167.33.204)
X-yoursite-MailScanner-ID: 0CCD34CE603F.A3E4E
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: wangmy@cn.fujitsu.com
X-Spam-Status: No
Content-Type: text/plain

References
https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2013-6629

Signed-off-by: Wang Mingyu <wangmy@cn.fujitsu.com>
---
 .../ghostscript/CVE-2013-6629.patch           | 28 +++++++++++++++++++
 .../ghostscript/ghostscript_9.53.3.bb         |  1 +
 2 files changed, 29 insertions(+)
 create mode 100644 meta/recipes-extended/ghostscript/ghostscript/CVE-2013-6629.patch

diff --git a/meta/recipes-extended/ghostscript/ghostscript/CVE-2013-6629.patch b/meta/recipes-extended/ghostscript/ghostscript/CVE-2013-6629.patch
new file mode 100644
index 0000000000..dffd215b4d
--- /dev/null
+++ b/meta/recipes-extended/ghostscript/ghostscript/CVE-2013-6629.patch
@@ -0,0 +1,28 @@
+Subject: [PATCH] CVE-2013-6629
+
+Author: pchelko 
+---
+ jpeg/jdmarker.c | 7 +++++++
+ 1 file changed, 7 insertions(+)
+
+diff --git a/jpeg/jdmarker.c b/jpeg/jdmarker.c
+index 3fbe5c1..ea3ef4a 100644
+--- a/jpeg/jdmarker.c
++++ b/jpeg/jdmarker.c
+@@ -382,6 +382,13 @@ get_sos (j_decompress_ptr cinfo)
+ 
+     TRACEMS3(cinfo, 1, JTRC_SOS_COMPONENT, compptr->component_id,
+ 	     compptr->dc_tbl_no, compptr->ac_tbl_no);
++
++    /* This CSi (cc) should differ from the previous CSi */
++    for (ci = 0; ci < i; ci++) {
++      if (cinfo->cur_comp_info[ci] == compptr) {
++        ERREXIT1(cinfo, JERR_BAD_COMPONENT_ID, cc);
++      }
++    }
+   }
+ 
+   /* Collect the additional scan parameters Ss, Se, Ah/Al. */
+-- 
+2.25.1
+
diff --git a/meta/recipes-extended/ghostscript/ghostscript_9.53.3.bb b/meta/recipes-extended/ghostscript/ghostscript_9.53.3.bb
index cbf60c8c85..24d17da263 100644
--- a/meta/recipes-extended/ghostscript/ghostscript_9.53.3.bb
+++ b/meta/recipes-extended/ghostscript/ghostscript_9.53.3.bb
@@ -29,6 +29,7 @@ SRC_URI_BASE = "https://github.com/ArtifexSoftware/ghostpdl-downloads/releases/d
                 file://do-not-check-local-libpng-source.patch \
                 file://avoid-host-contamination.patch \
                 file://mkdir-p.patch \
+                file://CVE-2013-6629.patch \
 "
 
 SRC_URI = "${SRC_URI_BASE} \
-- 
2.25.1



