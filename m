Received: from mail-wr1-f65.google.com (mail-wr1-f65.google.com [209.85.221.65])
 by mx.groups.io with SMTP id smtpd.web11.9771.1602065694064697227
 for <openembedded-core@lists.openembedded.org>;
 Wed, 07 Oct 2020 03:14:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=UvV/ulKC;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.65, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f65.google.com with SMTP id j2so1482623wrx.7
        for <openembedded-core@lists.openembedded.org>; Wed, 07 Oct 2020 03:14:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=QiRVdg60fzmWpzvoBKWM/VfTbHC9DkAzzG9Y+0YIYYc=;
        b=UvV/ulKCyXG9uuZZRclVF5BRmofN0B0upaTaDjT3ePrwqR3QY/cRIsduHqMTi6ZzDD
         FietVWZ7APvUfAuzl8QaGwNroVYfVmzpJPS6lZOPxz+gDvCJMLMzgLR7JZb7MI28cYjy
         x0qifx4k7rGltmocjTQAHcPz7n869DxYaUIoU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=QiRVdg60fzmWpzvoBKWM/VfTbHC9DkAzzG9Y+0YIYYc=;
        b=kwjGd1DBZGAZIqvTfGLcLdIAgdmMCMuyQZd+bz+dnrsbN+QR3MsnGIqdc7IuV4c+cH
         MK7ajLCIjy4vpP3G0kulhY8y7WlTswXUEkXNyV3YbfsRUr8EtIEx3QUkESSTKI5sx5wJ
         2toEO0n/WQKN8r9kgd+VxtAsB5FFrpbIBcHaQ6Qe3oVRcNApZuPK6wuXON8/q1lD3Hpi
         UqBkW1aWwfHCMm+iqoE0gy8jBmvYsCD90ZpP559j9Rrb3A0++pkZRht/afJdPg6qYTzf
         psahQuX1BQVzTEXPtRQfucFvMbFRiL/WpefFZX1IXwjwzbMrsQPUOpwp7Jz15QraLHIB
         LiFw==
X-Gm-Message-State: AOAM531p0AXdccODEkQVmf7MuyQMyTVJU08ed+o2dkwT8xnin+pgNUIc
	/+Ge8cI44Sdx+hJ2m3ddXX3CaU4LlEulaw==
X-Google-Smtp-Source: ABdhPJwiMBchDY+UeTGx34X1+KmIXPypdqRBXh8cWLRi3oPn4Ldavt/OKesX3mYuuyzY9nGLsXUcBw==
X-Received: by 2002:a5d:4f09:: with SMTP id c9mr2548593wru.427.1602065692293;
        Wed, 07 Oct 2020 03:14:52 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex.int.rpsys.net (f.c.8.7.1.0.8.4.a.6.c.a.3.f.8.f.c.3.f.5.a.b.a.0.0.b.8.0.1.0.0.2.ip6.arpa. [2001:8b0:aba:5f3c:f8f3:ac6a:4801:78cf])
        by smtp.gmail.com with ESMTPSA id v2sm2183956wme.19.2020.10.07.03.14.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Oct 2020 03:14:51 -0700 (PDT)
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Cc: seebs@seebs.net
Subject: [PATCH 3/9] pseudo: Abort on mismatch patch
Date: Wed,  7 Oct 2020 11:14:43 +0100
Message-Id: <20201007101449.3132127-3-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201007101449.3132127-1-richard.purdie@linuxfoundation.org>
References: <20201007101449.3132127-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Rather than doing what turns out to be a rather dangerous "fixup" if
we see a file with a different path but the same inode as another file
we've previously seen, throw and abort. Direct the user to a wiki page
where we can maintain information about what this error means.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 .../pseudo/files/abort_on_mismatch.patch      | 64 +++++++++++++++++++
 meta/recipes-devtools/pseudo/pseudo_git.bb    |  1 +
 2 files changed, 65 insertions(+)
 create mode 100644 meta/recipes-devtools/pseudo/files/abort_on_mismatch.patch

diff --git a/meta/recipes-devtools/pseudo/files/abort_on_mismatch.patch b/meta/recipes-devtools/pseudo/files/abort_on_mismatch.patch
new file mode 100644
index 00000000000..1737269ec8d
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
index 57c32d0cfc1..56c9b4e2328 100644
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

