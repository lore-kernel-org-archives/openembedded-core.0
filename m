Return-Path: <tgamblin@baylibre.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E2879CD11C2
	for <webhook@archiver.kernel.org>; Sat, 31 Aug 2024 01:39:13 +0000 (UTC)
Received: from mail-qk1-f174.google.com (mail-qk1-f174.google.com [209.85.222.174])
 by mx.groups.io with SMTP id smtpd.web11.15.1725068347161913150
 for <openembedded-core@lists.openembedded.org>;
 Fri, 30 Aug 2024 18:39:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@baylibre-com.20230601.gappssmtp.com header.s=20230601 header.b=EALggb8G;
 spf=pass (domain: baylibre.com, ip: 209.85.222.174, mailfrom: tgamblin@baylibre.com)
Received: by mail-qk1-f174.google.com with SMTP id af79cd13be357-7a81309071bso79168585a.3
        for <openembedded-core@lists.openembedded.org>; Fri, 30 Aug 2024 18:39:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1725068346; x=1725673146; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vP9VXnLpOLn9ZPZ0B6HJYNCyoUSPhyQ6g6gNNFbtfYg=;
        b=EALggb8G/IpfnjvPyduVif3qgFqBOWyKyMlE3+Mi6Nvd5hKVp0eHtnEKApV20x26PS
         4O4A8vDAy3DbsOug9zEaZYPqecsojUnKDkeyulvnFLbGBJVXQjJhre7loRzpNbCesSQ9
         wB16fc5duaSH3mLtSig0SiyqOxIimTM2wX6idKQSqaWcngCRUmdT32S4x8cmKURFB06M
         czeLqRiRcl4JDa4DyuliQxIXg+HLY4gEIBzAla+mhdOr0G57r6XE9CG1DznNR40MDsXG
         SFDryo8lmTR3y15vfLcx6wAaGBYWVWzNLmJf7FhsIICP4b5uHl/1vX/WsgbB43QQ2qUS
         kr2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725068346; x=1725673146;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vP9VXnLpOLn9ZPZ0B6HJYNCyoUSPhyQ6g6gNNFbtfYg=;
        b=FdUSm78OuOo7MR8hgO8hn/ELqLcTYKsQ2AH6b+/BE9dFUbC9h3SJmLGpj4nxn4Nb4i
         HM0yce8SG91sG1SQHYQHLwcii8Z1fOFnM/4xhYdKrTYNe8i3qVNxdk3HSoWzZHLtWznE
         E9RzIpgihkFzFYPNFSU/OQ6tKQm/nkFYEbdYheci/k5+EA2vFd0X3xlaiWKIJBG3tcBN
         2AO/H7F9op/hHU4VrKFAf7WjBK31fOMHOWBz4d/Wrak9fynorERR9rVEdjLDSViGG9ip
         ssYMM0CY9WE2GvTmuIu7SDsDVXcQgGE17LVl59SzpCN5xDqefl2qhUn2/GF1TCVZheup
         hFiQ==
X-Gm-Message-State: AOJu0Yw3pYprCz0v+FoZAYNbU1B+v1J/0nM3o8tr6BbHbvTZeWG14PAd
	oks3aCmVZwjgkXZAampjKEtm8UpY07EzIiXvFVBAwq6hHpQm6oC8qx2aSJhS4MI+raUNxzsPPbR
	Mzf8=
X-Google-Smtp-Source: AGHT+IFMYm+z8EdGkAqKj6LRTZJfL5kxLeDPyrs61bKyQf1iZ2mxZ5xRkSHd0zooAd92vty2Tp6csw==
X-Received: by 2002:a05:620a:4443:b0:7a2:ce2:4ff1 with SMTP id af79cd13be357-7a81d641c36mr214815385a.13.1725068345879;
        Fri, 30 Aug 2024 18:39:05 -0700 (PDT)
Received: from megalith.oryx-coho.ts.net (d24-150-219-207.home.cgocable.net. [24.150.219.207])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7a806d3ed6bsm200834785a.73.2024.08.30.18.39.05
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Aug 2024 18:39:05 -0700 (PDT)
From: Trevor Gamblin <tgamblin@baylibre.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][PATCH 2/2] patchtest: test_shortlog_length: omit shortlog prefixes
Date: Fri, 30 Aug 2024 21:39:03 -0400
Message-Id: <20240831013903.3213564-2-tgamblin@baylibre.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240831013903.3213564-1-tgamblin@baylibre.com>
References: <20240831013903.3213564-1-tgamblin@baylibre.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 31 Aug 2024 01:39:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/203972

In certain cases, the shortlog for a patch would include branch and
'PATCH' tag information even after the repo tag got stripped out,
padding it with data that wouldn't actually be included with a merge.
This caused the patchtest test_shortlog_length test to erroneously
report a failure.

For example, a patch whose shortlog tags were:

[OE-core][master/scarthgap][PATCH]

would leave this behind in the shortlog, along with the actual content:

[master/scarthgap][PATCH]

Add a re.sub() call in the test to fix this by removing all square
bracket pairs that appear at the beginning of the string.

Fixes [YOCTO #15575].

Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
---
 meta/lib/patchtest/tests/test_mbox.py | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/lib/patchtest/tests/test_mbox.py b/meta/lib/patchtest/tests/test_mbox.py
index ae16c4bf934..0e3d055780a 100644
--- a/meta/lib/patchtest/tests/test_mbox.py
+++ b/meta/lib/patchtest/tests/test_mbox.py
@@ -9,6 +9,7 @@ import collections
 import parse_shortlog
 import parse_signed_off_by
 import pyparsing
+import re
 import subprocess
 from data import PatchTestInput
 
@@ -82,7 +83,7 @@ class TestMbox(base.Base):
     def test_shortlog_length(self):
         for commit in TestMbox.commits:
             # no reason to re-check on revert shortlogs
-            shortlog = commit.shortlog
+            shortlog = re.sub('^(\[.*?\])+ ', '', commit.shortlog)
             if shortlog.startswith('Revert "'):
                 continue
             l = len(shortlog)
-- 
2.39.2


