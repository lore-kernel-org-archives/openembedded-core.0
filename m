Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id CD92C77FEC
	for <openembedded-core@lists.openembedded.org>;
	Fri, 16 Feb 2018 10:02:37 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	16 Feb 2018 02:02:38 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.46,519,1511856000"; d="scan'208";a="28544946"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.161])
	by orsmga003.jf.intel.com with ESMTP; 16 Feb 2018 02:02:37 -0800
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 16 Feb 2018 11:56:28 +0200
Message-Id: <20180216095628.15414-1-alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.15.1
Subject: [PATCH] pseudo: update to latest master
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
X-List-Received-Date: Fri, 16 Feb 2018 10:02:38 -0000

Dropped patches:
0001-Use-epoll-API-on-Linux.patch replaced by
http://git.yoctoproject.org/cgit/cgit.cgi/pseudo/commit/?id=0a3e435085046f535074f498a3de75a7704fb14c
(also add --enable-epoll to configure options)

b6b68db896f9963558334aff7fca61adde4ec10f.patch merged upstream

efe0be279901006f939cd357ccee47b651c786da.patch merged upstream

fastopreply.patch replaced by
http://git.yoctoproject.org/cgit/cgit.cgi/pseudo/commit/?id=449c234d3030328fb997b309511bb54598848a05

toomanyfiles.patch rebased

Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
---
 .../pseudo/files/0001-Use-epoll-API-on-Linux.patch | 292 ---------------------
 .../b6b68db896f9963558334aff7fca61adde4ec10f.patch |  48 ----
 .../efe0be279901006f939cd357ccee47b651c786da.patch |  99 -------
 .../pseudo/files/fastopreply.patch                 |  76 ------
 .../pseudo/files/toomanyfiles.patch                |  44 ++--
 meta/recipes-devtools/pseudo/pseudo.inc            |   2 +-
 meta/recipes-devtools/pseudo/pseudo_1.8.2.bb       |  16 --
 meta/recipes-devtools/pseudo/pseudo_git.bb         |  11 +-
 8 files changed, 34 insertions(+), 554 deletions(-)
 delete mode 100644 meta/recipes-devtools/pseudo/files/0001-Use-epoll-API-on-Linux.patch
 delete mode 100644 meta/recipes-devtools/pseudo/files/b6b68db896f9963558334aff7fca61adde4ec10f.patch
 delete mode 100644 meta/recipes-devtools/pseudo/files/efe0be279901006f939cd357ccee47b651c786da.patch
 delete mode 100644 meta/recipes-devtools/pseudo/files/fastopreply.patch
 delete mode 100644 meta/recipes-devtools/pseudo/pseudo_1.8.2.bb

diff --git a/meta/recipes-devtools/pseudo/files/0001-Use-epoll-API-on-Linux.patch b/meta/recipes-devtools/pseudo/files/0001-Use-epoll-API-on-Linux.patch
deleted file mode 100644
index 42557b17a7f..00000000000
--- a/meta/recipes-devtools/pseudo/files/0001-Use-epoll-API-on-Linux.patch
+++ /dev/null
@@ -1,292 +0,0 @@
-From 9e407e0be01695e7b927f5820ade87ee9602c248 Mon Sep 17 00:00:00 2001
-From: Alexander Kanavin <alex.kanavin@gmail.com>
-Date: Fri, 15 Sep 2017 17:00:14 +0300
-Subject: [PATCH] Use epoll API on Linux
-
-Also a couple of other modifications due to epoll having
-a different approach to how the working set of fds is defined
-and used:
-1) open_client() returns an index into the array of clients
-2) close_client() has a protection against being called twice
-with the same client (which would mess up the active_clients
-counter)
-
-Upstream-Status: Submitted [Seebs CC'd by email]
-Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
-
----
- enums/exit_status.in |   3 +
- pseudo_server.c      | 189 ++++++++++++++++++++++++++++++++++++++++++++++++++-
- 2 files changed, 190 insertions(+), 2 deletions(-)
-
-diff --git a/enums/exit_status.in b/enums/exit_status.in
-index 6be44d3..88f94cd 100644
---- a/enums/exit_status.in
-+++ b/enums/exit_status.in
-@@ -18,3 +18,6 @@ listen_fd, "server loop had no valid listen fd"
- pseudo_loaded, "server couldn't get out of pseudo environment"
- pseudo_prefix, "couldn't get valid pseudo prefix"
- pseudo_invocation, "invalid server command arguments"
-+epoll_create, "epoll_create() failed"
-+epoll_ctl, "epoll_ctl() failed"
-+
-diff --git a/pseudo_server.c b/pseudo_server.c
-index ff16efd..14d34de 100644
---- a/pseudo_server.c
-+++ b/pseudo_server.c
-@@ -40,6 +40,12 @@
- #include "pseudo_client.h"
- #include "pseudo_db.h"
- 
-+// This has to come after pseudo includes, as that's where PSEUDO_PORT defines are
-+#ifdef PSEUDO_PORT_LINUX
-+#include <sys/epoll.h>
-+#endif
-+
-+
- static int listen_fd = -1;
- 
- typedef struct {
-@@ -59,6 +65,7 @@ static int active_clients = 0, highest_client = 0, max_clients = 0;
- 
- #define LOOP_DELAY 2
- #define DEFAULT_PSEUDO_SERVER_TIMEOUT 30
-+#define EPOLL_MAX_EVENTS 10
- int pseudo_server_timeout = DEFAULT_PSEUDO_SERVER_TIMEOUT;
- static int die_peacefully = 0;
- static int die_forcefully = 0;
-@@ -80,6 +87,9 @@ quit_now(int signal) {
- static int messages = 0, responses = 0;
- static struct timeval message_time = { .tv_sec = 0 };
- 
-+#ifdef PSEUDO_PORT_LINUX
-+static void pseudo_server_loop_epoll(void);
-+#endif
- static void pseudo_server_loop(void);
- 
- /* helper function to make a directory, just like mkdir -p.
-@@ -369,12 +379,16 @@ pseudo_server_start(int daemonize) {
- 			kill(ppid, SIGUSR1);
- 		}
- 	}
-+#ifdef PSEUDO_PORT_LINUX
-+	pseudo_server_loop_epoll();
-+#else
- 	pseudo_server_loop();
-+#endif
- 	return 0;
- }
- 
- /* mess with internal tables as needed */
--static void
-+static unsigned int
- open_client(int fd) {
- 	pseudo_client_t *new_clients;
- 	int i;
-@@ -390,7 +404,7 @@ open_client(int fd) {
- 			++active_clients;
- 			if (i > highest_client)
- 				highest_client = i;
--			return;
-+			return i;
- 		}
- 	}
- 
-@@ -414,9 +428,11 @@ open_client(int fd) {
- 
- 		max_clients += 16;
- 		++active_clients;
-+		return max_clients - 16;
- 	} else {
- 		pseudo_diag("error allocating new client, fd %d\n", fd);
- 		close(fd);
-+		return 0;
- 	}
- }
- 
-@@ -433,6 +449,10 @@ close_client(int client) {
- 			client, highest_client);
- 		return;
- 	}
-+	if (clients[client].fd == -1) {
-+		pseudo_debug(PDBGF_SERVER, "client %d already closed\n", client);
-+		return;
-+	}
- 	close(clients[client].fd);
- 	clients[client].fd = -1;
- 	free(clients[client].tag);
-@@ -566,6 +586,171 @@ serve_client(int i) {
- 	}
- }
- 
-+#ifdef PSEUDO_PORT_LINUX
-+static void pseudo_server_loop_epoll(void)
-+{
-+	struct sockaddr_un client;
-+	socklen_t len;
-+        int i;
-+        int rc;
-+        int fd;
-+	int timeout;
-+	struct epoll_event ev, events[EPOLL_MAX_EVENTS];
-+	int loop_timeout = pseudo_server_timeout;
-+
-+	clients = malloc(16 * sizeof(*clients));
-+
-+	clients[0].fd = listen_fd;
-+	clients[0].pid = getpid();
-+
-+	for (i = 1; i < 16; ++i) {
-+		clients[i].fd = -1;
-+		clients[i].pid = 0;
-+		clients[i].tag = NULL;
-+		clients[i].program = NULL;
-+	}
-+
-+	active_clients = 1;
-+	max_clients = 16;
-+	highest_client = 0;
-+
-+	pseudo_debug(PDBGF_SERVER, "server loop started.\n");
-+	if (listen_fd < 0) {
-+		pseudo_diag("got into loop with no valid listen fd.\n");
-+		exit(PSEUDO_EXIT_LISTEN_FD);
-+	}
-+
-+	timeout = LOOP_DELAY * 1000;
-+
-+	int epollfd = epoll_create1(0);
-+	if (epollfd == -1) {
-+		pseudo_diag("epoll_create1() failed.\n");
-+		exit(PSEUDO_EXIT_EPOLL_CREATE);
-+	}
-+	ev.events = EPOLLIN;
-+	ev.data.u64 = 0;
-+	if (epoll_ctl(epollfd, EPOLL_CTL_ADD, clients[0].fd, &ev) == -1) {
-+		pseudo_diag("epoll_ctl() failed with listening socket.\n");
-+		exit(PSEUDO_EXIT_EPOLL_CTL);
-+	}
-+
-+	pdb_log_msg(SEVERITY_INFO, NULL, NULL, NULL, "server started (pid %d)", getpid());
-+
-+        for (;;) {
-+		rc = epoll_wait(epollfd, events, EPOLL_MAX_EVENTS, timeout);
-+		if (rc == 0 || (rc == -1 && errno == EINTR)) {
-+			/* If there's no clients, start timing out.  If there
-+			 * are active clients, never time out.
-+			 */
-+			if (active_clients == 1) {
-+				loop_timeout -= LOOP_DELAY;
-+                                /* maybe flush database to disk */
-+                                pdb_maybe_backup();
-+				if (loop_timeout <= 0) {
-+					pseudo_debug(PDBGF_SERVER, "no more clients, got bored.\n");
-+					die_peacefully = 1;
-+				} else {
-+					/* display this if not exiting */
-+					pseudo_debug(PDBGF_SERVER | PDBGF_BENCHMARK, "%d messages handled in %.4f seconds, %d responses\n",
-+						messages,
-+						(double) message_time.tv_sec +
-+						(double) message_time.tv_usec / 1000000.0,
-+                                                responses);
-+				}
-+			}
-+		} else if (rc > 0) {
-+			loop_timeout = pseudo_server_timeout;
-+			for (i = 0; i < rc; ++i) {
-+				if (clients[events[i].data.u64].fd == listen_fd) {
-+					if (!die_forcefully) {
-+						len = sizeof(client);
-+						if ((fd = accept(listen_fd, (struct sockaddr *) &client, &len)) != -1) {
-+						/* Don't allow clients to end up on fd 2, because glibc's
-+						 * malloc debug uses that fd unconditionally.
-+						 */
-+							if (fd == 2) {
-+								int newfd = fcntl(fd, F_DUPFD, 3);
-+								close(fd);
-+								fd = newfd;
-+							}
-+							pseudo_debug(PDBGF_SERVER, "new client fd %d\n", fd);
-+		                                        /* A new client implicitly cancels any
-+		                                         * previous shutdown request, or a
-+		                                         * shutdown for lack of clients.
-+		                                         */
-+		                                        pseudo_server_timeout = DEFAULT_PSEUDO_SERVER_TIMEOUT;
-+		                                        die_peacefully = 0;
-+
-+							ev.events = EPOLLIN;
-+							ev.data.u64 = open_client(fd);
-+							if (ev.data.u64 != 0 && epoll_ctl(epollfd, EPOLL_CTL_ADD, clients[ev.data.u64].fd, &ev) == -1) {
-+								pseudo_diag("epoll_ctl() failed with accepted socket.\n");
-+								exit(PSEUDO_EXIT_EPOLL_CTL);
-+							}
-+						} else if (errno == EMFILE) {
-+							pseudo_debug(PDBGF_SERVER, "Hit max open files, dropping a client.\n");
-+		                                        /* In theory there is a potential race here where if we close a client, 
-+		                                           it may have sent us a fastop message which we don't act upon.
-+		                                           If we don't close a filehandle we'll loop indefinitely thought. 
-+		                                           Only close one per loop iteration in the interests of caution */
-+				                        for (int j = 1; j <= highest_client; ++j) {
-+				                                if (clients[j].fd != -1) {
-+				                                        close_client(j);
-+									break;
-+								}
-+							}
-+						}
-+					}
-+				} else {
-+					struct timeval tv1, tv2;
-+                                        int rc;
-+					gettimeofday(&tv1, NULL);
-+					rc = serve_client(events[i].data.u64);
-+					gettimeofday(&tv2, NULL);
-+					++messages;
-+                                        if (rc == 0)
-+                                                ++responses;
-+					message_time.tv_sec += (tv2.tv_sec - tv1.tv_sec);
-+					message_time.tv_usec += (tv2.tv_usec - tv1.tv_usec);
-+					if (message_time.tv_usec < 0) {
-+						message_time.tv_usec += 1000000;
-+						--message_time.tv_sec;
-+					} else while (message_time.tv_usec > 1000000) {
-+						message_time.tv_usec -= 1000000;
-+						++message_time.tv_sec;
-+					}
-+				}
-+				if (die_forcefully)
-+					break;
-+			}
-+			pseudo_debug(PDBGF_SERVER, "server loop complete [%d clients left]\n", active_clients);
-+		} else {
-+			pseudo_diag("epoll_wait failed: %s\n", strerror(errno));
-+			break;
-+		}
-+		if (die_peacefully || die_forcefully) {
-+			pseudo_debug(PDBGF_SERVER, "quitting.\n");
-+			pseudo_debug(PDBGF_SERVER | PDBGF_BENCHMARK, "server %d exiting: handled %d messages in %.4f seconds\n",
-+				getpid(), messages,
-+				(double) message_time.tv_sec +
-+				(double) message_time.tv_usec / 1000000.0);
-+			pdb_log_msg(SEVERITY_INFO, NULL, NULL, NULL, "server %d exiting: handled %d messages in %.4f seconds",
-+				getpid(), messages,
-+				(double) message_time.tv_sec +
-+				(double) message_time.tv_usec / 1000000.0);
-+			/* and at this point, we'll start refusing connections */
-+			close(clients[0].fd);
-+			/* This is a good place to insert a delay for
-+			 * debugging race conditions during startup. */
-+			/* usleep(300000); */
-+			exit(0);
-+		}
-+	}
-+
-+}
-+
-+#endif
-+
- /* get clients, handle messages, shut down.
-  * This doesn't actually do any work, it just calls a ton of things which
-  * do work.
--- 
-2.14.1
-
diff --git a/meta/recipes-devtools/pseudo/files/b6b68db896f9963558334aff7fca61adde4ec10f.patch b/meta/recipes-devtools/pseudo/files/b6b68db896f9963558334aff7fca61adde4ec10f.patch
deleted file mode 100644
index 3045a3b736f..00000000000
--- a/meta/recipes-devtools/pseudo/files/b6b68db896f9963558334aff7fca61adde4ec10f.patch
+++ /dev/null
@@ -1,48 +0,0 @@
-From b6b68db896f9963558334aff7fca61adde4ec10f Mon Sep 17 00:00:00 2001
-From: Seebs <seebs@seebs.net>
-Date: Thu, 13 Apr 2017 18:12:01 -0500
-Subject: Prevent bash from segfaulting when unloading pseudo
-
-bash's extremely fancy internal awareness of how the environment looks
-means that, if you directly call the underlying libc "unsetenv" on
-a variable, bash can end up trying to access a null pointer. Fixing
-this generically is actually rather hard; you can't really avoid
-writing to environ on fork() or popen(), even if you change all
-execv*() functions to use the execv*e() variants. So for now, instead
-of unsetting the variable, set it to an empty string.
-
-Thanks to Saur in IRC for spotting this and helping debug it.
-
-Signed-off-by: Seebs <seebs@seebs.net>
-
-Upstream-Status: Backport
-
-diff --git a/ChangeLog.txt b/ChangeLog.txt
-index a2d30e9..8ba1ffa 100644
---- a/ChangeLog.txt
-+++ b/ChangeLog.txt
-@@ -1,3 +1,8 @@
-+2017-04-13:
-+	* (seebs) don't unset LD_PRELOAD or the like, because if you
-+	  do that, bash can segfault because it "knows" how many
-+	  fields are in environ.
-+
- 2017-02-24:
- 	* (seebs) import posix_acl_default fix from Anton Gerasimov
- 	  <anton@advancedtelematic.com>
-diff --git a/pseudo_util.c b/pseudo_util.c
-index 172990b..6a1fac2 100644
---- a/pseudo_util.c
-+++ b/pseudo_util.c
-@@ -844,7 +844,7 @@ void pseudo_dropenv() {
- 		if (ld_preload && strlen(ld_preload)) {
- 			SETENV(PRELINK_LIBRARIES, ld_preload, 1);
- 		} else {
--			UNSETENV(PRELINK_LIBRARIES);
-+			SETENV(PRELINK_LIBRARIES, "", 1);
- 		}
- 	}
- }
--- 
-cgit v0.10.2
-
diff --git a/meta/recipes-devtools/pseudo/files/efe0be279901006f939cd357ccee47b651c786da.patch b/meta/recipes-devtools/pseudo/files/efe0be279901006f939cd357ccee47b651c786da.patch
deleted file mode 100644
index 64fc58c4fe6..00000000000
--- a/meta/recipes-devtools/pseudo/files/efe0be279901006f939cd357ccee47b651c786da.patch
+++ /dev/null
@@ -1,99 +0,0 @@
-From efe0be279901006f939cd357ccee47b651c786da Mon Sep 17 00:00:00 2001
-From: Seebs <seebs@seebs.net>
-Date: Fri, 24 Feb 2017 12:47:38 -0600
-Subject: Don't try to record 0-length posix_acl_default xattrs
-
-Based on a submission from Anton Gerasimov <anton@advancedtelematic.com>
-
-On some systems, with some kernel configs, "cp -a" apparently tries to
-set an empty ACL list, with a valid header but no contents, which causes
-strange and mysterious behavior later if we actually create such an entry.
-So filter that out, also sanity-check a couple of other things.
-
-Signed-off-by: Seebs <seebs@seebs.net>
-
-Upstream-Status: Backport
-
-diff --git a/ChangeLog.txt b/ChangeLog.txt
-index ae2a6e9..a2d30e9 100644
---- a/ChangeLog.txt
-+++ b/ChangeLog.txt
-@@ -1,3 +1,6 @@
-+2017-02-24:
-+	* (seebs) import posix_acl_default fix from Anton Gerasimov
-+	  <anton@advancedtelematic.com>
- 2017-02-01:
-    * (seebs) handle xattr deletion slightly more carefully.
-    * (seebs) tag this as 1.8.2
-diff --git a/ports/linux/xattr/pseudo_wrappers.c b/ports/linux/xattr/pseudo_wrappers.c
-index 46bc053..d69d53e 100644
---- a/ports/linux/xattr/pseudo_wrappers.c
-+++ b/ports/linux/xattr/pseudo_wrappers.c
-@@ -62,9 +62,9 @@ static int
- posix_permissions(const acl_header *header, int entries, int *extra, int *mode) {
- 	int acl_seen = 0;
- 	if (le32(header->version) != 2) {
--		pseudo_diag("Fatal: ACL support no available for header version %d.\n",
-+		pseudo_diag("Fatal: ACL support not available for header version %d.\n",
- 			le32(header->version));
--		return 1;
-+		return -1;
- 	}
- 	*mode = 0;
- 	*extra = 0;
-@@ -140,12 +140,38 @@ static int shared_setxattr(const char *path, int fd, const char *name, const voi
- 	pseudo_debug(PDBGF_XATTR, "setxattr(%s [fd %d], %s => '%.*s')\n",
- 		path ? path : "<no path>", fd, name, (int) size, (char *) value);
- 
-+	/* Filter out erroneous sizes for POSIX ACL
-+	 *  see posix_acl_xattr_count in include/linux/posix_acl_xattr.h of Linux source code */
-+	/* I don't think there's any posix_acl_* values that aren't in this format */
-+	if (!strncmp(name, "system.posix_acl_", 17)) {
-+		// ACL is corrupt, issue an error
-+		if(size < sizeof(acl_header) || (size - sizeof(acl_header)) % sizeof(acl_entry) != 0) {
-+			pseudo_debug(PDBGF_XATTR, "invalid data size for %s: %d\n",
-+				name, (int) size);
-+			errno = EINVAL;
-+			return -1;
-+		}
-+
-+		// ACL is empty, do nothing
-+		if((size - sizeof(acl_header)) / sizeof(acl_entry) == 0) {
-+			/* on some systems, "cp -a" will attempt to clone the
-+			 * posix_acl_default entry for a directory (which would specify
-+			 * default ACLs for new files in that directory), but if the
-+			 * original was empty, we get a header but no entries. With
-+			 * real xattr, that ends up being silently discarded, apparently,
-+			 * so we discard it too.
-+			 */
-+			pseudo_debug(PDBGF_XATTR, "0-length ACL entry %s.\n", name);
-+			return 0;
-+		}
-+	}
- 	/* this may be a plain chmod */
- 	if (!strcmp(name, "system.posix_acl_access")) {
- 		int extra;
- 		int mode;
- 		int entries = (size - sizeof(acl_header)) / sizeof(acl_entry);
--		if (!posix_permissions(value, entries, &extra, &mode)) {
-+		int res = posix_permissions(value, entries, &extra, &mode);
-+		if (res == 0) {
- 			pseudo_debug(PDBGF_XATTR, "posix_acl_access translated to mode %04o. Remaining attribute(s): %d.\n",
- 				mode, extra);
- 			buf.st_mode = mode;
-@@ -164,8 +190,12 @@ static int shared_setxattr(const char *path, int fd, const char *name, const voi
- 			if (!extra) {
- 				return 0;
- 			}
-+		} else if (res == -1) {
-+			errno = EOPNOTSUPP;
-+			return -1;
- 		}
- 	}
-+
- 	if (!strcmp(name, "user.pseudo_data")) {
- 		pseudo_debug(PDBGF_XATTR | PDBGF_XATTRDB, "user.pseudo_data xattribute does not get to go in database.\n");
- 		return -1;
--- 
-cgit v0.10.2
-
diff --git a/meta/recipes-devtools/pseudo/files/fastopreply.patch b/meta/recipes-devtools/pseudo/files/fastopreply.patch
deleted file mode 100644
index 904c2d04e6a..00000000000
--- a/meta/recipes-devtools/pseudo/files/fastopreply.patch
+++ /dev/null
@@ -1,76 +0,0 @@
-Ensure FASTOP messages get an ACK reply so that the client can be sure the server
-recieved them. This means if connections are terminated, data isn't lost.
-
-RP 2017/9/22
-
-Upstream-Status: Submitted
-
-Index: pseudo-1.8.2/pseudo_client.c
-===================================================================
---- pseudo-1.8.2.orig/pseudo_client.c
-+++ pseudo-1.8.2/pseudo_client.c
-@@ -1331,21 +1331,19 @@ pseudo_client_request(pseudo_msg_t *msg,
- 		 * indicating a successful send.
- 		 */
- 		pseudo_debug(PDBGF_CLIENT | PDBGF_VERBOSE, "sent!\n");
--		if (msg->type != PSEUDO_MSG_FASTOP) {
--			response = pseudo_msg_receive(connect_fd);
--			if (!response) {
--				pseudo_debug(PDBGF_CLIENT, "expected response did not occur; retrying\n");
-+		response = pseudo_msg_receive(connect_fd);
-+		if (!response) {
-+			pseudo_debug(PDBGF_CLIENT, "expected response did not occur; retrying\n");
-+		} else {
-+			if (response->type != PSEUDO_MSG_ACK) {
-+				pseudo_debug(PDBGF_CLIENT, "got non-ack response %d\n", response->type);
-+				return 0;
-+			} else if (msg->type != PSEUDO_MSG_FASTOP) {
-+				pseudo_debug(PDBGF_CLIENT | PDBGF_VERBOSE, "got response type %d\n", response->type);
-+				return response;
- 			} else {
--				if (response->type != PSEUDO_MSG_ACK) {
--					pseudo_debug(PDBGF_CLIENT, "got non-ack response %d\n", response->type);
--					return 0;
--				} else {
--					pseudo_debug(PDBGF_CLIENT | PDBGF_VERBOSE, "got response type %d\n", response->type);
--					return response;
--				}
-+				return 0;
- 			}
--		} else {
--			return 0;
- 		}
- 	}
- 	pseudo_diag("pseudo: server connection persistently failed, aborting.\n");
-Index: pseudo-1.8.2/pseudo_server.c
-===================================================================
---- pseudo-1.8.2.orig/pseudo_server.c
-+++ pseudo-1.8.2/pseudo_server.c
-@@ -463,6 +463,11 @@ close_client(int client) {
- 			--highest_client;
- }
- 
-+static pseudo_msg_t server_fastop_reply = { 
-+        .type = PSEUDO_MSG_ACK,
-+        .op = OP_NONE,
-+};
-+
- /* Actually process a request.
-  */
- static int
-@@ -515,8 +520,14 @@ serve_client(int i) {
- 		 * pseudo_server_response.
- 		 */
- 		if (in->type != PSEUDO_MSG_SHUTDOWN) {
--                        if (in->type == PSEUDO_MSG_FASTOP)
-+                        if (in->type == PSEUDO_MSG_FASTOP) {
-                                 send_response = 0;
-+                                /* For fastops we reply now to say we got the data */
-+                                if ((rc = pseudo_msg_send(clients[i].fd, &server_fastop_reply, 0, NULL)) != 0) {
-+                                            pseudo_debug(PDBGF_SERVER, "failed to send fastop ack to client %d [%d]: %d (%s)\n",
-+                                                    i, (int) clients[i].pid, rc, strerror(errno));
-+                                }
-+                        }
- 			/* most messages don't need these, but xattr may */
- 			response_path = 0;
- 			response_pathlen = -1;
diff --git a/meta/recipes-devtools/pseudo/files/toomanyfiles.patch b/meta/recipes-devtools/pseudo/files/toomanyfiles.patch
index b085a4505d5..bda7e4b2026 100644
--- a/meta/recipes-devtools/pseudo/files/toomanyfiles.patch
+++ b/meta/recipes-devtools/pseudo/files/toomanyfiles.patch
@@ -1,3 +1,8 @@
+From b0b25fbc041a148d1de09f5a6503cd95973ec77c Mon Sep 17 00:00:00 2001
+From: Richard Purdie <richard.purdie@linuxfoundation.org>
+Date: Tue, 25 Apr 2017 15:25:54 +0100
+Subject: [PATCH 3/3] pseudo: Handle too many files deadlock
+
 Currently if we max out the maximum number of files, pseudo can deadlock, unable to
 accept new connections yet unable to move forward and unblock the other processes
 waiting either.
@@ -11,19 +16,23 @@ RP
 
 Upstream-Status: Submitted [Peter is aware of the issue]
 
-Index: pseudo-1.8.2/pseudo_server.c
-===================================================================
---- pseudo-1.8.2.orig/pseudo_server.c
-+++ pseudo-1.8.2/pseudo_server.c
-@@ -581,6 +581,7 @@ pseudo_server_loop(void) {
- 	int rc;
- 	int fd;
- 	int loop_timeout = pseudo_server_timeout;
+---
+ pseudo_server.c | 10 ++++++++++
+ 1 file changed, 10 insertions(+)
+
+diff --git a/pseudo_server.c b/pseudo_server.c
+index dac3258..15a3e8f 100644
+--- a/pseudo_server.c
++++ b/pseudo_server.c
+@@ -802,6 +802,7 @@ pseudo_server_loop(void) {
+ 	struct sigaction eat_usr2 = {
+ 		.sa_handler = set_do_list_clients
+ 	};
 +	int hitmaxfiles;
  
  	clients = malloc(16 * sizeof(*clients));
  
-@@ -597,6 +598,7 @@ pseudo_server_loop(void) {
+@@ -820,6 +821,7 @@ pseudo_server_loop(void) {
  	active_clients = 1;
  	max_clients = 16;
  	highest_client = 0;
@@ -31,9 +40,9 @@ Index: pseudo-1.8.2/pseudo_server.c
  
  	pseudo_debug(PDBGF_SERVER, "server loop started.\n");
  	if (listen_fd < 0) {
-@@ -663,10 +665,15 @@ pseudo_server_loop(void) {
- 						message_time.tv_usec -= 1000000;
- 						++message_time.tv_sec;
+@@ -878,10 +880,15 @@ pseudo_server_loop(void) {
+ 					} else {
+ 						serve_client(i);
  					}
 +				} else if (hitmaxfiles) {
 +					/* Only close one per loop iteration in the interests of caution */
@@ -47,13 +56,16 @@ Index: pseudo-1.8.2/pseudo_server.c
  			if (!die_forcefully && 
  			    (FD_ISSET(clients[0].fd, &events) ||
  			     FD_ISSET(clients[0].fd, &reads))) {
-@@ -688,6 +698,9 @@ pseudo_server_loop(void) {
-                                          */
-                                         pseudo_server_timeout = DEFAULT_PSEUDO_SERVER_TIMEOUT;
-                                         die_peacefully = 0;
+@@ -903,6 +910,9 @@ pseudo_server_loop(void) {
+ 					 */
+ 					pseudo_server_timeout = DEFAULT_PSEUDO_SERVER_TIMEOUT;
+ 					die_peacefully = 0;
 +				} else if (errno == EMFILE) {
 +					hitmaxfiles = 1;
 +					pseudo_debug(PDBGF_SERVER, "Hit max open files, dropping a client.\n");
  				}
  			}
  			pseudo_debug(PDBGF_SERVER, "server loop complete [%d clients left]\n", active_clients);
+-- 
+2.15.1
+
diff --git a/meta/recipes-devtools/pseudo/pseudo.inc b/meta/recipes-devtools/pseudo/pseudo.inc
index 18ce9f92596..fb742522f50 100644
--- a/meta/recipes-devtools/pseudo/pseudo.inc
+++ b/meta/recipes-devtools/pseudo/pseudo.inc
@@ -26,7 +26,7 @@ do_configure () {
 NO32LIBS ??= "1"
 NO32LIBS_class-nativesdk = "1"
 
-PSEUDO_EXTRA_OPTS ?= "--enable-force-async --without-passwd-fallback"
+PSEUDO_EXTRA_OPTS ?= "--enable-force-async --without-passwd-fallback --enable-epoll"
 
 # Compile for the local machine arch...
 do_compile () {
diff --git a/meta/recipes-devtools/pseudo/pseudo_1.8.2.bb b/meta/recipes-devtools/pseudo/pseudo_1.8.2.bb
deleted file mode 100644
index 73ef57231a0..00000000000
--- a/meta/recipes-devtools/pseudo/pseudo_1.8.2.bb
+++ /dev/null
@@ -1,16 +0,0 @@
-require pseudo.inc
-
-SRC_URI = "http://downloads.yoctoproject.org/releases/pseudo/${BPN}-${PV}.tar.bz2 \
-           file://0001-configure-Prune-PIE-flags.patch \
-           file://fallback-passwd \
-           file://fallback-group \
-           file://moreretries.patch \
-           file://efe0be279901006f939cd357ccee47b651c786da.patch \
-           file://b6b68db896f9963558334aff7fca61adde4ec10f.patch \
-           file://fastopreply.patch \
-           file://toomanyfiles.patch \
-           file://0001-Use-epoll-API-on-Linux.patch \
-           "
-
-SRC_URI[md5sum] = "7d41e72188fbea1f696c399c1a435675"
-SRC_URI[sha256sum] = "ceb456bd47770a37ca20784a91d715c5a7601e07e26ab11b0c77e9203ed3d196"
diff --git a/meta/recipes-devtools/pseudo/pseudo_git.bb b/meta/recipes-devtools/pseudo/pseudo_git.bb
index 42c7b2ea572..ac9bd079f8b 100644
--- a/meta/recipes-devtools/pseudo/pseudo_git.bb
+++ b/meta/recipes-devtools/pseudo/pseudo_git.bb
@@ -1,15 +1,14 @@
 require pseudo.inc
 
-SRCREV = "02168305b0a19f981ffe857f36eb256ba8810b77"
-PV = "1.8.2+git${SRCPV}"
-
-DEFAULT_PREFERENCE = "-1"
-
 SRC_URI = "git://git.yoctoproject.org/pseudo \
            file://0001-configure-Prune-PIE-flags.patch \
            file://fallback-passwd \
            file://fallback-group \
-           file://moreretries.patch"
+           file://moreretries.patch \
+           file://toomanyfiles.patch \
+           "
 
+SRCREV = "b6a015aa91d7ab84c2f5466f3b5704f501129cbc"
 S = "${WORKDIR}/git"
+PV = "1.9.0+git${SRCPV}"
 
-- 
2.15.1


