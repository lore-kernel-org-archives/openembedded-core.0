Return-Path: <derek@asterius.io>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1C504C04FFA
	for <webhook@archiver.kernel.org>; Wed, 20 Sep 2023 20:07:11 +0000 (UTC)
Received: from mail-io1-f53.google.com (mail-io1-f53.google.com [209.85.166.53])
 by mx.groups.io with SMTP id smtpd.web11.6079.1695240425114538344
 for <openembedded-core@lists.openembedded.org>;
 Wed, 20 Sep 2023 13:07:05 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: gmail.com, ip: 209.85.166.53, mailfrom: straka.derek@gmail.com)
Received: by mail-io1-f53.google.com with SMTP id ca18e2360f4ac-794d98181f0so9881739f.2
        for <openembedded-core@lists.openembedded.org>; Wed, 20 Sep 2023 13:07:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695240424; x=1695845224;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2ZXFHM9e8GBJd0T5IP6M+WjnMcL4uZQG2dw6pVrtK4E=;
        b=f9fvmKRVqA244e8Q2/4lqLMhjFwO4wKA9cjemlI9ojYhObPWO4Y8erYGxHkExhyX/+
         OFcLqNUOfzeGLQEYt7b92lwUKNSR1SLDdYg/WgfoO7MXJL81OEzcRsAdOBe/+Prh0poB
         NdbimiEj5pu4IZPOY+/CYbq6EhEfGFQ9YIIbe1NCJyHREkRYLX+VLHx62GnR+PkNiCPD
         gqCqFDdSdhB8NEEQf5JBEQ7Jab8yYJJ7OvCw4y/ZzvXyR2rI0VXYyi3L03mcIG6E9q3e
         aHVPT/32xVtMJZqKA8X7QKLbAWjf9GXh6JdN7WjVrOHqfJGmFTZ0O0DTXRVstlkKuFvi
         Schg==
X-Gm-Message-State: AOJu0YxYDU4lLF4yiI9DfuItHwwUiaY3ReM9aQJAqUENcDx0qnq54jwm
	EgKkemgCPIOlmbN7aR8rONTqIKr9PU8jmg==
X-Google-Smtp-Source: AGHT+IFd4rk4LItcCgaddcUczYftkDbB8S9oXKVvS/fKYQ4XhNcC6+J1MQMoFCyf7ID13UCrSws++A==
X-Received: by 2002:a5e:890c:0:b0:787:8fc:75d8 with SMTP id k12-20020a5e890c000000b0078708fc75d8mr3855796ioj.9.1695240423952;
        Wed, 20 Sep 2023 13:07:03 -0700 (PDT)
Received: from sparta.internal.asterius.io (c-73-228-213-122.hsd1.mn.comcast.net. [73.228.213.122])
        by smtp.gmail.com with ESMTPSA id f18-20020a02a812000000b0042b10d42c90sm4097770jaj.113.2023.09.20.13.07.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Sep 2023 13:07:03 -0700 (PDT)
From: Derek Straka <derek@asterius.io>
To: openembedded-core@lists.openembedded.org
Cc: Derek Straka <derek@asterius.io>
Subject: [PATCH] pypi.bbclass: Update the upstream checks to automatically replace '_' with '-'
Date: Wed, 20 Sep 2023 20:06:29 +0000
Message-Id: <20230920200629.1363788-1-derek@asterius.io>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 20 Sep 2023 20:07:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/187942

For a number of existing packages, the pypi URI contains '-', but the package name (PYPI_PACKAGE) uses '_'.  Add a simple replace for the UPSTREAM_CHECK_URI and UPSTREAM_CHECK_REGEX.  The change resulted in 19 additional auto-detected upstream checks for python packages meta-python.

It did break upstream checks for 3 packages that will be patched shortly:
 - python3-ipython-genutils
 - python3-ninja-syntax
 - python3-wpa-supplicant

Signed-off-by: Derek Straka <derek@asterius.io>
---
 meta/classes-recipe/pypi.bbclass | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/meta/classes-recipe/pypi.bbclass b/meta/classes-recipe/pypi.bbclass
index f510bfed06..b8c18ccf39 100644
--- a/meta/classes-recipe/pypi.bbclass
+++ b/meta/classes-recipe/pypi.bbclass
@@ -30,7 +30,9 @@ SECTION = "devel/python"
 SRC_URI:prepend = "${PYPI_SRC_URI} "
 S = "${WORKDIR}/${PYPI_PACKAGE}-${PV}"
 
-UPSTREAM_CHECK_URI ?= "https://pypi.org/project/${PYPI_PACKAGE}/"
-UPSTREAM_CHECK_REGEX ?= "/${PYPI_PACKAGE}/(?P<pver>(\d+[\.\-_]*)+)/"
+# Replace any '_' characters in the pypi URI with '-'s to follow the PyPi website naming conventions
+UPSTREAM_CHECK_PYPI_PACKAGE ?= "${@d.getVar('PYPI_PACKAGE').replace('_', '-')}"
+UPSTREAM_CHECK_URI ?= "https://pypi.org/project/${UPSTREAM_CHECK_PYPI_PACKAGE}/"
+UPSTREAM_CHECK_REGEX ?= "/${UPSTREAM_CHECK_PYPI_PACKAGE}/(?P<pver>(\d+[\.\-_]*)+)/"
 
 CVE_PRODUCT ?= "python:${PYPI_PACKAGE}"
-- 
2.34.1


