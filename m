Received: from mail-pg1-f196.google.com (mail-pg1-f196.google.com [209.85.215.196])
 by mx.groups.io with SMTP id smtpd.web12.20328.1594649850038501925
 for <openembedded-core@lists.openembedded.org>;
 Mon, 13 Jul 2020 07:17:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=2NCLWzVC;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.196, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f196.google.com with SMTP id l63so6060221pge.12
        for <openembedded-core@lists.openembedded.org>; Mon, 13 Jul 2020 07:17:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=jTGOuuGnK3bibmFumubodybkUMxr17Ef7CXLpdAOfzo=;
        b=2NCLWzVCZOKXKVTSPQ18DzpovfnRm+wYgnG5Zs5do0MWDQN1WzbEfLFD+feR3pLb1i
         rmvn+cNlTrHr7+bzV7hpGTV0p05rN1jWnKTRCEHP/Z0hWZ/V3gNtv5l3MUnbFfetMmPr
         xI7yQUdspW6p00qZ1WIBFow8ygf9B3fQuosuNE+aRXGAEAk4lL9a19rnhYwiuMaIMUKN
         DkEbOkAn4zV3fxCPNkF5gUPQp5+rDvRu45lc7kuVo7XwgjB2DEvavTqSzQBusL0qFtn8
         /Diu1X4j/nkQkuoQN0Azcd0axdIxUZHxhg6J70A9qTYmiT1t2rWtzSF0eilLB9DX0ia/
         q+Gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=jTGOuuGnK3bibmFumubodybkUMxr17Ef7CXLpdAOfzo=;
        b=V/VhAh4bPEcol3Ns4KCC6rzTlgR4ZtNNndhfGxdVg/2SybzZ/xBm5KxLdF6GQZ84oM
         zK8BTGNKdLsunYDbed/2JKZdMx56+VIOc6y35JMkXUiz6ABvlEk5B1wOqqPboaeP61Fg
         kablxrmIicpo3GkXlD5c0szCoC6TteSTj2FX1LshTrF/16pC5FM0J5cGK/+w1ob66HoU
         HrEOI4XvrvG4gDh9KxM7WpJtV/isfAVl+LwaCew7CaWF6sxOSwUxN4jcSpMKPkJ4pR9y
         TNSMEC+B5cVW9ARo/fQ+cmcruiNFqNkQ49bCksGJsSGOrpS+MKJIA1+cf1K9sWMXTVce
         b2dA==
X-Gm-Message-State: AOAM5315eKo9MBgo/iKUSfvTK6JhdpMMD1fI9ZCx3VbHX5CD56ctKfZD
	RmCdRFc5aZNkuvvoGBqKqsd+xjUDIShhZA==
X-Google-Smtp-Source: ABdhPJwMso72Yj6YYAVbiwac3R1GCOlPbtA6e8Hk7QvKIi5OZZybY1krIptzL43o5C9IiRUB+7P/Ow==
X-Received: by 2002:a63:3fc2:: with SMTP id m185mr71230443pga.426.1594649849090;
        Mon, 13 Jul 2020 07:17:29 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from octo.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id k7sm13723738pgh.46.2020.07.13.07.17.27
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jul 2020 07:17:28 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 04/15] classes/archive: do_configure should not depend on do_ar_patched
Date: Mon, 13 Jul 2020 04:16:52 -1000
Message-Id: <2399fdf98a6e6e4245c2e7ed1f72404ebece3eca.1594649587.git.steve@sakoman.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1594649587.git.steve@sakoman.com>
References: <cover.1594649587.git.steve@sakoman.com>

From: Joshua Watt <JPEWhacker@gmail.com>

The commit d4be264061 ("classes/archiver: run do_unpack_and_patch after
do_preconfigure") correctly moved do_unpack_and_patch to depend on
do_preconfigure, but left do_ar_patched as a dependency of do_configure
introduced from 8a7c779487 ("classes/archiver: Create patched archive
before configuring"). Having do_configure depend on do_ar_patched is
blatantly wrong. Firstly, doing so causes the taskhash of do_configure
to change which is undesirable. Secondly, the anon python that sets up
the tasks carefully skips GCC recipes that depend on gcc-source to
provide their source code since running do_unpack_and_patch in them
would delete the source code. Adding in the dependency effectively
bypasses this and makes these recipes delete the shared gcc-source

This fixes errors (for real this time) like:

 cat: .../gcc/defaults.h: No such file or directory

when making certain configuration changes.

For posterity, you could easily reproduce gcc-source being erased by
running the commands (replacing aarch64 with your correct target arch):

 bitbake -c cleanall gcc-source gcc-cross-aarch64
 bitbake -c do_deploy_archives gcc-source

 # The following would fail because
 # gcc-cross-aarch64:do_unpack_and_patch erases shared source, so
 # do_configure after that fails.
 bitbake gcc-cross-aarch64

Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit f02c1904330da47a25cf85f0077712f584f4ee5b)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/classes/archiver.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/archiver.bbclass b/meta/classes/archiver.bbclass
index bf275f4543..1a3c190604 100644
--- a/meta/classes/archiver.bbclass
+++ b/meta/classes/archiver.bbclass
@@ -584,7 +584,7 @@ addtask do_deploy_archives_setscene
 
 addtask do_ar_original after do_unpack
 addtask do_unpack_and_patch after do_patch do_preconfigure
-addtask do_ar_patched after do_unpack_and_patch before do_configure
+addtask do_ar_patched after do_unpack_and_patch
 addtask do_ar_configured after do_unpack_and_patch
 addtask do_ar_mirror after do_fetch
 addtask do_dumpdata
-- 
2.17.1

