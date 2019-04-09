Return-Path: <raj.khem@gmail.com>
Received: from mail-qt1-f193.google.com (mail-qt1-f193.google.com
	[209.85.160.193])
	by mail.openembedded.org (Postfix) with ESMTP id A1BA37C427
	for <openembedded-core@lists.openembedded.org>;
	Tue,  9 Apr 2019 03:54:14 +0000 (UTC)
Received: by mail-qt1-f193.google.com with SMTP id x12so18160557qts.7
	for <openembedded-core@lists.openembedded.org>;
	Mon, 08 Apr 2019 20:54:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=2TUpTMmU+g3Uw88jRp4aL4Tx2nn8Ule7JOVmXauQrxQ=;
	b=j3QfOX9lnCLk5o8n9JLb7evrX3DnsjoE9e3oVw912cl8V6oSwZwxDOwZNifKph/dAp
	LP8o4/KoMjw5x1cGm4JYfF8D+6pggDA897iFzUyxFUJ60YKcU55EuOm6EoBs5W1Z7m7g
	y5lj86MO1XaewxoLCRMOIR597BvFt3e7RhMw2m1MIpXpX3DocDp8j7Bf3kHpJf3VAQCP
	ATO7r960KUdky7fxRs1OwulsMOpKsoa9ghd5rtUvzkkOEBut+fnIyvsaxmTQI31ql+Kl
	JFf3MmdxjC7VjlktL5VJzVFt2ZV0lngeAJVUb8RGK/Il9H1U5YvVbVZ1xMWP+DwdKxu0
	c52g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=2TUpTMmU+g3Uw88jRp4aL4Tx2nn8Ule7JOVmXauQrxQ=;
	b=j7lls9e3FhEjqrsXgeaoUAm4sGmBRSWiAGmOB4hIxE7GhWmp09a0snE2a39kj8kpb4
	fsjHW9yBc5Yba1S5I9N7F6rdOKc+fXCwth4lFeCrm8YS+/XQmNayWguxBtGO7JnMXwVX
	oKpoixPMp07PqxohJKTn89QIy3PMlRHF5iFZQ8HexXyerYeKBvga4+9SlWBZCE3ebOnC
	U7vqBGVZ8ypk90lINn/r8bLlZzoKhi+3+6eLmBefHSNW5bTE4QmGcvGUpQz4if0d5VCV
	WspAfgCZISs3sBsZs9PszxElMDWT+O0bHDTfZvuqt1OM9jy1WNzhzqxYE8vUD6iJHV9p
	wCbg==
X-Gm-Message-State: APjAAAUn9N8C30rhcq/UNXpZffY1FOG+maR9tpKYDlxSGqnP2L2P/fvc
	HdxVh9qOtsc139yEqmUk04OIGfqYp1TIYXv8KFk=
X-Google-Smtp-Source: APXvYqzAd8lWNZpsIjHCylDYWl4Nh1SBJgFpIiNokbM8bnJdC61Qh4YR21PbwT84RQfdZljYiffBFfZmApju/bnAqPU=
X-Received: by 2002:a0c:c988:: with SMTP id b8mr27068343qvk.33.1554782055318; 
	Mon, 08 Apr 2019 20:54:15 -0700 (PDT)
MIME-Version: 1.0
References: <CAMKF1soKYZj6fKjFdNzAjhgtwaFKcw7iwyCU_kPq_QxmgCivng@mail.gmail.com>
	<1554777170-58044-1-git-send-email-mingli.yu@windriver.com>
In-Reply-To: <1554777170-58044-1-git-send-email-mingli.yu@windriver.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 8 Apr 2019 20:53:49 -0700
Message-ID: <CAMKF1sq0wYPvJg1G5+cnY-6owi1K=Nc4bctXm3pcsbh1R5gpFA@mail.gmail.com>
To: Mingli Yu <mingli.yu@windriver.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v3] gcc-sanitizers: fix -Werror=maybe-uninitialized issue
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
X-List-Received-Date: Tue, 09 Apr 2019 03:54:14 -0000
Content-Type: text/plain; charset="UTF-8"

On Mon, Apr 8, 2019 at 7:32 PM <mingli.yu@windriver.com> wrote:
>
> From: Mingli Yu <Mingli.Yu@windriver.com>
>
> When DEBUG_BUILD = "1" added in local.conf, there
> comes below build error when "bitbake gcc-sanitizers":
> | ./../../../../../../../../work-shared/gcc-8.3.0-r0/gcc-8.3.0/libsanitizer/libbacktrace/../../libbacktrace/elf.c: In function 'elf_is_symlink':
> | ../../../../../../../../../work-shared/gcc-8.3.0-r0/gcc-8.3.0/libsanitizer/libbacktrace/../../libbacktrace/elf.c:772:21: error: 'st.st_mode' may be used uninitialized in this function [-Werror=maybe-uninitialized]
> |   return S_ISLNK (st.st_mode);
>
> Per https://gcc.gnu.org/ml/gcc-patches/2019-04/msg00315.html,
> the gcc upstream thinks the warning is a false
> positive and suggests to use -O2 rather than -Og
> or -O1 when compiling that file, so pass -Wno-error
> to compiler when -Og is used to silence the error.
>

Not particular to this change but in general if a package says that it
does not support -Og
then we are just going to get into more and more untested grounds
especially during runtime
so I wonder how useful it will be to use -Og for such packages or any
other non supported
combination for that matter.

> Signed-off-by: Mingli Yu <Mingli.Yu@windriver.com>
> ---
>  meta/recipes-devtools/gcc/gcc-sanitizers.inc | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/meta/recipes-devtools/gcc/gcc-sanitizers.inc b/meta/recipes-devtools/gcc/gcc-sanitizers.inc
> index e5e8452..8b1d1c9 100644
> --- a/meta/recipes-devtools/gcc/gcc-sanitizers.inc
> +++ b/meta/recipes-devtools/gcc/gcc-sanitizers.inc
> @@ -45,6 +45,9 @@ INHIBIT_DEFAULT_DEPS = "1"
>  ALLOW_EMPTY_${PN} = "1"
>  DEPENDS = "gcc-runtime virtual/${TARGET_PREFIX}gcc"
>
> +# used to fix ../../../../../../../../../work-shared/gcc-8.3.0-r0/gcc-8.3.0/libsanitizer/libbacktrace/../../libbacktrace/elf.c:772:21: error: 'st.st_mode' may be used uninitialized in this function [-Werror=maybe-uninitialized]
> +DEBUG_OPTIMIZATION_append = " -Wno-error"
> +
>  BBCLASSEXTEND = "nativesdk"
>
>  PACKAGES = "${PN} ${PN}-dbg"
> --
> 2.7.4
>

