Return-Path: <maxin.john@intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 9AC4660049
	for <openembedded-core@lists.openembedded.org>;
	Thu, 16 Nov 2017 15:55:41 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	16 Nov 2017 07:55:42 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.44,404,1505804400"; 
   d="scan'208";a="3434065"
Received: from linux.intel.com ([10.54.29.200])
	by fmsmga001.fm.intel.com with ESMTP; 16 Nov 2017 07:55:42 -0800
Received: from mbabyjoh-desk.fi.intel.com (mbabyjoh-desk.fi.intel.com
	[10.237.72.84])
	by linux.intel.com (Postfix) with ESMTP id 0CE5F5803BE
	for <openembedded-core@lists.openembedded.org>;
	Thu, 16 Nov 2017 07:55:41 -0800 (PST)
From: "Maxin B. John" <maxin.john@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 16 Nov 2017 17:56:07 +0200
Message-Id: <1510847767-2966-2-git-send-email-maxin.john@intel.com>
X-Mailer: git-send-email 2.4.0
In-Reply-To: <1510847767-2966-1-git-send-email-maxin.john@intel.com>
References: <1510847767-2966-1-git-send-email-maxin.john@intel.com>
Subject: [PATCH 2/2] image.bbclass: improve reproducibility
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 16 Nov 2017 15:55:41 -0000

Improve reproducibility of builds by adding --apparent-size to du -ks in
get_rootfs_size

[YOCTO #12235]

Signed-off-by: Maxin B. John <maxin.john@intel.com>
---
 meta/classes/image.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/image.bbclass b/meta/classes/image.bbclass
index 0d14250..a24a561 100644
--- a/meta/classes/image.bbclass
+++ b/meta/classes/image.bbclass
@@ -524,7 +524,7 @@ def get_rootfs_size(d):
     initramfs_fstypes = d.getVar('INITRAMFS_FSTYPES') or ''
     initramfs_maxsize = d.getVar('INITRAMFS_MAXSIZE')
 
-    output = subprocess.check_output(['du', '-ks',
+    output = subprocess.check_output(['du', '--apparent-size', '-ks',
                                       d.getVar('IMAGE_ROOTFS')])
     size_kb = int(output.split()[0])
     base_size = size_kb * overhead_factor
-- 
2.4.0


