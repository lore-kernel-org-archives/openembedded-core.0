Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
 by mx.groups.io with SMTP id smtpd.web10.363.1611586393563612496
 for <openembedded-core@lists.openembedded.org>;
 Mon, 25 Jan 2021 06:53:13 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=qtvg29qt;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.182, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f182.google.com with SMTP id u67so8525658pfb.3
        for <openembedded-core@lists.openembedded.org>; Mon, 25 Jan 2021 06:53:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=hYb9M3tHAB0Z+QqhryWgFm81/T6LHVW9dkoOnS5RBag=;
        b=qtvg29qtPMNPy9zQvtqZGOJtQCr9ks5WE+Oc/KCzSZ0JkaA1Q9lPOyekcx+6QRLQZI
         hbJUFO/WN6iikyrvfHbn0Fk/nWBgVsIsffXX5zD9AnevvDBiHeeynaBuMuhOsSrHThb8
         Q3s0GRtWsqZJmZpmiPQgfS3GDDYoqLumuRmYEr6kxfDCMFOcKhPqpfoPJNGxrRITe2co
         R7pzs0nqU5UEW+k2djinsRtCJR/Sx2ituiiChljNyT9/GSMQCkM2v4xVsFZ+ZLsHVElN
         H5Lxlao2iS2n5HjaAQ0CcxYXgmdx3P7/wYmGuRsY6zThHmY6xUjcIu8gVRiE/Ez3CvYJ
         SFhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=hYb9M3tHAB0Z+QqhryWgFm81/T6LHVW9dkoOnS5RBag=;
        b=aNWf0sE8JaTGbZgoC1wlkWo72xK16R/r/2kAJX3kDeORv8hSdQR8I/g3T4vY/QM3rq
         3NdvcP08CQELsVdw2fNj3OXX4PtYAp5iU7chrNnZTVw9G5VXyUYeET1llopDvyOyexOH
         9e/eJg1U+ip2GTayvpGiv0vH471MVzzN5LVZXRcg0cxwbJEAcmd4x1xhLu3P8qEgpO3t
         eZIs6haK6S8wVNBN+oTcVr/qQz3zuiUvwXISUSdr2vNox8nxIeqw6zTXszoVKdaZ7Btg
         2p8JZiyldJUZHWTa8xznbl9DZOdun8/3/7jDp1mm4SYZapdPsQ/HR0VGarhaSCjw2NlY
         RlkA==
X-Gm-Message-State: AOAM531TSoxl7zPUXp4QHwQfKzW88z/s7fEu7APZ9LvABQPFFeyMJf3o
	W5n29WfG2wzTpRT479arMZwwnLdL3IWExSPlxJc=
X-Google-Smtp-Source: ABdhPJxqglU+wo0NCEz+z39F/4OQVgQZprPTuU+iIWhuCYw39taNtU2k4CJN4kw2klBxwWaWwERMMw==
X-Received: by 2002:a62:6047:0:b029:1ac:6091:cf50 with SMTP id u68-20020a6260470000b02901ac6091cf50mr835411pfb.40.1611586392583;
        Mon, 25 Jan 2021 06:53:12 -0800 (PST)
Return-Path: <steve@sakoman.com>
Received: from hexa.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id x8sm17574354pfn.27.2021.01.25.06.53.11
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Jan 2021 06:53:12 -0800 (PST)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 32/47] lib/oe/path: Add canonicalize()
Date: Mon, 25 Jan 2021 04:51:04 -1000
Message-Id: <ac69ec6f06f5805af01a254264bcd45cf2f8da20.1611585425.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1611585425.git.steve@sakoman.com>
References: <cover.1611585425.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>

oe.path.canonicalize() is used to canonicalize paths (i.e., remove
symbolic links and "..", and make them absolute). It takes a string
with paths separated by commas, and returns the canonicalized path in
the same format.

Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 282b19c0e27488ec119f00fb2542ffdc1af54e2a)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/lib/oe/path.py | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/meta/lib/oe/path.py b/meta/lib/oe/path.py
index 082972457b..c8d8ad05b9 100644
--- a/meta/lib/oe/path.py
+++ b/meta/lib/oe/path.py
@@ -320,3 +320,24 @@ def which_wild(pathname, path=None, mode=os.F_OK, *, reverse=False, candidates=F
 
     return files
 
+def canonicalize(paths, sep=','):
+    """Given a string with paths (separated by commas by default), expand
+    each path using os.path.realpath() and return the resulting paths as a
+    string (separated using the same separator a the original string).
+    """
+    # Ignore paths containing "$" as they are assumed to be unexpanded bitbake
+    # variables. Normally they would be ignored, e.g., when passing the paths
+    # through the shell they would expand to empty strings. However, when they
+    # are passed through os.path.realpath(), it will cause them to be prefixed
+    # with the absolute path to the current directory and thus not be empty
+    # anymore.
+    #
+    # Also maintain trailing slashes, as the paths may actually be used as
+    # prefixes in sting compares later on, where the slashes then are important.
+    canonical_paths = []
+    for path in (paths or '').split(sep):
+        if '$' not in path:
+            trailing_slash = path.endswith('/') and '/' or ''
+            canonical_paths.append(os.path.realpath(path) + trailing_slash)
+
+    return sep.join(canonical_paths)
-- 
2.25.1

