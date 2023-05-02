Return-Path: <tgamblin@baylibre.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3FD4CC77B73
	for <webhook@archiver.kernel.org>; Tue,  2 May 2023 12:31:00 +0000 (UTC)
Received: from mail-qt1-f171.google.com (mail-qt1-f171.google.com [209.85.160.171])
 by mx.groups.io with SMTP id smtpd.web10.127638.1683030656115923618
 for <openembedded-core@lists.openembedded.org>;
 Tue, 02 May 2023 05:30:56 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@baylibre-com.20221208.gappssmtp.com header.s=20221208 header.b=2vIhc6uz;
 spf=pass (domain: baylibre.com, ip: 209.85.160.171, mailfrom: tgamblin@baylibre.com)
Received: by mail-qt1-f171.google.com with SMTP id d75a77b69052e-3ef38864360so40642421cf.2
        for <openembedded-core@lists.openembedded.org>; Tue, 02 May 2023 05:30:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20221208.gappssmtp.com; s=20221208; t=1683030655; x=1685622655;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=FJOpxCWdWuxj7Zmq84M8PeUCOCN/2e1OCgYcDrHcQy0=;
        b=2vIhc6uzkgTWgUIt76qBpPobxplSSp3d+agAWPoxHWWR8ygYR81sdPWZRwugmmA13W
         CVRFe8iUuddxHCGXt24bZFleEajbeAqLd+2pfbZ77bbmYpHmKBQdZHNsIPSFS1rr/lY7
         U+ktkt8rOlsgU2Xg4R3N8Bcfu4nQXgc+Lz9gcRROztCpjngThyNiZErxsOd3bbV6BGl2
         ntPwfLfR/U1KKndVADDppETN1HeP9M6qPDJeD/ASumsA8yf+aE/pJ+A60VnvppDNvxb7
         d+mDTn3EI0Fbf4wuduuvJHBruwS7CoVuG9rtO7AEOzXraC0jitswO32L2thEXTffVvRv
         u23w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683030655; x=1685622655;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=FJOpxCWdWuxj7Zmq84M8PeUCOCN/2e1OCgYcDrHcQy0=;
        b=FX2uV4OHucE5a5+dDnanKAModo2aoy2rYMcunDeFyk8ItiRuidJSDsOjGuaUzpvDX3
         Mlk+ufMO3iN1dy7lM/B0mrM5PpQ7CALT460xeBZRAmka4THSgvBX12C4VSe/AfuK5BCu
         EO+UA0YoEELJqO2M6kWEo7w7BrZzXratesr3xyvXOphcgyeU2vM2IbuTwaabLTejEymq
         1LxEHSgSEO4d+FJEfmw4vCKPnBp7HQZTljsKBARGxh8Ps6Gxu7pNIPXSX2lhVLwPSdop
         2kWR9kwjkAQC7Clfax5Ef479M4h6mOyDvCzyXd9PD2R2eG58uzTGPX4aZLtzyE+REa6P
         Hjwg==
X-Gm-Message-State: AC+VfDwdoqS2a0m6drQkjaLxaxT3ew1hPg9LYOw5NCg05pW5dpyiomgY
	RHlcYRkXLp+cz/uwv3Dnr7eH2Bi6K5h7AVgbSyY=
X-Google-Smtp-Source: ACHHUZ54oCaRgedo4Vn0MvVYpfyG/vNJ29FdLcVONXzehh4TC3C0nOFdRZgdWxza6sZQ1oX/Khydug==
X-Received: by 2002:ac8:5b04:0:b0:3ef:5587:9414 with SMTP id m4-20020ac85b04000000b003ef55879414mr22555604qtw.2.1683030654935;
        Tue, 02 May 2023 05:30:54 -0700 (PDT)
Received: from megalith.ht.home (cpe64777de11593-cm64777de11590.cpe.net.cable.rogers.com. [174.115.224.47])
        by smtp.gmail.com with ESMTPSA id h12-20020ac8548c000000b003e38c9a2a22sm10173876qtq.92.2023.05.02.05.30.54
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 May 2023 05:30:54 -0700 (PDT)
From: Trevor Gamblin <tgamblin@baylibre.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][PATCH 1/3] python3-calver: Add recipe
Date: Tue,  2 May 2023 08:30:51 -0400
Message-Id: <20230502123053.604642-1-tgamblin@baylibre.com>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 02 May 2023 12:31:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/180724

calver is "a setuptools extension for automatically defining your Python
package version as a calendar version." It is required for
python3-trove-classifiers (another new recipe), which in turn is
required for the upgrade of python3-hatchling from 1.13.0 to work.

Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
---
 .../python/python3-calver_2022.6.26.bb                 | 10 ++++++++++
 1 file changed, 10 insertions(+)
 create mode 100644 meta/recipes-devtools/python/python3-calver_2022.6.26.bb

diff --git a/meta/recipes-devtools/python/python3-calver_2022.6.26.bb b/meta/recipes-devtools/python/python3-calver_2022.6.26.bb
new file mode 100644
index 0000000000..b4a7472ae3
--- /dev/null
+++ b/meta/recipes-devtools/python/python3-calver_2022.6.26.bb
@@ -0,0 +1,10 @@
+SUMMARY = "Setuptools extension for CalVer package versions"
+HOMEPAGE = "https://github.com/di/calver"
+LICENSE = "Apache-2.0"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57"
+
+SRC_URI[sha256sum] = "e05493a3b17517ef1748fbe610da11f10485faa7c416b9d33fd4a52d74894f8b"
+
+inherit pypi python_setuptools_build_meta
+
+BBCLASSEXTEND = "native nativesdk"
-- 
2.40.0


