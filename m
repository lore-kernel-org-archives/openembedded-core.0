Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F1134C71148
	for <webhook@archiver.kernel.org>; Fri, 13 Jun 2025 16:46:56 +0000 (UTC)
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
 by mx.groups.io with SMTP id smtpd.web11.1976.1749833206580669905
 for <openembedded-core@lists.openembedded.org>;
 Fri, 13 Jun 2025 09:46:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=PLLK8ELV;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.52, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-3a52874d593so2289158f8f.0
        for <openembedded-core@lists.openembedded.org>; Fri, 13 Jun 2025 09:46:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1749833204; x=1750438004; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=b6rGJZne9cKL9BmL97K/I9BT99rEoCl0umSqLHroNi0=;
        b=PLLK8ELVNftie3x3c3ZlAl13PD7oAjslamitF+sik4PrSQA61Cjm1JozwMPG9YtwNZ
         2upD3dJNtH9bJjGL9EnPCM3k3MUr/bp2cM0RG/c24QZ6gwjPsqCj8zeCHkwhIsVvHx+B
         hyyh0hir4G0exb9qSlttfFiFCtJBWhiUHPSNk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749833204; x=1750438004;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=b6rGJZne9cKL9BmL97K/I9BT99rEoCl0umSqLHroNi0=;
        b=ZAttw1bhBWqadvVi1x/lERr0pYQxPuyXSBicDmNTg7laGwiflMBgMaTOkbBDrzNHyK
         iUyLBjdqsgYBWQrWg7rGgAWtqFgNmc08bL+0n13xHVvUVBwA8YkkdOdXhz1JF0L13r0u
         LgZKr2+CI5ZPqUTGiWSuqFYmLULbGhTAAnKxVRHLFNyWpNBQl/ePZN5+oKqwzBUxpwva
         WGYWtQznAAGJ4dYq3xf+LcGLV9suU/ApeIxNYEnvMH6rXF+p8leoT+lVWNd18vGKLElD
         eDKP5ZFhXK92ETt6HnqscUt7scmPWh9SscJk/Libfugo9H7QcOpxMWqF7n7kXtacpcTh
         vy2w==
X-Gm-Message-State: AOJu0YzZHJc/A7ej+5bTnahbr3hQBLXBsb9TdCekZWRnmqjWFOVRA649
	WwA7REUMyDjcrkjmnWA3XLVPrZyln8syp9uz/jbKbR16hTe3dGnMamGSI/PEYQdsJf2eiWmwe7b
	+Nuo2V8Y=
X-Gm-Gg: ASbGncvpjonINUXg3o+21v3nWjzyTMJgIafcaNqWANRCYVT/G2hgidtsRySf3lWXG5Z
	n/ZlnTEoHoOF/Q0teHt8UTODUsUibpksEcUxLSpXzbKr34YXY0RR4sfUyewbXzJvdtUOsXCcG4p
	2wuPaSZDKEK6x6DER4DBYAJzt1A3HEULdk43j5kpXoK+AxaqHl03b9VV5+wAeTO5NG3eR6w/Wnn
	hxDSoKgpPRlBbzRj2JhUdpFHBfTeOAmGE6ndmFxu3k7M/8sMXIKSqyNXw0BvgLv8f235WeV2uwU
	2soIlP/skcboRcmRNwPml6TjCA2+MQAKxUGcIY+8+cUd93LJx+GmF0lXIginFQVcuyVQ8k3BkDs
	WgkxWnBllejBelsQ=
X-Google-Smtp-Source: AGHT+IHtyiCk1nirKXX+gUNRty4WpPrCgkRraOpbYHyiioJgoa8MNJRKl9f9FpghFydQtgdnIliNRQ==
X-Received: by 2002:a05:6000:2408:b0:3a5:2f23:377d with SMTP id ffacd0b85a97d-3a572e4c71emr379644f8f.50.1749833204383;
        Fri, 13 Jun 2025 09:46:44 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:3ba4:44fa:9d9b:3977])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4532e224617sm58127245e9.2.2025.06.13.09.46.43
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Jun 2025 09:46:43 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] wic: Avoid problems with "-" characters in plugin names
Date: Fri, 13 Jun 2025 17:46:42 +0100
Message-ID: <20250613164642.1614047-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 13 Jun 2025 16:46:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/218619

Remap "-" characters in plugin names to "_" so wic plugins
can be extended using standard python class inheritance.

This change means wic files can be incrementally updated over time
to the correct name rather than breaking everything. Actual plugin
module files will need to be renamed as done in previous patches.

Also remove a double call to get_plugins() which isn't needed.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 scripts/lib/wic/engine.py                | 2 ++
 scripts/lib/wic/partition.py             | 5 ++++-
 scripts/lib/wic/plugins/imager/direct.py | 2 ++
 3 files changed, 8 insertions(+), 1 deletion(-)

diff --git a/scripts/lib/wic/engine.py b/scripts/lib/wic/engine.py
index 64b1d528825..b9e60cbe4eb 100644
--- a/scripts/lib/wic/engine.py
+++ b/scripts/lib/wic/engine.py
@@ -180,6 +180,8 @@ def wic_create(wks_file, rootfs_dir, bootimg_dir, kernel_dir,
         os.makedirs(options.outdir)
 
     pname = options.imager
+    # Don't support '-' in plugin names
+    pname = pname.replace("-", "_")
     plugin_class = PluginMgr.get_plugins('imager').get(pname)
     if not plugin_class:
         raise WicError('Unknown plugin: %s' % pname)
diff --git a/scripts/lib/wic/partition.py b/scripts/lib/wic/partition.py
index 5b51ab214fe..b34691d3137 100644
--- a/scripts/lib/wic/partition.py
+++ b/scripts/lib/wic/partition.py
@@ -164,6 +164,9 @@ class Partition():
 
         plugins = PluginMgr.get_plugins('source')
 
+        # Don't support '-' in plugin names
+        self.source = self.source.replace("-", "_")
+
         if self.source not in plugins:
             raise WicError("The '%s' --source specified for %s doesn't exist.\n\t"
                            "See 'wic list source-plugins' for a list of available"
@@ -178,7 +181,7 @@ class Partition():
             splitted = self.sourceparams.split(',')
             srcparams_dict = dict((par.split('=', 1) + [None])[:2] for par in splitted if par)
 
-        plugin = PluginMgr.get_plugins('source')[self.source]
+        plugin = plugins[self.source]
         plugin.do_configure_partition(self, srcparams_dict, creator,
                                       cr_workdir, oe_builddir, bootimg_dir,
                                       kernel_dir, native_sysroot)
diff --git a/scripts/lib/wic/plugins/imager/direct.py b/scripts/lib/wic/plugins/imager/direct.py
index 2124ceac7f4..711535626bb 100644
--- a/scripts/lib/wic/plugins/imager/direct.py
+++ b/scripts/lib/wic/plugins/imager/direct.py
@@ -201,6 +201,8 @@ class DirectPlugin(ImagerPlugin):
         creating and installing a bootloader configuration.
         """
         source_plugin = self.ks.bootloader.source
+        # Don't support '-' in plugin names
+        source_plugin = source_plugin.replace("-", "_")
         disk_name = self.parts[0].disk
         if source_plugin:
             plugin = PluginMgr.get_plugins('source')[source_plugin]

