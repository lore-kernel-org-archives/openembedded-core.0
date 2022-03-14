Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 50304C433F5
	for <webhook@archiver.kernel.org>; Mon, 14 Mar 2022 22:48:47 +0000 (UTC)
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com
 [209.85.128.53])
 by mx.groups.io with SMTP id smtpd.web08.3429.1647298125955196424
 for <openembedded-core@lists.openembedded.org>;
 Mon, 14 Mar 2022 15:48:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=IlLbQr/R;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.53,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f53.google.com with SMTP id
 n33-20020a05600c3ba100b003832caf7f3aso603841wms.0
        for <openembedded-core@lists.openembedded.org>;
 Mon, 14 Mar 2022 15:48:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=cshlyshJgVncbb9xaxAQmo2bmb0CPWBrZgt6KS19cWM=;
        b=IlLbQr/RLYIgdqAmdpM2RUNbcHuH8cpOCCmnno+ezXY+mw01KJdPkpG/J8603mJSI/
         Ooq8GVvKr0YOuxJI3bMmez5h2coQtxrUEWrjCDn5Q/lO3JIaLkvUp84jRM1J4/IJFU2G
         jhZ4kwMopgG2KjujiZ1QsfwcRyy2YmVI7/fz4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=cshlyshJgVncbb9xaxAQmo2bmb0CPWBrZgt6KS19cWM=;
        b=gu55pl1jK8MMtXjOFdEEaO+eubjNTMNsgD67lNt1LMnFeucORFPWbjEvjEEQZhbEBa
         gUApuJ03uiZcWW+8CIRuUtdN3QuH7OoY3iN3azkOgrf7KPf8ZQNfy4KvWIVpPHwX+1VI
         cv6Qbkbx6KiRqErDSsre914is/myAnmCXZkon4n+hYLCB9W3UyHI7ehhpavzXZRDF/ig
         H+VtY1auChdBVUwldUOy8Nw06dtaAo+ihFHIGrGQRP1h5A60o22CBVdUHPg/g/q5Npn7
         OZib1WeFIsjCnnXqvuq+5+GxKJxjp2BU6soeF/4FmgjURF+GAt7OujbTkSkzahzSnJ6E
         rjKw==
X-Gm-Message-State: AOAM531aP9PUOwfz4CGkS9sb3GtwZ7IJCv7DmazKtmzaLqGx/9BNoK3Z
	aTUwdRqJoaX1ARNFaCOzJ59icjUtWx73Xy1N
X-Google-Smtp-Source: 
 ABdhPJyCm4z4NLvU8SxAe+bnwkomC1X/MIDfmpYATQNjlTzUMh3Pgg+RUBHfwtrzWcNY3GyHHdaB9w==
X-Received: by 2002:a05:600c:507:b0:389:9f23:99e7 with SMTP id
 i7-20020a05600c050700b003899f2399e7mr957863wmc.175.1647298124243;
        Mon, 14 Mar 2022 15:48:44 -0700 (PDT)
Received: from hex.int.rpsys.net ([2001:8b0:aba:5f3c:9098:b3d5:8fee:ea58])
        by smtp.gmail.com with ESMTPSA id
 bg18-20020a05600c3c9200b0037c2ef07493sm788599wmb.3.2022.03.14.15.48.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Mar 2022 15:48:43 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Cc: Tim Orling <tim.orling@konsulko.com>
Subject: [PATCH 06/33] python3-pytest-subtests: move from meta-python
Date: Mon, 14 Mar 2022 22:48:10 +0000
Message-Id: <20220314224837.834776-6-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220314224837.834776-1-richard.purdie@linuxfoundation.org>
References: <20220314224837.834776-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 14 Mar 2022 22:48:47 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/163172

From: Tim Orling <tim.orling@konsulko.com>

Dependency for python3-cryptography ptest.

Signed-off-by: Tim Orling <tim.orling@konsulko.com>
---
 .../python/python3-pytest-subtests_0.6.0.bb   | 20 +++++++++++++++++++
 1 file changed, 20 insertions(+)
 create mode 100644 meta/recipes-devtools/python/python3-pytest-subtests_0.6.0.bb

diff --git a/meta/recipes-devtools/python/python3-pytest-subtests_0.6.0.bb b/meta/recipes-devtools/python/python3-pytest-subtests_0.6.0.bb
new file mode 100644
index 00000000000..5e4847b8d94
--- /dev/null
+++ b/meta/recipes-devtools/python/python3-pytest-subtests_0.6.0.bb
@@ -0,0 +1,20 @@
+SUMMARY = "unittest subTest() support and subtests fixture."
+DESCRIPTION = "Adds support for TestCase.subTest.\
+New subtests fixture, providing similar functionality for pure pytest tests."
+HOMEPAGE = "https://github.com/pytest-dev/pytest-subtests"
+BUGTRACKER = "https://github.com/pytest-dev/pytest-subtests/issues"
+
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=242b4e17fa287dcf7aef372f6bc3dcb1"
+
+SRC_URI[sha256sum] = "3ebd306a8dcf75133f1742f288c82f36426ebcf8a132d4ee89782d20e84fc13a"
+
+inherit pypi setuptools3
+
+DEPENDS += "${PYTHON_PN}-setuptools-scm-native"
+
+RDEPENDS:${PN} += " \
+    ${PYTHON_PN}-pytest \
+"
+
+BBCLASSEXTEND = "native nativesdk"
-- 
2.32.0


