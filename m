Received: from mail-pj1-f68.google.com (mail-pj1-f68.google.com [209.85.216.68])
 by mx.groups.io with SMTP id smtpd.web10.6500.1601503935786250884
 for <openembedded-core@lists.openembedded.org>;
 Wed, 30 Sep 2020 15:12:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=lMsTSSJw;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.68, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f68.google.com with SMTP id j19so683286pjl.4
        for <openembedded-core@lists.openembedded.org>; Wed, 30 Sep 2020 15:12:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=Xy3/M73x0hgxv9hIY54nvgglKW8vA4sNbkwnONq62Ks=;
        b=lMsTSSJwmYHds2gSL1rzYJezxLLmDlitESPLbWDprLK0xQIOb6CBi9uXlYtZDrvtnM
         Kd38G5QGqL755lwTlbIJWKbilxvoMEIFWoX3PW9j4VsurY96PVokKGujf7vdZPJOqDF8
         0QgV3mdY0tFhIjP/Xz2S2+8KoraNe1soyPINSKC/tKnL0VK5qJRTgs7E1ak7qVqpJ2tG
         zMrEqRuBQMBxW3siHQfuZQhwFKTYqFN+YmizhHYNG7zl5XYyb6U6/RVHwEQMAnagJdJj
         22V+/res2lxJ6JcnUyU8bLTzDxZ7ldQ0/DP7Q2txFZRiziVCMTqgLFsFZJSN1JfzIY7n
         RJbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=Xy3/M73x0hgxv9hIY54nvgglKW8vA4sNbkwnONq62Ks=;
        b=Uvx4oht/36Y17MmqZdlKryt988N2ZwhXF1rO+BfOP+E+VhCN+t65Q0hwj27PJ3Q5R5
         2UPK+KyBWo4p0A3o3VwKVh8oqob2W1wHc8708KJD+rmyKvACHtmhnIxEKowtosRI5Nly
         Mg9UTkhLeCopxx3bz20HfVh2HZwxj+C9ICLJM1G7po8mvu/YEt9aN1jvvMwD9IB4Ig7p
         XmeqNCSF7TUXQ+9zVjsDSCch14e5sPJdFe23K/2xmmG0ceyb+XALFHkxbYCTR8ZRXuvA
         rNm53oBhQ3uSoxZ15zMDBxCh93DqDSfVWAnhqmWv31pMWgHLZaGl+I/7MIjuav1TTHHQ
         1oMg==
X-Gm-Message-State: AOAM531gVQjU/nKVyz9tZZmVtQZuxLwWshTVl+xqRsBrHfy066g/jAht
	gFjAmSjf/n3XdJwmA6qWv0qNKDZsKYr5EF9wphg=
X-Google-Smtp-Source: ABdhPJxHxNvpsofIpoBQ3pTrW8US+4bXfVuJ6pvoSGqzVl/Lr+NxtIY9dPc4K5tlgaefC3lv4foSJg==
X-Received: by 2002:a17:90b:e01:: with SMTP id ge1mr4123222pjb.187.1601503934825;
        Wed, 30 Sep 2020 15:12:14 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from octo.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id k6sm3488799pfh.92.2020.09.30.15.12.13
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Sep 2020 15:12:14 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 05/41] qemu : fix CVE-2020-16092
Date: Wed, 30 Sep 2020 12:11:07 -1000
Message-Id: <6007398a0ff468c0b15c4982d7f04e6186d6d700.1601502610.git.steve@sakoman.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1601502610.git.steve@sakoman.com>
References: <cover.1601502610.git.steve@sakoman.com>

From: Chee Yang Lee <chee.yang.lee@intel.com>

Signed-off-by: Chee Yang Lee <chee.yang.lee@intel.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-devtools/qemu/qemu.inc           |  1 +
 .../qemu/qemu/CVE-2020-16092.patch            | 45 +++++++++++++++++++
 2 files changed, 46 insertions(+)
 create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2020-16092.patch

diff --git a/meta/recipes-devtools/qemu/qemu.inc b/meta/recipes-devtools/qemu/qemu.inc
index e0ea5ad477..7ce89c0023 100644
--- a/meta/recipes-devtools/qemu/qemu.inc
+++ b/meta/recipes-devtools/qemu/qemu.inc
@@ -47,6 +47,7 @@ SRC_URI = "https://download.qemu.org/${BPN}-${PV}.tar.xz \
 	   file://CVE-2020-15863.patch \
 	   file://CVE-2020-14364.patch \
 	   file://CVE-2020-14415.patch \
+	   file://CVE-2020-16092.patch \
 	   "
 UPSTREAM_CHECK_REGEX = "qemu-(?P<pver>\d+(\.\d+)+)\.tar"
 
diff --git a/meta/recipes-devtools/qemu/qemu/CVE-2020-16092.patch b/meta/recipes-devtools/qemu/qemu/CVE-2020-16092.patch
new file mode 100644
index 0000000000..5085a28a4f
--- /dev/null
+++ b/meta/recipes-devtools/qemu/qemu/CVE-2020-16092.patch
@@ -0,0 +1,45 @@
+From 035e69b063835a5fd23cacabd63690a3d84532a8 Mon Sep 17 00:00:00 2001
+From: Mauro Matteo Cascella <mcascell@redhat.com>
+Date: Sat, 1 Aug 2020 18:42:38 +0200
+Subject: [PATCH] hw/net/net_tx_pkt: fix assertion failure in
+ net_tx_pkt_add_raw_fragment()
+
+An assertion failure issue was found in the code that processes network packets
+while adding data fragments into the packet context. It could be abused by a
+malicious guest to abort the QEMU process on the host. This patch replaces the
+affected assert() with a conditional statement, returning false if the current
+data fragment exceeds max_raw_frags.
+
+Reported-by: Alexander Bulekov <alxndr@bu.edu>
+Reported-by: Ziming Zhang <ezrakiez@gmail.com>
+Reviewed-by: Dmitry Fleytman <dmitry.fleytman@gmail.com>
+Signed-off-by: Mauro Matteo Cascella <mcascell@redhat.com>
+Signed-off-by: Jason Wang <jasowang@redhat.com>
+
+
+Upstream-Status: Backport [https://git.qemu.org/?p=qemu.git;a=commit;h=035e69b063835a5fd23cacabd63690a3d84532a8]
+CVE: CVE-2020-16092
+Signed-off-by: Chee Yang Lee <chee.yang.lee@intel.com>
+---
+ hw/net/net_tx_pkt.c | 5 ++++-
+ 1 file changed, 4 insertions(+), 1 deletion(-)
+
+diff --git a/hw/net/net_tx_pkt.c b/hw/net/net_tx_pkt.c
+index 9560e4a..da262ed 100644
+--- a/hw/net/net_tx_pkt.c
++++ b/hw/net/net_tx_pkt.c
+@@ -379,7 +379,10 @@ bool net_tx_pkt_add_raw_fragment(struct NetTxPkt *pkt, hwaddr pa,
+     hwaddr mapped_len = 0;
+     struct iovec *ventry;
+     assert(pkt);
+-    assert(pkt->max_raw_frags > pkt->raw_frags);
++
++    if (pkt->raw_frags >= pkt->max_raw_frags) {
++        return false;
++    }
+ 
+     if (!len) {
+         return true;
+-- 
+1.8.3.1
+
-- 
2.17.1

