Return-Path: <tgamblin@baylibre.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 53F93EB64DA
	for <webhook@archiver.kernel.org>; Tue, 11 Jul 2023 01:11:15 +0000 (UTC)
Received: from mail-qk1-f177.google.com (mail-qk1-f177.google.com [209.85.222.177])
 by mx.groups.io with SMTP id smtpd.web11.66.1689037869906850268
 for <openembedded-core@lists.openembedded.org>;
 Mon, 10 Jul 2023 18:11:10 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@baylibre-com.20221208.gappssmtp.com header.s=20221208 header.b=HKfkfO5u;
 spf=pass (domain: baylibre.com, ip: 209.85.222.177, mailfrom: tgamblin@baylibre.com)
Received: by mail-qk1-f177.google.com with SMTP id af79cd13be357-766fd5f9536so364930885a.3
        for <openembedded-core@lists.openembedded.org>; Mon, 10 Jul 2023 18:11:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20221208.gappssmtp.com; s=20221208; t=1689037868; x=1691629868;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=EasQTo+uwQ3baBwr6N9+zYlt59fY+ncJcleLHE488yM=;
        b=HKfkfO5uwpaRcoxhx+ZaCuD6veTFuFpBRcIFh/2YNBPWUunFzySyyUeUIJbZFRRMQe
         niCxe+eFUDSEdNWY9ZGjq1lKIJtq0SoFn6Damv+nAo74PJLgekHrviqP7Za1kYUGUySn
         0pS8wO9U319P2j8tGUOuXmsiBR3HWtDN8v4ITKj85Pta0mfOnfUIuzUVQ4L/QHPmxTSX
         8g7ieHXqvBRA7rMrpDj+8wJxKZbtCEMSQj4HI3rPUvkIsG7AxewBimeIHq28H+NszYPO
         +m4ftHRJErvvFQZdHGFlVx6073u6xR0SROyuli/zzaOGD/+YOhnlsVw7X7QeLch9x2Xf
         N2bA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689037868; x=1691629868;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=EasQTo+uwQ3baBwr6N9+zYlt59fY+ncJcleLHE488yM=;
        b=dEX0pjJqgux/jfeHCb3XCxUCDnNTjJEUU98RkrD+iLwQkGXeeUUU04TGbigsKm56+U
         vD5bLMHj8zADgvxpaV0NlsLEIiDd1DwvRzANHyp/ISVfZrB/MHtd4hPNWrHcEPN0SKFb
         5tDDPqiNmx5i2Kz7bFSUHxrE2J0JaOAMRdA9iMuB4iAnJ2cpbObmQDJUf89Unt0b5hXL
         PanB59jUTXPSv6A5zeGQgQYPvFrIr/+o3d2sx0t61ByWlaYNUj12QRJq5Hhlr9qfxcQr
         oRK6u4CYpBE9fHH+6KRdQymZ8mbaAf6+c3o4JQThqF/6U4lcEsnFmf7rAtY4MN56P9nV
         skSA==
X-Gm-Message-State: ABy/qLbw1t0Jb/bZOGvS3WJe+6FpyUpGMRMU09qpm58v1TOiswA2vyTQ
	Y22Snhf6crmPRWmeeLmoZsZWy8iY458Gpds7N1c=
X-Google-Smtp-Source: APBJJlH1XKyYZrOaYGmaZu6d+oLQ36cutUBd1mi6Motrc+rohKSKic1MWboaQ/MMakpZDOxNk47Tgg==
X-Received: by 2002:a05:620a:40c5:b0:765:3ab9:df8d with SMTP id g5-20020a05620a40c500b007653ab9df8dmr15847160qko.32.1689037868423;
        Mon, 10 Jul 2023 18:11:08 -0700 (PDT)
Received: from megalith.cgocable.net ([2001:1970:5b1f:ab00:fc4e:ec42:7e5d:48dd])
        by smtp.gmail.com with ESMTPSA id h22-20020a05620a13f600b00767765561afsm427936qkl.106.2023.07.10.18.11.06
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Jul 2023 18:11:07 -0700 (PDT)
From: Trevor Gamblin <tgamblin@baylibre.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][PATCH 1/3] python3-pylibfdt: add recipe
Date: Mon, 10 Jul 2023 21:11:02 -0400
Message-ID: <20230711011104.2807078-1-tgamblin@baylibre.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 11 Jul 2023 01:11:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/184109

This is required by python3-dtschema (already in oe-core) and
likely some other modules, so add the recipe.

Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
---
 .../python/python3-pylibfdt_1.6.1.bb             | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)
 create mode 100644 meta/recipes-devtools/python/python3-pylibfdt_1.6.1.bb

diff --git a/meta/recipes-devtools/python/python3-pylibfdt_1.6.1.bb b/meta/recipes-devtools/python/python3-pylibfdt_1.6.1.bb
new file mode 100644
index 0000000000..9dd01a1449
--- /dev/null
+++ b/meta/recipes-devtools/python/python3-pylibfdt_1.6.1.bb
@@ -0,0 +1,16 @@
+SUMMARY = "Python binding for libfdt"
+HOMEPAGE = "https://pypi.org/project/pylibfdt/"
+LICENSE = "BSD-2-Clause & GPL-2.0-or-later"
+LIC_FILES_CHKSUM = "file://GPL;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
+                    file://BSD-2-Clause;md5=5d6306d1b08f8df623178dfd81880927"
+
+inherit pypi python_setuptools_build_meta
+
+PYPI_PACKAGE = "pylibfdt"
+
+SRC_URI[sha256sum] = "90c667c5adf44c6ab2f13bdc566598897784c7b781bed91064e7373bd270b778"
+
+BBCLASSEXTEND = "native nativesdk"
+
+DEPENDS += "python3-setuptools-scm-native swig-native"
+
-- 
2.41.0


