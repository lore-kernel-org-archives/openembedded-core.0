Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id 0F4B66FF56
	for <openembedded-core@lists.openembedded.org>;
	Fri, 22 Sep 2017 15:22:44 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	22 Sep 2017 08:22:45 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.42,427,1500966000"; d="scan'208";a="138348104"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.161])
	by orsmga002.jf.intel.com with ESMTP; 22 Sep 2017 08:22:44 -0700
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 22 Sep 2017 18:18:46 +0300
Message-Id: <20170922151846.6612-1-alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.14.1
Subject: [PATCHv3] pseudo: use epoll API on Linux
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
X-List-Received-Date: Fri, 22 Sep 2017 15:22:45 -0000

The idea came up here:
https://bugzilla.yoctoproject.org/show_bug.cgi?id=11309
and here:
http://lists.openembedded.org/pipermail/openembedded-core/2017-August/141491.html

Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
---
 .../pseudo/files/0001-Use-epoll-API-on-Linux.patch | 292 +++++++++++++++++++++
 meta/recipes-devtools/pseudo/pseudo_1.8.2.bb       |   1 +
 2 files changed, 293 insertions(+)
 create mode 100644 meta/recipes-devtools/pseudo/files/0001-Use-epoll-API-on-Linux.patch

diff --git a/meta/recipes-devtools/pseudo/files/0001-Use-epoll-API-on-Linux.patch b/meta/recipes-devtools/pseudo/files/0001-Use-epoll-API-on-Linux.patch
new file mode 100644
index 00000000000..42557b17a7f
--- /dev/null
+++ b/meta/recipes-devtools/pseudo/files/0001-Use-epoll-API-on-Linux.patch
@@ -0,0 +1,292 @@
+From 9e407e0be01695e7b927f5820ade87ee9602c248 Mon Sep 17 00:00:00 2001
+From: Alexander Kanavin <alex.kanavin@gmail.com>
+Date: Fri, 15 Sep 2017 17:00:14 +0300
+Subject: [PATCH] Use epoll API on Linux
+
+Also a couple of other modifications due to epoll having
+a different approach to how the working set of fds is defined
+and used:
+1) open_client() returns an index into the array of clients
+2) close_client() has a protection against being called twice
+with the same client (which would mess up the active_clients
+counter)
+
+Upstream-Status: Submitted [Seebs CC'd by email]
+Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
+
+---
+ enums/exit_status.in |   3 +
+ pseudo_server.c      | 189 ++++++++++++++++++++++++++++++++++++++++++++++++++-
+ 2 files changed, 190 insertions(+), 2 deletions(-)
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
+index ff16efd..14d34de 100644
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
+@@ -80,6 +87,9 @@ quit_now(int signal) {
+ static int messages = 0, responses = 0;
+ static struct timeval message_time = { .tv_sec = 0 };
+ 
++#ifdef PSEUDO_PORT_LINUX
++static void pseudo_server_loop_epoll(void);
++#endif
+ static void pseudo_server_loop(void);
+ 
+ /* helper function to make a directory, just like mkdir -p.
+@@ -369,12 +379,16 @@ pseudo_server_start(int daemonize) {
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
+@@ -390,7 +404,7 @@ open_client(int fd) {
+ 			++active_clients;
+ 			if (i > highest_client)
+ 				highest_client = i;
+-			return;
++			return i;
+ 		}
+ 	}
+ 
+@@ -414,9 +428,11 @@ open_client(int fd) {
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
+@@ -433,6 +449,10 @@ close_client(int client) {
+ 			client, highest_client);
+ 		return;
+ 	}
++	if (clients[client].fd == -1) {
++		pseudo_debug(PDBGF_SERVER, "client %d already closed\n", client);
++		return;
++	}
+ 	close(clients[client].fd);
+ 	clients[client].fd = -1;
+ 	free(clients[client].tag);
+@@ -566,6 +586,171 @@ serve_client(int i) {
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
++							pseudo_debug(PDBGF_SERVER, "Hit max open files, dropping a client.\n");
++		                                        /* In theory there is a potential race here where if we close a client, 
++		                                           it may have sent us a fastop message which we don't act upon.
++		                                           If we don't close a filehandle we'll loop indefinitely thought. 
++		                                           Only close one per loop iteration in the interests of caution */
++				                        for (int j = 1; j <= highest_client; ++j) {
++				                                if (clients[j].fd != -1) {
++				                                        close_client(j);
++									break;
++								}
++							}
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
++#endif
++
+ /* get clients, handle messages, shut down.
+  * This doesn't actually do any work, it just calls a ton of things which
+  * do work.
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


