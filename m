Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Peter.Seebach@windriver.com>) id 1U6uAg-0005vW-SH
	for openembedded-core@lists.openembedded.org;
	Sun, 17 Feb 2013 03:40:13 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r1H2O00J021443
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Sat, 16 Feb 2013 18:24:00 -0800 (PST)
Received: from localhost.localdomain (172.25.34.64) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.2.318.4;
	Sat, 16 Feb 2013 18:23:59 -0800
From: Peter Seebach <peter.seebach@windriver.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Date: Sat, 16 Feb 2013 20:23:54 -0600
Message-ID: <1361067834-23267-4-git-send-email-peter.seebach@windriver.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <1361067834-23267-1-git-send-email-peter.seebach@windriver.com>
References: <1361067834-23267-1-git-send-email-peter.seebach@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 3/3] If you don't want the answer, don't ask the question.
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sun, 17 Feb 2013 02:40:24 -0000
Content-Type: text/plain

Most pseudo operations don't actually USE the server's response. So
why wait for a response?

This patch introduces a new message type, PSEUDO_MSG_FASTOP. It
also tags pseudo operation types with whether or not they need to
give a response. This requires updates to maketables to allow non-string
types for additional columns, and the addition of some quotes to the
SQL query enums/query_type.in table.

A few routines are altered to change their behavior and whether or not
they perform a stat operation. The only operations that do wait are
OP_FSTAT and OP_STAT, OP_MKNOD, and OP_MAY_UNLINK. Rationale:

You can't query the server for replacement information and not wait for
it. Makes no sense.

There's extra checking in mknod, because we really do want to fail out
if we couldn't do that -- that implies that we haven't created a thing
that will look like a node.

The result from OP_MAY_UNLINK is checked because it's used to determine
whether we need to send a DID_UNLINK or CANCEL_UNLINK. It might be cheaper
to send two messages without waiting than to send one, wait, and maybe
send another, but I don't want to send invalid messages.

This is highly experimental.
---
 enums/msg_type.in          |    1 +
 enums/op.in                |   46 ++++++++++++++++++++++----------------------
 enums/query_type.in        |   18 ++++++++---------
 maketables                 |   41 +++++++++++++++++++++++----------------
 ports/unix/guts/fchmod.c   |   16 +++++----------
 ports/unix/guts/fchmodat.c |   31 ++++++++++++++++-------------
 ports/unix/guts/fchown.c   |   16 ++++++---------
 ports/unix/guts/fchownat.c |   16 ++++++---------
 ports/unix/guts/mknodat.c  |    4 +++-
 ports/unix/wrapfuncs.in    |    2 +-
 pseudo.c                   |    3 ++-
 pseudo_client.c            |   22 +++++++++++++--------
 pseudo_server.c            |   30 +++++++++++++++++++----------
 13 files changed, 132 insertions(+), 114 deletions(-)

diff --git a/enums/msg_type.in b/enums/msg_type.in
index 0313073..578d571 100644
--- a/enums/msg_type.in
+++ b/enums/msg_type.in
@@ -4,3 +4,4 @@ shutdown
 op
 ack
 nak
+fastop
diff --git a/enums/op.in b/enums/op.in
index 65eb73c..3b8e23e 100644
--- a/enums/op.in
+++ b/enums/op.in
@@ -1,23 +1,23 @@
-op: OP
-chdir
-chmod
-chown
-chroot
-close
-creat
-dup
-fchmod
-fchown
-fstat
-link
-mkdir
-mknod
-open
-rename
-stat
-unlink
-symlink
-exec
-may-unlink
-did-unlink
-cancel-unlink
+op: OP; int wait = 0
+chdir, 0
+chmod, 0
+chown, 0
+chroot, 0
+close, 0
+creat, 0
+dup, 0
+fchmod, 0
+fchown, 0
+fstat, 1
+link, 0
+mkdir, 0
+mknod, 1
+open, 0
+rename, 0
+stat, 1
+unlink, 0
+symlink, 0
+exec, 0
+may-unlink, 1
+did-unlink, 0
+cancel-unlink, 0
diff --git a/enums/query_type.in b/enums/query_type.in
index 5bfc741..974e24f 100644
--- a/enums/query_type.in
+++ b/enums/query_type.in
@@ -1,9 +1,9 @@
-query_type: PSQT; sql = LITTLE BOBBY TABLES
-exact, =
-less, <
-greater, >
-bitand, &
-notequal, !=
-like, LIKE
-notlike, NOT LIKE
-sqlpat, LIKE
+query_type: PSQT; const char * sql = "LITTLE BOBBY TABLES"
+exact, "="
+less, "<"
+greater, ">"
+bitand, "&"
+notequal, "!="
+like, "LIKE"
+notlike, "NOT LIKE"
+sqlpat, "LIKE"
diff --git a/maketables b/maketables
index fe4e62c..7c54c6a 100755
--- a/maketables
+++ b/maketables
@@ -1,6 +1,6 @@
 #!/usr/bin/env python
 #
-# Copyright (c) 2008-2010 Wind River Systems, Inc.
+# Copyright (c) 2008-2010, 2013 Wind River Systems, Inc.
 #
 # This program is free software; you can redistribute it and/or modify
 # it under the terms of the Lesser GNU General Public License version 2.1 as
@@ -23,9 +23,9 @@ The names are used to create enums and a table of strings, as well as
 to/from lookups between the ids and names.  If additional columns are
 defined, each column (separated by ", ") is used to create an additional
 table of the given name, and a lookup function from ids.  Example:
-        foo: FFF; bar = GOZINTA
-        hello, yah
-        world, nope
+        foo: FFF; const char *bar = "GOZINTA"
+        hello, "yah"
+        world, "nope"
 produces:
         typedef enum {
                 FFF_UNKNOWN = -1,
@@ -74,7 +74,14 @@ class DataType:
                     name, default = string.split(col, ' = ')
                 else:
                     name, default = col, ""
-                self.columns.append({"name":name, "value":default})
+                if " " in name:
+                    words = string.split(name, ' ')
+                    name = words[-1]
+                    del words[-1]
+                    type = ' '.join(words)
+                else:
+                    type = "char *"
+                self.columns.append({"type":type, "name":name, "value":default})
         else:
             self.columns = []
         self.data = []
@@ -94,7 +101,7 @@ class DataType:
                 if len(cols) > 0:
                     column_list.append({"name":col["name"], "value":cols.pop(0)})
                 else:
-                    column_list.append({"name":col["name"], "value":col["default"]})
+                    column_list.append({"name":col["name"], "value":col["value"]})
             item["cols"] = column_list
             self.data.append(item)
 
@@ -113,15 +120,15 @@ class DataType:
         out += "type: %s_t" % self.name
         out += " (prefix '%s_ENUM')\n" % self.prefix
         for col in self.columns:
-            out += "  extra column: %s (default '%s')\n" % (col["name"], col["value"])
+            out += "  extra column: %s %s (default %s)\n" % (col["type"], col["name"], col["value"])
         out += "   "
         for item in self.data:
             column = column + 1
             if column > 4 and column % 4 == 1:
                 out += "\n   "
             out += "%-19s" % item["name"]
-#            for col in item["cols"]:
-#                out += "\t%s(%s)\n" % (col["name"], col["value"])
+#           for col in item["cols"]:
+#               out += "\t%s(%s)\n" % (col["name"], col["value"])
         return out
 
     def comment(self):
@@ -140,11 +147,11 @@ class DataType:
         decl_lines = []
         column = 0
         for col in self.columns:
-            decl_lines.append("static const char *%s_id_to_%s[] = {" % (self.name, col["name"]))
-            decl_lines.append('\t"%s",' % col["value"])
+            decl_lines.append("static %s %s_id_to_%s[] = {" % (col["type"], self.name, col["name"]))
+            decl_lines.append('\t%s,' % col["value"])
             for item in self.data:
-                decl_lines.append('\t"%s",' % item["cols"][column]["value"])
-            decl_lines.append('\tNULL')
+                decl_lines.append('\t%s,' % item["cols"][column]["value"])
+            decl_lines.append('\t0')
             decl_lines.append("};")
             column = column + 1
         return '\n'.join(decl_lines)
@@ -152,11 +159,11 @@ class DataType:
     def column_funcs(self):
         decl_lines = []
         for col in self.columns:
-            decl_lines.append('extern const char *')
+            decl_lines.append('extern %s' % col["type"])
             decl_lines.append('pseudo_%s_%s(pseudo_%s_t id) {' %
                 (self.name, col["name"], self.name))
             decl_lines.append('\tif (id < 0 || id >= %s_MAX)' % (self.prefix))
-            decl_lines.append('\t\treturn "%s";' % col["value"])
+            decl_lines.append('\t\treturn %s;' % col["value"])
             decl_lines.append('\treturn %s_id_to_%s[id];' %
                 (self.name, col["name"]))
             decl_lines.append('}')
@@ -165,8 +172,8 @@ class DataType:
     def column_protos(self):
         decl_lines = []
         for col in self.columns:
-            decl_lines.append('extern const char *pseudo_%s_%s(pseudo_%s_t id);' %
-                (self.name, col["name"], self.name))
+            decl_lines.append('extern %s pseudo_%s_%s(pseudo_%s_t id);' %
+                (col["type"], self.name, col["name"], self.name))
         return '\n'.join(decl_lines)
 
 def main():
diff --git a/ports/unix/guts/fchmod.c b/ports/unix/guts/fchmod.c
index 1d4fae8..e2301e3 100644
--- a/ports/unix/guts/fchmod.c
+++ b/ports/unix/guts/fchmod.c
@@ -1,12 +1,11 @@
 /* 
- * Copyright (c) 2008-2010, 2012 Wind River Systems; see
+ * Copyright (c) 2008-2010, 2012, 2013 Wind River Systems; see
  * guts/COPYRIGHT for information.
  *
  * static int
  * wrap_fchmod(int fd, mode_t mode) {
  *	int rc = -1;
  */
- 	pseudo_msg_t *msg;
 	PSEUDO_STATBUF buf;
 	int save_errno = errno;
 
@@ -15,16 +14,11 @@
 		return -1;
 	}
 	buf.st_mode = (buf.st_mode & ~07777) | (mode & 07777);
-	msg = pseudo_client_op(OP_FCHMOD, 0, fd, -1, 0, &buf);
+	pseudo_client_op(OP_FCHMOD, 0, fd, -1, 0, &buf);
 	real_fchmod(fd, PSEUDO_FS_MODE(mode, S_ISDIR(buf.st_mode)));
-	if (msg && msg->result != RESULT_SUCCEED) {
-		errno = EPERM;
-		rc = -1;
-	} else {
-		/* just pretend we worked */
-		errno = save_errno;
-		rc = 0;
-	}
+        /* just pretend we worked */
+        errno = save_errno;
+        rc = 0;
 
 /*	return rc;
  * }
diff --git a/ports/unix/guts/fchmodat.c b/ports/unix/guts/fchmodat.c
index a14d1b1..59a92ce 100644
--- a/ports/unix/guts/fchmodat.c
+++ b/ports/unix/guts/fchmodat.c
@@ -1,14 +1,13 @@
 /* 
- * Copyright (c) 2008-2010, 2012 Wind River Systems; see
+ * Copyright (c) 2008-2010, 2012, 2013 Wind River Systems; see
  * guts/COPYRIGHT for information.
  *
  * static int
  * wrap_fchmodat(int dirfd, const char *path, mode_t mode, int flags) {
  *	int rc = -1;
  */
- 	pseudo_msg_t *msg;
 	PSEUDO_STATBUF buf;
-	int save_errno;
+	int save_errno = errno;
 
 #ifdef PSEUDO_NO_REAL_AT_FUNCTIONS
 	if (dirfd != AT_FDCWD) {
@@ -33,8 +32,13 @@
 	}
 	save_errno = errno;
 
+#if 0
+ 	pseudo_msg_t *msg;
 	/* purely for debugging purposes:  check whether file
-	 * is already in database.
+	 * is already in database. We don't need the resulting
+         * information for anything. This is currently ifdefed
+         * out because it's only useful when trying to track where
+         * files are coming from.
 	 */
 	msg = pseudo_client_op(OP_STAT, 0, -1, -1, path, &buf);
 	if (!msg || msg->result != RESULT_SUCCEED) {
@@ -42,6 +46,7 @@
 			mode, dirfd, path, (unsigned long long) buf.st_ino);
 
 	}
+#endif
 
 	/* user bits added so "root" can always access files. */
 #ifdef PSEUDO_NO_REAL_AT_FUNCTIONS
@@ -53,18 +58,18 @@
 #endif
 	/* we ignore a failure from underlying fchmod, because pseudo
 	 * may believe you are permitted to change modes that the filesystem
-	 * doesn't.
+	 * doesn't. Note that we also don't need to know whether the
+         * file might be a (pseudo) block device or some such; pseudo
+         * will only modify permission bits based on an OP_CHMOD, and does
+         * not care about device/file type mismatches, only directory/file
+         * or symlink/file.
 	 */
 
 	buf.st_mode = (buf.st_mode & ~07777) | (mode & 07777);
-	msg = pseudo_client_op(OP_CHMOD, 0, -1, dirfd, path, &buf);
-	if (msg && msg->result != RESULT_SUCCEED) {
-		errno = EPERM;
-		rc = -1;
-	} else {
-		/* if server is down, just pretend we worked */
-		rc = 0;
-	}
+	pseudo_client_op(OP_CHMOD, 0, -1, dirfd, path, &buf);
+        /* don't change errno from what it was originally */
+        errno = save_errno;
+        rc = 0;
 
 /*	return rc;
  * }
diff --git a/ports/unix/guts/fchown.c b/ports/unix/guts/fchown.c
index 72a1e46..1514e35 100644
--- a/ports/unix/guts/fchown.c
+++ b/ports/unix/guts/fchown.c
@@ -1,5 +1,5 @@
 /* 
- * Copyright (c) 2008-2010, 2012 Wind River Systems; see
+ * Copyright (c) 2008-2010, 2012, 2013 Wind River Systems; see
  * guts/COPYRIGHT for information.
  *
  * static int
@@ -8,7 +8,7 @@
  */
  	pseudo_msg_t *msg;
 	PSEUDO_STATBUF buf;
-	int save_errno;
+	int save_errno = errno;
 
 	if (base_fstat(fd, &buf) == -1) {
 		save_errno = errno;
@@ -41,14 +41,10 @@
 	}
 	pseudo_debug(2, "fchown, fd %d: %d:%d -> %d:%d\n",
 		fd, owner, group, buf.st_uid, buf.st_gid);
-	msg = pseudo_client_op(OP_FCHOWN, 0, fd, -1, 0, &buf);
-	if (msg && msg->result != RESULT_SUCCEED) {
-		errno = EPERM;
-		rc = -1;
-	} else {
-		/* just pretend we worked */
-		rc = 0;
-	}
+	pseudo_client_op(OP_FCHOWN, 0, fd, -1, 0, &buf);
+        /* pretend we worked, errno should be unchanged */
+        errno = save_errno;
+        rc = 0;
 
 /*	return rc;
  * }
diff --git a/ports/unix/guts/fchownat.c b/ports/unix/guts/fchownat.c
index 8d3ee05..60ccfa5 100644
--- a/ports/unix/guts/fchownat.c
+++ b/ports/unix/guts/fchownat.c
@@ -1,5 +1,5 @@
 /* 
- * Copyright (c) 2008-2010, 2012 Wind River Systems; see
+ * Copyright (c) 2008-2010, 2012, 2013 Wind River Systems; see
  * guts/COPYRIGHT for information.
  *
  * static int
@@ -8,7 +8,7 @@
  */
  	pseudo_msg_t *msg;
 	PSEUDO_STATBUF buf;
-	int save_errno;
+	int save_errno = errno;
 	int doing_link = 0;
 
 #ifdef PSEUDO_NO_REAL_AT_FUNCTIONS
@@ -53,14 +53,10 @@
 	if (group != (gid_t) -1) {
 		buf.st_gid = group;
 	}
-	msg = pseudo_client_op(OP_CHOWN, 0, -1, dirfd, path, &buf);
-	if (msg && msg->result != RESULT_SUCCEED) {
-		errno = EPERM;
-		rc = -1;
-	} else {
-		/* just pretend we worked */
-		rc = 0;
-	}
+	pseudo_client_op(OP_CHOWN, 0, -1, dirfd, path, &buf);
+        /* just pretend we worked */
+        errno = save_errno;
+        rc = 0;
 
 /*	return rc;
  * }
diff --git a/ports/unix/guts/mknodat.c b/ports/unix/guts/mknodat.c
index 32a4d5b..6fd5b42 100644
--- a/ports/unix/guts/mknodat.c
+++ b/ports/unix/guts/mknodat.c
@@ -8,6 +8,7 @@
 
  	pseudo_msg_t *msg;
 	PSEUDO_STATBUF buf;
+        int save_errno = errno;
 
 #ifdef PSEUDO_NO_REAL_AT_FUNCTIONS
 	if (dirfd != AT_FDCWD) {
@@ -50,10 +51,11 @@
 		rc = -1;
 	} else {
 		/* just pretend we worked */
+                errno = save_errno;
 		rc = 0;
 	}
 	if (rc == -1) {
-		int save_errno = errno;
+                save_errno = errno;
 #ifdef PSEUDO_NO_REAL_AT_FUNCTIONS
 		real_unlink(path);
 #else
diff --git a/ports/unix/wrapfuncs.in b/ports/unix/wrapfuncs.in
index a0f191c..8460a65 100644
--- a/ports/unix/wrapfuncs.in
+++ b/ports/unix/wrapfuncs.in
@@ -63,7 +63,7 @@ FILE *popen(const char *command, const char *mode); /* hand_wrapped=1 */
 # during filesystem assembly.
 int fsync(int fd); /* async_skip=0 */
 int fdatasync(int fd); /* async_skip=0 */
-void sync(void); /* async_skip=0 */
+void sync(void); /* async_skip= */
 int syncfs(int fd); /* async_skip=0 */
 int sync_file_range(int fd, off64_t offset, off64_t nbytes, unsigned int flags); /* async_skip=0 */
 int msync(void *addr, size_t length, int flags); /* async_skip=0 */
diff --git a/pseudo.c b/pseudo.c
index 4ea79c5..ad71062 100644
--- a/pseudo.c
+++ b/pseudo.c
@@ -1,7 +1,7 @@
 /*
  * pseudo.c, main pseudo utility program
  *
- * Copyright (c) 2008-2010 Wind River Systems, Inc.
+ * Copyright (c) 2008-2013 Wind River Systems, Inc.
  *
  * This program is free software; you can redistribute it and/or modify
  * it under the terms of the Lesser GNU General Public License version 2.1 as
@@ -933,6 +933,7 @@ pseudo_server_response(pseudo_msg_t *msg, const char *program, const char *tag)
 		return 0;
 		break;
 	case PSEUDO_MSG_OP:
+	case PSEUDO_MSG_FASTOP:
 		return pseudo_op(msg, program, tag);
 		break;
 	case PSEUDO_MSG_ACK:		/* FALLTHROUGH */
diff --git a/pseudo_client.c b/pseudo_client.c
index a7ba100..f58ce4c 100644
--- a/pseudo_client.c
+++ b/pseudo_client.c
@@ -876,14 +876,18 @@ pseudo_client_request(pseudo_msg_t *msg, size_t len, const char *path) {
 			}
 		} while (rc != 0);
 		pseudo_debug(5, "sent!\n");
-		response = pseudo_msg_receive(connect_fd);
-		if (!response) {
-			++tries;
-			if (tries > 3) {
-				pseudo_debug(1, "can't get responses.\n");
-				return 0;
-			}
-		}
+                if (msg->type != PSEUDO_MSG_FASTOP) {
+                        response = pseudo_msg_receive(connect_fd);
+                        if (!response) {
+                                ++tries;
+                                if (tries > 3) {
+                                        pseudo_debug(1, "can't get responses.\n");
+                                        return 0;
+                                }
+                        }
+                } else {
+                        return 0;
+                }
 	} while (response == 0);
 	if (response->type != PSEUDO_MSG_ACK) {
 		pseudo_debug(2, "got non-ack response %d\n", response->type);
@@ -1225,6 +1229,8 @@ pseudo_client_op(pseudo_op_t op, int access, int fd, int dirfd, const char *path
 	}
 	if (do_request) {
 		struct timeval tv1, tv2;
+                if (!pseudo_op_wait(msg.op))
+                        msg.type = PSEUDO_MSG_FASTOP;
 		pseudo_debug(4, "sending request [ino %llu]\n", (unsigned long long) msg.ino);
 		gettimeofday(&tv1, NULL);
 		if (pseudo_local_only) {
diff --git a/pseudo_server.c b/pseudo_server.c
index 4af5265..2597def 100644
--- a/pseudo_server.c
+++ b/pseudo_server.c
@@ -1,7 +1,7 @@
 /*
  * pseudo_server.c, pseudo's server-side logic and message handling
  *
- * Copyright (c) 2008-2010 Wind River Systems, Inc.
+ * Copyright (c) 2008-2010, 2013 Wind River Systems, Inc.
  *
  * This program is free software; you can redistribute it and/or modify
  * it under the terms of the Lesser GNU General Public License version 2.1 as
@@ -76,7 +76,7 @@ quit_now(int signal) {
 	die_forcefully = 1;
 }
 
-static int messages = 0;
+static int messages = 0, responses = 0;
 static struct timeval message_time = { .tv_sec = 0 };
 
 static void pseudo_server_loop(void);
@@ -268,6 +268,7 @@ serve_client(int i) {
 	in = pseudo_msg_receive(clients[i].fd);
 	if (in) {
 		char *response_path = 0;
+                int send_response = 1;
 		pseudo_debug(4, "got a message (%d): %s\n", in->type, (in->pathlen ? in->path : "<no path>"));
 		/* handle incoming ping */
 		if (in->type == PSEUDO_MSG_PING && !clients[i].pid) {
@@ -303,6 +304,8 @@ serve_client(int i) {
 		 * pseudo_server_response.
 		 */
 		if (in->type != PSEUDO_MSG_SHUTDOWN) {
+                        if (in->type == PSEUDO_MSG_FASTOP)
+                                send_response = 0;
 			if (pseudo_server_response(in, clients[i].program, clients[i].tag)) {
 				in->type = PSEUDO_MSG_NAK;
 			} else {
@@ -343,10 +346,14 @@ serve_client(int i) {
 				die_peacefully = 1;
 			}
 		}
-		if ((rc = pseudo_msg_send(clients[i].fd, in, -1, response_path)) != 0)
-			pseudo_debug(1, "failed to send response to client %d [%d]: %d (%s)\n",
-				i, (int) clients[i].pid, rc, strerror(errno));
-		rc = in->op;
+                if (send_response) {
+                        if ((rc = pseudo_msg_send(clients[i].fd, in, -1, response_path)) != 0) {
+                                pseudo_debug(1, "failed to send response to client %d [%d]: %d (%s)\n",
+                                        i, (int) clients[i].pid, rc, strerror(errno));
+                        }
+                } else {
+                        rc = 1;
+                }
 		free(response_path);
 		return rc;
 	} else {
@@ -423,10 +430,11 @@ pseudo_server_loop(void) {
 					die_peacefully = 1;
 				} else {
 					/* display this if not exiting */
-					pseudo_debug(1, "%d messages handled in %.4f seconds\n",
+					pseudo_debug(1, "%d messages handled in %.4f seconds, %d responses\n",
 						messages,
 						(double) message_time.tv_sec +
-						(double) message_time.tv_usec / 1000000.0);
+						(double) message_time.tv_usec / 1000000.0,
+                                                responses);
 				}
 			}
 		} else if (rc > 0) {
@@ -439,11 +447,13 @@ pseudo_server_loop(void) {
 					close_client(i);
 				} else if (FD_ISSET(clients[i].fd, &reads)) {
 					struct timeval tv1, tv2;
-					int op;
+                                        int rc;
 					gettimeofday(&tv1, NULL);
-					op = serve_client(i);
+					rc = serve_client(i);
 					gettimeofday(&tv2, NULL);
 					++messages;
+                                        if (rc == 0)
+                                                ++responses;
 					message_time.tv_sec += (tv2.tv_sec - tv1.tv_sec);
 					message_time.tv_usec += (tv2.tv_usec - tv1.tv_usec);
 					if (message_time.tv_usec < 0) {
-- 
1.7.9.5



