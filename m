Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8C6DEC3DA6E
	for <webhook@archiver.kernel.org>; Wed,  3 Jan 2024 11:52:54 +0000 (UTC)
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
 by mx.groups.io with SMTP id smtpd.web11.15823.1704282770915565249
 for <openembedded-core@lists.openembedded.org>;
 Wed, 03 Jan 2024 03:52:51 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=kDQzr7u6;
 spf=pass (domain: gmail.com, ip: 209.85.208.51, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-555f581aed9so3132405a12.3
        for <openembedded-core@lists.openembedded.org>; Wed, 03 Jan 2024 03:52:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1704282769; x=1704887569; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=4nJe6vPa0tqhdRYWbUJuJrxaIsS9xn3VGOhnhDBeR7k=;
        b=kDQzr7u6I9CbHqyjTCmWOYIi2Cs43mh3EZAAsSqSmiJ/ap/cKACg7GJqv1U6fNs8OE
         NxzMzF+r3rHGash2KnpdUyY47gfPW8RAqaAfN2Q3bL+neYYAHzMMurKv/8WnhT+Zl1J0
         sMBjHQlH68baYKbK7uzAZC0pTQEVIP2qMZMbixwH8tPJHz0rYe41Nvlt+jeGAtiVQX6p
         JLBQLzY28WN4sYSugacoJdrqxZYPUZT2ENA9g0WkWeNO7dXTCcgCHw8ds815GX5ruBuo
         9WOMMxHW7yT13rFY2ezLwVhkKq24GXrvFcgvAryswdR670wTTZEPmaruOxqG7zamp4cE
         nuHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704282769; x=1704887569;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4nJe6vPa0tqhdRYWbUJuJrxaIsS9xn3VGOhnhDBeR7k=;
        b=REW9gL1HRphLKVC8nUfwracF6SttKZ05G4ixqnljQvpbbWWDfHHYLEIY15OWAKSmVt
         cNnrwELP/O7kCZBtI69P0oWwa6CJ+F15pbEmhPTZ1H7hdD7qX77G+AncRJNmxpenZYuV
         k++WsIB5Mq+LtDWW9wLOmGNE+S7mLhaIujdWtt2gFcNxLRIKJeV+FdjlYWn7YZlG8CN4
         TvfFVPosPC2kyUW/BXW672FPNYJUACV7WM9thVKuVWhWVp253qL2hrSlQ2DBqNTTMKer
         jTfHCmni47jJ0TSCOiUhfFexNGO42RMZ3V8EM2kI5rrqpPThNIfrRCNOBaxPlEz1yiEG
         qLMQ==
X-Gm-Message-State: AOJu0YwfNvkoUXKMm4McI8Sf+tC4i6amL92ASesdAFR7awYukirZ52YD
	1zbhkJT3lcJViz3PdIw+LsSWdox7BAk=
X-Google-Smtp-Source: AGHT+IFmEYUEC5cES3iczn/B4qJ/YghSLNeqWMo7UdX/fyCHf48k7adcggB+PqVYrPqh9gE0ek02gg==
X-Received: by 2002:a17:906:4f04:b0:a28:7c43:916a with SMTP id t4-20020a1709064f0400b00a287c43916amr796997eju.66.1704282769165;
        Wed, 03 Jan 2024 03:52:49 -0800 (PST)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id eb23-20020a170907281700b00a1f738318a5sm12719532ejc.155.2024.01.03.03.52.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jan 2024 03:52:48 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH] glibc-y2038-tests: do not run tests using 32 bit time APIs
Date: Wed,  3 Jan 2024 12:52:44 +0100
Message-Id: <20240103115244.221498-1-alex@linutronix.de>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 03 Jan 2024 11:52:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/193284

I'm not sure why this was included and enabled to begin with: the tests
predictably mass-fail if system time is set to after y2038.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 meta/recipes-core/glibc/glibc/run-ptest | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/meta/recipes-core/glibc/glibc/run-ptest b/meta/recipes-core/glibc/glibc/run-ptest
index c394b498660..cb71c756826 100755
--- a/meta/recipes-core/glibc/glibc/run-ptest
+++ b/meta/recipes-core/glibc/glibc/run-ptest
@@ -22,12 +22,12 @@ tst_time64=$(ls -r ${PWD}/tests/glibc-ptest/*-time64)
 # related
 tst_time_tmp=$(sed -e "s/-time64$//" <<< ${tst_time64})
 
-# Run tests supporting only 32 bit time
-for i in ${tst_time_tmp}
-do
-	$i >/dev/null 2>&1
-	output
-done
+# Do not run tests supporting only 32 bit time
+#for i in ${tst_time_tmp}
+#do
+#	$i >/dev/null 2>&1
+#	output
+#done
 
 # Run tests supporting only 64 bit time
 for i in ${tst_time64}
-- 
2.39.2


