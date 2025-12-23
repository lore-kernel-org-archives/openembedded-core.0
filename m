Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 80AC5E6FE4A
	for <webhook@archiver.kernel.org>; Tue, 23 Dec 2025 21:23:16 +0000 (UTC)
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.108986.1766524990031662088
 for <openembedded-core@lists.openembedded.org>;
 Tue, 23 Dec 2025 13:23:10 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=y/Ul1yaa;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.169, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-2a12ebe4b74so92922535ad.0
        for <openembedded-core@lists.openembedded.org>; Tue, 23 Dec 2025 13:23:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1766524989; x=1767129789; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hU9J8u/2LNLEOyq8Ph75MH2E7+T+AvpRr7eTDthWUFE=;
        b=y/Ul1yaa8aBou2MY0kxv28OeaLR8i9xHWkYBoY7BmVORG9pqct9RTVu7wkRPc+1ypZ
         PFLg3e1LMB2jDjRvqH1RyvJC6Pkhg/toeuhQvKuK6oM+40k9gsDJ4StxGDj5IDVBKmUo
         qVrjruBJdVRd+flwW1+i3qyUTOE8EglxbWb/Xvx+j2iPqeNZQF9giah4uh6ImBOy3Bsb
         ub1Fi3KuDGiddk1ROA+xzlmydW0AySb6MuVBpBM4D6ucHKD2+H1knCPg86FSm/nxT//U
         CINgJsuY3uWOcW54JOmc1RMbxvO22nGCr4R4/zxXWONMNO3FyMoByUvfWsmHPl8iu3ff
         oTHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766524989; x=1767129789;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=hU9J8u/2LNLEOyq8Ph75MH2E7+T+AvpRr7eTDthWUFE=;
        b=iBhLz/Jde7RxN4hlQlxrMiv18bo37i2Y1/4O02yKBCc8ngk88Sjky4sW0HO7k9QHOU
         pCMiaswuA/4n5GuEAnGRvTNIaxAgEvEosAwS1wzW7COZ2HEtHae+KEAMI3pbwTxpyJgr
         TIpiOeSOkcA6XlHF5JwulHHSiZI5XV9uD43i+0+PAIQisM5bWulVEHj5idcYqoaSpv5z
         AyK0yLvUpZ5D7Fzp5GnkkApFHS+kOTPy7a48Fhxaw7d+Nf863g7ZsoQWnaWhenDReecc
         MFdaDpaBvip3q4PjKcEoEJfi265rfOhXp6psszm/QfY6xcHQArhAvBLIC7w37FpIA6bz
         /eKA==
X-Gm-Message-State: AOJu0YwilL7N1D1ApOxt32U3zkAfwYXxAvvIjsTxK5fLijzLIHrxqUPq
	zRG+8QIqvZ/jnL5PhNruYYDwr6bpEXTj52HjMEPXJ4F/BIestF1QtVsJBp777PBJ/ZF257RHVCs
	9hUvk
X-Gm-Gg: AY/fxX4/DSeZnoBu8bqjCM0X5GhFcn6t6haiFHJ5EXu2VofNLuoouwfyFjmg3HQkcqD
	k5SCUaewyrOh11eQKChmfJnMbm3qAz/Px+g4ZbMsEVMokMNYpvzWMZJM4lTKHZveIXL4GNeJkl+
	4PmHAkjAv6zBX79iaspfaLfkI6/XTTxOSmk4lww1j0FrVOKbci2bs8K2XVSNDLtEc3dFaKq8G/M
	DZG6dolzr++CYuSJfgHdHMyt9ThBxzJRO2/oJXSBRtrtDx0GX90pN3S0J8a2VKL7chXhwr697fa
	0uMfoL4YU73FoyAOWWuuhNEIUm4ufmTMG8UZRc8+lK19w5DadrfM4agqGzCa2/IOBLWwv3gSIsd
	YVUpJhpDGZBP+3x8/nX9SVVtUrpX7eJV8DACOhKSvt8c5mlW87VtdtZ/EfIdGY/kMA7UqxofH04
	Rhe7AGsRE7NI6e
X-Google-Smtp-Source: AGHT+IFAUI0BySxyq2gROGvf30cGBg4XEmpDNQRNyDJfm4roniij5lXM2b/84sZ6COWc8CM6E+iZCQ==
X-Received: by 2002:a17:902:e552:b0:2a0:d4e3:7188 with SMTP id d9443c01a7336-2a2f2223bc0mr178499175ad.13.1766524989249;
        Tue, 23 Dec 2025 13:23:09 -0800 (PST)
Received: from hexa.. ([2602:feb4:3b:2100:74b3:f61b:a7a7:fafc])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a2f3d4cbe5sm137258785ad.60.2025.12.23.13.23.08
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Dec 2025 13:23:08 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 17/18] curl: Use host CA bundle by default for native(sdk) builds
Date: Tue, 23 Dec 2025 13:22:23 -0800
Message-ID: <0e553b685c0a987a7be1eee16b7b5e3e48a036e2.1766524798.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1766524798.git.steve@sakoman.com>
References: <cover.1766524798.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 23 Dec 2025 21:23:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/228491

From: Moritz Haase <Moritz.Haase@bmw.de>

Fixes YOCTO #16077

Commit 0f98fecd (a backport of 4909a46e) broke HTTPS downloads in opkg in the
SDK, they now fail with:

> SSL certificate problem: self-signed certificate in certificate chain

The root cause is a difference in the handling of related env vars between
curl-cli and libcurl. The CLI will honour CURL_CA_BUNDLE and SSL_CERT_DIR|FILE
(see [0]). Those are set in the SDK via env setup scripts like [1], so curl
continued to work. The library however does not handle those env vars. Thus,
unless the program utilizing libcurl has implemented a similar mechanism itself
and configures libcurl accordingly via the API (like for example Git in [2] and
[3]), there will be no default CA bundle configured to verify certificates
against.

Opkg only supports setting the CA bundle path via config options 'ssl_ca_file'
and 'ssl_ca_path'. Upstreaming and then backporting a patch to add env var
support is not a feasible short-time fix for the issue at hand. Instead it's
better to ship libcurl in the SDK with a sensible built-in default - which also
helps any other libcurl users.

This patch is based on a proposal by Peter.Marko@siemens.com in the related
mailing list discussion at [4].

(cherry picked from commit 3f819f57aa1960af36ac0448106d1dce7f38c050)

[0]: https://github.com/curl/curl/blob/400fffa90f30c7a2dc762fa33009d24851bd2016/src/tool_operate.c#L2056-L2084
[1]: https://git.openembedded.org/openembedded-core/tree/meta/recipes-support/curl/curl/environment.d-curl.sh?id=3a15ca2a784539098e95a3a06dec7c39f23db985
[2]: https://github.com/git/git/blob/6ab38b7e9cc7adafc304f3204616a4debd49c6e9/http.c#L1389
[3]: https://github.com/git/git/blob/6ab38b7e9cc7adafc304f3204616a4debd49c6e9/http.c#L1108-L1109
[4]: https://lists.openembedded.org/g/openembedded-core/topic/115993530#msg226751

Signed-off-by: Moritz Haase <Moritz.Haase@bmw.de>
CC: matthias.schiffer@ew.tq-group.com
CC: Peter.Marko@siemens.com
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-support/curl/curl_8.7.1.bb | 11 ++++++++---
 1 file changed, 8 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-support/curl/curl_8.7.1.bb b/meta/recipes-support/curl/curl_8.7.1.bb
index 6c02746394..0af6a41399 100644
--- a/meta/recipes-support/curl/curl_8.7.1.bb
+++ b/meta/recipes-support/curl/curl_8.7.1.bb
@@ -92,16 +92,21 @@ PACKAGECONFIG[verbose] = "--enable-verbose,--disable-verbose"
 PACKAGECONFIG[zlib] = "--with-zlib=${STAGING_LIBDIR}/../,--without-zlib,zlib"
 PACKAGECONFIG[zstd] = "--with-zstd,--without-zstd,zstd"
 
+# Use host certificates for non-target builds. As libcurl doesn't honor any of the env vars (like
+# for example CURL_CA_PATH) that curl-cli does, we need to explicitly set '--with-ca-bundle'
+# accordingly, so that there is a working, built-in default even for those tools that use libcurl,
+# but don't have custom env var handling implemented (like opkg).
+CURL_CA_BUNDLE_BASE_DIR ?= "/etc"
+CURL_CA_BUNDLE_BASE_DIR:class-target = "${sysconfdir}"
+
 EXTRA_OECONF = " \
     --disable-libcurl-option \
     --disable-ntlm-wb \
     --without-libpsl \
     --enable-optimize \
+    --with-ca-bundle=${CURL_CA_BUNDLE_BASE_DIR}/ssl/certs/ca-certificates.crt \
     ${@'--without-ssl' if (bb.utils.filter('PACKAGECONFIG', 'gnutls mbedtls openssl', d) == '') else ''} \
 "
-EXTRA_OECONF:append:class-target = " \
-    --with-ca-bundle=${sysconfdir}/ssl/certs/ca-certificates.crt \
-"
 
 fix_absolute_paths () {
 	# cleanup buildpaths from curl-config
-- 
2.43.0


