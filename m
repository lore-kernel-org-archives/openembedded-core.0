Return-Path: <fabio.berton@ossystems.com.br>
Received: from mail-qk0-f195.google.com (mail-qk0-f195.google.com
	[209.85.220.195])
	by mail.openembedded.org (Postfix) with ESMTP id 285C260589
	for <openembedded-core@lists.openembedded.org>;
	Thu, 17 Nov 2016 15:27:01 +0000 (UTC)
Received: by mail-qk0-f195.google.com with SMTP id n204so26696750qke.2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 17 Nov 2016 07:27:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id:organization;
	bh=5Pn8AiFdv4ZRUwj+x/PJ5JJThg28cu3kbajwjAfsT4I=;
	b=PdC2+HySu3wciyORypYaYrZ5WZqp9C5RAjIpxZVqJGkSHUDVUtlX2Qxy0yNEhmjE+k
	bKyOE9mbvUHcSJlXYmQZ9R8fm5oOyBb0AB1fJnBLKOwEkJmK5JJyV4iqnnyFa9UMmbt+
	TUPDWBDaiACkfA5OXdeVLuhP4DAU4BGX4fHejMXpGe4XDr06sWURxJxtlMtbXh3gQMG+
	LgtraalX4qHh5Ql267tZ1f1vpDubHKLoJ81E4kNtw+BnqiIkJHWc9KTPTHfdSQcWYOoY
	VLkhxRHIRA7AIq8kOeXGi5DjJFY2npLSP17mxgZK/lxSAl/OYB/Fmdi8Q7V7hsa8blFk
	bU3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:organization;
	bh=5Pn8AiFdv4ZRUwj+x/PJ5JJThg28cu3kbajwjAfsT4I=;
	b=FZxo/EjH0XaqEhv0csPnJVy18TrW0po/UIAshPcsOICRPTZZw2VSUYUh3+DbNOtvZi
	tCyc2XkxB570yE4ljNpUDJerog1jkhW3vPeQghZo2w/3d4txA48LDIo/wrPhrEwwKYOL
	EBq78X8Um5VkWt4NI2pJ5XRaq068jvbtVOB97hunemG4D4mECRwbzQ8ytN286p2eQySP
	jeqXZm61imMCKXnBkeTIXTifZ5F0AIxCLzYno8wQp+Tca1J/cckqagtxpWjh6j0ZrVpE
	3ByNQx8tV7OAfYm8lRI8Df5S91IU6A/iXNUy1ReDzm0H6xfF36PONzZfVFQ/mIu67Pzj
	2yTA==
X-Gm-Message-State: AKaTC02oc5J4atNeBrBsjme8cKJDTFBCxGX8YAWZS3mnnaxHavd/WzjNBpFxk/1I41i/9A==
X-Received: by 10.233.220.71 with SMTP id q68mr4385892qkf.8.1479396422763;
	Thu, 17 Nov 2016 07:27:02 -0800 (PST)
Received: from monster.lab.ossystems.com.br ([181.220.123.3])
	by smtp.gmail.com with ESMTPSA id 73sm1691597qky.2.2016.11.17.07.27.00
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 17 Nov 2016 07:27:01 -0800 (PST)
From: Fabio Berton <fabio.berton@ossystems.com.br>
To: openembedded-core@lists.openembedded.org
Date: Thu, 17 Nov 2016 13:26:34 -0200
Message-Id: <1479396394-26134-1-git-send-email-fabio.berton@ossystems.com.br>
X-Mailer: git-send-email 2.1.4
Organization: O.S. Systems Software LTDA.
Subject: [PATCH] libpcap: Fix build when PACKAGECONFIG ipv6 is not enable
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
X-List-Received-Date: Thu, 17 Nov 2016 15:27:03 -0000

Add patches to fix error:
/
| ERROR: oe_runmake failed
| config.status: creating pcap-config.tmp
| mv pcap-config.tmp pcap-config
| chmod a+x pcap-config
| ../libpcap-1.8.1/gencode.c: In function 'pcap_compile':
| ../libpcap-1.8.1/gencode.c:693:8: error: 'compiler_state_t
| {aka struct _compiler_state}' has no member named 'ai'
|   cstate.ai = NULL;
|         ^
| ../libpcap-1.8.1/gencode.c: In function 'gen_gateway':
| ../libpcap-1.8.1/gencode.c:4914:13: error: 'cstate' undeclared
| (first use in this function)
|    bpf_error(cstate, "direction applied to 'gateway'");
|              ^~~~~~
| ../libpcap-1.8.1/gencode.c:4914:13: note: each undeclared identifier is
| reported only once for each function it appears in
\

Patches were submitted to upstream [1]

[1] https://github.com/the-tcpdump-group/libpcap/pull/541

Signed-off-by: Fabio Berton <fabio.berton@ossystems.com.br>
---
 ...r_state_t.ai-usage-when-INET6-is-not-defi.patch | 41 +++++++++++++
 ...02-Add-missing-compiler_state_t-parameter.patch | 67 ++++++++++++++++++++++
 meta/recipes-connectivity/libpcap/libpcap_1.8.1.bb |  2 +
 3 files changed, 110 insertions(+)
 create mode 100644 meta/recipes-connectivity/libpcap/libpcap/0001-Fix-compiler_state_t.ai-usage-when-INET6-is-not-defi.patch
 create mode 100644 meta/recipes-connectivity/libpcap/libpcap/0002-Add-missing-compiler_state_t-parameter.patch

diff --git a/meta/recipes-connectivity/libpcap/libpcap/0001-Fix-compiler_state_t.ai-usage-when-INET6-is-not-defi.patch b/meta/recipes-connectivity/libpcap/libpcap/0001-Fix-compiler_state_t.ai-usage-when-INET6-is-not-defi.patch
new file mode 100644
index 0000000..edb6ae5
--- /dev/null
+++ b/meta/recipes-connectivity/libpcap/libpcap/0001-Fix-compiler_state_t.ai-usage-when-INET6-is-not-defi.patch
@@ -0,0 +1,41 @@
+From 64aa033a061c43fc15c711f2490ae41d23b868c3 Mon Sep 17 00:00:00 2001
+From: Fabio Berton <fabio.berton@ossystems.com.br>
+Date: Thu, 17 Nov 2016 09:44:42 -0200
+Subject: [PATCH 1/2] Fix compiler_state_t.ai usage when INET6 is not defined
+Organization: O.S. Systems Software LTDA.
+
+Fix error:
+
+/
+| ../libpcap-1.8.1/gencode.c: In function 'pcap_compile':
+| ../libpcap-1.8.1/gencode.c:693:8: error: 'compiler_state_t
+| {aka struct _compiler_state}' has no member named 'ai'
+|   cstate.ai = NULL;
+\
+
+Upstream-Status: Submitted [1]
+
+[1] https://github.com/the-tcpdump-group/libpcap/pull/541
+
+Signed-off-by: Fabio Berton <fabio.berton@ossystems.com.br>
+---
+ gencode.c | 2 ++
+ 1 file changed, 2 insertions(+)
+
+diff --git a/gencode.c b/gencode.c
+index a887f27..e103c70 100644
+--- a/gencode.c
++++ b/gencode.c
+@@ -690,7 +690,9 @@ pcap_compile(pcap_t *p, struct bpf_program *program,
+ 	}
+ 	initchunks(&cstate);
+ 	cstate.no_optimize = 0;
++#ifdef INET6
+ 	cstate.ai = NULL;
++#endif
+ 	cstate.ic.root = NULL;
+ 	cstate.ic.cur_mark = 0;
+ 	cstate.bpf_pcap = p;
+-- 
+2.1.4
+
diff --git a/meta/recipes-connectivity/libpcap/libpcap/0002-Add-missing-compiler_state_t-parameter.patch b/meta/recipes-connectivity/libpcap/libpcap/0002-Add-missing-compiler_state_t-parameter.patch
new file mode 100644
index 0000000..032b265
--- /dev/null
+++ b/meta/recipes-connectivity/libpcap/libpcap/0002-Add-missing-compiler_state_t-parameter.patch
@@ -0,0 +1,67 @@
+From 50ec0a088d5924a8305b2d70dcba71b0942dee1a Mon Sep 17 00:00:00 2001
+From: Fabio Berton <fabio.berton@ossystems.com.br>
+Date: Thu, 17 Nov 2016 09:47:29 -0200
+Subject: [PATCH 2/2] Add missing compiler_state_t parameter
+Organization: O.S. Systems Software LTDA.
+
+Fix error:
+
+/
+|../libpcap-1.8.1/gencode.c: In function 'gen_gateway':
+|../libpcap-1.8.1/gencode.c:4914:13: error: 'cstate' undeclared
+| (first use in this function)
+|    bpf_error(cstate, "direction applied to 'gateway'");
+\
+
+Upstream-Status: Submitted [1]
+
+[1] https://github.com/the-tcpdump-group/libpcap/pull/541
+
+Signed-off-by: Fabio Berton <fabio.berton@ossystems.com.br>
+---
+ gencode.c | 15 ++++++++-------
+ 1 file changed, 8 insertions(+), 7 deletions(-)
+
+diff --git a/gencode.c b/gencode.c
+index e103c70..f07c0be 100644
+--- a/gencode.c
++++ b/gencode.c
+@@ -523,7 +523,7 @@ static struct block *gen_host6(compiler_state_t *, struct in6_addr *,
+     struct in6_addr *, int, int, int);
+ #endif
+ #ifndef INET6
+-static struct block *gen_gateway(const u_char *, bpf_u_int32 **, int, int);
++static struct block *gen_gateway(compiler_state_t *, const u_char *, bpf_u_int32 **, int, int);
+ #endif
+ static struct block *gen_ipfrag(compiler_state_t *);
+ static struct block *gen_portatom(compiler_state_t *, int, bpf_int32);
+@@ -4904,11 +4904,12 @@ gen_host6(compiler_state_t *cstate, struct in6_addr *addr,
+ 
+ #ifndef INET6
+ static struct block *
+-gen_gateway(eaddr, alist, proto, dir)
+-	const u_char *eaddr;
+-	bpf_u_int32 **alist;
+-	int proto;
+-	int dir;
++gen_gateway(cstate, eaddr, alist, proto, dir)
++    compiler_state_t *cstate;
++    const u_char *eaddr;
++    bpf_u_int32 **alist;
++    int proto;
++    int dir;
+ {
+ 	struct block *b0, *b1, *tmp;
+ 
+@@ -6472,7 +6473,7 @@ gen_scode(compiler_state_t *cstate, const char *name, struct qual q)
+ 		alist = pcap_nametoaddr(name);
+ 		if (alist == NULL || *alist == NULL)
+ 			bpf_error(cstate, "unknown host '%s'", name);
+-		b = gen_gateway(eaddr, alist, proto, dir);
++		b = gen_gateway(cstate, eaddr, alist, proto, dir);
+ 		free(eaddr);
+ 		return b;
+ #else
+-- 
+2.1.4
+
diff --git a/meta/recipes-connectivity/libpcap/libpcap_1.8.1.bb b/meta/recipes-connectivity/libpcap/libpcap_1.8.1.bb
index 9072fe0..e9db28a 100644
--- a/meta/recipes-connectivity/libpcap/libpcap_1.8.1.bb
+++ b/meta/recipes-connectivity/libpcap/libpcap_1.8.1.bb
@@ -2,6 +2,8 @@ require libpcap.inc
 
 SRC_URI += " \
     file://libpcap-pkgconfig-support.patch \
+    file://0001-Fix-compiler_state_t.ai-usage-when-INET6-is-not-defi.patch \
+    file://0002-Add-missing-compiler_state_t-parameter.patch \
 "
 
 SRC_URI[md5sum] = "3d48f9cd171ff12b0efd9134b52f1447"
-- 
2.1.4


