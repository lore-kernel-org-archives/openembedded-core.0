Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 7DEA278436
	for <openembedded-core@lists.openembedded.org>;
	Wed,  3 Jan 2018 21:51:05 +0000 (UTC)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.15.2/8.15.2/Debian-3) with ESMTPSA id
	w03Lp466018006
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128
	verify=NOT); Wed, 3 Jan 2018 21:51:05 GMT
Message-ID: <1515016264.5525.170.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Randy MacLeod <randy.macleod@windriver.com>, "Bai, Haiqing"
	<Haiqing.Bai@windriver.com>, "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Date: Wed, 03 Jan 2018 21:51:04 +0000
In-Reply-To: <ebbe74ac-1574-3793-7ff8-eba517c5578c@windriver.com>
References: <1511938459-22871-1-git-send-email-Haiqing.Bai@windriver.com>
	<1512946109.19417.136.camel@linuxfoundation.org>
	<C2A454FDE6C23F41BD5011E2458C46C9CEF081F1@ALA-MBD.corp.ad.wrs.com>
	<1513070552.19417.153.camel@linuxfoundation.org>
	<ebbe74ac-1574-3793-7ff8-eba517c5578c@windriver.com>
X-Mailer: Evolution 3.18.5.2-0ubuntu3.2 
Mime-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.2 at dan
X-Virus-Status: Clean
Subject: Re: [PATCH] gmp: depends on flex-native to fix parallel building issue
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
X-List-Received-Date: Wed, 03 Jan 2018 21:51:05 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Wed, 2018-01-03 at 16:35 -0500, Randy MacLeod wrote:
> I expect I'm missing an undocumented recipe rule here but...
> 
> 
> Yes, the race seems to only occur on morty and earlier, but
> the dependency is real and not yet listed explicitly in the recipe.
> 
>   $ grep flex tmp/work/i586-poky-linux/gmp/6.1.2-
> r0/temp/log.do_configure
>     checking for flex... flex
> 
> It's resolved transitively through:
>     gmp -> something -> binutils-cross-foo -> flex-native

I think it can happily build without flex by not re-generating certain
files. Whilst on target gmp does seem to have an indirect dependency,
our cross compiler does not:

$ grep flex tmp/work/x86_64-linux/gmp-native/6.1.2-r0/temp/log.do_configure
checking for flex... no

due to recipe specific sysroots and HOSTTOOLS, this is all at least
deterministic and it either builds with or without it deterministically
in all cases.

> I was on the fence about whether to be explicit or to rely on
> most/all recipes pulling in binutils-cross-foo via default
> rules. In looking at the guidance in 4.3.9 Dependencies:
>  
> http://www.yoctoproject.org/docs/current/dev-manual/dev-manual.html#n
> ew-dependencies
> and briefly checking out LLVM's lld loader recipe where it seems
> that flex-native might not be needed so it's best to be explicit.
> 
> Unless there's an objection, Bai will re-submit the simple
> fix with an updated commit log. If anyone has time, they
> can check if the LLVM lld build really does NOT pull in flex-native
> and if not, then add explicit dependencies as required.

Actually, I do strongly object to adding in a flex-native dependency to
gmp-native and lengthening an already long/cumbersome toolchain
bootstrap process.

Cheers,

Richard



