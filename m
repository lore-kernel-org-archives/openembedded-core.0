Return-Path: <jkrishnanjanappa@mvista.com>
Received: from mail-oi0-f45.google.com (mail-oi0-f45.google.com
	[209.85.218.45])
	by mail.openembedded.org (Postfix) with ESMTP id CE92E79487
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Aug 2018 15:09:35 +0000 (UTC)
Received: by mail-oi0-f45.google.com with SMTP id y207-v6so3661207oie.13
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Aug 2018 08:09:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=mvista-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=ujbz8tefcpfv2E5EUiBrch4Og9zmQJTSZswOqkiJEx4=;
	b=usMjBU3v+HsQ4RstcLxSz+rpxaqEo83A6bnSZBXQTKqHPxUkrjP3Eibx5zruFy8L6J
	8JaUvrc8yGl/NBawRK7nk0+93e5M9SL+FxvDO7K9cyKZs3G0I0vu8CEjAtXD/InrFFxa
	JE0gm6W/xuJisDJ5Q3JGnarSsZfUHxcrZJ2nrxjrzQFL1WhxlMCd4IPCkglkRvYSqeV0
	44c8m4G8tK8CzjLeqPATa8FZH9GaSQAu8oNhiiMoksGFNKtyjZ0fTLBczPCW0ylHBpB1
	Cr4Wn1h4NbW/67GksxTL8JVilozroqIOtPXkDfrZleqI8VvLXGgKdkyvORU9FZPvveME
	8ecw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=ujbz8tefcpfv2E5EUiBrch4Og9zmQJTSZswOqkiJEx4=;
	b=QS5fqaSd5oGlzHpBsBl+8Fm1rYd2RMZQTV4bUKBMJfnGTvDPrVrDEVjtaTkQ5B1eit
	EfVpLILn9DRKpbGPEx8kGqB3gamJhs40CDDXQnAEV56qw+vsC2pVk3ifkh+nq6Nb+Duc
	heRbhJFc32Iwv2VLI71c2YFp2C39g3GxpAa3NXGdsNpLT7sPHsR1O4hU682g/Sjug6qd
	m56hMo9aQ4nMTwKTSqhhnHx5jOSAZPF4SIPZy7Jt75Fp+FcL4dtKWtynDbWDzmdq4eDP
	ReJWGoL7+x0AP/F/PUSt7mFZ0iUqyaIW83GpsXgwXj4YnHGFQEqxokmAxhAd4XbAC2Ol
	rrPg==
X-Gm-Message-State: APzg51BBsztbKOXFOoxMQVyUFQdDci2I1YT8BBBHKMJoM0LwKZaQ8aPk
	UWpNqa6zgcgUYzA+FynR6NWPgtGrSUs=
X-Google-Smtp-Source: ANB0VdbXfIlGkHTd5i4UKYnc8/sPGQV/SfsbyijsCcC/1WzUVZI5QbQ74icNTVuPL/rsKL+yFzvC+g==
X-Received: by 2002:aca:30c4:: with SMTP id
	w187-v6mr4580854oiw.67.1534950576847; 
	Wed, 22 Aug 2018 08:09:36 -0700 (PDT)
Received: from dell-laptop.mvista.com ([157.49.107.222])
	by smtp.gmail.com with ESMTPSA id
	i132-v6sm1024281oif.20.2018.08.22.08.09.34
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 22 Aug 2018 08:09:36 -0700 (PDT)
From: Jagadeesh Krishnanjanappa <jkrishnanjanappa@mvista.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 22 Aug 2018 20:38:34 +0530
Message-Id: <1534950532-23850-16-git-send-email-jkrishnanjanappa@mvista.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1534950532-23850-1-git-send-email-jkrishnanjanappa@mvista.com>
References: <1534950532-23850-1-git-send-email-jkrishnanjanappa@mvista.com>
Subject: [ROCKO][PATCH V3 16/34] Qemu: CVE-2018-11806 slirp-heap-buffer-overflow
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
X-List-Received-Date: Wed, 22 Aug 2018 15:09:36 -0000

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
index 0000000..b3fab26
--- /dev/null
+++ b/meta/recipes-devtools/qemu/qemu/0001-CVE-2018-11806-QEMU-slirp-heap-buffer-overflow.patch
@@ -0,0 +1,71 @@
+From dc21a9d2951f0a2a7e63633e2b5c68c54e4edc4b Mon Sep 17 00:00:00 2001
+From: Jeremy Puhlman <jpuhlman@mvista.com>
+Date: Thu, 14 Jun 2018 01:28:49 +0000
+Subject: [PATCH] QEMU: slirp heap buffer overflow
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
+Upstream-Status: Backport [https://github.com/qemu/qemu/commit/864036e251f54c99d31df124aad7f34f01f5344c#diff-de3b23fd63b9e35d35c454525498d51c]
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


