Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1TFOOI-0003v8-QO for openembedded-core@lists.openembedded.org;
	Sat, 22 Sep 2012 14:00:59 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q8MBmAoM005227;
	Sat, 22 Sep 2012 12:48:10 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 01554-06; Sat, 22 Sep 2012 12:48:04 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q8MBm31K005220
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=NO);
	Sat, 22 Sep 2012 12:48:04 +0100
Message-ID: <1348314483.10108.199.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Martin Jansa <martin.jansa@gmail.com>
Date: Sat, 22 Sep 2012 12:48:03 +0100
In-Reply-To: <20120921155238.GH10268@jama.jama.net>
References: <20120911130155.GC14077@jama.jama.net>
	<1347460383.11710.34.camel@ted> <20120913062017.GA11252@jama.jama.net>
	<1347532926.11710.66.camel@ted> <20120913121431.GB11252@jama.jama.net>
	<1347541111.11710.97.camel@ted> <20120915070142.GD11252@jama.jama.net>
	<20120921155238.GH10268@jama.jama.net>
X-Mailer: Evolution 3.2.3-0ubuntu6 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Cc: openembedded-core@lists.openembedded.org
Subject: Re: qemuarm: should it really have TUNE_ARCH armv5te?
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
X-List-Received-Date: Sat, 22 Sep 2012 12:00:59 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2012-09-21 at 17:52 +0200, Martin Jansa wrote:
> Even with last version of jansa/tune it does not really help with
> rebuilds
> 
> $ bitbake-diffsigs stamps.1348241943/*/armv5te-oe-linux-gnueabi/linux-libc-headers-3.4.3-r0.do_configure*
> basehash changed from 82dd3229952508550532e9ab37e78dc4 to 1d04ba204fe9afb1d346156dc066da93
> Variable TUNE_CCARGS value changed from  
> ${@bb.utils.contains("TUNE_FEATURES", "armv5", "-march=armv5${ARMPKGSFX_THUMB}${ARMPKGSFX_DSP}", "", d)} 
> ${@bb.utils.contains("TUNE_FEATURES", "armv4", "-march=armv4${ARMPKGSFX_THUMB}", "", d)} 
> ${@bb.utils.contains("TUNE_FEATURES", "thumb", "${ARM_THUMB_M_OPT}", "", d)} 
> ${@bb.utils.contains("TUNE_FEATURES", "no-thumb-interwork", "-mno-thumb-interwork", "-mthumb-interwork", d)} 
> ${@bb.utils.contains("TUNE_FEATURES", "vfp", bb.utils.contains("TUNE_FEATURES", "callconvention-hard", "-mfloat-abi=hard", "-mfloat-abi=softfp", d), "" ,d)} 
> ${@bb.utils.contains("TUNE_FEATURES", "arm926ejs", "-mtune=arm926ej-s", "", d)} 
> to  
> ${@bb.utils.contains("TUNE_FEATURES", "armv5", "-march=armv5${ARMPKGSFX_THUMB}${ARMPKGSFX_DSP}", "", d)} 
> ${@bb.utils.contains("TUNE_FEATURES", "armv4", "-march=armv4${ARMPKGSFX_THUMB}", "", d)} 
> ${@bb.utils.contains("TUNE_FEATURES", "thumb", "${ARM_THUMB_M_OPT}", "", d)} 
> ${@bb.utils.contains("TUNE_FEATURES", "no-thumb-interwork", "-mno-thumb-interwork", "-mthumb-interwork", d)} 
> ${@bb.utils.contains("TUNE_FEATURES", "vfp", bb.utils.contains("TUNE_FEATURES", "callconvention-hard", "-mfloat-abi=hard", "-mfloat-abi=softfp", d), "" ,d)} 
> ${@bb.utils.contains("TUNE_FEATURES", "xscale", "-mtune=xscale", "", d)}
> Hash for dependent task linux-libc-headers_3.4.3.bb.do_patch changed from 4d1f46fa912bc21421d343811acab517 to 663e25ca238e049eaff02fd288c5342e
> 
> So even if I let both machines using only armv5 thumb dsp TUNE_FEATURES it still 
> rebuilds e.g. linux-libc-headers.
> 
> We can merge all those
> TUNE_CCARGS += "${@bb.utils.contains("TUNE_FEATURES", "xscale", "-mtune=xscale", "", d)}"
> fragmets to arch-armv5-dsp.inc, but that doesn't look very correct too (imagine someone who 
> wants to add new tune-magicfoo in his BSP which adds another possible value for TUNE_FEATURES
> but still uses armv5te feed.
> 
> Any idea?

TUNE_CCARGS[vardepvalue] = "${TUNE_CCARGS}"

This should flatten it. We care about the final value, not how its
obtained in this case.

Cheers,

Richard




