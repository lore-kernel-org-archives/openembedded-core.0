Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f177.google.com (mail-pf0-f177.google.com
	[209.85.192.177])
	by mail.openembedded.org (Postfix) with ESMTP id 4FA75731BD
	for <openembedded-core@lists.openembedded.org>;
	Sun, 17 Jan 2016 11:37:39 +0000 (UTC)
Received: by mail-pf0-f177.google.com with SMTP id q63so146457397pfb.1
	for <openembedded-core@lists.openembedded.org>;
	Sun, 17 Jan 2016 03:37:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references;
	bh=4Ej3AGoAw/++iOLZhubeuCR+bHlPKSvwP4kZxd9ky7w=;
	b=bBqmPE16kDQELqOLJoaXCXL8LrMyyDtApWFey2LrjWKUq36l6EgIdGd/ywMiy9cuIv
	PkdRAw40l2c05hiprv+EjTaWORd8m0AdaQF0wKCjp+pUYclC+LtFeUZLNGw+OQdjllit
	8SJjOlrwUKOLJduZ3BBza/G7eUXVJmfHoy2NSYtOkDzri25aVQiEC4zuki6Vv7/WV/7u
	OX6DAJO9B36VEVcKR08VGFBn8V0+CqTbNACIOR4W/giqUXQ1FOwiVz4O+KCL0xptYuky
	SvQgawZCZ92cAiUXcBUOTwD1uDbpPWARkc3L/WJ+YB6ahP2L4cpvXR3dqHAvMDn+B4Qz
	P7Ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:in-reply-to:references;
	bh=4Ej3AGoAw/++iOLZhubeuCR+bHlPKSvwP4kZxd9ky7w=;
	b=J6szxd0hp5PT9L7TqpdmSedW+8HRMfXd2fXmbQyooZbDw1uFhQCqvAckNbIpjv/qWb
	aT81723ogeK2TxmmVJuRGkz9XMc2jJHDm9IOpzKUXeYae2z63cz8QGFlTmRfJppr3e4h
	iwZTdDc32dbn+BYb5P/mcPMgv7Om6JUYaLkufAi5ODWdCLwluVyDDj4qXx8t5KWfzZXM
	CHVRnP6CC/D9oB+JLRVd/xTSCXrDrgSK454lHRe/L/R7t7p3UeP7HZH31mDFntNury5Z
	uLMN0jS8Ceoqkbjk25j2Zf2I4gCCTV0oUUpj2pWMuyQj/uqZko+ZNWUlWQrSHinFeDuV
	W11g==
X-Gm-Message-State: ALoCoQlqjix2zhtQj1XGY5iC8oiqdM6MTLPeT6+S72LUDAb5RqK7UENckqNv29Wculx1cnL+H8VUzZD42ObGPptuqhZOpNBZOw==
X-Received: by 10.98.75.4 with SMTP id y4mr28453025pfa.32.1453030660121;
	Sun, 17 Jan 2016 03:37:40 -0800 (PST)
Received: from arch.hsd1.ca.comcast.net (c-73-252-206-77.hsd1.ca.comcast.net.
	[73.252.206.77]) by smtp.gmail.com with ESMTPSA id
	ty5sm26838363pac.48.2016.01.17.03.37.39
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 17 Jan 2016 03:37:39 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sun, 17 Jan 2016 03:36:17 -0800
Message-Id: <f2c3eff4eb560c943122656a681d4924122d662f.1453029952.git.raj.khem@gmail.com>
X-Mailer: git-send-email 2.7.0
In-Reply-To: <a11d14dd08dcef1c508ae13079284cfb96629c50.1453029952.git.raj.khem@gmail.com>
References: <a11d14dd08dcef1c508ae13079284cfb96629c50.1453029952.git.raj.khem@gmail.com>
In-Reply-To: <cover.1453029952.git.raj.khem@gmail.com>
References: <cover.1453029952.git.raj.khem@gmail.com>
Subject: [PATCH 44/73] tcf-agent: Implement canonicalize_file_name() for musl as well
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
X-List-Received-Date: Sun, 17 Jan 2016 11:37:39 -0000

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


