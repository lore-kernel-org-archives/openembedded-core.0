Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
 by mx.groups.io with SMTP id smtpd.web08.7171.1626958028025149856
 for <openembedded-core@lists.openembedded.org>;
 Thu, 22 Jul 2021 05:47:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=OLv2dcaQ;
 spf=pass (domain: linaro.org, ip: 209.85.128.42, mailfrom: nicolas.dechesne@linaro.org)
Received: by mail-wm1-f42.google.com with SMTP id l6so3275415wmq.0
        for <openembedded-core@lists.openembedded.org>; Thu, 22 Jul 2021 05:47:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=sAimK3ZA2Plh7xV9xtV3ADwZEUOkDxLGMEZGQ1XTybs=;
        b=OLv2dcaQV9zu2yU/J5ekjS8rKJRqtOprM1+xVw2m64Zl9KjiMHxisGZ45wV7gYgYAh
         bbyfFb69oFtMQDm9FiNIyZhzfhEZEOJpiu0HJOAsKJbGv8xLcQs21NEGbsUwcP9ymsOF
         cwYB0u+nzpH/A8Rz6skKh+bYMccG3zAeObITY9/eHXQlm8I3uSmtlhEqULvfe9rDyvXJ
         OyaRsRUlC9VjDfjUo62Fi5QzKgyd4H3lbX0M/Romgc1Orj729Fonla07QHAsSZCVU9qM
         E0GT+zA1oje7XiTyl4C9ySNNh3c5ULG/7WaewTUFTcG8rAdK4rFNnYaxR5z607BkXoH/
         KZcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=sAimK3ZA2Plh7xV9xtV3ADwZEUOkDxLGMEZGQ1XTybs=;
        b=K0YkU/uUiFSKZdkuA9K7BAL/W9cljeA0/JwqRgtc1SuzEZByVB6LKLyo9J8l3ElJ/F
         Q3Z5WI4CwuhlQMXaL4+TauZaM+iK2jAyiSLfEe5soSRMOEsP2PBj2VNOWCtXRrM09sp8
         8BUv75aj0EgWyTZ7Z4NF/grdRjByRjGoTAins/cR8W1dX1xkczrfk5pjM19z2M77lwnt
         URTc1CzSd+tnUNgAIpAnt4YKTfMsXjxo10Sy56iNNatCbaAM1h0oymsnSuU8zFtzHQPB
         V+9z2ecO/1AJ+mQADTsry4mHAXRDKIsXJRnFgsZ9oJagnWZ1ErEjDOQdZ/Fkt2ob88Rc
         Hy+w==
X-Gm-Message-State: AOAM533glvaTHDjc+Xoa0uwVDJvRdeBzsEj4cFCX3Ks/jAM5WgtBpDGA
	EtiV+wv8oVYyh6HpXzNT76h7wXhsHZbfNg==
X-Google-Smtp-Source: ABdhPJyuDh7yISh+Lfb6THaKkrbtCEssJo0P3qrMJfyOU8Z5dYW9b8Sax2526y+j/f3TkpF6yc/kuw==
X-Received: by 2002:a1c:1f09:: with SMTP id f9mr9045744wmf.110.1626958026448;
        Thu, 22 Jul 2021 05:47:06 -0700 (PDT)
Return-Path: <nicolas.dechesne@linaro.org>
Received: from qcom-hackbox.linaro.org.net (163-172-5-244.rev.poneytelecom.eu. [163.172.5.244])
        by smtp.gmail.com with ESMTPSA id p18sm2468610wmg.46.2021.07.22.05.47.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Jul 2021 05:47:06 -0700 (PDT)
From: "Nicolas Dechesne" <nicolas.dechesne@linaro.org>
To: openembedded-core@lists.openembedded.org
Cc: Nicolas Dechesne <nicolas.dechesne@linaro.org>
Subject: [PATCH 4/4] yocto-check-layer: ensure that all layer dependencies are tested too
Date: Thu, 22 Jul 2021 14:46:44 +0200
Message-Id: <20210722124644.19962-5-nicolas.dechesne@linaro.org>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210722124644.19962-1-nicolas.dechesne@linaro.org>
References: <20210722124644.19962-1-nicolas.dechesne@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In order to be compliant with the YP compatible status, a layer also
needs to ensure that all its dependencies are compatible
too. Currently yocto-check-layer only checks the requested layer,
without testing any dependencies.

With this change, all dependencies are also checked by default, so the
summary printed at the end will give a clear picture whether all
dependencies pass the script or not.

Using --no-auto-dependency can be used to skip that.

Signed-off-by: Nicolas Dechesne <nicolas.dechesne@linaro.org>
---
 scripts/yocto-check-layer | 19 ++++++++++++++++++-
 1 file changed, 18 insertions(+), 1 deletion(-)

diff --git a/scripts/yocto-check-layer b/scripts/yocto-check-layer
index a179240fd0..e3a4c940ec 100755
--- a/scripts/yocto-check-layer
+++ b/scripts/yocto-check-layer
@@ -24,7 +24,7 @@ import scriptpath
 scriptpath.add_oe_lib_path()
 scriptpath.add_bitbake_lib_path()
 
-from checklayer import LayerType, detect_layers, add_layers, add_layer_dependencies, get_signatures, check_bblayers
+from checklayer import LayerType, detect_layers, add_layers, add_layer_dependencies, get_layer_dependencies, get_signatures, check_bblayers
 from oeqa.utils.commands import get_bb_vars
 
 PROGNAME = 'yocto-check-layer'
@@ -51,6 +51,8 @@ def main():
             help='File to output log (optional)', action='store')
     parser.add_argument('--dependency', nargs="+",
             help='Layers to process for dependencies', action='store')
+    parser.add_argument('--no-auto-dependency', help='Disable automatic testing of dependencies',
+            action='store_true')
     parser.add_argument('--machines', nargs="+",
             help='List of MACHINEs to be used during testing', action='store')
     parser.add_argument('--additional-layers', nargs="+",
@@ -121,6 +123,21 @@ def main():
     if not layers:
         return 1
 
+    # Find all dependencies, and get them checked too
+    if not args.no_auto_dependency:
+        depends = []
+        for layer in layers:
+            layer_depends = get_layer_dependencies(layer, dep_layers, logger)
+            if layer_depends:
+                for d in layer_depends:
+                    if d not in depends:
+                        depends.append(d)
+
+        for d in depends:
+            if d not in layers:
+                logger.info("Adding %s to the list of layers to test, as a dependency", d['name'])
+                layers.append(d)
+
     shutil.copyfile(bblayersconf, bblayersconf + '.backup')
     def cleanup_bblayers(signum, frame):
         shutil.copyfile(bblayersconf + '.backup', bblayersconf)
-- 
2.29.2

