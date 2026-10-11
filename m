Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BF0BACA9EDA
	for <webhook@archiver.kernel.org>; Sun, 11 Oct 2026 08:41:18 +0000 (UTC)
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.23569.1791708078186269214
 for <openembedded-core@lists.openembedded.org>;
 Sun, 11 Oct 2026 01:41:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=IruvinmK;
 spf=pass (domain: smile.fr, ip: 209.85.128.46, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4a02753c04fso4743335e9.3
        for <openembedded-core@lists.openembedded.org>; Sun, 11 Oct 2026 01:41:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1791708076; x=1792312876; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=q1VAMJuuJf6f/0jwp70Dli2hx10p7UVI6pGYer5VNDo=;
        b=IruvinmKOIJSMUCBrDJblZubdmW6k/2ijy4UsAf2QrEthLYWqC2GaN8F28jLBYwuUv
         3peaxGjElGBvt634hN7r711MzDOLzPgm3bpM7notG77OMZYrknapGQ8h7VFtmS0dagOh
         l8r9CvxZO4PnZxGbN88dJc0UFDa+xCfn9SXRM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791708076; x=1792312876;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=q1VAMJuuJf6f/0jwp70Dli2hx10p7UVI6pGYer5VNDo=;
        b=m577oUE5defrT1oP3tmDGYvYkSxKlQOk7TOGO4DJ8gTnfyYP/dBCxZyxN/qF3JES/7
         JOO+NryEoSBDfMW14kZ2I67CSynZ0P2dMo6qYkeP+n4daiUuM8SJZ9LIkzVrGsaWFwkY
         d/M2qOzmWyqGr0W+5hujJa7oyUNxyxyaHRu8e9j6pqb7RQWt6HW+x/2Yo9oz7uEy/Yt0
         Do55g/onTS+ufwJLng1zB/czhnakjvNKQUwRPYCmqz4qma5u3t49XGfqZUz3KJUiH1A0
         REVuSA3OVNqu4pd6bqvpZJYVeut2AZMkB62F/kasOq+9FfXX89Vh4LrhzuN7O3/ygMwy
         yYDw==
X-Gm-Message-State: AFq9FYK8uuMw91cXp8c1P8WC+G+OgZ5r9rR23YKJrcv8DX213haC1MOA
	jHIdpqUZQ689/FYdJyCbWjQ+COdZwcjwkYrqJHBk1dI8m0WQh8zt8npxbeaIJAW3MSm2oTDjBvk
	rT6FpXM0=
X-Gm-Gg: AYBFou2Tloc3PtIzZ00eTGrRLcseLGcZhW528M3qVtiYeH+FfLCLcjK0SdPX27lIp+t
	cG2X25FXHNG783qUR7rEjpSIFJruq/khGPZxvBtMNANTGlbh4kiOuZIBFlQ1+sbWorlRcknSu5A
	XxRHwjXUlpiBZE8B9NXzRbk8+raxIgBcFeDfoVd8yS2P4wJrn5bmRzRLOSzRnEDM3o3vjg7vPSj
	zSnUKjEgzp6iMCoDB1xFhk1HthxoOa7BXipaKc4z07fcY95VKI5Ys5S1rOS9fca+6rP2PbxmLrU
	b6iG59oycZgZwSjkN4BbeIoee29jrC41hd0xjEGmyyHRVPreY4d2f2w6mt9NFcx/Uf8SUJt76Kw
	kW5hUmoeOkmdxKCraGWmYWSf4Y5Mqjr7AlD9SFWebxxjsF4ezrxdm+el9FZPtqWgVzSKs7Yzd6M
	cckRoENk5r/JHnaWFECOG1YOAPIJ050s3BXE1PKYdggpM/WTrgCYIUoOGuL05jOg8yhfTMam8Ft
	GEnGluzIrzQG7CFzYUf7G+5Luyq+v1gKVDDs/4NiuRfmbaMhyXEcc047bxSvtjtELYHykMHoA==
X-Received: by 2002:a05:600d:6409:10b0:4a1:96cd:2f6e with SMTP id 5b1f17b1804b1-4a196cd3213mr31223035e9.4.1791708076230;
        Sun, 11 Oct 2026 01:41:16 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48db9acfa28sm13481734f8f.51.2026.10.11.01.41.15
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Oct 2026 01:41:15 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][wrynose 25/60] gnutls: fix CVE-2026-42015
Date: Sun, 11 Oct 2026 10:39:58 +0200
Message-ID: <afafa8585be80ec139994375f8db62db01ac4862.1791707817.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <cover.1791707817.git.yoann.congal@smile.fr>
References: <cover.1791707817.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 11 Oct 2026 08:41:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/247534

From: Jakub Szczudlo (Nokia) <jakub.szczudlo@nokia.com>

Backport patch to fix CVE-2026-42015.

References:
  https://nvd.nist.gov/vuln/detail/CVE-2026-42015

Upstream fix:
  https://gitlab.com/gnutls/gnutls/-/commit/a3e7c50d3e1761e5ef1d4b225507cab8f2b2c3ca

Tested with ptest

Signed-off-by: Jakub Szczudlo <jakub.szczudlo@nokia.com>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 .../gnutls/gnutls/CVE-2026-42015.patch        | 43 +++++++++++++++++++
 meta/recipes-support/gnutls/gnutls_3.8.12.bb  |  1 +
 2 files changed, 44 insertions(+)
 create mode 100644 meta/recipes-support/gnutls/gnutls/CVE-2026-42015.patch

diff --git a/meta/recipes-support/gnutls/gnutls/CVE-2026-42015.patch b/meta/recipes-support/gnutls/gnutls/CVE-2026-42015.patch
new file mode 100644
index 00000000000..1a2065371d4
--- /dev/null
+++ b/meta/recipes-support/gnutls/gnutls/CVE-2026-42015.patch
@@ -0,0 +1,43 @@
+From a3e7c50d3e1761e5ef1d4b225507cab8f2b2c3ca Mon Sep 17 00:00:00 2001
+From: Alexander Sosedkin <asosedkin@redhat.com>
+Date: Mon, 20 Apr 2026 22:42:20 +0200
+Subject: [PATCH] x509/pkcs12_bag: fix off-by-one in bag element bounds check
+
+Appending elements to a PKCS#12 bag had a bounds check that
+prevented adding the 32nd element.
+On the other hand, it is possible to import one that already has 32.
+Subsequent appending then led to writing past the 32-element array,
+smashing its length.
+
+Tighten the check to reject any bag with 32 or more elements.
+
+We'll treat this vulnerability as a Low due to how contrived
+the requirements are: for the code to be vulnerable,
+it needs to append to an imported untrusted unencrypted PKCS#12 structure.
+
+Reported-by: Zou Dikai
+Fixes: #1840
+Fixes: CVE-2026-42015
+Fixes: GNUTLS-SA-2026-04-29-11
+CVSS: 6.1 Medium CVSS:3.1/AV:L/AC:L/PR:N/UI:R/S:U/C:N/I:L/A:H
+Severity: Low
+Signed-off-by: Alexander Sosedkin <asosedkin@redhat.com>
+
+CVE: CVE-2026-42015
+Upstream-Status: Backport [https://gitlab.com/gnutls/gnutls/-/commit/a3e7c50d3e1761e5ef1d4b225507cab8f2b2c3ca]
+
+Signed-off-by: Jakub Szczudlo <jakub.szczudlo@nokia.com>
+---
+diff --git a/lib/x509/pkcs12_bag.c b/lib/x509/pkcs12_bag.c
+index 911aeff..3822861 100644
+--- a/lib/x509/pkcs12_bag.c
++++ b/lib/x509/pkcs12_bag.c
+@@ -375,7 +375,7 @@ int gnutls_pkcs12_bag_set_data(gnutls_pkcs12_bag_t bag,
+ 		return GNUTLS_E_INVALID_REQUEST;
+ 	}
+ 
+-	if (bag->bag_elements == MAX_BAG_ELEMENTS - 1) {
++	if (bag->bag_elements >= MAX_BAG_ELEMENTS - 1) {
+ 		gnutls_assert();
+ 		/* bag is full */
+ 		return GNUTLS_E_MEMORY_ERROR;
diff --git a/meta/recipes-support/gnutls/gnutls_3.8.12.bb b/meta/recipes-support/gnutls/gnutls_3.8.12.bb
index f0fec16d039..c9ec3b08f96 100644
--- a/meta/recipes-support/gnutls/gnutls_3.8.12.bb
+++ b/meta/recipes-support/gnutls/gnutls_3.8.12.bb
@@ -48,6 +48,7 @@ SRC_URI = "https://www.gnupg.org/ftp/gcrypt/gnutls/v${SHRT_VER}/gnutls-${PV}.tar
            file://CVE-2026-42013-pre1.patch \
            file://CVE-2026-42013.patch \
            file://CVE-2026-42014.patch \
+           file://CVE-2026-42015.patch \
            "
 
 SRC_URI[sha256sum] = "a7b341421bfd459acf7a374ca4af3b9e06608dcd7bd792b2bf470bea012b8e51"

