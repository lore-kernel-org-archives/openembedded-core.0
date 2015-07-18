Return-Path: <akuster808@gmail.com>
Received: from mail-pa0-f43.google.com (mail-pa0-f43.google.com
	[209.85.220.43])
	by mail.openembedded.org (Postfix) with ESMTP id 9585F65CCC
	for <openembedded-core@lists.openembedded.org>;
	Sat, 18 Jul 2015 15:16:42 +0000 (UTC)
Received: by pabkd10 with SMTP id kd10so4893631pab.2
	for <openembedded-core@lists.openembedded.org>;
	Sat, 18 Jul 2015 08:16:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:in-reply-to
	:references:mime-version:content-type:content-transfer-encoding;
	bh=cinuS2u82pJfMzPMNvFQfYgycwEYyQIfb774gJdHR7c=;
	b=nZjB8uzv2xjpwf71XJc71rnyQ8hQpwazo21RHAq1UaMQm+G0ItlrHg4gYG9D/GkUTk
	EsL2esrfTYl9/sKbwkAk/z3sp49V5IxFRJZye7bWT72w98bAU1QNxFQPtvOGRrtYZ2E6
	UKGfGpUGLGcL4HmP70tA7y7RQYMicdW/YG+qLDM3pRFo66RbG29W/081owoAkcUMyHGr
	ChzRDp5/x+5NNGjwQJU8y1yz75UcGvWY2rDnUg45fE6A4NmR5llIiXYw4qi2M8+aldIc
	++j8Pa85r/JYVb89QA4zJmlUbsW4C5G+d29sglvxP9tDlu3c970fXHXC31ZBArS75EQ3
	U9Cg==
X-Received: by 10.68.94.37 with SMTP id cz5mr40270797pbb.70.1437232602672;
	Sat, 18 Jul 2015 08:16:42 -0700 (PDT)
Received: from bigIsland.kama-aina.net (c-76-20-92-207.hsd1.ca.comcast.net.
	[76.20.92.207]) by smtp.gmail.com with ESMTPSA id
	oa3sm14621105pbb.23.2015.07.18.08.16.40
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 18 Jul 2015 08:16:41 -0700 (PDT)
Received: by bigIsland.kama-aina.net (Postfix, from userid 1000)
	id 505D5FC12EC; Sat, 18 Jul 2015 08:16:35 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sat, 18 Jul 2015 08:16:11 -0700
Message-Id: <df62eaea9550db8002e15799f4dbae6942f49730.1437232180.git.akuster808@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1437232180.git.akuster808@gmail.com>
References: <cover.1437232180.git.akuster808@gmail.com>
In-Reply-To: <cover.1437232180.git.akuster808@gmail.com>
References: <cover.1437232180.git.akuster808@gmail.com>
MIME-Version: 1.0
Subject: [PATCH 04/25] curl: several security fixes
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
X-List-Received-Date: Sat, 18 Jul 2015 15:16:46 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: "Maxin B. John" <maxin.john@enea.com>

Fixes below listed bugs:
1. CVE-2015-3143
2. CVE-2015-3144
3. CVE-2015-3145

Dropped: 4. CVE-2015-3148
SPNEGO was introduced in 7.39 so this version not affected

Signed-off-by: Maxin B. John <maxin.john@enea.com>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta/recipes-support/curl/curl/CVE-2015-3143.patch | 38 ++++++++++++
 meta/recipes-support/curl/curl/CVE-2015-3144.patch | 45 ++++++++++++++
 meta/recipes-support/curl/curl/CVE-2015-3145.patch | 70 ++++++++++++++++++++++
 3 files changed, 153 insertions(+)
 create mode 100644 meta/recipes-support/curl/curl/CVE-2015-3143.patch
 create mode 100644 meta/recipes-support/curl/curl/CVE-2015-3144.patch
 create mode 100644 meta/recipes-support/curl/curl/CVE-2015-3145.patch

diff --git a/meta/recipes-support/curl/curl/CVE-2015-3143.patch b/meta/recipes-support/curl/curl/CVE-2015-3143.patch
new file mode 100644
index 0000000..745e945
--- /dev/null
+++ b/meta/recipes-support/curl/curl/CVE-2015-3143.patch
@@ -0,0 +1,38 @@
+From d7d1bc8f08eea1a85ab0d794bc1561659462d937 Mon Sep 17 00:00:00 2001
+From: Daniel Stenberg <daniel@haxx.se>
+Date: Thu, 16 Apr 2015 13:26:46 +0200
+Subject: [PATCH] ConnectionExists: for NTLM re-use, require credentials to
+ match
+
+Upstream-Status: Backport
+
+CVE-2015-3143
+
+Bug: http://curl.haxx.se/docs/adv_20150422A.html
+Reported-by: Paras Sethia
+Signed-off-by: Daniel Stenberg <daniel@haxx.se>
+Signed-off-by: Maxin B. John <maxin.john@enea.com>
+---
+ lib/url.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/lib/url.c b/lib/url.c
+index 018bb88..ee3d176 100644
+--- a/lib/url.c
++++ b/lib/url.c
+@@ -3207,11 +3207,11 @@ ConnectionExists(struct SessionHandle *data,
+            strcmp(check->localdev, needle->localdev))
+           continue;
+       }
+ 
+       if((!(needle->handler->flags & PROTOPT_CREDSPERREQUEST)) ||
+-         wantNTLMhttp) {
++         (wantNTLMhttp || check->ntlm.state != NTLMSTATE_NONE)) {
+         /* This protocol requires credentials per connection or is HTTP+NTLM,
+            so verify that we're using the same name and password as well */
+         if(!strequal(needle->user, check->user) ||
+            !strequal(needle->passwd, check->passwd)) {
+           /* one of them was different */
+-- 
+2.1.4
+
diff --git a/meta/recipes-support/curl/curl/CVE-2015-3144.patch b/meta/recipes-support/curl/curl/CVE-2015-3144.patch
new file mode 100644
index 0000000..ca6d744
--- /dev/null
+++ b/meta/recipes-support/curl/curl/CVE-2015-3144.patch
@@ -0,0 +1,45 @@
+From 6218ded6001ea330e589f92b6b2fa12777752b5d Mon Sep 17 00:00:00 2001
+From: Daniel Stenberg <daniel@haxx.se>
+Date: Thu, 16 Apr 2015 23:52:04 +0200
+Subject: [PATCH] fix_hostname: zero length host name caused -1 index offset
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+Upstream-Status: Backport
+
+If a URL is given with a zero-length host name, like in "http://:80" or
+just ":80", `fix_hostname()` will index the host name pointer with a -1
+offset (as it blindly assumes a non-zero length) and both read and
+assign that address.
+
+CVE-2015-3144
+
+Bug: http://curl.haxx.se/docs/adv_20150422D.html
+Reported-by: Hanno Böck
+Signed-off-by: Daniel Stenberg <daniel@haxx.se>
+Signed-off-by: Maxin B. John <maxin.john@enea.com>
+---
+ lib/url.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/lib/url.c b/lib/url.c
+index ee3d176..f033dbc 100644
+--- a/lib/url.c
++++ b/lib/url.c
+@@ -3625,11 +3625,11 @@ static void fix_hostname(struct SessionHandle *data,
+ 
+   /* set the name we use to display the host name */
+   host->dispname = host->name;
+ 
+   len = strlen(host->name);
+-  if(host->name[len-1] == '.')
++  if(len && (host->name[len-1] == '.'))
+     /* strip off a single trailing dot if present, primarily for SNI but
+        there's no use for it */
+     host->name[len-1]=0;
+ 
+   if(!is_ASCII_name(host->name)) {
+-- 
+2.1.4
+
diff --git a/meta/recipes-support/curl/curl/CVE-2015-3145.patch b/meta/recipes-support/curl/curl/CVE-2015-3145.patch
new file mode 100644
index 0000000..15a9982
--- /dev/null
+++ b/meta/recipes-support/curl/curl/CVE-2015-3145.patch
@@ -0,0 +1,70 @@
+From ea595c516bc936a514753597aa6c59fd6eb0765e Mon Sep 17 00:00:00 2001
+From: Daniel Stenberg <daniel@haxx.se>
+Date: Thu, 16 Apr 2015 16:37:40 +0200
+Subject: [PATCH] cookie: cookie parser out of boundary memory access
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+Upstream-Status: Backport
+
+The internal libcurl function called sanitize_cookie_path() that cleans
+up the path element as given to it from a remote site or when read from
+a file, did not properly validate the input. If given a path that
+consisted of a single double-quote, libcurl would index a newly
+allocated memory area with index -1 and assign a zero to it, thus
+destroying heap memory it wasn't supposed to.
+
+CVE-2015-3145
+
+Bug: http://curl.haxx.se/docs/adv_20150422C.html
+Reported-by: Hanno Böck
+Signed-off-by: Daniel Stenberg <daniel@haxx.se>
+Signed-off-by: Maxin B. John <maxin.john@enea.com>
+---
+ lib/cookie.c | 12 +++++++-----
+ 1 file changed, 7 insertions(+), 5 deletions(-)
+
+diff --git a/lib/cookie.c b/lib/cookie.c
+index 0864f6b..0127926 100644
+--- a/lib/cookie.c
++++ b/lib/cookie.c
+@@ -223,15 +223,18 @@ static char *sanitize_cookie_path(const char *cookie_path)
+   char *new_path = strdup(cookie_path);
+   if(!new_path)
+     return NULL;
+ 
+   /* some stupid site sends path attribute with '"'. */
++  len = strlen(new_path);
+   if(new_path[0] == '\"') {
+-    memmove((void *)new_path, (const void *)(new_path + 1), strlen(new_path));
++    memmove((void *)new_path, (const void *)(new_path + 1), len);
++    len--;
+   }
+-  if(new_path[strlen(new_path) - 1] == '\"') {
+-    new_path[strlen(new_path) - 1] = 0x0;
++  if(len && (new_path[len - 1] == '\"')) {
++    new_path[len - 1] = 0x0;
++    len--;
+   }
+ 
+   /* RFC6265 5.2.4 The Path Attribute */
+   if(new_path[0] != '/') {
+     /* Let cookie-path be the default-path. */
+@@ -239,12 +242,11 @@ static char *sanitize_cookie_path(const char *cookie_path)
+     new_path = strdup("/");
+     return new_path;
+   }
+ 
+   /* convert /hoge/ to /hoge */
+-  len = strlen(new_path);
+-  if(1 < len && new_path[len - 1] == '/') {
++  if(len && new_path[len - 1] == '/') {
+     new_path[len - 1] = 0x0;
+   }
+ 
+   return new_path;
+ }
+-- 
+2.1.4
+
-- 
1.9.1


