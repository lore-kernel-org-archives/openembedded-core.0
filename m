Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
 by mx.groups.io with SMTP id smtpd.web09.315.1611586319820700658
 for <openembedded-core@lists.openembedded.org>;
 Mon, 25 Jan 2021 06:51:59 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=s4GZLplx;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.178, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f178.google.com with SMTP id q131so8500796pfq.10
        for <openembedded-core@lists.openembedded.org>; Mon, 25 Jan 2021 06:51:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=OS/NZc7BfhtlfAQNtnhDMBiK21S+kmzpnDB7BHIODdE=;
        b=s4GZLplxu0g/nM2tjnon0chYyyeYYWWxfmHyy861EoWhFP+byoEWCvqs/5/ZPsx4Fg
         Wqxvaqet4Z2YJPuE2I+zrX2Fkv/bPVCXAhdqzvkHnvzjTD+bEdKd2a38kV8aFn51Ja0R
         76u9w5Oll3OriwssoVgvDHxLfON0wB8mrmckd2h/0tdnYHcEpW5s/1RbnJ1SAGFzR82U
         UrOHtxdLmyoY0UiA40AZKbAcdsXziNme5lZMETjN3/+0BDdNl4h0DqBUFwgDm1pebOH3
         Dek39xgm2wnlcQO3I0sTevkpAVXa1Exsy0/MkN5HV4B5mE81vLSqSNMFwkVIUdEP1YaY
         SU9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=OS/NZc7BfhtlfAQNtnhDMBiK21S+kmzpnDB7BHIODdE=;
        b=ZADoaIp5vcDfTsI6WIv8DEyoDBtPQsqLJDn4Aw/YSeQLbshDO2FoXz4iD/WaP5C3Js
         u+4qC6ngyObsDGTOXLoZBu0/y/qJ9gYGDnE4LkAyd4F3TpaCy1zSyM/+GFyrGb/hRB4u
         EO9z1+0ny/FitwrwS0We1VzhiIyce+LdswD4/AxsyUsJ4yNkW5vXNQt3oXRxvYckVvBS
         IxgCT/Pw4g6iVFmfhFN/DzS5osxsh0pplRyRGXHHhEwHlczS9+sSg5j14XayifQMD6J3
         eFhTQrNlxBmvaCVBzcMHDUNwOwA0dm1dJdDgYuHUvQv7/U1q5nxfcrdPMIj/6WU5eOWr
         Jh2Q==
X-Gm-Message-State: AOAM532UJQY3p0cV8BLt3x+IbKYURf6/UaYSFxqxDBD36V/cNRrPbN/9
	3fV8y32/dkWcNN4Z50asuGdqZjH2NyRyDDNZoXo=
X-Google-Smtp-Source: ABdhPJzHKZzlpabAxXoHAlE8hHgfG6LjUdVmS+1ZoSr4DeCRXqxSL/ZbB1PJtcHud2xHbz/eo+VCIA==
X-Received: by 2002:a63:e5e:: with SMTP id 30mr969063pgo.181.1611586318890;
        Mon, 25 Jan 2021 06:51:58 -0800 (PST)
Return-Path: <steve@sakoman.com>
Received: from hexa.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id x8sm17574354pfn.27.2021.01.25.06.51.57
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Jan 2021 06:51:58 -0800 (PST)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 09/47] pseudo: Fix xattr segfault
Date: Mon, 25 Jan 2021 04:50:41 -1000
Message-Id: <c1ac0f01a817a52525503e7e4a72ae2310f6346a.1611585425.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1611585425.git.steve@sakoman.com>
References: <cover.1611585425.git.steve@sakoman.com>
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

