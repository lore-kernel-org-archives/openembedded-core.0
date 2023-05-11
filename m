Return-Path: <max.oss.09@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E7EACC7EE22
	for <webhook@archiver.kernel.org>; Thu, 11 May 2023 23:21:58 +0000 (UTC)
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
 by mx.groups.io with SMTP id smtpd.web10.11649.1683847317603279136
 for <openembedded-core@lists.openembedded.org>;
 Thu, 11 May 2023 16:21:57 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=gCV6hu1F;
 spf=pass (domain: gmail.com, ip: 209.85.218.46, mailfrom: max.oss.09@gmail.com)
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-956ff2399c9so1778192666b.3
        for <openembedded-core@lists.openembedded.org>; Thu, 11 May 2023 16:21:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1683847316; x=1686439316;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=T2WsTA583fzrBARrI3rRtRCEDjlThqmJE2E4DJIP+pI=;
        b=gCV6hu1F2dcFn7maQYTYKUlWF2LkMu5P2nkt//zYb2a4L7OW0BPG9hJc5YnsvDTkJU
         WdHl1dYGSogkW8oHqKiFye4CdW6eyw2KOVY2zPMEiBJ3gxK7QYc/TW07CvyBm+S2/cAB
         2PXynTSzD5SdYrRnuLBhgkeYGw5BPwEnsPPJ6i8/xBK3pplh1/iKwj189ag23nYLD+M7
         Ph4FqDYeh3NHSlDlcn3r/6nkUQAyvmV3EYFTxT89490MBkxHwHUeXQzj6UkdjA6+XIuZ
         NoHLTjy5wioOAwVvIa8JCfHJPB1+K/iVDHpCxHtri/nfuBw2JewoFaTjeXNGhTPPYvuS
         PeRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683847316; x=1686439316;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=T2WsTA583fzrBARrI3rRtRCEDjlThqmJE2E4DJIP+pI=;
        b=ZAZzd/QvgBPeKlFLxEW+bpiJdlFDVvlKWwC3bOVaEShARQEbY1ZQT7nHoL69kkPt7r
         49uP5EVfuM3wp2cYm8TzdTwiCwYSchWGWaWqt4m79ADh5NSb6aPoYbKu4vp1bCTep9oB
         S9eXLimNhY2IhMCCMnLr9ZDxqyISYAFAktbT0MRTpF04SvTOOWUomAlftH8YaFz4LTum
         yVPCfYPKU4lrisiIeha6LZwORpj1iU3PCw+u73Ldc/gBu/ixqtqnM8xmYDd7Z7WHsEAV
         CKKTgjTDuvH9D7xj8lkzlbsM43IAaMac80woiuouDffqSwrtlJO+l3pOeS2hP4B44N/X
         p6Gg==
X-Gm-Message-State: AC+VfDxKcnGbfC4bNEpLd76WB7TdMSnb8hR38qcvJE0KZJU8y2qNLenm
	Spn3QxYxuLL2ss/7PnOFWNC/oFAm83Q=
X-Google-Smtp-Source: ACHHUZ753YitxULbO/J2UTAwh1ciF9Rk4uIs9I1facjnjBTAg6iorZ+oLN2Z22x37gwqFUtl5ZdIRg==
X-Received: by 2002:aa7:d594:0:b0:50b:c6c9:2145 with SMTP id r20-20020aa7d594000000b0050bc6c92145mr16724843edq.23.1683847294816;
        Thu, 11 May 2023 16:21:34 -0700 (PDT)
Received: from linuxdev2.toradex.int (31-10-206-125.static.upc.ch. [31.10.206.125])
        by smtp.gmail.com with ESMTPSA id y2-20020a056402134200b00504ecc4fa96sm3265163edw.95.2023.05.11.16.21.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 May 2023 16:21:34 -0700 (PDT)
From: Max Krummenacher <max.oss.09@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: bruce.ashfield@gmail.com,
	raj.khem@gmail.com,
	alexandre.belloni@bootlin.com,
	quaresma.jose@gmail.com,
	Max Krummenacher <max.krummenacher@toradex.com>
Subject: [OE-core][Patch v4 2/4] libtraceevent: fix qa issue reference to tmpdir
Date: Fri, 12 May 2023 01:21:27 +0200
Message-Id: <20230511232129.993289-3-max.oss.09@gmail.com>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20230511232129.993289-1-max.oss.09@gmail.com>
References: <20230511232129.993289-1-max.oss.09@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 11 May 2023 23:21:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/181166

From: Max Krummenacher <max.krummenacher@toradex.com>

Make sure that the OE provided CFLAGS are passed to the compiler so
that the -fdebug-prefix-map and -fmacro-prefix-map options are
actually active.

Fixes:
| WARNING: libtraceevent-1.7.2-r0 do_package_qa: QA Issue: File /usr/lib/libtraceevent.a in package libtraceevent-staticdev contains reference to TMPDIR [buildpaths]
| WARNING: libtraceevent-1.7.2-r0 do_package_qa: QA Issue: File /usr/lib/.debug/libtraceevent.so.1.7.2 in package libtraceevent-dbg contains reference to TMPDIR [buildpaths]

Signed-off-by: Max Krummenacher <max.krummenacher@toradex.com>
---
 meta/recipes-kernel/libtraceevent/libtraceevent_1.7.2.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-kernel/libtraceevent/libtraceevent_1.7.2.bb b/meta/recipes-kernel/libtraceevent/libtraceevent_1.7.2.bb
index 089b6814c7..b5c0834d89 100644
--- a/meta/recipes-kernel/libtraceevent/libtraceevent_1.7.2.bb
+++ b/meta/recipes-kernel/libtraceevent/libtraceevent_1.7.2.bb
@@ -14,6 +14,8 @@ SRC_URI = "git://git.kernel.org/pub/scm/libs/libtrace/libtraceevent.git;branch=$
 
 S = "${WORKDIR}/git"
 
+export EXTRA_CFLAGS = "${CFLAGS}"
+
 inherit pkgconfig
 
 do_install() {
-- 
2.35.3


