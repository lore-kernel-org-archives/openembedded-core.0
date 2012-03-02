Received: from mail-lpp01m010-f47.google.com ([209.85.215.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1S3bEm-0003tR-NC
	for openembedded-core@lists.openembedded.org;
	Fri, 02 Mar 2012 23:46:08 +0100
Received: by lagw12 with SMTP id w12so2743040lag.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 02 Mar 2012 14:37:37 -0800 (PST)
Received-SPF: pass (google.com: domain of raj.khem@gmail.com designates
	10.112.8.129 as permitted sender) client-ip=10.112.8.129; 
Authentication-Results: mr.google.com;
	spf=pass (google.com: domain of raj.khem@gmail.com
	designates 10.112.8.129 as permitted sender)
	smtp.mail=raj.khem@gmail.com;
	dkim=pass header.i=raj.khem@gmail.com
Received: from mr.google.com ([10.112.8.129])
	by 10.112.8.129 with SMTP id r1mr5309726lba.38.1330727857401 (num_hops
	= 1); Fri, 02 Mar 2012 14:37:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type; bh=yUXWeBcJo7xaVyibsmg96veUIgdU7bTUsdNpmkISP3s=;
	b=NVbY7U/0Z6cI8PAgmu1YixCVHHH9+E1gJ9sJvZjWZstOOZs7IbBF3YG6DVKcNfrHiW
	NyoMjRQ3vHOftIcxcajGndSdYxAVGhwmJPvHcrVil4L1E6o9t986xGALp3x5uIz2mJB3
	3LsUasNHVKhN0vd65OkKTGdATtb9vbixk28Nolm1acpc9jTripu6vFDxM79F98OUBJ8k
	rc8szUc0z+8iaNlYGyOxhTyZrCWSfaP9CghPd+mK7njDuSYFzz12kspll/XQ7aHeAW3r
	qxtg9GCnbcqFcklk2iZ4Y8DclS43Gux5KWyteSta39AAto0ZdiylaBsnH8jfLQToglAo
	fLQQ==
Received: by 10.112.8.129 with SMTP id r1mr4376148lba.38.1330727857300; Fri,
	02 Mar 2012 14:37:37 -0800 (PST)
MIME-Version: 1.0
Received: by 10.152.27.109 with HTTP; Fri, 2 Mar 2012 14:37:07 -0800 (PST)
In-Reply-To: <CAJG6M_MgcYVomQbn=j_w=+BCDjUAdDe1D==CsQ_eFTJm1=rwQw@mail.gmail.com>
References: <CAMKF1srTMHyV+2eDaJKuZs9=2VUYkqhJoqfFqZxrdTCCooWMXA@mail.gmail.com>
	<CAJG6M_MgcYVomQbn=j_w=+BCDjUAdDe1D==CsQ_eFTJm1=rwQw@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 2 Mar 2012 14:37:07 -0800
Message-ID: <CAMKF1so64PA6CHJ-fyK0SFADSMO2UKToMcf54akF8DoUe0P1Cw@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: Recipes with disabled parallel make
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
X-List-Received-Date: Fri, 02 Mar 2012 22:46:08 -0000
Content-Type: text/plain; charset=UTF-8

On Fri, Mar 2, 2012 at 2:29 PM, Yury Bushmelev <jay4mail@gmail.com> wrote:
> 2012/2/10 Khem Raj <raj.khem@gmail.com>:
>> Hi
>>
>> Just grepped for the occurances of disabled parallel make and I see
>> around 40 cases on oe-core
>>
>> git grep PARALLEL_MAKE.*=.*\"\" recipes* | grep -v "#"
>>
>> If someone has time to kill then it would help to see if some of these
>> are fixed by time or can be fixed
>>
>> it can help in paralleling the build a bit more.
>
> Well, I have some first results! :)
>
>
> 1. Recipes (files) confirmed to fail with P_M enabled (need to have
> P_M disabled as it is now):
> meta/recipes-connectivity/bind/bind_9.8.1.bb
> meta/recipes-extended/slang/slang_2.2.4.bb
> meta/recipes-extended/tcp-wrappers/tcp-wrappers_7.6.bb
> meta/recipes-support/js/js_1.7.0+1.8.0rc1.bb
> meta/recipes-support/pth/pth_2.0.7.bb
>
>
> 2. Recipes _not_ confirmed to fail with P_M enabled (i.e. are building
> ok in my environment with P_M enabled):
> meta/recipes-bsp/pciutils/pciutils_3.1.9.bb
> meta/recipes-bsp/pcmciautils/pcmciautils.inc
> meta/recipes-connectivity/iproute2/iproute2.inc
> meta/recipes-connectivity/nfs-utils/nfs-utils_1.2.3.bb
> meta/recipes-core/eggdbus/eggdbus_0.6.bb
> meta/recipes-devtools/autoconf/autoconf_2.68.bb
> meta/recipes-extended/at/at_3.1.12.bb
> meta/recipes-extended/groff/groff_1.20.1.bb
> meta/recipes-extended/mailx/mailx_12.5.bb
> meta/recipes-extended/net-tools/net-tools_1.60-23.bb
> meta/recipes-extended/sat-solver/sat-solver_git.bb
> meta/recipes-graphics/fontconfig/fontconfig_2.8.0.bb
> meta/recipes-graphics/libsdl/libsdl_1.2.14.bb
> meta/recipes-graphics/xcb/libpthread-stubs_0.3.bb
> meta/recipes-graphics/xcb/xcb-util.inc
> meta/recipes-multimedia/pulseaudio/pulseaudio.inc
> meta/recipes-multimedia/speex/speex_1.2rc1.bb
> meta/recipes-support/icu/icu-3.6.inc
> meta/recipes-support/libpcre/libpcre_8.21.bb
>
>
> 3. Recipes not tested yet (need more work):
> meta/recipes-bsp/x-load/x-load.inc (want specific ARCH)
> meta/recipes-bsp/u-boot/u-boot.inc (multiple versions available)
> meta/recipes-core/eglibc/eglibc.inc (multiple versions available)
> meta/recipes-core/gettext/gettext_0.16.1.bb (multiple versions available)
> meta/recipes-devtools/dpkg/dpkg.inc (fetch and patch tasks are failed)
> meta/recipes-devtools/gcc/gcc-cross-canadian_4.6.bb (can't remember actually...)
> meta/recipes-devtools/mtd/mtd-utils_1.4.9.bb (multiple versions available)
> meta/recipes-devtools/mtd/mtd-utils_1.1.0+git.bb (multiple versions available)
> meta/recipes-devtools/valgrind/valgrind_3.7.0.bb (want specific ARCH)
> meta/recipes-extended/bash/bash_3.2.48.bb (multiple versions available)
> meta/recipes-extended/bash/bash.inc (multiple versions available)
> meta/recipes-graphics/xcb/libxcb.inc (multiple versions available)
>
>
> 4. Recipes with PARALLEL_MAKEINST disabled (not tested yet as well):
> meta/recipes-connectivity/openssl/openssl_1.0.0g.bb
> meta/recipes-extended/ghostscript/ghostscript_9.04.bb
> meta/recipes-devtools/mtools/mtools_3.9.9.bb
> meta/recipes-devtools/mtools/mtools_4.0.17.bb
>
>
> Recipes from list #2 was tested with BB_THREAD_NUMBER="6" and
> PARALLEL_MAKE="-j 5" for ARCH'es: qemuarm, qemumips and qemux86.
>
> I've attached patch which enable P_M for recipes from list #2. I hope
> someone else will test it in own environment (not safe for production,
> use separate branch).

Thanks for doing the work. I will try the patch here and I encourage
other folks with beefy builders to try it out as well. You should have
deleted PARALLEL_MAKE = "" instead of commenting it out.


