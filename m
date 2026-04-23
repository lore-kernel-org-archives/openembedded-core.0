Return-Path: <tgamblin@baylibre.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C3498FDEE2C
	for <webhook@archiver.kernel.org>; Thu, 23 Apr 2026 17:12:54 +0000 (UTC)
Received: from mail-qv1-f46.google.com (mail-qv1-f46.google.com [209.85.219.46])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.2813.1776964373597384344
 for <openembedded-core@lists.openembedded.org>;
 Thu, 23 Apr 2026 10:12:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@baylibre-com.20251104.gappssmtp.com header.s=20251104 header.b=WXYi1mt7;
 spf=pass (domain: baylibre.com, ip: 209.85.219.46, mailfrom: tgamblin@baylibre.com)
Received: by mail-qv1-f46.google.com with SMTP id 6a1803df08f44-8a016799d2cso77119056d6.1
        for <openembedded-core@lists.openembedded.org>; Thu, 23 Apr 2026 10:12:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20251104.gappssmtp.com; s=20251104; t=1776964371; x=1777569171; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IiD8WP4zLmw3lIHF67GHLXtte7zL8AFzVfP+rH3Kg4s=;
        b=WXYi1mt7u4XYPHH3hQIErOykQsZkGDQhPlqGikIW4u1qO6jRQ5Nh74VS38/Aua/MS4
         6GCR4aUaZM14Th36PqWvE3a1jWh/ezdMhqcky4ys3qD/cVRD4pGOBThWI9W0MhxN7HG6
         C6nTNk0NsrPTTn1klpsSjKayi3Paah8l3lYHzOAYDN150iJ/TLsQIg2dSnsD2jrSQKIN
         ULO8DFPicR8aDGRU88nX5m37x+/nlVpCFDzoKXNMQCA5st1yrcmOqhZndqwizAK/376E
         Fr6GRGpbCKZRVXJcHYPYUS018+O7BGix6fOAnFeXovckcQogvcD6RhXaP//BrhBIT0RO
         Qc0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776964371; x=1777569171;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=IiD8WP4zLmw3lIHF67GHLXtte7zL8AFzVfP+rH3Kg4s=;
        b=HYXCG28Xiqs+4kEeQSmnV+VWVGp0TX6WUJrUSN3YDHgobjhJEAsMXGHRN+poTGeQeu
         mp8Ek3jz1G7+pM3dtpUaDZu78rHQJv5i1bwMQ3ccYFkLhM/9OXM5VrKqLoP3V+/4x1jn
         M786leiPeVMdVu1YSvEFQXjxHUeFtFMKadzLIIPma41ujqTFcS6SMvwwCeq7JrDOiKXx
         vCGxLsfMMmozpSKky2h3NiPb1h/048jMcIq7Ogp9GtxoIKpBUr53398PP7sndG6LyKeV
         LqcWYn2uUvgrgJXeHI3Tc7v+LUaWzGPlckPZBKZwnlYOFqmxGbB3AHbz0xgo8RztsUOm
         sxXw==
X-Gm-Message-State: AOJu0Yxm8Lor6+mAnYUH/BzVPqYEAuh0F/mrtYfHr4SxcPpmzdU//KN3
	GEZR5rzqlkJ2eppH3AXC1ACIuhx3Kny/BMnL14RiOXGk97V3azxUxYyQQOnJpHpZTK7IE/MGHsq
	nYm3K
X-Gm-Gg: AeBDies99CiL4LOGRbCZUKmt89DfclA6Bj6TKhtgFGh9MTNQVW218u9JNL1LGnvWsqQ
	YaZupxsR6npUaGbyxgmGe7XZSQ+b1RN9mzghvDiDuublwxY0YwRAP9iE22ICd1mA5NJAs/AyXva
	EocBhejzRMHyrYe4Z0vheGlvqYK9pc34CWjCO6JAEbigoEPf1UoKYK1EE4fN9GAMj6OpqCA/BrX
	hlRxZD66sUkw/zI8kBaHQJoUhoF22bdBChI3AefnRJ1cMeDtOnunmPq4RbVCWF3yjPtO0T1wLCy
	37glM4aUFNdqZIc+CAPWepBLTtqxHEMSB2VyzhpCrgK9NLC5b70rDeZY00dwV/fLLpEdMhEKlSM
	Aq8bfN0l9kMwz3pqmWxlD1W1FoIMDup8wM+TP0FcepcuV5JZn52Elx8J2SvC69Covj0XppwbGuI
	ENoKi6cC5HGAswr+gAgugVkdRg3yuS5UPREdcK1w==
X-Received: by 2002:ad4:5c81:0:b0:8ae:6587:3d6c with SMTP id 6a1803df08f44-8b0280eaa5fmr461912616d6.28.1776964371218;
        Thu, 23 Apr 2026 10:12:51 -0700 (PDT)
Received: from localhost ([2001:1970:3847:e000:e8bd:ca0f:c232:9f10])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8b1f5d1002fsm74313676d6.12.2026.04.23.10.12.50
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Apr 2026 10:12:50 -0700 (PDT)
From: Trevor Gamblin <tgamblin@baylibre.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][PATCH 2/4] python3-setuptools-scm: upgrade 9.2.2 -> 10.0.5
Date: Thu, 23 Apr 2026 13:12:44 -0400
Message-ID: <20260423171246.309711-2-tgamblin@baylibre.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260423171246.309711-1-tgamblin@baylibre.com>
References: <20260423171246.309711-1-tgamblin@baylibre.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 23 Apr 2026 17:12:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/235829

Changelog: https://github.com/pypa/setuptools-scm/releases

Note that the releases page also includes notes for the vcs-versioning
module, which is published separately (and which setuptools-scm depends
on). The new python3-vcs-versioning recipe is added to dependency lists.
Also rework the DEPENDS list to match the same formatting as RDEPENDS.

Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
---
 ...tools-scm_9.2.2.bb => python3-setuptools-scm_10.0.5.bb} | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)
 rename meta/recipes-devtools/python/{python3-setuptools-scm_9.2.2.bb => python3-setuptools-scm_10.0.5.bb} (79%)

diff --git a/meta/recipes-devtools/python/python3-setuptools-scm_9.2.2.bb b/meta/recipes-devtools/python/python3-setuptools-scm_10.0.5.bb
similarity index 79%
rename from meta/recipes-devtools/python/python3-setuptools-scm_9.2.2.bb
rename to meta/recipes-devtools/python/python3-setuptools-scm_10.0.5.bb
index d16d79c79f..3e86c4fd2c 100644
--- a/meta/recipes-devtools/python/python3-setuptools-scm_9.2.2.bb
+++ b/meta/recipes-devtools/python/python3-setuptools-scm_10.0.5.bb
@@ -6,13 +6,16 @@ argument or in a SCM managed file."
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=838c366f69b72c5df05c96dff79b35f2"
 
-SRC_URI[sha256sum] = "1c674ab4665686a0887d7e24c03ab25f24201c213e82ea689d2f3e169ef7ef57"
+SRC_URI[sha256sum] = "bbba8fe754516cdefd017f4456721775e6ef9662bd7887fb52ae26813d4838c3"
 
 PYPI_PACKAGE = "setuptools_scm"
 
 inherit pypi python_setuptools_build_meta
 
-DEPENDS += "python3-packaging-native"
+DEPENDS += "\
+    python3-packaging-native \
+    python3-vcs-versioning-native \
+"
 
 RDEPENDS:${PN} = "\
     python3-packaging \
-- 
2.53.0


