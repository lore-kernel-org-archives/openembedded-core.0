Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
 by mx.groups.io with SMTP id smtpd.web12.13191.1602771341475883777
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 Oct 2020 07:15:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=dotgSJhe;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.169, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f169.google.com with SMTP id d23so1695224pll.7
        for <openembedded-core@lists.openembedded.org>; Thu, 15 Oct 2020 07:15:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=7P3XHvJNtBxNMUSgTf8fOlbQ9/nbJuZeGN97PZRepKE=;
        b=dotgSJheTkdYcmIJVJbKTcxTpl11+AJHCoRwpSPz6H3kdmgHGhb5lRwyaO9E2A3y02
         USpzHspHXSVy3FZTjw7zK1o2HuiYyjzC1ZJpzJsrUIz1KM6xJQAr0b6L3ABeGRq54rEa
         pFg8blY+KFFgOexzX0eZxMBdbEeFViCnxLDyAv0KqroDMnNFph1UHMRjRZuW3mnPwC6s
         TPa6jcYtkpBqw/GRzEDk4myl0u87XeB5pZdbHbJRONPcd6Lw5KBY0lY+4mp3RjodrJJz
         s4QScPLaitou1Ln52c1Op4x6VCibjN4e55eMtVq5bJPQLIBhs6G2huoAF6Q6SEYQ0Baf
         h+mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=7P3XHvJNtBxNMUSgTf8fOlbQ9/nbJuZeGN97PZRepKE=;
        b=pOP0q5/23oNQbKtIr1UfH78kGR2HdimgVoeuA5nml52yZDwcUHZwspjRtJfyjleuHS
         5pE7arQJUQqSoM1lx3wpIhoTl8Wcf3VXN0+BFuPszTrly3QbdEjZ7N4zNwfPm+PCFduA
         jjIrRGQ+PZreKEJ9Xqgz+tHfOl6kYjfMCQC6UBd+nlZBcpVEobcWDXr6mrjwbcmxu5JI
         UqyGaYwF/FdO9285XwGvZn7CmqaH7x6zplttkTAjfqjwE2t57PBpWkiRrNcy7Ruddarj
         lDAGr0zNLIyUAdjoF0GrkrP9tfYiuoXZRi7LjDgDaEBTz0thkJJutOkMd3Rj7OOkefe4
         2h/A==
X-Gm-Message-State: AOAM530slaXVWOtQbXgbrT5GkDDmeXAlxXtCtLa9N7VnvqEoRgNyiHq3
	VInEp6mifrEq5A4FIepiTVRnWtxwfDhK/JBz
X-Google-Smtp-Source: ABdhPJyfSUtlZ6CfxnUv5PHr4y1ZYXDMgW+faHOMrA4KexZbibURJrUAhI/LZMlzuBeFsUuE1tGd5A==
X-Received: by 2002:a17:902:a50a:b029:d4:da2d:c9a1 with SMTP id s10-20020a170902a50ab02900d4da2dc9a1mr4502120plq.6.1602771340426;
        Thu, 15 Oct 2020 07:15:40 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from octo.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id i9sm3565138pgc.71.2020.10.15.07.15.39
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2020 07:15:39 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 4/8] oe-build-perf-report: Ensure correct data is shown for multiple branch options
Date: Thu, 15 Oct 2020 04:15:08 -1000
Message-Id: <5c64937c65e41c1cf77af79f00e51f72dc7b2a8f.1602771116.git.steve@sakoman.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1602771116.git.steve@sakoman.com>
References: <cover.1602771116.git.steve@sakoman.com>

From: Richard Purdie <richard.purdie@linuxfoundation.org>

If --branch and --branch2 are the same, there is extra confusing data plotted
onto the graph. Only do that if the branches are actually different.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit c263d810b7eb47ee90f2adeb5ab6decf7332bec2)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 scripts/oe-build-perf-report | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/scripts/oe-build-perf-report b/scripts/oe-build-perf-report
index b46d61869c..7812ea4540 100755
--- a/scripts/oe-build-perf-report
+++ b/scripts/oe-build-perf-report
@@ -509,7 +509,7 @@ def main(argv=None):
 
     revs = gitarchive.get_test_revs(log, repo, args.tag_name, hostname=args.hostname,
                                     branch=args.branch, machine=args.machine)
-    if args.branch2:
+    if args.branch2 and args.branch2 != args.branch:
         revs2 = gitarchive.get_test_revs(log, repo, args.tag_name, hostname=args.hostname,
                                          branch=args.branch2, machine=args.machine)
         if not len(revs2):
@@ -533,7 +533,7 @@ def main(argv=None):
     else:
         index1 = len(revs) - 1
 
-    if args.branch2:
+    if args.branch2 and args.branch2 != args.branch:
         revs2.append(revs[index1])
         index1 = len(revs2) - 1
         revs = revs2
-- 
2.17.1

