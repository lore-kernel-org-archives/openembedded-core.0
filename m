Return-Path: <jkrishnanjanappa@mvista.com>
Received: from mail-oi0-f47.google.com (mail-oi0-f47.google.com
	[209.85.218.47])
	by mail.openembedded.org (Postfix) with ESMTP id 5DBBB79433
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Aug 2018 13:36:40 +0000 (UTC)
Received: by mail-oi0-f47.google.com with SMTP id b15-v6so3118614oib.10
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Aug 2018 06:36:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=mvista-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=d6FNwcZivnu50MV19+wjxUwiaGmzGHXBOEPAmVPH46A=;
	b=oUjVJFzQiT6UY3RHgfsYXy69txLSDZmformAAcD1XAenqFzvu+4g7s0QHp1gdP59HI
	prDWihVf0vMtjmG/IhBAaiemv/T2tAp2r/xJGLpM4E7b8NilAzL+SbxDH79H2R+Lz9ou
	DD/ZFhW+wPELYjvE5JOR/z8T+Agyub78SMqm16VA2WpGc8ukf7aYF4jFXxjvaYEbrw5j
	ZMHE/WtjsDD3oCqkvpWN5A8pOQ2LqnwCzAz2VS9AS5W/aWHxgzqRd0t5RPTeAIU0UWtp
	rrjCZAtKaP1aqykLoatHdu5I8bFlmnInSfsRXXKymxJRI9nVli89E0GDjTUX3VM1z5k5
	P1Iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=d6FNwcZivnu50MV19+wjxUwiaGmzGHXBOEPAmVPH46A=;
	b=qa0Gi1mD4pHAEzwCASRtQpJfgC4dwjskJrMu6uMzk/MmcH/SPouVUibWkEWsHbUqNN
	lYHq1oRolgFhzBsisHpDaY0UfTfJLd9RpOYwbHSHYql85h7QvSf7i9Nyvyp/kF+aWgBl
	QGfDQv6O4yPi+mcTRxYBgBhqx0Srs6yOxANsAJQFWwcyq0lt6Qa0PR0Z11n3TTU7kS1a
	6A3LZdVht4HB7qeUv7b2/nYzpHV8WE4OSWX1mVvviD/iUP9U/m8xoueiIZTD6Ec8ITOa
	Ype2M9ZhNBZdtgd5WY+3OUqPqmhogUefIIlwP82/ZPpVP8cCLR25L3n5uy/7nUdjpJbb
	PH9w==
X-Gm-Message-State: APzg51ALhAjlXvE8GImKXnCrO/dlHUyMSy+cFRey3gQunQNy6LmYVpLT
	AwAUSagwrA1uqA/l6MjA9OBRYgkxp50=
X-Google-Smtp-Source: ANB0VdaxSUZCkEMtpgDtGDmYbjRPjaQPZjGzPuZiTeZSiEVn8iBcKyPCLyyIWUR3C5kIMjqgfvh2xw==
X-Received: by 2002:aca:45d6:: with SMTP id
	s205-v6mr4130659oia.147.1534945001228; 
	Wed, 22 Aug 2018 06:36:41 -0700 (PDT)
Received: from dell-laptop.mvista.com ([157.49.3.26])
	by smtp.gmail.com with ESMTPSA id
	h186-v6sm3746773oib.55.2018.08.22.06.36.38
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 22 Aug 2018 06:36:40 -0700 (PDT)
From: Jagadeesh Krishnanjanappa <jkrishnanjanappa@mvista.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 22 Aug 2018 19:05:22 +0530
Message-Id: <1534944940-21566-16-git-send-email-jkrishnanjanappa@mvista.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1534944940-21566-1-git-send-email-jkrishnanjanappa@mvista.com>
References: <1534944940-21566-1-git-send-email-jkrishnanjanappa@mvista.com>
Subject: [ROCKO][PATCH V2 16/34] Qemu CVE-2018-11806 slirp-heap-buffer-overflow
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
X-List-Received-Date: Wed, 22 Aug 2018 13:36:40 -0000

From: Jeremy Puhlman <jpuhlman@mvista.com>

slirp: correct size computation while concatenating mbuf

While reassembling incoming fragmented datagrams, 'm_cat' routine
extends the 'mbuf' buffer, if it has insufficient room. It computes
a wrong buffer size, which leads to overwriting adjacent heap buffer
area. Correct this size computation in m_cat.

Affects qemu < 3.0.0

Signed-off-by: Jeremy Puhlman <jpuhlman@mvista.com>
---
 ...018-11806-QEMU-slirp-heap-buffer-overflow.patch | 71 ++++++++++++++++++++++
 meta/recipes-devtools/qemu/qemu_2.10.0.bb          |  1 +
 2 files changed, 72 insertions(+)
 create mode 100644 meta/recipes-devtools/qemu/qemu/0001-CVE-2018-11806-QEMU-slirp-heap-buffer-overflow.patch

diff --git a/meta/recipes-devtools/qemu/qemu/0001-CVE-2018-11806-QEMU-slirp-heap-buffer-overflow.patch b/meta/recipes-devtools/qemu/qemu/0001-CVE-2018-11806-QEMU-slirp-heap-buffer-overflow.patch
new file mode 100644
index 0000000..f09b0bf
--- /dev/null
+++ b/meta/recipes-devtools/qemu/qemu/0001-CVE-2018-11806-QEMU-slirp-heap-buffer-overflow.patch
@@ -0,0 +1,71 @@
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
+
+CVE: CVE-2018-11806
+Upstream-status: Backport [https://github.com/qemu/qemu/commit/864036e251f54c99d31df124aad7f34f01f5344c#diff-de3b23fd63b9e35d35c454525498d51c]
+
+https://lists.gnu.org/archive/html/qemu-devel/2018-06/msg01012.html
+
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
diff --git a/meta/recipes-devtools/qemu/qemu_2.10.0.bb b/meta/recipes-devtools/qemu/qemu_2.10.0.bb
index bdf6c21..89c68f2 100644
--- a/meta/recipes-devtools/qemu/qemu_2.10.0.bb
+++ b/meta/recipes-devtools/qemu/qemu_2.10.0.bb
@@ -30,6 +30,7 @@ SRC_URI = "http://wiki.qemu-project.org/download/${BP}.tar.bz2 \
            file://CVE-2017-14167.patch \
            file://ppc_locking.patch \
            file://memfd.patch \
+           file://0001-CVE-2018-11806-QEMU-slirp-heap-buffer-overflow.patch \
            "
 UPSTREAM_CHECK_REGEX = "qemu-(?P<pver>\d+\..*)\.tar"
 
-- 
2.7.4


