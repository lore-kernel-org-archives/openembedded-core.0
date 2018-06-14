Return-Path: <jpuhlman@mvista.com>
Received: from mail-pg0-f66.google.com (mail-pg0-f66.google.com [74.125.83.66])
	by mail.openembedded.org (Postfix) with ESMTP id 111BA78883
	for <openembedded-core@lists.openembedded.org>;
	Thu, 14 Jun 2018 03:38:49 +0000 (UTC)
Received: by mail-pg0-f66.google.com with SMTP id p21-v6so2241959pgd.11
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Jun 2018 20:38:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=mvista-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id;
	bh=IOAmJH/wI1QAfANtr3S/+Gd2wu18x7lLT9lYhPy/vHE=;
	b=VEHUiFtokWxj58B7TiBCABtYAIKVySuILGT06TZUd7519/agfajSGFWrvJvkRQOCND
	3wYtLifCYwTnmhk6HTy0nXK+ZEoB5UW1BVB5PeLgcZhVxmEJSu4oh1/uJpqIBY/piPbb
	zwgN1W5g4bIDBZU7pTBeVI7EKq82L0c+5YkUoRqygE9d+Jfvt9zbtYRKe6/uhaP103GB
	/tDGTeZV4BzHNKyV4VbKDGErtz8FuYaXded/H5dGbGXPSOa4VtcsPMKSMscy6ggdeJQo
	y9hGtHAl+cl0Bh9zqgYoQjCCz/VT+BygYXUnb4cD4b2XZ8YHXxU53glswRlwDSXWjcmY
	f6nA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=IOAmJH/wI1QAfANtr3S/+Gd2wu18x7lLT9lYhPy/vHE=;
	b=f47gBCd10ObF2/x/2bu/kEarHiCdj4EPT5I5CePUzBgsqPt2DosLwMf11wQKAceY9h
	iKjoGEYBJsWmp0mhYLbjTiOOfUMUVCqNk4nyf7ycvsGm4IOHF/T0LWDRYaRrGkY/oqHo
	kLd0XQEBE5I1vwhT94AVzNe8SJRXQPopu9zEO7IwYOk1p/QHpXU6yOvtODKpsJzNeOPg
	Evq4sqvcMClT3fDwTuKjLy40lbtiiROYykcwmTvjBqU4HwpcQhcLIm4ahMZ8SEj7JA5R
	6sqcIq13guqsuf7Yjh3Gkhr3UNaCe0V00oE53RsNHGEflhLDUldMSxE51AWzf42DToe4
	Ckaw==
X-Gm-Message-State: APt69E31o+di9ALWSU4w+EwV1yRV00649MEfQtH2mJfFyODOBbF8Aks6
	5IflZ1w9DBQ2rZsoImWUiNNkIC3lYyg=
X-Google-Smtp-Source: ADUXVKLa3OJLBbniNGoe7jkyyhgxCboghUHFf5HWeB6sLYv1LT6gTHpjMY4wYvR3CjixkZrsF0sHtQ==
X-Received: by 2002:a63:12:: with SMTP id 18-v6mr776649pga.121.1528947531007; 
	Wed, 13 Jun 2018 20:38:51 -0700 (PDT)
Received: from jptest02.mvista.com (64.2.3.196.ptr.us.xo.net. [64.2.3.196])
	by smtp.gmail.com with ESMTPSA id
	b22-v6sm5779924pfi.144.2018.06.13.20.38.50
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 13 Jun 2018 20:38:50 -0700 (PDT)
From: Jeremy Puhlman <jpuhlman@mvista.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 13 Jun 2018 20:35:54 -0700
Message-Id: <20180614033554.17470-1-jpuhlman@mvista.com>
X-Mailer: git-send-email 2.14.1.459.g238e487
Subject: [PATCH] Qemu: CVE-2018-11806 slirp heap buffer overflow
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
X-List-Received-Date: Thu, 14 Jun 2018 03:38:50 -0000

---
 ...018-11806-QEMU-slirp-heap-buffer-overflow.patch | 65 ++++++++++++++++++++++
 meta/recipes-devtools/qemu/qemu_2.12.0.bb          |  1 +
 2 files changed, 66 insertions(+)
 create mode 100644 meta/recipes-devtools/qemu/qemu/0001-CVE-2018-11806-QEMU-slirp-heap-buffer-overflow.patch

diff --git a/meta/recipes-devtools/qemu/qemu/0001-CVE-2018-11806-QEMU-slirp-heap-buffer-overflow.patch b/meta/recipes-devtools/qemu/qemu/0001-CVE-2018-11806-QEMU-slirp-heap-buffer-overflow.patch
new file mode 100644
index 0000000000..002a1332bf
--- /dev/null
+++ b/meta/recipes-devtools/qemu/qemu/0001-CVE-2018-11806-QEMU-slirp-heap-buffer-overflow.patch
@@ -0,0 +1,65 @@
+From dc21a9d2951f0a2a7e63633e2b5c68c54e4edc4b Mon Sep 17 00:00:00 2001
+From: Jeremy Puhlman <jpuhlman@mvista.com>
+Date: Thu, 14 Jun 2018 01:28:49 +0000
+Subject: [PATCH] CVE-2018-11806 QEMU: slirp: heap buffer overflow
+
+Subject: [Qemu-devel] [PATCH 1/2] slirp: correct size computation while concatenating mbuf
+Date:	Tue, 5 Jun 2018 23:38:35 +0530
+From: Prasad J Pandit <address@hidden>
+
+While reassembling incoming fragmented datagrams, 'm_cat' routine
+extends the 'mbuf' buffer, if it has insufficient room. It computes
+a wrong buffer size, which leads to overwriting adjacent heap buffer
+area. Correct this size computation in m_cat.
+
+Reported-by: ZDI Disclosures <address@hidden>
+Signed-off-by: Prasad J Pandit <address@hidden>
+---
+ slirp/mbuf.c | 8 ++++----
+ 1 file changed, 4 insertions(+), 4 deletions(-)
+
+Signed-off-by: Jeremy Puhlman <jpuhlman@mvista.com>
+---
+ slirp/mbuf.c | 8 ++++----
+ 1 file changed, 4 insertions(+), 4 deletions(-)
+
+diff --git a/slirp/mbuf.c b/slirp/mbuf.c
+index 5ff2455..7fb4501 100644
+--- a/slirp/mbuf.c
++++ b/slirp/mbuf.c
+@@ -138,7 +138,7 @@ m_cat(struct mbuf *m, struct mbuf *n)
+ 	 * If there's no room, realloc
+ 	 */
+ 	if (M_FREEROOM(m) < n->m_len)
+-		m_inc(m,m->m_size+MINCSIZE);
++               m_inc(m, m->m_len + n->m_len);
+ 
+ 	memcpy(m->m_data+m->m_len, n->m_data, n->m_len);
+ 	m->m_len += n->m_len;
+@@ -158,12 +158,12 @@ m_inc(struct mbuf *m, int size)
+ 
+         if (m->m_flags & M_EXT) {
+ 	  datasize = m->m_data - m->m_ext;
+-          m->m_ext = g_realloc(m->m_ext, size);
++          m->m_ext = g_realloc(m->m_ext, size + datasize);
+ 	  m->m_data = m->m_ext + datasize;
+         } else {
+ 	  char *dat;
+ 	  datasize = m->m_data - m->m_dat;
+-          dat = g_malloc(size);
++          dat = g_malloc(size + datasize);
+ 	  memcpy(dat, m->m_dat, m->m_size);
+ 
+ 	  m->m_ext = dat;
+@@ -171,7 +171,7 @@ m_inc(struct mbuf *m, int size)
+ 	  m->m_flags |= M_EXT;
+         }
+ 
+-        m->m_size = size;
++        m->m_size = size + datasize;
+ 
+ }
+ 
+-- 
+2.13.3
+
diff --git a/meta/recipes-devtools/qemu/qemu_2.12.0.bb b/meta/recipes-devtools/qemu/qemu_2.12.0.bb
index 21796df9d7..98db44a8ef 100644
--- a/meta/recipes-devtools/qemu/qemu_2.12.0.bb
+++ b/meta/recipes-devtools/qemu/qemu_2.12.0.bb
@@ -21,6 +21,7 @@ SRC_URI = "http://wiki.qemu-project.org/download/${BP}.tar.bz2 \
            file://0009-apic-fixup-fallthrough-to-PIC.patch \
            file://0010-linux-user-Fix-webkitgtk-hangs-on-32-bit-x86-target.patch \
            file://0011-Revert-linux-user-fix-mmap-munmap-mprotect-mremap-sh.patch \
+           file://0001-CVE-2018-11806-QEMU-slirp-heap-buffer-overflow.patch \
            "
 UPSTREAM_CHECK_REGEX = "qemu-(?P<pver>\d+\..*)\.tar"
 
-- 
2.14.1.459.g238e487


