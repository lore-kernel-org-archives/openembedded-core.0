Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A666BE77172
	for <webhook@archiver.kernel.org>; Wed,  4 Dec 2024 17:55:15 +0000 (UTC)
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
 by mx.groups.io with SMTP id smtpd.web10.21472.1733334914621517308
 for <openembedded-core@lists.openembedded.org>;
 Wed, 04 Dec 2024 09:55:14 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=EQ1c67we;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.173, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-2154e3af730so45693515ad.3
        for <openembedded-core@lists.openembedded.org>; Wed, 04 Dec 2024 09:55:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1733334914; x=1733939714; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pS5Dzor0W9iUDuKafvxj246UrBt7NjTx4a4U1Q2s7K4=;
        b=EQ1c67we7XFykLZ73bcrOkeGzt0Qc1w/zkBBgBf6VGjtYwcQBOeDFCnFweuZaVyoCN
         AzS3zSJMWoVRxfdASrclkJPFjl2A7BzK53As7YX962X1p/iblLprNa0lPGO2vys6h7E6
         EjIWG9VPZgrqnmCYmw6Z7RmC0rpLSrTHhclwbhl+301lydvmYtEkq8z3YoeOXDxpGY9O
         8I8JOKbpxAvYlUB1urzUwigdMhT5eg/xEs5C5QVT1c3Q0WI5pY2exKop6MKtscLRea3K
         BHNvOkLb8bleeoDHdebT6DeJtxyrgxNPxaLt3+qnck51JYTH1aM/5+7taJoh8W3f4hdv
         u3Lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733334914; x=1733939714;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pS5Dzor0W9iUDuKafvxj246UrBt7NjTx4a4U1Q2s7K4=;
        b=S2rL7xtfHW6suLi1Bs7i9HleZdBTD/W+CYAfVUSRgyC3nWIX/IOXeSyp8IJjPZMk3E
         u0DjyyEeHFto9i1DUUzRunY+BGgcVMP++UB38WbYB5Y+7mexm0mQgNqDW3RHZHK1UMnI
         oZX7/6pJxuqctGdgkrzjgLka3n2omGMthgOH3dzetJviSF3ITJJ2WWMjs+gFXqHayIfn
         ClfvsJQ/rd9e3Ozyw9niPjNi9DcPKZX8BC9mQZkJY6eGZqia7GdngEbhxgE1iBuY3meN
         2Gme1qy605HwnXb377RXqktsE7E7e+OxmNVs7JZt7uIDWS1orV1r85o10x7X0m8aaqeZ
         hpJA==
X-Gm-Message-State: AOJu0YzjQ2sTin6/ZKVCugfgHRDNcJWWkiCBMbQPMh2GL4dugXi/YT72
	WJ7zBxhMlq6lzgWD8eqLC8eNAxLeOSGf9EAW055gZAWf1ZelLkvIWd/YY7hhhdMZbsjkaBD1fuZ
	/
X-Gm-Gg: ASbGncu19ZVSCa/z0FAQsXhbP46ffsR/kDI4ijE5ngybpiM8FakhiHkbfP3RTwMSNCA
	JNSTpOdGYpnAKrZmNQDIR0OEeIyqu0KTo9PmSEsuTN0OBFkgh146TSZ4Y1K+NK01OXrIAQcfgzy
	fG/svOEtyMf8fwNS2Fm44vL/rDybM/S+/IZAYQBeNfFl1xO87s6p2wpy2t4ycJtq1o0bKdfRR5P
	oAzuieun62gcskpayVrVWqqyP+BwtUaiBe7SJo=
X-Google-Smtp-Source: AGHT+IFSOJsGIf4UhqN5ay0Z/zstfRtrYuGdnvStmDEG21/cpczYuADxyy/KtSCaJAxl9fCfSbzfRw==
X-Received: by 2002:a17:903:41c8:b0:215:4d90:4caf with SMTP id d9443c01a7336-215d003e7ecmr79187175ad.14.1733334912683;
        Wed, 04 Dec 2024 09:55:12 -0800 (PST)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-7fc9c2d5af1sm11727765a12.16.2024.12.04.09.55.12
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Dec 2024 09:55:12 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 33/38] resulttool: Fix passthrough of --all files in store mode
Date: Wed,  4 Dec 2024 09:54:00 -0800
Message-Id: <25173a06c4c1b4c6f1f8cdfe49f0b600cd3efd65.1733334655.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1733334655.git.steve@sakoman.com>
References: <cover.1733334655.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 04 Dec 2024 17:55:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/208316

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


