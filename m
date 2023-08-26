Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D1200C83F13
	for <webhook@archiver.kernel.org>; Sat, 26 Aug 2023 15:39:36 +0000 (UTC)
Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
 by mx.groups.io with SMTP id smtpd.web10.10509.1693064373243477434
 for <openembedded-core@lists.openembedded.org>;
 Sat, 26 Aug 2023 08:39:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20221208.gappssmtp.com header.s=20221208 header.b=p9bHzrn4;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.172, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-68a440a8a20so1678891b3a.3
        for <openembedded-core@lists.openembedded.org>; Sat, 26 Aug 2023 08:39:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20221208.gappssmtp.com; s=20221208; t=1693064372; x=1693669172;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4cpfLymLVzyGgNxX4vxTBoNY6rRHH5XQQwCD7Ms1ZMM=;
        b=p9bHzrn4WscCyer0lirNDIdmJHsY0U2UfDdkqGpuYjW8Y+9YHTlz2ZHxPW5Pdssr8d
         JuGUgR5Xbdu5MOLXjL7XVxdXvf/15lbsYentknDolBfs7uViq9/SUSXwvXw5Qw0ZNN/H
         2LQ28dDqtFt99QHp6QPG4+grOIDm3STDgJnV/Ryjig3gjiyoRG0uOTPsmVtWUHoaUL/5
         xACok8XmhCAg6sjIrz9wc55ztxF7ve+baWZtaVm9o0qux/ajCpznLolUJ5yX1M/zSTfH
         E0ivRtZch3jPlGtPylQsxBfcnkBhnExO+cZPLnhQfDEkUOuA8wNil71gfdLuXa7U5akl
         hueg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693064372; x=1693669172;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4cpfLymLVzyGgNxX4vxTBoNY6rRHH5XQQwCD7Ms1ZMM=;
        b=lOphzqCdtL4XDIqqYlhePWaACrW66oU6kEXQ5q8i/z86SoA5etVt+1EaDFU1Zh7LHN
         2+5nvPWbAQak0MZBeu7++PvSyKUZyYdscPzRLutrxc4BnzEGbm2UJu5Mi1d6mlb7VmOw
         qjAlCP8E6DSiRDeKI1ALnmw6FfLXezBnvTKXoT0qEoIuyvXpX6mRr14hLL+JuE92arMY
         CY+haD8mheBeaw2/4LnTBPi2mCw+Z/u2+xqcNqhECDKKCZFWbRDQ/3C8BCVkV7YAfJ78
         Mqo3N/G9vJ8Ze3I448E6qyxZN++/8piFYg9uZJkzEokqZA+HdnUTSbXVpJTFR4nkGpIN
         nPFA==
X-Gm-Message-State: AOJu0YyvW0wqQiyOoEWhGILXcsPx3tNkJbUFxgAWZpAeXIVdiOFCQHJn
	h8toCpfYiEiHg+10yueNvB5GxAuUarHSoZ1Xv1Y=
X-Google-Smtp-Source: AGHT+IHb5L9LJbln3f+J4wl7CMhIjDo3B7jyLj7de4F9CkT+e1Sgr5YGkyxHRW/tZ5QkfZAYgT9heA==
X-Received: by 2002:a05:6a20:c901:b0:148:3c72:4878 with SMTP id gx1-20020a056a20c90100b001483c724878mr15696230pzb.50.1693064372439;
        Sat, 26 Aug 2023 08:39:32 -0700 (PDT)
Received: from hexa.lan (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id g25-20020aa78759000000b006732786b5f1sm3422430pfo.213.2023.08.26.08.39.31
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Aug 2023 08:39:32 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][mickledore 20/20] resulttool/report: Avoid divide by zero
Date: Sat, 26 Aug 2023 05:38:51 -1000
Message-Id: <a46782c9f54bcb0389ea1016e37b6939aae79bfb.1693064194.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1693064194.git.steve@sakoman.com>
References: <cover.1693064194.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 26 Aug 2023 15:39:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/186764

From: Richard Purdie <richard.purdie@linuxfoundation.org>

Avoid a divide by zero traceback if unfortunate test counts are encountered.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit c5aeea53dfacb53dedb8445cb3523dc3a8cb6dca)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 scripts/lib/resulttool/report.py | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/scripts/lib/resulttool/report.py b/scripts/lib/resulttool/report.py
index f0ca50ebe2..a349510ab8 100644
--- a/scripts/lib/resulttool/report.py
+++ b/scripts/lib/resulttool/report.py
@@ -176,7 +176,10 @@ class ResultsTextReport(object):
             vals['sort'] = line['testseries'] + "_" + line['result_id']
             vals['failed_testcases'] = line['failed_testcases']
             for k in cols:
-                vals[k] = "%d (%s%%)" % (line[k], format(line[k] / total_tested * 100, '.0f'))
+                if total_tested:
+                    vals[k] = "%d (%s%%)" % (line[k], format(line[k] / total_tested * 100, '.0f'))
+                else:
+                    vals[k] = "0 (0%)"
             for k in maxlen:
                 if k in vals and len(vals[k]) > maxlen[k]:
                     maxlen[k] = len(vals[k])
-- 
2.34.1


