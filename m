Received: from mga07.intel.com (mga07.intel.com [])
 by mx.groups.io with SMTP id smtpd.web11.12270.1612885959329511791
 for <openembedded-core@lists.openembedded.org>;
 Tue, 09 Feb 2021 07:52:46 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=fail (domain: intel.com, ip: <nil>, mailfrom: anuj.mittal@intel.com)
IronPort-SDR: ISGFPZjvlvoo5bvt9z6kdLDVF9ZTLhky6AhGMxnXaDd4kxOSXCs+sBM8Jy6JWNzIR9sK0B0Cjs
 2HFYQksKN9Kg==
X-IronPort-AV: E=McAfee;i="6000,8403,9890"; a="245968598"
X-IronPort-AV: E=Sophos;i="5.81,165,1610438400"; 
   d="scan'208";a="245968598"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Feb 2021 07:52:45 -0800
IronPort-SDR: Qi4MKwzRRxXN48zUJLA6tHNvDUJHKE7Bn83d0Knjp0v0Z7U2ZxWjddF0adJcetNcYGLI7HC8I1
 9DggD+QwzdRQ==
X-IronPort-AV: E=Sophos;i="5.81,165,1610438400"; 
   d="scan'208";a="359215441"
Received: from ytee-mobl1.gar.corp.intel.com (HELO anmitta2-mobl1.gar.corp.intel.com) ([10.255.146.52])
  by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Feb 2021 07:52:44 -0800
From: "Anuj Mittal" <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [gatesgarth][PATCH 07/35] python3: Avoid installing test data into recipe-sysroot
Date: Tue,  9 Feb 2021 23:51:52 +0800
Message-Id: <653f8b1a8adf59d924028bfc69ead1c7437de11e.1612885583.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <cover.1612885583.git.anuj.mittal@intel.com>
References: <cover.1612885583.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Richard Purdie <richard.purdie@linuxfoundation.org>

There are several thousand files in the test directory which we don't need.
Adding these for the native and target sysroots is a crazy amount of files
to be throwing around needlessly. Delete the files from the sysroot side
of things to tidy up the sysroots and improve performance.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit f6bced03011ad1663d68b0322a2f8aeb4d836646)
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 meta/recipes-devtools/python/python3_3.8.5.bb | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/meta/recipes-devtools/python/python3_3.8.5.bb b/meta/recipes-devtools/python/python3_3.8.5.bb
index 0e588d7e4c..fb066084bf 100644
--- a/meta/recipes-devtools/python/python3_3.8.5.bb
+++ b/meta/recipes-devtools/python/python3_3.8.5.bb
@@ -361,3 +361,9 @@ RDEPENDS_${PN}-dev = ""
 
 RDEPENDS_${PN}-tests_append_class-target = " ${MLPREFIX}bash"
 RDEPENDS_${PN}-tests_append_class-nativesdk = " ${MLPREFIX}bash"
+
+# Python's tests contain large numbers of files we don't need in the recipe sysroots
+SYSROOT_PREPROCESS_FUNCS += " py3_sysroot_cleanup"
+py3_sysroot_cleanup () {
+	rm -rf ${SYSROOT_DESTDIR}${libdir}/python${PYTHON_MAJMIN}/test
+}
-- 
2.29.2

