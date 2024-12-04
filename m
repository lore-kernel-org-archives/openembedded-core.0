Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 47DF0E77170
	for <webhook@archiver.kernel.org>; Wed,  4 Dec 2024 20:45:57 +0000 (UTC)
Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
 by mx.groups.io with SMTP id smtpd.web11.25357.1733345148017904843
 for <openembedded-core@lists.openembedded.org>;
 Wed, 04 Dec 2024 12:45:48 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=vehIuJq6;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.178, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-7258ed68cedso224113b3a.1
        for <openembedded-core@lists.openembedded.org>; Wed, 04 Dec 2024 12:45:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1733345147; x=1733949947; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Y+NwRdnPeGyLdeW8vUheYvwrmmGsNozJQ75TO2JAWes=;
        b=vehIuJq6rIpC8+9puyJew43XnHX84evQ2JeHfGahHBcNc9k9aTqgjQYrqLWw2OJE8I
         GnYDCAvacmbPwMAGddoYZQ4HfUqw2/wY0I6SkyVlOfikC+pMJDiaCfN9SQ16CsxZjR5x
         qmxCW0TwS7ZyjLfY3tHW/MTLL03+cZEIORC5WsmZrluJW+Q8jf1u0b4K8q1rPT8e3bYP
         8rzXc1De0emIE2kMaz6fe7SPaPcBqfTJlgJVV/o3/743BOcFP4ix5TLFbToh0rItcmv5
         /x/tqSO0N7KpV8GM9mTyyWyY/N/UyAx8daR1RyulAKRp44bIl7fQnQpadDi28fKsDpBx
         TFzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733345147; x=1733949947;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Y+NwRdnPeGyLdeW8vUheYvwrmmGsNozJQ75TO2JAWes=;
        b=QueTNpdZ3BAiOE8QKKEVaXEno6NgeaqJ5a2gIvlFeaCefdM5sHaDISRkhXuqxrU9bd
         iw9AXU3X7L0QA2Cxtnj/HPSwviNaKZtN7hUWVql+Cz6TjsWnvlw2pMmgLgpGYSgXtb8U
         jIhKpLQ+mA74aRcyLoBWVrwJKU3sK3S/eBvIjV3R1TRcFSx6jwEv5xXq+G6KRP6uJBOl
         yMDne60bk7s8Eow1y628sXn3+yPo23l/po36hZgpb3wtysHXsPQrNIRY+7vzqwIPtv+D
         /qqekMOhZDeOT1l8QDalhDpc+lZSUw0nqVT6+wA6v9YmsTjPW38VhJgujS4S3z5hClPq
         9oOA==
X-Gm-Message-State: AOJu0YzkTH5Wzahlq0c3DKN3qVaqz5qc1+sClSdiM2U5djdKVtN4ifBN
	oiSUTopyH9u3bn4E5luo3lRZPwYFkGXtKPHHXeeV9lDFOtC++VzS/eecy5aa9Q1LUHPBiDMKL8l
	Y
X-Gm-Gg: ASbGncuu+TotUyEK5FJfVuYgNFuJBmMW8Ij4l03uWLJIzweIDtLWoYtxGkdRXaIFYfx
	PjawyeBJB0gO5P7wJRvq9wW2cez64o+UH8+LFTvyc3nHFGdAU9sMz3GlhMKunBymExOzLYqRpy8
	otave993AQwS9iRCq8q8dj4K+trg2lgRs7ozkR1UC2A+v1LoYAkQLafARm47tiYaXRm/xj8UBhX
	d251DSZIJbkZYMBzqWTERwV93WUIeSNAuyhNnA=
X-Google-Smtp-Source: AGHT+IGVbkaZP9BKsLIl140PKwVagzy84PoxeCsxxCfeF0CJmrA1yYNOMzNfi4Qgkt9HGP8a5fKuFg==
X-Received: by 2002:a17:902:e80f:b0:215:7421:262 with SMTP id d9443c01a7336-215bd1b46c6mr100412985ad.12.1733345147304;
        Wed, 04 Dec 2024 12:45:47 -0800 (PST)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2154dae56e8sm91387575ad.19.2024.12.04.12.45.46
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Dec 2024 12:45:46 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][styhead 14/14] resulttool: Improve repo layout for oeselftest results
Date: Wed,  4 Dec 2024 12:45:23 -0800
Message-Id: <8717a2e2161378bab4e27d515a71396b2a6bcf00.1733345023.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1733345023.git.steve@sakoman.com>
References: <cover.1733345023.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 04 Dec 2024 20:45:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/208358

From: Richard Purdie <richard.purdie@linuxfoundation.org>

Having all oe-selftest results on top of each other results in a large 640MB
json file which is hard to use. Split the results out per machine and test type.

This also stops the toolchain raw logs from overwriting each other meaning more
than one MACHINE is preserved.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 4b890f04bc7d147b4a11b824a84f3d2abd75ac54)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 scripts/lib/resulttool/resultutils.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/lib/resulttool/resultutils.py b/scripts/lib/resulttool/resultutils.py
index 760e426de0..b8fc79a6ac 100644
--- a/scripts/lib/resulttool/resultutils.py
+++ b/scripts/lib/resulttool/resultutils.py
@@ -34,7 +34,7 @@ regression_map = {
     "manual": ['TEST_TYPE', 'TEST_MODULE', 'IMAGE_BASENAME', 'MACHINE']
 }
 store_map = {
-    "oeselftest": ['TEST_TYPE'],
+    "oeselftest": ['TEST_TYPE', 'TESTSERIES', 'MACHINE'],
     "runtime": ['TEST_TYPE', 'DISTRO', 'MACHINE', 'IMAGE_BASENAME'],
     "sdk": ['TEST_TYPE', 'MACHINE', 'SDKMACHINE', 'IMAGE_BASENAME'],
     "sdkext": ['TEST_TYPE', 'MACHINE', 'SDKMACHINE', 'IMAGE_BASENAME'],
-- 
2.34.1


