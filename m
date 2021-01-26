Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
 by mx.groups.io with SMTP id smtpd.web10.13082.1611672154310915231
 for <openembedded-core@lists.openembedded.org>;
 Tue, 26 Jan 2021 06:42:34 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=EZfSUdB+;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.51, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f51.google.com with SMTP id lw17so1385038pjb.0
        for <openembedded-core@lists.openembedded.org>; Tue, 26 Jan 2021 06:42:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=N+mMWPZBDhSeHvQEA3R3OPIxG3GAdfqN8hf1f4AA/Ic=;
        b=EZfSUdB+XFuAANWi3/pprb40QdyfNPyn5j0Iu9wxuzSSneN8fy3+6PDkCB+xFWO195
         UWl/y9AW5igkezCst6yuPBXCJPPNctDaKsPUXPXzkLRcGne7H+C079GitrDX9BfBEFzl
         1U6pPm9fUeTlPGmnbNR9N03PS/54rbZ2EiyrbR2ka9qJwAGMd/VQ5GFD+s09KQEP0lVu
         M5XCtMkw4gHGZ/vqaSrTSA1+VCzRUJf+4UazYfRU2qVjUn5k2JHpV4x792OsF+jp8Bi5
         l2CpmUChWyePBdKT4hz3qAS2Yp35AudwvcC1f6IdlcKFZXtaZjTxpWQRerUiAm1ymzlJ
         os5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=N+mMWPZBDhSeHvQEA3R3OPIxG3GAdfqN8hf1f4AA/Ic=;
        b=SxbWha3m2BFVrsJe6S76pu3QAmRMdO1+txRXMaKj7FvlXB+6g385A2Egrieb58nqsw
         BOxiiMjmRzFZ/rxpyoLlaXUrcEUfthCUPJz1h2dYi6jxbootb4Ny0b16VJmIOa9zseAa
         29YsakeVGGjZ+o3XnCrofKJhALZ2aZ64eJz6aQEdBvnWb996ysYxyST1Tbodv3zMB91y
         R0YGWjUaZK+8l3KKX0z+n8AkBEEaXaDtBbi1MUxe8C3A7zFrh0aYwG0wDP9hx5oBdM64
         HXEhfSugMw9JqP7XbXUm81PkaI21BUFVmmqMBSvJKJHicDumBO5n7BxL/071R2S+0H/F
         5Dvg==
X-Gm-Message-State: AOAM531PePJN/FCVgQ3s8tOJ0H4i5tV+Z0X7TspMY2FgsoOFZTZRAjYM
	o5TsVEwBMn4X/YPajCOJ4PvWqhp9O6JMZaAjUlg=
X-Google-Smtp-Source: ABdhPJxbClCu7RBiZLJ1r5+4WSVt9qyUn+/HzDhcWy2U4vs4UiUd0LN9jl4Y4e6huTrLzYmNvxmy4A==
X-Received: by 2002:a17:90b:1b50:: with SMTP id nv16mr63844pjb.153.1611672153343;
        Tue, 26 Jan 2021 06:42:33 -0800 (PST)
Return-Path: <steve@sakoman.com>
Received: from hexa.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id 11sm19303634pgz.22.2021.01.26.06.42.31
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Jan 2021 06:42:32 -0800 (PST)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell V3 07/46] pseudo: Abort on mismatch patch
Date: Tue, 26 Jan 2021 04:41:18 -1000
Message-Id: <2ebe58df3390a3610505bf573fb9de52f5418d4d.1611671734.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1611671734.git.steve@sakoman.com>
References: <cover.1611671734.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Richard Purdie <richard.purdie@linuxfoundation.org>

Rather than doing what turns out to be a rather dangerous "fixup" if
we see a file with a different path but the same inode as another file
we've previously seen, throw and abort. Direct the user to a wiki page
where we can maintain information about what this error means.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 2db491d97da08d44ebd257f98489550a82a7935c)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../pseudo/files/abort_on_mismatch.patch      | 64 +++++++++++++++++++
 meta/recipes-devtools/pseudo/pseudo_git.bb    |  1 +
 2 files changed, 65 insertions(+)
 create mode 100644 meta/recipes-devtools/pseudo/files/abort_on_mismatch.patch

diff --git a/meta/recipes-devtools/pseudo/files/abort_on_mismatch.patch b/meta/recipes-devtools/pseudo/files/abort_on_mismatch.patch
new file mode 100644
index 0000000000..1737269ec8
--- /dev/null
+++ b/meta/recipes-devtools/pseudo/files/abort_on_mismatch.patch
@@ -0,0 +1,64 @@
+Rather than mapping mismatched inode entries to paths, thrown an abort() 
+instead. Add a new result type to allow the server to pass back
+this instruction to the client.
+
+Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
+Upstream-Status: Pending
+
+Index: git/pseudo.c
+===================================================================
+--- git.orig/pseudo.c
++++ git/pseudo.c
+@@ -695,17 +695,15 @@ pseudo_op(pseudo_msg_t *msg, const char
+ 						msg->path);
+ 					pdb_did_unlink_file(path_by_ino, &by_ino, by_ino.deleting);
+ 				} else {
+-					int flags = 0;
+-					if (msg->nlink > 1) {
+-						flags = PDBGF_FILE | PDBGF_VERBOSE;
+-					}
+-					pseudo_debug(flags, "path mismatch [%d link%s]: ino %llu db '%s' req '%s'.\n",
++					pseudo_diag("path mismatch [%d link%s]: ino %llu db '%s' req '%s'.\n",
+ 						msg->nlink,
+ 						msg->nlink == 1 ? "" : "s",
+ 						(unsigned long long) msg_header.ino,
+ 						path_by_ino ? path_by_ino : "no path",
+ 						msg->path);
+ 					found_ino = 0;
++					msg->result = RESULT_ABORT;
++					goto op_exit;
+ 				}
+ 			}
+ 		} else {
+@@ -1025,6 +1023,7 @@ pseudo_op(pseudo_msg_t *msg, const char
+ 		break;
+ 	}
+ 
++op_exit:
+ 	/* in the case of an exact match, we just used the pointer
+ 	 * rather than allocating space.
+ 	 */
+Index: git/pseudo_client.c
+===================================================================
+--- git.orig/pseudo_client.c
++++ git/pseudo_client.c
+@@ -1919,6 +1919,10 @@ pseudo_client_op(pseudo_op_t op, int acc
+ #endif
+ 		if (result) {
+ 			pseudo_debug(PDBGF_OP, "(%d) %s", getpid(), pseudo_res_name(result->result));
++			if (result->result == RESULT_ABORT) {
++				pseudo_diag("abort()ing pseudi client by server request. See https://wiki.yoctoproject.org/wiki/Pseudo_Abort for more details on this.\n");
++				abort();
++			}
+ 			if (op == OP_STAT || op == OP_FSTAT) {
+ 				pseudo_debug(PDBGF_OP, " mode 0%o uid %d:%d",
+ 					(int) result->mode,
+Index: git/enums/res.in
+===================================================================
+--- git.orig/enums/res.in
++++ git/enums/res.in
+@@ -2,3 +2,4 @@ res: RESULT
+ succeed
+ fail
+ error
++abort
diff --git a/meta/recipes-devtools/pseudo/pseudo_git.bb b/meta/recipes-devtools/pseudo/pseudo_git.bb
index 57c32d0cfc..56c9b4e232 100644
--- a/meta/recipes-devtools/pseudo/pseudo_git.bb
+++ b/meta/recipes-devtools/pseudo/pseudo_git.bb
@@ -4,6 +4,7 @@ SRC_URI = "git://git.yoctoproject.org/pseudo;branch=oe-core \
            file://0001-configure-Prune-PIE-flags.patch \
            file://delete_mismatches.patch \
            file://add_ignore_paths.patch \
+           file://abort_on_mismatch.patch \
            file://fallback-passwd \
            file://fallback-group \
            "
-- 
2.25.1

