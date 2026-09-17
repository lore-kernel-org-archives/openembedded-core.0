Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 710A2C982D8
	for <webhook@archiver.kernel.org>; Thu, 17 Sep 2026 22:08:04 +0000 (UTC)
Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.1674.1789682882558563661
 for <openembedded-core@lists.openembedded.org>;
 Thu, 17 Sep 2026 15:08:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=qZ6A9NYn;
 spf=pass (domain: smile.fr, ip: 74.125.225.141, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49e71cdb22bso873775e9.2
        for <openembedded-core@lists.openembedded.org>; Thu, 17 Sep 2026 15:08:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1789682881; x=1790287681; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=aUbTIDP8lBEomyLSty1uw/lmOFt9uMJIXpUqVu5GPNU=;
        b=qZ6A9NYnhKuVFNA7pyYG97y3ApaeLr6NyhxJ4rOJrjZQnh6BhxTFNRgGdDjEHU6PDs
         0HcT7z7OeaZhbPGvzWMFymoGBj/1SCwL/yzQEcbHDdr4+FXkZy5WS7ZyDKLzZyqAnS96
         /YVLtlgZtvVwbL2no344bmXjLhOhhu/JxpWjo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789682881; x=1790287681;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=aUbTIDP8lBEomyLSty1uw/lmOFt9uMJIXpUqVu5GPNU=;
        b=cOldyvv0ZnWoN45wBinnh8E5d/pz32Cld/rgfgwD0fb1N2/cSxvYFV/ZeiIGS/Ggt4
         xaylAtiPGw/p/mhlOCsCXrJO2y45wVHYEBB73SkL8Vs6b8Di6BQjRaPXJy7FkzKontu+
         AAsw77TrL+ZdBf/BCQc+QyAuY3hF4uIs0/beiXAiee9R8y6G4kLsRSlF0oSTU/a2A8B+
         gQYS6mCMW8La9erznIef6+uZmepa6FpPYCvFNclFmuy57FKBukFChw8Fvtf8TeU7UMln
         ggTQNnJhzFNdrb9v1SUZpO5vqF855ITGw0esiatpnqrXzkl48i2eAHFennxNIn/1YZ+a
         D7gg==
X-Gm-Message-State: AFuF++mSEsaoexBlM7Pn6ne7AgZSLcFMok1EUt7+PBufc4qrwq1w5xUX
	FKMacaFwzzWju3AdvIPVidngozFDTn2kv/Qs0nqZRqUz0BnCmFFK+n3WfCpHTz+rdxVJOtZHOE/
	zgUEnJow=
X-Gm-Gg: AYBFou3mn9T1Mx+OAPEIABCjYYoYV0kvFmQNf6u2Z8p39kOk05iALlm/HL5kgFeI95P
	qeD1D/4btFQA/kFOrTUUBFmjWZ9bjSYX1KQob8yn8nADkaO4GtF5sjxy0AmUsJFNaaBye28wfJx
	/fFfaOzGTmnzCX5lGO1nknbzJVy+4gdHvLlXAxstbRLxvZyEYvzoyTZi5oL9LYQVGWzx+/PClKR
	2ZGe5Z6Ms8cXqd1Oe40wVKOu5/UuJs8TeA2Tbs91IGumojByqLIhEgufcoFegNgKQTFFELD+ayV
	EocOvUFHIAOLXyIIzdOQzaksuoQccBZA4C0m9KMDpZlyykiygtL0B4G8yBnHsadhvX/NEQxHYn7
	1SuNtyYxp4XUSNCisTCq7LsnQ+UbdUuNgaKKNC5wop1RsZtmvdX0X4SFNDD4zW4fQMlco6zfmqO
	Q84hhTirE2X4QZ+qop+YngR//7ILSbasS7q/mNSxNDLJOApsgpAI2WomavsVQopriixZCao9oQV
	rvC21cGzJaAQylsZQFx782O9aOGM31SukVKH//rrn+Pd8GQ1kkq+usnDxNpPneMRVoCV2Od5j3E
	ms41mFZZtw==
X-Received: by 2002:a05:600c:6211:b0:49c:fa20:cbfb with SMTP id 5b1f17b1804b1-49fc5728f84mr2888465e9.18.1789682880850;
        Thu, 17 Sep 2026 15:08:00 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fc471b9a2sm8984075e9.0.2026.09.17.15.08.00
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2026 15:08:00 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][wrynose 23/79] sbom-cve-check-update-cvelist-native: update to version 2026-08-03
Date: Fri, 18 Sep 2026 00:06:08 +0200
Message-ID: <ddc382c4e44975a25752520402f004b26c9d9ac9.1789681419.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1789681419.git.yoann.congal@smile.fr>
References: <cover.1789681419.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 17 Sep 2026 22:08:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/246118

From: Benjamin Robin <benjamin.robin@bootlin.com>

Update cvelistV5 to the CVE database from 2026-08-03.

Signed-off-by: Benjamin Robin (Schneider Electric) <benjamin.robin@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(From OE-Core rev: 25e68deb8178f7021605a39fa85acea04a375372)
Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 ...23.bb => sbom-cve-check-update-cvelist-native_2026-08-03.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/sbom-cve-check/{sbom-cve-check-update-cvelist-native_2026-07-23.bb => sbom-cve-check-update-cvelist-native_2026-08-03.bb} (89%)

diff --git a/meta/recipes-devtools/sbom-cve-check/sbom-cve-check-update-cvelist-native_2026-07-23.bb b/meta/recipes-devtools/sbom-cve-check/sbom-cve-check-update-cvelist-native_2026-08-03.bb
similarity index 89%
rename from meta/recipes-devtools/sbom-cve-check/sbom-cve-check-update-cvelist-native_2026-07-23.bb
rename to meta/recipes-devtools/sbom-cve-check/sbom-cve-check-update-cvelist-native_2026-08-03.bb
index 0e664d89e07..aa21b06953e 100644
--- a/meta/recipes-devtools/sbom-cve-check/sbom-cve-check-update-cvelist-native_2026-07-23.bb
+++ b/meta/recipes-devtools/sbom-cve-check/sbom-cve-check-update-cvelist-native_2026-08-03.bb
@@ -6,7 +6,7 @@ HOMEPAGE = "https://github.com/CVEProject/cvelistV5"
 SRC_URI = "git://github.com/CVEProject/cvelistV5.git;branch=main;protocol=https;destsuffix="
 SBOM_CVE_CHECK_DB_NAME = "cvelist"
 
-SRCREV = "7a274ec07043f54c07d0a3b5c7fc89ba5793f023"
+SRCREV = "b160e6f2915ac726b29ee0689fc920f5016abef5"
 UPSTREAM_CHECK_GITTAGREGEX = "(?P<pver>.+)_baseline"
 
 require sbom-cve-check-update-db.inc

