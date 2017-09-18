Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	by mail.openembedded.org (Postfix) with ESMTP id 1C35978264
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Sep 2017 13:38:11 +0000 (UTC)
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
	by fmsmga105.fm.intel.com with ESMTP; 18 Sep 2017 06:38:13 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.42,413,1500966000"; d="scan'208";a="312919440"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.161])
	by fmsmga004.fm.intel.com with ESMTP; 18 Sep 2017 06:38:12 -0700
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org,
	seebs@seebs.net
Date: Mon, 18 Sep 2017 16:34:10 +0300
Message-Id: <20170918133410.31388-1-alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.14.1
Subject: [PATCHv2] pseudo: use epoll API on Linux
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
X-List-Received-Date: Mon, 18 Sep 2017 13:38:12 -0000

The idea came up here:
https://bugzilla.yoctoproject.org/show_bug.cgi?id=11309
and here:
http://lists.openembedded.org/pipermail/openembedded-core/2017-August/141491.html

Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
---
 .../pseudo/files/0001-Use-epoll-API-on-Linux.patch | 273 +++++++++++++++++++++
 meta/recipes-devtools/pseudo/pseudo_1.8.2.bb       |   1 +
 2 files changed, 274 insertions(+)
 create mode 100644 meta/recipes-devtools/pseudo/files/0001-Use-epoll-API-on-Linux.patch

diff --git a/meta/recipes-devtools/pseudo/files/0001-Use-epoll-API-on-Linux.patch b/meta/recipes-devtools/pseudo/files/0001-Use-epoll-API-on-Linux.patch
new file mode 100644
index 00000000000..2e304f9811c
--- /dev/null
+++ b/meta/recipes-devtools/pseudo/files/0001-Use-epoll-API-on-Linux.patch
@@ -0,0 +1,273 @@
+From 55fe7dc646f560bdf79309bc8677902e53686d65 Mon Sep 17 00:00:00 2001
+From: Alexander Kanavin <alex.kanavin@gmail.com>
+Date: Fri, 15 Sep 2017 17:00:14 +0300
+Subject: [PATCH] Use epoll API on Linux
+
+Upstream-Status: Submitted [Seebs CC'd by email]
+Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
+
+
+Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
+---
+ enums/exit_status.in |   3 +
+ pseudo_server.c      | 178 ++++++++++++++++++++++++++++++++++++++++++++++++++-
+ 2 files changed, 179 insertions(+), 2 deletions(-)
+
+diff --git a/enums/exit_status.in b/enums/exit_status.in
+index 6be44d3..88f94cd 100644
+--- a/enums/exit_status.in
++++ b/enums/exit_status.in
+@@ -18,3 +18,6 @@ listen_fd, "server loop had no valid listen fd"
+ pseudo_loaded, "server couldn't get out of pseudo environment"
+ pseudo_prefix, "couldn't get valid pseudo prefix"
+ pseudo_invocation, "invalid server command arguments"
++epoll_create, "epoll_create() failed"
++epoll_ctl, "epoll_ctl() failed"
++
+diff --git a/pseudo_server.c b/pseudo_server.c
+index ff16efd..09c43e4 100644
+--- a/pseudo_server.c
++++ b/pseudo_server.c
+@@ -40,6 +40,12 @@
+ #include "pseudo_client.h"
+ #include "pseudo_db.h"
+ 
++// This has to come after pseudo includes, as that's where PSEUDO_PORT defines are
++#ifdef PSEUDO_PORT_LINUX
++#include <sys/epoll.h>
++#endif
++
++
+ static int listen_fd = -1;
+ 
+ typedef struct {
+@@ -59,6 +65,7 @@ static int active_clients = 0, highest_client = 0, max_clients = 0;
+ 
+ #define LOOP_DELAY 2
+ #define DEFAULT_PSEUDO_SERVER_TIMEOUT 30
++#define EPOLL_MAX_EVENTS 10
+ int pseudo_server_timeout = DEFAULT_PSEUDO_SERVER_TIMEOUT;
+ static int die_peacefully = 0;
+ static int die_forcefully = 0;
+@@ -80,7 +87,11 @@ quit_now(int signal) {
+ static int messages = 0, responses = 0;
+ static struct timeval message_time = { .tv_sec = 0 };
+ 
++#ifdef PSEUDO_PORT_LINUX
++static void pseudo_server_loop_epoll(void);
++#else
+ static void pseudo_server_loop(void);
++#endif
+ 
+ /* helper function to make a directory, just like mkdir -p.
+  * Can't use system() because the child shell would end up trying
+@@ -369,12 +380,16 @@ pseudo_server_start(int daemonize) {
+ 			kill(ppid, SIGUSR1);
+ 		}
+ 	}
++#ifdef PSEUDO_PORT_LINUX
++	pseudo_server_loop_epoll();
++#else
+ 	pseudo_server_loop();
++#endif
+ 	return 0;
+ }
+ 
+ /* mess with internal tables as needed */
+-static void
++static unsigned int
+ open_client(int fd) {
+ 	pseudo_client_t *new_clients;
+ 	int i;
+@@ -390,7 +405,7 @@ open_client(int fd) {
+ 			++active_clients;
+ 			if (i > highest_client)
+ 				highest_client = i;
+-			return;
++			return i;
+ 		}
+ 	}
+ 
+@@ -414,9 +429,11 @@ open_client(int fd) {
+ 
+ 		max_clients += 16;
+ 		++active_clients;
++		return max_clients - 16;
+ 	} else {
+ 		pseudo_diag("error allocating new client, fd %d\n", fd);
+ 		close(fd);
++		return 0;
+ 	}
+ }
+ 
+@@ -566,6 +583,162 @@ serve_client(int i) {
+ 	}
+ }
+ 
++#ifdef PSEUDO_PORT_LINUX
++static void pseudo_server_loop_epoll(void)
++{
++	struct sockaddr_un client;
++	socklen_t len;
++        int i;
++        int rc;
++        int fd;
++	int timeout;
++	struct epoll_event ev, events[EPOLL_MAX_EVENTS];
++	int loop_timeout = pseudo_server_timeout;
++
++	clients = malloc(16 * sizeof(*clients));
++
++	clients[0].fd = listen_fd;
++	clients[0].pid = getpid();
++
++	for (i = 1; i < 16; ++i) {
++		clients[i].fd = -1;
++		clients[i].pid = 0;
++		clients[i].tag = NULL;
++		clients[i].program = NULL;
++	}
++
++	active_clients = 1;
++	max_clients = 16;
++	highest_client = 0;
++
++	pseudo_debug(PDBGF_SERVER, "server loop started.\n");
++	if (listen_fd < 0) {
++		pseudo_diag("got into loop with no valid listen fd.\n");
++		exit(PSEUDO_EXIT_LISTEN_FD);
++	}
++
++	timeout = LOOP_DELAY * 1000;
++
++	int epollfd = epoll_create1(0);
++	if (epollfd == -1) {
++		pseudo_diag("epoll_create1() failed.\n");
++		exit(PSEUDO_EXIT_EPOLL_CREATE);
++	}
++	ev.events = EPOLLIN;
++	ev.data.u64 = 0;
++	if (epoll_ctl(epollfd, EPOLL_CTL_ADD, clients[0].fd, &ev) == -1) {
++		pseudo_diag("epoll_ctl() failed with listening socket.\n");
++		exit(PSEUDO_EXIT_EPOLL_CTL);
++	}
++
++	pdb_log_msg(SEVERITY_INFO, NULL, NULL, NULL, "server started (pid %d)", getpid());
++
++        for (;;) {
++		rc = epoll_wait(epollfd, events, EPOLL_MAX_EVENTS, timeout);
++		if (rc == 0 || (rc == -1 && errno == EINTR)) {
++			/* If there's no clients, start timing out.  If there
++			 * are active clients, never time out.
++			 */
++			if (active_clients == 1) {
++				loop_timeout -= LOOP_DELAY;
++                                /* maybe flush database to disk */
++                                pdb_maybe_backup();
++				if (loop_timeout <= 0) {
++					pseudo_debug(PDBGF_SERVER, "no more clients, got bored.\n");
++					die_peacefully = 1;
++				} else {
++					/* display this if not exiting */
++					pseudo_debug(PDBGF_SERVER | PDBGF_BENCHMARK, "%d messages handled in %.4f seconds, %d responses\n",
++						messages,
++						(double) message_time.tv_sec +
++						(double) message_time.tv_usec / 1000000.0,
++                                                responses);
++				}
++			}
++		} else if (rc > 0) {
++			loop_timeout = pseudo_server_timeout;
++			for (i = 0; i < rc; ++i) {
++				if (clients[events[i].data.u64].fd == listen_fd) {
++					if (!die_forcefully) {
++						len = sizeof(client);
++						if ((fd = accept(listen_fd, (struct sockaddr *) &client, &len)) != -1) {
++						/* Don't allow clients to end up on fd 2, because glibc's
++						 * malloc debug uses that fd unconditionally.
++						 */
++							if (fd == 2) {
++								int newfd = fcntl(fd, F_DUPFD, 3);
++								close(fd);
++								fd = newfd;
++							}
++							pseudo_debug(PDBGF_SERVER, "new client fd %d\n", fd);
++		                                        /* A new client implicitly cancels any
++		                                         * previous shutdown request, or a
++		                                         * shutdown for lack of clients.
++		                                         */
++		                                        pseudo_server_timeout = DEFAULT_PSEUDO_SERVER_TIMEOUT;
++		                                        die_peacefully = 0;
++
++							ev.events = EPOLLIN;
++							ev.data.u64 = open_client(fd);
++							if (ev.data.u64 != 0 && epoll_ctl(epollfd, EPOLL_CTL_ADD, clients[ev.data.u64].fd, &ev) == -1) {
++								pseudo_diag("epoll_ctl() failed with accepted socket.\n");
++								exit(PSEUDO_EXIT_EPOLL_CTL);
++							}
++						} else if (errno == EMFILE) {
++							// select() loop would drop a client here, we do nothing (for now)
++							pseudo_debug(PDBGF_SERVER, "Hit max open files.\n");
++						}
++					}
++				} else {
++					struct timeval tv1, tv2;
++                                        int rc;
++					gettimeofday(&tv1, NULL);
++					rc = serve_client(events[i].data.u64);
++					gettimeofday(&tv2, NULL);
++					++messages;
++                                        if (rc == 0)
++                                                ++responses;
++					message_time.tv_sec += (tv2.tv_sec - tv1.tv_sec);
++					message_time.tv_usec += (tv2.tv_usec - tv1.tv_usec);
++					if (message_time.tv_usec < 0) {
++						message_time.tv_usec += 1000000;
++						--message_time.tv_sec;
++					} else while (message_time.tv_usec > 1000000) {
++						message_time.tv_usec -= 1000000;
++						++message_time.tv_sec;
++					}
++				}
++				if (die_forcefully)
++					break;
++			}
++			pseudo_debug(PDBGF_SERVER, "server loop complete [%d clients left]\n", active_clients);
++		} else {
++			pseudo_diag("epoll_wait failed: %s\n", strerror(errno));
++			break;
++		}
++		if (die_peacefully || die_forcefully) {
++			pseudo_debug(PDBGF_SERVER, "quitting.\n");
++			pseudo_debug(PDBGF_SERVER | PDBGF_BENCHMARK, "server %d exiting: handled %d messages in %.4f seconds\n",
++				getpid(), messages,
++				(double) message_time.tv_sec +
++				(double) message_time.tv_usec / 1000000.0);
++			pdb_log_msg(SEVERITY_INFO, NULL, NULL, NULL, "server %d exiting: handled %d messages in %.4f seconds",
++				getpid(), messages,
++				(double) message_time.tv_sec +
++				(double) message_time.tv_usec / 1000000.0);
++			/* and at this point, we'll start refusing connections */
++			close(clients[0].fd);
++			/* This is a good place to insert a delay for
++			 * debugging race conditions during startup. */
++			/* usleep(300000); */
++			exit(0);
++		}
++	}
++
++}
++
++#else
++
+ /* get clients, handle messages, shut down.
+  * This doesn't actually do any work, it just calls a ton of things which
+  * do work.
+@@ -751,3 +924,4 @@ pseudo_server_loop(void) {
+ 	}
+ 	pseudo_diag("select failed: %s\n", strerror(errno));
+ }
++#endif
+-- 
+2.14.1
+
diff --git a/meta/recipes-devtools/pseudo/pseudo_1.8.2.bb b/meta/recipes-devtools/pseudo/pseudo_1.8.2.bb
index 9bcd0318926..81853e95c42 100644
--- a/meta/recipes-devtools/pseudo/pseudo_1.8.2.bb
+++ b/meta/recipes-devtools/pseudo/pseudo_1.8.2.bb
@@ -8,6 +8,7 @@ SRC_URI = "http://downloads.yoctoproject.org/releases/pseudo/${BPN}-${PV}.tar.bz
            file://efe0be279901006f939cd357ccee47b651c786da.patch \
            file://b6b68db896f9963558334aff7fca61adde4ec10f.patch \
            file://toomanyfiles.patch \
+           file://0001-Use-epoll-API-on-Linux.patch \
            "
 
 SRC_URI[md5sum] = "7d41e72188fbea1f696c399c1a435675"
-- 
2.14.1


