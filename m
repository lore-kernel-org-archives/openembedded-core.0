Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3405DC4167B
	for <webhook@archiver.kernel.org>; Sat,  2 Dec 2023 00:09:53 +0000 (UTC)
Received: from mail-oa1-f47.google.com (mail-oa1-f47.google.com [209.85.160.47])
 by mx.groups.io with SMTP id smtpd.web10.8232.1701475786757898757
 for <openembedded-core@lists.openembedded.org>;
 Fri, 01 Dec 2023 16:09:46 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=nJPixsfU;
 spf=pass (domain: gmail.com, ip: 209.85.160.47, mailfrom: raj.khem@gmail.com)
Received: by mail-oa1-f47.google.com with SMTP id 586e51a60fabf-1fadb9ac169so709670fac.0
        for <openembedded-core@lists.openembedded.org>; Fri, 01 Dec 2023 16:09:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1701475786; x=1702080586; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=0ebARQNMnwWoCuOES3xB7Ct/RENWzl9m9QmoPmUotyI=;
        b=nJPixsfU3CT21Ap9ggCfjvxdiNtU4EI1o/2DYr/La+sQr+m5th0JNJ7MG/B1Ajbgq7
         HE0DZq5P6g4wQmAvImcmtiEJOrjXQQlKgvuOvZIlcECVvS++NdkZspdcWoKJmKl4+Zvi
         26oacrpWo5DfhydkSNNCpodO+XC3UvMCtAhgaKujR0l1Q7cJhpcUIfhdRESCsOM9S+50
         48wUZhA4IarySD+J15unTwvWm57k11jDbhgWpWuAaML9r1NzbwbGdn9SVUfd2VLuysjP
         nr3d0vTW7PorLgm2uG6P+aBcUrI+ciY9cQSxctd0txT72f7Wc0kJ15DJ8B3KGwRIOoE/
         aG7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701475786; x=1702080586;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0ebARQNMnwWoCuOES3xB7Ct/RENWzl9m9QmoPmUotyI=;
        b=Qmglhp1uMoXj4ThgyNIv+kwyLTtmG4O7+FLDIxOW+rHNmsR0POLffKrcyv8bjmTBb5
         VDdV/ikDecn7Fp5NP9LR+/HBhhVZnkz5LBSzjyWUq9a5kGt+SMZNqGZ5n3hq+9ExV8Ai
         U6d6p8uGCBNqJrmpeq0CHLLYHoXpePlsyp7sM52YvdqmmpJeuOyOP0Rn5wppUYbD+usf
         UHc/wnq0n1IW8d7TDWfbih9t+5im+fKH/SZYZ0TRQ8aDlR0BzU328f7lzSV151X7V63t
         yt39JbG2gomlc2WhkL5lav6MogpQVoOcu+yCmorirwrsK3oBmwtdZUz4bge5KVa04lxK
         ncXQ==
X-Gm-Message-State: AOJu0Yz35XsK0Fa7RXUBi9jgAYBfhhtIE5Rolqr72r4a4gVcnA4gDeFb
	yegg66dEIxk20Q3tbZPTjU+XZvNlEEY=
X-Google-Smtp-Source: AGHT+IEgytcVDPB9CBKwEgKw94T/g3K0MeBEDJriB/jFNqHzFDz6NIj7emPw0WsjPvCr64/xgmLFlw==
X-Received: by 2002:a05:6871:892:b0:1fb:75a:6d45 with SMTP id r18-20020a056871089200b001fb075a6d45mr499173oaq.108.1701475785660;
        Fri, 01 Dec 2023 16:09:45 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9100:2cb0::2c3f])
        by smtp.gmail.com with ESMTPSA id h17-20020aa79f51000000b006cdd63a452bsm3552737pfr.75.2023.12.01.16.09.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 Dec 2023 16:09:45 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH v2] rust-common.bbclass: Define rust arch for x32 platforms
Date: Fri,  1 Dec 2023 16:09:42 -0800
Message-ID: <20231202000942.3162961-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 02 Dec 2023 00:09:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/191696

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
v2: Change 'if' to 'elif' to make it part of if else block

 meta/classes-recipe/rust-common.bbclass | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/classes-recipe/rust-common.bbclass b/meta/classes-recipe/rust-common.bbclass
index 3d73a370ec8..ae96d9c5b1f 100644
--- a/meta/classes-recipe/rust-common.bbclass
+++ b/meta/classes-recipe/rust-common.bbclass
@@ -63,6 +63,8 @@ def rust_base_triple(d, thing):
     # This catches ARM targets and appends the necessary hard float bits
     if os == "linux-gnueabi" or os == "linux-musleabi":
         libc = bb.utils.contains('TUNE_FEATURES', 'callconvention-hard', 'hf', '', d)
+    elif os == "linux-gnux32" or os == "linux-muslx32":
+        libc = ""
     elif "musl" in os:
         libc = "-musl"
         os = "linux"
-- 
2.43.0


