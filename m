Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1CEA5E77199
	for <webhook@archiver.kernel.org>; Thu,  2 Jan 2025 09:41:17 +0000 (UTC)
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
 by mx.groups.io with SMTP id smtpd.web10.5385.1735810868518365335
 for <openembedded-core@lists.openembedded.org>;
 Thu, 02 Jan 2025 01:41:08 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=V7hiAaoG;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.50, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4363ae65100so116136205e9.0
        for <openembedded-core@lists.openembedded.org>; Thu, 02 Jan 2025 01:41:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1735810866; x=1736415666; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=STzcaDardtgGmQQupE+Pf04W5MhygxqajRzFHDk+6NI=;
        b=V7hiAaoG6iDbmpqbUAMq0zcJ9fxxN5mB1kJU4Zcl1uWp+WmW2cLeJk0QhbuJ/gUF6D
         17V7kkDKYszN3kSSzlzowSlNxiza1hnFoCKWpYbMFL0hVoBlziCZAh8mGmWhcWwuCr+4
         A56BT81sG7cO6e33w34AfTpz76K7YzfhVGP5A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735810866; x=1736415666;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=STzcaDardtgGmQQupE+Pf04W5MhygxqajRzFHDk+6NI=;
        b=Eay14tLKIRqv+fv5KMRUJJk2z950fTiG9j2IVWdG5Tv1oeKIe+XPN2CH/y2dSGTE9T
         2hZ6k13NyFg38k4dHC4kx7UCMKLGEJ+scRdSRt6eY28kUpNsjrIGyB7dqKygyuWnEiv3
         ZJtczSNgelScJX0eVsVGJMvPuok9w5L9fIZOjP+49YwTI45QB6hu50aC5ywTWQXpXCZs
         HvVUlGQCC/HUsUCOv6vnfpv8T5pEZPXLkUNArsOt2esUJhzclUOWxqJ4KsYWB8X27ldY
         UYeVu36guiRy5jUrVQW/XT0gWzlcPi8moiXcKBuqcaUpE9WdKycFkddlJ/rAffjJZaMf
         dzQg==
X-Gm-Message-State: AOJu0Yys6UWmFyVC1CtS2foPSdochQJx/lcF/oFYW1VnE2vABEVlj/7e
	PbbBgvl9ZypUuUQHtuLfGXxpddPhDRbntBMNWyiNnN0zww4Y9PNhqK8ABmdOnivbZQOefB/rFYG
	T00k=
X-Gm-Gg: ASbGncsqr9c1KIeDvw8fHqorNPBKwytRhy5ednAP4PrL11OujErvpo5XAG2SQB7EB6I
	kzdOn7F4t8/mCeQbWzmJ1UAdkrYEaEKQ98m7sfVzMz9dkkzzMhPOGJWrz6zWOOvCYGaYOYcSN2A
	J62U3G8mxJ1Iiludc2DgEgpfSzT67SgiJ8535iyDfQxRQVpm2wOtB8lrS+iOPKuT075D4pBHWHJ
	/3P2mknh9C6jWONKpOYaLC6OyC6d7pHaydnlAdIyexR/gefyK/KlKKJL25SPzvklA0ictZvZk9J
	ck2+FU3w5A==
X-Google-Smtp-Source: AGHT+IHeR5du0R3e9kmVp44pBA3aKDNhiL4PbUJHU+ehl7rs6evM6W0fQmz0EEKBGHzt1cKLuF+f2A==
X-Received: by 2002:a05:600c:1c25:b0:434:f4fa:83c4 with SMTP id 5b1f17b1804b1-43668b5f691mr366629385e9.29.1735810866597;
        Thu, 02 Jan 2025 01:41:06 -0800 (PST)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:ae2e:9f02:55c2:739d])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43656b119ccsm479785625e9.24.2025.01.02.01.41.05
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Jan 2025 01:41:05 -0800 (PST)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 05/21] cracklib: upgrade 2.10.2 -> 2.10.3
Date: Thu,  2 Jan 2025 09:40:36 +0000
Message-ID: <20250102094059.322187-5-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250102094059.322187-1-richard.purdie@linuxfoundation.org>
References: <20250102094059.322187-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 02 Jan 2025 09:41:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/209265

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 .../cracklib/{cracklib_2.10.2.bb => cracklib_2.10.3.bb}         | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-extended/cracklib/{cracklib_2.10.2.bb => cracklib_2.10.3.bb} (93%)

diff --git a/meta/recipes-extended/cracklib/cracklib_2.10.2.bb b/meta/recipes-extended/cracklib/cracklib_2.10.3.bb
similarity index 93%
rename from meta/recipes-extended/cracklib/cracklib_2.10.2.bb
rename to meta/recipes-extended/cracklib/cracklib_2.10.3.bb
index 2c913da1527..c3396521ffe 100644
--- a/meta/recipes-extended/cracklib/cracklib_2.10.2.bb
+++ b/meta/recipes-extended/cracklib/cracklib_2.10.3.bb
@@ -12,7 +12,7 @@ EXTRA_OECONF = "--without-python --libdir=${base_libdir}"
 SRC_URI = "git://github.com/cracklib/cracklib;protocol=https;branch=main \
            "
 
-SRCREV = "e5211fc1d2b435884a2bb77001e107489285296d"
+SRCREV = "e73d5db1789d198b5f9ec44b68b9c775c3e6c042"
 S = "${WORKDIR}/git/src"
 
 inherit autotools gettext

