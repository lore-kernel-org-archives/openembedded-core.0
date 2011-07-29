Received: from mail-yi0-f47.google.com ([209.85.218.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1QmqGq-0006Dq-JK
	for openembedded-core@lists.openembedded.org;
	Fri, 29 Jul 2011 18:50:44 +0200
Received: by yib18 with SMTP id 18so2768865yib.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 29 Jul 2011 09:46:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=message-id:date:from:user-agent:mime-version:to:subject:references
	:in-reply-to:content-type:content-transfer-encoding;
	bh=IxlH43xO4UgnEGwNxWAV3EkRT9iKdQSMp1B6vme3mWk=;
	b=kny+PXJRjVlMJ1pnSUKhTZT3VNwY9Ss4DlR214iyQCJhwR6T5wg121KaHRDrFu7KoR
	v67pwU7JfbXhmnl8X8Wle1qMdY9C1Ouh37LU2DHnKunVqLvKkMqdDaEyazMcZEcUQMdZ
	AJXuQGuVSNp9OdFh9R6jy2+IZdGarXcOFtKog=
Received: by 10.68.62.70 with SMTP id w6mr2843464pbr.224.1311957986707;
	Fri, 29 Jul 2011 09:46:26 -0700 (PDT)
Received: from [192.168.1.70] (99-57-141-118.lightspeed.sntcca.sbcglobal.net
	[99.57.141.118])
	by mx.google.com with ESMTPS id i9sm2342058pbk.20.2011.07.29.09.46.25
	(version=SSLv3 cipher=OTHER); Fri, 29 Jul 2011 09:46:26 -0700 (PDT)
Message-ID: <4E32E3E1.5080306@gmail.com>
Date: Fri, 29 Jul 2011 09:46:25 -0700
From: Khem Raj <raj.khem@gmail.com>
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.2.18) Gecko/20110617 Lightning/1.0b2 Thunderbird/3.1.11
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
References: <1311951571-18411-1-git-send-email-raj.khem@gmail.com>
	<20110729163912.GN15286@jama.jama.net>
In-Reply-To: <20110729163912.GN15286@jama.jama.net>
Subject: Re: [PATCH] classes, recipes: Replace use of ARM_INSTRUCTION_SET with contruct using TUNE_FEATURES
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
X-List-Received-Date: Fri, 29 Jul 2011 16:50:44 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 07/29/2011 09:39 AM, Martin Jansa wrote:
> On Fri, Jul 29, 2011 at 07:59:31AM -0700, Khem Raj wrote:
>> Currently when using thumb feature all recipes can not be compiled in
>> thumb mode. Therefore we had ARM_INSTRUCTION_SET to force arm intruction
>> set even when thumb was global choice. With this patch we remove thumb
>> from tune features for these recipes. This will make sure that compiler
>> is not using thumb options to compile these recipes at all.
>>
>> Signed-off-by: Khem Raj<raj.khem@gmail.com>
>> ---
>>   meta/classes/qt4e.bbclass                          |    2 +-
>>   meta/classes/qt4x11.bbclass                        |    2 +-
>>   meta/conf/machine/include/tune-thumb.inc           |   32 --------------------
>>   meta/recipes-core/eglibc/eglibc.inc                |    4 +-
>>   meta/recipes-core/glib-2.0/glib.inc                |    4 ++-
>>   meta/recipes-core/glibc/glibc.inc                  |    4 ++-
>>   meta/recipes-core/glibc/glibc_2.10.1.bb            |    3 +-
>>   meta/recipes-core/uclibc/uclibc.inc                |    2 +-
>>   meta/recipes-devtools/gcc/gcc-csl-arm-2008q1.inc   |    3 +-
>>   .../xorg-xserver/xserver-kdrive.inc                |    4 ++-
>>   meta/recipes-multimedia/alsa/alsa-lib_1.0.24.1.bb  |    3 +-
>>   .../gstreamer/gst-plugins-bad_0.10.21.bb           |    3 +-
>>   meta/recipes-multimedia/libmad/libmad_0.15.1b.bb   |    4 ++-
>>   meta/recipes-multimedia/tremor/tremor_20101121.bb  |    4 ++-
>>   meta/recipes-qt/qt4/qt4_arch.inc                   |    3 +-
>>   meta/recipes-support/boost/boost-36.inc            |    4 ++-
>>   meta/recipes-support/gmp/gmp.inc                   |    3 +-
>>   meta/recipes-support/libgcrypt/libgcrypt.inc       |    3 +-
>>   meta/recipes-support/liboil/liboil_0.3.17.bb       |    3 +-
>>   19 files changed, 39 insertions(+), 51 deletions(-)
>>   delete mode 100644 meta/conf/machine/include/tune-thumb.inc
>
> this causes ie eglibc not only to disable thumb but also to pass
> -march=armv4 and look in wrong directory for toolchain.. which because
> it's not filtering thumb is in armv4t-oe-linux-gnueabi
>
> export PATH="
> /OE/shr-core/tmp/sysroots/x86_64-linux/usr/bin/armv4-oe-linux-gnueabi.gcc-cross-initial:
> /OE/shr-core/tmp/sysroots/x86_64-linux/usr/bin/armv4-oe-linux-gnueabi:
> /OE/shr-core/tmp/sysroots/om-gta02/usr/bin/crossscripts:
> /OE/shr-core/tmp/sysroots/x86_64-linux/usr/sbin:
> /OE/shr-core/tmp/sysroots/x86_64-linux/usr/bin:
> /OE/shr-core/tmp/sysroots/x86_64-linux/sbin:
> /OE/shr-core/tmp/sysroots/x86_64-linux//bin:
> /OE/shr-core/openembedded-core/scripts:
> /OE/bin:
> /usr/local/bin:
> /usr/bin:
> /bin:
> /opt/bin:
> /usr/x86_64-pc-linux-gnu/gcc-bin/4.6.1:
> /OE/shr-core/openembedded-core/scripts"
>
> simple forward of oe.dev arm-thumb.inc logic to arm-feature-thumb.inc
> +++ b/meta/conf/machine/include/arm/feature-arm-thumb.inc
> @@ -5,7 +5,8 @@
>   # but requires more instructions (140% for 70% smaller code) so may be
>   # slower.
>   TUNEVALID[thumb] = "Use thumb instructions instead of ARM"
> -TUNE_CCARGS += "${@bb.utils.contains("TUNE_FEATURES", "thumb", "-mthumb", "-mno-thumb", d)}"
> +ARM_THUMB_M_OPT = "${@['-mno-thumb', '-mthumb'][bb.data.getVar('ARM_INSTRUCTION_SET', d, 1) == 'thumb']}"
> +TUNE_CCARGS += "${@bb.utils.contains("TUNE_FEATURES", "thumb", "${ARM_THUMB_M_OPT}", "${ARM_THUMB_M_OPT}", d)}"
>
> seems to work.. will send patch after more testing, but eglibc compiled fine now..

decoupling the -mthumb/-mno-thumb from thumb tune feature is right think 
to do.
yes this would be something on the lines I was thinking can work with 
minimal changes.

>
>
> Regards,
>
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core



