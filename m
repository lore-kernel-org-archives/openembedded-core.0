Return-Path: <Qi.Chen@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 454A075CC2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 28 Oct 2015 02:30:12 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id t9S2UBSc018715
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 27 Oct 2015 19:30:12 -0700 (PDT)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.211) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.248.2; Tue, 27 Oct 2015 19:30:11 -0700
From: Chen Qi <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 28 Oct 2015 10:30:09 +0800
Message-ID: <20500aec2e2798b3490d124cc1719a45eedfd767.1445998987.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1445998986.git.Qi.Chen@windriver.com>
References: <cover.1445998986.git.Qi.Chen@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/1] nfs-utils/statd: fix a segfault
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
X-List-Received-Date: Wed, 28 Oct 2015 02:30:14 -0000
Content-Type: text/plain

Fix the segfault by separating the socket used in statd from the sockets
of RPC core.

Signed-off-by: Shan Hai <shan.hai@windriver.com>
Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 ...tatd-fix-a-segfault-caused-by-improper-us.patch | 113 +++++++++++++++++++++
 .../nfs-utils/nfs-utils_1.3.1.bb                   |   1 +
 2 files changed, 114 insertions(+)
 create mode 100644 meta/recipes-connectivity/nfs-utils/nfs-utils/0001-nfs-utils-statd-fix-a-segfault-caused-by-improper-us.patch

diff --git a/meta/recipes-connectivity/nfs-utils/nfs-utils/0001-nfs-utils-statd-fix-a-segfault-caused-by-improper-us.patch b/meta/recipes-connectivity/nfs-utils/nfs-utils/0001-nfs-utils-statd-fix-a-segfault-caused-by-improper-us.patch
new file mode 100644
index 0000000..de0b045
--- /dev/null
+++ b/meta/recipes-connectivity/nfs-utils/nfs-utils/0001-nfs-utils-statd-fix-a-segfault-caused-by-improper-us.patch
@@ -0,0 +1,113 @@
+Upstream-Status: Pending
+
+Subject: nfs-utils/statd: fix a segfault caused by improper usage of RPC interface
+
+There is a hack which uses the bottom-level RPC improperly as below
+in the current statd implementation:
+insert a socket in the svc_fdset without a corresponding transport handle
+and passes the socket to the svc_getreqset subroutine, this usage causes
+a segfault of statd on a huge amount of sm-notifications.
+
+Fix the issue by separating the non-RPC-server sock from RPC dispatcher.
+
+Signed-off-by: Shan Hai <shan.hai@windriver.com>
+Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
+---
+ utils/statd/rmtcall.c | 1 -
+ utils/statd/statd.c   | 5 +++--
+ utils/statd/statd.h   | 2 +-
+ utils/statd/svc_run.c | 8 ++++++--
+ 4 files changed, 10 insertions(+), 6 deletions(-)
+
+diff --git a/utils/statd/rmtcall.c b/utils/statd/rmtcall.c
+index fd576d9..cde091b 100644
+--- a/utils/statd/rmtcall.c
++++ b/utils/statd/rmtcall.c
+@@ -104,7 +104,6 @@ statd_get_socket(void)
+ 	if (sockfd < 0)
+ 		return -1;
+ 
+-	FD_SET(sockfd, &SVC_FDSET);
+ 	return sockfd;
+ }
+ 
+diff --git a/utils/statd/statd.c b/utils/statd/statd.c
+index 51a016e..e21a259 100644
+--- a/utils/statd/statd.c
++++ b/utils/statd/statd.c
+@@ -247,6 +247,7 @@ int main (int argc, char **argv)
+ 	int port = 0, out_port = 0;
+ 	int nlm_udp = 0, nlm_tcp = 0;
+ 	struct rlimit rlim;
++	int notify_sockfd;
+ 
+ 	int pipefds[2] = { -1, -1};
+ 	char status;
+@@ -473,7 +474,7 @@ int main (int argc, char **argv)
+ 		}
+ 
+ 	/* Make sure we have a privilege port for calling into the kernel */
+-	if (statd_get_socket() < 0)
++	if ((notify_sockfd = statd_get_socket()) < 0)
+ 		exit(1);
+ 
+ 	/* If sm-notify didn't take all the state files, load
+@@ -528,7 +529,7 @@ int main (int argc, char **argv)
+ 		 * Handle incoming requests:  SM_NOTIFY socket requests, as
+ 		 * well as callbacks from lockd.
+ 		 */
+-		my_svc_run();	/* I rolled my own, Olaf made it better... */
++		my_svc_run(notify_sockfd);	/* I rolled my own, Olaf made it better... */
+ 
+ 		/* Only get here when simulating a crash so we should probably
+ 		 * start sm-notify running again.  As we have already dropped
+diff --git a/utils/statd/statd.h b/utils/statd/statd.h
+index a1d8035..231ac7e 100644
+--- a/utils/statd/statd.h
++++ b/utils/statd/statd.h
+@@ -28,7 +28,7 @@ extern _Bool	statd_present_address(const struct sockaddr *sap, char *buf,
+ __attribute__((__malloc__))
+ extern char *	statd_canonical_name(const char *hostname);
+ 
+-extern void	my_svc_run(void);
++extern void	my_svc_run(int);
+ extern void	notify_hosts(void);
+ extern void	shuffle_dirs(void);
+ extern int	statd_get_socket(void);
+diff --git a/utils/statd/svc_run.c b/utils/statd/svc_run.c
+index d98ecee..28c1ad6 100644
+--- a/utils/statd/svc_run.c
++++ b/utils/statd/svc_run.c
+@@ -78,7 +78,7 @@ my_svc_exit(void)
+  * The heart of the server.  A crib from libc for the most part...
+  */
+ void
+-my_svc_run(void)
++my_svc_run(int sockfd)
+ {
+ 	FD_SET_TYPE	readfds;
+ 	int             selret;
+@@ -96,6 +96,8 @@ my_svc_run(void)
+ 		}
+ 
+ 		readfds = SVC_FDSET;
++		/* Set notify sockfd for waiting for reply */
++		FD_SET(sockfd, &readfds);
+ 		if (notify) {
+ 			struct timeval	tv;
+ 
+@@ -125,8 +127,10 @@ my_svc_run(void)
+ 
+ 		default:
+ 			selret -= process_reply(&readfds);
+-			if (selret)
++			if (selret) {
++				FD_CLR(sockfd, &readfds);
+ 				svc_getreqset(&readfds);
++			}
+ 		}
+ 	}
+ }
+-- 
+1.9.1
+
diff --git a/meta/recipes-connectivity/nfs-utils/nfs-utils_1.3.1.bb b/meta/recipes-connectivity/nfs-utils/nfs-utils_1.3.1.bb
index 42101de..317ee85 100644
--- a/meta/recipes-connectivity/nfs-utils/nfs-utils_1.3.1.bb
+++ b/meta/recipes-connectivity/nfs-utils/nfs-utils_1.3.1.bb
@@ -31,6 +31,7 @@ SRC_URI = "${KERNELORG_MIRROR}/linux/utils/nfs-utils/${PV}/nfs-utils-${PV}.tar.x
            file://proc-fs-nfsd.mount \
            file://nfs-utils-Do-not-pass-CFLAGS-to-gcc-while-building.patch \
            file://nfs-utils-debianize-start-statd.patch \
+           file://0001-nfs-utils-statd-fix-a-segfault-caused-by-improper-us.patch \
 "
 
 SRC_URI[md5sum] = "8de676b9ff34b8f9addc1d0800fabdf8"
-- 
1.9.1


