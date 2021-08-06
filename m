Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
 by mx.groups.io with SMTP id smtpd.web11.2322.1628238323767957499
 for <openembedded-core@lists.openembedded.org>;
 Fri, 06 Aug 2021 01:25:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=PisnUpSV;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.54, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f54.google.com with SMTP id l8-20020a05600c1d08b02902b5acf7d8b5so4797971wms.2
        for <openembedded-core@lists.openembedded.org>; Fri, 06 Aug 2021 01:25:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=+2TILCksY45rITWWbgvr3YEtuk+SoHilFP4ItY0bMjM=;
        b=PisnUpSVY1Fm3zpNBVIFbGH6edDjt77KMPy5GBVFbf6IPjftNFBdVBaai4FxkAwbty
         ZDMqPQzX6J7TmABSiVROPvbtThST3VNbfhTEAdr7QeWJjLfA+kKBDxtJtQrgMq1F0NNb
         FLia6vCLjlZ9Bs3dPOunARNhz7agaVTuWSXd0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=+2TILCksY45rITWWbgvr3YEtuk+SoHilFP4ItY0bMjM=;
        b=jisP9HT8hbvMaPS/G3jn+26Ppoph8fbS+CBF0B6d1+SynFTZmJO5DtapWuHmDm6iG+
         uvOiSKZjm4GGVV10ClL47EmcwmxvKbm2bt1iOU0vt/tcZnIu1QggVt+H9Cn/22kWC0sV
         fS6NiykOPGAGZGsnhOVyQjGg8Wd1/QhZfDUyVVpkD+c3dKzn+FQVaZHxM8CzxVjU6LV6
         5mPR44fMQCu6rZTN79VkSvnxdrLzPgJI0fRyfCZPZdJ1mOZneqBzo7zPGuDjWG/t7kUu
         6tkDAnVzNmzQ9K47RiIjElu8omqUenCIZ+h2bdzsBF5BBJjFMRGinB0KRM6v9xpZTdiz
         6bKQ==
X-Gm-Message-State: AOAM531EPHtwcWQoBg+MV+mOFKJXv0Tjk/xtglJFS1x7ZwnWWfIHgCJJ
	6Y6yL7j+3W0yy1EWwOCkboDfQA+V3PZGcg==
X-Google-Smtp-Source: ABdhPJzgg1pMZWJNsEpJxPjTrMxsezusmpygLC7KQIijMP6zAmNr9S6VYanGvbpLFb1/A9zG0jg25g==
X-Received: by 2002:a7b:c744:: with SMTP id w4mr7885301wmk.100.1628238322215;
        Fri, 06 Aug 2021 01:25:22 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex.int.rpsys.net ([2001:8b0:aba:5f3c:9b1a:3a88:2016:c4d0])
        by smtp.gmail.com with ESMTPSA id p15sm7653590wmi.29.2021.08.06.01.25.21
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Aug 2021 01:25:21 -0700 (PDT)
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] packagedata: Fix after override syntax change
Date: Fri,  6 Aug 2021 09:25:21 +0100
Message-Id: <20210806082521.3597855-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix a reference that should have been part of the override syntax change
causing packages to be written out incorrectly.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/classes/packagedata.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/packagedata.bbclass b/meta/classes/packagedata.bbclass
index 3b962f29b53..c2760e2bf0c 100644
--- a/meta/classes/packagedata.bbclass
+++ b/meta/classes/packagedata.bbclass
@@ -27,7 +27,7 @@ python read_subpackage_metadata () {
             # of that variable, e.g. DESCRIPTION could clobber DESCRIPTION:<pkgname>
             # We therefore don't clobber for the unsuffixed variable versions
             #
-            if key.endswith("_" + pkg):
+            if key.endswith(":" + pkg):
                 d.setVar(key, sdata[key])
             else:
                 d.setVar(key, sdata[key], parsing=True)
-- 
2.30.2

