Return-Path: <richard@rpsys.net>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id DA7EB783AE
	for <openembedded-core@lists.openembedded.org>;
	Fri, 22 Sep 2017 16:41:19 +0000 (UTC)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.15.2/8.15.2/Debian-3) with ESMTPSA id
	v8MGfIXa026641
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128
	verify=NOT); Fri, 22 Sep 2017 17:41:19 +0100
Received: from richard by hex with local (Exim 4.86_2)
	(envelope-from <richard@rpsys.net>)
	id 1dvR0w-0001Qa-PO; Fri, 22 Sep 2017 17:41:18 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Fri, 22 Sep 2017 17:41:17 +0100
Message-Id: <1506098477-5444-2-git-send-email-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1506098477-5444-1-git-send-email-richard.purdie@linuxfoundation.org>
References: <1506098477-5444-1-git-send-email-richard.purdie@linuxfoundation.org>
X-Virus-Scanned: clamav-milter 0.99.2 at dan
X-Virus-Status: Clean
Subject: [PATCH 2/2] pseudo: Add fastop reply fix
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
X-List-Received-Date: Fri, 22 Sep 2017 16:41:20 -0000

This changes the pseudo FASTOP functionality so that a reply to the
operation is required. This means we then cannot lose data if a connection
is closed. This in turn stops corruption if we run out of file handles
and have to close connections.

This tweaks the connection closure patch to update the comment there which
is now outdated.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 .../pseudo/files/fastopreply.patch                 | 74 ++++++++++++++++++++++
 .../pseudo/files/toomanyfiles.patch                |  7 +-
 meta/recipes-devtools/pseudo/pseudo_1.8.2.bb       |  1 +
 3 files changed, 77 insertions(+), 5 deletions(-)
 create mode 100644 meta/recipes-devtools/pseudo/files/fastopreply.patch

diff --git a/meta/recipes-devtools/pseudo/files/fastopreply.patch b/meta/recipes-devtools/pseudo/files/fastopreply.patch
new file mode 100644
index 0000000..c8e7b08
--- /dev/null
+++ b/meta/recipes-devtools/pseudo/files/fastopreply.patch
@@ -0,0 +1,74 @@
+Ensure FASTOP messages get an ACK reply so that the client can be sure the server
+recieved them. This means if connections are terminated, data isn't lost.
+
+RP 2017/9/22
+
+Index: pseudo-1.8.2/pseudo_client.c
+===================================================================
+--- pseudo-1.8.2.orig/pseudo_client.c
++++ pseudo-1.8.2/pseudo_client.c
+@@ -1331,21 +1331,19 @@ pseudo_client_request(pseudo_msg_t *msg,
+ 		 * indicating a successful send.
+ 		 */
+ 		pseudo_debug(PDBGF_CLIENT | PDBGF_VERBOSE, "sent!\n");
+-		if (msg->type != PSEUDO_MSG_FASTOP) {
+-			response = pseudo_msg_receive(connect_fd);
+-			if (!response) {
+-				pseudo_debug(PDBGF_CLIENT, "expected response did not occur; retrying\n");
++		response = pseudo_msg_receive(connect_fd);
++		if (!response) {
++			pseudo_debug(PDBGF_CLIENT, "expected response did not occur; retrying\n");
++		} else {
++			if (response->type != PSEUDO_MSG_ACK) {
++				pseudo_debug(PDBGF_CLIENT, "got non-ack response %d\n", response->type);
++				return 0;
++			} else if (msg->type != PSEUDO_MSG_FASTOP) {
++				pseudo_debug(PDBGF_CLIENT | PDBGF_VERBOSE, "got response type %d\n", response->type);
++				return response;
+ 			} else {
+-				if (response->type != PSEUDO_MSG_ACK) {
+-					pseudo_debug(PDBGF_CLIENT, "got non-ack response %d\n", response->type);
+-					return 0;
+-				} else {
+-					pseudo_debug(PDBGF_CLIENT | PDBGF_VERBOSE, "got response type %d\n", response->type);
+-					return response;
+-				}
++				return 0;
+ 			}
+-		} else {
+-			return 0;
+ 		}
+ 	}
+ 	pseudo_diag("pseudo: server connection persistently failed, aborting.\n");
+Index: pseudo-1.8.2/pseudo_server.c
+===================================================================
+--- pseudo-1.8.2.orig/pseudo_server.c
++++ pseudo-1.8.2/pseudo_server.c
+@@ -463,6 +463,11 @@ close_client(int client) {
+ 			--highest_client;
+ }
+ 
++static pseudo_msg_t server_fastop_reply = { 
++        .type = PSEUDO_MSG_ACK,
++        .op = OP_NONE,
++};
++
+ /* Actually process a request.
+  */
+ static int
+@@ -515,8 +520,14 @@ serve_client(int i) {
+ 		 * pseudo_server_response.
+ 		 */
+ 		if (in->type != PSEUDO_MSG_SHUTDOWN) {
+-                        if (in->type == PSEUDO_MSG_FASTOP)
++                        if (in->type == PSEUDO_MSG_FASTOP) {
+                                 send_response = 0;
++                                /* For fastops we reply now to say we got the data */
++                                if ((rc = pseudo_msg_send(clients[i].fd, &server_fastop_reply, 0, NULL)) != 0) {
++                                            pseudo_debug(PDBGF_SERVER, "failed to send fastop ack to client %d [%d]: %d (%s)\n",
++                                                    i, (int) clients[i].pid, rc, strerror(errno));
++                                }
++                        }
+ 			/* most messages don't need these, but xattr may */
+ 			response_path = 0;
+ 			response_pathlen = -1;
diff --git a/meta/recipes-devtools/pseudo/files/toomanyfiles.patch b/meta/recipes-devtools/pseudo/files/toomanyfiles.patch
index 7319ab2..d014ad5 100644
--- a/meta/recipes-devtools/pseudo/files/toomanyfiles.patch
+++ b/meta/recipes-devtools/pseudo/files/toomanyfiles.patch
@@ -31,15 +31,12 @@ Index: pseudo-1.8.2/pseudo_server.c
  
  	pseudo_debug(PDBGF_SERVER, "server loop started.\n");
  	if (listen_fd < 0) {
-@@ -663,10 +665,18 @@ pseudo_server_loop(void) {
+@@ -663,10 +665,15 @@ pseudo_server_loop(void) {
  						message_time.tv_usec -= 1000000;
  						++message_time.tv_sec;
  					}
 +				} else if (hitmaxfiles) {
-+					/* In theory there is a potential race here where if we close a client, 
-+					   it may have sent us a fastop message which we don't act upon.
-+					   If we don't close a filehandle we'll loop indefinitely thought. 
-+					   Only close one per loop iteration in the interests of caution */
++					/* Only close one per loop iteration in the interests of caution */
 +					close_client(i);
 +					hitmaxfiles = 0;
  				}
diff --git a/meta/recipes-devtools/pseudo/pseudo_1.8.2.bb b/meta/recipes-devtools/pseudo/pseudo_1.8.2.bb
index 81853e9..73ef572 100644
--- a/meta/recipes-devtools/pseudo/pseudo_1.8.2.bb
+++ b/meta/recipes-devtools/pseudo/pseudo_1.8.2.bb
@@ -7,6 +7,7 @@ SRC_URI = "http://downloads.yoctoproject.org/releases/pseudo/${BPN}-${PV}.tar.bz
            file://moreretries.patch \
            file://efe0be279901006f939cd357ccee47b651c786da.patch \
            file://b6b68db896f9963558334aff7fca61adde4ec10f.patch \
+           file://fastopreply.patch \
            file://toomanyfiles.patch \
            file://0001-Use-epoll-API-on-Linux.patch \
            "
-- 
2.7.4


