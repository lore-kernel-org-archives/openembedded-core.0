Return-Path: <samuli.piippo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4E1BDC433EF
	for <webhook@archiver.kernel.org>; Mon,  3 Jan 2022 08:11:06 +0000 (UTC)
Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com
 [209.85.208.171])
 by mx.groups.io with SMTP id smtpd.web08.25173.1641197465135381733
 for <openembedded-core@lists.openembedded.org>;
 Mon, 03 Jan 2022 00:11:05 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=bBTTGal3;
 spf=pass (domain: gmail.com, ip: 209.85.208.171,
 mailfrom: samuli.piippo@gmail.com)
Received: by mail-lj1-f171.google.com with SMTP id h21so42753086ljh.3
        for <openembedded-core@lists.openembedded.org>;
 Mon, 03 Jan 2022 00:11:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=McuG9zIb2at6RIVI0hAy/z0KbvG85iO9DgI3S3NCsr8=;
        b=bBTTGal3K2jsdticzxSbi2m6gbhzJIUJQEEzCnmFMR7qCPyGvrja8hoJh/GLTFX5+W
         vrgq8B1SnJpOmETEkCPEAi451/RxPTJm8N6svaGxfVoMEaH02E8eH7c5RVNGB31AtzOP
         sRD08GtBrKxpG7i2bfTMoeOxSCr2jNrW3/Vb66b1eArwzwkL7TRxGVgh7POZtnr9GkW3
         pmFA6BcLMCkxcDBHdyNROKKgpCjvFQGe0vYbd7E+IGiufYYx6L4X/S/CCB+bW7iPVPp/
         uPbNbQh2w3UT5n15gPjE98KebTBV0xxoqTbS8jeFqXlrgDWMgAICOMRWjrYa+vrF0KHz
         zNbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=McuG9zIb2at6RIVI0hAy/z0KbvG85iO9DgI3S3NCsr8=;
        b=h5XMtLvHo8ODqlSqX6OcN5mQj+V7E8Haand3DpBSPB+FewX46rPLjgNGYVDmyG2M/B
         6r2/wrMAYVY7Fiq/nfcT+k6MIqVIkGpGlc66h4aUMyGpudMyzB/PfRG4dYD+B1UzpOtv
         dfnd61q2S2ykSF6PjYqNvFDPtU/13MIOSgeHIajSyowEJxKKGbD0gtcBzGPvs+SZg+oP
         qcIYkHiT94nyht1rOBpAp7xTzdBd11Ybesy3DA8nzWSWgu0I+MheY8sDCN1YcK1APWNa
         C5oWARcGDy18PDtj+LT5uxaIbQY+2JBolbK3+41U8H8YxhlG3CuRWzMetA8eS3LyL/v6
         PS/A==
X-Gm-Message-State: AOAM533LFRchLjzg13SnI1Cxx8LBwVKix/fHkXSSMBQxN+pI/DKFha5u
	RWUj+NYptWw3NkYYkEl/aaKujdeVN3A=
X-Google-Smtp-Source: 
 ABdhPJy38EK9qEC52fjACZWvkOM32TsKGfrPgE9Zlnyygn91C9ZsOX1kQ+/AD/eLut9VxWLffpc5SA==
X-Received: by 2002:a05:651c:504:: with SMTP id
 o4mr35696857ljp.182.1641197462796;
        Mon, 03 Jan 2022 00:11:02 -0800 (PST)
Received: from munkone.intra.qt.io (62-183-187-94.co.dnainternet.fi.
 [62.183.187.94])
        by smtp.gmail.com with ESMTPSA id
 bi1sm3326870lfb.248.2022.01.03.00.11.02
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Jan 2022 00:11:02 -0800 (PST)
From: Samuli Piippo <samuli.piippo@gmail.com>
X-Google-Original-From: Samuli Piippo <samuli.piippo@qt.io>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] rpm: remove tmp folder created during install
Date: Mon,  3 Jan 2022 10:10:50 +0200
Message-Id: <20220103081050.341555-1-samuli.piippo@qt.io>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 03 Jan 2022 08:11:06 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/160113

nativesdk-rpm build is also affected by the stray /var/tmp
created during the rpm install. Remove it to fix QA Issue:
nativesdk-rpm installs files in /usr/local/oe-sdk-hardcoded-buildpath/sysroots/x86_64-pokysdk-linux/var/volatile, but it is expected to be empty [empty-dirs]

Signed-off-by: Samuli Piippo <samuli.piippo@qt.io>
---
 meta/recipes-devtools/rpm/rpm_4.17.0.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/recipes-devtools/rpm/rpm_4.17.0.bb b/meta/recipes-devtools/rpm/rpm_4.17.0.bb
index beb03ba3dd..7769d6a836 100644
--- a/meta/recipes-devtools/rpm/rpm_4.17.0.bb
+++ b/meta/recipes-devtools/rpm/rpm_4.17.0.bb
@@ -134,6 +134,9 @@ do_install:append:class-nativesdk() {
 do_install:append:class-target() {
     rm -rf ${D}/var
 }
+do_install:append:class-nativesdk() {
+    rm -rf ${D}${SDKPATHNATIVE}/var
+}
 
 do_install:append () {
 	sed -i -e 's:${HOSTTOOLS_DIR}/::g' \
-- 
2.25.1


