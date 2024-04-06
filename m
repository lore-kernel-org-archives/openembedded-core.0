Return-Path: <asharma@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4F104CD1284
	for <webhook@archiver.kernel.org>; Sat,  6 Apr 2024 18:46:20 +0000 (UTC)
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
 by mx.groups.io with SMTP id smtpd.web11.43077.1712429171861557402
 for <openembedded-core@lists.openembedded.org>;
 Sat, 06 Apr 2024 11:46:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=Ivih8GxT;
 spf=pass (domain: mvista.com, ip: 209.85.214.169, mailfrom: asharma@mvista.com)
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-1e3f6f03594so527095ad.0
        for <openembedded-core@lists.openembedded.org>; Sat, 06 Apr 2024 11:46:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1712429171; x=1713033971; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=zTdVWbpudmjRKQ8KJOYzwKNgEUwsS0etkS+ND12mSJI=;
        b=Ivih8GxT48hbqXONDyGfEFSnHsMgqKy4+gsV2FG9lFeNIXSggDd5RV+HVFd58Mfcjw
         CcG0TQzKJdFXazwU5+LfeLkiXMfTG18Dt47i+jCdXywirPpVmjcyNPNp26/fI0Ew/w27
         3l2EZJ+ebzLvm44bjyZuCo7Qn/cR8AKSN9oC0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712429171; x=1713033971;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zTdVWbpudmjRKQ8KJOYzwKNgEUwsS0etkS+ND12mSJI=;
        b=sQZBV4utJouEeaM2A6dpEKLDMjQx5zZCaykMfvzt4IApNDOBfQJMGMK9MeSAlGmTD9
         QvJPYmbvqi6y6Wc0JzX5+QfaWG1R/Ay/+9N3OQxZF6898ZChDzegMgEUFS5Me2ohe81Q
         +LAOGZJPeifhBajNK48ozglrwRTUwmAyjQgs5K0Us+orqeGRsVPX6QM2juex+6KsDadq
         ESa16/tB3dnMhMCM/qAbJiA+U75+s/PUogek1GWfGVkLnTthfrvvaFxpnzkh0TfxLB9x
         0yKc2lt80DwxGgkjEF3OgaETRX0ycddxX/hxj+D2TheMzKo92Jj+nuGZfWYSEp4dKxcC
         xGkA==
X-Gm-Message-State: AOJu0YzyHi1mJV8ytLEx0svOo/kdekmBaXyWMx2B5ehr6581606I1PV5
	8ZCz78awroa5rgnTm2UxyjGz0j+KWRE3LoK1HQCPBatkC1xXEs0N/z9wGGV/rQ26zNQilmCGgXH
	G
X-Google-Smtp-Source: AGHT+IHCTUYxd3HN00MG2hd8WOkedOo4edbxRqk+fw/+5YY/uxidqCYnJ1YYPkdfUwRxdlzJQEocwA==
X-Received: by 2002:a17:902:f544:b0:1df:fe8a:2284 with SMTP id h4-20020a170902f54400b001dffe8a2284mr5597967plf.8.1712429171046;
        Sat, 06 Apr 2024 11:46:11 -0700 (PDT)
Received: from asharma-Latitude-3400 ([223.190.80.10])
        by smtp.gmail.com with ESMTPSA id u5-20020a170902e80500b001db8145a1a2sm3691395plg.274.2024.04.06.11.46.08
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 06 Apr 2024 11:46:10 -0700 (PDT)
Received: by asharma-Latitude-3400 (sSMTP sendmail emulation); Sun, 07 Apr 2024 00:13:54 +0530
From: Ashish Sharma <asharma@mvista.com>
To: openembedded-core@lists.openembedded.org
Cc: Ashish Sharma <asharma@mvista.com>
Subject: [OE-core][dunfell][PATCH] xserver-xorg: Backport fix for CVE-2024-31081
Date: Sun,  7 Apr 2024 00:13:53 +0530
Message-Id: <20240406184353.2269-1-asharma@mvista.com>
X-Mailer: git-send-email 2.24.4
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 06 Apr 2024 18:46:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/197997

Upstream-Status: Backport [https://gitlab.freedesktop.org/xorg/xserver/-/commit/3e77295f888c67fc7645db5d0c00926a29ffecee]
Signed-off-by: Ashish Sharma <asharma@mvista.com>
---
 .../xserver-xorg/CVE-2024-31081.patch         | 47 +++++++++++++++++++
 .../xorg-xserver/xserver-xorg_1.20.14.bb      |  1 +
 2 files changed, 48 insertions(+)
 create mode 100644 meta/recipes-graphics/xorg-xserver/xserver-xorg/CVE-2024-31081.patch

diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xorg/CVE-2024-31081.patch b/meta/recipes-graphics/xorg-xserver/xserver-xorg/CVE-2024-31081.patch
new file mode 100644
index 0000000000..d2c551a0e5
--- /dev/null
+++ b/meta/recipes-graphics/xorg-xserver/xserver-xorg/CVE-2024-31081.patch
@@ -0,0 +1,47 @@
+From 3e77295f888c67fc7645db5d0c00926a29ffecee Mon Sep 17 00:00:00 2001
+From: Alan Coopersmith <alan.coopersmith@oracle.com>
+Date: Fri, 22 Mar 2024 18:56:27 -0700
+Subject: [PATCH] Xi: ProcXIPassiveGrabDevice needs to use unswapped length to
+ send reply
+
+CVE-2024-31081
+
+Fixes: d220d6907 ("Xi: add GrabButton and GrabKeysym code.")
+Signed-off-by: Alan Coopersmith <alan.coopersmith@oracle.com>
+Part-of: <https://gitlab.freedesktop.org/xorg/xserver/-/merge_requests/1463>
+
+Upstream-Status: Backport [https://gitlab.freedesktop.org/xorg/xserver/-/commit/3e77295f888c67fc7645db5d0c00926a29ffecee]
+CVE: CVE-2024-31081
+Signed-off-by: Ashish Sharma <asharma@mvista.com>
+
+ Xi/xipassivegrab.c | 5 ++++-
+ 1 file changed, 4 insertions(+), 1 deletion(-)
+
+diff --git a/Xi/xipassivegrab.c b/Xi/xipassivegrab.c
+index c9ac2f8553..896233bec2 100644
+--- a/Xi/xipassivegrab.c
++++ b/Xi/xipassivegrab.c
+@@ -93,6 +93,7 @@ ProcXIPassiveGrabDevice(ClientPtr client)
+     GrabParameters param;
+     void *tmp;
+     int mask_len;
++    uint32_t length;
+ 
+     REQUEST(xXIPassiveGrabDeviceReq);
+     REQUEST_FIXED_SIZE(xXIPassiveGrabDeviceReq,
+@@ -247,9 +248,11 @@ ProcXIPassiveGrabDevice(ClientPtr client)
+         }
+     }
+ 
++    /* save the value before SRepXIPassiveGrabDevice swaps it */
++    length = rep.length;
+     WriteReplyToClient(client, sizeof(rep), &rep);
+     if (rep.num_modifiers)
+-        WriteToClient(client, rep.length * 4, modifiers_failed);
++        WriteToClient(client, length * 4, modifiers_failed);
+ 
+  out:
+     free(modifiers_failed);
+-- 
+GitLab
+
diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xorg_1.20.14.bb b/meta/recipes-graphics/xorg-xserver/xserver-xorg_1.20.14.bb
index a879e77144..9e8ad7b1e5 100644
--- a/meta/recipes-graphics/xorg-xserver/xserver-xorg_1.20.14.bb
+++ b/meta/recipes-graphics/xorg-xserver/xserver-xorg_1.20.14.bb
@@ -32,6 +32,7 @@ SRC_URI += "file://0001-xf86pciBus.c-use-Intel-ddx-only-for-pre-gen4-hardwar.pat
            file://CVE-2024-21886-2.patch \
            file://CVE-2024-0408.patch \
            file://CVE-2024-0409.patch \
+           file://CVE-2024-31081.patch \
 "
 SRC_URI[md5sum] = "453fc86aac8c629b3a5b77e8dcca30bf"
 SRC_URI[sha256sum] = "54b199c9280ff8bf0f73a54a759645bd0eeeda7255d1c99310d5b7595f3ac066"
-- 
2.24.4


