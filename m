Return-Path: <valentin.boudevin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D5F8BD46618
	for <webhook@archiver.kernel.org>; Thu, 15 Jan 2026 19:03:47 +0000 (UTC)
Received: from mail-qv1-f44.google.com (mail-qv1-f44.google.com [209.85.219.44])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.2520.1768503820057542198
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 Jan 2026 11:03:40 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=W+ozcM6S;
 spf=pass (domain: gmail.com, ip: 209.85.219.44, mailfrom: valentin.boudevin@gmail.com)
Received: by mail-qv1-f44.google.com with SMTP id 6a1803df08f44-8887e471148so974426d6.2
        for <openembedded-core@lists.openembedded.org>; Thu, 15 Jan 2026 11:03:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768503819; x=1769108619; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hsCmgxLTmhR7vzse6zQX5HnO+P0hIojb9r6NQIid2cQ=;
        b=W+ozcM6SL1LtHOghBE/xetosNcSK+7r1dlzWTUuRi14cU2xgzE6rD7brQMNB8lPqUG
         rfPMo/4BPrNm4vHXJO+Evehl3B2dW5eu17tBLVJ0BvDIEI03vLsirS9znvTIk7X7QR45
         NFhorLhzFrecfYJAXo8BW/0ojGoGF4IfVDICtZUJw2Pbk5oJa8bLjcRPpKZK5wWCaahx
         spLdHlJzynE0b6uhzZ+QsJvEWIh0VIkQveUzmXUXFHe6J1ZaFs32EW/LsmB+wZNzIEcs
         ibtaVCYyi92WOXDQ/YvYIu0ZIYCXtlgRe0OIDDDFp4g6Vl/EJrXThNlYXwIrMRneUifH
         /RKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768503819; x=1769108619;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=hsCmgxLTmhR7vzse6zQX5HnO+P0hIojb9r6NQIid2cQ=;
        b=Nnqoj3tuVl8Ak7jvURz9cH4Z/0arC7pUkLQGtqAu6458JpRneQGcEkr+m/kGZV7vO6
         gJ+rK6Y7GLo8JQevJl9aET9jsCFp3iDFVjcjugv9nV+neqCIhCx790k/g9eFbnLSeWul
         aKLprGxsO2IpO3IEB4z/mJ8SO4BUhijNI3aFLUOxLskuSBYo4VC6WefmrQk/PoIfUyQd
         bKZ8VbRivy2neiUVjvYcXDzUsgZRZ5eNtJhLW2yPw9cK64qOgtc+2leIqlqMJSybwvS2
         vOotJlAoiKPcELGoJUOGKcSJd7aihmBsr+eLi5crGnNU9/kar4fnAmn5oYDZSrIppV7p
         pfBQ==
X-Gm-Message-State: AOJu0Yyf2ieftQpAdBgXKod5v2JR7txwXMYFPhPMAt846swAjKfhHfg7
	I/D78/TJTRVeY1Rgv0ymrd0ItzKJDDq0R84itKBfqMV4IfnXFaT/CqAUE1O83SUXG9A=
X-Gm-Gg: AY/fxX6pF0j6Mjp2whHlhQtaAFOcI71vZtQy9lt+o1oNbeX1fGoKnzoT5sElr6XBds8
	pI14RoBMogPkwYgumPQIWMU0mWr6vpkkefkeCN+9PpS8rGmn9c6nMY7pih5zFO3BOgPpUPW49yF
	3vVUmSxqR0dE+bspfagqNsfJcXo+TFxwGlel52lwWujCiL7PHJg/EiXQyW96ZjF4w+YPpSJnFUn
	yHnVm86LbFMbJbuCuLLJZP7OTlNXd2QFhUiRLDFbWOz76P7x5BBalSGgygEtMvnyJXJ8FOXgj4r
	sHST2YL21gpkeOi0mJlFZIlgf3Uh5ZOYEC+WShIG6XB8lOQWwrM9cpZyhFETutg/3Ku04wrpnC1
	br+eEbrBaD4dQ9SgLMKNLQH0yAXqito2PqSN6hGLtkkPGpuHd0SYk5SxmmauIdpOOIETHojSo+m
	9rpRdf64kjIr1fp8eUJ4X3MYczr2cj7vzirvSNPrh/5HkPmoz0IxTgFcE=
X-Received: by 2002:a05:6214:610a:b0:87d:cb51:4015 with SMTP id 6a1803df08f44-8942dbfb374mr4507486d6.1.1768503818786;
        Thu, 15 Jan 2026 11:03:38 -0800 (PST)
Received: from vboudevin-pc.mtl.sfl (mtl.savoirfairelinux.net. [208.88.110.46])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8c6a71c06e5sm17016385a.16.2026.01.15.11.03.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Jan 2026 11:03:38 -0800 (PST)
From: ValentinBoudevin <valentin.boudevin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: ValentinBoudevin <valentin.boudevin@gmail.com>
Subject: [PATCH v4 4/4] linux: Add inherit on generate-cve-exclusions
Date: Thu, 15 Jan 2026 14:03:30 -0500
Message-ID: <20260115190331.2276779-5-valentin.boudevin@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260115190331.2276779-1-valentin.boudevin@gmail.com>
References: <20260115190331.2276779-1-valentin.boudevin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 15 Jan 2026 19:03:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/229431

Update linux-yocto.inc to inherit the new generate-cve-exclusions class.

Signed-off-by: Valentin Boudevin <valentin.boudevin@gmail.com>
---
 meta/recipes-kernel/linux/linux-yocto.inc | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/recipes-kernel/linux/linux-yocto.inc b/meta/recipes-kernel/linux/linux-yocto.inc
index 4d0a726bb6..f6a1161940 100644
--- a/meta/recipes-kernel/linux/linux-yocto.inc
+++ b/meta/recipes-kernel/linux/linux-yocto.inc
@@ -5,6 +5,9 @@ HOMEPAGE = "https://www.yoctoproject.org/"
 
 LIC_FILES_CHKSUM ?= "file://COPYING;md5=d7810fab7487fb0aad327b76f1be7cd7"
 
+# Generate Dynamic CVE Exclusions
+inherit generate-cve-exclusions
+
 UPSTREAM_CHECK_GITTAGREGEX = "(?P<pver>\d+\.\d+(\.\d+)*)"
 
 RECIPE_NO_UPDATE_REASON = "Recipe is updated through a separate process"

