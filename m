Return-Path: <alex.kiernan@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8CD28C54F64
	for <webhook@archiver.kernel.org>; Tue, 12 Apr 2022 16:46:43 +0000 (UTC)
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com
 [209.85.221.54])
 by mx.groups.io with SMTP id smtpd.web12.10369.1649768611104922971
 for <openembedded-core@lists.openembedded.org>;
 Tue, 12 Apr 2022 06:03:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=XEySumUt;
 spf=pass (domain: gmail.com, ip: 209.85.221.54,
 mailfrom: alex.kiernan@gmail.com)
Received: by mail-wr1-f54.google.com with SMTP id c10so6512698wrb.1
        for <openembedded-core@lists.openembedded.org>;
 Tue, 12 Apr 2022 06:03:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=5PeIpbpa6rOiKtsPh6A4uefONVbduIipLCXNZEmg8RI=;
        b=XEySumUtnronBfgO4rQLkRFsv7cHwHZF10CqnmD6TyeKC/3BstwxNgPzVgLE+/PStD
         vNq84vcDXPWrNZYAg3CUe1DzXUudFyLhn84+qiYNayy+IJqPz2COfiVkrPugFLEwpMWc
         tdYjZf18uR8wOAJucs+tBCTKQ1mQGIjYR1+r0squTIrLMwqXIGcKrr4GsCirwaAnTd3F
         8lQYZ5Z9joYj4tRXXtY8D050lwElMGgF1WnXeh1pA1jy29FyoWU/gmFBTyciqAtslxWg
         M4S0nRcnUN+bVM+3MmlgvBmL2Dmivra38Di5gTZhU0V4FXs1yreSmBBv/VsWiMqm5ZM0
         0lpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=5PeIpbpa6rOiKtsPh6A4uefONVbduIipLCXNZEmg8RI=;
        b=SajrX5hf+KTRuwi/aCiWsn4onTe6usVEwb1i2saNHyO+cC/eGUnTE1I9PdWMReiJti
         jKKtKsMBh9VUyBg01BUzex28aViCBno29fIPxKffbJkunuFranWh4FfXTb3A51m+OyBO
         XuMU9Eujv1suy1z0cDy6a4GrjS6VOHSPHnID8XnPzvnSG0lfRjcTKbDlxy1Q9BjhD6Ew
         ir8WJhUuR9ZaEf2fS+7W71OL+lXN9Czmy1aaAWNHv8dLR+pINVSpllOuu5Dl8Dj4wcIx
         3Udq+NBbNvaXA/1YWyXsLHG9ROsAZrwaGlDZoyGg6EcPHr/UH3JaJe2T+QFBn2Vc89xt
         HYDw==
X-Gm-Message-State: AOAM531vUlCLft9Ct4BWH+12K9lSgbFc1ys4mm8ZvEdAF3Vd5p7t3rjd
	O2sAN5XBchYpSxVBho+bRBnrXYBIslM=
X-Google-Smtp-Source: 
 ABdhPJxCDfLcPYwaZ1IFl18ZC8DAoyIaB5hNsOHrS2AosZDZ2nPQ3WdajFxTXcGZPMftDwPyXr92eA==
X-Received: by 2002:adf:d1eb:0:b0:207:aba6:418c with SMTP id
 g11-20020adfd1eb000000b00207aba6418cmr4611485wrd.43.1649768609393;
        Tue, 12 Apr 2022 06:03:29 -0700 (PDT)
Received: from localhost.localdomain (cust246-dsl91-135-6.idnet.net.
 [91.135.6.246])
        by smtp.gmail.com with ESMTPSA id
 r4-20020a05600c35c400b0038cbd8c41e9sm2372953wmq.12.2022.04.12.06.03.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Apr 2022 06:03:28 -0700 (PDT)
From: Alex Kiernan <alex.kiernan@gmail.com>
X-Google-Original-From: Alex Kiernan <alexk@zuma.ai>
To: openembedded-core@lists.openembedded.org
Cc: Alex Kiernan <alexk@zuma.ai>
Subject: [meta-oe][PATCH 5/8] wpa-supplicant: Build static library if not
 DISABLE_STATIC
Date: Tue, 12 Apr 2022 14:03:12 +0100
Message-Id: <20220412130315.25917-5-alexk@zuma.ai>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220412130315.25917-1-alexk@zuma.ai>
References: <20220412130315.25917-1-alexk@zuma.ai>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 12 Apr 2022 16:46:43 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/164269

Build the static library if the configuration indicates we should.

Signed-off-by: Alex Kiernan <alexk@zuma.ai>
---
 .../wpa-supplicant/wpa-supplicant_2.10.bb             | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant_2.10.bb b/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant_2.10.bb
index f72a925ac883..43865ed96045 100644
--- a/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant_2.10.bb
+++ b/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant_2.10.bb
@@ -55,6 +55,9 @@ do_compile () {
 	unset CFLAGS CPPFLAGS CXXFLAGS
 	sed -e "s:CFLAGS\ =.*:& \$(EXTRA_CFLAGS):g" -i ${S}/src/lib.rules
 	oe_runmake -C wpa_supplicant
+	if [ -z "${DISABLE_STATIC}" ]; then
+		oe_runmake -C wpa_supplicant libwpa_client.a
+	fi
 }
 
 do_install () {
@@ -89,6 +92,14 @@ do_install () {
 
 	install -d ${D}/etc/default/volatiles
 	install -m 0644 ${WORKDIR}/99_wpa_supplicant ${D}/etc/default/volatiles
+
+	install -d ${D}${includedir}
+	install -m 0644 ${S}/src/common/wpa_ctrl.h ${D}${includedir}
+
+	if [ -z "${DISABLE_STATIC}" ]; then
+		install -d ${D}${libdir}
+		install -m 0644 wpa_supplicant/libwpa_client.a ${D}${libdir}
+	fi
 }
 
 pkg_postinst:${PN} () {
-- 
2.35.1


