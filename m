Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A895AD65C7D
	for <webhook@archiver.kernel.org>; Thu, 14 Nov 2024 11:45:18 +0000 (UTC)
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
 by mx.groups.io with SMTP id smtpd.web11.35286.1731584712533138857
 for <openembedded-core@lists.openembedded.org>;
 Thu, 14 Nov 2024 03:45:12 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=W7/lT2n/;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.54, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-37d518f9abcso360926f8f.2
        for <openembedded-core@lists.openembedded.org>; Thu, 14 Nov 2024 03:45:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1731584710; x=1732189510; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=LcQpuH8yk6vKLg/cOy3cZPsMa/tIqJV5QHSbnf9j8tI=;
        b=W7/lT2n/LF8JfRNiDNHwJ6lwIxbLKZtz/yyluGBxw3HEeYnRcYYkPmwxUYhWfduo5p
         AHHuIWap82A5cqXyXCmSN05zAGOUiR8oxnTTxo4Wp873b0+Ocef8UScN2vmlw95+nQIQ
         N1+4iekKDTdB+gK9kRCRfvNR9O5EiUE5ICb5s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731584710; x=1732189510;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=LcQpuH8yk6vKLg/cOy3cZPsMa/tIqJV5QHSbnf9j8tI=;
        b=bPTHJf4CVaIbFb7xcTdKM1LQ1xqAFclw1zJeHOq28jSJypXE5YiZpgRWno2PiZ/WTO
         0aM685cU37XYqBc4iR/dlCJajexRSCY8D5vO//3U4+hfd0DCoMymFgGf/3fW9STJTIiN
         5ia3ykWTWsMkNLSx3qMlALOjJ/g1gPDle+DaZ0+7o/0iOLPqICuislsb1lfE5JyNjUgG
         +OjP+BS9EBa4YbSb0Etiaphwqomq/YeDjpwW6syYQjpmw9Wai0AKKzds75gF6PbG1OE7
         tRTXh87sKfGlqIIB2M4fD3iOE+hLr19y0l6WYSqnxt14+n77JEZw5hTcfO9toqRtyiqY
         xUnA==
X-Gm-Message-State: AOJu0YwMJEdzFBJcpA1Fx8Y827z+6ntPiYVAfQz4+wyerijP2MNMylMx
	FsCi/xGP5dm+l6IUjIPFyFNM1Pr6vsmAkqz7Ec1hM5vBYwn9+cbgHgrypOGx8Jd+N0YrXZsMV+E
	xKao=
X-Google-Smtp-Source: AGHT+IE3EbQ7gWiUx99qCJ7ipHC1MnJ46eVhGFnlnaoUNFyWCJfeuNUbqOS7ZjqLYuiZZAk/p/18lg==
X-Received: by 2002:a05:6000:1868:b0:374:c3e4:d6de with SMTP id ffacd0b85a97d-381f1885dd9mr20693515f8f.41.1731584710035;
        Thu, 14 Nov 2024 03:45:10 -0800 (PST)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:593b:1ea:4243:8543])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3821ada3c68sm1273663f8f.2.2024.11.14.03.45.09
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Nov 2024 03:45:09 -0800 (PST)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] resulttool: Allow store to filter to specific revisions
Date: Thu, 14 Nov 2024 11:45:08 +0000
Message-ID: <20241114114508.388255-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 14 Nov 2024 11:45:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/207153

We have a challenge on the autobuilder where test results from both OE-Core
and poky are being mixed together during result storage which is confusing the
data. Add a way to filter to specific revisions as the least worst way to fix
the various issues this is causing.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 scripts/lib/resulttool/store.py | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/scripts/lib/resulttool/store.py b/scripts/lib/resulttool/store.py
index e0951f0a8f7..430213bbfe9 100644
--- a/scripts/lib/resulttool/store.py
+++ b/scripts/lib/resulttool/store.py
@@ -65,6 +65,9 @@ def store(args, logger):
 
         for r in revisions:
             results = revisions[r]
+            if args.revision and r[0] != args.revision:
+                logger.info('skipping %s as non-matching' % r[0])
+                continue
             keywords = {'commit': r[0], 'branch': r[1], "commit_count": r[2]}
             subprocess.check_call(["find", tempdir, "!", "-path", "./.git/*", "-delete"])
             resultutils.save_resultsdata(results, tempdir, ptestlogs=True)
@@ -102,3 +105,5 @@ def register_commands(subparsers):
                               help='add executed-by configuration to each result file')
     parser_build.add_argument('-t', '--extra-test-env', default='',
                               help='add extra test environment data to each result file configuration')
+    parser_build.add_argument('-r', '--revision', default='',
+                              help='only store data for the specified revision')

