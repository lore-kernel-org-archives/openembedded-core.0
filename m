Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 579C7CCF9E5
	for <webhook@archiver.kernel.org>; Mon, 27 Oct 2025 20:31:34 +0000 (UTC)
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
 by mx.groups.io with SMTP id smtpd.web10.1729.1761597087675735859
 for <openembedded-core@lists.openembedded.org>;
 Mon, 27 Oct 2025 13:31:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=cAP4EchT;
 spf=pass (domain: gmail.com, ip: 209.85.128.47, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-475dd559b0bso34716175e9.1
        for <openembedded-core@lists.openembedded.org>; Mon, 27 Oct 2025 13:31:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761597086; x=1762201886; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=hXOFhHI8sQCt2CK1pDY8ppazmIF7+c97N1B49vdSIyU=;
        b=cAP4EchT8YfAnhEj06VM+a6K0GYOnLhLlnxA/VqhMl8wRgwdNTrctjllW5zbIlGsrA
         U/ed4b1ONGK+SYa7vDqh0JrzUAYB2wuldHRT5t+lBDGbGm8Dy1t+Obkmn6/qKR7UexnY
         WhdQ26Nb0j+Hxu5n4jwjUXoIUpCAg+kd6eFrGyX6jZCT0LeDSy34JLYAQmktzbXoX44O
         j9RzSACih5Rm16JoX2Fx6L/wJE3doWBccgpu0yfz5yIJk10ZQ4VV2Vui4zEKAmXpCwQK
         q9dSwoEfO0UxKNBfg444lXMg5I0GvVJwMPmzxt1XU2Koqwebgs1QtpA5F7rZsg1EO54/
         3vDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761597086; x=1762201886;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=hXOFhHI8sQCt2CK1pDY8ppazmIF7+c97N1B49vdSIyU=;
        b=PYc8i3BFrU95nTnDuk1KP4tTI56r+mLvlg6Jacx+Fpb2OPuCtkj//xyZTpIKc+mhuF
         B3BdjE2+0x8jU0kqel9oGvQfVuOONAxGqi4yGFZbS0qFy+VmbMHfhdcRhimfcgOevnsm
         GxZ64S7bAPHWltfleuNF8Ix+xvozJw5bONUMrmTvnn1+xRckA4DVBOR6RNvt6rqg935H
         hul3jf9/iKuMnnFDVa/AnapgiZdyrxVWe3w7DnEVT+IcbjJ0bgkEO+9y6Avr+FEu+jD4
         ePyMajF9sUpuoadxwN73ug5nVFV1IeYsUWLlhWYlBsqki70upaqRqmzHVXSQmS9p+AGB
         afzg==
X-Gm-Message-State: AOJu0YxzUlAC0aTsA+LIdISNEHxx5LIxGxr1H5BZ9eFcdJNAAO/cZmK6
	xJrETdSfPM5zcX+J459qcfcuLJJmp9cxWzEnk3hCZ++wr9rzRTH7EJpSJthShA==
X-Gm-Gg: ASbGnctph0hhClLMsKGGwgcAET7RuSIB3YLWbbpZYD9jCSSJYmTtCsPtPtNKomm2Pdg
	8w4stXA/21d+LnCbK5LAGDMca7KzNfCFVsTVOzJLzsADqIV8f/vlnWcMBR6j3h/fFIPvJII63rJ
	FgUPpqqCbtw84zan/miW0D2c/0WY0Zr63dJGiLFKTMYCVfW+OTlfJyoIZ22Gg08I0Tj/KaY+i8d
	1wUlHGfzwmHea2pkcIIB13x33EU9emg2lAZDs2UvC2YyfrbYbBq3HyNfRZE+DnIMcL2JY8T5wwN
	zmKOLRToynwHiqLPf7rkbypgdpRQ/gOHwvLWaRAQ4zcNnP4FLafazFoXZZacaEDLgnYGYmSVFmT
	Ze89f60lQSfear2HRv4YIMiYW7xXrfAPhx2KZWZzLAMtU+hILeucmegLwZ+JACbIg77ASXpCe47
	9giGB7eemo
X-Google-Smtp-Source: AGHT+IFbayei8q7SA0G3wqtDVMe5oiVmO0xc7uU0DsrsGpUz6BMD6hglgcDTIdwqdufOcOiTV70kQQ==
X-Received: by 2002:a05:600c:348f:b0:46e:35a0:3587 with SMTP id 5b1f17b1804b1-47717e6f34dmr8854095e9.27.1761597085705;
        Mon, 27 Oct 2025 13:31:25 -0700 (PDT)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-475dd4783b8sm155044925e9.15.2025.10.27.13.31.23
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Oct 2025 13:31:24 -0700 (PDT)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] fmt: make ptest installation and execution more posix compliant
Date: Mon, 27 Oct 2025 21:31:22 +0100
Message-ID: <20251027203122.4120798-1-skandigraun@gmail.com>
X-Mailer: git-send-email 2.51.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 27 Oct 2025 20:31:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/225357

Instead of using `ls...` just enumerate the folder content with an asterisk.

No behavior change should come from this patch.

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 meta/recipes-devtools/fmt/fmt/run-ptest | 2 +-
 meta/recipes-devtools/fmt/fmt_11.2.0.bb | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-devtools/fmt/fmt/run-ptest b/meta/recipes-devtools/fmt/fmt/run-ptest
index a069e4543c..ba1e9fc51f 100644
--- a/meta/recipes-devtools/fmt/fmt/run-ptest
+++ b/meta/recipes-devtools/fmt/fmt/run-ptest
@@ -1,5 +1,5 @@
 #!/bin/sh
 
-for t in `ls ./*-test`; do
+for t in *-test; do
 	./$t && echo PASS: $t || echo FAIL: $t
 done
diff --git a/meta/recipes-devtools/fmt/fmt_11.2.0.bb b/meta/recipes-devtools/fmt/fmt_11.2.0.bb
index 06ba523ada..133e1ae77d 100644
--- a/meta/recipes-devtools/fmt/fmt_11.2.0.bb
+++ b/meta/recipes-devtools/fmt/fmt_11.2.0.bb
@@ -17,7 +17,7 @@ EXTRA_OECMAKE += "-DBUILD_SHARED_LIBS=ON"
 EXTRA_OECMAKE += "${@bb.utils.contains('PTEST_ENABLED', '1', '-DFMT_TEST=ON', '', d)}"
 
 do_install_ptest(){
-	for t in `ls ${B}/bin/*-test`; do
+	for t in ${B}/bin/*-test; do
 		install $t ${D}${PTEST_PATH}/
 	done
 }

