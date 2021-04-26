Received: from mga14.intel.com (mga14.intel.com [])
 by mx.groups.io with SMTP id smtpd.web11.972.1619398464930781840
 for <openembedded-core@lists.openembedded.org>;
 Sun, 25 Apr 2021 17:54:36 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=fail (domain: intel.com, ip: <nil>, mailfrom: anuj.mittal@intel.com)
IronPort-SDR: No9U8Uc6YgrKwqnN1lY3WaaBYax/36/Hz1bno33XyB23Sg5kjyNPKWusTAw0s0ADVvDsYQpnm4
 sd/uItJEds5Q==
X-IronPort-AV: E=McAfee;i="6200,9189,9965"; a="195818185"
X-IronPort-AV: E=Sophos;i="5.82,251,1613462400"; 
   d="scan'208";a="195818185"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Apr 2021 17:54:36 -0700
IronPort-SDR: uw1OXoSPkLTBvLJrLv205mTA/2iQNmkU1USyatywWPO0615wkXVwOeFoOURfGP5ZYxiIEvKh73
 s1fOQBN1RFjQ==
X-IronPort-AV: E=Sophos;i="5.82,251,1613462400"; 
   d="scan'208";a="454067402"
Received: from wsan-mobl1.ccr.corp.intel.com (HELO anmitta2-mobl1.gar.corp.intel.com) ([10.213.45.138])
  by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Apr 2021 17:54:34 -0700
From: "Anuj Mittal" <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [hardknott][PATCH 30/64] groff: not ship /usr/bin/grap2graph
Date: Mon, 26 Apr 2021 08:53:01 +0800
Message-Id: <b096417b9635c5a790616d20f0490bc15b9d7c0f.1619397968.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <cover.1619397968.git.anuj.mittal@intel.com>
References: <cover.1619397968.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Mingli Yu <mingli.yu@windriver.com>

grap2graph which converts a GRAP diagram into a cropped image fails
to run as below:
 $ grap2graph
 /usr/bin/grap2graph: line 89: convert: command not found
 /usr/bin/grap2graph: warning: falling back to old '-crop 0x0' trim method
 /usr/bin/grap2graph: line 104: convert: command not found
 /usr/bin/grap2graph: line 103: grap: command not found

Considering we don't often need to convert a GRAP diagram into
a cropped image and the recipe ImageMagick which provides convert
command is in meta-oe layer, so don't ship the related files to
avoid the confusion about the above run time error.

Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 251be7279a475ee18c0c53fe9795bb37bffc2b45)
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 meta/recipes-extended/groff/groff_1.22.4.bb | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta/recipes-extended/groff/groff_1.22.4.bb b/meta/recipes-extended/groff/groff_1.22.4.bb
index 983cb9aea6..f0e9eb6a8a 100644
--- a/meta/recipes-extended/groff/groff_1.22.4.bb
+++ b/meta/recipes-extended/groff/groff_1.22.4.bb
@@ -62,6 +62,10 @@ do_install_append() {
 	rm -rf ${D}${bindir}/glilypond
 	rm -rf ${D}${libdir}/groff/glilypond
 	rm -rf ${D}${mandir}/man1/glilypond*
+
+	# not ship /usr/bin/grap2graph and its releated man files
+	rm -rf ${D}${bindir}/grap2graph
+	rm -rf ${D}${mandir}/man1/grap2graph*
 }
 
 do_install_append_class-native() {
-- 
2.30.2

