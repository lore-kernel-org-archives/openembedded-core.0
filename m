Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com [209.85.215.181])
 by mx.groups.io with SMTP id smtpd.web12.6160.1608708255390601644
 for <openembedded-core@lists.openembedded.org>;
 Tue, 22 Dec 2020 23:24:15 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=MjBkCd/f;
 spf=pass (domain: gmail.com, ip: 209.85.215.181, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f181.google.com with SMTP id n25so4554731pgb.0
        for <openembedded-core@lists.openembedded.org>; Tue, 22 Dec 2020 23:24:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Mew+hTFdc7L3O+nI2VGbMByVDgETsMCoV8gtoX8xvV0=;
        b=MjBkCd/fMb9GUHny4vnexCifVjKOplUGwzIn9R+tq1ZLyOHA8g5GCIeArEW0QRlFKu
         R3UILfFIA/8elOQ8ZYuHsPBr1ap+Hd2CHq6GSnuKCCsbH3tOJlIdSN+ZgpnxacKJLSmb
         Iyg3hAEFSfqADn0MfGq6FPHEDzbTL56m+sV1EcwyyFkP8KdiMdJ5OlGR/hM8fzqTS74N
         BRJty6+o6grdZheOd6m+zPZtnnaoBKGEaS5swTsePcD9PaFSchjuecCTc6ITI9vBtOOL
         cLOlA9rUK6rMyFl+uGbQg7xLWnvxGVvJYY+SaaG0jUBBW5sPraOjJ65LUZCNv1EowS+s
         uMEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Mew+hTFdc7L3O+nI2VGbMByVDgETsMCoV8gtoX8xvV0=;
        b=r3QZvET4MknKS191Pwc225xYiKhnENa1GZzFNsKUW/bGoSB0EkO0j8u4Ulx1v/lSNH
         mXem0ugMiCnWms077lzqhhfvo3Ki8UCZcF/rGk5N6XfUq6ZnJZyQG7+1lsZWYKszL5jm
         9R3MtlvRVmvoaz+tt1l0C5oQa5AEyQu+395MVTfv7077w3ba8bbZa6ZHaKuXMrqAqcPR
         h+TtwQFHLr0UQLW09gxrqu1+dF2Ezntr3K9Lc1DhX7D94/ReZWFOsdwmmzqMt/q8FYcn
         xFXTU21HP+PP1nTlPwbc5vM1zElvKk4CsaCUnQrx4VlF/eemiiIn90aVIX5AMV3qU35C
         v+tw==
X-Gm-Message-State: AOAM531fgWFPC07JV4ssiqdhcdNgqwTUsp9eivFHV9wUddt031mtLv9w
	4YzYdFdPoaZWo/tejVrqMcuMbM3P60tRTg==
X-Google-Smtp-Source: ABdhPJyb++3thf8CaCpW4oIE2K9fjW3UTqR8TU+N+ASTyRrBqestfgwoZZTRtdY90DILmxZ9ZNVZnw==
X-Received: by 2002:a63:3247:: with SMTP id y68mr23609498pgy.10.1608708254658;
        Tue, 22 Dec 2020 23:24:14 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::a8e7])
        by smtp.gmail.com with ESMTPSA id w63sm22170243pfc.20.2020.12.22.23.24.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Dec 2020 23:24:14 -0800 (PST)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>,
	Shachar Menashe <shachar@vdoo.com>
Subject: [PATCH] openssl: Enable rc4/rc2/bf/md4 algorithms
Date: Tue, 22 Dec 2020 23:24:11 -0800
Message-Id: <20201223072411.1132934-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

They are still needed by several packages in meta-openembedded

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Cc: Shachar Menashe <shachar@vdoo.com>
---
 meta/recipes-connectivity/openssl/openssl_1.1.1i.bb | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-connectivity/openssl/openssl_1.1.1i.bb b/meta/recipes-connectivity/openssl/openssl_1.1.1i.bb
index a82fd512ac..74ca11387a 100644
--- a/meta/recipes-connectivity/openssl/openssl_1.1.1i.bb
+++ b/meta/recipes-connectivity/openssl/openssl_1.1.1i.bb
@@ -55,8 +55,15 @@ CFLAGS_append_class-native = " -DOPENSSLDIR=/not/builtin -DENGINESDIR=/not/built
 CFLAGS_append_class-nativesdk = " -DOPENSSLDIR=/not/builtin -DENGINESDIR=/not/builtin"
 
 # Disable deprecated crypto algorithms
-# Retained for compatibilty - des (curl), dh (python-ssl), dsa (rpm)
-DEPRECATED_CRYPTO_FLAGS = " no-ssl no-idea no-psk no-rc2 no-rc4 no-rc5 no-md2 no-md4 no-srp no-camellia no-bf no-mdc2 no-scrypt no-seed no-siphash no-sm2 no-sm3 no-sm4 no-whirlpool"
+# Retained for compatibilty
+# des (curl)
+# dh (python-ssl)
+# dsa (rpm)
+# md4 (cyrus-sasl freeradius hostapd)
+# bf (wvstreams postgresql x11vnc crda znc cfengine)
+# rc4 (freerdp librtorrent ettercap xrdp transmission pam-ssh-agent-auth php)
+# rc2 (mailx)
+DEPRECATED_CRYPTO_FLAGS = "no-ssl no-idea no-psk no-rc5 no-md2 no-srp no-camellia no-mdc2 no-scrypt no-seed no-siphash no-sm2 no-sm3 no-sm4 no-whirlpool"
 
 do_configure () {
 	os=${HOST_OS}
-- 
2.29.2

