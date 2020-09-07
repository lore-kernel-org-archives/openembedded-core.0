Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
 by mx.groups.io with SMTP id smtpd.web10.6532.1599512011202527323
 for <openembedded-core@lists.openembedded.org>;
 Mon, 07 Sep 2020 13:53:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=PxLZz4Lb;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.53, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f53.google.com with SMTP id t10so17004093wrv.1
        for <openembedded-core@lists.openembedded.org>; Mon, 07 Sep 2020 13:53:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=iTW2DGPTqQNTytllPXd/Fo0qr7AnCKagEYO/IHB5Szo=;
        b=PxLZz4LbWiOuKTucw4pwOXDylke3t4LYLAzM6+h7SfTPSxV5jAROQYl4OwDfX6f1Ce
         qzQnxHTx6mi4KzuBaHsAzsuKtGFxmyRvXHvcF+UjFiyX0UOBp3XQjyGh+/gLUVAj5DUD
         IXBfba48q9uhA2H/KfEHs1FDVxX8I5x1NPQyc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=iTW2DGPTqQNTytllPXd/Fo0qr7AnCKagEYO/IHB5Szo=;
        b=mpJHySMLB37sXDsfn+rC5KY/n0DlnJ17sQv4CXftKTpbppl/N4abYRbywiq6pifvFn
         nGNRtqMCQBm3t3OmHbXO7GkTJqz1sPSCo3uBuE/OlJxBkF01G3HZ17nv8JTLLvgAJAdC
         jVRkc4ziWvlQbIVw7IP8mk2hdb0ynIp28QMleJghd/vrKDDDLYGp9xYjpy0VOSvGBBMJ
         b9PW8FndBzM4c1LEal+GGGewjAjgRojS9Fj8lYcgYtAsQ421xDoSfSvuDL+jMPFseDCl
         reT0v3/s8hv9I1SGAS9Ph7F+Nsux1RRgdvQAIKE/SmtjyFjGwSjVuHAhEgpPMJ/FZwo/
         l8qQ==
X-Gm-Message-State: AOAM531rEWLvOG4687M4oFhn85oXTQfU698HVrw6Hr6E34AWchBkuw0b
	w57eBJhFUkVGDFuSy7RtZeXxQIBIwe3tbQ==
X-Google-Smtp-Source: ABdhPJwwx3zO4mpmLQB++PfA4519JxcZlNvKXAyklpOGOK9v6mtDExKPU13CptT2L2qmbSi/IJ9cMw==
X-Received: by 2002:adf:aad1:: with SMTP id i17mr24826242wrc.360.1599512009427;
        Mon, 07 Sep 2020 13:53:29 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex.int.rpsys.net (e.4.4.b.0.8.f.4.f.c.f.0.9.0.5.8.c.3.f.5.a.b.a.0.0.b.8.0.1.0.0.2.ip6.arpa. [2001:8b0:aba:5f3c:8509:fcf:4f80:b44e])
        by smtp.gmail.com with ESMTPSA id 92sm32888299wra.19.2020.09.07.13.53.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2020 13:53:28 -0700 (PDT)
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Cc: Liwei Song <liwei.song@windriver.com>
Subject: [PATCH][zeus 09/19] buildtools-tarball: export OPENSSL_CONF for openssl
Date: Mon,  7 Sep 2020 21:53:11 +0100
Message-Id: <20200907205321.1941682-10-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200907205321.1941682-1-richard.purdie@linuxfoundation.org>
References: <20200907205321.1941682-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Liwei Song <liwei.song@windriver.com>

export OPENSSL_CONF to aviod SDK openssl can not find openssl.cnf.

(From OE-Core rev: 0aaf3dd17dcde959e9c0d62543cb91c9b33551b4)

Signed-off-by: Liwei Song <liwei.song@windriver.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-core/meta/buildtools-tarball.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-core/meta/buildtools-tarball.bb b/meta/recipes-core/meta/buildtools-tarball.bb
index 006c724bbda..aa55cde84a9 100644
--- a/meta/recipes-core/meta/buildtools-tarball.bb
+++ b/meta/recipes-core/meta/buildtools-tarball.bb
@@ -73,6 +73,7 @@ create_sdk_files_append () {
 	toolchain_create_sdk_version ${SDK_OUTPUT}/${SDKPATH}/version-${SDK_SYS}
 
 	echo 'export GIT_SSL_CAINFO="${SDKPATHNATIVE}${sysconfdir}/ssl/certs/ca-certificates.crt"' >>$script
+	echo 'export OPENSSL_CONF="${SDKPATHNATIVE}${sysconfdir}/ssl/openssl.cnf"' >>$script
 
 	mkdir -p ${SDK_OUTPUT}/${SDKPATHNATIVE}${sysconfdir}/
 	echo '${SDKPATHNATIVE}${libdir}
-- 
2.25.1

