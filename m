Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
 by mx.groups.io with SMTP id smtpd.web08.500.1621543747024060051
 for <openembedded-core@lists.openembedded.org>;
 Thu, 20 May 2021 13:49:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=SaZcFZ19;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.53, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f53.google.com with SMTP id n17-20020a7bc5d10000b0290169edfadac9so6203869wmk.1
        for <openembedded-core@lists.openembedded.org>; Thu, 20 May 2021 13:49:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=dyineCwxTNCEp6Bjcp2Yofs9aQjxYaclTvC9tyQUUDQ=;
        b=SaZcFZ19rDgpsa+i76jcSOtulu45r3iPA+ExYj+TqJtUQd6mY2XRfztn92yai8QDoN
         6fZNHmR5T7fzkRt+6UXF5tsnGLP/SSEZAnxEhlfaLPXQc+Ji3/BwygOlNlUxtyNUo3a4
         eImICCwQjTRZHjLpTjEQdAUU0cgA6OI4os/1Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=dyineCwxTNCEp6Bjcp2Yofs9aQjxYaclTvC9tyQUUDQ=;
        b=VBYt5Nbl2V/o4v9LpW+xVB7KCvjLCP0HA1EndZH/xImcx8Ujb0+Ari7/EKIyChs+JT
         Vyh10k2obLc4fMIZu3yKAluR3FYT/0bIYZFwq/Crk4XNZqfL2vx5TSek4R9QLAC6mmfL
         IVIP2VQUsPfEzF4ctIUf0wL8my85QQA8witqyyMhQmprjCsvUG9q4YTF1Y1AEf42Xs+o
         6F6VPsl247I020erh3kPw2FmUG3X7NoyxlVXmQFac5sjEr38p6F5AjMYzRaDN/ik9Ml8
         OnJQdL6GxkSH/CZPq07IiVuvHdVswpPBYKIOqOmqTSL8JkotugS2/l2rGtIuNthBwfDY
         veAg==
X-Gm-Message-State: AOAM533pf0TVGm3Ned23vgRMuHkJlovtxPLU71kWHcGiW153zaL3PL8l
	loiOM+3fOL6UAqmVG5j3QmxEB9Ruk8Gh1w==
X-Google-Smtp-Source: ABdhPJw/n1lhBP8pcnAjljuh6kYmLcZ/3J/LEbV424slhYyhyh4nj68m3a3SRkKjHBCQABpa7buKpw==
X-Received: by 2002:a1c:a9ca:: with SMTP id s193mr5381499wme.132.1621543745487;
        Thu, 20 May 2021 13:49:05 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex.int.rpsys.net ([2001:8b0:aba:5f3c:c394:d896:3913:6568])
        by smtp.gmail.com with ESMTPSA id n189sm3768061wme.9.2021.05.20.13.49.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 May 2021 13:49:05 -0700 (PDT)
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Cc: Bastian Krause <bst@pengutronix.de>,
	Peter Kjellerstedt <peter.kjellerstedt@axis.com>
Subject: [hardknott] [PATCH 05/28] ccache: add packageconfig docs option
Date: Thu, 20 May 2021 21:48:39 +0100
Message-Id: <20210520204902.2527687-5-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210520204902.2527687-1-richard.purdie@linuxfoundation.org>
References: <20210520204902.2527687-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Bastian Krause <bst@pengutronix.de>

Before, ccache's configure stage built HTML documentation and man pages
depending on if asciidoc is installed. This patch makes it configurable.

Pass the new cmake option ENABLE_DOCUMENTATION along and add the
asciidoc dependency if necessary.

This fixes an issue when ccache's configure stage found asciidoc/a2x on
the system outside of the sysroot (e.g. installed via 'apt install
asciidoc'). ccache would then decide to build docs and manual pages, but
would fail during compilation: the system's a2x could not find the
system's asciidoc because it did not reside in the set PATH.

By enabling/disabling docs/man page generation explicitly and adding
asciidoc to DEPENDS as necessary, this is no longer an issue.

[ This corresponds to commit b0aedd74 and parts of commit 1eedc5f8,
  with the patch replaced by the upstream version. ]

Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 ...-build-of-documentation-optional-842.patch | 36 +++++++++++++++++++
 meta/recipes-devtools/ccache/ccache_4.2.bb    |  4 +++
 2 files changed, 40 insertions(+)
 create mode 100644 meta/recipes-devtools/ccache/ccache/0001-CMake-make-build-of-documentation-optional-842.patch

diff --git a/meta/recipes-devtools/ccache/ccache/0001-CMake-make-build-of-documentation-optional-842.patch b/meta/recipes-devtools/ccache/ccache/0001-CMake-make-build-of-documentation-optional-842.patch
new file mode 100644
index 00000000000..9f6bb1780ba
--- /dev/null
+++ b/meta/recipes-devtools/ccache/ccache/0001-CMake-make-build-of-documentation-optional-842.patch
@@ -0,0 +1,36 @@
+From 857d74f2c5fff79589e9b35cd405bf8ffffafb54 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Petr=20=C5=A0tetiar?= <ynezz@true.cz>
+Date: Mon, 3 May 2021 18:44:53 +0200
+Subject: [PATCH] CMake: make build of documentation optional (#842)
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+So we don't need to support corner cases as for example one fixed in
+commit f6202db308e3 ("doc/MANUAL.adoc: Don't use non-ASCII quotes
+(#761)") when the documentation is actually not needed at all as ccache
+is used as a build tool only.
+
+Signed-off-by: Petr Štetiar <ynezz@true.cz>
+Upstream-Status: Backport [b96ca763c453a602b5516b4b9ca5e2829528e318]
+Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
+---
+ CMakeLists.txt | 5 ++++-
+ 1 file changed, 4 insertions(+), 1 deletion(-)
+
+diff --git a/CMakeLists.txt b/CMakeLists.txt
+index 40e21a57..151cc5f7 100644
+--- a/CMakeLists.txt
++++ b/CMakeLists.txt
+@@ -131,7 +131,10 @@ target_link_libraries(ccache PRIVATE standard_settings standard_warnings ccache_
+ #
+ # Documentation
+ #
+-add_subdirectory(doc)
++option(ENABLE_DOCUMENTATION "Enable documentation" ON)
++if(ENABLE_DOCUMENTATION)
++  add_subdirectory(doc)
++endif()
+ 
+ #
+ # Installation
diff --git a/meta/recipes-devtools/ccache/ccache_4.2.bb b/meta/recipes-devtools/ccache/ccache_4.2.bb
index 9957bc7e651..b76bf043f01 100644
--- a/meta/recipes-devtools/ccache/ccache_4.2.bb
+++ b/meta/recipes-devtools/ccache/ccache_4.2.bb
@@ -12,10 +12,14 @@ LIC_FILES_CHKSUM = "file://LICENSE.adoc;md5=28afb89f649f309e7ac1aab554564637"
 DEPENDS = "zstd"
 
 SRC_URI = "https://github.com/ccache/ccache/releases/download/v${PV}/${BP}.tar.gz"
+SRC_URI += "file://0001-CMake-make-build-of-documentation-optional-842.patch"
+
 SRC_URI[sha256sum] = "dbf139ff32031b54cb47f2d7983269f328df14b5a427882f89f7721e5c411b7e"
 
 UPSTREAM_CHECK_URI = "https://github.com/ccache/ccache/releases/"
 
+PACKAGECONFIG[docs] = "-DENABLE_DOCUMENTATION=ON,-DENABLE_DOCUMENTATION=OFF,asciidoc"
+
 inherit cmake
 
 PATCHTOOL = "patch"
-- 
2.30.2

