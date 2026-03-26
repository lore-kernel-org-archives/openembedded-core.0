Return-Path: <zboszor@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F045B10A62FC
	for <webhook@archiver.kernel.org>; Thu, 26 Mar 2026 14:30:52 +0000 (UTC)
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.48790.1774535446027051172
 for <openembedded-core@lists.openembedded.org>;
 Thu, 26 Mar 2026 07:30:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=D93VoiyZ;
 spf=pass (domain: gmail.com, ip: 209.85.221.42, mailfrom: zboszor@gmail.com)
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-43b4f48c47cso770632f8f.0
        for <openembedded-core@lists.openembedded.org>; Thu, 26 Mar 2026 07:30:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774535444; x=1775140244; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/fy7bOJBzaaTfUTEmgSvjzdr/zfZur/Mb98ZPMPNFcA=;
        b=D93VoiyZ/fX8a+o9d4VNLzc97US0M2Vnzm1FE5nH6wE8LWXitddOEtC50abkHJk3rv
         M/qSn+dj5qcVeJQNmLaUWNC25MSLyBVThR2svyJ3cACVXtwLFW1iQgPDBDbwrBtXu/oC
         u+tQpJ4jQFkLbeCthDN7K7xc/0aPIHiaM0R+dQC/SE6cueEKtowdqLIWvUNVXDXJOwiu
         Phd7UfZ1hhfrdvAsoJe+vG17I9CdSXsvVQmcZAn4jyWdY42Mj3sb2Q2uC/b7DREFNMoC
         YKLISLJPxp97VGCN2G29DI2mHkhzai4iEutNITTvPMYwtIoBOUbiO3uNE4DxVb3r92Fy
         LoZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774535444; x=1775140244;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=/fy7bOJBzaaTfUTEmgSvjzdr/zfZur/Mb98ZPMPNFcA=;
        b=MBlT5FSHQk46ytiHZ//D2NrtQ7s0VHHbO9QcE2mpUy/3GfFqyAZYmrtT0hwy5REQEX
         G40C6amj6MVX3iUhCLoXMHdzr9/2+02NA2RsJTxYBUVagDqqLPnCoWa6bv+F9qwsuAkj
         etxkG0Muds1ZDFDbCNM08ujtJA326a2Lloy7Viu7YOpR3jVhtdbocG7LNNEAvLFenIFb
         E7FrFHaNy9DCYgi7bSI4RlH0VU1bKOkaSJRVMXHVkDjIQhCeJsA6YFL/95JQZcw/Y3JD
         W9mgWpB2znuRUygsWflnfvz+Gm929KgCIFGoYzNuV1mUFFGfoCjOjLXat06BpAeOnEcN
         w/Ew==
X-Gm-Message-State: AOJu0Yx5iraWS+9aN1EwDP0OcH0li86Vs9VFNm34xh28uusz3xKPqCH6
	fRpyxtdnhw9RXg3dvRuNVX2HIz+GH1BHvZ9j5j8usRhKyj08y5p14WKrnWhyjg==
X-Gm-Gg: ATEYQzwzrYGtqtTqeuWTEE2/IYDpgAUoWO8AW62hb97BU7c57gQL9GjEN08BVBXKwyE
	U7mI6DD+ZBB9U33XFwuNykESkxg4Wjj/VqCBY+u0phZ8DaphO3wac/Xw+Gm8ARh+Vh8PHaqi80E
	/0vH3n9NJ14gOHDV3v5NUNzjiGtfGgAluR6p/65BSxLRcm3SO8dAvm1m4wVQem8Z8WiY5RF23Cz
	ZrFJyo41M2mkZ8gEFWkq4V0sijbj6CigqWlePo4884fYXAc2q60PktpZpHCxOtOvPwGxhgbunj8
	T/Co8fxn9IoHbLBh/pvsdaxSaCtmY9+ZD+o5oSObEvjkXWPENy6qGxQcim53AjrNNXHwtBoNAKZ
	6RWgwd/zE8WwvlwSXBCVxISY0zTxgSpPHvokT23lPGMqKt1Z8xlPlrYCmxNLsdBgmWe38AB3zqY
	Uc10OKLfEw7PTVRQ==
X-Received: by 2002:a05:6000:184a:b0:43b:9386:966b with SMTP id ffacd0b85a97d-43b938696c8mr5757938f8f.33.1774535444024;
        Thu, 26 Mar 2026 07:30:44 -0700 (PDT)
Received: from term011.lan (95C810F6.dsl.pool.telekom.hu. [149.200.16.246])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43b91942f24sm9162880f8f.11.2026.03.26.07.30.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Mar 2026 07:30:42 -0700 (PDT)
From: =?UTF-8?q?Zolt=C3=A1n=20B=C3=B6sz=C3=B6rm=C3=A9nyi?= <zboszor@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Trevor Gamblin <tgamblin@baylibre.com>,
	Alexander Kanavin <alex.kanavin@gmail.com>,
	=?UTF-8?q?Zolt=C3=A1n=20B=C3=B6sz=C3=B6rm=C3=A9nyi?= <zboszor@gmail.com>
Subject: [PATCH v2 12/12] hwlatdetect: Use PYTHON_DIR
Date: Thu, 26 Mar 2026 15:30:20 +0100
Message-ID: <20260326143020.2083293-12-zboszor@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260326143020.2083293-1-zboszor@gmail.com>
References: <18A06529173E9998.57592@lists.openembedded.org>
 <20260326143020.2083293-1-zboszor@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 26 Mar 2026 14:30:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/234015

Instead of custom constructing the python directory,
use PYTHON_DIR for consistency.

Signed-off-by: Zoltán Böszörményi <zboszor@gmail.com>
---
 meta/recipes-rt/rt-tests/hwlatdetect_git.bb | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-rt/rt-tests/hwlatdetect_git.bb b/meta/recipes-rt/rt-tests/hwlatdetect_git.bb
index 2dcc80965a..d37909cd87 100644
--- a/meta/recipes-rt/rt-tests/hwlatdetect_git.bb
+++ b/meta/recipes-rt/rt-tests/hwlatdetect_git.bb
@@ -8,7 +8,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=751419260aa954499f7abaabaa882bbe"
 require rt-tests.inc
 inherit python3-dir
 
-EXTRA_OEMAKE += "PYLIB=${libdir}/python${PYTHON_BASEVERSION}/dist-packages"
+EXTRA_OEMAKE += "PYLIB=${libdir}/${PYTHON_DIR}/dist-packages"
 
 do_compile() {
 	oe_runmake hwlatdetect
@@ -18,9 +18,9 @@ do_install() {
         oe_runmake install_hwlatdetect DESTDIR=${D} SBINDIR=${sbindir} \
 	           MANDIR=${mandir} INCLUDEDIR=${includedir}
 
-        sed -i -e '1s,#!.*python.*,#!${bindir}/python3,' ${D}${libdir}/python${PYTHON_BASEVERSION}/dist-packages/hwlatdetect.py
+        sed -i -e '1s,#!.*python.*,#!${bindir}/python3,' ${D}${libdir}/${PYTHON_DIR}/dist-packages/hwlatdetect.py
 }
 
-FILES:${PN} += "${libdir}/python${PYTHON_BASEVERSION}/dist-packages/hwlatdetect.py"
+FILES:${PN} += "${libdir}/${PYTHON_DIR}/dist-packages/hwlatdetect.py"
 RDEPENDS:${PN} = "python3-core "
 RRECOMMENDS:${PN} = "kernel-module-hwlat-detector"
-- 
2.53.0


