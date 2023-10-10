Return-Path: <alexis.lothore@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 041B6CD6911
	for <webhook@archiver.kernel.org>; Tue, 10 Oct 2023 09:29:27 +0000 (UTC)
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net [217.70.183.196])
 by mx.groups.io with SMTP id smtpd.web11.86889.1696930157154986674
 for <Openembedded-core@lists.openembedded.org>;
 Tue, 10 Oct 2023 02:29:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=p7fjMwEq;
 spf=pass (domain: bootlin.com, ip: 217.70.183.196, mailfrom: alexis.lothore@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 594B7E0009;
	Tue, 10 Oct 2023 09:29:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1696930155;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=HkeArefO9HsbyIwz4RbGcfN9YOSfzHpqnWlmyFc58P4=;
	b=p7fjMwEqRQTi9YXJkw+EH1Im1X8+iCU+bwxvNO+D0E4IqrCXIkiBphLLRV692Bgey5NADM
	Y25UBRujbPYph90XHR0bOIbcNslqVUgWhTFzGUpxLYaS82Hwr52x4Sax8lUXTRzMbgJH0M
	dW8AwO3CrOVjHOSHy3pn1WmCydDu3HZ9FdpCRj0Be2syrkGa/dPyJHROo2cZtvAM0GP53A
	7eyU7bFieRQ0+hdIvTmGI4E0+xLWeWM6GwuBC9FYCy6KTHmOWHaQ8HF4KkWmrLRRvQVbbk
	Iu/XutTwDAgaNzWqv/bW7iZ2qFKUPAI2bthtORQKXnD7PbR2fPWnjXSq1JPE8g==
From: =?UTF-8?q?Alexis=20Lothor=C3=A9?= <alexis.lothore@bootlin.com>
To: <Openembedded-core@lists.openembedded.org>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>
Subject: [OE-Core][PATCH 2/2] oeqa/utils/gitarchive: ensure tag matches regex before getting its fields
Date: Tue, 10 Oct 2023 11:30:13 +0200
Message-ID: <20231010093013.16922-3-alexis.lothore@bootlin.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231010093013.16922-1-alexis.lothore@bootlin.com>
References: <20231010093013.16922-1-alexis.lothore@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-GND-Sasl: alexis.lothore@bootlin.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 10 Oct 2023 09:29:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/188878

From: Alexis Lothoré <alexis.lothore@bootlin.com>

Whenever we ask gitarchive to retrieve test results for specific revisions,
we first do a "large" search in get_tags, which uses glob patterns with git
ls-remote, and then we filter received tags with a regex to parse the tags
fields.
Currently gitarchive assumes that all tags returned by get_tags will match
the regex. This assumption is wrong (for example searching "master-next" in
get_tags may return some tags like "abelloni/master-next), and leads then
to exception when we try to retrieve tags fields:
Traceback (most recent call last):
  File "/home/pokybuild/yocto-worker/a-full/build/scripts/resulttool", line 78, in <module>
    sys.exit(main())
             ^^^^^^
  File "/home/pokybuild/yocto-worker/a-full/build/scripts/resulttool", line 72, in main
    ret = args.func(args, logger)
          ^^^^^^^^^^^^^^^^^^^^^^^
  File "/home/pokybuild/yocto-worker/a-full/build/scripts/lib/resulttool/regression.py", line 315, in regression_git
    revs2 = gitarchive.get_test_revs(logger, repo, tag_name, branch=args.branch2)
            ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
  File "/home/pokybuild/yocto-worker/a-full/build/meta/lib/oeqa/utils/gitarchive.py", line 246, in get_test_revs
    fields, runs = get_test_runs(log, repo, tag_name, **kwargs)
                   ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
  File "/home/pokybuild/yocto-worker/a-full/build/meta/lib/oeqa/utils/gitarchive.py", line 238, in get_test_runs
    groups = m.groupdict()

Fix this exception by merely skipping those additionals tags which won't
match the regex

Signed-off-by: Alexis Lothoré <alexis.lothore@bootlin.com>
---
 meta/lib/oeqa/utils/gitarchive.py | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/lib/oeqa/utils/gitarchive.py b/meta/lib/oeqa/utils/gitarchive.py
index 2fe48cdcac7f..10cb267dfa92 100644
--- a/meta/lib/oeqa/utils/gitarchive.py
+++ b/meta/lib/oeqa/utils/gitarchive.py
@@ -235,6 +235,8 @@ def get_test_runs(log, repo, tag_name, **kwargs):
     revs = []
     for tag in tags:
         m = tag_re.match(tag)
+        if not m:
+            continue
         groups = m.groupdict()
         revs.append([groups[f] for f in undef_fields] + [tag])
 
-- 
2.42.0


