Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by mx.groups.io with SMTP id smtpd.web10.21848.1605854961317947255
 for <openembedded-core@lists.openembedded.org>;
 Thu, 19 Nov 2020 22:49:22 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: intel.com, ip: 192.55.52.120, mailfrom: anuj.mittal@intel.com)
IronPort-SDR: /l3wL6JfC35TU4W4IZg6OCTE+3GMbaUqqLI1RSBzL6Xh0rnHLgnDlOEFiCi1WLfpLtlrXSqL3L
 6MuiulQsGKDw==
X-IronPort-AV: E=McAfee;i="6000,8403,9810"; a="168852955"
X-IronPort-AV: E=Sophos;i="5.78,355,1599548400"; 
   d="scan'208";a="168852955"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Nov 2020 22:49:20 -0800
IronPort-SDR: Ag/QXXMUGjiJUkoxkBsDadK5QTAmXdr9oZWzhaa0LLdzXVu3iI/wxMxxPDQEaVrglo6SuBYMFR
 vbcyUjkFOS0g==
X-IronPort-AV: E=Sophos;i="5.78,355,1599548400"; 
   d="scan'208";a="363664495"
Received: from zyteoh-mobl.gar.corp.intel.com (HELO anmitta2-mobl1.gar.corp.intel.com) ([10.214.163.84])
  by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Nov 2020 22:49:19 -0800
From: "Anuj Mittal" <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] glib-2.0: RDEPEND on dbusmock only when GI_DATA_ENABLED is True
Date: Fri, 20 Nov 2020 14:49:14 +0800
Message-Id: <20201120064914.66946-1-anuj.mittal@intel.com>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

python3-dbusmock depends on pygobject unconditionally and it's not going
to work if g-i is disabled.

Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 meta/recipes-core/glib-2.0/glib.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/glib-2.0/glib.inc b/meta/recipes-core/glib-2.0/glib.inc
index a0055d81b0..e48b5cb67b 100644
--- a/meta/recipes-core/glib-2.0/glib.inc
+++ b/meta/recipes-core/glib-2.0/glib.inc
@@ -170,7 +170,7 @@ RDEPENDS_${PN}-ptest += "\
             ${PN}-locale-th \
             python3-core \
             python3-modules \
-            python3-dbusmock \
+            ${@bb.utils.contains('GI_DATA_ENABLED', 'True', 'python3-dbusmock', '', d)} \
             ${PN}-codegen \
            "
 
-- 
2.28.0

