Return-Path: <ross.burton@intel.com>
Received: from mail-wr0-f170.google.com (mail-wr0-f170.google.com
	[209.85.128.170])
	by mail.openembedded.org (Postfix) with ESMTP id 3ECCC77E3E
	for <openembedded-core@lists.openembedded.org>;
	Thu, 13 Apr 2017 22:31:28 +0000 (UTC)
Received: by mail-wr0-f170.google.com with SMTP id l28so43225630wre.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 13 Apr 2017 15:31:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id;
	bh=voOo+DBv7LRZxfoYdYBbirm/f70XSeCw1zIvqySYk2k=;
	b=c2VfDJeK0xK+t8miHRCTm5JbB2rusqxJ2+BJinME7lCIf9IoQXi4/rlrnxCxA5kFQt
	zM+JSe788qDcbbWWBgYHsr7L09TT7p0GIhKZBeVCEkfxdfF8b3mbGtSk4D0NESTFQ1QZ
	3FETCOkAeAbY6sAQNkCQDh2Yw2ldK+/6brcY7iWWlpQChuARWKh6JpTXRehMcSsDgmUi
	AynVesukTniKYjPopnulYJ8FjhGEKwmOnwJqOek37lfb4Ct3gBYdI+/sQ0P+5oHuh48o
	bDptCf2ngQrNAaNfcUfEz73WSnfEXHq9Z1yNN1SsUg1MzZZKwO5pDFDVn3a+PNfOJaff
	4RMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=voOo+DBv7LRZxfoYdYBbirm/f70XSeCw1zIvqySYk2k=;
	b=JyXO2eJDQ4p5ryoQ4veuTLL/U4GKNm6SqPth3IPyU9iRKNLFfKjTxhU2s7sWHd+w7Q
	pS4Boed2QYOE7WitTlmdkXITOBbwOt1oeJG4Xy018KbQ0y8p1zyTCj4cNNkmKbQeKH5d
	2E2ODi6/SuxrOtmhlzlVZr/x5C5FTWWJTTzrFv7Fr74RyNNUpb+yuHViKYnShFLhP/uj
	5akZphQnRWK1auAFQiCZOvZyzf4bN/paW0+Bwv5bPXi8nrxWStCOA8QEXBk3gVLOK/DF
	P2R9cJt3LY3XcRvgCeKr9JEpRW2sFH8mYRszpG2SF3aqeOkQK0McKs8l4FRuZB+31/B0
	ubFg==
X-Gm-Message-State: AN3rC/5iLDI4AYtidQp+SWGrhctz7dPDXWa0CS/OTTphdGPI7Gpz4asN
	Gy/Ej9h2Iq61UfYAJ5o=
X-Received: by 10.223.176.202 with SMTP id j10mr5292351wra.10.1492122689739;
	Thu, 13 Apr 2017 15:31:29 -0700 (PDT)
Received: from flashheart.burtonini.com (home.burtonini.com. [81.2.106.35])
	by smtp.gmail.com with ESMTPSA id s82sm440460wmb.33.2017.04.13.15.31.28
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 13 Apr 2017 15:31:29 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 13 Apr 2017 23:31:27 +0100
Message-Id: <1492122687-30687-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 2.8.1
Subject: [PATCH] Revert "dnf: remove systemd units in nativesdk builds"
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
X-List-Received-Date: Thu, 13 Apr 2017 22:31:29 -0000

nativesdk builds now control the DISTRO_FEATURES (oe-core 731744) so this
workaround is no longer required.

This reverts commit 415b72ffcbd26e5f3664370d8b2a9b8105fb6342.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-devtools/dnf/dnf_git.bb | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/meta/recipes-devtools/dnf/dnf_git.bb b/meta/recipes-devtools/dnf/dnf_git.bb
index 1194928..9f814fb 100644
--- a/meta/recipes-devtools/dnf/dnf_git.bb
+++ b/meta/recipes-devtools/dnf/dnf_git.bb
@@ -42,12 +42,6 @@ do_install_append_class-native() {
                 RPM_NO_CHROOT_FOR_SCRIPTS=1
 }
 
-# If the distro uses systemd then these won't be deleted by systemd.bbclass
-do_install_append_class-nativesdk() {
-    rm -rf ${D}/${systemd_unitdir}
-    rmdir --ignore-fail-on-non-empty ${D}${nonarch_base_libdir}
-}
-
 SYSTEMD_SERVICE_${PN} = "dnf-makecache.service dnf-makecache.timer \
                          dnf-automatic-download.service dnf-automatic-download.timer \
                          dnf-automatic-install.service dnf-automatic-install.timer \
-- 
2.8.1


