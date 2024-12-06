Return-Path: <oecore.mailinglist@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 398F0E77173
	for <webhook@archiver.kernel.org>; Fri,  6 Dec 2024 15:58:02 +0000 (UTC)
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
 by mx.groups.io with SMTP id smtpd.web11.40261.1733500679045485550
 for <openembedded-core@lists.openembedded.org>;
 Fri, 06 Dec 2024 07:57:59 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=bEkR9rrx;
 spf=pass (domain: gmail.com, ip: 209.85.128.52, mailfrom: oecore.mailinglist@gmail.com)
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-434a8b94fb5so13696355e9.0
        for <openembedded-core@lists.openembedded.org>; Fri, 06 Dec 2024 07:57:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733500677; x=1734105477; darn=lists.openembedded.org;
        h=message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=k7T78zHSt74bU27bHvkyHswLXVsiREtaimPf39IQ97U=;
        b=bEkR9rrx8Bzlv9R64g/l9d+5WGH4MaZEMACGStPa0EMTIdehnMPgYfcjnFZ00BSY5N
         /w21w+MmeT10mo/U8982lxfhiI4UPbBnVRwnNoscidXBE4C2iJaxWznWk2exIaSi55pm
         /0dnxQkxMbbBCSH2y1I0GRkA3s+FRTf6Uu/VVVeoS4CQ+AuZgJPTzLGl5proXKH9jMJy
         u+ilvREiY2Jws0rCMB0bzbfeve0sXNrOdeFL+c8sQWklBBMFu3FMK252UqhIGpRMseV9
         CBTnn/LOZgFtvJKRdzflMGIHvVcxWxWRKN8C/1/6BcUMHPcG63UCgJ2v+Iq8LvBIG8lB
         ohjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733500677; x=1734105477;
        h=message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=k7T78zHSt74bU27bHvkyHswLXVsiREtaimPf39IQ97U=;
        b=ld00G65ggdv4sF2IgPUIQepgILekbUlaW/5BF5kmovBwqxnbPsoFGupSaoVuqtaM2I
         OlvC9yXLps69jzpbSFQYE+7eZ05M348ODH1aZtOD3DyugyCEb70B+fYhwiA7xs/fg30v
         ZxtCWa/ccUqwz2146zhM0oBFx4CCeMUUs3bQgTM5IpeSEoS1fNhKaV98wjv6vZl6NpHG
         C39m5u5ZUQRKn2BzGUMevh72TLDNeAd5XhlJrYRcrQa32cQQ/OZgSYEDdwgh3lXlj2tE
         ekCxQ+e79qCe6YLg3cJqtMN/DtTi089C1Z9AsfMmzekvFd707tYNnfDGWlUio9CjBW1h
         u5gQ==
X-Gm-Message-State: AOJu0YzS4TF2eS+8S1LAZ/sOiY2m4Ju2MSIKiB2+5F2AQ6bmtJZWp9oy
	h7A1UbZEZqWneL5MhA1OOOsscTk099c1lbpLK88GETGqm18lp9Yy4dFUiRsV
X-Gm-Gg: ASbGncvw0iazMk2rmKhmqTMWRJdLcUu2iQ8alN3LI5FHgcH2oDOjhL0kIx8MzlXSgK+
	1eNmIj+LQT+z4rV/u2myDMfMTzz6GjP46jaEwrd40vOq2aY/lzzfl+DJa6eR19nsPeFTDA+QeS5
	Qxieq81yxcAB+HwDarbt752xBpRoI+K2DQdw08kNGs7D031rCMx5ijXZb+bglLmR1jpGQ0fsPx2
	wQw9CDte2AX7YGKSQCSJ+fMD6lOOJE+X0Tdwn16kg8Fe1xwvVbNlbazaahvnXWP3oRMT9lQAH30
	PlvHkt3QAu1kxEvkUZRt/XWIbe8ReKu0RjfK8FTmNl723mfC
X-Google-Smtp-Source: AGHT+IEeJVMJ5jXYlVOWTt52EELK1Mlyb6qL+yHY33iiNNrFw3e2EeQ0U+CL1TTiMRP82QzjtE66tQ==
X-Received: by 2002:a05:600c:548b:b0:42c:b98d:b993 with SMTP id 5b1f17b1804b1-434ddeade9fmr28509835e9.2.1733500677317;
        Fri, 06 Dec 2024 07:57:57 -0800 (PST)
Received: from t460s-2.fritz.box (77.118.58.106.wireless.dyn.drei.com. [77.118.58.106])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-434d5273440sm99064875e9.18.2024.12.06.07.57.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Dec 2024 07:57:55 -0800 (PST)
From: Robert Berger <oecore.mailinglist@gmail.com>
X-Google-Original-From: Robert Berger <Robert.Berger@ReliableEmbeddedSystems.com>
To: openembedded-core@lists.openembedded.org
Cc: Robert Berger <Robert.Berger@ReliableEmbeddedSystems.com>
Subject: [PATCH] wic: bootimg-pcbios.py: optionally pass 'initrd' from .wks(.in) via sourceparams
Date: Fri,  6 Dec 2024 16:57:42 +0100
Message-Id: <20241206155742.18951-1-Robert.Berger@ReliableEmbeddedSystems.com>
X-Mailer: git-send-email 2.17.1
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 06 Dec 2024 15:58:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/208429

Signed-off-by: Robert Berger <Robert.Berger@ReliableEmbeddedSystems.com>
---
 .../lib/wic/plugins/source/bootimg-pcbios.py  | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/scripts/lib/wic/plugins/source/bootimg-pcbios.py b/scripts/lib/wic/plugins/source/bootimg-pcbios.py
index a207a83530..c31851b56a 100644
--- a/scripts/lib/wic/plugins/source/bootimg-pcbios.py
+++ b/scripts/lib/wic/plugins/source/bootimg-pcbios.py
@@ -169,6 +169,25 @@ class BootimgPcbiosPlugin(SourcePlugin):
         for install_cmd in cmds:
             exec_cmd(install_cmd)
 
+        # this is hardcoded to where the cpio.gz is deployed to
+        deploy_dir_image = get_bitbake_var("DEPLOY_DIR_IMAGE")
+        # this can be passed from the .wks.in file via sourceparams
+        initrd = source_params.get('initrd')
+        # for convenience added together
+        initrd_dir_and_file = os.path.join(deploy_dir_image, initrd)
+
+        # in case we have a separate cpio.gz let's copy it to
+        # the boot partition
+        if os.path.isfile(initrd_dir_and_file):
+            logger.debug("Found %s", initrd_dir_and_file)
+        else:
+            logger.debug("Did not find %s", initrd_dir_and_file)
+
+        new_cmd = ("install -m 444 %s %s" %
+                  (initrd_dir_and_file, hdddir))
+
+        exec_cmd(new_cmd)
+
         du_cmd = "du -bks %s" % hdddir
         out = exec_cmd(du_cmd)
         blocks = int(out.split()[0])
-- 
2.17.1


