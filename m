Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8AB14C04FFE
	for <webhook@archiver.kernel.org>; Sat, 11 May 2024 05:07:34 +0000 (UTC)
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
 by mx.groups.io with SMTP id smtpd.web11.8783.1715404048466514087
 for <openembedded-core@lists.openembedded.org>;
 Fri, 10 May 2024 22:07:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=J8hOdAwf;
 spf=pass (domain: gmail.com, ip: 209.85.167.47, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-51f74fa2a82so3083056e87.0
        for <openembedded-core@lists.openembedded.org>; Fri, 10 May 2024 22:07:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1715404047; x=1716008847; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=aP8sr3wsWuYQ2/JkvnH5w1EiO2pIhj/03J2SD8baExA=;
        b=J8hOdAwfDXUoXmXny6QcvkPz3eWktH2AY+bfKcJMW+yuOkTpKrUMxs01jN/zNMR5vm
         p2Y5YeTeCuCGny2qNebRFMxu7C6RK0jRSI90rQZlx5PPEXlanHq45VmaVvG15nQMCrF8
         S+9CFXXHJhvZzaHYzFcMByZ3lfmG4tAxbrEtymi+YIQF4ruTkmj9WHGVrnOGKm628Tcf
         8wY3kQUjABjwgAQDugwxcEAsingMAS5Sg1IkVpmpSVkYWFjEi5XjkIqpY/254QalA7D2
         J0l5eKw4EZd+xgPgyCCJqKpJvxx1yOYsaWTH8Hdl6ZiNr5+m8RGYDq5rcRl/MfboO4Vt
         NsNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715404047; x=1716008847;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aP8sr3wsWuYQ2/JkvnH5w1EiO2pIhj/03J2SD8baExA=;
        b=wn3VBV67o5y1F4I/it2KYs261CMgynW1WtMyEs5/ADAaanxgW2QzJASDzCVF54WoPS
         fhdnLpBaFJ0/DLMtZmbXeFIXBWr4iWp/uPAqFX/f1mphiJfPwmB5njpH48rhVDWcIDtp
         p7x/hEOXBZY3X3fKvZvCU3QgWUrFS9VYPMQsznIDHLqjjT7E96iM1K2JEzUdrgQAYkkw
         CdDWxXI7dZJlMtcNQ+uAIYqbMPBAs4CiMCN/c/LSiwZ70r5MUU6IMMB7HJhrZ69fT2O6
         FG//lqh54/ZwwHD0aGW6DpHtRPF7ChD8t41O/3Putguqc8MPWG8c9//OnUS8xy2/K3kU
         aX3A==
X-Forwarded-Encrypted: i=1; AJvYcCX5enay55ZrYuwECqbd4hZ/4GgIOgfXHmWsZ/2gTsKF2SOGuAUkc2jm5HnKG4NYA9L4jsYCbuc6epzmaLAcJYKVnyob7MeQIvBsVfpJZFaQ2bIsl2XBYnwk
X-Gm-Message-State: AOJu0YxJPRXLVuCREFtVsqbm4gmxt42Nk5Ry1WkzMv+GSJ5dv/VjcwNv
	/mn7P8A71m8gWUlg+ff1I5P3b19YJIIy0GpWxVZoEmaFpmLsrioGyfmK+h9N78aNDoFB0jWVM8z
	e2FXAz+6zZbDPhMZE8ObM8G6HVYc=
X-Google-Smtp-Source: AGHT+IGYEXVDMOgzGa5Yf6fbEIuSh6MAY7JEZ3jSxX/1xTDy7/u/AdmpM61oo1LCJz+DKoxXTKr+nV0llqmB0l2d388=
X-Received: by 2002:ac2:5331:0:b0:51d:a8ce:540 with SMTP id
 2adb3069b0e04-5220fd7bb24mr3579067e87.35.1715404045888; Fri, 10 May 2024
 22:07:25 -0700 (PDT)
MIME-Version: 1.0
References: <20240511040811.336618-1-ranjitsinhrathod1991@gmail.com>
In-Reply-To: <20240511040811.336618-1-ranjitsinhrathod1991@gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Sat, 11 May 2024 07:07:13 +0200
Message-ID: <CANNYZj-dC-nuL8gCbzYOkM9zATJNbGngLCB_asai7cs2=zpuQg@mail.gmail.com>
Subject: Re: [OE-Core][kirkstone][PATCH] systemd: Add patches to fix
 systemd-udev delay during initialization
To: ranjitsinhrathod1991@gmail.com
Cc: Ranjitsinh Rathod <ranjitsinh.rathod@kpit.com>, openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000cd33b2061826a095"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 11 May 2024 05:07:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/199204

--000000000000cd33b2061826a095
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Perhaps it=E2=80=99s better to provide a newer systemd including these patc=
hes via
a mixin layer? It=E2=80=99s an invasive backport and not really suitable fo=
r lts.

Alex

On Sat 11. May 2024 at 6.08, Ranjitsinh Rathod via lists.openembedded.org
<ranjitsinhrathod1991=3Dgmail.com@lists.openembedded.org> wrote:

> From: Ranjitsinh Rathod <ranjitsinh.rathod@kpit.com>
>
> Below upstream systemd PR fixes overall delay in systemd-udev in
> initialization by removing multiple for loops along with delays in those
> loops
> By applying these patches from the PR improves almost 800 - 900 ms in
> the initialization
> By this system boots up fasts and also avoids some issues related to
> this delay
>
> PR link: https://github.com/systemd/systemd/pull/23043
>
> Signed-off-by: Ranjitsinh Rathod <ranjitsinh.rathod@kpit.com>
> Signed-off-by: Ranjitsinh Rathod <ranjitsinhrathod1991@gmail.com>
> ---
>  ...0001-udev-move-udev_node_escape_path.patch | 120 ++++++++
>  ...update-and-introduce-stack_directory.patch |  90 ++++++
>  ...ve-stack-directory-even-if-it-is-emp.patch | 267 +++++++++++++++++
>  ...-introduce-path_make_relative_parent.patch |  99 +++++++
>  .../0005-udev-use-readlinkat_malloc.patch     |  74 +++++
>  ...-link_find_prioritized-and-variables.patch | 190 ++++++++++++
>  ...7-udev-use-path_make_relative_parent.patch |  43 +++
>  ...ake-node_symlink-accept-NULL-devname.patch |  75 +++++
>  ...k-when-updating-device-node-symlinks.patch | 277 ++++++++++++++++++
>  ...ck-directory-run-udev-links-when-all.patch | 130 ++++++++
>  meta/recipes-core/systemd/systemd_250.5.bb    |  10 +
>  11 files changed, 1375 insertions(+)
>  create mode 100644
> meta/recipes-core/systemd/systemd/0001-udev-move-udev_node_escape_path.pa=
tch
>  create mode 100644
> meta/recipes-core/systemd/systemd/0002-udev-split-link_update-and-introdu=
ce-stack_directory.patch
>  create mode 100644
> meta/recipes-core/systemd/systemd/0003-udev-do-not-remove-stack-directory=
-even-if-it-is-emp.patch
>  create mode 100644
> meta/recipes-core/systemd/systemd/0004-path-util-introduce-path_make_rela=
tive_parent.patch
>  create mode 100644
> meta/recipes-core/systemd/systemd/0005-udev-use-readlinkat_malloc.patch
>  create mode 100644
> meta/recipes-core/systemd/systemd/0006-udev-rename-link_find_prioritized-=
and-variables.patch
>  create mode 100644
> meta/recipes-core/systemd/systemd/0007-udev-use-path_make_relative_parent=
.patch
>  create mode 100644
> meta/recipes-core/systemd/systemd/0008-udev-make-node_symlink-accept-NULL=
-devname.patch
>  create mode 100644
> meta/recipes-core/systemd/systemd/0009-udev-use-flock-when-updating-devic=
e-node-symlinks.patch
>  create mode 100644
> meta/recipes-core/systemd/systemd/0010-udev-cleanup-stack-directory-run-u=
dev-links-when-all.patch
>
> diff --git
> a/meta/recipes-core/systemd/systemd/0001-udev-move-udev_node_escape_path.=
patch
> b/meta/recipes-core/systemd/systemd/0001-udev-move-udev_node_escape_path.=
patch
> new file mode 100644
> index 0000000000..900ca81170
> --- /dev/null
> +++
> b/meta/recipes-core/systemd/systemd/0001-udev-move-udev_node_escape_path.=
patch
> @@ -0,0 +1,120 @@
> +From b9168275c39a190441fee73ba1c8a64515fd3b0e Mon Sep 17 00:00:00 2001
> +From: Yu Watanabe <watanabe.yu+github@gmail.com>
> +Date: Mon, 11 Apr 2022 11:25:37 +0900
> +Subject: [PATCH 01/10] udev: move udev_node_escape_path()
> +
> +No functionality is changed.
> +
> +PR - https://github.com/systemd/systemd/pull/23043
> +Upstream-Status: Backport [
> https://github.com/systemd/systemd/pull/23043/commits/b9168275c39a190441f=
ee73ba1c8a64515fd3b0e
> ]
> +Signed-off-by: Ranjitsinh Rathod <ranjitsinh.rathod@kpit.com>
> +
> +---
> + src/udev/udev-node.c | 84 ++++++++++++++++++++++----------------------
> + 1 file changed, 42 insertions(+), 42 deletions(-)
> +
> +diff --git a/src/udev/udev-node.c b/src/udev/udev-node.c
> +index bb34977d97..79d050cce6 100644
> +--- a/src/udev/udev-node.c
> ++++ b/src/udev/udev-node.c
> +@@ -222,48 +222,6 @@ static int link_find_prioritized(sd_device *dev,
> bool add, const char *stackdir,
> +         return !!*ret;
> + }
> +
> +-size_t udev_node_escape_path(const char *src, char *dest, size_t size) =
{
> +-        size_t i, j;
> +-        uint64_t h;
> +-
> +-        assert(src);
> +-        assert(dest);
> +-        assert(size >=3D 12);
> +-
> +-        for (i =3D 0, j =3D 0; src[i] !=3D '\0'; i++) {
> +-                if (src[i] =3D=3D '/') {
> +-                        if (j+4 >=3D size - 12 + 1)
> +-                                goto toolong;
> +-                        memcpy(&dest[j], "\\x2f", 4);
> +-                        j +=3D 4;
> +-                } else if (src[i] =3D=3D '\\') {
> +-                        if (j+4 >=3D size - 12 + 1)
> +-                                goto toolong;
> +-                        memcpy(&dest[j], "\\x5c", 4);
> +-                        j +=3D 4;
> +-                } else {
> +-                        if (j+1 >=3D size - 12 + 1)
> +-                                goto toolong;
> +-                        dest[j] =3D src[i];
> +-                        j++;
> +-                }
> +-        }
> +-        dest[j] =3D '\0';
> +-        return j;
> +-
> +-toolong:
> +-        /* If the input path is too long to encode as a filename, then
> let's suffix with a string
> +-         * generated from the hash of the path. */
> +-
> +-        h =3D siphash24_string(src, UDEV_NODE_HASH_KEY.bytes);
> +-
> +-        for (unsigned k =3D 0; k <=3D 10; k++)
> +-                dest[size - k - 2] =3D urlsafe_base64char((h >> (k * 6)=
) &
> 63);
> +-
> +-        dest[size - 1] =3D '\0';
> +-        return size - 1;
> +-}
> +-
> + static int update_timestamp(sd_device *dev, const char *path, struct
> stat *prev) {
> +         assert(path);
> +         assert(prev);
> +@@ -414,6 +372,48 @@ static int update_stack_directory(sd_device *dev,
> const char *dirname, bool add)
> +         return log_device_debug_errno(dev, SYNTHETIC_ERRNO(ELOOP),
> "Failed to create symbolic link %s: %m", filename);
> + }
> +
> ++size_t udev_node_escape_path(const char *src, char *dest, size_t size) =
{
> ++        size_t i, j;
> ++        uint64_t h;
> ++
> ++        assert(src);
> ++        assert(dest);
> ++        assert(size >=3D 12);
> ++
> ++        for (i =3D 0, j =3D 0; src[i] !=3D '\0'; i++) {
> ++                if (src[i] =3D=3D '/') {
> ++                        if (j+4 >=3D size - 12 + 1)
> ++                                goto toolong;
> ++                        memcpy(&dest[j], "\\x2f", 4);
> ++                        j +=3D 4;
> ++                } else if (src[i] =3D=3D '\\') {
> ++                        if (j+4 >=3D size - 12 + 1)
> ++                                goto toolong;
> ++                        memcpy(&dest[j], "\\x5c", 4);
> ++                        j +=3D 4;
> ++                } else {
> ++                        if (j+1 >=3D size - 12 + 1)
> ++                                goto toolong;
> ++                        dest[j] =3D src[i];
> ++                        j++;
> ++                }
> ++        }
> ++        dest[j] =3D '\0';
> ++        return j;
> ++
> ++toolong:
> ++        /* If the input path is too long to encode as a filename, then
> let's suffix with a string
> ++         * generated from the hash of the path. */
> ++
> ++        h =3D siphash24_string(src, UDEV_NODE_HASH_KEY.bytes);
> ++
> ++        for (unsigned k =3D 0; k <=3D 10; k++)
> ++                dest[size - k - 2] =3D urlsafe_base64char((h >> (k * 6)=
) &
> 63);
> ++
> ++        dest[size - 1] =3D '\0';
> ++        return size - 1;
> ++}
> ++
> + /* manage "stack of names" with possibly specified device priorities */
> + static int link_update(sd_device *dev, const char *slink_in, bool add) =
{
> +         _cleanup_free_ char *slink =3D NULL, *dirname =3D NULL;
> +--
> +2.25.1
> +
> diff --git
> a/meta/recipes-core/systemd/systemd/0002-udev-split-link_update-and-intro=
duce-stack_directory.patch
> b/meta/recipes-core/systemd/systemd/0002-udev-split-link_update-and-intro=
duce-stack_directory.patch
> new file mode 100644
> index 0000000000..edc7ab5b38
> --- /dev/null
> +++
> b/meta/recipes-core/systemd/systemd/0002-udev-split-link_update-and-intro=
duce-stack_directory.patch
> @@ -0,0 +1,90 @@
> +From 7e7c36fbbb396364c386bf1edbe9b25179a134c6 Mon Sep 17 00:00:00 2001
> +From: Yu Watanabe <watanabe.yu+github@gmail.com>
> +Date: Mon, 11 Apr 2022 11:26:08 +0900
> +Subject: [PATCH 02/10] udev: split link_update() and introduce
> + stack_directory_get_name()
> +
> +No functionality is changed.
> +
> +PR - https://github.com/systemd/systemd/pull/23043
> +Upstream-Status: Backport [
> https://github.com/systemd/systemd/pull/23043/commits/7e7c36fbbb396364c38=
6bf1edbe9b25179a134c6
> ]
> +Signed-off-by: Ranjitsinh Rathod <ranjitsinh.rathod@kpit.com>
> +
> +---
> + src/udev/udev-node.c | 52 ++++++++++++++++++++++++++++----------------
> + 1 file changed, 33 insertions(+), 19 deletions(-)
> +
> +diff --git a/src/udev/udev-node.c b/src/udev/udev-node.c
> +index 79d050cce6..b4b865c021 100644
> +--- a/src/udev/udev-node.c
> ++++ b/src/udev/udev-node.c
> +@@ -414,33 +414,47 @@ toolong:
> +         return size - 1;
> + }
> +
> +-/* manage "stack of names" with possibly specified device priorities */
> +-static int link_update(sd_device *dev, const char *slink_in, bool add) =
{
> +-        _cleanup_free_ char *slink =3D NULL, *dirname =3D NULL;
> +-        const char *slink_name;
> ++static int stack_directory_get_name(const char *slink, char **ret) {
> ++        _cleanup_free_ char *s =3D NULL, *dirname =3D NULL;
> +         char name_enc[NAME_MAX+1];
> +-        int r;
> ++        const char *name;
> +
> +-        assert(dev);
> +-        assert(slink_in);
> ++        assert(slink);
> ++        assert(ret);
> +
> +-        slink =3D strdup(slink_in);
> +-        if (!slink)
> +-                return log_oom_debug();
> ++        s =3D strdup(slink);
> ++        if (!s)
> ++                return -ENOMEM;
> +
> +-        path_simplify(slink);
> ++        path_simplify(s);
> +
> +-        slink_name =3D path_startswith(slink, "/dev");
> +-        if (!slink_name ||
> +-            empty_or_root(slink_name) ||
> +-            !path_is_normalized(slink_name))
> +-                return log_device_debug_errno(dev,
> SYNTHETIC_ERRNO(EINVAL),
> +-                                              "Invalid symbolic link of
> device node: %s", slink);
> ++        if (!path_is_normalized(s))
> ++                return -EINVAL;
> ++
> ++        name =3D path_startswith(s, "/dev");
> ++        if (empty_or_root(name))
> ++                return -EINVAL;
> ++
> ++        udev_node_escape_path(name, name_enc, sizeof(name_enc));
> +
> +-        (void) udev_node_escape_path(slink_name, name_enc,
> sizeof(name_enc));
> +         dirname =3D path_join("/run/udev/links", name_enc);
> +         if (!dirname)
> +-                return log_oom_debug();
> ++                return -ENOMEM;
> ++
> ++        *ret =3D TAKE_PTR(dirname);
> ++        return 0;
> ++}
> ++
> ++static int link_update(sd_device *dev, const char *slink, bool add) {
> ++        _cleanup_free_ char *dirname =3D NULL;
> ++        int r;
> ++
> ++        assert(dev);
> ++        assert(slink);
> ++
> ++        r =3D stack_directory_get_name(slink, &dirname);
> ++        if (r < 0)
> ++                return log_device_debug_errno(dev, r, "Failed to build
> stack directory name for '%s': %m", slink);
> +
> +         r =3D update_stack_directory(dev, dirname, add);
> +         if (r < 0)
> +--
> +2.25.1
> +
> diff --git
> a/meta/recipes-core/systemd/systemd/0003-udev-do-not-remove-stack-directo=
ry-even-if-it-is-emp.patch
> b/meta/recipes-core/systemd/systemd/0003-udev-do-not-remove-stack-directo=
ry-even-if-it-is-emp.patch
> new file mode 100644
> index 0000000000..6d2b178bd4
> --- /dev/null
> +++
> b/meta/recipes-core/systemd/systemd/0003-udev-do-not-remove-stack-directo=
ry-even-if-it-is-emp.patch
> @@ -0,0 +1,267 @@
> +From a28d67a90374a9d11bd5635f81961f72e5a8b33e Mon Sep 17 00:00:00 2001
> +From: Yu Watanabe <watanabe.yu+github@gmail.com>
> +Date: Mon, 11 Apr 2022 11:47:20 +0900
> +Subject: [PATCH 03/10] udev: do not remove stack directory even if it is
> empty
> +
> +Then, we can always assume the directory exists, and the code become
> +slightly simpler.
> +
> +Note, unused directories are removed by the main udevd process in a
> +later commit.
> +
> +PR - https://github.com/systemd/systemd/pull/23043
> +Upstream-Status: Backport [
> https://github.com/systemd/systemd/pull/23043/commits/a28d67a90374a9d11bd=
5635f81961f72e5a8b33e
> ]
> +Signed-off-by: Ranjitsinh Rathod <ranjitsinh.rathod@kpit.com>
> +
> +---
> + src/udev/udev-node.c | 158 +++++++++++++++++--------------------------
> + 1 file changed, 61 insertions(+), 97 deletions(-)
> +
> +diff --git a/src/udev/udev-node.c b/src/udev/udev-node.c
> +index b4b865c021..6ead839a5f 100644
> +--- a/src/udev/udev-node.c
> ++++ b/src/udev/udev-node.c
> +@@ -35,7 +35,6 @@
> +
> + #define CREATE_LINK_MAX_RETRIES        128
> + #define LINK_UPDATE_MAX_RETRIES        128
> +-#define CREATE_STACK_LINK_MAX_RETRIES  128
> + #define UPDATE_TIMESTAMP_MAX_RETRIES   128
> + #define MAX_RANDOM_DELAY (250 * USEC_PER_MSEC)
> + #define MIN_RANDOM_DELAY ( 50 * USEC_PER_MSEC)
> +@@ -140,15 +139,8 @@ static int link_find_prioritized(sd_device *dev,
> bool add, const char *stackdir,
> +         }
> +
> +         dir =3D opendir(stackdir);
> +-        if (!dir) {
> +-                if (add) /* The stack directory must exist. */
> +-                        return -errno;
> +-                if (errno !=3D ENOENT)
> +-                        return -errno;
> +-
> +-                *ret =3D NULL;
> +-                return 0;
> +-        }
> ++        if (!dir)
> ++                return -errno;
> +
> +         r =3D device_get_device_id(dev, &id);
> +         if (r < 0)
> +@@ -222,8 +214,8 @@ static int link_find_prioritized(sd_device *dev, boo=
l
> add, const char *stackdir,
> +         return !!*ret;
> + }
> +
> +-static int update_timestamp(sd_device *dev, const char *path, struct
> stat *prev) {
> +-        assert(path);
> ++static int update_timestamp(sd_device *dev, int fd, struct stat *prev) =
{
> ++        assert(fd >=3D 0);
> +         assert(prev);
> +
> +         /* Even if a symlink in the stack directory is created/removed,
> the mtime of the directory may
> +@@ -247,129 +239,96 @@ static int update_timestamp(sd_device *dev, const
> char *path, struct stat *prev)
> +          * timestamp of the stack directory is always increased at leas=
t
> in the above step 5, so A can
> +          * detect the update. */
> +
> +-        if ((prev->st_mode & S_IFMT) =3D=3D 0)
> +-                return 0; /* Does not exist, or previous stat() failed.
> */
> +-
> +         for (unsigned i =3D 0; i < UPDATE_TIMESTAMP_MAX_RETRIES; i++) {
> +                 struct stat st;
> +
> +-                if (stat(path, &st) < 0)
> ++                if (fstat(fd, &st) < 0)
> +                         return -errno;
> +
> +                 if (!stat_inode_unmodified(prev, &st))
> +                         return 0;
> +
> +                 log_device_debug(dev,
> +-                                 "%s is modified, but its timestamp is
> not changed, "
> +-                                 "updating timestamp after 10ms.",
> +-                                 path);
> ++                                 "Stack directory is modified, but its
> timestamp is not changed, "
> ++                                 "updating timestamp after 10ms.");
> +
> +                 (void) usleep(10 * USEC_PER_MSEC);
> +-                if (utimensat(AT_FDCWD, path, NULL, 0) < 0)
> ++                if (futimens(fd, NULL) < 0)
> +                         return -errno;
> +         }
> +
> +         return -ELOOP;
> + }
> +
> +-static int update_stack_directory(sd_device *dev, const char *dirname,
> bool add) {
> +-        _cleanup_free_ char *filename =3D NULL, *data =3D NULL, *buf =
=3D NULL;
> +-        const char *devname, *id;
> +-        struct stat st =3D {};
> +-        int priority, r;
> ++static int stack_directory_update(sd_device *dev, int fd, bool add) {
> ++        struct stat st;
> ++        const char *id;
> ++        int r;
> +
> +         assert(dev);
> +-        assert(dirname);
> ++        assert(fd >=3D 0);
> +
> +         r =3D device_get_device_id(dev, &id);
> +         if (r < 0)
> +-                return log_device_debug_errno(dev, r, "Failed to get
> device id: %m");
> +-
> +-        filename =3D path_join(dirname, id);
> +-        if (!filename)
> +-                return log_oom_debug();
> ++                return r;
> +
> +-        if (!add) {
> +-                int unlink_error =3D 0, stat_error =3D 0;
> ++        if (fstat(fd, &st) < 0)
> ++                return -errno;
> +
> +-                if (stat(dirname, &st) < 0) {
> +-                        if (errno =3D=3D ENOENT)
> +-                                return 0; /* The stack directory is
> already removed. That's OK. */
> +-                        stat_error =3D -errno;
> +-                }
> ++        if (add) {
> ++                _cleanup_free_ char *data =3D NULL, *buf =3D NULL;
> ++                const char *devname;
> ++                int priority;
> +
> +-                if (unlink(filename) < 0)
> +-                        unlink_error =3D -errno;
> ++                r =3D sd_device_get_devname(dev, &devname);
> ++                if (r < 0)
> ++                        return r;
> +
> +-                if (rmdir(dirname) >=3D 0 || errno =3D=3D ENOENT)
> +-                        return 0;
> ++                r =3D device_get_devlink_priority(dev, &priority);
> ++                if (r < 0)
> ++                        return r;
> +
> +-                if (unlink_error < 0) {
> +-                        if (unlink_error =3D=3D -ENOENT)
> +-                                return 0;
> ++                if (asprintf(&data, "%i:%s", priority, devname) < 0)
> ++                        return -ENOMEM;
> +
> +-                        /* If we failed to remove the symlink, then
> there is almost nothing we can do. */
> +-                        return log_device_debug_errno(dev, unlink_error=
,
> "Failed to remove %s: %m", filename);
> +-                }
> ++                if (readlinkat_malloc(fd, id, &buf) >=3D 0 && streq(buf=
,
> data))
> ++                        return 0; /* Unchanged. */
> +
> +-                if (stat_error < 0)
> +-                        return log_device_debug_errno(dev, stat_error,
> "Failed to stat %s: %m", dirname);
> ++                (void) unlinkat(fd, id, 0);
> +
> +-                /* The symlink was removed. Check if the timestamp of
> directory is changed. */
> +-                r =3D update_timestamp(dev, dirname, &st);
> +-                if (r < 0 && r !=3D -ENOENT)
> +-                        return log_device_debug_errno(dev, r, "Failed t=
o
> update timestamp of %s: %m", dirname);
> ++                if (symlinkat(data, fd, id) < 0)
> ++                        return -errno;
> +
> +-                return 0;
> ++        } else {
> ++                if (unlinkat(fd, id, 0) < 0) {
> ++                        if (errno =3D=3D ENOENT)
> ++                                return 0; /* Unchanged. */
> ++                        return -errno;
> ++                }
> +         }
> +
> +-        r =3D sd_device_get_devname(dev, &devname);
> ++        r =3D update_timestamp(dev, fd, &st);
> +         if (r < 0)
> +-                return log_device_debug_errno(dev, r, "Failed to get
> device node: %m");
> +-
> +-        r =3D device_get_devlink_priority(dev, &priority);
> +-        if (r < 0)
> +-                return log_device_debug_errno(dev, r, "Failed to get
> priority of device node symlink: %m");
> +-
> +-        if (asprintf(&data, "%i:%s", priority, devname) < 0)
> +-                return log_oom_debug();
> +-
> +-        if (readlink_malloc(filename, &buf) >=3D 0 && streq(buf, data))
> +-                return 0;
> +-
> +-        if (unlink(filename) < 0 && errno !=3D ENOENT)
> +-                log_device_debug_errno(dev, errno, "Failed to remove %s=
,
> ignoring: %m", filename);
> ++                return r;
> +
> +-        for (unsigned j =3D 0; j < CREATE_STACK_LINK_MAX_RETRIES; j++) =
{
> +-                /* This may fail with -ENOENT when the parent directory
> is removed during
> +-                 * creating the file by another udevd worker. */
> +-                r =3D mkdir_p(dirname, 0755);
> +-                if (r =3D=3D -ENOENT)
> +-                        continue;
> +-                if (r < 0)
> +-                        return log_device_debug_errno(dev, r, "Failed t=
o
> create directory %s: %m", dirname);
> ++        return 0;
> ++}
> +
> +-                if (stat(dirname, &st) < 0) {
> +-                        if (errno =3D=3D ENOENT)
> +-                                continue;
> +-                        return log_device_debug_errno(dev, errno,
> "Failed to stat %s: %m", dirname);
> +-                }
> ++static int stack_directory_open(const char *dirname) {
> ++        _cleanup_close_ int fd =3D -1;
> ++        int r;
> +
> +-                if (symlink(data, filename) < 0) {
> +-                        if (errno =3D=3D ENOENT)
> +-                                continue;
> +-                        return log_device_debug_errno(dev, errno,
> "Failed to create symbolic link %s: %m", filename);
> +-                }
> ++        assert(dirname);
> +
> +-                /* The symlink was created. Check if the timestamp of
> directory is changed. */
> +-                r =3D update_timestamp(dev, dirname, &st);
> +-                if (r < 0)
> +-                        return log_device_debug_errno(dev, r, "Failed t=
o
> update timestamp of %s: %m", dirname);
> ++        r =3D mkdir_parents(dirname, 0755);
> ++        if (r < 0)
> ++                return r;
> +
> +-                return 0;
> +-        }
> ++        fd =3D open_mkdir_at(AT_FDCWD, dirname, O_CLOEXEC | O_DIRECTORY=
 |
> O_NOFOLLOW | O_RDONLY, 0755);
> ++        if (fd < 0)
> ++                return fd;
> +
> +-        return log_device_debug_errno(dev, SYNTHETIC_ERRNO(ELOOP),
> "Failed to create symbolic link %s: %m", filename);
> ++        return TAKE_FD(fd);
> + }
> +
> + size_t udev_node_escape_path(const char *src, char *dest, size_t size) =
{
> +@@ -447,6 +406,7 @@ static int stack_directory_get_name(const char
> *slink, char **ret) {
> +
> + static int link_update(sd_device *dev, const char *slink, bool add) {
> +         _cleanup_free_ char *dirname =3D NULL;
> ++        _cleanup_close_ int dirfd =3D -1;
> +         int r;
> +
> +         assert(dev);
> +@@ -456,9 +416,13 @@ static int link_update(sd_device *dev, const char
> *slink, bool add) {
> +         if (r < 0)
> +                 return log_device_debug_errno(dev, r, "Failed to build
> stack directory name for '%s': %m", slink);
> +
> +-        r =3D update_stack_directory(dev, dirname, add);
> ++        dirfd =3D stack_directory_open(dirname);
> ++        if (dirfd < 0)
> ++                return log_device_debug_errno(dev, dirfd, "Failed to
> open stack directory '%s': %m", dirname);
> ++
> ++        r =3D stack_directory_update(dev, dirfd, add);
> +         if (r < 0)
> +-                return r;
> ++                return log_device_debug_errno(dev, r, "Failed to update
> stack directory '%s': %m", dirname);
> +
> +         for (unsigned i =3D 0; i < LINK_UPDATE_MAX_RETRIES; i++) {
> +                 _cleanup_free_ char *target =3D NULL;
> +--
> +2.25.1
> +
> diff --git
> a/meta/recipes-core/systemd/systemd/0004-path-util-introduce-path_make_re=
lative_parent.patch
> b/meta/recipes-core/systemd/systemd/0004-path-util-introduce-path_make_re=
lative_parent.patch
> new file mode 100644
> index 0000000000..dfc9fc9886
> --- /dev/null
> +++
> b/meta/recipes-core/systemd/systemd/0004-path-util-introduce-path_make_re=
lative_parent.patch
> @@ -0,0 +1,99 @@
> +From d4f60bdc11d8e6275922ca5c7f80b130ebbb3d5f Mon Sep 17 00:00:00 2001
> +From: Yu Watanabe <watanabe.yu+github@gmail.com>
> +Date: Mon, 11 Apr 2022 07:01:59 +0900
> +Subject: [PATCH 04/10] path-util: introduce path_make_relative_parent()
> +
> +
> +PR - https://github.com/systemd/systemd/pull/23043
> +Upstream-Status: Backport [
> https://github.com/systemd/systemd/pull/23043/commits/d4f60bdc11d8e627592=
2ca5c7f80b130ebbb3d5f
> ]
> +Comments: Refreshed first two hunks to apply patch cleanly without
> patch-fuzz
> +Signed-off-by: Ranjitsinh Rathod <ranjitsinh.rathod@kpit.com>
> +
> +---
> + src/basic/path-util.c     | 18 ++++++++++++++++++
> + src/basic/path-util.h     |  1 +
> + src/test/test-path-util.c | 27 +++++++++++++++++++++++++++
> + 3 files changed, 46 insertions(+)
> +
> +diff --git a/src/basic/path-util.c b/src/basic/path-util.c
> +index 338377d918..41e0d4d753 100644
> +--- a/src/basic/path-util.c
> ++++ b/src/basic/path-util.c
> +@@ -201,6 +201,24 @@ int path_make_relative(const char *from,
> +         return 0;
> + }
> +
> ++int path_make_relative_parent(const char *from_child, const char *to,
> char **ret) {
> ++        _cleanup_free_ char *from =3D NULL;
> ++        int r;
> ++
> ++        assert(from_child);
> ++        assert(to);
> ++        assert(ret);
> ++
> ++        /* Similar to path_make_relative(), but provides the relative
> path from the parent directory of
> ++         * 'from_child'. This may be useful when creating relative
> symlink. */
> ++
> ++        r =3D path_extract_directory(from_child, &from);
> ++        if (r < 0)
> ++                return r;
> ++
> ++        return path_make_relative(from, to, ret);
> ++}
> ++
> + char* path_startswith_strv(const char *p, char **set) {
> +         char **s, *t;
> +
> +diff --git a/src/basic/path-util.h b/src/basic/path-util.h
> +index 41bbc7bb86..8cd7f512a6 100644
> +--- a/src/basic/path-util.h
> ++++ b/src/basic/path-util.h
> +@@ -57,6 +57,7 @@ char* path_make_absolute(const char *p,
> + int safe_getcwd(char **ret);
> + int path_make_absolute_cwd(const char *p, char **ret);
> + int path_make_relative(const char *from, const char *to, char **ret);
> ++int path_make_relative_parent(const char *from_child, const char *to,
> char **ret);
> + char *path_startswith_full(const char *path, const char *prefix, bool
> accept_dot_dot) _pure_;
> + static inline char* path_startswith(const char *path, const char
> *prefix) {
> +         return path_startswith_full(path, prefix, true);
> +diff --git a/src/test/test-path-util.c b/src/test/test-path-util.c
> +index e0583cfbab..a26e351233 100644
> +--- a/src/test/test-path-util.c
> ++++ b/src/test/test-path-util.c
> +@@ -477,6 +477,33 @@ TEST(path_make_relative) {
> +
>  test_path_make_relative_one("//extra.//.//./.slashes//./won't////fo.ol//=
/anybody//",
> "/././/extra././/.slashes////ar.e/.just/././.fine///",
> "../../../ar.e/.just/.fine");
> + }
> +
> ++static void test_path_make_relative_parent_one(const char *from, const
> char *to, const char *expected) {
> ++        _cleanup_free_ char *z =3D NULL;
> ++        int r;
> ++
> ++        log_info("/* %s(%s, %s) */", __func__, from, to);
> ++
> ++        r =3D path_make_relative_parent(from, to, &z);
> ++        assert_se((r >=3D 0) =3D=3D !!expected);
> ++        assert_se(streq_ptr(z, expected));
> ++}
> ++
> ++TEST(path_make_relative_parent) {
> ++        test_path_make_relative_parent_one("some/relative/path/hoge",
> "/some/path", NULL);
> ++        test_path_make_relative_parent_one("/some/path/hoge",
> "some/relative/path", NULL);
> ++        test_path_make_relative_parent_one("/some/dotdot/../path/hoge",
> "/some/path", NULL);
> ++        test_path_make_relative_parent_one("/", "/aaa", NULL);
> ++
> ++        test_path_make_relative_parent_one("/hoge", "/", ".");
> ++        test_path_make_relative_parent_one("/hoge", "/some/path",
> "some/path");
> ++        test_path_make_relative_parent_one("/some/path/hoge",
> "/some/path", ".");
> ++        test_path_make_relative_parent_one("/some/path/hoge",
> "/some/path/in/subdir", "in/subdir");
> ++        test_path_make_relative_parent_one("/some/path/hoge", "/",
> "../..");
> ++        test_path_make_relative_parent_one("/some/path/hoge",
> "/some/other/path", "../other/path");
> ++        test_path_make_relative_parent_one("/some/path/./dot/hoge",
> "/some/further/path", "../../further/path");
> ++
> test_path_make_relative_parent_one("//extra.//.//./.slashes//./won't////f=
o.ol///anybody//hoge",
> "/././/extra././/.slashes////ar.e/.just/././.fine///",
> "../../../ar.e/.just/.fine");
> ++}
> ++
> + TEST(path_strv_resolve) {
> +         char tmp_dir[] =3D "/tmp/test-path-util-XXXXXX";
> +         _cleanup_strv_free_ char **search_dirs =3D NULL;
> +--
> +2.25.1
> +
> diff --git
> a/meta/recipes-core/systemd/systemd/0005-udev-use-readlinkat_malloc.patch
> b/meta/recipes-core/systemd/systemd/0005-udev-use-readlinkat_malloc.patch
> new file mode 100644
> index 0000000000..42179f2031
> --- /dev/null
> +++
> b/meta/recipes-core/systemd/systemd/0005-udev-use-readlinkat_malloc.patch
> @@ -0,0 +1,74 @@
> +From faadf97500dc8e76350a409c127f3f0fed116f9a Mon Sep 17 00:00:00 2001
> +From: Yu Watanabe <watanabe.yu+github@gmail.com>
> +Date: Mon, 11 Apr 2022 03:29:07 +0900
> +Subject: [PATCH 05/10] udev: use readlinkat_malloc()
> +
> +And try to read it only when the file is symlink.
> +
> +PR - https://github.com/systemd/systemd/pull/23043
> +Upstream-Status: Backport [
> https://github.com/systemd/systemd/pull/23043/commits/faadf97500dc8e76350=
a409c127f3f0fed116f9a
> ]
> +Signed-off-by: Ranjitsinh Rathod <ranjitsinh.rathod@kpit.com>
> +
> +---
> + src/udev/udev-node.c | 20 ++++++++++++--------
> + 1 file changed, 12 insertions(+), 8 deletions(-)
> +
> +diff --git a/src/udev/udev-node.c b/src/udev/udev-node.c
> +index 6ead839a5f..0320f2d041 100644
> +--- a/src/udev/udev-node.c
> ++++ b/src/udev/udev-node.c
> +@@ -147,7 +147,6 @@ static int link_find_prioritized(sd_device *dev, boo=
l
> add, const char *stackdir,
> +                 return r;
> +
> +         FOREACH_DIRENT_ALL(de, dir, break) {
> +-                _cleanup_free_ char *path =3D NULL, *buf =3D NULL;
> +                 int tmp_prio;
> +
> +                 if (de->d_name[0] =3D=3D '.')
> +@@ -157,15 +156,18 @@ static int link_find_prioritized(sd_device *dev,
> bool add, const char *stackdir,
> +                 if (streq(de->d_name, id))
> +                         continue;
> +
> +-                path =3D path_join(stackdir, de->d_name);
> +-                if (!path)
> +-                        return -ENOMEM;
> +-
> +-                if (readlink_malloc(path, &buf) >=3D 0) {
> ++                if (de->d_type =3D=3D DT_LNK) {
> ++                        _cleanup_free_ char *buf =3D NULL;
> +                         char *devnode;
> +
> +                         /* New format. The devnode and priority can be
> obtained from symlink. */
> +
> ++                        r =3D readlinkat_malloc(dirfd(dir), de->d_name,
> &buf);
> ++                        if (r < 0) {
> ++                                log_device_debug_errno(dev, r, "Failed
> to read symlink %s, ignoring: %m", de->d_name);
> ++                                continue;
> ++                        }
> ++
> +                         devnode =3D strchr(buf, ':');
> +                         if (!devnode || devnode =3D=3D buf)
> +                                 continue;
> +@@ -183,7 +185,8 @@ static int link_find_prioritized(sd_device *dev, boo=
l
> add, const char *stackdir,
> +                         r =3D free_and_strdup(&target, devnode);
> +                         if (r < 0)
> +                                 return r;
> +-                } else {
> ++
> ++                } else if (de->d_type =3D=3D DT_REG) {
> +                         _cleanup_(sd_device_unrefp) sd_device *tmp_dev =
=3D
> NULL;
> +                         const char *devnode;
> +
> +@@ -205,7 +208,8 @@ static int link_find_prioritized(sd_device *dev, boo=
l
> add, const char *stackdir,
> +                         r =3D free_and_strdup(&target, devnode);
> +                         if (r < 0)
> +                                 return r;
> +-                }
> ++                } else
> ++                        continue;
> +
> +                 priority =3D tmp_prio;
> +         }
> +--
> +2.25.1
> +
> diff --git
> a/meta/recipes-core/systemd/systemd/0006-udev-rename-link_find_prioritize=
d-and-variables.patch
> b/meta/recipes-core/systemd/systemd/0006-udev-rename-link_find_prioritize=
d-and-variables.patch
> new file mode 100644
> index 0000000000..8fe4c9281c
> --- /dev/null
> +++
> b/meta/recipes-core/systemd/systemd/0006-udev-rename-link_find_prioritize=
d-and-variables.patch
> @@ -0,0 +1,190 @@
> +From 6b01e2905c387002a20b0a38f4b7670c8eb82cb8 Mon Sep 17 00:00:00 2001
> +From: Yu Watanabe <watanabe.yu+github@gmail.com>
> +Date: Mon, 11 Apr 2022 11:56:52 +0900
> +Subject: [PATCH 06/10] udev: rename link_find_prioritized() and variable=
s
> +
> +Also shorten code a bit.
> +
> +Just for consistency with other part and readability of the code.
> +
> +PR - https://github.com/systemd/systemd/pull/23043
> +Upstream-Status: Backport [
> https://github.com/systemd/systemd/pull/23043/commits/6b01e2905c387002a20=
b0a38f4b7670c8eb82cb8
> ]
> +Signed-off-by: Ranjitsinh Rathod <ranjitsinh.rathod@kpit.com>
> +
> +---
> + src/udev/udev-node.c | 62 ++++++++++++++++++++++----------------------
> + 1 file changed, 31 insertions(+), 31 deletions(-)
> +
> +diff --git a/src/udev/udev-node.c b/src/udev/udev-node.c
> +index 0320f2d041..f358564b41 100644
> +--- a/src/udev/udev-node.c
> ++++ b/src/udev/udev-node.c
> +@@ -63,20 +63,21 @@ static int create_symlink(const char *target, const
> char *slink) {
> +         return r;
> + }
> +
> +-static int node_symlink(sd_device *dev, const char *node, const char
> *slink) {
> ++static int node_symlink(sd_device *dev, const char *devnode, const char
> *slink) {
> +         _cleanup_free_ char *slink_dirname =3D NULL, *target =3D NULL;
> +         const char *id, *slink_tmp;
> +-        struct stat stats;
> ++        struct stat st;
> +         int r;
> +
> +         assert(dev);
> +-        assert(node);
> ++        assert(devnode);
> +         assert(slink);
> +
> +-        if (lstat(slink, &stats) >=3D 0) {
> +-                if (!S_ISLNK(stats.st_mode))
> ++        if (lstat(slink, &st) >=3D 0) {
> ++                if (!S_ISLNK(st.st_mode))
> +                         return log_device_debug_errno(dev,
> SYNTHETIC_ERRNO(EEXIST),
> +-                                                      "Conflicting inod=
e
> '%s' found, link to '%s' will not be created.", slink, node);
> ++                                                      "Conflicting inod=
e
> '%s' found, link to '%s' will not be created.",
> ++                                                      slink, devnode);
> +         } else if (errno !=3D ENOENT)
> +                 return log_device_debug_errno(dev, errno, "Failed to
> lstat() '%s': %m", slink);
> +
> +@@ -85,9 +86,9 @@ static int node_symlink(sd_device *dev, const char
> *node, const char *slink) {
> +                 return log_device_debug_errno(dev, r, "Failed to get
> parent directory of '%s': %m", slink);
> +
> +         /* use relative link */
> +-        r =3D path_make_relative(slink_dirname, node, &target);
> ++        r =3D path_make_relative(slink_dirname, devnode, &target);
> +         if (r < 0)
> +-                return log_device_debug_errno(dev, r, "Failed to get
> relative path from '%s' to '%s': %m", slink, node);
> ++                return log_device_debug_errno(dev, r, "Failed to get
> relative path from '%s' to '%s': %m", slink, devnode);
> +
> +         r =3D device_get_device_id(dev, &id);
> +         if (r < 0)
> +@@ -109,36 +110,36 @@ static int node_symlink(sd_device *dev, const char
> *node, const char *slink) {
> +         return 0;
> + }
> +
> +-static int link_find_prioritized(sd_device *dev, bool add, const char
> *stackdir, char **ret) {
> ++static int stack_directory_find_prioritized_devnode(sd_device *dev,
> const char *dirname, bool add, char **ret) {
> +         _cleanup_closedir_ DIR *dir =3D NULL;
> +-        _cleanup_free_ char *target =3D NULL;
> ++        _cleanup_free_ char *devnode =3D NULL;
> +         int r, priority =3D 0;
> +         const char *id;
> +
> +         assert(dev);
> +-        assert(stackdir);
> ++        assert(dirname);
> +         assert(ret);
> +
> +         /* Find device node of device with highest priority. This
> returns 1 if a device found, 0 if no
> +-         * device found, or a negative errno. */
> ++         * device found, or a negative errno on error. */
> +
> +         if (add) {
> +-                const char *devnode;
> ++                const char *n;
> +
> +                 r =3D device_get_devlink_priority(dev, &priority);
> +                 if (r < 0)
> +                         return r;
> +
> +-                r =3D sd_device_get_devname(dev, &devnode);
> ++                r =3D sd_device_get_devname(dev, &n);
> +                 if (r < 0)
> +                         return r;
> +
> +-                target =3D strdup(devnode);
> +-                if (!target)
> ++                devnode =3D strdup(n);
> ++                if (!devnode)
> +                         return -ENOMEM;
> +         }
> +
> +-        dir =3D opendir(stackdir);
> ++        dir =3D opendir(dirname);
> +         if (!dir)
> +                 return -errno;
> +
> +@@ -158,7 +159,7 @@ static int link_find_prioritized(sd_device *dev, boo=
l
> add, const char *stackdir,
> +
> +                 if (de->d_type =3D=3D DT_LNK) {
> +                         _cleanup_free_ char *buf =3D NULL;
> +-                        char *devnode;
> ++                        char *colon;
> +
> +                         /* New format. The devnode and priority can be
> obtained from symlink. */
> +
> +@@ -168,27 +169,25 @@ static int link_find_prioritized(sd_device *dev,
> bool add, const char *stackdir,
> +                                 continue;
> +                         }
> +
> +-                        devnode =3D strchr(buf, ':');
> +-                        if (!devnode || devnode =3D=3D buf)
> ++                        colon =3D strchr(buf, ':');
> ++                        if (!colon || colon =3D=3D buf)
> +                                 continue;
> +
> +-                        *(devnode++) =3D '\0';
> +-                        if (!path_startswith(devnode, "/dev"))
> +-                                continue;
> ++                        *colon =3D '\0';
> +
> +                         if (safe_atoi(buf, &tmp_prio) < 0)
> +                                 continue;
> +
> +-                        if (target && tmp_prio <=3D priority)
> ++                        if (devnode && tmp_prio <=3D priority)
> +                                 continue;
> +
> +-                        r =3D free_and_strdup(&target, devnode);
> ++                        r =3D free_and_strdup(&devnode, colon + 1);
> +                         if (r < 0)
> +                                 return r;
> +
> +                 } else if (de->d_type =3D=3D DT_REG) {
> +                         _cleanup_(sd_device_unrefp) sd_device *tmp_dev =
=3D
> NULL;
> +-                        const char *devnode;
> ++                        const char *val;
> +
> +                         /* Old format. The devnode and priority must be
> obtained from uevent and
> +                          * udev database files. */
> +@@ -199,22 +198,23 @@ static int link_find_prioritized(sd_device *dev,
> bool add, const char *stackdir,
> +                         if (device_get_devlink_priority(tmp_dev,
> &tmp_prio) < 0)
> +                                 continue;
> +
> +-                        if (target && tmp_prio <=3D priority)
> ++                        if (devnode && tmp_prio <=3D priority)
> +                                 continue;
> +
> +-                        if (sd_device_get_devname(tmp_dev, &devnode) < =
0)
> ++                        if (sd_device_get_devname(tmp_dev, &val) < 0)
> +                                 continue;
> +
> +-                        r =3D free_and_strdup(&target, devnode);
> ++                        r =3D free_and_strdup(&devnode, val);
> +                         if (r < 0)
> +                                 return r;
> ++
> +                 } else
> +                         continue;
> +
> +                 priority =3D tmp_prio;
> +         }
> +
> +-        *ret =3D TAKE_PTR(target);
> ++        *ret =3D TAKE_PTR(devnode);
> +         return !!*ret;
> + }
> +
> +@@ -443,7 +443,7 @@ static int link_update(sd_device *dev, const char
> *slink, bool add) {
> +                 if (stat(dirname, &st1) < 0 && errno !=3D ENOENT)
> +                         return log_device_debug_errno(dev, errno,
> "Failed to stat %s: %m", dirname);
> +
> +-                r =3D link_find_prioritized(dev, add, dirname, &target)=
;
> ++                r =3D stack_directory_find_prioritized_devnode(dev,
> dirname, add, &target);
> +                 if (r < 0)
> +                         return log_device_debug_errno(dev, r, "Failed t=
o
> determine device node with the highest priority for '%s': %m", slink);
> +                 if (r =3D=3D 0) {
> +--
> +2.25.1
> +
> diff --git
> a/meta/recipes-core/systemd/systemd/0007-udev-use-path_make_relative_pare=
nt.patch
> b/meta/recipes-core/systemd/systemd/0007-udev-use-path_make_relative_pare=
nt.patch
> new file mode 100644
> index 0000000000..6a0ea22672
> --- /dev/null
> +++
> b/meta/recipes-core/systemd/systemd/0007-udev-use-path_make_relative_pare=
nt.patch
> @@ -0,0 +1,43 @@
> +From d6595c5ced636d44dc40adfb0b7cfc929bcac7a3 Mon Sep 17 00:00:00 2001
> +From: Yu Watanabe <watanabe.yu+github@gmail.com>
> +Date: Mon, 11 Apr 2022 12:05:36 +0900
> +Subject: [PATCH 07/10] udev: use path_make_relative_parent()
> +
> +PR - https://github.com/systemd/systemd/pull/23043
> +Upstream-Status: Backport [
> https://github.com/systemd/systemd/pull/23043/commits/d6595c5ced636d44dc4=
0adfb0b7cfc929bcac7a3
> ]
> +Signed-off-by: Ranjitsinh Rathod <ranjitsinh.rathod@kpit.com>
> +
> +---
> + src/udev/udev-node.c | 8 ++------
> + 1 file changed, 2 insertions(+), 6 deletions(-)
> +
> +diff --git a/src/udev/udev-node.c b/src/udev/udev-node.c
> +index f358564b41..5a011cf86b 100644
> +--- a/src/udev/udev-node.c
> ++++ b/src/udev/udev-node.c
> +@@ -64,7 +64,7 @@ static int create_symlink(const char *target, const
> char *slink) {
> + }
> +
> + static int node_symlink(sd_device *dev, const char *devnode, const char
> *slink) {
> +-        _cleanup_free_ char *slink_dirname =3D NULL, *target =3D NULL;
> ++        _cleanup_free_ char *target =3D NULL;
> +         const char *id, *slink_tmp;
> +         struct stat st;
> +         int r;
> +@@ -81,12 +81,8 @@ static int node_symlink(sd_device *dev, const char
> *devnode, const char *slink)
> +         } else if (errno !=3D ENOENT)
> +                 return log_device_debug_errno(dev, errno, "Failed to
> lstat() '%s': %m", slink);
> +
> +-        r =3D path_extract_directory(slink, &slink_dirname);
> +-        if (r < 0)
> +-                return log_device_debug_errno(dev, r, "Failed to get
> parent directory of '%s': %m", slink);
> +-
> +         /* use relative link */
> +-        r =3D path_make_relative(slink_dirname, devnode, &target);
> ++        r =3D path_make_relative_parent(slink, devnode, &target);
> +         if (r < 0)
> +                 return log_device_debug_errno(dev, r, "Failed to get
> relative path from '%s' to '%s': %m", slink, devnode);
> +
> +--
> +2.25.1
> +
> diff --git
> a/meta/recipes-core/systemd/systemd/0008-udev-make-node_symlink-accept-NU=
LL-devname.patch
> b/meta/recipes-core/systemd/systemd/0008-udev-make-node_symlink-accept-NU=
LL-devname.patch
> new file mode 100644
> index 0000000000..cb29367f4d
> --- /dev/null
> +++
> b/meta/recipes-core/systemd/systemd/0008-udev-make-node_symlink-accept-NU=
LL-devname.patch
> @@ -0,0 +1,75 @@
> +From 541a463fd5aad912c07c88d84e5a1c597c810956 Mon Sep 17 00:00:00 2001
> +From: Yu Watanabe <watanabe.yu+github@gmail.com>
> +Date: Mon, 11 Apr 2022 12:08:06 +0900
> +Subject: [PATCH 08/10] udev: make node_symlink() accept NULL devname
> +
> +PR - https://github.com/systemd/systemd/pull/23043
> +Upstream-Status: Backport [
> https://github.com/systemd/systemd/pull/23043/commits/541a463fd5aad912c07=
c88d84e5a1c597c810956
> ]
> +Signed-off-by: Ranjitsinh Rathod <ranjitsinh.rathod@kpit.com>
> +
> +---
> + src/udev/udev-node.c | 24 +++++++++---------------
> + 1 file changed, 9 insertions(+), 15 deletions(-)
> +
> +diff --git a/src/udev/udev-node.c b/src/udev/udev-node.c
> +index 5a011cf86b..8e78546e18 100644
> +--- a/src/udev/udev-node.c
> ++++ b/src/udev/udev-node.c
> +@@ -70,13 +70,18 @@ static int node_symlink(sd_device *dev, const char
> *devnode, const char *slink)
> +         int r;
> +
> +         assert(dev);
> +-        assert(devnode);
> +         assert(slink);
> +
> ++        if (!devnode) {
> ++                r =3D sd_device_get_devname(dev, &devnode);
> ++                if (r < 0)
> ++                        return log_device_debug_errno(dev, r, "Failed t=
o
> get device node: %m");
> ++        }
> ++
> +         if (lstat(slink, &st) >=3D 0) {
> +                 if (!S_ISLNK(st.st_mode))
> +                         return log_device_debug_errno(dev,
> SYNTHETIC_ERRNO(EEXIST),
> +-                                                      "Conflicting inod=
e
> '%s' found, link to '%s' will not be created.",
> ++                                                      "Conflicting inod=
e
> '%s' found, symlink to '%s' will not be created.",
> +                                                       slink, devnode);
> +         } else if (errno !=3D ENOENT)
> +                 return log_device_debug_errno(dev, errno, "Failed to
> lstat() '%s': %m", slink);
> +@@ -488,23 +493,12 @@ static int device_get_devpath_by_devnum(sd_device
> *dev, char **ret) {
> +
> + int udev_node_update(sd_device *dev, sd_device *dev_old) {
> +         _cleanup_free_ char *filename =3D NULL;
> +-        const char *devnode, *devlink;
> ++        const char *devlink;
> +         int r;
> +
> +         assert(dev);
> +         assert(dev_old);
> +
> +-        r =3D sd_device_get_devname(dev, &devnode);
> +-        if (r < 0)
> +-                return log_device_debug_errno(dev, r, "Failed to get
> devnode: %m");
> +-
> +-        if (DEBUG_LOGGING) {
> +-                const char *id =3D NULL;
> +-
> +-                (void) device_get_device_id(dev, &id);
> +-                log_device_debug(dev, "Handling device node '%s',
> devnum=3D%s", devnode, strna(id));
> +-        }
> +-
> +         /* update possible left-over symlinks */
> +         FOREACH_DEVICE_DEVLINK(dev_old, devlink) {
> +                 /* check if old link name still belongs to this device =
*/
> +@@ -536,7 +530,7 @@ int udev_node_update(sd_device *dev, sd_device
> *dev_old) {
> +                 return log_device_debug_errno(dev, r, "Failed to get
> device path: %m");
> +
> +         /* always add /dev/{block,char}/$major:$minor */
> +-        r =3D node_symlink(dev, devnode, filename);
> ++        r =3D node_symlink(dev, NULL, filename);
> +         if (r < 0)
> +                 return log_device_warning_errno(dev, r, "Failed to
> create device symlink '%s': %m", filename);
> +
> +--
> +2.25.1
> +
> diff --git
> a/meta/recipes-core/systemd/systemd/0009-udev-use-flock-when-updating-dev=
ice-node-symlinks.patch
> b/meta/recipes-core/systemd/systemd/0009-udev-use-flock-when-updating-dev=
ice-node-symlinks.patch
> new file mode 100644
> index 0000000000..96ce076378
> --- /dev/null
> +++
> b/meta/recipes-core/systemd/systemd/0009-udev-use-flock-when-updating-dev=
ice-node-symlinks.patch
> @@ -0,0 +1,277 @@
> +From 57a272902aa821f9598dd0d74eab98d287473a63 Mon Sep 17 00:00:00 2001
> +From: Yu Watanabe <watanabe.yu+github@gmail.com>
> +Date: Mon, 11 Apr 2022 12:17:23 +0900
> +Subject: [PATCH 09/10] udev: use flock() when updating device node
> symlinks
> +
> +By locking the stack directory, we can safely determine the device node
> +with the highest priority for a symlink. So, the multiple try-and-wait
> +loops can be dropped, and the code becomes quite simple.
> +
> +PR - https://github.com/systemd/systemd/pull/23043
> +Upstream-Status: Backport [
> https://github.com/systemd/systemd/pull/23043/commits/57a272902aa821f9598=
dd0d74eab98d287473a63
> ]
> +Signed-off-by: Ranjitsinh Rathod <ranjitsinh.rathod@kpit.com>
> +
> +---
> + src/udev/udev-node.c | 173 ++++++++++---------------------------------
> + 1 file changed, 40 insertions(+), 133 deletions(-)
> +
> +diff --git a/src/udev/udev-node.c b/src/udev/udev-node.c
> +index 8e78546e18..42efaaa028 100644
> +--- a/src/udev/udev-node.c
> ++++ b/src/udev/udev-node.c
> +@@ -1,11 +1,6 @@
> + /* SPDX-License-Identifier: GPL-2.0-or-later */
> +
> +-#include <errno.h>
> +-#include <fcntl.h>
> +-#include <stdbool.h>
> +-#include <stddef.h>
> +-#include <sys/stat.h>
> +-#include <unistd.h>
> ++#include <sys/file.h>
> +
> + #include "sd-id128.h"
> +
> +@@ -22,47 +17,15 @@
> + #include "mkdir-label.h"
> + #include "parse-util.h"
> + #include "path-util.h"
> +-#include "random-util.h"
> + #include "selinux-util.h"
> + #include "smack-util.h"
> + #include "stat-util.h"
> +-#include "stdio-util.h"
> + #include "string-util.h"
> +-#include "strxcpyx.h"
> +-#include "time-util.h"
> + #include "udev-node.h"
> + #include "user-util.h"
> +
> +-#define CREATE_LINK_MAX_RETRIES        128
> +-#define LINK_UPDATE_MAX_RETRIES        128
> +-#define UPDATE_TIMESTAMP_MAX_RETRIES   128
> +-#define MAX_RANDOM_DELAY (250 * USEC_PER_MSEC)
> +-#define MIN_RANDOM_DELAY ( 50 * USEC_PER_MSEC)
> + #define UDEV_NODE_HASH_KEY
> SD_ID128_MAKE(b9,6a,f1,ce,40,31,44,1a,9e,19,ec,8b,ae,f3,e3,2f)
> +
> +-static int create_symlink(const char *target, const char *slink) {
> +-        int r;
> +-
> +-        assert(target);
> +-        assert(slink);
> +-
> +-        for (unsigned i =3D 0; i < CREATE_LINK_MAX_RETRIES; i++) {
> +-                r =3D mkdir_parents_label(slink, 0755);
> +-                if (r =3D=3D -ENOENT)
> +-                        continue;
> +-                if (r < 0)
> +-                        return r;
> +-
> +-                mac_selinux_create_file_prepare(slink, S_IFLNK);
> +-                r =3D RET_NERRNO(symlink(target, slink));
> +-                mac_selinux_create_file_clear();
> +-                if (r !=3D -ENOENT)
> +-                        return r;
> +-        }
> +-
> +-        return r;
> +-}
> +-
> + static int node_symlink(sd_device *dev, const char *devnode, const char
> *slink) {
> +         _cleanup_free_ char *target =3D NULL;
> +         const char *id, *slink_tmp;
> +@@ -98,7 +61,13 @@ static int node_symlink(sd_device *dev, const char
> *devnode, const char *slink)
> +         slink_tmp =3D strjoina(slink, ".tmp-", id);
> +         (void) unlink(slink_tmp);
> +
> +-        r =3D create_symlink(target, slink_tmp);
> ++        r =3D mkdir_parents_label(slink_tmp, 0755);
> ++        if (r < 0)
> ++                return log_device_debug_errno(dev, r, "Failed to create
> parent directory of '%s': %m", slink_tmp);
> ++
> ++        mac_selinux_create_file_prepare(slink_tmp, S_IFLNK);
> ++        r =3D RET_NERRNO(symlink(target, slink_tmp));
> ++        mac_selinux_create_file_clear();
> +         if (r < 0)
> +                 return log_device_debug_errno(dev, r, "Failed to create
> symlink '%s' to '%s': %m", slink_tmp, target);
> +
> +@@ -219,54 +188,7 @@ static int
> stack_directory_find_prioritized_devnode(sd_device *dev, const char *
> +         return !!*ret;
> + }
> +
> +-static int update_timestamp(sd_device *dev, int fd, struct stat *prev) =
{
> +-        assert(fd >=3D 0);
> +-        assert(prev);
> +-
> +-        /* Even if a symlink in the stack directory is created/removed,
> the mtime of the directory may
> +-         * not be changed. Why? Let's consider the following situation.
> For simplicity, let's assume
> +-         * there exist two udev workers (A and B) and all of them calls
> link_update() for the same
> +-         * devlink simultaneously.
> +-         *
> +-         * 1. A creates/removes a symlink in the stack directory.
> +-         * 2. A calls the first stat() in the loop of link_update().
> +-         * 3. A calls link_find_prioritized().
> +-         * 4. B creates/removes another symlink in the stack directory,
> so the result of the step 3 is outdated.
> +-         * 5. B finishes link_update().
> +-         * 6. A creates/removes devlink according to the outdated resul=
t
> in the step 3.
> +-         * 7. A calls the second stat() in the loop of link_update().
> +-         *
> +-         * If these 7 steps are processed in this order within a short
> time period that kernel's timer
> +-         * does not increase, then even if the contents in the stack
> directory is changed, the results
> +-         * of two stat() called by A shows the same timestamp, and A
> cannot detect the change.
> +-         *
> +-         * By calling this function after creating/removing symlinks in
> the stack directory, the
> +-         * timestamp of the stack directory is always increased at leas=
t
> in the above step 5, so A can
> +-         * detect the update. */
> +-
> +-        for (unsigned i =3D 0; i < UPDATE_TIMESTAMP_MAX_RETRIES; i++) {
> +-                struct stat st;
> +-
> +-                if (fstat(fd, &st) < 0)
> +-                        return -errno;
> +-
> +-                if (!stat_inode_unmodified(prev, &st))
> +-                        return 0;
> +-
> +-                log_device_debug(dev,
> +-                                 "Stack directory is modified, but its
> timestamp is not changed, "
> +-                                 "updating timestamp after 10ms.");
> +-
> +-                (void) usleep(10 * USEC_PER_MSEC);
> +-                if (futimens(fd, NULL) < 0)
> +-                        return -errno;
> +-        }
> +-
> +-        return -ELOOP;
> +-}
> +-
> + static int stack_directory_update(sd_device *dev, int fd, bool add) {
> +-        struct stat st;
> +         const char *id;
> +         int r;
> +
> +@@ -277,9 +199,6 @@ static int stack_directory_update(sd_device *dev, in=
t
> fd, bool add) {
> +         if (r < 0)
> +                 return r;
> +
> +-        if (fstat(fd, &st) < 0)
> +-                return -errno;
> +-
> +         if (add) {
> +                 _cleanup_free_ char *data =3D NULL, *buf =3D NULL;
> +                 const char *devname;
> +@@ -312,11 +231,7 @@ static int stack_directory_update(sd_device *dev,
> int fd, bool add) {
> +                 }
> +         }
> +
> +-        r =3D update_timestamp(dev, fd, &st);
> +-        if (r < 0)
> +-                return r;
> +-
> +-        return 0;
> ++        return 1; /* Updated. */
> + }
> +
> + static int stack_directory_open(const char *dirname) {
> +@@ -336,6 +251,21 @@ static int stack_directory_open(const char *dirname=
)
> {
> +         return TAKE_FD(fd);
> + }
> +
> ++static int stack_directory_lock(int dirfd) {
> ++        _cleanup_close_ int fd =3D -1;
> ++
> ++        assert(dirfd >=3D 0);
> ++
> ++        fd =3D openat(dirfd, ".lock", O_CLOEXEC | O_NOFOLLOW | O_RDONLY=
 |
> O_CREAT, 0600);
> ++        if (fd < 0)
> ++                return -errno;
> ++
> ++        if (flock(fd, LOCK_EX) < 0)
> ++                return -errno;
> ++
> ++        return TAKE_FD(fd);
> ++}
> ++
> + size_t udev_node_escape_path(const char *src, char *dest, size_t size) =
{
> +         size_t i, j;
> +         uint64_t h;
> +@@ -410,8 +340,8 @@ static int stack_directory_get_name(const char
> *slink, char **ret) {
> + }
> +
> + static int link_update(sd_device *dev, const char *slink, bool add) {
> +-        _cleanup_free_ char *dirname =3D NULL;
> +-        _cleanup_close_ int dirfd =3D -1;
> ++        _cleanup_free_ char *dirname =3D NULL, *devnode =3D NULL;
> ++        _cleanup_close_ int dirfd =3D -1, lockfd =3D -1;
> +         int r;
> +
> +         assert(dev);
> +@@ -425,51 +355,28 @@ static int link_update(sd_device *dev, const char
> *slink, bool add) {
> +         if (dirfd < 0)
> +                 return log_device_debug_errno(dev, dirfd, "Failed to
> open stack directory '%s': %m", dirname);
> +
> ++        lockfd =3D stack_directory_lock(dirfd);
> ++        if (lockfd < 0)
> ++                return log_device_debug_errno(dev, lockfd, "Failed to
> lock stack directory '%s': %m", dirname);
> ++
> +         r =3D stack_directory_update(dev, dirfd, add);
> +         if (r < 0)
> +                 return log_device_debug_errno(dev, r, "Failed to update
> stack directory '%s': %m", dirname);
> +
> +-        for (unsigned i =3D 0; i < LINK_UPDATE_MAX_RETRIES; i++) {
> +-                _cleanup_free_ char *target =3D NULL;
> +-                struct stat st1 =3D {}, st2 =3D {};
> +-
> +-                if (i > 0) {
> +-                        usec_t delay =3D MIN_RANDOM_DELAY +
> random_u64_range(MAX_RANDOM_DELAY - MIN_RANDOM_DELAY);
> +-
> +-                        log_device_debug(dev, "Directory %s was updated=
,
> retrying to update devlink %s after %s.",
> +-                                         dirname, slink,
> FORMAT_TIMESPAN(delay, USEC_PER_MSEC));
> +-                        (void) usleep(delay);
> +-                }
> +-
> +-                if (stat(dirname, &st1) < 0 && errno !=3D ENOENT)
> +-                        return log_device_debug_errno(dev, errno,
> "Failed to stat %s: %m", dirname);
> +-
> +-                r =3D stack_directory_find_prioritized_devnode(dev,
> dirname, add, &target);
> +-                if (r < 0)
> +-                        return log_device_debug_errno(dev, r, "Failed t=
o
> determine device node with the highest priority for '%s': %m", slink);
> +-                if (r =3D=3D 0) {
> +-                        log_device_debug(dev, "No reference left for
> '%s', removing", slink);
> +-
> +-                        if (unlink(slink) < 0 && errno !=3D ENOENT)
> +-                                log_device_debug_errno(dev, errno,
> "Failed to remove '%s', ignoring: %m", slink);
> ++        r =3D stack_directory_find_prioritized_devnode(dev, dirname, ad=
d,
> &devnode);
> ++        if (r < 0)
> ++                return log_device_debug_errno(dev, r, "Failed to
> determine device node with the highest priority for '%s': %m", slink);
> ++        if (r > 0)
> ++                return node_symlink(dev, devnode, slink);
> +
> +-                        (void) rmdir_parents(slink, "/dev");
> +-                        return 0;
> +-                }
> ++        log_device_debug(dev, "No reference left for '%s', removing",
> slink);
> +
> +-                r =3D node_symlink(dev, target, slink);
> +-                if (r < 0)
> +-                        return r;
> ++        if (unlink(slink) < 0 && errno !=3D ENOENT)
> ++                log_device_debug_errno(dev, errno, "Failed to remove
> '%s', ignoring: %m", slink);
> +
> +-                if (stat(dirname, &st2) < 0 && errno !=3D ENOENT)
> +-                        return log_device_debug_errno(dev, errno,
> "Failed to stat %s: %m", dirname);
> ++        (void) rmdir_parents(slink, "/dev");
> +
> +-                if (((st1.st_mode & S_IFMT) =3D=3D 0 && (st2.st_mode &
> S_IFMT) =3D=3D 0) ||
> +-                    stat_inode_unmodified(&st1, &st2))
> +-                        return 0;
> +-        }
> +-
> +-        return -ELOOP;
> ++        return 0;
> + }
> +
> + static int device_get_devpath_by_devnum(sd_device *dev, char **ret) {
> +--
> +2.25.1
> +
> diff --git
> a/meta/recipes-core/systemd/systemd/0010-udev-cleanup-stack-directory-run=
-udev-links-when-all.patch
> b/meta/recipes-core/systemd/systemd/0010-udev-cleanup-stack-directory-run=
-udev-links-when-all.patch
> new file mode 100644
> index 0000000000..7a6f614db7
> --- /dev/null
> +++
> b/meta/recipes-core/systemd/systemd/0010-udev-cleanup-stack-directory-run=
-udev-links-when-all.patch
> @@ -0,0 +1,130 @@
> +From 1055172804e660df2e1c498dafa998ffd65e0c88 Mon Sep 17 00:00:00 2001
> +From: Yu Watanabe <watanabe.yu+github@gmail.com>
> +Date: Mon, 11 Apr 2022 21:52:49 +0900
> +Subject: [PATCH 10/10] udev: cleanup stack directory /run/udev/links whe=
n
> all
> + workers exited
> +
> +By the previous commit, the stack directories are not removed even if
> +it is empty. To reduce the inode usage of /run, let's cleanup the
> +directories.
> +
> +PR - https://github.com/systemd/systemd/pull/23043
> +Upstream-Status: Backport [
> https://github.com/systemd/systemd/pull/23043/commits/1055172804e660df2e1=
c498dafa998ffd65e0c88
> ]
> +Comments: Refreshed all hunks to apply patch cleanly without patch-fuzz
> +Signed-off-by: Ranjitsinh Rathod <ranjitsinh.rathod@kpit.com>
> +
> +---
> + src/udev/udev-node.c | 42 ++++++++++++++++++++++++++++++++++++++++++
> + src/udev/udev-node.h |  1 +
> + src/udev/udevd.c     | 10 ++++++++++
> + 3 files changed, 53 insertions(+)
> +
> +diff --git a/src/udev/udev-node.c b/src/udev/udev-node.c
> +index 42efaaa028..4e7dca06de 100644
> +--- a/src/udev/udev-node.c
> ++++ b/src/udev/udev-node.c
> +@@ -24,6 +24,48 @@
> +
> + #define UDEV_NODE_HASH_KEY
> SD_ID128_MAKE(b9,6a,f1,ce,40,31,44,1a,9e,19,ec,8b,ae,f3,e3,2f)
> +
> ++int udev_node_cleanup(void) {
> ++        _cleanup_closedir_ DIR *dir =3D NULL;
> ++
> ++        /* This must not be called when any workers exist. It would
> cause a race between mkdir() called
> ++         * by stack_directory_lock() and unlinkat() called by this. */
> ++
> ++        dir =3D opendir("/run/udev/links");
> ++        if (!dir) {
> ++                if (errno =3D=3D ENOENT)
> ++                        return 0;
> ++
> ++                return log_debug_errno(errno, "Failed to open directory
> '/run/udev/links', ignoring: %m");
> ++        }
> ++
> ++        FOREACH_DIRENT_ALL(de, dir, break) {
> ++                _cleanup_free_ char *lockfile =3D NULL;
> ++
> ++                if (de->d_name[0] =3D=3D '.')
> ++                        continue;
> ++
> ++                if (de->d_type !=3D DT_DIR)
> ++                        continue;
> ++
> ++                /* As commented in the above, this is called when no
> worker exists, hence the file is not
> ++                 * locked. On a later uevent, the lock file will be
> created if necessary. So, we can safely
> ++                 * remove the file now. */
> ++                lockfile =3D path_join(de->d_name, ".lock");
> ++                if (!lockfile)
> ++                        return log_oom_debug();
> ++
> ++                if (unlinkat(dirfd(dir), lockfile, 0) < 0 && errno !=3D
> ENOENT) {
> ++                        log_debug_errno(errno, "Failed to remove
> '/run/udev/links/%s', ignoring: %m", lockfile);
> ++                        continue;
> ++                }
> ++
> ++                if (unlinkat(dirfd(dir), de->d_name, AT_REMOVEDIR) < 0
> && errno !=3D ENOTEMPTY)
> ++                        log_debug_errno(errno, "Failed to remove
> '/run/udev/links/%s', ignoring: %m", de->d_name);
> ++        }
> ++
> ++        return 0;
> ++}
> ++
> + static int node_symlink(sd_device *dev, const char *devnode, const char
> *slink) {
> +         _cleanup_free_ char *target =3D NULL;
> +         const char *id, *slink_tmp;
> +diff --git a/src/udev/udev-node.h b/src/udev/udev-node.h
> +index 86a829545a..0c545e4a0f 100644
> +--- a/src/udev/udev-node.h
> ++++ b/src/udev/udev-node.h
> +@@ -17,5 +17,6 @@ int udev_node_apply_permissions(
> +                 OrderedHashmap *seclabel_list);
> + int udev_node_remove(sd_device *dev);
> + int udev_node_update(sd_device *dev, sd_device *dev_old);
> ++int udev_node_cleanup(void);
> +
> + size_t udev_node_escape_path(const char *src, char *dest, size_t size);
> +diff --git a/src/udev/udevd.c b/src/udev/udevd.c
> +index b179dfac37..c519e19897 100644
> +--- a/src/udev/udevd.c
> ++++ b/src/udev/udevd.c
> +@@ -62,6 +62,7 @@
> + #include "udev-builtin.h"
> + #include "udev-ctrl.h"
> + #include "udev-event.h"
> ++#include "udev-node.h"
> + #include "udev-util.h"
> + #include "udev-watch.h"
> + #include "user-util.h"
> +@@ -106,6 +107,7 @@ typedef struct Manager {
> +
> +         usec_t last_usec;
> +
> ++        bool udev_node_needs_cleanup;
> +         bool stop_exec_queue;
> +         bool exit;
> + } Manager;
> +@@ -933,6 +935,9 @@ static int event_queue_start(Manager *ma
> +                 manager->last_usec =3D usec;
> +         }
> +
> ++        /* To make the stack directory /run/udev/links cleaned up later=
.
> */
> ++        manager->udev_node_needs_cleanup =3D true;
> ++
> +         r =3D event_source_disable(manager->kill_workers_event);
> +         if (r < 0)
> +                 log_warning_errno(r, "Failed to disable event source fo=
r
> cleaning up idle workers, ignoring: %m");
> +@@ -1487,6 +1492,11 @@ static int on_post(sd_event_source *s, v
> +
> +         /* There are no idle workers. */
> +
> ++        if (manager->udev_node_needs_cleanup) {
> ++                (void) udev_node_cleanup();
> ++                manager->udev_node_needs_cleanup =3D false;
> ++        }
> ++
> +         if (manager->exit)
> +                 return sd_event_exit(manager->event, 0);
> +
> +--
> +2.25.1
> +
> diff --git a/meta/recipes-core/systemd/systemd_250.5.bb
> b/meta/recipes-core/systemd/systemd_250.5.bb
> index 4d520c85f3..22ebc0a229 100644
> --- a/meta/recipes-core/systemd/systemd_250.5.bb
> +++ b/meta/recipes-core/systemd/systemd_250.5.bb
> @@ -34,6 +34,16 @@ SRC_URI +=3D "file://touchscreen.rules \
>
> file://0001-nspawn-make-sure-host-root-can-write-to-the-uidmappe.patch \
>             file://CVE-2023-7008.patch \
>             file://fix-vlan-qos-mapping.patch \
> +           file://0001-udev-move-udev_node_escape_path.patch \
> +
>  file://0002-udev-split-link_update-and-introduce-stack_directory.patch \
> +
>  file://0003-udev-do-not-remove-stack-directory-even-if-it-is-emp.patch \
> +
>  file://0004-path-util-introduce-path_make_relative_parent.patch \
> +           file://0005-udev-use-readlinkat_malloc.patch \
> +
>  file://0006-udev-rename-link_find_prioritized-and-variables.patch \
> +           file://0007-udev-use-path_make_relative_parent.patch \
> +           file://0008-udev-make-node_symlink-accept-NULL-devname.patch =
\
> +
>  file://0009-udev-use-flock-when-updating-device-node-symlinks.patch \
> +
>  file://0010-udev-cleanup-stack-directory-run-udev-links-when-all.patch \
>             "
>
>  # patches needed by musl
> --
> 2.25.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#199203):
> https://lists.openembedded.org/g/openembedded-core/message/199203
> Mute This Topic: https://lists.openembedded.org/mt/106034797/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> alex.kanavin@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--000000000000cd33b2061826a095
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">Perhaps it=E2=80=99s better to provide a newer systemd in=
cluding these patches via a mixin layer? It=E2=80=99s an invasive backport =
and not really suitable for lts.</div><div dir=3D"auto"><br></div><div dir=
=3D"auto">Alex</div><div><br><div class=3D"gmail_quote"><div dir=3D"ltr" cl=
ass=3D"gmail_attr">On Sat 11. May 2024 at 6.08, Ranjitsinh Rathod via <a hr=
ef=3D"http://lists.openembedded.org">lists.openembedded.org</a> &lt;ranjits=
inhrathod1991=3D<a href=3D"mailto:gmail.com@lists.openembedded.org">gmail.c=
om@lists.openembedded.org</a>&gt; wrote:<br></div><blockquote class=3D"gmai=
l_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left-width:1px;border-lef=
t-style:solid;padding-left:1ex;border-left-color:rgb(204,204,204)">From: Ra=
njitsinh Rathod &lt;<a href=3D"mailto:ranjitsinh.rathod@kpit.com" target=3D=
"_blank">ranjitsinh.rathod@kpit.com</a>&gt;<br>
<br>
Below upstream systemd PR fixes overall delay in systemd-udev in<br>
initialization by removing multiple for loops along with delays in those<br=
>
loops<br>
By applying these patches from the PR improves almost 800 - 900 ms in<br>
the initialization<br>
By this system boots up fasts and also avoids some issues related to<br>
this delay<br>
<br>
PR link: <a href=3D"https://github.com/systemd/systemd/pull/23043" rel=3D"n=
oreferrer" target=3D"_blank">https://github.com/systemd/systemd/pull/23043<=
/a><br>
<br>
Signed-off-by: Ranjitsinh Rathod &lt;<a href=3D"mailto:ranjitsinh.rathod@kp=
it.com" target=3D"_blank">ranjitsinh.rathod@kpit.com</a>&gt;<br>
Signed-off-by: Ranjitsinh Rathod &lt;<a href=3D"mailto:ranjitsinhrathod1991=
@gmail.com" target=3D"_blank">ranjitsinhrathod1991@gmail.com</a>&gt;<br>
---<br>
=C2=A0...0001-udev-move-udev_node_escape_path.patch | 120 ++++++++<br>
=C2=A0...update-and-introduce-stack_directory.patch |=C2=A0 90 ++++++<br>
=C2=A0...ve-stack-directory-even-if-it-is-emp.patch | 267 +++++++++++++++++=
<br>
=C2=A0...-introduce-path_make_relative_parent.patch |=C2=A0 99 +++++++<br>
=C2=A0.../0005-udev-use-readlinkat_malloc.patch=C2=A0 =C2=A0 =C2=A0|=C2=A0 =
74 +++++<br>
=C2=A0...-link_find_prioritized-and-variables.patch | 190 ++++++++++++<br>
=C2=A0...7-udev-use-path_make_relative_parent.patch |=C2=A0 43 +++<br>
=C2=A0...ake-node_symlink-accept-NULL-devname.patch |=C2=A0 75 +++++<br>
=C2=A0...k-when-updating-device-node-symlinks.patch | 277 +++++++++++++++++=
+<br>
=C2=A0...ck-directory-run-udev-links-when-all.patch | 130 ++++++++<br>
=C2=A0meta/recipes-core/systemd/<a href=3D"http://systemd_250.5.bb" rel=3D"=
noreferrer" target=3D"_blank">systemd_250.5.bb</a>=C2=A0 =C2=A0 |=C2=A0 10 =
+<br>
=C2=A011 files changed, 1375 insertions(+)<br>
=C2=A0create mode 100644 meta/recipes-core/systemd/systemd/0001-udev-move-u=
dev_node_escape_path.patch<br>
=C2=A0create mode 100644 meta/recipes-core/systemd/systemd/0002-udev-split-=
link_update-and-introduce-stack_directory.patch<br>
=C2=A0create mode 100644 meta/recipes-core/systemd/systemd/0003-udev-do-not=
-remove-stack-directory-even-if-it-is-emp.patch<br>
=C2=A0create mode 100644 meta/recipes-core/systemd/systemd/0004-path-util-i=
ntroduce-path_make_relative_parent.patch<br>
=C2=A0create mode 100644 meta/recipes-core/systemd/systemd/0005-udev-use-re=
adlinkat_malloc.patch<br>
=C2=A0create mode 100644 meta/recipes-core/systemd/systemd/0006-udev-rename=
-link_find_prioritized-and-variables.patch<br>
=C2=A0create mode 100644 meta/recipes-core/systemd/systemd/0007-udev-use-pa=
th_make_relative_parent.patch<br>
=C2=A0create mode 100644 meta/recipes-core/systemd/systemd/0008-udev-make-n=
ode_symlink-accept-NULL-devname.patch<br>
=C2=A0create mode 100644 meta/recipes-core/systemd/systemd/0009-udev-use-fl=
ock-when-updating-device-node-symlinks.patch<br>
=C2=A0create mode 100644 meta/recipes-core/systemd/systemd/0010-udev-cleanu=
p-stack-directory-run-udev-links-when-all.patch<br>
<br>
diff --git a/meta/recipes-core/systemd/systemd/0001-udev-move-udev_node_esc=
ape_path.patch b/meta/recipes-core/systemd/systemd/0001-udev-move-udev_node=
_escape_path.patch<br>
new file mode 100644<br>
index 0000000000..900ca81170<br>
--- /dev/null<br>
+++ b/meta/recipes-core/systemd/systemd/0001-udev-move-udev_node_escape_pat=
h.patch<br>
@@ -0,0 +1,120 @@<br>
+From b9168275c39a190441fee73ba1c8a64515fd3b0e Mon Sep 17 00:00:00 2001<br>
+From: Yu Watanabe &lt;<a href=3D"mailto:watanabe.yu%2Bgithub@gmail.com" ta=
rget=3D"_blank">watanabe.yu+github@gmail.com</a>&gt;<br>
+Date: Mon, 11 Apr 2022 11:25:37 +0900<br>
+Subject: [PATCH 01/10] udev: move udev_node_escape_path()<br>
+<br>
+No functionality is changed.<br>
+<br>
+PR - <a href=3D"https://github.com/systemd/systemd/pull/23043" rel=3D"nore=
ferrer" target=3D"_blank">https://github.com/systemd/systemd/pull/23043</a>=
<br>
+Upstream-Status: Backport [<a href=3D"https://github.com/systemd/systemd/p=
ull/23043/commits/b9168275c39a190441fee73ba1c8a64515fd3b0e" rel=3D"noreferr=
er" target=3D"_blank">https://github.com/systemd/systemd/pull/23043/commits=
/b9168275c39a190441fee73ba1c8a64515fd3b0e</a>]<br>
+Signed-off-by: Ranjitsinh Rathod &lt;<a href=3D"mailto:ranjitsinh.rathod@k=
pit.com" target=3D"_blank">ranjitsinh.rathod@kpit.com</a>&gt;<br>
+<br>
+---<br>
+ src/udev/udev-node.c | 84 ++++++++++++++++++++++----------------------<br=
>
+ 1 file changed, 42 insertions(+), 42 deletions(-)<br>
+<br>
+diff --git a/src/udev/udev-node.c b/src/udev/udev-node.c<br>
+index bb34977d97..79d050cce6 100644<br>
+--- a/src/udev/udev-node.c<br>
++++ b/src/udev/udev-node.c<br>
+@@ -222,48 +222,6 @@ static int link_find_prioritized(sd_device *dev, bool=
 add, const char *stackdir,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return !!*ret;<br>
+ }<br>
+ <br>
+-size_t udev_node_escape_path(const char *src, char *dest, size_t size) {<=
br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 size_t i, j;<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 uint64_t h;<br>
+-<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 assert(src);<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 assert(dest);<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 assert(size &gt;=3D 12);<br>
+-<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 for (i =3D 0, j =3D 0; src[i] !=3D &#39;\0&#3=
9;; i++) {<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (src[i] =3D=3D=
 &#39;/&#39;) {<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 if (j+4 &gt;=3D size - 12 + 1)<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 goto toolong;<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 memcpy(&amp;dest[j], &quot;\\x2f&quot;, 4);<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 j +=3D 4;<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 } else if (src[i]=
 =3D=3D &#39;\\&#39;) {<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 if (j+4 &gt;=3D size - 12 + 1)<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 goto toolong;<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 memcpy(&amp;dest[j], &quot;\\x5c&quot;, 4);<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 j +=3D 4;<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 } else {<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 if (j+1 &gt;=3D size - 12 + 1)<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 goto toolong;<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 dest[j] =3D src[i];<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 j++;<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 dest[j] =3D &#39;\0&#39;;<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 return j;<br>
+-<br>
+-toolong:<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 /* If the input path is too long to encode as=
 a filename, then let&#39;s suffix with a string<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* generated from the hash of the path. =
*/<br>
+-<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 h =3D siphash24_string(src, UDEV_NODE_HASH_KE=
Y.bytes);<br>
+-<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 for (unsigned k =3D 0; k &lt;=3D 10; k++)<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 dest[size - k - 2=
] =3D urlsafe_base64char((h &gt;&gt; (k * 6)) &amp; 63);<br>
+-<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 dest[size - 1] =3D &#39;\0&#39;;<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 return size - 1;<br>
+-}<br>
+-<br>
+ static int update_timestamp(sd_device *dev, const char *path, struct stat=
 *prev) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0assert(path);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0assert(prev);<br>
+@@ -414,6 +372,48 @@ static int update_stack_directory(sd_device *dev, con=
st char *dirname, bool add)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return log_device_debug_errno(dev, SYNTH=
ETIC_ERRNO(ELOOP), &quot;Failed to create symbolic link %s: %m&quot;, filen=
ame);<br>
+ }<br>
+ <br>
++size_t udev_node_escape_path(const char *src, char *dest, size_t size) {<=
br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 size_t i, j;<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 uint64_t h;<br>
++<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 assert(src);<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 assert(dest);<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 assert(size &gt;=3D 12);<br>
++<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 for (i =3D 0, j =3D 0; src[i] !=3D &#39;\0&#3=
9;; i++) {<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (src[i] =3D=3D=
 &#39;/&#39;) {<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 if (j+4 &gt;=3D size - 12 + 1)<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 goto toolong;<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 memcpy(&amp;dest[j], &quot;\\x2f&quot;, 4);<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 j +=3D 4;<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 } else if (src[i]=
 =3D=3D &#39;\\&#39;) {<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 if (j+4 &gt;=3D size - 12 + 1)<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 goto toolong;<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 memcpy(&amp;dest[j], &quot;\\x5c&quot;, 4);<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 j +=3D 4;<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 } else {<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 if (j+1 &gt;=3D size - 12 + 1)<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 goto toolong;<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 dest[j] =3D src[i];<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 j++;<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 dest[j] =3D &#39;\0&#39;;<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 return j;<br>
++<br>
++toolong:<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 /* If the input path is too long to encode as=
 a filename, then let&#39;s suffix with a string<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* generated from the hash of the path. =
*/<br>
++<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 h =3D siphash24_string(src, UDEV_NODE_HASH_KE=
Y.bytes);<br>
++<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 for (unsigned k =3D 0; k &lt;=3D 10; k++)<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 dest[size - k - 2=
] =3D urlsafe_base64char((h &gt;&gt; (k * 6)) &amp; 63);<br>
++<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 dest[size - 1] =3D &#39;\0&#39;;<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 return size - 1;<br>
++}<br>
++<br>
+ /* manage &quot;stack of names&quot; with possibly specified device prior=
ities */<br>
+ static int link_update(sd_device *dev, const char *slink_in, bool add) {<=
br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0_cleanup_free_ char *slink =3D NULL, *di=
rname =3D NULL;<br>
+-- <br>
+2.25.1<br>
+<br>
diff --git a/meta/recipes-core/systemd/systemd/0002-udev-split-link_update-=
and-introduce-stack_directory.patch b/meta/recipes-core/systemd/systemd/000=
2-udev-split-link_update-and-introduce-stack_directory.patch<br>
new file mode 100644<br>
index 0000000000..edc7ab5b38<br>
--- /dev/null<br>
+++ b/meta/recipes-core/systemd/systemd/0002-udev-split-link_update-and-int=
roduce-stack_directory.patch<br>
@@ -0,0 +1,90 @@<br>
+From 7e7c36fbbb396364c386bf1edbe9b25179a134c6 Mon Sep 17 00:00:00 2001<br>
+From: Yu Watanabe &lt;<a href=3D"mailto:watanabe.yu%2Bgithub@gmail.com" ta=
rget=3D"_blank">watanabe.yu+github@gmail.com</a>&gt;<br>
+Date: Mon, 11 Apr 2022 11:26:08 +0900<br>
+Subject: [PATCH 02/10] udev: split link_update() and introduce<br>
+ stack_directory_get_name()<br>
+<br>
+No functionality is changed.<br>
+<br>
+PR - <a href=3D"https://github.com/systemd/systemd/pull/23043" rel=3D"nore=
ferrer" target=3D"_blank">https://github.com/systemd/systemd/pull/23043</a>=
<br>
+Upstream-Status: Backport [<a href=3D"https://github.com/systemd/systemd/p=
ull/23043/commits/7e7c36fbbb396364c386bf1edbe9b25179a134c6" rel=3D"noreferr=
er" target=3D"_blank">https://github.com/systemd/systemd/pull/23043/commits=
/7e7c36fbbb396364c386bf1edbe9b25179a134c6</a>]<br>
+Signed-off-by: Ranjitsinh Rathod &lt;<a href=3D"mailto:ranjitsinh.rathod@k=
pit.com" target=3D"_blank">ranjitsinh.rathod@kpit.com</a>&gt;<br>
+<br>
+---<br>
+ src/udev/udev-node.c | 52 ++++++++++++++++++++++++++++----------------<br=
>
+ 1 file changed, 33 insertions(+), 19 deletions(-)<br>
+<br>
+diff --git a/src/udev/udev-node.c b/src/udev/udev-node.c<br>
+index 79d050cce6..b4b865c021 100644<br>
+--- a/src/udev/udev-node.c<br>
++++ b/src/udev/udev-node.c<br>
+@@ -414,33 +414,47 @@ toolong:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return size - 1;<br>
+ }<br>
+ <br>
+-/* manage &quot;stack of names&quot; with possibly specified device prior=
ities */<br>
+-static int link_update(sd_device *dev, const char *slink_in, bool add) {<=
br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 _cleanup_free_ char *slink =3D NULL, *dirname=
 =3D NULL;<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 const char *slink_name;<br>
++static int stack_directory_get_name(const char *slink, char **ret) {<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 _cleanup_free_ char *s =3D NULL, *dirname =3D=
 NULL;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0char name_enc[NAME_MAX+1];<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 int r;<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 const char *name;<br>
+ <br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 assert(dev);<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 assert(slink_in);<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 assert(slink);<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 assert(ret);<br>
+ <br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 slink =3D strdup(slink_in);<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (!slink)<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return log_oom_de=
bug();<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 s =3D strdup(slink);<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (!s)<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return -ENOMEM;<b=
r>
+ <br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 path_simplify(slink);<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 path_simplify(s);<br>
+ <br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 slink_name =3D path_startswith(slink, &quot;/=
dev&quot;);<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (!slink_name ||<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 empty_or_root(slink_name) ||<br=
>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 !path_is_normalized(slink_name)=
)<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return log_device=
_debug_errno(dev, SYNTHETIC_ERRNO(EINVAL),<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 &quot;Invalid symbolic link of device node: %s&quot;, slink);=
<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (!path_is_normalized(s))<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return -EINVAL;<b=
r>
++<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 name =3D path_startswith(s, &quot;/dev&quot;)=
;<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (empty_or_root(name))<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return -EINVAL;<b=
r>
++<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 udev_node_escape_path(name, name_enc, sizeof(=
name_enc));<br>
+ <br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 (void) udev_node_escape_path(slink_name, name=
_enc, sizeof(name_enc));<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0dirname =3D path_join(&quot;/run/udev/li=
nks&quot;, name_enc);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (!dirname)<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return log_oom_de=
bug();<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return -ENOMEM;<b=
r>
++<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 *ret =3D TAKE_PTR(dirname);<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 return 0;<br>
++}<br>
++<br>
++static int link_update(sd_device *dev, const char *slink, bool add) {<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 _cleanup_free_ char *dirname =3D NULL;<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 int r;<br>
++<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 assert(dev);<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 assert(slink);<br>
++<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 r =3D stack_directory_get_name(slink, &amp;di=
rname);<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (r &lt; 0)<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return log_device=
_debug_errno(dev, r, &quot;Failed to build stack directory name for &#39;%s=
&#39;: %m&quot;, slink);<br>
+ <br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0r =3D update_stack_directory(dev, dirnam=
e, add);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (r &lt; 0)<br>
+-- <br>
+2.25.1<br>
+<br>
diff --git a/meta/recipes-core/systemd/systemd/0003-udev-do-not-remove-stac=
k-directory-even-if-it-is-emp.patch b/meta/recipes-core/systemd/systemd/000=
3-udev-do-not-remove-stack-directory-even-if-it-is-emp.patch<br>
new file mode 100644<br>
index 0000000000..6d2b178bd4<br>
--- /dev/null<br>
+++ b/meta/recipes-core/systemd/systemd/0003-udev-do-not-remove-stack-direc=
tory-even-if-it-is-emp.patch<br>
@@ -0,0 +1,267 @@<br>
+From a28d67a90374a9d11bd5635f81961f72e5a8b33e Mon Sep 17 00:00:00 2001<br>
+From: Yu Watanabe &lt;<a href=3D"mailto:watanabe.yu%2Bgithub@gmail.com" ta=
rget=3D"_blank">watanabe.yu+github@gmail.com</a>&gt;<br>
+Date: Mon, 11 Apr 2022 11:47:20 +0900<br>
+Subject: [PATCH 03/10] udev: do not remove stack directory even if it is e=
mpty<br>
+<br>
+Then, we can always assume the directory exists, and the code become<br>
+slightly simpler.<br>
+<br>
+Note, unused directories are removed by the main udevd process in a<br>
+later commit.<br>
+<br>
+PR - <a href=3D"https://github.com/systemd/systemd/pull/23043" rel=3D"nore=
ferrer" target=3D"_blank">https://github.com/systemd/systemd/pull/23043</a>=
<br>
+Upstream-Status: Backport [<a href=3D"https://github.com/systemd/systemd/p=
ull/23043/commits/a28d67a90374a9d11bd5635f81961f72e5a8b33e" rel=3D"noreferr=
er" target=3D"_blank">https://github.com/systemd/systemd/pull/23043/commits=
/a28d67a90374a9d11bd5635f81961f72e5a8b33e</a>]<br>
+Signed-off-by: Ranjitsinh Rathod &lt;<a href=3D"mailto:ranjitsinh.rathod@k=
pit.com" target=3D"_blank">ranjitsinh.rathod@kpit.com</a>&gt;<br>
+<br>
+---<br>
+ src/udev/udev-node.c | 158 +++++++++++++++++--------------------------<br=
>
+ 1 file changed, 61 insertions(+), 97 deletions(-)<br>
+<br>
+diff --git a/src/udev/udev-node.c b/src/udev/udev-node.c<br>
+index b4b865c021..6ead839a5f 100644<br>
+--- a/src/udev/udev-node.c<br>
++++ b/src/udev/udev-node.c<br>
+@@ -35,7 +35,6 @@<br>
+ <br>
+ #define CREATE_LINK_MAX_RETRIES=C2=A0 =C2=A0 =C2=A0 =C2=A0 128<br>
+ #define LINK_UPDATE_MAX_RETRIES=C2=A0 =C2=A0 =C2=A0 =C2=A0 128<br>
+-#define CREATE_STACK_LINK_MAX_RETRIES=C2=A0 128<br>
+ #define UPDATE_TIMESTAMP_MAX_RETRIES=C2=A0 =C2=A0128<br>
+ #define MAX_RANDOM_DELAY (250 * USEC_PER_MSEC)<br>
+ #define MIN_RANDOM_DELAY ( 50 * USEC_PER_MSEC)<br>
+@@ -140,15 +139,8 @@ static int link_find_prioritized(sd_device *dev, bool=
 add, const char *stackdir,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+ <br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0dir =3D opendir(stackdir);<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (!dir) {<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (add) /* The s=
tack directory must exist. */<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 return -errno;<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (errno !=3D EN=
OENT)<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 return -errno;<br>
+-<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 *ret =3D NULL;<br=
>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return 0;<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (!dir)<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return -errno;<br=
>
+ <br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0r =3D device_get_device_id(dev, &amp;id)=
;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (r &lt; 0)<br>
+@@ -222,8 +214,8 @@ static int link_find_prioritized(sd_device *dev, bool =
add, const char *stackdir,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return !!*ret;<br>
+ }<br>
+ <br>
+-static int update_timestamp(sd_device *dev, const char *path, struct stat=
 *prev) {<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 assert(path);<br>
++static int update_timestamp(sd_device *dev, int fd, struct stat *prev) {<=
br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 assert(fd &gt;=3D 0);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0assert(prev);<br>
+ <br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* Even if a symlink in the stack direct=
ory is created/removed, the mtime of the directory may<br>
+@@ -247,129 +239,96 @@ static int update_timestamp(sd_device *dev, const c=
har *path, struct stat *prev)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * timestamp of the stack directory is a=
lways increased at least in the above step 5, so A can<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * detect the update. */<br>
+ <br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 if ((prev-&gt;st_mode &amp; S_IFMT) =3D=3D 0)=
<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return 0; /* Does=
 not exist, or previous stat() failed. */<br>
+-<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0for (unsigned i =3D 0; i &lt; UPDATE_TIM=
ESTAMP_MAX_RETRIES; i++) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0struct stat =
st;<br>
+ <br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (stat(path, &a=
mp;st) &lt; 0)<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (fstat(fd, &am=
p;st) &lt; 0)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0return -errno;<br>
+ <br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (!stat_in=
ode_unmodified(prev, &amp;st))<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0return 0;<br>
+ <br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0log_device_d=
ebug(dev,<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;%s is modified, but its =
timestamp is not changed, &quot;<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;updating timestamp after=
 10ms.&quot;,<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0path);<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;Stack directory is modif=
ied, but its timestamp is not changed, &quot;<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;updating timestamp after=
 10ms.&quot;);<br>
+ <br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(void) uslee=
p(10 * USEC_PER_MSEC);<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (utimensat(AT_=
FDCWD, path, NULL, 0) &lt; 0)<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (futimens(fd, =
NULL) &lt; 0)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0return -errno;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+ <br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return -ELOOP;<br>
+ }<br>
+ <br>
+-static int update_stack_directory(sd_device *dev, const char *dirname, bo=
ol add) {<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 _cleanup_free_ char *filename =3D NULL, *data=
 =3D NULL, *buf =3D NULL;<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 const char *devname, *id;<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 struct stat st =3D {};<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 int priority, r;<br>
++static int stack_directory_update(sd_device *dev, int fd, bool add) {<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 struct stat st;<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 const char *id;<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 int r;<br>
+ <br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0assert(dev);<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 assert(dirname);<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 assert(fd &gt;=3D 0);<br>
+ <br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0r =3D device_get_device_id(dev, &amp;id)=
;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (r &lt; 0)<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return log_device=
_debug_errno(dev, r, &quot;Failed to get device id: %m&quot;);<br>
+-<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 filename =3D path_join(dirname, id);<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (!filename)<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return log_oom_de=
bug();<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return r;<br>
+ <br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (!add) {<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 int unlink_error =
=3D 0, stat_error =3D 0;<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (fstat(fd, &amp;st) &lt; 0)<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return -errno;<br=
>
+ <br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (stat(dirname,=
 &amp;st) &lt; 0) {<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 if (errno =3D=3D ENOENT)<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return 0; /* The stack directory is =
already removed. That&#39;s OK. */<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 stat_error =3D -errno;<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (add) {<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 _cleanup_free_ ch=
ar *data =3D NULL, *buf =3D NULL;<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 const char *devna=
me;<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 int priority;<br>
+ <br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (unlink(filena=
me) &lt; 0)<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 unlink_error =3D -errno;<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 r =3D sd_device_g=
et_devname(dev, &amp;devname);<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (r &lt; 0)<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 return r;<br>
+ <br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (rmdir(dirname=
) &gt;=3D 0 || errno =3D=3D ENOENT)<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 return 0;<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 r =3D device_get_=
devlink_priority(dev, &amp;priority);<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (r &lt; 0)<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 return r;<br>
+ <br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (unlink_error =
&lt; 0) {<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 if (unlink_error =3D=3D -ENOENT)<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return 0;<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (asprintf(&amp=
;data, &quot;%i:%s&quot;, priority, devname) &lt; 0)<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 return -ENOMEM;<br>
+ <br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 /* If we failed to remove the symlink, then there is almost noth=
ing we can do. */<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 return log_device_debug_errno(dev, unlink_error, &quot;Failed to=
 remove %s: %m&quot;, filename);<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (readlinkat_ma=
lloc(fd, id, &amp;buf) &gt;=3D 0 &amp;&amp; streq(buf, data))<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 return 0; /* Unchanged. */<br>
+ <br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (stat_error &l=
t; 0)<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 return log_device_debug_errno(dev, stat_error, &quot;Failed to s=
tat %s: %m&quot;, dirname);<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (void) unlinkat(f=
d, id, 0);<br>
+ <br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /* The symlink wa=
s removed. Check if the timestamp of directory is changed. */<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 r =3D update_time=
stamp(dev, dirname, &amp;st);<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (r &lt; 0 &amp=
;&amp; r !=3D -ENOENT)<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 return log_device_debug_errno(dev, r, &quot;Failed to update tim=
estamp of %s: %m&quot;, dirname);<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (symlinkat(dat=
a, fd, id) &lt; 0)<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 return -errno;<br>
+ <br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return 0;<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 } else {<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (unlinkat(fd, =
id, 0) &lt; 0) {<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 if (errno =3D=3D ENOENT)<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return 0; /* Unchanged. */<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 return -errno;<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+ <br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 r =3D sd_device_get_devname(dev, &amp;devname=
);<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 r =3D update_timestamp(dev, fd, &amp;st);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (r &lt; 0)<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return log_device=
_debug_errno(dev, r, &quot;Failed to get device node: %m&quot;);<br>
+-<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 r =3D device_get_devlink_priority(dev, &amp;p=
riority);<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (r &lt; 0)<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return log_device=
_debug_errno(dev, r, &quot;Failed to get priority of device node symlink: %=
m&quot;);<br>
+-<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (asprintf(&amp;data, &quot;%i:%s&quot;, pr=
iority, devname) &lt; 0)<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return log_oom_de=
bug();<br>
+-<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (readlink_malloc(filename, &amp;buf) &gt;=
=3D 0 &amp;&amp; streq(buf, data))<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return 0;<br>
+-<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (unlink(filename) &lt; 0 &amp;&amp; errno =
!=3D ENOENT)<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 log_device_debug_=
errno(dev, errno, &quot;Failed to remove %s, ignoring: %m&quot;, filename);=
<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return r;<br>
+ <br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 for (unsigned j =3D 0; j &lt; CREATE_STACK_LI=
NK_MAX_RETRIES; j++) {<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /* This may fail =
with -ENOENT when the parent directory is removed during<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* creating =
the file by another udevd worker. */<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 r =3D mkdir_p(dir=
name, 0755);<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (r =3D=3D -ENO=
ENT)<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 continue;<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (r &lt; 0)<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 return log_device_debug_errno(dev, r, &quot;Failed to create dir=
ectory %s: %m&quot;, dirname);<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 return 0;<br>
++}<br>
+ <br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (stat(dirname,=
 &amp;st) &lt; 0) {<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 if (errno =3D=3D ENOENT)<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 continue;<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 return log_device_debug_errno(dev, errno, &quot;Failed to stat %=
s: %m&quot;, dirname);<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
++static int stack_directory_open(const char *dirname) {<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 _cleanup_close_ int fd =3D -1;<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 int r;<br>
+ <br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (symlink(data,=
 filename) &lt; 0) {<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 if (errno =3D=3D ENOENT)<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 continue;<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 return log_device_debug_errno(dev, errno, &quot;Failed to create=
 symbolic link %s: %m&quot;, filename);<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 assert(dirname);<br>
+ <br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /* The symlink wa=
s created. Check if the timestamp of directory is changed. */<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 r =3D update_time=
stamp(dev, dirname, &amp;st);<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (r &lt; 0)<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 return log_device_debug_errno(dev, r, &quot;Failed to update tim=
estamp of %s: %m&quot;, dirname);<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 r =3D mkdir_parents(dirname, 0755);<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (r &lt; 0)<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return r;<br>
+ <br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return 0;<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 fd =3D open_mkdir_at(AT_FDCWD, dirname, O_CLO=
EXEC | O_DIRECTORY | O_NOFOLLOW | O_RDONLY, 0755);<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (fd &lt; 0)<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return fd;<br>
+ <br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 return log_device_debug_errno(dev, SYNTHETIC_=
ERRNO(ELOOP), &quot;Failed to create symbolic link %s: %m&quot;, filename);=
<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 return TAKE_FD(fd);<br>
+ }<br>
+ <br>
+ size_t udev_node_escape_path(const char *src, char *dest, size_t size) {<=
br>
+@@ -447,6 +406,7 @@ static int stack_directory_get_name(const char *slink,=
 char **ret) {<br>
+ <br>
+ static int link_update(sd_device *dev, const char *slink, bool add) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0_cleanup_free_ char *dirname =3D NULL;<b=
r>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 _cleanup_close_ int dirfd =3D -1;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0int r;<br>
+ <br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0assert(dev);<br>
+@@ -456,9 +416,13 @@ static int link_update(sd_device *dev, const char *sl=
ink, bool add) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (r &lt; 0)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return log_d=
evice_debug_errno(dev, r, &quot;Failed to build stack directory name for &#=
39;%s&#39;: %m&quot;, slink);<br>
+ <br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 r =3D update_stack_directory(dev, dirname, ad=
d);<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 dirfd =3D stack_directory_open(dirname);<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (dirfd &lt; 0)<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return log_device=
_debug_errno(dev, dirfd, &quot;Failed to open stack directory &#39;%s&#39;:=
 %m&quot;, dirname);<br>
++<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 r =3D stack_directory_update(dev, dirfd, add)=
;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (r &lt; 0)<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return r;<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return log_device=
_debug_errno(dev, r, &quot;Failed to update stack directory &#39;%s&#39;: %=
m&quot;, dirname);<br>
+ <br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0for (unsigned i =3D 0; i &lt; LINK_UPDAT=
E_MAX_RETRIES; i++) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0_cleanup_fre=
e_ char *target =3D NULL;<br>
+-- <br>
+2.25.1<br>
+<br>
diff --git a/meta/recipes-core/systemd/systemd/0004-path-util-introduce-pat=
h_make_relative_parent.patch b/meta/recipes-core/systemd/systemd/0004-path-=
util-introduce-path_make_relative_parent.patch<br>
new file mode 100644<br>
index 0000000000..dfc9fc9886<br>
--- /dev/null<br>
+++ b/meta/recipes-core/systemd/systemd/0004-path-util-introduce-path_make_=
relative_parent.patch<br>
@@ -0,0 +1,99 @@<br>
+From d4f60bdc11d8e6275922ca5c7f80b130ebbb3d5f Mon Sep 17 00:00:00 2001<br>
+From: Yu Watanabe &lt;<a href=3D"mailto:watanabe.yu%2Bgithub@gmail.com" ta=
rget=3D"_blank">watanabe.yu+github@gmail.com</a>&gt;<br>
+Date: Mon, 11 Apr 2022 07:01:59 +0900<br>
+Subject: [PATCH 04/10] path-util: introduce path_make_relative_parent()<br=
>
+<br>
+<br>
+PR - <a href=3D"https://github.com/systemd/systemd/pull/23043" rel=3D"nore=
ferrer" target=3D"_blank">https://github.com/systemd/systemd/pull/23043</a>=
<br>
+Upstream-Status: Backport [<a href=3D"https://github.com/systemd/systemd/p=
ull/23043/commits/d4f60bdc11d8e6275922ca5c7f80b130ebbb3d5f" rel=3D"noreferr=
er" target=3D"_blank">https://github.com/systemd/systemd/pull/23043/commits=
/d4f60bdc11d8e6275922ca5c7f80b130ebbb3d5f</a>]<br>
+Comments: Refreshed first two hunks to apply patch cleanly without patch-f=
uzz<br>
+Signed-off-by: Ranjitsinh Rathod &lt;<a href=3D"mailto:ranjitsinh.rathod@k=
pit.com" target=3D"_blank">ranjitsinh.rathod@kpit.com</a>&gt;<br>
+<br>
+---<br>
+ src/basic/path-util.c=C2=A0 =C2=A0 =C2=A0| 18 ++++++++++++++++++<br>
+ src/basic/path-util.h=C2=A0 =C2=A0 =C2=A0|=C2=A0 1 +<br>
+ src/test/test-path-util.c | 27 +++++++++++++++++++++++++++<br>
+ 3 files changed, 46 insertions(+)<br>
+<br>
+diff --git a/src/basic/path-util.c b/src/basic/path-util.c<br>
+index 338377d918..41e0d4d753 100644<br>
+--- a/src/basic/path-util.c<br>
++++ b/src/basic/path-util.c<br>
+@@ -201,6 +201,24 @@ int path_make_relative(const char *from,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return 0;<br>
+ }<br>
+ <br>
++int path_make_relative_parent(const char *from_child, const char *to, cha=
r **ret) {<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 _cleanup_free_ char *from =3D NULL;<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 int r;<br>
++<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 assert(from_child);<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 assert(to);<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 assert(ret);<br>
++<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 /* Similar to path_make_relative(), but provi=
des the relative path from the parent directory of<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* &#39;from_child&#39;. This may be use=
ful when creating relative symlink. */<br>
++<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 r =3D path_extract_directory(from_child, &amp=
;from);<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (r &lt; 0)<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return r;<br>
++<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 return path_make_relative(from, to, ret);<br>
++}<br>
++<br>
+ char* path_startswith_strv(const char *p, char **set) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0char **s, *t;<br>
+ <br>
+diff --git a/src/basic/path-util.h b/src/basic/path-util.h<br>
+index 41bbc7bb86..8cd7f512a6 100644<br>
+--- a/src/basic/path-util.h<br>
++++ b/src/basic/path-util.h<br>
+@@ -57,6 +57,7 @@ char* path_make_absolute(const char *p,<br>
+ int safe_getcwd(char **ret);<br>
+ int path_make_absolute_cwd(const char *p, char **ret);<br>
+ int path_make_relative(const char *from, const char *to, char **ret);<br>
++int path_make_relative_parent(const char *from_child, const char *to, cha=
r **ret);<br>
+ char *path_startswith_full(const char *path, const char *prefix, bool acc=
ept_dot_dot) _pure_;<br>
+ static inline char* path_startswith(const char *path, const char *prefix)=
 {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return path_startswith_full(path, prefix=
, true);<br>
+diff --git a/src/test/test-path-util.c b/src/test/test-path-util.c<br>
+index e0583cfbab..a26e351233 100644<br>
+--- a/src/test/test-path-util.c<br>
++++ b/src/test/test-path-util.c<br>
+@@ -477,6 +477,33 @@ TEST(path_make_relative) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0test_path_make_relative_one(&quot;//extr=
a.//.//./.slashes//./won&#39;t////fo.ol///anybody//&quot;, &quot;/././/extr=
a././/.slashes////ar.e/.just/././.fine///&quot;, &quot;../../../ar.e/.just/=
.fine&quot;);<br>
+ }<br>
+ <br>
++static void test_path_make_relative_parent_one(const char *from, const ch=
ar *to, const char *expected) {<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 _cleanup_free_ char *z =3D NULL;<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 int r;<br>
++<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 log_info(&quot;/* %s(%s, %s) */&quot;, __func=
__, from, to);<br>
++<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 r =3D path_make_relative_parent(from, to, &am=
p;z);<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 assert_se((r &gt;=3D 0) =3D=3D !!expected);<b=
r>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 assert_se(streq_ptr(z, expected));<br>
++}<br>
++<br>
++TEST(path_make_relative_parent) {<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 test_path_make_relative_parent_one(&quot;some=
/relative/path/hoge&quot;, &quot;/some/path&quot;, NULL);<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 test_path_make_relative_parent_one(&quot;/som=
e/path/hoge&quot;, &quot;some/relative/path&quot;, NULL);<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 test_path_make_relative_parent_one(&quot;/som=
e/dotdot/../path/hoge&quot;, &quot;/some/path&quot;, NULL);<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 test_path_make_relative_parent_one(&quot;/&qu=
ot;, &quot;/aaa&quot;, NULL);<br>
++<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 test_path_make_relative_parent_one(&quot;/hog=
e&quot;, &quot;/&quot;, &quot;.&quot;);<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 test_path_make_relative_parent_one(&quot;/hog=
e&quot;, &quot;/some/path&quot;, &quot;some/path&quot;);<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 test_path_make_relative_parent_one(&quot;/som=
e/path/hoge&quot;, &quot;/some/path&quot;, &quot;.&quot;);<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 test_path_make_relative_parent_one(&quot;/som=
e/path/hoge&quot;, &quot;/some/path/in/subdir&quot;, &quot;in/subdir&quot;)=
;<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 test_path_make_relative_parent_one(&quot;/som=
e/path/hoge&quot;, &quot;/&quot;, &quot;../..&quot;);<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 test_path_make_relative_parent_one(&quot;/som=
e/path/hoge&quot;, &quot;/some/other/path&quot;, &quot;../other/path&quot;)=
;<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 test_path_make_relative_parent_one(&quot;/som=
e/path/./dot/hoge&quot;, &quot;/some/further/path&quot;, &quot;../../furthe=
r/path&quot;);<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 test_path_make_relative_parent_one(&quot;//ex=
tra.//.//./.slashes//./won&#39;t////fo.ol///anybody//hoge&quot;, &quot;/./.=
//extra././/.slashes////ar.e/.just/././.fine///&quot;, &quot;../../../ar.e/=
.just/.fine&quot;);<br>
++}<br>
++<br>
+ TEST(path_strv_resolve) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0char tmp_dir[] =3D &quot;/tmp/test-path-=
util-XXXXXX&quot;;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0_cleanup_strv_free_ char **search_dirs =
=3D NULL;<br>
+-- <br>
+2.25.1<br>
+<br>
diff --git a/meta/recipes-core/systemd/systemd/0005-udev-use-readlinkat_mal=
loc.patch b/meta/recipes-core/systemd/systemd/0005-udev-use-readlinkat_mall=
oc.patch<br>
new file mode 100644<br>
index 0000000000..42179f2031<br>
--- /dev/null<br>
+++ b/meta/recipes-core/systemd/systemd/0005-udev-use-readlinkat_malloc.pat=
ch<br>
@@ -0,0 +1,74 @@<br>
+From faadf97500dc8e76350a409c127f3f0fed116f9a Mon Sep 17 00:00:00 2001<br>
+From: Yu Watanabe &lt;<a href=3D"mailto:watanabe.yu%2Bgithub@gmail.com" ta=
rget=3D"_blank">watanabe.yu+github@gmail.com</a>&gt;<br>
+Date: Mon, 11 Apr 2022 03:29:07 +0900<br>
+Subject: [PATCH 05/10] udev: use readlinkat_malloc()<br>
+<br>
+And try to read it only when the file is symlink.<br>
+<br>
+PR - <a href=3D"https://github.com/systemd/systemd/pull/23043" rel=3D"nore=
ferrer" target=3D"_blank">https://github.com/systemd/systemd/pull/23043</a>=
<br>
+Upstream-Status: Backport [<a href=3D"https://github.com/systemd/systemd/p=
ull/23043/commits/faadf97500dc8e76350a409c127f3f0fed116f9a" rel=3D"noreferr=
er" target=3D"_blank">https://github.com/systemd/systemd/pull/23043/commits=
/faadf97500dc8e76350a409c127f3f0fed116f9a</a>]<br>
+Signed-off-by: Ranjitsinh Rathod &lt;<a href=3D"mailto:ranjitsinh.rathod@k=
pit.com" target=3D"_blank">ranjitsinh.rathod@kpit.com</a>&gt;<br>
+<br>
+---<br>
+ src/udev/udev-node.c | 20 ++++++++++++--------<br>
+ 1 file changed, 12 insertions(+), 8 deletions(-)<br>
+<br>
+diff --git a/src/udev/udev-node.c b/src/udev/udev-node.c<br>
+index 6ead839a5f..0320f2d041 100644<br>
+--- a/src/udev/udev-node.c<br>
++++ b/src/udev/udev-node.c<br>
+@@ -147,7 +147,6 @@ static int link_find_prioritized(sd_device *dev, bool =
add, const char *stackdir,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return r;<br=
>
+ <br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0FOREACH_DIRENT_ALL(de, dir, break) {<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 _cleanup_free_ ch=
ar *path =3D NULL, *buf =3D NULL;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0int tmp_prio=
;<br>
+ <br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (de-&gt;d=
_name[0] =3D=3D &#39;.&#39;)<br>
+@@ -157,15 +156,18 @@ static int link_find_prioritized(sd_device *dev, boo=
l add, const char *stackdir,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (streq(de=
-&gt;d_name, id))<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0continue;<br>
+ <br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 path =3D path_joi=
n(stackdir, de-&gt;d_name);<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (!path)<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 return -ENOMEM;<br>
+-<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (readlink_mall=
oc(path, &amp;buf) &gt;=3D 0) {<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (de-&gt;d_type=
 =3D=3D DT_LNK) {<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 _cleanup_free_ char *buf =3D NULL;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0char *devnode;<br>
+ <br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0/* New format. The devnode and priority can be obtained fr=
om symlink. */<br>
+ <br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 r =3D readlinkat_malloc(dirfd(dir), de-&gt;d_name, &amp;buf);<br=
>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 if (r &lt; 0) {<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 log_device_debug_errno(dev, r, &quot=
;Failed to read symlink %s, ignoring: %m&quot;, de-&gt;d_name);<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 continue;<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 }<br>
++<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0devnode =3D strchr(buf, &#39;:&#39;);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0if (!devnode || devnode =3D=3D buf)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0continue;<br>
+@@ -183,7 +185,8 @@ static int link_find_prioritized(sd_device *dev, bool =
add, const char *stackdir,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0r =3D free_and_strdup(&amp;target, devnode);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0if (r &lt; 0)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return r;<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 } else {<br>
++<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 } else if (de-&gt=
;d_type =3D=3D DT_REG) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0_cleanup_(sd_device_unrefp) sd_device *tmp_dev =3D NULL;<b=
r>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0const char *devnode;<br>
+ <br>
+@@ -205,7 +208,8 @@ static int link_find_prioritized(sd_device *dev, bool =
add, const char *stackdir,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0r =3D free_and_strdup(&amp;target, devnode);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0if (r &lt; 0)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return r;<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 } else<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 continue;<br>
+ <br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0priority =3D=
 tmp_prio;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+-- <br>
+2.25.1<br>
+<br>
diff --git a/meta/recipes-core/systemd/systemd/0006-udev-rename-link_find_p=
rioritized-and-variables.patch b/meta/recipes-core/systemd/systemd/0006-ude=
v-rename-link_find_prioritized-and-variables.patch<br>
new file mode 100644<br>
index 0000000000..8fe4c9281c<br>
--- /dev/null<br>
+++ b/meta/recipes-core/systemd/systemd/0006-udev-rename-link_find_prioriti=
zed-and-variables.patch<br>
@@ -0,0 +1,190 @@<br>
+From 6b01e2905c387002a20b0a38f4b7670c8eb82cb8 Mon Sep 17 00:00:00 2001<br>
+From: Yu Watanabe &lt;<a href=3D"mailto:watanabe.yu%2Bgithub@gmail.com" ta=
rget=3D"_blank">watanabe.yu+github@gmail.com</a>&gt;<br>
+Date: Mon, 11 Apr 2022 11:56:52 +0900<br>
+Subject: [PATCH 06/10] udev: rename link_find_prioritized() and variables<=
br>
+<br>
+Also shorten code a bit.<br>
+<br>
+Just for consistency with other part and readability of the code.<br>
+<br>
+PR - <a href=3D"https://github.com/systemd/systemd/pull/23043" rel=3D"nore=
ferrer" target=3D"_blank">https://github.com/systemd/systemd/pull/23043</a>=
<br>
+Upstream-Status: Backport [<a href=3D"https://github.com/systemd/systemd/p=
ull/23043/commits/6b01e2905c387002a20b0a38f4b7670c8eb82cb8" rel=3D"noreferr=
er" target=3D"_blank">https://github.com/systemd/systemd/pull/23043/commits=
/6b01e2905c387002a20b0a38f4b7670c8eb82cb8</a>]<br>
+Signed-off-by: Ranjitsinh Rathod &lt;<a href=3D"mailto:ranjitsinh.rathod@k=
pit.com" target=3D"_blank">ranjitsinh.rathod@kpit.com</a>&gt;<br>
+<br>
+---<br>
+ src/udev/udev-node.c | 62 ++++++++++++++++++++++----------------------<br=
>
+ 1 file changed, 31 insertions(+), 31 deletions(-)<br>
+<br>
+diff --git a/src/udev/udev-node.c b/src/udev/udev-node.c<br>
+index 0320f2d041..f358564b41 100644<br>
+--- a/src/udev/udev-node.c<br>
++++ b/src/udev/udev-node.c<br>
+@@ -63,20 +63,21 @@ static int create_symlink(const char *target, const ch=
ar *slink) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return r;<br>
+ }<br>
+ <br>
+-static int node_symlink(sd_device *dev, const char *node, const char *sli=
nk) {<br>
++static int node_symlink(sd_device *dev, const char *devnode, const char *=
slink) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0_cleanup_free_ char *slink_dirname =3D N=
ULL, *target =3D NULL;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0const char *id, *slink_tmp;<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 struct stat stats;<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 struct stat st;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0int r;<br>
+ <br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0assert(dev);<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 assert(node);<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 assert(devnode);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0assert(slink);<br>
+ <br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (lstat(slink, &amp;stats) &gt;=3D 0) {<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (!S_ISLNK(stat=
s.st_mode))<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (lstat(slink, &amp;st) &gt;=3D 0) {<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (!S_ISLNK(st.s=
t_mode))<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0return log_device_debug_errno(dev, SYNTHETIC_ERRNO(EEXIST)=
,<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;Conflicting inode &#39;%s&#=
39; found, link to &#39;%s&#39; will not be created.&quot;, slink, node);<b=
r>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;Conflicting inode &#39;%s&#=
39; found, link to &#39;%s&#39; will not be created.&quot;,<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 slink, devnode);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0} else if (errno !=3D ENOENT)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return log_d=
evice_debug_errno(dev, errno, &quot;Failed to lstat() &#39;%s&#39;: %m&quot=
;, slink);<br>
+ <br>
+@@ -85,9 +86,9 @@ static int node_symlink(sd_device *dev, const char *node=
, const char *slink) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return log_d=
evice_debug_errno(dev, r, &quot;Failed to get parent directory of &#39;%s&#=
39;: %m&quot;, slink);<br>
+ <br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* use relative link */<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 r =3D path_make_relative(slink_dirname, node,=
 &amp;target);<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 r =3D path_make_relative(slink_dirname, devno=
de, &amp;target);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (r &lt; 0)<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return log_device=
_debug_errno(dev, r, &quot;Failed to get relative path from &#39;%s&#39; to=
 &#39;%s&#39;: %m&quot;, slink, node);<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return log_device=
_debug_errno(dev, r, &quot;Failed to get relative path from &#39;%s&#39; to=
 &#39;%s&#39;: %m&quot;, slink, devnode);<br>
+ <br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0r =3D device_get_device_id(dev, &amp;id)=
;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (r &lt; 0)<br>
+@@ -109,36 +110,36 @@ static int node_symlink(sd_device *dev, const char *=
node, const char *slink) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return 0;<br>
+ }<br>
+ <br>
+-static int link_find_prioritized(sd_device *dev, bool add, const char *st=
ackdir, char **ret) {<br>
++static int stack_directory_find_prioritized_devnode(sd_device *dev, const=
 char *dirname, bool add, char **ret) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0_cleanup_closedir_ DIR *dir =3D NULL;<br=
>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 _cleanup_free_ char *target =3D NULL;<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 _cleanup_free_ char *devnode =3D NULL;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0int r, priority =3D 0;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0const char *id;<br>
+ <br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0assert(dev);<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 assert(stackdir);<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 assert(dirname);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0assert(ret);<br>
+ <br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* Find device node of device with highe=
st priority. This returns 1 if a device found, 0 if no<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* device found, or a negative errno. */=
<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* device found, or a negative errno on =
error. */<br>
+ <br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (add) {<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 const char *devno=
de;<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 const char *n;<br=
>
+ <br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0r =3D device=
_get_devlink_priority(dev, &amp;priority);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (r &lt; 0=
)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0return r;<br>
+ <br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 r =3D sd_device_g=
et_devname(dev, &amp;devnode);<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 r =3D sd_device_g=
et_devname(dev, &amp;n);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (r &lt; 0=
)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0return r;<br>
+ <br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 target =3D strdup=
(devnode);<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (!target)<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 devnode =3D strdu=
p(n);<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (!devnode)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0return -ENOMEM;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+ <br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 dir =3D opendir(stackdir);<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 dir =3D opendir(dirname);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (!dir)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return -errn=
o;<br>
+ <br>
+@@ -158,7 +159,7 @@ static int link_find_prioritized(sd_device *dev, bool =
add, const char *stackdir,<br>
+ <br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (de-&gt;d=
_type =3D=3D DT_LNK) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0_cleanup_free_ char *buf =3D NULL;<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 char *devnode;<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 char *colon;<br>
+ <br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0/* New format. The devnode and priority can be obtained fr=
om symlink. */<br>
+ <br>
+@@ -168,27 +169,25 @@ static int link_find_prioritized(sd_device *dev, boo=
l add, const char *stackdir,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0continue;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0}<br>
+ <br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 devnode =3D strchr(buf, &#39;:&#39;);<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 if (!devnode || devnode =3D=3D buf)<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 colon =3D strchr(buf, &#39;:&#39;);<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 if (!colon || colon =3D=3D buf)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0continue;<br>
+ <br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 *(devnode++) =3D &#39;\0&#39;;<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 if (!path_startswith(devnode, &quot;/dev&quot;))<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 continue;<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 *colon =3D &#39;\0&#39;;<br>
+ <br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0if (safe_atoi(buf, &amp;tmp_prio) &lt; 0)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0continue;<br>
+ <br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 if (target &amp;&amp; tmp_prio &lt;=3D priority)<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 if (devnode &amp;&amp; tmp_prio &lt;=3D priority)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0continue;<br>
+ <br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 r =3D free_and_strdup(&amp;target, devnode);<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 r =3D free_and_strdup(&amp;devnode, colon + 1);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0if (r &lt; 0)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return r;<br>
+ <br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0} else if (d=
e-&gt;d_type =3D=3D DT_REG) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0_cleanup_(sd_device_unrefp) sd_device *tmp_dev =3D NULL;<b=
r>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 const char *devnode;<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 const char *val;<br>
+ <br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0/* Old format. The devnode and priority must be obtained f=
rom uevent and<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 * udev database files. */<br>
+@@ -199,22 +198,23 @@ static int link_find_prioritized(sd_device *dev, boo=
l add, const char *stackdir,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0if (device_get_devlink_priority(tmp_dev, &amp;tmp_prio) &l=
t; 0)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0continue;<br>
+ <br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 if (target &amp;&amp; tmp_prio &lt;=3D priority)<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 if (devnode &amp;&amp; tmp_prio &lt;=3D priority)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0continue;<br>
+ <br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 if (sd_device_get_devname(tmp_dev, &amp;devnode) &lt; 0)<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 if (sd_device_get_devname(tmp_dev, &amp;val) &lt; 0)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0continue;<br>
+ <br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 r =3D free_and_strdup(&amp;target, devnode);<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 r =3D free_and_strdup(&amp;devnode, val);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0if (r &lt; 0)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return r;<br>
++<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0} else<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0continue;<br>
+ <br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0priority =3D=
 tmp_prio;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+ <br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 *ret =3D TAKE_PTR(target);<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 *ret =3D TAKE_PTR(devnode);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return !!*ret;<br>
+ }<br>
+ <br>
+@@ -443,7 +443,7 @@ static int link_update(sd_device *dev, const char *sli=
nk, bool add) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (stat(dir=
name, &amp;st1) &lt; 0 &amp;&amp; errno !=3D ENOENT)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0return log_device_debug_errno(dev, errno, &quot;Failed to =
stat %s: %m&quot;, dirname);<br>
+ <br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 r =3D link_find_p=
rioritized(dev, add, dirname, &amp;target);<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 r =3D stack_direc=
tory_find_prioritized_devnode(dev, dirname, add, &amp;target);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (r &lt; 0=
)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0return log_device_debug_errno(dev, r, &quot;Failed to dete=
rmine device node with the highest priority for &#39;%s&#39;: %m&quot;, sli=
nk);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (r =3D=3D=
 0) {<br>
+-- <br>
+2.25.1<br>
+<br>
diff --git a/meta/recipes-core/systemd/systemd/0007-udev-use-path_make_rela=
tive_parent.patch b/meta/recipes-core/systemd/systemd/0007-udev-use-path_ma=
ke_relative_parent.patch<br>
new file mode 100644<br>
index 0000000000..6a0ea22672<br>
--- /dev/null<br>
+++ b/meta/recipes-core/systemd/systemd/0007-udev-use-path_make_relative_pa=
rent.patch<br>
@@ -0,0 +1,43 @@<br>
+From d6595c5ced636d44dc40adfb0b7cfc929bcac7a3 Mon Sep 17 00:00:00 2001<br>
+From: Yu Watanabe &lt;<a href=3D"mailto:watanabe.yu%2Bgithub@gmail.com" ta=
rget=3D"_blank">watanabe.yu+github@gmail.com</a>&gt;<br>
+Date: Mon, 11 Apr 2022 12:05:36 +0900<br>
+Subject: [PATCH 07/10] udev: use path_make_relative_parent()<br>
+<br>
+PR - <a href=3D"https://github.com/systemd/systemd/pull/23043" rel=3D"nore=
ferrer" target=3D"_blank">https://github.com/systemd/systemd/pull/23043</a>=
<br>
+Upstream-Status: Backport [<a href=3D"https://github.com/systemd/systemd/p=
ull/23043/commits/d6595c5ced636d44dc40adfb0b7cfc929bcac7a3" rel=3D"noreferr=
er" target=3D"_blank">https://github.com/systemd/systemd/pull/23043/commits=
/d6595c5ced636d44dc40adfb0b7cfc929bcac7a3</a>]<br>
+Signed-off-by: Ranjitsinh Rathod &lt;<a href=3D"mailto:ranjitsinh.rathod@k=
pit.com" target=3D"_blank">ranjitsinh.rathod@kpit.com</a>&gt;<br>
+<br>
+---<br>
+ src/udev/udev-node.c | 8 ++------<br>
+ 1 file changed, 2 insertions(+), 6 deletions(-)<br>
+<br>
+diff --git a/src/udev/udev-node.c b/src/udev/udev-node.c<br>
+index f358564b41..5a011cf86b 100644<br>
+--- a/src/udev/udev-node.c<br>
++++ b/src/udev/udev-node.c<br>
+@@ -64,7 +64,7 @@ static int create_symlink(const char *target, const char=
 *slink) {<br>
+ }<br>
+ <br>
+ static int node_symlink(sd_device *dev, const char *devnode, const char *=
slink) {<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 _cleanup_free_ char *slink_dirname =3D NULL, =
*target =3D NULL;<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 _cleanup_free_ char *target =3D NULL;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0const char *id, *slink_tmp;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0struct stat st;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0int r;<br>
+@@ -81,12 +81,8 @@ static int node_symlink(sd_device *dev, const char *dev=
node, const char *slink)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0} else if (errno !=3D ENOENT)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return log_d=
evice_debug_errno(dev, errno, &quot;Failed to lstat() &#39;%s&#39;: %m&quot=
;, slink);<br>
+ <br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 r =3D path_extract_directory(slink, &amp;slin=
k_dirname);<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (r &lt; 0)<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return log_device=
_debug_errno(dev, r, &quot;Failed to get parent directory of &#39;%s&#39;: =
%m&quot;, slink);<br>
+-<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* use relative link */<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 r =3D path_make_relative(slink_dirname, devno=
de, &amp;target);<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 r =3D path_make_relative_parent(slink, devnod=
e, &amp;target);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (r &lt; 0)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return log_d=
evice_debug_errno(dev, r, &quot;Failed to get relative path from &#39;%s&#3=
9; to &#39;%s&#39;: %m&quot;, slink, devnode);<br>
+ <br>
+-- <br>
+2.25.1<br>
+<br>
diff --git a/meta/recipes-core/systemd/systemd/0008-udev-make-node_symlink-=
accept-NULL-devname.patch b/meta/recipes-core/systemd/systemd/0008-udev-mak=
e-node_symlink-accept-NULL-devname.patch<br>
new file mode 100644<br>
index 0000000000..cb29367f4d<br>
--- /dev/null<br>
+++ b/meta/recipes-core/systemd/systemd/0008-udev-make-node_symlink-accept-=
NULL-devname.patch<br>
@@ -0,0 +1,75 @@<br>
+From 541a463fd5aad912c07c88d84e5a1c597c810956 Mon Sep 17 00:00:00 2001<br>
+From: Yu Watanabe &lt;<a href=3D"mailto:watanabe.yu%2Bgithub@gmail.com" ta=
rget=3D"_blank">watanabe.yu+github@gmail.com</a>&gt;<br>
+Date: Mon, 11 Apr 2022 12:08:06 +0900<br>
+Subject: [PATCH 08/10] udev: make node_symlink() accept NULL devname<br>
+<br>
+PR - <a href=3D"https://github.com/systemd/systemd/pull/23043" rel=3D"nore=
ferrer" target=3D"_blank">https://github.com/systemd/systemd/pull/23043</a>=
<br>
+Upstream-Status: Backport [<a href=3D"https://github.com/systemd/systemd/p=
ull/23043/commits/541a463fd5aad912c07c88d84e5a1c597c810956" rel=3D"noreferr=
er" target=3D"_blank">https://github.com/systemd/systemd/pull/23043/commits=
/541a463fd5aad912c07c88d84e5a1c597c810956</a>]<br>
+Signed-off-by: Ranjitsinh Rathod &lt;<a href=3D"mailto:ranjitsinh.rathod@k=
pit.com" target=3D"_blank">ranjitsinh.rathod@kpit.com</a>&gt;<br>
+<br>
+---<br>
+ src/udev/udev-node.c | 24 +++++++++---------------<br>
+ 1 file changed, 9 insertions(+), 15 deletions(-)<br>
+<br>
+diff --git a/src/udev/udev-node.c b/src/udev/udev-node.c<br>
+index 5a011cf86b..8e78546e18 100644<br>
+--- a/src/udev/udev-node.c<br>
++++ b/src/udev/udev-node.c<br>
+@@ -70,13 +70,18 @@ static int node_symlink(sd_device *dev, const char *de=
vnode, const char *slink)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0int r;<br>
+ <br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0assert(dev);<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 assert(devnode);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0assert(slink);<br>
+ <br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (!devnode) {<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 r =3D sd_device_g=
et_devname(dev, &amp;devnode);<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (r &lt; 0)<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 return log_device_debug_errno(dev, r, &quot;Failed to get device=
 node: %m&quot;);<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
++<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (lstat(slink, &amp;st) &gt;=3D 0) {<b=
r>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (!S_ISLNK=
(st.st_mode))<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0return log_device_debug_errno(dev, SYNTHETIC_ERRNO(EEXIST)=
,<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;Conflicting inode &#39;%s&#=
39; found, link to &#39;%s&#39; will not be created.&quot;,<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;Conflicting inode &#39;%s&#=
39; found, symlink to &#39;%s&#39; will not be created.&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0slink, devnode);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0} else if (errno !=3D ENOENT)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return log_d=
evice_debug_errno(dev, errno, &quot;Failed to lstat() &#39;%s&#39;: %m&quot=
;, slink);<br>
+@@ -488,23 +493,12 @@ static int device_get_devpath_by_devnum(sd_device *d=
ev, char **ret) {<br>
+ <br>
+ int udev_node_update(sd_device *dev, sd_device *dev_old) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0_cleanup_free_ char *filename =3D NULL;<=
br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 const char *devnode, *devlink;<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 const char *devlink;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0int r;<br>
+ <br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0assert(dev);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0assert(dev_old);<br>
+ <br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 r =3D sd_device_get_devname(dev, &amp;devnode=
);<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (r &lt; 0)<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return log_device=
_debug_errno(dev, r, &quot;Failed to get devnode: %m&quot;);<br>
+-<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (DEBUG_LOGGING) {<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 const char *id =
=3D NULL;<br>
+-<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (void) device_get=
_device_id(dev, &amp;id);<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 log_device_debug(=
dev, &quot;Handling device node &#39;%s&#39;, devnum=3D%s&quot;, devnode, s=
trna(id));<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+-<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* update possible left-over symlinks */=
<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0FOREACH_DEVICE_DEVLINK(dev_old, devlink)=
 {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* check if =
old link name still belongs to this device */<br>
+@@ -536,7 +530,7 @@ int udev_node_update(sd_device *dev, sd_device *dev_ol=
d) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return log_d=
evice_debug_errno(dev, r, &quot;Failed to get device path: %m&quot;);<br>
+ <br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* always add /dev/{block,char}/$major:$=
minor */<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 r =3D node_symlink(dev, devnode, filename);<b=
r>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 r =3D node_symlink(dev, NULL, filename);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (r &lt; 0)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return log_d=
evice_warning_errno(dev, r, &quot;Failed to create device symlink &#39;%s&#=
39;: %m&quot;, filename);<br>
+ <br>
+-- <br>
+2.25.1<br>
+<br>
diff --git a/meta/recipes-core/systemd/systemd/0009-udev-use-flock-when-upd=
ating-device-node-symlinks.patch b/meta/recipes-core/systemd/systemd/0009-u=
dev-use-flock-when-updating-device-node-symlinks.patch<br>
new file mode 100644<br>
index 0000000000..96ce076378<br>
--- /dev/null<br>
+++ b/meta/recipes-core/systemd/systemd/0009-udev-use-flock-when-updating-d=
evice-node-symlinks.patch<br>
@@ -0,0 +1,277 @@<br>
+From 57a272902aa821f9598dd0d74eab98d287473a63 Mon Sep 17 00:00:00 2001<br>
+From: Yu Watanabe &lt;<a href=3D"mailto:watanabe.yu%2Bgithub@gmail.com" ta=
rget=3D"_blank">watanabe.yu+github@gmail.com</a>&gt;<br>
+Date: Mon, 11 Apr 2022 12:17:23 +0900<br>
+Subject: [PATCH 09/10] udev: use flock() when updating device node symlink=
s<br>
+<br>
+By locking the stack directory, we can safely determine the device node<br=
>
+with the highest priority for a symlink. So, the multiple try-and-wait<br>
+loops can be dropped, and the code becomes quite simple.<br>
+<br>
+PR - <a href=3D"https://github.com/systemd/systemd/pull/23043" rel=3D"nore=
ferrer" target=3D"_blank">https://github.com/systemd/systemd/pull/23043</a>=
<br>
+Upstream-Status: Backport [<a href=3D"https://github.com/systemd/systemd/p=
ull/23043/commits/57a272902aa821f9598dd0d74eab98d287473a63" rel=3D"noreferr=
er" target=3D"_blank">https://github.com/systemd/systemd/pull/23043/commits=
/57a272902aa821f9598dd0d74eab98d287473a63</a>]<br>
+Signed-off-by: Ranjitsinh Rathod &lt;<a href=3D"mailto:ranjitsinh.rathod@k=
pit.com" target=3D"_blank">ranjitsinh.rathod@kpit.com</a>&gt;<br>
+<br>
+---<br>
+ src/udev/udev-node.c | 173 ++++++++++---------------------------------<br=
>
+ 1 file changed, 40 insertions(+), 133 deletions(-)<br>
+<br>
+diff --git a/src/udev/udev-node.c b/src/udev/udev-node.c<br>
+index 8e78546e18..42efaaa028 100644<br>
+--- a/src/udev/udev-node.c<br>
++++ b/src/udev/udev-node.c<br>
+@@ -1,11 +1,6 @@<br>
+ /* SPDX-License-Identifier: GPL-2.0-or-later */<br>
+ <br>
+-#include &lt;errno.h&gt;<br>
+-#include &lt;fcntl.h&gt;<br>
+-#include &lt;stdbool.h&gt;<br>
+-#include &lt;stddef.h&gt;<br>
+-#include &lt;sys/stat.h&gt;<br>
+-#include &lt;unistd.h&gt;<br>
++#include &lt;sys/file.h&gt;<br>
+ <br>
+ #include &quot;sd-id128.h&quot;<br>
+ <br>
+@@ -22,47 +17,15 @@<br>
+ #include &quot;mkdir-label.h&quot;<br>
+ #include &quot;parse-util.h&quot;<br>
+ #include &quot;path-util.h&quot;<br>
+-#include &quot;random-util.h&quot;<br>
+ #include &quot;selinux-util.h&quot;<br>
+ #include &quot;smack-util.h&quot;<br>
+ #include &quot;stat-util.h&quot;<br>
+-#include &quot;stdio-util.h&quot;<br>
+ #include &quot;string-util.h&quot;<br>
+-#include &quot;strxcpyx.h&quot;<br>
+-#include &quot;time-util.h&quot;<br>
+ #include &quot;udev-node.h&quot;<br>
+ #include &quot;user-util.h&quot;<br>
+ <br>
+-#define CREATE_LINK_MAX_RETRIES=C2=A0 =C2=A0 =C2=A0 =C2=A0 128<br>
+-#define LINK_UPDATE_MAX_RETRIES=C2=A0 =C2=A0 =C2=A0 =C2=A0 128<br>
+-#define UPDATE_TIMESTAMP_MAX_RETRIES=C2=A0 =C2=A0128<br>
+-#define MAX_RANDOM_DELAY (250 * USEC_PER_MSEC)<br>
+-#define MIN_RANDOM_DELAY ( 50 * USEC_PER_MSEC)<br>
+ #define UDEV_NODE_HASH_KEY SD_ID128_MAKE(b9,6a,f1,ce,40,31,44,1a,9e,19,ec=
,8b,ae,f3,e3,2f)<br>
+ <br>
+-static int create_symlink(const char *target, const char *slink) {<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 int r;<br>
+-<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 assert(target);<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 assert(slink);<br>
+-<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 for (unsigned i =3D 0; i &lt; CREATE_LINK_MAX=
_RETRIES; i++) {<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 r =3D mkdir_paren=
ts_label(slink, 0755);<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (r =3D=3D -ENO=
ENT)<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 continue;<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (r &lt; 0)<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 return r;<br>
+-<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 mac_selinux_creat=
e_file_prepare(slink, S_IFLNK);<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 r =3D RET_NERRNO(=
symlink(target, slink));<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 mac_selinux_creat=
e_file_clear();<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (r !=3D -ENOEN=
T)<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 return r;<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+-<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 return r;<br>
+-}<br>
+-<br>
+ static int node_symlink(sd_device *dev, const char *devnode, const char *=
slink) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0_cleanup_free_ char *target =3D NULL;<br=
>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0const char *id, *slink_tmp;<br>
+@@ -98,7 +61,13 @@ static int node_symlink(sd_device *dev, const char *dev=
node, const char *slink)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0slink_tmp =3D strjoina(slink, &quot;.tmp=
-&quot;, id);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(void) unlink(slink_tmp);<br>
+ <br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 r =3D create_symlink(target, slink_tmp);<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 r =3D mkdir_parents_label(slink_tmp, 0755);<b=
r>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (r &lt; 0)<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return log_device=
_debug_errno(dev, r, &quot;Failed to create parent directory of &#39;%s&#39=
;: %m&quot;, slink_tmp);<br>
++<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 mac_selinux_create_file_prepare(slink_tmp, S_=
IFLNK);<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 r =3D RET_NERRNO(symlink(target, slink_tmp));=
<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 mac_selinux_create_file_clear();<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (r &lt; 0)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return log_d=
evice_debug_errno(dev, r, &quot;Failed to create symlink &#39;%s&#39; to &#=
39;%s&#39;: %m&quot;, slink_tmp, target);<br>
+ <br>
+@@ -219,54 +188,7 @@ static int stack_directory_find_prioritized_devnode(s=
d_device *dev, const char *<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return !!*ret;<br>
+ }<br>
+ <br>
+-static int update_timestamp(sd_device *dev, int fd, struct stat *prev) {<=
br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 assert(fd &gt;=3D 0);<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 assert(prev);<br>
+-<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 /* Even if a symlink in the stack directory i=
s created/removed, the mtime of the directory may<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* not be changed. Why? Let&#39;s consid=
er the following situation. For simplicity, let&#39;s assume<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* there exist two udev workers (A and B=
) and all of them calls link_update() for the same<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* devlink simultaneously.<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0*<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* 1. A creates/removes a symlink in the=
 stack directory.<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* 2. A calls the first stat() in the lo=
op of link_update().<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* 3. A calls link_find_prioritized().<b=
r>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* 4. B creates/removes another symlink =
in the stack directory, so the result of the step 3 is outdated.<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* 5. B finishes link_update().<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* 6. A creates/removes devlink accordin=
g to the outdated result in the step 3.<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* 7. A calls the second stat() in the l=
oop of link_update().<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0*<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* If these 7 steps are processed in thi=
s order within a short time period that kernel&#39;s timer<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* does not increase, then even if the c=
ontents in the stack directory is changed, the results<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* of two stat() called by A shows the s=
ame timestamp, and A cannot detect the change.<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0*<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* By calling this function after creati=
ng/removing symlinks in the stack directory, the<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* timestamp of the stack directory is a=
lways increased at least in the above step 5, so A can<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* detect the update. */<br>
+-<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 for (unsigned i =3D 0; i &lt; UPDATE_TIMESTAM=
P_MAX_RETRIES; i++) {<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 struct stat st;<b=
r>
+-<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (fstat(fd, &am=
p;st) &lt; 0)<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 return -errno;<br>
+-<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (!stat_inode_u=
nmodified(prev, &amp;st))<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 return 0;<br>
+-<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 log_device_debug(=
dev,<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;Stack directory is modif=
ied, but its timestamp is not changed, &quot;<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;updating timestamp after=
 10ms.&quot;);<br>
+-<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (void) usleep(10 =
* USEC_PER_MSEC);<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (futimens(fd, =
NULL) &lt; 0)<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 return -errno;<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+-<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 return -ELOOP;<br>
+-}<br>
+-<br>
+ static int stack_directory_update(sd_device *dev, int fd, bool add) {<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 struct stat st;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0const char *id;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0int r;<br>
+ <br>
+@@ -277,9 +199,6 @@ static int stack_directory_update(sd_device *dev, int =
fd, bool add) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (r &lt; 0)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return r;<br=
>
+ <br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (fstat(fd, &amp;st) &lt; 0)<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return -errno;<br=
>
+-<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (add) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0_cleanup_fre=
e_ char *data =3D NULL, *buf =3D NULL;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0const char *=
devname;<br>
+@@ -312,11 +231,7 @@ static int stack_directory_update(sd_device *dev, int=
 fd, bool add) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+ <br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 r =3D update_timestamp(dev, fd, &amp;st);<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (r &lt; 0)<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return r;<br>
+-<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 return 0;<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 return 1; /* Updated. */<br>
+ }<br>
+ <br>
+ static int stack_directory_open(const char *dirname) {<br>
+@@ -336,6 +251,21 @@ static int stack_directory_open(const char *dirname) =
{<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return TAKE_FD(fd);<br>
+ }<br>
+ <br>
++static int stack_directory_lock(int dirfd) {<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 _cleanup_close_ int fd =3D -1;<br>
++<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 assert(dirfd &gt;=3D 0);<br>
++<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 fd =3D openat(dirfd, &quot;.lock&quot;, O_CLO=
EXEC | O_NOFOLLOW | O_RDONLY | O_CREAT, 0600);<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (fd &lt; 0)<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return -errno;<br=
>
++<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (flock(fd, LOCK_EX) &lt; 0)<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return -errno;<br=
>
++<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 return TAKE_FD(fd);<br>
++}<br>
++<br>
+ size_t udev_node_escape_path(const char *src, char *dest, size_t size) {<=
br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0size_t i, j;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0uint64_t h;<br>
+@@ -410,8 +340,8 @@ static int stack_directory_get_name(const char *slink,=
 char **ret) {<br>
+ }<br>
+ <br>
+ static int link_update(sd_device *dev, const char *slink, bool add) {<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 _cleanup_free_ char *dirname =3D NULL;<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 _cleanup_close_ int dirfd =3D -1;<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 _cleanup_free_ char *dirname =3D NULL, *devno=
de =3D NULL;<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 _cleanup_close_ int dirfd =3D -1, lockfd =3D =
-1;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0int r;<br>
+ <br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0assert(dev);<br>
+@@ -425,51 +355,28 @@ static int link_update(sd_device *dev, const char *s=
link, bool add) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (dirfd &lt; 0)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return log_d=
evice_debug_errno(dev, dirfd, &quot;Failed to open stack directory &#39;%s&=
#39;: %m&quot;, dirname);<br>
+ <br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 lockfd =3D stack_directory_lock(dirfd);<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (lockfd &lt; 0)<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return log_device=
_debug_errno(dev, lockfd, &quot;Failed to lock stack directory &#39;%s&#39;=
: %m&quot;, dirname);<br>
++<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0r =3D stack_directory_update(dev, dirfd,=
 add);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (r &lt; 0)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return log_d=
evice_debug_errno(dev, r, &quot;Failed to update stack directory &#39;%s&#3=
9;: %m&quot;, dirname);<br>
+ <br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 for (unsigned i =3D 0; i &lt; LINK_UPDATE_MAX=
_RETRIES; i++) {<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 _cleanup_free_ ch=
ar *target =3D NULL;<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 struct stat st1 =
=3D {}, st2 =3D {};<br>
+-<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (i &gt; 0) {<b=
r>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 usec_t delay =3D MIN_RANDOM_DELAY + random_u64_range(MAX_RANDOM_=
DELAY - MIN_RANDOM_DELAY);<br>
+-<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 log_device_debug(dev, &quot;Directory %s was updated, retrying t=
o update devlink %s after %s.&quot;,<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0di=
rname, slink, FORMAT_TIMESPAN(delay, USEC_PER_MSEC));<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 (void) usleep(delay);<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+-<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (stat(dirname,=
 &amp;st1) &lt; 0 &amp;&amp; errno !=3D ENOENT)<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 return log_device_debug_errno(dev, errno, &quot;Failed to stat %=
s: %m&quot;, dirname);<br>
+-<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 r =3D stack_direc=
tory_find_prioritized_devnode(dev, dirname, add, &amp;target);<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (r &lt; 0)<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 return log_device_debug_errno(dev, r, &quot;Failed to determine =
device node with the highest priority for &#39;%s&#39;: %m&quot;, slink);<b=
r>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (r =3D=3D 0) {=
<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 log_device_debug(dev, &quot;No reference left for &#39;%s&#39;, =
removing&quot;, slink);<br>
+-<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 if (unlink(slink) &lt; 0 &amp;&amp; errno !=3D ENOENT)<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 log_device_debug_errno(dev, errno, &=
quot;Failed to remove &#39;%s&#39;, ignoring: %m&quot;, slink);<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 r =3D stack_directory_find_prioritized_devnod=
e(dev, dirname, add, &amp;devnode);<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (r &lt; 0)<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return log_device=
_debug_errno(dev, r, &quot;Failed to determine device node with the highest=
 priority for &#39;%s&#39;: %m&quot;, slink);<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (r &gt; 0)<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return node_symli=
nk(dev, devnode, slink);<br>
+ <br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 (void) rmdir_parents(slink, &quot;/dev&quot;);<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 return 0;<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 log_device_debug(dev, &quot;No reference left=
 for &#39;%s&#39;, removing&quot;, slink);<br>
+ <br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 r =3D node_symlin=
k(dev, target, slink);<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (r &lt; 0)<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 return r;<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (unlink(slink) &lt; 0 &amp;&amp; errno !=
=3D ENOENT)<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 log_device_debug_=
errno(dev, errno, &quot;Failed to remove &#39;%s&#39;, ignoring: %m&quot;, =
slink);<br>
+ <br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (stat(dirname,=
 &amp;st2) &lt; 0 &amp;&amp; errno !=3D ENOENT)<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 return log_device_debug_errno(dev, errno, &quot;Failed to stat %=
s: %m&quot;, dirname);<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 (void) rmdir_parents(slink, &quot;/dev&quot;)=
;<br>
+ <br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (((st1.st_mode=
 &amp; S_IFMT) =3D=3D 0 &amp;&amp; (st2.st_mode &amp; S_IFMT) =3D=3D 0) ||<=
br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 sta=
t_inode_unmodified(&amp;st1, &amp;st2))<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 return 0;<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+-<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 return -ELOOP;<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 return 0;<br>
+ }<br>
+ <br>
+ static int device_get_devpath_by_devnum(sd_device *dev, char **ret) {<br>
+-- <br>
+2.25.1<br>
+<br>
diff --git a/meta/recipes-core/systemd/systemd/0010-udev-cleanup-stack-dire=
ctory-run-udev-links-when-all.patch b/meta/recipes-core/systemd/systemd/001=
0-udev-cleanup-stack-directory-run-udev-links-when-all.patch<br>
new file mode 100644<br>
index 0000000000..7a6f614db7<br>
--- /dev/null<br>
+++ b/meta/recipes-core/systemd/systemd/0010-udev-cleanup-stack-directory-r=
un-udev-links-when-all.patch<br>
@@ -0,0 +1,130 @@<br>
+From 1055172804e660df2e1c498dafa998ffd65e0c88 Mon Sep 17 00:00:00 2001<br>
+From: Yu Watanabe &lt;<a href=3D"mailto:watanabe.yu%2Bgithub@gmail.com" ta=
rget=3D"_blank">watanabe.yu+github@gmail.com</a>&gt;<br>
+Date: Mon, 11 Apr 2022 21:52:49 +0900<br>
+Subject: [PATCH 10/10] udev: cleanup stack directory /run/udev/links when =
all<br>
+ workers exited<br>
+<br>
+By the previous commit, the stack directories are not removed even if<br>
+it is empty. To reduce the inode usage of /run, let&#39;s cleanup the<br>
+directories.<br>
+<br>
+PR - <a href=3D"https://github.com/systemd/systemd/pull/23043" rel=3D"nore=
ferrer" target=3D"_blank">https://github.com/systemd/systemd/pull/23043</a>=
<br>
+Upstream-Status: Backport [<a href=3D"https://github.com/systemd/systemd/p=
ull/23043/commits/1055172804e660df2e1c498dafa998ffd65e0c88" rel=3D"noreferr=
er" target=3D"_blank">https://github.com/systemd/systemd/pull/23043/commits=
/1055172804e660df2e1c498dafa998ffd65e0c88</a>]<br>
+Comments: Refreshed all hunks to apply patch cleanly without patch-fuzz<br=
>
+Signed-off-by: Ranjitsinh Rathod &lt;<a href=3D"mailto:ranjitsinh.rathod@k=
pit.com" target=3D"_blank">ranjitsinh.rathod@kpit.com</a>&gt;<br>
+<br>
+---<br>
+ src/udev/udev-node.c | 42 ++++++++++++++++++++++++++++++++++++++++++<br>
+ src/udev/udev-node.h |=C2=A0 1 +<br>
+ src/udev/udevd.c=C2=A0 =C2=A0 =C2=A0| 10 ++++++++++<br>
+ 3 files changed, 53 insertions(+)<br>
+<br>
+diff --git a/src/udev/udev-node.c b/src/udev/udev-node.c<br>
+index 42efaaa028..4e7dca06de 100644<br>
+--- a/src/udev/udev-node.c<br>
++++ b/src/udev/udev-node.c<br>
+@@ -24,6 +24,48 @@<br>
+ <br>
+ #define UDEV_NODE_HASH_KEY SD_ID128_MAKE(b9,6a,f1,ce,40,31,44,1a,9e,19,ec=
,8b,ae,f3,e3,2f)<br>
+ <br>
++int udev_node_cleanup(void) {<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 _cleanup_closedir_ DIR *dir =3D NULL;<br>
++<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 /* This must not be called when any workers e=
xist. It would cause a race between mkdir() called<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* by stack_directory_lock() and unlinka=
t() called by this. */<br>
++<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 dir =3D opendir(&quot;/run/udev/links&quot;);=
<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (!dir) {<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (errno =3D=3D =
ENOENT)<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 return 0;<br>
++<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return log_debug_=
errno(errno, &quot;Failed to open directory &#39;/run/udev/links&#39;, igno=
ring: %m&quot;);<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
++<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 FOREACH_DIRENT_ALL(de, dir, break) {<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 _cleanup_free_ ch=
ar *lockfile =3D NULL;<br>
++<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (de-&gt;d_name=
[0] =3D=3D &#39;.&#39;)<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 continue;<br>
++<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (de-&gt;d_type=
 !=3D DT_DIR)<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 continue;<br>
++<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /* As commented i=
n the above, this is called when no worker exists, hence the file is not<br=
>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* locked. O=
n a later uevent, the lock file will be created if necessary. So, we can sa=
fely<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* remove th=
e file now. */<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 lockfile =3D path=
_join(de-&gt;d_name, &quot;.lock&quot;);<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (!lockfile)<br=
>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 return log_oom_debug();<br>
++<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (unlinkat(dirf=
d(dir), lockfile, 0) &lt; 0 &amp;&amp; errno !=3D ENOENT) {<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 log_debug_errno(errno, &quot;Failed to remove &#39;/run/udev/lin=
ks/%s&#39;, ignoring: %m&quot;, lockfile);<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 continue;<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
++<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (unlinkat(dirf=
d(dir), de-&gt;d_name, AT_REMOVEDIR) &lt; 0 &amp;&amp; errno !=3D ENOTEMPTY=
)<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 log_debug_errno(errno, &quot;Failed to remove &#39;/run/udev/lin=
ks/%s&#39;, ignoring: %m&quot;, de-&gt;d_name);<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
++<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 return 0;<br>
++}<br>
++<br>
+ static int node_symlink(sd_device *dev, const char *devnode, const char *=
slink) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0_cleanup_free_ char *target =3D NULL;<br=
>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0const char *id, *slink_tmp;<br>
+diff --git a/src/udev/udev-node.h b/src/udev/udev-node.h<br>
+index 86a829545a..0c545e4a0f 100644<br>
+--- a/src/udev/udev-node.h<br>
++++ b/src/udev/udev-node.h<br>
+@@ -17,5 +17,6 @@ int udev_node_apply_permissions(<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0OrderedHashm=
ap *seclabel_list);<br>
+ int udev_node_remove(sd_device *dev);<br>
+ int udev_node_update(sd_device *dev, sd_device *dev_old);<br>
++int udev_node_cleanup(void);<br>
+ <br>
+ size_t udev_node_escape_path(const char *src, char *dest, size_t size);<b=
r>
+diff --git a/src/udev/udevd.c b/src/udev/udevd.c<br>
+index b179dfac37..c519e19897 100644<br>
+--- a/src/udev/udevd.c<br>
++++ b/src/udev/udevd.c<br>
+@@ -62,6 +62,7 @@<br>
+ #include &quot;udev-builtin.h&quot;<br>
+ #include &quot;udev-ctrl.h&quot;<br>
+ #include &quot;udev-event.h&quot;<br>
++#include &quot;udev-node.h&quot;<br>
+ #include &quot;udev-util.h&quot;<br>
+ #include &quot;udev-watch.h&quot;<br>
+ #include &quot;user-util.h&quot;<br>
+@@ -106,6 +107,7 @@ typedef struct Manager {<br>
+ <br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0usec_t last_usec;<br>
+ <br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 bool udev_node_needs_cleanup;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0bool stop_exec_queue;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0bool exit;<br>
+ } Manager;<br>
+@@ -933,6 +935,9 @@ static int event_queue_start(Manager *ma<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0manager-&gt;=
last_usec =3D usec;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+ <br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 /* To make the stack directory /run/udev/link=
s cleaned up later. */<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 manager-&gt;udev_node_needs_cleanup =3D true;=
<br>
++<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0r =3D event_source_disable(manager-&gt;k=
ill_workers_event);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (r &lt; 0)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0log_warning_=
errno(r, &quot;Failed to disable event source for cleaning up idle workers,=
 ignoring: %m&quot;);<br>
+@@ -1487,6 +1492,11 @@ static int on_post(sd_event_source *s, v<br>
+ <br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* There are no idle workers. */<br>
+ <br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (manager-&gt;udev_node_needs_cleanup) {<br=
>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (void) udev_node_=
cleanup();<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 manager-&gt;udev_=
node_needs_cleanup =3D false;<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
++<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (manager-&gt;exit)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return sd_ev=
ent_exit(manager-&gt;event, 0);<br>
+ <br>
+-- <br>
+2.25.1<br>
+<br>
diff --git a/meta/recipes-core/systemd/<a href=3D"http://systemd_250.5.bb" =
rel=3D"noreferrer" target=3D"_blank">systemd_250.5.bb</a> b/meta/recipes-co=
re/systemd/<a href=3D"http://systemd_250.5.bb" rel=3D"noreferrer" target=3D=
"_blank">systemd_250.5.bb</a><br>
index 4d520c85f3..22ebc0a229 100644<br>
--- a/meta/recipes-core/systemd/<a href=3D"http://systemd_250.5.bb" rel=3D"=
noreferrer" target=3D"_blank">systemd_250.5.bb</a><br>
+++ b/meta/recipes-core/systemd/<a href=3D"http://systemd_250.5.bb" rel=3D"=
noreferrer" target=3D"_blank">systemd_250.5.bb</a><br>
@@ -34,6 +34,16 @@ SRC_URI +=3D &quot;file://touchscreen.rules \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0001-nspawn-make-sure-host=
-root-can-write-to-the-uidmappe.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://CVE-2023-7008.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://fix-vlan-qos-mapping.patch=
 \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0001-udev-move-udev_node_e=
scape_path.patch \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0002-udev-split-link_updat=
e-and-introduce-stack_directory.patch \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0003-udev-do-not-remove-st=
ack-directory-even-if-it-is-emp.patch \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0004-path-util-introduce-p=
ath_make_relative_parent.patch \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0005-udev-use-readlinkat_m=
alloc.patch \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0006-udev-rename-link_find=
_prioritized-and-variables.patch \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0007-udev-use-path_make_re=
lative_parent.patch \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0008-udev-make-node_symlin=
k-accept-NULL-devname.patch \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0009-udev-use-flock-when-u=
pdating-device-node-symlinks.patch \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0010-udev-cleanup-stack-di=
rectory-run-udev-links-when-all.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;<br>
<br>
=C2=A0# patches needed by musl<br>
-- <br>
2.25.1<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#199203): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/199203" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/199203</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/106034797/168=
6489" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/106034797/1686489</a><br>
Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openembedded=
.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org</a><=
br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-core/=
unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/=
g/openembedded-core/unsub</a> [<a href=3D"mailto:alex.kanavin@gmail.com" ta=
rget=3D"_blank">alex.kanavin@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div></div>

--000000000000cd33b2061826a095--

