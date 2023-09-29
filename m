Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 55C22E728C2
	for <webhook@archiver.kernel.org>; Fri, 29 Sep 2023 15:48:31 +0000 (UTC)
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
 by mx.groups.io with SMTP id smtpd.web10.21102.1696002506746261470
 for <openembedded-core@lists.openembedded.org>;
 Fri, 29 Sep 2023 08:48:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=yWGwLd3A;
 spf=softfail (domain: sakoman.com, ip: 209.85.218.53, mailfrom: steve@sakoman.com)
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-9adca291f99so1876973666b.2
        for <openembedded-core@lists.openembedded.org>; Fri, 29 Sep 2023 08:48:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1696002505; x=1696607305; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9enMETHEOfkA83cBX0q+ae/sEG9RoXeVE5JRsFHkPXA=;
        b=yWGwLd3A60MbcpZEhYEGaWd4XB+6h2MKnBPmgJWJy8CiG1vygYGkpHMg8sFPOzWtgy
         VgxCE8mVl3SCud7mZWnJ01R8eXSQJOHTFsmv2IzIe/AK64bRc+9npqy9GUI0C30kCkIF
         dmTp/YFmtoHpfmP9+0qT36Vj9fRHHobc3Fn8yDqhG9YbZ0RTVwD9ci310l7g5dlSgb6W
         kqZQKNlk8fdeqK5XyuZ550ydOsESLSjK1wQS0OJOyL1rRwdeLwleXOpZ6dSxEbd+Ls9/
         +YQhfwIjUKovW6lJWkl6tl8czV15Md3K7P/ntznHg2rxJAUqMaYPoMRzjXuO8EjfhRbp
         5ZwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696002505; x=1696607305;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9enMETHEOfkA83cBX0q+ae/sEG9RoXeVE5JRsFHkPXA=;
        b=M66l4YZsfDnjFC6L0SeJX9N/v+juplU87zA+ga5gwhoSbFmFE1pp64WXzWvSQtRZZN
         wA+pDfSu6sOqjkW65bD2wWEylpcSQyFaCnQ8v3v3vNhQCgmEzqVnwAR4XOsjci1T4Bdi
         rSz9mFIWg4fXOALOIp8LjwbhnoKbcG7bfBJQe3ECp3j4ys5vWzc0u2Fi4DE2jPPIGVc+
         kw+Men+jZPJTG9iTE4w460QQymsHATYrSfm0H69d93FscE/jjCycthAIsgrF8J1qzi7e
         AHWTjBuiTD462bcTJvF0KQBNcLj2eJqcYJuM7kxwVR/Wgrx98RpCFvjARi/jtWB9LYsN
         zEBA==
X-Gm-Message-State: AOJu0YyXtKi8C4RDiCXZX4wzSIktJZnS8jE6TCJtiP7z59f/7WQ3ItBW
	EIUgl6o1+/7qQwH/rUYzGcw+GHTwsdbN6ulIDCcp0Q==
X-Google-Smtp-Source: AGHT+IEDv1MdMXngQw5zT3QuKWgj0/fLbQgM3NYL2xeAn4vbYie1DcKxL7VcI8kfsWYy8hZoXk6E5thom+rEbj7hMgM=
X-Received: by 2002:a17:906:8469:b0:9b2:bcd5:8d37 with SMTP id
 hx9-20020a170906846900b009b2bcd58d37mr4439795ejc.6.1696002504866; Fri, 29 Sep
 2023 08:48:24 -0700 (PDT)
MIME-Version: 1.0
References: <20230926043105.357527-1-vanusuri@mvista.com> <CANQUz1-0koph03N070QdMin3sG5LkTprRnhV4GV=ppgS2SQ_dg@mail.gmail.com>
In-Reply-To: <CANQUz1-0koph03N070QdMin3sG5LkTprRnhV4GV=ppgS2SQ_dg@mail.gmail.com>
From: Steve Sakoman <steve@sakoman.com>
Date: Fri, 29 Sep 2023 05:48:10 -1000
Message-ID: <CAOSpxdYpY4bLDx2QA34=DBRarGReewMc7PYPTsLBbMOcRFLwMg@mail.gmail.com>
Subject: Re: [OE-core][dunfell][PATCH] ghostscript: fix CVE-2023-36664
To: Vijay Anusuri <vanusuri@mvista.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 29 Sep 2023 15:48:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/188409

On Fri, Sep 29, 2023 at 4:43=E2=80=AFAM Vijay Anusuri <vanusuri@mvista.com>=
 wrote:
>
> Hi Steve,
>
> Any update on this ?

It is in my current test queue:

https://git.openembedded.org/openembedded-core-contrib/log/?h=3Dstable/dunf=
ell-nut

Steve

> On Tue, Sep 26, 2023 at 10:01=E2=80=AFAM <vanusuri@mvista.com> wrote:
>>
>> From: Vijay Anusuri <vanusuri@mvista.com>
>>
>> Artifex Ghostscript through 10.01.2 mishandles permission validation for
>> pipe devices (with the %pipe% prefix or the | pipe character prefix).
>>
>> Reference:
>> https://nvd.nist.gov/vuln/detail/CVE-2023-36664
>>
>> Upstream commits:
>> https://git.ghostscript.com/?p=3Dghostpdl.git;a=3Dcommit;h=3D4ceaf928153=
02863a8c86fcfcf2347e0118dd3a5
>> https://git.ghostscript.com/?p=3Dghostpdl.git;a=3Dcommitdiff;h=3D5e65eea=
e225c7d02d447de5abaf4a8e6d234fcea
>> https://git.ghostscript.com/?p=3Dghostpdl.git;a=3Dcommitdiff;h=3Dfb342fd=
b60391073a69147cb71af1ac416a81099
>>
>> Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
>> ---
>>  .../ghostscript/CVE-2023-36664-1.patch        | 145 ++++++++++++++++++
>>  .../ghostscript/CVE-2023-36664-2.patch        |  60 ++++++++
>>  .../ghostscript/CVE-2023-36664-pre1.patch     |  62 ++++++++
>>  .../ghostscript/ghostscript_9.52.bb           |   3 +
>>  4 files changed, 270 insertions(+)
>>  create mode 100644 meta/recipes-extended/ghostscript/ghostscript/CVE-20=
23-36664-1.patch
>>  create mode 100644 meta/recipes-extended/ghostscript/ghostscript/CVE-20=
23-36664-2.patch
>>  create mode 100644 meta/recipes-extended/ghostscript/ghostscript/CVE-20=
23-36664-pre1.patch
>>
>> diff --git a/meta/recipes-extended/ghostscript/ghostscript/CVE-2023-3666=
4-1.patch b/meta/recipes-extended/ghostscript/ghostscript/CVE-2023-36664-1.=
patch
>> new file mode 100644
>> index 0000000000..a3bbe958eb
>> --- /dev/null
>> +++ b/meta/recipes-extended/ghostscript/ghostscript/CVE-2023-36664-1.pat=
ch
>> @@ -0,0 +1,145 @@
>> +From 5e65eeae225c7d02d447de5abaf4a8e6d234fcea Mon Sep 17 00:00:00 2001
>> +From: Chris Liddell <chris.liddell@artifex.com>
>> +Date: Wed, 7 Jun 2023 10:23:06 +0100
>> +Subject: [PATCH] Bug 706761: Don't "reduce" %pipe% file names for permi=
ssion validation
>> +
>> +For regular file names, we try to simplfy relative paths before we use =
them.
>> +
>> +Because the %pipe% device can, effectively, accept command line calls, =
we
>> +shouldn't be simplifying that string, because the command line syntax c=
an end
>> +up confusing the path simplifying code. That can result in permitting a=
 pipe
>> +command which does not match what was originally permitted.
>> +
>> +Special case "%pipe" in the validation code so we always deal with the =
entire
>> +string.
>> +
>> +Upstream-Status: Backport [https://git.ghostscript.com/?p=3Dghostpdl.gi=
t;a=3Dcommit;h=3D505eab7782b429017eb434b2b95120855f2b0e3c]
>> +CVE: CVE-2023-36664
>> +Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
>> +---
>> + base/gpmisc.c   | 31 +++++++++++++++++++--------
>> + base/gslibctx.c | 56 ++++++++++++++++++++++++++++++++++++-------------
>> + 2 files changed, 64 insertions(+), 23 deletions(-)
>> +
>> +diff --git a/base/gpmisc.c b/base/gpmisc.c
>> +index c4fffae..09ac6b3 100644
>> +--- a/base/gpmisc.c
>> ++++ b/base/gpmisc.c
>> +@@ -1046,16 +1046,29 @@ gp_validate_path_len(const gs_memory_t *mem,
>> +              && !memcmp(path + cdirstrl, dirsepstr, dirsepstrl)) {
>> +           prefix_len =3D 0;
>> +     }
>> +-    rlen =3D len+1;
>> +-    bufferfull =3D (char *)gs_alloc_bytes(mem->thread_safe_memory, rle=
n + prefix_len, "gp_validate_path");
>> +-    if (bufferfull =3D=3D NULL)
>> +-        return gs_error_VMerror;
>> +-
>> +-    buffer =3D bufferfull + prefix_len;
>> +-    if (gp_file_name_reduce(path, (uint)len, buffer, &rlen) !=3D gp_co=
mbine_success)
>> +-        return gs_error_invalidfileaccess;
>> +-    buffer[rlen] =3D 0;
>> +
>> ++    /* "%pipe%" do not follow the normal rules for path definitions, s=
o we
>> ++       don't "reduce" them to avoid unexpected results
>> ++     */
>> ++    if (len > 5 && memcmp(path, "%pipe", 5) !=3D 0) {
>> ++      bufferfull =3D buffer =3D (char *)gs_alloc_bytes(mem->thread_saf=
e_memory, len + 1, "gp_validate_path");
>> ++      if (buffer =3D=3D NULL)
>> ++          return gs_error_VMerror;
>> ++      memcpy(buffer, path, len);
>> ++      buffer[len] =3D 0;
>> ++      rlen =3D len;
>> ++    }
>> ++    else {
>> ++      rlen =3D len+1;
>> ++      bufferfull =3D (char *)gs_alloc_bytes(mem->thread_safe_memory, r=
len + prefix_len, "gp_validate_path");
>> ++      if (bufferfull =3D=3D NULL)
>> ++          return gs_error_VMerror;
>> ++
>> ++      buffer =3D bufferfull + prefix_len;
>> ++      if (gp_file_name_reduce(path, (uint)len, buffer, &rlen) !=3D gp_=
combine_success)
>> ++          return gs_error_invalidfileaccess;
>> ++      buffer[rlen] =3D 0;
>> ++    }
>> +     while (1) {
>> +         switch (mode[0])
>> +         {
>> +diff --git a/base/gslibctx.c b/base/gslibctx.c
>> +index 20c5eee..355c0e3 100644
>> +--- a/base/gslibctx.c
>> ++++ b/base/gslibctx.c
>> +@@ -719,14 +719,28 @@ gs_add_control_path_len(const gs_memory_t *mem, g=
s_path_control_t type, const ch
>> +             return gs_error_rangecheck;
>> +     }
>> +
>> +-    rlen =3D len+1;
>> +-    buffer =3D (char *)gs_alloc_bytes(core->memory, rlen, "gp_validate=
_path");
>> +-    if (buffer =3D=3D NULL)
>> +-        return gs_error_VMerror;
>> ++    /* "%pipe%" do not follow the normal rules for path definitions, s=
o we
>> ++       don't "reduce" them to avoid unexpected results
>> ++     */
>> ++    if (len > 5 && memcmp(path, "%pipe", 5) !=3D 0) {
>> ++      buffer =3D (char *)gs_alloc_bytes(core->memory, len + 1, "gs_add=
_control_path_len");
>> ++      if (buffer =3D=3D NULL)
>> ++          return gs_error_VMerror;
>> ++      memcpy(buffer, path, len);
>> ++      buffer[len] =3D 0;
>> ++      rlen =3D len;
>> ++    }
>> ++    else {
>> ++      rlen =3D len + 1;
>> +
>> +-    if (gp_file_name_reduce(path, (uint)len, buffer, &rlen) !=3D gp_co=
mbine_success)
>> +-        return gs_error_invalidfileaccess;
>> +-    buffer[rlen] =3D 0;
>> ++      buffer =3D (char *)gs_alloc_bytes(core->memory, rlen, "gs_add_co=
ntrol_path_len");
>> ++      if (buffer =3D=3D NULL)
>> ++          return gs_error_VMerror;
>> ++
>> ++      if (gp_file_name_reduce(path, (uint)len, buffer, &rlen) !=3D gp_=
combine_success)
>> ++          return gs_error_invalidfileaccess;
>> ++      buffer[rlen] =3D 0;
>> ++    }
>> +
>> +     n =3D control->num;
>> +     for (i =3D 0; i < n; i++)
>> +@@ -802,14 +816,28 @@ gs_remove_control_path_len(const gs_memory_t *mem=
, gs_path_control_t type, const
>> +             return gs_error_rangecheck;
>> +     }
>> +
>> +-    rlen =3D len+1;
>> +-    buffer =3D (char *)gs_alloc_bytes(core->memory, rlen, "gp_validate=
_path");
>> +-    if (buffer =3D=3D NULL)
>> +-        return gs_error_VMerror;
>> ++    /* "%pipe%" do not follow the normal rules for path definitions, s=
o we
>> ++       don't "reduce" them to avoid unexpected results
>> ++     */
>> ++    if (len > 5 && memcmp(path, "%pipe", 5) !=3D 0) {
>> ++      buffer =3D (char *)gs_alloc_bytes(core->memory, len + 1, "gs_rem=
ove_control_path_len");
>> ++      if (buffer =3D=3D NULL)
>> ++          return gs_error_VMerror;
>> ++      memcpy(buffer, path, len);
>> ++      buffer[len] =3D 0;
>> ++      rlen =3D len;
>> ++    }
>> ++    else {
>> ++      rlen =3D len+1;
>> +
>> +-    if (gp_file_name_reduce(path, (uint)len, buffer, &rlen) !=3D gp_co=
mbine_success)
>> +-        return gs_error_invalidfileaccess;
>> +-    buffer[rlen] =3D 0;
>> ++      buffer =3D (char *)gs_alloc_bytes(core->memory, rlen, "gs_remove=
_control_path_len");
>> ++      if (buffer =3D=3D NULL)
>> ++          return gs_error_VMerror;
>> ++
>> ++      if (gp_file_name_reduce(path, (uint)len, buffer, &rlen) !=3D gp_=
combine_success)
>> ++          return gs_error_invalidfileaccess;
>> ++      buffer[rlen] =3D 0;
>> ++    }
>> +
>> +     n =3D control->num;
>> +     for (i =3D 0; i < n; i++) {
>> +--
>> +2.25.1
>> +
>> diff --git a/meta/recipes-extended/ghostscript/ghostscript/CVE-2023-3666=
4-2.patch b/meta/recipes-extended/ghostscript/ghostscript/CVE-2023-36664-2.=
patch
>> new file mode 100644
>> index 0000000000..e8c42f1deb
>> --- /dev/null
>> +++ b/meta/recipes-extended/ghostscript/ghostscript/CVE-2023-36664-2.pat=
ch
>> @@ -0,0 +1,60 @@
>> +From fb342fdb60391073a69147cb71af1ac416a81099 Mon Sep 17 00:00:00 2001
>> +From: Chris Liddell <chris.liddell@artifex.com>
>> +Date: Wed, 14 Jun 2023 09:08:12 +0100
>> +Subject: [PATCH] Bug 706778: 706761 revisit
>> +
>> +Two problems with the original commit. The first a silly typo inverting=
 the
>> +logic of a test.
>> +
>> +The second was forgetting that we actually actually validate two candid=
ate
>> +strings for pipe devices. One with the expected "%pipe%" prefix, the ot=
her
>> +using the pipe character prefix: "|".
>> +
>> +This addresses both those.
>> +
>> +Upstream-Status: Backport [https://git.ghostscript.com/?p=3Dghostpdl.gi=
t;a=3Dcommit;h=3Dfb342fdb60391073a69147cb71af1ac416a81099]
>> +CVE: CVE-2023-36664
>> +Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
>> +---
>> + base/gpmisc.c   | 2 +-
>> + base/gslibctx.c | 4 ++--
>> + 2 files changed, 3 insertions(+), 3 deletions(-)
>> +
>> +diff --git a/base/gpmisc.c b/base/gpmisc.c
>> +index 09ac6b3..01d449f 100644
>> +--- a/base/gpmisc.c
>> ++++ b/base/gpmisc.c
>> +@@ -1050,7 +1050,7 @@ gp_validate_path_len(const gs_memory_t *mem,
>> +     /* "%pipe%" do not follow the normal rules for path definitions, s=
o we
>> +        don't "reduce" them to avoid unexpected results
>> +      */
>> +-    if (len > 5 && memcmp(path, "%pipe", 5) !=3D 0) {
>> ++    if (path[0] =3D=3D '|' || (len > 5 && memcmp(path, "%pipe", 5) =3D=
=3D 0)) {
>> +       bufferfull =3D buffer =3D (char *)gs_alloc_bytes(mem->thread_saf=
e_memory, len + 1, "gp_validate_path");
>> +       if (buffer =3D=3D NULL)
>> +           return gs_error_VMerror;
>> +diff --git a/base/gslibctx.c b/base/gslibctx.c
>> +index 355c0e3..d8f74a3 100644
>> +--- a/base/gslibctx.c
>> ++++ b/base/gslibctx.c
>> +@@ -722,7 +722,7 @@ gs_add_control_path_len(const gs_memory_t *mem, gs_=
path_control_t type, const ch
>> +     /* "%pipe%" do not follow the normal rules for path definitions, s=
o we
>> +        don't "reduce" them to avoid unexpected results
>> +      */
>> +-    if (len > 5 && memcmp(path, "%pipe", 5) !=3D 0) {
>> ++    if (path[0] =3D=3D '|' || (len > 5 && memcmp(path, "%pipe", 5) =3D=
=3D 0)) {
>> +       buffer =3D (char *)gs_alloc_bytes(core->memory, len + 1, "gs_add=
_control_path_len");
>> +       if (buffer =3D=3D NULL)
>> +           return gs_error_VMerror;
>> +@@ -819,7 +819,7 @@ gs_remove_control_path_len(const gs_memory_t *mem, =
gs_path_control_t type, const
>> +     /* "%pipe%" do not follow the normal rules for path definitions, s=
o we
>> +        don't "reduce" them to avoid unexpected results
>> +      */
>> +-    if (len > 5 && memcmp(path, "%pipe", 5) !=3D 0) {
>> ++    if (path[0] =3D=3D '|' || (len > 5 && memcmp(path, "%pipe", 5) =3D=
=3D 0)) {
>> +       buffer =3D (char *)gs_alloc_bytes(core->memory, len + 1, "gs_rem=
ove_control_path_len");
>> +       if (buffer =3D=3D NULL)
>> +           return gs_error_VMerror;
>> +--
>> +2.25.1
>> +
>> diff --git a/meta/recipes-extended/ghostscript/ghostscript/CVE-2023-3666=
4-pre1.patch b/meta/recipes-extended/ghostscript/ghostscript/CVE-2023-36664=
-pre1.patch
>> new file mode 100644
>> index 0000000000..662736bb3d
>> --- /dev/null
>> +++ b/meta/recipes-extended/ghostscript/ghostscript/CVE-2023-36664-pre1.=
patch
>> @@ -0,0 +1,62 @@
>> +From 4ceaf92815302863a8c86fcfcf2347e0118dd3a5 Mon Sep 17 00:00:00 2001
>> +From: Ray Johnston <ray.johnston@artifex.com>
>> +Date: Tue, 22 Sep 2020 13:10:04 -0700
>> +Subject: [PATCH] Fix gp_file allocations to use thread_safe_memory.
>> +
>> +The gpmisc.c does allocations for gp_file objects and buffers used by
>> +gp_fprintf, as well as gp_validate_path_len. The helgrind run with
>> +-dBGPrint -dNumRenderingThreads=3D4 and PCL input showed up the gp_fpri=
ntf
>> +problem since the clist rendering would call gp_fprintf using the same
>> +allocator (PCL's chunk allocator which is non_gc_memory). The chunk
>> +allocator is intentionally not thread safe (for performance).
>> +
>> +Upstream-Status: Backport [https://git.ghostscript.com/?p=3Dghostpdl.gi=
t;a=3Dcommit;h=3D4ceaf92815302863a8c86fcfcf2347e0118dd3a5]
>> +CVE: CVE-2023-36664 #Dependency Patch1
>> +Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
>> +---
>> + base/gpmisc.c | 8 ++++----
>> + 1 file changed, 4 insertions(+), 4 deletions(-)
>> +
>> +diff --git a/base/gpmisc.c b/base/gpmisc.c
>> +index 34cd71f..c4fffae 100644
>> +--- a/base/gpmisc.c
>> ++++ b/base/gpmisc.c
>> +@@ -435,7 +435,7 @@ generic_pwrite(gp_file *f, size_t count, gs_offset_=
t offset, const void *buf)
>> +
>> + gp_file *gp_file_alloc(gs_memory_t *mem, const gp_file_ops_t *prototyp=
e, size_t size, const char *cname)
>> + {
>> +-    gp_file *file =3D (gp_file *)gs_alloc_bytes(mem->non_gc_memory, si=
ze, cname ? cname : "gp_file");
>> ++    gp_file *file =3D (gp_file *)gs_alloc_bytes(mem->thread_safe_memor=
y, size, cname ? cname : "gp_file");
>> +     if (file =3D=3D NULL)
>> +         return NULL;
>> +
>> +@@ -449,7 +449,7 @@ gp_file *gp_file_alloc(gs_memory_t *mem, const gp_f=
ile_ops_t *prototype, size_t
>> +         memset(((char *)file)+sizeof(*prototype),
>> +                0,
>> +                size - sizeof(*prototype));
>> +-    file->memory =3D mem->non_gc_memory;
>> ++    file->memory =3D mem->thread_safe_memory;
>> +
>> +     return file;
>> + }
>> +@@ -1047,7 +1047,7 @@ gp_validate_path_len(const gs_memory_t *mem,
>> +           prefix_len =3D 0;
>> +     }
>> +     rlen =3D len+1;
>> +-    bufferfull =3D (char *)gs_alloc_bytes(mem->non_gc_memory, rlen + p=
refix_len, "gp_validate_path");
>> ++    bufferfull =3D (char *)gs_alloc_bytes(mem->thread_safe_memory, rle=
n + prefix_len, "gp_validate_path");
>> +     if (bufferfull =3D=3D NULL)
>> +         return gs_error_VMerror;
>> +
>> +@@ -1093,7 +1093,7 @@ gp_validate_path_len(const gs_memory_t *mem,
>> +         break;
>> +     }
>> +
>> +-    gs_free_object(mem->non_gc_memory, bufferfull, "gp_validate_path")=
;
>> ++    gs_free_object(mem->thread_safe_memory, bufferfull, "gp_validate_p=
ath");
>> + #ifdef EACCES
>> +     if (code =3D=3D gs_error_invalidfileaccess)
>> +         errno =3D EACCES;
>> +--
>> +2.25.1
>> +
>> diff --git a/meta/recipes-extended/ghostscript/ghostscript_9.52.bb b/met=
a/recipes-extended/ghostscript/ghostscript_9.52.bb
>> index 37e9ed8e84..0a2f9f5046 100644
>> --- a/meta/recipes-extended/ghostscript/ghostscript_9.52.bb
>> +++ b/meta/recipes-extended/ghostscript/ghostscript_9.52.bb
>> @@ -41,6 +41,9 @@ SRC_URI_BASE =3D "https://github.com/ArtifexSoftware/g=
hostpdl-downloads/releases/d
>>                  file://CVE-2021-3781_3.patch \
>>                  file://CVE-2023-28879.patch \
>>                  file://0001-Bug-706897-Copy-pcx-buffer-overrun-fix-from=
-devices-.patch \
>> +                file://CVE-2023-36664-pre1.patch \
>> +                file://CVE-2023-36664-1.patch \
>> +                file://CVE-2023-36664-2.patch \
>>  "
>>
>>  SRC_URI =3D "${SRC_URI_BASE} \
>> --
>> 2.25.1
>>

