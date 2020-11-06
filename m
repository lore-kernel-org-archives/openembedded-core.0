Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
 by mx.groups.io with SMTP id smtpd.web08.12323.1604673429884648331
 for <openembedded-core@lists.openembedded.org>;
 Fri, 06 Nov 2020 06:37:09 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=XE7MrrtR;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.172, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f172.google.com with SMTP id c20so1496543pfr.8
        for <openembedded-core@lists.openembedded.org>; Fri, 06 Nov 2020 06:37:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=E1+Y1OI6Rg33brA4o0v/mrsdDYINMYOYzeQXMipwl1k=;
        b=XE7MrrtRJzHYin6sWbl/lYeLEeSTY7pjUViJKRMeldsyJSgSxjeAhnz7fXwIVMqc1a
         8y4MT/cbwqVtEct2LEcvasibGXRBNov26YGg1Ku8uljg6N7r8XWewKf5XZxo4FlYWiWO
         ZxZSJ9FCvu+Q2AI8yszIS93RCMBvKFWew2McJ9A/pWI4ut4+VKXxpxdKrvK05rvCaMrU
         W6RzXuQm8djfNvveAwS31/qNnTwARvx6ws/rNnW0NTnGBwqwiciNfknfCI2wyb/TLT88
         0zdubUzr7MldqOqT3VxAKYRanIZUGTjWPzdynobenecjuXc9oewP1HjEKzMnO9elVPQw
         uwXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=E1+Y1OI6Rg33brA4o0v/mrsdDYINMYOYzeQXMipwl1k=;
        b=YWz4hyW5oe2gXAm3lDj7LVLRUxuNFjYHKLRjFYZ7/Q/1WfgCPIfAkV8Unjvh1AAh8A
         7oFEpctz8yj/X7hCe3dbiz14UitixkhnPkRCWAxRFnY6zEaMvb29fMnXOEWDc0TXCTnm
         fbMj5t+KPoEjSEjHoWOnhCN6peMysTuKZRgVKhIutq4XjuEBbgYA3mmAoHs6eDlrR2/7
         5R0cOgo46hXvCQtCGDmqP7zgNP09hv2bi668Pi79Pskk0zCjVXlc32IqysP0AnGQy1BQ
         LGcATIv64jGlxrukX0VOu5eTcc9CIi09CvlJA0kRo2Mgt44idZ68CCEoMsxxRs79jN3W
         /I2A==
X-Gm-Message-State: AOAM533CAq81QxAu2WPqQwWon1Q3e9km84surAAZgxg+E+JnjjlXVrGR
	x+akIQTUPLHJ2Je/jpmDknuAi9Lx2f9BsArJ
X-Google-Smtp-Source: ABdhPJwjkNJ89fVSXK4oA9tMltpr+GY5xqZ09Otr38gIAistp51kpvqVI7th6+zYoBro6PBsknz8Mw==
X-Received: by 2002:a17:90b:ec9:: with SMTP id gz9mr2888550pjb.105.1604673428967;
        Fri, 06 Nov 2020 06:37:08 -0800 (PST)
Return-Path: <steve@sakoman.com>
Received: from octo.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id jy19sm2765166pjb.9.2020.11.06.06.37.06
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2020 06:37:06 -0800 (PST)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 18/20] sqlite3: fix CVE-2020-13630
Date: Fri,  6 Nov 2020 04:35:33 -1000
Message-Id: <5780879dec867bdb3c7eeeffb7a958a8b50188a4.1604672839.git.steve@sakoman.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1604672838.git.steve@sakoman.com>
References: <cover.1604672838.git.steve@sakoman.com>

CVE: CVE-2020-13630

Reference: https://nvd.nist.gov/vuln/detail/CVE-2020-13630

Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../sqlite/files/CVE-2020-13630.patch         | 32 +++++++++++++++++++
 meta/recipes-support/sqlite/sqlite3_3.31.1.bb |  1 +
 2 files changed, 33 insertions(+)
 create mode 100644 meta/recipes-support/sqlite/files/CVE-2020-13630.patch

diff --git a/meta/recipes-support/sqlite/files/CVE-2020-13630.patch b/meta/recipes-support/sqlite/files/CVE-2020-13630.patch
new file mode 100644
index 0000000000..31916a1939
--- /dev/null
+++ b/meta/recipes-support/sqlite/files/CVE-2020-13630.patch
@@ -0,0 +1,32 @@
+From becd68ba0dac41904aa817d96a67fb4685734b41 Mon Sep 17 00:00:00 2001
+From: dan <dan@noemail.net>
+Date: Sat, 16 May 2020 17:26:58 +0000
+Subject: [PATCH] Fix a use-after-free bug in the fts3 snippet() function.
+
+FossilOrigin-Name: 0d69f76f0865f9626078bee087a22fb826407279e78cf9d5382e1c985c9f64a9
+
+Upstream-Status: Backport
+CVE: CVE-2020-13630
+
+Reference to upstream patch:
+https://github.com/sqlite/sqlite/commit/becd68ba0dac41904aa817d96a67fb4685734b41
+
+Patch converted to amalgamation format
+
+Signed-off-by: Steve Sakoman <steve@sakoman.com>
+---
+ sqlite3.c | 3 ++-
+ 1 file changed, 2 insertions(+), 1 deletion(-)
+
+diff --git a/sqlite3.c b/sqlite3.c
+index 02892f8..e72fabb 100644
+--- a/sqlite3.c
++++ b/sqlite3.c
+@@ -170257,6 +170257,7 @@ static void fts3EvalNextRow(
+                 fts3EvalNextRow(pCsr, pLeft, pRc);
+               }
+             }
++            pRight->bEof = pLeft->bEof = 1;
+           }
+         }
+         break;
diff --git a/meta/recipes-support/sqlite/sqlite3_3.31.1.bb b/meta/recipes-support/sqlite/sqlite3_3.31.1.bb
index 4ef1da703b..ace9423e8d 100644
--- a/meta/recipes-support/sqlite/sqlite3_3.31.1.bb
+++ b/meta/recipes-support/sqlite/sqlite3_3.31.1.bb
@@ -10,6 +10,7 @@ SRC_URI = "http://www.sqlite.org/2020/sqlite-autoconf-${SQLITE_PV}.tar.gz \
            file://CVE-2020-15358.patch \
            file://CVE-2020-13434.patch \
            file://CVE-2020-13435.patch \
+           file://CVE-2020-13630.patch \
            "
 SRC_URI[md5sum] = "2d0a553534c521504e3ac3ad3b90f125"
 SRC_URI[sha256sum] = "62284efebc05a76f909c580ffa5c008a7d22a1287285d68b7825a2b6b51949ae"
-- 
2.17.1

