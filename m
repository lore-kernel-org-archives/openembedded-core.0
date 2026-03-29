Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7D610FC72A3
	for <webhook@archiver.kernel.org>; Sun, 29 Mar 2026 22:46:40 +0000 (UTC)
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.38497.1774824395155805568
 for <openembedded-core@lists.openembedded.org>;
 Sun, 29 Mar 2026 15:46:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=o2JnZdos;
 spf=pass (domain: smile.fr, ip: 209.85.128.45, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-486507134e4so44986995e9.0
        for <openembedded-core@lists.openembedded.org>; Sun, 29 Mar 2026 15:46:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1774824393; x=1775429193; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=P+DU1DQqJCo0kg1Hh2Hy+9t8f8niQx7kgij3NS70Oi8=;
        b=o2JnZdos8FHoiYi2nn0RwY8Pw+QU48feDYGJXxsNCdzYLWXrgg7AoiQzyNMARsgeC3
         FoPDaBnKeAKYos052bAbJONpSQPyGG9IEd03iBdjVn/YfzFz0bLFvT5We3mW16DBmOUX
         QFqTJKZQzgoGEIqV2L1WmNfqGDt0OxkxeLjRQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774824393; x=1775429193;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=P+DU1DQqJCo0kg1Hh2Hy+9t8f8niQx7kgij3NS70Oi8=;
        b=GP1mp4a8XMKtipvFv4PrCgigzP0byZfZkScdEzt1Xh4uQV7lp1LMH/JRpA/1lVBVA9
         Zwltehy5xZtxFEHaWhcBxvcSMmr6uebdgJBME232ZAk07SeJgpwyd1UOCGY8itAgJ5mE
         TD4IANg5UIdrD7ZYrr6TNnn7N19kZFpFkP1E0BVeXZGtsiemmGA1wb32+8H0D8ldWDPQ
         bBSRQVME2GoPI+CHj2o6QIWBpc91lDfrtm+iz4jZZfcFsYDs0HXfTSd0UTKskTj6rL83
         vVZuOgxn7pEa7ljAq4Oy3B3zGglBEkAlkw8gbmCIzUpbtnX7gfs/E2Dj7flpMipwW6Re
         Yh5g==
X-Gm-Message-State: AOJu0Yz+MfwVPsXRylaWDerl6n9XdfoNP0/AE+yCFl3y7qpxmpzorMzx
	4iKHHLhshhBPiAGOuiHbE/kY6NDsDDzr6zf7UC8b1+5gq2RlX69eCwFVmA5bN3KG4nX3NDv5YNa
	DuBlBG5M=
X-Gm-Gg: ATEYQzxFK/iFHq94kqYxLYOkqsKNtzx4gAGSV496/EBFKDpcZ7ZWXBc4VrQAKRj2YxQ
	ymwearKpZiuNrLnhHWTRPb2Qub52l9tKsMjAzPO+OtjF0/7Sg9OqBkgtU0xZjctvzRFwue37DJd
	jZmv3ucNulatMuja68VN84rStQEnGD8zvP/tz0vkqksIG9Axzfy6cgK/BWVfIIia/GvFaUV0sWi
	q5/fiyO8qx4lzXo3KJtJAsDLZpWorAPrbKhXR3Mu/KbmtwRU65h8SvuOH6hP3Udnsn5eN3dOEr1
	JEK5L4qXw8pdI1ivZ4EgM2pJhI3bRNMWvLY0H9ozP+mfYvFTN/ekvXk/dl30Ke3BbKXkhMEZq9/
	lZdRLGQsBiX9bEeTBMaKzi57QyW4i7b+jizdR9rFOUGkAf3xls9QzxH0MEAhVpSzAWKofvqya0M
	tsSFLLy15CJ0d6zeuZGOKjlmmwRRpk73MKCzkOQOD5/gczZG4MK8f+1gqvi7QJmIE+mlsJq9MLt
	A1ZYuU1Ar4OnKXHPOFQyJk+QTk=
X-Received: by 2002:a05:600c:4e08:b0:485:363b:fafe with SMTP id 5b1f17b1804b1-48727d5e971mr186098755e9.1.1774824393251;
        Sun, 29 Mar 2026 15:46:33 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4873061eeeasm133760375e9.2.2026.03.29.15.46.32
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 29 Mar 2026 15:46:32 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 06/11] yocto-uninative: Update to 5.0 for needed patchelf updates
Date: Mon, 30 Mar 2026 00:46:13 +0200
Message-ID: <2e2985c52dfdd9601e97477f26fd6c442b418ba5.1774824253.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1774824253.git.yoann.congal@smile.fr>
References: <cover.1774824253.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 29 Mar 2026 22:46:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/234187

From: Michael Halstead <mhalstead@linuxfoundation.org>

Solves some segfaults on relocated qemu-img binaries.

[YOCTO #16003]

Signed-off-by: Michael Halstead <mhalstead@linuxfoundation.org>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit b322bc5387f3baedca5c71ccecaed08d2b046eab)
[YC: fixed the commit title]
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 meta/conf/distro/include/yocto-uninative.inc | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/meta/conf/distro/include/yocto-uninative.inc b/meta/conf/distro/include/yocto-uninative.inc
index 3ced03d4771..e9dc6c86408 100644
--- a/meta/conf/distro/include/yocto-uninative.inc
+++ b/meta/conf/distro/include/yocto-uninative.inc
@@ -7,9 +7,9 @@
 #
 
 UNINATIVE_MAXGLIBCVERSION = "2.42"
-UNINATIVE_VERSION = "4.9"
+UNINATIVE_VERSION = "5.0"
 
 UNINATIVE_URL ?= "http://downloads.yoctoproject.org/releases/uninative/${UNINATIVE_VERSION}/"
-UNINATIVE_CHECKSUM[aarch64] ?= "812045d826b7fda88944055e8526b95a5a9440bfef608d5b53fd52faab49bf85"
-UNINATIVE_CHECKSUM[i686] ?= "5cc28efd0c15a75de4bcb147c6cce65f1c1c9d442173a220f08427f40a3ffa09"
-UNINATIVE_CHECKSUM[x86_64] ?= "4c03d1ed2b7b4e823aca4a1a23d8f2e322f1770fc10e859adcede5777aff4f3a"
+UNINATIVE_CHECKSUM[aarch64] ?= "a25f2174d0cefcb22af005e9bc72ac01ae83b011c5b6d6d5bf00dac979877f76"
+UNINATIVE_CHECKSUM[i686] ?= "959cc2539b692f9b9862825c7324a0fe4d061fca742f6c259f67f581c59af956"
+UNINATIVE_CHECKSUM[x86_64] ?= "96045e8b1e242c8a849426a8506c7043f354b39f2bc0035192780e8205e23e9d"

