Return-Path: <akash.hadke27@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4061CC87FD3
	for <webhook@archiver.kernel.org>; Fri,  8 Aug 2025 08:49:47 +0000 (UTC)
Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com [209.85.215.178])
 by mx.groups.io with SMTP id smtpd.web10.17675.1754642984340367776
 for <openembedded-core@lists.openembedded.org>;
 Fri, 08 Aug 2025 01:49:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=H3D1BZ1D;
 spf=pass (domain: gmail.com, ip: 209.85.215.178, mailfrom: akash.hadke27@gmail.com)
Received: by mail-pg1-f178.google.com with SMTP id 41be03b00d2f7-b271f3ae786so1534595a12.3
        for <openembedded-core@lists.openembedded.org>; Fri, 08 Aug 2025 01:49:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754642983; x=1755247783; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QY5MZdoMEig9wA2LT1bPpkytfyhCYTtHzjQuBh5StY0=;
        b=H3D1BZ1D9mCz4Q+G8ZwHbBNp/ZRUivPNUL5Wrt6e6Fnfi9HpmykCBswMRK0nlSD/m/
         cWzjMer0Quy7XuMHdmkuIxaVHTFKqd7fVqwYDhTHIlGCQsr5DnHH2/Uw3HtPqjRQKCMW
         JxoDZFyTZzvYJF1Q0HAcuByZCZB702hRf+ao7NmgHFN1JbYJ8KCAu8iBnm47wS9qhc+v
         wTvYH63Xc9q+uyrTB+PRED7u+3t6peFLROZNLUhj1iz0CeLz2t774wzH1QY9XicWaOft
         B5dukBD+0HGvfu8kyFYjmzqwmZS82xrEGBDKLgHQ6TxYnIdBz4y3qD54Zfw+IJ1pJ398
         jdKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754642983; x=1755247783;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QY5MZdoMEig9wA2LT1bPpkytfyhCYTtHzjQuBh5StY0=;
        b=N/8wGJmEZudyOtbf+9QFNtdwTddtx2dFmegdP0ubnJR66iGiVyv42UTHV9QEEkkQyf
         YzJ6zN4e4nIw6S8yQ9sYpzdWHi+YZ0zE/8eDDmmKe8LwHSjdpnTZzlaQVJxdkn/E6xL5
         EifCNpccGAcVME/XCfo/4h6K/YMscuQP4+aJGBO/R7YcBPD8uo38qZii+GofsZhuUdSC
         dAlI4iOjmsHWS7lFyTDUKiLfJPw1PfxX2eBboUhwuUNHB9mmjcJ5OwLbeE7u3nVTBmSh
         q+jzxdR7x3THX3SgyWQ4vfdGzkt0vyznal0ubALimIK5lz0M5wKdMiicWRGxlYPZupw/
         fyqA==
X-Gm-Message-State: AOJu0Yx5T667a6ApHGhM1WQwqOLKXfLd1MGn8dUxWOSgrsBCswEcLrzO
	0f+zc/IbPI79QyU4hluvW0egANrvs5GomPM+IwnUC7aoJHkzsoWiBKD3TCSzJw==
X-Gm-Gg: ASbGnctpgJMU5Eiivf+eUXi+goZnYj1QfFvSin/BZhFlQ62YCqVD+v2ym/dy47bUeP3
	coDWy7IA2BfgoQF2avPSND7x8A/xNvd+QhC4F2O/Mx2K1Qdnz2l3+OYxUxpSiw6yonh6fO4iQTI
	q77QxUTxSLDBv5PQS9/yMwF9fu97oVrg3ScsWtENbK52elKLYpXa4b8CKRb7AuwU6bof3N0g12z
	9ajaxafbNV1ScykVUPlueRMGLPn+2CoGRRnuVKINFizGct1G+15PuqLEGft4nIjNxZiKSnq942d
	uOtLSkvP+wOExddQzzTk4xGN5qyHJc8ztVKXUmHh2SX6zG6bI5hN+Ccb7o0GWJq1Itt8Wb90XW7
	wpx4q9xsqQhuoxm441YuoKK1xYRxDH4VK
X-Google-Smtp-Source: AGHT+IH6x8k7Qdaowzg5QFPYwIQ1cJ8VoKKqEHrD7W5Ylu7wzB7qjdIlRAcArc500VoqwzNgxeltOw==
X-Received: by 2002:a17:903:40cb:b0:242:b315:dda7 with SMTP id d9443c01a7336-242c1fdc02dmr31017785ad.3.1754642983298;
        Fri, 08 Aug 2025 01:49:43 -0700 (PDT)
Received: from L-18010L.kpit.com ([49.36.49.248])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-24218d8413asm188782455ad.63.2025.08.08.01.49.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 Aug 2025 01:49:42 -0700 (PDT)
From: Akash Hadke <akash.hadke27@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Robert Yang <liezhi.yang@windriver.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>
Subject: [poky][scarthgap][PATCH 02/23] bitbake: bitbake: tests/fetch: Update GitShallowTest for clone_shallow_local()
Date: Fri,  8 Aug 2025 14:19:10 +0530
Message-Id: <20250808084931.2156763-2-akash.hadke27@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250808084931.2156763-1-akash.hadke27@gmail.com>
References: <20250808084931.2156763-1-akash.hadke27@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 08 Aug 2025 08:49:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/221599

From: Robert Yang <liezhi.yang@windriver.com>

Update the test cases since the implementation is changed:

* test_shallow_multi_one_uri()
  The a_branch and v0.0 had the same revision, and it required fetch a_branch
  and remove histories of v0.0 which were conflicted, and bitbake reported:
  fatal: no commits selected for shallow requests

  Make a_branch and v0.0 have different revs to fix the problem.

  And now the 'rev^' is not needed, so update self.assertRevCount() as well.

* test_shallow_multi_one_uri_depths()
  Update self.assertRevCount(), now git only fetches the required revs.

* test_shallow_fetch_missing_revs()
  The command is:
  $ git fetch --shallow-exclude=v0.0 master

  But master and v0.0 uses the same revision, so there is no commit to fetch.

* test_shallow_fetch_missing_revs_fails()
  Two unneeded committs are not fetched now:
  - rev^
  - One not specified or required tag.

  So update self.assertRevCount()

(Bitbake rev: 48eff9d9a660ad6b9bd8b53a7dcec600ef42b1d1)

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 7bc521ed34656165fedaef1dd98cee865092291d)
Signed-off-by: Akash Hadke <akash.hadke27@gmail.com>
---
 bitbake/lib/bb/tests/fetch.py | 13 ++++++++-----
 1 file changed, 8 insertions(+), 5 deletions(-)

diff --git a/bitbake/lib/bb/tests/fetch.py b/bitbake/lib/bb/tests/fetch.py
index b57cf511a4..eed92ad6ea 100644
--- a/bitbake/lib/bb/tests/fetch.py
+++ b/bitbake/lib/bb/tests/fetch.py
@@ -2012,9 +2012,9 @@ class GitShallowTest(FetcherTest):
         self.add_empty_file('b')
         self.git('checkout -b a_branch', cwd=self.srcdir)
         self.add_empty_file('c')
+        self.git('tag v0.0 HEAD', cwd=self.srcdir)
         self.add_empty_file('d')
         self.git('checkout master', cwd=self.srcdir)
-        self.git('tag v0.0 a_branch', cwd=self.srcdir)
         self.add_empty_file('e')
         self.git('merge --no-ff --no-edit a_branch', cwd=self.srcdir)
         self.add_empty_file('f')
@@ -2030,7 +2030,7 @@ class GitShallowTest(FetcherTest):
 
         self.fetch_shallow(uri)
 
-        self.assertRevCount(5)
+        self.assertRevCount(4)
         self.assertRefs(['master', 'origin/master', 'origin/a_branch'])
 
     def test_shallow_multi_one_uri_depths(self):
@@ -2177,7 +2177,7 @@ class GitShallowTest(FetcherTest):
 
         self.fetch_shallow()
 
-        self.assertRevCount(5)
+        self.assertRevCount(2)
 
     def test_shallow_invalid_revs(self):
         self.add_empty_file('a')
@@ -2196,7 +2196,10 @@ class GitShallowTest(FetcherTest):
         self.git('tag v0.0 master', cwd=self.srcdir)
         self.d.setVar('BB_GIT_SHALLOW_DEPTH', '0')
         self.d.setVar('BB_GIT_SHALLOW_REVS', 'v0.0')
-        self.fetch_shallow()
+
+        with self.assertRaises(bb.fetch2.FetchError), self.assertLogs("BitBake.Fetcher", level="ERROR") as cm:
+            self.fetch_shallow()
+        self.assertIn("fatal: no commits selected for shallow requests", cm.output[0])
 
     def test_shallow_fetch_missing_revs_fails(self):
         self.add_empty_file('a')
@@ -2227,7 +2230,7 @@ class GitShallowTest(FetcherTest):
         revs = len(self.git('rev-list master').splitlines())
         self.assertNotEqual(orig_revs, revs)
         self.assertRefs(['master', 'origin/master'])
-        self.assertRevCount(orig_revs - 1758)
+        self.assertRevCount(orig_revs - 1760)
 
     def test_that_unpack_throws_an_error_when_the_git_clone_nor_shallow_tarball_exist(self):
         self.add_empty_file('a')
-- 
2.25.1


