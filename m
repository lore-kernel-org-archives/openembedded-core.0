Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com [209.85.215.169])
 by mx.groups.io with SMTP id smtpd.web12.920.1618786393227933007
 for <openembedded-core@lists.openembedded.org>;
 Sun, 18 Apr 2021 15:53:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=NxAgzbPX;
 spf=pass (domain: gmail.com, ip: 209.85.215.169, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f169.google.com with SMTP id p12so22937321pgj.10
        for <openembedded-core@lists.openembedded.org>; Sun, 18 Apr 2021 15:53:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=kaz2pl5BdrM4/hQpO0bgyQjaOqUMV4uT+hCh37JRfdg=;
        b=NxAgzbPXg6aDN9JiIWbebTbSU5qoC6Nv8UZaWJlhxnO1fhlo1HfKe4RmDiinL0gF+j
         ZnoHINm/glSPgjhWl6OAfbEnUlUT7ejfxvL+KRTjdU++LPKY7Oi5cgwcoxY0LUfIQLxl
         LmlIALFXxIVg/neZmrDXpYx0Mr/TYfF2cwP/TEwy1sUqzn8bdfFYwd10xytz6OWQvree
         YXQ7TEZi9Mj8on29wH1tuD7nix/oR0R62C8nCvNIChHCu3TzKMU5yRAVIyXXnjUs4BZ9
         kmwxhHfdhS8ISo1XoaRrBHBjk1SrIZpI9RxXhuaNVo2PpLz37ExatODwe0ix/xJ0KF8n
         Zfrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=kaz2pl5BdrM4/hQpO0bgyQjaOqUMV4uT+hCh37JRfdg=;
        b=GDooFimIhFzzJVWrPuk3KVXvs5GjS8LYfSKc3vTkG6nksOZoW3CSrNO3uS31aYvpd+
         C05U3WNBqYWlZZGMaLFugDsvl8458To0Q7PwcGJPgJ+oa4xAPU1Cv4qEx3itxaI2w77L
         VYHjBHPQgMr2tUi4vwWyTm1H3gB6c32Ggd37XAEG+AUVIG5WQS/YNX0Ni5xG67oUUJxN
         gP7sP967eEAK6fLtpPxLyJSbfKFDa1GkrBXu3lvMN8Ywet/5UuM9SCZtgUWpgJQJtRE7
         yGHJhXiq1rC5gGDZCLdcFwEYUKuLNR+p5bALL30MXp1mUQGbwYrFBjH2ganMF31MZUAw
         RUcA==
X-Gm-Message-State: AOAM532iVyGSXdTiKnEpPqV8HbZ4O7AW7jDSCD+nlTP+w68GlRDTpxci
	i42gOSgOG+TF7G6EUISTLzNWuWLctbKEfA==
X-Google-Smtp-Source: ABdhPJyc0PB4+ZTTlcqvqCgS3Cx8LmiZ7AGw+LUCuFpk82j7XX5OKUsuiZ/i1rOPLsJXjvqplBQZfg==
X-Received: by 2002:a63:1c22:: with SMTP id c34mr8917616pgc.408.1618786392493;
        Sun, 18 Apr 2021 15:53:12 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0:db81:2f56:60e4:2c64])
        by smtp.gmail.com with ESMTPSA id v22sm10685146pff.105.2021.04.18.15.53.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Apr 2021 15:53:12 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>,
	Andrei Gherzan <andrei@gherzan.ro>
Subject: [PATCH] ca-certificates: Fix openssl runtime cert dependencies
Date: Sun, 18 Apr 2021 15:53:10 -0700
Message-Id: <20210418225310.1624909-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

With commit dc778c70449ee5401b5a24ad18b22b88338c47c5, dependency was
moved to openssl-bin which in itself was a fine change, but dropping
dependency on openssl too should have been kept along, dropping this
meant that openssl binary wont be able to validate secure connections as
the CApath files wont be installed, which infact are required for
openssl bins to work, following call e.g. fails

$ openssl s_client -connect google.com:443

....
New, TLSv1.3, Cipher is TLS_AES_256_GCM_SHA384
Server public key is 256 bit
Secure Renegotiation IS NOT supported
Compression: NONE
Expansion: NONE
No ALPN negotiated
Early data was not sent
Verify return code: 20 (unable to get local issuer certificate)
....

The local issuer certs are not found in default location
/usr/lib/ssh-1.1/certs, this dir and its content is installed by openssl package
therefore re-add the dependency on openssl

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Cc: Andrei Gherzan <andrei@gherzan.ro>
---
 .../ca-certificates/ca-certificates_20210119.bb             | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-support/ca-certificates/ca-certificates_20210119.bb b/meta/recipes-support/ca-certificates/ca-certificates_20210119.bb
index 888a235c1a..7dcc86fdc1 100644
--- a/meta/recipes-support/ca-certificates/ca-certificates_20210119.bb
+++ b/meta/recipes-support/ca-certificates/ca-certificates_20210119.bb
@@ -83,8 +83,8 @@ do_install_append_class-native () {
     SYSROOT="${D}${base_prefix}" ${D}${sbindir}/update-ca-certificates
 }
 
-RDEPENDS_${PN}_class-target = "openssl-bin"
-RDEPENDS_${PN}_class-native = "openssl-native"
-RDEPENDS_${PN}_class-nativesdk = "nativesdk-openssl-bin"
+RDEPENDS_${PN}_append_class-target = " openssl-bin openssl"
+RDEPENDS_${PN}_append_class-native = " openssl-native"
+RDEPENDS_${PN}_append_class-nativesdk = " nativesdk-openssl-bin nativesdk-openssl"
 
 BBCLASSEXTEND = "native nativesdk"
-- 
2.31.1

