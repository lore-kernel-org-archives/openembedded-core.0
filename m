Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
 by mx.groups.io with SMTP id smtpd.web10.37639.1597028414596178274
 for <openembedded-core@lists.openembedded.org>;
 Sun, 09 Aug 2020 20:00:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=kVvFZFeG;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.46, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f46.google.com with SMTP id c10so8260545pjn.1
        for <openembedded-core@lists.openembedded.org>; Sun, 09 Aug 2020 20:00:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=AVSglSmzEOScVjmo7ZSpscab+jXbOijyE7FTKgc99zE=;
        b=kVvFZFeGnLczUgqHOA4jh9OaTrGXLRXuZigva9AYEzFvhAasRxn1jJddCR8gvj7nJM
         YELH/UfSJhlPAKsGNmGc4k5+zMVcED9mgcivkAUnkK4WlqxUm4AGpkKwrzB9sq2oEt/k
         ih1q53Nnf19w9bYtbwpJYSC2WMmX0jYraCbd8u+4rEDth7Z1P7WLscS5Q97P+f6+mh8l
         TaJNiQ+E3yI7t4I4UAiHhkrloRGHJkQs26Pp/Y9TGdRMZp6arGJjsC+VFoJL/IGM5oId
         9rn6G8l8lxd+C3+663a4lmrr0NqRaYhHefddqu37tEEkEIFaoHFTOsV6sELMuow2nlY7
         4jsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=AVSglSmzEOScVjmo7ZSpscab+jXbOijyE7FTKgc99zE=;
        b=lP47M22uQP39YRJMrgO65RnXhtLkSb4YfFlzX8sKv6LfSEWtudiq8y/N3XFxXetwg/
         go7tG9rDnaVq1Ly7nFFB4OrBItIVDaEL/81t6xL3JKvr2wPFUmyIO8k+3LJZs6IOPbPJ
         3BKM3UfAoAUcTOJfnYy71EFeg5xNsf/YvIJEAt5HVXsehv/xWgkKVoZ7/czKCUlrgRxR
         gYr9U23vscv3SEklon/WBch/Mq3IQJ8/sZSJd/5oq9qpli2FSSete3GIuToq81eNjvE+
         1FUtDJ4Md0jzBGoORleqyAL+2pfq7X7o5roAob7G+nZ/24GB3ft4UI0UKjuOApzmjjFT
         BzmQ==
X-Gm-Message-State: AOAM532m/g40HDt5mM9z0Om86XL4NmCB6Uk26C2I4Km/qfksMenL7gZb
	mWaH892VRJWw4vM9PGqOARJCU1mG3q0hXQ==
X-Google-Smtp-Source: ABdhPJzOoutfziuTiT2v0uOMelDTzN0n0v+kxUIVesOPIVhfiUx4w/uyGop8u7zWxtsYiBcr2PKPzA==
X-Received: by 2002:a17:90b:c90:: with SMTP id o16mr23310613pjz.79.1597028413588;
        Sun, 09 Aug 2020 20:00:13 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from octo.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id e23sm7187271pgb.79.2020.08.09.20.00.12
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 09 Aug 2020 20:00:13 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 13/19] qemu: fix CVE-2020-15863
Date: Sun,  9 Aug 2020 16:59:19 -1000
Message-Id: <d6eb50dfe66838e6bea061cbd1a120981777b700.1597028036.git.steve@sakoman.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1597028036.git.steve@sakoman.com>
References: <cover.1597028036.git.steve@sakoman.com>

From: Lee Chee Yang <chee.yang.lee@intel.com>

Signed-off-by: Lee Chee Yang <chee.yang.lee@intel.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-devtools/qemu/qemu.inc           |  1 +
 .../qemu/qemu/CVE-2020-15863.patch            | 63 +++++++++++++++++++
 2 files changed, 64 insertions(+)
 create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2020-15863.patch

diff --git a/meta/recipes-devtools/qemu/qemu.inc b/meta/recipes-devtools/qemu/qemu.inc
index 24b0379de4..49dbb1c13d 100644
--- a/meta/recipes-devtools/qemu/qemu.inc
+++ b/meta/recipes-devtools/qemu/qemu.inc
@@ -44,6 +44,7 @@ SRC_URI = "https://download.qemu.org/${BPN}-${PV}.tar.xz \
 	   file://CVE-2020-13659.patch \
 	   file://CVE-2020-13800.patch \
 	   file://CVE-2020-13362.patch \
+	   file://CVE-2020-15863.patch \
 	   "
 UPSTREAM_CHECK_REGEX = "qemu-(?P<pver>\d+(\.\d+)+)\.tar"
 
diff --git a/meta/recipes-devtools/qemu/qemu/CVE-2020-15863.patch b/meta/recipes-devtools/qemu/qemu/CVE-2020-15863.patch
new file mode 100644
index 0000000000..1505c7eed0
--- /dev/null
+++ b/meta/recipes-devtools/qemu/qemu/CVE-2020-15863.patch
@@ -0,0 +1,63 @@
+From 5519724a13664b43e225ca05351c60b4468e4555 Mon Sep 17 00:00:00 2001
+From: Mauro Matteo Cascella <mcascell@redhat.com>
+Date: Fri, 10 Jul 2020 11:19:41 +0200
+Subject: [PATCH] hw/net/xgmac: Fix buffer overflow in xgmac_enet_send()
+
+A buffer overflow issue was reported by Mr. Ziming Zhang, CC'd here. It
+occurs while sending an Ethernet frame due to missing break statements
+and improper checking of the buffer size.
+
+Reported-by: Ziming Zhang <ezrakiez@gmail.com>
+Signed-off-by: Mauro Matteo Cascella <mcascell@redhat.com>
+Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
+Signed-off-by: Jason Wang <jasowang@redhat.com>
+
+Upstream-Status: Backport [https://git.qemu.org/?p=qemu.git;a=commitdiff;h=5519724a13664b43e225ca05351c60b4468e4555]
+CVE: CVE-2020-15863
+Signed-off-by: Chee Yang Lee <chee.yang.lee@intel.com>
+
+---
+ hw/net/xgmac.c | 14 ++++++++++++--
+ 1 file changed, 12 insertions(+), 2 deletions(-)
+
+diff --git a/hw/net/xgmac.c b/hw/net/xgmac.c
+index 574dd47..5bf1b61 100644
+--- a/hw/net/xgmac.c
++++ b/hw/net/xgmac.c
+@@ -220,21 +220,31 @@ static void xgmac_enet_send(XgmacState *s)
+         }
+         len = (bd.buffer1_size & 0xfff) + (bd.buffer2_size & 0xfff);
+ 
++        /*
++         * FIXME: these cases of malformed tx descriptors (bad sizes)
++         * should probably be reported back to the guest somehow
++         * rather than simply silently stopping processing, but we
++         * don't know what the hardware does in this situation.
++         * This will only happen for buggy guests anyway.
++         */
+         if ((bd.buffer1_size & 0xfff) > 2048) {
+             DEBUGF_BRK("qemu:%s:ERROR...ERROR...ERROR... -- "
+                         "xgmac buffer 1 len on send > 2048 (0x%x)\n",
+                          __func__, bd.buffer1_size & 0xfff);
++            break;
+         }
+         if ((bd.buffer2_size & 0xfff) != 0) {
+             DEBUGF_BRK("qemu:%s:ERROR...ERROR...ERROR... -- "
+                         "xgmac buffer 2 len on send != 0 (0x%x)\n",
+                         __func__, bd.buffer2_size & 0xfff);
++            break;
+         }
+-        if (len >= sizeof(frame)) {
++        if (frame_size + len >= sizeof(frame)) {
+             DEBUGF_BRK("qemu:%s: buffer overflow %d read into %zu "
+-                        "buffer\n" , __func__, len, sizeof(frame));
++                        "buffer\n" , __func__, frame_size + len, sizeof(frame));
+             DEBUGF_BRK("qemu:%s: buffer1.size=%d; buffer2.size=%d\n",
+                         __func__, bd.buffer1_size, bd.buffer2_size);
++            break;
+         }
+ 
+         cpu_physical_memory_read(bd.buffer1_addr, ptr, len);
+-- 
+1.8.3.1
+
-- 
2.17.1

