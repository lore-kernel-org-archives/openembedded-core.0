Return-Path: <patrick.ohly@intel.com>
Received: from mail-io0-f174.google.com (mail-io0-f174.google.com
	[209.85.223.174])
	by mail.openembedded.org (Postfix) with ESMTP id A6C9F71AB8
	for <openembedded-core@lists.openembedded.org>;
	Mon, 10 Apr 2017 08:28:17 +0000 (UTC)
Received: by mail-io0-f174.google.com with SMTP id a103so21550948ioj.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 10 Apr 2017 01:28:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id;
	bh=psKxSWkkmBWmq2TgYLR/ldIHkYCnyvLNSQxTw+OpB0Y=;
	b=ICaAewwTq3648HE6HnH5QIF1EsN94xnz/pXpwMUSTlWaUWT0tjdqaFEQtz6sMJqc0i
	LMNc8GJBFqtNUD77IVTagP9iFI3vkyDLbxI3dGPi8YZGQpTlwiGZgwO7yC06Dte1SuKV
	5MXCZbr2x26cY4YNhSKvpyh6oPOzGqjvk9VgbKgwsmcem5pK8woCBGbdS+suUzK9t/du
	rOmVm/hQep9JfoevSBrxQZ3F4tc9A1zvPJHSA0sx7DOubOaRpmFbkdDqk+JC1F2QT4Ms
	DsVDOEhsnT+nfaM3oPW0fkCko7/rMiHs3S0xf7lMAFLFYl06u+zmQi1d7brjG6nkTq/v
	9tXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=psKxSWkkmBWmq2TgYLR/ldIHkYCnyvLNSQxTw+OpB0Y=;
	b=Mpo0361j7oGZQsSIe2MkbKHRAH7c+ItPf3dp1BoptYDVpKCMxCzzZOwFAoy4Xjd/+Z
	VRJHzpDI0VTdnzmGzgz9CsNP6dr523ifdY5bTBPmALFn6B+bZb4mMuI4DTItmlj9YYFY
	IEFDW0/xgtC0N9hZ9tl8W2As9X9pTh9JJkc8HupDS2roDtSqrYenqIdE33oFHoR71pSt
	EthOyclFGH45mzWLPzYHAx4iwwo7rSRF/t7cp5YoEu09tzwwUkyqonaDt92u5/oHInhI
	lU6EJZfTYweTVUyfiCnXx/vwrqAejH9ZSfYhqHzrSaITghG+g+4alGXY4o0NKfOyXRiW
	iCYw==
X-Gm-Message-State: AN3rC/76DrVwj/82NRJ/VsvqTRBuQb8kdAZy9toPStO1+ZHgPWCA1VGQ
	HH1+cQd1UQ3JuwKJ
X-Received: by 10.36.22.85 with SMTP id a82mr10860407ita.83.1491812898778;
	Mon, 10 Apr 2017 01:28:18 -0700 (PDT)
Received: from pohly-desktop.fritz.box (p57A56DBC.dip0.t-ipconnect.de.
	[87.165.109.188]) by smtp.gmail.com with ESMTPSA id
	s40sm3293706ite.18.2017.04.10.01.28.16
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 10 Apr 2017 01:28:17 -0700 (PDT)
From: Patrick Ohly <patrick.ohly@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 10 Apr 2017 10:28:12 +0200
Message-Id: <23948bfefea60d0e7e7289cb07f5362e9fd9f0fd.1491812847.git-series.patrick.ohly@intel.com>
X-Mailer: git-send-email 2.11.0
Subject: [PATCH] buildhistory.bbclass: do not influence sstate of do_rootfs
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
X-List-Received-Date: Mon, 10 Apr 2017 08:28:20 -0000

Enabling or disabling buildhistory caused a rebuild of images, which
is undesirable. For example, it prevented image reuse from a main
build with buildhistory in a following oe-selftest where buildhistory
must be disabled.

The reason are the additional ROOTFS_POSTUNINSTALL_COMMAND and
ROOTFS_POSTUNINSTALL_COMMAND entries. Those need to be excluded both
via vardepvalueexclude and vardepsexclude.

Signed-off-by: Patrick Ohly <patrick.ohly@intel.com>
---
 meta/classes/buildhistory.bbclass | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/meta/classes/buildhistory.bbclass b/meta/classes/buildhistory.bbclass
index 109b375..eea1e72 100644
--- a/meta/classes/buildhistory.bbclass
+++ b/meta/classes/buildhistory.bbclass
@@ -579,10 +579,14 @@ python buildhistory_get_extra_sdkinfo() {
 
 # By using ROOTFS_POSTUNINSTALL_COMMAND we get in after uninstallation of
 # unneeded packages but before the removal of packaging files
-ROOTFS_POSTUNINSTALL_COMMAND += " buildhistory_list_installed_image ;\
-                                buildhistory_get_image_installed ; "
-
-IMAGE_POSTPROCESS_COMMAND += " buildhistory_get_imageinfo ; "
+ROOTFS_POSTUNINSTALL_COMMAND += "buildhistory_list_installed_image ;"
+ROOTFS_POSTUNINSTALL_COMMAND += "buildhistory_get_image_installed ;"
+ROOTFS_POSTUNINSTALL_COMMAND[vardepvalueexclude] .= "| buildhistory_list_installed_image ;| buildhistory_get_image_installed ;"
+ROOTFS_POSTUNINSTALL_COMMAND[vardepsexclude] += "buildhistory_list_installed_image buildhistory_get_image_installed"
+
+IMAGE_POSTPROCESS_COMMAND += "buildhistory_get_imageinfo ;"
+IMAGE_POSTPROCESS_COMMAND[vardepvalueexclude] .= "| buildhistory_get_imageinfo ;"
+IMAGE_POSTPROCESS_COMMAND[vardepsexclude] += "buildhistory_get_imageinfo"
 
 # We want these to be the last run so that we get called after complementary package installation
 POPULATE_SDK_POST_TARGET_COMMAND_append = " buildhistory_list_installed_sdk_target;"

base-commit: d68a86d87aa017dd0fecb0f626d22711efefcd3f
-- 
git-series 0.9.1

