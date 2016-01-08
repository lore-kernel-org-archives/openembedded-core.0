Return-Path: <raj.khem@gmail.com>
Received: from mail-qk0-f182.google.com (mail-qk0-f182.google.com
	[209.85.220.182])
	by mail.openembedded.org (Postfix) with ESMTP id E82A5770A2
	for <openembedded-core@lists.openembedded.org>;
	Fri,  8 Jan 2016 10:19:59 +0000 (UTC)
Received: by mail-qk0-f182.google.com with SMTP id n135so198828829qka.2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 08 Jan 2016 02:20:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references;
	bh=4Ej3AGoAw/++iOLZhubeuCR+bHlPKSvwP4kZxd9ky7w=;
	b=GFgeX8gRb0ECj4eCJO/Lz48E2j14dDOUCYt81FzY9JY/44T3EbGr5BiwIIlf+Kf6eZ
	qrLCrh4i27FZl/T9YbnOb/5xYmpTi+mZo6O4KAwCuNH+qMb/AqyjN1NzDergWj0gjyCv
	oL7y/BHGWudtKmULtN4n7FRnnWus+m4gzdIbAwl2qn/bvbD465JX/eo+ozsIPOdKZNRL
	hHg7ynDHPGy3G1xmQ4STBjEFL+x2+eIpma8ogkOAEMeTzRQ5t3XvxueWjdh4zNTfop3K
	CqJQH0B8ZyXjQgvkN0oG6KYd5AgbuY/Jqmp62+hgoBUNJ2/jXIzse9UuobqUC/ByLMw8
	4pUQ==
X-Received: by 10.55.221.197 with SMTP id u66mr14890545qku.64.1452248400541;
	Fri, 08 Jan 2016 02:20:00 -0800 (PST)
Received: from ip-96-114-220-84.ae.ccp.cable.comcast.com ([96.114.220.84])
	by smtp.gmail.com with ESMTPSA id
	d129sm48549987qka.31.2016.01.08.02.19.59
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 08 Jan 2016 02:19:59 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  8 Jan 2016 10:19:17 +0000
Message-Id: <af606e7fa86f8ce9af38994bd3348634365905bc.1452248145.git.raj.khem@gmail.com>
X-Mailer: git-send-email 2.7.0
In-Reply-To: <604bc7909e229178e6723a5323f99ae33cf7ec7f.1452248145.git.raj.khem@gmail.com>
References: <604bc7909e229178e6723a5323f99ae33cf7ec7f.1452248145.git.raj.khem@gmail.com>
In-Reply-To: <cover.1452248145.git.raj.khem@gmail.com>
References: <cover.1452248145.git.raj.khem@gmail.com>
Subject: [PATCH 49/53] tcf-agent: Implement canonicalize_file_name() for musl as well
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 08 Jan 2016 10:20:00 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...nonicalize_file_name-is-specific-to-glibc.patch | 46 ++++++++++++++++++++++
 meta/recipes-devtools/tcf-agent/tcf-agent_git.bb   |  1 +
 2 files changed, 47 insertions(+)
 create mode 100644 meta/recipes-devtools/tcf-agent/tcf-agent/0001-canonicalize_file_name-is-specific-to-glibc.patch

diff --git a/meta/recipes-devtools/tcf-agent/tcf-agent/0001-canonicalize_file_name-is-specific-to-glibc.patch b/meta/recipes-devtools/tcf-agent/tcf-agent/0001-canonicalize_file_name-is-specific-to-glibc.patch
new file mode 100644
index 0000000..5f93c46
--- /dev/null
+++ b/meta/recipes-devtools/tcf-agent/tcf-agent/0001-canonicalize_file_name-is-specific-to-glibc.patch
@@ -0,0 +1,46 @@
+From 23a3759b74d081b3b2849b0d37a0e5219f37813e Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Thu, 7 Jan 2016 22:37:48 +0000
+Subject: [PATCH] canonicalize_file_name is specific to glibc
+
+When on Linux and not using glibc then we need to define
+canonicalize_file_name() API, therefore add a check for finding out if
+its not glibc
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+Upstream-Status: Pending
+
+ agent/tcf/framework/mdep.c | 2 +-
+ agent/tcf/framework/mdep.h | 2 +-
+ 2 files changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/agent/tcf/framework/mdep.c b/agent/tcf/framework/mdep.c
+index 2b52ca8..7d09655 100644
+--- a/agent/tcf/framework/mdep.c
++++ b/agent/tcf/framework/mdep.c
+@@ -1042,7 +1042,7 @@ char * canonicalize_file_name(const char * path) {
+     return strdup(res);
+ }
+ 
+-#elif defined(__UCLIBC__)
++#elif defined(__UCLIBC__) || !defined(__GLIBC__)
+ 
+ char * canonicalize_file_name(const char * path) {
+     return realpath(path, NULL);
+diff --git a/agent/tcf/framework/mdep.h b/agent/tcf/framework/mdep.h
+index 1e718a2..187c399 100644
+--- a/agent/tcf/framework/mdep.h
++++ b/agent/tcf/framework/mdep.h
+@@ -276,7 +276,7 @@ extern int loc_clock_gettime(int, struct timespec *);
+ 
+ #define O_BINARY 0
+ 
+-#if defined(__FreeBSD__) || defined(__NetBSD__) || defined(__APPLE__)
++#if defined(__FreeBSD__) || defined(__NetBSD__) || defined(__APPLE__) || !defined(__GLIBC__)
+ #  define O_LARGEFILE 0
+ extern char ** environ;
+ extern char * canonicalize_file_name(const char * path);
+-- 
+2.7.0
+
diff --git a/meta/recipes-devtools/tcf-agent/tcf-agent_git.bb b/meta/recipes-devtools/tcf-agent/tcf-agent_git.bb
index fff81a5..ab2fcd7 100644
--- a/meta/recipes-devtools/tcf-agent/tcf-agent_git.bb
+++ b/meta/recipes-devtools/tcf-agent/tcf-agent_git.bb
@@ -12,6 +12,7 @@ UPSTREAM_CHECK_GITTAGREGEX = "(?P<pver>(\d+(\.\d+)+))"
 SRC_URI = "git://git.eclipse.org/gitroot/tcf/org.eclipse.tcf.agent.git;branch=1.3_mars_bugfix \
            file://fix_ranlib.patch \
            file://ldflags.patch \
+           file://0001-canonicalize_file_name-is-specific-to-glibc.patch;striplevel=2 \
            file://tcf-agent.init \
            file://tcf-agent.service \
           "
-- 
2.7.0


