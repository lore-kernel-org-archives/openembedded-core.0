Return-Path: <ticotimo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 56607C433F5
	for <webhook@archiver.kernel.org>; Tue, 22 Feb 2022 19:17:56 +0000 (UTC)
Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com
 [209.85.216.46])
 by mx.groups.io with SMTP id smtpd.web10.1845.1645557475390980269
 for <openembedded-core@lists.openembedded.org>;
 Tue, 22 Feb 2022 11:17:55 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=gRHy7gqP;
 spf=pass (domain: gmail.com, ip: 209.85.216.46, mailfrom: ticotimo@gmail.com)
Received: by mail-pj1-f46.google.com with SMTP id b8so541749pjb.4
        for <openembedded-core@lists.openembedded.org>;
 Tue, 22 Feb 2022 11:17:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=sO/EUa4XjVmllj2Nds/wBREbCBXakTql+3tYE1L8myg=;
        b=gRHy7gqP18CnRdcPKmLpU9g1BkOf07+WfCYeE0NWt2OZryLKamYODlkkE5tjFQhTPS
         NqvE00anSrsiU/CP6M8aemHN9JVhgqpKm8f7o0sLCokb6ATC5iSUZUWMVygl8J20rBF+
         2Hki/mUr8RKCLBSJxaFqWVWYoxdor0T4mQHxVqgPBxEv2J8Ieu42P9q66fGJQS98T+t8
         q6UMzDHX3nCxn79uFpCvCyPCPK/PLo7EiZvdTA1KM89csvzca9lusGxXaJRtFECPPBnh
         rkIqhSta6y/dpML6dJ+HCvjKDm6ThEURUX6rsc1FmgaJ6bX4kU5J0bG5rVv+o0E7cUQQ
         ReQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=sO/EUa4XjVmllj2Nds/wBREbCBXakTql+3tYE1L8myg=;
        b=Fpv6Ni1fpoGNtxRT6WkeyR9XwdXc/JgxEvukUD7iy/ih8L7INp1fELsYjsi+JiYgYZ
         EUdREmhzbvHRNyGtfDzcnMPhubiJSCz549rLWT8yLQNJR62X0SGwS17FrG1xsNzxJLH6
         RPedA3PJPrsi4hI8qNZrcrnqGxa9QF3OENvS/eKq+QkoSMStH7P9UreCbGHEPZFBeZO6
         4MKgznPaH86pLfB5u9I34M4JLqzLkN9DI2T0jYkicY3hXt1cFyCatuuj0kQZFqYGOaX7
         p1Bp1f0VUdODqLyDHQQxB/sl6uplfPnESxK1CbUtG4uIwn9yokYOKbh5f7zTYe8Z686S
         WoOA==
X-Gm-Message-State: AOAM531w4YhzuCQi0QIsUPAAPwDtZDAzLNCIRYWVV6NY8+nBkUOwH8aO
	QOf1XV1lB2omE+f0eN3fLQAcqStT4RVJwg==
X-Google-Smtp-Source: 
 ABdhPJwoluhcNklptSOro8D37hiNicIJ4zZqLlmtrNRUZbyyrNYgiJMwkMZmzqicZhsNlUTFkEu2Pw==
X-Received: by 2002:a17:90b:3145:b0:1bc:5855:f94d with SMTP id
 ip5-20020a17090b314500b001bc5855f94dmr5616088pjb.55.1645557474299;
        Tue, 22 Feb 2022 11:17:54 -0800 (PST)
Received: from nereus.hsd1.or.comcast.net
 ([2601:1c0:6000:1b20:d208:bddf:2b06:2b5a])
        by smtp.gmail.com with ESMTPSA id
 z13sm18402700pfe.20.2022.02.22.11.17.53
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Feb 2022 11:17:53 -0800 (PST)
From: Tim Orling <ticotimo@gmail.com>
X-Google-Original-From: Tim Orling <tim.orling@konsulko.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH v3 31/32] python3-packaging: inherit setuptools_build_meta
Date: Tue, 22 Feb 2022 11:16:57 -0800
Message-Id: 
 <a27bfb825ebbea672e82b27b13987957540cebaa.1645557032.git.tim.orling@konsulko.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <cover.1645557032.git.tim.orling@konsulko.com>
References: <cover.1645557032.git.tim.orling@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 22 Feb 2022 19:17:56 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/162222

Upstream provides a pyproject.toml which declares the
setuptools.build_meta backend for PEP-517 packaging.

[YOCTO #14638]

Signed-off-by: Tim Orling <tim.orling@konsulko.com>
---
 meta/recipes-devtools/python/python3-packaging_21.3.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/python/python3-packaging_21.3.bb b/meta/recipes-devtools/python/python3-packaging_21.3.bb
index 446edf04e1c..c7d0cb7ef78 100644
--- a/meta/recipes-devtools/python/python3-packaging_21.3.bb
+++ b/meta/recipes-devtools/python/python3-packaging_21.3.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=faadaedca9251a90b205c9167578ce91"
 
 SRC_URI[sha256sum] = "dd47c42927d89ab911e606518907cc2d3a1f38bbd026385970643f9c5b8ecfeb"
 
-inherit pypi setuptools3
+inherit pypi setuptools_build_meta
 
 BBCLASSEXTEND = "native nativesdk"
 
-- 
2.30.2


