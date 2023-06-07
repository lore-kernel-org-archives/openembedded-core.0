Return-Path: <pramanik.souravkumar@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4D949C77B7A
	for <webhook@archiver.kernel.org>; Wed,  7 Jun 2023 11:44:37 +0000 (UTC)
Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
 by mx.groups.io with SMTP id smtpd.web11.6215.1686138273622182673
 for <openembedded-core@lists.openembedded.org>;
 Wed, 07 Jun 2023 04:44:33 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=LdMTJkLq;
 spf=pass (domain: gmail.com, ip: 209.85.210.180, mailfrom: pramanik.souravkumar@gmail.com)
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-653436fcc1bso2963179b3a.2
        for <openembedded-core@lists.openembedded.org>; Wed, 07 Jun 2023 04:44:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1686138272; x=1688730272;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=DLedF0YIeAXTbnCZTeLY2F4Hi2Ev6PQgRzhTgULgsx0=;
        b=LdMTJkLq7EIU1X3NfZ5vHp/l3IM09iNo3KUp3Ltc/JGa6UkQgzQj9fVCid4kXVSCQK
         n5dejSeAKgLe0eUUKLwT4bziRGKanKGngJBWVuP4kOturbDbrAsnOhkuv+SoVRPmW4Eg
         Uz7Bw5+KEHSNE85pZMCN11akdvdU6DjosBDn3SSuFhlTpUjlGhXJwjPhaGj5WGmOMv8r
         rbRyddLuN0GB4ZE3ovfQ7PtHQecGcL/MMDVbE87IbZwfW/z6bat2fZcDKHkm9w617zEl
         tqNZQJUE9h8juEl9RgmBHeo9Udny2FoGa6HXGouT2s9JhXjAF3GapZU5Syou1jh/+bk+
         ml7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686138272; x=1688730272;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DLedF0YIeAXTbnCZTeLY2F4Hi2Ev6PQgRzhTgULgsx0=;
        b=enHBpho1mCjN2CqcD0jE3Q9SJYzql0V64LKjaZfa+mFV0AEcV3fbfIWIU8L4xQ2f+F
         NkW0fi6XP0vP7X6nel3urvwdxZLJ8jC1XJV7frgr5XhXnTO5ShzngeN0iJ4oERHk+sog
         KMEvPgd4kfAHEYSjylQVOGjcJlwrI0P7QLGob5NTqO/THBashv0gyW8KEzTmCi7pSi74
         ehfJtU0t+bWlagqkPmoXy3FT/O0bBW4hqI3ZUudZZVwNnnYRaAZH9Hdil5+5kAXa8/xu
         de1cKVRz84zEpwkSypmE+MYXum3HpPSdSuPAsOvfgTALGYMGc4ULAyyoub1B96m5KuoR
         6gmQ==
X-Gm-Message-State: AC+VfDyqG3ykqd4bb62atS55289XDWKIy03J702xAUqA+CWhtAhWtA1m
	Nv5mQBnDGMWXUZCpRcezbez7IQlj+lA=
X-Google-Smtp-Source: ACHHUZ7I+yLrA8pB56w/xd7unczKVwQkbBK0vC0yDEXh8096ahqjCmn0ySXefCWtMNjeYlsDRXsvOg==
X-Received: by 2002:a05:6a00:1252:b0:660:523a:8fef with SMTP id u18-20020a056a00125200b00660523a8fefmr1794801pfi.13.1686138272238;
        Wed, 07 Jun 2023 04:44:32 -0700 (PDT)
Received: from localhost.localdomain ([2409:4061:60f:af7a:6c57:a850:72d2:c0d9])
        by smtp.gmail.com with ESMTPSA id l3-20020a6542c3000000b005307501cfe4sm8210840pgp.44.2023.06.07.04.44.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Jun 2023 04:44:31 -0700 (PDT)
From: Sourav Kumar Pramanik <pramanik.souravkumar@gmail.com>
To: openembedded-core@lists.openembedded.org,
	pramanik.souravkumar@gmail.com
Cc: ranjitsinh.rathod@kpit.com,
	Omkar Patil <omkar.patil@kpit.com>
Subject: [OE-core][kirkstone][PATCH] curl: Correction for CVE-2023-27536
Date: Wed,  7 Jun 2023 17:11:50 +0530
Message-Id: <20230607114150.53535-1-pramanik.souravkumar@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 07 Jun 2023 11:44:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/182471

From: Omkar Patil <omkar.patil@kpit.com>

Correction of backport link inside the patch with correct commit link as
below
Link: https://github.com/curl/curl/commit/cb49e67303dbafbab1cebf4086e3ec15b7d56ee5

Signed-off-by: Sourav Kumar Pramanik <pramanik.souravkumar@gmail.com>
---
 meta/recipes-support/curl/curl/CVE-2023-27536.patch | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-support/curl/curl/CVE-2023-27536.patch b/meta/recipes-support/curl/curl/CVE-2023-27536.patch
index fb3ee6a14d..d3d1d2dc2e 100644
--- a/meta/recipes-support/curl/curl/CVE-2023-27536.patch
+++ b/meta/recipes-support/curl/curl/CVE-2023-27536.patch
@@ -3,10 +3,11 @@ From: Daniel Stenberg <daniel@haxx.se>
 Date: Fri, 10 Mar 2023 09:22:43 +0100
 Subject: [PATCH] url: only reuse connections with same GSS delegation
 
-Upstream-Status: Backport from [https://github.com/curl/curl/commit/af369db4d3833272b8ed443f7fcc2e757a0872eb]
+Upstream-Status: Backport from [https://github.com/curl/curl/commit/cb49e67303dbafbab1cebf4086e3ec15b7d56ee5]
 CVE: CVE-2023-27536
 Signed-off-by: Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
 Signed-off-by: Siddharth Doshi <sdoshi@mvista.com>
+Signed-off-by: Sourav Kumar Pramanik <pramanik.souravkumar@gmail.com>
 ---
  lib/url.c     | 6 ++++++
  lib/urldata.h | 1 +
-- 
2.25.1


