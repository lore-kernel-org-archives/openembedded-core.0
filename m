Return-Path: <jpuhlman@mvista.com>
Received: from mail-pg0-f65.google.com (mail-pg0-f65.google.com [74.125.83.65])
	by mail.openembedded.org (Postfix) with ESMTP id BC5CA789AA
	for <openembedded-core@lists.openembedded.org>;
	Thu, 14 Jun 2018 03:45:55 +0000 (UTC)
Received: by mail-pg0-f65.google.com with SMTP id l2-v6so2252631pgc.7
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Jun 2018 20:45:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=mvista-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id;
	bh=mDo1MZQnfXhVq54DFxElLtd+NxntRUgrfmuNJ+65ioQ=;
	b=UDfF+rtHBmkeelrBOgJqd3ksvEEySudC8yr6LkYQgTvWhtyGQLM+1kGl/7Nhn/Ac29
	0JolgZyGh0zXvwz9QkNuKUY9IZlK4I8N7tQS5RjJcaRaI8wo+73IXrgMR1YK4zjg4ZLp
	p1u0dxSJUud+3xxm2xaoue8dlMv5S3yP4fq+UGreoYUHQiINsS9+N0LKa94+RVlZZ+PV
	Kr45CFwEB0BZ1UeYpsfXyaOcPS0EZaxadBBJAj8f4cMIv0TZKDhJZT9/agxh3K4ryCfa
	Zti2ggmcM2WzF0ydDCnzh60kDish+sdiGj4aVPn2Vgung2ugB9wYayjkNUW2MVj3u+vE
	eBaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=mDo1MZQnfXhVq54DFxElLtd+NxntRUgrfmuNJ+65ioQ=;
	b=fUBlA7u04W7/rqVv5C47U4P6AN+gUXDhsSG1NHZMx9zjyJuzW7zDWQ3H+jcT/8ahc3
	Cmie6ey74Moxz1EN/sYJAe8DMIa1S/MBssOl5HSTk3zghvHakK+Rsw3eMkJMb2kzN8Xd
	YhU44NV3ijt5lZ9TT02aD29A+6ywX5AKGiKJNljnhVeGdiucZn10dH8/j4qkVjCP0iQA
	JnIeeJQa1lGbMx7FjeSfC5/BkjCcV4j2Fid4V/ge7s7i6s7yAkXL+TsxP9KWATWVtVm5
	6eBGpZIxotfgOVOfgrbtlWPd4NAWiT+mgrbzToMjpYOWe+bk0C3oc3X2OelmZwnFTq7l
	Ep4A==
X-Gm-Message-State: APt69E2IXAQEgRInzZJdGCLY7MXZpXt0e+7/L4k3tmBvz8RX2KWSKkgv
	9jtqcaPKYVAF1oUIeo8gwPDsVKs1dqs=
X-Google-Smtp-Source: ADUXVKKfqqNbI8zulKM7kjmUoiSHLL0QouzUMNgVERpVBP7U2DsvzjxaKuV35fv0g8GSWykrei+5Vw==
X-Received: by 2002:a65:4081:: with SMTP id t1-v6mr819268pgp.32.1528947956672; 
	Wed, 13 Jun 2018 20:45:56 -0700 (PDT)
Received: from jptest02.mvista.com (64.2.3.196.ptr.us.xo.net. [64.2.3.196])
	by smtp.gmail.com with ESMTPSA id
	s1-v6sm4846831pgv.48.2018.06.13.20.45.55
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 13 Jun 2018 20:45:56 -0700 (PDT)
From: Jeremy Puhlman <jpuhlman@mvista.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 13 Jun 2018 20:43:03 -0700
Message-Id: <20180614034303.18252-1-jpuhlman@mvista.com>
X-Mailer: git-send-email 2.14.1.459.g238e487
Subject: [PATCH][sumo] Qemu: CVE-2018-11806 slirp-heap-buffer-overflow
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
X-List-Received-Date: Thu, 14 Jun 2018 03:45:55 -0000

Signed-off-by: Jeremy Puhlman <jpuhlman@mvista.com>
---
 ...018-11806-QEMU-slirp-heap-buffer-overflow.patch | 65 ++++++++++++++++++++++
 meta/recipes-devtools/qemu/qemu_2.11.1.bb          |  1 +
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
diff --git a/meta/recipes-devtools/qemu/qemu_2.11.1.bb b/meta/recipes-devtools/qemu/qemu_2.11.1.bb
index f4b7d69fca..5dc3934f62 100644
--- a/meta/recipes-devtools/qemu/qemu_2.11.1.bb
+++ b/meta/recipes-devtools/qemu/qemu_2.11.1.bb
@@ -22,6 +22,7 @@ SRC_URI = "http://wiki.qemu-project.org/download/${BP}.tar.bz2 \
            file://linux-user-Fix-webkitgtk-hangs-on-32-bit-x86-target.patch \
            file://memfd.patch \
            file://0001-arm-translate-a64-treat-DISAS_UPDATE-as-variant-of-D.patch \
+           file://0001-CVE-2018-11806-QEMU-slirp-heap-buffer-overflow.patch \
            "
 UPSTREAM_CHECK_REGEX = "qemu-(?P<pver>\d+\..*)\.tar"
 
-- 
2.14.1.459.g238e487


