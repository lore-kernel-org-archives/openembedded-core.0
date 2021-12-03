Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F0C53C433F5
	for <webhook@archiver.kernel.org>; Fri,  3 Dec 2021 18:22:11 +0000 (UTC)
Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com
 [209.85.216.51])
 by mx.groups.io with SMTP id smtpd.web12.15507.1638555728887434561
 for <openembedded-core@lists.openembedded.org>;
 Fri, 03 Dec 2021 10:22:08 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=eoklDn3e;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.51,
 mailfrom: steve@sakoman.com)
Received: by mail-pj1-f51.google.com with SMTP id np3so2933969pjb.4
        for <openembedded-core@lists.openembedded.org>;
 Fri, 03 Dec 2021 10:22:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=XNGbgba0EGy3IJuF3bmPdzZfUEhA7e4Gbvi83ibeis4=;
        b=eoklDn3et36fJf0S6ADNi8jp2NmM7tZtABQ4P50XGxHJoyH3YLNjYORIc7nst7i07u
         RGCu7Ee429EtFFYY09Fk/Bo4ixWfjlMxWQLmGlq3P783PPFg8U0dc6BTwHC2oc5Tr2CK
         SfPPwMMPhc0l1klbseXX8T8otIlbI4Z6cbFLRr175gMzOVrkCVupwDvDpFUZmxZP6Jex
         IPK2haksTGM2bDhTwSatt0S0dejb3EDAcXLqsEcKOYdfdJO588EWbCXCrl6L6mIY4eYz
         W8SvUu1BGNyK7Diw0CUYLlI9HkYs6no1nha5t70siu9Aau+uciB3H5WE2cuRBX6CI7sV
         g3Gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=XNGbgba0EGy3IJuF3bmPdzZfUEhA7e4Gbvi83ibeis4=;
        b=f6P7+AhXvY7ah8iqBUsugdYS/JVWMvSx0cg2INOHYB0tvaY8ueeecnwLmveA5sxFMu
         CCz1i1B7tDW3gFahOzF42vzMj0xtFVNd9obRh39/sSpz5HnGvYOedukRDwAjxdCeYHQI
         eDGb41JF1zSOGHKN0n4PPtDtIvCZX7PMj0QxY+Lfo5YsjDZCRtGacSvzAvVzkRt0+kFl
         SYUStpRDoXgp60ZvR+Nu+y+CHaYsftkvHPLloM8MBjF6k7RZHACw4pkySyl1ctJkTUQ4
         XgNxbH6NliXbnGRptPNo/pzH1kU3KWyuViBvumP5147U1hC3Y+SHLREded9QE+phLmfK
         zYKQ==
X-Gm-Message-State: AOAM531sLLeQge8S+KiM3Z6JVJnGZNsKjnlFxY5YHknzigF2kv4b6Qwz
	s1qixJuSdWqLiXS6ibDZ1vkznPPJKzCrvRc1swk=
X-Google-Smtp-Source: 
 ABdhPJzH554QZBwElDYqdaBMNn0e29ZrWdt9RIwkSDm9MiprBTSBqeGwDrP56NhVl8lZ3kVUT9KkFA==
X-Received: by 2002:a17:90a:e7c2:: with SMTP id
 kb2mr16095822pjb.200.1638555727951;
        Fri, 03 Dec 2021 10:22:07 -0800 (PST)
Received: from localhost.localdomain (rrcs-66-91-142-162.west.biz.rr.com.
 [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id
 130sm3959753pfu.13.2021.12.03.10.22.06
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Dec 2021 10:22:07 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 15/18] oeqa/parselogs: Fix quoting
Date: Fri,  3 Dec 2021 08:19:02 -1000
Message-Id: 
 <224c2674b101ab9ed90784ba421cdf3805b42435.1638555254.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1638555254.git.steve@sakoman.com>
References: <cover.1638555254.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 03 Dec 2021 18:22:11 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/159142

From: Richard Purdie <richard.purdie@linuxfoundation.org>

Fix deprecation warnings about invalid escape sequences.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 43542614395150e8fa34133ba0fc7ee90f215bcb)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/lib/oeqa/runtime/cases/parselogs.py | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/meta/lib/oeqa/runtime/cases/parselogs.py b/meta/lib/oeqa/runtime/cases/parselogs.py
index 30e42ed9d5..cc40ee1ac0 100644
--- a/meta/lib/oeqa/runtime/cases/parselogs.py
+++ b/meta/lib/oeqa/runtime/cases/parselogs.py
@@ -296,7 +296,7 @@ class ParseLogsTest(OERuntimeTestCase):
         grepcmd = 'grep '
         grepcmd += '-Ei "'
         for error in errors:
-            grepcmd += '\<' + error + '\>' + '|'
+            grepcmd += r'\<' + error + r'\>' + '|'
         grepcmd = grepcmd[:-1]
         grepcmd += '" ' + str(log) + " | grep -Eiv \'"
 
@@ -307,13 +307,13 @@ class ParseLogsTest(OERuntimeTestCase):
             errorlist = ignore_errors['default']
 
         for ignore_error in errorlist:
-            ignore_error = ignore_error.replace('(', '\(')
-            ignore_error = ignore_error.replace(')', '\)')
+            ignore_error = ignore_error.replace('(', r'\(')
+            ignore_error = ignore_error.replace(')', r'\)')
             ignore_error = ignore_error.replace("'", '.')
-            ignore_error = ignore_error.replace('?', '\?')
-            ignore_error = ignore_error.replace('[', '\[')
-            ignore_error = ignore_error.replace(']', '\]')
-            ignore_error = ignore_error.replace('*', '\*')
+            ignore_error = ignore_error.replace('?', r'\?')
+            ignore_error = ignore_error.replace('[', r'\[')
+            ignore_error = ignore_error.replace(']', r'\]')
+            ignore_error = ignore_error.replace('*', r'\*')
             ignore_error = ignore_error.replace('0-9', '[0-9]')
             grepcmd += ignore_error + '|'
         grepcmd = grepcmd[:-1]
-- 
2.25.1


