Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
 by mx.groups.io with SMTP id smtpd.web11.24653.1627655360721656145
 for <openembedded-core@lists.openembedded.org>;
 Fri, 30 Jul 2021 07:29:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=a3M7JkFz;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.53, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f53.google.com with SMTP id n28-20020a05600c3b9cb02902552e60df56so6531005wms.0
        for <openembedded-core@lists.openembedded.org>; Fri, 30 Jul 2021 07:29:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=9yGWWGgDcWwNTV4I28o4nqAIxNeVTlWEvkpSKLIIf7Y=;
        b=a3M7JkFzXTuw/mzbu0olLxQZvUX7By/4IzIrZ7CcPwCAQZhY9s/WEArI7fJMjd8Kjv
         WC8aFS0Wj/uS/u7F2qAnqfWdoMC7sKb+zwhqL3NEdfQZxxKGuCBgHPDTb3veGXoLn0S4
         LMBxJmvFMO+5q86uU/ruyvmb9afAHDCPKwPMg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=9yGWWGgDcWwNTV4I28o4nqAIxNeVTlWEvkpSKLIIf7Y=;
        b=YaGxrZ936QyrxDFE64+ZCkQLzlwIfZY1B4+ehLwm1OEMD5X1CuMUeIgeaMRdB9yzWQ
         b5+al9gTI+ZfjmJEbyMYt52P+9SohMZ7miVzLniDCAo18Xy6e9uP3GEVbguiq9a/5GtD
         RUF9i6Lq1TkiQmBqWkou2qW/aP/L1iGHyM4Sf3gwopXbHwHvRTL9s9sLXdAP8C8jaara
         fUB+ZPJE6CmfrHGklRC8QF7AAJiZv1gBbsWI+RYg5kbihTEoypvSdBDQ9tKYp4NN4d0a
         +qMi9+PyWTIg283pQObGFe4gltg8PsXh/WxV5EA2Wy7UaAwaoqLRKn5R1u831eA4cIzX
         VXQw==
X-Gm-Message-State: AOAM533kOfJ2IZvSKSDnzWBFiFkz6sE2kSbTRLDcaRNBWI1yUiLHT49O
	qpxqr+qWZ9SHppcYrZWIQ5nf/BaksxiKNQ==
X-Google-Smtp-Source: ABdhPJzathVArryNsjaWYrYO+zY4/8jZN498FnBr22ajObRqdfT2oJaH4mIFk5mlKUd5+FTMqm5Y8Q==
X-Received: by 2002:a7b:c399:: with SMTP id s25mr3415172wmj.180.1627655359134;
        Fri, 30 Jul 2021 07:29:19 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex.int.rpsys.net ([2001:8b0:aba:5f3c:47e7:2d3d:e4c2:218b])
        by smtp.gmail.com with ESMTPSA id l7sm1782696wmj.9.2021.07.30.07.29.18
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Jul 2021 07:29:18 -0700 (PDT)
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/2] dropbear: Fix incorrect package override for postrm
Date: Fri, 30 Jul 2021 15:29:17 +0100
Message-Id: <20210730142918.3364939-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This bug has been around for a long time (2011) but fix it to do
what was intended originally. The postrm is changed by classes but
those should append to existing entries.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-core/dropbear/dropbear.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/dropbear/dropbear.inc b/meta/recipes-core/dropbear/dropbear.inc
index b5f3778abec..f2a490c4736 100644
--- a/meta/recipes-core/dropbear/dropbear.inc
+++ b/meta/recipes-core/dropbear/dropbear.inc
@@ -114,7 +114,7 @@ ALTERNATIVE:${PN} = "${@bb.utils.filter('BINCOMMANDS', 'scp ssh', d)}"
 
 ALTERNATIVE_TARGET = "${sbindir}/dropbearmulti"
 
-pkg_postrm:append_${PN} () {
+pkg_postrm:${PN} () {
   if [ -f "${sysconfdir}/dropbear/dropbear_rsa_host_key" ]; then
         rm ${sysconfdir}/dropbear/dropbear_rsa_host_key
   fi
-- 
2.30.2

