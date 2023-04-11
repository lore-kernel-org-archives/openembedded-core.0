Return-Path: <Martin.Jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C7C8DC7619A
	for <webhook@archiver.kernel.org>; Tue, 11 Apr 2023 09:04:20 +0000 (UTC)
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
 by mx.groups.io with SMTP id smtpd.web10.9100.1681203851802732642
 for <openembedded-core@lists.openembedded.org>;
 Tue, 11 Apr 2023 02:04:12 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20210112 header.b=gKIF1DTJ;
 spf=pass (domain: gmail.com, ip: 209.85.218.49, mailfrom: martin.jansa@gmail.com)
Received: by mail-ej1-f49.google.com with SMTP id j17so8861160ejs.5
        for <openembedded-core@lists.openembedded.org>; Tue, 11 Apr 2023 02:04:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1681203850; x=1683795850;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=LL/o4qKVIRqFbGelbRXRg3NXXG7FRRJ4+MdbTu1yY+0=;
        b=gKIF1DTJBQmm4RT6Hev1A31/5aftrfSVlnCP0rRnuPlC51HAcRg3jqgoqDymZr7NLW
         Bxthu6PDpjRFreKfGrrZF4OpmfT+7lYSR9at8hqo8vHIBHIcXwXauXnFr8bkp3smvuPb
         jMQ3ItFOInAxXRnO/sQ9B5OJCGanVuVSI7sDHQLTq/6/3vfZ6jeBQbh5kVS2Gz1NcAGW
         BJ3fb3WzJXuRpicLG42jmlMqyXoGjjJcxObZSzemv327QKAwbHs1Wl/QC+B0B/LI+EN4
         bNOSPQAw2HQBYD/d+r2Nh7DDw//Fwd1TYlyhYMJlvmKzHxHyluaHGOev2TElQv4s5X9v
         Celg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1681203850; x=1683795850;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LL/o4qKVIRqFbGelbRXRg3NXXG7FRRJ4+MdbTu1yY+0=;
        b=SsKNQoayvw10TceZnvxMXbmGMNXg6UeT3bQZdOHkzAim1BwgHZgBNx3lO43RadQZx+
         ApGS4lpjCkkCN+LSr9Wtrtr9VPfvR0NiX+pvhqDQelhYNYe+D35oBz9c5LLKF609zs/n
         CT33DgDZ6h2TMfTt9jQOkv6+1C4gnVaf8wpiSdVW0Az08X2cFDXnKhH19/1CFTqlWMkC
         37DbkWlB2RupwnOh/IsYXeEBkSiBnsJhwtApBCzrwFFHLx3lt2ljWkbWGeMoEY+R6HK3
         /9Yj6x84In2TqCdwFjz6PXZVG21TGIkEkyI1JEt/FFdLByClszYkZUfeopD2LL6w+zjE
         ZJXA==
X-Gm-Message-State: AAQBX9eUtEAeD84p0z1IxobTVG4cC06+GbagadO8I9LBOHbGy2giDdzB
	2Y618ZvGYRvnphtngTemV973yOrJaQs=
X-Google-Smtp-Source: AKy350Z4yvhOT00LuS6/SD74rnlcFSfs8WUS8AUtEWMknyBXD8ngJvFkQlF/4G+azCQpekWnvx6Aug==
X-Received: by 2002:a17:907:6d08:b0:94a:6071:d613 with SMTP id sa8-20020a1709076d0800b0094a6071d613mr8836265ejc.64.1681203850113;
        Tue, 11 Apr 2023 02:04:10 -0700 (PDT)
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with ESMTPSA id h22-20020a1709063b5600b0094cafa4fb8bsm1096040ejf.124.2023.04.11.02.04.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Apr 2023 02:04:09 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Martin Jansa <Martin.Jansa@gmail.com>
Subject: [PATCH 1/3] populate_sdk_ext.bbclass: set METADATA_REVISION with an DISTRO override
Date: Tue, 11 Apr 2023 11:03:46 +0200
Message-Id: <20230411090348.2434686-1-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 11 Apr 2023 09:04:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/179911

* otherwise it ends '<unknown>' inside esdk, because of parsing order:
  # $METADATA_REVISION [3 operations]
  #   set /OE/build/test-D/conf/local.conf:43
  #     "f2da54ef432eac89b0f18eaad68e602b6990b5de"
  #   immediate /OE/build/test-D/layers/poky/meta/classes/metadata_scm.bbclass:9
  #     "${@oe.buildcfg.detect_revision(d)}"
  #   set /OE/build/test-D/layers/poky/meta/classes/metadata_scm.bbclass:10
  #     [vardepvalue] "${METADATA_REVISION}"
  # pre-expansion value:
  #   "<unknown>"
  METADATA_REVISION="<unknown>"

* This causes base-files.do_install and following tasks to have different
  signatures between esdk and the build directory where this esdk was created:

  bitbake-diffsigs {test-D,poky/build-uninative-disabled}/tmp/stamps/qemux86_64-poky-linux/base-files/*do_install*sigdata*
  NOTE: Starting bitbake server...
  basehash changed from 5b6981cf58bfd57d416b0e31611b73a26baae635dd1ac31c08d46f95064c3ffc to dbdce042da4d7813d632b6d1cc87a16f728ad20e55fecbc392830e6acf72babd
  Variable METADATA_REVISION value changed from '<unknown>' to 'f2da54ef432eac89b0f18eaad68e602b6990b5de'

  and an warning from "python3 /OE/build/test-D/ext-sdk-prepare.py" when eSDK is being prepared for use:
  WARNING: The base-files:do_install sig is computed to be 83b9c9a6ef1145baac5a1e0d08814b9156af239c58fc42df95c25a9cd8a7f201,
    but the sig is locked to 3dc22233059075978e5503691e98e79e7cc60db94259dfcd886bca2291c0add7 in SIGGEN_LOCKEDSIGS_t-qemux86-64

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/classes-recipe/populate_sdk_ext.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes-recipe/populate_sdk_ext.bbclass b/meta/classes-recipe/populate_sdk_ext.bbclass
index f619fc9011..7f55c83ee2 100644
--- a/meta/classes-recipe/populate_sdk_ext.bbclass
+++ b/meta/classes-recipe/populate_sdk_ext.bbclass
@@ -376,7 +376,7 @@ python copy_buildsystem () {
             f.write('BUILDCFG_HEADER = ""\n\n')
 
             # Write METADATA_REVISION
-            f.write('METADATA_REVISION = "%s"\n\n' % d.getVar('METADATA_REVISION'))
+            f.write('METADATA_REVISION:%s = "%s"\n\n' % (d.getVar('DISTRO'), d.getVar('METADATA_REVISION')))
 
             f.write('# Provide a flag to indicate we are in the EXT_SDK Context\n')
             f.write('WITHIN_EXT_SDK = "1"\n\n')
-- 
2.40.0


