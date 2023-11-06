Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A12E7C4332F
	for <webhook@archiver.kernel.org>; Mon,  6 Nov 2023 12:53:00 +0000 (UTC)
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
 by mx.groups.io with SMTP id smtpd.web11.52898.1699275173740030590
 for <openembedded-core@lists.openembedded.org>;
 Mon, 06 Nov 2023 04:52:54 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=dMkBPPp5;
 spf=pass (domain: gmail.com, ip: 209.85.128.53, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4083740f92dso32783705e9.3
        for <openembedded-core@lists.openembedded.org>; Mon, 06 Nov 2023 04:52:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1699275172; x=1699879972; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=16lpM8cwEFzNhE/Sz5dDVApEYXGPW8Mmhw8k7YYxvJY=;
        b=dMkBPPp5xFBpmH9QWe8Ix4dHSjo+e61v/zLmDYocndpvzWnf4fbw0TTBAf06X22Jt5
         eJb8mc3ryZSNmukHBcqqaA/Eb5BF3635sFIGI19tqWXkcrh/2YizWZAlP4nY9alPjbZK
         dXTa6KwL4aqIaMPFRNDq1+GnDqtjYA11AdqGBdaZIWBu8LG9fUoYYgrWMCgvAdfcYihD
         WXUhr+TTM2/4rY/gRsS9NHbsYMNcb4t07X571goUVm60/zRX5qVZOa2Cv2lMazMXssia
         iOv7TrZ3nutc98/WebU7vHJydwS6g3oO3EwcJCQ616XIQM2wGiWPUKarpF3RHo/ef94Q
         IiZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699275172; x=1699879972;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=16lpM8cwEFzNhE/Sz5dDVApEYXGPW8Mmhw8k7YYxvJY=;
        b=tq1ekYGcCin7AtVewAvsOQac7u7l24TAwDuvFe2k2BghxLpsyDLjEpCn2XFZADFcwP
         Ez+g8htu8HE2FPHesWITbJ3PUW8N1N/LSUNSGG6pU8X4IWMLODHdv+DVuZCiyRP0tKhn
         EDWpUczyUqwQW9fUgq9jFFZr47ktBqvehPdOY0y0PrxSKf45i5QV6hIpHu4KncB6KN4E
         29TVmJ2HX8SOePGZRwXNp8dypGXzrCwhq1LHvu2x+NYYqpH91ucnKc8Ra2gngzhIGhYD
         V/9YViNbCm+m/WOxrQUVa5l+3HVs0SFM1WM5+SpwdToGMmInvoSFWJ7Lcd7zM9p25QrR
         /Y2w==
X-Gm-Message-State: AOJu0YzKt5rYD4rduR81bAL4W1Em1V8/ojPo/W1KfGnBca/TR+HJc5p6
	Kq13KKN/f7+HkjHkKx/jHDCDuJJn+U0=
X-Google-Smtp-Source: AGHT+IEPUf6fyQCDief1HQ5eoI2m1QXpHgF0Q2xmTXrpPoEL0q/63JWwXwczQu1s3fSzMVB5L4a9MQ==
X-Received: by 2002:a05:600c:a01:b0:409:5bd2:aa08 with SMTP id z1-20020a05600c0a0100b004095bd2aa08mr12988761wmp.11.1699275171926;
        Mon, 06 Nov 2023 04:52:51 -0800 (PST)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id ha7-20020a05600c860700b004080f0376a0sm11852688wmb.42.2023.11.06.04.52.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Nov 2023 04:52:51 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH v2] populate_sdk_ext: split copy_buildsystem() into logical steps defined as functions
Date: Mon,  6 Nov 2023 13:52:41 +0100
Message-Id: <20231106125241.1518776-1-alex@linutronix.de>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 06 Nov 2023 12:53:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/190211

copy_buildsystem() has become far too large and needs to be split
into shorter and more understandable pieces; some of those
pieces will be reused for the purpose of providing esdk mode
directly from a plain yocto build.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>

---
v2: fixup errors when sdk_ext_type is set to minimal.
---
 meta/classes-recipe/populate_sdk_ext.bbclass | 59 ++++++++++++++++----
 1 file changed, 47 insertions(+), 12 deletions(-)

diff --git a/meta/classes-recipe/populate_sdk_ext.bbclass b/meta/classes-recipe/populate_sdk_ext.bbclass
index 53adc868d47..f209becae1a 100644
--- a/meta/classes-recipe/populate_sdk_ext.bbclass
+++ b/meta/classes-recipe/populate_sdk_ext.bbclass
@@ -186,12 +186,7 @@ def create_filtered_tasklist(d, sdkbasepath, tasklistfile, conf_initpath):
         if os.path.exists(localconf + '.bak'):
             os.replace(localconf + '.bak', localconf)
 
-python copy_buildsystem () {
-    import re
-    import shutil
-    import glob
-    import oe.copy_buildsystem
-
+def copy_bitbake_and_layers(d, baseoutpath, derivative):
     oe_init_env_script = d.getVar('OE_INIT_ENV_SCRIPT')
 
     conf_bbpath = ''
@@ -200,13 +195,7 @@ python copy_buildsystem () {
 
     # Copy in all metadata layers + bitbake (as repositories)
     buildsystem = oe.copy_buildsystem.BuildSystem('extensible SDK', d)
-    baseoutpath = d.getVar('SDK_OUTPUT') + '/' + d.getVar('SDKPATH')
 
-    #check if custome templateconf path is set
-    use_custom_templateconf = d.getVar('SDK_CUSTOM_TEMPLATECONF')
-
-    # Determine if we're building a derivative extensible SDK (from devtool build-sdk)
-    derivative = (d.getVar('SDK_DERIVATIVE') or '') == '1'
     if derivative:
         workspace_name = 'orig-workspace'
     else:
@@ -231,6 +220,9 @@ python copy_buildsystem () {
     d.setVar('oe_init_build_env_path', conf_initpath)
     d.setVar('esdk_tools_path', esdk_tools_path)
 
+    return (conf_initpath, conf_bbpath, core_meta_subdir, sdkbblayers)
+
+def write_devtool_config(d, baseoutpath, conf_bbpath, conf_initpath, core_meta_subdir):
     # Write out config file for devtool
     import configparser
     config = configparser.ConfigParser()
@@ -247,10 +239,12 @@ python copy_buildsystem () {
     with open(os.path.join(baseoutpath, 'conf', 'devtool.conf'), 'w') as f:
         config.write(f)
 
+def write_unlocked_sigs(d, baseoutpath):
     unlockedsigs =  os.path.join(baseoutpath, 'conf', 'unlocked-sigs.inc')
     with open(unlockedsigs, 'w') as f:
         pass
 
+def write_bblayers_conf(d, baseoutpath, sdkbblayers):
     # Create a layer for new recipes / appends
     bbpath = d.getVar('BBPATH')
     env = os.environ.copy()
@@ -279,6 +273,9 @@ python copy_buildsystem () {
         f.write('    $' + '{SDKBASEMETAPATH}/workspace \\\n')
         f.write('    "\n')
 
+def copy_uninative(d, baseoutpath):
+    import shutil
+
     # Copy uninative tarball
     # For now this is where uninative.bbclass expects the tarball
     if bb.data.inherits_class('uninative', d):
@@ -288,6 +285,12 @@ python copy_buildsystem () {
         bb.utils.mkdirhier(uninative_outdir)
         shutil.copy(uninative_file, uninative_outdir)
 
+    return uninative_checksum
+
+def write_local_conf(d, baseoutpath, derivative, core_meta_subdir, uninative_checksum):
+    #check if custome templateconf path is set
+    use_custom_templateconf = d.getVar('SDK_CUSTOM_TEMPLATECONF')
+
     env_passthrough = (d.getVar('BB_ENV_PASSTHROUGH_ADDITIONS') or '').split()
     env_passthrough_values = {}
 
@@ -457,6 +460,9 @@ python copy_buildsystem () {
                 f.write(line)
             f.write('\n')
 
+def prepare_locked_cache(d, baseoutpath, derivative, conf_initpath):
+    import shutil
+
     # Filter the locked signatures file to just the sstate tasks we are interested in
     excluded_targets = get_sdk_install_targets(d, images_only=True)
     sigfile = d.getVar('WORKDIR') + '/locked-sigs.inc'
@@ -560,6 +566,9 @@ python copy_buildsystem () {
                 f = os.path.join(root, name)
                 os.remove(f)
 
+def write_manifest(d, baseoutpath):
+    import glob
+
     # Write manifest file
     # Note: at the moment we cannot include the env setup script here to keep
     # it updated, since it gets modified during SDK installation (see
@@ -583,6 +592,32 @@ python copy_buildsystem () {
                     continue
                 chksum = bb.utils.sha256_file(fn)
                 f.write('%s\t%s\n' % (chksum, os.path.relpath(fn, baseoutpath)))
+
+
+python copy_buildsystem () {
+    import oe.copy_buildsystem
+
+    baseoutpath = d.getVar('SDK_OUTPUT') + '/' + d.getVar('SDKPATH')
+
+    # Determine if we're building a derivative extensible SDK (from devtool build-sdk)
+    derivative = (d.getVar('SDK_DERIVATIVE') or '') == '1'
+
+    conf_initpath, conf_bbpath, core_meta_subdir, sdkbblayers = copy_bitbake_and_layers(d, baseoutpath, derivative)
+
+    write_devtool_config(d, baseoutpath, conf_bbpath, conf_initpath, core_meta_subdir)
+
+    write_unlocked_sigs(d, baseoutpath)
+
+    write_bblayers_conf(d, baseoutpath, sdkbblayers)
+
+    uninative_checksum = copy_uninative(d, baseoutpath)
+
+    write_local_conf(d, baseoutpath, derivative, core_meta_subdir, uninative_checksum)
+
+    prepare_locked_cache(d, baseoutpath, derivative, conf_initpath)
+
+    write_manifest(d, baseoutpath)
+
 }
 
 def get_current_buildtools(d):
-- 
2.39.2


