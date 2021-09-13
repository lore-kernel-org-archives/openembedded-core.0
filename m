Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
 by mx.groups.io with SMTP id smtpd.web12.1079.1631558074514777270
 for <openembedded-core@lists.openembedded.org>;
 Mon, 13 Sep 2021 11:34:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=HD4seQIr;
 spf=softfail (domain: sakoman.com, ip: 209.85.128.47, mailfrom: steve@sakoman.com)
Received: by mail-wm1-f47.google.com with SMTP id 196-20020a1c04cd000000b002fa489ffe1fso68132wme.4
        for <openembedded-core@lists.openembedded.org>; Mon, 13 Sep 2021 11:34:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=6YDONHALvy4Q/GFUlZnlzsxSDM5SEWS3xWrL4U3J/AY=;
        b=HD4seQIr6Gm+pmSbu8N5A5+zFQW9845QLujahmi24jSfAYuSYeLN9vHdhim64UgaxH
         VhkLQE6CmfaRGamcn4j61DngP4JZ04Rw2zFm3ywCaZBbVFAg8NwyMte0I+Th6QsIcGsh
         jN57yS6B3Gq3agSUoDVpH59Ni853DvICPFcO2Mm45xwxpgT5HPUkAPgIvPLjc26dEhB5
         jbWK6cguA0y9NtdABEhv8Z9Venhp+9XvDpw92TZwV9DyVTTICNT4e1p1muz3glSV9/eC
         uFxMZUBw/ghOc3BkHyqg/S72TlhsyOraYsN/nJdmIbh+5PTPp4FijA7O8clSNr3MK7EY
         pEtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=6YDONHALvy4Q/GFUlZnlzsxSDM5SEWS3xWrL4U3J/AY=;
        b=IIQ1bhriuohGYltrcVmhoVsgm05OSTfz9RCcB687M8xF/ibFHi3bHwzMPZ3t0I3xRk
         7I2phYxMAew9jr+MRXzdGd54bmAomDiutFREFhDB46lqqQp95wGUV2z/T4Lp0U9ToMKU
         9jL4Q4w3q03ovQ9AwrOiKcxIMVYWy9jDV9c07nMwqrHFCzcQUv9jifHDq0eckMML/Ua3
         4epNe6h9TBJHsY4/axk0Rk5eRChIA1qIZS2FFNYrXMD39ouzGrR94a2PFqc3kSknxVbq
         sAVd97zjcqlweikcUJDYKeaJgz1rXpUjjsVYRhq9u8e4Rzloj1n1WHS40HtqUZd3sV7D
         8kzg==
X-Gm-Message-State: AOAM531zSOF8onBkrmeu4Kpa5Kg92tm8YK+WwVK+VPz9PWzCSd4YMxE6
	xxXGB6YLcuzY69Ul6YpoTYr2cD4Q8sXcDdQVnIOGNA==
X-Google-Smtp-Source: ABdhPJy9m/s5Hqfx+4/jQJ6M/5mt7rSaYa5vC364s5zk4B1REai1y4nhpcmtp7OKWu6Sq4/57wIJDFxHsX5ddkPUPpw=
X-Received: by 2002:a7b:cbc6:: with SMTP id n6mr5316475wmi.118.1631558072837;
 Mon, 13 Sep 2021 11:34:32 -0700 (PDT)
MIME-Version: 1.0
References: <20210908140219.19249-1-ranjitsinhrathod1991@gmail.com>
In-Reply-To: <20210908140219.19249-1-ranjitsinhrathod1991@gmail.com>
From: "Steve Sakoman" <steve@sakoman.com>
Date: Mon, 13 Sep 2021 08:34:20 -1000
Message-ID: <CAOSpxdann93H+W0bcErYBFY5yp1E4Wr9R6DZdmGnmX4z_miLYQ@mail.gmail.com>
Subject: Re: [OE-core] [meta][dunfell][PATCH] rpm: Handle proper return value to avoid major issues and removing unnecessary code
To: Ranjitsinh Rathod <ranjitsinhrathod1991@gmail.com>, Minjae Kim <flowergom@gmail.com>
Cc: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>, 
	Ranjitsinh Rathod <ranjitsinh.rathod@kpit.com>
Content-Type: text/plain; charset="UTF-8"

On Wed, Sep 8, 2021 at 4:02 AM Ranjitsinh Rathod
<ranjitsinhrathod1991@gmail.com> wrote:
>
> From: Ranjitsinh Rathod <ranjitsinh.rathod@kpit.com>
>
> Change in 2 patch as below to avoid critical issues
> 1) 0001-rpm-rpmio.c-restrict-virtual-memory-usage-if-limit-s.patch
> Handled return values of getrlimit() and lzma_cputhreads() functions
> to avoid unexpected behaviours like devide by zero and potential read
> of uninitialized variable 'virtual_memory'
> Upstream-Status: Pending [merge of multithreading patches to upstream]
>
> 2) CVE-2021-3421.patch
> Removed RPMSIGTAG_FILESIGNATURES and RPMSIGTAG_FILESIGNATURELENGTH as
> it is not needed during backporting of original patch.
> Upstream-Status: Backport [https://github.com/rpm-software-management/rpm/commit/d6a86b5e69e46cc283b1e06c92343319beb42e21]

Minjae, can you review this since he is modifying your CVE patch?

Thanks!

Steve

> Signed-off-by: Ranjitsinh Rathod <ranjitsinh.rathod@kpit.com>
> ---
>  ...rict-virtual-memory-usage-if-limit-s.patch | 25 ++++++++-------
>  .../rpm/files/CVE-2021-3421.patch             | 32 +++----------------
>  2 files changed, 19 insertions(+), 38 deletions(-)
>
> diff --git a/meta/recipes-devtools/rpm/files/0001-rpm-rpmio.c-restrict-virtual-memory-usage-if-limit-s.patch b/meta/recipes-devtools/rpm/files/0001-rpm-rpmio.c-restrict-virtual-memory-usage-if-limit-s.patch
> index 6454785254..dc3f74fecd 100644
> --- a/meta/recipes-devtools/rpm/files/0001-rpm-rpmio.c-restrict-virtual-memory-usage-if-limit-s.patch
> +++ b/meta/recipes-devtools/rpm/files/0001-rpm-rpmio.c-restrict-virtual-memory-usage-if-limit-s.patch
> @@ -11,36 +11,39 @@ CPU thread.
>  Upstream-Status: Pending [merge of multithreading patches to upstream]
>
>  Signed-off-by: Peter Bergin <peter@berginkonsult.se>
> +Signed-off-by: Ranjitsinh Rathod <ranjitsinh.rathod@kpit.com>
>  ---
> - rpmio/rpmio.c | 34 ++++++++++++++++++++++++++++++++++
> - 1 file changed, 34 insertions(+)
> + rpmio/rpmio.c | 36 ++++++++++++++++++++++++++++++++++++
> + 1 file changed, 36 insertions(+)
>
>  diff --git a/rpmio/rpmio.c b/rpmio/rpmio.c
>  index e051c98..b3c56b6 100644
>  --- a/rpmio/rpmio.c
>  +++ b/rpmio/rpmio.c
> -@@ -845,6 +845,40 @@ static LZFILE *lzopen_internal(const char *mode, int fd, int xz)
> +@@ -845,6 +845,42 @@ static LZFILE *lzopen_internal(const char *mode, int fd, int xz)
>                 }
>   #endif
>
> -+              struct rlimit virtual_memory;
> -+              getrlimit(RLIMIT_AS, &virtual_memory);
> -+              if (virtual_memory.rlim_cur != RLIM_INFINITY) {
> ++              struct rlimit virtual_memory = {RLIM_INFINITY , RLIM_INFINITY};
> ++              int status = getrlimit(RLIMIT_AS, &virtual_memory);
> ++              if ((status != -1) && (virtual_memory.rlim_cur != RLIM_INFINITY)) {
>  +                      const uint64_t virtual_memlimit = virtual_memory.rlim_cur;
> ++                      uint32_t threads_max = lzma_cputhreads();
>  +                      const uint64_t virtual_memlimit_per_cpu_thread =
> -+                              virtual_memlimit / lzma_cputhreads();
> -+                      uint64_t memory_usage_virt;
> ++                              virtual_memlimit / ((threads_max == 0) ? 1 : threads_max);
>  +                      rpmlog(RPMLOG_NOTICE, "XZ: virtual memory restricted to %lu and "
>  +                             "per CPU thread %lu\n", virtual_memlimit, virtual_memlimit_per_cpu_thread);
> ++                      uint64_t memory_usage_virt;
>  +                      /* keep reducing the number of compression threads until memory
>  +                         usage falls below the limit per CPU thread*/
>  +                      while ((memory_usage_virt = lzma_stream_encoder_mt_memusage(&mt_options)) >
>  +                             virtual_memlimit_per_cpu_thread) {
> -+                              /* If number of threads goes down to zero lzma_stream_encoder will
> -+                               * will return UINT64_MAX. We must check here to avoid an infinite loop.
> ++                              /* If number of threads goes down to zero or in case of any other error
> ++                               * lzma_stream_encoder_mt_memusage will return UINT64_MAX. We must check
> ++                               * for both the cases here to avoid an infinite loop.
>  +                               * If we get into situation that one thread requires more virtual memory
>  +                               * than available we set one thread, print error message and try anyway. */
> -+                              if (--mt_options.threads == 0) {
> ++                              if ((--mt_options.threads == 0) || (memory_usage_virt == UINT64_MAX)) {
>  +                                      mt_options.threads = 1;
>  +                                      rpmlog(RPMLOG_WARNING,
>  +                                             "XZ: Could not adjust number of threads to get below "
> diff --git a/meta/recipes-devtools/rpm/files/CVE-2021-3421.patch b/meta/recipes-devtools/rpm/files/CVE-2021-3421.patch
> index b1a05b6863..d2ad5eabac 100644
> --- a/meta/recipes-devtools/rpm/files/CVE-2021-3421.patch
> +++ b/meta/recipes-devtools/rpm/files/CVE-2021-3421.patch
> @@ -22,16 +22,16 @@ Fixes: CVE-2021-3421, CVE-2021-20271
>  Upstream-Status: Backport [https://github.com/rpm-software-management/rpm/commit/d6a86b5e69e46cc283b1e06c92343319beb42e21]
>  CVE: CVE-2021-3421
>  Signed-off-by: Minjae Kim <flowergom@gmail.com>
> +Signed-off-by: Ranjitsinh Rathod <ranjitsinh.rathod@kpit.com>
>  ---
> - lib/package.c | 115 ++++++++++++++++++++++++--------------------------
> - lib/rpmtag.h  |   4 ++
> - 2 files changed, 58 insertions(+), 61 deletions(-)
> + lib/package.c | 113 ++++++++++++++++++++++++--------------------------
> + 1 file changed, 52 insertions(+), 61 deletions(-)
>
>  diff --git a/lib/package.c b/lib/package.c
>  index 081123d84e..7c26ea323f 100644
>  --- a/lib/package.c
>  +++ b/lib/package.c
> -@@ -20,76 +20,68 @@
> +@@ -20,76 +20,67 @@
>
>   #include "debug.h"
>
> @@ -46,8 +46,6 @@ index 081123d84e..7c26ea323f 100644
>  +    { RPMSIGTAG_GPG, RPMTAG_SIGGPG, 0 },
>  +    /* { RPMSIGTAG_PGP5, RPMTAG_SIGPGP5, 0 }, */ /* long obsolete, dont use */
>  +    { RPMSIGTAG_PAYLOADSIZE, RPMTAG_ARCHIVESIZE, 1 },
> -+    { RPMSIGTAG_FILESIGNATURES, RPMTAG_FILESIGNATURES, 0 },
> -+    { RPMSIGTAG_FILESIGNATURELENGTH, RPMTAG_FILESIGNATURELENGTH, 1 },
>  +    { RPMSIGTAG_SHA1, RPMTAG_SHA1HEADER, 1 },
>  +    { RPMSIGTAG_SHA256, RPMTAG_SHA256HEADER, 1 },
>  +    { RPMSIGTAG_DSA, RPMTAG_DSAHEADER, 0 },
> @@ -61,6 +59,7 @@ index 081123d84e..7c26ea323f 100644
>    * Translate and merge legacy signature tags into header.
>    * @param h           header (dest)
>    * @param sigh                signature header (src)
> ++ * @return            failing tag number, 0 on success
>    */
>   static
>  -void headerMergeLegacySigs(Header h, Header sigh)
> @@ -170,27 +169,6 @@ index 081123d84e..7c26ea323f 100644
>             applyRetrofits(h);
>
>             /* Bump reference count for return. */
> -diff --git a/lib/rpmtag.h b/lib/rpmtag.h
> -index 8c718b31b5..d562572c6f 100644
> ---- a/lib/rpmtag.h
> -+++ b/lib/rpmtag.h
> -@@ -65,6 +65,8 @@ typedef enum rpmTag_e {
> -     RPMTAG_LONGARCHIVESIZE    = RPMTAG_SIG_BASE+15,   /* l */
> -     /* RPMTAG_SIG_BASE+16 reserved */
> -     RPMTAG_SHA256HEADER               = RPMTAG_SIG_BASE+17,   /* s */
> -+    /* RPMTAG_SIG_BASE+18 reserved for RPMSIGTAG_FILESIGNATURES */
> -+    /* RPMTAG_SIG_BASE+19 reserved for RPMSIGTAG_FILESIGNATURELENGTH */
> -
> -     RPMTAG_NAME               = 1000, /* s */
> - #define       RPMTAG_N        RPMTAG_NAME     /* s */
> -@@ -422,6 +424,8 @@ typedef enum rpmSigTag_e {
> -     RPMSIGTAG_LONGSIZE        = RPMTAG_LONGSIGSIZE,   /*!< internal Header+Payload size (64bit) in bytes. */
> -     RPMSIGTAG_LONGARCHIVESIZE = RPMTAG_LONGARCHIVESIZE, /*!< internal uncompressed payload size (64bit) in bytes. */
> -     RPMSIGTAG_SHA256  = RPMTAG_SHA256HEADER,
> -+    RPMSIGTAG_FILESIGNATURES            = RPMTAG_SIG_BASE + 18,
> -+    RPMSIGTAG_FILESIGNATURELENGTH       = RPMTAG_SIG_BASE + 19,
> - } rpmSigTag;
> -
>
>  --
>  2.17.1
> --
> 2.17.1
>
>
> 
>
