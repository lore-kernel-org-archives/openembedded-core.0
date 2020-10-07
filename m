Received: from mail-wm1-f68.google.com (mail-wm1-f68.google.com [209.85.128.68])
 by mx.groups.io with SMTP id smtpd.web12.9874.1602065695236136503
 for <openembedded-core@lists.openembedded.org>;
 Wed, 07 Oct 2020 03:14:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=Tcgvnqxi;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.68, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f68.google.com with SMTP id d4so1681825wmd.5
        for <openembedded-core@lists.openembedded.org>; Wed, 07 Oct 2020 03:14:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=8Rz32szlMt/TJwgOGkI0gMdX0oeYUjFcpX2iop8m8+s=;
        b=TcgvnqxiUe2n3rQU0wVfoW+YrhZM0zpw/h852AfqkL3uYfmcsqSrEIOKqLYv6tIRhr
         BMNV4zCw2vDOgIU6hXivKYkrUzklDtGzFA6Zpjbq6IRgZ/MEgbSfIB171Wl3OfavoMXh
         5zhmbnxGChYbbsZxWc6LHoNtugrQ9B2+wfbtI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=8Rz32szlMt/TJwgOGkI0gMdX0oeYUjFcpX2iop8m8+s=;
        b=skDFPxJrDIf31qQrJ5IzgyEQ8h1eCKD35T4jfPKxY15y2ZJ6iUimD0bVX513xTngft
         H/qQC6YqCKoHQskwPUGw8Csk8LpODBKlEtXuXyPIM08g7c6/gV9DqAmg50GVjIYSwyVW
         aF37QiI2lvjCeCP7mBIgo+ABexC5TpcWEe/V0JTKgECDlxBg97WgUX+qkhkBVGkbkuho
         l/Qv1oys9Z3dQFSsQHc4Qr3zT8+py/+NfuF1lv3qdEW+CVg/OG+juoqH77VbCTsZJGF0
         5dvJZGgo0JXX2m3s+Ux4pnq8WDUIQutfi0oFe9pSwnHgwTCbDNF4Gq5eg0Jvbsx5cEP1
         3WLg==
X-Gm-Message-State: AOAM533lzH4fgpQSp3qbCMW37biXfNhQpdCQuJ5IQvn2o3C5gPf1JoHm
	bx0iqrVTzzTkwEkq3INNUnjEH+LVIuGlfA==
X-Google-Smtp-Source: ABdhPJw4NHzXXKZK81o7WzE5qfd2JUUtIb0roeVSplrrxWYfWu26x6SLY33KyeS0jCCF4HD6mPIiGQ==
X-Received: by 2002:a05:600c:210f:: with SMTP id u15mr2579210wml.53.1602065693454;
        Wed, 07 Oct 2020 03:14:53 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex.int.rpsys.net (f.c.8.7.1.0.8.4.a.6.c.a.3.f.8.f.c.3.f.5.a.b.a.0.0.b.8.0.1.0.0.2.ip6.arpa. [2001:8b0:aba:5f3c:f8f3:ac6a:4801:78cf])
        by smtp.gmail.com with ESMTPSA id v2sm2183956wme.19.2020.10.07.03.14.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Oct 2020 03:14:53 -0700 (PDT)
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Cc: seebs@seebs.net
Subject: [PATCH 5/9] pseudo: Fix xattr segfault
Date: Wed,  7 Oct 2020 11:14:45 +0100
Message-Id: <20201007101449.3132127-5-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201007101449.3132127-1-richard.purdie@linuxfoundation.org>
References: <20201007101449.3132127-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix a NULL pointer dereference exposed by the path ignore code in
xattr handling.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 .../pseudo/files/xattr_fix.patch              | 40 +++++++++++++++++++
 meta/recipes-devtools/pseudo/pseudo_git.bb    |  1 +
 2 files changed, 41 insertions(+)
 create mode 100644 meta/recipes-devtools/pseudo/files/xattr_fix.patch

diff --git a/meta/recipes-devtools/pseudo/files/xattr_fix.patch b/meta/recipes-devtools/pseudo/files/xattr_fix.patch
new file mode 100644
index 00000000000..61d0030b103
--- /dev/null
+++ b/meta/recipes-devtools/pseudo/files/xattr_fix.patch
@@ -0,0 +1,40 @@
+
+In the xattr handling functions, if result is NULL, which it can be 
+with the path ignore code, there is a NULL pointer dereference and 
+segfault. Everywhere else checks result first, this appears to just 
+be an omission.
+
+Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
+Upstream-Status: Pending
+
+Index: git/ports/linux/xattr/pseudo_wrappers.c
+===================================================================
+--- git.orig/ports/linux/xattr/pseudo_wrappers.c
++++ git/ports/linux/xattr/pseudo_wrappers.c
+@@ -134,7 +134,7 @@ static ssize_t shared_getxattr(const cha
+ 	pseudo_debug(PDBGF_XATTR, "getxattr(%s [fd %d], %s)\n",
+ 		path ? path : "<no path>", fd, name);
+ 	pseudo_msg_t *result = pseudo_client_op(OP_GET_XATTR, 0, fd, -1, path, &buf, name);
+-	if (result->result != RESULT_SUCCEED) {
++	if (!result || result->result != RESULT_SUCCEED) {
+ 		errno = ENOATTR;
+ 		return -1;
+ 	}
+@@ -254,7 +254,7 @@ static int shared_setxattr(const char *p
+ static ssize_t shared_listxattr(const char *path, int fd, char *list, size_t size) {
+ 	RC_AND_BUF
+ 	pseudo_msg_t *result = pseudo_client_op(OP_LIST_XATTR, 0, fd, -1, path, &buf);
+-	if (result->result != RESULT_SUCCEED) {
++	if (!result || result->result != RESULT_SUCCEED) {
+ 		pseudo_debug(PDBGF_XATTR, "listxattr: no success.\n");
+ 		errno = ENOATTR;
+ 		return -1;
+@@ -276,7 +276,7 @@ static int shared_removexattr(const char
+ 	RC_AND_BUF
+ 	pseudo_msg_t *result = pseudo_client_op(OP_REMOVE_XATTR, 0, fd, -1, path, &buf, name);
+ 
+-	if (result->result != RESULT_SUCCEED) {
++	if (!result || result->result != RESULT_SUCCEED) {
+ 		/* docs say ENOATTR, but I don't have one */
+ 		errno = ENOENT;
+ 		return -1;
diff --git a/meta/recipes-devtools/pseudo/pseudo_git.bb b/meta/recipes-devtools/pseudo/pseudo_git.bb
index a5e79ec9a5c..7857b4f1b13 100644
--- a/meta/recipes-devtools/pseudo/pseudo_git.bb
+++ b/meta/recipes-devtools/pseudo/pseudo_git.bb
@@ -6,6 +6,7 @@ SRC_URI = "git://git.yoctoproject.org/pseudo;branch=oe-core \
            file://add_ignore_paths.patch \
            file://abort_on_mismatch.patch \
            file://track_link_fds.patch \
+           file://xattr_fix.patch \
            file://fallback-passwd \
            file://fallback-group \
            "
-- 
2.25.1

