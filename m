Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 25B4AC6FD1F
	for <webhook@archiver.kernel.org>; Fri, 29 Mar 2024 05:34:35 +0000 (UTC)
Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com [209.85.208.173])
 by mx.groups.io with SMTP id smtpd.web10.10933.1711690472310714239
 for <openembedded-core@lists.openembedded.org>;
 Thu, 28 Mar 2024 22:34:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=CGSP6Znc;
 spf=pass (domain: gmail.com, ip: 209.85.208.173, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lj1-f173.google.com with SMTP id 38308e7fff4ca-2d46dd5f222so24953851fa.1
        for <openembedded-core@lists.openembedded.org>; Thu, 28 Mar 2024 22:34:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1711690470; x=1712295270; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=oxPuAlW+ifEEMmKVLuPhWeytqOWifnzQWTCkHbkl24o=;
        b=CGSP6ZncYVivrKs/4bmYGsg+6yLddje05tWea3k2O9kA5CD9bQyJGFS471iGuHJFOi
         LX15HRZNFtmPAXcWJ1K1+Yn+3YFjSVQq3NCtHtvDMpCO/VrqkOn/Kt5cR+guMmz2AhLF
         19wTMBKzM66fLoqQXcSgTeWMU6EDMYsdGAYqTuJUXy7XgiM7x+ccyXhLdDTpAUcXtL23
         U8y8i7X/Bbk1N/LUszR+MAHfvgU8st4SCMKVdoNI6FUPCeE/GcXAUNZhMWGQe0iw6WZv
         qLLJSNuu4rcoRxLRsH0gxJxoPyz3sG4VzejUEQOg6LVI7W8JPcbM9e3AYOc4pnsVS/a/
         pJ5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711690470; x=1712295270;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oxPuAlW+ifEEMmKVLuPhWeytqOWifnzQWTCkHbkl24o=;
        b=LHROGuI+jKKky+0ru+msC5/5t0hjdzKEhGl2CneptoaKg/+VYRFCGqzykNPwiNMHv3
         d0v54ef7KnPV7bA/ZfLLh6inVu1mfZZywVpqdDTSHdqcg2v+nC3JZ6aNH6Hj5SgXzrIY
         nK39CbABAyC92gVoLC5hJupbRsGrAQ8YUwcCTnE7I1lejCwHY7gE7FZcDUvfIglmS37L
         Ueyq5vjAjtbZZGzqKi0QueCwkgvCHCnoXSXOF3hqQYmd5PW7ULih1L1EDnpMpTkEsIR5
         68leCEJQLXCEkwJhv9Z6x4iOMAVxn5AK+g0h/HFdoRT135EnqlZ1LqI9GWIVxW+DFb1r
         qcsA==
X-Forwarded-Encrypted: i=1; AJvYcCVXyyH0bFgkYfE4VvJwsdVoHeGd42zamSn1knnxTpZ3H8ubtmhEgOArxt5w54fCIcm5jkCcF0UAQm2MPzLV0VKCBXO9fUOzhzvmOZvZXuONSV4vLgSEDjnI
X-Gm-Message-State: AOJu0YzhEX5003sukqyFe8uIxyXJa4hU3LHhkEvgQLca/qU0J9xLLKEb
	6TbOYliprZLCIQF/qs5MU6G+hEzfD126fNcKP9ZhakPAGz1IhMz4phyZhOA/R4cZ7sUtjCjY+WY
	AnuC/4tUhQvY2vhigKQOmLLdvVFc=
X-Google-Smtp-Source: AGHT+IFPqwDB//J0NtdHKUbEqr1/F12F9ACstKiwXbP3hN8krQgy7YATfbksT8I+KmtfLC6xojFouhtEIjTfRYfR1Yo=
X-Received: by 2002:a2e:680d:0:b0:2d6:f16a:857f with SMTP id
 c13-20020a2e680d000000b002d6f16a857fmr743192lja.0.1711690469937; Thu, 28 Mar
 2024 22:34:29 -0700 (PDT)
MIME-Version: 1.0
References: <20240329012413.892379-1-danismostlikely@gmail.com> <20240329012413.892379-3-danismostlikely@gmail.com>
In-Reply-To: <20240329012413.892379-3-danismostlikely@gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Fri, 29 Mar 2024 06:34:18 +0100
Message-ID: <CANNYZj-gCSWA+P4NdbggqWLGB4jEtv8VKtxAxRMctCw_mcG67Q@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v5 3/3] nfs-utils: Configure nfsv4 ID mapping & Kerberos
To: Dan McGregor <danismostlikely@gmail.com>
Cc: Daniel McGregor <daniel.mcgregor@vecima.com>, openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="0000000000006db36e0614c5fe07"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 29 Mar 2024 05:34:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/197622

--0000000000006db36e0614c5fe07
Content-Type: text/plain; charset="UTF-8"

Do not add pending patches please. Upstream submission first.

Even better if you can review already present patches and submit them too.

Alex

On Fri 29. Mar 2024 at 2.24, Dan McGregor <danismostlikely@gmail.com> wrote:

> From: Daniel McGregor <daniel.mcgregor@vecima.com>
>
> Add support for the nfsv4 user ID mapping daemon, configured with
> a sensible default, and add a packageconfig for Kerberos support.
>
> This is reasonably tested in production in our environment, but only
> systemd support. There'll be some more work to do to get GSSAPI and
> NFS idmapd support integreated into that.
>
> Signed-off-by: Daniel McGregor <daniel.mcgregor@vecima.com>
> ---
>  ...01-gssd-use-printf-format-specifiers.patch | 181 ++++++++++++++++++
>  .../0002-Use-nogroup-for-nobody-group.patch   |  38 ++++
>  .../0003-find-OE-provided-Kerberos.patch      |  42 ++++
>  .../nfs-utils/nfs-utils/clang-warnings.patch  |  81 +++++++-
>  .../nfs-utils/nfs-utils_2.6.4.bb              |  37 +++-
>  5 files changed, 367 insertions(+), 12 deletions(-)
>  create mode 100644
> meta/recipes-connectivity/nfs-utils/nfs-utils/0001-gssd-use-printf-format-specifiers.patch
>  create mode 100644
> meta/recipes-connectivity/nfs-utils/nfs-utils/0002-Use-nogroup-for-nobody-group.patch
>  create mode 100644
> meta/recipes-connectivity/nfs-utils/nfs-utils/0003-find-OE-provided-Kerberos.patch
>
> diff --git
> a/meta/recipes-connectivity/nfs-utils/nfs-utils/0001-gssd-use-printf-format-specifiers.patch
> b/meta/recipes-connectivity/nfs-utils/nfs-utils/0001-gssd-use-printf-format-specifiers.patch
> new file mode 100644
> index 00000000000..ab6517a30ed
> --- /dev/null
> +++
> b/meta/recipes-connectivity/nfs-utils/nfs-utils/0001-gssd-use-printf-format-specifiers.patch
> @@ -0,0 +1,181 @@
> +From 094b965b7044e7d102542ac30e95b556ca82654b Mon Sep 17 00:00:00 2001
> +From: Daniel McGregor <daniel.mcgregor@vecima.com>
> +Date: Wed, 29 Nov 2023 07:10:58 -0600
> +Subject: [PATCH] gssd: use printf format specifiers
> +
> +This function takes a printf format specifier, tell the compiler about
> +that. This adds the ability for GCC to warn about misuses, and prevents
> +Clang from warning on the implementation.
> +
> +Upstream-Status: Pending
> +Signed-off-by: Daniel McGregor <daniel.mcgregor@vecima.com>
> +---
> + utils/gssd/err_util.h     |  2 +-
> + utils/gssd/gss_names.c    |  4 ++--
> + utils/gssd/gss_util.c     |  2 +-
> + utils/gssd/gssd.c         |  4 ++--
> + utils/gssd/gssd_proc.c    |  8 ++++----
> + utils/gssd/krb5_util.c    | 10 +++++-----
> + utils/gssd/svcgssd_proc.c |  8 ++++----
> + 7 files changed, 19 insertions(+), 19 deletions(-)
> +
> +diff --git a/utils/gssd/err_util.h b/utils/gssd/err_util.h
> +index 6fa9d3d..61f5a31 100644
> +--- a/utils/gssd/err_util.h
> ++++ b/utils/gssd/err_util.h
> +@@ -32,7 +32,7 @@
> + #define _ERR_UTIL_H_
> +
> + void initerr(char *progname, int verbosity, int fg);
> +-void printerr(int priority, char *format, ...);
> ++void printerr(int priority, char *format, ...) __attribute__ ((format
> (printf, 2, 3)));
> + int get_verbosity(void);
> + char * sec2time(int);
> +
> +diff --git a/utils/gssd/gss_names.c b/utils/gssd/gss_names.c
> +index 982b96f..0548c33 100644
> +--- a/utils/gssd/gss_names.c
> ++++ b/utils/gssd/gss_names.c
> +@@ -65,7 +65,7 @@ get_krb5_hostbased_name(gss_buffer_desc *name, char
> **hostbased_name)
> +       if (strchr(name->value, '@') && strchr(name->value, '/')) {
> +               if ((sname = calloc(name->length, 1)) == NULL) {
> +                       printerr(0, "ERROR: get_krb5_hostbased_name failed
> "
> +-                               "to allocate %d bytes\n", name->length);
> ++                               "to allocate %zd bytes\n", name->length);
> +                       return -1;
> +               }
> +               /* read in name and instance and replace '/' with '@' */
> +@@ -102,7 +102,7 @@ get_hostbased_client_name(gss_name_t client_name,
> gss_OID mech,
> +       }
> +       if (name.length >= 0xffff) {        /* don't overflow */
> +               printerr(0, "ERROR: get_hostbased_client_name: "
> +-                       "received gss_name is too long (%d bytes)\n",
> ++                       "received gss_name is too long (%zd bytes)\n",
> +                        name.length);
> +               goto out_rel_buf;
> +       }
> +diff --git a/utils/gssd/gss_util.c b/utils/gssd/gss_util.c
> +index a4b2777..7d41a94 100644
> +--- a/utils/gssd/gss_util.c
> ++++ b/utils/gssd/gss_util.c
> +@@ -304,7 +304,7 @@ gssd_acquire_cred(char *server_name, const gss_OID
> oid)
> +                               target_name, &pbuf, NULL);
> +               if (ignore_maj_stat == GSS_S_COMPLETE) {
> +                       printerr(1, "Unable to obtain credentials for
> '%.*s'\n",
> +-                               pbuf.length, pbuf.value);
> ++                               (int)pbuf.length, (char *)pbuf.value);
> +                       ignore_maj_stat =
> gss_release_buffer(&ignore_min_stat,
> +                                                            &pbuf);
> +               }
> +diff --git a/utils/gssd/gssd.c b/utils/gssd/gssd.c
> +index 833d8e0..380116a 100644
> +--- a/utils/gssd/gssd.c
> ++++ b/utils/gssd/gssd.c
> +@@ -518,9 +518,9 @@ scan_active_thread_list(void)
> +                                       do_error_downcall(info->fd,
> info->uid, -ETIMEDOUT);
> +                               } else {
> +                                       if (!(info->flags &
> UPCALL_THREAD_WARNED)) {
> +-                                              printerr(0, "watchdog:
> thread id 0x%lx running for %ld seconds\n",
> ++                                              printerr(0, "watchdog:
> thread id 0x%lx running for %lld seconds\n",
> +                                                               info->tid,
> +-                                                              now.tv_sec
> - info->timeout.tv_sec + upcall_timeout);
> ++                                                              (long long
> int)(now.tv_sec - info->timeout.tv_sec + upcall_timeout));
> +                                               info->flags |=
> UPCALL_THREAD_WARNED;
> +                                       }
> +                               }
> +diff --git a/utils/gssd/gssd_proc.c b/utils/gssd/gssd_proc.c
> +index ae568f1..574eb4b 100644
> +--- a/utils/gssd/gssd_proc.c
> ++++ b/utils/gssd/gssd_proc.c
> +@@ -168,7 +168,7 @@ do_downcall(int k5_fd, uid_t uid, struct
> authgss_private_data *pd,
> +
> +       if (get_verbosity() > 1)
> +               printerr(2, "do_downcall(0x%lx): lifetime_rec=%s
> acceptor=%.*s\n",
> +-                      tid, sec2time(lifetime_rec), acceptor->length,
> acceptor->value);
> ++                      tid, sec2time(lifetime_rec),
> (int)acceptor->length, (char *)acceptor->value);
> +       buf_size = sizeof(uid) + sizeof(timeout) + sizeof(pd->pd_seq_win) +
> +               sizeof(pd->pd_ctx_hndl.length) + pd->pd_ctx_hndl.length +
> +               sizeof(context_token->length) + context_token->length +
> +@@ -284,14 +284,14 @@ populate_port(struct sockaddr *sa, const socklen_t
> salen,
> +
> +       port = nfs_getport(sa, salen, program, version, protocol);
> +       if (!port) {
> +-              printerr(0, "ERROR: unable to obtain port for prog %ld "
> +-                          "vers %ld\n", program, version);
> ++              printerr(0, "ERROR: unable to obtain port for prog %lu "
> ++                          "vers %lu\n", (long unsigned int)program,
> (long unsigned int)version);
> +               return 0;
> +       }
> +
> + set_port:
> +       printerr(2, "DEBUG: setting port to %hu for prog %lu vers %lu\n",
> port,
> +-               program, version);
> ++               (long unsigned int)program, (long unsigned int)version);
> +
> +       switch (sa->sa_family) {
> +       case AF_INET:
> +diff --git a/utils/gssd/krb5_util.c b/utils/gssd/krb5_util.c
> +index e3f270e..28f7d84 100644
> +--- a/utils/gssd/krb5_util.c
> ++++ b/utils/gssd/krb5_util.c
> +@@ -304,9 +304,9 @@ gssd_find_existing_krb5_ccache(uid_t uid, char
> *dirname,
> +                               score++;
> +
> +                       printerr(3, "CC '%s'(%s@%s) passed all checks and"
> +-                                  " has mtime of %u\n",
> ++                                  " has mtime of %llu\n",
> +                                buf, princname, realm,
> +-                               tmp_stat.st_mtime);
> ++                               (long long unsigned)tmp_stat.st_mtime);
> +                       /*
> +                        * if more than one match is found, return the most
> +                        * recent (the one with the latest mtime), and
> +@@ -341,10 +341,10 @@ gssd_find_existing_krb5_ccache(uid_t uid, char
> *dirname,
> +                               }
> +                               printerr(3, "CC '%s:%s/%s' is our "
> +                                           "current best match "
> +-                                          "with mtime of %u\n",
> +-                                       cctype, dirname,
> ++                                          "with mtime of %llu\n",
> ++                                       *cctype, dirname,
> +                                        best_match_dir->d_name,
> +-                                       best_match_stat.st_mtime);
> ++                                       (long long
> unsigned)best_match_stat.st_mtime);
> +                       }
> +                       free(princname);
> +                       free(realm);
> +diff --git a/utils/gssd/svcgssd_proc.c b/utils/gssd/svcgssd_proc.c
> +index b403143..7fecd1a 100644
> +--- a/utils/gssd/svcgssd_proc.c
> ++++ b/utils/gssd/svcgssd_proc.c
> +@@ -102,10 +102,10 @@ do_svc_downcall(gss_buffer_desc *out_handle, struct
> svc_cred *cred,
> +       qword_addint(&bp, &blen, cred->cr_uid);
> +       qword_addint(&bp, &blen, cred->cr_gid);
> +       qword_addint(&bp, &blen, cred->cr_ngroups);
> +-      printerr(2, "mech: %s, hndl len: %d, ctx len %d, timeout: %d (%d
> from now), "
> ++      printerr(2, "mech: %s, hndl len: %zd, ctx len %zd, timeout: %lld
> (%lld from now), "
> +                "clnt: %s, uid: %d, gid: %d, num aux grps: %d:\n",
> +                fname, out_handle->length, context_token->length,
> +-               endtime, endtime - time(0),
> ++               (long long int)endtime, (long long int)(endtime -
> time(0)),
> +                client_name ? client_name : "<null>",
> +                cred->cr_uid, cred->cr_gid, cred->cr_ngroups);
> +       for (i=0; i < cred->cr_ngroups; i++) {
> +@@ -232,7 +232,7 @@ get_ids(gss_name_t client_name, gss_OID mech, struct
> svc_cred *cred)
> +       }
> +       if (name.length >= 0xffff || /* be certain name.length+1 doesn't
> overflow */
> +           !(sname = calloc(name.length + 1, 1))) {
> +-              printerr(0, "WARNING: get_ids: error allocating %d bytes "
> ++              printerr(0, "WARNING: get_ids: error allocating %zd bytes "
> +                       "for sname\n", name.length + 1);
> +               gss_release_buffer(&min_stat, &name);
> +               goto out;
> +@@ -360,7 +360,7 @@ handle_nullreq(char *cp) {
> +       if (in_handle.length != 0) { /* CONTINUE_INIT case */
> +               if (in_handle.length != sizeof(ctx)) {
> +                       printerr(0, "WARNING: handle_nullreq: "
> +-                                  "input handle has unexpected length
> %d\n",
> ++                                  "input handle has unexpected length
> %zd\n",
> +                                   in_handle.length);
> +                       goto out_err;
> +               }
> diff --git
> a/meta/recipes-connectivity/nfs-utils/nfs-utils/0002-Use-nogroup-for-nobody-group.patch
> b/meta/recipes-connectivity/nfs-utils/nfs-utils/0002-Use-nogroup-for-nobody-group.patch
> new file mode 100644
> index 00000000000..3c238f851ba
> --- /dev/null
> +++
> b/meta/recipes-connectivity/nfs-utils/nfs-utils/0002-Use-nogroup-for-nobody-group.patch
> @@ -0,0 +1,38 @@
> +From 6095b5a9208eac37b73e05f81c090d8183138c6a Mon Sep 17 00:00:00 2001
> +From: Daniel McGregor <daniel.mcgregor@vecima.com>
> +Date: Tue, 6 Jun 2023 16:07:53 -0600
> +Subject: [PATCH] Use "nogroup" for nobody group
> +
> +Upstream-Status: Inappropriate [oe-core specific, configuration]
> +Signed-off-by: Daniel McGregor <daniel.mcgregor@vecima.com>
> +---
> + support/nfsidmap/idmapd.conf | 2 +-
> + utils/idmapd/idmapd.c        | 2 +-
> + 2 files changed, 2 insertions(+), 2 deletions(-)
> +
> +diff --git a/support/nfsidmap/idmapd.conf b/support/nfsidmap/idmapd.conf
> +index 2a2f79a1..e6f3724f 100644
> +--- a/support/nfsidmap/idmapd.conf
> ++++ b/support/nfsidmap/idmapd.conf
> +@@ -41,7 +41,7 @@
> + [Mapping]
> +
> + #Nobody-User = nobody
> +-#Nobody-Group = nobody
> ++#Nobody-Group = nogroup
> +
> + [Translation]
> +
> +diff --git a/utils/idmapd/idmapd.c b/utils/idmapd/idmapd.c
> +index cd9a965f..3be805e9 100644
> +--- a/utils/idmapd/idmapd.c
> ++++ b/utils/idmapd/idmapd.c
> +@@ -89,7 +89,7 @@
> + #endif
> +
> + #ifndef NFS4NOBODY_GROUP
> +-#define NFS4NOBODY_GROUP "nobody"
> ++#define NFS4NOBODY_GROUP "nogroup"
> + #endif
> +
> + /* From Niels */
> diff --git
> a/meta/recipes-connectivity/nfs-utils/nfs-utils/0003-find-OE-provided-Kerberos.patch
> b/meta/recipes-connectivity/nfs-utils/nfs-utils/0003-find-OE-provided-Kerberos.patch
> new file mode 100644
> index 00000000000..4f15aaec4ea
> --- /dev/null
> +++
> b/meta/recipes-connectivity/nfs-utils/nfs-utils/0003-find-OE-provided-Kerberos.patch
> @@ -0,0 +1,42 @@
> +From f4f4a226bfd71ddc0f53dd54159e3eaa835b18e6 Mon Sep 17 00:00:00 2001
> +From: Daniel McGregor <daniel.mcgregor@vecima.com>
> +Date: Wed, 8 Nov 2023 16:24:20 -0600
> +Subject: [PATCH] find OE provided Kerberos
> +
> +Upstream-Status: Inappropriate [oe-core specific]
> +Signed-off-by: Daniel McGregor <daniel.mcgregor@vecima.com>
> +---
> + aclocal/kerberos5.m4 | 6 ++++--
> + 1 file changed, 4 insertions(+), 2 deletions(-)
> +
> +diff --git a/aclocal/kerberos5.m4 b/aclocal/kerberos5.m4
> +index f96f0fd..ad85fdf 100644
> +--- a/aclocal/kerberos5.m4
> ++++ b/aclocal/kerberos5.m4
> +@@ -22,8 +22,8 @@ AC_DEFUN([AC_KERBEROS_V5],[
> +     dnl This ugly hack brought on by the split installation of
> +     dnl MIT Kerberos on Fedora Core 1
> +     K5CONFIG=""
> +-    if test -f $dir/bin/krb5-config; then
> +-      K5CONFIG=$dir/bin/krb5-config
> ++    if test -f $dir/bin/crossscripts/krb5-config; then
> ++      K5CONFIG=$dir/bin/crossscripts/krb5-config
> +     elif test -f "/usr/kerberos/bin/krb5-config"; then
> +       K5CONFIG="/usr/kerberos/bin/krb5-config"
> +     elif test -f "/usr/lib/mit/bin/krb5-config"; then
> +@@ -72,6 +72,7 @@ AC_DEFUN([AC_KERBEROS_V5],[
> +   AC_MSG_RESULT($KRBDIR)
> +
> +   dnl Check if -rpath=$(KRBDIR)/lib is needed
> ++  if false; then
> +   echo "The current KRBDIR is $KRBDIR"
> +   if test "$KRBDIR/lib" = "/lib" -o "$KRBDIR/lib" = "/usr/lib" \
> +        -o "$KRBDIR/lib" = "//lib" -o "$KRBDIR/lib" = "/usr//lib" ; then
> +@@ -81,6 +82,7 @@ AC_DEFUN([AC_KERBEROS_V5],[
> +   else
> +     KRBLDFLAGS="-Wl,-rpath=$KRBDIR/lib"
> +   fi
> ++  fi
> +
> +   dnl Now check for functions within gssapi library
> +   AC_CHECK_LIB($gssapi_lib, gss_krb5_export_lucid_sec_context,
> diff --git
> a/meta/recipes-connectivity/nfs-utils/nfs-utils/clang-warnings.patch
> b/meta/recipes-connectivity/nfs-utils/nfs-utils/clang-warnings.patch
> index fde99b599eb..ff697477b08 100644
> --- a/meta/recipes-connectivity/nfs-utils/nfs-utils/clang-warnings.patch
> +++ b/meta/recipes-connectivity/nfs-utils/nfs-utils/clang-warnings.patch
> @@ -1,4 +1,4 @@
> -From 1ab0c326405c6daa06f1a7eb4b0b60bf4e0584c2 Mon Sep 17 00:00:00 2001
> +From 7d04566b7b8e57114533360cc4b933a74ed6b314 Mon Sep 17 00:00:00 2001
>  From: Khem Raj <raj.khem@gmail.com>
>  Date: Tue, 31 Dec 2019 08:15:34 -0800
>  Subject: [PATCH] Detect warning options during configure
> @@ -16,11 +16,14 @@ Upstream-Status: Pending
>  Signed-off-by: Khem Raj <raj.khem@gmail.com>
>
>  ---
> - support/nfs/xcommon.c | 3 +++
> - 1 file changed, 3 insertions(+)
> + support/nfs/xcommon.c          | 6 ++++++
> + support/nfs/xlog.c             | 6 ++++++
> + support/nfsidmap/libnfsidmap.c | 3 +++
> + utils/exportfs/exportfs.c      | 3 +++
> + 4 files changed, 18 insertions(+)
>
>  diff --git a/support/nfs/xcommon.c b/support/nfs/xcommon.c
> -index 3989f0b..e080423 100644
> +index 3989f0bc..ff438c18 100644
>  --- a/support/nfs/xcommon.c
>  +++ b/support/nfs/xcommon.c
>  @@ -98,7 +98,10 @@ nfs_error (const char *fmt, ...) {
> @@ -34,3 +37,73 @@ index 3989f0b..e080423 100644
>        va_end (args);
>        free (fmt2);
>   }
> +@@ -132,7 +135,10 @@ die(int err, const char *fmt, ...) {
> +       va_list args;
> +
> +       va_start(args, fmt);
> ++#pragma GCC diagnostic push
> ++#pragma GCC diagnostic ignored "-Wformat-nonliteral"
> +       vfprintf(stderr, fmt, args);
> ++#pragma GCC diagnostic pop
> +       fprintf(stderr, "\n");
> +       va_end(args);
> +
> +diff --git a/support/nfs/xlog.c b/support/nfs/xlog.c
> +index fa125cef..dc4c9ea1 100644
> +--- a/support/nfs/xlog.c
> ++++ b/support/nfs/xlog.c
> +@@ -178,11 +178,16 @@ xlog_backend(int kind, const char *fmt, va_list
> args)
> +               fprintf(stderr, "%s: ", log_name);
> + #endif
> +               va_copy(args2, args);
> ++#pragma GCC diagnostic push
> ++#pragma GCC diagnostic ignored "-Wformat-nonliteral"
> +               vfprintf(stderr, fmt, args2);
> ++#pragma GCC diagnostic pop
> +               fprintf(stderr, "\n");
> +               va_end(args2);
> +       }
> +
> ++#pragma GCC diagnostic push
> ++#pragma GCC diagnostic ignored "-Wformat-nonliteral"
> +       if (log_syslog) {
> +               switch (kind) {
> +               case L_FATAL:
> +@@ -203,6 +208,7 @@ xlog_backend(int kind, const char *fmt, va_list args)
> +                       break;
> +               }
> +       }
> ++#pragma GCC diagnostic pop
> +
> +       if (kind == L_FATAL)
> +               exit(1);
> +diff --git a/support/nfsidmap/libnfsidmap.c
> b/support/nfsidmap/libnfsidmap.c
> +index 0a912e52..95eb64d2 100644
> +--- a/support/nfsidmap/libnfsidmap.c
> ++++ b/support/nfsidmap/libnfsidmap.c
> +@@ -99,7 +99,10 @@ static void default_logger(const char *fmt, ...)
> +       va_list vp;
> +
> +       va_start(vp, fmt);
> ++#pragma GCC diagnostic push
> ++#pragma GCC diagnostic ignored "-Wformat-nonliteral"
> +       vsyslog(LOG_WARNING, fmt, vp);
> ++#pragma GCC diagnostic pop
> +       va_end(vp);
> + }
> +
> +diff --git a/utils/exportfs/exportfs.c b/utils/exportfs/exportfs.c
> +index b03a047b..eac1ff2a 100644
> +--- a/utils/exportfs/exportfs.c
> ++++ b/utils/exportfs/exportfs.c
> +@@ -646,7 +646,10 @@ dumpopt(char c, char *fmt, ...)
> +
> +       va_start(ap, fmt);
> +       printf("%c", c);
> ++#pragma GCC diagnostic push
> ++#pragma GCC diagnostic ignored "-Wformat-nonliteral"
> +       vprintf(fmt, ap);
> ++#pragma GCC diagnostic pop
> +       va_end(ap);
> +       return ',';
> + }
> diff --git a/meta/recipes-connectivity/nfs-utils/nfs-utils_2.6.4.bb
> b/meta/recipes-connectivity/nfs-utils/nfs-utils_2.6.4.bb
> index 3896fac6ed5..bb65ba33a74 100644
> --- a/meta/recipes-connectivity/nfs-utils/nfs-utils_2.6.4.bb
> +++ b/meta/recipes-connectivity/nfs-utils/nfs-utils_2.6.4.bb
> @@ -26,6 +26,9 @@ SRC_URI =
> "${KERNELORG_MIRROR}/linux/utils/nfs-utils/${PV}/nfs-utils-${PV}.tar.x
>             file://0001-locktest-Makefile.am-Do-not-use-build-flags.patch \
>             file://0001-tools-locktest-Use-intmax_t-to-print-off_t.patch \
>
> file://0001-reexport.h-Include-unistd.h-to-compile-with-musl.patch \
> +           file://0001-gssd-use-printf-format-specifiers.patch \
> +           file://0002-Use-nogroup-for-nobody-group.patch \
> +           file://0003-find-OE-provided-Kerberos.patch \
>             "
>  SRC_URI[sha256sum] =
> "01b3b0fb9c7d0bbabf5114c736542030748c788ec2fd9734744201e9b0a1119d"
>
> @@ -49,10 +52,9 @@ EXTRA_OECONF = "--with-statduser=rpcuser \
>                  --enable-mountconfig \
>                  --enable-libmount-mount \
>                  --enable-uuid \
> -                --disable-gss \
> -                --disable-nfsdcltrack \
>                  --disable-sbin-override \
>                  --with-statdpath=/var/lib/nfs/statd \
> +                --with-pluginpath=${libdir}/libnfsidmap \
>                  --with-rpcgen=${HOSTTOOLS_DIR}/rpcgen \
>                 "
>
> @@ -61,13 +63,16 @@ LDFLAGS:append = " -lsqlite3 -levent"
>  PACKAGECONFIG ??= "tcp-wrappers \
>      ${@bb.utils.filter('DISTRO_FEATURES', 'ipv6 systemd', d)} \
>  "
> +
>  PACKAGECONFIG:remove:libc-musl = "tcp-wrappers"
> +#krb5 is available in meta-oe
> +PACKAGECONFIG[gssapi] = "--with-krb5=${STAGING_EXECPREFIXDIR}
> --enable-gss --enable-svcgss,--disable-gss --disable-svcgss,krb5"
>  PACKAGECONFIG[tcp-wrappers] =
> "--with-tcp-wrappers,--without-tcp-wrappers,tcp-wrappers"
>  PACKAGECONFIG[ipv6] = "--enable-ipv6,--disable-ipv6,"
>  # libdevmapper is available in meta-oe
>  PACKAGECONFIG[nfsv41] =
> "--enable-nfsv41,--disable-nfsv41,libdevmapper,libdevmapper"
>  # keyutils is available in meta-oe
> -PACKAGECONFIG[nfsv4] =
> "--enable-nfsv4,--disable-nfsv4,keyutils,python3-core"
> +PACKAGECONFIG[nfsv4] = "--enable-nfsv4
> --enable-nfsdcltrack,--disable-nfsv4
> --disable-nfsdcltrack,keyutils,python3-core"
>  PACKAGECONFIG[systemd] =
> "--with-systemd=${systemd_unitdir}/system,--without-systemd"
>
>  PACKAGES =+ "${PN}-client ${PN}-mount ${PN}-stats ${PN}-rpcctl"
> @@ -76,19 +81,34 @@ CONFFILES:${PN}-client +=
> "${localstatedir}/lib/nfs/etab \
>                            ${localstatedir}/lib/nfs/rmtab \
>                            ${localstatedir}/lib/nfs/xtab \
>                            ${localstatedir}/lib/nfs/statd/state \
> +                          ${sysconfdir}/idmapd.conf \
>                            ${sysconfdir}/nfs.conf \
>                            ${sysconfdir}/nfsmount.conf"
>
>  FILES:${PN}-client = "${sbindir}/*statd \
> -                     ${libdir}/libnfsidmap.so.* \
>                       ${sbindir}/rpc.idmapd ${sbindir}/sm-notify \
>                       ${sbindir}/showmount ${sbindir}/nfsstat \
> +                     ${sbindir}/rpc.gssd \
>                       ${sbindir}/nfsconf \
> +                     ${libdir}/libnfsidmap.so.* \
> +                     ${libdir}/libnfsidmap/*.so \
> +                     ${libexecdir}/nfsrahead \
>                       ${localstatedir}/lib/nfs \
> +                     ${sysconfdir}/idmapd.conf \
> +                     ${sysconfdir}/init.d/nfscommon \
>                       ${sysconfdir}/nfs.conf \
>                       ${sysconfdir}/nfsmount.conf \
> -                     ${sysconfdir}/init.d/nfscommon \
> -                     ${systemd_system_unitdir}/nfs-statd.service"
> +                     ${systemd_system_unitdir}/auth-rpcgss-module.service
> \
> +                     ${systemd_system_unitdir}/nfs-client.target \
> +                     ${systemd_system_unitdir}/nfs-idmapd.service \
> +                     ${systemd_system_unitdir}/nfs-statd.service \
> +                     ${systemd_system_unitdir}/nfscommon.service \
> +                     ${systemd_system_unitdir}/rpc-gssd.service \
> +                     ${systemd_system_unitdir}/rpc-statd-notify.service \
> +                     ${systemd_system_unitdir}/rpc-statd.service \
> +                     ${systemd_system_unitdir}/rpc_pipefs.target \
> +
>  ${systemd_system_unitdir}/var-lib-nfs-rpc_pipefs.mount \
> +                     ${nonarch_libdir}/udev/rules.d/*"
>  RDEPENDS:${PN}-client = "${PN}-mount rpcbind"
>
>  FILES:${PN}-mount = "${base_sbindir}/*mount.nfs*"
> @@ -104,8 +124,8 @@ FILES:${PN}-staticdev += "${libdir}/libnfsidmap/*.a"
>  FILES:${PN} += "${systemd_unitdir} ${libdir}/libnfsidmap/
> ${nonarch_libdir}/modprobe.d"
>
>  do_configure:prepend() {
> -       sed -i -e 's,sbindir = /sbin,sbindir = ${base_sbindir},g' \
> -               ${S}/utils/mount/Makefile.am
> +       sed -i -e 's,udev_rulesdir = /usr/lib/udev/rules.d/,udev_rulesdir
> = ${nonarch_base_libdir}/udev/rules.d/,g' \
> +           ${S}/systemd/Makefile.am ${S}/tools/nfsrahead/Makefile.am
>  }
>
>  # Make clean needed because the package comes with
> @@ -122,6 +142,7 @@ do_install:append () {
>         install -m 0755 ${WORKDIR}/nfsserver
> ${D}${sysconfdir}/init.d/nfsserver
>         install -m 0755 ${WORKDIR}/nfscommon
> ${D}${sysconfdir}/init.d/nfscommon
>
> +       install -m 0644 ${S}/support/nfsidmap/idmapd.conf ${D}${sysconfdir}
>         install -m 0644 ${S}/nfs.conf ${D}${sysconfdir}
>
>         install -d ${D}${systemd_system_unitdir}
> --
> 2.41.0
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#197618):
> https://lists.openembedded.org/g/openembedded-core/message/197618
> Mute This Topic: https://lists.openembedded.org/mt/105209256/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> alex.kanavin@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>
>

--0000000000006db36e0614c5fe07
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">Do not add pending patches please. Upstream submission fi=
rst.</div><div dir=3D"auto"><br></div><div dir=3D"auto">Even better if you =
can review already present patches and submit them too.</div><div dir=3D"au=
to"><br></div><div dir=3D"auto">Alex</div><div><br><div class=3D"gmail_quot=
e"><div dir=3D"ltr" class=3D"gmail_attr">On Fri 29. Mar 2024 at 2.24, Dan M=
cGregor &lt;<a href=3D"mailto:danismostlikely@gmail.com">danismostlikely@gm=
ail.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"=
margin:0px 0px 0px 0.8ex;border-left-width:1px;border-left-style:solid;padd=
ing-left:1ex;border-left-color:rgb(204,204,204)">From: Daniel McGregor &lt;=
<a href=3D"mailto:daniel.mcgregor@vecima.com" target=3D"_blank">daniel.mcgr=
egor@vecima.com</a>&gt;<br>
<br>
Add support for the nfsv4 user ID mapping daemon, configured with<br>
a sensible default, and add a packageconfig for Kerberos support.<br>
<br>
This is reasonably tested in production in our environment, but only<br>
systemd support. There&#39;ll be some more work to do to get GSSAPI and<br>
NFS idmapd support integreated into that.<br>
<br>
Signed-off-by: Daniel McGregor &lt;<a href=3D"mailto:daniel.mcgregor@vecima=
.com" target=3D"_blank">daniel.mcgregor@vecima.com</a>&gt;<br>
---<br>
=C2=A0...01-gssd-use-printf-format-specifiers.patch | 181 +++++++++++++++++=
+<br>
=C2=A0.../0002-Use-nogroup-for-nobody-group.patch=C2=A0 =C2=A0|=C2=A0 38 ++=
++<br>
=C2=A0.../0003-find-OE-provided-Kerberos.patch=C2=A0 =C2=A0 =C2=A0 |=C2=A0 =
42 ++++<br>
=C2=A0.../nfs-utils/nfs-utils/clang-warnings.patch=C2=A0 |=C2=A0 81 +++++++=
-<br>
=C2=A0.../nfs-utils/<a href=3D"http://nfs-utils_2.6.4.bb" rel=3D"noreferrer=
" target=3D"_blank">nfs-utils_2.6.4.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 |=C2=A0 37 +++-<br>
=C2=A05 files changed, 367 insertions(+), 12 deletions(-)<br>
=C2=A0create mode 100644 meta/recipes-connectivity/nfs-utils/nfs-utils/0001=
-gssd-use-printf-format-specifiers.patch<br>
=C2=A0create mode 100644 meta/recipes-connectivity/nfs-utils/nfs-utils/0002=
-Use-nogroup-for-nobody-group.patch<br>
=C2=A0create mode 100644 meta/recipes-connectivity/nfs-utils/nfs-utils/0003=
-find-OE-provided-Kerberos.patch<br>
<br>
diff --git a/meta/recipes-connectivity/nfs-utils/nfs-utils/0001-gssd-use-pr=
intf-format-specifiers.patch b/meta/recipes-connectivity/nfs-utils/nfs-util=
s/0001-gssd-use-printf-format-specifiers.patch<br>
new file mode 100644<br>
index 00000000000..ab6517a30ed<br>
--- /dev/null<br>
+++ b/meta/recipes-connectivity/nfs-utils/nfs-utils/0001-gssd-use-printf-fo=
rmat-specifiers.patch<br>
@@ -0,0 +1,181 @@<br>
+From 094b965b7044e7d102542ac30e95b556ca82654b Mon Sep 17 00:00:00 2001<br>
+From: Daniel McGregor &lt;<a href=3D"mailto:daniel.mcgregor@vecima.com" ta=
rget=3D"_blank">daniel.mcgregor@vecima.com</a>&gt;<br>
+Date: Wed, 29 Nov 2023 07:10:58 -0600<br>
+Subject: [PATCH] gssd: use printf format specifiers<br>
+<br>
+This function takes a printf format specifier, tell the compiler about<br>
+that. This adds the ability for GCC to warn about misuses, and prevents<br=
>
+Clang from warning on the implementation.<br>
+<br>
+Upstream-Status: Pending<br>
+Signed-off-by: Daniel McGregor &lt;<a href=3D"mailto:daniel.mcgregor@vecim=
a.com" target=3D"_blank">daniel.mcgregor@vecima.com</a>&gt;<br>
+---<br>
+ utils/gssd/err_util.h=C2=A0 =C2=A0 =C2=A0|=C2=A0 2 +-<br>
+ utils/gssd/gss_names.c=C2=A0 =C2=A0 |=C2=A0 4 ++--<br>
+ utils/gssd/gss_util.c=C2=A0 =C2=A0 =C2=A0|=C2=A0 2 +-<br>
+ utils/gssd/gssd.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 4 ++--<br>
+ utils/gssd/gssd_proc.c=C2=A0 =C2=A0 |=C2=A0 8 ++++----<br>
+ utils/gssd/krb5_util.c=C2=A0 =C2=A0 | 10 +++++-----<br>
+ utils/gssd/svcgssd_proc.c |=C2=A0 8 ++++----<br>
+ 7 files changed, 19 insertions(+), 19 deletions(-)<br>
+<br>
+diff --git a/utils/gssd/err_util.h b/utils/gssd/err_util.h<br>
+index 6fa9d3d..61f5a31 100644<br>
+--- a/utils/gssd/err_util.h<br>
++++ b/utils/gssd/err_util.h<br>
+@@ -32,7 +32,7 @@<br>
+ #define _ERR_UTIL_H_<br>
+ <br>
+ void initerr(char *progname, int verbosity, int fg);<br>
+-void printerr(int priority, char *format, ...);<br>
++void printerr(int priority, char *format, ...) __attribute__ ((format (pr=
intf, 2, 3)));<br>
+ int get_verbosity(void);<br>
+ char * sec2time(int);<br>
+ <br>
+diff --git a/utils/gssd/gss_names.c b/utils/gssd/gss_names.c<br>
+index 982b96f..0548c33 100644<br>
+--- a/utils/gssd/gss_names.c<br>
++++ b/utils/gssd/gss_names.c<br>
+@@ -65,7 +65,7 @@ get_krb5_hostbased_name(gss_buffer_desc *name, char **ho=
stbased_name)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (strchr(name-&gt;value, &#39;@&#39;) &amp;&a=
mp; strchr(name-&gt;value, &#39;/&#39;)) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if ((sname =3D call=
oc(name-&gt;length, 1)) =3D=3D NULL) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0printerr(0, &quot;ERROR: get_krb5_hostbased_name failed &quot;<br=
>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;to allocate %d bytes\n&quot;, n=
ame-&gt;length);<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;to allocate %zd bytes\n&quot;, =
name-&gt;length);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0return -1;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* read in name and=
 instance and replace &#39;/&#39; with &#39;@&#39; */<br>
+@@ -102,7 +102,7 @@ get_hostbased_client_name(gss_name_t client_name, gss_=
OID mech,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (name.length &gt;=3D 0xffff) {=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 /* don&#39;t overflow */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0printerr(0, &quot;E=
RROR: get_hostbased_client_name: &quot;<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0&quot;received gss_name is too long (%d bytes)\n&quot;,<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0&quot;received gss_name is too long (%zd bytes)\n&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 name.length);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0goto out_rel_buf;<b=
r>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+diff --git a/utils/gssd/gss_util.c b/utils/gssd/gss_util.c<br>
+index a4b2777..7d41a94 100644<br>
+--- a/utils/gssd/gss_util.c<br>
++++ b/utils/gssd/gss_util.c<br>
+@@ -304,7 +304,7 @@ gssd_acquire_cred(char *server_name, const gss_OID oid=
)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0target_name, &amp;pbuf, NULL);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (ignore_maj_stat=
 =3D=3D GSS_S_COMPLETE) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0printerr(1, &quot;Unable to obtain credentials for &#39;%.*s&#39;=
\n&quot;,<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0pbuf.length, pbuf.value);<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(int)pbuf.length, (char *)pbuf.value)=
;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0ignore_maj_stat =3D gss_release_buffer(&amp;ignore_min_stat,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &amp;pbuf);<=
br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+diff --git a/utils/gssd/gssd.c b/utils/gssd/gssd.c<br>
+index 833d8e0..380116a 100644<br>
+--- a/utils/gssd/gssd.c<br>
++++ b/utils/gssd/gssd.c<br>
+@@ -518,9 +518,9 @@ scan_active_thread_list(void)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0do_error_=
downcall(info-&gt;fd, info-&gt;uid, -ETIMEDOUT);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0} else {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (!(inf=
o-&gt;flags &amp; UPCALL_THREAD_WARNED)) {<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 printerr(0, &quot;watchdog: thread id 0x%lx running for %ld s=
econds\n&quot;,<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 printerr(0, &quot;watchdog: thread id 0x%lx running for %lld =
seconds\n&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0info-&gt;tid,<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 now.t=
v_sec - info-&gt;timeout.tv_sec + upcall_timeout);<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (long=
 long int)(now.tv_sec - info-&gt;timeout.tv_sec + upcall_timeout));<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0info-&gt;flags |=3D UPCALL_THREAD_WARNED;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+diff --git a/utils/gssd/gssd_proc.c b/utils/gssd/gssd_proc.c<br>
+index ae568f1..574eb4b 100644<br>
+--- a/utils/gssd/gssd_proc.c<br>
++++ b/utils/gssd/gssd_proc.c<br>
+@@ -168,7 +168,7 @@ do_downcall(int k5_fd, uid_t uid, struct authgss_priva=
te_data *pd,<br>
+ <br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (get_verbosity() &gt; 1)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0printerr(2, &quot;d=
o_downcall(0x%lx): lifetime_rec=3D%s acceptor=3D%.*s\n&quot;,<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 tid, sec2time(lifetime_rec), acceptor-&gt;length, acceptor-&gt;value);<=
br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 tid, sec2time(lifetime_rec), (int)acceptor-&gt;length, (char *)acceptor=
-&gt;value);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0buf_size =3D sizeof(uid) + sizeof(timeout) + si=
zeof(pd-&gt;pd_seq_win) +<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0sizeof(pd-&gt;pd_ct=
x_hndl.length) + pd-&gt;pd_ctx_hndl.length +<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0sizeof(context_toke=
n-&gt;length) + context_token-&gt;length +<br>
+@@ -284,14 +284,14 @@ populate_port(struct sockaddr *sa, const socklen_t s=
alen,<br>
+ <br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0port =3D nfs_getport(sa, salen, program, versio=
n, protocol);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (!port) {<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 printerr(0, &quot;ERROR:=
 unable to obtain port for prog %ld &quot;<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 &quot;vers %ld\n&quot;, program, version);<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 printerr(0, &quot;ERROR:=
 unable to obtain port for prog %lu &quot;<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 &quot;vers %lu\n&quot;, (long unsigned int)program, (long=
 unsigned int)version);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return 0;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+ <br>
+ set_port:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0printerr(2, &quot;DEBUG: setting port to %hu fo=
r prog %lu vers %lu\n&quot;, port,<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0program, version);=
<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(long unsigned int=
)program, (long unsigned int)version);<br>
+ <br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0switch (sa-&gt;sa_family) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0case AF_INET:<br>
+diff --git a/utils/gssd/krb5_util.c b/utils/gssd/krb5_util.c<br>
+index e3f270e..28f7d84 100644<br>
+--- a/utils/gssd/krb5_util.c<br>
++++ b/utils/gssd/krb5_util.c<br>
+@@ -304,9 +304,9 @@ gssd_find_existing_krb5_ccache(uid_t uid, char *dirnam=
e,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0score++;<br>
+ <br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0printerr(3, &quot;CC &#39;%s&#39;(%s@%s) passed all checks and&qu=
ot;<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot; has mtime of %u\n&quot=
;,<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot; has mtime of %llu\n&qu=
ot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 buf, princname, realm, <br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0tmp_stat.st_mtime);<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(long long unsigned)tmp_stat.st_mtime=
);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0/*<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 * if more than one match is found, return the most<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 * recent (the one with the latest mtime), and<br>
+@@ -341,10 +341,10 @@ gssd_find_existing_krb5_ccache(uid_t uid, char *dirn=
ame,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0printerr(3, &quot;CC &#39;%s:%s/%s&#3=
9; is our &quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0&quot;current best match &quot;<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &=
quot;with mtime of %u\n&quot;,<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0cctype, d=
irname,<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &=
quot;with mtime of %llu\n&quot;,<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0*cctype, =
dirname,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 best_mat=
ch_dir-&gt;d_name,<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0best_matc=
h_stat.st_mtime);<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(long lon=
g unsigned)best_match_stat.st_mtime);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0}<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0free(princname);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0free(realm);<br>
+diff --git a/utils/gssd/svcgssd_proc.c b/utils/gssd/svcgssd_proc.c<br>
+index b403143..7fecd1a 100644<br>
+--- a/utils/gssd/svcgssd_proc.c<br>
++++ b/utils/gssd/svcgssd_proc.c<br>
+@@ -102,10 +102,10 @@ do_svc_downcall(gss_buffer_desc *out_handle, struct =
svc_cred *cred,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0qword_addint(&amp;bp, &amp;blen, cred-&gt;cr_ui=
d);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0qword_addint(&amp;bp, &amp;blen, cred-&gt;cr_gi=
d);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0qword_addint(&amp;bp, &amp;blen, cred-&gt;cr_ng=
roups);<br>
+-=C2=A0 =C2=A0 =C2=A0 printerr(2, &quot;mech: %s, hndl len: %d, ctx len %d=
, timeout: %d (%d from now), &quot;<br>
++=C2=A0 =C2=A0 =C2=A0 printerr(2, &quot;mech: %s, hndl len: %zd, ctx len %=
zd, timeout: %lld (%lld from now), &quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;clnt: %s, ui=
d: %d, gid: %d, num aux grps: %d:\n&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 fname, out_handle-=
&gt;length, context_token-&gt;length,<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0endtime, endtime -=
 time(0),<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(long long int)end=
time, (long long int)(endtime - time(0)),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 client_name ? clie=
nt_name : &quot;&lt;null&gt;&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 cred-&gt;cr_uid, c=
red-&gt;cr_gid, cred-&gt;cr_ngroups);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0for (i=3D0; i &lt; cred-&gt;cr_ngroups; i++) {<=
br>
+@@ -232,7 +232,7 @@ get_ids(gss_name_t client_name, gss_OID mech, struct s=
vc_cred *cred)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (name.length &gt;=3D 0xffff || /* be certain=
 name.length+1 doesn&#39;t overflow */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0!(sname =3D calloc(name.length + =
1, 1))) {<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 printerr(0, &quot;WARNIN=
G: get_ids: error allocating %d bytes &quot;<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 printerr(0, &quot;WARNIN=
G: get_ids: error allocating %zd bytes &quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0&quot;for sname\n&quot;, name.length + 1);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0gss_release_buffer(=
&amp;min_stat, &amp;name);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0goto out;<br>
+@@ -360,7 +360,7 @@ handle_nullreq(char *cp) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (in_handle.length !=3D 0) { /* CONTINUE_INIT=
 case */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (in_handle.lengt=
h !=3D sizeof(ctx)) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0printerr(0, &quot;WARNING: handle_nullreq: &quot;<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;input handle has unexpe=
cted length %d\n&quot;,<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;input handle has unexpe=
cted length %zd\n&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0in_handle.length);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0goto out_err;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
diff --git a/meta/recipes-connectivity/nfs-utils/nfs-utils/0002-Use-nogroup=
-for-nobody-group.patch b/meta/recipes-connectivity/nfs-utils/nfs-utils/000=
2-Use-nogroup-for-nobody-group.patch<br>
new file mode 100644<br>
index 00000000000..3c238f851ba<br>
--- /dev/null<br>
+++ b/meta/recipes-connectivity/nfs-utils/nfs-utils/0002-Use-nogroup-for-no=
body-group.patch<br>
@@ -0,0 +1,38 @@<br>
+From 6095b5a9208eac37b73e05f81c090d8183138c6a Mon Sep 17 00:00:00 2001<br>
+From: Daniel McGregor &lt;<a href=3D"mailto:daniel.mcgregor@vecima.com" ta=
rget=3D"_blank">daniel.mcgregor@vecima.com</a>&gt;<br>
+Date: Tue, 6 Jun 2023 16:07:53 -0600<br>
+Subject: [PATCH] Use &quot;nogroup&quot; for nobody group<br>
+<br>
+Upstream-Status: Inappropriate [oe-core specific, configuration]<br>
+Signed-off-by: Daniel McGregor &lt;<a href=3D"mailto:daniel.mcgregor@vecim=
a.com" target=3D"_blank">daniel.mcgregor@vecima.com</a>&gt;<br>
+---<br>
+ support/nfsidmap/idmapd.conf | 2 +-<br>
+ utils/idmapd/idmapd.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 | 2 +-<br>
+ 2 files changed, 2 insertions(+), 2 deletions(-)<br>
+<br>
+diff --git a/support/nfsidmap/idmapd.conf b/support/nfsidmap/idmapd.conf<b=
r>
+index 2a2f79a1..e6f3724f 100644<br>
+--- a/support/nfsidmap/idmapd.conf<br>
++++ b/support/nfsidmap/idmapd.conf<br>
+@@ -41,7 +41,7 @@<br>
+ [Mapping]<br>
+ <br>
+ #Nobody-User =3D nobody<br>
+-#Nobody-Group =3D nobody<br>
++#Nobody-Group =3D nogroup<br>
+ <br>
+ [Translation]<br>
+ <br>
+diff --git a/utils/idmapd/idmapd.c b/utils/idmapd/idmapd.c<br>
+index cd9a965f..3be805e9 100644<br>
+--- a/utils/idmapd/idmapd.c<br>
++++ b/utils/idmapd/idmapd.c<br>
+@@ -89,7 +89,7 @@<br>
+ #endif<br>
+ <br>
+ #ifndef NFS4NOBODY_GROUP<br>
+-#define NFS4NOBODY_GROUP &quot;nobody&quot;<br>
++#define NFS4NOBODY_GROUP &quot;nogroup&quot;<br>
+ #endif<br>
+ <br>
+ /* From Niels */<br>
diff --git a/meta/recipes-connectivity/nfs-utils/nfs-utils/0003-find-OE-pro=
vided-Kerberos.patch b/meta/recipes-connectivity/nfs-utils/nfs-utils/0003-f=
ind-OE-provided-Kerberos.patch<br>
new file mode 100644<br>
index 00000000000..4f15aaec4ea<br>
--- /dev/null<br>
+++ b/meta/recipes-connectivity/nfs-utils/nfs-utils/0003-find-OE-provided-K=
erberos.patch<br>
@@ -0,0 +1,42 @@<br>
+From f4f4a226bfd71ddc0f53dd54159e3eaa835b18e6 Mon Sep 17 00:00:00 2001<br>
+From: Daniel McGregor &lt;<a href=3D"mailto:daniel.mcgregor@vecima.com" ta=
rget=3D"_blank">daniel.mcgregor@vecima.com</a>&gt;<br>
+Date: Wed, 8 Nov 2023 16:24:20 -0600<br>
+Subject: [PATCH] find OE provided Kerberos<br>
+<br>
+Upstream-Status: Inappropriate [oe-core specific]<br>
+Signed-off-by: Daniel McGregor &lt;<a href=3D"mailto:daniel.mcgregor@vecim=
a.com" target=3D"_blank">daniel.mcgregor@vecima.com</a>&gt;<br>
+---<br>
+ aclocal/kerberos5.m4 | 6 ++++--<br>
+ 1 file changed, 4 insertions(+), 2 deletions(-)<br>
+<br>
+diff --git a/aclocal/kerberos5.m4 b/aclocal/kerberos5.m4<br>
+index f96f0fd..ad85fdf 100644<br>
+--- a/aclocal/kerberos5.m4<br>
++++ b/aclocal/kerberos5.m4<br>
+@@ -22,8 +22,8 @@ AC_DEFUN([AC_KERBEROS_V5],[<br>
+=C2=A0 =C2=A0 =C2=A0dnl This ugly hack brought on by the split installatio=
n of<br>
+=C2=A0 =C2=A0 =C2=A0dnl MIT Kerberos on Fedora Core 1<br>
+=C2=A0 =C2=A0 =C2=A0K5CONFIG=3D&quot;&quot;<br>
+-=C2=A0 =C2=A0 if test -f $dir/bin/krb5-config; then<br>
+-=C2=A0 =C2=A0 =C2=A0 K5CONFIG=3D$dir/bin/krb5-config<br>
++=C2=A0 =C2=A0 if test -f $dir/bin/crossscripts/krb5-config; then<br>
++=C2=A0 =C2=A0 =C2=A0 K5CONFIG=3D$dir/bin/crossscripts/krb5-config<br>
+=C2=A0 =C2=A0 =C2=A0elif test -f &quot;/usr/kerberos/bin/krb5-config&quot;=
; then<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0K5CONFIG=3D&quot;/usr/kerberos/bin/krb5-config&=
quot;<br>
+=C2=A0 =C2=A0 =C2=A0elif test -f &quot;/usr/lib/mit/bin/krb5-config&quot;;=
 then<br>
+@@ -72,6 +72,7 @@ AC_DEFUN([AC_KERBEROS_V5],[<br>
+=C2=A0 =C2=A0AC_MSG_RESULT($KRBDIR)<br>
+ <br>
+=C2=A0 =C2=A0dnl Check if -rpath=3D$(KRBDIR)/lib is needed<br>
++=C2=A0 if false; then<br>
+=C2=A0 =C2=A0echo &quot;The current KRBDIR is $KRBDIR&quot;<br>
+=C2=A0 =C2=A0if test &quot;$KRBDIR/lib&quot; =3D &quot;/lib&quot; -o &quot=
;$KRBDIR/lib&quot; =3D &quot;/usr/lib&quot; \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 -o &quot;$KRBDIR/lib&quot; =3D &quot;//lib&quo=
t; -o &quot;$KRBDIR/lib&quot; =3D &quot;/usr//lib&quot; ; then<br>
+@@ -81,6 +82,7 @@ AC_DEFUN([AC_KERBEROS_V5],[<br>
+=C2=A0 =C2=A0else<br>
+=C2=A0 =C2=A0 =C2=A0KRBLDFLAGS=3D&quot;-Wl,-rpath=3D$KRBDIR/lib&quot;<br>
+=C2=A0 =C2=A0fi<br>
++=C2=A0 fi<br>
+ <br>
+=C2=A0 =C2=A0dnl Now check for functions within gssapi library<br>
+=C2=A0 =C2=A0AC_CHECK_LIB($gssapi_lib, gss_krb5_export_lucid_sec_context,<=
br>
diff --git a/meta/recipes-connectivity/nfs-utils/nfs-utils/clang-warnings.p=
atch b/meta/recipes-connectivity/nfs-utils/nfs-utils/clang-warnings.patch<b=
r>
index fde99b599eb..ff697477b08 100644<br>
--- a/meta/recipes-connectivity/nfs-utils/nfs-utils/clang-warnings.patch<br=
>
+++ b/meta/recipes-connectivity/nfs-utils/nfs-utils/clang-warnings.patch<br=
>
@@ -1,4 +1,4 @@<br>
-From 1ab0c326405c6daa06f1a7eb4b0b60bf4e0584c2 Mon Sep 17 00:00:00 2001<br>
+From 7d04566b7b8e57114533360cc4b933a74ed6b314 Mon Sep 17 00:00:00 2001<br>
=C2=A0From: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com" target=3D"_b=
lank">raj.khem@gmail.com</a>&gt;<br>
=C2=A0Date: Tue, 31 Dec 2019 08:15:34 -0800<br>
=C2=A0Subject: [PATCH] Detect warning options during configure<br>
@@ -16,11 +16,14 @@ Upstream-Status: Pending<br>
=C2=A0Signed-off-by: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com" tar=
get=3D"_blank">raj.khem@gmail.com</a>&gt;<br>
<br>
=C2=A0---<br>
- support/nfs/xcommon.c | 3 +++<br>
- 1 file changed, 3 insertions(+)<br>
+ support/nfs/xcommon.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 6 ++++++<br>
+ support/nfs/xlog.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 6 +++=
+++<br>
+ support/nfsidmap/libnfsidmap.c | 3 +++<br>
+ utils/exportfs/exportfs.c=C2=A0 =C2=A0 =C2=A0 | 3 +++<br>
+ 4 files changed, 18 insertions(+)<br>
<br>
=C2=A0diff --git a/support/nfs/xcommon.c b/support/nfs/xcommon.c<br>
-index 3989f0b..e080423 100644<br>
+index 3989f0bc..ff438c18 100644<br>
=C2=A0--- a/support/nfs/xcommon.c<br>
=C2=A0+++ b/support/nfs/xcommon.c<br>
=C2=A0@@ -98,7 +98,10 @@ nfs_error (const char *fmt, ...) {<br>
@@ -34,3 +37,73 @@ index 3989f0b..e080423 100644<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0va_end (args);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0free (fmt2);<br>
=C2=A0 }<br>
+@@ -132,7 +135,10 @@ die(int err, const char *fmt, ...) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0va_list args;<br>
+ <br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0va_start(args, fmt);<br>
++#pragma GCC diagnostic push<br>
++#pragma GCC diagnostic ignored &quot;-Wformat-nonliteral&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0vfprintf(stderr, fmt, args);<br>
++#pragma GCC diagnostic pop<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0fprintf(stderr, &quot;\n&quot;);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0va_end(args);<br>
+ <br>
+diff --git a/support/nfs/xlog.c b/support/nfs/xlog.c<br>
+index fa125cef..dc4c9ea1 100644<br>
+--- a/support/nfs/xlog.c<br>
++++ b/support/nfs/xlog.c<br>
+@@ -178,11 +178,16 @@ xlog_backend(int kind, const char *fmt, va_list args=
)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0fprintf(stderr, &qu=
ot;%s: &quot;, log_name);<br>
+ #endif<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0va_copy(args2, args=
);<br>
++#pragma GCC diagnostic push<br>
++#pragma GCC diagnostic ignored &quot;-Wformat-nonliteral&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0vfprintf(stderr, fm=
t, args2);<br>
++#pragma GCC diagnostic pop<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0fprintf(stderr, &qu=
ot;\n&quot;);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0va_end(args2);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+ <br>
++#pragma GCC diagnostic push<br>
++#pragma GCC diagnostic ignored &quot;-Wformat-nonliteral&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (log_syslog) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0switch (kind) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0case L_FATAL:<br>
+@@ -203,6 +208,7 @@ xlog_backend(int kind, const char *fmt, va_list args)<=
br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0break;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
++#pragma GCC diagnostic pop<br>
+ <br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (kind =3D=3D L_FATAL)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0exit(1);<br>
+diff --git a/support/nfsidmap/libnfsidmap.c b/support/nfsidmap/libnfsidmap=
.c<br>
+index 0a912e52..95eb64d2 100644<br>
+--- a/support/nfsidmap/libnfsidmap.c<br>
++++ b/support/nfsidmap/libnfsidmap.c<br>
+@@ -99,7 +99,10 @@ static void default_logger(const char *fmt, ...)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0va_list vp;<br>
+ <br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0va_start(vp, fmt);<br>
++#pragma GCC diagnostic push<br>
++#pragma GCC diagnostic ignored &quot;-Wformat-nonliteral&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0vsyslog(LOG_WARNING, fmt, vp);<br>
++#pragma GCC diagnostic pop<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0va_end(vp);<br>
+ }<br>
+ <br>
+diff --git a/utils/exportfs/exportfs.c b/utils/exportfs/exportfs.c<br>
+index b03a047b..eac1ff2a 100644<br>
+--- a/utils/exportfs/exportfs.c<br>
++++ b/utils/exportfs/exportfs.c<br>
+@@ -646,7 +646,10 @@ dumpopt(char c, char *fmt, ...)<br>
+ <br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0va_start(ap, fmt);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0printf(&quot;%c&quot;, c);<br>
++#pragma GCC diagnostic push<br>
++#pragma GCC diagnostic ignored &quot;-Wformat-nonliteral&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0vprintf(fmt, ap);<br>
++#pragma GCC diagnostic pop<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0va_end(ap);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0return &#39;,&#39;;<br>
+ }<br>
diff --git a/meta/recipes-connectivity/nfs-utils/<a href=3D"http://nfs-util=
s_2.6.4.bb" rel=3D"noreferrer" target=3D"_blank">nfs-utils_2.6.4.bb</a> b/m=
eta/recipes-connectivity/nfs-utils/<a href=3D"http://nfs-utils_2.6.4.bb" re=
l=3D"noreferrer" target=3D"_blank">nfs-utils_2.6.4.bb</a><br>
index 3896fac6ed5..bb65ba33a74 100644<br>
--- a/meta/recipes-connectivity/nfs-utils/<a href=3D"http://nfs-utils_2.6.4=
.bb" rel=3D"noreferrer" target=3D"_blank">nfs-utils_2.6.4.bb</a><br>
+++ b/meta/recipes-connectivity/nfs-utils/<a href=3D"http://nfs-utils_2.6.4=
.bb" rel=3D"noreferrer" target=3D"_blank">nfs-utils_2.6.4.bb</a><br>
@@ -26,6 +26,9 @@ SRC_URI =3D &quot;${KERNELORG_MIRROR}/linux/utils/nfs-uti=
ls/${PV}/nfs-utils-${PV}.tar.x<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0001-locktest-Makefile.am-=
Do-not-use-build-flags.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0001-tools-locktest-Use-in=
tmax_t-to-print-off_t.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0001-reexport.h-Include-un=
istd.h-to-compile-with-musl.patch \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0001-gssd-use-printf-forma=
t-specifiers.patch \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0002-Use-nogroup-for-nobod=
y-group.patch \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0003-find-OE-provided-Kerb=
eros.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;<br>
=C2=A0SRC_URI[sha256sum] =3D &quot;01b3b0fb9c7d0bbabf5114c736542030748c788e=
c2fd9734744201e9b0a1119d&quot;<br>
<br>
@@ -49,10 +52,9 @@ EXTRA_OECONF =3D &quot;--with-statduser=3Drpcuser \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0--enable-moun=
tconfig \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0--enable-libm=
ount-mount \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0--enable-uuid=
 \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 --disable-gss \<br=
>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 --disable-nfsdcltr=
ack \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0--disable-sbi=
n-override \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0--with-statdp=
ath=3D/var/lib/nfs/statd \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 --with-pluginpath=
=3D${libdir}/libnfsidmap \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0--with-rpcgen=
=3D${HOSTTOOLS_DIR}/rpcgen \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;<br>
<br>
@@ -61,13 +63,16 @@ LDFLAGS:append =3D &quot; -lsqlite3 -levent&quot;<br>
=C2=A0PACKAGECONFIG ??=3D &quot;tcp-wrappers \<br>
=C2=A0 =C2=A0 =C2=A0${@bb.utils.filter(&#39;DISTRO_FEATURES&#39;, &#39;ipv6=
 systemd&#39;, d)} \<br>
=C2=A0&quot;<br>
+<br>
=C2=A0PACKAGECONFIG:remove:libc-musl =3D &quot;tcp-wrappers&quot;<br>
+#krb5 is available in meta-oe<br>
+PACKAGECONFIG[gssapi] =3D &quot;--with-krb5=3D${STAGING_EXECPREFIXDIR} --e=
nable-gss --enable-svcgss,--disable-gss --disable-svcgss,krb5&quot;<br>
=C2=A0PACKAGECONFIG[tcp-wrappers] =3D &quot;--with-tcp-wrappers,--without-t=
cp-wrappers,tcp-wrappers&quot;<br>
=C2=A0PACKAGECONFIG[ipv6] =3D &quot;--enable-ipv6,--disable-ipv6,&quot;<br>
=C2=A0# libdevmapper is available in meta-oe<br>
=C2=A0PACKAGECONFIG[nfsv41] =3D &quot;--enable-nfsv41,--disable-nfsv41,libd=
evmapper,libdevmapper&quot;<br>
=C2=A0# keyutils is available in meta-oe<br>
-PACKAGECONFIG[nfsv4] =3D &quot;--enable-nfsv4,--disable-nfsv4,keyutils,pyt=
hon3-core&quot;<br>
+PACKAGECONFIG[nfsv4] =3D &quot;--enable-nfsv4 --enable-nfsdcltrack,--disab=
le-nfsv4 --disable-nfsdcltrack,keyutils,python3-core&quot;<br>
=C2=A0PACKAGECONFIG[systemd] =3D &quot;--with-systemd=3D${systemd_unitdir}/=
system,--without-systemd&quot;<br>
<br>
=C2=A0PACKAGES =3D+ &quot;${PN}-client ${PN}-mount ${PN}-stats ${PN}-rpcctl=
&quot;<br>
@@ -76,19 +81,34 @@ CONFFILES:${PN}-client +=3D &quot;${localstatedir}/lib/=
nfs/etab \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0${localstatedir}/lib/nfs/rmtab \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0${localstatedir}/lib/nfs/xtab \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0${localstatedir}/lib/nfs/statd/state \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 ${sysconfdir}/idmapd.conf \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0${sysconfdir}/nfs.conf \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0${sysconfdir}/nfsmount.conf&quot;<br>
<br>
=C2=A0FILES:${PN}-client =3D &quot;${sbindir}/*statd \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0${libdir}/libnfsidmap.so.* \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 ${sbindir}/rpc.idmapd ${sbindir}/sm-notify \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 ${sbindir}/showmount ${sbindir}/nfsstat \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0${sbindir}/rpc.gssd \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 ${sbindir}/nfsconf \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0${libdir}/libnfsidmap.so.* \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0${libdir}/libnfsidmap/*.so \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0${libexecdir}/nfsrahead \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 ${localstatedir}/lib/nfs \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0${sysconfdir}/idmapd.conf \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0${sysconfdir}/init.d/nfscommon \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 ${sysconfdir}/nfs.conf \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 ${sysconfdir}/nfsmount.conf \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0${sysconfdir}/init.d/nfscommon \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0${systemd_system_unitdir}/nfs-statd.service&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0${systemd_system_unitdir}/auth-rpcgss-module.service \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0${systemd_system_unitdir}/nfs-client.target \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0${systemd_system_unitdir}/nfs-idmapd.service \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0${systemd_system_unitdir}/nfs-statd.service \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0${systemd_system_unitdir}/nfscommon.service \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0${systemd_system_unitdir}/rpc-gssd.service \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0${systemd_system_unitdir}/rpc-statd-notify.service \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0${systemd_system_unitdir}/rpc-statd.service \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0${systemd_system_unitdir}/rpc_pipefs.target \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0${systemd_system_unitdir}/var-lib-nfs-rpc_pipefs.mount \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0${nonarch_libdir}/udev/rules.d/*&quot;<br>
=C2=A0RDEPENDS:${PN}-client =3D &quot;${PN}-mount rpcbind&quot;<br>
<br>
=C2=A0FILES:${PN}-mount =3D &quot;${base_sbindir}/*mount.nfs*&quot;<br>
@@ -104,8 +124,8 @@ FILES:${PN}-staticdev +=3D &quot;${libdir}/libnfsidmap/=
*.a&quot;<br>
=C2=A0FILES:${PN} +=3D &quot;${systemd_unitdir} ${libdir}/libnfsidmap/ ${no=
narch_libdir}/modprobe.d&quot;<br>
<br>
=C2=A0do_configure:prepend() {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0sed -i -e &#39;s,sbindir =3D /sbin,sbindir =3D =
${base_sbindir},g&#39; \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0${S}/utils/mount/Ma=
kefile.am<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0sed -i -e &#39;s,udev_rulesdir =3D /usr/lib/ude=
v/rules.d/,udev_rulesdir =3D ${nonarch_base_libdir}/udev/rules.d/,g&#39; \<=
br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0${S}/systemd/Makefile.am ${S}/too=
ls/nfsrahead/Makefile.am<br>
=C2=A0}<br>
<br>
=C2=A0# Make clean needed because the package comes with<br>
@@ -122,6 +142,7 @@ do_install:append () {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 install -m 0755 ${WORKDIR}/nfsserver ${D}${sysc=
onfdir}/init.d/nfsserver<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 install -m 0755 ${WORKDIR}/nfscommon ${D}${sysc=
onfdir}/init.d/nfscommon<br>
<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0install -m 0644 ${S}/support/nfsidmap/idmapd.co=
nf ${D}${sysconfdir}<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 install -m 0644 ${S}/nfs.conf ${D}${sysconfdir}=
<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 install -d ${D}${systemd_system_unitdir}<br>
-- <br>
2.41.0<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#197618): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/197618" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/197618</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/105209256/168=
6489" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/105209256/1686489</a><br>
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

--0000000000006db36e0614c5fe07--

