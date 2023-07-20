Return-Path: <tgamblin@baylibre.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CA8E8EB64DA
	for <webhook@archiver.kernel.org>; Thu, 20 Jul 2023 20:02:46 +0000 (UTC)
Received: from mail-qt1-f180.google.com (mail-qt1-f180.google.com [209.85.160.180])
 by mx.groups.io with SMTP id smtpd.web10.338.1689883363669102495
 for <openembedded-core@lists.openembedded.org>;
 Thu, 20 Jul 2023 13:02:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@baylibre-com.20221208.gappssmtp.com header.s=20221208 header.b=La7wLXsZ;
 spf=pass (domain: baylibre.com, ip: 209.85.160.180, mailfrom: tgamblin@baylibre.com)
Received: by mail-qt1-f180.google.com with SMTP id d75a77b69052e-4053cc10debso9530881cf.2
        for <openembedded-core@lists.openembedded.org>; Thu, 20 Jul 2023 13:02:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20221208.gappssmtp.com; s=20221208; t=1689883363; x=1690488163;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=yI/gf+pYyQSIL0k1PYaCw8gS0ZI5fdlGqn1EiRo/41Y=;
        b=La7wLXsZi3AVvWP1YiRmYTC/4Xio2bN8/N1pJWGD4/SNjRx54oV7CQmB4oQO0FpIa4
         nRLoy2Gx28yWj/54Jg61EakVGS8SS30Xt/MVE3X9mRpjHieEhwl5E9ruKgFkt7Q5h1u6
         AO3WXnHYKkUS+j7S8FhpPIZlaq0XD9hQBUFOIJuswF6T8SSBTt+DyVb5yhDp2vh+wkJM
         OM8+beVtIBO8TXN/xy4A+hesdfVa0eD6NiFOwLImhR/FBdCj5PnaT2PgsUkA//aAFe5Q
         RX/jNxY69NKP0BhfT6uz+atoVaHFoJew2ckzqdOZEyP/Z3+dmpeIH4Dz9/kiATZnkmkg
         Ud0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689883363; x=1690488163;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=yI/gf+pYyQSIL0k1PYaCw8gS0ZI5fdlGqn1EiRo/41Y=;
        b=MuWaDxqYvKD//PMQb/qxJD2dxja6/PrZSpeNSv9tFlFBNwxSXCSPRVgbDHmkcDfLa0
         IJ4RdFBU+FfrgB1pHrutfdjlLaRnr1v1HdGbIN6YOfki45vPwHucBLWcVhFNO6dGthCK
         lRleqw3NFcCDjZgVMLodY6QIC9whfkV8lhceXdgt72rZAejnjUHvth3YjWXEUL2CVQ7A
         DflJv6j1zbPL0bGzAkbBTubkT3czZiMRMa9pA6QQAjQ8krqWcqCCsCxDPL+iOkj2kiNO
         g2Bw2gqqgGHkEHbV5tlPU07AOxqTbbwPSjFwx4ajGX8mZotCupD2rbQJV0x6uZu65mqe
         vMdg==
X-Gm-Message-State: ABy/qLZkYGJEcg28P1AMrLPge8TZcZhMw7rMnFD2J6i37wdcIEjTh7US
	NdHWvZwVoV/D5yFYwwCwaki6XA==
X-Google-Smtp-Source: APBJJlFf+10dnUWa8JCG+RgPrKRc2RGYgHJfjOso6uyredNVQbcdhNbOm6qurdY/AhnDcNLIYq9ONA==
X-Received: by 2002:a05:622a:1828:b0:403:c51e:f038 with SMTP id t40-20020a05622a182800b00403c51ef038mr87264qtc.17.1689883362527;
        Thu, 20 Jul 2023 13:02:42 -0700 (PDT)
Received: from ?IPV6:2001:1970:5b1f:ab00:d875:6297:4e81:e577? ([2001:1970:5b1f:ab00:d875:6297:4e81:e577])
        by smtp.gmail.com with ESMTPSA id t4-20020ac87604000000b0040327381dbcsm672051qtq.19.2023.07.20.13.02.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 20 Jul 2023 13:02:42 -0700 (PDT)
Message-ID: <f2c891f4-22f5-b01a-50a7-965b2916f2b0@baylibre.com>
Date: Thu, 20 Jul 2023 16:02:41 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [OE-core][PATCH] nfs-utils: upgrade 2.6.2 -> 2.6.3
Content-Language: en-US
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org
References: <20230720162144.971805-1-tgamblin@baylibre.com>
 <CANNYZj9a-DgXEeqt9CFwjFG+ZCd5cgaeiXqyC3-QfKYvMThZRA@mail.gmail.com>
From: Trevor Gamblin <tgamblin@baylibre.com>
In-Reply-To: <CANNYZj9a-DgXEeqt9CFwjFG+ZCd5cgaeiXqyC3-QfKYvMThZRA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 20 Jul 2023 20:02:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/184659


On 2023-07-20 14:48, Alexander Kanavin wrote:
> LDFLAGS issue is better addressed with a backport:
> http://git.linux-nfs.org/?p=steved/nfs-utils.git;a=commit;h=bc4a5deef9f820c55fdac3c0070364c17cd91cca
Thanks for the heads-up. v2 incoming.
>
> Alex
>
> On Thu, 20 Jul 2023 at 18:21, Trevor Gamblin <tgamblin@baylibre.com> wrote:
>> Changelog: http://git.linux-nfs.org/?p=steved/nfs-utils.git;a=shortlog
>>
>> Three patches were removed as they're now upstream:
>>
>> 2c0b5249 Replace statfs64 with statfs
>> 167f2336 Fix function prototypes
>> 896946e3 mountd: Check for return of stat function
>>
>> do_compile still failed after removing these patches, reporting
>> undefined references to 'event_base_new', 'sqlite3_open_v2', etc. This
>> is fixed by adding the following line:
>>
>> LDFLAGS:append = " -lsqlite3 -levent"
>>
>> Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
>> ---
>>   .../0001-Replace-statfs64-with-statfs.patch   | 171 ------------------
>>   ...td-Check-for-return-of-stat-function.patch |  34 ----
>>   .../0006-Fix-function-prototypes.patch        |  93 ----------
>>   ...{nfs-utils_2.6.2.bb => nfs-utils_2.6.3.bb} |   7 +-
>>   4 files changed, 3 insertions(+), 302 deletions(-)
>>   delete mode 100644 meta/recipes-connectivity/nfs-utils/nfs-utils/0001-Replace-statfs64-with-statfs.patch
>>   delete mode 100644 meta/recipes-connectivity/nfs-utils/nfs-utils/0005-mountd-Check-for-return-of-stat-function.patch
>>   delete mode 100644 meta/recipes-connectivity/nfs-utils/nfs-utils/0006-Fix-function-prototypes.patch
>>   rename meta/recipes-connectivity/nfs-utils/{nfs-utils_2.6.2.bb => nfs-utils_2.6.3.bb} (95%)
>>
>> diff --git a/meta/recipes-connectivity/nfs-utils/nfs-utils/0001-Replace-statfs64-with-statfs.patch b/meta/recipes-connectivity/nfs-utils/nfs-utils/0001-Replace-statfs64-with-statfs.patch
>> deleted file mode 100644
>> index 40ceff9ae9..0000000000
>> --- a/meta/recipes-connectivity/nfs-utils/nfs-utils/0001-Replace-statfs64-with-statfs.patch
>> +++ /dev/null
>> @@ -1,171 +0,0 @@
>> -From e89652b853ca7de671093ae44305fa3435e13d3d Mon Sep 17 00:00:00 2001
>> -From: Khem Raj <raj.khem@gmail.com>
>> -Date: Thu, 15 Dec 2022 13:29:43 -0800
>> -Subject: [PATCH] Replace statfs64 with statfs
>> -
>> -autoconf AC_SYS_LARGEFILE is used by configure to add needed defines
>> -when needed for enabling 64bit off_t, therefore replacing statfs64 with
>> -statfs should be functionally same. Additionally this helps compiling
>> -with latest musl where 64bit LFS functions like statfs64 and friends are
>> -now moved under _LARGEFILE64_SOURCE feature test macro, this works on
>> -glibc systems because _GNU_SOURCE macros also enables
>> -_LARGEFILE64_SOURCE indirectly. This is not case with musl and this
>> -latest issue is exposed.
>> -
>> -Upstream-Status: Submitted [https://lore.kernel.org/linux-nfs/20221215213605.4061853-1-raj.khem@gmail.com/T/#u]
>> -Signed-off-by: Khem Raj <raj.khem@gmail.com>
>> ----
>> - support/export/cache.c      | 14 +++++++-------
>> - support/include/nfsd_path.h |  6 +++---
>> - support/misc/nfsd_path.c    | 24 ++++++++++++------------
>> - utils/exportfs/exportfs.c   |  4 ++--
>> - 4 files changed, 24 insertions(+), 24 deletions(-)
>> -
>> -diff --git a/support/export/cache.c b/support/export/cache.c
>> -index a5823e9..2497d4f 100644
>> ---- a/support/export/cache.c
>> -+++ b/support/export/cache.c
>> -@@ -346,27 +346,27 @@ static int uuid_by_path(char *path, int type, size_t uuidlen, char *uuid)
>> -
>> -       /* Possible sources of uuid are
>> -        * - blkid uuid
>> --       * - statfs64 uuid
>> -+       * - statfs uuid
>> -        *
>> --       * On some filesystems (e.g. vfat) the statfs64 uuid is simply an
>> -+       * On some filesystems (e.g. vfat) the statfs uuid is simply an
>> -        * encoding of the device that the filesystem is mounted from, so
>> -        * it we be very bad to use that (as device numbers change).  blkid
>> -        * must be preferred.
>> --       * On other filesystems (e.g. btrfs) the statfs64 uuid contains
>> -+       * On other filesystems (e.g. btrfs) the statfs uuid contains
>> -        * important info that the blkid uuid cannot contain:  This happens
>> -        * when multiple subvolumes are exported (they have the same
>> --       * blkid uuid but different statfs64 uuids).
>> -+       * blkid uuid but different statfs uuids).
>> -        * We rely on get_uuid_blkdev *knowing* which is which and not returning
>> --       * a uuid for filesystems where the statfs64 uuid is better.
>> -+       * a uuid for filesystems where the statfs uuid is better.
>> -        *
>> -        */
>> --      struct statfs64 st;
>> -+      struct statfs st;
>> -       char fsid_val[17];
>> -       const char *blkid_val = NULL;
>> -       const char *val;
>> -       int rc;
>> -
>> --      rc = nfsd_path_statfs64(path, &st);
>> -+      rc = nfsd_path_statfs(path, &st);
>> -
>> -       if (type == 0 && rc == 0) {
>> -               const unsigned long *bad;
>> -diff --git a/support/include/nfsd_path.h b/support/include/nfsd_path.h
>> -index 3b73aad..aa1e1dd 100644
>> ---- a/support/include/nfsd_path.h
>> -+++ b/support/include/nfsd_path.h
>> -@@ -7,7 +7,7 @@
>> - #include <sys/stat.h>
>> -
>> - struct file_handle;
>> --struct statfs64;
>> -+struct statfs;
>> -
>> - void          nfsd_path_init(void);
>> -
>> -@@ -18,8 +18,8 @@ char *               nfsd_path_prepend_dir(const char *dir, const char *pathname);
>> - int           nfsd_path_stat(const char *pathname, struct stat *statbuf);
>> - int           nfsd_path_lstat(const char *pathname, struct stat *statbuf);
>> -
>> --int           nfsd_path_statfs64(const char *pathname,
>> --                                 struct statfs64 *statbuf);
>> -+int           nfsd_path_statfs(const char *pathname,
>> -+                                 struct statfs *statbuf);
>> -
>> - char *                nfsd_realpath(const char *path, char *resolved_path);
>> -
>> -diff --git a/support/misc/nfsd_path.c b/support/misc/nfsd_path.c
>> -index 65e53c1..c3dea4f 100644
>> ---- a/support/misc/nfsd_path.c
>> -+++ b/support/misc/nfsd_path.c
>> -@@ -184,46 +184,46 @@ nfsd_path_lstat(const char *pathname, struct stat *statbuf)
>> -       return nfsd_run_stat(nfsd_wq, nfsd_lstatfunc, pathname, statbuf);
>> - }
>> -
>> --struct nfsd_statfs64_data {
>> -+struct nfsd_statfs_data {
>> -       const char *pathname;
>> --      struct statfs64 *statbuf;
>> -+      struct statfs *statbuf;
>> -       int ret;
>> -       int err;
>> - };
>> -
>> - static void
>> --nfsd_statfs64func(void *data)
>> -+nfsd_statfsfunc(void *data)
>> - {
>> --      struct nfsd_statfs64_data *d = data;
>> -+      struct nfsd_statfs_data *d = data;
>> -
>> --      d->ret = statfs64(d->pathname, d->statbuf);
>> -+      d->ret = statfs(d->pathname, d->statbuf);
>> -       if (d->ret < 0)
>> -               d->err = errno;
>> - }
>> -
>> - static int
>> --nfsd_run_statfs64(struct xthread_workqueue *wq,
>> -+nfsd_run_statfs(struct xthread_workqueue *wq,
>> -                 const char *pathname,
>> --                struct statfs64 *statbuf)
>> -+                struct statfs *statbuf)
>> - {
>> --      struct nfsd_statfs64_data data = {
>> -+      struct nfsd_statfs_data data = {
>> -               pathname,
>> -               statbuf,
>> -               0,
>> -               0
>> -       };
>> --      xthread_work_run_sync(wq, nfsd_statfs64func, &data);
>> -+      xthread_work_run_sync(wq, nfsd_statfsfunc, &data);
>> -       if (data.ret < 0)
>> -               errno = data.err;
>> -       return data.ret;
>> - }
>> -
>> - int
>> --nfsd_path_statfs64(const char *pathname, struct statfs64 *statbuf)
>> -+nfsd_path_statfs(const char *pathname, struct statfs *statbuf)
>> - {
>> -       if (!nfsd_wq)
>> --              return statfs64(pathname, statbuf);
>> --      return nfsd_run_statfs64(nfsd_wq, pathname, statbuf);
>> -+              return statfs(pathname, statbuf);
>> -+      return nfsd_run_statfs(nfsd_wq, pathname, statbuf);
>> - }
>> -
>> - struct nfsd_realpath_data {
>> -diff --git a/utils/exportfs/exportfs.c b/utils/exportfs/exportfs.c
>> -index 0897b22..6d79a5b 100644
>> ---- a/utils/exportfs/exportfs.c
>> -+++ b/utils/exportfs/exportfs.c
>> -@@ -513,7 +513,7 @@ validate_export(nfs_export *exp)
>> -        */
>> -       struct stat stb;
>> -       char *path = exportent_realpath(&exp->m_export);
>> --      struct statfs64 stf;
>> -+      struct statfs stf;
>> -       int fs_has_fsid = 0;
>> -
>> -       if (stat(path, &stb) < 0) {
>> -@@ -528,7 +528,7 @@ validate_export(nfs_export *exp)
>> -       if (!can_test())
>> -               return;
>> -
>> --      if (!statfs64(path, &stf) &&
>> -+      if (!statfs(path, &stf) &&
>> -           (stf.f_fsid.__val[0] || stf.f_fsid.__val[1]))
>> -               fs_has_fsid = 1;
>> -
>> diff --git a/meta/recipes-connectivity/nfs-utils/nfs-utils/0005-mountd-Check-for-return-of-stat-function.patch b/meta/recipes-connectivity/nfs-utils/nfs-utils/0005-mountd-Check-for-return-of-stat-function.patch
>> deleted file mode 100644
>> index 13a21e5307..0000000000
>> --- a/meta/recipes-connectivity/nfs-utils/nfs-utils/0005-mountd-Check-for-return-of-stat-function.patch
>> +++ /dev/null
>> @@ -1,34 +0,0 @@
>> -From 887ecc7837962e9be77a4fea7d9122648f73a84a Mon Sep 17 00:00:00 2001
>> -From: Khem Raj <raj.khem@gmail.com>
>> -Date: Mon, 15 Aug 2022 14:47:53 -0700
>> -Subject: [PATCH] mountd: Check for return of stat function
>> -
>> -simplify the check, stat() return 0 on success -1 on failure
>> -
>> -Fixes clang reported errors e.g.
>> -
>> -| v4clients.c:29:6: error: logical not is only applied to the left hand side of this comparison [-Werror,-Wlogical-not-parentheses]
>> -|         if (!stat("/proc/fs/nfsd/clients", &sb) == 0 ||
>> -|             ^                                   ~~
>> -
>> -Upstream-Status: Submitted [https://patchwork.kernel.org/project/linux-nfs/patch/20220816024403.2694169-1-raj.khem@gmail.com/]
>> -Signed-off-by: Khem Raj <raj.khem@gmail.com>
>> -Cc: Konstantin Khorenko <khorenko@virtuozzo.com>
>> -Cc: Steve Dickson <steved@redhat.com>
>> ----
>> - support/export/v4clients.c | 2 +-
>> - 1 file changed, 1 insertion(+), 1 deletion(-)
>> -
>> -diff --git a/support/export/v4clients.c b/support/export/v4clients.c
>> -index 5f15b61..3230251 100644
>> ---- a/support/export/v4clients.c
>> -+++ b/support/export/v4clients.c
>> -@@ -26,7 +26,7 @@ void v4clients_init(void)
>> - {
>> -       struct stat sb;
>> -
>> --      if (!stat("/proc/fs/nfsd/clients", &sb) == 0 ||
>> -+      if (stat("/proc/fs/nfsd/clients", &sb) != 0 ||
>> -           !S_ISDIR(sb.st_mode))
>> -               return;
>> -       if (clients_fd >= 0)
>> diff --git a/meta/recipes-connectivity/nfs-utils/nfs-utils/0006-Fix-function-prototypes.patch b/meta/recipes-connectivity/nfs-utils/nfs-utils/0006-Fix-function-prototypes.patch
>> deleted file mode 100644
>> index 793bc4651c..0000000000
>> --- a/meta/recipes-connectivity/nfs-utils/nfs-utils/0006-Fix-function-prototypes.patch
>> +++ /dev/null
>> @@ -1,93 +0,0 @@
>> -From cf0ffbb5c8fa167376926d12a63613f15aa7602f Mon Sep 17 00:00:00 2001
>> -From: Khem Raj <raj.khem@gmail.com>
>> -Date: Mon, 15 Aug 2022 14:50:15 -0700
>> -Subject: [PATCH] Fix function prototypes
>> -
>> -Clang is now erroring out on functions with out parameter types
>> -
>> -Fixes errors like
>> -error: a function declaration without a prototype is deprecated in all versions of C [-Werror,-Wstrict-prototypes]
>> -
>> -Upstream-Status: Submitted [https://patchwork.kernel.org/project/linux-nfs/patch/20220816024403.2694169-2-raj.khem@gmail.com/]
>> -Signed-off-by: Khem Raj <raj.khem@gmail.com>
>> ----
>> - support/export/auth.c     | 2 +-
>> - support/export/v4root.c   | 2 +-
>> - support/export/xtab.c     | 2 +-
>> - utils/exportfs/exportfs.c | 4 ++--
>> - utils/mount/network.c     | 2 +-
>> - 5 files changed, 6 insertions(+), 6 deletions(-)
>> -
>> -diff --git a/support/export/auth.c b/support/export/auth.c
>> -index 03ce4b8..2d7960f 100644
>> ---- a/support/export/auth.c
>> -+++ b/support/export/auth.c
>> -@@ -82,7 +82,7 @@ check_useipaddr(void)
>> - }
>> -
>> - unsigned int
>> --auth_reload()
>> -+auth_reload(void)
>> - {
>> -       struct stat             stb;
>> -       static ino_t            last_inode;
>> -diff --git a/support/export/v4root.c b/support/export/v4root.c
>> -index c12a7d8..fbb0ad5 100644
>> ---- a/support/export/v4root.c
>> -+++ b/support/export/v4root.c
>> -@@ -198,7 +198,7 @@ static int v4root_add_parents(nfs_export *exp)
>> -  * looking for components of the v4 mount.
>> -  */
>> - void
>> --v4root_set()
>> -+v4root_set(void)
>> - {
>> -       nfs_export      *exp;
>> -       int     i;
>> -diff --git a/support/export/xtab.c b/support/export/xtab.c
>> -index c888a80..e210ca9 100644
>> ---- a/support/export/xtab.c
>> -+++ b/support/export/xtab.c
>> -@@ -135,7 +135,7 @@ xtab_write(char *xtab, char *xtabtmp, char *lockfn, int is_export)
>> - }
>> -
>> - int
>> --xtab_export_write()
>> -+xtab_export_write(void)
>> - {
>> -       return xtab_write(etab.statefn, etab.tmpfn, etab.lockfn, 1);
>> - }
>> -diff --git a/utils/exportfs/exportfs.c b/utils/exportfs/exportfs.c
>> -index 6ba615d..0897b22 100644
>> ---- a/utils/exportfs/exportfs.c
>> -+++ b/utils/exportfs/exportfs.c
>> -@@ -69,14 +69,14 @@ static int _lockfd = -1;
>> -  * need these additional lockfile() routines.
>> -  */
>> - static void
>> --grab_lockfile()
>> -+grab_lockfile(void)
>> - {
>> -       _lockfd = open(lockfile, O_CREAT|O_RDWR, 0666);
>> -       if (_lockfd != -1)
>> -               lockf(_lockfd, F_LOCK, 0);
>> - }
>> - static void
>> --release_lockfile()
>> -+release_lockfile(void)
>> - {
>> -       if (_lockfd != -1) {
>> -               lockf(_lockfd, F_ULOCK, 0);
>> -diff --git a/utils/mount/network.c b/utils/mount/network.c
>> -index ed2f825..01ead49 100644
>> ---- a/utils/mount/network.c
>> -+++ b/utils/mount/network.c
>> -@@ -179,7 +179,7 @@ static const unsigned long probe_mnt3_only[] = {
>> -
>> - static const unsigned int *nfs_default_proto(void);
>> - #ifdef MOUNT_CONFIG
>> --static const unsigned int *nfs_default_proto()
>> -+static const unsigned int *nfs_default_proto(void)
>> - {
>> -       extern unsigned long config_default_proto;
>> -       /*
>> diff --git a/meta/recipes-connectivity/nfs-utils/nfs-utils_2.6.2.bb b/meta/recipes-connectivity/nfs-utils/nfs-utils_2.6.3.bb
>> similarity index 95%
>> rename from meta/recipes-connectivity/nfs-utils/nfs-utils_2.6.2.bb
>> rename to meta/recipes-connectivity/nfs-utils/nfs-utils_2.6.3.bb
>> index 21df1803c5..4992bc89b1 100644
>> --- a/meta/recipes-connectivity/nfs-utils/nfs-utils_2.6.2.bb
>> +++ b/meta/recipes-connectivity/nfs-utils/nfs-utils_2.6.3.bb
>> @@ -30,11 +30,8 @@ SRC_URI = "${KERNELORG_MIRROR}/linux/utils/nfs-utils/${PV}/nfs-utils-${PV}.tar.x
>>              file://bugfix-adjust-statd-service-name.patch \
>>              file://0001-Makefile.am-fix-undefined-function-for-libnsm.a.patch \
>>              file://clang-warnings.patch \
>> -           file://0005-mountd-Check-for-return-of-stat-function.patch \
>> -           file://0006-Fix-function-prototypes.patch \
>> -           file://0001-Replace-statfs64-with-statfs.patch \
>>              "
>> -SRC_URI[sha256sum] = "5200873e81c4d610e2462fc262fe18135f2dbe78b7979f95accd159ae64d5011"
>> +SRC_URI[sha256sum] = "38d89e853a71d3c560ff026af3d969d75e24f782ff68324e76261fe0344459e1"
>>
>>   # Only kernel-module-nfsd is required here (but can be built-in)  - the nfsd module will
>>   # pull in the remainder of the dependencies.
>> @@ -62,6 +59,8 @@ EXTRA_OECONF = "--with-statduser=rpcuser \
>>                   --with-rpcgen=${HOSTTOOLS_DIR}/rpcgen \
>>                  "
>>
>> +LDFLAGS:append = " -lsqlite3 -levent"
>> +
>>   PACKAGECONFIG ??= "tcp-wrappers \
>>       ${@bb.utils.filter('DISTRO_FEATURES', 'ipv6', d)} \
>>   "
>> --
>> 2.41.0
>>
>>
>> -=-=-=-=-=-=-=-=-=-=-=-
>> Links: You receive all messages sent to this group.
>> View/Reply Online (#184643): https://lists.openembedded.org/g/openembedded-core/message/184643
>> Mute This Topic: https://lists.openembedded.org/mt/100259265/1686489
>> Group Owner: openembedded-core+owner@lists.openembedded.org
>> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alex.kanavin@gmail.com]
>> -=-=-=-=-=-=-=-=-=-=-=-
>>

