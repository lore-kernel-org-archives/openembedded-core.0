Return-Path: <andre.draszik@gmail.com>
Received: from mail-wm0-f66.google.com (mail-wm0-f66.google.com [74.125.82.66])
	by mail.openembedded.org (Postfix) with ESMTP id C66B36FEE0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 24 Jun 2016 14:39:45 +0000 (UTC)
Received: by mail-wm0-f66.google.com with SMTP id r201so5531420wme.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 24 Jun 2016 07:39:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=MQp5FGfXlFHaxGhv+dSYBXK1KtZCOGJbaGn+JZfqWbU=;
	b=JWvV7fuP6AoaDRlcKcYOmJb4NYXUV2czjMuyiNaKypZBfUmUjnXQheZaiqkbAsNH+o
	bE2vBgZNL10HyxVNoR4/0AG6e1b/Pu29Un2Cdq3YtUxZL2QqOYdI9siWnDYhROZME3SS
	VKhswYmlcAYZNGXFVnAiuR4wxZxHlO5gg8D3YkjF/gyHXClG7PLzVIZVANKNtuttIv8+
	4i/S4kkVchlXeRtAadBP3H5YnWikKa5C8byomjmCYSs9UVuDJEd5w9frXvpfaESpnFIq
	HUmqaf6oz4nlx058edCIOStLNKqc1qEgP3v0PyDNVycA2vQ5ljJZ6bVvZ7Rl/vIPhqDG
	6czA==
X-Gm-Message-State: ALyK8tKuu3mEF/KaicAbBXSD83UXQVBRXFJ9KM2xZpWNEh35zFEesQpNZIXTSXYkhzEOaQ==
X-Received: by 10.28.71.74 with SMTP id u71mr6790276wma.0.1466779184795;
	Fri, 24 Jun 2016 07:39:44 -0700 (PDT)
Received: from tfsielt31850.TYCOFS.COM ([185.46.212.65])
	by smtp.gmail.com with ESMTPSA id
	ue1sm5426206wjc.44.2016.06.24.07.39.43
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 24 Jun 2016 07:39:44 -0700 (PDT)
From: =?UTF-8?q?Andr=C3=A9=20Draszik?= <git@andred.net>
To: openembedded-core@lists.openembedded.org
Date: Fri, 24 Jun 2016 15:39:42 +0100
Message-Id: <1466779182-3976-1-git-send-email-git@andred.net>
X-Mailer: git-send-email 2.8.1
In-Reply-To: <1466765671-22371-3-git-send-email-git@andred.net>
References: <1466765671-22371-3-git-send-email-git@andred.net>
MIME-Version: 1.0
Subject: [PATCH 3/4 v2] uclibc: backport patch to fix gdb 7.11 compilation
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
X-List-Received-Date: Fri, 24 Jun 2016 14:39:48 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: André Draszik <adraszik@tycoint.com>

[YOCTO #9781]

Signed-off-by: André Draszik <adraszik@tycoint.com>
---
 meta/recipes-core/uclibc/uclibc-git.inc            |  1 +
 .../0001-Provide-an-alias-to-_obstack_free.patch   | 44 ++++++++++++++++++++++
 2 files changed, 45 insertions(+)
 create mode 100644 meta/recipes-core/uclibc/uclibc-git/0001-Provide-an-alias-to-_obstack_free.patch

diff --git a/meta/recipes-core/uclibc/uclibc-git.inc b/meta/recipes-core/uclibc/uclibc-git.inc
index a56fa7c..718bee9 100644
--- a/meta/recipes-core/uclibc/uclibc-git.inc
+++ b/meta/recipes-core/uclibc/uclibc-git.inc
@@ -6,6 +6,7 @@ FILESEXTRAPATHS =. "${FILE_DIRNAME}/uclibc-git:"
 
 SRC_URI = "git://uclibc-ng.org/git/uclibc-ng \
         file://0001-Disable-lrount_tes-function.patch \
+        file://0001-Provide-an-alias-to-_obstack_free.patch \
         file://uClibc.machine \
         file://uClibc.distro \
         file://obstack.cfg \
diff --git a/meta/recipes-core/uclibc/uclibc-git/0001-Provide-an-alias-to-_obstack_free.patch b/meta/recipes-core/uclibc/uclibc-git/0001-Provide-an-alias-to-_obstack_free.patch
new file mode 100644
index 0000000..30b443f
--- /dev/null
+++ b/meta/recipes-core/uclibc/uclibc-git/0001-Provide-an-alias-to-_obstack_free.patch
@@ -0,0 +1,44 @@
+From 06e4fe64bbd01f16ee84da161b8e1a61e73b4cdb Mon Sep 17 00:00:00 2001
+From: Alexey Neyman <aneyman@lynx.com>
+Date: Thu, 31 Mar 2016 13:02:47 -0700
+Subject: [PATCH] Provide an alias to _obstack_free
+
+GDB 7.11 does not build if compiled against uclibc-ng (1.0.12 was used,
+but the problematic code exists in 1.0.13 as well). The reason is that
+GDB release includes its own obstack implementation, but elides the code
+if <gnu-versions.h> declares a compatible obstack implementation in
+libc. uclibc-ng does claim compatible obstack interface (GDB expects
+version 2, but accepts version 1 if sizeof(int) == sizeof(size_t)),
+however, uclibc-ng does not provide the _obstack_free symbol that is a
+part of the interface (glibc does provide this symbol). This later
+causes a link failure.
+
+The attached patch makes uclibc-ng enables an alias _obstack_free ->
+obstack_free.
+
+Signed-off-by: Alexey Neyman <stilor@att.net>
+---
+Upstream-Status: Backport
+
+ libc/misc/gnu/obstack.c | 2 --
+ 1 file changed, 2 deletions(-)
+
+diff --git a/libc/misc/gnu/obstack.c b/libc/misc/gnu/obstack.c
+index 38cfd83..6acc567 100644
+--- a/libc/misc/gnu/obstack.c
++++ b/libc/misc/gnu/obstack.c
+@@ -385,11 +385,9 @@ obstack_free (struct obstack *h, void *obj)
+     abort ();
+ }
+ 
+-# if 0
+ /* Older versions of libc used a function _obstack_free intended to be
+    called by non-GCC compilers.  */
+ strong_alias (obstack_free, _obstack_free)
+-# endif
+ 
+ int
+ _obstack_memory_used (struct obstack *h)
+-- 
+2.8.1
+
-- 
2.8.1


