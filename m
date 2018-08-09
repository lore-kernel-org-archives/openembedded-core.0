Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 02D8D748DD
	for <openembedded-core@lists.openembedded.org>;
	Thu,  9 Aug 2018 09:26:56 +0000 (UTC)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.15.2/8.15.2/Debian-3) with ESMTPSA id
	w799Qgar005118
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NOT); Thu, 9 Aug 2018 10:26:43 +0100
Message-ID: <9b9b7f9ce9fa7aa969d04fcfccda747b7f5c0db8.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: =?ISO-8859-1?Q?Andr=E9?= Draszik <git@andred.net>,
	openembedded-core@lists.openembedded.org
Date: Thu, 09 Aug 2018 10:26:42 +0100
In-Reply-To: <ff0b2cb8ef77a1732c1401c1da0df6162ecb6519.camel@andred.net>
References: <20180522122553.29109-1-git@andred.net>
	<230ed53b0a05b5ed680ceff2d2004a2ddaa5b351.camel@linuxfoundation.org>
	<ff0b2cb8ef77a1732c1401c1da0df6162ecb6519.camel@andred.net>
X-Mailer: Evolution 3.28.1-2 
Mime-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.4 at dan
X-Virus-Status: Clean
Subject: Re: [PATCH 1/4] sstate: allow specifying indirect dependencies to exclude from sysroot
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
X-List-Received-Date: Thu, 09 Aug 2018 09:26:57 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Thu, 2018-08-09 at 10:00 +0100, André Draszik wrote:
> I should maybe explain my ultimate goal here:
> 
> meta-java is completely self-hosted, which is nice. But to be able to
> compile OpenJDK v8, various other Java compilers need to be compiled
> first.
> This of course means that all those different Java
> compilers/VMs/runtimes
> and tools needed to compile them end up in each Java recipe's
> sysroot.
> 
> While in theory this is fine, and all of them can be installed in
> parallel,
> as everything resides below subdirectories in /usr/lib/jvm/... and
> usr/bin/java normally is a symlink to the default chosen via update-
> alternatives, this doesn't work in yocto for -native recipes.
> 
> In particular this is annoying, because 'usr/bin/java' in the recipe
> sysroot
> is a *very* old version of java, with no possibility of control.
> 
> This has caused me a bit of headache, and if it was possible to avoid
> all
> the recursive OpenJDK-8 build time dependencies then:
> * usr/bin/java could disappear (for -native)
> * tools inherited from the OpenJDK-8 build can be avoided during
> other
>   recipe builds
> 
> In other words, as a follow-up to this series here I have a local
> meta-java
> change to meta-java's layer.conf:
> 
> SSTATE_EXCLUDEDEPS_SYSROOT += "\
>     openjdk-8-native->(ant-native|attr-native|coreutils-
> native|icedtea7-native|libxslt-native|make-native|openssl-native|zip-
> native|unzip-native) \
> "
> 
> This really is a similar situation to *-initial treatment in
> sstate.bbclass,
> but for Java / OpenJDK.
> 
> 
> So rather than having to add knowledge about Java / OpenJDK into
> sstate.bbclass, I need a way to inject that instead.
> 
> 
> Given the above, would you be happy to consider a series where the
> infrastructure is put in place, but without the flex-native and
> bison-native 
> changes? I.e. patches 1 through 3, but not patch 4 of this series?
> (With
> your previous review comments addressed, of course).
> 
> 
> > Basically binutils-cross is bust with errors like:
> > 
> > > x86_64-poky-linux-ar: error while loading shared libraries:
> > > libfl.so.2:
> > > cannot open shared object file: No such file or directory
> > > make[5]: *** [libaudio_resampler_sse.la] Error 127
> > 
> > There are a ton of other failures, I've not waded through them but
> > I'm
> > guessing there are similar issues.
> 
> I am not sure why I didn't see these in my builds before submitting,
> but now
> I do, too.
> 
> It looks like the cross binutils-native (or more specifically cross
> -ar)
> dynamically links against libflex-native. So the last patch in this
> series
> is of course responsible for that.
> 
> Comparing to my debian, ar isn't dynamically linked against libflex,
> I
> wonder why yocto does it, or why debian doesn't.
> 
> In any case my builds succeed now by dropping the flex-native from
> patch 4
> of this series. Alternative would be to switch to static linking for
> libflex. But see above.

The above is good info thanks. I'm not against the series, I originally
thought you wanted to optimise out flex-native and the test results
showed it didn't work so I was waiting on your response to that as the
series didn't build as it stood. I'd mentioned there were problems but
couldn't remember the specifics, you pushed me to "prove" it, I gave
you the errors.

The flex-native change doesn't work due to the binutils dependency and
may not work in general for anything linking to libfl. It would be
interesting to investigate why we have that linkage and if we can avoid
it. (Note that bison-native may work as it doesn't use a library iirc
so we could split that patch into two?).

I continue to be worried about the regular expression usage. I believe
modern python does some caching behind the scenes which helps but tight
loops with regexps in have caused us pain in the past, particularly
recompiling the expression each time and I worry about new API which
ties us to this. Is it possible to use glob?

I'm not against the patch series, we just need to drop the flex-native
change (maybe adding a special case for binutils if we can figure out
the linking) and figure out if we can use a simpler mechanism than
regexps or at least stop me worrying about performance. I'd need to
spend more time than I have right now to figure out how to properly
benchmark that function but as I said we have been bitten before :(.

Cheers,

Richard







