Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 272DAC433EF
	for <webhook@archiver.kernel.org>; Fri, 26 Nov 2021 16:18:33 +0000 (UTC)
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com
 [209.85.221.52])
 by mx.groups.io with SMTP id smtpd.web09.25865.1637943511637077546
 for <openembedded-core@lists.openembedded.org>;
 Fri, 26 Nov 2021 08:18:32 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=gwhhAoM1;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.52,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f52.google.com with SMTP id o13so19664776wrs.12
        for <openembedded-core@lists.openembedded.org>;
 Fri, 26 Nov 2021 08:18:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=hHfnqASur6ePMCwGTrrj/cWkYt1JSM71CoRg9VRv7aU=;
        b=gwhhAoM15dJ+IW5oo/19SvONZj3CJTQePj9uKPGqMl2w/iE0mcYrirj7LSQ2pOJ/gq
         pIqlz9hJkctjCPc6kuXDXBUjzhAo7U+6mL520QMkNs6ljvHfTGmaDl7mIxNpmPcXoGsT
         n2DYVc1mUCdGaK6tHHd6fKMwsp/cTKP5XHowI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=hHfnqASur6ePMCwGTrrj/cWkYt1JSM71CoRg9VRv7aU=;
        b=5GI2RF998dPNyqwnJsKspr/x1CE+r5+rquumnIsw2JANoZBhiA5+tlSpTq2o6uUs9s
         gdVPNvwxyqDcb/+A4GA6B7zCLb2OWRWrg32n/bpiCagyJ15ZwARSr3KTamoJIWgTJNkA
         B1TLUQs1AWDlt1SkP3jL4k28Ke5WYdy62qTRyHgzsr9PmY2RAdTKQUJ52yh8RexDwmf6
         C4XfEWnfkNkMZ7ZcStJDIbwn5m8S2FnuWTHrv1F0CA/+2ZdVu7YGQF41dDKKPzX4L717
         3UpJ+gt5TnYuKsNn1FOet+Q9QwqkG6o6u9jvnVKa9Px7oCp3MeOXOCRJ9SOTMW8rsPlW
         gV0g==
X-Gm-Message-State: AOAM530xS4bX19bOcK2s2hlUljUSnZrWcFlLvdofizzz7xeIpNp+mJIB
	fvvQVEN9W/OvlQ61u0yYVDTW46+kjnpfDw==
X-Google-Smtp-Source: 
 ABdhPJxlSaV8yVYFBsIu+ItHpnsk5FpVAx5/4O6giETOjS6UALAg2qoGDigir4uHrZRPeLTKlY6waw==
X-Received: by 2002:a5d:5144:: with SMTP id u4mr15298799wrt.91.1637943509638;
        Fri, 26 Nov 2021 08:18:29 -0800 (PST)
Received: from hex.int.rpsys.net ([2001:8b0:aba:5f3c:f21b:9c01:debb:ef34])
        by smtp.gmail.com with ESMTPSA id
 f13sm7853640wmq.29.2021.11.26.08.18.28
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Nov 2021 08:18:29 -0800 (PST)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/3] oeqa/parselogs: Fix quoting
Date: Fri, 26 Nov 2021 16:18:26 +0000
Message-Id: <20211126161828.166193-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 26 Nov 2021 16:18:33 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/158835

Fix deprecation warnings about invalid escape sequences.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/lib/oeqa/runtime/cases/parselogs.py | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/meta/lib/oeqa/runtime/cases/parselogs.py b/meta/lib/oeqa/runtime/cases/parselogs.py
index 50101b78513..b81acdd18a2 100644
--- a/meta/lib/oeqa/runtime/cases/parselogs.py
+++ b/meta/lib/oeqa/runtime/cases/parselogs.py
@@ -303,7 +303,7 @@ class ParseLogsTest(OERuntimeTestCase):
         grepcmd = 'grep '
         grepcmd += '-Ei "'
         for error in errors:
-            grepcmd += '\<' + error + '\>' + '|'
+            grepcmd += r'\<' + error + r'\>' + '|'
         grepcmd = grepcmd[:-1]
         grepcmd += '" ' + str(log) + " | grep -Eiv \'"
 
@@ -314,13 +314,13 @@ class ParseLogsTest(OERuntimeTestCase):
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
2.32.0


