Received: from mga05.intel.com (mga05.intel.com [])
 by mx.groups.io with SMTP id smtpd.web10.2077.1593651261154006625
 for <openembedded-core@lists.openembedded.org>;
 Wed, 01 Jul 2020 17:54:35 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=fail (domain: intel.com, ip: <nil>, mailfrom: anuj.mittal@intel.com)
IronPort-SDR: vG6Um9sqvk5yFqraeatboorJ/CdAB4Q1SOZif3lZ/AmlEfwTkkTbycAxJ2knhz2r4Ve4aWpPWM
 m7ONuNJEkawQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9669"; a="231628872"
X-IronPort-AV: E=Sophos;i="5.75,302,1589266800"; 
   d="scan'208";a="231628872"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Jul 2020 17:54:35 -0700
IronPort-SDR: 4gS5k+D0zRICSrygDM7MrXp2q4y2LRwXbloFvrp2PfdBM12ojfvTJ98ZMfN9i3v7hSd7Qgad5T
 /CKaNfs0cLGQ==
X-IronPort-AV: E=Sophos;i="5.75,302,1589266800"; 
   d="scan'208";a="481801764"
Received: from anmitta2-mobl1.gar.corp.intel.com ([10.249.69.56])
  by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Jul 2020 17:54:34 -0700
From: "Anuj Mittal" <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [zeus][PATCH 10/10] libpam: Remove option 'obscure' from common-password
Date: Thu,  2 Jul 2020 08:54:12 +0800
Message-Id: <f5b90eeed7366432b39c7cd8c6ee8c23e2d4abe8.1593474787.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.25.4
In-Reply-To: <cover.1593474787.git.anuj.mittal@intel.com>
References: <cover.1593474787.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: haiqing <haiqing.bai@windriver.com>

libpam does not support 'obscure' checks to password,
there are the same checks in pam_cracklib module.
And this fix can remove the below error message while
updating password with 'passwd':
pam_unix(passwd:chauthtok):unrecognized option[obscure]

Signed-off-by: Haiqing Bai <Haiqing.Bai@windriver.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit ea761dbac90be77797308666fe1586b05e3df824)
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 meta/recipes-extended/pam/libpam/pam.d/common-password | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/meta/recipes-extended/pam/libpam/pam.d/common-password b/meta/recipes-extended/pam/libpam/pam.d/common-password
index 3896057328..52478dae77 100644
--- a/meta/recipes-extended/pam/libpam/pam.d/common-password
+++ b/meta/recipes-extended/pam/libpam/pam.d/common-password
@@ -10,13 +10,10 @@
 # The "sha512" option enables salted SHA512 passwords.  Without this option,
 # the default is Unix crypt.  Prior releases used the option "md5".
 #
-# The "obscure" option replaces the old `OBSCURE_CHECKS_ENAB' option in
-# login.defs.
-#
 # See the pam_unix manpage for other options.
 
 # here are the per-package modules (the "Primary" block)
-password	[success=1 default=ignore]	pam_unix.so obscure sha512
+password	[success=1 default=ignore]	pam_unix.so sha512
 # here's the fallback if no module succeeds
 password	requisite			pam_deny.so
 # prime the stack with a positive return value if there isn't one already;
-- 
2.25.4

