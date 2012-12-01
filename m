Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1TeoNY-00063t-Ch for openembedded-core@lists.openembedded.org;
	Sat, 01 Dec 2012 15:49:17 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id qB1EYvHL008149;
	Sat, 1 Dec 2012 14:34:57 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 08044-02; Sat,  1 Dec 2012 14:34:52 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id qB1EYmiM008143
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=NO);
	Sat, 1 Dec 2012 14:34:49 GMT
Message-ID: <1354372477.5970.2.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Martin Jansa <martin.jansa@gmail.com>
Date: Sat, 01 Dec 2012 14:34:37 +0000
In-Reply-To: <20121130163855.GG3436@jama.jama.net>
References: <20121130163855.GG3436@jama.jama.net>
X-Mailer: Evolution 3.2.3-0ubuntu6 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Cc: openembedded-core@lists.openembedded.org
Subject: Re: some variables not expanded corectly before BUILDCFG_VARS are shown
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sat, 01 Dec 2012 14:49:17 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2012-11-30 at 17:40 +0100, Martin Jansa wrote:
> Hi,
> 
> when testing tune files I've noticed that TUNE_FEATURES are always shown
> the same, even when build uses different value set from local.conf:
> 
> I've added DEFAULTTUNE to BUILDCFG_VARS to be sure:
> BUILDCFG_VARS = "BB_VERSION BUILD_SYS NATIVELSBSTRING TARGET_SYS MACHINE
> DISTRO DISTRO_VERSION TUNE_FEATURES DEFAULTTUNE TARGET_FPU"
> 
> I was changing DEFAULTTUNE with machine override in local.conf or .inc
> file required from local.conf.
> 
> $ grep DEFAULTTUNE conf/local.conf 
> DEFAULTTUNE_om-gta02 = "arm920t"
> DEFAULTTUNE_nokia900 = "cortexa8t-neon"
> DEFAULTTUNE_tuna = "cortexa9t-neon"
> 
> But the output at the beginning of build log was still the same. 
> 1st is without any change to DEFAULTTUNE (so correctly armv4t and armv7a-neon)
> 2nd is with DEFAULTTUNE set in conf/local.conf with machine override
> 3rd is with default DEFAULTTUNE changed in tune-* file
> 
> 2nd and 3rd correctly uses cortexa9t-neon/cortexa8t-neon/arm920t tune, but only 3rd shows it:
> nokia900/20121130041857.log:DEFAULTTUNE       = "armv7a-neon"
> nokia900/20121130041857.log:TUNE_FEATURES     = "armv7a vfp neon"
> nokia900/20121130101904.log:DEFAULTTUNE       = "armv7a-neon"
> nokia900/20121130101904.log:TUNE_FEATURES     = "armv7a vfp neon"
> nokia900/20121130135815.log:DEFAULTTUNE       = "cortexa8t-neon"
> nokia900/20121130135815.log:TUNE_FEATURES     = "armv7a vfp thumb neon cortexa8"
> om-gta02/20121130042112.log:DEFAULTTUNE       = "armv4t"
> om-gta02/20121130042112.log:TUNE_FEATURES     = "armv4 thumb"
> om-gta02/20121130102310.log:DEFAULTTUNE       = "armv4t"
> om-gta02/20121130102310.log:TUNE_FEATURES     = "armv4 thumb"
> om-gta02/20121130140126.log:DEFAULTTUNE       = "arm920t"
> om-gta02/20121130140126.log:TUNE_FEATURES     = "armv4 thumb arm920t"
> tuna/20121130041547.log:DEFAULTTUNE       = "armv7a-neon"
> tuna/20121130041547.log:TUNE_FEATURES     = "armv7a vfp neon"
> tuna/20121130101500.log:DEFAULTTUNE       = "armv7a-neon"
> tuna/20121130101500.log:TUNE_FEATURES     = "armv7a vfp neon"
> tuna/20121130135506.log:DEFAULTTUNE       = "cortexa8t-neon"
> tuna/20121130135506.log:TUNE_FEATURES     = "armv7a vfp thumb neon cortexa8"
> 
> What's even more strange is that "thumb" override get applied in different order in 3rd build:
> $ bitbake-diffsigs  tmp-eglibc/sstate-diff/13542[78]*/nokia900/cor*/libmad*/*do_con*
> basehash changed from 8ad5d9c1803fed09a89e626c07581cb1 to 7e316bb3c389fe3cda6652ac1476a883
> Variable EXTRA_OECONF value changed from 
> -enable-speed --enable-shared --enable-fpm=arm --disable-aso --enable-fpm=default 
> to 
> -enable-speed --enable-shared --disable-aso --enable-fpm=default --enable-fpm=arm
> # because libmad has:
> # The ASO's don't take any account of thumb...
> EXTRA_OECONF_append_thumb = " --disable-aso --enable-fpm=default"
> EXTRA_OECONF_append_arm = " --enable-fpm=arm"
> But both 2srd and 3rd got --mtune=cortexa8.
> 
> buildhistory.bbclass seems to read the same TUNE_PKGARCH (armv4t), 
> all other builds are in arm920tt-oe-linux-gnueabi:
> $ find ~/shr-core/tmp-eglibc/work/armv4t-oe-linux-gnueabi
> /OE/shr-core/tmp-eglibc/work/armv4t-oe-linux-gnueabi
> /OE/shr-core/tmp-eglibc/work/armv4t-oe-linux-gnueabi/bblayers
> /OE/shr-core/tmp-eglibc/work/armv4t-oe-linux-gnueabi/bblayers/1.0-r0
> /OE/shr-core/tmp-eglibc/work/armv4t-oe-linux-gnueabi/bblayers/1.0-r0/bblayers-1.0
> /OE/shr-core/tmp-eglibc/work/armv4t-oe-linux-gnueabi/bblayers/1.0-r0/temp
> /OE/shr-core/tmp-eglibc/work/armv4t-oe-linux-gnueabi/bblayers/1.0-r0/temp/run.buildhistory_commit.4401
> /OE/shr-core/tmp-eglibc/work/armv4t-oe-linux-gnueabi/bblayers/1.0-r0/temp/run.buildhistory_commit.6566
> /OE/shr-core/tmp-eglibc/work/armv4t-oe-linux-gnueabi/bblayers/1.0-r0/temp/run.buildhistory_commit.11843
> 
> Any idea what is causing that?

Was this with or without the recent bitbake patch "data_smart: Improve
get_hash to account for overrides and key expansion" ? if without,
please see if that helps...

Cheers,

Richard





