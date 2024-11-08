Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6CA28D5C0E1
	for <webhook@archiver.kernel.org>; Fri,  8 Nov 2024 14:54:25 +0000 (UTC)
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
 by mx.groups.io with SMTP id smtpd.web10.14269.1731077658196845253
 for <openembedded-core@lists.openembedded.org>;
 Fri, 08 Nov 2024 06:54:18 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=foMrh5LH;
 spf=pass (domain: gmail.com, ip: 209.85.128.50, mailfrom: martin.jansa@gmail.com)
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4314c452180so19391775e9.0
        for <openembedded-core@lists.openembedded.org>; Fri, 08 Nov 2024 06:54:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1731077656; x=1731682456; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=p0kKthACGJ5YUggGRh1Ij12Kb2nIUUZqPRA7oImLTcE=;
        b=foMrh5LHR9pRzTCukQS7VbMuJDbJbmzfwVcVcLkhcitsm+Ps+2RNr6JfnZ9wnFcPe9
         R2FCeQm+S7SGysjV1jiXFaeWuKyQS15q8+ubSfPr8YwmZUpiMjCf+JCVCYj3N5khfr88
         Li9AtgcpaDJAzp5PMDI1D7jrnPltt7mcShkDshbNtk7hd+8pm6RbDBkjWfS5tseVLg5W
         XsHhJrnSYccBXhq5vGRPs5zPwk4omVTwKa2UupVzIZz2ygEJAK1cHR9QsyAnqsd+iuMs
         R1LLs/b2182O92OrF3412tjrB0dM70W8tbQ43o6rAr516vyIf1kAsi6f7JVbHrqhhJdK
         7Gdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731077656; x=1731682456;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=p0kKthACGJ5YUggGRh1Ij12Kb2nIUUZqPRA7oImLTcE=;
        b=bDMbPQU9t9PQYABLuu7iyaWz8PMtYqR8JcA86sL3yraeRBxQdIzM8TOV1jTL/XggNF
         16RMDzvdl0ddmCVAsjfObj2QBO9Q28Pr6uEShXXzgLvKwiC3biJbumn3Gu2hh+VYxGwV
         BTnR1h/WCe/UTSv9bJB0zR+PDAwe2TWcwIoBHzxhTtchjODNvKkQo20nH7709WcQW2hO
         kWBl/M3Y7891wbyRs3By4w57QOIabmeG3gq90wdm55ar3H9o/chRwC0RDtY9IPYODJYn
         ZeNRJKW2K0EyZvOQcYkOQs4sU1DDLv5lxgcPA/tn5DAvTnXESh2NoH+LQTU1fu65rd/2
         vfcQ==
X-Gm-Message-State: AOJu0YyFruFRXrRNcUpxtucSr5oWmAlSFjRv1mBHgbwxkD6oJGisZqup
	GQVLGdtLi7nLb8sQhAyGctod056rt9lXv62khr2I+oZDq+uzd6oYn/CoJg==
X-Google-Smtp-Source: AGHT+IHvWcOmp/Pha0O9RpBwDd5jepRzSLeP5D1w4CNeY6fLVARbhjsjM68yH7SF67jlCowYw2Zjcg==
X-Received: by 2002:a05:6000:1569:b0:37d:4660:c027 with SMTP id ffacd0b85a97d-381f0f87207mr3539402f8f.24.1731077656434;
        Fri, 08 Nov 2024 06:54:16 -0800 (PST)
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-381ed9f8827sm5244228f8f.72.2024.11.08.06.54.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 Nov 2024 06:54:15 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: steve@sakoman.com,
	Richard Purdie <richard.purdie@linuxfoundation.org>
Subject: [kirkstone][PATCH 12/12] pseudo: Fix envp bug and add posix_spawn wrapper
Date: Fri,  8 Nov 2024 15:53:36 +0100
Message-ID: <20241108145336.224466-12-martin.jansa@gmail.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241108145336.224466-1-martin.jansa@gmail.com>
References: <20241108145336.224466-1-martin.jansa@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 08 Nov 2024 14:54:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/206886

From: Richard Purdie <richard.purdie@linuxfoundation.org>

Fix pseudo with python 3.13 by adding a wrapper for posix_spawn and
fixing a NULL pointer dereference in envp handling it uncovered. This
fixes issues on Fedora 41.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-devtools/pseudo/pseudo_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/pseudo/pseudo_git.bb b/meta/recipes-devtools/pseudo/pseudo_git.bb
index b390ca7db9..405d2340ae 100644
--- a/meta/recipes-devtools/pseudo/pseudo_git.bb
+++ b/meta/recipes-devtools/pseudo/pseudo_git.bb
@@ -14,7 +14,7 @@ SRC_URI:append:class-nativesdk = " \
     file://older-glibc-symbols.patch"
 SRC_URI[prebuilt.sha256sum] = "ed9f456856e9d86359f169f46a70ad7be4190d6040282b84c8d97b99072485aa"
 
-SRCREV = "374089f2ed83da4d0d4e58df067142ff99c7eb12"
+SRCREV = "28dcefb809ce95db997811b5662f0b893b9923e0"
 S = "${WORKDIR}/git"
 PV = "1.9.0+git${SRCPV}"
 
-- 
2.47.0


