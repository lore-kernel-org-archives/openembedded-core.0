Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
 by mx.groups.io with SMTP id smtpd.web09.32.1613667411456365812
 for <openembedded-core@lists.openembedded.org>;
 Thu, 18 Feb 2021 08:56:51 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=XSGa2/3w;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.43, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f43.google.com with SMTP id v15so3762028wrx.4
        for <openembedded-core@lists.openembedded.org>; Thu, 18 Feb 2021 08:56:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=cj2hEArHcQuEC0Kktt2TmZCNBSyE2+oTS7Q9+xGVmKw=;
        b=XSGa2/3wTxs8ofOh+nY27QNBpLiVs4sWCGO07yzQwSxcXyq3boqB9dJ/EBScEJDhIj
         wFs0T7q24MNxysl0H5bsEtdgIVslA976ibqLfBLsZzeC8Ykzr9cLWSBDZtzTpzzZ3Jv1
         /7IV0tiGynOuLPg4wC5GJnqL9G0ahblUDprK4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=cj2hEArHcQuEC0Kktt2TmZCNBSyE2+oTS7Q9+xGVmKw=;
        b=ne49YMBqumEwCpeMaknKDV4T2LiSdAhGtRSKYIWFniJrtztfIbe9QP8vFXt1qnJMqA
         dao/V/m9A+7WDAEfs7gJzNHuJECW19Hh8eKwhYJI7TFepeFk2P7f7eatAx401UCEwgSx
         ffQgCr4T5fGC6sEDnvhCcIWt/eXRn+mR3v3Hz2Dh3G3Q/uH2wtL2i/c550+pLIt/VGRS
         HOV5PCjh08zsA76VfCX97k8PfCpG9hK8IvDTwyW/HIoCrz8y85hXvyqGa0USzVXeUxF/
         EztxkPCaGIwf35plybQ1Ru3MeOGG4SOgCmMJQBpNZym4qyjQ1UNBiUPyGi29fazbEnQE
         KKaQ==
X-Gm-Message-State: AOAM532zCcATqI5hmbmsS1NEB/O0wPWIxM6KkVR9waw42i2VIAPxlUpm
	0f16sWxXVV3vMLhqSX3imuaB5gz/6jq2GQ==
X-Google-Smtp-Source: ABdhPJxY0te7gbBSVk+KgilX6jJ1/EoetX70JgYhwtjyXi+eIzT9Wnm4gK3Ay4FTuuR+GEXitP12KA==
X-Received: by 2002:adf:cd0b:: with SMTP id w11mr5025163wrm.327.1613667409910;
        Thu, 18 Feb 2021 08:56:49 -0800 (PST)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex.int.rpsys.net ([2001:8b0:aba:5f3c:7504:d16b:192:2652])
        by smtp.gmail.com with ESMTPSA id b13sm9290328wrs.35.2021.02.18.08.56.49
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Feb 2021 08:56:49 -0800 (PST)
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 05/11] licenses: Update INCOMPATIBLE_LICENSE for 'or-later' handling
Date: Thu, 18 Feb 2021 16:56:40 +0000
Message-Id: <20210218165646.2109894-5-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210218165646.2109894-1-richard.purdie@linuxfoundation.org>
References: <20210218165646.2109894-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Where a user adds "GPLv3" to INCOMPATIBLE_LICENSE they almost certainly
mean both GPLv3-only and GPLv3-or-later. Update the code to handle this
correctly.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/classes/license.bbclass | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/meta/classes/license.bbclass b/meta/classes/license.bbclass
index 358c716a801..be8541f20dc 100644
--- a/meta/classes/license.bbclass
+++ b/meta/classes/license.bbclass
@@ -281,6 +281,12 @@ def expand_wildcard_licenses(d, wildcard_licenses):
     wildcards from SPDXLICENSEMAP flags and AVAILABLE_LICENSES.
     """
     import fnmatch
+
+    # Assume if we're passed "GPLv3" it means -or-later as well
+    for lic in wildcard_licenses[:]:
+        if "*" not in lic and not lic.endswith(("-or-later", "-only")):
+            wildcard_licenses.append(lic + "-or-later")
+
     licenses = wildcard_licenses[:]
     spdxmapkeys = d.getVarFlags('SPDXLICENSEMAP').keys()
     for wld_lic in wildcard_licenses:
-- 
2.27.0

