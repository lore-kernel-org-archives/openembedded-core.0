Received: from mga07.intel.com (mga07.intel.com [])
 by mx.groups.io with SMTP id smtpd.web11.12270.1612885959329511791
 for <openembedded-core@lists.openembedded.org>;
 Tue, 09 Feb 2021 07:52:44 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=fail (domain: intel.com, ip: <nil>, mailfrom: anuj.mittal@intel.com)
IronPort-SDR: +tV7rYqFP76gPJHuXg0JuhUJ9A/SNlZWB7vGNN0t9Ie1RIovYctUsDq7PB1iOQnuuAjuY5zSb0
 fCpKZ0W1A/5g==
X-IronPort-AV: E=McAfee;i="6000,8403,9890"; a="245968586"
X-IronPort-AV: E=Sophos;i="5.81,165,1610438400"; 
   d="scan'208";a="245968586"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Feb 2021 07:52:44 -0800
IronPort-SDR: u0ks1IAiXl5MQEPe7as6YuqEU9kvGk4bNP8QQNraF8Dc+ffmB/makZxp4HUujRK5TDskcyoDQ9
 N18TEw6kQtKg==
X-IronPort-AV: E=Sophos;i="5.81,165,1610438400"; 
   d="scan'208";a="359215439"
Received: from ytee-mobl1.gar.corp.intel.com (HELO anmitta2-mobl1.gar.corp.intel.com) ([10.255.146.52])
  by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Feb 2021 07:52:43 -0800
From: "Anuj Mittal" <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [gatesgarth][PATCH 06/35] ncurses: Don't put terminfo into the sysroot
Date: Tue,  9 Feb 2021 23:51:51 +0800
Message-Id: <cb254debc36acc085a90c665f72ecf3a28692944.1612885583.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <cover.1612885583.git.anuj.mittal@intel.com>
References: <cover.1612885583.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Richard Purdie <richard.purdie@linuxfoundation.org>

This recudes the file count from ~2850 to ~100 which is a huge win
for reducing build directory clutter, its unlikely anything uses the
terminfo data or man pages in the sysroot. This is especially helpful
as we usually end up with two copies of these sets of files.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 443633dfc20177ef88a388d96745675817510c99)
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 meta/recipes-core/ncurses/ncurses.inc | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/meta/recipes-core/ncurses/ncurses.inc b/meta/recipes-core/ncurses/ncurses.inc
index fe4e8a5d6e..ef59bc3b0a 100644
--- a/meta/recipes-core/ncurses/ncurses.inc
+++ b/meta/recipes-core/ncurses/ncurses.inc
@@ -324,3 +324,8 @@ FILES_${PN}-terminfo-base = "\
 
 RSUGGESTS_${PN}-libtinfo = "${PN}-terminfo"
 RRECOMMENDS_${PN}-libtinfo = "${PN}-terminfo-base"
+
+# Putting terminfo into the sysroot adds around 2800 files to
+# each recipe specific sysroot. We can live without this, particularly
+# as many recipes may have native and target copies.
+SYSROOT_DIRS_remove = "${datadir}"
-- 
2.29.2

