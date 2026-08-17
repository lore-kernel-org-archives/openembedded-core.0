Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D54C9C5DF66
	for <webhook@archiver.kernel.org>; Mon, 17 Aug 2026 10:37:34 +0000 (UTC)
Received: from mail-qv1-f41.google.com (mail-qv1-f41.google.com [209.85.219.41])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.27282.1786963049081468338
 for <openembedded-core@lists.openembedded.org>;
 Mon, 17 Aug 2026 03:37:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=aVyOPcA8;
 spf=pass (domain: gmail.com, ip: 209.85.219.41, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qv1-f41.google.com with SMTP id 6a1803df08f44-8edda5d56a5so34302406d6.3
        for <openembedded-core@lists.openembedded.org>; Mon, 17 Aug 2026 03:37:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786963048; cv=none;
        d=google.com; s=arc-20260327;
        b=WI4ShxNJkGudIu3N6Qg/OwKqvQEQDt8+O6E05HKybtyEzmkDPC8t8gG6ClGJWHkYrs
         o/Dif0nflSphXnP3MotzYWz45vhg+SyRWKDwtJubTr7dMd9u6BzCR31wyc4vqB/EHBK6
         OU5MvIr196ecC/FpPL2aSH5ImWNFYaEKEifbWHqT8Uixu0kNXwypzZQ70gqkJSj485DP
         jKa8l1fYkQqalrbw2h6YeastDFjTesd/0SWDfOWMvO33HWmyYhu/Jer/VCVTo2G2DeUS
         ClhP5f8usBr+jGw0XEw4/gZl1XW4++M/c0so+U6a4ytqBMOndmvefOWYTAYjiiRvtPHb
         7A8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=A7X2tA1bJ4ZTg3w+3ZYqTX0Q4sU6Sx+CUJAGBkvzilw=;
        fh=ieSL9rtDjTf8D4Cv/rcLpXMiZPHMPAK2fmdGPKuiPVs=;
        b=AxJEoAUtIso0hbpweb/N6+546VbqhboJVN+egu/sv82zBiiM7nxOPZpgKLV9O7gA8l
         +37cU7kxwjaUt+limldINrWRMvYIHekfPsnu7K8eWTs89m+962w+2eSj0+7+iLtOcgck
         RSWbM8tyWP4riT9fN09lNHr7wt81MJm8W0FVhDQ6AtgUuHssJApOMoJe2d1dkQJdekT1
         Jo6xFLGA5U4lO1H3xPfTlDrmwAstWnKATxEkYY3SoMiTY59DvqiJiiShqRv0To945Dcw
         7BBQfUPXLHXPz2uV4GwtHw3ON2drbns2y08WpyTA2vSAbpGv7EzdfpiUUj253luZOdwS
         z0EQ==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786963048; x=1787567848; darn=lists.openembedded.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=A7X2tA1bJ4ZTg3w+3ZYqTX0Q4sU6Sx+CUJAGBkvzilw=;
        b=aVyOPcA8pUETd5aCQi/wYvXXH4D2ME4o3RAsTWmzy1oCYEFIRfvzcjeR7+TjKEShU8
         D522fXbVXsmtrIav7bxvwM1H0qrwraTdv9DowjS+1LqLx22OqRJ7I8HyRxuUn1YKWqa0
         XrOQwQ+TLn8Vh9Y60UT9Xfc9cF/tUWQm2SneJlentTaHYDCU8KzX6ahrtJw1qoNvKY7R
         SKV//vQfzE5VphUK+bj59BeJQOVrlMRh6BW5mCHt/YC6l837QeQ0zCPmNoLmAF1Tbqm0
         eiYeFHjOmSYzDTB3dXnEabB+RagkDnPP7yXgqW8S+k40XjMpVY7ZeP5T4m2llD18i4op
         L0qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786963048; x=1787567848;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=A7X2tA1bJ4ZTg3w+3ZYqTX0Q4sU6Sx+CUJAGBkvzilw=;
        b=H7H+a8pnTQ2LAHRv0p40DY6S+uLmt3qHrXZlmvdH9JW8Wd48gua8jsGIm/klBkK55U
         GJYSdZWVQd/euYXOnpVrbQ685a/AUn+NhuUFrtZw1U9vJd46IFFVHtO86zpaC+mluCIr
         o+dr989FHJBGFyP7sJs+Ho7jEEUSnG5yBuj9Uaa1VlMSyOAo9k+0/yUybtqq+h1SIDWG
         iTg86IbnSakINZ+g6k6PdBjx03K2069o7GoaZjDXgXJh3FR/A/8VPjgYfRe5C6Mweu+M
         JXacgGnfJlgBq2mIBLSQrklA71paWUM4CXihHJk9tZjbiUmWx8HSZWH3nXGc0XCoiRYB
         06iw==
X-Gm-Message-State: AOJu0YzrJb7PlWKVl/jbLm+vT0kJEc48gV1n2wUQjRWKWIPtYGV/WtWO
	oHsQ0X9I5uykuYpvf6CcUkQjLJcxw7i7scaALaKonYsqw6sS+mzSggcteK9CEPopAAuMF7an/Zt
	+t1vin9DzVp6/Gh+7wriBRR6WfZ5/6iE=
X-Gm-Gg: AR+sD10KBujrL0DYpwD10BkDjU20G5kRkDBOhlg8nIZvxT3UE2EHObw3hgpSRv/fit0
	UbOHQMiUul49CK3OzOyqE8LcXrMkCtRSAot7ckblvo7xKTUB6FdUh//s61UV0ufwSxL28XHsB77
	xLCbMxUtOi9RJf6Qa3qA0qG5z++MFBoReRW0V2qfhJ7SgkKI9hZW6O62rgajZGdIW3WPnVSZo/u
	fz8a8JlLgfI3TecgFycIlY/0mbBszRM8DTs5hi/4UKtViJt65xf6rp2kiBw6RHdN6Alg44Vnr+T
	XHIATgLHu2GwKiYaBJowltyvbjxqit6O7zPEoQcmRfBZ6FYYI1KAzsNtiVndqfO2QGy6eaYj/u+
	QwhI=
X-Received: by 2002:a05:6214:4187:b0:907:bfc0:781e with SMTP id
 6a1803df08f44-90a91e3f2e3mr275669436d6.30.1786963047649; Mon, 17 Aug 2026
 03:37:27 -0700 (PDT)
MIME-Version: 1.0
References: <20260814153052.2863858-1-Abhishek.Bachiphale@windriver.com>
In-Reply-To: <20260814153052.2863858-1-Abhishek.Bachiphale@windriver.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Mon, 17 Aug 2026 12:37:16 +0200
X-Gm-Features: AcwNN1VTAZjhr-ddzfogLQiz_zERNIv0csjGKxopdYz4REYbohNngAZOVsJ0C8E
Message-ID: <CANNYZj9KkLXRROeRepxGCbTFj7rQ3PpBbyMbmwaBK9N_VPafLQ@mail.gmail.com>
Subject: Re: [OE-core][wrynose][PATCH] perl: upgrade 5.42.0 -> 5.44.0
To: abhishek.bachiphale@windriver.com
Cc: openembedded-core@lists.openembedded.org, Randy.MacLeod@windriver.com
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 17 Aug 2026 10:37:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/243605

Hello,

major release updates aren't eligible for oe-core stable branches.

Alex

On Fri, 14 Aug 2026 at 17:31, Abhishek Bachiphale via
lists.openembedded.org
<abhishek.bachiphale=windriver.com@lists.openembedded.org> wrote:
>
> From: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
>
> Cherry-pick from OE-Core master (5.42.2 -> 5.44.0),
> adapted for wrynose which had 5.42.0
>
> This upgrade fixes the following CVEs:
>   - CVE-2026-42496: Archive::Tar symlink path traversal (CVSS 9.1)
>   - CVE-2026-42497: Archive::Tar hardlink path traversal (CVSS 9.1)
>   - CVE-2026-9538: Archive::Tar memory exhaustion DoS
>   - CVE-2026-8376: Perl regex heap buffer overflow (32-bit)
>   - CVE-2026-13221: Perl regex trie overflow (>65535 branches)
>
> Changes: https://perldoc.perl.org/5.44.0/perldelta
>
> Add perlcross patches to support perl 5.44.0:
> - Patchset symlinks for perl5-5.44.0
> - Configure checks for d_getentropy, i_stdckdint, i_sysrandom
> - Fix checkfield() for C23/GCC 16 compatibility
>
> Verified: ptest passed.
>
> Drop patches already included in this release:
> - CVE-2026-8376-01.patch (upstream commit e842efdafe7c)
> - CVE-2026-8376-02.patch (upstream commit 5e7f119eb2bb)
> - determinism.patch (Encode::Byte sort fix)
>
> Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
> Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> (cherry picked from commit 036700267e816ebfc56c404e872055f93f73c88f)
> Signed-off-by: Abhishek Bachiphale <Abhishek.Bachiphale@windriver.com>
> ---
>  .../files/0001-patches-for-perl-5.44.0.patch  | 110 ++++++++++++++++++
>  ...Add-configure-checks-for-perl-5.44.0.patch |  47 ++++++++
>  ...Fix-checkfield-for-C23-compatibility.patch |  35 ++++++
>  .../perl-cross/perlcross_1.6.4.bb             |   3 +
>  .../perl/files/CVE-2026-8376-01.patch         |  62 ----------
>  .../perl/files/CVE-2026-8376-02.patch         |  49 --------
>  .../perl/files/determinism.patch              |  51 --------
>  .../perl/{perl_5.42.0.bb => perl_5.44.0.bb}   |   5 +-
>  8 files changed, 196 insertions(+), 166 deletions(-)
>  create mode 100644 meta/recipes-devtools/perl-cross/files/0001-patches-for-perl-5.44.0.patch
>  create mode 100644 meta/recipes-devtools/perl-cross/files/0002-Add-configure-checks-for-perl-5.44.0.patch
>  create mode 100644 meta/recipes-devtools/perl-cross/files/0003-Fix-checkfield-for-C23-compatibility.patch
>  delete mode 100644 meta/recipes-devtools/perl/files/CVE-2026-8376-01.patch
>  delete mode 100644 meta/recipes-devtools/perl/files/CVE-2026-8376-02.patch
>  delete mode 100644 meta/recipes-devtools/perl/files/determinism.patch
>  rename meta/recipes-devtools/perl/{perl_5.42.0.bb => perl_5.44.0.bb} (98%)
>
> diff --git a/meta/recipes-devtools/perl-cross/files/0001-patches-for-perl-5.44.0.patch b/meta/recipes-devtools/perl-cross/files/0001-patches-for-perl-5.44.0.patch
> new file mode 100644
> index 0000000000..36f065419f
> --- /dev/null
> +++ b/meta/recipes-devtools/perl-cross/files/0001-patches-for-perl-5.44.0.patch
> @@ -0,0 +1,110 @@
> +From 0000000000000000000000000000000000000000 Mon Sep 17 00:00:00 2001
> +From: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
> +Date: Tue, 21 Jul 2026 09:10:00 +0000
> +Subject: [PATCH] patches for perl-5.44.0
> +
> +Upstream-Status: Submitted [https://github.com/arsv/perl-cross/pull/178]
> +Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
> +---
> + cnf/diffs/perl5-5.44.0/constant.patch       | 1 +
> + cnf/diffs/perl5-5.44.0/dynaloader.patch     | 1 +
> + cnf/diffs/perl5-5.44.0/findext.patch        | 1 +
> + cnf/diffs/perl5-5.44.0/installscripts.patch | 1 +
> + cnf/diffs/perl5-5.44.0/liblist.patch        | 1 +
> + cnf/diffs/perl5-5.44.0/makemaker.patch      | 1 +
> + cnf/diffs/perl5-5.44.0/posix-makefile.patch | 1 +
> + cnf/diffs/perl5-5.44.0/test-checkcase.patch | 1 +
> + cnf/diffs/perl5-5.44.0/test-makemaker.patch | 1 +
> + cnf/diffs/perl5-5.44.0/xconfig.patch        | 1 +
> + 10 files changed, 10 insertions(+)
> + create mode 120000 cnf/diffs/perl5-5.44.0/constant.patch
> + create mode 120000 cnf/diffs/perl5-5.44.0/dynaloader.patch
> + create mode 120000 cnf/diffs/perl5-5.44.0/findext.patch
> + create mode 120000 cnf/diffs/perl5-5.44.0/installscripts.patch
> + create mode 120000 cnf/diffs/perl5-5.44.0/liblist.patch
> + create mode 120000 cnf/diffs/perl5-5.44.0/makemaker.patch
> + create mode 120000 cnf/diffs/perl5-5.44.0/posix-makefile.patch
> + create mode 120000 cnf/diffs/perl5-5.44.0/test-checkcase.patch
> + create mode 120000 cnf/diffs/perl5-5.44.0/test-makemaker.patch
> + create mode 120000 cnf/diffs/perl5-5.44.0/xconfig.patch
> +
> +diff --git a/cnf/diffs/perl5-5.44.0/constant.patch b/cnf/diffs/perl5-5.44.0/constant.patch
> +new file mode 120000
> +index 0000000..065e198
> +--- /dev/null
> ++++ b/cnf/diffs/perl5-5.44.0/constant.patch
> +@@ -0,0 +1 @@
> ++../perl5-5.22.3/constant.patch
> +\ No newline at end of file
> +diff --git a/cnf/diffs/perl5-5.44.0/dynaloader.patch b/cnf/diffs/perl5-5.44.0/dynaloader.patch
> +new file mode 120000
> +index 0000000..ffb73eb
> +--- /dev/null
> ++++ b/cnf/diffs/perl5-5.44.0/dynaloader.patch
> +@@ -0,0 +1 @@
> ++../perl5-5.22.3/dynaloader.patch
> +\ No newline at end of file
> +diff --git a/cnf/diffs/perl5-5.44.0/findext.patch b/cnf/diffs/perl5-5.44.0/findext.patch
> +new file mode 120000
> +index 0000000..9efbe5b
> +--- /dev/null
> ++++ b/cnf/diffs/perl5-5.44.0/findext.patch
> +@@ -0,0 +1 @@
> ++../perl5-5.22.3/findext.patch
> +\ No newline at end of file
> +diff --git a/cnf/diffs/perl5-5.44.0/installscripts.patch b/cnf/diffs/perl5-5.44.0/installscripts.patch
> +new file mode 120000
> +index 0000000..1c05e0f
> +--- /dev/null
> ++++ b/cnf/diffs/perl5-5.44.0/installscripts.patch
> +@@ -0,0 +1 @@
> ++../perl5-5.36.0/installscripts.patch
> +\ No newline at end of file
> +diff --git a/cnf/diffs/perl5-5.44.0/liblist.patch b/cnf/diffs/perl5-5.44.0/liblist.patch
> +new file mode 120000
> +index 0000000..5037380
> +--- /dev/null
> ++++ b/cnf/diffs/perl5-5.44.0/liblist.patch
> +@@ -0,0 +1 @@
> ++../perl5-5.42.0/liblist.patch
> +\ No newline at end of file
> +diff --git a/cnf/diffs/perl5-5.44.0/makemaker.patch b/cnf/diffs/perl5-5.44.0/makemaker.patch
> +new file mode 120000
> +index 0000000..d7bd609
> +--- /dev/null
> ++++ b/cnf/diffs/perl5-5.44.0/makemaker.patch
> +@@ -0,0 +1 @@
> ++../perl5-5.38.0/makemaker.patch
> +\ No newline at end of file
> +diff --git a/cnf/diffs/perl5-5.44.0/posix-makefile.patch b/cnf/diffs/perl5-5.44.0/posix-makefile.patch
> +new file mode 120000
> +index 0000000..29463b7
> +--- /dev/null
> ++++ b/cnf/diffs/perl5-5.44.0/posix-makefile.patch
> +@@ -0,0 +1 @@
> ++../perl5-5.22.3/posix-makefile.patch
> +\ No newline at end of file
> +diff --git a/cnf/diffs/perl5-5.44.0/test-checkcase.patch b/cnf/diffs/perl5-5.44.0/test-checkcase.patch
> +new file mode 120000
> +index 0000000..36c5186
> +--- /dev/null
> ++++ b/cnf/diffs/perl5-5.44.0/test-checkcase.patch
> +@@ -0,0 +1 @@
> ++../perl5-5.22.3/test-checkcase.patch
> +\ No newline at end of file
> +diff --git a/cnf/diffs/perl5-5.44.0/test-makemaker.patch b/cnf/diffs/perl5-5.44.0/test-makemaker.patch
> +new file mode 120000
> +index 0000000..4e970ff
> +--- /dev/null
> ++++ b/cnf/diffs/perl5-5.44.0/test-makemaker.patch
> +@@ -0,0 +1 @@
> ++../perl5-5.34.0/test-makemaker.patch
> +\ No newline at end of file
> +diff --git a/cnf/diffs/perl5-5.44.0/xconfig.patch b/cnf/diffs/perl5-5.44.0/xconfig.patch
> +new file mode 120000
> +index 0000000..87ac501
> +--- /dev/null
> ++++ b/cnf/diffs/perl5-5.44.0/xconfig.patch
> +@@ -0,0 +1 @@
> ++../perl5-5.42.0/xconfig.patch
> +\ No newline at end of file
> diff --git a/meta/recipes-devtools/perl-cross/files/0002-Add-configure-checks-for-perl-5.44.0.patch b/meta/recipes-devtools/perl-cross/files/0002-Add-configure-checks-for-perl-5.44.0.patch
> new file mode 100644
> index 0000000000..e7fd9df2f5
> --- /dev/null
> +++ b/meta/recipes-devtools/perl-cross/files/0002-Add-configure-checks-for-perl-5.44.0.patch
> @@ -0,0 +1,47 @@
> +From d6010680c68655b782c2e07bd0d38562c1ad0ccb Mon Sep 17 00:00:00 2001
> +From: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
> +Date: Tue, 21 Jul 2026 09:28:12 +0000
> +Subject: [PATCH] Add configure checks for perl 5.44.0 new symbols
> +
> +Add detection for d_getentropy, i_stdckdint, and i_sysrandom which
> +are new config symbols required by perl 5.44.0.
> +
> +Upstream-Status: Submitted [https://github.com/arsv/perl-cross/pull/178]
> +Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
> +---
> + cnf/configure_func.sh | 1 +
> + cnf/configure_hdrs.sh | 2 ++
> + 2 files changed, 3 insertions(+)
> +
> +diff --git a/cnf/configure_func.sh b/cnf/configure_func.sh
> +index 20f9cdf..4cbee2f 100644
> +--- a/cnf/configure_func.sh
> ++++ b/cnf/configure_func.sh
> +@@ -104,6 +104,7 @@ checkfunc d_getaddrinfo 'getaddrinfo' "NULL,NULL,NULL,NULL" 'sys/types.h sys/soc
> + checkfunc d_get_current_dir_name 'get_current_dir_name' "" 'unistd.h'
> + checkfunc d_getcwd 'getcwd' 'NULL,0' 'unistd.h'
> + checkfunc d_getespwnam 'getespwnam'
> ++checkfunc d_getentropy 'getentropy' 'NULL,0' 'unistd.h'
> + checkfunc d_getfsstat 'getfsstat' "NULL,0,0" 'sys/types.h sys/mount.h'
> + checkfunc d_getgrent 'getgrent' "" 'sys/types.h grp.h'
> + checkfunc d_getgrps 'getgroups' "0,NULL" 'unistd.h'
> +diff --git a/cnf/configure_hdrs.sh b/cnf/configure_hdrs.sh
> +index 249f5bc..b2d9d88 100644
> +--- a/cnf/configure_hdrs.sh
> ++++ b/cnf/configure_hdrs.sh
> +@@ -64,6 +64,7 @@ checkhdr i_socks 'socks.h'
> + # i_stdarg below
> + checkhdr i_stdbool 'stdbool.h'
> + checkhdr i_stddef 'stddef.h'
> ++checkhdr i_stdckdint 'stdckdint.h'
> + checkhdr i_stdint 'stdint.h'
> + checkhdr i_stdlib 'stdlib.h'
> + checkhdr i_string 'string.h'
> +@@ -88,6 +89,7 @@ checkhdr i_syssockio 'sys/sockio.h'
> + checkhdr i_sysstat 'sys/stat.h'
> + checkhdr i_sysstatfs 'sys/statfs.h'
> + checkhdr i_sysstatvfs 'sys/statvfs.h'
> ++checkhdr i_sysrandom 'sys/random.h'
> + checkhdr i_systime 'sys/time.h'
> + define i_systimek 'undef' # not a plain header check
> + checkhdr i_systimes 'sys/times.h'
> diff --git a/meta/recipes-devtools/perl-cross/files/0003-Fix-checkfield-for-C23-compatibility.patch b/meta/recipes-devtools/perl-cross/files/0003-Fix-checkfield-for-C23-compatibility.patch
> new file mode 100644
> index 0000000000..b92995b131
> --- /dev/null
> +++ b/meta/recipes-devtools/perl-cross/files/0003-Fix-checkfield-for-C23-compatibility.patch
> @@ -0,0 +1,35 @@
> +From 7faa8a36afb579f07101a48065e4a19729034807 Mon Sep 17 00:00:00 2001
> +From: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
> +Date: Wed, 22 Jul 2026 09:21:26 +0000
> +Subject: [PATCH] configure_type_ext: Fix checkfield for C23/GCC 16
> +
> +In C23, 'void foo()' means no parameters, so calling foo(value.field)
> +fails with GCC 16 when -Werror is used. This breaks detection of
> +struct fields like tm_gmtoff and tm_zone.
> +
> +Use (void)value.field instead, which works for any field type.
> +
> +Upstream-Status: Submitted [https://github.com/arsv/perl-cross/pull/178]
> +Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
> +---
> + cnf/configure_type_ext.sh | 6 ++----
> + 1 file changed, 2 insertions(+), 4 deletions(-)
> +
> +diff --git a/cnf/configure_type_ext.sh b/cnf/configure_type_ext.sh
> +index 0136c90..9ecd3fb 100644
> +--- a/cnf/configure_type_ext.sh
> ++++ b/cnf/configure_type_ext.sh
> +@@ -7,11 +7,9 @@ checkfield() {
> +
> +       try_start
> +       try_includes $4
> +-      try_add 'void foo();'
> +-      try_add 'void bar()'
> +-        try_add "{"
> ++      try_add 'void bar(void) {'
> +       try_add "       $2 value;"
> +-      try_add "       foo(value.$3);"
> ++      try_add "       (void)value.$3;"
> +       try_add "}"
> +       try_compile
> +
> diff --git a/meta/recipes-devtools/perl-cross/perlcross_1.6.4.bb b/meta/recipes-devtools/perl-cross/perlcross_1.6.4.bb
> index 3c544c9746..9fa805e2e3 100644
> --- a/meta/recipes-devtools/perl-cross/perlcross_1.6.4.bb
> +++ b/meta/recipes-devtools/perl-cross/perlcross_1.6.4.bb
> @@ -15,6 +15,9 @@ SRC_URI = "${GITHUB_BASE_URI}/download/${PV}/perl-cross-${PV}.tar.gz;name=perl-c
>             file://0001-perl-cross-add-LDFLAGS-when-linking-libperl.patch \
>             file://determinism.patch \
>             file://0001-Makefile-check-the-file-if-patched-or-not.patch \
> +           file://0001-patches-for-perl-5.44.0.patch \
> +           file://0002-Add-configure-checks-for-perl-5.44.0.patch \
> +           file://0003-Fix-checkfield-for-C23-compatibility.patch \
>             "
>  GITHUB_BASE_URI = "https://github.com/arsv/perl-cross/releases/"
>
> diff --git a/meta/recipes-devtools/perl/files/CVE-2026-8376-01.patch b/meta/recipes-devtools/perl/files/CVE-2026-8376-01.patch
> deleted file mode 100644
> index af94eec29c..0000000000
> --- a/meta/recipes-devtools/perl/files/CVE-2026-8376-01.patch
> +++ /dev/null
> @@ -1,62 +0,0 @@
> -From fd23f4370d24d00352d1cc09b16687f16da6ae5b Mon Sep 17 00:00:00 2001
> -From: Tony Cook <tony@develop-help.com>
> -Date: Tue, 12 May 2026 14:47:31 +1000
> -Subject: [PATCH 1/2] perl/perl-security#147: test cases
> -
> -The suggested case from the ticket and an alternative.
> -
> -(cherry picked from commit e842efdafe7c51a687a4907e4887988fe6a025ef)
> -
> -CVE: CVE-2026-8376
> -Upstream-Status: Backport [https://github.com/Perl/perl5/commit/e842efdafe7c51a687a4907e4887988fe6a025ef]
> -Signed-off-by: Theo Gaige (Schneider Electric) <tgaige.opensource@witekio.com>
> ----
> - t/re/pat_psycho.t | 18 ++++++++++++++++--
> - 1 file changed, 16 insertions(+), 2 deletions(-)
> -
> -diff --git a/t/re/pat_psycho.t b/t/re/pat_psycho.t
> -index 336039521d..73a7992372 100644
> ---- a/t/re/pat_psycho.t
> -+++ b/t/re/pat_psycho.t
> -@@ -10,7 +10,7 @@
> - use strict;
> - use warnings;
> - use 5.010;
> --
> -+use Config;
> -
> - sub run_tests;
> -
> -@@ -31,7 +31,7 @@ BEGIN {
> -
> - skip_all('$PERL_SKIP_PSYCHO_TEST set') if $ENV{PERL_SKIP_PSYCHO_TEST};
> -
> --plan tests => 15;  # Update this when adding/deleting tests.
> -+plan tests => 17;  # Update this when adding/deleting tests.
> -
> - run_tests() unless caller;
> -
> -@@ -211,6 +211,20 @@ EOF
> -
> -
> -     }
> -+
> -+  SKIP:
> -+    { # sec #147
> -+        $Config{ptrsize} == 4
> -+          or skip "these only fail on x32 and use too much memory on x64", 2;
> -+        local $::TODO = "This crashes";
> -+        # original case
> -+        fresh_perl_like('/\x{10000}{1073741824}/',
> -+                        qr/Regexp out of space/, {}, "ssize_t overflow");
> -+
> -+        # synthesized but similar case
> -+        fresh_perl_like('/(?:\x{10001}\x{10000}){536870912}/',
> -+                        qr/Regexp out of space/, {}, "ssize_t overflow again");
> -+    }
> - } # End of sub run_tests
> -
> - 1;
> ---
> -2.43.0
> -
> diff --git a/meta/recipes-devtools/perl/files/CVE-2026-8376-02.patch b/meta/recipes-devtools/perl/files/CVE-2026-8376-02.patch
> deleted file mode 100644
> index 39b3d510fe..0000000000
> --- a/meta/recipes-devtools/perl/files/CVE-2026-8376-02.patch
> +++ /dev/null
> @@ -1,49 +0,0 @@
> -From 49c18d4c91d5b49e0a7cbb8277f3149198004c36 Mon Sep 17 00:00:00 2001
> -From: Tony Cook <tony@develop-help.com>
> -Date: Tue, 12 May 2026 14:51:00 +1000
> -Subject: [PATCH 2/2] perl/perl-security#147: test against the actual character
> - lengths
> -
> -(cherry picked from commit 5e7f119eb2bb1181be908701f22bf7068e722f1c)
> -
> -CVE: CVE-2026-8376
> -Upstream-Status: Backport [https://github.com/Perl/perl5/commit/5e7f119eb2bb1181be908701f22bf7068e722f1c]
> -Signed-off-by: Theo Gaige (Schneider Electric) <tgaige.opensource@witekio.com>
> ----
> - regcomp_study.c   | 7 +++++++
> - t/re/pat_psycho.t | 1 -
> - 2 files changed, 7 insertions(+), 1 deletion(-)
> -
> -diff --git a/regcomp_study.c b/regcomp_study.c
> -index 9106452dd5..05f1b017b1 100644
> ---- a/regcomp_study.c
> -+++ b/regcomp_study.c
> -@@ -2770,6 +2770,13 @@ Perl_study_chunk(pTHX_
> -                                                (U8 *) SvEND(data->last_found))
> -                                 - (U8*)s;
> -                         l -= old;
> -+
> -+                        if (l > 0 &&
> -+                            (mincount >= SSize_t_MAX / (SSize_t)l
> -+                             || old > SSize_t_MAX - mincount * (SSize_t)l)) {
> -+                            FAIL("Regexp out of space");
> -+                        }
> -+
> -                         /* Get the added string: */
> -                         last_str = newSVpvn_utf8(s  + old, l, UTF);
> -                         last_chrs = UTF ? utf8_length((U8*)(s + old),
> -diff --git a/t/re/pat_psycho.t b/t/re/pat_psycho.t
> -index 73a7992372..9fd764fd5e 100644
> ---- a/t/re/pat_psycho.t
> -+++ b/t/re/pat_psycho.t
> -@@ -216,7 +216,6 @@ EOF
> -     { # sec #147
> -         $Config{ptrsize} == 4
> -           or skip "these only fail on x32 and use too much memory on x64", 2;
> --        local $::TODO = "This crashes";
> -         # original case
> -         fresh_perl_like('/\x{10000}{1073741824}/',
> -                         qr/Regexp out of space/, {}, "ssize_t overflow");
> ---
> -2.43.0
> -
> diff --git a/meta/recipes-devtools/perl/files/determinism.patch b/meta/recipes-devtools/perl/files/determinism.patch
> deleted file mode 100644
> index bdb9a928bb..0000000000
> --- a/meta/recipes-devtools/perl/files/determinism.patch
> +++ /dev/null
> @@ -1,51 +0,0 @@
> -From 5c4fd57daf125357262aa796057d7be8e78d378e Mon Sep 17 00:00:00 2001
> -From: Richard Purdie <richard.purdie@linuxfoundation.org>
> -Date: Wed, 5 Feb 2020 23:54:02 +0000
> -Subject: [PATCH] Fixes to make the perl build reproducible:
> -
> -a) Remove the \n from configure_attr.sh since it gets quoted differently depending on
> -   whether the shell is bash or dash which can cause the test result to be incorrect.
> -   Reported upstream: https://github.com/arsv/perl-cross/issues/87
> -
> -b) Sort the order of the module lists from configure_mods.sh since otherwise
> -   the result isn't the same leading to makefile differences.
> -   Reported upstream: https://github.com/arsv/perl-cross/issues/88
> -
> -c) Sort the Encode::Byte byte_t.fnm file output (and the makefile depends whilst
> -   there for good measure)
> -   Submitted to upstream perl: https://github.com/dankogai/p5-encode/pull/179
> -
> -d) Use bash for perl-cross configure since otherwise trnl gets set to "\n" with bash
> -   and "" with dash
> -   Reported upstream: https://github.com/arsv/perl-cross/issues/87
> -
> -RP 2020/2/7
> -
> -Upstream-Status: Submitted [see links above]
> -Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org
> ----
> - cpan/Encode/Byte/Makefile.PL | 4 ++--
> - 1 file changed, 2 insertions(+), 2 deletions(-)
> -
> -diff --git a/cpan/Encode/Byte/Makefile.PL b/cpan/Encode/Byte/Makefile.PL
> -index 6824bbb..4af4a50 100644
> ---- a/cpan/Encode/Byte/Makefile.PL
> -+++ b/cpan/Encode/Byte/Makefile.PL
> -@@ -171,7 +171,7 @@ sub postamble
> -     my $lengthsofar = length($str);
> -     my $continuator = '';
> -     $str .= "$table.c : $enc2xs Makefile.PL";
> --    foreach my $file (@{$tables{$table}})
> -+    foreach my $file (sort (@{$tables{$table}}))
> -     {
> -         $str .= $continuator.' '.$self->catfile($dir,$file);
> -         if ( length($str)-$lengthsofar > 128*$numlines )
> -@@ -189,7 +189,7 @@ sub postamble
> -         qq{\n\t\$(PERL) $plib $enc2xs $ucopts -o \$\@ -f $table.fnm\n\n};
> -     open (FILELIST, ">$table.fnm")
> -         || die "Could not open $table.fnm: $!";
> --    foreach my $file (@{$tables{$table}})
> -+    foreach my $file (sort (@{$tables{$table}}))
> -     {
> -         print FILELIST $self->catfile($dir,$file) . "\n";
> -     }
> diff --git a/meta/recipes-devtools/perl/perl_5.42.0.bb b/meta/recipes-devtools/perl/perl_5.44.0.bb
> similarity index 98%
> rename from meta/recipes-devtools/perl/perl_5.42.0.bb
> rename to meta/recipes-devtools/perl/perl_5.44.0.bb
> index 1833b7a352..c76810f124 100644
> --- a/meta/recipes-devtools/perl/perl_5.42.0.bb
> +++ b/meta/recipes-devtools/perl/perl_5.44.0.bb
> @@ -14,10 +14,7 @@ SRC_URI = "https://www.cpan.org/src/5.0/perl-${PV}.tar.gz;name=perl \
>             file://native-perlinc.patch \
>             file://perl-dynloader.patch \
>             file://0002-Constant-Fix-up-shebang.patch \
> -           file://determinism.patch \
>             file://0001-cpan-Sys-Syslog-Makefile.PL-Fix-_PATH_LOG-for-determ.patch \
> -           file://CVE-2026-8376-01.patch \
> -           file://CVE-2026-8376-02.patch \
>             "
>  SRC_URI:append:class-native = " \
>             file://perl-configpm-switch.patch \
> @@ -26,7 +23,7 @@ SRC_URI:append:class-target = " \
>             file://encodefix.patch \
>  "
>
> -SRC_URI[perl.sha256sum] = "e093ef184d7f9a1b9797e2465296f55510adb6dab8842b0c3ed53329663096dc"
> +SRC_URI[perl.sha256sum] = "3b855066b92491cb40e86affb1ca57d1a388aa43e51b91c7806a32c2f65f96c3"
>
>  B = "${WORKDIR}/perl-${PV}-build"
>
> --
> 2.40.0
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#243457): https://lists.openembedded.org/g/openembedded-core/message/243457
> Mute This Topic: https://lists.openembedded.org/mt/120750692/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alex.kanavin@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

