Return-Path: <tgamblin@baylibre.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A7AEED5B854
	for <webhook@archiver.kernel.org>; Tue, 29 Oct 2024 00:30:27 +0000 (UTC)
Received: from mail-qv1-f47.google.com (mail-qv1-f47.google.com [209.85.219.47])
 by mx.groups.io with SMTP id smtpd.web10.8380.1730161822126242649
 for <openembedded-core@lists.openembedded.org>;
 Mon, 28 Oct 2024 17:30:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@baylibre-com.20230601.gappssmtp.com header.s=20230601 header.b=SsOuUEwe;
 spf=pass (domain: baylibre.com, ip: 209.85.219.47, mailfrom: tgamblin@baylibre.com)
Received: by mail-qv1-f47.google.com with SMTP id 6a1803df08f44-6cc1b20ce54so41097616d6.0
        for <openembedded-core@lists.openembedded.org>; Mon, 28 Oct 2024 17:30:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1730161821; x=1730766621; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yvQbGwDVnZS/z9xThKaDuzNJTfC9Quz3vCmyDK2+No0=;
        b=SsOuUEwe+lDu/FwgFa91a1j5+wNsW4xJ8eCWX6Z4BAfjMb6QgBknp8+789/hCOA0M2
         0x085UsqrPCg5Of6R/1zYilmI5xfM0qryASWW9ux5FEzKtb0PrBxvDID7h7WF1c5PbxF
         GxafO0ng/CsDsWVAMYLGpC6wY+i0mxvMhHNgZ5RW1CtrCJMMCtweYgJrNfwK7drl6dL+
         1E/iDgmc1DosNVKbOj0YCmvMswCitwvBWXIl0V4WmXX6SEXLFa1mLHRUGds4EK6FW8Nm
         m3WziW/3G/fXsqz1KU8LAqL4T2OYhLWl2MUBERXk3DpHHfgROrCuCdXNSEC7bxU/eLrw
         iw8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730161821; x=1730766621;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yvQbGwDVnZS/z9xThKaDuzNJTfC9Quz3vCmyDK2+No0=;
        b=TUp14niq5AJrb0h39hjzb2kr28QhNv+gGWsMmB1EsXBeeRYlNvTf+drX8jWzLcsTiF
         xTx4T3VQVG7/VnT2px28of09QBa0TgchnrN3WsleQWkUmppUP7tz2rFwn30vlNU9Pk17
         IkG8JcNkukuWIipHAra1HuIE+Tbpixv9RdryNmKkVMtb/9ZYTxxvJ6DdXaLmvW6hwakx
         Pzh2kyraCX0Ym2a2y3ZCnf3nj3YTv3nZjoKd5cbEob63/RuJGbMXUOOXlayLVBKusrEM
         jT51lvveS7BHEwYLw7kdysQtV7YAdBAPD1+jD6wqogs/N+wns+cEWxRFdcx913WuPxxc
         0hPg==
X-Gm-Message-State: AOJu0Yx6U+nJaqzb1cQFqLRb20HiLDr5WB72AK4+htrc2niaF02c6Jck
	IdGvAduYhlQmduM+cXiRosjZvPfihknVCiyKFaqE2ddQL+ik2QEO0vz6XT7jJNJMkfOyPg5GhHG
	F
X-Google-Smtp-Source: AGHT+IEHIh49+BkDZcZGf2U1LXWVSc3FY7yUlfSQGZW/3S6fn8HSKVsSQ89l7u1JALySbRWHYbth1w==
X-Received: by 2002:a05:6214:5c01:b0:6cb:82fc:2741 with SMTP id 6a1803df08f44-6d185875710mr186737266d6.49.1730161820935;
        Mon, 28 Oct 2024 17:30:20 -0700 (PDT)
Received: from megalith.oryx-coho.ts.net (d24-150-219-207.home.cgocable.net. [24.150.219.207])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6d17972f55bsm37361556d6.26.2024.10.28.17.30.20
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Oct 2024 17:30:20 -0700 (PDT)
From: Trevor Gamblin <tgamblin@baylibre.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][PATCH 2/2] bind: upgade 9.20.2 -> 9.20.3
Date: Mon, 28 Oct 2024 20:30:18 -0400
Message-Id: <20241029003018.3485308-2-tgamblin@baylibre.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20241029003018.3485308-1-tgamblin@baylibre.com>
References: <20241029003018.3485308-1-tgamblin@baylibre.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 29 Oct 2024 00:30:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/206469

Changelog: https://downloads.isc.org/isc/bind9/cur/9.20/CHANGES

Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
---
 .../bind/{bind_9.20.2.bb => bind_9.20.3.bb}                     | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-connectivity/bind/{bind_9.20.2.bb => bind_9.20.3.bb} (97%)

diff --git a/meta/recipes-connectivity/bind/bind_9.20.2.bb b/meta/recipes-connectivity/bind/bind_9.20.3.bb
similarity index 97%
rename from meta/recipes-connectivity/bind/bind_9.20.2.bb
rename to meta/recipes-connectivity/bind/bind_9.20.3.bb
index 02401b6c4d5..a77b030427e 100644
--- a/meta/recipes-connectivity/bind/bind_9.20.2.bb
+++ b/meta/recipes-connectivity/bind/bind_9.20.3.bb
@@ -20,7 +20,7 @@ SRC_URI = "https://ftp.isc.org/isc/bind9/${PV}/${BPN}-${PV}.tar.xz \
            file://0001-avoid-start-failure-with-bind-user.patch \
            "
 
-SRC_URI[sha256sum] = "a31dba2aaa1b371902dd0474eb3963f47b7ffed2bd9ece7da4834e23210d6067"
+SRC_URI[sha256sum] = "f90c2da1621299f56a2e6585a6fe459ec3efd6f2fdf84a8fbf31b40be7698a73"
 
 UPSTREAM_CHECK_URI = "https://ftp.isc.org/isc/bind9/"
 # follow the ESV versions divisible by 2
-- 
2.39.5


