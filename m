Return-Path: <akuster808@gmail.com>
Received: from mail-pl1-f196.google.com (mail-pl1-f196.google.com
	[209.85.214.196])
	by mail.openembedded.org (Postfix) with ESMTP id 0C7337E079
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 May 2019 01:43:22 +0000 (UTC)
Received: by mail-pl1-f196.google.com with SMTP id a5so7552260pls.12
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 May 2019 18:43:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=UqRpZE3hLSlwn7EkKmV/oV+ovcn00IX+RkbmUvr92s4=;
	b=O1tQpOrfgPxCJbsesRQSYB0sE1eoV157bgVwDpo9pKyrKYQFyVUim46+96OXuTVOS1
	K6L2NBwqlu4l8pJSjy4w57OGe6DtK579SXRHL8QUp7DWFk2WSIrDS+GQ7nAbsUd369lq
	RLfmFlVgBRgk00/DhnytbgriA74o9fHs8Cb0xvH+UDGrlZ8dapPZTQCSKQL0NxzIqCO/
	NVop7P8ADLGFIQdr2Cnh6AspEXmE5Z7ANi3V5QhOHaO0v1mBOgTAax18uZ2FkW0Jh3bi
	6UK1cbWk4sr3GuOaCk9vfve4JSF4JryOj7oOAnsFFW2gSu+eT4lYCHuc5tE9nkLs0Qis
	qOeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=UqRpZE3hLSlwn7EkKmV/oV+ovcn00IX+RkbmUvr92s4=;
	b=lmcdlFjcGZIFohl+B6xMjPqwIABaSu+qNr6rCkI8AVvke3P19BuyvAtGaDy5vJOOCp
	tmC+7pQ6oXQS4qd9oMEfRr7tapoLrLmr2YYPqW98/R7GmXYJy/Oo2bgsXGcWt8vXt6l0
	WCKMDsArk2z4zE/zM/0kIqoEPERySR2MI2dN66qCN/cFBWhj8krtXWMVb455wLY1Tsr9
	AIO9pJ2zcP6nRlMC2eHeiDR91V0cqM5kLHbrENCI6/c1B3sZNkdGUe6+AMEXYo9uNGl7
	iKrTotOix9Jyuyqd9B7rlY5re+qYvNdhsREXunwRC/SUVexieSMcXWmAJIBboLvtvz5H
	d98Q==
X-Gm-Message-State: APjAAAU1ASNPyf0/NNc+0RNQ1FWqGTx70r2Czb9KNTjzAeUVjSptz/Tt
	ADk3WxKl5Ztcp5QH3Azr82TAs4Wh
X-Google-Smtp-Source: APXvYqynhjeV3xIn+iMS15tWpDlMYBM1uXjwMD2XC6jc2mAqA/aHEwdV/H0qHHl9/tk58gkFqeOkJQ==
X-Received: by 2002:a17:902:ac90:: with SMTP id
	h16mr16515153plr.162.1558403004006; 
	Mon, 20 May 2019 18:43:24 -0700 (PDT)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4180:c33:503:adbf:6ea3:61d2])
	by smtp.gmail.com with ESMTPSA id
	q5sm23079547pfb.51.2019.05.20.18.43.23
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 20 May 2019 18:43:23 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 20 May 2019 18:43:05 -0700
Message-Id: <ffcd3a91234beefa9867198b6f81cfea8fe23aa0.1558402534.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1558402534.git.akuster808@gmail.com>
References: <cover.1558402534.git.akuster808@gmail.com>
Subject: [PATCH 03/15] oeqa/runner: Fix subunit setupClass/setupModule failure handling
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 21 May 2019 01:43:23 -0000

From: Richard Purdie <richard.purdie@linuxfoundation.org>

The string format for subunit setupClass/setupModule failures is slightly
different, tweak the regex to correctly handle both cases.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta/lib/oeqa/core/runner.py | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/lib/oeqa/core/runner.py b/meta/lib/oeqa/core/runner.py
index 69743a4..efd981d 100644
--- a/meta/lib/oeqa/core/runner.py
+++ b/meta/lib/oeqa/core/runner.py
@@ -106,13 +106,13 @@ class OETestResult(_TestResult):
 
                 # When fails at module or class level the class name is passed as string
                 # so figure out to see if match
-                m = re.search(r"^setUpModule \((?P<module_name>.*)\)$", scase_str)
+                m = re.search(r"^setUpModule \((?P<module_name>.*)\).*$", scase_str)
                 if m:
                     if case.__class__.__module__ == m.group('module_name'):
                         found = True
                         break
 
-                m = re.search(r"^setUpClass \((?P<class_name>.*)\)$", scase_str)
+                m = re.search(r"^setUpClass \((?P<class_name>.*)\).*$", scase_str)
                 if m:
                     class_name = "%s.%s" % (case.__class__.__module__,
                                             case.__class__.__name__)
-- 
2.7.4


