Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E9752C41513
	for <webhook@archiver.kernel.org>; Fri,  4 Aug 2023 17:03:07 +0000 (UTC)
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
 by mx.groups.io with SMTP id smtpd.web11.2714.1691168582865377438
 for <openembedded-core@lists.openembedded.org>;
 Fri, 04 Aug 2023 10:03:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=DoFf9DRn;
 spf=pass (domain: gmail.com, ip: 209.85.214.171, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-1b8b2886364so16735755ad.0
        for <openembedded-core@lists.openembedded.org>; Fri, 04 Aug 2023 10:03:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1691168582; x=1691773382;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=13J7GLS9zH/QD7/xbzIcHWZbCvNHRLz0W09layC+OI4=;
        b=DoFf9DRnXkA0d15Fb9MVzFzp4oG9KNSXXT+0sUd7ZknUihNxps22L8nk5QyP0yrYhN
         Xo8np6R85B3yNY79ZV79QBR8YtdQyY4A6mJ8kkEz4EPGJH+YUyj5cNJPnLL9GeDUXpCU
         SrKHH3LjCuodQDFeZGkT4QtDxBgDWOxZokpkJoAAvx2XjICXCosx6zakPIPSjN7CNocB
         vn20Q5jd01iNKza3s6511j/FePc4imTGGxzAF4eVqKAwFEuK4s/1g/PJNHvAaQZ3YWps
         cdfeoyMY1ztC1X5iQ1C+q3tUi1+bOGRZ2JUDYL5Fq1cD0fg3lQ0bjgeOHe25jGRCuu8+
         /mDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691168582; x=1691773382;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=13J7GLS9zH/QD7/xbzIcHWZbCvNHRLz0W09layC+OI4=;
        b=L3NOMVp7w11Ep4SuQyNJP6UuPrVr6RzxaE9/Tkl9lj0lGQD021r1g3TnVnGYXdQQ2X
         mfFyY8QHg9FW75CicpYJXyHF/dDfaxtV4WFxntjAiF9jDK3gr2H8fDdf2+qgdNnqCXEB
         cc4BpbilD6L2mtwBjXjhE/moA7WTRzC1ET/5WoUd15b0VXiZKT+c6/oN9HJN6jzoXNos
         nuLlEGdunRUFy1y71eT/MeCbZS/pKCQ0spGwtI/tXt0EPEzxEdf74GPIa8E+Ev0hP6jL
         eD0E7nqa0CGzf04pg82ykMTptmHw0eMganBXju4JWt2kIMrBVJUZrZx3+a04WzQF6Dvq
         dXFA==
X-Gm-Message-State: AOJu0YyhgmGnfqqjYo236nGKEu8TENSPNDtuKfdaF1IiPKQ3u+CMIlX+
	fH90YYgj6xVxkIo/tUiCJZ+tcQ/x+WPSKw==
X-Google-Smtp-Source: AGHT+IHS6jEFaOl/7lFpYhBDR1ZltnqaMijWDzj+cVurcX2lMK8qu+z5pqiviKBjUGipdYWDRY3MSA==
X-Received: by 2002:a17:902:c14a:b0:1bc:48dc:d880 with SMTP id 10-20020a170902c14a00b001bc48dcd880mr1881997plj.13.1691168581148;
        Fri, 04 Aug 2023 10:03:01 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9100:2cb0::94c8])
        by smtp.gmail.com with ESMTPSA id v11-20020a170902d68b00b001b50cbc0b4fsm1997876ply.111.2023.08.04.10.03.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Aug 2023 10:03:00 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH v2 4/6] glibc: Enable fortify sources by defaults
Date: Fri,  4 Aug 2023 10:02:53 -0700
Message-ID: <20230804170255.2784609-4-raj.khem@gmail.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230804170255.2784609-1-raj.khem@gmail.com>
References: <20230804170255.2784609-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 04 Aug 2023 17:03:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/185535

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
v2: Rebase

 meta/recipes-core/glibc/glibc_2.38.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-core/glibc/glibc_2.38.bb b/meta/recipes-core/glibc/glibc_2.38.bb
index 851aa612b1e..94bff8f4486 100644
--- a/meta/recipes-core/glibc/glibc_2.38.bb
+++ b/meta/recipes-core/glibc/glibc_2.38.bb
@@ -76,6 +76,7 @@ EXTRA_OECONF = "--enable-kernel=${OLDEST_KERNEL} \
                 --disable-crypt \
                 --with-default-link \
                 --disable-werror \
+                --enable-fortify-source \
                 ${@bb.utils.contains_any('SELECTED_OPTIMIZATION', '-O0 -Og', '--disable-werror', '', d)} \
                 ${GLIBCPIE} \
                 ${GLIBC_EXTRA_OECONF}"
-- 
2.41.0


