Return-Path: <zboszor@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8556E10A62F2
	for <webhook@archiver.kernel.org>; Thu, 26 Mar 2026 14:30:42 +0000 (UTC)
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.49668.1774535436228692677
 for <openembedded-core@lists.openembedded.org>;
 Thu, 26 Mar 2026 07:30:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=lgShUvde;
 spf=pass (domain: gmail.com, ip: 209.85.221.41, mailfrom: zboszor@gmail.com)
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-439cd6b0aedso665296f8f.1
        for <openembedded-core@lists.openembedded.org>; Thu, 26 Mar 2026 07:30:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774535434; x=1775140234; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=W37jxDeKhJdnDMjkiIqawKbedRIk5n0T8eSpeZwjKyo=;
        b=lgShUvdeDRHDo6IQlK/RILa3KcZJKIfpZm+5aoxbMvA2artP8PyzY52Tf82BLtRauk
         OawwmkoflH9aqlJGugHPt6IpOnYimJf8EOGZeqCKxu82X1OV/CANSrhE9NOAH29j4mu1
         LQsgNhPrOQgKX9xlGfXpSAquhl4GNk635aV39qnaArOwUrHh5mzb5G6iEsfJviE8OHrY
         s5NowLbFoHW5tJKXRhbxoSiPqk1ehoBCXpaAFWnWubiOeCyKLm0HOJIBRA/TZ8UtzQCI
         prIbNmRYwY2IWGfboy6R3sZKLF71e7wBPRSKxsjxgwNmy0mtGnmaEBF/mYtgk3YdKUl2
         qSKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774535434; x=1775140234;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=W37jxDeKhJdnDMjkiIqawKbedRIk5n0T8eSpeZwjKyo=;
        b=Bhy6hZnp/vWIZXi339MAgd5scOOEEx26AZ7i8fP/2KzFf+XIHL8rtogDPW3vs+2jch
         komyodJe7Pwb8p5ickD11LdOoqgc69kj8o/WshB9aQ6dLXLWcw6S4OVieAF3X/jqYNmN
         ME9dUeb7077ZZhsM5dJwkJlLzvWsefAtvatJzxaoERhJ7i16cZn1xDoEfBLQLknEZxkf
         KnstT/KMD/3BE3hGg2Y8DqMWfLPg7/J2B97szjmbrM0pvSDIp9JAOgBnrkNGtIUPcEda
         ASqUdd2VYGJZPSifxBTLqJtbFAgMTTQfEgwaewGj56VhD5O9jDCm+CSUVUXKyE6CKhC4
         +Eew==
X-Gm-Message-State: AOJu0Yyn08i9jO0+RFXAF/fOvAs3RhNnO8ZBXCRY2YC+tbLRKrYzDGR+
	8YO1ynhs2sg4FBnliRDsixWMVchROssf4CrJMsuamy9fQValL3EyytlUdfS+lg==
X-Gm-Gg: ATEYQzyNkURJYW4zKR3Kkr7B4+V82BVul82LFNNAOMiss1QWhBJphivilwQSrKJexg0
	rrjMdxHgnGGzO17FngEdF+pTwxzFZ52ecclNAqfb4fKkjvdTBO9OiZSHAu9StOsAXnRjBfK8quS
	n+rOZ2lkd5AiohSX/adHnAfPkVxGcKQRtz2kaaZwk/pQlfMSQWCtrkD7A/iPvq+DTu5ZsnmDNkR
	gGCQ2PDPzVjBWsK8z3UCjTiteNKxhvXHmx04T90yofbRjtqzUPsRW+PQyxt3CkidlVReqwTVg58
	71I0xW6+6jKAP/zYyNTBBuvH/ZIsMSWrCIw5PRuB6OuJ6DD/YMA6hVVI00/IaRrJ4AQot5chjd7
	kwG1qil6tc+1dKgQuzL2XdlJ6UDA5F3Bbo1XkUvRqxCc+kOZZ11AAikTRQOhZBqF5q7Ro5S/cwy
	wiRCeUluElH27Beg==
X-Received: by 2002:a05:6000:615:b0:43b:3f16:1b01 with SMTP id ffacd0b85a97d-43b889f582cmr12493375f8f.30.1774535434208;
        Thu, 26 Mar 2026 07:30:34 -0700 (PDT)
Received: from term011.lan (95C810F6.dsl.pool.telekom.hu. [149.200.16.246])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43b91942f24sm9162880f8f.11.2026.03.26.07.30.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Mar 2026 07:30:33 -0700 (PDT)
From: =?UTF-8?q?Zolt=C3=A1n=20B=C3=B6sz=C3=B6rm=C3=A9nyi?= <zboszor@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Trevor Gamblin <tgamblin@baylibre.com>,
	Alexander Kanavin <alex.kanavin@gmail.com>,
	=?UTF-8?q?Zolt=C3=A1n=20B=C3=B6sz=C3=B6rm=C3=A9nyi?= <zboszor@gmail.com>
Subject: [PATCH v2 05/12] python_pyo3.bbclass: Pass ABI flag and use PYTHON_MAINVERSION
Date: Thu, 26 Mar 2026 15:30:13 +0100
Message-ID: <20260326143020.2083293-5-zboszor@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260326143020.2083293-1-zboszor@gmail.com>
References: <18A06529173E9998.57592@lists.openembedded.org>
 <20260326143020.2083293-1-zboszor@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 26 Mar 2026 14:30:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/234008

Setting the ABI flag correctly is necessary for modules using
python_maturin.bbclass and others based on pyo3.

Signed-off-by: Zoltán Böszörményi <zboszor@gmail.com>
---
 meta/classes-recipe/python_pyo3.bbclass | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta/classes-recipe/python_pyo3.bbclass b/meta/classes-recipe/python_pyo3.bbclass
index 7f5a00f584..c618d711ac 100644
--- a/meta/classes-recipe/python_pyo3.bbclass
+++ b/meta/classes-recipe/python_pyo3.bbclass
@@ -12,7 +12,8 @@
 inherit cargo python3-dir siteinfo
 
 export PYO3_CROSS = "1"
-export PYO3_CROSS_PYTHON_VERSION = "${PYTHON_BASEVERSION}"
+export PYO3_CROSS_PYTHON_VERSION = "${PYTHON_MAINVERSION}"
+export ABIFLAGS = "${PYTHON_ABI}"
 export PYO3_CROSS_LIB_DIR = "${STAGING_LIBDIR}"
 export CARGO_BUILD_TARGET = "${RUST_HOST_SYS}"
 export RUSTFLAGS
@@ -25,6 +26,7 @@ implementation=CPython
 version=${PYTHON_BASEVERSION}
 shared=true
 abi3=false
+abiflags=${PYTHON_ABI}
 lib_name=${PYTHON_DIR}
 lib_dir=${STAGING_LIBDIR}
 pointer_width=${SITEINFO_BITS}
-- 
2.53.0


