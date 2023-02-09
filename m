Return-Path: <fede@evolware.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B2C01C61DA4
	for <webhook@archiver.kernel.org>; Thu,  9 Feb 2023 16:03:28 +0000 (UTC)
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
 by mx.groups.io with SMTP id smtpd.web10.19576.1675958599095715525
 for <openembedded-core@lists.openembedded.org>;
 Thu, 09 Feb 2023 08:03:19 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=RULYZ6BW;
 spf=pass (domain: gmail.com, ip: 209.85.221.45, mailfrom: fede.evol@gmail.com)
Received: by mail-wr1-f45.google.com with SMTP id r2so2255144wrv.7
        for <openembedded-core@lists.openembedded.org>; Thu, 09 Feb 2023 08:03:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=fsKFHYvFUKT/QOlnXRQh4Rud0wvnFZAesjY/rbFzylY=;
        b=RULYZ6BW1ENSff/DECeq2jovlDOMzBYJuyZs7/6aXkhzHatGz7O9p8Wiw3mh+qVYzb
         TUB3+Q/vmZFmJ07n2mAtCkvh05K6usZzACbnbI8RouR9ujx9XYiuUsFPwUlNy3Sq/1Oz
         zY5QN+S1pUihdqTaKiyRp8Dm5H3R05N4LTvLq5I0ved17dQ4WdCvg2e3M4zjrGvczyv2
         QMS82BnuGawX3950siyjXLptvG9bvcUWd6BnDxbRrx7vbC7GuvyZYZQCyjqfl72Mzsh3
         lYFU13xfzPujVTQGcYQeIxxyIvcleNf7cYXOgH6P6w10xjBKbrSUxhB6t4/PtsceWNZC
         R9Yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fsKFHYvFUKT/QOlnXRQh4Rud0wvnFZAesjY/rbFzylY=;
        b=FyKyGkZVkM8JCjFOV3wDNoaOnOCzMl/B54KYyyytXiNJTQ9LpKxfAee0oQPXKHSl+d
         kQNHQC+tSUph0dnk+47VUlubbIHo731i9RHRrC75yC2Ig2MY3xOMFjmTwM4xhdFO2/NO
         GqhJtIY7yg+dp0T+YaiiHll1v8o+b5ZyiMZ0Y5e/v+NGyEEAbhY2C17ixld3YLxSWad6
         JVb8dp8CQHrT7pIkVj4N/qSNZ4nUVF/4nNBKt4KZt0M6jVtmj2yEKf5/5sm/Hi2BDN1q
         SuZwYOXhyp0mk3XKwDQ1OZzx5gNveJnb91wuqPJOgbfDk576t3qwKzt0Yl+sFVpLRHT2
         0kcw==
X-Gm-Message-State: AO0yUKWFCy42FhvE8GtctsgZi1bCGpgjH6jaAQ1py913s6OwJ8+pnqUH
	f5VQftZFnocnnndwiD3KS57nuLA8WzqIqQ==
X-Google-Smtp-Source: AK7set9v3+/dfl98+pGIsFGX+n1JeqssBKG85vp0MShhXAqIciupR3qyDw8jX1ad0l0lvaKOUUlVRA==
X-Received: by 2002:adf:f647:0:b0:2c5:3e91:459a with SMTP id x7-20020adff647000000b002c53e91459amr2007725wrp.36.1675958597206;
        Thu, 09 Feb 2023 08:03:17 -0800 (PST)
Received: from interzone.fritz.box ([2a02:2455:e61:4a00:c805:5e99:7773:8f9e])
        by smtp.gmail.com with ESMTPSA id n15-20020a5d4c4f000000b002c54538c9bdsm126174wrt.10.2023.02.09.08.03.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Feb 2023 08:03:16 -0800 (PST)
Sender: Federico Pellegrin <fede.evol@gmail.com>
From: Federico Pellegrin <fede@evolware.org>
To: openembedded-core@lists.openembedded.org
Cc: Federico Pellegrin <fede@evolware.org>
Subject: [PATCH 1/1] curl: fix dependencies when building with ldap/ldaps
Date: Thu,  9 Feb 2023 17:03:08 +0100
Message-Id: <20230209160308.5974-1-fede@evolware.org>
X-Mailer: git-send-email 2.39.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 09 Feb 2023 16:03:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/176962

openldap is added as a dependency so the build will not fail,
as otherwise ldap headers are not found during configure phase

Note: due to upstream bug (now fixed) building LDAP/LDAPS support
with minimal configurations can sometimes not work, see details at:
https://github.com/curl/curl/pull/10445

Signed-off-by: Federico Pellegrin <fede@evolware.org>
---
 meta/recipes-support/curl/curl_7.87.0.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-support/curl/curl_7.87.0.bb b/meta/recipes-support/curl/curl_7.87.0.bb
index 9956a284228..0b4d649f54a 100644
--- a/meta/recipes-support/curl/curl_7.87.0.bb
+++ b/meta/recipes-support/curl/curl_7.87.0.bb
@@ -40,8 +40,8 @@ PACKAGECONFIG[gopher] = "--enable-gopher,--disable-gopher,"
 PACKAGECONFIG[imap] = "--enable-imap,--disable-imap,"
 PACKAGECONFIG[ipv6] = "--enable-ipv6,--disable-ipv6,"
 PACKAGECONFIG[krb5] = "--with-gssapi,--without-gssapi,krb5"
-PACKAGECONFIG[ldap] = "--enable-ldap,--disable-ldap,"
-PACKAGECONFIG[ldaps] = "--enable-ldaps,--disable-ldaps,"
+PACKAGECONFIG[ldap] = "--enable-ldap,--disable-ldap,openldap"
+PACKAGECONFIG[ldaps] = "--enable-ldaps,--disable-ldaps,openldap"
 PACKAGECONFIG[libgsasl] = "--with-libgsasl,--without-libgsasl,libgsasl"
 PACKAGECONFIG[libidn] = "--with-libidn2,--without-libidn2,libidn2"
 PACKAGECONFIG[libssh2] = "--with-libssh2,--without-libssh2,libssh2"
-- 
2.39.1


