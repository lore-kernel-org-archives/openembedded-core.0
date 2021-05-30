Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
 by mx.groups.io with SMTP id smtpd.web12.34544.1622397954496895493
 for <openembedded-core@lists.openembedded.org>;
 Sun, 30 May 2021 11:05:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=YPiJDlI4;
 spf=pass (domain: gmail.com, ip: 209.85.210.177, mailfrom: akuster808@gmail.com)
Received: by mail-pf1-f177.google.com with SMTP id c12so7310672pfl.3
        for <openembedded-core@lists.openembedded.org>; Sun, 30 May 2021 11:05:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Tyxi8lJEc62ekAns+vx2Lqq+AKQdpepkbxSB/am3qHM=;
        b=YPiJDlI4IZiJFfTYpmlBH9mo4GPzqMg77e5dX3in8K1Y9ANbtcp5bQ8eYTEep17BJ3
         xbA5g0sJvtbROEJlMHQTy/PBy7RCyLSiUdFIi2mZkwzfh060OBXmsx5c4hAoWYKGIGhH
         Iwi0/KVK3HVIS8lVEjdhRFhS6VyaJMklSOapKwFQeap91ykvaEKbcaCv2rEWHR2j6YhS
         7dFjvbL1PVJXqmjB5m5X5MXfqULcT+W9aLjqf0e7iBTGaO9OgbFCaUx8ZR5Ho1jhkUv8
         cC2PkMmMqVkYhxBRdOuKRKPoq3sQz4S5gn/+8dxznN3w7Pl6DMGoe87cz5vxnsBQ8GN5
         OS5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Tyxi8lJEc62ekAns+vx2Lqq+AKQdpepkbxSB/am3qHM=;
        b=VDsg3VYKR7jTnW/T2U948J0o1qjkjYs79A8DwPETp9MEMoiJstME2IxLr25dPsVRdX
         LSD9ni6MzfmvEgmVIeD4HntDIhCZCRBrrAjRSPVugJVmZJAHi2sk18H3KazbSZSOpkyV
         uSI8woNxhhBFGUfEvAZ3A4jC/nqWaVGS+FOpUfP6h9ZmlAEOMpKIo87QKoC5DIO6Str5
         +KeH5ECKE8YRj3BRLtKF7hnWHqePK8MdXbcfOYKuZhP9MLpEa57FomdTVvNL2VdeZcQd
         somCdTjLgig2ZkqB7dEOAmrWYknladWOrz7hQaQfEWBBwPo8EjVSMvfh+q4lgD0xov//
         0upw==
X-Gm-Message-State: AOAM533mUGsIciH+b1xIfXWisEp4LmkByctxhGzXkEqNtgNX/wWCR2nx
	LDkFrDjROOLwSSh5hrENtCq6TqtKexB9vg==
X-Google-Smtp-Source: ABdhPJykz2/Opo3pguA8aOsHtthR1Jr2uZYm+ROubBK6jlzR+2NAChOaRK18iX9GhzF6AjrQ2E73gw==
X-Received: by 2002:a62:ea03:0:b029:2e7:8445:243c with SMTP id t3-20020a62ea030000b02902e78445243cmr13436509pfh.54.1622397953656;
        Sun, 30 May 2021 11:05:53 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from hilo.hsdl.ca.comcast.net (c-67-181-203-136.hsd1.ca.comcast.net. [67.181.203.136])
        by smtp.gmail.com with ESMTPSA id d127sm2918718pfc.50.2021.05.30.11.05.52
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 30 May 2021 11:05:53 -0700 (PDT)
From: "Armin Kuster" <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/2] kernel-kfrag: add new class
Date: Sun, 30 May 2021 18:05:51 +0000
Message-Id: <20210530180552.580308-1-akuster808@gmail.com>
X-Mailer: git-send-email 2.24.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This provides a common place to define kernel fragments
that may be usefull to the larger community.

Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta/classes/kernel-kfrag.bbclass | 8 ++++++++
 1 file changed, 8 insertions(+)
 create mode 100644 meta/classes/kernel-kfrag.bbclass

diff --git a/meta/classes/kernel-kfrag.bbclass b/meta/classes/kernel-kfrag.bbclass
new file mode 100644
index 00000000000..c0c5667b519
--- /dev/null
+++ b/meta/classes/kernel-kfrag.bbclass
@@ -0,0 +1,8 @@
+#
+# Class to place yocto-kernel-cache fragments
+# selections usfull to anyone
+#
+
+KERNEL_FEATURES_append = " ${@bb.utils.contains("DISTRO_FEATURES", "apparmor", " features/apparmor/apparmor.scc", "" ,d)}"
+KERNEL_FEATURES_append = " ${@bb.utils.contains("DISTRO_FEATURES", "smack", " features/smack/smack.scc", "" ,d)}"
+KERNEL_FEATURES_append = " ${@bb.utils.contains("DISTRO_FEATURES", "dm-verity", " features/device-mapper/dm-verity.scc", "" ,d)}"
-- 
2.24.3

