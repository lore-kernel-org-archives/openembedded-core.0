Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 2CCD96076F
	for <openembedded-core@lists.openembedded.org>;
	Sun, 17 Jun 2018 13:13:10 +0000 (UTC)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.15.2/8.15.2/Debian-3) with ESMTPSA id
	w5HDD1mG028781
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NOT); Sun, 17 Jun 2018 14:13:02 +0100
Message-ID: <230ed53b0a05b5ed680ceff2d2004a2ddaa5b351.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: =?ISO-8859-1?Q?Andr=E9?= Draszik <git@andred.net>,
	openembedded-core@lists.openembedded.org
Date: Sun, 17 Jun 2018 14:13:01 +0100
In-Reply-To: <20180522122553.29109-1-git@andred.net>
References: <20180522122553.29109-1-git@andred.net>
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
X-List-Received-Date: Sun, 17 Jun 2018 13:13:11 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Tue, 2018-05-22 at 13:25 +0100, André Draszik wrote:
> From: André Draszik <andre.draszik@jci.com>
> 
> Currently, a dependency on any -native recipe will pull in
> all dependencies of that -native recipe in the recipe
> sysroot. This behaviour might not always be wanted, e.g.
> when that -native recipe depends on build-tools that are
> not relevant for the current recipe.
> 
> This change adds a SSTATE_EXCLUDEDEPS_SYSROOT variable,
> which will be evaluated for such recursive dependencies to
> be excluded. The idea is similar to
>    http://lists.openembedded.org/pipermail/openembedded-core/2018-Jan
> uary/146324.html
> except that the list is not hard-coded anymore.
> 
> SSTATE_EXCLUDEDEPS_SYSROOT is evaluated as two regular
> expressions of recipe and dependency to ignore, e.g. in
> the above flex-native / bison-native use-case, one would
> specify
> 
>     SSTATE_EXCLUDEDEPS_SYSROOT = ".*->(flex|bison)-native"
> 
> in layer.conf.
> 
> The existing special handling of "-initial" as well as
> "base-passwd" and "shadow-sysroot" could also be
> streamlined:
> 
>     SSTATE_EXCLUDEDEPS_SYSROOT += "\
>         .*->.*-initial.* \
>         .*(base-passwd|shadow-sysroot)->.* \
>     "
> 
> Another anticipated user is meta-java, where certain newer
> JDKs can only be bootstrapped (built) using older JDKs,
> but it doesn't make much sense to copy all those older
> JDKs and their own build tools (ant, etc.) into the
> sysroot of recipes wanting to be built using the newer JDK
> (only), e.g.:
> 
>     SSTATE_EXCLUDEDEPS_SYSROOT += "\
>         openjdk-8-native->(ant-native|attr-native|coreutils-
> native|icedtea7-native|libxslt-native|make-native|openssl-native|zip-
> native|unzip-native) \
>     "
> 
> Signed-off-by: André Draszik <andre.draszik@jci.com>
> ---
>  meta/classes/sstate.bbclass | 13 +++++++++++++
>  1 file changed, 13 insertions(+)
> 

I have some reservations about this series as I've previously mentioned
but I had a try at testing it on the autobuilder:

https://autobuilder.yocto.io/builders/build-appliance/builds/1059/steps/BuildImages_1/logs/stdio

Basically binutils-cross is bust with errors like:

| x86_64-poky-linux-ar: error while loading shared libraries: libfl.so.2: cannot open shared object file: No such file or directory
| make[5]: *** [libaudio_resampler_sse.la] Error 127

There are a ton of other failures, I've not waded through them but I'm
guessing there are similar issues.

Cheers,

Richard


