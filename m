Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
 by mx.groups.io with SMTP id smtpd.web10.8981.1618733800442592025
 for <openembedded-core@lists.openembedded.org>;
 Sun, 18 Apr 2021 01:16:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=uixkUodA;
 spf=pass (domain: gmail.com, ip: 209.85.216.49, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f49.google.com with SMTP id lr7so82737pjb.2
        for <openembedded-core@lists.openembedded.org>; Sun, 18 Apr 2021 01:16:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=qInz2RYqmve6encKks3zAksi3MmEJHkLcYJjSma6z0c=;
        b=uixkUodA6v124Y/LngQd+7nzAlYp26ZZPxuAmwMwvc8gVKVwd5uwP9FyNFVFhtgo/X
         Nd4BIjjOopcXhEW2HBlCadfVMpg97vMrAvX0w6/8zJkZ47RTDC280HFQtSuSmO0SZaJA
         13mlQcXfkEK0gyceKnxDVlKXQdv4LdHsPXT0bBBH0JKJy7KrhASbZtbtMh+uXVfjB0D9
         YxchZqQePNO6Ne8+O3mRccatskEGMXM8am+ICO2G1ybAHm5OMzz9x2vJXlPdvJFTGCP0
         19hoClAXUfdLgcb6+0xrRhumQF6vQvRDNy/TD4G1oAFrZ/qJwpWUqYSwBeB+CZW1PN9c
         txXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=qInz2RYqmve6encKks3zAksi3MmEJHkLcYJjSma6z0c=;
        b=fsgjSKm0Z/UuDHoDee8aVDb8AJQdP/toOMisoI3BFBcc8HdJg7AX2ESHS/3oDrckmd
         6+9JW5vUdUpLr0NMMxi4I8D6GGYtxOunTfxmMi+UHBxJFywBgkAgbercpmTlbs3KTRlw
         Fgw0TEgtmoTI/2A25C6Gi2z88hy2mqoNXpZNTf49g4FwHFi4nMPCqkmscsP94/OZtPlh
         xQGDwUj/ZZNHnMqglMvm8WQNklWg2KNUehi1SKn5xBDFsWH3Eb2wyl8RuMUm6GlqP5Lp
         E/B5XsRMq8U8FIjvM4q4TVh3EdRdBKTYbyyGGAsVFU3zWnzBKI4CMKGyva5SwZz2kXwD
         dwmA==
X-Gm-Message-State: AOAM532LqW0vhuhzPzanFrr5B8K7L1b9Swlwhc7owMACHwvLrNXk3c3C
	z8A1kGFTAIU17++yb93cOb+W5cZ4Jqn3dg==
X-Google-Smtp-Source: ABdhPJzfIxUH6V5l9g+90DPyhgzp8dH5fujziVkViQEtF+BCgHAZbsVj1nCLH+W4Mlz29t0SN8/0FQ==
X-Received: by 2002:a17:90b:120b:: with SMTP id gl11mr18746044pjb.143.1618733799763;
        Sun, 18 Apr 2021 01:16:39 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::630])
        by smtp.gmail.com with ESMTPSA id g2sm2339211pju.18.2021.04.18.01.16.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Apr 2021 01:16:39 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH 4/6] curl: Use openssl backend
Date: Sun, 18 Apr 2021 01:16:32 -0700
Message-Id: <20210418081634.3169548-4-raj.khem@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210418081634.3169548-1-raj.khem@gmail.com>
References: <20210418081634.3169548-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

use openssl instead of gnutls

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-support/curl/curl_7.76.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-support/curl/curl_7.76.0.bb b/meta/recipes-support/curl/curl_7.76.0.bb
index 634bbd72c2..db6318148f 100644
--- a/meta/recipes-support/curl/curl_7.76.0.bb
+++ b/meta/recipes-support/curl/curl_7.76.0.bb
@@ -20,7 +20,7 @@ CVE_PRODUCT = "haxx:curl haxx:libcurl curl:curl curl:libcurl libcurl:libcurl dan
 
 inherit autotools pkgconfig binconfig multilib_header
 
-PACKAGECONFIG ??= "${@bb.utils.filter('DISTRO_FEATURES', 'ipv6', d)} gnutls libidn proxy threaded-resolver verbose zlib"
+PACKAGECONFIG ??= "${@bb.utils.filter('DISTRO_FEATURES', 'ipv6', d)} ssl libidn proxy threaded-resolver verbose zlib"
 PACKAGECONFIG_class-native = "ipv6 proxy ssl threaded-resolver verbose zlib"
 PACKAGECONFIG_class-nativesdk = "ipv6 proxy ssl threaded-resolver verbose zlib"
 
-- 
2.31.1

