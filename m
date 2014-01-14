Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 7280E60C16
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 Jan 2014 10:18:06 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.5) with ESMTP id s0EAHxpJ014504
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 14 Jan 2014 02:17:59 -0800 (PST)
Received: from [128.224.162.226] (128.224.162.226) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.2.347.0;
	Tue, 14 Jan 2014 02:18:00 -0800
Message-ID: <52D50ED6.3020507@windriver.com>
Date: Tue, 14 Jan 2014 18:17:58 +0800
From: Robert Yang <liezhi.yang@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:24.0) Gecko/20100101 Thunderbird/24.0
MIME-Version: 1.0
To: <b28495@freescale.com>, <openembedded-core@lists.openembedded.org>
References: <1389692997-5088-1-git-send-email-b28495@freescale.com>
	<1389692997-5088-2-git-send-email-b28495@freescale.com>
In-Reply-To: <1389692997-5088-2-git-send-email-b28495@freescale.com>
Subject: Re: [PATCH 2/3] kmod-native: Only use O_CLOEXEC if it is defined
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
X-List-Received-Date: Tue, 14 Jan 2014 10:18:06 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit


On 01/14/2014 05:49 PM, b28495@freescale.com wrote:
> From: Ting Liu <b28495@freescale.com>
>
> O_CLOEXEC is not available on some distro, such as centos 5.x
>

Hi Ting,

Missing the Upstream-Status here, and for the O_CLOEXEC, how about:

#ifdef O_CLOEXEC
#define O_RDONLY_O_CLOEXEC	O_RDONLY|O_CLOEXEC
#else
#define O_RDONLY_O_CLOEXEC	O_RDONLY
#endif

or something like this, so you don't have to use the "#ifdef" everywhere.

// Robert

> Signed-off-by: Ting Liu <b28495@freescale.com>
> ---
>   meta/recipes-kernel/kmod/kmod-native_git.bb        |    1 +
>   .../kmod/Only-use-O_CLOEXEC-if-it-is-defined.patch |  138 ++++++++++++++++++++
>   2 files changed, 139 insertions(+), 0 deletions(-)
>   create mode 100644 meta/recipes-kernel/kmod/kmod/Only-use-O_CLOEXEC-if-it-is-defined.patch
>
> diff --git a/meta/recipes-kernel/kmod/kmod-native_git.bb b/meta/recipes-kernel/kmod/kmod-native_git.bb
> index f0e274e..a8312ef 100644
> --- a/meta/recipes-kernel/kmod/kmod-native_git.bb
> +++ b/meta/recipes-kernel/kmod/kmod-native_git.bb
> @@ -8,6 +8,7 @@ DEPENDS += "zlib-native"
>   inherit native
>
>   SRC_URI += "file://Change-to-calling-bswap_-instead-of-htobe-and-be-toh.patch \
> +           file://Only-use-O_CLOEXEC-if-it-is-defined.patch \
>              "
>
>   do_install_append (){
> diff --git a/meta/recipes-kernel/kmod/kmod/Only-use-O_CLOEXEC-if-it-is-defined.patch b/meta/recipes-kernel/kmod/kmod/Only-use-O_CLOEXEC-if-it-is-defined.patch
> new file mode 100644
> index 0000000..0c35615
> --- /dev/null
> +++ b/meta/recipes-kernel/kmod/kmod/Only-use-O_CLOEXEC-if-it-is-defined.patch
> @@ -0,0 +1,138 @@
> +From 8dc835c57caa5ca2eae9c4ebc8e2bc6dcff94bc3 Mon Sep 17 00:00:00 2001
> +From: Ting Liu <b28495@freescale.com>
> +Date: Mon, 13 Jan 2014 11:11:28 +0800
> +Subject: [PATCH] Only use O_CLOEXEC if it is defined
> +
> +O_CLOEXEC is not available on some distro, such as centos 5.x
> +
> +Signed-off-by: Ting Liu <b28495@freescale.com>
> +---
> + libkmod/libkmod-config.c | 10 +++++++++-
> + libkmod/libkmod-file.c   |  4 ++++
> + libkmod/libkmod-index.c  |  7 +++++++
> + libkmod/libkmod-module.c | 17 +++++++++++++++++
> + 4 files changed, 37 insertions(+), 1 deletion(-)
> +
> +diff --git a/libkmod/libkmod-config.c b/libkmod/libkmod-config.c
> +index 32adb8b..def805d 100644
> +--- a/libkmod/libkmod-config.c
> ++++ b/libkmod/libkmod-config.c
> +@@ -525,7 +525,11 @@ static int kmod_config_parse_kcmdline(struct kmod_config *config)
> + 	int fd, err;
> + 	char *p, *modname,  *param = NULL, *value = NULL;
> +
> ++#ifdef O_CLOEXEC
> + 	fd = open("/proc/cmdline", O_RDONLY|O_CLOEXEC);
> ++#else
> ++	fd = open("/proc/cmdline", O_RDONLY);
> ++#endif
> + 	if (fd < 0) {
> + 		err = -errno;
> + 		DBG(config->ctx, "could not open '/proc/cmdline' for reading: %m\n");
> +@@ -889,7 +893,11 @@ int kmod_config_new(struct kmod_ctx *ctx, struct kmod_config **p_config,
> + 			snprintf(fn, sizeof(fn),"%s/%s", cf->path,
> + 					cf->name);
> +
> +-		fd = open(fn, O_RDONLY|O_CLOEXEC);
> ++#ifdef O_CLOEXEC
> ++	fd = open(fn, O_RDONLY|O_CLOEXEC);
> ++#else
> ++	fd = open(fn, O_RDONLY);
> ++#endif
> + 		DBG(ctx, "parsing file '%s' fd=%d\n", fn, fd);
> +
> + 		if (fd >= 0)
> +diff --git a/libkmod/libkmod-file.c b/libkmod/libkmod-file.c
> +index feb4a15..d659765 100644
> +--- a/libkmod/libkmod-file.c
> ++++ b/libkmod/libkmod-file.c
> +@@ -292,7 +292,11 @@ struct kmod_file *kmod_file_open(const struct kmod_ctx *ctx,
> + 	if (file == NULL)
> + 		return NULL;
> +
> ++#ifdef O_CLOEXEC
> + 	file->fd = open(filename, O_RDONLY|O_CLOEXEC);
> ++#else
> ++	file->fd = open(filename, O_RDONLY);
> ++#endif
> + 	if (file->fd < 0) {
> + 		err = -errno;
> + 		goto error;
> +diff --git a/libkmod/libkmod-index.c b/libkmod/libkmod-index.c
> +index fa7db41..4b113ed 100644
> +--- a/libkmod/libkmod-index.c
> ++++ b/libkmod/libkmod-index.c
> +@@ -795,10 +795,17 @@ struct index_mm *index_mm_open(struct kmod_ctx *ctx, const char *filename,
> + 		return NULL;
> + 	}
> +
> ++#ifdef O_CLOEXEC
> + 	if ((fd = open(filename, O_RDONLY|O_CLOEXEC)) < 0) {
> + 		DBG(ctx, "open(%s, O_RDONLY|O_CLOEXEC): %m\n", filename);
> + 		goto fail_open;
> + 	}
> ++#else
> ++	if ((fd = open(filename, O_RDONLY) < 0)) {
> ++		DBG(ctx, "open(%s, O_RDONLY): %m\n", filename);
> ++		goto fail_open;
> ++	}
> ++#endif
> +
> + 	fstat(fd, &st);
> + 	if ((size_t) st.st_size < sizeof(hdr))
> +diff --git a/libkmod/libkmod-module.c b/libkmod/libkmod-module.c
> +index 2f92e16..a911dfe 100644
> +--- a/libkmod/libkmod-module.c
> ++++ b/libkmod/libkmod-module.c
> +@@ -1692,7 +1692,11 @@ KMOD_EXPORT int kmod_module_get_initstate(const struct kmod_module *mod)
> +
> + 	pathlen = snprintf(path, sizeof(path),
> + 				"/sys/module/%s/initstate", mod->name);
> ++#ifdef O_CLOEXEC
> + 	fd = open(path, O_RDONLY|O_CLOEXEC);
> ++#else
> ++	fd = open(path, O_RDONLY);
> ++#endif
> + 	if (fd < 0) {
> + 		err = -errno;
> +
> +@@ -1762,7 +1766,11 @@ KMOD_EXPORT long kmod_module_get_size(const struct kmod_module *mod)
> + 		return -errno;
> +
> + 	/* available as of linux 3.3.x */
> ++#ifdef O_CLOEXEC
> + 	cfd = openat(dfd, "coresize", O_RDONLY|O_CLOEXEC);
> ++#else
> ++	cfd = openat(dfd, "coresize", O_RDONLY);
> ++#endif
> + 	if (cfd >= 0) {
> + 		if (read_str_long(cfd, &size, 10) < 0)
> + 			ERR(mod->ctx, "failed to read coresize from %s\n", line);
> +@@ -1830,7 +1838,11 @@ KMOD_EXPORT int kmod_module_get_refcnt(const struct kmod_module *mod)
> + 		return -ENOENT;
> +
> + 	snprintf(path, sizeof(path), "/sys/module/%s/refcnt", mod->name);
> ++#ifdef O_CLOEXEC
> + 	fd = open(path, O_RDONLY|O_CLOEXEC);
> ++#else
> ++	fd = open(path, O_RDONLY);
> ++#endif
> + 	if (fd < 0) {
> + 		err = -errno;
> + 		DBG(mod->ctx, "could not open '%s': %s\n",
> +@@ -1973,7 +1985,12 @@ KMOD_EXPORT struct kmod_list *kmod_module_get_sections(const struct kmod_module
> + 				continue;
> + 		}
> +
> ++#ifdef O_CLOEXEC
> + 		fd = openat(dfd, dent->d_name, O_RDONLY|O_CLOEXEC);
> ++#else
> ++		fd = openat(dfd, dent->d_name, O_RDONLY);
> ++
> ++#endif
> + 		if (fd < 0) {
> + 			ERR(mod->ctx, "could not open '%s/%s': %m\n",
> + 							dname, dent->d_name);
> +--
> +1.8.3.2
> +
>

