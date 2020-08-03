Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com [209.85.215.182])
 by mx.groups.io with SMTP id smtpd.web11.12419.1596464847144035235
 for <openembedded-core@lists.openembedded.org>;
 Mon, 03 Aug 2020 07:27:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=BAMoyw+U;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.182, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f182.google.com with SMTP id g33so2478208pgb.4
        for <openembedded-core@lists.openembedded.org>; Mon, 03 Aug 2020 07:27:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=chcDTGaIA/wWKJU9sVYKAA7JIOtpkR4qhdaGewj6+GQ=;
        b=BAMoyw+U6waRPIDi3usEh2BzVP1vmxhRBvzQ1hJCqE63knYY6MnAQLicZxMPcOgllq
         QI/rJismb4Y/FDl8ivzP7Q3084DSVlS0bes5vQ8vXOpmkUzPX0Gg/npWEGCF77DWDTmE
         HSA7Rlx4DC2lf3VQiHgEuYBQsDXbvhJgEWeReNc4AEnFKsm9L1jjef5X88/RrWNZudO2
         UUoV38wXr6msEcQ2ZdMIHBOtDLUURcNjT+AUICa6/oMbjnBF5iwMSNjhTv5S8L8uJCVt
         nFHdMIft2r8SYVIcJfVEsOASkqrm1LfnQerR232RH4Ysf8ghRz7wSQU0fUxHlv0zLdKh
         b/Kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=chcDTGaIA/wWKJU9sVYKAA7JIOtpkR4qhdaGewj6+GQ=;
        b=dQj48lz3UMNdKcAMFJ+1gfNETkUiPpWKeUz+zXeGuwhjctAQZQnBt+oCEn3ZpBZnkY
         UEwifQ2wT7yi4W+Z6XMhNE/TaFaIbZkWVI0c+kxZGzAQElvy7N1hvTisJo+oGc5x0kDj
         wDE7xRzGpLQm2rlJqvf8mIRODrmugbSDbs/SIm/t1vVxFTadyRbc7JHLbjCOrLXAbk6/
         q08Aa+jN/W6XqLwf3V8v+wfI3VmyVXiIw7zmLZ1Ofba2mLmF8vSj2qAovFGlkaBAN9Uz
         QL080L5dbrSPEtZXuJaCxWnfJGMf8QhzprHIj/SUr/XXS5k5ngpZfWyEKE4InMrWeN7C
         4dIQ==
X-Gm-Message-State: AOAM532GQ/WnHLyMgy1U2wESEV99jZZtlmXgyw2Nff8tKxvKmw/Mg8NI
	VRgKfdBviEUd2ECgNOlkvfy1UkdLc28=
X-Google-Smtp-Source: ABdhPJwha4ZovZqSOqcck7hZVC0QcwHdEUvPeGVMTu1PQuRRo3LlOHAmMyPPTxJ8Boi1XlZxrPaqCA==
X-Received: by 2002:a63:f316:: with SMTP id l22mr14607190pgh.291.1596464846177;
        Mon, 03 Aug 2020 07:27:26 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from octo.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id r15sm10913729pfq.189.2020.08.03.07.27.24
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Aug 2020 07:27:25 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 03/12] checklayer: check layer in BBLAYERS before test
Date: Mon,  3 Aug 2020 04:26:55 -1000
Message-Id: <a10ff925584406e563edfb4042b44c3e8ea57ce3.1596464561.git.steve@sakoman.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1596464561.git.steve@sakoman.com>
References: <cover.1596464561.git.steve@sakoman.com>

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

