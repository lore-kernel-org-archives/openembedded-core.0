Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B73DCE6FE50
	for <webhook@archiver.kernel.org>; Tue, 23 Dec 2025 21:26:16 +0000 (UTC)
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.109410.1766525172497245452
 for <openembedded-core@lists.openembedded.org>;
 Tue, 23 Dec 2025 13:26:12 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=I/s0099v;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.177, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-2a0bb2f093aso55641205ad.3
        for <openembedded-core@lists.openembedded.org>; Tue, 23 Dec 2025 13:26:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1766525172; x=1767129972; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PnJFohJ4eKmW/o8vxmTKbY+jvsZ7NfMsL5YGDbIVZtI=;
        b=I/s0099vybVb43cu/M/lBdCOZ97mslvXiQ+ZcVROrzmW1VPZ+KQHr/uEmfDVCyEO5s
         9i1ko97hhyS9jAubzb22ETM9H5C9Slifzz+F/KYlP3j0wqnSwQ2maKL8sG4SqXKQOtIa
         9rZOoRyiiYVPkGqFDnuR0oHv4CRy2/hts+eqDAhe2s6keFEKZSkr2h5PwFxZSq22Qb9x
         fkuzsRfRMet4R2jIoZpjHSslWMBNikTxfuxa4v0Hb58JxZmrMK3TEgMltVCf2FMr270x
         gQPRiUwS6H/wnA4dcx1qE5sYo007UhGByin39rw5W7n1EL+pMJ1gcWpoJ3EXEtVJSMNL
         9cTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766525172; x=1767129972;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=PnJFohJ4eKmW/o8vxmTKbY+jvsZ7NfMsL5YGDbIVZtI=;
        b=prHfMw2ckISEj68odTeOSQSNHWwIgFPtZY3s+USfunxdCPY0P7rEFTdGDMuqrHf55h
         jOIMmkQQO0pjgIWvIkma8i7tmyswW12dzr1R/am8O+SNZgtvOEtAQanOnCJHIOXyftuq
         GfTGx0d/fje1/orF53hdIa7Z0O9gmCyJ1QFdXXxP7j4Zg8B8YcClIu0DAJBXyYrQ9P+q
         hhkAQRmpLbti3/9+FgF/7Zn4ymtLqW2LzSO4vkgvNHmsRX/D9QBYFzfkjtQALUflmRhi
         nynFXGGQC99qE2R6L3AeJPiblqZg/hciWudogE4wEyvXAOi1KhGua+gaGyAcy3kfJCE9
         kYDA==
X-Gm-Message-State: AOJu0YxYHb6pp90gZxCxu+9EKXTEEHTTbT14lcAu29l19mb6Bhe6ZfTk
	w9q7Z6Dt4EdbosIFsgVajMbM6oEaMmf2MAupA2HR/oada0cmIJ3R1QBzm4FLRSuuIvYLokSEQA8
	l7WrS
X-Gm-Gg: AY/fxX7xWTqJynTx+3yxRmAUCHEuQnSc34VZownssopl/ECixyYMMQ0DrumgLSI6J1S
	nUGKvmoFOLy6n7vAmAttrZF8OhsO4k5TiWWFcqnZa3bsK+dVceb4cK66AOh7VP+WiHMpNspvM5h
	+9yuaMLAHzcuX1pin1PjFI6+OdaRIJRW9blogt/Ost7Idl6jUD3fSrhLEp98PiyfPl0J6I4qtLp
	AzJ0uNR9irzhFVL+QtFK58x1rWEf4iDEArBGIUT3Rmtf4YY4uPF7Qzs9ySAd9z+7tTkVXVifeFU
	/Qeq5CTnWJhGwmuf+kN5YOxYY03ST4FXfkD5VzPz7xDaiygF4ByEx3Sxu9npOd5yaiKpmgCMF/6
	OjG97cxgnSecqdhAEoTVVQUE4AmEOK4+82E2+L5W/Cq34sKLEZpwdTPEMjVUuMlZNH6PgxpIzWc
	KqVA==
X-Google-Smtp-Source: AGHT+IHJr6dboPQhlor//nwxPC+oAnC99ZUEc5dcRMRg+l+O2E82bZk8629DS0JxUdzDeb0zSz8j+g==
X-Received: by 2002:a17:902:e748:b0:295:738f:73fe with SMTP id d9443c01a7336-2a2f2732287mr155097185ad.30.1766525171627;
        Tue, 23 Dec 2025 13:26:11 -0800 (PST)
Received: from hexa.. ([2602:feb4:3b:2100:74b3:f61b:a7a7:fafc])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a2f3c6a80esm133756765ad.8.2025.12.23.13.26.10
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Dec 2025 13:26:11 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 02/10] qemu: fix CVE-2025-12464
Date: Tue, 23 Dec 2025 13:25:53 -0800
Message-ID: <7ef40090719cab3fb9bda3f87a9d700d9b503e3e.1766525021.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1766525021.git.steve@sakoman.com>
References: <cover.1766525021.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 23 Dec 2025 21:26:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/228495

From: Kai Kang <kai.kang@windriver.com>

Backport patch to fix CVE-2025-12464.

Reference: https://gitlab.com/qemu-project/qemu/-/commit/a01344d9d7

Signed-off-by: Kai Kang <kai.kang@windriver.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-devtools/qemu/qemu.inc           |  1 +
 .../qemu/qemu/CVE-2025-12464.patch            | 70 +++++++++++++++++++
 2 files changed, 71 insertions(+)
 create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2025-12464.patch

diff --git a/meta/recipes-devtools/qemu/qemu.inc b/meta/recipes-devtools/qemu/qemu.inc
index fd1a8647df..2866cbe7ec 100644
--- a/meta/recipes-devtools/qemu/qemu.inc
+++ b/meta/recipes-devtools/qemu/qemu.inc
@@ -129,6 +129,7 @@ SRC_URI = "https://download.qemu.org/${BPN}-${PV}.tar.xz \
            file://CVE-2024-3446-0006.patch \
            file://CVE-2024-3447.patch \
            file://CVE-2024-8354.patch \
+           file://CVE-2025-12464.patch \
            "
 UPSTREAM_CHECK_REGEX = "qemu-(?P<pver>\d+(\.\d+)+)\.tar"
 
diff --git a/meta/recipes-devtools/qemu/qemu/CVE-2025-12464.patch b/meta/recipes-devtools/qemu/qemu/CVE-2025-12464.patch
new file mode 100644
index 0000000000..6099fc79cd
--- /dev/null
+++ b/meta/recipes-devtools/qemu/qemu/CVE-2025-12464.patch
@@ -0,0 +1,70 @@
+From a01344d9d78089e9e585faaeb19afccff2050abf Mon Sep 17 00:00:00 2001
+From: Peter Maydell <peter.maydell@linaro.org>
+Date: Tue, 28 Oct 2025 16:00:42 +0000
+Subject: [PATCH] net: pad packets to minimum length in qemu_receive_packet()
+
+In commits like 969e50b61a28 ("net: Pad short frames to minimum size
+before sending from SLiRP/TAP") we switched away from requiring
+network devices to handle short frames to instead having the net core
+code do the padding of short frames out to the ETH_ZLEN minimum size.
+We then dropped the code for handling short frames from the network
+devices in a series of commits like 140eae9c8f7 ("hw/net: e1000:
+Remove the logic of padding short frames in the receive path").
+
+This missed one route where the device's receive code can still see a
+short frame: if the device is in loopback mode and it transmits a
+short frame via the qemu_receive_packet() function, this will be fed
+back into its own receive code without being padded.
+
+Add the padding logic to qemu_receive_packet().
+
+This fixes a buffer overrun which can be triggered in the
+e1000_receive_iov() logic via the loopback code path.
+
+Other devices that use qemu_receive_packet() to implement loopback
+are cadence_gem, dp8393x, lan9118, msf2-emac, pcnet, rtl8139
+and sungem.
+
+Cc: qemu-stable@nongnu.org
+Resolves: https://gitlab.com/qemu-project/qemu/-/issues/3043
+Reviewed-by: Akihiko Odaki <odaki@rsg.ci.i.u-tokyo.ac.jp>
+Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
+Signed-off-by: Jason Wang <jasowang@redhat.com>
+
+CVE: CVE-2025-12464
+
+Upstream-Status: Backport [https://gitlab.com/qemu-project/qemu/-/commit/a01344d9d7]
+
+Signed-off-by: Kai Kang <kai.kang@windriver.com>
+---
+ net/net.c | 10 ++++++++++
+ 1 file changed, 10 insertions(+)
+
+diff --git a/net/net.c b/net/net.c
+index 27e0d27807..8aefdb3424 100644
+--- a/net/net.c
++++ b/net/net.c
+@@ -775,10 +775,20 @@ ssize_t qemu_send_packet(NetClientState *nc, const uint8_t *buf, int size)
+ 
+ ssize_t qemu_receive_packet(NetClientState *nc, const uint8_t *buf, int size)
+ {
++    uint8_t min_pkt[ETH_ZLEN];
++    size_t min_pktsz = sizeof(min_pkt);
++
+     if (!qemu_can_receive_packet(nc)) {
+         return 0;
+     }
+ 
++    if (net_peer_needs_padding(nc)) {
++        if (eth_pad_short_frame(min_pkt, &min_pktsz, buf, size)) {
++            buf = min_pkt;
++            size = min_pktsz;
++        }
++    }
++
+     return qemu_net_queue_receive(nc->incoming_queue, buf, size);
+ }
+ 
+-- 
+2.47.1
+
-- 
2.43.0


