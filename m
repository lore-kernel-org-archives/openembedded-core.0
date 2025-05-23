Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CF181C54F47
	for <webhook@archiver.kernel.org>; Fri, 23 May 2025 03:52:56 +0000 (UTC)
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
 by mx.groups.io with SMTP id smtpd.web11.41008.1747972373810337843
 for <openembedded-core@lists.openembedded.org>;
 Thu, 22 May 2025 20:52:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=XTQDWJWt;
 spf=pass (domain: gmail.com, ip: 209.85.214.177, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-231e331baceso70158345ad.0
        for <openembedded-core@lists.openembedded.org>; Thu, 22 May 2025 20:52:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747972373; x=1748577173; darn=lists.openembedded.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=J3zFkidn76fOxIPSMoKzPRVTaJ6fuYzuEkpMoGhomTk=;
        b=XTQDWJWt2PZ86iRJZzqsGqGAlp6Jww/WVorUdwbQ/sbWEEJdFxA3ChJI6qcfYYjB0F
         01VjNFoJyVeX5wfR2gfHwKGmeJk4AtHr4OGJUMsk8rXliPLMxpBsjJjml7ps9VJnQFCH
         Zrep3NQghF+yWBcwBfZdG9mFlP0PamMDvZybODQ5UDLBI0fzThNtzUzKuMeWLMOSEVtS
         hAUeo5fKH5lBormPKqsS3AfNI8Te6rxhuObCtTtT+pL6p74OXC5kArD8Z/WVYjsuWUb1
         1/MocIQa9dGvfY2OOKbbmj+vq5OCwRAKgrUYWBFmZTjny+TXS8d2Dagrl9FvpwRFinV5
         +LvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747972373; x=1748577173;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=J3zFkidn76fOxIPSMoKzPRVTaJ6fuYzuEkpMoGhomTk=;
        b=JJ9rSieftOtc+H8lbZu3Fd0kOSh5L5CCJbTnESXB3QLfGq7fPbYFi6GVAoPPCa5lQT
         HmUELMHTgRBlTluspn15Lhj+PQLiiEVY6i5zZF5xcG9ZNGYxa+1+xdhtzJL6jKnZ75Dg
         OKopTpzQH/9QxulWYFTSFFxoFq/L2QsVkUdyrgqfi5dN25xbGwOuN2DU1RY9SWOqTnkA
         2m/83zLhYfxpw6cjeUAmgIJH3XzUzOgPm4QzRDw+5fk6+kGAkz6u0PMfDKmJOyYhReCI
         PG6umkKr1dCvV9RuM/5zOMTeKaTMP9GUxyEGxaQ9ZOWG6/Ee232NhMjLshLJJS2DwtEy
         7h1g==
X-Gm-Message-State: AOJu0Yyx79FUJBRjYLc+vo1w3aOa7I2D3dDVA4N1niTyk66bv9wmXkZ3
	bN3RiKhJnuItYhKEVjyiZbx7SPB/yyOiY2KLJMV6SzYCpxWTyDwdcGB3
X-Gm-Gg: ASbGncvRhodEwNOqHJTjx5H3E+jQuzSzUH6DfzIa+i9Xep7k/UdlxmzhgkEP806T99n
	87m6FgXaAhn/M+Av82y7Aoe85bTGGdaplpMv4pg291iuYEMgtQaJ0LrsGxZf+/viwSlbgiYDZp+
	LjUul+JAM6VU65c+32Z2U/YsoiKpiVZ5A6uwRmJ+PKyZIOawrf7sUqYo72ACbyGgAeVtHE/+s4Z
	olTIaRYDhZxA+E5y21fIpMi2PaauO9zYR70ZOLKmdW2jbjVnMSfnHD8ChK6+LvDrY1d1fS8tRyZ
	x0sgMeJ3hH0rLb76h281JbPtjpczDlrqvoX2eUWt6Z4=
X-Google-Smtp-Source: AGHT+IHQ9kjVswuPV724LLYKN9lbsfFgm4r9dAIN2jbyXe2vnE2p6kb+jDKh4eMtLSYK9ACDLf3JpA==
X-Received: by 2002:a17:902:ced2:b0:223:44c5:4eb8 with SMTP id d9443c01a7336-233f25f40bdmr21421115ad.32.1747972373017;
        Thu, 22 May 2025 20:52:53 -0700 (PDT)
Received: from apollo.localdomain ([2601:646:8201:fd20::5f56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-231ecd5ea41sm107181155ad.228.2025.05.22.20.52.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 May 2025 20:52:52 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 22 May 2025 20:52:44 -0700
Subject: [PATCH v3 10/13] systemtap: Pin to build with GCC
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250522-clang-toolchain-v3-10-16cfc6d9891b@gmail.com>
References: <20250522-clang-toolchain-v3-0-16cfc6d9891b@gmail.com>
In-Reply-To: <20250522-clang-toolchain-v3-0-16cfc6d9891b@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
X-Mailer: b4 0.14.2
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 23 May 2025 03:52:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/217170

clang find a lot of warning

| In file included from ../git/tapset-procfs.cxx:11:
| ../git/session.h:169:47: error: 'used' attribute ignored on a non-definition declaration [-Werror,-Wignored-attributes]
|   169 |   static const char* morehelp __attribute__ ((used));
|       |                                               ^

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-kernel/systemtap/systemtap_git.bb | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta/recipes-kernel/systemtap/systemtap_git.bb b/meta/recipes-kernel/systemtap/systemtap_git.bb
index 21d50ffb04977bdd9666fbabb5e27289aff01370..254bac4d6f9c8637c575b4b7896322bd42e96841 100644
--- a/meta/recipes-kernel/systemtap/systemtap_git.bb
+++ b/meta/recipes-kernel/systemtap/systemtap_git.bb
@@ -99,3 +99,7 @@ do_install:append () {
 }
 
 BBCLASSEXTEND = "nativesdk"
+
+# Emits lot of warning which are treated as errors
+# They must be looked into before disabling
+TOOLCHAIN = "gcc"

-- 
2.49.0


