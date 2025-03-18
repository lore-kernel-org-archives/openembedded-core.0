Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0ADA5C35FFC
	for <webhook@archiver.kernel.org>; Tue, 18 Mar 2025 04:39:01 +0000 (UTC)
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
 by mx.groups.io with SMTP id smtpd.web11.4305.1742272735832437064
 for <openembedded-core@lists.openembedded.org>;
 Mon, 17 Mar 2025 21:38:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=aT65IJlR;
 spf=pass (domain: gmail.com, ip: 209.85.214.172, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-22423adf751so86703825ad.2
        for <openembedded-core@lists.openembedded.org>; Mon, 17 Mar 2025 21:38:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742272735; x=1742877535; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4Jo6wVv5sH6f+xu5+yscyvr9mQs6TlekCIsEgIMf5Lc=;
        b=aT65IJlRcEkk1aFIBSJh4i6Au5AIKq9Ppb/ON0/Z5Oa8qZ6uhAFW8RZKilTRUbs5pK
         tQIsaYOMid9VB/n87Uw6t3Nj1yHOu9lWSOzeAa2Ig8SGEn59A2ZGAZeVFbNmQ9Nzoqzf
         dMJv5pVYs57nK7Jje8szE5dxU6Rd0IROUGS7vPG9yyFrC3QLcBgEIc5DcM8m6A14L+oe
         7V2BBcHWE7n7djk5RJsjpUKnPEY4KurbcrSfP2oReFV9X1WYln95zQcnIl5K/xsguHaG
         RBNqrk0MgH7PZAuGk5hLpX3AbRdiHOe/dB2MXc9BKyZ+BnjCc3ucAdzBypaAWQQlwPMu
         zSRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742272735; x=1742877535;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4Jo6wVv5sH6f+xu5+yscyvr9mQs6TlekCIsEgIMf5Lc=;
        b=hFQetHTW57K6HH+xWnjnBICOyG4yerE56aqR3SadpI6CZXkY8o4Bi1tJDQ//oJG3gl
         9RxL5vsQEaNkda2fJUn9Y0jwMj1DsxwCRYBQ9nFz1K/oL5eXlJ1Kj3rxumETZsBY3MTO
         B6pu6uKz2M6YMEBaVavzBxZm8b1px+hPTTWa2oRlxR3vWT6ue7a9zEN0Uz7nGXEaLKVl
         2qVVWsRwfOzgkdmkjxY8o5LfSCH07y0+n9MctFO9Gl7q8so7KD1MG+aKXlCCTELikh5u
         ZKqdOH5xbf99sDkBHNRrc7doJpGKThYdIpPeG9KpsLBAmk44f1eFlVSMPEy+4O1LYLxm
         tqRw==
X-Gm-Message-State: AOJu0YwLMmpooxnzb5yu05OhS92dhD9NdjtYs3ySuXMa5i6EL9/vjpq0
	AA/d7/OxbCpf0zwH7MLItmpfIhIGJHI4igY6ukN6I6rjqggLgZ5Igo7ytnAn
X-Gm-Gg: ASbGnct34Tlj5cGS1Ww6jCHP0f2nF/wrs8p9iNkmD/9SQ9wKgh3FO6LMUp7mFhMmO6o
	7s7rLLD8u587wvRpBZgMqDXVPZ229Z8ULncHLhSFRZZVM5TFd844aQbZZ/S3DpFhNxEjx/OIZZY
	bYEMKb52NCQb7YIF+MpzMXuabmtrRdcLzdo0e2vLYydeyMTcTFpQ1C8Gn6B85BJ0/zvNIUJfDJZ
	4S1LbSDHAlvqaSWGHvp3EGA0jcOeQXp5oCPyQyROtNiwksd6cMvb0b0WB0vLFqMeS4x3iqpg4ic
	d8lX49rqJlePC7+JXZoZOlU0t9fWkUAd0uZY
X-Google-Smtp-Source: AGHT+IFy/78eIUgQcGngG8HjLLJ/fpDUG7CfSrnw4VRQQi/7Fcgfj7EYfaq8E5sclHblAzVDRAXQxw==
X-Received: by 2002:a17:903:22c1:b0:223:5c77:7ef1 with SMTP id d9443c01a7336-225e0a75be1mr206207135ad.21.1742272734835;
        Mon, 17 Mar 2025 21:38:54 -0700 (PDT)
Received: from apollo.localdomain ([2601:646:8201:fd20::6874])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-225c6bbc8c6sm84112375ad.160.2025.03.17.21.38.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Mar 2025 21:38:54 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH 06/24] gdbm: Use C11 standard
Date: Mon, 17 Mar 2025 21:38:26 -0700
Message-ID: <20250318043846.2422141-6-raj.khem@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250318043846.2422141-1-raj.khem@gmail.com>
References: <20250318043846.2422141-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 18 Mar 2025 04:39:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/213140

GCC15 is switching defaults to C23 and gdbm is not yet ready to
compile using C23 std.

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-support/gdbm/gdbm_1.24.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/recipes-support/gdbm/gdbm_1.24.bb b/meta/recipes-support/gdbm/gdbm_1.24.bb
index 88f9fa47cf5..8e3cec42957 100644
--- a/meta/recipes-support/gdbm/gdbm_1.24.bb
+++ b/meta/recipes-support/gdbm/gdbm_1.24.bb
@@ -23,6 +23,9 @@ EXTRA_OECONF = "--enable-libgdbm-compat --without-readline"
 # Stop presence of dbm/nbdm on the host contaminating builds
 CACHED_CONFIGUREVARS += "ac_cv_lib_ndbm_main=no ac_cv_lib_dbm_main=no"
 
+# Not yet ready for C23
+CFLAGS += "-std=gnu11"
+
 BBCLASSEXTEND = "native nativesdk"
 
 do_install:append () {

