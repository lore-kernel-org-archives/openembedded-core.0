Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BB65ACFC538
	for <webhook@archiver.kernel.org>; Mon, 14 Oct 2024 10:19:35 +0000 (UTC)
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
 by mx.groups.io with SMTP id smtpd.web10.51765.1728901169857871121
 for <openembedded-core@lists.openembedded.org>;
 Mon, 14 Oct 2024 03:19:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=X34rO+7C;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.41, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-43057f4a16eso35681285e9.1
        for <openembedded-core@lists.openembedded.org>; Mon, 14 Oct 2024 03:19:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1728901168; x=1729505968; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=nW9sSQtim0beqO9hpsuRe4en47ko2CtVXA51CSnqDGQ=;
        b=X34rO+7CYls78YBsnjBq55b0Qnlv5jTQMXRJ+dFHgnQjeiNWzm7f3MzRPeDDLfF2Bh
         9Xe8DcoR+qKXjghS5dq/21LxLYrgD/qc3Mwz644OdrBpyC/t1GQLH6Fd1QlrP/kTkOgR
         4cqYCiD4sAhdc0Yff3OVv/K0IyH1AowwQsoPc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728901168; x=1729505968;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=nW9sSQtim0beqO9hpsuRe4en47ko2CtVXA51CSnqDGQ=;
        b=mQ65MaDpgvtU5phyK+KRyDPbk1UPT63LjnKax8ZUYf4IPNuLcyJc9o9tzFqPLxpDuK
         /tj787DLkuhMUuIT9McHlGEExOuJ4LafLWGIXA0tphzxbT6/E3BSVrgfW24d50iDKHVy
         2qeSj+fz1vsem0Xtehei63KvArRGHdS87c9oOITaH9frQUaIcBCU9P2lBNcxNBjFe62w
         PF+fvT5q4kqsXi27hlaGGL6I3pGEOck4bCACjeyM82p22gaH+t3BIi0LhnvoIzPyF3Bn
         LfxiZs/cNoEYtjwdCOoQJcN7zOCjBl9JQ+3hOh2yNhRMYkD/+uOgJb7g9Rj5gNXmGTj7
         iPHw==
X-Gm-Message-State: AOJu0YyVJKUH4046JHhteBhg5L3M+qStH2SGnjsmo7bn2EwlUxjZ1cJK
	RjPEvSb2CBf4LGNRnrn9eI0BBx+UHS30VcpN0TCDxaA7o7rGu5jiAYoeRQltijacun6/YvK5dv8
	u
X-Google-Smtp-Source: AGHT+IHVXy4FlvpcIj7d0Wg091eQ0JUTiGq+w+kT9WHO6K+sTq6LuW/D4UejkC8TYNrQuOdicQFUEg==
X-Received: by 2002:a05:600c:1d26:b0:42c:a905:9384 with SMTP id 5b1f17b1804b1-4311deec45cmr84824175e9.20.1728901167460;
        Mon, 14 Oct 2024 03:19:27 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:4468:7613:7612:e2d5])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-37d4b6d0071sm10855620f8f.62.2024.10.14.03.19.26
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Oct 2024 03:19:27 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] insane: Don't used cachedpath for os.lstat()
Date: Mon, 14 Oct 2024 11:19:26 +0100
Message-ID: <20241014101926.1458157-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 14 Oct 2024 10:19:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/205738

The functions behave slightly differently to the functions they're
caching and the use in insane.bbclass isn't compatible. For now, to
avoid build failures, switch back to the stat calls. We may be able
to improve cachedpath or change the call sites.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/classes-global/insane.bbclass | 5 ++---
 meta/lib/oe/cachedpath.py          | 4 ++++
 2 files changed, 6 insertions(+), 3 deletions(-)

diff --git a/meta/classes-global/insane.bbclass b/meta/classes-global/insane.bbclass
index 36b139a20d0..efcfa08d2e1 100644
--- a/meta/classes-global/insane.bbclass
+++ b/meta/classes-global/insane.bbclass
@@ -434,9 +434,8 @@ def package_qa_check_buildpaths(path, name, d, elf):
     explicitly ignored.
     """
     import stat
-    global cpath
     # Ignore symlinks/devs/fifos
-    mode = cpath.lstat(path).st_mode
+    mode = os.lstat(path).st_mode
     if stat.S_ISLNK(mode) or stat.S_ISBLK(mode) or stat.S_ISFIFO(mode) or stat.S_ISCHR(mode) or stat.S_ISSOCK(mode):
         return
 
@@ -1050,7 +1049,7 @@ def package_qa_check_host_user(path, name, d, elf):
         return
 
     try:
-        stat = cpath.lstat(path)
+        stat = os.lstat(path)
     except OSError as exc:
         import errno
         if exc.errno != errno.ENOENT:
diff --git a/meta/lib/oe/cachedpath.py b/meta/lib/oe/cachedpath.py
index 0138b791d4b..68c85807d9f 100644
--- a/meta/lib/oe/cachedpath.py
+++ b/meta/lib/oe/cachedpath.py
@@ -111,9 +111,13 @@ class CachedPath(object):
             return True
         return False
 
+    # WARNING - this is not currently a drop in replacement since they return False
+    # rather than raise exceptions.
     def stat(self, path):
         return self.callstat(path)
 
+    # WARNING - this is not currently a drop in replacement since they return False
+    # rather than raise exceptions.
     def lstat(self, path):
         return self.calllstat(path)
 

