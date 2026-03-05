Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D2B04F47CAA
	for <webhook@archiver.kernel.org>; Thu,  5 Mar 2026 18:03:44 +0000 (UTC)
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.50664.1772733823337386052
 for <openembedded-core@lists.openembedded.org>;
 Thu, 05 Mar 2026 10:03:43 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=AFhvTtpq;
 spf=pass (domain: gmail.com, ip: 209.85.128.46, mailfrom: martin.jansa@gmail.com)
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4806bf39419so69057365e9.1
        for <openembedded-core@lists.openembedded.org>; Thu, 05 Mar 2026 10:03:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772733822; x=1773338622; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pk6n/3I1TB8wUZVTbl0/tGZqJfFzEJ8yDr8x3dO+tUw=;
        b=AFhvTtpqCuNjf9oCPXBtp9ZCeLyeB4U8mycOPdIqxYDzRNRQAUYzKMsBQol1IEJq8f
         ZXsCjoqwPonHjM/Blk8Ayxqtx1B9woSYs31gE9yOwogCLFJkB4jkjXQ1HIrZJOmOvHgh
         6LNOysT0LzMMaIbpgT6ZvjfAwR7ES2jQIjTL4lf9V3UY2mOSu4QHJvI8iNglcwrTBcFG
         nf/Wne8kO7KKxUdK5CGDe7uAXAa4JAbx9fQfvlGsiAS1MC5o4OdC7nqvYceHXJtdOxzJ
         gicJrJ3UpONxkqiAwFRTpb+nSfEpHkmW1W1n7Kg+7fMYTHHaXPV+QmqGnJhMpkkDIeM8
         nmMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772733822; x=1773338622;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=pk6n/3I1TB8wUZVTbl0/tGZqJfFzEJ8yDr8x3dO+tUw=;
        b=T/F/sED6ab5kjHeGkVQLCEzEpcvUDr1e8WUzMYlu0LWQeBM1tVXMHCE7jx7X2j0y8z
         382kWRVvHmHbVspJriJOaFEW4+2HPsqQ+gK2lo++jpBpj8jN4Hpbg1O4OHm6INEo3N0W
         LdhbnEoF1Ij+hDWV5twe54Zj+QOB4cSXNJm0/rhjSsxFGqpahDpr/Q45BX5fR7/vvTK8
         HR8e9U+S6o3Q6ZFijz1nVfbaDq0//k0wV3QijneKUufWYMHCJg+aSBOZbH31QaZLjNDI
         7rWTF3lWFNtkLbNd+cgLg9CGkwLLz4x+CdBpQ/T0YnrXJgWZsozqrwEfVZ53kOm0bth5
         8PtA==
X-Gm-Message-State: AOJu0YwY1ZdTcZuWlFoXoFF5jV/2GY0g2/N1la0r0K9tZAQa7x7/WWy2
	XP05dXWmUTtsGpe/okxzQd0lh6dKZAKk5sr0bRK2zN59C2amUpDJNpXN1I6D2PbL
X-Gm-Gg: ATEYQzwx2qa0bGlJoAGKHSJYYRANrq4arBn2UgnShSmL1vHlJdIxnS3bhkULtBPq/4J
	EsIWXY2XtLj2SllOMrEEvWAu9CnMCfjlBsKVtRztm/c/ABJua5zoIshnIpZxn49wHgt1s/513pF
	E256z8qVTs+J80++9zD/B/oA6AAICe8jQbIUcOfYKu3Gf978vFQ9Amg5iqYR3pf7W5xMsOozR71
	zXEZFVsr6fuk27x2n+5Mg/nIpQixdob/yUzaNc4f+oLqdRhYgzlNnOxCmRfgaFRkugP5JeD38KW
	4yZuOFJ2CZrFQ3pZG5Lznhzc1BVk5q5ihcwTALmbYJ5SeC6JzcYCrXLZnXn7o7oS2rv1+1rv9Yo
	qPYAwtd0ca8yOS9825Dm4kmrVZqihjvmZ4DsvmRDaFRnA7wmtlBWosQJbmcZKUCAjgNLEXFmzTP
	rdt4Af41zleD5KtHnzbWxyOyB1Yw==
X-Received: by 2002:a05:600c:34cc:b0:483:7b99:131d with SMTP id 5b1f17b1804b1-4851eeab240mr54905015e9.16.1772733821477;
        Thu, 05 Mar 2026 10:03:41 -0800 (PST)
Received: from localhost ([109.238.218.228])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4851fafbf9bsm53086515e9.14.2026.03.05.10.03.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Mar 2026 10:03:41 -0800 (PST)
From: martin.jansa@gmail.com
To: openembedded-core@lists.openembedded.org
Cc: Martin Jansa <martin.jansa@gmail.com>
Subject: [PATCH 3/3] libunistring: upgrade to 1.4.2
Date: Thu,  5 Mar 2026 19:03:31 +0100
Message-ID: <20260305180333.306176-3-martin.jansa@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260305180333.306176-1-martin.jansa@gmail.com>
References: <20260305180333.306176-1-martin.jansa@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 05 Mar 2026 18:03:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/232505

From: Martin Jansa <martin.jansa@gmail.com>

https://lists.gnu.org/archive/html/bug-libunistring/2026-02/msg00001.html

glibc-2.43 isn't used in OE builds yet, but this fixes libunistring-native:
https://errors.yoctoproject.org/Errors/Details/903980/
unistring-native/1.4.1/recipe-sysroot-native/usr/include  -isystemTOPDIR/tmp/work/x86_64-linux/libunistring-native/1.4.1/recipe-sysroot-native/usr/include -O2 -pipe -c ../../sources/libunistring-1.4.1/lib/amemxfrm.c
In file included from /usr/include/features.h:540,
                 from /usr/include/errno.h:25,
                 from ../../sources/libunistring-1.4.1/lib/amemxfrm.c:23:
./stdlib.h:807:20: error: expected identifier or ‘(’ before ‘_Generic’
  807 | _GL_EXTERN_C void *bsearch (const void *__key,
      |                    ^~~~~~~
make[2]: *** [Makefile:10166: config.h] Error 1

Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
---
 .../{libunistring_1.4.1.bb => libunistring_1.4.2.bb}            | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/libunistring/{libunistring_1.4.1.bb => libunistring_1.4.2.bb} (93%)

diff --git a/meta/recipes-support/libunistring/libunistring_1.4.1.bb b/meta/recipes-support/libunistring/libunistring_1.4.2.bb
similarity index 93%
rename from meta/recipes-support/libunistring/libunistring_1.4.1.bb
rename to meta/recipes-support/libunistring/libunistring_1.4.2.bb
index 791f4983ed..8f6cc27193 100644
--- a/meta/recipes-support/libunistring/libunistring_1.4.1.bb
+++ b/meta/recipes-support/libunistring/libunistring_1.4.2.bb
@@ -21,7 +21,7 @@ LIC_FILES_CHKSUM = "file://COPYING.LIB;md5=6a6a8e020838b23406c81b19c1d46df6 \
 DEPENDS = "gperf-native"
 
 SRC_URI = "${GNU_MIRROR}/libunistring/libunistring-${PV}.tar.gz"
-SRC_URI[sha256sum] = "12542ad7619470efd95a623174dcd4b364f2483caf708c6bee837cb53a54cb9d"
+SRC_URI[sha256sum] = "e82664b170064e62331962126b259d452d53b227bb4a93ab20040d846fec01d8"
 
 inherit autotools texinfo
 BBCLASSEXTEND = "native nativesdk"

