Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D5AD1CDB47E
	for <webhook@archiver.kernel.org>; Fri, 13 Oct 2023 21:54:03 +0000 (UTC)
Received: from mail-oi1-f179.google.com (mail-oi1-f179.google.com [209.85.167.179])
 by mx.groups.io with SMTP id smtpd.web10.51173.1697234041906945132
 for <openembedded-core@lists.openembedded.org>;
 Fri, 13 Oct 2023 14:54:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=h8Ws5Uu/;
 spf=softfail (domain: sakoman.com, ip: 209.85.167.179, mailfrom: steve@sakoman.com)
Received: by mail-oi1-f179.google.com with SMTP id 5614622812f47-3b0dcbf3672so1475612b6e.1
        for <openembedded-core@lists.openembedded.org>; Fri, 13 Oct 2023 14:54:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1697234041; x=1697838841; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=n5s8psKpxD9SflUlz+MQX3qo6c/MPh2wHmStZ3jQMrM=;
        b=h8Ws5Uu/7n0akpbvrZ4Yg7mRo0+vMeTCNrQ6MO8RjksPv43eSEK0ccVcNZtW+5XxOY
         8pPpGJUBVFSnun6SHBU/w/dzYHG+7yXs1xSWIlYSJgHwKYBP5Mnk8t6pyB9JwgmsDu2F
         L73U7lG2m+Cn2LXH+QXMQqhD3dpPOBzpNW2VFZhI2ELBFD65YmkNV8ypr+h+flqBGiZm
         TeS74j3AUDo7WLaflXntaBrZ59SuUjHZetD0d1WMs9IXo4IYSbVYrUHj4Vxz6MXcWCk6
         +j2Mr61iZ2oIl61DnQURMdQh+ybXuTIy1h4VQJLaIOLSszxF71kcvg+XpeGZcicJBpRr
         FauA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697234041; x=1697838841;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=n5s8psKpxD9SflUlz+MQX3qo6c/MPh2wHmStZ3jQMrM=;
        b=Fnq9agPWml156pabRuJXWTTUnNXnWr9/3g5CflC07JzvTxVJ5ifVx493yUAk/RgGsa
         FHB131xk/mPtFmFwE8l/c7ptPkrw8ZL0mOcWNP6aFS69lUQf8JZuSznDAIIsXdwFr8DT
         6ZzewL/0HzSP8W3uavPnGpj4IufnfXwMZ8GWjqSgJXoUfeB3NQ/1eI6U1ksCm6jVjHG6
         ALe7VrD5hAg9YaOddBtehns0xM+AkqOhhwBXfijP+8sUtHzF6NZ7OX1fv50DGBEMkmUT
         5bcnnL+tcTRxXuhhiizOdob1tF8zwToA78SvQu7V+ylcFZ7uLU1SeM+9ezCu1JoZsz9I
         r56w==
X-Gm-Message-State: AOJu0Yw86nhcpk+fTYKHaFO9/r2612jOgg3V3jWUplgwPuKIZ3VBvdqB
	LEHQST1MmR/Qo4PoEXTftLaA/KiDoq5USlr8ixE=
X-Google-Smtp-Source: AGHT+IHxSnEuHBJDQ6ybHDfl9MJpsWeCDB03S/f2tWtR3UD44lbMyEqBSBk3eAJBjzKlKYcEkMHnfA==
X-Received: by 2002:a05:6808:f92:b0:3a8:f3e7:d691 with SMTP id o18-20020a0568080f9200b003a8f3e7d691mr37144244oiw.37.1697234040953;
        Fri, 13 Oct 2023 14:54:00 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id u22-20020a62ed16000000b00690fe1c928csm14307334pfh.147.2023.10.13.14.54.00
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Oct 2023 14:54:00 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][mickledore 24/27] openssl: ensure all ptest fails are caught
Date: Fri, 13 Oct 2023 11:52:48 -1000
Message-Id: <687989f2ee2204643157e04a976d3310018a3bb3.1697233866.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1697233866.git.steve@sakoman.com>
References: <cover.1697233866.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 13 Oct 2023 21:54:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/189101

From: Alexander Kanavin <alex.kanavin@gmail.com>

Piping results through sed may mask failures that sed isn't catching.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 2b1b0e9e4d5011e7c2fd1b59fc277a7cfdc41194)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-connectivity/openssl/openssl/run-ptest | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-connectivity/openssl/openssl/run-ptest b/meta/recipes-connectivity/openssl/openssl/run-ptest
index 10c9b49e4a..c89ec5afa1 100644
--- a/meta/recipes-connectivity/openssl/openssl/run-ptest
+++ b/meta/recipes-connectivity/openssl/openssl/run-ptest
@@ -9,4 +9,4 @@ export TOP=.
 # OPENSSL_ENGINES is relative from the test binaries
 export OPENSSL_ENGINES=../engines
 
-HARNESS_JOBS=4 perl ./test/run_tests.pl $* | sed -u -r -e '/(.*) \.*.ok/ s/^/PASS: /g' -r -e '/Dubious(.*)/ s/^/FAIL: /g' -e '/(.*) \.*.skipped: (.*)/ s/^/SKIP: /g'
+{ HARNESS_JOBS=4 perl ./test/run_tests.pl $* || echo "FAIL: openssl" ; } | sed -u -r -e '/(.*) \.*.ok/ s/^/PASS: /g' -r -e '/Dubious(.*)/ s/^/FAIL: /g' -e '/(.*) \.*.skipped: (.*)/ s/^/SKIP: /g'
-- 
2.34.1


