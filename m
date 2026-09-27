Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8005CCA5FAD
	for <webhook@archiver.kernel.org>; Sun, 27 Sep 2026 07:43:57 +0000 (UTC)
Received: from mail-wr2-f12.google.com (mail-wr2-f12.google.com [74.125.225.76])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.33590.1790495033633574325
 for <openembedded-core@lists.openembedded.org>;
 Sun, 27 Sep 2026 00:43:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=uSrfAL3k;
 spf=pass (domain: smile.fr, ip: 74.125.225.76, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr2-f12.google.com with SMTP id ffacd0b85a97d-482f63546c5so1808015f8f.2
        for <openembedded-core@lists.openembedded.org>; Sun, 27 Sep 2026 00:43:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1790495032; x=1791099832; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=7iuWXfDwrSQbiHQEyi+M6FimvwK6XSQdDwDkIkPboLg=;
        b=uSrfAL3kUpnWZUQU+QsxbW101CgZSHMGcsSMoshoMHbUvV9R8h6xHGb71Sy7F14/aW
         Oo1HW79/LyT6einVLKKYtXreR6pCNDorLeIJo26q1dnjGCB/CO4ks6gyZemd9Q50Ojfg
         MEPUrMTm+AivHnEg6adWFeiYL9NZUmQA4JMGI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790495032; x=1791099832;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=7iuWXfDwrSQbiHQEyi+M6FimvwK6XSQdDwDkIkPboLg=;
        b=gyLXQtB4w+u8RrXKHJA/0ycJIdDuWRlKu9ttecrIluRVHveRXA+Vbnrv3cJ8UrfXbM
         mjOjdMZnVgQ1Kzw0qJ2DOp/PCANi2Ms9jm9HyOV1kl+8+l12siLHcmk0rBUDvZghPW8J
         Tza31V66o5ELEIDfFPCg/pVr/YDPjkQAKLQ0Ys7jYCIfeuQULVPLg/d5nmc0orDBLKr2
         y+u9Vg30LoSCJ9KblnyoKG0HEth2sWFCNPznjrIygOBlNtGFCOHuqWesJn/mYjK8L/nZ
         aqdax7C2rZtKGgongzHB1nvDh8QBLXLSMzXKvsc9ckpMc3UnQn7/VWWOSTQJtZBiV6jF
         NBtA==
X-Gm-Message-State: AFq9FYIxmvqLlQL/JfeDRMqr/F34ZM/nHxwjRl3X/dVnFlOsBWmwlO0w
	xns2aXpRXCrWswqmmA5c+oTI5/eomR/A64Q58/y+/ecBED2cBbfNlrPSzz9LYS8U8AvgPyfz1WE
	P+s+y34c=
X-Gm-Gg: AYBFou2f2RFLTRXYyptnDUbbY4es7U9fRtMK3oXlpYwfvIyW3H5FRIOK5j7D4oy9lLv
	hk7DuJ3ZH1nvRIYaEFvrOohrJ9zQtGWbVHa2g9hpEYIGU2E8/6p1nZR+EdX9g+wxva0qH8x4V0i
	59rWfLbEg5Qs2VTkFVk/qg/8IVIebwIoosAJUSsLYGBpq6XNOOHT033mZQDuIXGO9qOEtw28trz
	G83808qy2MVqETE+EP0VtEvoPlw2Vw0ztxtGPTmOQYMnSAnNXw+vPVLpufWf3QzgFvlSQB6t5El
	GPvAFUr4RsFdHbGz/7Vet6L9NejY/Yv4S0cDw2wVzsXckWuC8L6Pi+6c3e3g9uqzB4lYWOnyFFH
	CSCEMDz27m62JcCIg0zspbKBeY8Te+m3ihMYt7GmdKcMi+AskWC1jcDbvB2U0BumlLmDymbHs55
	sVJYqHhknX/tmkQpKvOL2R2ZfO/ssQ8b9m05JAOwWQPRjfmA/7yptmYO7DdY0G4Osy5x1Iz98hc
	cefRIlVFZUiL/WzJQ18hztfmPQNVTTkdiuc6NeVxy8X1zo3yrVqe6Wllu85NxuO6HVlXlJEWQ==
X-Received: by 2002:a05:6000:719:b0:486:ecc3:2d1a with SMTP id ffacd0b85a97d-4887175f50cmr17110841f8f.31.1790495031850;
        Sun, 27 Sep 2026 00:43:51 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4887a30c43asm19821375f8f.3.2026.09.27.00.43.51
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Sep 2026 00:43:51 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][wrynose 18/28] qemu: fix CVE-2026-48914
Date: Sun, 27 Sep 2026 09:43:09 +0200
Message-ID: <3aa95311cab190eef60940aec3eaf666ee38467a.1790494949.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <cover.1790494949.git.yoann.congal@smile.fr>
References: <cover.1790494949.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 27 Sep 2026 07:43:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/246668

From: Roopa Kalmath <Roopa.Kalmath@windriver.com>

flaw was found in QEMU's virtio-blk device. The issue arises
because the device does not properly validate the size of input
descriptors before writing data. A malicious guest with high privileges could
exploit this vulnerability by submitting a malformed virtio-blk SCSI
request, leading to an out-of-bounds write in the host heap memory
and a potential denial of service (DoS) for the QEMU process.

 Reference: [https://nvd.nist.gov/vuln/detail/CVE-2026-48914]

            [https://security-tracker.debian.org/tracker/CVE-2026-48914]

Backport the patch to fix CVE-2026-48914:

            [https://gitlab.com/qemu-project/qemu/-/commit/f5e2c6906cad9a84140e232f2e3eb7a46bf07f62]

Signed-off-by: Roopa Kalmath <Roopa.Kalmath@windriver.com>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 meta/recipes-devtools/qemu/qemu.inc           |  1 +
 .../qemu/qemu/CVE-2026-48914.patch            | 60 +++++++++++++++++++
 2 files changed, 61 insertions(+)
 create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2026-48914.patch

diff --git a/meta/recipes-devtools/qemu/qemu.inc b/meta/recipes-devtools/qemu/qemu.inc
index cc8f2ecdfad..6a217cdaeba 100644
--- a/meta/recipes-devtools/qemu/qemu.inc
+++ b/meta/recipes-devtools/qemu/qemu.inc
@@ -42,6 +42,7 @@ SRC_URI = "https://download.qemu.org/${BPN}-${PV}.tar.xz \
            file://CVE-2025-14876_p1.patch \
            file://CVE-2025-14876_p2.patch \
            file://0012-linux-user-Check-if-RESOLVE_CACHED-flag-is-defined-b.patch \
+           file://CVE-2026-48914.patch \
            "
 # file index at download.qemu.org isn't reliable: https://gitlab.com/qemu-project/qemu-web/-/issues/9
 UPSTREAM_CHECK_URI = "https://www.qemu.org"
diff --git a/meta/recipes-devtools/qemu/qemu/CVE-2026-48914.patch b/meta/recipes-devtools/qemu/qemu/CVE-2026-48914.patch
new file mode 100644
index 00000000000..e38292d4718
--- /dev/null
+++ b/meta/recipes-devtools/qemu/qemu/CVE-2026-48914.patch
@@ -0,0 +1,60 @@
+From f5e2c6906cad9a84140e232f2e3eb7a46bf07f62 Mon Sep 17 00:00:00 2001
+From: Stefan Hajnoczi <stefanha@redhat.com>
+Date: Tue, 26 May 2026 11:49:57 -0400
+Subject: [PATCH] virtio-blk: add missing VIRTIO_BLK_T_SCSI_CMD size check
+ (CVE-2026-48914)
+
+Check that the iovec containing struct virtio_scsi_inhdr is large enough
+before storing an error value there.
+
+Feifan Qian <bea1e@proton.me> pointed out that this can be used to
+corrupt heap memory when the descriptor uses an MMIO address and a
+length of 1, forcing QEMU to allocate a 1-byte heap bounce buffer.
+virtio_stl_p() stores 4 bytes and therefore corrupts whatever is beyond
+the bounce buffer.
+
+Fixes: CVE-2026-48914
+Fixes: f34e73cd69bd ("virtio-blk: report non-zero status when failing SG_IO requests")
+
+CVE: CVE-2026-48914
+
+Upstream-Status: Backport [https://gitlab.com/qemu-project/qemu/-/commit/f5e2c6906cad9a84140e232f2e3eb7a46bf07f62]
+
+Reported-by: Feifan Qian <bea1e@proton.me>
+Cc: Paolo Bonzini <pbonzini@redhat.com>
+Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
+Message-ID: <20260526154957.1741622-1-stefanha@redhat.com>
+Reviewed-by: Kevin Wolf <kwolf@redhat.com>
+Signed-off-by: Kevin Wolf <kwolf@redhat.com>
+(cherry picked from commit aeea0c2804c42f24915467a1e4c70e649e39b8e0)
+Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
+Signed-off-by: Roopa Kalmath <Roopa.Kalmath@windriver.com>
+---
+ hw/block/virtio-blk.c | 8 +++++++-
+ 1 file changed, 7 insertions(+), 1 deletion(-)
+
+diff --git a/hw/block/virtio-blk.c b/hw/block/virtio-blk.c
+index 9cb9f1fb2b..6b92066aff 100644
+--- a/hw/block/virtio-blk.c
++++ b/hw/block/virtio-blk.c
+@@ -199,10 +199,16 @@ static void virtio_blk_handle_scsi(VirtIOBlockReq *req)
+ 
+     /*
+      * The scsi inhdr is placed in the second-to-last input segment, just
+-     * before the regular inhdr.
++     * before the regular inhdr. VIRTIO implementations normally do not rely on
++     * the precise message framing, but legacy implementations did and so we do
++     * too for the legacy virtio-blk SCSI request type.
+      *
+      * Just put anything nonzero so that the ioctl fails in the guest.
+      */
++    if (elem->in_sg[elem->in_num - 2].iov_len != sizeof(*scsi)) {
++        status = VIRTIO_BLK_S_IOERR;
++        goto fail;
++    }
+     scsi = (void *)elem->in_sg[elem->in_num - 2].iov_base;
+     virtio_stl_p(vdev, &scsi->errors, 255);
+     status = VIRTIO_BLK_S_UNSUPP;
+-- 
+GitLab
+

