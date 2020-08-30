Received: from mail-il1-f193.google.com (mail-il1-f193.google.com [209.85.166.193])
 by mx.groups.io with SMTP id smtpd.web10.37101.1598811550685766733
 for <openembedded-core@lists.openembedded.org>;
 Sun, 30 Aug 2020 11:19:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=sEb1UThm;
 spf=softfail (domain: sakoman.com, ip: 209.85.166.193, mailfrom: steve@sakoman.com)
Received: by mail-il1-f193.google.com with SMTP id o16so4739191ilq.0
        for <openembedded-core@lists.openembedded.org>; Sun, 30 Aug 2020 11:19:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=eS9oKnjVzcO23oEmcCDGa7P4BQJ17zh9OI47ry+gbMA=;
        b=sEb1UThmYpJdhqp1pwaFbehlf5qo7oWdcSj9BXVBiQWKFdoO23nnLDFYlua942CI+g
         LUPlT7/8/sjTOUngYP5VnflfgZHkkmtLDT9z72yHyiuJefKdFKQdH9Z9otvd7cLAJpFd
         xcgmjapGPCh6B6B/TtBoaZwZHuocqFjW9fXUSAGwYHMOzFYxuGLSzBGwt+o0WcrLa9eO
         0TATqb+6CudEE0uTWd3V/GJlxvukVzz9KgVXwyy8JZ9l6d+NkDzeQDDqXTImUgWpmFNy
         kku+SQ2jhyZNKfOgneuYHnopIwFjump7Ng7OwC0lDvVze51Fd+VPoYOCXvzDCJyPW6SJ
         A/SQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=eS9oKnjVzcO23oEmcCDGa7P4BQJ17zh9OI47ry+gbMA=;
        b=s4JA0Q3inHt+NDqDc0gO01INb926xlI1q8l1ekDpc+gHbVXvEQWO/9ASHdJ/c5Wfx4
         gXdOiYprzN5fnyN+zqd/sBqkBeFHQ2sF/A/PqI9KDmXjyvANPnWnv0ojtQP56mhoEogf
         N1EaH+Sc7NdAIWvgvLsJWzyxunGEBsvpmfgweWpnPVNfyhi8kCs7NjbtcV+IvyDY8UT0
         QOtcNre4n5lEW/KyiboVD+IAulbOFu/cUJdmDLBwOuK0GSJxVL6YCMjxS8in94HcrIrH
         Fi0PbHlHJs6IDNhE1ULXGXkHLJxqOkD1wGhnjAa4Lxa9qZvN0ZhBT8AUdOn0DXkD+Dng
         zYNQ==
X-Gm-Message-State: AOAM531jo6JBTcXdfm8VwcALKWnN4KP/oyiItfqG+23n36cbE93CLFat
	Gl3sa+RROB1nlRYgs8CjZ9jnMpyYj8gurybtZ1U=
X-Google-Smtp-Source: ABdhPJzHhtiiUMb+wpfop2AeaO5TzTgKj9QTsVX1Ixe9/PrmZr6LkRDcDn7WASXxTS53es2DCXy2Bw==
X-Received: by 2002:a05:6e02:e04:: with SMTP id a4mr6054076ilk.189.1598811549650;
        Sun, 30 Aug 2020 11:19:09 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from octo.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id j62sm2884768iof.53.2020.08.30.11.19.08
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 30 Aug 2020 11:19:09 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 23/25] kernel.bbclass: run do_symlink_kernsrc before do_patch
Date: Sun, 30 Aug 2020 08:16:17 -1000
Message-Id: <4425ddd70d77fa0b45ee08e405937ab5f31f16f8.1598810890.git.steve@sakoman.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1598810890.git.steve@sakoman.com>
References: <cover.1598810890.git.steve@sakoman.com>

From: Rasmus Villemoes <rasmus.villemoes@prevas.dk>

There's a race between do_symlink_kernsrc and do_populate_lic, since
the latter is ordered "after do_patch"; so the two may run in
parallel. In some cases, that actually causes do_populate_lic to fail
if it happens to look for a license file somewhere under ${S} in the
short window after shutil.move and before the symlink has been
created.

Fix that by simply ordering symlink_kernsrc before do_patch. Any task
that pokes around in ${S} looking for files should be ordered after
do_patch, so this should also fix similar latent races with other ad
hoc tasks.

Signed-off-by: Rasmus Villemoes <rasmus.villemoes@prevas.dk>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit c5dfc2586b4135cc86e91bb04fed837daf505676)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/classes/kernel.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
index 9e3c34ad48..9eb9bd2844 100644
--- a/meta/classes/kernel.bbclass
+++ b/meta/classes/kernel.bbclass
@@ -152,7 +152,7 @@ python do_symlink_kernsrc () {
             shutil.move(s, kernsrc)
             os.symlink(kernsrc, s)
 }
-addtask symlink_kernsrc before do_configure after do_unpack
+addtask symlink_kernsrc before do_patch after do_unpack
 
 inherit kernel-arch deploy
 
-- 
2.17.1

