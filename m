Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9B5FBC433F5
	for <webhook@archiver.kernel.org>; Fri, 25 Mar 2022 17:35:45 +0000 (UTC)
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com
 [209.85.218.51])
 by mx.groups.io with SMTP id smtpd.web12.8599.1648229744657647241
 for <openembedded-core@lists.openembedded.org>;
 Fri, 25 Mar 2022 10:35:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=sc9EEn0c;
 spf=softfail (domain: sakoman.com, ip: 209.85.218.51,
 mailfrom: steve@sakoman.com)
Received: by mail-ej1-f51.google.com with SMTP id o10so16802415ejd.1
        for <openembedded-core@lists.openembedded.org>;
 Fri, 25 Mar 2022 10:35:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=8xZjdj0nBFljTGww5/IGRbcl5W4TkKMNBjVAsBD8vBk=;
        b=sc9EEn0cH3FgnYsA7SzWvFo93kPbHjSzTLcKNaEl9sMSTGDT0yJWAmEN4Zb82tFFqS
         oMJ6OlJYvL4tc72ZgxeGf7R0Q79fxHMNd5E1s+0rua8uH0EdYc3/Vg3z6RO10nJdkeuh
         v6e40YMLuXs90ptxRyQGPJ/MrUiCcXQUmgDJN0zfx3bL8mwlpupMjfhBHcKV5HuUPFE/
         xnPpAWQCHp5BK9t0J+Q2tfQlkXNjOxBKx/pdpbyVGSMzmGxWChlTVJQb5VNbMwVCQ2gJ
         zVpe2/9fkjWMUD/rCp3lDaHa67MRpnJqxUMOChEcRsHxHNklEAekgNaOpnwPbLj1c/Nh
         nfHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=8xZjdj0nBFljTGww5/IGRbcl5W4TkKMNBjVAsBD8vBk=;
        b=PInhI32SNWdVirVgwVog0SOmlAnCB8645HiS7MYMpEf6iJuG756xiYMfKNowBE+0Oc
         dkjkgCGWok3Rg1J7WLzLBVuBzp4r536dwMs5imerMrH4AMNZY4pO+hlwlyD6144k979H
         RJMWCidw1rRhHJpOlAeceHfW/UuHVO/WVxJGpiaoZB7zHiZXHKrA+Hnpgyd1nhrnKEHn
         nsePPxisINdhbRZFsYKeRQum2TeKeTnxoMFKI2EOQgVtGs4tjr3UPuDDEajpLeqh6dzM
         Y01WkYDOLTlFB9/rWvDK8Bco28q+D1YNbIpbSUdeN0HmxZ5Pma49/H+0TXL5cIPUr1Zo
         HNUQ==
X-Gm-Message-State: AOAM532FC3/GcjgF0YV1ASIYUCrAq/Op2ZhhSJlm51pYtr151t43TRKy
	U8k3AsDaSdLH6UvorWJYq81IeeaaVGRute8PJw6ztA==
X-Google-Smtp-Source: 
 ABdhPJxk2fCoX8AaZs574ImIUQGJIi66MHHEdJ2geaEVeEVp7JIqrp5czcNBamX/JzUI/b3x1FhEcPSuI9yVgO/LY/k=
X-Received: by 2002:a17:906:4fc8:b0:6d8:5059:f998 with SMTP id
 i8-20020a1709064fc800b006d85059f998mr13062508ejw.487.1648229742826; Fri, 25
 Mar 2022 10:35:42 -0700 (PDT)
MIME-Version: 1.0
References: <20220325164630.55847-1-davide.gardenal@huawei.com>
In-Reply-To: <20220325164630.55847-1-davide.gardenal@huawei.com>
From: Steve Sakoman <steve@sakoman.com>
Date: Fri, 25 Mar 2022 07:35:31 -1000
Message-ID: 
 <CAOSpxdZvYwuzOMFP9QX8BMjrW58=mkJABMsn7mBPgd3w8mwMRA@mail.gmail.com>
Subject: Re: [oe-core][dunfell][PATCH] ghostscript: backport patch fix for
 CVE-2021-3781
To: Davide Gardenal <davidegarde2000@gmail.com>
Cc: openembedded-core@lists.openembedded.org,
	Davide Gardenal <davide.gardenal@huawei.com>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 25 Mar 2022 17:35:45 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/163646

Thanks Davide!

I had to do a slight tweak to your patch since I've also got a patch
to the ghostscript recipe to fix a couple of CVE issues for
ghostscript-native.

You can check my work in my stable/dunfell-next branch:

https://git.openembedded.org/openembedded-core-contrib/log/?h=stable/dunfell-nut

I've done a local test build and it looks good.  Will be running the
full autobuilder test suite later today when infrastructure
maintenance is done.

Steve

On Fri, Mar 25, 2022 at 6:46 AM Davide Gardenal
<davidegarde2000@gmail.com> wrote:
>
> Upstream advisory:
> https://ghostscript.com/blog/CVE-2021-3781.html
>
> Other than the CVE fix other two commits are backported
> to fit the patch.
>
> Signed-off-by: Davide Gardenal <davide.gardenal@huawei.com>
> ---
>  .../ghostscript/CVE-2021-3781_1.patch         | 121 +++++++++
>  .../ghostscript/CVE-2021-3781_2.patch         |  37 +++
>  .../ghostscript/CVE-2021-3781_3.patch         | 238 ++++++++++++++++++
>  .../ghostscript/ghostscript_9.52.bb           |   3 +
>  4 files changed, 399 insertions(+)
>  create mode 100644 meta/recipes-extended/ghostscript/ghostscript/CVE-2021-3781_1.patch
>  create mode 100644 meta/recipes-extended/ghostscript/ghostscript/CVE-2021-3781_2.patch
>  create mode 100644 meta/recipes-extended/ghostscript/ghostscript/CVE-2021-3781_3.patch
>
> diff --git a/meta/recipes-extended/ghostscript/ghostscript/CVE-2021-3781_1.patch b/meta/recipes-extended/ghostscript/ghostscript/CVE-2021-3781_1.patch
> new file mode 100644
> index 0000000000..033ba77f9a
> --- /dev/null
> +++ b/meta/recipes-extended/ghostscript/ghostscript/CVE-2021-3781_1.patch
> @@ -0,0 +1,121 @@
> +From 3920a727fb19e19f597e518610ce2416d08cb75f Mon Sep 17 00:00:00 2001
> +From: Chris Liddell <chris.liddell@artifex.com>
> +Date: Thu, 20 Aug 2020 17:19:09 +0100
> +Subject: [PATCH] Fix pdfwrite "%d" mode with file permissions
> +
> +Firstly, in gx_device_delete_output_file the iodev pointer was being passed
> +to the delete_method incorrectly (passing a pointer to that pointer). Thus
> +when we attempted to use that to confirm permission to delete the file, it
> +crashed. Credit to Ken for finding that.
> +
> +Secondly, due to the way pdfwrite works, when running with an output file per
> +page, it creates the current output file immediately it has completed writing
> +the previous one. Thus, it has to delete that partial file on exit.
> +
> +Previously, the output file was not added to the "control" permission list,
> +so an attempt to delete it would result in an error. So add the output file
> +to the "control" as well as "write" list.
> +
> +CVE: CVE-2021-3781
> +
> +Upstream-Status: Backport:
> +https://git.ghostscript.com/?p=ghostpdl.git;a=commit;f=base/gslibctx.c;h=3920a727fb19e19f597e518610ce2416d08cb75f
> +
> +Signed-off-by: Davide Gardenal <davide.gardenal@huawei.com>
> +---
> + base/gsdevice.c |  2 +-
> + base/gslibctx.c | 20 ++++++++++++++------
> + 2 files changed, 15 insertions(+), 7 deletions(-)
> +
> +diff --git a/base/gsdevice.c b/base/gsdevice.c
> +index 913119495..ac78af93f 100644
> +--- a/base/gsdevice.c
> ++++ b/base/gsdevice.c
> +@@ -1185,7 +1185,7 @@ int gx_device_delete_output_file(const gx_device * dev, const char *fname)
> +         parsed.len = strlen(parsed.fname);
> +     }
> +     if (parsed.iodev)
> +-        code = parsed.iodev->procs.delete_file((gx_io_device *)(&parsed.iodev), (const char *)parsed.fname);
> ++        code = parsed.iodev->procs.delete_file((gx_io_device *)(parsed.iodev), (const char *)parsed.fname);
> +     else
> +         code = gs_note_error(gs_error_invalidfileaccess);
> +
> +diff --git a/base/gslibctx.c b/base/gslibctx.c
> +index d726c58b5..ff8fc895e 100644
> +--- a/base/gslibctx.c
> ++++ b/base/gslibctx.c
> +@@ -647,7 +647,7 @@ gs_add_outputfile_control_path(gs_memory_t *mem, const char *fname)
> +     char *fp, f[gp_file_name_sizeof];
> +     const int pipe = 124; /* ASCII code for '|' */
> +     const int len = strlen(fname);
> +-    int i;
> ++    int i, code;
> +
> +     /* Be sure the string copy will fit */
> +     if (len >= gp_file_name_sizeof)
> +@@ -658,8 +658,6 @@ gs_add_outputfile_control_path(gs_memory_t *mem, const char *fname)
> +     rewrite_percent_specifiers(f);
> +     for (i = 0; i < len; i++) {
> +         if (f[i] == pipe) {
> +-           int code;
> +-
> +            fp = &f[i + 1];
> +            /* Because we potentially have to check file permissions at two levels
> +               for the output file (gx_device_open_output_file and the low level
> +@@ -671,10 +669,16 @@ gs_add_outputfile_control_path(gs_memory_t *mem, const char *fname)
> +            if (code < 0)
> +                return code;
> +            break;
> ++           code = gs_add_control_path(mem, gs_permit_file_control, f);
> ++           if (code < 0)
> ++               return code;
> +         }
> +         if (!IS_WHITESPACE(f[i]))
> +             break;
> +     }
> ++    code = gs_add_control_path(mem, gs_permit_file_control, fp);
> ++    if (code < 0)
> ++        return code;
> +     return gs_add_control_path(mem, gs_permit_file_writing, fp);
> + }
> +
> +@@ -684,7 +688,7 @@ gs_remove_outputfile_control_path(gs_memory_t *mem, const char *fname)
> +     char *fp, f[gp_file_name_sizeof];
> +     const int pipe = 124; /* ASCII code for '|' */
> +     const int len = strlen(fname);
> +-    int i;
> ++    int i, code;
> +
> +     /* Be sure the string copy will fit */
> +     if (len >= gp_file_name_sizeof)
> +@@ -694,8 +698,6 @@ gs_remove_outputfile_control_path(gs_memory_t *mem, const char *fname)
> +     /* Try to rewrite any %d (or similar) in the string */
> +     for (i = 0; i < len; i++) {
> +         if (f[i] == pipe) {
> +-           int code;
> +-
> +            fp = &f[i + 1];
> +            /* Because we potentially have to check file permissions at two levels
> +               for the output file (gx_device_open_output_file and the low level
> +@@ -704,6 +706,9 @@ gs_remove_outputfile_control_path(gs_memory_t *mem, const char *fname)
> +               the pipe_fopen(), the leading '|' has been stripped.
> +             */
> +            code = gs_remove_control_path(mem, gs_permit_file_writing, f);
> ++           if (code < 0)
> ++               return code;
> ++           code = gs_remove_control_path(mem, gs_permit_file_control, f);
> +            if (code < 0)
> +                return code;
> +            break;
> +@@ -711,6 +716,9 @@ gs_remove_outputfile_control_path(gs_memory_t *mem, const char *fname)
> +         if (!IS_WHITESPACE(f[i]))
> +             break;
> +     }
> ++    code = gs_remove_control_path(mem, gs_permit_file_control, fp);
> ++    if (code < 0)
> ++        return code;
> +     return gs_remove_control_path(mem, gs_permit_file_writing, fp);
> + }
> +
> +--
> +2.25.1
> diff --git a/meta/recipes-extended/ghostscript/ghostscript/CVE-2021-3781_2.patch b/meta/recipes-extended/ghostscript/ghostscript/CVE-2021-3781_2.patch
> new file mode 100644
> index 0000000000..beade79eef
> --- /dev/null
> +++ b/meta/recipes-extended/ghostscript/ghostscript/CVE-2021-3781_2.patch
> @@ -0,0 +1,37 @@
> +From 9daf042fd7bb19e93388d89d9686a2fa4496f382 Mon Sep 17 00:00:00 2001
> +From: Chris Liddell <chris.liddell@artifex.com>
> +Date: Mon, 24 Aug 2020 09:24:31 +0100
> +Subject: [PATCH] Coverity 361429: move "break" to correct place.
> +
> +We had to add the outputfile to the "control" file permission list (as well
> +as write), but for the "pipe" case, I accidentally added the call after the
> +break out of loop that checks for a pipe.
> +
> +CVE: CVE-2021-3781
> +
> +Upstream-Status: Backport:
> +https://git.ghostscript.com/?p=ghostpdl.git;a=commit;f=base/gslibctx.c;h=9daf042fd7bb19e93388d89d9686a2fa4496f382
> +
> +Signed-off-by: Davide Gardenal <davide.gardenal@huawei.com>
> +---
> + base/gslibctx.c | 2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +diff --git a/base/gslibctx.c b/base/gslibctx.c
> +index ff8fc895e..63dfbe2e0 100644
> +--- a/base/gslibctx.c
> ++++ b/base/gslibctx.c
> +@@ -668,10 +668,10 @@ gs_add_outputfile_control_path(gs_memory_t *mem, const char *fname)
> +            code = gs_add_control_path(mem, gs_permit_file_writing, f);
> +            if (code < 0)
> +                return code;
> +-           break;
> +            code = gs_add_control_path(mem, gs_permit_file_control, f);
> +            if (code < 0)
> +                return code;
> ++           break;
> +         }
> +         if (!IS_WHITESPACE(f[i]))
> +             break;
> +--
> +2.25.1
> diff --git a/meta/recipes-extended/ghostscript/ghostscript/CVE-2021-3781_3.patch b/meta/recipes-extended/ghostscript/ghostscript/CVE-2021-3781_3.patch
> new file mode 100644
> index 0000000000..e3f9e81c45
> --- /dev/null
> +++ b/meta/recipes-extended/ghostscript/ghostscript/CVE-2021-3781_3.patch
> @@ -0,0 +1,238 @@
> +From a9bd3dec9fde03327a4a2c69dad1036bf9632e20 Mon Sep 17 00:00:00 2001
> +From: Chris Liddell <chris.liddell@artifex.com>
> +Date: Tue, 7 Sep 2021 20:36:12 +0100
> +Subject: [PATCH] Bug 704342: Include device specifier strings in access
> + validation
> +
> +for the "%pipe%", %handle%" and %printer% io devices.
> +
> +We previously validated only the part after the "%pipe%" Postscript device
> +specifier, but this proved insufficient.
> +
> +This rebuilds the original file name string, and validates it complete. The
> +slight complication for "%pipe%" is it can be reached implicitly using
> +"|" so we have to check both prefixes.
> +
> +Addresses CVE-2021-3781
> +
> +CVE: CVE-2021-3781
> +
> +Upstream-Status: Backport:
> +https://git.ghostscript.com/?p=ghostpdl.git;a=commitdiff;h=a9bd3dec9fde
> +
> +Signed-off-by: Davide Gardenal <davide.gardenal@huawei.com>
> +---
> + base/gdevpipe.c | 22 +++++++++++++++-
> + base/gp_mshdl.c | 11 +++++++-
> + base/gp_msprn.c | 10 ++++++-
> + base/gp_os2pr.c | 13 +++++++++-
> + base/gslibctx.c | 69 ++++++++++---------------------------------------
> + 5 files changed, 65 insertions(+), 60 deletions(-)
> +
> +diff --git a/base/gdevpipe.c b/base/gdevpipe.c
> +index 96d71f5d8..5bdc485be 100644
> +--- a/base/gdevpipe.c
> ++++ b/base/gdevpipe.c
> +@@ -72,8 +72,28 @@ pipe_fopen(gx_io_device * iodev, const char *fname, const char *access,
> + #else
> +     gs_lib_ctx_t *ctx = mem->gs_lib_ctx;
> +     gs_fs_list_t *fs = ctx->core->fs;
> ++    /* The pipe device can be reached in two ways, explicltly with %pipe%
> ++       or implicitly with "|", so we have to check for both
> ++     */
> ++    char f[gp_file_name_sizeof];
> ++    const char *pipestr = "|";
> ++    const size_t pipestrlen = strlen(pipestr);
> ++    const size_t preflen = strlen(iodev->dname);
> ++    const size_t nlen = strlen(fname);
> ++    int code1;
> ++
> ++    if (preflen + nlen >= gp_file_name_sizeof)
> ++        return_error(gs_error_invalidaccess);
> ++
> ++    memcpy(f, iodev->dname, preflen);
> ++    memcpy(f + preflen, fname, nlen + 1);
> ++
> ++    code1 = gp_validate_path(mem, f, access);
> ++
> ++    memcpy(f, pipestr, pipestrlen);
> ++    memcpy(f + pipestrlen, fname, nlen + 1);
> +
> +-    if (gp_validate_path(mem, fname, access) != 0)
> ++    if (code1 != 0 && gp_validate_path(mem, f, access) != 0 )
> +         return gs_error_invalidfileaccess;
> +
> +     /*
> +diff --git a/base/gp_mshdl.c b/base/gp_mshdl.c
> +index 2b964ed74..8d87ceadc 100644
> +--- a/base/gp_mshdl.c
> ++++ b/base/gp_mshdl.c
> +@@ -95,8 +95,17 @@ mswin_handle_fopen(gx_io_device * iodev, const char *fname, const char *access,
> +     long hfile;       /* Correct for Win32, may be wrong for Win64 */
> +     gs_lib_ctx_t *ctx = mem->gs_lib_ctx;
> +     gs_fs_list_t *fs = ctx->core->fs;
> ++    char f[gp_file_name_sizeof];
> ++    const size_t preflen = strlen(iodev->dname);
> ++    const size_t nlen = strlen(fname);
> +
> +-    if (gp_validate_path(mem, fname, access) != 0)
> ++    if (preflen + nlen >= gp_file_name_sizeof)
> ++        return_error(gs_error_invalidaccess);
> ++
> ++    memcpy(f, iodev->dname, preflen);
> ++    memcpy(f + preflen, fname, nlen + 1);
> ++
> ++    if (gp_validate_path(mem, f, access) != 0)
> +         return gs_error_invalidfileaccess;
> +
> +     /* First we try the open_handle method. */
> +diff --git a/base/gp_msprn.c b/base/gp_msprn.c
> +index ed4827968..746a974f7 100644
> +--- a/base/gp_msprn.c
> ++++ b/base/gp_msprn.c
> +@@ -168,8 +168,16 @@ mswin_printer_fopen(gx_io_device * iodev, const char *fname, const char *access,
> +     unsigned long *ptid = &((tid_t *)(iodev->state))->tid;
> +     gs_lib_ctx_t *ctx = mem->gs_lib_ctx;
> +     gs_fs_list_t *fs = ctx->core->fs;
> ++    const size_t preflen = strlen(iodev->dname);
> ++    const size_t nlen = strlen(fname);
> +
> +-    if (gp_validate_path(mem, fname, access) != 0)
> ++    if (preflen + nlen >= gp_file_name_sizeof)
> ++        return_error(gs_error_invalidaccess);
> ++
> ++    memcpy(pname, iodev->dname, preflen);
> ++    memcpy(pname + preflen, fname, nlen + 1);
> ++
> ++    if (gp_validate_path(mem, pname, access) != 0)
> +         return gs_error_invalidfileaccess;
> +
> +     /* First we try the open_printer method. */
> +diff --git a/base/gp_os2pr.c b/base/gp_os2pr.c
> +index f852c71fc..ba54cde66 100644
> +--- a/base/gp_os2pr.c
> ++++ b/base/gp_os2pr.c
> +@@ -107,9 +107,20 @@ os2_printer_fopen(gx_io_device * iodev, const char *fname, const char *access,
> +            FILE ** pfile, char *rfname, uint rnamelen)
> + {
> +     os2_printer_t *pr = (os2_printer_t *)iodev->state;
> +-    char driver_name[256];
> ++    char driver_name[gp_file_name_sizeof];
> +     gs_lib_ctx_t *ctx = mem->gs_lib_ctx;
> +     gs_fs_list_t *fs = ctx->core->fs;
> ++    const size_t preflen = strlen(iodev->dname);
> ++    const int size_t = strlen(fname);
> ++
> ++    if (preflen + nlen >= gp_file_name_sizeof)
> ++        return_error(gs_error_invalidaccess);
> ++
> ++    memcpy(driver_name, iodev->dname, preflen);
> ++    memcpy(driver_name + preflen, fname, nlen + 1);
> ++
> ++    if (gp_validate_path(mem, driver_name, access) != 0)
> ++        return gs_error_invalidfileaccess;
> +
> +     /* First we try the open_printer method. */
> +     /* Note that the loop condition here ensures we don't
> +diff --git a/base/gslibctx.c b/base/gslibctx.c
> +index 6dfed6cd5..318039fad 100644
> +--- a/base/gslibctx.c
> ++++ b/base/gslibctx.c
> +@@ -655,82 +655,39 @@ rewrite_percent_specifiers(char *s)
> + int
> + gs_add_outputfile_control_path(gs_memory_t *mem, const char *fname)
> + {
> +-    char *fp, f[gp_file_name_sizeof];
> +-    const int pipe = 124; /* ASCII code for '|' */
> +-    const int len = strlen(fname);
> +-    int i, code;
> ++    char f[gp_file_name_sizeof];
> ++    int code;
> +
> +     /* Be sure the string copy will fit */
> +-    if (len >= gp_file_name_sizeof)
> ++    if (strlen(fname) >= gp_file_name_sizeof)
> +         return gs_error_rangecheck;
> +     strcpy(f, fname);
> +-    fp = f;
> +     /* Try to rewrite any %d (or similar) in the string */
> +     rewrite_percent_specifiers(f);
> +-    for (i = 0; i < len; i++) {
> +-        if (f[i] == pipe) {
> +-           fp = &f[i + 1];
> +-           /* Because we potentially have to check file permissions at two levels
> +-              for the output file (gx_device_open_output_file and the low level
> +-              fopen API, if we're using a pipe, we have to add both the full string,
> +-              (including the '|', and just the command to which we pipe - since at
> +-              the pipe_fopen(), the leading '|' has been stripped.
> +-            */
> +-           code = gs_add_control_path(mem, gs_permit_file_writing, f);
> +-           if (code < 0)
> +-               return code;
> +-           code = gs_add_control_path(mem, gs_permit_file_control, f);
> +-           if (code < 0)
> +-               return code;
> +-           break;
> +-        }
> +-        if (!IS_WHITESPACE(f[i]))
> +-            break;
> +-    }
> +-    code = gs_add_control_path(mem, gs_permit_file_control, fp);
> ++
> ++    code = gs_add_control_path(mem, gs_permit_file_control, f);
> +     if (code < 0)
> +         return code;
> +-    return gs_add_control_path(mem, gs_permit_file_writing, fp);
> ++    return gs_add_control_path(mem, gs_permit_file_writing, f);
> + }
> +
> + int
> + gs_remove_outputfile_control_path(gs_memory_t *mem, const char *fname)
> + {
> +-    char *fp, f[gp_file_name_sizeof];
> +-    const int pipe = 124; /* ASCII code for '|' */
> +-    const int len = strlen(fname);
> +-    int i, code;
> ++    char f[gp_file_name_sizeof];
> ++    int code;
> +
> +     /* Be sure the string copy will fit */
> +-    if (len >= gp_file_name_sizeof)
> ++    if (strlen(fname) >= gp_file_name_sizeof)
> +         return gs_error_rangecheck;
> +     strcpy(f, fname);
> +-    fp = f;
> +     /* Try to rewrite any %d (or similar) in the string */
> +-    for (i = 0; i < len; i++) {
> +-        if (f[i] == pipe) {
> +-           fp = &f[i + 1];
> +-           /* Because we potentially have to check file permissions at two levels
> +-              for the output file (gx_device_open_output_file and the low level
> +-              fopen API, if we're using a pipe, we have to add both the full string,
> +-              (including the '|', and just the command to which we pipe - since at
> +-              the pipe_fopen(), the leading '|' has been stripped.
> +-            */
> +-           code = gs_remove_control_path(mem, gs_permit_file_writing, f);
> +-           if (code < 0)
> +-               return code;
> +-           code = gs_remove_control_path(mem, gs_permit_file_control, f);
> +-           if (code < 0)
> +-               return code;
> +-           break;
> +-        }
> +-        if (!IS_WHITESPACE(f[i]))
> +-            break;
> +-    }
> +-    code = gs_remove_control_path(mem, gs_permit_file_control, fp);
> ++    rewrite_percent_specifiers(f);
> ++
> ++    code = gs_remove_control_path(mem, gs_permit_file_control, f);
> +     if (code < 0)
> +         return code;
> +-    return gs_remove_control_path(mem, gs_permit_file_writing, fp);
> ++    return gs_remove_control_path(mem, gs_permit_file_writing, f);
> + }
> +
> + int
> +--
> +2.25.1
> diff --git a/meta/recipes-extended/ghostscript/ghostscript_9.52.bb b/meta/recipes-extended/ghostscript/ghostscript_9.52.bb
> index 32346e6811..0ee6ee0126 100644
> --- a/meta/recipes-extended/ghostscript/ghostscript_9.52.bb
> +++ b/meta/recipes-extended/ghostscript/ghostscript_9.52.bb
> @@ -33,6 +33,9 @@ SRC_URI_BASE = "https://github.com/ArtifexSoftware/ghostpdl-downloads/releases/d
>                  file://do-not-check-local-libpng-source.patch \
>                  file://avoid-host-contamination.patch \
>                  file://mkdir-p.patch \
> +                file://CVE-2021-3781_1.patch \
> +                file://CVE-2021-3781_2.patch \
> +                file://CVE-2021-3781_3.patch \
>  "
>
>  SRC_URI = "${SRC_URI_BASE} \
> --
> 2.32.0
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#163645): https://lists.openembedded.org/g/openembedded-core/message/163645
> Mute This Topic: https://lists.openembedded.org/mt/90026834/3620601
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [steve@sakoman.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

