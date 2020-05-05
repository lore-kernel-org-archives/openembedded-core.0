Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by mx.groups.io with SMTP id smtpd.web10.3191.1588661898167067506
 for <openembedded-core@lists.openembedded.org>;
 Mon, 04 May 2020 23:58:18 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: intel.com, ip: 134.134.136.31, mailfrom: anuj.mittal@intel.com)
IronPort-SDR: iUHdpn0SvTqNPPtFwq2WfP4TTJtk6Yy224rpGvHxy1JprbsLPC2ccqDOBUDXPCCMrmUXdgfQCG
 m5F7AuqswpUA==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 May 2020 23:58:15 -0700
IronPort-SDR: j5sQxFnnZcjtjBPmDdeKcs/KnnMjNdtTO/BKkWehPZ1URvVCMaNHE05Gwslv7jrm5At3z9cAyt
 tG+MzePxpSBA==
X-IronPort-AV: E=Sophos;i="5.73,354,1583222400"; 
   d="scan'208";a="284144753"
Received: from anmitta2-mobl1.gar.corp.intel.com ([10.249.72.16])
  by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 May 2020 23:58:03 -0700
From: "Anuj Mittal" <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH][zeus 04/18] apt-native: don't let dpkg overwrite files by default
Date: Tue,  5 May 2020 14:56:39 +0800
Message-Id: <b57b311cfaabbcd08ce51760abcd64cf23e1435b.1588661196.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.25.4
In-Reply-To: <cover.1588661196.git.anuj.mittal@intel.com>
References: <cover.1588661196.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Jan Luebbe <jlu@pengutronix.de>

With --force-overwrite (implied by --force-all), dpkg will not abort
when a package overwrites files from different packages. As this can
also lead to "The following package disappeared from your system as
all files have been overwritten by other packages: <package>" and
subsequently broken dependencies, this makes the simple case of
conflicting files hard to debug.

Instead of finding all possibly required force options, only disable
overwrite for now.

Signed-off-by: Jan Luebbe <jlu@pengutronix.de>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 meta/recipes-devtools/apt/files/apt.conf | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/apt/files/apt.conf b/meta/recipes-devtools/apt/files/apt.conf
index 03351356bc..c95a5b07af 100644
--- a/meta/recipes-devtools/apt/files/apt.conf
+++ b/meta/recipes-devtools/apt/files/apt.conf
@@ -39,4 +39,4 @@ APT
   };
 };
 
-DPkg::Options {"--root=#ROOTFS#";"--admindir=#ROOTFS#/var/lib/dpkg";"--force-all";"--no-debsig"};
+DPkg::Options {"--root=#ROOTFS#";"--admindir=#ROOTFS#/var/lib/dpkg";"--force-all";"--no-force-overwrite";"--no-debsig"};
-- 
2.25.4

