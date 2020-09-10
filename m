Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
 by mx.groups.io with SMTP id smtpd.web12.20393.1599740591979986461
 for <openembedded-core@lists.openembedded.org>;
 Thu, 10 Sep 2020 05:23:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=Pboo3Ht+;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.45, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f45.google.com with SMTP id s12so6447851wrw.11
        for <openembedded-core@lists.openembedded.org>; Thu, 10 Sep 2020 05:23:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=Ito1QPIoI+WIH0fKHzWWP2Gq9ijNn3oiw8yg4gJIvT4=;
        b=Pboo3Ht+I0LGCMmu3cJVXADtaVGlmX/xoNJ8juHWYqjlZ1Fs1iyPhuDuUOrZmBRcgN
         AWN80Gu/OBAb+Vtn3Q/Ur1pyLLGJBRxEIvlGkJoEqNEXJf7SXOUIyuzuAGqf6ewXAc5n
         D38meaf3vzm5/rJE7TXAnjaRJsOHU2r44he8I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Ito1QPIoI+WIH0fKHzWWP2Gq9ijNn3oiw8yg4gJIvT4=;
        b=Zp2brvorOOeAazLwGcZE/qpM1iuuooC0LBuDVLyZlEFdwBiSVMqkfrv0CHzxJ2/rZY
         71AZ4UBUm8Bh57MHgLOzmL5O7YJtlRjWkWDtjy9INqvhT6id/abmulNbM1x1qeVnGjS2
         z4qVGrzFTPGyMEjJgVsSwXIucSV9SwJUNcmaBVNSWIgpC8xk8Xwgocsc+znOcRRotAgy
         zjapDeogIKRbN2lYYBzHn2AgzleT50MdRWTzvEqxZ+hg7l51+cJG/lANY6gZ3R6PjV6M
         ojDBrBu27nBKP1GIPjlY42FEsthbSZk7MQP8GxpXGGc6gQsT14yi9Zq4ZUQj07ZgV1ak
         fR3g==
X-Gm-Message-State: AOAM531WxvDa3AxfGNLSEJDoSs7B+wdrT2CKBSzi+n1/hnMOQKf/e/Tw
	2OhLmTJhlJC859XipZgVKh3v2FoZR3P/qA==
X-Google-Smtp-Source: ABdhPJzCuq7MivQMXBd2B8E7uqfrpVcwmbIlxzmpua19qszevrIpyDWVdKXNiTyLHv6UcW0ZJnHoJw==
X-Received: by 2002:a5d:514e:: with SMTP id u14mr8640501wrt.211.1599740590200;
        Thu, 10 Sep 2020 05:23:10 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex.int.rpsys.net (2.f.a.6.5.4.b.4.5.7.2.f.a.5.0.6.c.3.f.5.a.b.a.0.0.b.8.0.1.0.0.2.ip6.arpa. [2001:8b0:aba:5f3c:605a:f275:4b45:6af2])
        by smtp.gmail.com with ESMTPSA id v17sm8810794wrr.60.2020.09.10.05.23.09
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2020 05:23:09 -0700 (PDT)
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH][warrior 04/22] binutils: Install non-alternatives links for nativesdk
Date: Thu, 10 Sep 2020 13:22:48 +0100
Message-Id: <20200910122306.2040194-4-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200910122306.2040194-1-richard.purdie@linuxfoundation.org>
References: <20200910122306.2040194-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In the SDK we need the plain symlinks and don't use alternative providers.
When these are missing the toolchain can work incorrectly so fix this.

(From OE-Core rev: 0c06cfaa016d06cc56d80dc1c244a938f3d38a3c)

(From OE-Core rev: 0d299c5dc04407d2d54574157f4014f50f2d0468)

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-devtools/binutils/binutils_2.32.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/recipes-devtools/binutils/binutils_2.32.bb b/meta/recipes-devtools/binutils/binutils_2.32.bb
index 3dcc837c787..625e18c787f 100644
--- a/meta/recipes-devtools/binutils/binutils_2.32.bb
+++ b/meta/recipes-devtools/binutils/binutils_2.32.bb
@@ -48,4 +48,7 @@ FILES_libbfd = "${libdir}/libbfd-*.so"
 
 SRC_URI_append_class-nativesdk =  "file://nativesdk-relocation.patch"
 
+USE_ALTERNATIVES_FOR_class-nativesdk = ""
+FILES_${PN}_append_class-nativesdk = " ${bindir}"
+
 BBCLASSEXTEND = "native nativesdk"
-- 
2.25.1

