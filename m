Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com [209.85.215.179])
 by mx.groups.io with SMTP id smtpd.web11.8875.1596639011032790478
 for <openembedded-core@lists.openembedded.org>;
 Wed, 05 Aug 2020 07:50:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=mJ1W33Sx;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.179, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f179.google.com with SMTP id o13so24573619pgf.0
        for <openembedded-core@lists.openembedded.org>; Wed, 05 Aug 2020 07:50:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=chcDTGaIA/wWKJU9sVYKAA7JIOtpkR4qhdaGewj6+GQ=;
        b=mJ1W33SxtKISoDdYgD+3iXayqqJ1Ydfsnrnh/6T+82ceCr4SMoejGBcXoHYcAlaC1D
         86vIXDg3g5o0QF6V/Ou1SveKv9tTl4A1K16CobbhvCYCbB1lOblNZtiFhXDLGrLq8J74
         FtJvW1jpy/F7XjYaCxkH+DsP5manjM7K+FObR+1g8MZ2ASnwHT8oVlDLTfDBSZExRXbe
         ekI34qN4FwcQTm6GDdrNEbdNopPbm0KFCtLSRALYp086H6mifMTvfr+V9LSVHJdHGiCg
         dHeqvCMJvO4SYKq+trNQtiNbq3c7v1Sg7i3Wru/YaKdUSf2yuXvh+QHa0pChKAqpwwpE
         kbSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=chcDTGaIA/wWKJU9sVYKAA7JIOtpkR4qhdaGewj6+GQ=;
        b=bEJiGqBOgoM2OwhKuaopyIbRmpsnhTSykEDFmm75JeGCd7HZQXggE7/IFTPxFI/RHh
         5CdE+FE5ayC0/0nSSL/29gOkYYSMWYdAx27wctYJqEWouPsIhi/HVDLvF4j8Ldf9On+2
         2yMKQKZkBx8McWLtN02FxMic5FlVYAa2QppQjHMb26G0e39SvK0LTf10FYNaYRz3AWHm
         76b2c5dUxCz5JWYWrWsepsBIxYtWR8BWQ5CgxwFcd4Adjv8bWtkGVwkEelaRf1Jnfmjf
         riiRVjXHcGmvCDcOo6SpNURCSpXr7fTkHKOc2q1fawylYFRQBu7JoZudNmzEA8vxzhDp
         euhA==
X-Gm-Message-State: AOAM532Vm3JPxrICksPotWbKG0ZG+HMd9BeH4/R2Z30lnbrWXvuqEljL
	YhfdSF8K+iLtLdgPoZxMs9bKvqfxSSs=
X-Google-Smtp-Source: ABdhPJwMVGET1Zfh4R37k2EoeEVaLn3G3yUM06Syk1kdf4QpkweyOAZzpmMtxSSt0/zZfztAGgeq3A==
X-Received: by 2002:aa7:97a3:: with SMTP id d3mr3706322pfq.178.1596639009940;
        Wed, 05 Aug 2020 07:50:09 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from octo.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id d81sm3879721pfd.174.2020.08.05.07.50.08
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Aug 2020 07:50:09 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell v2 03/11] checklayer: check layer in BBLAYERS before test
Date: Wed,  5 Aug 2020 04:49:26 -1000
Message-Id: <a10ff925584406e563edfb4042b44c3e8ea57ce3.1596638643.git.steve@sakoman.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1596638643.git.steve@sakoman.com>
References: <cover.1596638643.git.steve@sakoman.com>

From: Lee Chee Yang <chee.yang.lee@intel.com>

layer under test should absent from BBLAYERS when running
yocto-check-layer. This allow to get signatures before layer
under test. There are existing steps to add the layer under
test to BBLAYERS after getting initial signatures.

add steps to check for layer under test in BBLAYERS before
running any test, skip test for the layer if the layer under
test exist in BBLAYERS.

[YOCTO #13176]

Signed-off-by: Lee Chee Yang <chee.yang.lee@intel.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit be02e8dbfb0d1decce125322f9f1e11a649756c0)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 scripts/lib/checklayer/__init__.py | 14 ++++++++++++++
 scripts/yocto-check-layer          |  9 ++++++++-
 2 files changed, 22 insertions(+), 1 deletion(-)

diff --git a/scripts/lib/checklayer/__init__.py b/scripts/lib/checklayer/__init__.py
index f625d59896..fe545607bb 100644
--- a/scripts/lib/checklayer/__init__.py
+++ b/scripts/lib/checklayer/__init__.py
@@ -229,6 +229,20 @@ def add_layers(bblayersconf, layers, logger):
                 f.write("\nBBLAYERS += \"%s\"\n" % path)
     return True
 
+def check_bblayers(bblayersconf, layer_path, logger):
+    '''
+    If layer_path found in BBLAYERS return True
+    '''
+    import bb.parse
+    import bb.data
+
+    ldata = bb.parse.handle(bblayersconf, bb.data.init(), include=True)
+    for bblayer in (ldata.getVar('BBLAYERS') or '').split():
+        if os.path.normpath(bblayer) == os.path.normpath(layer_path):
+            return True
+
+    return False
+
 def check_command(error_msg, cmd, cwd=None):
     '''
     Run a command under a shell, capture stdout and stderr in a single stream,
diff --git a/scripts/yocto-check-layer b/scripts/yocto-check-layer
index ca6c79bc8d..b7c83c8b54 100755
--- a/scripts/yocto-check-layer
+++ b/scripts/yocto-check-layer
@@ -24,7 +24,7 @@ import scriptpath
 scriptpath.add_oe_lib_path()
 scriptpath.add_bitbake_lib_path()
 
-from checklayer import LayerType, detect_layers, add_layers, add_layer_dependencies, get_signatures
+from checklayer import LayerType, detect_layers, add_layers, add_layer_dependencies, get_signatures, check_bblayers
 from oeqa.utils.commands import get_bb_vars
 
 PROGNAME = 'yocto-check-layer'
@@ -138,6 +138,13 @@ def main():
                 layer['type'] == LayerType.ERROR_BSP_DISTRO:
             continue
 
+        if check_bblayers(bblayersconf, layer['path'], logger):
+            logger.info("%s already in %s. To capture initial signatures, layer under test should not present "
+               "in BBLAYERS. Please remove %s from BBLAYERS." % (layer['name'], bblayersconf, layer['name']))
+            results[layer['name']] = None
+            results_status[layer['name']] = 'SKIPPED (Layer under test should not present in BBLAYERS)'
+            continue
+
         logger.info('')
         logger.info("Setting up for %s(%s), %s" % (layer['name'], layer['type'],
             layer['path']))
-- 
2.17.1

