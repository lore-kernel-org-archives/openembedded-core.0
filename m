Return-Path: <ross.burton@intel.com>
Received: from mail-wr0-f176.google.com (mail-wr0-f176.google.com
	[209.85.128.176])
	by mail.openembedded.org (Postfix) with ESMTP id CD34078255
	for <openembedded-core@lists.openembedded.org>;
	Mon, 12 Jun 2017 19:07:58 +0000 (UTC)
Received: by mail-wr0-f176.google.com with SMTP id g76so106956723wrd.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 12 Jun 2017 12:08:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id;
	bh=hIclBL3ewL5R1OjcVYzuonl3+rmFfxrTpRJwStF5DcQ=;
	b=RsSmumn/pUIynOOWrLw8v/4pKBIOi5XcADlmKolSDzHc0MPnRPKLyLeaLCDeOZMSUx
	OFRVSFBBdqIOM8WtJVM4kl5uUuTcKHrNrgImjQe7XFAKW1pAkz7m4yn/j3fbkX5dBvW1
	/oGc+u0jAZFIeFZdk2qsNiRfNPwSHxfqSulJBE+uiKe1dscZSZ7xxhTHdqwbo+A9bs0V
	CGO8RpaFV/qz5jERoPOVMIx5lg5dKkDvkVtc+oI9BHAJ7Sq9JxDDanQvfMG69NuPGrvi
	Ob5KwXyfzyZhQIaA4o3gz6Jz6gLHOWpcGl4rJnZb/ae7YAQjECcyAoCHI9QS/I5KjPgQ
	sdqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=hIclBL3ewL5R1OjcVYzuonl3+rmFfxrTpRJwStF5DcQ=;
	b=qe/4nHOHVot9Q6Mah/D7PUZoEe6buqbddYDjQSvPPu2v9fFyxcUqbxnGE8c8lXQIh0
	wYc5tiWTtPrdHUDs9h9YMbZkG0HC2WBT9ZZc9Q4U4n5CnLczaGptESkNCDDSjABxvoM3
	1op+kBK3SZtF+jfNDS/bZkoqjxycwCihIR7nHjnNEaJ42OB46R+Scev9Z2t7pkk7C87F
	FwPBuj2W3wVfkGTcBakJyg/W/wO/MeA2bCq7YGQ/2X6kr6k55jf0EsippvOCNgh/22FM
	7IH5e1NM6xmDuWBlK5T5ShtXRfI6iwHmp6lnxKBYxDqybBHryjerzME23aCwq1h192cc
	yHcQ==
X-Gm-Message-State: AKS2vOxRqFSmi4bFDE1MvDbo+HG1cc2kNWvxc3bFXNX1IcRRhRIaM6BQ
	a2SUYor6JonmV1tiLgs=
X-Received: by 10.223.133.181 with SMTP id 50mr312175wrt.27.1497294478148;
	Mon, 12 Jun 2017 12:07:58 -0700 (PDT)
Received: from flashheart.burtonini.com (home.burtonini.com. [81.2.106.35])
	by smtp.gmail.com with ESMTPSA id
	l16sm6773997wre.25.2017.06.12.12.07.57
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 12 Jun 2017 12:07:57 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 12 Jun 2017 20:07:56 +0100
Message-Id: <1497294476-22590-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 2.8.1
Subject: [PATCH] linux-firmware: don't package check_whence.py
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
X-List-Received-Date: Mon, 12 Jun 2017 19:07:59 -0000

There's no need for this script on the target, and now that rpmdeps is fixed the
QA code wants a dependency on Python in the firmware package, which clearly
isn't appropriate.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-kernel/linux-firmware/linux-firmware_git.bb | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta/recipes-kernel/linux-firmware/linux-firmware_git.bb b/meta/recipes-kernel/linux-firmware/linux-firmware_git.bb
index 4558daf..316d674 100644
--- a/meta/recipes-kernel/linux-firmware/linux-firmware_git.bb
+++ b/meta/recipes-kernel/linux-firmware/linux-firmware_git.bb
@@ -672,6 +672,10 @@ FILES_${PN} += "${nonarch_base_libdir}/firmware/*"
 RDEPENDS_${PN} += "${PN}-license"
 RDEPENDS_${PN} += "${PN}-whence-license"
 
+do_install_append() {
+	rm ${D}${nonarch_base_libdir}/firmware/check_whence.py
+}
+
 # Make linux-firmware depend on all of the split-out packages.
 # Make linux-firmware-iwlwifi depend on all of the split-out iwlwifi packages.
 python populate_packages_prepend () {
-- 
2.8.1


