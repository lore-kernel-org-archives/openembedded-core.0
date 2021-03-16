Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
 by mx.groups.io with SMTP id smtpd.web08.5698.1615884564256077458
 for <openembedded-core@lists.openembedded.org>;
 Tue, 16 Mar 2021 01:49:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=W69Cq7bv;
 spf=pass (domain: gmail.com, ip: 209.85.167.52, mailfrom: idadelm@gmail.com)
Received: by mail-lf1-f52.google.com with SMTP id q25so61152431lfc.8
        for <openembedded-core@lists.openembedded.org>; Tue, 16 Mar 2021 01:49:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=QANNkdp4EPZlL3QZpVVsirMqWpoIKRuElKeQQ1U/Aak=;
        b=W69Cq7bvVmT5wcyGBrYk6usqC+IT4ot6uYZiEvr1XgtvFP0efhl8tcWDoSBuWGW+oc
         dxzOZSAyHQrkR/zXVsWAOrOU59fvdBtQuV7u6HDSbgUehbbJqwS4nJWCvAMRKBVEObn4
         h9r6bQC9LlQjRjJVLdR3dtstHc1h4fYXzFwry8wgg8l6OOm3lXCXUJtKoGmnsd6yQA/A
         dSMBb2MOb3pfgMQ7eZOsnQZU74L78xXvzLx5Bv6+UF20uBF2zweKu+7JU7238c4csoO/
         fZcVa+E6Wx2VxnmloqBk+aerRZkdJ6cCIIiehWN5WPYbYh8Ti/BtUze8QbKkL2RTie80
         RBVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=QANNkdp4EPZlL3QZpVVsirMqWpoIKRuElKeQQ1U/Aak=;
        b=hVwhRBhrGu6A6jzTSlSSVOTJQx2+jM2bA2EPqUKNso+Iw2OaYcs6SqHMhhKI35u4gN
         1fHHHOqXyABWAKPZfYXfXJblUASH0VlRkn04XCowZ118UKbGzg7YTi3QtmU76Lfn9AqV
         Hr+2HuHziez7f/vl2EmfkQ7avAfGGCNRBWZoqyVtATyCak1Hkij5CUo33rkpCloRQyl0
         0t9DWdOUObwpIaHSVVrB73QVPVX8reGgxAlsiCxUiwRwG12HnXuXs9fadu4QeMuwIJYG
         RgWAMSm0IDW5Y6M+Ncq+3CtEjfJvO4En8sPO7UwcV0lbvxgXvNvEJnfv1XzlmV6/L2KP
         a/Qw==
X-Gm-Message-State: AOAM5316LIieZUtPII7Xm1MHYrG5vG2xCbqjeV1xMWFJgJXLwI2bi7Ja
	ZOarMOjQZE3Jl08yUc7Zw6c2UzWv4vJ0pQ==
X-Google-Smtp-Source: ABdhPJxQyhKMVFgi1zqKZjTSlJzh1wpCyXBQKsg+QyqBjh5cxEOb+Ec19Vddwobzu3rMLmHJr/ubxA==
X-Received: by 2002:a05:6512:11c3:: with SMTP id h3mr10440996lfr.366.1615884562377;
        Tue, 16 Mar 2021 01:49:22 -0700 (PDT)
Return-Path: <idadelm@gmail.com>
Received: from ida-pc.lan ([129.0.78.220])
        by smtp.gmail.com with ESMTPSA id j22sm2942780lfr.37.2021.03.16.01.49.21
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Mar 2021 01:49:22 -0700 (PDT)
From: "Meh Mbeh Ida Delphine" <idadelm@gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: [poky-contrib][PATCH v2 3/6] oe.license: Add functions to split and canonicalise license strings.
Date: Tue, 16 Mar 2021 09:48:42 +0100
Message-Id: <20210316084845.379201-3-idadelm@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210316084845.379201-1-idadelm@gmail.com>
References: <20210316084845.379201-1-idadelm@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

These functions ensures recipe LICENSE strings are split into their individual licenses and then canonicalised to easily enable their matching with licenses of sources during the packaging process.

Signed-off-by: Ida Delphine <idadelm@gmail.com>
---
 meta/lib/oe/license.py | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/meta/lib/oe/license.py b/meta/lib/oe/license.py
index c1274a61de..dc1bc6682c 100644
--- a/meta/lib/oe/license.py
+++ b/meta/lib/oe/license.py
@@ -243,3 +243,22 @@ def list_licenses(licensestr):
     except SyntaxError as exc:
         raise LicenseSyntaxError(licensestr, exc)
     return visitor.licenses
+
+def canonical_license(license, d):
+    """
+    Return the canonical (SPDX) form of the license if available (so GPLv3
+    becomes GPL-3.0), for the license named 'X+', return canonical form of
+    'X' if available and the tailing '+' (so GPLv3+ becomes GPL-3.0+),
+    or the passed license if there is no canonical form.
+    """
+    lic = d.getVarFlag('SPDXLICENSEMAP', license) or ""
+    return lic or license
+
+def split_spdx_lic(licensestr,d):
+    """
+    Split the license strings and returns a set of the
+    canonicalised licenses.
+    """
+    split_lic = list_licenses(licensestr)
+    spdx_lic = set([canonical_license(l, d) for l in split_lic])
+    return spdx_lic
-- 
2.25.1

