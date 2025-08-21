Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 75100CA0FEC
	for <webhook@archiver.kernel.org>; Thu, 21 Aug 2025 22:43:35 +0000 (UTC)
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
 by mx.groups.io with SMTP id smtpd.web10.2520.1755816207031644553
 for <openembedded-core@lists.openembedded.org>;
 Thu, 21 Aug 2025 15:43:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=l2wqaTfJ;
 spf=pass (domain: gmail.com, ip: 209.85.218.47, mailfrom: martin.jansa@gmail.com)
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-afcb78e70c5so225963766b.1
        for <openembedded-core@lists.openembedded.org>; Thu, 21 Aug 2025 15:43:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755816205; x=1756421005; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ekQH9rpp735ejtlc6t/iV9egwFYarWADBhwKW+9BvkQ=;
        b=l2wqaTfJRL5C624vKojlhe7ly8y9YDTSZvD1SVMcV+KHQGfhd219Co/IF1aP6PpGNQ
         gRTsXjO04YWWv5MWZDkwXhHfyNL9ppRhOMFDW6m4pRG/LlXQBGK7aEwKM8NjyTSnKCYY
         Vax4X/WodvidQ5vn/9xljmnN92nKkFwo1NNMQR3vOqebs0sx+Z2qYiHU5SvT7StftGqe
         3mxNtSZbEIXrBL5hVsJxw53B8J6iLCdwm9y3nFv2H1RW9r0L3QEY7X/wSQzImezVWwoW
         4KIe7CG21ECgqFN/hwooqHRtK2Y7m2LIwBXpfgb+6zMm9XPVGhVICdYPEVHh3Tumsbyv
         Vffg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755816205; x=1756421005;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ekQH9rpp735ejtlc6t/iV9egwFYarWADBhwKW+9BvkQ=;
        b=IgT9hJEtxzTXiKn/ag9z0/IIDthi2fLHcoisvec9yW+CuICtAe+jN+iZQ1QyOX3leu
         etUKPLzvC5VG0yB1tAi+kQELH4l9IPIEXTn+066dlYzHeQ2mA+dT5YPOd942Z8th7mtZ
         JTv7IVjWbCnRfreETMqbAij9X4lcqMR33jo9Wn8sW+3uN3hCH0ovK2F6TLWhe3RgD7jI
         ebyocKOrhqp9KjGuQkhTUsnMewEk4pq0K7EpCVVQdxg9CNrzn2I2ULhzvDzCS/QbPbuh
         bknC+CL5oaTL2+fU+y2YiURtwdNKrYdphNTPhSTQ5cqadCgp1fZdkOZ47whdoWaov2ov
         1BuA==
X-Gm-Message-State: AOJu0Yw9DrX+FHwzdd9IHan+f6ZE/CDiCf0A6Wm1zwGn5FUDoiNfNRmT
	tQwelHNQh/v6I0XxzSbyuKBbLycTqvHqu5rs2EaeBz/eZxhw6OHD+gUTfE0q6A==
X-Gm-Gg: ASbGnctbuMKD/f8ScFOR4EZGyV6dbBxzKUW46xhw79iH+Ie4utUP0GvlGk0HhZBzVFn
	+ChuZOp2bPmFLPTFIlLfuAbNLyLoytzD7AyMxRRbY+FmiF5E4F8uGh4S6M5WXB/MUB+1zl+q0zk
	LeamP/qyS75a6jSYfe8TThJXV7sgbBxfL16CGjZSZc8lUlJ+Hxo8m+k2kJ2+ZCjEEcPZFCLOSi7
	AON8LdArvAwY3kgM4fSGMt+NvqaRmOhdtbSRvYxVp+AZP5IP9AxKSI+/T+aNb35FwKOVaLC7z0g
	4ChfBBc+Ps8wOBT1upngiGe9wQXMU9AoEg78t8SGT23op+xwWr3KXv+Xk+uoD6yXsHLS98vBVFi
	hPg9zzt377ckCz1TM9v7F1UtG77HlAzsSfS8MaGNTWKNBn0WwdkTDY3YE
X-Google-Smtp-Source: AGHT+IGUMyfeptjwgqB6Ae175hyw2v1WH34w8T9RXpg/y0t/TU9QIOQuUbq0iYYVNuhtlGA9zL7w9g==
X-Received: by 2002:a17:907:7f27:b0:afd:d994:cac with SMTP id a640c23a62f3a-afe29897202mr67502366b.62.1755816205290;
        Thu, 21 Aug 2025 15:43:25 -0700 (PDT)
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with UTF8SMTPSA id a640c23a62f3a-afded47933dsm475208166b.65.2025.08.21.15.43.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Aug 2025 15:43:24 -0700 (PDT)
From: martin.jansa@gmail.com
To: openembedded-core@lists.openembedded.org
Cc: steve@sakoman.com,
	Khem Raj <raj.khem@gmail.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>,
	Martin Jansa <martin.jansa@gmail.com>
Subject: [scarthgap][PATCH 05/15] gdbm: Use C11 standard
Date: Fri, 22 Aug 2025 00:42:59 +0200
Message-ID: <20250821224314.1690103-5-martin.jansa@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250821224314.1690103-1-martin.jansa@gmail.com>
References: <20250821224314.1690103-1-martin.jansa@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 21 Aug 2025 22:43:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/222290

From: Khem Raj <raj.khem@gmail.com>

GCC15 is switching defaults to C23 and gdbm is not yet ready to
compile using C23 std.

For scarthgap also add it in BUILD_CFLAGS.

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
---
 meta/recipes-support/gdbm/gdbm_1.23.bb | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta/recipes-support/gdbm/gdbm_1.23.bb b/meta/recipes-support/gdbm/gdbm_1.23.bb
index a08079741d..9b32935571 100644
--- a/meta/recipes-support/gdbm/gdbm_1.23.bb
+++ b/meta/recipes-support/gdbm/gdbm_1.23.bb
@@ -23,6 +23,10 @@ EXTRA_OECONF = "--enable-libgdbm-compat --without-readline"
 # Stop presence of dbm/nbdm on the host contaminating builds
 CACHED_CONFIGUREVARS += "ac_cv_lib_ndbm_main=no ac_cv_lib_dbm_main=no"
 
+# Not yet ready for C23
+CFLAGS += "-std=gnu11"
+BUILD_CFLAGS += "-std=gnu11"
+
 BBCLASSEXTEND = "native nativesdk"
 
 do_install:append () {

