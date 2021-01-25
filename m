Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
 by mx.groups.io with SMTP id smtpd.web11.334.1611586314561952063
 for <openembedded-core@lists.openembedded.org>;
 Mon, 25 Jan 2021 06:51:54 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=iq4W1mUN;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.41, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f41.google.com with SMTP id kx7so8555357pjb.2
        for <openembedded-core@lists.openembedded.org>; Mon, 25 Jan 2021 06:51:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=N+mMWPZBDhSeHvQEA3R3OPIxG3GAdfqN8hf1f4AA/Ic=;
        b=iq4W1mUNbrWONFuzSUq0KHIqctlcLAYPefNcel0Sgb9264NlAe2M3yOg+G9gwKOs56
         KRACU69t11alXg1eUe4Cdyyz8q/MZfMI2udmrnpY1bqgZqYgtFaPXYzgOnNJpaos8wBF
         CDAIlKZ+lVyluwoWo9dlW9q/KSS1s8a/Q7YzxylWo8H4YnBT7VjdxJmJcvuz292/lx2T
         7yt/jhUru8l/SH9o1/eI1bO22ZH4HBwQLKFcx+EuxJiJJCwwbTeKe4aebDY+TISxOf8E
         qVwrSEUY19aOYTXWqRa6dvKrwDgHvtXB8FxmHNlVTQBp1d9wcxWpv5ffxGpqozC4iCtK
         dYHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=N+mMWPZBDhSeHvQEA3R3OPIxG3GAdfqN8hf1f4AA/Ic=;
        b=hWHV1jYhzpwLKPGpkG8qt57w7h4NbZy2BA6pIPofMObJNMg1nUxEImAeaW3yG5r6yZ
         NtaKQvNTDY6SGhzEg8528jpPCOyL8v2+254Zf2ric+V6SVVMey+JEBzpcsBBoV2CBnL8
         lH2L/Uth04APKiO7cFqrBgztZumqSgOBL9MoEC2v1rjI30R1zRTz9mN8ISITYEeowiQl
         jb5yiZQ6Q956zh1J6sH4pLNoQ9qTUSBG+wZD18v6V7iBJCbDWI8xuQAqPI7P+N2svAgp
         nBWFfwviIdFSAGq8O/U6NW5k8gX6h57Zr7xC79oLcwMk/cnVCDECPQNiyZBgIQeoLhxL
         RW6Q==
X-Gm-Message-State: AOAM533JmbFF9ym16760pbs82Ol7C8Pw1o5Pn88gp7QaO3n8ja4p1GiO
	m8iCpmmAwHcrVOmQ/zGTbENNteIe+UYbm4v00ME=
X-Google-Smtp-Source: ABdhPJwqfRur+Z4zMlM3nsnB+QhTF5/5HfnyFs+YMqeoQTFDtJowa8VRWf5e9u/APkYUGt6kMtvQ/A==
X-Received: by 2002:a17:90b:180d:: with SMTP id lw13mr583807pjb.94.1611586313647;
        Mon, 25 Jan 2021 06:51:53 -0800 (PST)
Return-Path: <steve@sakoman.com>
Received: from hexa.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id x8sm17574354pfn.27.2021.01.25.06.51.52
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Jan 2021 06:51:52 -0800 (PST)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 07/47] pseudo: Abort on mismatch patch
Date: Mon, 25 Jan 2021 04:50:39 -1000
Message-Id: <2ebe58df3390a3610505bf573fb9de52f5418d4d.1611585425.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1611585425.git.steve@sakoman.com>
References: <cover.1611585425.git.steve@sakoman.com>
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

