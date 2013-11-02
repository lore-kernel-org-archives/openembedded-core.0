Return-Path: <Chong.Lu@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 592016D504
	for <openembedded-core@lists.openembedded.org>;
	Sat,  2 Nov 2013 08:30:31 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id rA28UWYQ009186
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Sat, 2 Nov 2013 01:30:32 -0700 (PDT)
Received: from PKE-CLU1-D1.corp.ad.wrs.com (128.224.162.203) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.2.347.0; Sat, 2 Nov 2013 01:30:31 -0700
From: <Chong.Lu@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Sat, 2 Nov 2013 16:30:28 +0800
Message-ID: <1383381028-480-1-git-send-email-Chong.Lu@windriver.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Subject: [PATCH] ppp: Add two structures in if_pppol2tp.h
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
X-List-Received-Date: Sat, 02 Nov 2013 08:30:32 -0000
Content-Type: text/plain

From: Lu Chong <Chong.Lu@windriver.com>

Some further structure definitions are needed in include/linux/if_pppol2tp.h for
IPv6 support, else we would get the error as below:

	In file included from plugin.c:53:0:
	bitbake_build/tmp/sysroots/intel-x86-64/usr/include/linux/if_pppox.h:84:26:
	error: field 'pppol2tp' has incomplete type
  	  struct pppol2tpin6_addr pppol2tp;
        		          ^
	bitbake_build/tmp/sysroots/intel-x86-64/usr/include/linux/if_pppox.h:99:28:
	error: field 'pppol2tp' has incomplete type
	  struct pppol2tpv3in6_addr pppol2tp;
                		    ^
	make[2]: *** [plugin.o] Error 1

Signed-off-by: Lu Chong <Chong.Lu@windriver.com>
---
 ...1-ppp-Add-two-structures-in-if_pppol2tp.h.patch |   60 ++++++++++++++++++++
 meta/recipes-connectivity/ppp/ppp_2.4.5.bb         |    4 +-
 2 files changed, 63 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-connectivity/ppp/ppp-2.4.5/0001-ppp-Add-two-structures-in-if_pppol2tp.h.patch

diff --git a/meta/recipes-connectivity/ppp/ppp-2.4.5/0001-ppp-Add-two-structures-in-if_pppol2tp.h.patch b/meta/recipes-connectivity/ppp/ppp-2.4.5/0001-ppp-Add-two-structures-in-if_pppol2tp.h.patch
new file mode 100644
index 0000000..33b200a
--- /dev/null
+++ b/meta/recipes-connectivity/ppp/ppp-2.4.5/0001-ppp-Add-two-structures-in-if_pppol2tp.h.patch
@@ -0,0 +1,60 @@
+From 17ffc69db08c809c069e73aa2f2ed2ce02df5fa8 Mon Sep 17 00:00:00 2001
+From: Lu Chong <Chong.Lu@windriver.com>
+Date: Sat, 2 Nov 2013 14:34:24 +0800
+Subject: [PATCH] ppp: Add two structures in if_pppol2tp.h
+
+Some further structure definitions are needed in include/linux/if_pppol2tp.h for IPv6 support.
+
+Upstream-Status: Pending
+
+Signed-off-by: Lu Chong <Chong.Lu@windriver.com>
+---
+ include/linux/if_pppol2tp.h |   25 +++++++++++++++++++++++++
+ 1 file changed, 25 insertions(+)
+
+diff --git a/include/linux/if_pppol2tp.h b/include/linux/if_pppol2tp.h
+index 7ee86b2..9d626d1 100644
+--- a/include/linux/if_pppol2tp.h
++++ b/include/linux/if_pppol2tp.h
+@@ -32,6 +32,20 @@ struct pppol2tp_addr {
+ 	__u16 d_tunnel, d_session;	/* For sending outgoing packets */
+ };
+ 
++/* Structure used to connect() the socket to a particular tunnel UDP
++ * socket over IPv6.
++ */
++struct pppol2tpin6_addr {
++        __kernel_pid_t  pid;            /* pid that owns the fd.
++                                         * 0 => current */
++        int     fd;                     /* FD of UDP socket to use */
++
++        __u16 s_tunnel, s_session;      /* For matching incoming packets */
++        __u16 d_tunnel, d_session;      /* For sending outgoing packets */
++
++        struct sockaddr_in6 addr;       /* IP address and port to send to */
++};
++
+ /* The L2TPv3 protocol changes tunnel and session ids from 16 to 32
+  * bits. So we need a different sockaddr structure.
+  */
+@@ -46,6 +60,17 @@ struct pppol2tpv3_addr {
+ 	__u32 d_tunnel, d_session;	/* For sending outgoing packets */
+ };
+ 
++struct pppol2tpv3in6_addr {
++        __kernel_pid_t  pid;            /* pid that owns the fd.
++                                         * 0 => current */
++        int     fd;                     /* FD of UDP or IP socket to use */
++
++        __u32 s_tunnel, s_session;      /* For matching incoming packets */
++        __u32 d_tunnel, d_session;      /* For sending outgoing packets */
++
++        struct sockaddr_in6 addr;       /* IP address and port to send to */
++};
++
+ /* Socket options:
+  * DEBUG	- bitmask of debug message categories
+  * SENDSEQ	- 0 => don't send packets with sequence numbers
+-- 
+1.7.9.5
+
diff --git a/meta/recipes-connectivity/ppp/ppp_2.4.5.bb b/meta/recipes-connectivity/ppp/ppp_2.4.5.bb
index 39354ef..dc8c9c1 100644
--- a/meta/recipes-connectivity/ppp/ppp_2.4.5.bb
+++ b/meta/recipes-connectivity/ppp/ppp_2.4.5.bb
@@ -29,7 +29,9 @@ SRC_URI = "http://ppp.samba.org/ftp/ppp/ppp-${PV}.tar.gz \
            file://copts.patch \
            file://pap \
            file://ppp_on_boot \
-           file://provider "
+           file://provider \
+           file://0001-ppp-Add-two-structures-in-if_pppol2tp.h.patch \
+"
 
 SRC_URI[md5sum] = "4621bc56167b6953ec4071043fe0ec57"
 SRC_URI[sha256sum] = "43317afec9299f9920b96f840414c977f0385410202d48e56d2fdb8230003505"
-- 
1.7.9.5


