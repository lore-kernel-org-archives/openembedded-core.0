Received: from mga07.intel.com (mga07.intel.com [])
 by mx.groups.io with SMTP id smtpd.web12.8237.1595926357616374658
 for <openembedded-core@lists.openembedded.org>;
 Tue, 28 Jul 2020 01:52:52 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=fail (domain: intel.com, ip: <nil>, mailfrom: anuj.mittal@intel.com)
IronPort-SDR: ptx/WVDq6Tyzy4IccDejzmAFM+CBHvFSKq0iHB9HL1HsKkltNlnd3SpB2Ud04vQOtyvBfyCLli
 uUtw3d/HN8rQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9695"; a="215699687"
X-IronPort-AV: E=Sophos;i="5.75,405,1589266800"; 
   d="scan'208";a="215699687"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jul 2020 01:52:52 -0700
IronPort-SDR: lYPSoxGthEs+E4dNLm+h1RRwRyd6sjpUuL85hOJXgvwLUgIZ6dVaudQDRSn7CKkYF2hw7/Ui/V
 cW4+BRwkksDQ==
X-IronPort-AV: E=Sophos;i="5.75,405,1589266800"; 
   d="scan'208";a="434245757"
Received: from unknown (HELO anmitta2-mobl1.gar.corp.intel.com) ([10.255.137.161])
  by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jul 2020 01:52:51 -0700
From: "Anuj Mittal" <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [zeus][PATCH 09/32] vim: _FORTIFY_SOURCE=2 be gone
Date: Tue, 28 Jul 2020 16:51:10 +0800
Message-Id: <db1e93c33150e712b90e81450fd2e161ea2fad08.1595924916.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.25.4
In-Reply-To: <cover.1595924916.git.anuj.mittal@intel.com>
References: <cover.1595924916.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Joe Slater <joe.slater@windriver.com>

vim will abort in many places with this setting.  Replace
it with the benign _FORTIFY_SOURCE=1.

(From OE-Core rev: d9de155f6452f916edd3131addd0c2eebaf4d639)

Signed-off-by: Joe Slater <joe.slater@windriver.com>
(cherry picked from commit 18129cbaeddb3278efe9963718556e3765f06c1e)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Adrian Bunk <bunk@stusta.de>
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 meta/recipes-support/vim/vim_8.1.1518.bb | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/meta/recipes-support/vim/vim_8.1.1518.bb b/meta/recipes-support/vim/vim_8.1.1518.bb
index 60946a181f..709b6ddb55 100644
--- a/meta/recipes-support/vim/vim_8.1.1518.bb
+++ b/meta/recipes-support/vim/vim_8.1.1518.bb
@@ -8,3 +8,8 @@ BBCLASSEXTEND = "native"
 ALTERNATIVE_${PN}_append = " xxd"
 ALTERNATIVE_TARGET[xxd] = "${bindir}/xxd"
 ALTERNATIVE_LINK_NAME[xxd] = "${bindir}/xxd"
+
+# We override the default in security_flags.inc because vim (not vim-tiny!) will abort
+# in many places for _FORTIFY_SOURCE=2.  Security flags become part of CC.
+#
+lcl_maybe_fortify = "${@oe.utils.conditional('DEBUG_BUILD','1','','-D_FORTIFY_SOURCE=1',d)}"
-- 
2.25.4

