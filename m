Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 83C16C25B75
	for <webhook@archiver.kernel.org>; Tue,  7 May 2024 11:46:55 +0000 (UTC)
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
 by mx.groups.io with SMTP id smtpd.web11.9485.1715082408053641953
 for <openembedded-core@lists.openembedded.org>;
 Tue, 07 May 2024 04:46:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=a2jiCJLp;
 spf=pass (domain: gmail.com, ip: 209.85.218.51, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-a59ece5e18bso155582466b.2
        for <openembedded-core@lists.openembedded.org>; Tue, 07 May 2024 04:46:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1715082406; x=1715687206; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OYdVYWukUb9hI4Es+l65oTcvNxvuIIsk3tNl85AZGw4=;
        b=a2jiCJLpyxqj8GFgVrS2XS5JmUtIGo7N4bCaclHyaS9R2xW9A4RxIWr5OdSBZQfHKz
         6yw7HokqSA+0Pwlt01d9XEbcTmsJb+V1ddkvjkHFzpEofvFD8vUGd30PLjeZFxVJj9Zi
         MsJjXapXUTcYDFjlFH4etx6HF6sedYSxd1nOTZ9qa4FvIxFg22qtsokAUmiKnfeVSDhK
         8UxXDwcbjQG0BKaI3gu1vKP+JOyGfqBBKUDIPZ23bhauQ2KiRRn64c8ZoDqZjJsIg0W6
         4rTO+iVYnYnUjS7f/q5ElMg9fSrjqZl9G8kQ/GTe5X3+tVM16VvJsbLm+iKpfmcBhJiN
         4ZwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715082406; x=1715687206;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OYdVYWukUb9hI4Es+l65oTcvNxvuIIsk3tNl85AZGw4=;
        b=H/DBljIIcjYsbZBI7hM38FaTIwxiTnYTutbvtEcrY1mb0hctCP+k0hj+jFffNfj1Fa
         IWpJFvl6HGud8YrS4tW8jRW+AZE+DZjD4TZNl7AjlxHc97N0gtHw6Bm0VkW0Qch1EtTO
         D9c6X3zfOEZ9wpOwLoNxDeiuw6GUQcqGvXF2whXQynLcypM+5DbpwIGBwmSK+QXKWc7j
         1QCRBzTPuvcpcMrdfg6dIW/iJ+U7GHhCykN1Dk+1aLSZMWTBCXl/zjiHPntrTYCY8EMI
         Eq2n/YzlP0OrwJgs9EBDJnfISkeq2KiFYXcBCT+UgjPOjkN0UynSLKGirAEDlvRAqeJL
         cSJA==
X-Gm-Message-State: AOJu0YyWiXxs5wGZfQ5EDouYdBnaUpFyIqiG6U5664lbfjBYIDnaPLXy
	dbT6QQCKfINSdFmY8lcbxkJb18TT02Nn+45QlLpyyN/nT1qfN5POnhsFgw==
X-Google-Smtp-Source: AGHT+IG6vuCKqpjt2dykORMfvBn1wgAkrY+vL3EgSoEgmqZrNxi7ChlTl7spGYneHLqSJ1rXm22HVA==
X-Received: by 2002:a50:cd5d:0:b0:56c:1696:58a8 with SMTP id d29-20020a50cd5d000000b0056c169658a8mr11655120edj.0.1715082406279;
        Tue, 07 May 2024 04:46:46 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id et4-20020a056402378400b00572d255e342sm5268215edb.10.2024.05.07.04.46.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 May 2024 04:46:46 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 7/9] selftest/sstatetests: separate sstate presence check into its own class
Date: Tue,  7 May 2024 13:46:27 +0200
Message-Id: <20240507114629.2591882-7-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240507114629.2591882-1-alex.kanavin@gmail.com>
References: <20240507114629.2591882-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 07 May 2024 11:46:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/199090

From: Alexander Kanavin <alex@linutronix.de>

This allows reusing the check function in tests other than CDN/local mirror
ones, such as sstate bundle testing.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 meta/lib/oeqa/selftest/cases/sstatetests.py | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/meta/lib/oeqa/selftest/cases/sstatetests.py b/meta/lib/oeqa/selftest/cases/sstatetests.py
index 86d6cd7464f..8f843139ebc 100644
--- a/meta/lib/oeqa/selftest/cases/sstatetests.py
+++ b/meta/lib/oeqa/selftest/cases/sstatetests.py
@@ -917,8 +917,7 @@ INHERIT += "base-do-configure-modified"
 """,
 expected_sametmp_output, expected_difftmp_output)
 
-@OETestTag("yocto-mirrors")
-class SStateMirrors(SStateBase):
+class SStateCheckObjectPresence(SStateBase):
     def check_bb_output(self, output, exceptions, check_cdn):
         def is_exception(object, exceptions):
             for e in exceptions:
@@ -960,6 +959,8 @@ class SStateMirrors(SStateBase):
         self.assertEqual(len(failed_urls), missing_objects, "Amount of reported missing objects does not match failed URLs: {}\nFailed URLs:\n{}\nFetcher diagnostics:\n{}".format(missing_objects, "\n".join(failed_urls), "\n".join(failed_urls_extrainfo)))
         self.assertEqual(len(failed_urls), 0, "Missing objects in the cache:\n{}\nFetcher diagnostics:\n{}".format("\n".join(failed_urls), "\n".join(failed_urls_extrainfo)))
 
+@OETestTag("yocto-mirrors")
+class SStateMirrors(SStateCheckObjectPresence):
     def run_test(self, machine, targets, exceptions, check_cdn = True, ignore_errors = False):
         # sstate is checked for existence of these, but they never get written out to begin with
         exceptions += ["{}.*image_qa".format(t) for t in targets.split()]
-- 
2.39.2


