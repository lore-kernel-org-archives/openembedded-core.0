Received: from mga04.intel.com (mga04.intel.com [])
 by mx.groups.io with SMTP id smtpd.web08.53727.1606698706457667213
 for <openembedded-core@lists.openembedded.org>;
 Sun, 29 Nov 2020 17:12:00 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=fail (domain: intel.com, ip: <nil>, mailfrom: anuj.mittal@intel.com)
IronPort-SDR: ArjQeOrAJCCmBpCNGqhlgwkwFhQQ4Z0CAmQmib6n/fMhJpffDZnPGmX8uEZispS6wtvSAbNst5
 08xML7sMswQg==
X-IronPort-AV: E=McAfee;i="6000,8403,9820"; a="170004376"
X-IronPort-AV: E=Sophos;i="5.78,379,1599548400"; 
   d="scan'208";a="170004376"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Nov 2020 17:11:59 -0800
IronPort-SDR: cvHQSTQvZOw0mNBtOt99+/OlhU+poLjFmCGOkN3Rgn/srkRlYUVYH9NrL01ci2tMVf2B+8dtdu
 NwEeMBktvw/w==
X-IronPort-AV: E=Sophos;i="5.78,379,1599548400"; 
   d="scan'208";a="372302667"
Received: from ajraj-mobl.gar.corp.intel.com (HELO anmitta2-mobl1.gar.corp.intel.com) ([10.213.114.166])
  by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Nov 2020 17:11:58 -0800
From: "Anuj Mittal" <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [gatesgarth][PATCH 07/21] glib-2.0: RDEPEND on dbusmock only when GI_DATA_ENABLED is True
Date: Mon, 30 Nov 2020 09:11:22 +0800
Message-Id: <881986b4032d893464dbcbd7e7e114b454af0a1b.1606698421.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <cover.1606698421.git.anuj.mittal@intel.com>
References: <cover.1606698421.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

python3-dbusmock depends on pygobject unconditionally and it's not going
to work if g-i is disabled.

Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit b70627e2818ded74be862ad8650e19bf1fe9bd43)
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

