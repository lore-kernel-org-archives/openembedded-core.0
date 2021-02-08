Received: from mail-ot1-f46.google.com (mail-ot1-f46.google.com [209.85.210.46])
 by mx.groups.io with SMTP id smtpd.web09.35254.1612792538819433106
 for <openembedded-core@lists.openembedded.org>;
 Mon, 08 Feb 2021 05:55:38 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=TT1jzCzU;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.46, mailfrom: steve@sakoman.com)
Received: by mail-ot1-f46.google.com with SMTP id e5so7377301otb.11
        for <openembedded-core@lists.openembedded.org>; Mon, 08 Feb 2021 05:55:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=oeJTQWjSz1W2GuEb5XpU0UM5pqdfbFfun+oIKKacfUs=;
        b=TT1jzCzUrz0S2Z+chN4X32yPMo6pw/GlqovV0pWmalefbS4B/tiCj+ByQt38KBalwg
         64TDZv+l4Kvgtae7mlp45fjzF7MFRluESjoCzG9/CpyE6Ugf3viV7VNzk8LLa0WMC6kK
         KPcnuXXNgXQAgZHKrarAoYSS4C2saurIICi6Gk8LhUrV1Ap9bN2DTAUJkmeObUHzP34O
         F7SBltaQc2esd80oRD9ZRSpd1qt5cSLwQqiWEcVAbtAbe7BsXYnOuKV0A3aPEpvfqcY2
         y2DB/5o3D+rPUMmTVQ+kqQh1fQGQ8HkEk9WZ46jFR/5m3gYvts9w5N5tMGbxFy7d4/dj
         sqPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=oeJTQWjSz1W2GuEb5XpU0UM5pqdfbFfun+oIKKacfUs=;
        b=ci7+koH8ppywkp3x39q2zwaomD2tABGObvfVMlnf0zo0edM8DlIHC0a8hfCtOyVXvH
         9RHcJuBJnwTIqGzgVSOuC4gs2ByT9W1HENioE4kWPr3wnNS08DCWrySMHAjmXL4gLsdy
         PSg4owQYWpUJxdfwxGZ1YxlS2vOsUf8PkI6A4g6QX74Qqepr5cE2SC25+vF0gpkGzHVg
         NAyZlzpuPP6iUDjKeW961bXam8IRFZX06NskZiJtNN+Mb3nM8dY8LvO5pVSWLiIqFJEx
         QHyWHKjQ134mCKPIrzDWV5Q3Ct1Id69B0e+9jlv3oiadNvkn9QymXRUJ4HfRehg80QHc
         /kfw==
X-Gm-Message-State: AOAM530drH5Ni+ebYtfq/Rp/c6ucKVwFNZp8u57NVSMCKNtJsONB+2+o
	W59+EXYAJat4ri+hEhsbpN1C/uNoNhELk9OxlM0=
X-Google-Smtp-Source: ABdhPJwfQ5xO5+wBddbESVtxH+E2D33g5AHGD0B8yVM1kSSjc8L2OKQcMkMZRt/QODdxf//nNjvqGQ==
X-Received: by 2002:a9d:6852:: with SMTP id c18mr13022280oto.166.1612792537727;
        Mon, 08 Feb 2021 05:55:37 -0800 (PST)
Return-Path: <steve@sakoman.com>
Received: from hexa.router0800d9.com ([72.173.249.164])
        by smtp.gmail.com with ESMTPSA id g8sm2023833ooe.21.2021.02.08.05.55.33
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Feb 2021 05:55:37 -0800 (PST)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 24/28] sstatesig: Add descriptive error message to getpwuid/getgrgid "uid/gid not found" KeyError
Date: Mon,  8 Feb 2021 03:52:16 -1000
Message-Id: <508d08bb207f98d5bb2b62ccb07e714fce250154.1612792088.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1612792088.git.steve@sakoman.com>
References: <cover.1612792088.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Tomasz Dziendzielski <tomasz.dziendzielski@gmail.com>

If path is not owned by any user installed on target it gives
insufficient error "getpwuid(): uid not found" which may be misleading.
This exception occurs if uid/gid of path was not found in PSEUDO_PASSWD
files, which simply means the path is owned by host user and there is
host user contamination.

Add more information to the exception message to make it easier for user
to debug.

[YOCTO #14031]

Signed-off-by: Tomasz Dziendzielski <tomasz.dziendzielski@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 38540b59ed4ec8632e30a5fd6364b010d9da8470)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/lib/oe/sstatesig.py | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/meta/lib/oe/sstatesig.py b/meta/lib/oe/sstatesig.py
index f98543cc46..aeceb100d7 100644
--- a/meta/lib/oe/sstatesig.py
+++ b/meta/lib/oe/sstatesig.py
@@ -552,9 +552,11 @@ def OEOuthashBasic(path, sigfile, task, d):
                     try:
                         update_hash(" %10s" % pwd.getpwuid(s.st_uid).pw_name)
                         update_hash(" %10s" % grp.getgrgid(s.st_gid).gr_name)
-                    except KeyError:
+                    except KeyError as e:
                         bb.warn("KeyError in %s" % path)
-                        raise
+                        msg = ("KeyError: %s\nPath %s is owned by uid %d, gid %d, which doesn't match "
+                            "any user/group on target. This may be due to host contamination." % (e, path, s.st_uid, s.st_gid))
+                        raise Exception(msg).with_traceback(e.__traceback__)
 
                 if include_timestamps:
                     update_hash(" %10d" % s.st_mtime)
-- 
2.25.1

