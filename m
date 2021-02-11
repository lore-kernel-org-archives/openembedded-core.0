Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
 by mx.groups.io with SMTP id smtpd.web12.11992.1613064157157168592
 for <openembedded-core@lists.openembedded.org>;
 Thu, 11 Feb 2021 09:22:37 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=Jbl4sEAO;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.50, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f50.google.com with SMTP id m13so4894749wro.12
        for <openembedded-core@lists.openembedded.org>; Thu, 11 Feb 2021 09:22:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=645HczZ4JVZA63Hey9nsSdhflIXsBWS1+M775QMsMyU=;
        b=Jbl4sEAOgQPTfppEjt6aIsQiPzZO9jb6fL4jnyl1x83MOQ3Mw41rtxrJId+OXaOnzo
         TgOV/KRbXBEp9jbYLHLICe8HEDvcQPZzhjbBihSkdzR2f3VUg8wz3eg+cRoYlvzPa5VB
         6OaPT32ZnMsnxKoII5rgGydun4d8W/6x8v0FQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=645HczZ4JVZA63Hey9nsSdhflIXsBWS1+M775QMsMyU=;
        b=A89xG8G+1oWCKoSOHkZlIo1eF/ikN2UmkWyvTzk0EYpmpyAoxCx0BHCxnTXNFcH7gl
         FdJFE7hJ+AStzcBdoOh+Q+V/WR2TEyDaQm9mIj2mqeoIBbbxxDZ4hqkl6bfup7ROW+6e
         xhdF4ZC4m2GM0s8Kk09REz8ONgfmWUjS5fvx36OiWL62/bGjeqN4V2Mez+6jT/9bwGhm
         AsZsW8S10cDGkdZbYv8VnylAlbE1HgjjKjAhtpu1FA+7+I4uwXln8DKg5eoy2lCQg2mv
         5ZR7zo0tAH1hI8XnOAHKgvd/wQlfNvJJprtzPSt3mmRzSPQq3n5emP226MwzGO3+DndE
         dc7Q==
X-Gm-Message-State: AOAM5315eyvfPE001XqdNew5YU+Y94qfabngAARatdvS/fm0dIPDuXLk
	mFMhraG643CXDtjYjAHnURHYUlBZe3o6sA==
X-Google-Smtp-Source: ABdhPJy658UJeROkmG/N/OimISqLh1R00jfQOnQOOhgWneQd6MDM4AkIhc+JIoXjp0pE6lfKLR0PIQ==
X-Received: by 2002:a5d:61d0:: with SMTP id q16mr6830456wrv.387.1613064155470;
        Thu, 11 Feb 2021 09:22:35 -0800 (PST)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex.int.rpsys.net ([2001:8b0:aba:5f3c:1f44:6379:818:1e61])
        by smtp.gmail.com with ESMTPSA id 36sm6727836wrj.97.2021.02.11.09.22.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Feb 2021 09:22:35 -0800 (PST)
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Cc: seebs@seebs.net
Subject: [PATCH 3/3] ports/rename/renameat: Avoid race when renaming files
Date: Thu, 11 Feb 2021 17:22:33 +0000
Message-Id: <20210211172233.1887023-3-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210211172233.1887023-1-richard.purdie@linuxfoundation.org>
References: <20210211172233.1887023-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

We're seeing failures where a file is renamed under pseudo but an
access appears to be made to the old filename before the OP_RENAME has
hit the database but after the real_rename has applied in the kernel.

This is effectively the MAY_UNLINK problem for the original filename. There
were protections for the newpath but not the oldpath.

To try and avoid these aborts(), mark the original path as MAY_UNLINK however
we need to be careful not to trigger the DID_UNLINK but instead update
the deleting entry in the database as the rename completes. To do this,
we no clear the deleting flag during the database rename operation in SQL.

Also, we have to stop removing the by_ino matches where by_ino.deleting is
set, else we may lose the renamed file's attributes that way.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 ports/unix/guts/rename.c   | 35 ++++++++++++++++++++++-------------
 ports/unix/guts/renameat.c | 34 +++++++++++++++++++++-------------
 pseudo.c                   | 11 +++++------
 pseudo_db.c                |  4 ++--
 4 files changed, 50 insertions(+), 34 deletions(-)

diff --git a/ports/unix/guts/rename.c b/ports/unix/guts/rename.c
index 7e4a499..80bbf41 100644
--- a/ports/unix/guts/rename.c
+++ b/ports/unix/guts/rename.c
@@ -13,7 +13,8 @@
 	int oldrc, newrc;
 	int save_errno;
 	int old_db_entry = 0;
-	int may_unlinked = 0;
+	int may_unlink_new = 0;
+	int may_unlink_old = 0;
 
 	pseudo_debug(PDBGF_OP, "rename: %s->%s\n",
 		oldpath ? oldpath : "<nil>",
@@ -43,28 +44,36 @@
 	/* as with unlink, we have to mark that the file may get deleted */
 	msg = pseudo_client_op(OP_MAY_UNLINK, 0, -1, -1, newpath, newrc ? NULL : &newbuf);
 	if (msg && msg->result == RESULT_SUCCEED)
-		may_unlinked = 1;
+		may_unlink_new = 1;
+        /* oldpath is also likely to disappear. Something could call stat() after 
+           real_rename so we need to mark as MAY_UNLINK too */
+	msg = pseudo_client_op(OP_MAY_UNLINK, 0, -1, -1, oldpath, oldrc ? NULL : &oldbuf);
+	if (msg && msg->result == RESULT_SUCCEED)
+		may_unlink_old = 1;
+
 	msg = pseudo_client_op(OP_STAT, 0, -1, -1, oldpath, oldrc ? NULL : &oldbuf);
 	if (msg && msg->result == RESULT_SUCCEED)
 		old_db_entry = 1;
 	rc = real_rename(oldpath, newpath);
 	save_errno = errno;
-	if (may_unlinked) {
-		if (rc == -1) {
-			/* since we failed, that wasn't really unlinked -- put
-			 * it back.
-			 */
-			pseudo_client_op(OP_CANCEL_UNLINK, 0, -1, -1, newpath, &newbuf);
-		} else {
-			/* confirm that the file was removed */
-			pseudo_client_op(OP_DID_UNLINK, 0, -1, -1, newpath, &newbuf);
-		}
-	}
+
 	if (rc == -1) {
+		/* since we failed, that wasn't really unlinked -- put
+		 * it back.
+		 */
+		if (may_unlink_new)
+			pseudo_client_op(OP_CANCEL_UNLINK, 0, -1, -1, newpath, &newbuf);
+		if (may_unlink_old)
+			pseudo_client_op(OP_CANCEL_UNLINK, 0, -1, -1, oldpath, &oldbuf);
 		/* and we're done. */
 		errno = save_errno;
 		return rc;
 	}
+
+	/* confirm that the file was removed */
+	if (may_unlink_new)	
+		pseudo_client_op(OP_DID_UNLINK, 0, -1, -1, newpath, &newbuf);
+	/* OP_DID_UNLINK for oldpath is handled by the server */
 	save_errno = errno;
 
 	/* rename(3) is not mv(1).  rename(file, dir) fails; you must provide
diff --git a/ports/unix/guts/renameat.c b/ports/unix/guts/renameat.c
index 8064818..5ac63f9 100644
--- a/ports/unix/guts/renameat.c
+++ b/ports/unix/guts/renameat.c
@@ -13,7 +13,8 @@
 	int oldrc, newrc;
 	int save_errno;
 	int old_db_entry = 0;
-	int may_unlinked = 0;
+	int may_unlink_new = 0;
+	int may_unlink_old = 0;
 
 	pseudo_debug(PDBGF_FILE, "renameat: %d,%s->%d,%s\n",
 		olddirfd, oldpath ? oldpath : "<nil>",
@@ -55,29 +56,36 @@
 	/* as with unlink, we have to mark that the file may get deleted */
 	msg = pseudo_client_op(OP_MAY_UNLINK, 0, -1, newdirfd, newpath, newrc ? NULL : &newbuf);
 	if (msg && msg->result == RESULT_SUCCEED)
-		may_unlinked = 1;
+		may_unlink_new = 1;
+        /* oldpath is also likely to disappear. Something could call stat() after 
+           real_rename so we need to mark as MAY_UNLINK too */
+	msg = pseudo_client_op(OP_MAY_UNLINK, 0, -1, olddirfd, oldpath, oldrc ? NULL : &oldbuf);
+	if (msg && msg->result == RESULT_SUCCEED)
+		may_unlink_old = 1;
+
 	msg = pseudo_client_op(OP_STAT, 0, -1, olddirfd, oldpath, oldrc ? NULL : &oldbuf);
 	if (msg && msg->result == RESULT_SUCCEED)
 		old_db_entry = 1;
 
 	rc = real_renameat(olddirfd, oldpath, newdirfd, newpath);
 	save_errno = errno;
-	if (may_unlinked) {
-		if (rc == -1) {
-			/* since we failed, that wasn't really unlinked -- put
-			 * it back.
-			 */
-			pseudo_client_op(OP_CANCEL_UNLINK, 0, -1, newdirfd, newpath, &newbuf);
-		} else {
-			/* confirm that the file was removed */
-			pseudo_client_op(OP_DID_UNLINK, 0, -1, newdirfd, newpath, &newbuf);
-		}
-	}
 	if (rc == -1) {
+		/* since we failed, that wasn't really unlinked -- put
+		 * it back.
+		 */
+		if (may_unlink_new)
+			pseudo_client_op(OP_CANCEL_UNLINK, 0, -1, newdirfd, newpath, &newbuf);
+		if (may_unlink_old)
+			pseudo_client_op(OP_CANCEL_UNLINK, 0, -1, olddirfd, oldpath, &oldbuf);
 		/* and we're done. */
 		errno = save_errno;
 		return rc;
 	}
+
+	/* confirm that the file was removed */
+	if (may_unlink_new)
+		pseudo_client_op(OP_DID_UNLINK, 0, -1, newdirfd, newpath, &newbuf);
+	/* OP_DID_UNLINK for oldpath is handled by the server */
 	save_errno = errno;
 
 	/* rename(3) is not mv(1).  rename(file, dir) fails; you must provide
diff --git a/pseudo.c b/pseudo.c
index f2e2f87..528fe1b 100644
--- a/pseudo.c
+++ b/pseudo.c
@@ -688,14 +688,13 @@ pseudo_op(pseudo_msg_t *msg, const char *program, const char *tag, char **respon
 				break;
 			}
 			if (mismatch) {
-				/* a mismatch, but we were planning to delete
-				 * the file, so it must have gotten deleted
-				 * already.
-				 */
 				if (by_ino.deleting != 0) {
-					pseudo_debug(PDBGF_FILE, "inode mismatch for '%s' -- old one was marked for deletion, deleting.\n",
+					/* a mismatch, likely a race but we were planning to
+					 * delete the file, or are in the middle of a rename
+					 * so continue, need the old entry for a rename.
+					 */
+					pseudo_debug(PDBGF_FILE, "inode mismatch for '%s' -- old one was marked for deletion.\n",
 						msg->path);
-					pdb_did_unlink_file(path_by_ino, &by_ino, by_ino.deleting);
 				} else {
 					pseudo_diag("path mismatch [%d link%s]: ino %llu db '%s' req '%s'.\n",
 						msg->nlink,
diff --git a/pseudo_db.c b/pseudo_db.c
index ebf6e08..6c48cc8 100644
--- a/pseudo_db.c
+++ b/pseudo_db.c
@@ -2020,8 +2020,8 @@ int
 pdb_rename_file(const char *oldpath, pseudo_msg_t *msg) {
 	static sqlite3_stmt *update_exact, *update_sub;
 	int rc;
-	char *sql_update_exact = "UPDATE files SET path = ? WHERE path = ?;";
-	char *sql_update_sub = "UPDATE files SET path = replace(path, ?, ?) "
+	char *sql_update_exact = "UPDATE files SET path = ?, deleting = 0 WHERE path = ?;";
+	char *sql_update_sub = "UPDATE files SET path = replace(path, ?, ?), deleting = 0 "
 			       "WHERE (path > (? || '/') AND path < (? || '0'));";
 
 	if (!file_db && get_dbs()) {
-- 
2.27.0

