Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
 by mx.groups.io with SMTP id smtpd.web11.6537.1599512012373550719
 for <openembedded-core@lists.openembedded.org>;
 Mon, 07 Sep 2020 13:53:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=YvBRQIa0;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.43, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f43.google.com with SMTP id z1so16998199wrt.3
        for <openembedded-core@lists.openembedded.org>; Mon, 07 Sep 2020 13:53:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=uVWnZNCOUGJ6Y9EBROoekW7k5tvgAG3DfSzEAvWRQ18=;
        b=YvBRQIa0a8E+Ng5Jbu5HrT8bnqFj22nhXuSvZSjBmh87EVKKXJXswdmoSJJ9BSS5Sl
         qNXqgnptDEs2T1XuhMLc2gUpKAeCEWUC3eX86qepMmOaF4iOUQZqc38K5dQGR3RpRA2F
         KYDrTrGHPQT79BG5fRDg1TdjUEmoi2/WGpTDY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=uVWnZNCOUGJ6Y9EBROoekW7k5tvgAG3DfSzEAvWRQ18=;
        b=Euu8n8GaTVHmrK+YfkBTb7d2oSyR8StL71yPCnRBsH/3HcNbb0dcxbSwsxqrQvS2FD
         d6FQE3wKyWtsgUh/3YkWrH+ibmMWgzF00i1WaGjQ/DePHWHXcHdjIErPsu/BiWKqukOk
         9NHUSEAw92q4jTMK09aido8y4y0mrXChgrFFh5Uj9lydXPmtxPksiA3Jb08bkPw8iHlp
         InGYZSLRizsqBso31rhsdJOrt1qqrnrT6ki5A5VXblhqYNufEXt6lXxMecAqBmCaNIsC
         UdE3HA4SIQwUVZkWAMbWNM6P6Q4Wn+ajikVGZ2YVF4+Vi/Q5BZ/X4n9hNLtUc5KXhRD8
         UQ8g==
X-Gm-Message-State: AOAM532IRYmrOChSdUTBqplC6bxjcDYAbiTWJXZO/gKAZTKeYMulDRP/
	gUn93/KsuDNm1zIk3wNZpYZuYqqi8p0c4Q==
X-Google-Smtp-Source: ABdhPJxPDV8e0NtiYpqn6NksbTg+hcqHzzhuAnR/ycd2p98wo2sttqqJIGD2ErXl1tRzqc6r07HOLw==
X-Received: by 2002:adf:f24d:: with SMTP id b13mr22914328wrp.316.1599512010563;
        Mon, 07 Sep 2020 13:53:30 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex.int.rpsys.net (e.4.4.b.0.8.f.4.f.c.f.0.9.0.5.8.c.3.f.5.a.b.a.0.0.b.8.0.1.0.0.2.ip6.arpa. [2001:8b0:aba:5f3c:8509:fcf:4f80:b44e])
        by smtp.gmail.com with ESMTPSA id 92sm32888299wra.19.2020.09.07.13.53.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2020 13:53:30 -0700 (PDT)
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Cc: Steve Sakoman <steve@sakoman.com>
Subject: [PATCH][zeus 10/19] buildtools-tarball: export OPENSSL_CONF in environment setup
Date: Mon,  7 Sep 2020 21:53:12 +0100
Message-Id: <20200907205321.1941682-11-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200907205321.1941682-1-richard.purdie@linuxfoundation.org>
References: <20200907205321.1941682-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Steve Sakoman <steve@sakoman.com>

The autobuilder has been experiencing SSL: CERTIFICATE_VERIFY_FAILED
errors during error report uploads when using buildtools due to looking
for certs in /opt/poky

(From OE-Core rev: 197f1d5d14b8e57295f5a81c03c86abba5328614)

Signed-off-by: Steve Sakoman <steve@sakoman.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-core/meta/buildtools-tarball.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-core/meta/buildtools-tarball.bb b/meta/recipes-core/meta/buildtools-tarball.bb
index aa55cde84a9..ceb60b0e487 100644
--- a/meta/recipes-core/meta/buildtools-tarball.bb
+++ b/meta/recipes-core/meta/buildtools-tarball.bb
@@ -73,6 +73,7 @@ create_sdk_files_append () {
 	toolchain_create_sdk_version ${SDK_OUTPUT}/${SDKPATH}/version-${SDK_SYS}
 
 	echo 'export GIT_SSL_CAINFO="${SDKPATHNATIVE}${sysconfdir}/ssl/certs/ca-certificates.crt"' >>$script
+	echo 'export SSL_CERT_FILE="${SDKPATHNATIVE}${sysconfdir}/ssl/certs/ca-certificates.crt"' >>$script
 	echo 'export OPENSSL_CONF="${SDKPATHNATIVE}${sysconfdir}/ssl/openssl.cnf"' >>$script
 
 	mkdir -p ${SDK_OUTPUT}/${SDKPATHNATIVE}${sysconfdir}/
-- 
2.25.1

