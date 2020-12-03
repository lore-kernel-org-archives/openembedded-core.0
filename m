Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
 by mx.groups.io with SMTP id smtpd.web10.11324.1607008183134605015
 for <openembedded-core@lists.openembedded.org>;
 Thu, 03 Dec 2020 07:09:43 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=wVglHVE9;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.178, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f178.google.com with SMTP id 131so1456967pfb.9
        for <openembedded-core@lists.openembedded.org>; Thu, 03 Dec 2020 07:09:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=SNimO4AEBO+VHFlDu3V7qD1MMKJWGEa/6PUmHesdl6Q=;
        b=wVglHVE9CFyyL3rQ3Yo8uJRgqlc9qYEymI6ReEJQsFddb5+9BKfd4XCJQcPljZ8U8o
         4wBhb299QU2fB3J997cbyaZxWPi/Os3WPNtL8LyIIlHSVKLG8e6mScn4b0p1m/R4UNBO
         HtJf5K0SX9VEtM1BqfmRMnYjkQ83lxOQD5LA7aR7uw0dGCvzPCN9LBYwTMiaOqDS+x7X
         Nl+S4rKhQh5wJd1bsIwzu1HyRJkwezEzxG0XixVA4fVfL4duMcagKq+5FCeR6L0NnRMh
         EUoSTiEXJX7IQwNXHbZuLMmrXAnXksQClVrfUedKsVnoTZkngIf4C1VWpqCowDTfU89W
         KutQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=SNimO4AEBO+VHFlDu3V7qD1MMKJWGEa/6PUmHesdl6Q=;
        b=IfoyqRGMhh/NU8RFolyE/veG7bM8zVLACXqB13xZmL7f1QwOJPvoHKXUpojLpklFn9
         WBCuLWiXToj+ucb9FcMPAyeeqQtgi7ilCyJzTeycPzmW78lBu7a6iFkN6Bfly9lMW16U
         VgBzj7oSHVUXIwpxW/sNSOkPq5nFCi9bfkmyVOpZ+NCTu+5rMn2Pcp3brPwPwyOga0SP
         vlxTiN+ZzzQm7PQ20fdvlTvG1KVIZOQ9yF+XKzVZlUciwQ/LT6ACRUZfCQQ/ZD+ABIz+
         NJwq9gmaY2pnmDB1TErZzFW2cYfsxvCI117H2RLjkRhTiKP+KILEbGXAgHKMvEeuUWFG
         6qZQ==
X-Gm-Message-State: AOAM530Jr0oJeY8Xo8/qUrGI+ncaFitL38tWD8qYIhvKmj0vhnaIJci/
	GLqu50BcdUjWfx6Yx9t8Vu4WgVmQEw5nDApm
X-Google-Smtp-Source: ABdhPJyLX57i5ja8QYbd3yWrgUTZx+UNHzsJmf20Ut38Mu4hKUoLgj2VY9BJmAG0xWCvLs7w60WufA==
X-Received: by 2002:a63:1b09:: with SMTP id b9mr3411754pgb.13.1607008182134;
        Thu, 03 Dec 2020 07:09:42 -0800 (PST)
Return-Path: <steve@sakoman.com>
Received: from octo.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id s7sm1632320pju.37.2020.12.03.07.09.40
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Dec 2020 07:09:41 -0800 (PST)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 24/28] base.bbclass: use os.path.normpath instead of just comparing WORKDIR and S as strings
Date: Thu,  3 Dec 2020 05:08:14 -1000
Message-Id: <e5051f218499d80e1bba54a9a193bc61b24cbb50.1607007208.git.steve@sakoman.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1607007208.git.steve@sakoman.com>
References: <cover.1607007208.git.steve@sakoman.com>

From: Martin Jansa <Martin.Jansa@gmail.com>

* cannot use os.path.samefile, because S/B might not exist at this time yet

* there is issue with PSEUDO_IGNORE_PATHS when some recipe sets e.g.
  S = "${WORKDIR}/"
  whole WORKDIR gets added to PSEUDO_IGNORE_PATHS and then the build
  can fail with various strange errors, in my case do_package was
  failing when do_package calls:
  fix_perms(.../1.0-r0/package/etc, 755, 0, 0, /etc)
  and fails with "[Errno 1] Operation not permitted:"

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 50b11a61ab29acb8ec990668353e0b7305114628)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/classes/base.bbclass | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/classes/base.bbclass b/meta/classes/base.bbclass
index a710abdbd7..65b9d954c7 100644
--- a/meta/classes/base.bbclass
+++ b/meta/classes/base.bbclass
@@ -388,9 +388,9 @@ python () {
     oe.utils.features_backfill("DISTRO_FEATURES", d)
     oe.utils.features_backfill("MACHINE_FEATURES", d)
 
-    if d.getVar("WORKDIR") != d.getVar("S"):
+    if os.path.normpath(d.getVar("WORKDIR")) != os.path.normpath(d.getVar("S")):
         d.appendVar("PSEUDO_IGNORE_PATHS", ",${S}")
-    if d.getVar("WORKDIR") != d.getVar("B"):
+    if os.path.normpath(d.getVar("WORKDIR")) != os.path.normpath(d.getVar("B")):
         d.appendVar("PSEUDO_IGNORE_PATHS", ",${B}")
 
     # Handle PACKAGECONFIG
-- 
2.17.1

