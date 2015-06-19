Return-Path: <dbaryshkov@gmail.com>
Received: from mail-ig0-f177.google.com (mail-ig0-f177.google.com
	[209.85.213.177])
	by mail.openembedded.org (Postfix) with ESMTP id 569D5759FE
	for <openembedded-core@lists.openembedded.org>;
	Fri, 19 Jun 2015 22:40:58 +0000 (UTC)
Received: by igblr2 with SMTP id lr2so22544929igb.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 19 Jun 2015 15:40:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=IiZSp5rP2GNLI5CPc6x/Je+WHq28SPs53DHqfwiFfKw=;
	b=miPis0AYluSckt8HHf9+AH5m40xNc73h0m78ltSGVE8Nl4u2Y6kA5PvI+P+QTGKrvj
	TQ13vZVAu7dMnbM2NLvP5Pmuz+3dAXcQ70LN8wuF9irEvHlVQ+s932j2LyZQg3oCuzdA
	uVTxk3bkxJIzWs468C7+d//XUACakKTMDIP++r+QcKf6PPCWfhlVix5Cf04Lq3iFVYCP
	paBDjczABwq8n1m3l5bv/aZvu/xVo20E7YrET9gpedm3Ae7knMuIf0EliAx31DdoWu01
	xz2CH2qSW/A/h83sgHBXSA3dmdHiCds0u1mDYVfY5wIVy9M01RcRwL3EOymlM5HHwO2J
	msOQ==
MIME-Version: 1.0
X-Received: by 10.43.14.65 with SMTP id pp1mr14348182icb.40.1434753659853;
	Fri, 19 Jun 2015 15:40:59 -0700 (PDT)
Received: by 10.64.130.201 with HTTP; Fri, 19 Jun 2015 15:40:59 -0700 (PDT)
In-Reply-To: <CALT56yMvhOncAfjbkxfW_jveY82YXXKAi4qYM9QUX24q79zwpw@mail.gmail.com>
References: <1434633188-3434-1-git-send-email-dbaryshkov@gmail.com>
	<CALT56yOBxbjc=F96unuigiBAR9En9kYKce9ZqWmtkneOGYVQqQ@mail.gmail.com>
	<558420A0.309@windriver.com>
	<CALT56yMvhOncAfjbkxfW_jveY82YXXKAi4qYM9QUX24q79zwpw@mail.gmail.com>
Date: Sat, 20 Jun 2015 01:40:59 +0300
Message-ID: <CALT56yM-n1X3D3ahM=B_J6NJV1qnTOVaw-ossaxLLzGNZfuS-Q@mail.gmail.com>
From: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
To: Mark Hatle <mark.hatle@windriver.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/3] arch-mips.inc: don't override TRANSLATED_TARGET_ARCH
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
X-List-Received-Date: Fri, 19 Jun 2015 22:41:02 -0000
Content-Type: text/plain; charset=UTF-8

2015-06-19 20:47 GMT+03:00 Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>:
> Hello,
>
> 2015-06-19 17:01 GMT+03:00 Mark Hatle <mark.hatle@windriver.com>:
>> On 6/19/15 4:23 AM, Dmitry Eremin-Solenikov wrote:
>>>> On 6/18/15 8:13 AM, Dmitry Eremin-Solenikov wrote:
>>>>> Currently MIPS64 N32 is broken. There is internal disagreement
>>>>> between TARGET_ARCH (which doesn't contain ABIEXTENSION) and
>>>>> TRANSLATED_TARGET_ARCH (which contains ABIEXTENSION). ABI is already
>>>>> encoded into the TARGET_OS. ARM tunes in the same situation override
>>>>> neither the TARGET_ARCH nor the TRANSLATED_TARGET_ARCH. So let's drop
>>>>> this override.
>>>>
>>>> This series won't work properly, unless I'm reading something incorrectly.
>>>>
>>>> You won't be able to build/install a tri-lib system after this change, as
>>>> something needs to be there to differential between MIPS32 (o32), MIPS64 (n32)
>>>> and MIPS64 (n64).
>>>>
>>>> Currently this is done via the ABIEXTENSION value.
>>>
>>> Why do you need this differentiation in the TARGET_ARCH? We have TARGET_SYS
>>> (triplets) for that, don't we? And the compilers for the N64/N32 (the
>>> only thing IIRC
>>> that is really dependent on the TARGET_ARCH) should be interchangeable, AFAIU.
>>
>> The triplet for o32 is:
>>
>> mips-os-linux
>>
>> The triplet to n64 is:
>>
>> mips64-os-linux
>>
>> The triplet to n32 is:
>>
>> mips64-os-linux
>>
>> thus w/o the ABI extension there is no mechanism to distinguish between n64 and n32.
>>
>>> Can you point me, please, how to create a tri-ABI SDK and/or image?
>>
>> Configure with a MIPS64 capable machine (yes qemumips64 is adequate).  Then add
>> the following to your local.conf:
>>
>> require conf/multilib.conf
>> DEFAULTTUNE = "mips32r2"
>>
>> MULTILIBS = "multilib:lib32 multilib:lib64"
>> DEFAULTTUNE_virtclass-multilib-lib32 = "mips64-n32"
>> DEFAULTTUNE_virtclass-multilib-lib64 = "mips64"
>>
>>
>> This will set the default ABI to 'o32', with optional n32 and n64 support.  (You
>> can switch around the defaulttune values to change which is default and which is
>> optional.  A common config is n32 default, o32 / n64 optional.)
>
>
> I tried adding these settings to a special machine config (but there
> should be no
> difference with adding them to local.conf) and got a lot of errors from QA on
> linux-yocto (because of 32 vs 64 bitness missmatch on kernel objects). Are you
> sure that this config works out of box for you?

Got the tri-ABI image built. Had to change default to N32, fix the glibc recipe
not to override the TUNE_CCARGS, etc. Here is a summary:

1) My patches do not break building multilib images/SDK.
2) They are required to build images, defaulting to N32 ABI
3) Building tri-lib images does not work out of box anyway, thanks to glibc
   (I'll send a patch).
4) Multilib SDK for MIPS build, but the build is quite questionable
anyway (see below).

Thus I'd ask for my patches to be merged.

WARNING: gcc multilib setup is not supported for TARGET_ARCH=mips64

                                   WARNING: gcc multilib setup is not
supported for TARGET_ARCH=mips64
WARNING: gcc multilib setup is not supported for TARGET_ARCH=mips64
WARNING: QA Issue: gcc-cross-canadian-mips64: Files/directories were
installed but not shipped in any package:
  /usr/local/oecore-x86_64/sysroots/x86_64-oesdk-linux/usr/lib/lib
  /usr/local/oecore-x86_64/sysroots/x86_64-oesdk-linux/usr/lib/mips64-oemllib64-linux/gcc/mips64-oemllib64-linux/5.1.0/plugin/libcc1plugin.so.0.0.0
  /usr/local/oecore-x86_64/sysroots/x86_64-oesdk-linux/usr/lib/mips64-oemllib64-linux/gcc/mips64-oemllib64-linux/5.1.0/plugin/libcc1plugin.so.0
  /usr/local/oecore-x86_64/sysroots/x86_64-oesdk-linux/usr/lib/mips64-oemllib64-linux/gcc/mips64-oemllib64-linux/5.1.0/plugin/libcc1plugin.la
  /usr/local/oecore-x86_64/sysroots/x86_64-oesdk-linux/usr/lib/mips64-oemllib64-linux/gcc/mips64-oemllib64-linux/5.1.0/plugin/libcc1plugin.so
  /usr/local/oecore-x86_64/sysroots/x86_64-oesdk-linux/usr/lib/mips64-oemllib64-linux/gcc/mips64-oemllib64-linux/5.1.0/plugin/.debug
  /usr/local/oecore-x86_64/sysroots/x86_64-oesdk-linux/usr/lib/mips64-oemllib64-linux/gcc/mips64-oemllib64-linux/5.1.0/plugin/.debug/libcc1plugin.so.0.0.0
  /usr/local/oecore-x86_64/sysroots/x86_64-oesdk-linux/usr/lib/lib/libcc1.la
  /usr/local/oecore-x86_64/sysroots/x86_64-oesdk-linux/usr/lib/lib/libcc1.so
  /usr/local/oecore-x86_64/sysroots/x86_64-oesdk-linux/usr/lib/lib/libcc1.so.0.0.0
  /usr/local/oecore-x86_64/sysroots/x86_64-oesdk-linux/usr/lib/lib/libcc1.so.0
  /usr/local/oecore-x86_64/sysroots/x86_64-oesdk-linux/usr/lib/lib/.debug
  /usr/local/oecore-x86_64/sysroots/x86_64-oesdk-linux/usr/lib/lib/.debug/libcc1.so.0.0.0
Please set FILES such that these items are packaged. Alternatively if
they are unneeded, avoid installing them or delete them within
do_install. [installed-vs-shipped]
WARNING: QA Issue: gcc-cross-canadian-mips: Files/directories were
installed but not shipped in any package:
  /usr/local/oecore-x86_64/sysroots/x86_64-oesdk-linux/usr/lib/lib
  /usr/local/oecore-x86_64/sysroots/x86_64-oesdk-linux/usr/lib/lib/libcc1.la
  /usr/local/oecore-x86_64/sysroots/x86_64-oesdk-linux/usr/lib/lib/libcc1.so
  /usr/local/oecore-x86_64/sysroots/x86_64-oesdk-linux/usr/lib/lib/libcc1.so.0.0.0
  /usr/local/oecore-x86_64/sysroots/x86_64-oesdk-linux/usr/lib/lib/libcc1.so.0
  /usr/local/oecore-x86_64/sysroots/x86_64-oesdk-linux/usr/lib/lib/.debug
  /usr/local/oecore-x86_64/sysroots/x86_64-oesdk-linux/usr/lib/lib/.debug/libcc1.so.0.0.0
  /usr/local/oecore-x86_64/sysroots/x86_64-oesdk-linux/usr/lib/mips-oemllib32-linux/gcc/mips-oemllib32-linux/5.1.0/plugin/libcc1plugin.so.0.0.0
  /usr/local/oecore-x86_64/sysroots/x86_64-oesdk-linux/usr/lib/mips-oemllib32-linux/gcc/mips-oemllib32-linux/5.1.0/plugin/libcc1plugin.so.0
  /usr/local/oecore-x86_64/sysroots/x86_64-oesdk-linux/usr/lib/mips-oemllib32-linux/gcc/mips-oemllib32-linux/5.1.0/plugin/libcc1plugin.la
  /usr/local/oecore-x86_64/sysroots/x86_64-oesdk-linux/usr/lib/mips-oemllib32-linux/gcc/mips-oemllib32-linux/5.1.0/plugin/libcc1plugin.so
  /usr/local/oecore-x86_64/sysroots/x86_64-oesdk-linux/usr/lib/mips-oemllib32-linux/gcc/mips-oemllib32-linux/5.1.0/plugin/.debug
  /usr/local/oecore-x86_64/sysroots/x86_64-oesdk-linux/usr/lib/mips-oemllib32-linux/gcc/mips-oemllib32-linux/5.1.0/plugin/.debug/libcc1plugin.so.0.0.0


-- 
With best wishes
Dmitry

