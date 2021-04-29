Received: from mga05.intel.com (mga05.intel.com [])
 by mx.groups.io with SMTP id smtpd.web10.2365.1619671281658268226
 for <openembedded-core@lists.openembedded.org>;
 Wed, 28 Apr 2021 21:41:27 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=fail (domain: intel.com, ip: <nil>, mailfrom: anuj.mittal@intel.com)
IronPort-SDR: OSd8U2F9Est02OfYtJkI/6Lu0HKP3ytkH6yVl9aiH3EseQApHcORD0dSeLUx3FMG29rRS5riVS
 AlpJyFedrCLA==
X-IronPort-AV: E=McAfee;i="6200,9189,9968"; a="282258300"
X-IronPort-AV: E=Sophos;i="5.82,258,1613462400"; 
   d="scan'208";a="282258300"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Apr 2021 21:41:27 -0700
IronPort-SDR: QBUhs7MAxTnGjonRGUbHBxEw+AyFXXnQDy8hkson4gRd3EG/ASHcuhy7OqAbIWlZmuGyxTwN0L
 8VNCl9BPSotQ==
X-IronPort-AV: E=Sophos;i="5.82,258,1613462400"; 
   d="scan'208";a="423883645"
Received: from ytakikit-mobl.gar.corp.intel.com (HELO anmitta2-mobl1.gar.corp.intel.com) ([10.213.43.188])
  by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Apr 2021 21:41:26 -0700
From: "Anuj Mittal" <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [hardknott][PATCH 04/10] kernel-yocto.bbclass: chdir to ${WORKDIR} for do_kernel_checkout
Date: Thu, 29 Apr 2021 12:41:01 +0800
Message-Id: <51b03665de86c14f5b3887a60154b118c0d37aa3.1619667368.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <cover.1619667368.git.anuj.mittal@intel.com>
References: <cover.1619667368.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Kai Kang <kai.kang@windriver.com>

It chdirs to ${S} at the beginning of task do_kernel_checkout. Then it
removes ${S} when it still resides in ${S}. It may fail to run the task
do_kernel_checkout when bitbake is called by third-part wrapper script.
So chdir to ${WORKDIR} by default for do_kernel_checkout. And it will
chdir to ${S} afterwards in task do_kernel_checkout.

Signed-off-by: Kai Kang <kai.kang@windriver.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit cf0e3397d3f86c7ea1f3c66c50a44d6205f5921b)
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 meta/classes/kernel-yocto.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/kernel-yocto.bbclass b/meta/classes/kernel-yocto.bbclass
index 15c8dbb81f..30f07de4ca 100644
--- a/meta/classes/kernel-yocto.bbclass
+++ b/meta/classes/kernel-yocto.bbclass
@@ -378,7 +378,7 @@ do_kernel_checkout() {
 	# checkout and clobber any unimportant files
 	git checkout -f ${machine_branch}
 }
-do_kernel_checkout[dirs] = "${S}"
+do_kernel_checkout[dirs] = "${S} ${WORKDIR}"
 
 addtask kernel_checkout before do_kernel_metadata after do_symlink_kernsrc
 addtask kernel_metadata after do_validate_branches do_unpack before do_patch
-- 
2.30.2

