Return-Path: <alex.kiernan@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6D2E1C47072
	for <webhook@archiver.kernel.org>; Thu, 28 Dec 2023 14:59:49 +0000 (UTC)
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
 by mx.groups.io with SMTP id smtpd.web10.124386.1703775585723574393
 for <openembedded-core@lists.openembedded.org>;
 Thu, 28 Dec 2023 06:59:46 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=DMcIs/2e;
 spf=pass (domain: gmail.com, ip: 209.85.128.41, mailfrom: alex.kiernan@gmail.com)
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-40d560818b8so34797965e9.1
        for <openembedded-core@lists.openembedded.org>; Thu, 28 Dec 2023 06:59:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1703775584; x=1704380384; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Fu6b9sDyMyOwr0sViH4Thbmd1P2ht7lIGDDgrhWiWT0=;
        b=DMcIs/2ey3LIx7gM1IF8u7mnmd0oxRCOBxYyK1DtCMCatz0ImiIDpGQ5uxKe6Mb23h
         qS1mSVHQvUmKbdnzrmyeXf7ex+ugcf7pf/cG2A/C4GGnla5KPgkjUY6VT5UNQZXlLeIk
         W8wv64tIi8mO4w6hjsYNFMAC5djVIW7ISUUSckYRXpndcH8RXfLwBXKyojT0ejb6qQ2d
         bmAuJYRNRJByMESZqZXqt5SxKgd7R/qpWnGiWQzG1dk3JFPoBU9b60X2oRkTiji6IteW
         DHpDYuhVNJvi6T8qoPMEwEZqpRBV1Pj2FeKyEe03Yb+/Us/AIdSi+DxY1eH7zrpt08Ll
         rlPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703775584; x=1704380384;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Fu6b9sDyMyOwr0sViH4Thbmd1P2ht7lIGDDgrhWiWT0=;
        b=rwid4u2j6+OodORwU0ysLK80SOTNXbnkc0oHFEUjavxpFM9uOgmCosn8VRbi9vs8mb
         I1gkg+ecZfFVbmQhJHoulwFqW2JZWepKALJzmoiK/f+GG+pD+Ge1G/tnIwV5eM9W35Or
         Rx4WJgBBQZMR+vJGo8K1Sng/DWBi55axRzmtweaI3N9o9L2+JPnOKzTVCksYz4hr5aLx
         M1jIrmzSFdwIu/rlW1/x7l5mPCJMxUzFIhGE2PHIJ6M8p+q7XExGfK7DOkBMXgmQeHmv
         ho80Q4WHQaFm7KS0IMvbCjzJmFYFKenuqnLVbrxm3UHAPlFtAtvxuPVkc76qsF+uJIEP
         KH9w==
X-Gm-Message-State: AOJu0Yzig46npcc4lHayYAd1Yc2i63Q1aiYgNnT2CzbpXF3PksGmCpwE
	d7Qb29xOB0V1PwPczYXDvGuBi9mlNEY=
X-Google-Smtp-Source: AGHT+IFmm+e4EJdDPCJgjtvFcUbIki2gztDH6q7bpimBLP+iVlQHfMwWNdL8cNUvjXZFApdgmUQDJA==
X-Received: by 2002:a05:600c:3108:b0:40d:6e0b:4c35 with SMTP id g8-20020a05600c310800b0040d6e0b4c35mr468720wmo.114.1703775583850;
        Thu, 28 Dec 2023 06:59:43 -0800 (PST)
Received: from Zuma-000004PC.lan (cust18-dsl93-89-130.idnet.net. [93.89.130.18])
        by smtp.gmail.com with ESMTPSA id c12-20020a05600c0a4c00b0040d6ffae526sm1461523wmq.39.2023.12.28.06.59.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Dec 2023 06:59:42 -0800 (PST)
From: Alex Kiernan <alex.kiernan@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Frederic Martinsons <frederic.martinsons@gmail.com>,
	Alex Kiernan <alex.kiernan@gmail.com>
Subject: [OE-Core][PATCH v3 04/10] devtool: selftest: Swap to hello-rs for crates testing
Date: Thu, 28 Dec 2023 14:59:11 +0000
Message-Id: <20231228145917.18147-5-alex.kiernan@gmail.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20231228145917.18147-1-alex.kiernan@gmail.com>
References: <20231228145917.18147-1-alex.kiernan@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 28 Dec 2023 14:59:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/192986

zvariant fails to build with newer rust

Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
---

Changes in v3:
- Add hello-rs as a replacement for the tests which used zvariant

Changes in v2:
- Skip zvariant based test rather than deleting it.

 meta/lib/oeqa/selftest/cases/devtool.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/lib/oeqa/selftest/cases/devtool.py b/meta/lib/oeqa/selftest/cases/devtool.py
index cc28731402e7..a87772076946 100644
--- a/meta/lib/oeqa/selftest/cases/devtool.py
+++ b/meta/lib/oeqa/selftest/cases/devtool.py
@@ -928,7 +928,7 @@ class DevtoolModifyTests(DevtoolBase):
         #    some crate:// in SRC_URI
         #    others git:// in SRC_URI
         #    cointains a patch
-        testrecipe = 'zvariant'
+        testrecipe = 'hello-rs'
         bb_vars = get_bb_vars(['SRC_URI', 'FILE', 'WORKDIR', 'CARGO_HOME'], testrecipe)
         recipefile = bb_vars['FILE']
         workdir = bb_vars['WORKDIR']
-- 
2.39.0


