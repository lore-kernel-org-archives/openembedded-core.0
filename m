Received: from mail-qv1-f47.google.com (mail-qv1-f47.google.com [209.85.219.47])
 by mx.groups.io with SMTP id smtpd.web11.2844.1618951648720026148
 for <openembedded-core@lists.openembedded.org>;
 Tue, 20 Apr 2021 13:47:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=GtpbgVQl;
 spf=pass (domain: gmail.com, ip: 209.85.219.47, mailfrom: raj.khem@gmail.com)
Received: by mail-qv1-f47.google.com with SMTP id l2so1454188qvb.7
        for <openembedded-core@lists.openembedded.org>; Tue, 20 Apr 2021 13:47:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=GTAmHi/YTYMw39cwZPwbzx1LfvK175vRoKG3MGVxRZY=;
        b=GtpbgVQlICnfYidxlBk2A3cQgR+4X4NY5jS7p3AS0c7kt0NgV59xcO6YvfqMpKu7pO
         +fAVKVl1If9Yi4drOUxDUHln5q7vA1MSvYmhJ057tdgkfQa8RZNJp0BggFA0AUFk5evC
         xDxr9fvkYOJm1ZeVXX/uMMoNQka7LVmC3tCyqckHIb6sSzFXSfLfqSZnXa4dYptqrjEH
         MR1I0rodHZQ/gYzvGeqoTdA25iX1X0/hpqO/qkHj63Rtpm9Bg0uAPojq6LQsmjYRCiS3
         Cn1SrjxhwJmKR66im6G16U0vKmTdxUWbui0u1/l/sMCi7o+Xsp8cF0xLnLFDUTMPDTAB
         amHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=GTAmHi/YTYMw39cwZPwbzx1LfvK175vRoKG3MGVxRZY=;
        b=BvKEtIyZuUBhcQj/hgdyrs1+ieLAxxvJ6R02oPdqe0Rdyuseo7PUlTWjSoBBg950rj
         EIMeZpXe5iFL7mV4f7zcY8lzGXTQCN0SN43+37jdTVBJ+GGl38wpvFMkOAHCleiBwPpp
         yT0zlUSb1wuzlxcuLYbDKWaYDuIxq2AzkhzP6hD3L6vcVaIskPWaOF6Z3V7KIVQsZidE
         jfc8QoERU/GVeBE9nceZMWNbiKwVHIKLOYM5Yq65uttNAEFQizvdhwn60j8SGvtv3wJ0
         vt7XOy9Y6Frcaa30Au8qkI6ogYuq4fg1OzphFGFeuzeZakcK8vE0xwpuTpEu7S+I/mBt
         t+cA==
X-Gm-Message-State: AOAM531bK5dfBPhuJcxrY/Y8WSUoQrMpmw92A8HvarzEeJOj9OENd++q
	1wk+C/8jZ6zzQ7tv/PRyutW/e1t7ceCVTb2DWL8=
X-Google-Smtp-Source: ABdhPJxWrJ7+0CfqGYNPZ05bfK9ilPFUfSgUoem0NyT/gjXKKRWukSycjfy4vp7YN92danXCqWo0/lWvnx3fQreDN7s=
X-Received: by 2002:ad4:5bef:: with SMTP id k15mr27277757qvc.16.1618951647788;
 Tue, 20 Apr 2021 13:47:27 -0700 (PDT)
MIME-Version: 1.0
References: <20210420120549.608450-1-alex.kanavin@gmail.com>
 <b79886e0-9872-b957-21b4-587b1858f9b7@gmail.com> <CANNYZj9nsis3ZWC3=A+1jmxzaGZ73f5cs0Jje3sEQ-620ffG5g@mail.gmail.com>
In-Reply-To: <CANNYZj9nsis3ZWC3=A+1jmxzaGZ73f5cs0Jje3sEQ-620ffG5g@mail.gmail.com>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Tue, 20 Apr 2021 13:47:02 -0700
Message-ID: <CAMKF1srM-uc6-rGK6tdyihZgYBYRs0kQANxwu7jVsfJYPPU7EA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 1/2] elfutils: correct debuginfod builds on x32
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

On Tue, Apr 20, 2021 at 10:34 AM Alexander Kanavin
<alex.kanavin@gmail.com> wrote:
>
> Then the patch needs to guard %lld only for those architectures, and I am not sure how to do that.
>

look into using intmax_t type for representing these variables and use
%jd in printf formatting string

> Alex
>
> On Tue, 20 Apr 2021 at 17:59, Khem Raj <raj.khem@gmail.com> wrote:
>>
>>
>>
>> On 4/20/21 5:05 AM, Alexander Kanavin wrote:
>> > Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
>> > ---
>> >   .../elfutils/elfutils_0.183.bb                |  3 +
>> >   ...infod-client.c-correct-string-format.patch | 60 +++++++++++++++++++
>> >   2 files changed, 63 insertions(+)
>> >   create mode 100644 meta/recipes-devtools/elfutils/files/0001-debuginfod-debuginfod-client.c-correct-string-format.patch
>> >
>> > diff --git a/meta/recipes-devtools/elfutils/elfutils_0.183.bb b/meta/recipes-devtools/elfutils/elfutils_0.183.bb
>> > index 8b1dece200..a4ea8da32e 100644
>> > --- a/meta/recipes-devtools/elfutils/elfutils_0.183.bb
>> > +++ b/meta/recipes-devtools/elfutils/elfutils_0.183.bb
>> > @@ -29,6 +29,9 @@ SRC_URI_append_libc-musl = " \
>> >              file://0004-Fix-error-on-musl.patch \
>> >              file://0015-config-eu.am-do-not-use-Werror.patch \
>> >              "
>> > +SRC_URI_append_x86-x32 = " \
>> > +           file://0001-debuginfod-debuginfod-client.c-correct-string-format.patch \
>> > +           "
>> >   SRC_URI[sha256sum] = "c3637c208d309d58714a51e61e63f1958808fead882e9b607506a29e5474f2c5"
>> >
>> >   inherit autotools gettext ptest pkgconfig
>> > diff --git a/meta/recipes-devtools/elfutils/files/0001-debuginfod-debuginfod-client.c-correct-string-format.patch b/meta/recipes-devtools/elfutils/files/0001-debuginfod-debuginfod-client.c-correct-string-format.patch
>> > new file mode 100644
>> > index 0000000000..a2737b9fe6
>> > --- /dev/null
>> > +++ b/meta/recipes-devtools/elfutils/files/0001-debuginfod-debuginfod-client.c-correct-string-format.patch
>> > @@ -0,0 +1,60 @@
>> > +From f4231bfbb61cd4962638766a7072f4295ed39150 Mon Sep 17 00:00:00 2001
>> > +From: Alexander Kanavin <alex.kanavin@gmail.com>
>> > +Date: Mon, 19 Apr 2021 23:29:10 +0200
>> > +Subject: [PATCH] debuginfod/debuginfod-client.c: correct string format on x32
>> > +
>> > +Upstream-Status: Inappropriate [x32-specific; few, if any people care about it anymore]
>>
>> This is worth upstreaming, since 32 bit architectures with 64bit time_t
>> will need.
>>
>> > +Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
>> > +---
>> > + debuginfod/debuginfod-client.c | 10 +++++-----
>> > + 1 file changed, 5 insertions(+), 5 deletions(-)
>> > +
>> > +diff --git a/debuginfod/debuginfod-client.c b/debuginfod/debuginfod-client.c
>> > +index de26af5..a840f23 100644
>> > +--- a/debuginfod/debuginfod-client.c
>> > ++++ b/debuginfod/debuginfod-client.c
>> > +@@ -229,7 +229,7 @@ debuginfod_init_cache (char *cache_path, char *interval_path, char *maxage_path)
>> > +   if (fd < 0)
>> > +     return -errno;
>> > +
>> > +-  if (dprintf(fd, "%ld", cache_clean_default_interval_s) < 0)
>> > ++  if (dprintf(fd, "%lld", cache_clean_default_interval_s) < 0)
>> > +     return -errno;
>> > +
>> > +   /* init max age config file.  */
>> > +@@ -237,7 +237,7 @@ debuginfod_init_cache (char *cache_path, char *interval_path, char *maxage_path)
>> > +       && (fd = open(maxage_path, O_CREAT | O_RDWR, DEFFILEMODE)) < 0)
>> > +     return -errno;
>> > +
>> > +-  if (dprintf(fd, "%ld", cache_default_max_unused_age_s) < 0)
>> > ++  if (dprintf(fd, "%lld", cache_default_max_unused_age_s) < 0)
>> > +     return -errno;
>> > +
>> > +   return 0;
>> > +@@ -263,7 +263,7 @@ debuginfod_clean_cache(debuginfod_client *c,
>> > +       if (interval_file == NULL)
>> > +         return -errno;
>> > +
>> > +-      int rc = fprintf(interval_file, "%ld", cache_clean_default_interval_s);
>> > ++      int rc = fprintf(interval_file, "%lld", cache_clean_default_interval_s);
>> > +       fclose(interval_file);
>> > +
>> > +       if (rc < 0)
>> > +@@ -275,7 +275,7 @@ debuginfod_clean_cache(debuginfod_client *c,
>> > +   interval_file = fopen(interval_path, "r");
>> > +   if (interval_file)
>> > +     {
>> > +-      if (fscanf(interval_file, "%ld", &clean_interval) != 1)
>> > ++      if (fscanf(interval_file, "%lld", &clean_interval) != 1)
>> > +         clean_interval = cache_clean_default_interval_s;
>> > +       fclose(interval_file);
>> > +     }
>> > +@@ -291,7 +291,7 @@ debuginfod_clean_cache(debuginfod_client *c,
>> > +   max_unused_file = fopen(max_unused_path, "r");
>> > +   if (max_unused_file)
>> > +     {
>> > +-      if (fscanf(max_unused_file, "%ld", &max_unused_age) != 1)
>> > ++      if (fscanf(max_unused_file, "%lld", &max_unused_age) != 1)
>> > +         max_unused_age = cache_default_max_unused_age_s;
>> > +       fclose(max_unused_file);
>> > +     }
>> >
>> >
>> >
>> > 
>> >
