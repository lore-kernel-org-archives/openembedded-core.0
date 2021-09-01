Received: from mail-ot1-f46.google.com (mail-ot1-f46.google.com [209.85.210.46])
 by mx.groups.io with SMTP id smtpd.web08.8313.1630503932361551727
 for <openembedded-core@lists.openembedded.org>;
 Wed, 01 Sep 2021 06:45:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=J8GY5dnh;
 spf=pass (domain: gmail.com, ip: 209.85.210.46, mailfrom: jpewhacker@gmail.com)
Received: by mail-ot1-f46.google.com with SMTP id i3-20020a056830210300b0051af5666070so3507883otc.4
        for <openembedded-core@lists.openembedded.org>; Wed, 01 Sep 2021 06:45:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=CuTwg8Bf6BWqHfkvKGliGwYdLpeQA8c8Y2yUap78FcY=;
        b=J8GY5dnh/ikQMgfFrKHSnKVqvtnOGvas+9rz6KR7VwzykkemP1QICQq37GBfHku/3x
         pzY9SOV1E3cbjT7+R2RX/EHXLlvUdnl3SgAnvLXAttl2GUY+uneYgBRbJi+uQH751t0X
         aJGREu9WRlVq+HBRkimwhmm8mQ3+Scl8111i47iT1iTu8KV6GGyN8uzK8Y/Uw/RjstHH
         7Ek5CWJgU3VTKHsAErxpcuANKZvWDooJubBYoZZglTfRYHFc3vQLiOy5UbOEDZTNcdtg
         cdpZalfp5Kg4104EIOysBJzidCXT7DXEOX8SK9MBUyU64tqB3qa/oD5MxXtKx9Lx10lr
         JMZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=CuTwg8Bf6BWqHfkvKGliGwYdLpeQA8c8Y2yUap78FcY=;
        b=QrI9beK6aCO03wwYLQIqvUJxbp3l/aGDJruAPdA8hXsx8l2yvZC2wjLlS86QZ3BG9E
         wRIecs1sD2f4U7rSnpgLqavxyOgs0kMED6KPE7kzKGlGUGi/8WVjSIM1ZZWHgCVCmWBO
         wKo5rdC45eTlweXletSJ3XqZrlwJ/xAO2IAbeD4TY64Qp/fSkpmDdJLcR9tvKB/Px993
         tj0kkwEgfg8pE5HcKaCWhq0rh58o6+AGPDX7aqZlnh+J3Ov4xWcOBGHAitYZQGdqi0Es
         6eDk3tcAdAxYqKJnP2XGkJy7pCDFOySvOseq9U7oXU1TvZG90ij7oJA6SeDE849oSpE1
         ib8g==
X-Gm-Message-State: AOAM532oyUGAuiRyEqoEInD8T53VIlqSODBq1QPX8zRqLJg+cq0Rokpr
	sIyoaslKvYTjki6D2B4GET1pWtlLMS8=
X-Google-Smtp-Source: ABdhPJw+yLzoXnCBOlSPubOyKbiXOt8gwqrSn2RTnYMS5O23rmkg+0yfQUtqU5vOCJBEUqZLWp9odQ==
X-Received: by 2002:a05:6830:2146:: with SMTP id r6mr28552865otd.1.1630503931252;
        Wed, 01 Sep 2021 06:45:31 -0700 (PDT)
Return-Path: <jpewhacker@gmail.com>
Received: from localhost.localdomain ([2605:a601:ac3d:c100:e3e8:d9:3a56:e27d])
        by smtp.gmail.com with ESMTPSA id c75sm4283772oob.47.2021.09.01.06.45.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Sep 2021 06:45:30 -0700 (PDT)
From: "Joshua Watt" <JPEWhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: ross.burton@arm.com,
	saul.wold@windriver.com,
	Joshua Watt <JPEWhacker@gmail.com>
Subject: [OE-core][PATCH 13/31] classes/create-spdx: Fix file:// in downloadLocation
Date: Wed,  1 Sep 2021 08:44:52 -0500
Message-Id: <20210901134510.29561-14-JPEWhacker@gmail.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210901134510.29561-1-JPEWhacker@gmail.com>
References: <20210901134510.29561-1-JPEWhacker@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

file:// URIs should not be included as the downloadLocation. Instead,
loop until a non-file:// URI is found, or set the location to
NOASSERTION if none is found

Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
---
 meta/classes/create-spdx.bbclass | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/meta/classes/create-spdx.bbclass b/meta/classes/create-spdx.bbclass
index 2638b3dc97..aa640977f9 100644
--- a/meta/classes/create-spdx.bbclass
+++ b/meta/classes/create-spdx.bbclass
@@ -362,9 +362,12 @@ python do_create_spdx() {
     recipe.versionInfo = d.getVar("PV")
     recipe.SPDXID = oe.sbom.get_recipe_spdxid(d)
 
-    src_uri = d.getVar('SRC_URI')
-    if src_uri:
-        recipe.downloadLocation = src_uri.split()[0]
+    for s in d.getVar('SRC_URI').split():
+        if not s.startswith("file://"):
+            recipe.downloadLocation = s
+            break
+    else:
+        recipe.downloadLocation = "NOASSERTION"
 
     homepage = d.getVar("HOMEPAGE")
     if homepage:
-- 
2.32.0

