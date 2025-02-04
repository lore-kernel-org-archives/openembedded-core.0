Return-Path: <igor.opaniuk@foundries.io>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F0AE1C02198
	for <webhook@archiver.kernel.org>; Tue,  4 Feb 2025 10:01:46 +0000 (UTC)
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
 by mx.groups.io with SMTP id smtpd.web10.112960.1738663303279966153
 for <openembedded-core@lists.openembedded.org>;
 Tue, 04 Feb 2025 02:01:43 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@foundries.io header.s=google header.b=UXakTBdd;
 spf=pass (domain: foundries.io, ip: 209.85.218.46, mailfrom: igor.opaniuk@foundries.io)
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-ab698eae2d9so1076090266b.0
        for <openembedded-core@lists.openembedded.org>; Tue, 04 Feb 2025 02:01:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=foundries.io; s=google; t=1738663301; x=1739268101; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=g5BqElZ5YzAMTb6JuZh+a/HZI0EQjOtN8j2Ic06Ql0A=;
        b=UXakTBddMVUx0n11eTQRum46D9CKF4qY8aC1uyUwDT8rQb6f2fSzn259XGhprJe618
         X1o/l47j4cYrjmtuY1J3LAcnQc2z17y2B9I+A/Ot5Yw0Uawwb5Kx4X2PcqleQ/a1oviJ
         1XMBkzM0Yns110L4hhPKsXa9hTm30Li8Hg7OlVjkdOPygrMrt/iq8+ZFhCtp1hQ0RM49
         eQW9D1w33//Z3ebjqdKTuD8XRYY8LG1czGNW38dEXbcH9RAqaASYcjhhjsYoNIhTD+qL
         7QPeIGzlnGC2YT0EGHYKmc34+Sg4aY66Ob7vOMUK7Vdb5Nhctbq44yU5GsNvVjKpu66c
         bsMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738663301; x=1739268101;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=g5BqElZ5YzAMTb6JuZh+a/HZI0EQjOtN8j2Ic06Ql0A=;
        b=rVirKAOygYMMvSHkjUKN3BY4ZTfXqlaS4QrtveFSqx6PulVnaSPmtQDqA7gkmTww3x
         NE4Avqb32kv2n36P+4eUaJUGchUxPy+GQdwhBp5o1qTwQotRVem0vwUIZN7vEkxgDMrO
         eDh7M7Rq7Yie5lGSijwvalDadiHSmJFxOAa1X5IgUdBhGT75FM/Gen4MmJ1QWDdQDVXB
         SfWl4BE5kLTLGLg1MYAySRsO9+C+FSNPLsrpYSIBDKCu1YE9SLCvBziTPpkS+6maFENH
         xss0FHODQ0vPyUSY0JL9KVS3y9r37VnMgvF0QuaIGNZdRX7vnEn9Hlf0QYEdPO2e5Sne
         D73A==
X-Gm-Message-State: AOJu0Ywd2RwRIiQfMrchTKkrfhNCitxI8eZ+ZkKEIIyh6XqhNLKVwllY
	AOFR7p1s9Ht9OtFa9SfuhjwZvx5jD7AUHRvvC1t7EYZ+zPn6YVav3npPQMUfGPjaSsRj+kFGEIC
	AerwpOg==
X-Gm-Gg: ASbGncvCrZLZannHO+xadt4lqY86Y6vP505Pntc/AFenCp/BBNITF9OnX8FN4IA6Wau
	AX4MKuN431PEmBG/dqMyjwt6H/zebpgk2WW/KZzNaHMUy3/eFUKBFeGqOmJx9RTwA9nfeIUXtr5
	PaPU46Vs9GXvMH3DGo1F7wA211adXF5Yt/JcqXhNMU4QTyNva5mpD+Gvn8cfhnYUVPNg92q180f
	r16hewVBcd+TrtXq6EEicH/GrPsHFZgnnmsNAJepzn2mDFBnxE7l6gqPs/528o293y8vomWI0GG
	64Hwon1qNY7mkSK6Ow2gTzE=
X-Google-Smtp-Source: AGHT+IEuvimPOZou/IBwvrnS+HURP+2Zyluc15s6j7D6f070JlPjfqKTuJTlEQK9NlciclGsJ6CgYg==
X-Received: by 2002:a17:906:794d:b0:aab:ee4a:6788 with SMTP id a640c23a62f3a-ab6cfdcc151mr2832734766b.57.1738663300495;
        Tue, 04 Feb 2025 02:01:40 -0800 (PST)
Received: from igor-t14.. ([185.186.156.113])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ab6e49ff724sm899065966b.105.2025.02.04.02.01.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Feb 2025 02:01:39 -0800 (PST)
From: igor.opaniuk@foundries.io
To: openembedded-core@lists.openembedded.org
Cc: Igor Opaniuk <igor.opaniuk@foundries.io>
Subject: [PATCH 1/6] README.OE-Core.md: fix markdown style issues
Date: Tue,  4 Feb 2025 11:01:09 +0100
Message-ID: <20250204100114.3749576-2-igor.opaniuk@foundries.io>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250204100114.3749576-1-igor.opaniuk@foundries.io>
References: <20250204100114.3749576-1-igor.opaniuk@foundries.io>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 04 Feb 2025 10:01:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/210756

From: Igor Opaniuk <igor.opaniuk@foundries.io>

Fix markdown style issues using markdownlint tool [1]:

$ cat README.OE-Core.md | mdl
(stdin):15: MD012 Multiple consecutive blank lines
(stdin):9: MD034 Bare URL used
(stdin):13: MD034 Bare URL used
(stdin):19: MD034 Bare URL used
(stdin):25: MD046 Code block style
(stdin):29: MD046 Code block style
(stdin):33: MD046 Code block style

[1] https://github.com/markdownlint/markdownlint
Signed-off-by: Igor Opaniuk <igor.opaniuk@foundries.io>
---
 README.OE-Core.md | 17 ++++++++---------
 1 file changed, 8 insertions(+), 9 deletions(-)

diff --git a/README.OE-Core.md b/README.OE-Core.md
index 687c58e410..7187fb94be 100644
--- a/README.OE-Core.md
+++ b/README.OE-Core.md
@@ -6,28 +6,27 @@ of OpenEmbedded. It is distro-less (can build a functional image with
 DISTRO = "nodistro") and contains only emulated machine support.
 
 For information about OpenEmbedded, see the OpenEmbedded website:
-    https://www.openembedded.org/
+<https://www.openembedded.org/>
 
 The Yocto Project has extensive documentation about OE including a reference manual
 which can be found at:
-    https://docs.yoctoproject.org/
-
+<https://docs.yoctoproject.org/>
 
 Contributing
 ------------
 
-Please refer to our contributor guide here: https://docs.yoctoproject.org/dev/contributor-guide/
+Please refer to our contributor guide here: <https://docs.yoctoproject.org/dev/contributor-guide/>
 for full details on how to submit changes.
 
 As a quick guide, patches should be sent to openembedded-core@lists.openembedded.org
 The git command to do that would be:
 
-     git send-email -M -1 --to openembedded-core@lists.openembedded.org
+```
+git send-email -M -1 --to openembedded-core@lists.openembedded.org
+```
 
 Mailing list:
-
-    https://lists.openembedded.org/g/openembedded-core
+<https://lists.openembedded.org/g/openembedded-core>
 
 Source code:
-
-    https://git.openembedded.org/openembedded-core/
+<https://git.openembedded.org/openembedded-core/>
-- 
2.43.0


