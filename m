Return-Path: <joaohf@gmail.com>
Received: from mail-vc0-f170.google.com (mail-vc0-f170.google.com
	[209.85.220.170])
	by mail.openembedded.org (Postfix) with ESMTP id 355DC65C70
	for <openembedded-core@lists.openembedded.org>;
	Wed, 16 Jul 2014 03:00:22 +0000 (UTC)
Received: by mail-vc0-f170.google.com with SMTP id lf12so529523vcb.29
	for <openembedded-core@lists.openembedded.org>;
	Tue, 15 Jul 2014 20:00:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=message-id:date:from:user-agent:mime-version:to:subject:references
	:in-reply-to:content-type:content-transfer-encoding;
	bh=1gHAZefIrYNWy4npepIoy/d+O5F0FA7NpViX0BTiZb0=;
	b=BIdu9RYR2XPzA2UqoH0bcXPmPoSqkWdbmA+iaZ323DBoBHV74nX4oI6j5Wdbv+wGsf
	j/KwtEIeiuumz9earRitdzXGAD57PLFhPqpYCb3j/5OV0RTT5alj2aAwFzon4Q6n0FVM
	HDmRRY/WAB5Lq0SMS3+hyFE8ESaFMUkrza7iJy2KC5QZYzXR6zunG/uc3l7f0c6nJUJA
	a+X2L8q7kEbD2OLQm26yD+YWhpAtQlwgAuKl4NEoJ7IHsPFfohykYJgQp/Adm6FkPhBe
	YK+z3/uxcZlJJFmyCbfTbtrKL2bCLfsWZrDzjEpsnve7W9vwT6dsVsr3yLvaLMOLCSaw
	uQkQ==
X-Received: by 10.52.171.233 with SMTP id ax9mr3763682vdc.76.1405479623884;
	Tue, 15 Jul 2014 20:00:23 -0700 (PDT)
Received: from [192.168.0.12] ([201.53.220.248])
	by mx.google.com with ESMTPSA id y8sm28547591vdj.25.2014.07.15.20.00.21
	for <multiple recipients>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Tue, 15 Jul 2014 20:00:23 -0700 (PDT)
Message-ID: <53C5EAC3.3020901@gmail.com>
Date: Wed, 16 Jul 2014 00:00:19 -0300
From: =?ISO-8859-1?Q?Jo=E3o_Henrique_Ferreira_de_Freitas?= <joaohf@gmail.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.6.0
MIME-Version: 1.0
To: Paul Gortmaker <paul.gortmaker@windriver.com>, 
	openembedded-core@lists.openembedded.org
References: <1403131683-28758-1-git-send-email-paul.gortmaker@windriver.com>
In-Reply-To: <1403131683-28758-1-git-send-email-paul.gortmaker@windriver.com>
Subject: Re: [PATCH] perl: strip RPATH from libxml-parser-perl Expat.so
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
X-List-Received-Date: Wed, 16 Jul 2014 03:00:30 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 8bit

Hi Paul,


I got this error.

On daisy branch, I was using a MACHINE=genericx86 then I changed to 
MACHINE=crownbay and build my image. libxml-parser-perl shows the same 
problem.

So I did 'bitbake perl -c cleansstate' and 'bitbake libxml-parser-perl'. 
No problems anymore, until I change back to genericx86.

But this is odd and I am trying to figure out what is the problem.


Em 18-06-2014 19:48, Paul Gortmaker escreveu:
> To fix:
>
> ERROR: QA Issue: package libxml-parser-perl contains bad RPATH /home/paul/poky/build/tmp/sysroots/intel-corei7-64/usr/lib64 in file /home/paul/poky/build/tmp/work/corei7-64-poky-linux/libxml-parser-perl/2.41-r3/packages-split/libxml-parser-perl/usr/lib64/perl/vendor_perl/5.14.3/auto/XML/Parser/Expat/Expat.so
> ERROR: QA run found fatal errors. Please consider fixing them.
> ERROR: Function failed: do_package_qa
> ERROR: Logfile of failure stored in: /home/paul/poky/build/tmp/work/corei7-64-poky-linux/libxml-parser-perl/2.41-r3/temp/log.do_package.28544
> ERROR: Task 4102 (/home/paul/poky/meta/recipes-devtools/perl/libxml-parser-perl_2.41.bb, do_package) failed with exit code '1'
>
> ...which showed up when enabling a multilib build.
>
> Signed-off-by: Paul Gortmaker <paul.gortmaker@windriver.com>
>
> diff --git a/meta/recipes-devtools/perl/libxml-parser-perl_2.41.bb b/meta/recipes-devtools/perl/libxml-parser-perl_2.41.bb
> index 43a8a84518d3..2488aacb682c 100644
> --- a/meta/recipes-devtools/perl/libxml-parser-perl_2.41.bb
> +++ b/meta/recipes-devtools/perl/libxml-parser-perl_2.41.bb
> @@ -27,6 +27,7 @@ do_configure_append() {
>   do_compile() {
>   	export LIBC="$(find ${STAGING_DIR_TARGET}/${base_libdir}/ -name 'libc-*.so')"
>   	cpan_do_compile
> +	chrpath -d ${S}/blib/arch/auto/XML/Parser/Expat/Expat.so
>   }
>   
>   do_compile_class-native() {

-- 
João Henrique Ferreira de Freitas - joaohf_at_gmail.com
Campinas-SP-Brasil


