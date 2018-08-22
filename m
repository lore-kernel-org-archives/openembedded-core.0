Return-Path: <jkrishnanjanappa@mvista.com>
Received: from mail-oi0-f51.google.com (mail-oi0-f51.google.com
	[209.85.218.51])
	by mail.openembedded.org (Postfix) with ESMTP id 090267927C
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Aug 2018 11:18:56 +0000 (UTC)
Received: by mail-oi0-f51.google.com with SMTP id q11-v6so2451647oic.12
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Aug 2018 04:18:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=mvista-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=kgjbVyyP5bgEcrkekTvJUV6agI36G0nrF+w5gAPdwQA=;
	b=Ph47DYyPvj3c14Zmg9U7uxQ66JH5i0N736+VyYa07qFr2lVbRZALHCfI0sMC0AK0Mw
	ff5GGqWgJRALlg5TlOqRrj+JWVIAJLXMhEHX9FglbrSw7WTqZc9C1PXfbEY8T90oLnfV
	kY6PGXcAt/1KyBKbOE7HOF5kKVC+mRpVtmNhZZhqleL7dGugU1+TUe4NMqPAK5bNp19N
	72I21zJc79CqEggA3UnFpvZXyyOhmnBpoOVN0vWTCxh/koUa1VEftVWs98fSQxEjpT6/
	1v9C7jj/yGwOoi+ndrO1JtcLx9R1SmNeYeeFACl7DYSnJqtgYT857cYNsZ5BaYdQLc/0
	5Pfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=kgjbVyyP5bgEcrkekTvJUV6agI36G0nrF+w5gAPdwQA=;
	b=MsQsYQecqSvCZYp09WDjXNATMty73MpYOuetjCkUzZ3WKSNEsyZXcgLfidm1DGekfu
	eASEDNdeU2o/CmqiuJBtDz+aH1k+6Ec4ZoEtRQTvMcawinqoSVlFQZwi9FR3DbGXXXv1
	bw/kIaMKdFhY52DTPujfIQYbjDcga9GRWvGECKD+jzejr22kfRSKBYU02WfeC69HPlQX
	S7uw8aAFJzRPnbQAWAImI7J+wkF3aFy4/y8I/4QLiTEQ7d3PiEmjbEYqzt2YPrWyu3iC
	jw1JzPc26lzUUlzRv1gtUzarAzZRQ0F1VKxThX1h+EY2jvJJQd1ylvlb+GjspQlS5Mn3
	KIUA==
X-Gm-Message-State: APzg51ADfJg6anW2o+I+4lhWZR015SCeJDHZ1c3EYwNPO+1xb5/qzmRf
	kpQJizTNjfGei8VgwdsnAc2tqN5+EgU=
X-Google-Smtp-Source: ANB0VdanYKY/C/fgERZ528fBwd2Okyd0dhsX7HmqJO0FosQ9Gj5LcoNL1TmfX2zzLNGVWgZHH0OIXw==
X-Received: by 2002:aca:4784:: with SMTP id
	u126-v6mr3485720oia.229.1534936737957; 
	Wed, 22 Aug 2018 04:18:57 -0700 (PDT)
Received: from dell-laptop.mvista.com ([157.49.107.222])
	by smtp.gmail.com with ESMTPSA id
	c9-v6sm862308oia.1.2018.08.22.04.18.55
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 22 Aug 2018 04:18:57 -0700 (PDT)
From: Jagadeesh Krishnanjanappa <jkrishnanjanappa@mvista.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 22 Aug 2018 16:47:54 +0530
Message-Id: <1534936692-11736-16-git-send-email-jkrishnanjanappa@mvista.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1534936692-11736-1-git-send-email-jkrishnanjanappa@mvista.com>
References: <1534936692-11736-1-git-send-email-jkrishnanjanappa@mvista.com>
Subject: [ROCKO][PATCH 16/34] Qemu CVE-2018-11806 slirp-heap-buffer-overflow
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
X-List-Received-Date: Wed, 22 Aug 2018 11:18:57 -0000

From: Jeremy Puhlman <jpuhlman@mvista.com>

slirp: correct size computation while concatenating mbuf

While reassembling incoming fragmented datagrams, 'm_cat' routine
extends the 'mbuf' buffer, if it has insufficient room. It computes
a wrong buffer size, which leads to overwriting adjacent heap buffer
area. Correct this size computation in m_cat.

Affects qemu < 3.0.0

Signed-off-by: Jeremy Puhlman <jpuhlman@mvista.com>
---
 ...018-11806-QEMU-slirp-heap-buffer-overflow.patch | 69 ++++++++++++++++++++++
 meta/recipes-devtools/qemu/qemu_2.10.0.bb          |  1 +
 2 files changed, 70 insertions(+)
 create mode 100644 meta/recipes-devtools/qemu/qemu/0001-CVE-2018-11806-QEMU-slirp-heap-buffer-overflow.patch

diff --git a/meta/recipes-devtools/qemu/qemu/0001-CVE-2018-11806-QEMU-slirp-heap-buffer-overflow.patch b/meta/recipes-devtools/qemu/qemu/0001-CVE-2018-11806-QEMU-slirp-heap-buffer-overflow.patch
new file mode 100644
index 0000000..6a518b4
--- /dev/null
+++ b/meta/recipes-devtools/qemu/qemu/0001-CVE-2018-11806-QEMU-slirp-heap-buffer-overflow.patch
@@ -0,0 +1,69 @@
+Upstream-status: Backport
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


