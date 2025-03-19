Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8A163C36004
	for <webhook@archiver.kernel.org>; Wed, 19 Mar 2025 08:16:49 +0000 (UTC)
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
 by mx.groups.io with SMTP id smtpd.web10.2937.1742372205079846865
 for <openembedded-core@lists.openembedded.org>;
 Wed, 19 Mar 2025 01:16:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=BHfXqlir;
 spf=pass (domain: gmail.com, ip: 209.85.214.181, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-223594b3c6dso141401805ad.2
        for <openembedded-core@lists.openembedded.org>; Wed, 19 Mar 2025 01:16:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742372202; x=1742977002; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VPHM28uBdjpHooxMXjSAs93HbFmeeD990oxPLiAte2E=;
        b=BHfXqlir24ZU+CvbvczFNCO7h35p2CneBuely6adgkZOCnokpi/dWvNDThfv9WFuKC
         hk0Bv6GQliBz95DbaMFBKqpM+Je0euTBMExQuofYW3HEyaopLnAU3yNMhc2xMykin/BU
         THA8LMlzreKAXCyTESNg38eS+tXtsdrcxwDiLkBuoJUrqMPwwn43M26IDPuOrzhUaRtO
         00WiXqozeW/PDZA0KQE39TObshwbu06PeAlhY1V7yQDepQSyMLSA8mKzGfwhpSo8I47B
         T9u26EE2EjiK9jgteJvh7ADHUAVYZBUpaEnGB4QmKyiYaCITswvcVlkg91ndZq1dmrpV
         YJsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742372202; x=1742977002;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VPHM28uBdjpHooxMXjSAs93HbFmeeD990oxPLiAte2E=;
        b=wwsfdb9DiTY3TMRN1S/dU0kuI3PmNGxniETcpjwKvm9efM/NHYId8SPUTBpxcl9wVM
         JNoOlV9nqkOegrSO4Sqw3LNnibFu5kE/qQ4MTFzOkCztxW9X19FwkBmjN/zqvru8DtEE
         FIm6jX6Khp9s/SNsuBQsmjckMKMsu2i11kKMMxYWJhClxVjeZWfJueqL3FzVHrILeyTF
         1VEpcxZhM7AWhT8c7E4eDRmHKkkUsoIXWaGfOHQbaUA6m8jtd87Q+f+WVF+SRZh/oVQE
         9Lbkg7C1QQgZRBi3t+vHIjwH+VLIZtNF2An/uQl31JAcCWOunzXFTU5ZT126XoYIM3dI
         yUGg==
X-Gm-Message-State: AOJu0Ywso4cev7aXzJZSbIVvKIAcvrrIqdMNz30VX7vJ76WN4QClTIAh
	vJgZXtJr0VU56eXf4xXeGBiCwGaZ59nqWWRvPvuU7alr6ZqDNT3n4pgKLXBB
X-Gm-Gg: ASbGncvVpGbb0Wa4SOTafGhnpdQfz2aOxbQjsIIDAL7T3ee36mbkVsvq+QnYMcGgoy2
	TgkTC1K+ISYrgd3ou/xgfUMf7ToGmf7a6z0IuEwTq7/y0p6anB3DZsWHi2BDAIOd4STgi8S2jwU
	xdy97CKkw1pdC8g/NHycm/FDFqcakRiY08ZfPF3SyL88s5FdeArmlsE/FE2ivPDy7EAsjpZdniJ
	NYfPIzvOZKMeuqLJ2oN3jcOSDRGSxm7ur+ZnsxK8r7krVcThAhDzpmyOuQECQdgV2qlnJDtvz4d
	fXM0o2BeNGFIqz0L0QRbNDb2tc/fRtSmiYqQ
X-Google-Smtp-Source: AGHT+IEXMILfNTDJCntYx8X3p+sMNzj/cKBhD+SogOAGuZW7OZoY9dVcLge9sX7ecUXbd+fzp9GRMw==
X-Received: by 2002:a05:6a20:7f87:b0:1f5:8f65:a6f5 with SMTP id adf61e73a8af0-1fbecd36d77mr3520243637.30.1742372201616;
        Wed, 19 Mar 2025 01:16:41 -0700 (PDT)
Received: from apollo.localdomain ([2601:646:8201:fd20::ac74])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-af56e9c95c5sm8704323a12.4.2025.03.19.01.16.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Mar 2025 01:16:41 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [[PATCH v2 23/25] at: Remove mktime signature from posixtm.c
Date: Wed, 19 Mar 2025 01:16:02 -0700
Message-ID: <20250319081610.3536475-34-raj.khem@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250319081610.3536475-1-raj.khem@gmail.com>
References: <20250319081610.3536475-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 19 Mar 2025 08:16:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/213303

This is in conflict with signature from system time.h

extern time_t mktime (struct tm *__tp) __THROW;

GCC-15 with C23 on, this is treated at error

 posixtm.c:45:8: error: conflicting types for 'mktime'; have 'time_t(void)' {aka 'long int(void)'}
|    45 | time_t mktime ();
|       |        ^~~~~~
|

config.h is local include file to use quotes to include it

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-extended/at/at/posixtm.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/meta/recipes-extended/at/at/posixtm.c b/meta/recipes-extended/at/at/posixtm.c
index 5514ba4fe26..bba8312d9a8 100644
--- a/meta/recipes-extended/at/at/posixtm.c
+++ b/meta/recipes-extended/at/at/posixtm.c
@@ -20,7 +20,7 @@
 /* Yacc-based version written by Jim Kingdon and David MacKenzie.
    Rewritten by Jim Meyering.  */
 
-#include <config.h>
+#include "config.h"
 
 #include "posixtm.h"
 
@@ -42,8 +42,6 @@
    of `digit' even when the host does not conform to POSIX.  */
 #define ISDIGIT(c) ((unsigned int) (c) - '0' <= 9)
 
-time_t mktime ();
-
 /*
   POSIX requires:
 

