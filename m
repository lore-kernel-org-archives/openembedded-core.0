Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BFCE7CD5BAF
	for <webhook@archiver.kernel.org>; Wed, 20 May 2026 08:21:12 +0000 (UTC)
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.7377.1779265264740600761
 for <openembedded-core@lists.openembedded.org>;
 Wed, 20 May 2026 01:21:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=LTU5sbDY;
 spf=pass (domain: smile.fr, ip: 209.85.221.46, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-44509921fbcso2817262f8f.3
        for <openembedded-core@lists.openembedded.org>; Wed, 20 May 2026 01:21:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1779265263; x=1779870063; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=u6hu2wjuqy56zgLH39N9IVie1m69ECjfc/u7p/LkM8o=;
        b=LTU5sbDY7zvC+SuKipLeBRLp/rJwyX54whtf9G2WQ19pYc6KHQX/kk4+2jekBADnn/
         Hk6VouUimq1ihFN8gkEO1LrVaDOlEDEnx4W5NDw3kk9syMGMKWLuU8YqtrwJQe9R1rPR
         fTQ/f3ZEkUGU1l95cvrSu0rQn3MjYyyp6HIug=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779265263; x=1779870063;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=u6hu2wjuqy56zgLH39N9IVie1m69ECjfc/u7p/LkM8o=;
        b=rTfjrCYZEissNvk7iET+mPfXoDyIXN7lsc4Aa1rrFHhtk61YVxlYP678jzLnlX2Zfp
         FRxCh7yScRxG10c8tcyil8er1b1UYD2tE6VT5cfxdNwE+kaZ/IAqNRIFhNlHdWlR5xUe
         ebcqAmAfX/F47mw2uiCBme5gRmO1PsXNpBIz6MfyD3oAEDEJ5eZArX+NIZ56F1SEEgb0
         Ryf8JtdQkV7o7oGBZ0vS9wxVuTpReQAwW45rxH7pEGZ4Hg2rQ4fhpxKdSpLtbD05U6CT
         6947XCT7nWxnKD5tk1LlWkalMRUZewSgzikOUKXw+XC85zIModJMk87xL6aAZrwhi2QD
         1S/A==
X-Gm-Message-State: AOJu0YxQujgnzP2f2puek5RDf6JoBWAXPrVnkYYGA73M6Me/WBdo0990
	7yuhQ7ZIpgH6La5quLXRldk/oQjHff11WVZnn0mYAC1AF8UZRTdzte/Q5byLSdF6g/AQJT76TnY
	IZ4Pm
X-Gm-Gg: Acq92OE8yOQ8zGFNOYPc1+Wfs+N4mQ6K1eUqN20H51068bhDShpePUbUIVNABDZkFYh
	TjqACwUJQAwC8iOvKAeKr41ORcUV/S6BO691dHSXkIYCaR/awFDWFQ0dswsGj5OZxgF8R6apR8V
	kGqWTS8U7VasLL10V2aenEtoDFIGrX2lgdDmTETOULze3SFGKGK3JqVJedbybmyhXer8+lohA1x
	Qimo47vDcbB07MKLKmuaV4JClDQwGt+Mv8/9nr/qZ+Vjti3I8bz/xsdR7FVEIecTPH44z7PYyio
	56CX8WxnOze7dVzmLcpvdhXe40FN5rW7XzSwLbGZxpVE14AzL0nW+C35+n/2dXIUzBHd6gCJqqv
	65AqZjiNJ/Nxityn/6aGXoI0fRDNIggRD7ZI2g1h4Vj5PYspNedx8eivRXWw5NYclAaIaU47lLX
	qcJx/+ImQF8n91PdpxIW5ai5Fpfe14n0G3piJ632X1LR4tFiTJkaTDwX7GIBLW3nOa+3lag/Lh6
	iad1nlxZ7AbWH/6Jc0rJxLZ8yVz6A80Jy5eCEo=
X-Received: by 2002:a05:6000:26c4:b0:43e:a69b:d810 with SMTP id ffacd0b85a97d-45e5c5e6096mr38322343f8f.38.1779265263160;
        Wed, 20 May 2026 01:21:03 -0700 (PDT)
Received: from localhost.localdomain (2a02-8440-250c-63aa-0256-2b9f-d16e-d784.rev.sfr.net. [2a02:8440:250c:63aa:256:2b9f:d16e:d784])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45d9ec39ff1sm56350642f8f.10.2026.05.20.01.21.02
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 May 2026 01:21:02 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][wrynose v2 10/28] b4-config: add send-prefixes for wrynose
Date: Wed, 20 May 2026 10:20:11 +0200
Message-ID: <c5140b19323b4a15222585cc853ebb8359baa9ea.1779264709.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1779264709.git.yoann.congal@smile.fr>
References: <cover.1779264709.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 20 May 2026 08:21:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/237409

From: Yoann Congal <yoann.congal@smile.fr>

That might help new users send correct first stable patches.

Cc: Quentin Schulz <quentin.schulz@cherry.de>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 .b4-config | 1 +
 1 file changed, 1 insertion(+)

diff --git a/.b4-config b/.b4-config
index 41094218531..cb3022dcce7 100644
--- a/.b4-config
+++ b/.b4-config
@@ -1,3 +1,4 @@
 [b4]
   send-series-to = openembedded-core@lists.openembedded.org
   prep-pre-flight-checks = disable-needs-auto-to-cc, disable-needs-checking
+  send-prefixes = wrynose

