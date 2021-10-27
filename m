Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8D003C433FE
	for <webhook@archiver.kernel.org>; Wed, 27 Oct 2021 10:03:04 +0000 (UTC)
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com
 [209.85.128.43])
 by mx.groups.io with SMTP id smtpd.web11.9529.1635328983052547723
 for <openembedded-core@lists.openembedded.org>;
 Wed, 27 Oct 2021 03:03:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=LfyizfCK;
 spf=pass (domain: gmail.com, ip: 209.85.128.43,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-wm1-f43.google.com with SMTP id 192so525360wme.3
        for <openembedded-core@lists.openembedded.org>;
 Wed, 27 Oct 2021 03:03:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=TF2hnInsSZHF8OK8Imw0hEp3/IuTA31ap1m5qAQr1YA=;
        b=LfyizfCKKcQuHLGESmy+65qq92LalO30o101vEGR+o/g+K+sDNUNlE6bI27oVDikou
         9BefSOudUoARZzRigF5MznPiKwW/Qr9oGEkWCHwUOc4HrqPGX7PN5nIdBdE8zfaG/Hxb
         4uXsgHWJHT6aHifQQxvHuzlI4nwPQz/Da6eBI0Fydd2oFKkhQCZCBMZn249QsVeNsgOa
         MEp1x/MfNpAEN78pM5W8LikpMBRsVysZHm9oxb2iZhZbwH8pRsGN9ddV6CXDapv/lezo
         wIsMrFqlzrm9eRUuFu5zSRUnGSsVQxFTpHC2nArvFW3woM8nRV2w1u7I0pJ0T1IugVL/
         1bxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=TF2hnInsSZHF8OK8Imw0hEp3/IuTA31ap1m5qAQr1YA=;
        b=1Hr55o56Jrh7reAx2VmsHzjcUrCuZHvSYzRcmAZ/zoyfjdfWrjm6CvU0sikBrAY/yf
         W4YIxDqFealAdAfRO0TGy1ZGJecudhLdtovraKBK72j8zI665h/7PltBlr8GYdK17/k6
         lFe/T7Lz5En29QGm4mjc2CUOInIFWevMilrIMxnhzcVleerOl+5xm7UPopJgpbjDWQPO
         qnYJOmmxShqYblhnQNKkFMMGUwwHTvEp/Lhm10jn0yWauNED3dt60CLTG2pFCpzaYYJM
         qZlEfJGoowJwTiwmWWO1z5c8OL3GWxLYDG4QK5AxrpDdXUFiySDrI3GWkf61C0eo9z0p
         9vzA==
X-Gm-Message-State: AOAM531zW+eWWRJh6gCBsiX1cP5r1Xq2ijoNL0Ag8CtWEGpTvXaSPmgg
	IQ2FEPpT8bNIWdzeO2YFotJSvl/e7TI=
X-Google-Smtp-Source: 
 ABdhPJzpwgUgdoECwLss1YPizCxQCKebqyNBm0sxb7hEL5QTBb3TfhzkU7biThUTOkmbQzVDquNwEA==
X-Received: by 2002:a1c:ed03:: with SMTP id l3mr4858638wmh.86.1635328981061;
        Wed, 27 Oct 2021 03:03:01 -0700 (PDT)
Received: from nereus.lab.linutronix.de. (b2b-109-90-143-203.unitymedia.biz.
 [109.90.143.203])
        by smtp.gmail.com with ESMTPSA id
 i24sm3016019wml.26.2021.10.27.03.03.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Oct 2021 03:03:00 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH] cups: exclude beta/rc versions from version check
Date: Wed, 27 Oct 2021 12:02:59 +0200
Message-Id: <20211027100259.2553860-1-alex@linutronix.de>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 27 Oct 2021 10:03:04 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/157509

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 meta/recipes-extended/cups/cups.inc | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-extended/cups/cups.inc b/meta/recipes-extended/cups/cups.inc
index f6f8637a43..2994973b8c 100644
--- a/meta/recipes-extended/cups/cups.inc
+++ b/meta/recipes-extended/cups/cups.inc
@@ -18,7 +18,7 @@ SRC_URI = "https://github.com/OpenPrinting/cups/releases/download/v${PV}/cups-${
            "
 
 UPSTREAM_CHECK_URI = "https://github.com/OpenPrinting/cups/releases"
-UPSTREAM_CHECK_REGEX = "cups-(?P<pver>.+)-source.tar"
+UPSTREAM_CHECK_REGEX = "cups-(?P<pver>(?!.+\d(b|rc)\d.+).+)-source.tar"
 
 # Issue only applies to MacOS
 CVE_CHECK_WHITELIST += "CVE-2008-1033"
@@ -116,4 +116,4 @@ cups_sysroot_preprocess () {
 
 # -25317 concerns /var/log/cups having lp ownership.  Our /var/log/cups is
 # root:root, so this doesn't apply.
-CVE_CHECK_WHITELIST += "CVE-2021-25317"
\ No newline at end of file
+CVE_CHECK_WHITELIST += "CVE-2021-25317"
-- 
2.20.1


