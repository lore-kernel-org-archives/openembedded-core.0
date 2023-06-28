Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9FBB7C001B1
	for <webhook@archiver.kernel.org>; Wed, 28 Jun 2023 02:30:34 +0000 (UTC)
Received: from mail-ot1-f50.google.com (mail-ot1-f50.google.com [209.85.210.50])
 by mx.groups.io with SMTP id smtpd.web10.7305.1687919430774260406
 for <openembedded-core@lists.openembedded.org>;
 Tue, 27 Jun 2023 19:30:30 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@sakoman-com.20221208.gappssmtp.com header.s=20221208 header.b=jf25PQnG;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.50, mailfrom: steve@sakoman.com)
Received: by mail-ot1-f50.google.com with SMTP id 46e09a7af769-6b5ef64bca6so4950889a34.3
        for <openembedded-core@lists.openembedded.org>; Tue, 27 Jun 2023 19:30:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20221208.gappssmtp.com; s=20221208; t=1687919429; x=1690511429;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=eUe0BGnlWMtGsqzRzu42/T4ppbWpFgFl7c/LsI1RMdQ=;
        b=jf25PQnGz3pQzPRTJgxgyELT/34GbT1WRux9fIhPrGNvlr7YyETM0+OyHGs2fn3qUl
         JZC1LmVnVmIYikbsM/r0tC3pFjK/KNBC4b7Sf5k1hsRfLQ/qlO4JCFSac86JVPs8Ee9I
         BKXmx9AqX7LG8UxIXyxBMIguox1QxT4rrwTZyHP1x9Ijo99g7AwELHsw4pThQBCWormu
         gxoqeH67HtyvX+EpxIvZokaUxY3U01trnLCUHBNvU1HyIFWfuInKYArjtz0YXl/iYeGG
         CB/AlbwNi0MyCwfOkKBgEAqtD7hLuOgwzUeYTMOHQ2fUnxuM98wG7QsmoKgFQLZOA7Qi
         cRDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687919429; x=1690511429;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eUe0BGnlWMtGsqzRzu42/T4ppbWpFgFl7c/LsI1RMdQ=;
        b=H099jwBEpSJ4rbNlLVdy+gwpRHOon8+fvGK7DErE6Zx0s0YIK96SumfZVQFG71hSyx
         mDu+6pqup/EQdmvITpYM/3ppMXW7d7Yr1HD0qCT0j7NaDnc/5WKi+0FHOsCTs4PmKR1j
         lEmffKdu1hvqwNkNZVuxEDc3KAgh/gYCoFniPzJP2mgFEJVt81R14xiq79nhSsLn8J0q
         IHWm267F1hnX/a0nKNZRuDzVFBhO8rghEju8vj3wEocOD1p+z75H0cEAI67GTKVEfa9Y
         XTdmvdg6Wiq2kqXpA+XGa/iZjsLUTGXFpdVr5KgEWRePytk8C2+CHGJcPgkduC8ILn02
         4IKA==
X-Gm-Message-State: AC+VfDzMK7XNdp/cQkh3MIa2g7b220SIQ81kAf9EouH+DnSnMim76y+X
	xbOtBX+9DaSEYeUqwwcbutHobs+n+sXT7iGR72SBWQ==
X-Google-Smtp-Source: ACHHUZ4qrt0dL12HnfVC9xruTvjVMncsmtX2LXa1FN6HP7DlQDXv7ALHB0Q9eE0qNwOyKhhs5KhcyA==
X-Received: by 2002:a05:6359:2ea0:b0:134:c37f:4b63 with SMTP id rp32-20020a0563592ea000b00134c37f4b63mr5061309rwb.2.1687919429572;
        Tue, 27 Jun 2023 19:30:29 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id c18-20020a62e812000000b0063d2d9990ecsm1568666pfi.87.2023.06.27.19.30.28
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Jun 2023 19:30:29 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][mickledore 21/30] openssl: fix building on riscv32
Date: Tue, 27 Jun 2023 16:29:37 -1000
Message-Id: <1add2c6c2a5009d6a73790e1334e7e113ac97f4d.1687919241.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1687919241.git.steve@sakoman.com>
References: <cover.1687919241.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 28 Jun 2023 02:30:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/183530

From: Dmitry Baryshkov <dbaryshkov@gmail.com>

On riscv32 configurations OpenSSL fails to build with "undefined
reference to `__atomic_foo'" kind of errors. Change OpenSSL recipe to
use linux-latomic configuration instead of linux-generic32.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit e8ce80fc6d6579554bca2eba057e65d4b12c0793)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-connectivity/openssl/openssl_3.1.1.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-connectivity/openssl/openssl_3.1.1.bb b/meta/recipes-connectivity/openssl/openssl_3.1.1.bb
index dca6f18e74..f5f3f32a97 100644
--- a/meta/recipes-connectivity/openssl/openssl_3.1.1.bb
+++ b/meta/recipes-connectivity/openssl/openssl_3.1.1.bb
@@ -118,7 +118,7 @@ do_configure () {
 		target=linux-ppc64le
 		;;
 	linux-riscv32)
-		target=linux-generic32
+		target=linux-latomic
 		;;
 	linux-riscv64)
 		target=linux-generic64
-- 
2.34.1


