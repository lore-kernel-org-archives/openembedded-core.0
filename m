Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
 by mx.groups.io with SMTP id smtpd.web10.13086.1611672159675815110
 for <openembedded-core@lists.openembedded.org>;
 Tue, 26 Jan 2021 06:42:39 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=PKe21UJv;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.174, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f174.google.com with SMTP id q131so10517756pfq.10
        for <openembedded-core@lists.openembedded.org>; Tue, 26 Jan 2021 06:42:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=OS/NZc7BfhtlfAQNtnhDMBiK21S+kmzpnDB7BHIODdE=;
        b=PKe21UJv3yjQPYkefJHtRDxR1Mxz3C5VpjD2gzCiOVrceGi9ALpbEBKBrMDyStZEjY
         2i9P1yyiG3IoAJjXFiRNfGjlEf8UzRuKMKPMxNvgZrwOodkwEmnX1TLsWbTyuoTfKvqp
         iZ+R6g+0ttjppRGOTMbg0OnIcU7fG+WmDZDy5qXVR7W5DiZXAXLgGnqljTUqPDItYFtq
         rSAzw/SfB/99e+IX0Ljtf6m9/35MPW2PTSliteteKlvQ7BqlirJ9xMkbVdqEQIBCusBQ
         1wLpFPbDHCVr0TROGiQ/HWneDGU4UvZnMaWGmuwMbCX2IcdvBOUdXSjC4+/tLbqjoNYV
         RZCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=OS/NZc7BfhtlfAQNtnhDMBiK21S+kmzpnDB7BHIODdE=;
        b=A8wDOZXH9rYsGoZmpbttsgr6uOaWsa7UNjbogpsDEnDbB2RPQQbkNIbn81aH3PMIzP
         ZG4JdAvdDphCwqwVO7/1/86hEdojiCXBnIrfB+nfy/lfBTmDwMsiTn1k5tDT65VKDop2
         vvvUC+aPJqJSLQeVHyuokqI2YMaGO1Yg4ENz6PAAIa1/pRuteiBavNCx61+/ZIik9jVC
         Dv4nPCFTiZBcG/7D/uIbMrnLWElxQPnI9uh+nykql26tmpmgGdy4R7H49F1Aw/+BbXBm
         al7ELka9JkLhdrnfY24x3nTBW89aM4Bav/UsbWMCD1NXbEh2OlfT3dNZL65jhbRu3G9A
         aX8w==
X-Gm-Message-State: AOAM5302/dOZvhjggP70PeUfFqxJvFjJ6ExDHfH6sxiwgq6t+3/UOblV
	E1W4YYslIM8V9A9NjnhWlG1hz2jReDyOQkyjsag=
X-Google-Smtp-Source: ABdhPJxw7iJ5zSVhgKA+5DLcYcjAGOu2cZpieqsttI6lBl+e5onk9Ls72WOTaRpXgTHV8MKv+1O+Uw==
X-Received: by 2002:aa7:84da:0:b029:1bd:5f0e:b1f2 with SMTP id x26-20020aa784da0000b02901bd5f0eb1f2mr5507579pfn.41.1611672158619;
        Tue, 26 Jan 2021 06:42:38 -0800 (PST)
Return-Path: <steve@sakoman.com>
Received: from hexa.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id 11sm19303634pgz.22.2021.01.26.06.42.36
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Jan 2021 06:42:37 -0800 (PST)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell V3 09/46] pseudo: Fix xattr segfault
Date: Tue, 26 Jan 2021 04:41:20 -1000
Message-Id: <c1ac0f01a817a52525503e7e4a72ae2310f6346a.1611671734.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1611671734.git.steve@sakoman.com>
References: <cover.1611671734.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Richard Purdie <richard.purdie@linuxfoundation.org>

Fix a NULL pointer dereference exposed by the path ignore code in
xattr handling.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 929a27bf6cbca94d1141d2094ae0c915d93bd3f4)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../pseudo/files/xattr_fix.patch              | 40 +++++++++++++++++++
 meta/recipes-devtools/pseudo/pseudo_git.bb    |  1 +
 2 files changed, 41 insertions(+)
 create mode 100644 meta/recipes-devtools/pseudo/files/xattr_fix.patch

diff --git a/meta/recipes-devtools/pseudo/files/xattr_fix.patch b/meta/recipes-devtools/pseudo/files/xattr_fix.patch
new file mode 100644
index 0000000000..61d0030b10
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
index a5e79ec9a5..7857b4f1b1 100644
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

