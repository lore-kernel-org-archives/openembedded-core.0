Return-Path: <Changqing.Li@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id B6F1E611CA
	for <openembedded-core@lists.openembedded.org>;
	Thu, 27 Feb 2020 05:25:50 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.2) with ESMTPS id 01R5Pmh9023653
	(version=TLSv1 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 26 Feb 2020 21:25:48 -0800 (PST)
Received: from pek-lpg-core2.corp.ad.wrs.com (128.224.153.41) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.468.0; Wed, 26 Feb 2020 21:25:48 -0800
From: <changqing.li@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 27 Feb 2020 13:25:46 +0800
Message-ID: <1582781146-253903-1-git-send-email-changqing.li@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Subject: [PATCH] qemu: fix CVE-2020-7039
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
X-List-Received-Date: Thu, 27 Feb 2020 05:25:50 -0000
Content-Type: text/plain

From: Changqing Li <changqing.li@windriver.com>

Signed-off-by: Changqing Li <changqing.li@windriver.com>
---
 meta/recipes-devtools/qemu/qemu.inc                |  3 +
 .../qemu/qemu/CVE-2020-7039-1.patch                | 44 +++++++++++++++
 .../qemu/qemu/CVE-2020-7039-2.patch                | 59 ++++++++++++++++++++
 .../qemu/qemu/CVE-2020-7039-3.patch                | 64 ++++++++++++++++++++++
 4 files changed, 170 insertions(+)
 create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2020-7039-1.patch
 create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2020-7039-2.patch
 create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2020-7039-3.patch

diff --git a/meta/recipes-devtools/qemu/qemu.inc b/meta/recipes-devtools/qemu/qemu.inc
index a557e74..a9d5278 100644
--- a/meta/recipes-devtools/qemu/qemu.inc
+++ b/meta/recipes-devtools/qemu/qemu.inc
@@ -29,6 +29,9 @@ SRC_URI = "https://download.qemu.org/${BPN}-${PV}.tar.xz \
            file://0010-configure-Add-pkg-config-handling-for-libgcrypt.patch \
            file://0011-hw-i386-pc-fix-regression-in-parsing-vga-cmdline-par.patch \
            file://CVE-2019-15890.patch \
+           file://CVE-2020-7039-1.patch \
+           file://CVE-2020-7039-2.patch \
+           file://CVE-2020-7039-3.patch \
            "
 UPSTREAM_CHECK_REGEX = "qemu-(?P<pver>\d+(\.\d+)+)\.tar"
 
diff --git a/meta/recipes-devtools/qemu/qemu/CVE-2020-7039-1.patch b/meta/recipes-devtools/qemu/qemu/CVE-2020-7039-1.patch
new file mode 100644
index 0000000..df6bca6
--- /dev/null
+++ b/meta/recipes-devtools/qemu/qemu/CVE-2020-7039-1.patch
@@ -0,0 +1,44 @@
+From b2663d527a1992ba98c0266458b21ada3b9d0d2e Mon Sep 17 00:00:00 2001
+From: Changqing Li <changqing.li@windriver.com>
+Date: Thu, 27 Feb 2020 12:07:35 +0800
+Subject: [PATCH] tcp_emu: Fix oob access
+
+The main loop only checks for one available byte, while we sometimes
+need two bytes.
+
+CVE: CVE-2020-7039
+Upstream-Status: Backport
+[https://gitlab.freedesktop.org/slirp/libslirp/commit/2655fffed7a9e765bcb4701dd876e9dab975f289]
+
+Signed-off-by: Changqing Li <changqing.li@windriver.com>
+---
+ slirp/src/tcp_subr.c | 6 ++++++
+ 1 file changed, 6 insertions(+)
+
+diff --git a/slirp/src/tcp_subr.c b/slirp/src/tcp_subr.c
+index d6dd133..4bea2d4 100644
+--- a/slirp/src/tcp_subr.c
++++ b/slirp/src/tcp_subr.c
+@@ -886,6 +886,8 @@ int tcp_emu(struct socket *so, struct mbuf *m)
+                 break;
+ 
+             case 5:
++                if (bptr == m->m_data + m->m_len - 1)
++                        return 1; /* We need two bytes */
+                 /*
+                  * The difference between versions 1.0 and
+                  * 2.0 is here. For future versions of
+@@ -901,6 +903,10 @@ int tcp_emu(struct socket *so, struct mbuf *m)
+                 /* This is the field containing the port
+                  * number that RA-player is listening to.
+                  */
++
++                if (bptr == m->m_data + m->m_len - 1)
++                        return 1; /* We need two bytes */
++
+                 lport = (((uint8_t *)bptr)[0] << 8) + ((uint8_t *)bptr)[1];
+                 if (lport < 6970)
+                     lport += 256; /* don't know why */
+-- 
+2.7.4
+
diff --git a/meta/recipes-devtools/qemu/qemu/CVE-2020-7039-2.patch b/meta/recipes-devtools/qemu/qemu/CVE-2020-7039-2.patch
new file mode 100644
index 0000000..4a00fa2
--- /dev/null
+++ b/meta/recipes-devtools/qemu/qemu/CVE-2020-7039-2.patch
@@ -0,0 +1,59 @@
+From 8f67e76e4148e37f3d8d2bcbdee7417fdedb7669 Mon Sep 17 00:00:00 2001
+From: Changqing Li <changqing.li@windriver.com>
+Date: Thu, 27 Feb 2020 12:10:34 +0800
+Subject: [PATCH] slirp: use correct size while emulating commands
+
+While emulating services in tcp_emu(), it uses 'mbuf' size
+'m->m_size' to write commands via snprintf(3). Use M_FREEROOM(m)
+size to avoid possible OOB access.
+Signed-off-by: default avatarPrasad J Pandit <pjp@fedoraproject.org>
+Signed-off-by: Samuel Thibault's avatarSamuel Thibault
+<samuel.thibault@ens-lyon.org>
+Message-Id: <20200109094228.79764-3-ppandit@redhat.com>
+
+CVE: CVE-2020-7039
+Upstream-Status: Backport
+[https://gitlab.freedesktop.org/slirp/libslirp/commit/82ebe9c370a0e2970fb5695aa19aa5214a6a1c80]
+
+Signed-off-by: Changqing Li <changqing.li@windriver.com>
+---
+ slirp/src/tcp_subr.c | 9 ++++-----
+ 1 file changed, 4 insertions(+), 5 deletions(-)
+
+diff --git a/slirp/src/tcp_subr.c b/slirp/src/tcp_subr.c
+index 4bea2d4..e8ed4ef 100644
+--- a/slirp/src/tcp_subr.c
++++ b/slirp/src/tcp_subr.c
+@@ -696,7 +696,7 @@ int tcp_emu(struct socket *so, struct mbuf *m)
+             n4 = (laddr & 0xff);
+ 
+             m->m_len = bptr - m->m_data; /* Adjust length */
+-            m->m_len += snprintf(bptr, m->m_size - m->m_len,
++            m->m_len += snprintf(bptr, M_FREEROOM(m),
+                                  "ORT %d,%d,%d,%d,%d,%d\r\n%s", n1, n2, n3, n4,
+                                  n5, n6, x == 7 ? buff : "");
+             return 1;
+@@ -731,8 +731,7 @@ int tcp_emu(struct socket *so, struct mbuf *m)
+             n4 = (laddr & 0xff);
+ 
+             m->m_len = bptr - m->m_data; /* Adjust length */
+-            m->m_len +=
+-                snprintf(bptr, m->m_size - m->m_len,
++            m->m_len += snprintf(bptr, M_FREEROOM(m),
+                          "27 Entering Passive Mode (%d,%d,%d,%d,%d,%d)\r\n%s",
+                          n1, n2, n3, n4, n5, n6, x == 7 ? buff : "");
+ 
+@@ -758,8 +757,8 @@ int tcp_emu(struct socket *so, struct mbuf *m)
+         if (m->m_data[m->m_len - 1] == '\0' && lport != 0 &&
+             (so = tcp_listen(slirp, INADDR_ANY, 0, so->so_laddr.s_addr,
+                              htons(lport), SS_FACCEPTONCE)) != NULL)
+-            m->m_len =
+-                snprintf(m->m_data, m->m_size, "%d", ntohs(so->so_fport)) + 1;
++            m->m_len = snprintf(m->m_data, M_ROOM(m),
++                                "%d", ntohs(so->so_fport)) + 1;
+         return 1;
+ 
+     case EMU_IRC:
+-- 
+2.7.4
+
diff --git a/meta/recipes-devtools/qemu/qemu/CVE-2020-7039-3.patch b/meta/recipes-devtools/qemu/qemu/CVE-2020-7039-3.patch
new file mode 100644
index 0000000..70ce480
--- /dev/null
+++ b/meta/recipes-devtools/qemu/qemu/CVE-2020-7039-3.patch
@@ -0,0 +1,64 @@
+From 0b03959b72036afce151783720d9e54988cf76ef Mon Sep 17 00:00:00 2001
+From: Changqing Li <changqing.li@windriver.com>
+Date: Thu, 27 Feb 2020 12:15:04 +0800
+Subject: [PATCH] slirp: use correct size while emulating IRC commands
+
+While emulating IRC DCC commands, tcp_emu() uses 'mbuf' size
+'m->m_size' to write DCC commands via snprintf(3). This may
+lead to OOB write access, because 'bptr' points somewhere in
+the middle of 'mbuf' buffer, not at the start. Use M_FREEROOM(m)
+size to avoid OOB access.
+Reported-by: default avatarVishnu Dev TJ <vishnudevtj@gmail.com>
+Signed-off-by: default avatarPrasad J Pandit <pjp@fedoraproject.org>
+Reviewed-by: Samuel Thibault's avatarSamuel Thibault
+<samuel.thibault@ens-lyon.org>
+Message-Id: <20200109094228.79764-2-ppandit@redhat.com>
+
+CVE: CVE-2020-7039
+Upstream-Status: Backport
+[https://gitlab.freedesktop.org/slirp/libslirp/commit/ce131029d6d4a405cb7d3ac6716d03e58fb4a5d9]
+
+Signed-off-by: Changqing Li <changqing.li@windriver.com>
+---
+ slirp/src/tcp_subr.c | 11 ++++++-----
+ 1 file changed, 6 insertions(+), 5 deletions(-)
+
+diff --git a/slirp/src/tcp_subr.c b/slirp/src/tcp_subr.c
+index e8ed4ef..3a4a8ee 100644
+--- a/slirp/src/tcp_subr.c
++++ b/slirp/src/tcp_subr.c
+@@ -777,7 +777,8 @@ int tcp_emu(struct socket *so, struct mbuf *m)
+                 return 1;
+             }
+             m->m_len = bptr - m->m_data; /* Adjust length */
+-            m->m_len += snprintf(bptr, m->m_size, "DCC CHAT chat %lu %u%c\n",
++            m->m_len += snprintf(bptr, M_FREEROOM(m),
++                                 "DCC CHAT chat %lu %u%c\n",
+                                  (unsigned long)ntohl(so->so_faddr.s_addr),
+                                  ntohs(so->so_fport), 1);
+         } else if (sscanf(bptr, "DCC SEND %256s %u %u %u", buff, &laddr, &lport,
+@@ -787,8 +788,8 @@ int tcp_emu(struct socket *so, struct mbuf *m)
+                 return 1;
+             }
+             m->m_len = bptr - m->m_data; /* Adjust length */
+-            m->m_len +=
+-                snprintf(bptr, m->m_size, "DCC SEND %s %lu %u %u%c\n", buff,
++            m->m_len += snprintf(bptr, M_FREEROOM(m),
++                         "DCC SEND %s %lu %u %u%c\n", buff,
+                          (unsigned long)ntohl(so->so_faddr.s_addr),
+                          ntohs(so->so_fport), n1, 1);
+         } else if (sscanf(bptr, "DCC MOVE %256s %u %u %u", buff, &laddr, &lport,
+@@ -798,8 +799,8 @@ int tcp_emu(struct socket *so, struct mbuf *m)
+                 return 1;
+             }
+             m->m_len = bptr - m->m_data; /* Adjust length */
+-            m->m_len +=
+-                snprintf(bptr, m->m_size, "DCC MOVE %s %lu %u %u%c\n", buff,
++            m->m_len += snprintf(bptr, M_FREEROOM(m),
++                         "DCC MOVE %s %lu %u %u%c\n", buff,
+                          (unsigned long)ntohl(so->so_faddr.s_addr),
+                          ntohs(so->so_fport), n1, 1);
+         }
+-- 
+2.7.4
+
-- 
2.7.4


