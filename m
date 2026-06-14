Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 711D2CD98DC
	for <webhook@archiver.kernel.org>; Sun, 14 Jun 2026 08:04:11 +0000 (UTC)
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.105051.1781424243087411998
 for <openembedded-core@lists.openembedded.org>;
 Sun, 14 Jun 2026 01:04:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=Q/5N/miD;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.46, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-490c1915793so19612255e9.2
        for <openembedded-core@lists.openembedded.org>; Sun, 14 Jun 2026 01:04:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1781424241; x=1782029041; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hYqPmMqcbdk2NtAIwCWbJya0Ym0oLzKiJ7vTL/wLljU=;
        b=Q/5N/miDapem6RA+T20sGIQ/mPawUjegUZ0uXY0WybkzRC9/1dihV2bnefBx8E5MRR
         HpUmPR9XkvtBwYgOI9pdqCjmrAOAM0hypOroAKImQPeEonKBey1l/6/PJESqB4xXq2uQ
         ODu5gwXCjwOi+JvHe26QUv79gbKUaLx+jNpAc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781424241; x=1782029041;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=hYqPmMqcbdk2NtAIwCWbJya0Ym0oLzKiJ7vTL/wLljU=;
        b=q7pO7iaPjaR25ARahkoJqGf7Y8IH7jlra/UPIMfuKJMO0eett6fB+RGx83hY6Fk+pq
         p/SBawToyBHUW0hm8wLuZAyTWlKWHkrytKxLTtDSsc+1dxKcePJI/hK2o0jmsbV/8i1x
         TS1kF8yWAatE/BDsxiWJW4RqMF9gSWqyy/ZTj2hi0SrVVQA+TYjfFZzHwD/InI4w3ekz
         IF3j7j6lVvOALedyGl78MMsGgofOHQtdZQDO9oQPQLz4ncJgaOfpnNYhMYEGEWM2MefX
         pco1Ps2MW0kYThj52ZrXokWmm5fdwm15FY47Uajhz5mBOIJauNTfINDP2mMIXYQkfDpP
         ogWw==
X-Gm-Message-State: AOJu0YxYhN0wFZFRzejAV2AmdkOtUxvnUH3jmnPOoALbN4qgwyJqQ97R
	NGcshmpImGqiElDaFDI7Xqj+uPNKnb2cmhBBGZIz3sdFeXdbQDH95K+oePYj1oqQoVSwNBT4Fr5
	0rj0+
X-Gm-Gg: Acq92OEU1JlWul7v+hPylfLrZBq/+sND8K1wR+ljIeUjtzNNk6EMepBinIevqRA973N
	hLTPzpDlYDmQzWCmWwVQH/6a1VRTucig++FFXKY52QSJMrEpgycZmbHlNEdrU0HOHSd+FCM2Cb/
	z7N8VIdU3nEZWIOGJ03oQUimhBRSrGDSkcUGWB0YahysIZih3dZ3fT5LGsxs+emW7S+7eTl/FzM
	kuDUYhN4v7BJSSL1PK0hINzNmEYPG1Jm10VoI00l3wiJ1/hSUMNhsISziq7iwP3gtoU/jecknUr
	+Dx6d0OpsNdTAO0xDZywyLV70v1cmO2j9WzHf4ryzxAZ9ITrcC3hnIs/9we/eaRLPqag5PANAbU
	dLoCMhRmtUpmwn0IOgozrFzCFeVabciofxo1NBpJBjZoSDcBOt0Dv/d51zeXsBen+EFXaIavwsk
	EwvUZ5ejPlADWk+hvlycadKyECBTI2wQ0/17COXRFrcUTFOq6dczDT
X-Received: by 2002:a05:600c:a0c:b0:490:bb19:b110 with SMTP id 5b1f17b1804b1-490ec50a221mr121433085e9.27.1781424241299;
        Sun, 14 Jun 2026 01:04:01 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:b23b:4f5a:d2e8:6789])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-492202edf89sm149999065e9.1.2026.06.14.01.03.59
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 Jun 2026 01:04:00 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 32/56] python3-lxml: upgrade 6.1.0 -> 6.1.1
Date: Sun, 14 Jun 2026 09:02:43 +0100
Message-ID: <20260614080307.4017177-32-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260614080307.4017177-1-richard.purdie@linuxfoundation.org>
References: <20260614080307.4017177-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 14 Jun 2026 08:04:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/238716

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 .../python/{python3-lxml_6.1.0.bb => python3-lxml_6.1.1.bb}     | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-lxml_6.1.0.bb => python3-lxml_6.1.1.bb} (95%)

diff --git a/meta/recipes-devtools/python/python3-lxml_6.1.0.bb b/meta/recipes-devtools/python/python3-lxml_6.1.1.bb
similarity index 95%
rename from meta/recipes-devtools/python/python3-lxml_6.1.0.bb
rename to meta/recipes-devtools/python/python3-lxml_6.1.1.bb
index b7bbf5c3d69..77386ebdd0a 100644
--- a/meta/recipes-devtools/python/python3-lxml_6.1.0.bb
+++ b/meta/recipes-devtools/python/python3-lxml_6.1.1.bb
@@ -18,7 +18,7 @@ LIC_FILES_CHKSUM = "file://LICENSES.txt;md5=e4c045ebad958ead4b48008f70838403 \
 
 DEPENDS += "libxml2 libxslt"
 
-SRC_URI[sha256sum] = "bfd57d8008c4965709a919c3e9a98f76c2c7cb319086b3d26858250620023b13"
+SRC_URI[sha256sum] = "ba96ae44888e0185281e937633a743ea90d5a196c6000f82565ebb0580012d40"
 
 SRC_URI += "${PYPI_SRC_URI}"
 inherit pkgconfig pypi setuptools3

