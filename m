Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DC7FFC41513
	for <webhook@archiver.kernel.org>; Fri, 13 Oct 2023 21:54:03 +0000 (UTC)
Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
 by mx.groups.io with SMTP id smtpd.web11.51183.1697234034489106252
 for <openembedded-core@lists.openembedded.org>;
 Fri, 13 Oct 2023 14:53:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=NQme4+q+;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.177, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-6b20577ef7bso1044409b3a.3
        for <openembedded-core@lists.openembedded.org>; Fri, 13 Oct 2023 14:53:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1697234033; x=1697838833; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8Wbqt3LggfGiRqRcioVprhn3U7V4KkgppT8nzCqPqyE=;
        b=NQme4+q+XC5qgIvq6WA+98icm6hWjsr0/zOmp37rAtbbs3VI8RqCZvEF5FvCNEKOGC
         RAUemh7A+52MIE/LGOxgUU+IZMxVP9WyFZoP/EfKdJhONz8tJ6Oq90sM9dMcZWxqeq7o
         o+vRa70ONx1phLU1zWeNDSs5ppv8O7Vv8Ar8fbYmSsjPxQtNknZZDiwceYWpAPWZ3O3+
         l4Zs0Eyf3crxjK3dvdUZaqraJmMd4tdVx++zKaSwJmL+rJx2yy91gKyN8rU/Oqy4TdvY
         NkO6HU3B8FwxmaPrC+gl3g91Wm/MsjuhPHAkLI/cFa/PFgGA0rLyGqYBrw6eeisxSVOg
         AxfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697234033; x=1697838833;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8Wbqt3LggfGiRqRcioVprhn3U7V4KkgppT8nzCqPqyE=;
        b=jl6GY3WPHIl1ZRrfl7aB6VbwDaksjkPNiVYuNaur0o5dl8TScJ7+rwEcoGp+heGx9q
         zuplFJnwvvoxGxG+Qw2WTh5LMD38R7Alk/gLAImZb6pB9aFZWewIQ24QFLDZcZWP3L1y
         Ohxh4RirQck8zOFrYhTdVXBqB1Q97PitAFst+gMufMbX3r+qe9hqrd+G3ro/HR+eDGe5
         z4sKTv8PX0waph5lyJPJHFc2oBhaQcdcgIzpUa1KHEcx4Ip7KZls4GGgZXjkMaWLBIFs
         5HPlePThFl0q+woth3VZa0jrBY+pPEA68QqA7hMMk5t8+nVMHmZusPyXZ/IPTefxeJiK
         5jnw==
X-Gm-Message-State: AOJu0Ywsuq9JQBipkcNnZM7noEUYG/Xu/32kq7AZ/CRh3SkZbCYjZLxQ
	W0prFpg/YnrHglQt7AreYWaqS+T09wlxSTk5sWw=
X-Google-Smtp-Source: AGHT+IE6h3hk7MIky/nS+4IVTBwBV1JVg64yyASV25N8qPZWJRnlxhB4SIWIjKvX72tUDxXIan8Ymg==
X-Received: by 2002:a05:6a00:2e96:b0:68b:c562:da65 with SMTP id fd22-20020a056a002e9600b0068bc562da65mr30026941pfb.26.1697234033649;
        Fri, 13 Oct 2023 14:53:53 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id u22-20020a62ed16000000b00690fe1c928csm14307334pfh.147.2023.10.13.14.53.52
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Oct 2023 14:53:53 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][mickledore 21/27] ptest: report tests that were killed on timeout
Date: Fri, 13 Oct 2023 11:52:45 -1000
Message-Id: <f2989e8f87b8793b03fe13254f8214e495008527.1697233866.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1697233866.git.steve@sakoman.com>
References: <cover.1697233866.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 13 Oct 2023 21:54:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/189098

From: Alexander Kanavin <alex.kanavin@gmail.com>

I'm not sure if this was reported correctly before, but it
currently is not. Test that is stuck is an error in itself.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 002e27c9932a83e46be0b03a5232594cfba7212c)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/lib/oeqa/runtime/cases/ptest.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/lib/oeqa/runtime/cases/ptest.py b/meta/lib/oeqa/runtime/cases/ptest.py
index 3ef9022188..454a19430f 100644
--- a/meta/lib/oeqa/runtime/cases/ptest.py
+++ b/meta/lib/oeqa/runtime/cases/ptest.py
@@ -93,7 +93,7 @@ class PtestRunnerTest(OERuntimeTestCase):
         failed_tests = {}
 
         for section in sections:
-            if 'exitcode' in sections[section].keys():
+            if 'exitcode' in sections[section].keys() or 'timeout' in sections[section].keys():
                 failed_tests[section] = sections[section]["log"]
 
         for section in results:
-- 
2.34.1


