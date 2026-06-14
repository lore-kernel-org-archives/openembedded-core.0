Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0E9CFCD98DC
	for <webhook@archiver.kernel.org>; Sun, 14 Jun 2026 08:04:01 +0000 (UTC)
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.105048.1781424237151737633
 for <openembedded-core@lists.openembedded.org>;
 Sun, 14 Jun 2026 01:03:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=N2rInnv+;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.52, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4903d730b1fso29648525e9.2
        for <openembedded-core@lists.openembedded.org>; Sun, 14 Jun 2026 01:03:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1781424235; x=1782029035; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1JfDk/b4taO6/3KRb0a1307Iundxf1+OegbGkDQYZdo=;
        b=N2rInnv+tw9aibzNrAkmNKjkn6HGX1+ObXXJLf5r0p+92sZEZUtwt0IsT0YzDvT31N
         VjOfX5y1oe/EYC4R1PcQraiR/hhTEsHet3GOECyaxf6JZJlxghU6W26cenP4Yydu0EPK
         bqCTQxGIGKh/eTGXyJFU6sVTVYYbMn0tXAsQ4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781424235; x=1782029035;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=1JfDk/b4taO6/3KRb0a1307Iundxf1+OegbGkDQYZdo=;
        b=HeQzDyCerFe3gqsMowBoRAtetrVA9U4s/v6DDdCPxJkcZ/P2rQgCN20kO/6eH5HI/u
         dVBpwpa310ecfdUEL46fL/72Blh3bFr81If+bOC5JQ7BqEbAnYFB4cY1k9/syflp8vKx
         O7/vnmMMwrxV4x8TYQP0M9jmW1YWi/JrPHnLrJm4RQ7Z401FO62MUoww4jxgV6eoQoHj
         ygOb5qvqUdLfuVgVmSfUX9oTXMbwdoXCd6kln19Bldu6KKBhobL6MIWR7S98n6WTgUci
         S+SJ2nthqoiV6vNkMyPrSae1qBv5ux6WLItxMSO2qt8yzxh/k6vMvDalWNhPgB6GCHgd
         BAdQ==
X-Gm-Message-State: AOJu0YzHUiSs2KjdPHiLhoa7W1MhZgZ2xhWbo6aUnNmUkTR9LenJbDZJ
	/ouJxBlB6ZPO5VmkV3LfD3wD0zVxesd7/OgskY9wMyGkU2uL8fidIkoSJrC8T3uHYLbNCdZBYaU
	Zh7cC
X-Gm-Gg: Acq92OHQv2nbdNJrYLloo233A6mDv50WWdnlE8KNWRCf4lbQbkQMEmKzEOlMkTJz6pu
	ceIo8msZCqmNSGYqkdyrtEsLJJy5yb2xe1xHCEMRogn8WqdNgbGqQQIrWMW6FUbmx5DYOA9Fk9D
	md4T+oAqG5NpKrLEObG0Ja4jjHUtT37pFDMyMq0ZG/SJ/NOQJZopckw5HtOJkcsNA4cISPV9Kol
	sQRRNW6sJRy/j/SgPgRHe7ZGLSzw8+4noKcNdqEj5QfxU7u5pKXtVarKAf2i9IAjOw3gaA9Liqs
	MYn13beUUWpyT54r18Gqo7FiBm+DP/hQXiEWE6rnnlgkFxs7dvOx4xbq2kAbUGI8ttyi1h/uu6P
	VH5LwSHVorZSbZV4RcIYxR2t8noQyICkLpTTwx+KuN784tQ1dqkAdHv6fmKIIw1H5dUNqnHPa9s
	3VAo5rjVtHzHs3Xw4XGqUnWoFZ0OYZSnJhZNYZ21caWSdd0TCnD8eh
X-Received: by 2002:a05:600c:695:b0:490:bd1d:4732 with SMTP id 5b1f17b1804b1-492200dcaebmr42701295e9.23.1781424235436;
        Sun, 14 Jun 2026 01:03:55 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:b23b:4f5a:d2e8:6789])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-492202edf89sm149999065e9.1.2026.06.14.01.03.53
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 Jun 2026 01:03:53 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 28/56] python3-docutils: upgrade 0.22.4 -> 0.23
Date: Sun, 14 Jun 2026 09:02:39 +0100
Message-ID: <20260614080307.4017177-28-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260614080307.4017177-1-richard.purdie@linuxfoundation.org>
References: <20260614080307.4017177-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 14 Jun 2026 08:04:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/238712

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 .../{python3-docutils_0.22.4.bb => python3-docutils_0.23.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-docutils_0.22.4.bb => python3-docutils_0.23.bb} (85%)

diff --git a/meta/recipes-devtools/python/python3-docutils_0.22.4.bb b/meta/recipes-devtools/python/python3-docutils_0.23.bb
similarity index 85%
rename from meta/recipes-devtools/python/python3-docutils_0.22.4.bb
rename to meta/recipes-devtools/python/python3-docutils_0.23.bb
index 571a19a958a..91592d470cb 100644
--- a/meta/recipes-devtools/python/python3-docutils_0.22.4.bb
+++ b/meta/recipes-devtools/python/python3-docutils_0.23.bb
@@ -4,7 +4,7 @@ SECTION = "devel/python"
 LICENSE = "CC0-1.0 & BSD-2-Clause & GPL-3.0-only"
 LIC_FILES_CHKSUM = "file://COPYING.rst;md5=ce467b04b35c7ac3429b6908fc8b318e"
 
-SRC_URI[sha256sum] = "4db53b1fde9abecbb74d91230d32ab626d94f6badfc575d6db9194a49df29968"
+SRC_URI[sha256sum] = "746f5060322511280a1e50eb76846ed6bf2342984b2ac04dc42caa1a8d78799e"
 
 inherit pypi python_flit_core
 

