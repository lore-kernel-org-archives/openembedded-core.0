Return-Path: <alex.kiernan@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 78C17C433FE
	for <webhook@archiver.kernel.org>; Sat,  7 May 2022 06:45:14 +0000 (UTC)
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com
 [209.85.208.45])
 by mx.groups.io with SMTP id smtpd.web09.7500.1651905904325011007
 for <openembedded-core@lists.openembedded.org>;
 Fri, 06 May 2022 23:45:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=UEmeZ2wy;
 spf=pass (domain: gmail.com, ip: 209.85.208.45,
 mailfrom: alex.kiernan@gmail.com)
Received: by mail-ed1-f45.google.com with SMTP id y21so10881166edo.2
        for <openembedded-core@lists.openembedded.org>;
 Fri, 06 May 2022 23:45:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=QRF2ATuFMuDBPkP7KuQZd0DsFKSb+TQBWDVokelevEo=;
        b=UEmeZ2wyqqvjvrwMedAZ9DQ/EAWklR/tdIOrNOx0IZxPETI/vPk3KptsaqtdPca/vu
         9KtCXLPwbhUnBg8eU983VwbFoat/JXGCu47NEj2+fkUMLhuTsLlXyUl4aoi4ZwTtjWcj
         TI0bc6uFhFdjgHUzHqZ0U69acFbSjBklq8XLQ8BW8YZ3gV4B8CCELpY3DmRjizvvtxQ8
         Dun8wmzJAN0XNTydvjR+EeMnHUO+CLf9wGheH8OZUe7s64Pzx2WYMYpFId4n5+3bMdta
         FkEamrEUMFrd+9orH224YBoZjoIWzwCHWfY0J9vfJ695xZJnIxGVanEXY6rXLfwGPP8V
         yuUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=QRF2ATuFMuDBPkP7KuQZd0DsFKSb+TQBWDVokelevEo=;
        b=iGbtYpjIPSGgdGFcH7TTt1hAlGBw2dyKg0GadlZ71SF81UjRRDh9rn/eDLjgjI/9eA
         rZF/kSlA4fVvknsk4r7b1CiNAkD6jAfjtk8oeLDNtac8SOjQXVcScAFtSHklAbSfvtdn
         /dO3XQeWA3Hx7TvsDLFdsFMaTV/kqrV47Dx5st8zSBZ8j50XXdCRU52HNuE0Y3lvVyMl
         ewjwOdOtIYa9qNMFpqucguCCL+n5/ZWwFsz7lApbWqDQYdJux6PEeIDyaSYlS9MRkCAy
         qdcXepoCR0UQCJkzd8mgt+uXdu5GbX+FB9LygeoE2FK3oHBx5Ly99oW8Gf0VQvHVfM9w
         VT1A==
X-Gm-Message-State: AOAM531vOjUnRgx/hWlsLzrd4nsIX+OWZzwuA2TOxdzvVrxXKIAl1Xau
	BmK1GekyPW8rJsbE++nGOE4aQpcOM8o=
X-Google-Smtp-Source: 
 ABdhPJzWeigkc5bN1xQgFupxxB9PVYz5jKC7doe7d7tnNmI4oZ2rSIGEPMUdhmEuBSApqjeHe2kIMw==
X-Received: by 2002:a05:6402:26d3:b0:427:c571:86fe with SMTP id
 x19-20020a05640226d300b00427c57186femr7261739edd.133.1651905902624;
        Fri, 06 May 2022 23:45:02 -0700 (PDT)
Received: from localhost.localdomain (cust246-dsl91-135-6.idnet.net.
 [91.135.6.246])
        by smtp.gmail.com with ESMTPSA id
 g11-20020a170906c18b00b006f5294986besm1294229ejz.111.2022.05.06.23.45.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 May 2022 23:45:02 -0700 (PDT)
From: Alex Kiernan <alex.kiernan@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alex Kiernan <alex.kiernan@gmail.com>,
	Alex Kiernan <alexk@zuma.ai>
Subject: [OE-Core][PATCH 3/4] pypi.bbclass: Set CVE_PRODUCT to PYPI_PACKAGE
Date: Sat,  7 May 2022 07:44:48 +0100
Message-Id: <20220507064449.25809-3-alex.kiernan@gmail.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220507064449.25809-1-alex.kiernan@gmail.com>
References: <20220507064449.25809-1-alex.kiernan@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 07 May 2022 06:45:14 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/165355

The CVE product name for PyPI packages is (usually) the same as the PyPI
package name (and not our recipe name), so use that as the default.

Signed-off-by: Alex Kiernan <alexk@zuma.ai>
Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
---
 meta/classes/pypi.bbclass | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/classes/pypi.bbclass b/meta/classes/pypi.bbclass
index 9405d5860181..5fa7b8a6ae23 100644
--- a/meta/classes/pypi.bbclass
+++ b/meta/classes/pypi.bbclass
@@ -24,3 +24,5 @@ S = "${WORKDIR}/${PYPI_PACKAGE}-${PV}"
 
 UPSTREAM_CHECK_URI ?= "https://pypi.org/project/${PYPI_PACKAGE}/"
 UPSTREAM_CHECK_REGEX ?= "/${PYPI_PACKAGE}/(?P<pver>(\d+[\.\-_]*)+)/"
+
+CVE_PRODUCT ?= "python:${PYPI_PACKAGE}"
-- 
2.35.1


