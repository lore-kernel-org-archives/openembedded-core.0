Return-Path: <leon.anavi@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BEC36CD98DA
	for <webhook@archiver.kernel.org>; Tue, 16 Jun 2026 07:28:32 +0000 (UTC)
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.148573.1781594908543136415
 for <openembedded-core@lists.openembedded.org>;
 Tue, 16 Jun 2026 00:28:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=Eao+Amtg;
 spf=pass (domain: konsulko.com, ip: 209.85.221.50, mailfrom: leon.anavi@konsulko.com)
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-45efa80e0afso3301986f8f.2
        for <openembedded-core@lists.openembedded.org>; Tue, 16 Jun 2026 00:28:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1781594907; x=1782199707; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=5hmRIFT9KUiqfnCTtTUA+IePbXKW4dhB1XRH66Y5Ubo=;
        b=Eao+AmtgiiNvqvaxFt6dECDQ+DXGVFUnQO8fS9VPiuPjSP+JCQTfw3LuE6DI3FKw8z
         PE9pB0YnkAxNT/Olosm1AkAGQtcj8tncbWI1vyO9gkM9ioihyT+KPdLjn8f2AS/xIf/N
         wzxMFo5zqyJa/OUP1PE0loMCui4mH9jQNxirU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781594907; x=1782199707;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5hmRIFT9KUiqfnCTtTUA+IePbXKW4dhB1XRH66Y5Ubo=;
        b=NpjZDgPfxg6xjFaiuz/D199PaNZZS44NVOQPTp4JNAgYMl4xrNLYkp49MlLDsVSIFc
         kY+s2tGPm83vkbUq0bThFVFQQN7+zxT5sPiE/EP9+THmUXIyZQtRhY1m7KWEjwyxZ3nU
         2kTQtlhlIxFHyNTyowAQh0WTep6rRKlx+4DUGNCWWip5oy4PilBLR0TGm9QUp1/4M12m
         SwDpkAVf3ePrSv1pLjTEDQj9wjbme8GSL6LVE0IdHS6TNVwYLbP560ICJx5jc9BwoWmG
         4Gwi+VT1ogvr8E3WJPkvJDcqQSLnUlGJvMbO+zdPXji+ECB9NZhfOYC89Houena8V7pI
         JeFQ==
X-Gm-Message-State: AOJu0YxyU88gKMZKJffw+Zjb7wYfFVvmJqW9d7NpnPer9JahKWqsjhb9
	GnRAp0FBffF9rm+fG2/ez/O65y0rR2qSQc/rIcPe3CQszNpwQYh0+xi6lhhaO9HoncNkZb8cTu0
	Kgr2X
X-Gm-Gg: Acq92OF9cN0dXQCeoj7eCfrAqdFlQxDiLoFXoAd82VkpbWCsDHQJj9ALiWDY04qldts
	xbKMiCEgvnWgUsXG+U5Fm7bUo4PhMe1p078v6X1yoWYt01EwXiVucrL3AHOnx0lArrGynk3Jhlf
	6XPXL9+u19XVi/42u07ngZvpD9FSCkKEmzUMRivSSdqnMhI0U0oPZM34+RcvJu5ranoLnMS1ehL
	FnTl7UFrY7nQfcpuzMsc56YxGbVcOMgTYf1exxwbbheRooZdR9/9MWQyvBZsaCSpx/BD2NzfLFA
	mrNGzqynGEB7PWTpQRpHltY1WOn1CVfAC93U7+QpWcjPoHM2GVhP4Ebezgayd0+i8Y+YR7D+f+w
	uUCQXsujuiKDZKhsapDtAzPYBIZttBsn2PYMV0ieiUvPEgId+Xfpc7flR9vkvOtCt//mRj5zRKr
	YMlFGQpehRkOTf2XlBUybhEoLZ6s0w0bsYRGe19wUAn9IbP38=
X-Received: by 2002:a05:6000:428a:b0:45e:edcc:f6dc with SMTP id ffacd0b85a97d-4606db9667amr25679588f8f.6.1781594906019;
        Tue, 16 Jun 2026 00:28:26 -0700 (PDT)
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4606f26393asm44289424f8f.5.2026.06.16.00.28.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Jun 2026 00:28:25 -0700 (PDT)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-core@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [PATCH] python3-uritools: Upgrade 6.1.0 -> 6.1.2
Date: Tue, 16 Jun 2026 10:28:23 +0300
Message-ID: <20260616072823.2939955-1-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 16 Jun 2026 07:28:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/238873

Upgrade to release 6.1.2:

- Minor documentation improvements.
- Update build environment.

License-Update: Update years

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 ...{python3-uritools_6.1.0.bb => python3-uritools_6.1.2.bb} | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)
 rename meta/recipes-devtools/python/{python3-uritools_6.1.0.bb => python3-uritools_6.1.2.bb} (51%)

diff --git a/meta/recipes-devtools/python/python3-uritools_6.1.0.bb b/meta/recipes-devtools/python/python3-uritools_6.1.2.bb
similarity index 51%
rename from meta/recipes-devtools/python/python3-uritools_6.1.0.bb
rename to meta/recipes-devtools/python/python3-uritools_6.1.2.bb
index eeeca59e21..3112b98c19 100644
--- a/meta/recipes-devtools/python/python3-uritools_6.1.0.bb
+++ b/meta/recipes-devtools/python/python3-uritools_6.1.2.bb
@@ -2,10 +2,12 @@ SUMMARY = "URI parsing, classification and composition"
 HOMEPAGE = "https://github.com/tkem/uritools/"
 
 LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=e21bbe53b2730bfe1911cf381b81821e"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=079933dfba36eb60b5e3512ca0ab61ae"
 
-SRC_URI[sha256sum] = "be97e452528e7a42ef0a4df68364ddd77833e982c5bac5cdcfee15c81f65e96b"
+SRC_URI[sha256sum] = "fa60028843a8be651699a1ee2b399066eeaef349224b32a177efa4aeba463f00"
 
 inherit pypi python_setuptools_build_meta ptest-python-pytest
 
+DEPENDS += "python3-setuptools-scm-native"
+
 BBCLASSEXTEND = "native nativesdk"
-- 
2.47.3


