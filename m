Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CD09FCD4F26
	for <webhook@archiver.kernel.org>; Fri, 26 Jun 2026 11:38:14 +0000 (UTC)
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.33117.1782473894012836463
 for <openembedded-core@lists.openembedded.org>;
 Fri, 26 Jun 2026 04:38:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=umZ7Nlm6;
 spf=pass (domain: smile.fr, ip: 209.85.128.47, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-490b613a17bso8259445e9.3
        for <openembedded-core@lists.openembedded.org>; Fri, 26 Jun 2026 04:38:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1782473892; x=1783078692; darn=lists.openembedded.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CTXAyJxgtidQ2YPWCiyHnHoEhaWx+uXLJbucVrnwhHs=;
        b=umZ7Nlm6Lr3j/l+cKUAw3fdquviglElzFzkUMvAVuwkSaaTmWOEQeNRUQTkgBE1Zok
         QEv8omiyLzneZ8y+4IkMtRP4UI8gfexPCgFgLVGdyTnbLtyYVJg78N1UXM5uf5H7uQ8I
         V6x1K1rb5BmuL2IhBuf/I2s3rNuK9ubDwZeKo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782473892; x=1783078692;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=CTXAyJxgtidQ2YPWCiyHnHoEhaWx+uXLJbucVrnwhHs=;
        b=Fp7YOxvXISG6swY7Me/9y01jAf1Ihs5LTMwdcdpO53BWCpzS+dzZQC40uRyr/yXu52
         EwasfqREnaSwsv/iWiD3RWSGyrB4L9M92hDN8bh37kWCLxDXAyM2N1vsk5MeVy4SNI+C
         bEp+mMHqP9A/NVL4ap0pY9GSUUFC4m0+7CdWoVS72ft9FZZTAW72S2RUgxiVZDpRXnMH
         KFIANK8yv9gu1HUH4uVIZD0++GK7BXTMwXoILvamFNGzt+h/V5iQMQLqlycEbYeveki8
         B93M//ru1mcsmnEkTeCAEWB8A8OSaWMdrJGYMcyWQvZsC21RGC5LKh6u1HH9xwb3pdfV
         5iwA==
X-Gm-Message-State: AOJu0YyUDxl+YizK6fKAFr4CXr4T5TCL8I20GkJGsIze2FLbDWCloL9+
	OqxDTdon17j8aoVzpclycC9uacXBJqfEJ8iXZirdxtJBA+QA8lGCx4/YwMPRJC2spZY=
X-Gm-Gg: AfdE7cmAt3IazO/eoBSxHgevKNS88NITTJrH3q60UDWQ+qwHrDrt4qniPxQQuQv/7EO
	3T4OJZ4glz4S2C/auw5C+1R3DzvxpgWXgPXay3ViGVFkUmCYTNXvXI9wxPpfZLqiA4VbDwzjX2D
	Rx1ANU52JaTEoSIk1rybv4BsE01DCetkU2ta7QLXfKLbc8cFE00vPLjQw3/eDw8BfRzC6Xj2Czf
	RJaqKbrz6k/ocppxVhfJgS1LAIAQLcvfBeE6oiHE9233IF95sd/4yqjYOPOedBnxUGlb2HyYski
	kBSzH+k7qS+kPnS4BqICgHjlXkLtdGOzsyXo6K1lEKpUyFWq5Hwlq2tDjQA73hosNPMWVNzj3ib
	n6bAgikqTU+CEz3RB+sxkwAnurod/eU4C+x3cRCNOtZo9ZXKxCmipnBmE+Nka7ymXuzEfHXUXLk
	bM9clZgzRhN1sUHz9/0Ib2Bz8eU97njOmJaNm2dDk92WVicSS0vkW4oC4R5GAblyrOUHBkCnDRO
	J8vTyS2wg==
X-Received: by 2002:a05:600c:4e45:b0:492:4948:bfce with SMTP id 5b1f17b1804b1-4926fc45f89mr7327275e9.16.1782473892228;
        Fri, 26 Jun 2026 04:38:12 -0700 (PDT)
Received: from [10.1.75.39] (2a01cb001331aa00dc663d106f146c8c.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:dc66:3d10:6f14:6c8c])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49270208b29sm421345e9.10.2026.06.26.04.38.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Jun 2026 04:38:11 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
Date: Fri, 26 Jun 2026 13:37:55 +0200
Subject: [PATCH RFC 2/3] rust-llvm: Disable libedit
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260626-ycongal-scarthgap-rust-segfault-v1-2-97df64b7b298@smile.fr>
References: <20260626-ycongal-scarthgap-rust-segfault-v1-0-97df64b7b298@smile.fr>
In-Reply-To: <20260626-ycongal-scarthgap-rust-segfault-v1-0-97df64b7b298@smile.fr>
To: openembedded-core@lists.openembedded.org
Cc: alex.kanavin@gmail.com, ccasciato@21sw.us, paul@pbarker.dev, 
 randy.macleod@windriver.com, ross.burton@arm.com, 
 sundeep.kokkonda@windriver.com, SunilKumar.Dora@windriver.com, 
 Yoann Congal <yoann.congal@smile.fr>, 
 Richard Purdie <richard.purdie@linuxfoundation.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1782473890; l=1159;
 i=yoann.congal@smile.fr; s=20260527; h=from:subject:message-id;
 bh=he6Xk9kWKiIbL8hCU8snGm/CW+3Uo6+PrzUzMDqBWjQ=;
 b=Zpzdm9rz4qU8hDoLX2MqYg7q9A18G5+90FgXukEyRZDqhrJARDUJt4eIFfDyQtfaSDBhVYN7S
 O1JGz/Mo4ZJBk3HReLD9GLno96XjJOseRfQKbKoNzr0kA9SL4GZ6ta8
X-Developer-Key: i=yoann.congal@smile.fr; a=ed25519;
 pk=AccXM/XSn9zzv1zYXEM/MdcAaQ7cluqUBg1xzwrqNts=
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 26 Jun 2026 11:38:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/239628

From: Richard Purdie <richard.purdie@linuxfoundation.org>

This option currently floats and is leading to non-deterministic builds. It
is used for commandline option tab completion which we don't need in our
builds in general, let alone internally within rust's llvm.

This should fix autobuilder deterministic build issues.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit c31859be39c68f215576ba73b8a3d66c8ea590d3)
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 meta/recipes-devtools/rust/rust-llvm_1.75.0.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-devtools/rust/rust-llvm_1.75.0.bb b/meta/recipes-devtools/rust/rust-llvm_1.75.0.bb
index cba41c739e9692ec7b2cd7ee07554ab00dc98fc5..4adaf5fbf6d31b1984a81e864285c1e06218e325 100644
--- a/meta/recipes-devtools/rust/rust-llvm_1.75.0.bb
+++ b/meta/recipes-devtools/rust/rust-llvm_1.75.0.bb
@@ -46,6 +46,7 @@ EXTRA_OECMAKE = " \
     -DLLVM_ENABLE_ZSTD=OFF \
     -DLLVM_ENABLE_LIBXML2=OFF \
     -DLLVM_ENABLE_FFI=OFF \
+    -DLLVM_ENABLE_LIBEDIT=OFF \
     -DLLVM_INSTALL_UTILS=ON \
     -DLLVM_BUILD_EXAMPLES=OFF \
     -DLLVM_INCLUDE_EXAMPLES=OFF \

-- 
2.47.3


