Return-Path: <armccurdy@gmail.com>
Received: from mail-ua1-f67.google.com (mail-ua1-f67.google.com
	[209.85.222.67])
	by mail.openembedded.org (Postfix) with ESMTP id 2CC6278AB6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 19 Sep 2018 23:02:17 +0000 (UTC)
Received: by mail-ua1-f67.google.com with SMTP id o11-v6so3578221uak.5
	for <openembedded-core@lists.openembedded.org>;
	Wed, 19 Sep 2018 16:02:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=4FzYlBAJyOiNOprn+YzfYlOU2jEiv11pyV6NGL19PG8=;
	b=oZEanqsw2K/AV4H/1m4K8B/Co3GR4NVdSFKpvP5FaBM2UVagPJKjwMqmyei7tNGAB3
	/hZBZbMeWgiiHqRmOUAKMsDX6E68qwMdssw07nraABLQU0lOSQ3QvduYAmuqtpFyQbiO
	u8B8PghCUM5vqk28F7DXRn1KkbYp8Q7nPOelIpby/b8k3CTnieybZ9OiaEz+NIeHSeJU
	3o7OrY2M6I2Gp4Okdvt+u416LPjHc1KZvwvMELFx4IooqP6A0JtEjlYfocV4cobp0w+A
	032FsUS06LCJO774e22wx/yCDbCuFHi8eA/h8gk3hG29C4fDDKOO5Isl/yoHNYACRiJO
	l1hQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=4FzYlBAJyOiNOprn+YzfYlOU2jEiv11pyV6NGL19PG8=;
	b=tyJHpN0DRT/kulAMZUdo80gk/oGU1kYy0vgu1aG57S3HvmimbDz7Fkg0Pk3GIlg667
	T6L+M+lflV+4C+YFPB9ox+PVZi+gLu1S51t8rAlbFkIN2jjLik/v/vY5djYHu79JUdD+
	lA7/rGu4sLdCfmtbTaNzFBGgukZm8V/MsnbLhlzapQ2xNx4jEmXQcE/WxSSGb4VcmjwR
	2voPJk9Bxxmig7tjGaSGmp71/7MaWzsooKmXhnnxcFIb/YSCiVTpghozedVzooRnRAgu
	upC3xMcIfhNOxJRglKFL3n/ht9vGPTMutPYpkH7dWG2IKb8pu1JU6tzHPoBQlcdA8q3R
	MjZA==
X-Gm-Message-State: APzg51AgfuS+mfpcQV4bwr1JjeBKaTHouYDNVTxksuG0bHdinvDAQRSY
	NX9BjUno5oAcl7vObaOa+4RRLQIiLMRGkumPLlY=
X-Google-Smtp-Source: ANB0VdaQWgRkG/gPPFS7J3bDPKvQXL+iKvTz1XaSkwma8OHykUgp06qOUCyibSI8hSvj+JzUCdpVz5+jh1K9DiRCETc=
X-Received: by 2002:ab0:5c0c:: with SMTP id
	q12-v6mr11279456uaf.134.1537398138928; 
	Wed, 19 Sep 2018 16:02:18 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:ab0:2904:0:0:0:0:0 with HTTP; Wed, 19 Sep 2018 16:02:18
	-0700 (PDT)
In-Reply-To: <1537391156-12937-1-git-send-email-peter@berginkonsult.se>
References: <1537391156-12937-1-git-send-email-peter@berginkonsult.se>
From: Andre McCurdy <armccurdy@gmail.com>
Date: Wed, 19 Sep 2018 16:02:18 -0700
Message-ID: <CAJ86T=WkK3t3RBbOpuxfy0mHjRL1dRetV0fAQ1VQgOhJb3XirQ@mail.gmail.com>
To: Peter Bergin <peter@berginkonsult.se>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] rpm: handle virtual memory usage when limit is set
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
X-List-Received-Date: Wed, 19 Sep 2018 23:02:18 -0000
Content-Type: text/plain; charset="UTF-8"

On Wed, Sep 19, 2018 at 2:05 PM, Peter Bergin <peter@berginkonsult.se> wrote:
> Fix the situation where the task do_package_write_rpm ends up in
> "liblzma: memory allocation failed". This happens if the host
> environment has set a limit on virtual_memory for the user with
> 'ulimit -v' for packages with a lot of binary packages, e.g. glibc-locale.
>
> Upstream-Status: Inappropriate [error introduced by oe-core patch on rpm]
>
> Signed-off-by: Peter Bergin <peter@berginkonsult.se>
> ---
>  ...estrict-virtual-memory-usage-if-limit-set.patch | 52 ++++++++++++++++++++++
>  meta/recipes-devtools/rpm/rpm_4.14.2.bb            |  1 +
>  2 files changed, 53 insertions(+)
>  create mode 100644 meta/recipes-devtools/rpm/files/0001-rpm-restrict-virtual-memory-usage-if-limit-set.patch
>
> diff --git a/meta/recipes-devtools/rpm/files/0001-rpm-restrict-virtual-memory-usage-if-limit-set.patch b/meta/recipes-devtools/rpm/files/0001-rpm-restrict-virtual-memory-usage-if-limit-set.patch
> new file mode 100644
> index 0000000..a4b9a58
> --- /dev/null
> +++ b/meta/recipes-devtools/rpm/files/0001-rpm-restrict-virtual-memory-usage-if-limit-set.patch
> @@ -0,0 +1,52 @@
> +From cff87a68cde44d893b72caa1995ac6b9a1784523 Mon Sep 17 00:00:00 2001
> +From: Peter Bergin <peter@berginkonsult.se>
> +Date: Wed, 19 Sep 2018 15:12:31 +0200
> +Subject: [PATCH] rpm: restrict virtual memory usage if limit set
> +
> +A solution to avoid OOM situation when the virtual memory is restricted
> +for a user (ulimit -v). As the lzopen_internal funtion is run in parallel
> +one instance per CPU thread the available virtual memory is limited per
> +CPU thread.
> +---
> + rpmio/rpmio.c | 25 +++++++++++++++++++++++++
> + 1 file changed, 25 insertions(+)
> +
> +diff --git a/rpmio/rpmio.c b/rpmio/rpmio.c
> +index e051c98..49752b3 100644
> +--- a/rpmio/rpmio.c
> ++++ b/rpmio/rpmio.c
> +@@ -845,6 +845,31 @@ static LZFILE *lzopen_internal(const char *mode, int fd, int xz)
> +               }
> + #endif
> +
> ++              struct rlimit virtual_memory;
> ++              getrlimit(RLIMIT_AS, &virtual_memory);
> ++              if (virtual_memory.rlim_cur != RLIM_INFINITY) {
> ++                      const uint64_t virtual_memlimit = virtual_memory.rlim_cur;
> ++                      const uint64_t virtual_memlimit_per_cpu_thread =

What's the point of const for these variables?

> ++                              virtual_memlimit / lzma_cputhreads();
> ++                      uint64_t memory_usage_virt;
> ++                      rpmlog(RPMLOG_NOTICE, "XZ: virtual memory restricted to %lu and "
> ++                             "per CPU thread %lu\n", virtual_memlimit, virtual_memlimit_per_cpu_thread);
> ++                      /* keep reducing the number of compression threads untill memory

Typo.

> ++                         usage gets below limit per CPU thread*/
> ++                      while ((memory_usage_virt = lzma_stream_encoder_mt_memusage(&mt_options)) >
> ++                             virtual_memlimit_per_cpu_thread) {
> ++                              /* number of threads shouldn't be able to hit zero with compression
> ++                               * settings aailable to set through rpm... */
> ++                              assert(--mt_options.threads != 0);

Putting an expression with a side effect inside assert() looks
dubious. Did you test with and without NDEBUG defined?

> ++                      }
> ++                      if (threads != (int)mt_options.threads)
> ++                              rpmlog(RPMLOG_NOTICE,
> ++                                     "XZ: Adjusted the number of threads from %d to %d to not "
> ++                                     "exceed the memory usage limit of %lu bytes\n",
> ++                                     threads, mt_options.threads, virtual_memlimit);
> ++
> ++              }
> ++
> +               ret = lzma_stream_encoder_mt(&lzfile->strm, &mt_options);
> +           }
> + #endif
> +--
> +2.7.4
> +
> diff --git a/meta/recipes-devtools/rpm/rpm_4.14.2.bb b/meta/recipes-devtools/rpm/rpm_4.14.2.bb
> index 46f8837..112b41a 100644
> --- a/meta/recipes-devtools/rpm/rpm_4.14.2.bb
> +++ b/meta/recipes-devtools/rpm/rpm_4.14.2.bb
> @@ -39,6 +39,7 @@ SRC_URI = "git://github.com/rpm-software-management/rpm;branch=rpm-4.14.x \
>             file://0003-rpmstrpool.c-make-operations-over-string-pools-threa.patch \
>             file://0004-build-pack.c-remove-static-local-variables-from-buil.patch \
>             file://0001-perl-disable-auto-reqs.patch \
> +           file://0001-rpm-restrict-virtual-memory-usage-if-limit-set.patch \
>             "
>
>  PE = "1"
> --
> 2.7.4
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

