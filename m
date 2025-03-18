Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 355E6C35FFB
	for <webhook@archiver.kernel.org>; Tue, 18 Mar 2025 18:39:06 +0000 (UTC)
Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
 by mx.groups.io with SMTP id smtpd.web11.2878.1742323141266738614
 for <openembedded-core@lists.openembedded.org>;
 Tue, 18 Mar 2025 11:39:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=PCMNeqcR;
 spf=pass (domain: gmail.com, ip: 209.85.216.47, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-2ff6a98c638so6917608a91.0
        for <openembedded-core@lists.openembedded.org>; Tue, 18 Mar 2025 11:39:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742323140; x=1742927940; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Qc6/+KXa5zJlOJ1+/3NMnaKQLW7j5GiiXOdzk+yFN/I=;
        b=PCMNeqcRPyqLU3ts2WrCjDHrIzIYBDChO+LktvIcz27GJjD20eAn7CuYJSqBQKtY3v
         0OBQG+PxgKOEt9PxlUzh92EsuLG6PNRDfwu72acYGgyYRj2V9omkAhpccbypoPrAmYaH
         ZJMqkc+6yvGJHQb65Gz3pvffpaU9+dkpk5DsHMH65njrC2OrVg9TfIrU88A/MskwBxio
         RpAw1WxP7fcdTmA76aQSUYmGSnkAhDVX/lxtGPbFEpoyKXxo2kvlr5WPAke6mdc2U2ad
         mNT9JOrrkOFIdoobBSqUXeUDTPCTY1E9ArJUtYdq2UaLn7Tp+D3nOEfRJRwmCHN2Q/ip
         PMcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742323140; x=1742927940;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Qc6/+KXa5zJlOJ1+/3NMnaKQLW7j5GiiXOdzk+yFN/I=;
        b=XZIunWmHKdTCKTMUNnqqqn2868GgTc2NuI2W6zJhuje6nKz7PK1ihJX2qwzCUVPZBo
         FsmCGHkKpSxqbKWnfH8eyFnjou7cmaZ+tnaqOuG0skD1m9+NhDKJrBb8gxVojv94FXo9
         vURanoYUjqPJcGTZYwn8RNJL+Z4LC7N3ed517SqaRCqobHuJKJplC1edRAlJzwIfYps/
         PWUhTCphgFfNpEtkvSlxmWV1w4gXuK4DDlias27i/BibDDkaiqrUqVs+/HkII3maHqRJ
         Lc5blfL11MyIRFIYWP/Urzi/xNV7qshGdF7L9ZMjvHhl/TnDx+fFH9BdxnjTCm3jjA0B
         9DvA==
X-Gm-Message-State: AOJu0YyXFYy4EPKlK2PvtD7sGjA3MupjtMEdIrJcSjiFGccOLNaxLMZe
	2MrvrXUtbE3+0XzVd2+RzK6YB9yOiY62JiuhkgaH0okOzV/g5WsK+hrsIcJG
X-Gm-Gg: ASbGnctqhMpAmW8cOzqKmTYE23VcYkZXPMOwqA4YIUGxlNqHt6guOVA6ncnAver0Ybw
	IeXsXgvIweSsOOjJn/azZeLUOTd4yeLsHhgz/lb5otKyCl7zKn8My7bg9ida1zVm9b1ujHMK24u
	4No1wqG0SbeZCIIxLI3Xv8iUX7JHzx6zHrF85H4eg1mK4zZPgleSK4iL7Qp00k7ml34fVyjIhk+
	QnlVoyTIkfrXj5zvqoa8CXxHKem2jZpaECychLrIe8AayTP9vJ+ClIkDHZdQrR7eF9L3s6vw79m
	mmctECh5qZgQe8YPjwitcUM+zJoWv36S2oZs
X-Google-Smtp-Source: AGHT+IGl0u1OdWVVyH9pZnOUBbSryQ7o61Qz2kXMWkMAwSGd/24NeqD3UiG/HcQgSTWOoh3wqa4JsQ==
X-Received: by 2002:a17:90b:4a8d:b0:2ff:6f88:b04a with SMTP id 98e67ed59e1d1-301ba0f5720mr405774a91.15.1742323140431;
        Tue, 18 Mar 2025 11:39:00 -0700 (PDT)
Received: from apollo.localdomain ([2601:646:8201:fd20::6874])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-30153afee51sm8537489a91.28.2025.03.18.11.38.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Mar 2025 11:39:00 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [[PATCH v2 19/25] expect: Fix build with GCC 15
Date: Tue, 18 Mar 2025 11:38:34 -0700
Message-ID: <20250318183842.2256284-19-raj.khem@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250318183842.2256284-1-raj.khem@gmail.com>
References: <20250318183842.2256284-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 18 Mar 2025 18:39:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/213245

Stick to C17 standard as GCC 15 switches to C23

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-devtools/expect/expect_5.45.4.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-devtools/expect/expect_5.45.4.bb b/meta/recipes-devtools/expect/expect_5.45.4.bb
index 65f717cc5f7..010e18dd24a 100644
--- a/meta/recipes-devtools/expect/expect_5.45.4.bb
+++ b/meta/recipes-devtools/expect/expect_5.45.4.bb
@@ -42,6 +42,8 @@ S = "${WORKDIR}/${BPN}${PV}"
 
 EXTRA_AUTORECONF += "--exclude=aclocal"
 
+CFLAGS += "-std=gnu17"
+
 do_install:append() {
     mv ${D}${libdir}/expect${PV}/libexpect*.so ${D}${libdir}/
     install -m 0755 ${S}/fixline1 ${D}${libdir}/expect${PV}/

