Return-Path: <ting.liu@freescale.com>
Received: from ch1outboundpool.messaging.microsoft.com
	(ch1ehsobe006.messaging.microsoft.com [216.32.181.186])
	by mail.openembedded.org (Postfix) with ESMTP id D6D816DEE6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 Jan 2014 09:50:05 +0000 (UTC)
Received: from mail86-ch1-R.bigfish.com (10.43.68.232) by
	CH1EHSOBE001.bigfish.com (10.43.70.51) with Microsoft SMTP Server id
	14.1.225.22; Tue, 14 Jan 2014 09:50:05 +0000
Received: from mail86-ch1 (localhost [127.0.0.1])	by mail86-ch1-R.bigfish.com
	(Postfix) with ESMTP id 9C2623200B7	for
	<openembedded-core@lists.openembedded.org>;
	Tue, 14 Jan 2014 09:50:05 +0000 (UTC)
X-Forefront-Antispam-Report: CIP:70.37.183.190; KIP:(null); UIP:(null); IPV:NLI;
	H:mail.freescale.net; RD:none; EFVD:NLI
X-SpamScore: 0
X-BigFish: VS0(zzzz1f42h208ch1ee6h1de0h1fdah2073h2146h1202h1e76h2189h1d1ah1d2ah21a7h1fc6hzz1de098h8275bh1de097hz2dh2a8h839hd24he5bhf0ah1288h12a5h12a9h12bdh12e5h137ah139eh13b6h1441h1504h1537h162dh1631h1758h1898h18e1h1946h19b5h1ad9h1b0ah1b2fh2222h224fh1fb3h1d0ch1d2eh1d3fh1dfeh1dffh1e23h1fe8h1ff5h2218h2216h226dh22d0h2327h2336h2438h2461h1155h)
Received: from mail86-ch1 (localhost.localdomain [127.0.0.1]) by mail86-ch1
	(MessageSwitch) id 1389693003808464_4877;
	Tue, 14 Jan 2014 09:50:03 +0000 (UTC)
Received: from CH1EHSMHS039.bigfish.com (snatpool2.int.messaging.microsoft.com
	[10.43.68.238])	by mail86-ch1.bigfish.com (Postfix) with ESMTP id
	B68B1420047;	Tue, 14 Jan 2014 09:50:03 +0000 (UTC)
Received: from mail.freescale.net (70.37.183.190) by CH1EHSMHS039.bigfish.com
	(10.43.69.248) with Microsoft SMTP Server (TLS) id 14.16.227.3;
	Tue, 14 Jan 2014 09:50:03 +0000
Received: from tx30smr01.am.freescale.net (10.81.153.31) by
	039-SN1MMR1-004.039d.mgd.msft.net (10.84.1.14) with Microsoft SMTP
	Server (TLS) id 14.3.158.2; Tue, 14 Jan 2014 09:50:02 +0000
Received: from b28495.ap.freescale.net (b28495.ap.freescale.net
	[10.193.20.146])	by tx30smr01.am.freescale.net (8.14.3/8.14.0) with
	ESMTP id s0E9nvwq027247;	Tue, 14 Jan 2014 02:50:01 -0700
From: <b28495@freescale.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 14 Jan 2014 17:49:56 +0800
Message-ID: <1389692997-5088-2-git-send-email-b28495@freescale.com>
X-Mailer: git-send-email 1.7.3.4
In-Reply-To: <1389692997-5088-1-git-send-email-b28495@freescale.com>
References: <1389692997-5088-1-git-send-email-b28495@freescale.com>
MIME-Version: 1.0
X-OriginatorOrg: freescale.com
X-FOPE-CONNECTOR: Id%0$Dn%*$RO%0$TLS%0$FQDN%$TlsDn%
X-FOPE-CONNECTOR: Id%0$Dn%FREESCALE.MAIL.ONMICROSOFT.COM$RO%1$TLS%0$FQDN%$TlsDn%
Subject: [PATCH 2/3] kmod-native: Only use O_CLOEXEC if it is defined
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
X-List-Received-Date: Tue, 14 Jan 2014 09:50:07 -0000
Content-Type: text/plain

From: Ting Liu <b28495@freescale.com>

O_CLOEXEC is not available on some distro, such as centos 5.x

Signed-off-by: Ting Liu <b28495@freescale.com>
---
 meta/recipes-kernel/kmod/kmod-native_git.bb        |    1 +
 .../kmod/Only-use-O_CLOEXEC-if-it-is-defined.patch |  138 ++++++++++++++++++++
 2 files changed, 139 insertions(+), 0 deletions(-)
 create mode 100644 meta/recipes-kernel/kmod/kmod/Only-use-O_CLOEXEC-if-it-is-defined.patch

diff --git a/meta/recipes-kernel/kmod/kmod-native_git.bb b/meta/recipes-kernel/kmod/kmod-native_git.bb
index f0e274e..a8312ef 100644
--- a/meta/recipes-kernel/kmod/kmod-native_git.bb
+++ b/meta/recipes-kernel/kmod/kmod-native_git.bb
@@ -8,6 +8,7 @@ DEPENDS += "zlib-native"
 inherit native
 
 SRC_URI += "file://Change-to-calling-bswap_-instead-of-htobe-and-be-toh.patch \
+           file://Only-use-O_CLOEXEC-if-it-is-defined.patch \
            "
 
 do_install_append (){
diff --git a/meta/recipes-kernel/kmod/kmod/Only-use-O_CLOEXEC-if-it-is-defined.patch b/meta/recipes-kernel/kmod/kmod/Only-use-O_CLOEXEC-if-it-is-defined.patch
new file mode 100644
index 0000000..0c35615
--- /dev/null
+++ b/meta/recipes-kernel/kmod/kmod/Only-use-O_CLOEXEC-if-it-is-defined.patch
@@ -0,0 +1,138 @@
+From 8dc835c57caa5ca2eae9c4ebc8e2bc6dcff94bc3 Mon Sep 17 00:00:00 2001
+From: Ting Liu <b28495@freescale.com>
+Date: Mon, 13 Jan 2014 11:11:28 +0800
+Subject: [PATCH] Only use O_CLOEXEC if it is defined
+
+O_CLOEXEC is not available on some distro, such as centos 5.x
+
+Signed-off-by: Ting Liu <b28495@freescale.com>
+---
+ libkmod/libkmod-config.c | 10 +++++++++-
+ libkmod/libkmod-file.c   |  4 ++++
+ libkmod/libkmod-index.c  |  7 +++++++
+ libkmod/libkmod-module.c | 17 +++++++++++++++++
+ 4 files changed, 37 insertions(+), 1 deletion(-)
+
+diff --git a/libkmod/libkmod-config.c b/libkmod/libkmod-config.c
+index 32adb8b..def805d 100644
+--- a/libkmod/libkmod-config.c
++++ b/libkmod/libkmod-config.c
+@@ -525,7 +525,11 @@ static int kmod_config_parse_kcmdline(struct kmod_config *config)
+ 	int fd, err;
+ 	char *p, *modname,  *param = NULL, *value = NULL;
+ 
++#ifdef O_CLOEXEC
+ 	fd = open("/proc/cmdline", O_RDONLY|O_CLOEXEC);
++#else
++	fd = open("/proc/cmdline", O_RDONLY);
++#endif
+ 	if (fd < 0) {
+ 		err = -errno;
+ 		DBG(config->ctx, "could not open '/proc/cmdline' for reading: %m\n");
+@@ -889,7 +893,11 @@ int kmod_config_new(struct kmod_ctx *ctx, struct kmod_config **p_config,
+ 			snprintf(fn, sizeof(fn),"%s/%s", cf->path,
+ 					cf->name);
+ 
+-		fd = open(fn, O_RDONLY|O_CLOEXEC);
++#ifdef O_CLOEXEC
++	fd = open(fn, O_RDONLY|O_CLOEXEC);
++#else
++	fd = open(fn, O_RDONLY);
++#endif
+ 		DBG(ctx, "parsing file '%s' fd=%d\n", fn, fd);
+ 
+ 		if (fd >= 0)
+diff --git a/libkmod/libkmod-file.c b/libkmod/libkmod-file.c
+index feb4a15..d659765 100644
+--- a/libkmod/libkmod-file.c
++++ b/libkmod/libkmod-file.c
+@@ -292,7 +292,11 @@ struct kmod_file *kmod_file_open(const struct kmod_ctx *ctx,
+ 	if (file == NULL)
+ 		return NULL;
+ 
++#ifdef O_CLOEXEC
+ 	file->fd = open(filename, O_RDONLY|O_CLOEXEC);
++#else
++	file->fd = open(filename, O_RDONLY);
++#endif
+ 	if (file->fd < 0) {
+ 		err = -errno;
+ 		goto error;
+diff --git a/libkmod/libkmod-index.c b/libkmod/libkmod-index.c
+index fa7db41..4b113ed 100644
+--- a/libkmod/libkmod-index.c
++++ b/libkmod/libkmod-index.c
+@@ -795,10 +795,17 @@ struct index_mm *index_mm_open(struct kmod_ctx *ctx, const char *filename,
+ 		return NULL;
+ 	}
+ 
++#ifdef O_CLOEXEC
+ 	if ((fd = open(filename, O_RDONLY|O_CLOEXEC)) < 0) {
+ 		DBG(ctx, "open(%s, O_RDONLY|O_CLOEXEC): %m\n", filename);
+ 		goto fail_open;
+ 	}
++#else
++	if ((fd = open(filename, O_RDONLY) < 0)) {
++		DBG(ctx, "open(%s, O_RDONLY): %m\n", filename);
++		goto fail_open;
++	}
++#endif
+ 
+ 	fstat(fd, &st);
+ 	if ((size_t) st.st_size < sizeof(hdr))
+diff --git a/libkmod/libkmod-module.c b/libkmod/libkmod-module.c
+index 2f92e16..a911dfe 100644
+--- a/libkmod/libkmod-module.c
++++ b/libkmod/libkmod-module.c
+@@ -1692,7 +1692,11 @@ KMOD_EXPORT int kmod_module_get_initstate(const struct kmod_module *mod)
+ 
+ 	pathlen = snprintf(path, sizeof(path),
+ 				"/sys/module/%s/initstate", mod->name);
++#ifdef O_CLOEXEC
+ 	fd = open(path, O_RDONLY|O_CLOEXEC);
++#else
++	fd = open(path, O_RDONLY);
++#endif
+ 	if (fd < 0) {
+ 		err = -errno;
+ 
+@@ -1762,7 +1766,11 @@ KMOD_EXPORT long kmod_module_get_size(const struct kmod_module *mod)
+ 		return -errno;
+ 
+ 	/* available as of linux 3.3.x */
++#ifdef O_CLOEXEC
+ 	cfd = openat(dfd, "coresize", O_RDONLY|O_CLOEXEC);
++#else
++	cfd = openat(dfd, "coresize", O_RDONLY);
++#endif
+ 	if (cfd >= 0) {
+ 		if (read_str_long(cfd, &size, 10) < 0)
+ 			ERR(mod->ctx, "failed to read coresize from %s\n", line);
+@@ -1830,7 +1838,11 @@ KMOD_EXPORT int kmod_module_get_refcnt(const struct kmod_module *mod)
+ 		return -ENOENT;
+ 
+ 	snprintf(path, sizeof(path), "/sys/module/%s/refcnt", mod->name);
++#ifdef O_CLOEXEC
+ 	fd = open(path, O_RDONLY|O_CLOEXEC);
++#else
++	fd = open(path, O_RDONLY);
++#endif
+ 	if (fd < 0) {
+ 		err = -errno;
+ 		DBG(mod->ctx, "could not open '%s': %s\n",
+@@ -1973,7 +1985,12 @@ KMOD_EXPORT struct kmod_list *kmod_module_get_sections(const struct kmod_module
+ 				continue;
+ 		}
+ 
++#ifdef O_CLOEXEC
+ 		fd = openat(dfd, dent->d_name, O_RDONLY|O_CLOEXEC);
++#else
++		fd = openat(dfd, dent->d_name, O_RDONLY);
++
++#endif
+ 		if (fd < 0) {
+ 			ERR(mod->ctx, "could not open '%s/%s': %m\n",
+ 							dname, dent->d_name);
+-- 
+1.8.3.2
+
-- 
1.7.3.4



