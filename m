Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (dan.rpsys.net [93.97.175.187])
	by mail.openembedded.org (Postfix) with ESMTP id 3042661006
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 Sep 2013 12:01:12 +0000 (UTC)
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r8BCEiVP031596; Wed, 11 Sep 2013 13:14:44 +0100
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id eavivF_XLzgb; Wed, 11 Sep 2013 13:14:43 +0100 (BST)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r8BCEeWa031586
	(version=TLSv1/SSLv3 cipher=DHE-RSA-CAMELLIA256-SHA bits=256
	verify=NOT); Wed, 11 Sep 2013 13:14:41 +0100
Message-ID: <1378900852.3484.179.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Nicolas Dechesne <nicolas.dechesne@linaro.org>
Date: Wed, 11 Sep 2013 13:00:52 +0100
In-Reply-To: <CAP71Wjynkd=CGry-YKvEetsuGvoXmhwhVAF1rXuOuo-nh7V2CQ@mail.gmail.com>
References: <CAP71Wjynkd=CGry-YKvEetsuGvoXmhwhVAF1rXuOuo-nh7V2CQ@mail.gmail.com>
X-Mailer: Evolution 3.6.4-0ubuntu1 
Mime-Version: 1.0
Cc: Linaro Dev <linaro-dev@lists.linaro.org>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: OE gcc-cross with builtin sysroot, BUG?
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
X-List-Received-Date: Wed, 11 Sep 2013 12:01:12 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2013-09-11 at 12:29 +0200, Nicolas Dechesne wrote:
> our bug appeared because we were 'wrongly' unsetting the CFLAGS from
> OE in one of our recipe, so we would loose the following from our
> compilation command line
>
> -march=armv7-a
> -marm
> -mthumb-interwork
> -mfloat-abi=hard
> -mfpu=neon
> --sysroot=/work/rdk/build-genericarmv7a/tmp/sysroots/genericarmv7a

>
> The compilation error was that stdlib.h was not found. 
> 
> 
> as a matter of fact, we build for several different machines (.conf
> file), *but* we share the same sstate and downloads for all machines.
> We don't do parallel builds, each machine is built sequentially in its
> own build folder (.../workspace/machines/<MACHINE>/build), and all
> build folder are deleted before each build (of course sstate and
> downloads aren't deleted).
> 
> 
> What we noticed is that we end up pulling the compiler (gcc-cross)
> from sstate as expected. However we pull the same 'blob' from sstate
> for gcc-cross for *all* machines we build. It does seem that the
> compiler does not use $MACHINE for the sstate checksum. 
> 
> 
> When the gcc-cross package was built and pushed in sstate, it was
> being built for a specific machine (let's say MACHINE-A), hence the
> compiler has the 'builtin' sysroot set to 'tmp/sysroots/MACHINE-A'. 
>
> Now when building our image for MACHINE-B, we pull gcc-cross from
> sstate, and we get the default builtin sysroot for MACHINE-A!! That's
> why our build failed, because we tried to build MACHINE-B before
> MACHINE-A, so stdlib.h wasn't there yet on Jenkins..
>
> To me the problem is that gcc-cross 'embedds' some $MACHINE data in
> its package, but it is not marked as 'machine specific, but arch
> specific.  So several machines will end up sharing the same gcc-cross
> package.
>
> So, of course we shouldn't ignore the CFLAGS from OE, and the CFLAGS
> would set the right sysroot, and of course we fixed our software so
> that we don't ignore CFLAGS anymore... but that still looks like a bug
> to me.
> 
Not really, its actually intentionally designed like this since its
pointless rebuilding gcc-cross multiple time just because we want to use
it with a different sysroot. We therefore just pass in the arguments to
the compiler to ensure it uses the right one. If you remove them, you
hit the problems you describe.

We should probably compile in a bogus sysroot so it never works and
makes this kind of issue more visible.

Cheers,

Richard



