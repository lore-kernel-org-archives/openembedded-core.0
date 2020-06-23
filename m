Received: from mail-ot1-f67.google.com (mail-ot1-f67.google.com [209.85.210.67])
 by mx.groups.io with SMTP id smtpd.web11.8005.1592870562450507431
 for <openembedded-core@lists.openembedded.org>;
 Mon, 22 Jun 2020 17:02:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista-com.20150623.gappssmtp.com header.s=20150623 header.b=f2Twv3kN;
 spf=permerror, err=parse error for token &{10 18 websitewelcome.com}: parse error for token &{10 18 _spf.google.com}: limit exceeded (domain: mvista.com, ip: 209.85.210.67, mailfrom: jpuhlman@mvista.com)
Received: by mail-ot1-f67.google.com with SMTP id m2so14741877otr.12
        for <openembedded-core@lists.openembedded.org>; Mon, 22 Jun 2020 17:02:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=COKit8Xl4b/fxLr4NtKSZsLWBZVd0EkgxkvzmmNCqYg=;
        b=f2Twv3kNJLszTPr9yXrFJS2L5nbj1pcTey50l4WDx9jPOsBBcWd2Mc3RxXeYQ1vXUI
         P1jZZ0rAbMmR68f2PfLYioKuCQ3xH4Namt/eBU8fNdOhoK3dAwjdIrxS0Aq5IYlCItuV
         nnoQY6OA0xU/02ey0IlniK9cf/2TWU0vJnY5Bnkjikf3AfzI/YDzgtMD6SMThCtAtmRG
         MM9R81GOauwbwc7Uaa72j040R4j1u1vfdJZMZ7c9vfKOBT80Xwfpu6wvpitPAKayMnWb
         bAo3odHLG+++xR0EBe+FpfZvi9jJrKbxEK+1WcrIas32iYwJTOl3xkwKDChLt0WZkVr1
         5k5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=COKit8Xl4b/fxLr4NtKSZsLWBZVd0EkgxkvzmmNCqYg=;
        b=IUxp/fqzuHvpJvst7lynUbzxDfe+khPa1SJx+8VRZFRBpwQTBfBER8sLEtOffuOoXZ
         CIcK6cQ92j7dJ/xAE+Mbbuf04MKEnOaeE5AQhufFJRzUoqSytrJQ1DPNfmn87ARfQk/C
         1FJCWsmJTeASp8MMdYpbZqReKWJIj24fvukxJFVxHPqiDkkPvWhdIy96PJlg75KMSeoq
         9sA4uEf9cM6WgUCxutC1n+wPOtpGqSzvm2e3gkFFezv3fdvCHBHAhf1GQPBSjaWSuhqC
         y1jiGCcNiqxBchMb34st76C5B2DVyxhA6dGUPHn4iB+HYK44fq+4ugp39LKh69EVrgHK
         t0wg==
X-Gm-Message-State: AOAM531nCgHVfPbUXw6Ljnspd1GSOZOLdXc4A+qdHWh7f7pCCzSMJUyb
	xJ4Cy+yHC19OxhIPCSw+zE59XAS9P/4=
X-Google-Smtp-Source: ABdhPJzN3O19HnB2RRUeUNCoX9pRGqiowrzQHB226e35UFTnKAc/h0SCuowZJgEDUmBPIMwjZrsjSg==
X-Received: by 2002:a9d:456:: with SMTP id 80mr15531248otc.2.1592870561494;
        Mon, 22 Jun 2020 17:02:41 -0700 (PDT)
Return-Path: <jpuhlman@mvista.com>
Received: from workhorse.localdomain (99-14-97-149.lightspeed.frokca.sbcglobal.net. [99.14.97.149])
        by smtp.gmail.com with ESMTPSA id k8sm3600177oik.31.2020.06.22.17.02.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Jun 2020 17:02:40 -0700 (PDT)
Received: by workhorse.localdomain (Postfix, from userid 1000)
	id A0E722A0B30; Mon, 22 Jun 2020 17:02:39 -0700 (PDT)
From: "Jeremy Puhlman" <jpuhlman@mvista.com>
To: openembedded-core@lists.openembedded.org
Cc: "Jeremy A. Puhlman" <jpuhlman@mvista.com>
Subject: [PATCH] xmlcatalog: add exit 0
Date: Mon, 22 Jun 2020 17:02:37 -0700
Message-Id: <20200623000237.28031-1-jpuhlman@mvista.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In most sysroot creation steps, the sysroots components are installed in
depenancy order. However, in the case of build-sysroots, since it is
not using standard dependacies, post installs that use xmlcatalog fail
because xmlcatalog is not installed. Since the last execution in the
script is xmlcatalog, the script returns 127.

Signed-off-by: Jeremy A. Puhlman <jpuhlman@mvista.com>
---
 meta/classes/xmlcatalog.bbclass | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/classes/xmlcatalog.bbclass b/meta/classes/xmlcatalog.bbclass
index ae4811fdeb..e8d73abcf5 100644
--- a/meta/classes/xmlcatalog.bbclass
+++ b/meta/classes/xmlcatalog.bbclass
@@ -15,6 +15,7 @@ xmlcatalog_complete() {
 	for CATALOG in ${XMLCATALOGS}; do
 		xmlcatalog --noout --add nextCatalog unused file://$CATALOG $ROOTCATALOG
 	done
+	exit 0
 }
 
 xmlcatalog_sstate_postinst() {
-- 
2.20.1

