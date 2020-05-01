Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
 by mx.groups.io with SMTP id smtpd.web10.4780.1588369277814396001
 for <openembedded-core@lists.openembedded.org>;
 Fri, 01 May 2020 14:41:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@stusta.de header.s=default header.b=Kp/cyVJf;
 spf=pass (domain: stusta.mhn.de, ip: 141.84.69.5, mailfrom: srs0=4yvm=6p=stusta.de=bunk@stusta.mhn.de)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 49DQfy1FjYz4Q
	for <openembedded-core@lists.openembedded.org>; Fri,  1 May 2020 23:41:13 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1588369274;
	bh=f6BZAt6qRGXgLZ40QGV4R2OricR9bePIU3eBuvITzlM=;
	h=From:To:Subject:Date:From;
	b=Kp/cyVJfozSQx8xxHqZvrQODPxh/b82ay0GCuqvZXVSc2o/u+QU8KYwLZb36MKhl9
	 vAhBc0SRAXA6RQMe4e4bc8twPtJJcXQmpVHufgEQlm/qb8MLQVkxyPIioPhC39yxse
	 UpArKBTFWp7IhTAcS+QET3djhzlDmvovetsbW8INtB52Gq+EQgLUbIDmXVV+VwMiHq
	 /cvhhMoJDUCTxgmOVz5MxPgHAudr+N24KDOnvDjlAu4/m5DFDeLKZ1JojzDkm33S3l
	 zvlQh/Eufv0xMcjCVuVT8VyiirpUk1aKfOy9bkqKgj2dFWvJykCqQYLhXqxcwJWBK8
	 4AxA/9rp0FXV+rUanQLblChjTi96z5HQIbP5K7NYKRQyYgrjogFZnzGNB4NJywCvru
	 TOaqLyToZ5N/jN0R6kJNdkEIfp3UoeKkv5Gm5WsTcf29lyJwyZ8k4okBb9YfwtkIWk
	 ILnDkScVHY7ijjnXRry4UiD+mR7TjG6QmHvSllyrxPm1wB6/5zYgJyoujdALRWvHpc
	 yIEoM2Kj01V62o/JxRK3jVgFiuTi9h2qLYtqEzJYwcgno/jh3OdV9sqgCMFkk95IgJ
	 V3j5KZFlEB7WFzwa2BXIS6YmFwT+3jBxA0xRuJ07ytm4UdB5NDZyNz+1JObkZ/gwB/
	 nZJtgBblXLuW0Tutg7KuFBtA=
From: "Adrian Bunk" <bunk@stusta.de>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][zeus][PATCH] qemu: fix CVE-2020-7039
Date: Sat,  2 May 2020 00:41:12 +0300
Message-Id: <20200501214113.23843-1-bunk@stusta.de>
X-Mailer: git-send-email 2.17.1

From: Changqing Li <changqing.li@windriver.com>

(From OE-Core rev: 5ea3d9d83ed695827634e3216664c13fcff6d48a)

Signed-off-by: Changqing Li <changqing.li@windriver.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Adrian Bunk <bunk@stusta.de>
---
 meta/recipes-devtools/qemu/qemu.inc           |  3 +
 .../qemu/qemu/CVE-2020-7039-1.patch           | 44 +++++++++++++
 .../qemu/qemu/CVE-2020-7039-2.patch           | 59 +++++++++++++++++
 .../qemu/qemu/CVE-2020-7039-3.patch           | 64 +++++++++++++++++++
 4 files changed, 170 insertions(+)
 create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2020-7039-1.patch
 create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2020-7039-2.patch
 create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2020-7039-3.patch

diff --git a/meta/recipes-devtools/qemu/qemu.inc b/meta/recipes-devtools/qemu/qemu.inc
index f451017f6d..119530f7e6 100644
--- a/meta/recipes-devtools/qemu/qemu.inc
+++ b/meta/recipes-devtools/qemu/qemu.inc
@@ -31,6 +31,9 @@ SRC_URI = "https://download.qemu.org/${BPN}-${PV}.tar.xz \
            file://CVE-2019-12068.patch \
            file://CVE-2020-1711.patch \
            file://CVE-2019-20382.patch \
+           file://CVE-2020-7039-1.patch \
+           file://CVE-2020-7039-2.patch \
+           file://CVE-2020-7039-3.patch \
 	   "
 UPSTREAM_CHECK_REGEX = "qemu-(?P<pver>\d+(\.\d+)+)\.tar"
 
diff --git a/meta/recipes-devtools/qemu/qemu/CVE-2020-7039-1.patch b/meta/recipes-devtools/qemu/qemu/CVE-2020-7039-1.patch
new file mode 100644
index 0000000000..df6bca6db6
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
index 0000000000..4a00fa2afd
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
index 0000000000..70ce480d80
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
2.17.1

