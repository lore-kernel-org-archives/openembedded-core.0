Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CC095C4321E
	for <webhook@archiver.kernel.org>; Fri,  4 Nov 2022 03:01:27 +0000 (UTC)
Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com [209.85.215.171])
 by mx.groups.io with SMTP id smtpd.web11.7149.1667530881786464670
 for <openembedded-core@lists.openembedded.org>;
 Thu, 03 Nov 2022 20:01:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=6d5jSurD;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.171, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f171.google.com with SMTP id 64so3314891pgc.5
        for <openembedded-core@lists.openembedded.org>; Thu, 03 Nov 2022 20:01:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gsU1daWWAr33IRDtcnNuPrDZtQaTPyq7yROvMnDsBgE=;
        b=6d5jSurDvxIY2ebWf/l49dFuSrXGNBCo3u8bUZgMXraxw4nQADWwDMKr5MarT8cE0T
         rYWGJTqrDAxJpVfixXbMDeFecxZHPiZpS+1jIn3W3XN05JH/88MIqU/frKHQRPw++mV/
         Itfgl23a/xfbs0o0B01Q5Aif/JLcd5NR+kJ7vCJEvKcYtl7/uaLRvjkHrD6BDDMiggql
         BBxsFsrBeuKBNoJMT26qMVho7hVw4UL3vxiz2xwAuuU8+eYij59GitcqPGQLWXleMZkq
         SlSP6ZOvi/8PMmPlO259kwrPJkuhz9dDx2gV1xGpyVdjPnl8eh2tP5Lucp6tvQVFmjh8
         6g5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gsU1daWWAr33IRDtcnNuPrDZtQaTPyq7yROvMnDsBgE=;
        b=IaedmkEv5Miy+8mxQbpnBcBdNT3ndLKxyT3tJuDVKS5k9KEP56XXi1W0OlMCRkr1zG
         M842AGdc+MGbF2EfnNp2++sDjwMoQNl0ovWPQKqNfzWIcutrO1HdOaEZncjxO4UeF+lu
         adsGgLGzkvGJl2c2cYWZ9jYD6rREzr5uGwrBPNQbpg18tN9KSgAWmObjlYVvbiwia534
         yM92hdBqZjJ9RKUif9S0NT1wGW/XM+oHrFwyKWUoc/+EzhEIsVswNC1CVkdGXLJeEt5c
         LEymIKkVCtB95lAZa5qh6IesCVPH7ZWAiXXZkMVYIc7FAvh3MirD0OULmmus8oeYphki
         2JJg==
X-Gm-Message-State: ACrzQf2NWNZS/mK87bG0kEBgrmdnKpJajF9SopsU1oWS3LC8tBfjlyFT
	l3rjX9vKKqU3UITQAwQPdqkhFT5nQAjVAvrP
X-Google-Smtp-Source: AMsMyM7ZexXPKwBZmwnvY9GbKjxDm1fOz5S431tN7eo5v877xVFcOtl5H4dE4AqW3HeRPEWmk3ENJg==
X-Received: by 2002:a05:6a00:23c9:b0:56c:9f62:3369 with SMTP id g9-20020a056a0023c900b0056c9f623369mr32704459pfc.22.1667530880734;
        Thu, 03 Nov 2022 20:01:20 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net. [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id r7-20020a17090a454700b0020b7de675a4sm667902pjm.41.2022.11.03.20.01.19
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Nov 2022 20:01:20 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 01/31] openssl: export necessary env vars in SDK
Date: Thu,  3 Nov 2022 17:00:36 -1000
Message-Id: <dbeaf140c38b22887338735bbb57b66f6a47faa6.1667530733.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1667530733.git.steve@sakoman.com>
References: <cover.1667530733.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 04 Nov 2022 03:01:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/172662

From: Chen Qi <Qi.Chen@windriver.com>

In current SDK, when running the following command in python
shell, we get an error.

$ python3
>>> from cryptography.hazmat.backends import openssl

The error message is as below:

  cryptography.exceptions.InternalError: Unknown OpenSSL error.

We could set OPENSSL_MODULES explicitly in nativesdk-openssl package
so that when SDK is set up, it's in environment and we can
get rid of the above error.

Also, there are other env vars that need to be exported. And we export
all of them to keep sync with openssl-native.bbclass.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
Signed-off-by: Ross Burton <ross.burton@arm.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit d6b15d1e70b99185cf245d829ada5b6fb99ec1af)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
(cherry picked from commit 69030b368773baae65d95e39d3587913b8401bc7)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../openssl/files/environment.d-openssl.sh                    | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta/recipes-connectivity/openssl/files/environment.d-openssl.sh b/meta/recipes-connectivity/openssl/files/environment.d-openssl.sh
index b9cc24a7ac..516bbd1c56 100644
--- a/meta/recipes-connectivity/openssl/files/environment.d-openssl.sh
+++ b/meta/recipes-connectivity/openssl/files/environment.d-openssl.sh
@@ -1 +1,5 @@
 export OPENSSL_CONF="$OECORE_NATIVE_SYSROOT/usr/lib/ssl/openssl.cnf"
+export SSL_CERT_DIR="$OECORE_NATIVE_SYSROOT/usr/lib/ssl/certs"
+export SSL_CERT_FILE="$OECORE_NATIVE_SYSROOT/usr/lib/ssl/cert.pem"
+export OPENSSL_MODULES="$OECORE_NATIVE_SYSROOT/usr/lib/ossl-modules/"
+export OPENSSL_ENGINES="$OECORE_NATIVE_SYSROOT/usr/lib/engines-3"
-- 
2.25.1


