Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AC4F6C982D7
	for <webhook@archiver.kernel.org>; Fri, 18 Sep 2026 20:56:37 +0000 (UTC)
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.779.1789764995014417078
 for <openembedded-core@lists.openembedded.org>;
 Fri, 18 Sep 2026 13:56:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=MD69YBXs;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.43, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-48442ea8f59so937801f8f.1
        for <openembedded-core@lists.openembedded.org>; Fri, 18 Sep 2026 13:56:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1789764993; x=1790369793; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=wIXV7sURrxiO1bVR9poJ9yim6Uo4qb6wM7vwjB4GyIY=;
        b=MD69YBXsHQFkOxzMnugcG/vB3QAguSCC5tCjngfGriI7MXG7V1rHbEs/oXyeVEMXFh
         YjfIiP/UnKXALAeimcLqFq2LgXBBFN1XmfmKyokmMyFzhAecZUAQqn03yOh1bThJRlXL
         CUZLGsxZJk8xyrvl6ihgHHPg22v+kKW1Eb++M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789764993; x=1790369793;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=wIXV7sURrxiO1bVR9poJ9yim6Uo4qb6wM7vwjB4GyIY=;
        b=yiYmBHRvS6ef83vKTivcNFSq6Cxg2hybTZivTuh0bgFzcqfoMfoIeeGhWWyI7smzfC
         OV7hpTAV0aK8kIrhRr8Pg+hCpZpHEDiDSEHMwOmTYxQVMqJdxYSfo9Vm961EcWbnhfy7
         Sdc6meGLVpl2Xx6sI0kD9Cv6Crt7mKaGM5AF5uj8XRwqgyZo4hIHUmbtbIlvzHWMyukb
         hAQZx3/rafIPBltYLhU4Q3Apm2E1PFjx4UXyny2hd20aVh00zSAy3dnvROqPEMzfUqJd
         4rtynZFAewKb/QisFUWiPAsdyjccUvqQMWzi2Jzg1nrdRRZSbzvMMzW8IMHycU3QilKM
         hQYQ==
X-Gm-Message-State: AFuF++kozwblqsZnl0o77y2qpXyEK82n/SY4ZQBTpg8w4dEbPsUl7IQX
	Y9SbxPam8crQWDiIEyavmTc8uCGduPZajxdv1ILJPpmfDlW9bdHUrqSQ8JtLJpSkfqkYVM8CpeM
	QJ26haoI=
X-Gm-Gg: AYBFou1FdFsG1Kj2fo0RJkuO38bH2vEFM/s0k/7DmSzwsbSo0DxHIiM1a4YBJaNe0iu
	OeIUoVKytCkI6zMcrxrnF3inhMo1QBJ3vAEC3SFIKw9Wh+3OA2HAaZiGSnZTFXr5PGcM9OrN1Dw
	+zHwUAudwhCF2iEUkaOnY5apFXskXRhoN6jq+5WudbTreHJriipJxL9FE8owB3En7/AtvLi9BV4
	Zca2r0ddk5a7lT1cctN/VYmL88EHO5q3p+Fh2/ZZjF+Cke2wNXJ2pUs7iElokwubgSTELyYdl+K
	sgjg9O0GX5cAVmzYfMf+qjTO3lU1GeGvZyW9aN7nH71KqQl4onB0goieGH6SkGsRA+Eb+mkVcuq
	vB2YNGlLWXOhHHjfwvv2O4Ly9a5r1QCDQNk5M7MxsLacen1oHIuXbxC4QOt//05UF08U/HNJLWl
	revUOu8DH3zTj4RkUNXc4XqPU62/Yanvwiuw0wm+OpcTi0uuKtPE+InEUMpqn8RsNfR/pKkMcQh
	x/+Om14T03o8hKiitOULieJiRz5KcVyIIzs6A==
X-Received: by 2002:a05:600c:81c5:b0:49d:28fc:d6a0 with SMTP id 5b1f17b1804b1-49fbd200256mr121921835e9.18.1789764993131;
        Fri, 18 Sep 2026 13:56:33 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:22f8:9184:5b80:7430])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4872459f446sm1229405f8f.35.2026.09.18.13.56.31
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Sep 2026 13:56:31 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/2] openssl: Fix build arch contamination
Date: Fri, 18 Sep 2026 21:56:29 +0100
Message-ID: <20260918205629.3117092-2-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260918205629.3117092-1-richard.purdie@linuxfoundation.org>
References: <20260918205629.3117092-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 18 Sep 2026 20:56:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/246226

Ensure BUILD_ARCH doesn't leak into the ptest output package causing
reproducibility to break cross build architecture.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-connectivity/openssl/openssl_4.0.2.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-connectivity/openssl/openssl_4.0.2.bb b/meta/recipes-connectivity/openssl/openssl_4.0.2.bb
index 740a2fc66e4..bb58c27fbc8 100644
--- a/meta/recipes-connectivity/openssl/openssl_4.0.2.bb
+++ b/meta/recipes-connectivity/openssl/openssl_4.0.2.bb
@@ -245,7 +245,7 @@ do_install_ptest() {
 	install -m755 ${S}/test/smcont*.txt ${D}${PTEST_PATH}/test/
 	install -m755 ${S}/test/ssl_test.tmpl ${D}${PTEST_PATH}/test/
 
-	sed 's|${S}|${PTEST_PATH}|g' -i ${D}${PTEST_PATH}/configdata.pm ${D}${PTEST_PATH}/util/wrap.pl
+	sed -e 's|${S}|${PTEST_PATH}|g' -e 's|${BUILD_ARCH}-${BUILD_OS}|${TARGET_SYS}|g' -i ${D}${PTEST_PATH}/configdata.pm ${D}${PTEST_PATH}/util/wrap.pl
 
 	ln -s ${libdir}/ossl-modules/ ${D}${PTEST_PATH}/providers
 }

