Return-Path: <oecore.mailinglist@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 73F88E77173
	for <webhook@archiver.kernel.org>; Fri,  6 Dec 2024 16:48:42 +0000 (UTC)
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
 by mx.groups.io with SMTP id smtpd.web11.41750.1733503712047888473
 for <openembedded-core@lists.openembedded.org>;
 Fri, 06 Dec 2024 08:48:32 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=XHgmI6qG;
 spf=pass (domain: gmail.com, ip: 209.85.128.44, mailfrom: oecore.mailinglist@gmail.com)
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-434a736518eso26213215e9.1
        for <openembedded-core@lists.openembedded.org>; Fri, 06 Dec 2024 08:48:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733503710; x=1734108510; darn=lists.openembedded.org;
        h=message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=p28yuK81zSUlrAUfEaioVghCxhbp9GYf2yZsI7UlAm4=;
        b=XHgmI6qGjAaBs1Pual92EJg/Zh0Nw65rwSN5MfdXTGhJb5f3pERinz3yprQqzSPH3D
         YNe2Jg+zDNWemdHDZGPjidjStyffDoF+A6t2cw7HE6aHU0YRXge9fgKkmtHF7lbL1qHe
         AJ5Ov7UCzKikQwO/OIfPd0odxZ1pozDzZALRLPMhLEYG+Aup0ScRdmHYqe/Bim5yt+nQ
         dny5JgGmfK3PUqadUvyB/lcrVv/vbFQgt5XwX/4BfoSPqFqk7OYMYSKM2sKGf0tACodg
         jd7kVuO34SkCETH2rMNieLewgNrHgob5ryf75/w6gpGOvGXt0IasIh2PLEdiwDCDPMzf
         Qmhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733503710; x=1734108510;
        h=message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=p28yuK81zSUlrAUfEaioVghCxhbp9GYf2yZsI7UlAm4=;
        b=udn68Zu93+m/1Qv8UkN/NRuedDRpjud7Yw7OPqjPeF+zneNnx57K/GeRH7VXxQqu6p
         z+okANNfYGCWdJsITdpRfBg1g/euBKdEfzpZEDRwkjZuJcOn4diSF8C8cR4BH66Z4qqT
         cZ2yZc6Q5J89bxMz1ELpXA84WY8lj2oWSg+GoH3j+ajeruPIcToCseibjogTv1TfjGAp
         nWcZeOENrtQI+r6tHRbB9+KzcDmld1/l7NflaIW3QsGOV+ZYarTtaPXublFHxuL6ECTc
         6YKmqvc3enU8mQYoJs1DcktISwPrnEmZdD2cvNUMWiDSHEeW6UmtoKFYa4bG28XBW2yq
         SzAQ==
X-Gm-Message-State: AOJu0Yxy9ONzbIHwsATeu3MJCkko8H0A5RqBAymY5/EeFurFYK7xDSnq
	j2bDkrqzLcpWIYa9a6AlJR0EfjtAEE/Lw6Mt2wQksSP9Yc/qXd37OpBpJ7Ha
X-Gm-Gg: ASbGnctN8PLduvHKNpJ5pHnj3hYpXfq0hzX9YBDb+klA4mDt6Ft+OwXjzcrBH4HYZkj
	zWtHAvYBLGxOoCPc0IBuWe8gu1RQCH1O1IK4m7GlVeKyDCxeoIeDKDKQz4RssCQb/foigGtqTcU
	ZRRPaYr1d84n8UBp6cDEME++1pY2R9EZ22VvCfJp+agDBKP2Le4dqChNJ+/QXUzUePX57mAY7z3
	QhlYyBlyY7P5W/JD0UR10kh+FDZNFeJFTCTYLPC4K0jVPR+1GQIAwLVt0vTArs9EiFtdOkbwp8/
	5Ah0gO3q79Q517nDh0MDeo3VSrPPRYfHSbuLx9DPTr7QlLQ5
X-Google-Smtp-Source: AGHT+IGrSUl/G2LvewqS6pMJV1f+OlgsArFXUI4DTCF7lGHrn53jeWMK2M0g4AQfsXQSMBXmB84V0g==
X-Received: by 2002:a05:6000:1a86:b0:385:fe66:9f32 with SMTP id ffacd0b85a97d-3862b3db6fbmr2769058f8f.52.1733503709915;
        Fri, 06 Dec 2024 08:48:29 -0800 (PST)
Received: from t460s-2.fritz.box (77.118.58.106.wireless.dyn.drei.com. [77.118.58.106])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-386219095d3sm5048089f8f.71.2024.12.06.08.48.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Dec 2024 08:48:28 -0800 (PST)
From: Robert Berger <oecore.mailinglist@gmail.com>
X-Google-Original-From: Robert Berger <Robert.Berger@ReliableEmbeddedSystems.com>
To: openembedded-core@lists.openembedded.org
Cc: Robert Berger <Robert.Berger@ReliableEmbeddedSystems.com>
Subject: [PATCH v2] wic: bootimg-pcbios.py: optionally pass 'initrd' from .wks(.in) via sourceparams
Date: Fri,  6 Dec 2024 17:48:22 +0100
Message-Id: <20241206164822.18330-1-Robert.Berger@ReliableEmbeddedSystems.com>
X-Mailer: git-send-email 2.17.1
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 06 Dec 2024 16:48:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/208432

optionally allow to pass 'initrd' from .wks(.in) via sourceparams

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


