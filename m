Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
 by mx.groups.io with SMTP id smtpd.web08.7170.1626958026462526477
 for <openembedded-core@lists.openembedded.org>;
 Thu, 22 Jul 2021 05:47:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=HajR+QO7;
 spf=pass (domain: linaro.org, ip: 209.85.128.46, mailfrom: nicolas.dechesne@linaro.org)
Received: by mail-wm1-f46.google.com with SMTP id m38-20020a05600c3b26b02902161fccabf1so1481576wms.2
        for <openembedded-core@lists.openembedded.org>; Thu, 22 Jul 2021 05:47:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=2lbrcQaiXy53GWtM7GCSjmWfS/wC9CvdEHXOKi7b3y4=;
        b=HajR+QO7bb1X8HCjjJaKrDL06JlCEWSAN0aJ5Ciu1HYU0MGHUOwtDJHCG9Rc7MjJpC
         WmquthJcuVDhNcFR6PgJTKrWdIkeS5fIovSZaT8MpOeAPw9CrfozdS9EhZRvdzZ6zx/4
         OmYpwFRv9hmARgRDOweTUqPjRdHeCNnxMAZbDmr8m8cvemeOj4BLqGiGwFf7jT0jcld8
         ZcIhQcJNl+RXg6or6J4q4ceMUJj+/pov9/+YJ7vliEtUQUMtp7giK43A8ktjlJboBZyh
         ewpaoFURAwAmjg2WDuD6/ujNoHY21UwSM8d22oOriOSsIoU2fymPNsI2IEMxXeO/ZpnY
         rrOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=2lbrcQaiXy53GWtM7GCSjmWfS/wC9CvdEHXOKi7b3y4=;
        b=mZGvo+ukWYOgTMT0sTKNxysL5e2BiCR7cygpBqFWrzsOf52Lwf8pvrfzzSZgO8/3S8
         BGM2UYUZlb3KCVfEDg9BmnIG9Yl7C5WUZ8p2/kANGfrFJjbxh5kMt64DeDqhctoHxsd8
         ytzXm1K4hGSgI6g3XJNIWVC/ORe/IuCxlgcKK3OgG866DwBOAAPWlwyfznXptHFgl36k
         bm36GV6Tuk3LdfPM9+/GbN3FJ/QEqs/RdVFc+8oK4FS4gIkfmy4HMXY64Kn/QkcNjBSw
         jOvc3T69z4MIEots1iywr3Ckm2aQh7lvD0C/N3ypM05FxPWbJMn6EHgEAdORf+uOWNGn
         Nbkw==
X-Gm-Message-State: AOAM5312BOzWK4AHVA9vLaPA6s4Iv1yGFOreNMKO8y9BlwMarI6mNRcV
	qUwH6YHbHNR7WbPRQx17ONmRNPW3HgTsxA==
X-Google-Smtp-Source: ABdhPJxDBq9XGKLYPh/wtbYxyoMFL/f2w90YY0n7Gm7ZvkVDph1NiTLtBS7YDzr0C5WZgq5d/dfXyg==
X-Received: by 2002:a1c:5458:: with SMTP id p24mr33936131wmi.131.1626958024765;
        Thu, 22 Jul 2021 05:47:04 -0700 (PDT)
Return-Path: <nicolas.dechesne@linaro.org>
Received: from qcom-hackbox.linaro.org.net (163-172-5-244.rev.poneytelecom.eu. [163.172.5.244])
        by smtp.gmail.com with ESMTPSA id p18sm2468610wmg.46.2021.07.22.05.47.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Jul 2021 05:47:04 -0700 (PDT)
From: "Nicolas Dechesne" <nicolas.dechesne@linaro.org>
To: openembedded-core@lists.openembedded.org
Cc: Nicolas Dechesne <nicolas.dechesne@linaro.org>
Subject: [PATCH 2/4] checklayer: new function get_layer_dependencies()
Date: Thu, 22 Jul 2021 14:46:42 +0200
Message-Id: <20210722124644.19962-3-nicolas.dechesne@linaro.org>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210722124644.19962-1-nicolas.dechesne@linaro.org>
References: <20210722124644.19962-1-nicolas.dechesne@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Split add_layer_dependencies() into 2 parts. First search for layer
dependencies, and then add them to the config. That allows us to
call get_layer_dependencies() independently.

Signed-off-by: Nicolas Dechesne <nicolas.dechesne@linaro.org>
---
 scripts/lib/checklayer/__init__.py | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/scripts/lib/checklayer/__init__.py b/scripts/lib/checklayer/__init__.py
index fe545607bb..72d9df0a62 100644
--- a/scripts/lib/checklayer/__init__.py
+++ b/scripts/lib/checklayer/__init__.py
@@ -156,7 +156,7 @@ def _find_layer_depends(depend, layers):
                 return layer
     return None
 
-def add_layer_dependencies(bblayersconf, layer, layers, logger):
+def get_layer_dependencies(layer, layers, logger):
     def recurse_dependencies(depends, layer, layers, logger, ret = []):
         logger.debug('Processing dependencies %s for layer %s.' % \
                     (depends, layer['name']))
@@ -203,6 +203,11 @@ def add_layer_dependencies(bblayersconf, layer, layers, logger):
         layer_depends = recurse_dependencies(depends, layer, layers, logger, layer_depends)
 
     # Note: [] (empty) is allowed, None is not!
+    return layer_depends
+
+def add_layer_dependencies(bblayersconf, layer, layers, logger):
+
+    layer_depends = get_layer_dependencies(layer, layers, logger)
     if layer_depends is None:
         return False
     else:
-- 
2.29.2

