Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1FAD9CD13D2
	for <webhook@archiver.kernel.org>; Sun, 17 Sep 2023 09:39:16 +0000 (UTC)
Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
 by mx.groups.io with SMTP id smtpd.web10.27136.1694943549766960816
 for <openembedded-core@lists.openembedded.org>;
 Sun, 17 Sep 2023 02:39:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=TreImJ3y;
 spf=pass (domain: gmail.com, ip: 209.85.208.43, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-52bcd4db4e6so4313621a12.0
        for <openembedded-core@lists.openembedded.org>; Sun, 17 Sep 2023 02:39:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1694943548; x=1695548348; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YATx016Rfb9QnR6FRkWjXSEF3t9m/9xOUI/kglxCOEQ=;
        b=TreImJ3yPXPWhLH65PZSefh4KcDpWQoMP9eh+vjBzSQA3HaEAvXNdVCsoMkuaznIVy
         sgw4C3SNXzidpZ7ldJBIItUWXAFHY9q7YtoHYSs0w1/HKRh0JmT7329sQDb2QpZ0/qrv
         /7HL5DWJWtZZ9BVWOh/Mo4S/UN1Iby0Rx5WTqfFGhHGTwEPuvlfeE/yX70ddrxyPrz8o
         35OqZiorXEkcRniI00YgaHwKMHni00/8CXFweJvSm5cy0mLH1/D/UKjLCw7i1irkPDGG
         AHvgcA+BcuSOe1omxSPeCQ20QHV9OJPH8l3kPEVNpQRcyuiVh4LlGdqtVMGAVTER2J4n
         q5eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694943548; x=1695548348;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YATx016Rfb9QnR6FRkWjXSEF3t9m/9xOUI/kglxCOEQ=;
        b=BQPAecyoIHSIPpjvO3Z8xbXn1qg3YfZbh5iEnL8Q2jgfetpr1D6wIIqEb3YzcoHvnf
         vvep2P+fc/mTz4qfPuw0gVe8Qkn3s2kSH0u4hDKrftHnHSFcwWo4m08oUVZk1Fyg0Ipu
         4qoiPPjkelT/H/yzmz+WLDB4Y7cxz8Q+rdiu7FbDxlHQueIZbEs7zOqYbEDJcWAWDtO9
         ByhI4uhHgWMGCtu864f+gujgiLJjsXU0MRn5kfOAkq4pmDg5D2wFFaWo4ncEqVkuin93
         hiGsOZxx9/gMocA1Wivm/dede1ekTc/oWskdCGK+8Bqd4Msa6EZfzX/zmg2nwFqgzqH3
         5T3w==
X-Gm-Message-State: AOJu0YxskhL1J+I+WHPDgO/GkkSJE0Za0icbhlD6zrvsDWEp6gc8l0KO
	0dYKcSVYsMGwpGEsWL9xNb3dokPtcWA=
X-Google-Smtp-Source: AGHT+IEGFpgw3RhO5hBm+TR1VOhijl1ES0Z4tVgwYabcXsUJfoLF/BsjU7Bzup/1+rhhq0Y//tfhog==
X-Received: by 2002:a17:906:2cf:b0:9aa:2bd:b59b with SMTP id 15-20020a17090602cf00b009aa02bdb59bmr5246155ejk.39.1694943548215;
        Sun, 17 Sep 2023 02:39:08 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id d8-20020a17090694c800b0099ce188be7fsm4779683ejy.3.2023.09.17.02.39.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 Sep 2023 02:39:07 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 05/29] ptest: report tests that were killed on timeout
Date: Sun, 17 Sep 2023 11:38:37 +0200
Message-Id: <20230917093901.428214-5-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230917093901.428214-1-alex@linutronix.de>
References: <20230917093901.428214-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 17 Sep 2023 09:39:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/187778

I'm not sure if this was reported correctly before, but it
currently is not. Test that is stuck is an error in itself.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 meta/lib/oeqa/runtime/cases/ptest.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/lib/oeqa/runtime/cases/ptest.py b/meta/lib/oeqa/runtime/cases/ptest.py
index 23a71ea064c..fbaeb84d006 100644
--- a/meta/lib/oeqa/runtime/cases/ptest.py
+++ b/meta/lib/oeqa/runtime/cases/ptest.py
@@ -96,7 +96,7 @@ class PtestRunnerTest(OERuntimeTestCase):
         failed_tests = {}
 
         for section in sections:
-            if 'exitcode' in sections[section].keys():
+            if 'exitcode' in sections[section].keys() or 'timeout' in sections[section].keys():
                 failed_tests[section] = sections[section]["log"]
 
         for section in results:
-- 
2.30.2


