Received: from mail-oi1-f175.google.com (mail-oi1-f175.google.com [209.85.167.175])
 by mx.groups.io with SMTP id smtpd.web12.10503.1628177880946494030
 for <openembedded-core@lists.openembedded.org>;
 Thu, 05 Aug 2021 08:38:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=DFZ76qQq;
 spf=softfail (domain: sakoman.com, ip: 209.85.167.175, mailfrom: steve@sakoman.com)
Received: by mail-oi1-f175.google.com with SMTP id a19so7894938oiw.6
        for <openembedded-core@lists.openembedded.org>; Thu, 05 Aug 2021 08:38:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=Xfm9PvIflXa3/QZRHpMs3au4ipAT1Lra86JQ6Q5LlSw=;
        b=DFZ76qQq7Rr4jba4mLlhRQOhosln/E+ywICXjTwk+qlyxPb2N5/LbaZi5J2ZipECk3
         SlI/PXXPhOyd8qC6XLVrQYkKIyt120PmxzIfB9pV9ieODZdaG94hLuuR24Bg5n5p05Z2
         tU9B5lq4SXHkRoc0Xt55eNtWkafQlFeXGRp0oQpLG5ozmHrtm56Tw28wKkk593cs4ZN7
         oD1O1v3TTQwKUyQs8zkfkp3hw8VMB0ifWbg997EGMEk/RBnnpeW6fc2Vd+hnfPBQXLaQ
         zmZokwNfi3ynpCNyvavMLUTd55QtX7Kfbc5bkhmWhLh8bTTS6xPfoeUmmeL6LBCptWDh
         W1SA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Xfm9PvIflXa3/QZRHpMs3au4ipAT1Lra86JQ6Q5LlSw=;
        b=m1fQSU6JV85/PL6hUgpwaxMlsx2vw96/JSZZoMqO4PQW0g/krjsq1B4+SkFfaWGePl
         fy7h6FIagb85h3n3J8owkLpFq3g5JZY8E869PFX5Q9ed7lFYuad/pZimrbZy/BP0tMgX
         4FVtkgvFpkL8FzrTBLL35vbCHpSSi+S/saIERSu8RJku83Pcl3HENSSAmECVrSVxJT8Z
         W0l0yawUJcbABnLK37QFQbFOPiJb5wzM/rauZ51Xzs4EWHAMDfGm+FTQRq9VfkptO3IE
         NqnQUlDU8QO6UoKIzH+2zjXbRF4PFdLiHwQ/4AMQNcCH7LGywzMQLP5BfEbZVnqLl/dB
         hojg==
X-Gm-Message-State: AOAM532B1ZYQD3K+8x5t7eDAbG2W3nl+cQddR2Dntp08viONmyMIkUVN
	P8hTiY0S+I4ufKHczuoNsfpD/cld4hlT2oFr
X-Google-Smtp-Source: ABdhPJy6CP0TcJKvFdAMX+yXyOYSu0ywMP7xJlmMP2IL3El7xY7BKDqS3ivpBjzctrAN1Cp73qQiGw==
X-Received: by 2002:a54:478b:: with SMTP id o11mr3955680oic.162.1628177879950;
        Thu, 05 Aug 2021 08:37:59 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from hexa.router0800d9.com ([172.243.4.16])
        by smtp.gmail.com with ESMTPSA id bf41sm1103076oib.41.2021.08.05.08.37.57
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Aug 2021 08:37:59 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 30/33] yocto-check-layer: ensure that all layer dependencies are tested too
Date: Thu,  5 Aug 2021 05:34:07 -1000
Message-Id: <bec38becf8a489d69aca0917a2ce1dfdc96d8ab3.1628176985.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1628176985.git.steve@sakoman.com>
References: <cover.1628176985.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Nicolas Dechesne <nicolas.dechesne@linaro.org>

In order to be compliant with the YP compatible status, a layer also
needs to ensure that all its dependencies are compatible
too. Currently yocto-check-layer only checks the requested layer,
without testing any dependencies.

With this change, all dependencies are also checked by default, so the
summary printed at the end will give a clear picture whether all
dependencies pass the script or not.

Using --no-auto-dependency can be used to skip that.

Signed-off-by: Nicolas Dechesne <nicolas.dechesne@linaro.org>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 45d59b774b95c91193a8376b83c05291d555e5c8)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 scripts/yocto-check-layer | 19 ++++++++++++++++++-
 1 file changed, 18 insertions(+), 1 deletion(-)

diff --git a/scripts/yocto-check-layer b/scripts/yocto-check-layer
index 847fabfd9d..dd930cdddd 100755
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
2.25.1

