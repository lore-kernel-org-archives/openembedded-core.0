Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DD983C001DF
	for <webhook@archiver.kernel.org>; Sun, 30 Jul 2023 18:01:51 +0000 (UTC)
Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
 by mx.groups.io with SMTP id smtpd.web10.77654.1690740111666203023
 for <openembedded-core@lists.openembedded.org>;
 Sun, 30 Jul 2023 11:01:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20221208.gappssmtp.com header.s=20221208 header.b=KRgLo6ze;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.172, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-686f1240a22so3511213b3a.0
        for <openembedded-core@lists.openembedded.org>; Sun, 30 Jul 2023 11:01:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20221208.gappssmtp.com; s=20221208; t=1690740111; x=1691344911;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2x78cY54JgTh4TB3qwmPgVX0tqA0lT3LVvFjTPS1sF4=;
        b=KRgLo6ze63a8YpVL95MA8hDiCXBeGDm0Il80AWw347JFBqeIK+9y6R6oN64ovQhync
         Sg83IFiQ7gpVf/sDnf9mu4CZI1CW6StmwwTAIcOOIwhJC23bzjuGW9Mz8MwDhERsKxYI
         SAG8NVDN54tmvTT2pAvOAQEVvIrSY0L58RHCfmRTsfTxoJF8Z89N+EGQCYbK8ZcXmfKQ
         dfSEVXeExrp/NVbDpOJc2zjU8wZI+CK0RerxoTMviWa510nFCtO9HaOIjAop+J0QmAVp
         b2Y/yBtUBdUKtg1UzavxeIlIW2rRSMWcgCb7qzhN1zZnq2dPYQBHPoglAI94KouKi4tL
         F4Mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690740111; x=1691344911;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2x78cY54JgTh4TB3qwmPgVX0tqA0lT3LVvFjTPS1sF4=;
        b=fzt9AaGiHtYwe7GzyLEWNzdIJbgQGUAOB6nsQXTBXdKccXIaNl2eu7dIcTBL5lyWHS
         oEeezIqkIPmi0vfYzgXvX+MueB466/Kenat5LEcqViVnwYU+XUPC8xOvY4jL0sKk9WXW
         yoA0DR4lKOHJnVJDMDxZb6HfxIXmPvsCjJSSWCzXjwV0/8WyphtCX+Q1aoYKZFthhWwr
         5CZG2PpfFYq3KsEyZ+4Sk74o+6HtFsnutSDDJpTnKgTUWkxNKX3DXr4XKM8Ij2CwJTTk
         TdqlZ2NDt7egiCx31ytWZWAZdcouNhRJqX8QAgca3wcRA39f4aRpIgQeMMacthKKgHUn
         qgWA==
X-Gm-Message-State: ABy/qLY+9jUCP5at0lEHj/Bfq6vflybIQuUpmDvjsK++IuMx8L5Whjs2
	M0IOptjQ1/oiDUWe4CAQ/z6XkU4lVgD/CzPzuNrcgQ==
X-Google-Smtp-Source: APBJJlGqtSGULbpqo5qec/pEUrnCI8iReMEzbR151Ks9zMFTN/siam63nl1/OE2kA8xrFmmNLXXkZg==
X-Received: by 2002:a05:6a20:13c3:b0:133:be16:509 with SMTP id ho3-20020a056a2013c300b00133be160509mr7871091pzc.34.1690740110788;
        Sun, 30 Jul 2023 11:01:50 -0700 (PDT)
Received: from hexa.lan (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id e9-20020a62ee09000000b0066e7a540ea5sm6150494pfi.205.2023.07.30.11.01.49
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 30 Jul 2023 11:01:50 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 28/30] openssl: add PERLEXTERNAL path to test its existence
Date: Sun, 30 Jul 2023 08:00:51 -1000
Message-Id: <811af7be2435173d86f49bf48eda3eb31ecef209.1690739937.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1690739937.git.steve@sakoman.com>
References: <cover.1690739937.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 30 Jul 2023 18:01:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/185106

From: Jose Quaresma <quaresma.jose@gmail.com>

When upstream change is better to fail or removing the PERL5LIB
if they are not need anymore.

Signed-off-by: Jose Quaresma <jose.quaresma@foundries.io>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 337ac1159644678508990927923ef8af30f34cd7)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-connectivity/openssl/openssl_3.0.9.bb | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-connectivity/openssl/openssl_3.0.9.bb b/meta/recipes-connectivity/openssl/openssl_3.0.9.bb
index 849bd7e5a6..ba31418b4a 100644
--- a/meta/recipes-connectivity/openssl/openssl_3.0.9.bb
+++ b/meta/recipes-connectivity/openssl/openssl_3.0.9.bb
@@ -137,7 +137,9 @@ do_configure () {
 	fi
 	# WARNING: do not set compiler/linker flags (-I/-D etc.) in EXTRA_OECONF, as they will fully replace the
 	# environment variables set by bitbake. Adjust the environment variables instead.
-	HASHBANGPERL="/usr/bin/env perl" PERL=perl PERL5LIB="${S}/external/perl/Text-Template-1.46/lib/" \
+	PERLEXTERNAL="${S}/external/perl/Text-Template-1.46/lib"
+	test -d "$PERLEXTERNAL" || bberror "PERLEXTERNAL '$PERLEXTERNAL' not found!"
+	HASHBANGPERL="/usr/bin/env perl" PERL=perl PERL5LIB="$PERLEXTERNAL" \
 	perl ${S}/Configure ${EXTRA_OECONF} ${PACKAGECONFIG_CONFARGS} ${DEPRECATED_CRYPTO_FLAGS} --prefix=$useprefix --openssldir=${libdir}/ssl-3 --libdir=${libdir} $target
 	perl ${B}/configdata.pm --dump
 }
-- 
2.34.1


