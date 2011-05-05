Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1QI7AQ-0002GG-HC for openembedded-core@lists.openembedded.org;
	Fri, 06 May 2011 00:37:06 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p45MYMra016809;
	Thu, 5 May 2011 23:34:22 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 16554-04; Thu,  5 May 2011 23:34:19 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p45MYC1S016803
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Thu, 5 May 2011 23:34:16 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: "Cui, Dexuan" <dexuan.cui@intel.com>
In-Reply-To: <1865303E0DED764181A9D882DEF65FB69334F4BD75@shsmsx502.ccr.corp.intel.com>
References: <cover.1302936483.git.sgw@linux.intel.com>
	<eee3fb921c3e9c6439df2540a552719c9327ebd4.1302936483.git.sgw@linux.intel.com>
	<1303102414.5518.30.camel@rex>
	<1865303E0DED764181A9D882DEF65FB6900D7D5708@shsmsx502.ccr.corp.intel.com>
	<1303109647.5518.54.camel@rex>
	<1865303E0DED764181A9D882DEF65FB69334F4BD75@shsmsx502.ccr.corp.intel.com>
Date: Thu, 05 May 2011 23:34:11 +0100
Message-ID: <1304634851.30391.54.camel@rex>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.2 
X-Virus-Scanned: amavisd-new at rpsys.net
Cc: 'Patches and discussions about the oe-core layer'
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 37/58] gnu-config-native: add dependency on perl-native
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 05 May 2011 22:37:06 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2011-05-05 at 22:18 +0800, Cui, Dexuan wrote:
> (Sorry for my delay for the task as I was working on other bugs...)
> Recently I have been looking into it and I've made some commits (the
> top 5 small commits) in
> http://git.pokylinux.org/cgit/cgit.cgi/poky-contrib/log/?h=dcui/master_perl-native 
> BTW: the work is not done completely as some recipes don't build
> with the changes. Please have a look anyway to see if I'm in the correct direction.
> 
> However, I've got some difficulties and hope to get your help:
> 1)  As you said, after we install perl-native into its own directory,
> any recipe not depending on perl-native doesn't see
> ${STAGING_BINDIR_NATIVE}/perl-native/perl unnecessarily.
> However, if we keep the current code, what's the bad consequence if
> the recipe not depending on perl-native does see perl of perl-native?
> looks no?

We have an assumption that perl is already on the system we're building
on. Perl is a relatively stable language with defined compatibility and
interoperability. Most recipes are therefore fine using perl from the
build system directly and don't need perl-native. I think we defined a
special name for the build system perl (perl-native-runtime?). Better
names are welcome but we should ensure we use the right dependency in
the right places.

The time to use perl-native instead of perl-native-runtime is where any
perl module is being built, perl itself is being built or anything that
has an explicit dependency on the perl version present.

> 2) In poky, I see many places hardcodedly use the system
> perl(i.e., /usr/bin/perl) explicitly or implicitly(e.g,
> meta/recipes-devtools/gnu-config/gnu-config/gnu-configize.in
> contains /usr/bin/perl; another example,  in perl-5.12.3's source
> code, Cross/generate_config_sh also contains #!/usr/bin/perl). Should
> we fix all of them?

Most of these should be generated locations and I think this is fine
since most of these are "perl-native-runtime" uses and its fine to use
the build system perl.

>    And what's the relationship between the system perl and
> perl-native? Since perl-native is not less functional than the system
> perl, will we eliminate the system perl as a prerequisite to bitbake
> in future?

No, I think you have this backwards. The intent is to have
"perl-native-runtime" denoting a requirement on the build system perl
and "perl-native" being a perl that exactly the same as the target perl
for cross purposes.

> 3) In gnu-config_20080123.bb's do_install, I don't understand this lines: here the "!=" should be "="?
>     if [ "${BUILD_ARCH}" != "${TARGET_ARCH}" ]; then
>         sed -i -e 's,/usr/bin/env,${bindir}/env,g' ${D}${bindir}/gnu-configize
>     fi

This means it only applies for non-native packages. (native has
BUILD_ARCH=TARGET_ARCH). The path to env is ${bindir} and this assists
with things like the nativesdk packages where bindir != "/usr/bin".

> e.g. when building gnu-config-native for MACHINE qemux86 on a 32-bit
> host,  BUILD_ARCH=TARGET_ARCH=i686-linux and the sed isn't invoked;
> when building gnu-config, the sed will be invoked, but bindir is
> just /usr/bin, so the replacement operation actually does nothing.

You can define a system where exec_prefix is "" and bindir is hence
"/bin" when it wouldn't do nothing.

> And for gnu-config-native, I think we need do a 
> sed -i -e 's,/usr/bin/perl,${STAGING_BINDIR_NATIVE}/perl-native/perl,g' ${D}${bindir}/gnu-configize
> Correct?

No, the whole point is to stop it seeing perl-native. Only perl itself
and modules should be using perl-native.

> 4) My last commit of the top 5 commits is a chaos... I'm trying to
> replace every "DEPENDS on perl-native" with "inherit perlnative".
> I'm now stuck in fixing the build issues for libxml-parser-perl and libxml-parser-perl-native.
> I don't know how to fix get_perl_version and perl_get_libdirs in
> cpan-base.bbclass -- for libxml-parser-perl-native, I have to manage
> to add a "/perl-native" into STAGING_LIBDIR and libdir, but for
> libxml-parser-perl, I can't change STAGING_LIBDIR and libdir. Can you
> please help me out?

I'd suggest splitting this into two steps:

a) Check through all perl-native references and correct the ones that 
   should be perl-native-runtime.
b) Replace all remaining perl-native references with the class 
   dependency.

In step a), gnu-config would have a dependency on perl-native-runtime so
wouldn't use the perlnative class.

Just for reference, using perl-native-runtime means that someone can
remove it from ASSUME_PROVIDED and provide a version of it themselves if
they so wish (using perl-native or otherwise).

I suspect you'll still have the libxml-parser-perl problem but lets take
this one step at a time! :)

Cheers,

Richard



