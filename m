Return-Path: <jpuhlman@mvista.com>
Received: from mail-pf0-f194.google.com (mail-pf0-f194.google.com
	[209.85.192.194])
	by mail.openembedded.org (Postfix) with ESMTP id B89927541E
	for <openembedded-core@lists.openembedded.org>;
	Thu, 14 Jun 2018 18:07:53 +0000 (UTC)
Received: by mail-pf0-f194.google.com with SMTP id q1-v6so3613347pff.13
	for <openembedded-core@lists.openembedded.org>;
	Thu, 14 Jun 2018 11:07:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=mvista-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id;
	bh=FUPIg2NFBk10I2sQVRVj2aXHWysKYIflgS3lubFnGy0=;
	b=luPuGdG4MBsCSYGwDTFmofkY01TkHsEzEcahSb7igV3Pm3V4UQx8pKW//UpvXdRxsm
	dYQVHdXJ4v9Yam7bWJvt7raNEsFd8Obk6OH8sYUry/GLHzCq9/RmBcZdtw+7t7LI2yl+
	rg6hHTrPQiKLIOqKRrLr9D051A46zUf0daI3aqINEoE5rYfikIBpYh9Ttvmz80pMNrMh
	BhMXu5F6LX8c0+7UWaN1XnWAeiUc8z52jg3JTOuGrswmbBjeT2nrXU1va0olckgxmBB8
	jR63OXNspKfWDaSu8W04Sa2YGX+zthjdjQPFFgUHt7KInAnvtC7u7RsdJoeADLBbx5O/
	AKag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=FUPIg2NFBk10I2sQVRVj2aXHWysKYIflgS3lubFnGy0=;
	b=IfJ8PfIxg52Xs7ceA8sbB9u2sE+2+Wtj/rNf8LMegT1PrKnYJAgaZ5wVL+zmmAZogI
	bhWRD5sfqUAX80nmRdyPbBiSLi/OeRvruIdxP/8/HpI2Mg2HRYb/z14er7sZgUFAyqnM
	gZHxlFdN9lzN835Jw3rrzoQVVof4h6SdS6ljenzu3qYOXgzx4bi18Ht41lj4hSxjquvi
	follO1hqMun5O38UP8ZDTHTgVC7sPHqG7H9uIJjKOBbVzAQSUGQDB5mZHcHS1A8TjwJz
	anmUIIg+4SgeGF+z8uLQNcLYqqq4qdSaOYGvV3wi99R0X4EpcgrJklLAC6s91Z33yRqu
	r0eA==
X-Gm-Message-State: APt69E2VS1kOWl7g0z5LVOD2FN8qeAeJTYpoPqR6GhH5UMBDyVgGGfq2
	hXuLhUSOUNKLhhaDNfqWYKP5Ov45VYU=
X-Google-Smtp-Source: ADUXVKJQGQIeRnfQipg7l62u+1ji+o6yB69H0rBOsTAntdouzM5bIqoaQDeedVE9dYy2/byaoOfiBA==
X-Received: by 2002:a65:5884:: with SMTP id
	d4-v6mr3131622pgu.292.1528999674639; 
	Thu, 14 Jun 2018 11:07:54 -0700 (PDT)
Received: from jptest02.mvista.com (64.2.3.196.ptr.us.xo.net. [64.2.3.196])
	by smtp.gmail.com with ESMTPSA id
	f11-v6sm6940699pgq.18.2018.06.14.11.07.53
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 14 Jun 2018 11:07:53 -0700 (PDT)
From: Jeremy Puhlman <jpuhlman@mvista.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 14 Jun 2018 11:04:55 -0700
Message-Id: <20180614180455.8161-1-jpuhlman@mvista.com>
X-Mailer: git-send-email 2.14.1.459.g238e487
Subject: [PATCH v2][sumo] Qemu: CVE-2018-11806 slirp-heap-buffer-overflow
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
X-List-Received-Date: Thu, 14 Jun 2018 18:07:53 -0000

Signed-off-by: Jeremy Puhlman <jpuhlman@mvista.com>
---
 ...018-11806-QEMU-slirp-heap-buffer-overflow.patch | 69 ++++++++++++++++++++++
 meta/recipes-devtools/qemu/qemu_2.11.1.bb          |  1 +
 2 files changed, 70 insertions(+)
 create mode 100644 meta/recipes-devtools/qemu/qemu/0001-CVE-2018-11806-QEMU-slirp-heap-buffer-overflow.patch

diff --git a/meta/recipes-devtools/qemu/qemu/0001-CVE-2018-11806-QEMU-slirp-heap-buffer-overflow.patch b/meta/recipes-devtools/qemu/qemu/0001-CVE-2018-11806-QEMU-slirp-heap-buffer-overflow.patch
new file mode 100644
index 0000000000..8622360114
--- /dev/null
+++ b/meta/recipes-devtools/qemu/qemu/0001-CVE-2018-11806-QEMU-slirp-heap-buffer-overflow.patch
@@ -0,0 +1,69 @@
+Upstream-Status: Backport
+
+https://lists.gnu.org/archive/html/qemu-devel/2018-06/msg01012.html
+
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


