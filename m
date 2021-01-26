Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
 by mx.groups.io with SMTP id smtpd.web11.13180.1611672218366309392
 for <openembedded-core@lists.openembedded.org>;
 Tue, 26 Jan 2021 06:43:38 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=Lpfxt+FC;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.174, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f174.google.com with SMTP id o20so10562159pfu.0
        for <openembedded-core@lists.openembedded.org>; Tue, 26 Jan 2021 06:43:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=hYb9M3tHAB0Z+QqhryWgFm81/T6LHVW9dkoOnS5RBag=;
        b=Lpfxt+FC9GSwdE2vwWNq41BTJ6fbKWFj8bLbPNcBzSz7AdWfDGdid52pBP+g7Ps0ii
         KJhnDVdSRt5bkeZbmDnse+ddk623N4OHYo81m2kwvNEnvxt8hZtIZ43OBc099wEpHp5y
         9Vg64nsWLGteCL8NVFmZxhvUdrDj/lMAzIT/9yKHAh5vrVNzBvdnEEsewnp5dmmoSmok
         2idw2bfvx6q8zCdrtsWiTbGWqNp5F8ysYRZ3El8qEbNCIlMYhsuX1nR1CqUmz6Ah5J3K
         j7FZYZ7sb5vaCDl/TZI+IkPeb/HzhZjQxhnyj0twR0ww9uAd6t5mJ/mi5bFvtpmbzeQK
         knww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=hYb9M3tHAB0Z+QqhryWgFm81/T6LHVW9dkoOnS5RBag=;
        b=YX5VJiVR6jvRijL8WJO3H8mcx1cSkJ+zzFgThRH5wGrmbLBlzxdTRGRXK4ySl/dY8s
         PZ3t28hva50ohxY3sImkKcBfufNKAvt2MLsPt4Sxw+6SVpMcO39MPpItnAMgOWAZKzth
         p9Me5SZWkXJPRRutPIMw1aXbQZ0IpdZwvM0iLqMfbGu2Q5IaRCsaw8RDOZMVTzyeHeJF
         lJMMh+Bf2JPTsIi2ROP5CK5HIu4Z3R3u50pObUyBnoYlUeDjGwOO6eK+SZugg3fovc7z
         M66kkYwbQkIIMYgvhME9v1xHbXGrw5XqdzGLLzVTVmntgWm4pBV16fRinKVZEGQVXBFM
         it5g==
X-Gm-Message-State: AOAM530FbuitE/bersLsc0Rziy2R6VyTyWhx/s5dMsGkPpvQL9PT5TgP
	hr3nU7v4HYWyNVSI1RDqKlv0oDWr+YheqGnC2ik=
X-Google-Smtp-Source: ABdhPJy4+4pzwL3/8tVBJfG4iSL6OVF2KoXc2k3SCXLmLcq81Jh5KkdL0R7w+oSfJURAZW2uHQPSyA==
X-Received: by 2002:a63:e5e:: with SMTP id 30mr6094861pgo.181.1611672217078;
        Tue, 26 Jan 2021 06:43:37 -0800 (PST)
Return-Path: <steve@sakoman.com>
Received: from hexa.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id 11sm19303634pgz.22.2021.01.26.06.43.35
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Jan 2021 06:43:36 -0800 (PST)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell V3 31/46] lib/oe/path: Add canonicalize()
Date: Tue, 26 Jan 2021 04:41:42 -1000
Message-Id: <c3bbda7da2033c4ae4a1bf9a3ab32b633374473c.1611671734.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1611671734.git.steve@sakoman.com>
References: <cover.1611671734.git.steve@sakoman.com>
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

