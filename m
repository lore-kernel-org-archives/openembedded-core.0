Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D7D13C433EF
	for <webhook@archiver.kernel.org>; Tue, 26 Oct 2021 11:11:49 +0000 (UTC)
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com
 [209.85.128.46])
 by mx.groups.io with SMTP id smtpd.web11.10660.1635246703767059336
 for <openembedded-core@lists.openembedded.org>;
 Tue, 26 Oct 2021 04:11:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=X9YaFU0U;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.46,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f46.google.com with SMTP id
 136-20020a1c008e000000b0032ccae3b331so1147418wma.0
        for <openembedded-core@lists.openembedded.org>;
 Tue, 26 Oct 2021 04:11:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=S/OudJek1fJjfH/KG33l3E4rsAu99rzF7eAzS37g6nU=;
        b=X9YaFU0UHgsFy9QglpRbTkyxvmAcwSUdqIEFRIqawbhOjiVNYSpYfVSE9VkmgOHqcB
         vptltPS6OyjWvB0Cv3YUzLLRrZGHNrTyGihho1psDK2eyX/GIqLCkWc+UE2gQYNcVg4z
         cffCJMEWzBAABTSXSVb5+8gVrrpdMIlaY6ma8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=S/OudJek1fJjfH/KG33l3E4rsAu99rzF7eAzS37g6nU=;
        b=1ohGUaZAiOB8jPg0OnA77ydcs3lYLngv5TJfT9hZmcvgdsJD7WP7PKr2kCGhpBoXqf
         Ec0Gj5+F3fa04/M0DHb4VpHaYjxcukNR2wxSwlEDmRX8uexSj+6PaBBfduBXGHyL0UAe
         3hU+qhZ6oJQ1l5Wd7rmY+k3ZoHRuiy6LXYcEEboKeWa5/ng5xiTYPBNVC0kFKO6EUDpg
         yLroNHmBmBrpIF7ZTRfm8D4OWehaxrbKYnfCeBRlm14ExwY59N5dnYJ1XEENckOed+Pg
         KjEJGgmbFFrSGuqK/qb03fUr8XR7ZzWT7yzmluWMwgIeG0ZPLDTDv+ZoJcXzLNC+8Kfp
         j2mA==
X-Gm-Message-State: AOAM533aZPQxcxgnpIw+YDsEbWsjrRe8T8Pr+6DiURsyIiNEwief1LZ/
	UovShl2puJH6qSxpuQxk2xsSIuVog16ezA==
X-Google-Smtp-Source: 
 ABdhPJzvK0XMnEu1Xx4QLESYmFpWJKLT7Oq+QycTreiM/bhq9x+NjeLB6TdbLKVEoGgn5nIdO7Qpig==
X-Received: by 2002:a05:600c:4ed3:: with SMTP id
 g19mr7078249wmq.85.1635246702218;
        Tue, 26 Oct 2021 04:11:42 -0700 (PDT)
Received: from hex.int.rpsys.net ([2001:8b0:aba:5f3c:6b9e:385e:1583:4f40])
        by smtp.gmail.com with ESMTPSA id
 f17sm11403510wrv.89.2021.10.26.04.11.41
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Oct 2021 04:11:42 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 3/4] gcc: Fix nolibstdc++ patch
Date: Tue, 26 Oct 2021 12:11:39 +0100
Message-Id: <20211026111140.3298966-3-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20211026111140.3298966-1-richard.purdie@linuxfoundation.org>
References: <20211026111140.3298966-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 26 Oct 2021 11:11:49 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/157385

Somewhere along the line the docs patch was corrupted with incorrect
changes. Strip these out and clean up the patch.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 .../gcc/gcc/0005-optional-libstdc.patch       | 28 ++-----------------
 1 file changed, 2 insertions(+), 26 deletions(-)

diff --git a/meta/recipes-devtools/gcc/gcc/0005-optional-libstdc.patch b/meta/recipes-devtools/gcc/gcc/0005-optional-libstdc.patch
index c921ac3340c..c64fbf6a976 100644
--- a/meta/recipes-devtools/gcc/gcc/0005-optional-libstdc.patch
+++ b/meta/recipes-devtools/gcc/gcc/0005-optional-libstdc.patch
@@ -55,12 +55,10 @@ diff --git a/gcc/doc/invoke.texi b/gcc/doc/invoke.texi
 index 6659a903bf0..9ee63dbe52f 100644
 --- a/gcc/doc/invoke.texi
 +++ b/gcc/doc/invoke.texi
-@@ -239,6 +239,9 @@ in the following sections.
+@@ -239,6 +239,7 @@ in the following sections.
  -fno-weak  -nostdinc++ @gol
  -fvisibility-inlines-hidden @gol
  -fvisibility-ms-compat @gol
-+-fvtable-verify=@r{[}std@r{|}preinit@r{|}none@r{]} @gol
-+-fvtv-counts -fvtv-debug @gol
 +-nostdlib++ @gol
  -fext-numeric-literals @gol
  -flang-info-include-translate@r{[}=@var{header}@r{]} @gol
@@ -74,7 +72,7 @@ index 6659a903bf0..9ee63dbe52f 100644
  -T @var{script}  -Wl,@var{option}  -Xlinker @var{option} @gol
  -u @var{symbol}  -z @var{keyword}}
  
-@@ -15708,6 +15711,33 @@ Specify that the program entry point is @var{entry}.  The argument is
+@@ -15708,6 +15711,11 @@ Specify that the program entry point is @var{entry}.  The argument is
  interpreted by the linker; the GNU linker accepts either a symbol name
  or an address.
  
@@ -82,28 +80,6 @@ index 6659a903bf0..9ee63dbe52f 100644
 +@opindex nostdlib++
 +Do not use the standard system C++ runtime libraries when linking.
 +Only the libraries you specify will be passed to the linker.
-+
-+@cindex @option{-lgcc}, use with @option{-nostdlib}
-+@cindex @option{-nostdlib} and unresolved references
-+@cindex unresolved references and @option{-nostdlib}
-+@cindex @option{-lgcc}, use with @option{-nodefaultlibs}
-+@cindex @option{-nodefaultlibs} and unresolved references
-+@cindex unresolved references and @option{-nodefaultlibs}
-+One of the standard libraries bypassed by @option{-nostdlib} and
-+@option{-nodefaultlibs} is @file{libgcc.a}, a library of internal subroutines
-+which GCC uses to overcome shortcomings of particular machines, or special
-+needs for some languages.
-+(@xref{Interface,,Interfacing to GCC Output,gccint,GNU Compiler
-+Collection (GCC) Internals},
-+for more discussion of @file{libgcc.a}.)
-+In most cases, you need @file{libgcc.a} even when you want to avoid
-+other standard libraries.  In other words, when you specify @option{-nostdlib}
-+or @option{-nodefaultlibs} you should usually specify @option{-lgcc} as well.
-+This ensures that you have no unresolved references to internal GCC
-+library subroutines.
-+(An example of such an internal subroutine is @code{__main}, used to ensure C++
-+constructors are called; @pxref{Collect2,,@code{collect2}, gccint,
-+GNU Compiler Collection (GCC) Internals}.)
 +
  @item -pie
  @opindex pie
-- 
2.32.0


