Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
 by mx.groups.io with SMTP id smtpd.web10.27039.1610326001987963645
 for <openembedded-core@lists.openembedded.org>;
 Sun, 10 Jan 2021 16:46:42 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=P6WpgHjg;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.178, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f178.google.com with SMTP id t6so8634427plq.1
        for <openembedded-core@lists.openembedded.org>; Sun, 10 Jan 2021 16:46:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=ZoE8v5NloBe+NFf2Lkpg9XME2df22PYseJl6JxM3Spw=;
        b=P6WpgHjgXPcmhaVqeBXFv8W0G0MPh4+Gifr9NQvWfPjo1khF2CUtVHkU2CcaijCZXg
         q+vuQukQu6SoRpIqWJ59KngmeORsmS2ZO2+dd2Rkql0mv+i1szB/dgiguuOP2HBW3AHD
         5Lyea64nj/M3xzpzaKtP9RC9UBYCZs+9t+AFntUDzk5FJq/PTvWf+xKsH71UsHV4nenN
         HFg0JPRtUf1U/8oP3+9hkpmtbIrdreeH866PWtGXJokU//ft4HyigAtfFnL1FAWAaxzO
         AZb0dQ9DMGcITfe0ck9Lz15g9S/PHJBDGWegWlmeUSm7kpZnDrf268l3MP1aD91zDyYV
         3n3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=ZoE8v5NloBe+NFf2Lkpg9XME2df22PYseJl6JxM3Spw=;
        b=Yh8G5YdIUJKlGKZ8+hjeIVqTXf8YdyeP0iSwC32NeJSdC+hLF2XRiLqIlkkmkDu7Mt
         kXDWcOjF4D87n83j1hlSldvlyVa/5W66RQHq3GxHhm+EgM5l4s7rP05esulO5RZBLJ2q
         EM+bGn5iWJK6bqGEbQkL1Q1HmKC6xz+EdvX9Ai0bopfmqih1pWhB/GDjcXo/67iaVtZv
         BG3MDQ06eo1pa0Hn+jJtw1vdqzBYauv3rXXYGD4FMaIUImAr40F/8cDLNu7d7PoanCRI
         L92qu2bTSlX3VkE7BpwLSI4hHVBS58mVXsIr1kfx1GNyGSZR9hhM5v1sPNi1HUQfHEf8
         PKNw==
X-Gm-Message-State: AOAM533uzWIEQpfAHS7EJa5kVhtv9u1M3JGCYTRdZx8qi/VO9PIwKr+I
	Nt+KNzOXQnMu8IdXhmKZ13ik9GZeuIHloP0ivwA=
X-Google-Smtp-Source: ABdhPJy+lLESQ6lnimA+Ddd2or2pjT53L3G5Hl4qToBzw1r0xuFMjGEY4PBFufZQh25d1SW7Krzxwg==
X-Received: by 2002:a17:90b:46d2:: with SMTP id jx18mr15389723pjb.106.1610326001142;
        Sun, 10 Jan 2021 16:46:41 -0800 (PST)
Return-Path: <steve@sakoman.com>
Received: from octo.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id v125sm17729079pgv.6.2021.01.10.16.46.39
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 10 Jan 2021 16:46:40 -0800 (PST)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 09/12] gcc: Fix mangled patch
Date: Sun, 10 Jan 2021 14:45:50 -1000
Message-Id: <cfa92a4d57f49188ca7b568e2003e4a11526fc95.1610325804.git.steve@sakoman.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1610325804.git.steve@sakoman.com>
References: <cover.1610325804.git.steve@sakoman.com>

From: Richard Purdie <richard.purdie@linuxfoundation.org>

To quote Zhuang <qiuguang.zqg@alibaba-inc.com>:
"""
A few days ago, I tried to compile a gcc plugin with the toolchain from poky sdk.
It failed with errors about missing header files such as backend.h etc.

After investigation, I found that the problem was brought by a gcc patch:
0012-gcc-Fix-argument-list-too-long-error.patch (which is considered derived from the original patch)

- headers=`echo $(PLUGIN_HEADERS) $$(cd $(srcdir); echo *.h *.def) | tr ' ' '\012' | sort -u`; \
+ headers="$(sort $(PLUGIN_HEADERS) $$(cd $(srcdir); echo *.h *.def))"; \

It changes the commands of install-plugin, making the sorting taken effect before the shell globs.
Thus results in the header files under gcc $(srcdir) being not installed.

By checking log.do_install, we can find that the `headers=' statement to run is incorrect and will not work as expected:
headers="$(cd *.def) *.h ../../../../../../../work-shared/gcc-10.1.0-r0/gcc-10.1.0/gcc/../include/ansidecl.h ...

As the patch says,
"The PLUGIN_HEADERS is too long before sort, so the "echo" can't handle it, ..."
my suggestion is that we can simply take care of PLUGIN_HEADERS
using the original proposed sort.
"""

This fixes the gcc patch as proposed as it does appear its been
broken over time.

(From OE-Core rev: dce28d8ac7fbae487cb6674b91fe2b574036b26d)

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 94eb5724b111cf3409219be3b169af79858eab7b)
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../gcc-9.3/0012-gcc-Fix-argument-list-too-long-error.patch | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/gcc/gcc-9.3/0012-gcc-Fix-argument-list-too-long-error.patch b/meta/recipes-devtools/gcc/gcc-9.3/0012-gcc-Fix-argument-list-too-long-error.patch
index 9d98878096..f0b79ee145 100644
--- a/meta/recipes-devtools/gcc/gcc-9.3/0012-gcc-Fix-argument-list-too-long-error.patch
+++ b/meta/recipes-devtools/gcc/gcc-9.3/0012-gcc-Fix-argument-list-too-long-error.patch
@@ -17,6 +17,10 @@ $(sort list) doesn't need this.
 Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
 
+RP: gcc then added *.h and *.def additions to this list, breaking the original
+fix. Add the sort to the original gcc code, leaving the tr+sort to fix the original
+issue but include the new files too as reported by Zhuang <qiuguang.zqg@alibaba-inc.com>
+
 Upstream-Status: Pending
 ---
  gcc/Makefile.in | 2 +-
@@ -31,7 +35,7 @@ index fef6c4c61e3..57cf7804f0a 100644
  # files. All other files are flattened to a single directory.
  	$(mkinstalldirs) $(DESTDIR)$(plugin_includedir)
 -	headers=`echo $(PLUGIN_HEADERS) $$(cd $(srcdir); echo *.h *.def) | tr ' ' '\012' | sort -u`; \
-+	headers="$(sort $(PLUGIN_HEADERS) $$(cd $(srcdir); echo *.h *.def))"; \
++	headers=`echo $(sort $(PLUGIN_HEADERS)) $$(cd $(srcdir); echo *.h *.def) | tr ' ' '\012' | sort -u`; \
  	srcdirstrip=`echo "$(srcdir)" | sed 's/[].[^$$\\*|]/\\\\&/g'`; \
  	for file in $$headers; do \
  	  if [ -f $$file ] ; then \
-- 
2.17.1

