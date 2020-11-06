Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com [209.85.215.169])
 by mx.groups.io with SMTP id smtpd.web08.12312.1604673388623111217
 for <openembedded-core@lists.openembedded.org>;
 Fri, 06 Nov 2020 06:36:28 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=zb7WOj7V;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.169, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f169.google.com with SMTP id t14so1093733pgg.1
        for <openembedded-core@lists.openembedded.org>; Fri, 06 Nov 2020 06:36:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=I34skhNXjwgNOdQSZ6IAFHljFV6GjeSbGIAAdAJYNWc=;
        b=zb7WOj7VgVdZR9k/CzuknIEnA/U0vv/ECJmw7V7XxdVbcy7rubzPahNlcSJ5p3Klst
         /z0r4dRID5oHzWz4a9sfmxlz1bOXCTX3LR5ZJ+bkgR9MQoX6gOh9UkB1H+sHucrterAl
         EtOEwFCQXTfU0PjkY5cWr67zseS7iqfuiwjarPqQm1CDzMrta9iYP/LrUfIwmTu+qy8a
         l/nDHUMzHkyls9fGL4EYTAxd2DIVjHDVona2cFC8eMc1drXbIVvSfpDp3KPPyFKBHCb0
         XfLNZel/VVfYdma1hT8jDSg4kWkNuu/syx6gih0EjCPmu79cs8VWjNcdhEm+GcnWWYyH
         qY5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=I34skhNXjwgNOdQSZ6IAFHljFV6GjeSbGIAAdAJYNWc=;
        b=WF88VPAoI4M+uCKw4Rtb6bJ3zTXdOR3A9VXmNWqeJ1bKKoQ99+7XLXMDo2I3pSY869
         5cZUwjcYxC86QC6wHULr4Tzvy3zjUSq+oOHDa+4+diohRO+iqsJQs6dbzzjLEPwAR64Z
         hm4xZ01TnUePzF+8UU+TvIIOKD/99ZoicvYupUkbcbGfUtt8yRrOFFhdPTWdMpku1si1
         eHu/+KlZBV9IoM8O9BSIBAPYwkusWseSXRSB2JWJCKuZJLwCLSCSHGaBZ1R+RqVp5yYZ
         9Xh8gHhCIGk1/m71Cthm+QHPqLBmrFbhZIdM0s2p+nuxTAjoh6ggG0C29D4W+/Su1QZw
         Kx+g==
X-Gm-Message-State: AOAM530ffKaw3ne/llUaLGrB/nfZik1HeRov5QNv7mSGFo0WaFcGgN9k
	Jaq9/D/rfw8VfXXgzeTyq4hEUGfAT+l30pyB
X-Google-Smtp-Source: ABdhPJwPf+7JkKeEY/Vux7C4aVZ0IKs640sCXLJhdpyIyAyQDSphfRcBVgQIU3Fo07clGedZGXAnOQ==
X-Received: by 2002:aa7:8704:0:b029:18a:e2c9:c38 with SMTP id b4-20020aa787040000b029018ae2c90c38mr2239098pfo.79.1604673387748;
        Fri, 06 Nov 2020 06:36:27 -0800 (PST)
Return-Path: <steve@sakoman.com>
Received: from octo.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id jy19sm2765166pjb.9.2020.11.06.06.36.26
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2020 06:36:27 -0800 (PST)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 03/20] lib/oe/patch: GitApplyTree: save 1 echo in commit-msg hook
Date: Fri,  6 Nov 2020 04:35:18 -1000
Message-Id: <bbd467c393af5fa34a0b92d5461ff0bf427b3933.1604672839.git.steve@sakoman.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1604672838.git.steve@sakoman.com>
References: <cover.1604672838.git.steve@sakoman.com>

From: Martin Jansa <martin.jansa@gmail.com>

* also remove the extra blank lines which is often added to patches
  when refreshed with devtool (GitApplyTree.patch_line_prefix lines
  are ignored when refreshing .patch files, but newly added blank
  lines aren't - the leading blank line wasneeded for patches with
  just the subject line (to prevent the GitApplyTree.patch_line_prefix
  line ending appended to the commit summary), but we can add it
  in prepareCommit instead

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/lib/oe/patch.py | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/meta/lib/oe/patch.py b/meta/lib/oe/patch.py
index fa92abe248..bb1c40aa1e 100644
--- a/meta/lib/oe/patch.py
+++ b/meta/lib/oe/patch.py
@@ -508,8 +508,7 @@ class GitApplyTree(PatchTree):
         with open(commithook, 'w') as f:
             # NOTE: the formatting here is significant; if you change it you'll also need to
             # change other places which read it back
-            f.write('echo >> $1\n')
-            f.write('echo "%s: $PATCHFILE" >> $1\n' % GitApplyTree.patch_line_prefix)
+            f.write('echo "\n%s: $PATCHFILE" >> $1' % GitApplyTree.patch_line_prefix)
         os.chmod(commithook, 0o755)
         shutil.copy2(commithook, applyhook)
         try:
-- 
2.17.1

