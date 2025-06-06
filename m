Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1270EC5AD49
	for <webhook@archiver.kernel.org>; Fri,  6 Jun 2025 16:00:33 +0000 (UTC)
Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
 by mx.groups.io with SMTP id smtpd.web10.37088.1749225623582191109
 for <openembedded-core@lists.openembedded.org>;
 Fri, 06 Jun 2025 09:00:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=jx68s1Qf;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.170, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-7425bd5a83aso2080799b3a.0
        for <openembedded-core@lists.openembedded.org>; Fri, 06 Jun 2025 09:00:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1749225623; x=1749830423; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7qk3fZn6CLH7kTDZj/jQb04W5bXk2EnZegba1lt0Z6o=;
        b=jx68s1QfzPa6S+WzCQagtiHZFq3T4nNeVydngy31/KS170HNIO23+OSEhQh0GIbmwm
         ONnTedyksR6pK12um7Or3smFMxt9UowZ0G8BWFU+/6f/Fg3349khveTyHRtJrJzZ8Irm
         ZQIGJjvgkzdaOHTItfopnGWbqtT2gl/Xq3pvO/kvQP4V64mNwriTTw37q7pURA5M7yfu
         H1mE+4Qoy+6UU+GcBhfSOgJQJPxeRRZrhTj5CfVcRuVjS2mKgDZ0m6dsNkDqDWl5/sqf
         OA+ybWumr7XXRHwQ3dJNTee6amzcTNHxWmYErTZeJXIi0cNJHZMeoqp/ZMCU86v3g54s
         E66g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749225623; x=1749830423;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7qk3fZn6CLH7kTDZj/jQb04W5bXk2EnZegba1lt0Z6o=;
        b=bYlXtDxF/bhnXPUH86gzIAr5wD2GS3wnMIW7YFyoRexCSfFCHyrHhYyuU/p1GWwyWD
         Jgv40fu3nGCW+Sr1c4/kr4eQdgVY+TNeTdgvvvPqHMnPHBD1ro3FYtgjoKP/YgYh+ZJQ
         +GiJubbfFaHjjhZg9m5Tx8vXHxrZyCdQ0l+U7mfF3BuuJk4VkLS5D5G+gwOgPzozh9jU
         bIjgt7vC8XYYhGiN1iH2Xz+LIAy5566BuWSswanNf8RXy7heUNjC0JnyK+C0xqmZRcCU
         XJM4u4uCoBi3Zl2GFrXZGQbWFSgBsl/v4crsxp3om9jazjnziTT6iVYGx/1K5zJABXHv
         6Pmg==
X-Gm-Message-State: AOJu0YxiDgT9Yqp0GzrPmJ/7BnW2pDQJ4FDmidnQrHijeoicuojRB4qY
	idhaXisQ+PU3oO+RSJE40PDJqe/Aqt5jmnP/elSuNa8VJwhlEimzOghsSZXKzrosR3iMdV0gO7P
	gc8w1
X-Gm-Gg: ASbGncuSNPTJdMo5ja1FnRHxRCHKDfik39xg88aW0lcMnAtzAXeFzS+KSy0oDt5pMph
	N45ehQ9OZvjB3Rks9FW/nX4Iu/tifPZqFfle550fpiOr4oSKdx9RDC+tj3wGdUzw5Su99OFXkxC
	6RDuZ87H8fbZaxnmv4IETcNx452h5NhC5Wqpa0Xx5gwmjUW4nmN3k1u0qe49SqYBshGuK/Fgt9k
	MeClPE0KnPqBZFPSIQeEnxUfxpHAX6GYw43EHI7H50oJ53lydoJkxdNf0dpzltxZCbB/LB8Am6X
	Xe6KSMRfRhkdgrESCiemQLmyJlp6+9pfqW16I1UMO4c=
X-Google-Smtp-Source: AGHT+IFTs8kkqLXiSq8x73EzE+S7+BcbVXkA9gCfdjNAqkWIOeL2mxmB38Y7S/ifdo+m3/DR8O7/CA==
X-Received: by 2002:a05:6a00:1825:b0:740:b372:be5 with SMTP id d2e1a72fcca58-74827e7464fmr4965791b3a.9.1749225621392;
        Fri, 06 Jun 2025 09:00:21 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:742a:4153:2a1f:f028])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7482b083a9bsm1436489b3a.77.2025.06.06.09.00.20
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Jun 2025 09:00:21 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 03/12] libsoup-2.4: fix CVE-2025-32907
Date: Fri,  6 Jun 2025 08:59:56 -0700
Message-ID: <de53b2272919b97719e2b7f704154283caebc59f.1749225418.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1749225417.git.steve@sakoman.com>
References: <cover.1749225417.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 06 Jun 2025 16:00:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/218164

From: Changqing Li <changqing.li@windriver.com>

Refer:
https://gitlab.gnome.org/GNOME/libsoup/-/issues/428

Signed-off-by: Changqing Li <changqing.li@windriver.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../libsoup/libsoup-2.4/CVE-2025-32907.patch  | 39 +++++++++++++++++++
 .../libsoup/libsoup-2.4_2.74.3.bb             |  3 +-
 .../libsoup-3.4.4/CVE-2025-32907-1.patch      | 14 +++----
 .../libsoup-3.4.4/CVE-2025-32907-2.patch      |  6 +--
 4 files changed, 51 insertions(+), 11 deletions(-)
 create mode 100644 meta/recipes-support/libsoup/libsoup-2.4/CVE-2025-32907.patch

diff --git a/meta/recipes-support/libsoup/libsoup-2.4/CVE-2025-32907.patch b/meta/recipes-support/libsoup/libsoup-2.4/CVE-2025-32907.patch
new file mode 100644
index 0000000000..41dd3ff3f4
--- /dev/null
+++ b/meta/recipes-support/libsoup/libsoup-2.4/CVE-2025-32907.patch
@@ -0,0 +1,39 @@
+From 8158b4084dcba2a233dfcb7359c53ab2840148f7 Mon Sep 17 00:00:00 2001
+From: Milan Crha <mcrha@redhat.com>
+Date: Tue, 15 Apr 2025 12:17:39 +0200
+Subject: [PATCH 1/2] soup-message-headers: Correct merge of ranges
+
+It had been skipping every second range, which generated an array
+of a lot of insane ranges, causing large memory usage by the server.
+
+Closes #428
+
+Part-of: <https://gitlab.gnome.org/GNOME/libsoup/-/merge_requests/452>
+
+CVE: CVE-2025-32907
+Upstream-Status: Backport
+[https://gitlab.gnome.org/GNOME/libsoup/-/merge_requests/452/diffs?commit_id=9bb92f7a685e31e10e9e8221d0342280432ce836]
+
+Test part not applied since test codes use some functions not in this
+version
+
+Signed-off-by: Changqing Li <changqing.li@windriver.com>
+---
+ libsoup/soup-message-headers.c |   1 +
+ 1 files changed, 1 insertions(+)
+
+diff --git a/libsoup/soup-message-headers.c b/libsoup/soup-message-headers.c
+index 78b2455..00b9763 100644
+--- a/libsoup/soup-message-headers.c
++++ b/libsoup/soup-message-headers.c
+@@ -1024,6 +1024,7 @@ soup_message_headers_get_ranges_internal (SoupMessageHeaders  *hdrs,
+ 			if (cur->start <= prev->end) {
+ 				prev->end = MAX (prev->end, cur->end);
+ 				g_array_remove_index (array, i);
++				i--;
+ 			}
+ 		}
+ 	}
+-- 
+2.34.1
+
diff --git a/meta/recipes-support/libsoup/libsoup-2.4_2.74.3.bb b/meta/recipes-support/libsoup/libsoup-2.4_2.74.3.bb
index df97a68b9c..c20069edef 100644
--- a/meta/recipes-support/libsoup/libsoup-2.4_2.74.3.bb
+++ b/meta/recipes-support/libsoup/libsoup-2.4_2.74.3.bb
@@ -32,7 +32,8 @@ SRC_URI = "${GNOME_MIRROR}/libsoup/${SHRT_VER}/libsoup-${PV}.tar.xz \
            file://CVE-2025-32912-2.patch \
            file://CVE-2025-32914.patch \
            file://CVE-2025-4969.patch \
-          "
+           file://CVE-2025-32907.patch \
+"
 SRC_URI[sha256sum] = "e4b77c41cfc4c8c5a035fcdc320c7bc6cfb75ef7c5a034153df1413fa1d92f13"
 
 CVE_PRODUCT = "libsoup"
diff --git a/meta/recipes-support/libsoup/libsoup-3.4.4/CVE-2025-32907-1.patch b/meta/recipes-support/libsoup/libsoup-3.4.4/CVE-2025-32907-1.patch
index 41b7d276a4..026a38c39a 100644
--- a/meta/recipes-support/libsoup/libsoup-3.4.4/CVE-2025-32907-1.patch
+++ b/meta/recipes-support/libsoup/libsoup-3.4.4/CVE-2025-32907-1.patch
@@ -1,4 +1,4 @@
-From 7507b0713c2f02af1cd561ebb99477e0a099419d Mon Sep 17 00:00:00 2001
+From 4741bc288ece52f5dbaebc568e72ce14da3e2757 Mon Sep 17 00:00:00 2001
 From: Milan Crha <mcrha@redhat.com>
 Date: Tue, 15 Apr 2025 12:17:39 +0200
 Subject: [PATCH 1/2] soup-message-headers: Correct merge of ranges
@@ -22,10 +22,10 @@ Signed-off-by: Changqing Li <changqing.li@windriver.com>
  create mode 100644 tests/server-mem-limit-test.c
 
 diff --git a/libsoup/soup-message-headers.c b/libsoup/soup-message-headers.c
-index ee7a3cb..f101d4b 100644
+index 95e2c31..d69d6e8 100644
 --- a/libsoup/soup-message-headers.c
 +++ b/libsoup/soup-message-headers.c
-@@ -1244,6 +1244,7 @@ soup_message_headers_get_ranges_internal (SoupMessageHeaders  *hdrs,
+@@ -1210,6 +1210,7 @@ soup_message_headers_get_ranges_internal (SoupMessageHeaders  *hdrs,
  			if (cur->start <= prev->end) {
  				prev->end = MAX (prev->end, cur->end);
  				g_array_remove_index (array, i);
@@ -34,17 +34,17 @@ index ee7a3cb..f101d4b 100644
  		}
  	}
 diff --git a/tests/meson.build b/tests/meson.build
-index ee118a0..8e7b51d 100644
+index 9bf88be..7ef7ac5 100644
 --- a/tests/meson.build
 +++ b/tests/meson.build
-@@ -102,6 +102,7 @@ tests = [
+@@ -93,6 +93,7 @@ tests = [
    {'name': 'samesite'},
    {'name': 'session'},
    {'name': 'server-auth'},
 +  {'name': 'server-mem-limit'},
    {'name': 'server'},
-   {'name': 'sniffing',
-     'depends': [test_resources],
+   {'name': 'sniffing'},
+   {'name': 'ssl',
 diff --git a/tests/server-mem-limit-test.c b/tests/server-mem-limit-test.c
 new file mode 100644
 index 0000000..98f1c40
diff --git a/meta/recipes-support/libsoup/libsoup-3.4.4/CVE-2025-32907-2.patch b/meta/recipes-support/libsoup/libsoup-3.4.4/CVE-2025-32907-2.patch
index 9c838a55af..c1b6a1feba 100644
--- a/meta/recipes-support/libsoup/libsoup-3.4.4/CVE-2025-32907-2.patch
+++ b/meta/recipes-support/libsoup/libsoup-3.4.4/CVE-2025-32907-2.patch
@@ -1,4 +1,4 @@
-From f31dfc357ffdd8d18d3593a06cd4acb888eaba70 Mon Sep 17 00:00:00 2001
+From 85716d2769b3e1acda024d2c7cbfb68139c5d90b Mon Sep 17 00:00:00 2001
 From: Milan Crha <mcrha@redhat.com>
 Date: Tue, 13 May 2025 14:20:46 +0200
 Subject: [PATCH 2/2] server-mem-limit-test: Limit memory usage only when not
@@ -21,10 +21,10 @@ Signed-off-by: Changqing Li <changqing.li@windriver.com>
  2 files changed, 13 insertions(+), 4 deletions(-)
 
 diff --git a/meson.build b/meson.build
-index d4110da..74323ea 100644
+index 73a9fa0..a9531a4 100644
 --- a/meson.build
 +++ b/meson.build
-@@ -357,6 +357,10 @@ configinc = include_directories('.')
+@@ -374,6 +374,10 @@ configinc = include_directories('.')
  
  prefix = get_option('prefix')
  
-- 
2.43.0


