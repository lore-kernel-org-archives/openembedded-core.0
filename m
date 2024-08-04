Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 09F56C52D74
	for <webhook@archiver.kernel.org>; Sun,  4 Aug 2024 17:09:42 +0000 (UTC)
Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
 by mx.groups.io with SMTP id smtpd.web10.30117.1722791375807573879
 for <openembedded-core@lists.openembedded.org>;
 Sun, 04 Aug 2024 10:09:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=ZD+xEYGg;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.182, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-70d23caf8ddso8443711b3a.0
        for <openembedded-core@lists.openembedded.org>; Sun, 04 Aug 2024 10:09:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1722791375; x=1723396175; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DtooNiUyFQ/RQ5ZXCnW8fShAhen+eRdmNRHJwxguMEc=;
        b=ZD+xEYGgVgncNddRp2qtrA5Hdw223xe2sFGGudjqMiVQPYJEXBF3YsiH7flDKRk98v
         KY502NtE6tgHRkYvQ0Gtcqf++J3x4B6OFMqeYEND6H4HGuf9iRLpYWIdTimD8+yG04uO
         871tmIcSwWV8m9e1IG/JwcUr1J39DYRcvU0GDEPLuUkmgZN2Pg9g8Oqkg5asPY+hUZuI
         2u3wXJ8W138xnHfaH1+84WSR57lreoCQQpgMxWoK3Dw3gUOOQS6CpZ16LzVmKjH5UhoO
         unViEMAyLWDSj7KWvlUEubYu3zJzjZNsdyIwLdL1u7vfn8GIkSlVuUni46neLEGP4e2C
         cFpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722791375; x=1723396175;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DtooNiUyFQ/RQ5ZXCnW8fShAhen+eRdmNRHJwxguMEc=;
        b=oR7VGW+3bbpw1pm62Y5LiEYt5WT5ZxIp2wrqQ2B+SRRdDzYTmHa4s/0EWWwVecwO1o
         +rWmUt8toRlSyP8p50vJtgXKYn3qxgk8P59MjvTmVIjkwVOeFU4i9WnibLgb4znuB0Ed
         hVeB4Vb3qm6EndaixsnA2isKD/zTRGS7mUvyyIf7WbCpNVf4L9vyTCUMrlHYGuREZ0fp
         lQ4YxbfY7RyWqUaFnMWUguY/fbmqZd46G543/vsFX1eZgUx81r1K84rZ1ZWuHnn+J2Ml
         KnGRfuMjq665cQrDkDG1Eaqa8L7CcKABQN+i4Y3QFbiqlKluPuX/aClaPo56Hl59csZ5
         3Swg==
X-Gm-Message-State: AOJu0YxT4Ypv33DIWEyFtIKROUOHOY4Hyyqk82gy5U0tYEyWDBGPp9Hv
	Jbcio1kHiu1ZUcji1cfiFNEy9YD73wLFjFyk6k5pybNhuiByazzBT2wZ1ZFg8whZwryHifkZHOi
	dEA9qLA==
X-Google-Smtp-Source: AGHT+IGiKkrpGaMOINHtWLPR8+3FyuFyUYHnlsSvtRVqTTan+4uDlHn7uCG/wKpkbF7fgoQZps7/qA==
X-Received: by 2002:a05:6a21:3292:b0:1c3:b239:83e2 with SMTP id adf61e73a8af0-1c69958158amr13347146637.12.1722791375050;
        Sun, 04 Aug 2024 10:09:35 -0700 (PDT)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7106ec269d2sm4293225b3a.17.2024.08.04.10.09.34
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Aug 2024 10:09:34 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 06/18] package.py: Fix static debuginfo split
Date: Sun,  4 Aug 2024 10:09:09 -0700
Message-Id: <a9d8e3f12032c92fa8dd7f2ad40f618da5ee281a.1722790925.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1722790925.git.steve@sakoman.com>
References: <cover.1722790925.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 04 Aug 2024 17:09:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/202965

From: Mark Hatle <mark.hatle@amd.com>

Fix:
  NameError: name 'shutil' is not defined

Signed-off-by: Mark Hatle <mark.hatle@amd.com>
Signed-off-by: Mark Hatle <mark.hatle@kernel.crashing.org>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 13bdd750ae54d57a5f459e4b7d8636c864978241)
Signed-off-by: Mark Hatle <mark.hatle@kernel.crashing.org>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/lib/oe/package.py | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/lib/oe/package.py b/meta/lib/oe/package.py
index 1511ba47c4..ffe5a2157b 100644
--- a/meta/lib/oe/package.py
+++ b/meta/lib/oe/package.py
@@ -14,6 +14,7 @@ import glob
 import stat
 import mmap
 import subprocess
+import shutil
 
 import oe.cachedpath
 
-- 
2.34.1


