Received: from mail-il1-f172.google.com (mail-il1-f172.google.com [209.85.166.172])
 by mx.groups.io with SMTP id smtpd.web08.9846.1614349601317104317
 for <openembedded-core@lists.openembedded.org>;
 Fri, 26 Feb 2021 06:26:41 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=TOhsZ8SX;
 spf=softfail (domain: sakoman.com, ip: 209.85.166.172, mailfrom: steve@sakoman.com)
Received: by mail-il1-f172.google.com with SMTP id e2so8143566ilu.0
        for <openembedded-core@lists.openembedded.org>; Fri, 26 Feb 2021 06:26:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=hYuEUyQmvwwa6uMobuVicq33DdYbHvZ9iw5tIB8La5g=;
        b=TOhsZ8SX3mWTmXdda2G3JhQZSAX0mtmzv6Mlso/GCm1Svssegl1vtcpiUiQ5P8GqoM
         eMzHC3JEeXgRiZwwG2I+a94brZO+nmaCoBCybGFcrrnpaOD/8H277cx6HlXrPsIwFOr4
         xd+v/C80G6kzYwDeDWHCdLdY/TWa+lL6pyqZInfdW7SwXpEn/1VWAAjCYD5FFm7O4ljU
         081uy6NW770qyehz3ao5JoRvwx2jpj0+OH1V6B2l1dfqg5o9IUiiLVy2h2VTQvSg0Q+j
         AxJ2jgFb3O9KJ3fP59y7svcXrXE6PPLstdqGYu/T/TUeC4f3DIaJ7ZrmtKtwQsGUt4KJ
         UmOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=hYuEUyQmvwwa6uMobuVicq33DdYbHvZ9iw5tIB8La5g=;
        b=MXFK4OggoGtnwxyfb/a05i47wGMJKRQ7AaP8Wplxc/IN0zoS9/HlDCUMfW1IEBc/mD
         tS9kImi5S13J61fdwubCnfPjhcnEJa2EUdD/oNVETc0sQYg8w92VZBFLKyMzqYcSBRyc
         mi2EvBaYsxWHgU6lDasBmJUd5VDpG9bVVKC3+1QLMoQgiUiKGG5nNEGQKss0z46LpuqQ
         aIM0HKV8rw4C43YwsJrkyIcNXjSz4d+eCEhpktgxrWHpMMR3DmYAlYCaJN3fpqo1wUFW
         YZhVOkXPQ9g3FN1B3qaRN2BPyqFNVGfkVWO3qONM60vtPe5TKQyhIHVhz7wC1KUTDcql
         jkUQ==
X-Gm-Message-State: AOAM530lLFTy/btYAywg4CbKnYVIgnabU6m44tJrDFuVRdzakPgQyZdN
	eZUWLRyYmb+YO5kV6Wtt2sBM2KgE0D+Mr2uG
X-Google-Smtp-Source: ABdhPJzad0O95HL46nT+LOq0YUbRv4jQkQn9qGVP+v2DDr3iqjZrPMaITSdEn48N8BQzcrg9g08Uuw==
X-Received: by 2002:a92:1a0d:: with SMTP id a13mr2565087ila.166.1614349600229;
        Fri, 26 Feb 2021 06:26:40 -0800 (PST)
Return-Path: <steve@sakoman.com>
Received: from hexa.router0800d9.com ([72.173.249.164])
        by smtp.gmail.com with ESMTPSA id i3sm5383377ioq.13.2021.02.26.06.26.36
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Feb 2021 06:26:39 -0800 (PST)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 20/40] vim: Improve determinism
Date: Fri, 26 Feb 2021 04:24:03 -1000
Message-Id: <89d3486e5f7d2a52cd98c5a125686ea4646cead0.1614348990.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1614348990.git.steve@sakoman.com>
References: <cover.1614348990.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Richard Purdie <richard.purdie@linuxfoundation.org>

Add a couple of configure options to avoid determism issues in the vim build.
This can happen due to the addition of glib-2.0 to the native sysroot through
later task additions to the sysroot through indirect dependencies.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 914f86054f5ea0a115767c1b3d9cdb4c4ef9545b)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-support/vim/vim.inc | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-support/vim/vim.inc b/meta/recipes-support/vim/vim.inc
index 4d2886c19e..1ea40e5e7f 100644
--- a/meta/recipes-support/vim/vim.inc
+++ b/meta/recipes-support/vim/vim.inc
@@ -68,8 +68,10 @@ EXTRA_OECONF = " \
     --disable-gtktest \
     --disable-xim \
     --disable-netbeans \
+    --disable-desktop-database-update \
     --with-tlib=ncurses \
     ac_cv_small_wchar_t=no \
+    ac_cv_path_GLIB_COMPILE_RESOURCES=no \
     vim_cv_getcwd_broken=no \
     vim_cv_memmove_handles_overlap=yes \
     vim_cv_stat_ignores_slash=no \
-- 
2.25.1

