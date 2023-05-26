Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 23841C7EE2E
	for <webhook@archiver.kernel.org>; Fri, 26 May 2023 02:29:41 +0000 (UTC)
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
 by mx.groups.io with SMTP id smtpd.web11.106.1685068180800091188
 for <openembedded-core@lists.openembedded.org>;
 Thu, 25 May 2023 19:29:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20221208.gappssmtp.com header.s=20221208 header.b=Ruo3VjYc;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.175, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-1ae58e4b295so1666005ad.2
        for <openembedded-core@lists.openembedded.org>; Thu, 25 May 2023 19:29:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20221208.gappssmtp.com; s=20221208; t=1685068180; x=1687660180;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MT2RtDjbdq9/MSNOi9K+66iB05wFvxGZ2uhaXF06BRY=;
        b=Ruo3VjYcpirbyZGt8vSuuat0SDg56VRqP8IkvwE61d8Y5Ubl+51OGVs5zGXdz3hxzO
         AM3qrXgrpNirexKLSR3xnCvsIkItWKLYMmzZF1xBoh8JqllLKXzfNqjyiSrf25fiuR1b
         OVjp/92J53pIbG5t1fMk2MmafI7ueaXXebz9f7hqW5hKv/tiXK7VDL5+PCsyFCkINLIZ
         2sgTROBXbdgxjmFiXnm9fPinAdbN9zNIazaCo9S+nppS5vpGRTaForKYq8fDehlviFOe
         mhHmTdE1rxK3JeAkjkK/76USv1UPRlVd+pdnMtIEPYxdgNgMV8VZrXb29IJmS1TewabB
         Sl7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685068180; x=1687660180;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MT2RtDjbdq9/MSNOi9K+66iB05wFvxGZ2uhaXF06BRY=;
        b=hSzyhZkGdK9Olv/JSUF92ftes9L+52Ub8pZv9cIJLfwlsflxcuWqAYaML+m0Q5hQgI
         0sO/vvL/sNdG/B4j0RkJtkijcqT+T/Ph5BodqN6GGK3l8Gs6ww1QXbjGOHNgQTxpdwry
         GuTDnn2oamxbnW7bTIQt3RJPT4g3mbnx/xlGbhChw8QjaXgd4vpGb99arzXhulpTWEq0
         RyrMkV+uB7t5xgwJLHre1ko7pGjPCmut94Am+pX0dFQBttzMmQDgqg1OUoQgDaBqtjvr
         9+wtYHgvULvCdBaCqI4VPd+DDm+ssPUO+RZ3nsiY4eHGq+myi665WrO093ncuCWsU2qz
         ANRQ==
X-Gm-Message-State: AC+VfDw7r6e4EJheQSsH45wTlybJDKWxL3oiDc/9bxeluSWWgjgyTwwU
	cOM39yjfjnmVs9U3VdBX5LHlXy7JRfEngca6XHs=
X-Google-Smtp-Source: ACHHUZ7icZC5hdFhLgvXHIseOfxiYf5LxeUyx0Kf77GCe982ETavDfvxiw6HDIl83Yy0oiJ0t6tVrQ==
X-Received: by 2002:a17:903:2cc:b0:1aa:ef83:34be with SMTP id s12-20020a17090302cc00b001aaef8334bemr845395plk.47.1685068179941;
        Thu, 25 May 2023 19:29:39 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id t13-20020a170902b20d00b0019ee045a2b3sm2023794plr.308.2023.05.25.19.29.39
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 May 2023 19:29:39 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 10/21] p11-kit: add native to BBCLASSEXTEND
Date: Thu, 25 May 2023 16:28:58 -1000
Message-Id: <19498bea309f19d841187a7063286b2a68ce2587.1685068004.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1685068004.git.steve@sakoman.com>
References: <cover.1685068004.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 26 May 2023 02:29:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/181742

From: Jan Luebbe <jlu@pengutronix.de>

This recipe is needed to build softhsm (in meta-oe) in with p11-kit
support, which is useful when multiple PKCS#11 modules need to be used.

Signed-off-by: Jan Luebbe <jlu@pengutronix.de>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 4942a42d5a071b283fe49047dcb4fee2c96422e8)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-support/p11-kit/p11-kit_0.24.1.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-support/p11-kit/p11-kit_0.24.1.bb b/meta/recipes-support/p11-kit/p11-kit_0.24.1.bb
index 59cbb67961..72b446204a 100644
--- a/meta/recipes-support/p11-kit/p11-kit_0.24.1.bb
+++ b/meta/recipes-support/p11-kit/p11-kit_0.24.1.bb
@@ -29,4 +29,4 @@ FILES:${PN} += " \
 # PN contains p11-kit-proxy.so, a symlink to a loadable module
 INSANE_SKIP:${PN} = "dev-so"
 
-BBCLASSEXTEND = "nativesdk"
+BBCLASSEXTEND = "native nativesdk"
-- 
2.34.1


