Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
 by mx.groups.io with SMTP id smtpd.web09.44474.1624265319468841463
 for <openembedded-core@lists.openembedded.org>;
 Mon, 21 Jun 2021 01:48:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=GVJaaIzg;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.54, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f54.google.com with SMTP id h11so1191749wrx.5
        for <openembedded-core@lists.openembedded.org>; Mon, 21 Jun 2021 01:48:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:date:in-reply-to:references:user-agent
         :mime-version:content-transfer-encoding;
        bh=FKEQhaKVmHEoSK/i14EHIkAvzBR1LRcebMhXmts37Do=;
        b=GVJaaIzgv42KCj14RpJ/mjSbYazQ0w3aI6Ok0cRGmxo7FYPNBW93sPnd+YgcNE9ZOn
         UIpQGzgVy/AOjzMGsrAAveCU08yF2ULTjGVw0DKGEEtnK1YE9G3BbgDoestjBA00+87t
         tiV6PFq7AHraxRQwJFdxIv3K0FeFvoED7d28Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=FKEQhaKVmHEoSK/i14EHIkAvzBR1LRcebMhXmts37Do=;
        b=RcfWek8TTdNk04rEGG9+4u/afmBsmFyOg3U3euXi0G+UncTNEqtjyYMdEmjwC9yjAS
         3+aIbL9aPrek6Bey3OWcky2/w+5rEerRXj9mxdz9f8Z7JcBos0dQxAfuxbSMuJ8yMFgU
         YrVBnoFA5+ftUzu6bVSQgvyGVNmI3Jy3aSEh+vCEkkl91hIyHvnlD4s9ItrCD0zaQDQg
         qNKaPX9/7K/5o2+4V/7w+pUYaYKMkct9+OY8b498Q4elJF2Ya3RledtvbVfdIxKyfHyN
         346C2nr4yK+s6GltLyd0JD8abjt/IpNcE4KquZd9ycoZUkm8PMOM/w9tlJd5WPleiyF/
         IxGQ==
X-Gm-Message-State: AOAM530HSSsn+U/vxPumY/e3g0QculxM5PrII24tshK6WURm9VwJ/Z83
	VpBcEZmWqO1bF2f75dsa7GaVBA==
X-Google-Smtp-Source: ABdhPJxFr9ph5M3pYEl58hkx37i7g/ODjRMtJRmBJ2mAlN+UXsaGp4vZRXSqlRZyRGRtT28CUDAyeQ==
X-Received: by 2002:a5d:5603:: with SMTP id l3mr6095985wrv.403.1624265317972;
        Mon, 21 Jun 2021 01:48:37 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from ?IPv6:2001:8b0:aba:5f3c:edb2:af0f:26c3:6837? ([2001:8b0:aba:5f3c:edb2:af0f:26c3:6837])
        by smtp.gmail.com with ESMTPSA id s16sm4384543wrm.36.2021.06.21.01.48.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Jun 2021 01:48:37 -0700 (PDT)
Message-ID: <5ad75eedd2ff8f0c414b9628617630774ff0e945.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] perl: avoid the source file patched twice
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: "Yu, Mingli" <mingli.yu@windriver.com>, 
	openembedded-core@lists.openembedded.org, alex.kanavin@gmail.com
Date: Mon, 21 Jun 2021 09:48:34 +0100
In-Reply-To: <20210618023036.26144-1-mingli.yu@windriver.com>
References: <20210618023036.26144-1-mingli.yu@windriver.com>
User-Agent: Evolution 3.40.0-1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Fri, 2021-06-18 at 10:30 +0800, Yu, Mingli wrote:
> From: Mingli Yu <mingli.yu@windriver.com>
> 
> After the commit(60dcb230f6 perl: split perl-cross into its own recipe)
> introduced, the source files mainly come from two parts, one is from
> SRI_URI during do_fetch and the other with below means during do_configure.
> do_configure_prepend() {
>     cp -rfp ${STAGING_DATADIR_NATIVE}/perl-cross/* ${S}
> }
> 
> And the source files will be changed during do_compile with below
> logic in Makefile.
> $(CROSSPATCHED): %.applied: %.patch
>         patch -p1 -i $< && touch $@
> 
> And there comes build failure with below steps:
>  $ bitbake perl-native
> 
> Make a change as below
>  $ git diff
>  diff --git a/meta/recipes-devtools/perl-cross/perlcross_1.3.6.bb b/meta/recipes-devtools/perl-cross/perlcross_1.3.6.bb
>  index b77bbd1fd4..4c5e35ab80 100644
>  --- a/meta/recipes-devtools/perl-cross/perlcross_1.3.6.bb
>  +++ b/meta/recipes-devtools/perl-cross/perlcross_1.3.6.bb
>  @@ -33,6 +33,7 @@ do_compile () {
>   do_install_class-native() {
>       mkdir -p ${D}/${datadir}/perl-cross/
>       cp -rf ${S}/* ${D}/${datadir}/perl-cross/
>  +    echo "test" > ${D}/${datadir}/perl-cross/testfile
>  }
> 
>  $ bitbake perl-native
>  | NOTE: make -j 48
>  | make crosspatch
>  | make[1]: Entering directory '/buildarea1/myu2/wr_build/wr1021_20210616_perl/build/tmp-glibc/work/x86_64-linux/perl-native/5.34.0-r0/perl-5.34.0'
>  | patch -p1 -i cnf/diffs/perl5-5.34.0/time-hires.patch && touch cnf/diffs/perl5-5.34.0/time-hires.applied
>  | patch -p1 -i cnf/diffs/perl5-5.34.0/xconfig.patch && touch cnf/diffs/perl5-5.34.0/xconfig.applied
>  | patch -p1 -i cnf/diffs/perl5-5.34.0/posix-makefile.patch && touch cnf/diffs/perl5-5.34.0/posix-makefile.applied
>  | File dist/Time-HiRes/Makefile.PL is read-only; trying to patch anyway
>  | patching file dist/Time-HiRes/Makefile.PL
>  | Reversed (or previously applied) patch detected!  Assume -R? [n]
>  | Apply anyway? [n]
>  | Skipping patch.
>  | 4 out of 4 hunks ignored -- saving rejects to file dist/Time-HiRes/Makefile.PL.rej
>  | patch -p1 -i cnf/diffs/perl5-5.34.0/test-commonsense.patch && touch cnf/diffs/perl5-5.34.0/test-commonsense.applied
>  | File perl.h is read-only; trying to patch anyway
>  | patching file perl.h
>  | Reversed (or previously applied) patch detected!  Assume -R? [n]
>  | Apply anyway? [n]
>  | Skipping patch.
>  | 1 out of 1 hunk ignored -- saving rejects to file perl.h.rej
>  | make[1]: *** [Makefile:64: cnf/diffs/perl5-5.34.0/time-hires.applied] Error 1
>  [snip]
> 
> It's because the source files patched twice, so let do_fetch always
> executed to make sure the source files which come from SRC_URI brand
> new in each build to avoid the source files patched twice to fix the
> build failure as above.
> 
> Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
> ---
>  meta/recipes-devtools/perl/perl_5.34.0.bb | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/meta/recipes-devtools/perl/perl_5.34.0.bb b/meta/recipes-devtools/perl/perl_5.34.0.bb
> index 7935a58723..2e48110d2b 100644
> --- a/meta/recipes-devtools/perl/perl_5.34.0.bb
> +++ b/meta/recipes-devtools/perl/perl_5.34.0.bb
> @@ -382,3 +382,5 @@ EOF
>         chmod 0755 ${SYSROOT_DESTDIR}${bindir}/nativeperl
>         cat ${SYSROOT_DESTDIR}${bindir}/nativeperl
>  }
> +
> +do_fetch[nostamp] = "1"

This patch is incorrect, it would cause tasks to rerun all the time and is not
the correct way to solve this problem. We don't use nostamp tasks in mid tree
tasks.

Cheers,

Richard

