Return-Path: <martin.jansa@gmail.com>
Received: from mail-wr0-f195.google.com (mail-wr0-f195.google.com
	[209.85.128.195])
	by mail.openembedded.org (Postfix) with ESMTP id 72C6C6AC4B
	for <openembedded-core@lists.openembedded.org>;
	Mon, 17 Jul 2017 14:04:01 +0000 (UTC)
Received: by mail-wr0-f195.google.com with SMTP id 40so2756565wrw.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 17 Jul 2017 07:04:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=nWs4U2fwRvgt7ZKopH9EenuUDFHvS2I5QlszA382Hc8=;
	b=ugTtFuBZ0PoqCrEeSZDsL4DwNY5Y3VwyF4NV5kdrYNIjAQU6IYG1+7EPRVkCRNCwoY
	ce96WUd3UuV1j0TYesjqsgHDgb/ciJg305wAuilShtSj7zCxFXqHEtsRnJT/OIRFXKia
	p16wvsdVyRxdBrM9tNudpmQeSIbGXPxX9JyQvy5QFSSB7FdB1c8lCvaRwGagqC7Vwl05
	dlEjkSt+ddtOntyYr+/Sjak3/aY2v/5d/AyGfHRWo+JD5oH+pEnxiawdvsENOeXHvYdT
	5cCh67wiBxUBj8ARueBrmejcKYAKKRofjKtYFS4NjitvC2zuEKINJ8IneoY3x2YYAMjc
	8D7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=nWs4U2fwRvgt7ZKopH9EenuUDFHvS2I5QlszA382Hc8=;
	b=ellc35zoS4s5aUyKJlNjzDunriapPyELACWHrwJrmqULnJfLiSL09GVNXHnzM2+kU+
	LK5gL7fF8FESw6M9EsENjjsKzZB9IbtUUL2zwbfnor7n9yfeyrIo/FX+uN76a+m/lzOa
	Eqlk2/Me2pTSgvSYj5fW2p83ebLwMNUFVpu5zTOdb5hooYFxaOdpeF+5b6sg5he0RntS
	XyN/BT+AcxvJ0i+xp6wr8Nj8DN4JdpfhCpJ/CUAmoe0H+jg3yOVsRFZgpDRPWmSIYk7O
	OA+8Doc8gOuWHWqx42xdtGPvnW/PyK4QT07RaY9MPLqm9goy2uoEgSAsjgUAcN4J0xn+
	k8eA==
X-Gm-Message-State: AIVw110R8QMvzE/r/jwtSsxNEjfJCqBussjC0v0/JbiUF9fvImXIzU/r
	+c8UMZYYgT0kBzvN
X-Received: by 10.223.148.36 with SMTP id 33mr3001481wrq.24.1500300242487;
	Mon, 17 Jul 2017 07:04:02 -0700 (PDT)
Received: from localhost ([217.30.68.212]) by smtp.gmail.com with ESMTPSA id
	r187sm13436665wmg.15.2017.07.17.07.04.01
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 17 Jul 2017 07:04:01 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 17 Jul 2017 16:04:50 +0200
Message-Id: <20170717140450.5764-1-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.13.3
Subject: [PATCH] icecc.bbclass: prevent nativesdk builds depending on target specific KERNEL_CC
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 17 Jul 2017 14:04:02 -0000

* without this we cause nativesdk-linux-libc-headers to depend
  on target specific KERNEL_CC (through icecc_get_tool ->
  icecc_is_kernel -> KERNEL_CC -> HOST_CC_KERNEL_ARCH ->
  TARGET_CC_KERNEL_ARCH -> TUNE_FEATURES(thumb) as shown by
  bitbake-diffsigs:

  OE qemux86@ ~/build/oe-core $ ls /OE/build/oe-core/tmp-glibc/sstate-diff/1499859497/qemu*/*sdk*/*/*do_configure.sigdata*
  /OE/build/oe-core/tmp-glibc/sstate-diff/1499859497/qemuarm/x86_64-nativesdk-oesdk-linux/nativesdk-linux-libc-headers/4.10-r0.do_configure.sigdata.3a9a423878d56524e0ee8e42eba1804f
  /OE/build/oe-core/tmp-glibc/sstate-diff/1499859497/qemux86/x86_64-nativesdk-oesdk-linux/nativesdk-linux-libc-headers/4.10-r0.do_configure.sigdata.401071dbaa88903ece37d35a47965ff2

  OE qemux86@ ~/build/oe-core $ bitbake-diffsigs /OE/build/oe-core/tmp-glibc/sstate-diff/1499859497/qemu*/*sdk*/*/*do_configure.sigdata*
  basehash changed from 39774238b66763c598153132e87a2c1a to aa2d66e770bf533e312536eb0a401c4c
  Variable TARGET_CC_KERNEL_ARCH value changed from '${@bb.utils.contains('TUNE_FEATURES', 'thumb', '-mno-thumb-interwork-marm', '', d)} TUNE_FEATURES{thumb} = Set' to ''

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/classes/icecc.bbclass | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/classes/icecc.bbclass b/meta/classes/icecc.bbclass
index 8a3308bdda..1cc1c4ddb0 100644
--- a/meta/classes/icecc.bbclass
+++ b/meta/classes/icecc.bbclass
@@ -42,6 +42,7 @@ def icecc_dep_prepend(d):
 
 DEPENDS_prepend += "${@icecc_dep_prepend(d)} "
 
+get_cross_kernel_cc[vardepsexclude] += "KERNEL_CC"
 def get_cross_kernel_cc(bb,d):
     kernel_cc = d.getVar('KERNEL_CC', False)
 
-- 
2.13.3


