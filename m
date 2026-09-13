Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C0CE4C88E65
	for <webhook@archiver.kernel.org>; Sun, 13 Sep 2026 20:12:15 +0000 (UTC)
Received: from mail-wr2-f12.google.com (mail-wr2-f12.google.com [74.125.225.76])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.5897.1789330329309064964
 for <openembedded-core@lists.openembedded.org>;
 Sun, 13 Sep 2026 13:12:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=J/twc8GL;
 spf=pass (domain: linuxfoundation.org, ip: 74.125.225.76, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr2-f12.google.com with SMTP id ffacd0b85a97d-4843c3ea1f6so503369f8f.0
        for <openembedded-core@lists.openembedded.org>; Sun, 13 Sep 2026 13:12:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1789330327; x=1789935127; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=41wvxuhG2xTDmm5MLVxvYmMySdcAp6oAEqbTqyMPa9o=;
        b=J/twc8GLpnkExxv8P+4GBhmpvtT+Ez1F9SUVPG4khyNH+A0ce/L92Ns2ItW1seesSo
         3J+Fvtk/Gc4i8DPZKxaHiZgmBXM8jdTKNYe7mATIcpcZCAC/A8QvM8mGnMELJHxike/O
         wtvhFLk5YWuP36bT/emNlNY8jSY5gpIa6lRlA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789330327; x=1789935127;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=41wvxuhG2xTDmm5MLVxvYmMySdcAp6oAEqbTqyMPa9o=;
        b=VeTGq0/ZV8Lzp5wW1x4Q2VBetZ+9peBgK6IUgTHh6vm5l2lCEUh5QYeCN5ii/mIk48
         Xf/2W8cBFQcJtG7AEFHh79Vz003oSpOq8IDiUA783JebQaOtrThFg5IktxSGgrbv5r+7
         kjPoh6eBNyWlaJ/G4chDUSp9fyxSOPvhq6U/6S5Dk+rMUd1MHLpi7sGdhkEwf0GIH+Uq
         y74vHFsxA9BvKQNBKaxVVgCKbbfrLSSVG4gFOR9jvaONerkYG0wVMlGxjB88X6imH5zd
         T9Ru+plDcI3js/QxV6Bp4Q0tsVmqTFSy7d+WC+ktSSKjbqQkQw4hw+0mH3mhD0l3XIc7
         2mPw==
X-Gm-Message-State: AFuF++nud6LZ31xhS/VbFQiFf72VniGkV8JSM99q7KW+gUuivbO8d7Ms
	fsLJZPL/z9I6WAw24nPYpAdLkers5Rt+kM5PdkRnAajc2CyGldHD/oBWUHa7IAyUhwdpVIDXdq2
	v6kIoM30=
X-Gm-Gg: AYBFou2XFrAnouXTDKzold+rdNcrBdUo8Yq+faw05ps4WOuF9EH637hsG6vzN8/ltUR
	zWSyNNhgAmI7DnlZEFtPwNtpK1C/omCSCyH0mhK8d0zwfp50xFXvzLjq0xaZ2wwavpjekP/8Ff0
	jH9k0EV5LgQtlyUs+y0AYXaLftn21iMn2dnf2tOsFyfc1TCn3KYSByZwGWWcDoO5NIbTHdBKrKu
	eo0WEcDkhaJHnOZQKJ82ONTseOPn1WDipLL2A7187svTLCCt9PtDIKaywv8F/Do2X3AsZb+74mD
	wncAkaOG5NL95tQxBXjT1rI5bdx1YdGFtp0zngVW9+sgk8GYPskj0jc/ghCLnVV12cvNOY45+OX
	0SNj1AU0lYXKOxzxLIduNTNIEygYvLNxNFYrTyavP7JXg9Kn+zo0pBU+WKEFCZicfpFxTb/MIpZ
	DWJhiBi4n3WWrky6/hacqBaGhz8ZFmg1F3P2piOFZF0IlBRLj09Syc+h3Lg7ubzOyjFmRAyCaIu
	TGmc9KBBAVeslo+IrqHPjV1SVUp
X-Received: by 2002:a05:6000:25c7:b0:485:ac3b:4a79 with SMTP id ffacd0b85a97d-486f6d4b3f4mr6901321f8f.43.1789330327524;
        Sun, 13 Sep 2026 13:12:07 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:16aa:3c0b:49da:7be3])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-486eb33fd3bsm21613916f8f.19.2026.09.13.13.12.06
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Sep 2026 13:12:06 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 06/11] sbom-cve-check-update-{nvd-native,cvelist-native}: upgrade 2026.08.25 -> 2026.09.12
Date: Sun, 13 Sep 2026 21:11:53 +0100
Message-ID: <20260913201158.687889-6-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260913201158.687889-1-richard.purdie@linuxfoundation.org>
References: <20260913201158.687889-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 13 Sep 2026 20:12:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/245733

Update to newer database versions.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 ...25.bb => sbom-cve-check-update-cvelist-native_2026-09-12.bb} | 2 +-
 ...bb => sbom-cve-check-update-nvd-native_2026.09.12-000023.bb} | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-devtools/sbom-cve-check/{sbom-cve-check-update-cvelist-native_2026-08-25.bb => sbom-cve-check-update-cvelist-native_2026-09-12.bb} (89%)
 rename meta/recipes-devtools/sbom-cve-check/{sbom-cve-check-update-nvd-native_2026.08.25-000009.bb => sbom-cve-check-update-nvd-native_2026.09.12-000023.bb} (89%)

diff --git a/meta/recipes-devtools/sbom-cve-check/sbom-cve-check-update-cvelist-native_2026-08-25.bb b/meta/recipes-devtools/sbom-cve-check/sbom-cve-check-update-cvelist-native_2026-09-12.bb
similarity index 89%
rename from meta/recipes-devtools/sbom-cve-check/sbom-cve-check-update-cvelist-native_2026-08-25.bb
rename to meta/recipes-devtools/sbom-cve-check/sbom-cve-check-update-cvelist-native_2026-09-12.bb
index 75b2ad8257f..b29be0d46f6 100644
--- a/meta/recipes-devtools/sbom-cve-check/sbom-cve-check-update-cvelist-native_2026-08-25.bb
+++ b/meta/recipes-devtools/sbom-cve-check/sbom-cve-check-update-cvelist-native_2026-09-12.bb
@@ -6,7 +6,7 @@ HOMEPAGE = "https://github.com/CVEProject/cvelistV5"
 SRC_URI = "git://github.com/CVEProject/cvelistV5.git;branch=main;protocol=https;destsuffix=;tag=${PV}_baseline"
 SBOM_CVE_CHECK_DB_NAME = "cvelist"
 
-SRCREV = "ce11dbdcf79189e965d64b29161af93993619281"
+SRCREV = "9b9889cfd98306bf29b91df076c5118aae80b63f"
 UPSTREAM_CHECK_GITTAGREGEX = "(?P<pver>.+)_baseline"
 
 require sbom-cve-check-update-db.inc
diff --git a/meta/recipes-devtools/sbom-cve-check/sbom-cve-check-update-nvd-native_2026.08.25-000009.bb b/meta/recipes-devtools/sbom-cve-check/sbom-cve-check-update-nvd-native_2026.09.12-000023.bb
similarity index 89%
rename from meta/recipes-devtools/sbom-cve-check/sbom-cve-check-update-nvd-native_2026.08.25-000009.bb
rename to meta/recipes-devtools/sbom-cve-check/sbom-cve-check-update-nvd-native_2026.09.12-000023.bb
index 43f077e267f..70e09050b97 100644
--- a/meta/recipes-devtools/sbom-cve-check/sbom-cve-check-update-nvd-native_2026.08.25-000009.bb
+++ b/meta/recipes-devtools/sbom-cve-check/sbom-cve-check-update-nvd-native_2026.09.12-000023.bb
@@ -6,7 +6,7 @@ HOMEPAGE = "https://github.com/fkie-cad/nvd-json-data-feeds"
 SRC_URI = "git://github.com/fkie-cad/nvd-json-data-feeds.git;branch=main;protocol=https;destsuffix=;tag=v${PV}"
 SBOM_CVE_CHECK_DB_NAME = "nvd-fkie"
 
-SRCREV = "08cb7bde86fe9057c2338d7d61a705e642775bfd"
+SRCREV = "82336c26ab85706ae56efaa36ef5851ab92dd32c"
 UPSTREAM_CHECK_GITTAGREGEX = "v(?P<pver>.+)"
 
 require sbom-cve-check-update-db.inc

