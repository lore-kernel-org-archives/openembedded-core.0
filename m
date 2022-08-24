Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E7998C32793
	for <webhook@archiver.kernel.org>; Wed, 24 Aug 2022 06:34:50 +0000 (UTC)
Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com
 [209.85.210.176])
 by mx.groups.io with SMTP id smtpd.web08.8000.1661322888464519731
 for <openembedded-core@lists.openembedded.org>;
 Tue, 23 Aug 2022 23:34:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=ZEvqkYkH;
 spf=pass (domain: gmail.com, ip: 209.85.210.176,
 mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f176.google.com with SMTP id f17so9439906pfk.11
        for <openembedded-core@lists.openembedded.org>;
 Tue, 23 Aug 2022 23:34:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc;
        bh=v0eUe7lXvl1mIXs8/GPY8/f3P2kflu24/qTht67js0k=;
        b=ZEvqkYkHBW0nw74LMiOyy6l6Wvj0B3jaTQ+Cyb+p1upphoGXldfc+egkymxkrYr+gW
         ySrqTg1NTQ/yZ4nMoveRATgaBVuzWE1/EotvVNJ0aPPm+hQpUahtbJOvkYEMZcRFtccN
         xRQIRZnkA7rLhV5lVJcIuBwJECuupiyT6Z4JCbCg5hwKJu+uMrKJu1DSSrI+QizRJnH7
         tqxjCBJeTvlxz8NXVGNQo3pFAcwYAOvv3iW3AtW44FSSonNz/qGlahFKjWtSVrjOO4TP
         PKmrjfkzaX6gRpvz0vAme0Chdhl4U1vUXTT+vy5ZtptAkPvE4omn4+L9Px/7uey2cLCi
         986A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
        bh=v0eUe7lXvl1mIXs8/GPY8/f3P2kflu24/qTht67js0k=;
        b=RXLCSMB6l5+lzsCwH8nlNCuVx0xNvU0mYC4ZufQEw1MWlh+ORchXGhiQsB9HU8Rq6l
         wabhdT8//9Y/Mco0dtf6C86S/truRjzqi/mBiJSSKt5qXqIok/OV4r1kVGWGn3qdb8k2
         eafRDFKRCr4wpv9jTqOyVNGPxcncA/4CQ0n6oTetxGYKB/RrGPK92SOdhx99vH90uZlV
         HTz0pXko3FuDcnEOdWPZuIaTeTs5qcMVQBgjCXWQSBGHa5BvOtEJhdUdC3/vkC8klwnp
         JrloCW582EOAqnJU1gDq7lgxIKWtqFvJxkFf/TMqjB3184kQ/WZ3p7QW/lXa1P3uPT92
         00xw==
X-Gm-Message-State: ACgBeo0j8IcZ/k0ttsj6C+aG8XYLCiQQ7P3xHCGxi1HhnaME05DVCYjA
	dl6+SxQvuYcy3JvR5yyQq7Oykrua4OFGYw==
X-Google-Smtp-Source: 
 AA6agR6dRk69282PBbqs0dm2DKVltm/bCkVs9woB794hCqbG30MegaFe+2XCjq2HkqrakDNL8YxeOQ==
X-Received: by 2002:a65:6e46:0:b0:42a:2c7e:4232 with SMTP id
 be6-20020a656e46000000b0042a2c7e4232mr21249627pgb.611.1661322887536;
        Tue, 23 Aug 2022 23:34:47 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::6b6a])
        by smtp.gmail.com with ESMTPSA id
 s24-20020a639258000000b0042a3d9a1275sm8384957pgn.16.2022.08.23.23.34.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Aug 2022 23:34:47 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH 3/7] libcgroup: Use GNU strerror_r only when its available
Date: Tue, 23 Aug 2022 23:34:39 -0700
Message-Id: <20220824063443.1774094-3-raj.khem@gmail.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20220824063443.1774094-1-raj.khem@gmail.com>
References: <20220824063443.1774094-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 24 Aug 2022 06:34:50 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/169777

This patch ensures that a fallback to use XSI compliant strerror_r when
GNU extention is not implemented, which fixes the case when building
with musl

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...pi-Use-GNU-strerror_r-when-available.patch | 55 +++++++++++++++++++
 .../recipes-core/libcgroup/libcgroup_3.0.0.bb |  4 +-
 2 files changed, 58 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-core/libcgroup/libcgroup/0001-api-Use-GNU-strerror_r-when-available.patch

diff --git a/meta/recipes-core/libcgroup/libcgroup/0001-api-Use-GNU-strerror_r-when-available.patch b/meta/recipes-core/libcgroup/libcgroup/0001-api-Use-GNU-strerror_r-when-available.patch
new file mode 100644
index 0000000000..96321d2970
--- /dev/null
+++ b/meta/recipes-core/libcgroup/libcgroup/0001-api-Use-GNU-strerror_r-when-available.patch
@@ -0,0 +1,55 @@
+From d190c0c548b3219b75e4c399aa89186e77bbe270 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Tue, 23 Aug 2022 20:03:09 -0700
+Subject: [PATCH] api: Use GNU strerror_r when available
+
+GNU strerror_r is only available in glibc, musl impelents the XSI
+version which is slightly different, therefore check if GNU version is
+available before using it, otherwise use the XSI compliant version.
+
+Upstream-Status: Submitted [https://github.com/libcgroup/libcgroup/pull/236]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ configure.ac | 5 +++++
+ src/api.c    | 8 ++++++--
+ 2 files changed, 11 insertions(+), 2 deletions(-)
+
+diff --git a/configure.ac b/configure.ac
+index b68c655..831866d 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -183,6 +183,11 @@ AC_FUNC_REALLOC
+ AC_FUNC_STAT
+ AC_CHECK_FUNCS([getmntent hasmntopt memset mkdir rmdir strdup])
+ 
++orig_CFLAGS="$CFLAGS"
++CFLAGS="$CFLAGS -D_GNU_SOURCE"
++AC_FUNC_STRERROR_R
++CFLAGS="$orig_CFLAGS"
++
+ AC_SEARCH_LIBS(
+ 	[fts_open],
+ 	[fts],
+diff --git a/src/api.c b/src/api.c
+index 5c6de11..06aa1d6 100644
+--- a/src/api.c
++++ b/src/api.c
+@@ -4571,9 +4571,13 @@ const char *cgroup_strerror(int code)
+ {
+ 	int idx = code % ECGROUPNOTCOMPILED;
+ 
+-	if (code == ECGOTHER)
++	if (code == ECGOTHER) {
++#ifdef STRERROR_R_CHAR_P
+ 		return strerror_r(cgroup_get_last_errno(), errtext, MAXLEN);
+-
++#else
++		return strerror_r(cgroup_get_last_errno(), errtext, sizeof (errtext)) ? "unknown error" : errtext;
++#endif
++	}
+ 	if (idx >= sizeof(cgroup_strerror_codes)/sizeof(cgroup_strerror_codes[0]))
+ 		return "Invalid error code";
+ 
+-- 
+2.37.2
+
diff --git a/meta/recipes-core/libcgroup/libcgroup_3.0.0.bb b/meta/recipes-core/libcgroup/libcgroup_3.0.0.bb
index efd887844d..f3e841246f 100644
--- a/meta/recipes-core/libcgroup/libcgroup_3.0.0.bb
+++ b/meta/recipes-core/libcgroup/libcgroup_3.0.0.bb
@@ -11,7 +11,9 @@ inherit autotools pkgconfig
 
 DEPENDS = "bison-native flex-native"
 
-SRC_URI = "https://github.com/${BPN}/${BPN}/releases/download/v3.0/${BP}.tar.gz"
+SRC_URI = "https://github.com/${BPN}/${BPN}/releases/download/v3.0/${BP}.tar.gz \
+           file://0001-api-Use-GNU-strerror_r-when-available.patch \
+"
 
 SRC_URI[sha256sum] = "8d284d896fca1c981b55850e92acd3ad9648a69227c028dda7ae3402af878edd"
 UPSTREAM_CHECK_URI = "https://github.com/libcgroup/libcgroup/releases/"
-- 
2.37.2


