Return-Path: <mariano.lopez@linux.intel.com>
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
	by mail.openembedded.org (Postfix) with ESMTP id 14A4960110
	for <openembedded-core@lists.openembedded.org>;
	Wed, 23 Nov 2016 20:41:00 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by orsmga104.jf.intel.com with ESMTP; 23 Nov 2016 12:41:02 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.31,540,1473145200"; d="scan'208";a="904876008"
Received: from unknown (HELO mlopezva-MOBL2.zpn.intel.com) ([10.219.5.43])
	by orsmga003.jf.intel.com with ESMTP; 23 Nov 2016 12:41:01 -0800
From: mariano.lopez@linux.intel.com
To: openembedded-core@lists.openembedded.org
Date: Wed, 23 Nov 2016 14:41:03 -0600
Message-Id: <91985de8a0d013d23e43cef68623f16db2195919.1479933579.git.mariano.lopez@linux.intel.com>
X-Mailer: git-send-email 2.7.3
In-Reply-To: <cover.1479933579.git.mariano.lopez@linux.intel.com>
References: <cover.1479933579.git.mariano.lopez@linux.intel.com>
Subject: [PATCHv2 1/1] nfs-utils: 1.3.3 -> 1.3.4
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
X-List-Received-Date: Wed, 23 Nov 2016 20:41:01 -0000

From: Mariano Lopez <mariano.lopez@linux.intel.com>

Signed-off-by: Mariano Lopez <mariano.lopez@linux.intel.com>
---
 .../files/nfs-utils-debianize-start-statd.patch    |  23 +++--
 ...tatd-fix-a-segfault-caused-by-improper-us.patch | 113 ---------------------
 .../fix-protocol-minor-version-fall-back.patch     |  55 ----------
 .../{nfs-utils_1.3.3.bb => nfs-utils_1.3.4.bb}     |   6 +-
 4 files changed, 14 insertions(+), 183 deletions(-)
 delete mode 100644 meta/recipes-connectivity/nfs-utils/nfs-utils/0001-nfs-utils-statd-fix-a-segfault-caused-by-improper-us.patch
 delete mode 100644 meta/recipes-connectivity/nfs-utils/nfs-utils/fix-protocol-minor-version-fall-back.patch
 rename meta/recipes-connectivity/nfs-utils/{nfs-utils_1.3.3.bb => nfs-utils_1.3.4.bb} (95%)

diff --git a/meta/recipes-connectivity/nfs-utils/files/nfs-utils-debianize-start-statd.patch b/meta/recipes-connectivity/nfs-utils/files/nfs-utils-debianize-start-statd.patch
index 8500229..ede0dce 100644
--- a/meta/recipes-connectivity/nfs-utils/files/nfs-utils-debianize-start-statd.patch
+++ b/meta/recipes-connectivity/nfs-utils/files/nfs-utils-debianize-start-statd.patch
@@ -9,17 +9,18 @@ Signed-off-by: Li Wang <li.wang@windriver.com>
 Signed-off-by: Roy Li <rongqing.li@windriver.com>
 Signed-off-by: Wenzong Fan <wenzong.fan@windriver.com>
 ---
- utils/statd/start-statd | 9 ++++++++-
- 1 file changed, 8 insertions(+), 1 deletion(-)
+ utils/statd/start-statd | 10 +++++++++-
+ 1 file changed, 9 insertions(+), 1 deletion(-)
 
 diff --git a/utils/statd/start-statd b/utils/statd/start-statd
-index ec9383b..3969b8c 100755
+index 2fd6039..f591b34 100755
 --- a/utils/statd/start-statd
 +++ b/utils/statd/start-statd
-@@ -6,6 +6,13 @@
- # site.
- PATH="/sbin:/usr/sbin:/bin:/usr/bin"
- 
+@@ -17,6 +17,14 @@ then
+     # statd already running - must have been slow to respond.
+     exit 0
+ fi
++
 +# Read config
 +DEFAULTFILE=/etc/default/nfs-common
 +NEED_IDMAPD=
@@ -28,14 +29,14 @@ index ec9383b..3969b8c 100755
 +fi
 +
  # First try systemd if it's installed.
- if systemctl --help >/dev/null 2>&1; then
+ if [ -d /run/systemd/system ]; then
      # Quit only if the call worked.
-@@ -13,4 +20,4 @@ if systemctl --help >/dev/null 2>&1; then
- fi
+@@ -25,4 +33,4 @@ fi
  
+ cd /
  # Fall back to launching it ourselves.
 -exec rpc.statd --no-notify
 +exec rpc.statd --no-notify $STATDOPTS
 -- 
-1.9.1
+2.6.6
 
diff --git a/meta/recipes-connectivity/nfs-utils/nfs-utils/0001-nfs-utils-statd-fix-a-segfault-caused-by-improper-us.patch b/meta/recipes-connectivity/nfs-utils/nfs-utils/0001-nfs-utils-statd-fix-a-segfault-caused-by-improper-us.patch
deleted file mode 100644
index de0b045..0000000
--- a/meta/recipes-connectivity/nfs-utils/nfs-utils/0001-nfs-utils-statd-fix-a-segfault-caused-by-improper-us.patch
+++ /dev/null
@@ -1,113 +0,0 @@
-Upstream-Status: Pending
-
-Subject: nfs-utils/statd: fix a segfault caused by improper usage of RPC interface
-
-There is a hack which uses the bottom-level RPC improperly as below
-in the current statd implementation:
-insert a socket in the svc_fdset without a corresponding transport handle
-and passes the socket to the svc_getreqset subroutine, this usage causes
-a segfault of statd on a huge amount of sm-notifications.
-
-Fix the issue by separating the non-RPC-server sock from RPC dispatcher.
-
-Signed-off-by: Shan Hai <shan.hai@windriver.com>
-Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
----
- utils/statd/rmtcall.c | 1 -
- utils/statd/statd.c   | 5 +++--
- utils/statd/statd.h   | 2 +-
- utils/statd/svc_run.c | 8 ++++++--
- 4 files changed, 10 insertions(+), 6 deletions(-)
-
-diff --git a/utils/statd/rmtcall.c b/utils/statd/rmtcall.c
-index fd576d9..cde091b 100644
---- a/utils/statd/rmtcall.c
-+++ b/utils/statd/rmtcall.c
-@@ -104,7 +104,6 @@ statd_get_socket(void)
- 	if (sockfd < 0)
- 		return -1;
- 
--	FD_SET(sockfd, &SVC_FDSET);
- 	return sockfd;
- }
- 
-diff --git a/utils/statd/statd.c b/utils/statd/statd.c
-index 51a016e..e21a259 100644
---- a/utils/statd/statd.c
-+++ b/utils/statd/statd.c
-@@ -247,6 +247,7 @@ int main (int argc, char **argv)
- 	int port = 0, out_port = 0;
- 	int nlm_udp = 0, nlm_tcp = 0;
- 	struct rlimit rlim;
-+	int notify_sockfd;
- 
- 	int pipefds[2] = { -1, -1};
- 	char status;
-@@ -473,7 +474,7 @@ int main (int argc, char **argv)
- 		}
- 
- 	/* Make sure we have a privilege port for calling into the kernel */
--	if (statd_get_socket() < 0)
-+	if ((notify_sockfd = statd_get_socket()) < 0)
- 		exit(1);
- 
- 	/* If sm-notify didn't take all the state files, load
-@@ -528,7 +529,7 @@ int main (int argc, char **argv)
- 		 * Handle incoming requests:  SM_NOTIFY socket requests, as
- 		 * well as callbacks from lockd.
- 		 */
--		my_svc_run();	/* I rolled my own, Olaf made it better... */
-+		my_svc_run(notify_sockfd);	/* I rolled my own, Olaf made it better... */
- 
- 		/* Only get here when simulating a crash so we should probably
- 		 * start sm-notify running again.  As we have already dropped
-diff --git a/utils/statd/statd.h b/utils/statd/statd.h
-index a1d8035..231ac7e 100644
---- a/utils/statd/statd.h
-+++ b/utils/statd/statd.h
-@@ -28,7 +28,7 @@ extern _Bool	statd_present_address(const struct sockaddr *sap, char *buf,
- __attribute__((__malloc__))
- extern char *	statd_canonical_name(const char *hostname);
- 
--extern void	my_svc_run(void);
-+extern void	my_svc_run(int);
- extern void	notify_hosts(void);
- extern void	shuffle_dirs(void);
- extern int	statd_get_socket(void);
-diff --git a/utils/statd/svc_run.c b/utils/statd/svc_run.c
-index d98ecee..28c1ad6 100644
---- a/utils/statd/svc_run.c
-+++ b/utils/statd/svc_run.c
-@@ -78,7 +78,7 @@ my_svc_exit(void)
-  * The heart of the server.  A crib from libc for the most part...
-  */
- void
--my_svc_run(void)
-+my_svc_run(int sockfd)
- {
- 	FD_SET_TYPE	readfds;
- 	int             selret;
-@@ -96,6 +96,8 @@ my_svc_run(void)
- 		}
- 
- 		readfds = SVC_FDSET;
-+		/* Set notify sockfd for waiting for reply */
-+		FD_SET(sockfd, &readfds);
- 		if (notify) {
- 			struct timeval	tv;
- 
-@@ -125,8 +127,10 @@ my_svc_run(void)
- 
- 		default:
- 			selret -= process_reply(&readfds);
--			if (selret)
-+			if (selret) {
-+				FD_CLR(sockfd, &readfds);
- 				svc_getreqset(&readfds);
-+			}
- 		}
- 	}
- }
--- 
-1.9.1
-
diff --git a/meta/recipes-connectivity/nfs-utils/nfs-utils/fix-protocol-minor-version-fall-back.patch b/meta/recipes-connectivity/nfs-utils/nfs-utils/fix-protocol-minor-version-fall-back.patch
deleted file mode 100644
index 683246c..0000000
--- a/meta/recipes-connectivity/nfs-utils/nfs-utils/fix-protocol-minor-version-fall-back.patch
+++ /dev/null
@@ -1,55 +0,0 @@
-From 78bb645a42c216b37b8d930c7c849a3fa89babf8 Mon Sep 17 00:00:00 2001
-From: Takashi Iwai <tiwai@suse.com>
-Date: Sat, 16 Jan 2016 12:02:30 -0500
-Subject: [PATCH] Fix protocol minor version fall-back
-
-mount.nfs currently expects mount(2) to fail with EPROTONOSUPPORT if
-the kernel doesn't understand the requested NFS version.
-
-Unfortunately if the requested minor is not known to the kernel
-it returns -EINVAL.
-In kernels since 3.11 this can happen in nfs4_alloc_client(), if
-compiled without NFS_V4_2.
-
-More generally it can happen in in nfs_validate_text_mount_data()
-when nfs_parse_mount_options() returns 0 because
-nfs_parse_version_string()
-didn't recognise the version.
-
-EPROTONOSUPPORT is only returned if NFSv4 support is completely compiled
-out.
-
-So nfs_autonegotiate needs to check for EINVAL as well as
-EPROTONOSUPPORT.
-
-URL: https://bugzilla.opensuse.org/show_bug.cgi?id=959211
-Reported-by: Takashi Iwai <tiwai@suse.com>
-Signed-off-by: NeilBrown <neilb@suse.com>
-Signed-off-by: Steve Dickson <steved@redhat.com>
-
-
-Upstream-Status: Backport
-http://git.linux-nfs.org/?p=steved/nfs-utils.git;a=patch;h=78bb645a42c216b37b8d930c7c849a3fa89babf8
-
-Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
----
- utils/mount/stropts.c | 3 +++
- 1 file changed, 3 insertions(+)
-
-diff --git a/utils/mount/stropts.c b/utils/mount/stropts.c
-index c8f5a6d..86829a9 100644
---- a/utils/mount/stropts.c
-+++ b/utils/mount/stropts.c
-@@ -841,6 +841,9 @@ check_result:
- 	case EPROTONOSUPPORT:
- 		/* A clear indication that the server or our
- 		 * client does not support NFS version 4 and minor */
-+	case EINVAL:
-+		/* A less clear indication that our client
-+		 * does not support NFSv4 minor version. */
- 		if (mi->version.v_mode == V_GENERAL &&
- 			mi->version.minor == 0)
- 				return result;
--- 
-2.7.4
-
diff --git a/meta/recipes-connectivity/nfs-utils/nfs-utils_1.3.3.bb b/meta/recipes-connectivity/nfs-utils/nfs-utils_1.3.4.bb
similarity index 95%
rename from meta/recipes-connectivity/nfs-utils/nfs-utils_1.3.3.bb
rename to meta/recipes-connectivity/nfs-utils/nfs-utils_1.3.4.bb
index a2bebe0..bf6c9fa 100644
--- a/meta/recipes-connectivity/nfs-utils/nfs-utils_1.3.3.bb
+++ b/meta/recipes-connectivity/nfs-utils/nfs-utils_1.3.4.bb
@@ -31,13 +31,11 @@ SRC_URI = "${KERNELORG_MIRROR}/linux/utils/nfs-utils/${PV}/nfs-utils-${PV}.tar.x
            file://proc-fs-nfsd.mount \
            file://nfs-utils-Do-not-pass-CFLAGS-to-gcc-while-building.patch \
            file://nfs-utils-debianize-start-statd.patch \
-           file://0001-nfs-utils-statd-fix-a-segfault-caused-by-improper-us.patch \
            file://bugfix-adjust-statd-service-name.patch \
-           file://fix-protocol-minor-version-fall-back.patch \
 "
 
-SRC_URI[md5sum] = "cd6b568c2e9301cc3bfac09d87fbbc0b"
-SRC_URI[sha256sum] = "700d689c5622c87953c34102e5befafc4d3c811e676852238f0dd79c9c0c084d"
+SRC_URI[md5sum] = "54e4119043ec8507a2a0e054cf2889a4"
+SRC_URI[sha256sum] = "b42a5bc0a8d80d04650030ceb9a11f08f4acfbcb1ee297f657fb94e339c45975"
 
 # Only kernel-module-nfsd is required here (but can be built-in)  - the nfsd module will
 # pull in the remainder of the dependencies.
-- 
2.7.3


