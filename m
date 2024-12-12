Return-Path: <derek@asterius.io>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A1CC3E7717F
	for <webhook@archiver.kernel.org>; Thu, 12 Dec 2024 18:56:30 +0000 (UTC)
Received: from mail-il1-f170.google.com (mail-il1-f170.google.com [209.85.166.170])
 by mx.groups.io with SMTP id smtpd.web11.667.1734029790142534733
 for <openembedded-core@lists.openembedded.org>;
 Thu, 12 Dec 2024 10:56:30 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: gmail.com, ip: 209.85.166.170, mailfrom: straka.derek@gmail.com)
Received: by mail-il1-f170.google.com with SMTP id e9e14a558f8ab-3a777958043so3693745ab.2
        for <openembedded-core@lists.openembedded.org>; Thu, 12 Dec 2024 10:56:30 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734029788; x=1734634588;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7xNNNIv7xtJs8nHgSBLU5CP9Gx86oP/GpHu6v+Ve7hI=;
        b=UqFIyI4e4Ftslg5MTpsgaHMClz36fkXUjN0wjUVCEPHrygZNn+BAr1v6j/DabdKfuJ
         7v+i3oGPPU7v1XUuz+/kIz16NVNHiG9UXwhyLDOVnu9zzijn82qkBTmUktb/dK92dmcW
         9umxBXlkiZ72hEYXGMJnB0nQCjZHWy2sMRVXY9N2mF8tKhJQJ6GtzAtGTy/BGV+ksZBS
         AiYvZ+cjIMy8gw93S7+xpVtp6qtbjpjvzNIX0K7Z/LuKjHBGdN4DzVgf3acuJPcqjRZj
         cxdBEyrSJTFh0CL4U1BpYRIN8ycimlP3AzCY4YMLq98+exukDtUOAiaJ0lfxgJhMIncA
         oeag==
X-Gm-Message-State: AOJu0Yz1ZyxIkvk+vP1rI1w2anuUVv28U9O3WmxdVghpPMlT09NxcAK9
	8iKvCIlPDs2B8HJwIpqNojiPUVL5pU1UDvHVMu7LODy8sTeUtmCRRmK11Q==
X-Gm-Gg: ASbGncsaC+P8uxqsqSPDMGeYR5sS8PY1Jbsg8fqsMbHnqpti0ObJmD+lunj47KtB7tL
	r/vtwCC5kenRfIuj+jnn+NZT8p1GtKLHt1sZF7wQn+BamAKFt+XHKz5Emuta9qY1Ch53LQZhsFl
	TxwoYD72PkOjTamMDB5ennBGQeydyTNaHtsVDw/8m0UOX8miZdAdFSIz47Mg3PJh/v/DDaVYrBj
	9DpmsAng+jNQ+676XmJfaF8eh5svLNDj022bb93y5TDWGcHIXRMMbO/k8oY4TUEQ5iPF3pWqbJZ
	GYYKGjMX7hNIVIKMiMvXjni69g==
X-Google-Smtp-Source: AGHT+IFu7bZh6K3rr53WwFya4Y0hDIpe4RqbHzjx0HCXsBZj3UUfZa2LtcUnXwPC0EXW/eeel5ufRA==
X-Received: by 2002:a92:cd89:0:b0:3a0:c820:c5f0 with SMTP id e9e14a558f8ab-3ae5934dac2mr11252565ab.24.1734029788432;
        Thu, 12 Dec 2024 10:56:28 -0800 (PST)
Received: from alpha.lab.asterius.io (c-24-118-24-24.hsd1.mn.comcast.net. [24.118.24.24])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-4e2c72a1246sm1891459173.37.2024.12.12.10.56.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Dec 2024 10:56:27 -0800 (PST)
From: Derek Straka <derek@asterius.io>
To: openembedded-core@lists.openembedded.org
Cc: Derek Straka <derek@asterius.io>
Subject: [OE-core][PATCH] classes/pypi: update the default UPSTREAM_CHECK_URI to use the simple repo API
Date: Thu, 12 Dec 2024 18:56:19 +0000
Message-Id: <20241212185619.1599668-1-derek@asterius.io>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 12 Dec 2024 18:56:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/208665

Update the UPSTREAM_CHECK_URI to leverage the simple repo API.  The
project URLs require javascript which breaks the version checking fetch
and subsequent logic.  The simple repo API provides similar
functionality with a well defined spec which is used by tools such as
pip.  Also update the UPSTREAM_CHECK_REGEX to be compatible with the
information retrieved via the API

Signed-off-by: Derek Straka <derek@asterius.io>
---
 meta/classes-recipe/pypi.bbclass | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/meta/classes-recipe/pypi.bbclass b/meta/classes-recipe/pypi.bbclass
index c6bbe8119a..15172e97b4 100644
--- a/meta/classes-recipe/pypi.bbclass
+++ b/meta/classes-recipe/pypi.bbclass
@@ -37,7 +37,11 @@ S = "${WORKDIR}/${PYPI_PACKAGE}-${PV}"
 
 # Replace any '_' characters in the pypi URI with '-'s to follow the PyPi website naming conventions
 UPSTREAM_CHECK_PYPI_PACKAGE ?= "${@d.getVar('PYPI_PACKAGE').replace('_', '-')}"
-UPSTREAM_CHECK_URI ?= "https://pypi.org/project/${UPSTREAM_CHECK_PYPI_PACKAGE}/"
-UPSTREAM_CHECK_REGEX ?= "/${UPSTREAM_CHECK_PYPI_PACKAGE}/(?P<pver>(\d+[\.\-_]*)+)/"
+
+# Use the simple repository API rather than the potentially unstable project URL
+# More information on the pypi API specification is avaialble here:
+# https://packaging.python.org/en/latest/specifications/simple-repository-api/
+UPSTREAM_CHECK_URI ?= "https://pypi.org/simple/${UPSTREAM_CHECK_PYPI_PACKAGE}/"
+UPSTREAM_CHECK_REGEX ?= "${UPSTREAM_CHECK_PYPI_PACKAGE}-(?P<pver>(\d+[\.\-_]*)+).(tar\.gz|tgz)"
 
 CVE_PRODUCT ?= "python:${PYPI_PACKAGE}"
-- 
2.34.1


