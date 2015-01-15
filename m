Return-Path: <ross.burton@intel.com>
Received: from mail-we0-f181.google.com (mail-we0-f181.google.com
	[74.125.82.181])
	by mail.openembedded.org (Postfix) with ESMTP id 27D5D72858
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 Jan 2015 11:56:00 +0000 (UTC)
Received: by mail-we0-f181.google.com with SMTP id q58so14227583wes.12
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 Jan 2015 03:56:01 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=XoIE4m5vMpP/zfMU6QaBz2DnFgIFGU4/vBWBFGtpiUU=;
	b=elamWBvwH5j2O5j5dfWBf8SQAyZ4RSYN24m3diYVrzspXkptKA8YoosfQbsQZuONQV
	rEbMAST9yDIPQi5Cnl2EBDD/ThmQuzYCLLuuG2os9bsQOhETR4t7DiDk2SgIBj+LpZCz
	nylo/i93Er/12aJBf4FFz9ODQ98FFog0yg9ItdlWeNk79J7OQVZHY79hcHcLQ5hFbguH
	qHR+iFZCO5XVriHZVzYe4i6ZtKC6yHD1BHaVXFwEnfbM/hCyb8vzZij5fMlvGAf1UMeo
	wvtfGJyQOFflLntu4piVHG2WLbrGCU2TneFDtDLMwMdDb+OM6KMhRHOXzpc06WuohMsD
	A6Sg==
X-Gm-Message-State: ALoCoQn8EQMrZRFdnLVk8yZxBfuqjaE3JV9rgGW+72WCcXZYm/wTsBeW73uh53HCmwQrctc7s/O+
X-Received: by 10.180.76.132 with SMTP id k4mr26227878wiw.41.1421322961169;
	Thu, 15 Jan 2015 03:56:01 -0800 (PST)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35])
	by mx.google.com with ESMTPSA id vh8sm1798509wjc.12.2015.01.15.03.55.59
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 15 Jan 2015 03:56:00 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 15 Jan 2015 11:54:19 +0000
Message-Id: <1421322860-12652-7-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1421322860-12652-1-git-send-email-ross.burton@intel.com>
References: <1421322860-12652-1-git-send-email-ross.burton@intel.com>
Cc: dvhart@linux.intel.com
Subject: [PATCH 7/8] kernel.bbclass: Update cleandirs to remove new kernel staging dirs
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
X-List-Received-Date: Thu, 15 Jan 2015 11:56:01 -0000

From: Darren Hart <dvhart@linux.intel.com>

Fixes [YOCTO 6818]

Update do_unpack[cleandirs] to include the STAGING_KERNEL_BUILDDIR, and
add the same set of updated cleandirs for do_clean.

Signed-off-by: Darren Hart <dvhart@linux.intel.com>
Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/classes/kernel.bbclass |    3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
index a60de8c..805f799 100644
--- a/meta/classes/kernel.bbclass
+++ b/meta/classes/kernel.bbclass
@@ -40,7 +40,8 @@ python __anonymous () {
 # We need to move these over to STAGING_KERNEL_DIR. We can't just
 # create the symlink in advance as the git fetcher can't cope with
 # the symlink.
-do_unpack[cleandirs] += " ${S} ${STAGING_KERNEL_DIR} ${B}"
+do_unpack[cleandirs] += " ${S} ${STAGING_KERNEL_DIR} ${B} ${STAGING_KERNEL_BUILDDIR}"
+do_clean[cleandirs] += " ${S} ${STAGING_KERNEL_DIR} ${B} ${STAGING_KERNEL_BUILDDIR}"
 base_do_unpack_append () {
     s = d.getVar("S", True)
     if s[-1] == '/':
-- 
1.7.10.4


