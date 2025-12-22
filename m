Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 15198E6ADF0
	for <webhook@archiver.kernel.org>; Mon, 22 Dec 2025 20:08:58 +0000 (UTC)
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.87840.1766434134773450505
 for <openembedded-core@lists.openembedded.org>;
 Mon, 22 Dec 2025 12:08:55 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=RSrxOIqD;
 spf=pass (domain: gmail.com, ip: 209.85.218.52, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-b7a72874af1so751884266b.3
        for <openembedded-core@lists.openembedded.org>; Mon, 22 Dec 2025 12:08:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766434133; x=1767038933; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9SSzD/ke0Dd06FKBQB3qh2VzITjnmNYMhYeexu9DbG4=;
        b=RSrxOIqDNHyB0OmcFALHrtXN4pZZT5VA6bcRn+9Jjy75HoipFNSht4Cv/ZLxeSdw5Y
         44ScnDtojRM0bM8QTYip6x8PwDvnTBBSZzekb5cPUOfMyrAHseYmTTxoAMg7Qb520PV8
         RiTxebGP7je5C2AXSgGRcfU0S0sBb/CNTRxSpfhhvzBy0m8u1PPsOSK9BTD+fiGMF0Vj
         yO6Lb2+oeWu1A4y5+c7GcpDVsJFGRSogjp4rEJcW/cksxl64rYHza/cIrdMxNFjBjcbi
         W1iWO70lIvnjy5E5tlO3rv5Ne8IzcpUIES4Fpk83CZaWGWAa7jVPxhcUze8fOW7FXnUr
         U7Jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766434133; x=1767038933;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=9SSzD/ke0Dd06FKBQB3qh2VzITjnmNYMhYeexu9DbG4=;
        b=HcovfYiR62wHczn92CsBtzL7rFCL0J3jVmydXJu2F6zFjLbj6/XsIWTtBGMqaag675
         AMra7pqJ1C0CZ2K0Fypcfxr+6F61E/HYIIvIm3ZA91MW6cG7CjHQgYGjuPyS3TZKK7O2
         THexWm/JbajRGOxBvax9pRnx7tOGX4xyb1ysGxnLudNwU2yZhMkv9z+aeTs6/+NnHF1d
         j/zoQLTxqT9lJ1rz/iVE09RAl+evDeJhe69nSAYcCpGjEHdCAz0Fqedy4MzgxNyFCVFO
         C24Yo9L/gs6pKVDEt5bAbH/lr/8hfFlknA9qVED/x5mTfJ3SLK+GuFiMl+eiIfKqBpkg
         JwqQ==
X-Gm-Message-State: AOJu0YxNwasxjxaVC5o3Ur1CNW0etYcHibMC5Mx6vsscu+cVvuIbgflJ
	jtKw4GzCTwZMWWoz3R7f3hFwc/gtGRVz/drkSLlInqJfPl07zdBqKpaWrL+LPw==
X-Gm-Gg: AY/fxX6S6AUBhsfO5bZYwVGzXBgi3Ox2of+GbUQIZUlH0UDMrvgJgbSTiziukWLmumd
	xRp+oD/6AqT9gcGhRQL4WJ+s47wSDYR6o0Eqg00s8rY3n5aN0f6GBl4XX/NoceOSHE4SGvPVpIN
	HQlO7LE0YwKJ6JBuygEcAdcZPjlxmFLLeSitzEYj0l3X8WIxHdOn+xk5xcXLTTLssT+rETi3p/N
	n56DV9ekw4fsDjjfTCkgE4PBti/yzmDKxsVMU+hrm3JZPiihj+dXRrDuk8ItDRSe26chZyhlkBC
	XW09+gvZnOACq60Z7o8RcbI9a+TKCQZAgHoTIXoOVTMKvYf8bqTwTNzbRxkC9TF/q9oDZqqamY0
	q38YcKnSY8UJvp9Cs2bHmHBKkLrliqIbY9H2KeDTJCmVJdyCn/nLVFVfTqmxhRXhxZrN3RgoeO9
	XfSa4xWc+dgU1ckXwvqwS0DieeN0RgTP/N+40+sVPru4+Hakc=
X-Google-Smtp-Source: AGHT+IFUjmkfYgud8PfJOrvWvfJUvDraQYo9cLLDTaru6Ku9H7sCpJCb02XlrNi6Bt1PHR8bMycuUg==
X-Received: by 2002:a17:907:8686:b0:b6d:7288:973d with SMTP id a640c23a62f3a-b80371d670fmr1395557866b.56.1766434133032;
        Mon, 22 Dec 2025 12:08:53 -0800 (PST)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8037f3e271sm1182344066b.60.2025.12.22.12.08.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Dec 2025 12:08:52 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 099/114] swig: upgrade 4.3.1 -> 4.4.1
Date: Mon, 22 Dec 2025 21:07:21 +0100
Message-ID: <20251222200739.2278706-99-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251222200739.2278706-1-alex.kanavin@gmail.com>
References: <20251222200739.2278706-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 22 Dec 2025 20:08:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/228424

From: Alexander Kanavin <alex@linutronix.de>

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 meta/recipes-devtools/swig/swig/determinism.patch           | 2 +-
 meta/recipes-devtools/swig/{swig_4.3.1.bb => swig_4.4.1.bb} | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-devtools/swig/{swig_4.3.1.bb => swig_4.4.1.bb} (94%)

diff --git a/meta/recipes-devtools/swig/swig/determinism.patch b/meta/recipes-devtools/swig/swig/determinism.patch
index 4359281bbb..d6af38248d 100644
--- a/meta/recipes-devtools/swig/swig/determinism.patch
+++ b/meta/recipes-devtools/swig/swig/determinism.patch
@@ -1,4 +1,4 @@
-From 1cd6f0cc21fc977a710e8d30c3d2ebfee3c72dc0 Mon Sep 17 00:00:00 2001
+From 7df78bedb666e49131c48f1854c6be1597bd133c Mon Sep 17 00:00:00 2001
 From: Richard Purdie <richard.purdie@linuxfoundation.org>
 Date: Mon, 1 Mar 2021 00:11:10 +0000
 Subject: [PATCH] swig: Fix reproducibility issue
diff --git a/meta/recipes-devtools/swig/swig_4.3.1.bb b/meta/recipes-devtools/swig/swig_4.4.1.bb
similarity index 94%
rename from meta/recipes-devtools/swig/swig_4.3.1.bb
rename to meta/recipes-devtools/swig/swig_4.4.1.bb
index dd979580a1..f71a92d931 100644
--- a/meta/recipes-devtools/swig/swig_4.3.1.bb
+++ b/meta/recipes-devtools/swig/swig_4.4.1.bb
@@ -15,7 +15,7 @@ DEPENDS = "libpcre2 bison-native"
 SRC_URI = "${SOURCEFORGE_MIRROR}/${BPN}/${BPN}-${PV}.tar.gz \
             file://determinism.patch \
            "
-SRC_URI[sha256sum] = "44fc829f70f1e17d635a2b4d69acab38896699ecc24aa023e516e0eabbec61b8"
+SRC_URI[sha256sum] = "40162a706c56f7592d08fd52ef5511cb7ac191f3593cf07306a0a554c6281fcf"
 UPSTREAM_CHECK_URI = "https://sourceforge.net/projects/swig/files/swig/"
 UPSTREAM_CHECK_REGEX = "swig-(?P<pver>\d+(\.\d+)+)"
 
-- 
2.47.3


