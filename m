Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C0B01E77176
	for <webhook@archiver.kernel.org>; Wed,  4 Dec 2024 20:36:46 +0000 (UTC)
Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
 by mx.groups.io with SMTP id smtpd.web11.25157.1733344604706445454
 for <openembedded-core@lists.openembedded.org>;
 Wed, 04 Dec 2024 12:36:44 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=Cdg0PK5l;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.171, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-7259a26ad10so184995b3a.1
        for <openembedded-core@lists.openembedded.org>; Wed, 04 Dec 2024 12:36:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1733344604; x=1733949404; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pS5Dzor0W9iUDuKafvxj246UrBt7NjTx4a4U1Q2s7K4=;
        b=Cdg0PK5lGHpseP/fLlJ9Pn/u5JYcqmmYGh0cxAbsEowQRLICma5LvSDNzaW5SL6qrA
         5zKU19XLuxnOUXogC23ASnoe0qcGOry0CxmTiyBztYpiX3AZHbDzRVngUMYsyIRqppM9
         IhpdDrmKDeryaUVGjbtT/AcyV0+DP6OT79+wxdosRLcTvYEuxXRHP9mnH4mrwNl1ZPNs
         t2qW3e04hHNGb0cPQDDzfkINL0FysPGe9o4gf26/tnBPwIe71Ziok1h7I3IvPbCF1avc
         fszPAubgcOGau4BmSJ8/V6mgIKp8phInIGVCe8pLaXhyVqK3ejrLwKO4bfhqbZaJ2X7Y
         43lA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733344604; x=1733949404;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pS5Dzor0W9iUDuKafvxj246UrBt7NjTx4a4U1Q2s7K4=;
        b=bmd7333pBS4tb03/EnaxZFHfLEnWuidA7pyUbPyrVzUBJH0kPQ1iEK3DXHMOjnYDzJ
         f2sHy/X2Vswel21aE/MqzJ68EssW10t0r75tJW3K1pfcI4CSFaYvebV363mTkeJJPRy9
         ZqTXn1Jy93oe8KdTlWbuzOkForGFsohwPQmxuZ/QVtPQ7dWPQeID0al4P+DsVKaYkQ13
         dKy+6mvGjn3REbjskwg4/9m93c3ZByyMNdN9VpokWKt4h/CRpF9wAQfAg8vUvqDN0BmP
         KEtSU/zw5u7Y1+xovH9eA5N5pQrbQ78hKMRkwOoIFhoYy+0v/e+Tz8/MgWN/cXt7u5g6
         aiyg==
X-Gm-Message-State: AOJu0YzJ3w8E0AKZkgj9xewSkQ/wtbLOT9j1O9WsYjw/eJztymokWQsR
	v9lwmzY6MOskgC9qgSKrbjjJTJorGR9R9asBLla8ga7AySbblR/lVpB3kAPjf58cGu0Ea+ZIpi7
	a
X-Gm-Gg: ASbGncuoriwTolZWtrMHeEM5NPHFXXYFPFv2Jh2qqeKgzOAFO68xs9+3AuCINtY/uBh
	F33Mx2F6faO4BGF5w0aLHdcxrxmeBzc6hSKSpMmm271uMqyFfKnHUbVAa7NOaNT0/teVWr95V3q
	++c+vB+m9nQX2mbnntoWAjeAdnVOuNUCXxaAs2GUV/OhzvuVGnRchp0iFGvio1GmVy6maM3Wwua
	I/09GLTzDQDq2BMJvGMJoSGPUTb/DHoYc6w340=
X-Google-Smtp-Source: AGHT+IHTf9LvrnDv3cQc5JDYNmy/IBa7L7ItD1eYFOucEzi+9cXF7TB4NRNNwvf7XXzpGsKLHpyc7Q==
X-Received: by 2002:a05:6a00:c86:b0:725:8edc:948a with SMTP id d2e1a72fcca58-7259d634437mr1062086b3a.8.1733344603976;
        Wed, 04 Dec 2024 12:36:43 -0800 (PST)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7254176f3d7sm12827805b3a.55.2024.12.04.12.36.43
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Dec 2024 12:36:43 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 10/15] resulttool: Fix passthrough of --all files in store mode
Date: Wed,  4 Dec 2024 12:36:17 -0800
Message-Id: <461140bede110b561f0bae46255d6a9435329e97.1733344462.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1733344462.git.steve@sakoman.com>
References: <cover.1733344462.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 04 Dec 2024 20:36:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/208338

From: Richard Purdie <richard.purdie@linuxfoundation.org>

When using store mode, --all was broken as not all files were being preserved.
Fix this by limiting the scope of the git rm command.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 9604561d2022b6c76b1cb4186d40800d1affdd2b)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 scripts/lib/resulttool/store.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/lib/resulttool/store.py b/scripts/lib/resulttool/store.py
index 430213bbfe..903e29627a 100644
--- a/scripts/lib/resulttool/store.py
+++ b/scripts/lib/resulttool/store.py
@@ -69,7 +69,7 @@ def store(args, logger):
                 logger.info('skipping %s as non-matching' % r[0])
                 continue
             keywords = {'commit': r[0], 'branch': r[1], "commit_count": r[2]}
-            subprocess.check_call(["find", tempdir, "!", "-path", "./.git/*", "-delete"])
+            subprocess.check_call(["find", tempdir, "-name", "testresults.json", "!", "-path", "./.git/*", "-delete"])
             resultutils.save_resultsdata(results, tempdir, ptestlogs=True)
 
             logger.info('Storing test result into git repository %s' % args.git_dir)
-- 
2.34.1


