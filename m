Received: from mail-bk0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <jekhor@gmail.com>) id 1RzqSi-0005Ag-AA
	for openembedded-core@lists.openembedded.org;
	Tue, 21 Feb 2012 15:13:00 +0100
Received: by bkwq11 with SMTP id q11so5601540bkw.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 Feb 2012 06:04:41 -0800 (PST)
Received-SPF: pass (google.com: domain of jekhor@gmail.com designates
	10.204.153.195 as permitted sender) client-ip=10.204.153.195; 
Authentication-Results: mr.google.com;
	spf=pass (google.com: domain of jekhor@gmail.com
	designates 10.204.153.195 as permitted sender)
	smtp.mail=jekhor@gmail.com; dkim=pass header.i=jekhor@gmail.com
Received: from mr.google.com ([10.204.153.195])
	by 10.204.153.195 with SMTP id l3mr13701000bkw.123.1329833081530
	(num_hops = 1); Tue, 21 Feb 2012 06:04:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=sender:from:to:cc:subject:date:message-id:x-mailer;
	bh=TTUwad1qa81/zUchGLnSzZrrU/c93ArRKAaE9C1CHP4=;
	b=BlJGOubwFMjFRybgvNp6NcM24o2nOrhU3w1qXw6e8Z6ha+0LA/YpI590w3Shb/7htR
	kvAY/LtSHKMFbYapuMtX/H+kcGeF6C5W/UH0iSTpRvypiKJbPOpvyiG7RmKa+B0rq+lE
	x9nBmoFOHiUYKWwIQD2JQthl0jaxQ+SrjcZUw=
Received: by 10.204.153.195 with SMTP id l3mr11057799bkw.123.1329833080913;
	Tue, 21 Feb 2012 06:04:40 -0800 (PST)
Received: from localhost.localdomain (mx2.promwad.com. [195.222.87.218])
	by mx.google.com with ESMTPS id ez5sm45623833bkc.15.2012.02.21.06.04.40
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 21 Feb 2012 06:04:40 -0800 (PST)
Sender: Yauhen Kharuzhy <jekhor@gmail.com>
Received: from jek by localhost.localdomain with local (Exim 4.77)
	(envelope-from <jek@jeknote.loshitsa1.net>)
	id 1RzqKc-0001B9-TQ; Tue, 21 Feb 2012 17:04:38 +0300
From: Yauhen Kharuzhy <yauhen.kharuzhy@promwad.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 21 Feb 2012 17:04:38 +0300
Message-Id: <1329833078-4502-1-git-send-email-yauhen.kharuzhy@promwad.com>
X-Mailer: git-send-email 1.7.9
Cc: denx@promwad.com
Subject: [PATCH] ppp: Fix rp-pppoe plugin compilation
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 21 Feb 2012 14:13:00 -0000

rp-pppoe plugin was broken due linux headers changes: pppd has own copy of
if_pppol2tp.h file which is included from <linux/if_pppox.h>.

Add patch from Debian for struct pppol2tpv3_addr definition.

Signed-off-by: Yauhen Kharuzhy <yauhen.kharuzhy@promwad.com>
---
 .../ppp/ppp-2.4.5/update_if_pppol2tp.patch         |   54 ++++++++++++++++++++
 meta/recipes-connectivity/ppp/ppp_2.4.5.bb         |    3 +-
 2 files changed, 56 insertions(+), 1 deletions(-)
 create mode 100644 meta/recipes-connectivity/ppp/ppp-2.4.5/update_if_pppol2tp.patch

diff --git a/meta/recipes-connectivity/ppp/ppp-2.4.5/update_if_pppol2tp.patch b/meta/recipes-connectivity/ppp/ppp-2.4.5/update_if_pppol2tp.patch
new file mode 100644
index 0000000..e034f19
--- /dev/null
+++ b/meta/recipes-connectivity/ppp/ppp-2.4.5/update_if_pppol2tp.patch
@@ -0,0 +1,54 @@
+Upstream-Status: Pending
+diff --git a/include/linux/if_pppol2tp.h b/include/linux/if_pppol2tp.h
+index 4113d6a..7ee86b2 100644
+--- a/include/linux/if_pppol2tp.h
++++ b/include/linux/if_pppol2tp.h
+@@ -2,7 +2,7 @@
+  * Linux PPP over L2TP (PPPoL2TP) Socket Implementation (RFC 2661)
+  *
+  * This file supplies definitions required by the PPP over L2TP driver
+- * (pppol2tp.c).  All version information wrt this file is located in pppol2tp.c
++ * (l2tp_ppp.c).  All version information wrt this file is located in l2tp_ppp.c
+  *
+  * License:
+  *		This program is free software; you can redistribute it and/or
+@@ -15,14 +15,14 @@
+ #ifndef __LINUX_IF_PPPOL2TP_H
+ #define __LINUX_IF_PPPOL2TP_H
+ 
+-#include <asm/types.h>
++#include <linux/types.h>
++
+ 
+ /* Structure used to connect() the socket to a particular tunnel UDP
+  * socket.
+  */
+-struct pppol2tp_addr
+-{
+-	pid_t	pid;			/* pid that owns the fd.
++struct pppol2tp_addr {
++	__kernel_pid_t	pid;		/* pid that owns the fd.
+ 					 * 0 => current */
+ 	int	fd;			/* FD of UDP socket to use */
+ 
+@@ -32,6 +32,20 @@ struct pppol2tp_addr
+ 	__u16 d_tunnel, d_session;	/* For sending outgoing packets */
+ };
+ 
++/* The L2TPv3 protocol changes tunnel and session ids from 16 to 32
++ * bits. So we need a different sockaddr structure.
++ */
++struct pppol2tpv3_addr {
++	pid_t	pid;			/* pid that owns the fd.
++					 * 0 => current */
++	int	fd;			/* FD of UDP or IP socket to use */
++
++	struct sockaddr_in addr;	/* IP address and port to send to */
++
++	__u32 s_tunnel, s_session;	/* For matching incoming packets */
++	__u32 d_tunnel, d_session;	/* For sending outgoing packets */
++};
++
+ /* Socket options:
+  * DEBUG	- bitmask of debug message categories
+  * SENDSEQ	- 0 => don't send packets with sequence numbers
diff --git a/meta/recipes-connectivity/ppp/ppp_2.4.5.bb b/meta/recipes-connectivity/ppp/ppp_2.4.5.bb
index 72464bf..80f91e6 100644
--- a/meta/recipes-connectivity/ppp/ppp_2.4.5.bb
+++ b/meta/recipes-connectivity/ppp/ppp_2.4.5.bb
@@ -10,7 +10,7 @@ LIC_FILES_CHKSUM = "file://pppd/ccp.c;beginline=1;endline=29;md5=e2c43fe6e81ff77
                     file://pppd/plugins/passprompt.c;beginline=1;endline=10;md5=3bcbcdbf0e369c9a3e0b8c8275b065d8 \
                     file://pppd/tdb.c;beginline=1;endline=27;md5=4ca3a9991b011038d085d6675ae7c4e6 \
                     file://chat/chat.c;beginline=1;endline=15;md5=0d374b8545ee5c62d7aff1acbd38add2"
-PR = "r2"
+PR = "r3"
 
 SRC_URI = "http://ppp.samba.org/ftp/ppp/ppp-${PV}.tar.gz \
            file://makefile.patch \
@@ -18,6 +18,7 @@ SRC_URI = "http://ppp.samba.org/ftp/ppp/ppp-${PV}.tar.gz \
            file://pppd-resolv-varrun.patch \
            file://enable-ipv6.patch \
            file://makefile-remove-hard-usr-reference.patch \
+           file://update_if_pppol2tp.patch \
            file://pon \
            file://poff \
            file://init \
-- 
1.7.9



