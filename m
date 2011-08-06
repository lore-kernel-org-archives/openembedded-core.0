Received: from gate.crashing.org ([63.228.1.57]
	ident=[U2FsdGVkX18PvttEjFJ4raPclUDIZP47pDGb6TW1IvQ=])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <galak@kernel.crashing.org>) id 1QpnsI-0001Qy-Fu
	for openembedded-core@lists.openembedded.org;
	Sat, 06 Aug 2011 22:53:38 +0200
Received: from [IPv6:::1] (localhost.localdomain [127.0.0.1])
	by gate.crashing.org (8.14.1/8.13.8) with ESMTP id p76Kn9wS028214
	for <openembedded-core@lists.openembedded.org>;
	Sat, 6 Aug 2011 15:49:12 -0500
Mime-Version: 1.0 (Apple Message framework v1084)
From: Kumar Gala <galak@kernel.crashing.org>
In-Reply-To: <4E3C5DE7.1050601@gmail.com>
Date: Sat, 6 Aug 2011 15:49:09 -0500
Message-Id: <23260DD0-C538-496D-AB74-40F7D13A4A17@kernel.crashing.org>
References: <1312575061-27569-1-git-send-email-galak@kernel.crashing.org>
	<4E3C5DE7.1050601@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Mailer: Apple Mail (2.1084)
Subject: Re: [PATCH] tune-ppce5500: Add a tune file for PowerPC e5500 core
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
X-List-Received-Date: Sat, 06 Aug 2011 20:53:39 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit


On Aug 5, 2011, at 4:17 PM, Khem Raj wrote:

> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
> 
> On 08/05/2011 01:11 PM, Kumar Gala wrote:
>> Signed-off-by: Kumar Gala <galak@kernel.crashing.org> --- 
>> meta/conf/machine/include/tune-ppce5500.inc |   14 ++++++++++++++ 1
>> files changed, 14 insertions(+), 0 deletions(-) create mode 100644
>> meta/conf/machine/include/tune-ppce5500.inc
>> 
>> diff --git a/meta/conf/machine/include/tune-ppce5500.inc
>> b/meta/conf/machine/include/tune-ppce5500.inc new file mode 100644 
>> index 0000000..8e6403d --- /dev/null +++
>> b/meta/conf/machine/include/tune-ppce5500.inc @@ -0,0 +1,14 @@ 
>> +DEFAULTTUNE ?= "ppce5500" + +require
>> conf/machine/include/powerpc/arch-powerpc64.inc + 
>> +TUNEVALID[ppce5500] = "Enable ppce5500 specific processor
>> optimizations"
> 
> just a nit may be it should read "Enable ppce5500 processor specific
> optimizations"
> 
>> +TUNE_CCARGS += "${@bb.utils.contains("TUNE_FEATURES", "ppce5500",
>> "-mcpu=e5500", "", d)}" +TUNE_PKGARCH =
>> "${@bb.utils.contains("TUNE_FEATURES", "ppce5500", "ppce5500",
>> "${PPCPKGARCH}", d)}" + +AVAILTUNES += "ppce5500" 
>> +TUNE_FEATURES_tune-ppce5500 = "m64 ppce5500" 
>> +PACKAGE_EXTRA_ARCHS_tune-ppce5500 = "powerpc64 ppce5500" + +# glibc
>> configure options to get e5500 specific library (for sqrt) 
>> +GLIBC_EXTRA_OECONF += "--with-cpu=e5500"
> 
> hmm so this essentially makes eglibc specific to this processor. Does it
> build eglibc inside work/ppce5500-oe-linux-gnuspe dir ? or something
> generic e.g. powerpc64-oe-linux-gnuspe dir ? In case its former then all
> is well but latter case may not be ok since we may not be able to share
> eglibc binaries with similar implementations of ppc64 in this case
> 
> I am more worried about proliferation into other architectures e.g. arm
> which has multiple armv7 implementations e.g.

On PPC the works dirs are already somewhat 'tune' specific:

build-p5020/tmp/work/p5020_ds-poky-linux
build-p5020/tmp/work/ppce5500-poky-linux

An eglibc is built in ppce5500-poky-linux

- k


