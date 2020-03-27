Received: from mail-wm1-f67.google.com (mail-wm1-f67.google.com [209.85.128.67])
 by mx.groups.io with SMTP id smtpd.web11.19326.1585334233532943017
 for <openembedded-core@lists.openembedded.org>;
 Fri, 27 Mar 2020 11:37:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@googlemail.com header.s=20161025 header.b=OENoFwD5;
 spf=pass (domain: googlemail.com, ip: 209.85.128.67, mailfrom: matthias.schoepfer@googlemail.com)
Received: by mail-wm1-f67.google.com with SMTP id b12so12482073wmj.3
        for <openembedded-core@lists.openembedded.org>; Fri, 27 Mar 2020 11:37:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=v3BYn5BypG8Ue9TtSuHw8Zh+FD+D0j5FVBjgo4152UU=;
        b=OENoFwD5jcbfalkyFOkUdwdyY1lr3cej/k864oF5HabcaTBaGKNQGnEZifCjuZBTmt
         8d1wXY7Q23fHWQ5+iv+58IkZmFKzMO0VUD8oGj9yFMiJ5eAd5X03aqnS28hKdUnQy2De
         QgZnjbO0hVAmdWgCqAlmqAAyPYLR9MHDwoc+kQ13d1ZT99o0bevAxV1IJHWvXuFd6uj4
         CSQFBTjw4Xx9ByDw238l693AxLv7OfZKe733edE9oeebRbg5L9WrykQ9CS8U6jCAx3Lm
         +3HXMAwLQFKygjsCeqsZKDHIGj/wKSxwFwGCzRBbv5r79usg0sGUjWFhKdK/R8kIu6wx
         IdyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=v3BYn5BypG8Ue9TtSuHw8Zh+FD+D0j5FVBjgo4152UU=;
        b=YKiuOhZKPWAoqnNFqKUNi+PIFfhpaUSPogZAack1twAGVTcIKbUDZ9m1NGeflzxKwF
         utKxpzRfk1dlxNDR5rkauwCIiyk3+0U0mg53EB4vMXcEWE7U/dWs3gHAQgaDDc5+AMZ0
         jD0e6y1CRpXDMSImvkjwn+9t3O0QYqSztiPK5aDROo6BD/ty9PClm8mdr3zjr0Eqv8Ar
         hXJF14utVS9KgwraXpGtAY90pz0l0e4DcZB0AXXl24tf0rEbkhW35rr0bdNDpdyd/c8K
         TQ8yLruHY5cmTVJAuSlMfeuIgXnrvDOp90oGZqAmjXwXOaffNsz2J/QRDG59AxN9GJ0e
         7UkA==
X-Gm-Message-State: ANhLgQ3+JfLau1ORaPdjrFaHjf/3liFzmh8IC7Hunitvc/0XHEv0vnxR
	OhcdYoyBy5m+TcrU/FnGjxdLbncRmjg=
X-Google-Smtp-Source: ADFU+vsuBysclvaUKgNRGy5E2peZEz165XFiBVqd4J7cN/RB9oUhsRpiQPAQesmZ3f6eZy6oFI4hTw==
X-Received: by 2002:a1c:2b43:: with SMTP id r64mr54927wmr.77.1585334231535;
        Fri, 27 Mar 2020 11:37:11 -0700 (PDT)
Return-Path: <matthias.schoepfer@googlemail.com>
Received: from giesela.fritz.box (p200300E5171FDB00499A1C4FE5832282.dip0.t-ipconnect.de. [2003:e5:171f:db00:499a:1c4f:e583:2282])
        by smtp.gmail.com with ESMTPSA id c85sm9082979wmd.48.2020.03.27.11.37.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Mar 2020 11:37:10 -0700 (PDT)
From: "Matthias Schoepfer" <matthias.schoepfer@googlemail.com>
To: openembedded-core@lists.openembedded.org
Cc: Matthias Schoepfer <matthias.schoepfer@ithinx.io>
Subject: [PATCH] python3: fixing bpo-36852 patch for builds on i686 architecture
Date: Fri, 27 Mar 2020 19:37:01 +0100
Message-Id: <20200327183701.119401-1-matthias.schoepfer@googlemail.com>
X-Mailer: git-send-email 2.24.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Matthias Schoepfer <matthias.schoepfer@ithinx.io>

The original patch "bpo-36852: proper detection of mips architecture
for soft float" uses AC_CANONICAL_TARGET to determine the platform
triplet. While AC_CANONICAL_TARGET exports i686 as target_cpu, gcc
is using i386 instead. We fall back here to i386, as it is conform
to the previous behavior.

Upstream Status: Submitted [https://github.com/python/cpython/pull/13196]

Signed-off-by: Matthias Schoepfer <matthias.schoepfer@ithinx.io>
---
 ...-detection-of-mips-architecture-for-.patch | 20 +++++++++++++------
 1 file changed, 14 insertions(+), 6 deletions(-)

diff --git a/meta/recipes-devtools/python/python3/0001-bpo-36852-proper-detection-of-mips-architecture-for-.patch b/meta/recipes-devtools/python/python3/0001-bpo-36852-proper-detection-of-mips-architecture-for-.patch
index fe0aa8aabe..2c226863d3 100644
--- a/meta/recipes-devtools/python/python3/0001-bpo-36852-proper-detection-of-mips-architecture-for-.patch
+++ b/meta/recipes-devtools/python/python3/0001-bpo-36852-proper-detection-of-mips-architecture-for-.patch
@@ -1,4 +1,4 @@
-From 2581ebe3cd9686089aed223651e1b8bf0b862b48 Mon Sep 17 00:00:00 2001
+From 1667edb6f5557593d2421856680e86fa3cb9b253 Mon Sep 17 00:00:00 2001
 From: Matthias Schoepfer <matthias.schoepfer@ithinx.io>
 Date: Fri, 31 May 2019 15:34:34 +0200
 Subject: [PATCH] bpo-36852: proper detection of mips architecture for soft
@@ -13,15 +13,16 @@ to do this in a more autoconf/autotools manner.
 Upstream-Status: Submitted [https://github.com/python/cpython/pull/13196]
 Signed-off-by: Matthias Schoepfer <matthias.schoepfer@ithinx.io>
 
+%% original patch: 0001-bpo-36852-proper-detection-of-mips-architecture-for-.patch
 ---
- configure.ac | 171 +++++----------------------------------------------
- 1 file changed, 17 insertions(+), 154 deletions(-)
+ configure.ac | 175 +++++++--------------------------------------------
+ 1 file changed, 21 insertions(+), 154 deletions(-)
 
 diff --git a/configure.ac b/configure.ac
-index 0f85486..0ca7e24 100644
+index ede710e..7bbdc89 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -704,160 +704,23 @@ fi
+@@ -710,161 +710,27 @@ fi
  MULTIARCH=$($CC --print-multiarch 2>/dev/null)
  AC_SUBST(MULTIARCH)
  
@@ -193,9 +194,16 @@ index 0f85486..0ca7e24 100644
 +     	PLATFORM_TRIPLET=vxworks
 +	;;
 +     *)
-+	PLATFORM_TRIPLET=${target_cpu}-${target_os}
++        if test "${target_cpu}" != "i686"; then
++	    PLATFORM_TRIPLET=${target_cpu}-${target_os}
++	else
++	    PLATFORM_TRIPLET=i386-${target_os}
++	fi
 +	;;
 +esac	
  
  if test x$PLATFORM_TRIPLET != x && test x$MULTIARCH != x; then
    if test x$PLATFORM_TRIPLET != x$MULTIARCH; then
+--
+2.24.1
+
-- 
2.24.1

