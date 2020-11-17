Received: from mga18.intel.com (mga18.intel.com [])
 by mx.groups.io with SMTP id smtpd.web11.9634.1605627379456851254
 for <openembedded-core@lists.openembedded.org>;
 Tue, 17 Nov 2020 07:36:34 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=fail (domain: intel.com, ip: <nil>, mailfrom: anuj.mittal@intel.com)
IronPort-SDR: VOfT6qq0JVqPD/UPdbJGkdBXJZYfG0sbVOelZlGaZJVegaz+W3bluSb0hDJ38rqpXPvmj0oK7T
 0ih0MaiSkdrA==
X-IronPort-AV: E=McAfee;i="6000,8403,9808"; a="158720027"
X-IronPort-AV: E=Sophos;i="5.77,485,1596524400"; 
   d="scan'208";a="158720027"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Nov 2020 07:36:34 -0800
IronPort-SDR: C0MAl9QxQNuezj5GXeTyIC0Rkj7fzZDus9bgrTbSVwyl7yE2Z/bTVf1q0ouq45fZlYjpPJVvfj
 MOFmNT2PYJJA==
X-IronPort-AV: E=Sophos;i="5.77,485,1596524400"; 
   d="scan'208";a="400802993"
Received: from sbinisma-mobl2.gar.corp.intel.com (HELO anmitta2-mobl1.gar.corp.intel.com) ([10.213.40.254])
  by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Nov 2020 07:36:33 -0800
From: "Anuj Mittal" <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [gatesgarth][PATCH 15/19] layer.conf: fix syntax error in PATH setting
Date: Tue, 17 Nov 2020 23:36:04 +0800
Message-Id: <b6c3950be8e4edbdde74b5819c974124e30680c7.1605626675.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <cover.1605626675.git.anuj.mittal@intel.com>
References: <cover.1605626675.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Matt Madison <matt@madison.systems>

Commit 05a87be51b44608ce4f77ac332df90a3cd2445ef introduced
a Python conditional expression when updating PATH that
generates syntax warnings in bitbake-cookerdaemon.log:

  Var <PATH[:=]>:1: SyntaxWarning: "is not" with a literal. Did you mean "!="?

Fix this by using the more appropriate '!=' comparison
operator.

Signed-off-by: Matt Madison <matt@madison.systems>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 2e753a12cf6bb98f9e0940e5ed6255ce8c538eed)
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 meta/conf/layer.conf | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/conf/layer.conf b/meta/conf/layer.conf
index 2d9cd05695..cda37c33b4 100644
--- a/meta/conf/layer.conf
+++ b/meta/conf/layer.conf
@@ -104,4 +104,4 @@ SSTATE_EXCLUDEDEPS_SYSROOT += ".*->autoconf-archive-native"
 # We need to keep bitbake tools in PATH
 # Avoid empty path entries
 BITBAKEPATH := "${@os.path.dirname(bb.utils.which(d.getVar('PATH'),'bitbake'))}"
-PATH := "${@'${BITBAKEPATH}:' if '${BITBAKEPATH}' is not '' else ''}${HOSTTOOLS_DIR}"
+PATH := "${@'${BITBAKEPATH}:' if '${BITBAKEPATH}' != '' else ''}${HOSTTOOLS_DIR}"
-- 
2.28.0

