Received: from mail-oi1-f196.google.com (mail-oi1-f196.google.com [209.85.167.196])
 by mx.groups.io with SMTP id smtpd.web11.395.1592848856964390329
 for <openembedded-core@lists.openembedded.org>;
 Mon, 22 Jun 2020 11:00:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=M8CGkm06;
 spf=softfail (domain: sakoman.com, ip: 209.85.167.196, mailfrom: steve@sakoman.com)
Received: by mail-oi1-f196.google.com with SMTP id x202so16453130oix.11
        for <openembedded-core@lists.openembedded.org>; Mon, 22 Jun 2020 11:00:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=AoSwC+1WpLqIsy56daD0swEzq9n6hXEoCmt9wfYrHT8=;
        b=M8CGkm06Q3UQXCys7wLzFx62UTnBVbfWQqLmJmbAshLHMyknkLp9fpTk19/wk7JLSH
         YHSjBuykZJ9PBDiy4K4NCaS4LdeW9997Px3G/FLvRXWDSIcGVK5u0gzqhtLcBsbBm5ri
         c05bcZ2rpkQh8tN0OBNOXEY5EnmUPKia6XDC4BfX1ftHYYJv/ZiFMsREbdWCLEUGK8Z8
         DExmBGwDn8cu8Zo++ttvxc6WydlhJ/drFPWmz6PJbUAQ51P1OLksFWGOKTm/k7S9GGbk
         KzF6jcoovWRJpOInkjDjLg0E2kkGP2ZoWI1wmhsdosM6NjBLDLfvdi/9RHX4Tqq9Vsw0
         MlZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=AoSwC+1WpLqIsy56daD0swEzq9n6hXEoCmt9wfYrHT8=;
        b=TReR620Zcz3L7Xr2ffA2lQaPuyWiV67MG8Jia5MOKvmN1aZW8XPGAwrZJkXvHYLNfM
         33IKx6lZCmRrDXfizs66OxbKxfgJA0kK+szPFqcGbGsgntHKEJ46unS8GNN8/2HVKBCC
         1Y5aChVUsZ98vkSVJKCh1/WkAarARKJdb3cq0EG2tLlHvudslgAbyDFPmxRwanDAYxVx
         2At9hDBM8NZW/ok2RW4sv++YzdSSScvKM9kufyd/0ZbWIm8hKqXzP5BxHRJKahHrECH7
         N36H4tqRniqONgoXCP+Xwg2iNqEvNydCwUeC6CApowj4amkvRCtk482Hia4lciihpmzi
         VMXA==
X-Gm-Message-State: AOAM532NhvRJK42NHZb44iHQk2WktmC674tp/JMkF7A9NYrQ8EY8d4mU
	FLxYDpxeWzdYpLuvcd6mNyDNnV8nvsjRLw==
X-Google-Smtp-Source: ABdhPJxgTaNZCeD5BSpnPO8FDqh+iOPHsIrePtGT374OSV9a3YzRq39YWeUOefM6/bYcWmz+feNarA==
X-Received: by 2002:aca:ad88:: with SMTP id w130mr14061322oie.103.1592848855879;
        Mon, 22 Jun 2020 11:00:55 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from octo.router0800d9.com ([99.197.43.113])
        by smtp.gmail.com with ESMTPSA id n60sm3422659otn.75.2020.06.22.11.00.52
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Jun 2020 11:00:55 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 19/33] perl: Fix host specific modules problems
Date: Mon, 22 Jun 2020 07:58:13 -1000
Message-Id: <5aaf9d3a748cbad17a4a3e5d9715ac2f289b007d.1592848337.git.steve@sakoman.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1592848337.git.steve@sakoman.com>
References: <cover.1592848337.git.steve@sakoman.com>

From: Richard Purdie <richard.purdie@linuxfoundation.org>

We were seeing a ton of empty perl modules being created such as
"perl-module-x86-64-linux-encoding" where the name would include
${TARGET_ARCH}-linux. These files were already being filtered in an
earlier do_split_packages() expression so exclude them from the latter
one to remove the pointless empty modules in PACKAGES.

This doesn't explain why some were not deterministic but will recude
the do_package execution time and clean up the build directories
at the very least.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 9f1a959d9831f43dda656e3b0c4d059db3363877)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-devtools/perl/perl_5.30.1.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/perl/perl_5.30.1.bb b/meta/recipes-devtools/perl/perl_5.30.1.bb
index 9d747aa5b4..5f3a9eeeb3 100644
--- a/meta/recipes-devtools/perl/perl_5.30.1.bb
+++ b/meta/recipes-devtools/perl/perl_5.30.1.bb
@@ -310,7 +310,7 @@ python split_perl_packages () {
     do_split_packages(d, libdir, r'Module/([^\/]*)\.pm', '${PN}-module-%s', 'perl module %s', recursive=True, allow_dirs=False, match_path=True, prepend=False)
     do_split_packages(d, libdir, r'Module/([^\/]*)/.*', '${PN}-module-%s', 'perl module %s', recursive=True, allow_dirs=False, match_path=True, prepend=False)
     do_split_packages(d, libdir, r'.*linux/([^\/].*)\.(pm|pl|e2x)', '${PN}-module-%s', 'perl module %s', recursive=True, allow_dirs=False, match_path=True, prepend=False)
-    do_split_packages(d, libdir, r'(^(?!(CPAN\/|CPANPLUS\/|Module\/|unicore\/)[^\/]).*)\.(pm|pl|e2x)', '${PN}-module-%s', 'perl module %s', recursive=True, allow_dirs=False, match_path=True, prepend=False)
+    do_split_packages(d, libdir, r'(^(?!(CPAN\/|CPANPLUS\/|Module\/|unicore\/|.*linux\/)[^\/]).*)\.(pm|pl|e2x)', '${PN}-module-%s', 'perl module %s', recursive=True, allow_dirs=False, match_path=True, prepend=False)
 
     # perl-modules should recommend every perl module, and only the
     # modules. Don't attempt to use the result of do_split_packages() as some
-- 
2.17.1

