Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 51B4BC41535
	for <webhook@archiver.kernel.org>; Wed, 18 May 2022 10:59:26 +0000 (UTC)
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com
 [209.85.218.51])
 by mx.groups.io with SMTP id smtpd.web08.3413.1652871551095979225
 for <openembedded-core@lists.openembedded.org>;
 Wed, 18 May 2022 03:59:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=nVBmKK1A;
 spf=pass (domain: gmail.com, ip: 209.85.218.51,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f51.google.com with SMTP id n10so3048976ejk.5
        for <openembedded-core@lists.openembedded.org>;
 Wed, 18 May 2022 03:59:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=smGu9x5BknaR16HmxfiAK07SXpn4IX+HQTTjyDUGz40=;
        b=nVBmKK1AmEEIXs6eyxyRJi/jwxiGTxgi8XGzjGGJsydd0ZBAuELWozHF44/pEgg+sj
         INhIeNkQap8pQLTNdpxEc30k6FeQTzvlfehqQ87PJdY7WUjd08A4EnFBXM3MFTdA/kPj
         kB3ZjVTYkrhH6J56yeyI/CGd3Yyun2SJeKM6R8cW9Pcr7mfAmPoMcBSlqcfXmCpHLSi/
         kl6Aa5a1MBpCWSMthyyyXZMqnWlp6RdK8RGIKmuBtJ63JTTUFOuE/Y+m0kGtJnmyzch5
         NnKQj6EWOZYMI/Gb0HwFxSx9znF85I6tCUdwaa/iEBcTiAFCFnCQE+NGfpO3gzx7giYh
         weVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=smGu9x5BknaR16HmxfiAK07SXpn4IX+HQTTjyDUGz40=;
        b=qUohncZRzyib1gwpW92J104qTq4f0q4SHrg5i4sgqlZY3JwULqvJtxD8uuEZwK2Wjs
         18mzqxDE2o42U0F+LaP512ukCc3Kmt4ltgj4hZQ7j+0SM+I3654abzE4g5Q+0RbVVJMw
         vNz2wfaLV7iMnSF2Z8t0i/LzibUxtaUdFUeJTHbAohGrUbXNySZceH5TmWwQuyuwEc4L
         kdk1KkaA0EyfsYxzrfVmNBcFmuy2s1E6vdT+MdOERjInpoETd9VRFFKi/GYFymvxFM+Y
         zrYoBc3NxzVLacaS2MdyxUdpu+9XhnchDRrw3Im2riust8sM7fr7EqZtXq6lFwd4LGNG
         5PEQ==
X-Gm-Message-State: AOAM530JJcJny2Cmjeu5ycXTuyKmtrTmpRRVEnY2AXiNM48iDkdAFPYM
	PmJij8mJLqgiw0fDECxY5gfdAba7b1I=
X-Google-Smtp-Source: 
 ABdhPJzdA/Ub1quIn8dgIz+3mQXHwnNj22qRURJATFVI0q5ujRlpwLCIN5cqFtS/LvPRtQ3F/0/a1Q==
X-Received: by 2002:a17:906:8806:b0:6f5:15aa:1f40 with SMTP id
 zh6-20020a170906880600b006f515aa1f40mr23911411ejb.595.1652871562785;
        Wed, 18 May 2022 03:59:22 -0700 (PDT)
Received: from Zen2.lab.linutronix.de.
 (ip-109-090-143-203.um36.pools.vodafone-ip.de. [109.90.143.203])
        by smtp.gmail.com with ESMTPSA id
 qs24-20020a170906459800b006f3ef214da9sm861524ejc.15.2022.05.18.03.59.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 May 2022 03:59:22 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 35/49] psmisc: upgrade 23.4 -> 23.5
Date: Wed, 18 May 2022 12:58:29 +0200
Message-Id: <20220518105843.3299331-35-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220518105843.3299331-1-alex@linutronix.de>
References: <20220518105843.3299331-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 18 May 2022 10:59:26 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/165832

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 meta/recipes-extended/psmisc/{psmisc_23.4.bb => psmisc_23.5.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-extended/psmisc/{psmisc_23.4.bb => psmisc_23.5.bb} (85%)

diff --git a/meta/recipes-extended/psmisc/psmisc_23.4.bb b/meta/recipes-extended/psmisc/psmisc_23.5.bb
similarity index 85%
rename from meta/recipes-extended/psmisc/psmisc_23.4.bb
rename to meta/recipes-extended/psmisc/psmisc_23.5.bb
index 94caa2ddb7..1c390f3615 100644
--- a/meta/recipes-extended/psmisc/psmisc_23.4.bb
+++ b/meta/recipes-extended/psmisc/psmisc_23.5.bb
@@ -5,5 +5,5 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=0636e73ff0215e8d672dc4c32c317bb3"
 SRC_URI = "git://gitlab.com/psmisc/psmisc.git;protocol=https;branch=master \
            file://0001-Use-UINTPTR_MAX-instead-of-__WORDSIZE.patch \
            "
-SRCREV = "5fab6b7ab385080f1db725d6803136ec1841a15f"
+SRCREV = "17353f3fddef6b360bc47f7834f2cd011bea2b87"
 S = "${WORKDIR}/git"
-- 
2.30.2


