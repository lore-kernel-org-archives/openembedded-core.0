Return-Path: <ticotimo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0B8B2C433EF
	for <webhook@archiver.kernel.org>; Wed, 16 Feb 2022 03:51:11 +0000 (UTC)
Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com
 [209.85.216.41])
 by mx.groups.io with SMTP id smtpd.web10.7912.1644983470384870694
 for <openembedded-core@lists.openembedded.org>;
 Tue, 15 Feb 2022 19:51:10 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Jk6pRJqd;
 spf=pass (domain: gmail.com, ip: 209.85.216.41, mailfrom: ticotimo@gmail.com)
Received: by mail-pj1-f41.google.com with SMTP id v4so1322158pjh.2
        for <openembedded-core@lists.openembedded.org>;
 Tue, 15 Feb 2022 19:51:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=JLnjRSqEE/AMfZGDQ7DTisoVOVcocJwsgjJoMWhF6oM=;
        b=Jk6pRJqdAIEMoEP83SXnTQbr9+IgRlOMesqdQYDUoufxP0ELXaUtLXAX23rbuylZsZ
         w8KgQL2r3i3JzKDIq14l73aEzR2zAGyMFmf4sT1kSggQFfl3eQix0naKA/S/IHUvjNq5
         2yxli+gSQb0JIU2zIc+RfNemYphHgS/chtKjIt/Hb24BRycqCfHvKk7vKoZDzzLX+pMu
         axcz+9hZCfdBKjA7BdCFZrdW7zXJc4fnXZQZlUfE+ldFhofLqkNz70XaDNNbVTxbTC8e
         Mh02xBI95lnSDxVdmtJzBILR+OGWNRPnbtc8k1//RtXpvxCY73uTdMW9JmTeM/dTX2ic
         jjtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=JLnjRSqEE/AMfZGDQ7DTisoVOVcocJwsgjJoMWhF6oM=;
        b=e9H2+mPReV7Vhb9Pux2+YyYz4GpSlHQhR+oHb04Rp8vIT1COxVE0pP0/xi1QaTfAyJ
         TDextve+k10pXRL98/8SNtufiKZZFltwKFmBIXmGaozpPEigGFbjCHN/6L7Fz0VnUsJN
         iNNqRum5LNA2EvpSH3zM/E4GqQgUz0gWI4g3FC9WH79X5Gvc9yt6Qw3QOlIc3+0MbfTw
         4LUa5aQ4CNW2DhYb+OpEs2S4yab2abRQ9MMrzD9J7NhYJdfSEuQujoKZQKPRAYNlQ45Q
         nbCOTXuaYtMzzrXX7XOCt+jpedF2N+cu5AeIJ/6szdGVUwlAtag3OHk9tzR6/ETku/Cm
         2mJA==
X-Gm-Message-State: AOAM531EQuSU+n1hwePsS/eF7kWKpnqMWZ8tzxe2hNJ+rw5Bku7yOp7B
	HNyaNKbM3e5HiDKyvYbENDz93Ysi9r9ktQ==
X-Google-Smtp-Source: 
 ABdhPJxboXctdY5HcbHkjDR822RM7cggHgYN20whePaJ8k7tRh3/Ciii0FQBFWVuNHXtEz4/a3v4UA==
X-Received: by 2002:a17:90b:4f4b:b0:1ba:81fa:c6e3 with SMTP id
 pj11-20020a17090b4f4b00b001ba81fac6e3mr6282693pjb.121.1644983469253;
        Tue, 15 Feb 2022 19:51:09 -0800 (PST)
Received: from nereus.hsd1.or.comcast.net
 ([2601:1c0:6000:1b20:c7f5:f830:27c:b9d6])
        by smtp.gmail.com with ESMTPSA id
 k14sm42322666pff.25.2022.02.15.19.51.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Feb 2022 19:51:08 -0800 (PST)
From: Tim Orling <ticotimo@gmail.com>
X-Google-Original-From: Tim Orling <tim.orling@konsulko.com>
To: openembedded-core@lists.openembedded.org
Cc: steve@sakoman.com,
	Tim Orling <tim.orling@konsulko.com>
Subject: [dunfell][PATCH] openssl: upgrade to 1.1.1m for CVE-2021-4160
Date: Tue, 15 Feb 2022 19:50:51 -0800
Message-Id: <20220216035051.850563-1-tim.orling@konsulko.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 16 Feb 2022 03:51:11 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/161765

Changes are only security and bug fixes.

https://www.openssl.org/news/cl111.txt
https://git.openssl.org/?p=openssl.git;a=log;h=refs/tags/OpenSSL_1_1_1m

CVE: CVE-2021-4160

https://nvd.nist.gov/vuln/detail/CVE-2021-4160

Signed-off-by: Tim Orling <tim.orling@konsulko.com>
---
 .../openssl/{openssl_1.1.1l.bb => openssl_1.1.1m.bb}           | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)
 rename meta/recipes-connectivity/openssl/{openssl_1.1.1l.bb => openssl_1.1.1m.bb} (98%)

diff --git a/meta/recipes-connectivity/openssl/openssl_1.1.1l.bb b/meta/recipes-connectivity/openssl/openssl_1.1.1m.bb
similarity index 98%
rename from meta/recipes-connectivity/openssl/openssl_1.1.1l.bb
rename to meta/recipes-connectivity/openssl/openssl_1.1.1m.bb
index bf7cd6527ef..9c4125c24f2 100644
--- a/meta/recipes-connectivity/openssl/openssl_1.1.1l.bb
+++ b/meta/recipes-connectivity/openssl/openssl_1.1.1m.bb
@@ -11,6 +11,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=d343e62fc9c833710bbbed25f27364c8"
 
 DEPENDS = "hostperl-runtime-native"
 
+SRC_URI[md5sum] = "8ec70f665c145c3103f6e330f538a9db"
 SRC_URI = "http://www.openssl.org/source/openssl-${PV}.tar.gz \
            file://run-ptest \
            file://0001-skip-test_symbol_presence.patch \
@@ -24,7 +25,7 @@ SRC_URI_append_class-nativesdk = " \
            file://environment.d-openssl.sh \
            "
 
-SRC_URI[sha256sum] = "0b7a3e5e59c34827fe0c3a74b7ec8baef302b98fa80088d7f9153aa16fa76bd1"
+SRC_URI[sha256sum] = "f89199be8b23ca45fc7cb9f1d8d3ee67312318286ad030f5316aca6462db6c96"
 
 inherit lib_package multilib_header multilib_script ptest
 MULTILIB_SCRIPTS = "${PN}-bin:${bindir}/c_rehash"
-- 
2.30.2


