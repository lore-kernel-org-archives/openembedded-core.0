Return-Path: <ernstp@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DA60AC7EE2E
	for <webhook@archiver.kernel.org>; Tue,  2 May 2023 17:35:05 +0000 (UTC)
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
 by mx.groups.io with SMTP id smtpd.web11.305.1683048903710093233
 for <openembedded-core@lists.openembedded.org>;
 Tue, 02 May 2023 10:35:04 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=mqJzjL7D;
 spf=pass (domain: gmail.com, ip: 209.85.167.53, mailfrom: ernstp@gmail.com)
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-4edcc885d8fso4956362e87.1
        for <openembedded-core@lists.openembedded.org>; Tue, 02 May 2023 10:35:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1683048902; x=1685640902;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=em7G7jFKuZ3LqyHocUoFWJR+CVfFWZ9E8ECvCnscivg=;
        b=mqJzjL7DDzmk/t4vi8j+hn/ErARDGW3cv0W0RdD5TLP8NNWrpWTIvNrTSYGk0FEdfE
         8wNyVF9NEN79+9Mec+LoaxreGrgE1KfhHtamgjfZDtHgs8N7I11w+qFgRaFFDXtmwaak
         Ovgqu+VG+yvuhlj2SJnByfbu4P6tlCPb9swn/QyL7nX6sS+Ddn+kNCVfpb1myaXzAmSc
         p4IeOmpNVcZKUXodRdtS64ERmBG3QTnr6AX9QIIsyltJobioJ5kpcTJmu9NrcZUX6ZGp
         QQDEHT0LktGmqk6+LjipDSpMv2ZD+3yC44mfQogR1LqjfYS4o4fKiQmeqjWKpDfhsPS5
         EpAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683048902; x=1685640902;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=em7G7jFKuZ3LqyHocUoFWJR+CVfFWZ9E8ECvCnscivg=;
        b=gpxFMl8mXPTH6CHaCZ6AOjDuAJ5TCQ77OToWBS6v+QqHv+OhvvYxqh0GfUYFyIfqaq
         p6KuQhfYE9TeKI+JujCWHep64dJfjneQpOCznSFTvhr8ledHQg++gHefNogZhB2vBRNf
         PuTtJkh9cjM3VA464DufEBQZ2LB+l0go0UfJ7fpj1Hq6dR9OaTqlS3OOcl0DfCaA0z3O
         ww4NIbwFIS5+FG8epje1n/vJSg2KJyMdYCkUcvVSiRzAUFc15BXfzC5NdUvEmBFHBZmW
         hj5TOQ/xgoNurHElrKduXMJ2Z8Sm8sE+TZbGkjATfYaBksvjRMowfYqBonS/vcxrQB1u
         T9wA==
X-Gm-Message-State: AC+VfDwAm/ifT6HZF9ET8MIftnAWpWu4Iu9dSRauqxNRCdRUJvOHTlli
	qZEolN0tKM4qSbv19VuIIiZqx5hTdgw2VA==
X-Google-Smtp-Source: ACHHUZ6dMh+jH2dkLS1lr59pS8jBfNrwPNmp5h6aD+QRMnLnswkWco6aUJYp86ffFWAwYNUvFfTj3g==
X-Received: by 2002:ac2:4887:0:b0:4f0:223e:7916 with SMTP id x7-20020ac24887000000b004f0223e7916mr192547lfc.62.1683048902043;
        Tue, 02 May 2023 10:35:02 -0700 (PDT)
Received: from localhost.localdomain (c83-254-134-100.bredband.tele2.se. [83.254.134.100])
        by smtp.gmail.com with ESMTPSA id m23-20020ac24297000000b004edc3bd7fa4sm5507879lfh.287.2023.05.02.10.35.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 May 2023 10:35:01 -0700 (PDT)
From: =?UTF-8?q?Ernst=20Sj=C3=B6strand?= <ernstp@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: =?UTF-8?q?Ernst=20Sj=C3=B6strand?= <ernstp@gmail.com>
Subject: [PATCH 5/6] python3-requests: fix rdepends
Date: Tue,  2 May 2023 19:34:21 +0200
Message-Id: <20230502173422.1439794-5-ernstp@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230502173422.1439794-1-ernstp@gmail.com>
References: <20230502173422.1439794-1-ernstp@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 02 May 2023 17:35:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/180760

Remove obsolete or unused rdepends.
Add python3-charset-normalizer.

Signed-off-by: Ernst Sjöstrand <ernstp@gmail.com>
---
 .../python/python3-requests_2.28.2.bb                 | 11 +++--------
 1 file changed, 3 insertions(+), 8 deletions(-)

diff --git a/meta/recipes-devtools/python/python3-requests_2.28.2.bb b/meta/recipes-devtools/python/python3-requests_2.28.2.bb
index 8ab1ec01212..e16490b2f5a 100644
--- a/meta/recipes-devtools/python/python3-requests_2.28.2.bb
+++ b/meta/recipes-devtools/python/python3-requests_2.28.2.bb
@@ -1,5 +1,5 @@
 SUMMARY = "Python HTTP for Humans."
-HOMEPAGE = "http://python-requests.org"
+HOMEPAGE = "https://requests.readthedocs.io"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=34400b68072d710fecd0a2940a0d1658"
 
@@ -8,17 +8,12 @@ SRC_URI[sha256sum] = "98b1b2782e3c6c4904938b84c0eb932721069dfdb9134313beff7c83c2
 inherit pypi setuptools3
 
 RDEPENDS:${PN} += " \
-    ${PYTHON_PN}-email \
-    ${PYTHON_PN}-json \
-    ${PYTHON_PN}-ndg-httpsclient \
-    ${PYTHON_PN}-netserver \
-    ${PYTHON_PN}-pyasn1 \
-    ${PYTHON_PN}-pyopenssl \
+    ${PYTHON_PN}-certifi \
+    ${PYTHON_PN}-charset-normalizer \
     ${PYTHON_PN}-pysocks \
     ${PYTHON_PN}-urllib3 \
     ${PYTHON_PN}-chardet \
     ${PYTHON_PN}-idna \
-    ${PYTHON_PN}-compression \
 "
 
 CVE_PRODUCT = "requests"
-- 
2.39.2


