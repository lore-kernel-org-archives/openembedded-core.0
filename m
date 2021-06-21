Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net [217.70.183.199])
 by mx.groups.io with SMTP id smtpd.web10.44219.1624264018291165611
 for <openembedded-core@lists.openembedded.org>;
 Mon, 21 Jun 2021 01:26:58 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: bootlin.com, ip: 217.70.183.199, mailfrom: alexandre.belloni@bootlin.com)
Received: (Authenticated sender: alexandre.belloni@bootlin.com)
	by relay9-d.mail.gandi.net (Postfix) with ESMTPSA id 43E2CFF815;
	Mon, 21 Jun 2021 08:26:55 +0000 (UTC)
Date: Mon, 21 Jun 2021 10:26:55 +0200
From: "Alexandre Belloni" <alexandre.belloni@bootlin.com>
To: "Yu, Mingli" <mingli.yu@windriver.com>
Cc: openembedded-core@lists.openembedded.org, alex.kanavin@gmail.com
Subject: Re: [OE-core] [PATCH] perl: avoid the source file patched twice
Message-ID: <YNBNT5AZL9W6WYp0@piout.net>
References: <20210618023036.26144-1-mingli.yu@windriver.com>
MIME-Version: 1.0
In-Reply-To: <20210618023036.26144-1-mingli.yu@windriver.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hello,

On 18/06/2021 10:30:36+0800, Yu, Mingli wrote:
> From: Mingli Yu <mingli.yu@windriver.com>
> 
> After the commit(60dcb230f6 perl: split perl-cross into its own recipe)
> introduced, the source files mainly come from two parts, one is from
> SRI_URI during do_fetch and the other with below means during do_configure.
> do_configure_prepend() {
>     cp -rfp ${STAGING_DATADIR_NATIVE}/perl-cross/* ${S}
> }
> 
> And the source files will be changed during do_compile with below
> logic in Makefile.
> $(CROSSPATCHED): %.applied: %.patch
>         patch -p1 -i $< && touch $@
> 
> And there comes build failure with below steps:
>  $ bitbake perl-native
> 
> Make a change as below
>  $ git diff
>  diff --git a/meta/recipes-devtools/perl-cross/perlcross_1.3.6.bb b/meta/recipes-devtools/perl-cross/perlcross_1.3.6.bb
>  index b77bbd1fd4..4c5e35ab80 100644
>  --- a/meta/recipes-devtools/perl-cross/perlcross_1.3.6.bb
>  +++ b/meta/recipes-devtools/perl-cross/perlcross_1.3.6.bb
>  @@ -33,6 +33,7 @@ do_compile () {
>   do_install_class-native() {
>       mkdir -p ${D}/${datadir}/perl-cross/
>       cp -rf ${S}/* ${D}/${datadir}/perl-cross/
>  +    echo "test" > ${D}/${datadir}/perl-cross/testfile
>  }
> 
>  $ bitbake perl-native
>  | NOTE: make -j 48
>  | make crosspatch
>  | make[1]: Entering directory '/buildarea1/myu2/wr_build/wr1021_20210616_perl/build/tmp-glibc/work/x86_64-linux/perl-native/5.34.0-r0/perl-5.34.0'
>  | patch -p1 -i cnf/diffs/perl5-5.34.0/time-hires.patch && touch cnf/diffs/perl5-5.34.0/time-hires.applied
>  | patch -p1 -i cnf/diffs/perl5-5.34.0/xconfig.patch && touch cnf/diffs/perl5-5.34.0/xconfig.applied
>  | patch -p1 -i cnf/diffs/perl5-5.34.0/posix-makefile.patch && touch cnf/diffs/perl5-5.34.0/posix-makefile.applied
>  | File dist/Time-HiRes/Makefile.PL is read-only; trying to patch anyway
>  | patching file dist/Time-HiRes/Makefile.PL
>  | Reversed (or previously applied) patch detected!  Assume -R? [n]
>  | Apply anyway? [n]
>  | Skipping patch.
>  | 4 out of 4 hunks ignored -- saving rejects to file dist/Time-HiRes/Makefile.PL.rej
>  | patch -p1 -i cnf/diffs/perl5-5.34.0/test-commonsense.patch && touch cnf/diffs/perl5-5.34.0/test-commonsense.applied
>  | File perl.h is read-only; trying to patch anyway
>  | patching file perl.h
>  | Reversed (or previously applied) patch detected!  Assume -R? [n]
>  | Apply anyway? [n]
>  | Skipping patch.
>  | 1 out of 1 hunk ignored -- saving rejects to file perl.h.rej
>  | make[1]: *** [Makefile:64: cnf/diffs/perl5-5.34.0/time-hires.applied] Error 1
>  [snip]
> 
> It's because the source files patched twice, so let do_fetch always
> executed to make sure the source files which come from SRC_URI brand
> new in each build to avoid the source files patched twice to fix the
> build failure as above.
> 
> Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
> ---
>  meta/recipes-devtools/perl/perl_5.34.0.bb | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/meta/recipes-devtools/perl/perl_5.34.0.bb b/meta/recipes-devtools/perl/perl_5.34.0.bb
> index 7935a58723..2e48110d2b 100644
> --- a/meta/recipes-devtools/perl/perl_5.34.0.bb
> +++ b/meta/recipes-devtools/perl/perl_5.34.0.bb
> @@ -382,3 +382,5 @@ EOF
>         chmod 0755 ${SYSROOT_DESTDIR}${bindir}/nativeperl
>         cat ${SYSROOT_DESTDIR}${bindir}/nativeperl
>  }
> +
> +do_fetch[nostamp] = "1"

This seems to cause:

ERROR: The perl-native:do_fetch sig is computed to be ad5d35a67fb7dfcb2a67797631d358f99809c2c568f44db1b4e866f894368d3e, but the sig is locked to b715d1392c57c5341b05be30d4cdeaf2a443bae900890da8e053b9fc1650480b in SIGGEN_LOCKEDSIGS_t-x86-64
The perl:do_fetch sig is computed to be 83844d137b60382447e71889fc92deb568e52f2f9e8b214d86c3a608af8e8bce, but the sig is locked to a269ce4ca52954820059edc72f464379b71186be0b0bd9927b3fb3d716395e66 in SIGGEN_LOCKEDSIGS_t-core2-64

See https://autobuilder.yoctoproject.org/typhoon/#/builders/69/builds/3557/steps/24/logs/stdio

Can you check?

Regards

> -- 
> 2.17.1
> zO

> 
> 
> 


-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
