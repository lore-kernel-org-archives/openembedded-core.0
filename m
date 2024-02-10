Return-Path: <adrian.freihofer@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BFA10C4829C
	for <webhook@archiver.kernel.org>; Sat, 10 Feb 2024 13:17:51 +0000 (UTC)
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
 by mx.groups.io with SMTP id smtpd.web10.13391.1707571063738192848
 for <openembedded-core@lists.openembedded.org>;
 Sat, 10 Feb 2024 05:17:44 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=T9Pxmnc/;
 spf=pass (domain: gmail.com, ip: 209.85.167.54, mailfrom: adrian.freihofer@gmail.com)
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-5114fa38434so2056505e87.0
        for <openembedded-core@lists.openembedded.org>; Sat, 10 Feb 2024 05:17:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1707571062; x=1708175862; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=a6juzTFPnjVf8ArwXtHxcjzKBrUCZjXX3ZLwTS6S59I=;
        b=T9Pxmnc/vyEzweBP2cW2GQrgO0LROivhhByngprsiNzZduidBY6wS4Kc0E0Io/MMDx
         fdjamkwnbkckAjoU6EzmgWgtxKwOuYG5+YpddM9NzOmybjNw2F/TNMbNUPq9QJRttpiX
         ML7qTJVdtH7My1ECplbqihYV7OICNK5mXQdCxF4+x8w84QntFH4OXjhg6CYrP2T7+vao
         wcq8JPNyN9cf3ASJkLt9luUuHqsusZaoEtgDmJ8DSM+6F5y0RTi/MSYw75EKkrgWLooq
         5BAbTq2hR4MkSzQTxPLAuo5xis9zJDBc1yKOlop/p1UraO8fbMHaEgY+mKDBdQHAcVio
         /Pbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707571062; x=1708175862;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=a6juzTFPnjVf8ArwXtHxcjzKBrUCZjXX3ZLwTS6S59I=;
        b=SQd36ytg0prvCJdLPPcOIOg22RBVWjPM1PQzXDoSvibtaPiFimjiNzzsbaWAUtohza
         7DM9wFu/flxpx4YmvQPmQ3Bz8iUXL+YnyqHGA9FrY+aggbGaFipA5ph3Rn1t4lKp2aF4
         O0tuZwd2cpSA9gbJZuNbH35y1FOIksuEy7QIOwjEOrWjOmaHp0hQEC4QV9a5TFKq8Ud1
         6ctCsMCoLBnqVAnWNJ2KQ0xw3zRpS8lOooG4ElgUL+Nfnh+fqtkU/8seqtk//pPtnwqK
         aiDcz535CcbBtUD7kGjEq2YmlcQX6DC1XwZ/PNABH/+B0X1OOlazlNWf6UMx7N4KBBFI
         papQ==
X-Gm-Message-State: AOJu0YxMavDE27na4rVXxhtRbA2GQrVpQaCPmeAZLigB0DKZQqRTcahl
	DowVNYqY0ty1A4XNi03659vTuZEmEZY2rQUt91zquPiPCehBeQEh5zo88FSM
X-Google-Smtp-Source: AGHT+IGE/GwTvVbNvYH5hQCbAgga0rMpoVNougMfhXq+M1U3gnwFoarwFCSaTPXmTuLFi5FYztTeAw==
X-Received: by 2002:ac2:5e24:0:b0:511:7c0c:f94a with SMTP id o4-20020ac25e24000000b005117c0cf94amr1223356lfg.16.1707571061581;
        Sat, 10 Feb 2024 05:17:41 -0800 (PST)
Received: from wsadrian16.fritz.box ([2a02:169:59a6:0:55c4:f628:91f3:4287])
        by smtp.gmail.com with ESMTPSA id hu20-20020a170907a09400b00a3bd0742a94sm1793064ejc.9.2024.02.10.05.17.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 10 Feb 2024 05:17:41 -0800 (PST)
From: Adrian Freihofer <adrian.freihofer@gmail.com>
X-Google-Original-From: Adrian Freihofer <adrian.freihofer@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Adrian Freihofer <adrian.freihofer@siemens.com>
Subject: [PATCH 6/7] meta/lib/patchtest: python 3.12 regex
Date: Sat, 10 Feb 2024 14:15:58 +0100
Message-ID: <20240210131727.342583-7-adrian.freihofer@siemens.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240210131727.342583-1-adrian.freihofer@siemens.com>
References: <20240210131727.342583-1-adrian.freihofer@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 10 Feb 2024 13:17:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/195270

Python 3 interprets string literals as Unicode strings, and therefore
\s is treated as an escaped Unicode character which is not correct.
Declaring the RegEx pattern as a raw string instead of unicode is
required for Python 3.

Signed-off-by: Adrian Freihofer <adrian.freihofer@siemens.com>
---
 meta/lib/patchtest/tests/base.py | 4 ++--
 meta/lib/patchtest/utils.py      | 6 +++---
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/meta/lib/patchtest/tests/base.py b/meta/lib/patchtest/tests/base.py
index aecbbc4aae5..424e61b5be2 100644
--- a/meta/lib/patchtest/tests/base.py
+++ b/meta/lib/patchtest/tests/base.py
@@ -34,8 +34,8 @@ class PatchtestOEError(Exception):
 class Base(unittest.TestCase):
     # if unit test fails, fail message will throw at least the following JSON: {"id": <testid>}
 
-    endcommit_messages_regex = re.compile('\(From \w+-\w+ rev:|(?<!\S)Signed-off-by|(?<!\S)---\n')
-    patchmetadata_regex   = re.compile('-{3} \S+|\+{3} \S+|@{2} -\d+,\d+ \+\d+,\d+ @{2} \S+')
+    endcommit_messages_regex = re.compile(r'\(From \w+-\w+ rev:|(?<!\S)Signed-off-by|(?<!\S)---\n')
+    patchmetadata_regex   = re.compile(r'-{3} \S+|\+{3} \S+|@{2} -\d+,\d+ \+\d+,\d+ @{2} \S+')
 
 
     @staticmethod
diff --git a/meta/lib/patchtest/utils.py b/meta/lib/patchtest/utils.py
index a4a523b4e25..dd0abc22d9b 100644
--- a/meta/lib/patchtest/utils.py
+++ b/meta/lib/patchtest/utils.py
@@ -132,7 +132,7 @@ def get_subject_prefix(path):
     if len(mbox):
         subject = mbox[0]['subject']
         if subject:
-            pattern = re.compile("(\[.*\])", re.DOTALL)
+            pattern = re.compile(r"(\[.*\])", re.DOTALL)
             match = pattern.search(subject)
             if match:
                 prefix = match.group(1)
@@ -146,8 +146,8 @@ def valid_branch(branch):
     invalid  = lbranch.startswith('patch') or \
                lbranch.startswith('rfc') or \
                lbranch.startswith('resend') or \
-               re.search('^v\d+', lbranch) or \
-               re.search('^\d+/\d+', lbranch)
+               re.search(r'^v\d+', lbranch) or \
+               re.search(r'^\d+/\d+', lbranch)
 
     return not invalid
 
-- 
2.43.0


