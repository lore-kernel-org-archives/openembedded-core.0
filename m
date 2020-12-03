Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
 by mx.groups.io with SMTP id smtpd.web09.11339.1607008137565776870
 for <openembedded-core@lists.openembedded.org>;
 Thu, 03 Dec 2020 07:08:57 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=auNiMXbV;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.180, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f180.google.com with SMTP id f1so1282412plt.12
        for <openembedded-core@lists.openembedded.org>; Thu, 03 Dec 2020 07:08:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=fOey65EgHlTrge2G/vWO/2apERjIzjLMv1iIoZe5XaE=;
        b=auNiMXbVJgxinulhvwqsGmMdJOfHg3OiyK8lpUAsmBvatvUQVo/NiM97U/I6pk76p8
         cnUdm348EhLL8ZJE9WLZuMrMlA0Y5PPo1FFGxxGCg2tKnKxGwDT5uW4572fK3COmHn0h
         TVLYyjin/DrSga+DuyEMFV5dr0OCzcvFefVB8smUPj33LReKq2w+SPRIVpuOMIIfGhjh
         3jMWVuvMFGdxjCR5jCL6jcqozaFhkXxaN2fWUksZJqrDQ2oPyHJquG+bMbZLkaRm6WZj
         Vs22nFU3xvoKzqfNjxIeQIJ/Rx7pKmWo13aKBfYgb4xbjcfkcLGIkGPclcbRW6UmNDn4
         sLHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=fOey65EgHlTrge2G/vWO/2apERjIzjLMv1iIoZe5XaE=;
        b=kmc5W8NrP0fV8QCVsnRaJ2nduTuwSSyKK1aFp7uaa+zg7yEKNiWz+TIW1EaflcTCRV
         UH2LOTjRfB4gBfI8hpbUIIJpmZx9TGlCguVwLco6JuZJpu9O1p/PvFw+l7nNhN0xR1S/
         6e2PhffApKC+L9DZn9yKSFlDrRPhA+K0rkF4r/JLcjMFIAh3Yp8Vl4NE766ldyfEeeY9
         fGFX4M8OnYZaIM6enr6OBd0rncscrT5SIco4PgiBreSA8uvPdULWe4JNQsPH0PxId6Tb
         Ixf77fLzLNKciSYz+6RN8TSJZ0h6yugDcxlKYroQJme53105Kb1btSQp2Ep32QpAUdNT
         3GNw==
X-Gm-Message-State: AOAM531kMSFZwvgl+u+3mqTjAbR9aaz8WTp4aIuThfSo07xo21sG8K1C
	/XbtxAoYNk+2gf8k8GfNYwWQgDEFpLOUMfoP
X-Google-Smtp-Source: ABdhPJziNPfFQVPhLbuviui+l8sULwXLNQTlgjzLGqPVii6L3RvvYFuCHXaOaYZt5HVncvwEklsVow==
X-Received: by 2002:a17:90b:68e:: with SMTP id m14mr3445981pjz.228.1607008136629;
        Thu, 03 Dec 2020 07:08:56 -0800 (PST)
Return-Path: <steve@sakoman.com>
Received: from octo.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id s7sm1632320pju.37.2020.12.03.07.08.55
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Dec 2020 07:08:55 -0800 (PST)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 07/28] pseudo: Abort on mismatch patch
Date: Thu,  3 Dec 2020 05:07:57 -1000
Message-Id: <367cbf64fc97ff39a2a4d109a43b4ecbad7ee69f.1607007208.git.steve@sakoman.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1607007208.git.steve@sakoman.com>
References: <cover.1607007208.git.steve@sakoman.com>

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
2.17.1

