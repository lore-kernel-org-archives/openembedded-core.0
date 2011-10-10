Received: from dan.rpsys.net ([93.97.175.187])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1RDI3P-0002iu-6D for openembedded-core@lists.openembedded.org;
	Mon, 10 Oct 2011 17:46:11 +0200
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.2/8.14.2/Debian-2build1) with ESMTP id
	p9AFl5Fa031322 for <openembedded-core@lists.openembedded.org>;
	Mon, 10 Oct 2011 16:47:06 +0100
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id 1-jxXCIEU2sN
	for <openembedded-core@lists.openembedded.org>;
	Mon, 10 Oct 2011 16:47:05 +0100 (BST)
Received: from [192.168.1.66] (tim [93.97.173.237]) (authenticated bits=0)
	by dan.rpsys.net (8.14.2/8.14.2/Debian-2build1) with ESMTP id
	p9AFkwJt031315
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 10 Oct 2011 16:47:00 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Mon, 10 Oct 2011 16:40:18 +0100
In-Reply-To: <1FEC2574-7F52-460C-A837-4A66C9DF1834@dominion.thruhere.net>
References: <1318255623.23801.31.camel@ted>
	<1FEC2574-7F52-460C-A837-4A66C9DF1834@dominion.thruhere.net>
X-Mailer: Evolution 3.1.91- 
Message-ID: <1318261226.23801.49.camel@ted>
Mime-Version: 1.0
Subject: Re: [PATCH] bitbake.conf: Exclude MACHINE from OVERRIDES variable dependency list
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
X-List-Received-Date: Mon, 10 Oct 2011 15:46:11 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2011-10-10 at 17:02 +0200, Koen Kooi wrote:
> Op 10 okt. 2011, om 16:06 heeft Richard Purdie het volgende geschreven:
> 
> > Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> > ---
> > diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
> > index a1420cf..11d76b8 100644
> > --- a/meta/conf/bitbake.conf
> > +++ b/meta/conf/bitbake.conf
> > @@ -669,6 +669,7 @@ AUTO_LIBNAME_PKGS = "${PACKAGES}"
> > OVERRIDES = "${TARGET_OS}:${TARGET_ARCH}:build-${BUILD_OS}:pn-${PN}:${MACHINEOVERRIDES}:${DISTROOVERRIDES}:forcevariable"
> > DISTROOVERRIDES ?= "${DISTRO}"
> > MACHINEOVERRIDES ?= "${MACHINE}"
> > +OVERRIDES[vardepsexclude] = "MACHINE"
> > 
> > CPU_FEATURES ?= ""
> > CPU_FEATURES_arm ?= "vfp"
> 
> 
> MACHINE=omap4430-panda bitbake bash -c cleansstate
> MACHINE=beagleboard bitbake bash
> MACHINE=omap4430-panda bitbake bash
> 
> It fully built bash in both case, the diffsig sleuthing I was able to do:
> 
> koen@dominion:/OE/tentacle/build/tmp-angstrom_2010_x-eglibc/stamps/armv7a-angstrom-linux-gnueabi$ ls | grep bash | grep sigdata | sort
> bash-4.1-r2.do_cleansstate.sigdata.dade34525ff3d7567b7e86b24a36307b
> bash-4.1-r2.do_fetch.sigdata.15f6bc3de53f1de78303e73688c4f340
> bash-4.1-r2.do_unpack.sigdata.980bf1d8267fee1ac36b68c96c4f268c
> bash-4.1-r2.do_patch.sigdata.0185f3c332733ffa162bc38244f2f0b4
> bash-4.1-r2.do_configure.sigdata.4527bef6d2e22f73a51628c2ac5e7d4e
> bash-4.1-r2.do_compile.sigdata.d5cb0399ec5f76911c78cfc99a05663a
> bash-4.1-r2.do_install.sigdata.b1781f7a0718ba9922a970820d565455
> bash-4.1-r2.do_package.sigdata.2a38d9a1a086e31e620321c1b346514f
> bash-4.1-r2.do_package.sigdata.4c4f326e3ba2029d207aca186c9ea332
> bash-4.1-r2.do_package_write_ipk.sigdata.191dbf64100c3b552a86c361a07e134f
> bash-4.1-r2.do_populate_sysroot.sigdata.1643e8bfc8905ff3f269b8ca40d16d17
> bash-4.1-r2.do_rm_work_all.sigdata.25cbc1786f8d193c1569e77497d098af
> bash-4.1-r2.do_rm_work_all.sigdata.d019b1e392601856aa407615da0c54af
> bash-4.1-r2.do_rm_work.sigdata.1453d491285d51b9a88a913bcc6cc72c
> bash-4.1-r2.do_rm_work.sigdata.b8f0f9e26355b721638b66069ad83e4e
> bash-4.1-r2.do_populate_lic.sigdata.c7c785ae2f366e5a0d8bea4e144e43d0
> 
> koen@dominion:/OE/tentacle/build/tmp-angstrom_2010_x-eglibc/stamps/armv7a-angstrom-linux-gnueabi$ bitbake-diffsigs bash-4.1-r2.do_package.sigdata.2a38d9a1a086e31e620321c1b346514f bash-4.1-r2.do_package.sigdata.4c4f326e3ba2029d207aca186c9ea332
> basehash changed from da302dbd386f214d39fbd6fb01267c8d to 1b439cf1d8c12894e96e96b299a27c12
> Variable MACHINE value changed from beagleboard to omap4430-panda

So this tells us what changed but it doesn't tell us why its being
depended upon. Could you share the output of:

/OE/tentacle/build/tmp-angstrom_2010_x-eglibc/stamps/armv7a-angstrom-linux-gnueabi$ bitbake-diffsigs bash-4.1-r2.do_package.sigdata.2a38d9a1a086e31e620321c1b346514f 

please so we can see why bash is depending on MACHINE?

Cheers,

Richard



