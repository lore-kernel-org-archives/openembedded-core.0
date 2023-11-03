Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C9B65C41535
	for <webhook@archiver.kernel.org>; Fri,  3 Nov 2023 10:28:14 +0000 (UTC)
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
 by mx.groups.io with SMTP id smtpd.web11.48043.1699007293787472331
 for <openembedded-core@lists.openembedded.org>;
 Fri, 03 Nov 2023 03:28:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=MQTgj5qo;
 spf=pass (domain: gmail.com, ip: 209.85.128.43, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4083740f92dso13931175e9.3
        for <openembedded-core@lists.openembedded.org>; Fri, 03 Nov 2023 03:28:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1699007292; x=1699612092; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tXqcaGcgaharJaj8Nq56+ev5XHwg1SS04RwWBLI/ZkU=;
        b=MQTgj5qoRps2/ki1qMha6w0ql1hzUjeibzBf8F1eXHVZCvQ1E4UBveBV5+mvtegMjc
         CMV8D6bSCk9lxY8ba4Hbdakw2X4Nm7ThPUDjzvULp+wgNlBdEtSejtMNKDG/nE9uTIVn
         VDfOzIQgWtMylamHq4eKTTo89ZrU3YcUvCQgd07JvlNckJd01z20YULJ2b/20yDiBZhv
         s5w7HQqzRq50jT04dOwwE1up+T7+kYMXmPEks75dci+s/1GoT2Z0Iv2QNPYtCrhOv5oI
         b1pk1yU2wPS0vA0F+8TBNkLH/mcCSW+fRD5U2DvJHtHO6rV6/qi9KE61YhUuvxwtpI+W
         +MFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699007292; x=1699612092;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tXqcaGcgaharJaj8Nq56+ev5XHwg1SS04RwWBLI/ZkU=;
        b=gFURdHa5zy4eu4YfyOwMDmE5WnePHnFZFSGe0j2jbSgD+3pEq/dTrxAsl23rTBq32m
         mwGCswcgkl0fr8Qs+w/hDfb1HmyDM2bMQ+mgJbTyl30AXrPRYUymsrYfSsZ14+T4ifPy
         mCUQtHJumg1DEfqYrw9/lEM6VlIWNKI7K/qUnfQPkPBN4CRpCMvPC2xun4xl6aLAPosD
         6n/ea+Jn2vbq/up4cgYTmM4+kes31y35F7piCA0UcsBkvd+XIdgpX3q+8vgt7SCzWh5G
         ffH4nop1vz+NWEU0WicjDu3/jmlsJJttwPVs8nX2wBmVUXxz7G+42AnEbK4YOvba16Ue
         AG2w==
X-Gm-Message-State: AOJu0YyxnKruiB48fZUH689ED6BoBVIpa+O0nU+hExFdo72AuKFfoSxG
	/swfncfd1wTMQyb40z6CNyhVBX3/klc=
X-Google-Smtp-Source: AGHT+IGK/JLeZI4CJ2L7o4iBMZEsnsydb3iRpc1nFjfyv1wyYuO1+HmYiTAfZThcR5DJURRHUHXQAw==
X-Received: by 2002:a05:600c:190c:b0:402:bcac:5773 with SMTP id j12-20020a05600c190c00b00402bcac5773mr18155875wmq.38.1699007291949;
        Fri, 03 Nov 2023 03:28:11 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id y14-20020a05600c2b0e00b00405718cbeadsm1976643wme.1.2023.11.03.03.28.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Nov 2023 03:28:11 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 4/4] populate_sdk_ext: split copy_buildsystem() into logical steps defined as functions
Date: Fri,  3 Nov 2023 11:28:06 +0100
Message-Id: <20231103102806.2332746-4-alex@linutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231103102806.2332746-1-alex@linutronix.de>
References: <20231103102806.2332746-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 03 Nov 2023 10:28:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/190151

copy_buildsystem() has become far too large and needs to be split
into shorter and more understandable pieces; some of those
pieces will be reused for the purpose of providing esdk mode
directly from a plain yocto build.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 meta/classes-recipe/populate_sdk_ext.bbclass | 59 ++++++++++++++++----
 1 file changed, 47 insertions(+), 12 deletions(-)

diff --git a/meta/classes-recipe/populate_sdk_ext.bbclass b/meta/classes-recipe/populate_sdk_ext.bbclass
index 53adc868d47..a20f38fb210 100644
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
 
+def prepare_locked_cache(d, baseoutpath, conf_initpath):
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
+    prepare_locked_cache(d, baseoutpath, conf_initpath)
+
+    write_manifest(d, baseoutpath)
+
 }
 
 def get_current_buildtools(d):
-- 
2.39.2


