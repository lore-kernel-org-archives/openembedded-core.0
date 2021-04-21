Received: from mail-vk1-f181.google.com (mail-vk1-f181.google.com [209.85.221.181])
 by mx.groups.io with SMTP id smtpd.web11.3402.1619040109317386763
 for <openembedded-core@lists.openembedded.org>;
 Wed, 21 Apr 2021 14:21:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=ZYj0am6O;
 spf=pass (domain: gmail.com, ip: 209.85.221.181, mailfrom: alex.kanavin@gmail.com)
Received: by mail-vk1-f181.google.com with SMTP id q143so4720788vka.13
        for <openembedded-core@lists.openembedded.org>; Wed, 21 Apr 2021 14:21:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Sw28wU7fMcA67tYfJ7+mw5LPsnTYXV2jk+IVW8PbkeI=;
        b=ZYj0am6ORv+N/NuDqpJHFcNiC/5Xc17YKn0YbJUj76m0xHxQ7KJmV8OOs8Wo3xcJP0
         rgpNlMFs50iFwTOuTC4BTT4LUEPJLWDM1UVCcLXEKu5ko8DQuWiXUsHJ22Tr8iZMdTQ6
         JaMCSDOjAPcrgoui7O9dYg3bf+o46WHFk4jkcl3SE1JROkWKm2cX8Ng570KMnL0FETeq
         GXL1W/azqtMFIiagouGV2aVxnUjEcAbZexC5nAKmlYxuaih+gme1FYtmzNcJJCcNLIwd
         osYsmp7LxgEAAP8O/6Saga7t4yDv2wEgIWc9SiBrgN2qrn1qhQWlpDMQmfxRUaguClnT
         JJkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Sw28wU7fMcA67tYfJ7+mw5LPsnTYXV2jk+IVW8PbkeI=;
        b=m3EM65GwgyM5tpdXOiA0pbMJ8WCtuLjudGLqe0IpN9Cc1kGLmv8bTtVV6/jr1idbPG
         fkzDiAW9+bl+0HnF/PKpcsMXwdoEw3ndrXas3tGvW+NXOUuTMiNQOcUknEEK5y6ntX7S
         8t/Q029bBmB6HjYvfviXHxP5qEyz/qsONiNCuGylBgzWTap8AKhPCWj37oZKjqB5EWDd
         PTO0JkN3v5hTZW2iOYi6zwd8CIKOK70hyQ6x75OYju76z9uAvH4mPQC7HzDg32BlAI0V
         nkzVdSsKbacejnticeXgF6WFcEcdAwPmRZS2n5FTIt+gyyLRYOWS1i4evLLFgeOZlkQA
         myuw==
X-Gm-Message-State: AOAM531bcEsdYl1IRvuaVywldpvu4g3GA7zT5EAd17czXdfS2U0jqQvJ
	WAwNu4ijDBQX1E57EVnRniOJkK3i5GtUJEU7x8w=
X-Google-Smtp-Source: ABdhPJzfGpACQaEofJ3UclbsGH2sNnQ1i/uJYJ/Z0NkVpLqYGX+Xr5gxj3sEBnW20I6KpSELyqTYn+y8JPHcyH4YHcc=
X-Received: by 2002:a1f:4581:: with SMTP id s123mr90932vka.10.1619040108510;
 Wed, 21 Apr 2021 14:21:48 -0700 (PDT)
MIME-Version: 1.0
References: <20210421192817.1718155-1-raj.khem@gmail.com>
In-Reply-To: <20210421192817.1718155-1-raj.khem@gmail.com>
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
Date: Wed, 21 Apr 2021 23:21:37 +0200
Message-ID: <CANNYZj_OvzT11ThhvKu4pfEK3Qe6rf-GYLhxMG3SKFe0kh8X2w@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] elfutils: Make 64bit time_t fix generic
To: Khem Raj <raj.khem@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="0000000000008b83df05c082264c"

--0000000000008b83df05c082264c
Content-Type: text/plain; charset="UTF-8"

Thanks Khem.

Alex

On Wed, 21 Apr 2021 at 21:28, Khem Raj <raj.khem@gmail.com> wrote:

> Apply it always since more than x32 needs it
>
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>  .../elfutils/elfutils_0.183.bb                |  4 +--
>  ...infod-client.c-correct-string-format.patch | 32 +++++++++++++------
>  2 files changed, 24 insertions(+), 12 deletions(-)
>
> diff --git a/meta/recipes-devtools/elfutils/elfutils_0.183.bb
> b/meta/recipes-devtools/elfutils/elfutils_0.183.bb
> index dfc3a3fa5b..7aebaf1b6d 100644
> --- a/meta/recipes-devtools/elfutils/elfutils_0.183.bb
> +++ b/meta/recipes-devtools/elfutils/elfutils_0.183.bb
> @@ -22,6 +22,7 @@ SRC_URI = "
> https://sourceware.org/elfutils/ftp/${PV}/${BP}.tar.bz2 \
>             file://ptest.patch \
>
> file://0001-tests-Makefile.am-compile-test_nlist-with-standard-C.patch \
>             file://0001-add-support-for-ipkg-to-debuginfod.cxx.patch \
> +
>  file://0001-debuginfod-debuginfod-client.c-correct-string-format.patch \
>             "
>  SRC_URI_append_libc-musl = " \
>             file://0002-musl-libs.patch \
> @@ -29,9 +30,6 @@ SRC_URI_append_libc-musl = " \
>             file://0004-Fix-error-on-musl.patch \
>             file://0015-config-eu.am-do-not-use-Werror.patch \
>             "
> -SRC_URI_append_x86-x32 = " \
> -
>  file://0001-debuginfod-debuginfod-client.c-correct-string-format.patch \
> -           "
>  SRC_URI[sha256sum] =
> "c3637c208d309d58714a51e61e63f1958808fead882e9b607506a29e5474f2c5"
>
>  inherit autotools gettext ptest pkgconfig
> diff --git
> a/meta/recipes-devtools/elfutils/files/0001-debuginfod-debuginfod-client.c-correct-string-format.patch
> b/meta/recipes-devtools/elfutils/files/0001-debuginfod-debuginfod-client.c-correct-string-format.patch
> index a2737b9fe6..5bd6ba961c 100644
> ---
> a/meta/recipes-devtools/elfutils/files/0001-debuginfod-debuginfod-client.c-correct-string-format.patch
> +++
> b/meta/recipes-devtools/elfutils/files/0001-debuginfod-debuginfod-client.c-correct-string-format.patch
> @@ -1,16 +1,27 @@
> -From f4231bfbb61cd4962638766a7072f4295ed39150 Mon Sep 17 00:00:00 2001
> +From 14dfe84943b8f9e6f504536d8735ef6356210b40 Mon Sep 17 00:00:00 2001
>  From: Alexander Kanavin <alex.kanavin@gmail.com>
>  Date: Mon, 19 Apr 2021 23:29:10 +0200
> -Subject: [PATCH] debuginfod/debuginfod-client.c: correct string format on
> x32
> +Subject: [PATCH] debuginfod/debuginfod-client.c: correct string format on
> + 32bit arches with 64bit time_t
> +
> +Use intmax_t to print time_t
> +
> +time_t is platform dependent and some of architectures e.g.
> +x32, riscv32, arc use 64bit time_t even while they are 32bit
> +architectures, therefore directly using integer printf formats will not
> +work portably, use intmax_t to typecast time_t into printf family of
> +functions
> +
> +Upstream-Status: Pending
>
> -Upstream-Status: Inappropriate [x32-specific; few, if any people care
> about it anymore]
>  Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
> +Signed-off-by: Khem Raj <raj.khem@gmail.com>
>  ---
>   debuginfod/debuginfod-client.c | 10 +++++-----
>   1 file changed, 5 insertions(+), 5 deletions(-)
>
>  diff --git a/debuginfod/debuginfod-client.c
> b/debuginfod/debuginfod-client.c
> -index de26af5..a840f23 100644
> +index de26af5..39e28f2 100644
>  --- a/debuginfod/debuginfod-client.c
>  +++ b/debuginfod/debuginfod-client.c
>  @@ -229,7 +229,7 @@ debuginfod_init_cache (char *cache_path, char
> *interval_path, char *maxage_path)
> @@ -18,7 +29,7 @@ index de26af5..a840f23 100644
>       return -errno;
>
>  -  if (dprintf(fd, "%ld", cache_clean_default_interval_s) < 0)
> -+  if (dprintf(fd, "%lld", cache_clean_default_interval_s) < 0)
> ++  if (dprintf(fd, "%jd", (intmax_t)cache_clean_default_interval_s) < 0)
>       return -errno;
>
>     /* init max age config file.  */
> @@ -27,7 +38,7 @@ index de26af5..a840f23 100644
>       return -errno;
>
>  -  if (dprintf(fd, "%ld", cache_default_max_unused_age_s) < 0)
> -+  if (dprintf(fd, "%lld", cache_default_max_unused_age_s) < 0)
> ++  if (dprintf(fd, "%jd", (intmax_t)cache_default_max_unused_age_s) < 0)
>       return -errno;
>
>     return 0;
> @@ -36,7 +47,7 @@ index de26af5..a840f23 100644
>           return -errno;
>
>  -      int rc = fprintf(interval_file, "%ld",
> cache_clean_default_interval_s);
> -+      int rc = fprintf(interval_file, "%lld",
> cache_clean_default_interval_s);
> ++      int rc = fprintf(interval_file, "%jd",
> (intmax_t)cache_clean_default_interval_s);
>         fclose(interval_file);
>
>         if (rc < 0)
> @@ -45,7 +56,7 @@ index de26af5..a840f23 100644
>     if (interval_file)
>       {
>  -      if (fscanf(interval_file, "%ld", &clean_interval) != 1)
> -+      if (fscanf(interval_file, "%lld", &clean_interval) != 1)
> ++      if (fscanf(interval_file, "%jd", (intmax_t*)(&clean_interval)) !=
> 1)
>           clean_interval = cache_clean_default_interval_s;
>         fclose(interval_file);
>       }
> @@ -54,7 +65,10 @@ index de26af5..a840f23 100644
>     if (max_unused_file)
>       {
>  -      if (fscanf(max_unused_file, "%ld", &max_unused_age) != 1)
> -+      if (fscanf(max_unused_file, "%lld", &max_unused_age) != 1)
> ++      if (fscanf(max_unused_file, "%jd", (intmax_t*)(&max_unused_age))
> != 1)
>           max_unused_age = cache_default_max_unused_age_s;
>         fclose(max_unused_file);
>       }
> +--
> +2.31.1
> +
> --
> 2.31.1
>
>
> 
>
>

--0000000000008b83df05c082264c
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Thanks Khem.</div><div><br></div><div>Alex<br></div><=
/div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">O=
n Wed, 21 Apr 2021 at 21:28, Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.=
com">raj.khem@gmail.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_=
quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,=
204);padding-left:1ex">Apply it always since more than x32 needs it<br>
<br>
Signed-off-by: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com" target=
=3D"_blank">raj.khem@gmail.com</a>&gt;<br>
---<br>
=C2=A0.../elfutils/<a href=3D"http://elfutils_0.183.bb" rel=3D"noreferrer"=
 target=3D"_blank">elfutils_0.183.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=
=C2=A0 =C2=A0 =C2=A0 |=C2=A0 4 +--<br>
=C2=A0...infod-client.c-correct-string-format.patch | 32 +++++++++++++----=
--<br>
=C2=A02 files changed, 24 insertions(+), 12 deletions(-)<br>
<br>
diff --git a/meta/recipes-devtools/elfutils/<a href=3D"http://elfutils_0.1=
83.bb" rel=3D"noreferrer" target=3D"_blank">elfutils_0.183.bb</a> b/meta/re=
cipes-devtools/elfutils/<a href=3D"http://elfutils_0.183.bb" rel=3D"norefer=
rer" target=3D"_blank">elfutils_0.183.bb</a><br>
index dfc3a3fa5b..7aebaf1b6d 100644<br>
--- a/meta/recipes-devtools/elfutils/<a href=3D"http://elfutils_0.183.bb" =
rel=3D"noreferrer" target=3D"_blank">elfutils_0.183.bb</a><br>
+++ b/meta/recipes-devtools/elfutils/<a href=3D"http://elfutils_0.183.bb" =
rel=3D"noreferrer" target=3D"_blank">elfutils_0.183.bb</a><br>
@@ -22,6 +22,7 @@ SRC_URI =3D &quot;<a href=3D"https://sourceware.org/elfu=
tils/ftp/$%7BPV%7D/$%7BBP%7D.tar.bz2" rel=3D"noreferrer" target=3D"_blank">=
https://sourceware.org/elfutils/ftp/${PV}/${BP}.tar.bz2</a> \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://ptest.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0001-tests-Makefile.am-co=
mpile-test_nlist-with-standard-C.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0001-add-support-for-ipkg=
-to-debuginfod.cxx.patch \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0001-debuginfod-debuginfo=
d-client.c-correct-string-format.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;<br>
=C2=A0SRC_URI_append_libc-musl =3D &quot; \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0002-musl-libs.patch \<br=
>
@@ -29,9 +30,6 @@ SRC_URI_append_libc-musl =3D &quot; \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0004-Fix-error-on-musl.pa=
tch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0015-config-eu.am-do-not-=
use-Werror.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;<br>
-SRC_URI_append_x86-x32 =3D &quot; \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0001-debuginfod-debuginfo=
d-client.c-correct-string-format.patch \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;<br>
=C2=A0SRC_URI[sha256sum] =3D &quot;c3637c208d309d58714a51e61e63f1958808fea=
d882e9b607506a29e5474f2c5&quot;<br>
<br>
=C2=A0inherit autotools gettext ptest pkgconfig<br>
diff --git a/meta/recipes-devtools/elfutils/files/0001-debuginfod-debuginf=
od-client.c-correct-string-format.patch b/meta/recipes-devtools/elfutils/fi=
les/0001-debuginfod-debuginfod-client.c-correct-string-format.patch<br>
index a2737b9fe6..5bd6ba961c 100644<br>
--- a/meta/recipes-devtools/elfutils/files/0001-debuginfod-debuginfod-clie=
nt.c-correct-string-format.patch<br>
+++ b/meta/recipes-devtools/elfutils/files/0001-debuginfod-debuginfod-clie=
nt.c-correct-string-format.patch<br>
@@ -1,16 +1,27 @@<br>
-From f4231bfbb61cd4962638766a7072f4295ed39150 Mon Sep 17 00:00:00 2001<br=
>
+From 14dfe84943b8f9e6f504536d8735ef6356210b40 Mon Sep 17 00:00:00 2001<br=
>
=C2=A0From: Alexander Kanavin &lt;<a href=3D"mailto:alex.kanavin@gmail.com=
" target=3D"_blank">alex.kanavin@gmail.com</a>&gt;<br>
=C2=A0Date: Mon, 19 Apr 2021 23:29:10 +0200<br>
-Subject: [PATCH] debuginfod/debuginfod-client.c: correct string format on=
 x32<br>
+Subject: [PATCH] debuginfod/debuginfod-client.c: correct string format on=
<br>
+ 32bit arches with 64bit time_t<br>
+<br>
+Use intmax_t to print time_t<br>
+<br>
+time_t is platform dependent and some of architectures e.g.<br>
+x32, riscv32, arc use 64bit time_t even while they are 32bit<br>
+architectures, therefore directly using integer printf formats will not<b=
r>
+work portably, use intmax_t to typecast time_t into printf family of<br>
+functions<br>
+<br>
+Upstream-Status: Pending<br>
<br>
-Upstream-Status: Inappropriate [x32-specific; few, if any people care abo=
ut it anymore]<br>
=C2=A0Signed-off-by: Alexander Kanavin &lt;<a href=3D"mailto:alex.kanavin@=
gmail.com" target=3D"_blank">alex.kanavin@gmail.com</a>&gt;<br>
+Signed-off-by: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com" target=
=3D"_blank">raj.khem@gmail.com</a>&gt;<br>
=C2=A0---<br>
=C2=A0 debuginfod/debuginfod-client.c | 10 +++++-----<br>
=C2=A0 1 file changed, 5 insertions(+), 5 deletions(-)<br>
<br>
=C2=A0diff --git a/debuginfod/debuginfod-client.c b/debuginfod/debuginfod-=
client.c<br>
-index de26af5..a840f23 100644<br>
+index de26af5..39e28f2 100644<br>
=C2=A0--- a/debuginfod/debuginfod-client.c<br>
=C2=A0+++ b/debuginfod/debuginfod-client.c<br>
=C2=A0@@ -229,7 +229,7 @@ debuginfod_init_cache (char *cache_path, char *i=
nterval_path, char *maxage_path)<br>
@@ -18,7 +29,7 @@ index de26af5..a840f23 100644<br>
=C2=A0 =C2=A0 =C2=A0 return -errno;<br>
<br>
=C2=A0-=C2=A0 if (dprintf(fd, &quot;%ld&quot;, cache_clean_default_interva=
l_s) &lt; 0)<br>
-+=C2=A0 if (dprintf(fd, &quot;%lld&quot;, cache_clean_default_interval_s)=
 &lt; 0)<br>
++=C2=A0 if (dprintf(fd, &quot;%jd&quot;, (intmax_t)cache_clean_default_in=
terval_s) &lt; 0)<br>
=C2=A0 =C2=A0 =C2=A0 return -errno;<br>
<br>
=C2=A0 =C2=A0 /* init max age config file.=C2=A0 */<br>
@@ -27,7 +38,7 @@ index de26af5..a840f23 100644<br>
=C2=A0 =C2=A0 =C2=A0 return -errno;<br>
<br>
=C2=A0-=C2=A0 if (dprintf(fd, &quot;%ld&quot;, cache_default_max_unused_ag=
e_s) &lt; 0)<br>
-+=C2=A0 if (dprintf(fd, &quot;%lld&quot;, cache_default_max_unused_age_s)=
 &lt; 0)<br>
++=C2=A0 if (dprintf(fd, &quot;%jd&quot;, (intmax_t)cache_default_max_unus=
ed_age_s) &lt; 0)<br>
=C2=A0 =C2=A0 =C2=A0 return -errno;<br>
<br>
=C2=A0 =C2=A0 return 0;<br>
@@ -36,7 +47,7 @@ index de26af5..a840f23 100644<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return -errno;<br>
<br>
=C2=A0-=C2=A0 =C2=A0 =C2=A0 int rc =3D fprintf(interval_file, &quot;%ld&qu=
ot;, cache_clean_default_interval_s);<br>
-+=C2=A0 =C2=A0 =C2=A0 int rc =3D fprintf(interval_file, &quot;%lld&quot;,=
 cache_clean_default_interval_s);<br>
++=C2=A0 =C2=A0 =C2=A0 int rc =3D fprintf(interval_file, &quot;%jd&quot;, =
(intmax_t)cache_clean_default_interval_s);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 fclose(interval_file);<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (rc &lt; 0)<br>
@@ -45,7 +56,7 @@ index de26af5..a840f23 100644<br>
=C2=A0 =C2=A0 if (interval_file)<br>
=C2=A0 =C2=A0 =C2=A0 {<br>
=C2=A0-=C2=A0 =C2=A0 =C2=A0 if (fscanf(interval_file, &quot;%ld&quot;, &am=
p;clean_interval) !=3D 1)<br>
-+=C2=A0 =C2=A0 =C2=A0 if (fscanf(interval_file, &quot;%lld&quot;, &amp;cl=
ean_interval) !=3D 1)<br>
++=C2=A0 =C2=A0 =C2=A0 if (fscanf(interval_file, &quot;%jd&quot;, (intmax_=
t*)(&amp;clean_interval)) !=3D 1)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 clean_interval =3D cache_clean_default_=
interval_s;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 fclose(interval_file);<br>
=C2=A0 =C2=A0 =C2=A0 }<br>
@@ -54,7 +65,10 @@ index de26af5..a840f23 100644<br>
=C2=A0 =C2=A0 if (max_unused_file)<br>
=C2=A0 =C2=A0 =C2=A0 {<br>
=C2=A0-=C2=A0 =C2=A0 =C2=A0 if (fscanf(max_unused_file, &quot;%ld&quot;, &=
amp;max_unused_age) !=3D 1)<br>
-+=C2=A0 =C2=A0 =C2=A0 if (fscanf(max_unused_file, &quot;%lld&quot;, &amp;=
max_unused_age) !=3D 1)<br>
++=C2=A0 =C2=A0 =C2=A0 if (fscanf(max_unused_file, &quot;%jd&quot;, (intma=
x_t*)(&amp;max_unused_age)) !=3D 1)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 max_unused_age =3D cache_default_max_un=
used_age_s;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 fclose(max_unused_file);<br>
=C2=A0 =C2=A0 =C2=A0 }<br>
+-- <br>
+2.31.1<br>
+<br>
-- <br>
2.31.1<br>
<br>
<br>
<br>
<br>
</blockquote></div>

--0000000000008b83df05c082264c--
