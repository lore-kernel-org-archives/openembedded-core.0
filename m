Return-Path: <dbaryshkov@gmail.com>
Received: from mail-ig0-f173.google.com (mail-ig0-f173.google.com
	[209.85.213.173])
	by mail.openembedded.org (Postfix) with ESMTP id 97C3F75A28
	for <openembedded-core@lists.openembedded.org>;
	Fri, 19 Jun 2015 17:47:40 +0000 (UTC)
Received: by igblr2 with SMTP id lr2so18159228igb.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 19 Jun 2015 10:47:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=l18zXJNGKdlnNjpYHtRjoZK7NkgwKPL5HOOCVt/9JH8=;
	b=xMMAL0+P92iBtWTcxpSggf/VkDreRIn3PgmshivCT98407ZTmSPQOrgxo9zoJGbI5K
	BAsprPdePyr+xIZ1BUecI0BK59qtms4nbnKqGQUtn2MZZwsoFwvZO9qCihNDVgkk+i2L
	izrp9LnhpoBbN1jL5IKPW4MVNk7XD8YhG4IQL3UhGkBq/Qmay0ppNNTESRobWQjOdwmm
	dnM+pbUWzQz38xh1cVxMIAwVcCYbQCKo3ObqTMbjhZ71/ZJCzQSE32+1Vty5z+YffmqJ
	YlQYAvkmwcD1iXalrsr/fK45UGB7X/35AI7dI5PD5NXS6HxlpHGxAGj31A70py4aq/zl
	INtg==
MIME-Version: 1.0
X-Received: by 10.107.137.42 with SMTP id l42mr23249477iod.60.1434736062066;
	Fri, 19 Jun 2015 10:47:42 -0700 (PDT)
Received: by 10.64.130.201 with HTTP; Fri, 19 Jun 2015 10:47:41 -0700 (PDT)
In-Reply-To: <558420A0.309@windriver.com>
References: <1434633188-3434-1-git-send-email-dbaryshkov@gmail.com>
	<CALT56yOBxbjc=F96unuigiBAR9En9kYKce9ZqWmtkneOGYVQqQ@mail.gmail.com>
	<558420A0.309@windriver.com>
Date: Fri, 19 Jun 2015 20:47:41 +0300
Message-ID: <CALT56yMvhOncAfjbkxfW_jveY82YXXKAi4qYM9QUX24q79zwpw@mail.gmail.com>
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
X-List-Received-Date: Fri, 19 Jun 2015 17:47:42 -0000
Content-Type: text/plain; charset=UTF-8

Hello,

2015-06-19 17:01 GMT+03:00 Mark Hatle <mark.hatle@windriver.com>:
> On 6/19/15 4:23 AM, Dmitry Eremin-Solenikov wrote:
>>> On 6/18/15 8:13 AM, Dmitry Eremin-Solenikov wrote:
>>>> Currently MIPS64 N32 is broken. There is internal disagreement
>>>> between TARGET_ARCH (which doesn't contain ABIEXTENSION) and
>>>> TRANSLATED_TARGET_ARCH (which contains ABIEXTENSION). ABI is already
>>>> encoded into the TARGET_OS. ARM tunes in the same situation override
>>>> neither the TARGET_ARCH nor the TRANSLATED_TARGET_ARCH. So let's drop
>>>> this override.
>>>
>>> This series won't work properly, unless I'm reading something incorrectly.
>>>
>>> You won't be able to build/install a tri-lib system after this change, as
>>> something needs to be there to differential between MIPS32 (o32), MIPS64 (n32)
>>> and MIPS64 (n64).
>>>
>>> Currently this is done via the ABIEXTENSION value.
>>
>> Why do you need this differentiation in the TARGET_ARCH? We have TARGET_SYS
>> (triplets) for that, don't we? And the compilers for the N64/N32 (the
>> only thing IIRC
>> that is really dependent on the TARGET_ARCH) should be interchangeable, AFAIU.
>
> The triplet for o32 is:
>
> mips-os-linux
>
> The triplet to n64 is:
>
> mips64-os-linux
>
> The triplet to n32 is:
>
> mips64-os-linux
>
> thus w/o the ABI extension there is no mechanism to distinguish between n64 and n32.
>
>> Can you point me, please, how to create a tri-ABI SDK and/or image?
>
> Configure with a MIPS64 capable machine (yes qemumips64 is adequate).  Then add
> the following to your local.conf:
>
> require conf/multilib.conf
> DEFAULTTUNE = "mips32r2"
>
> MULTILIBS = "multilib:lib32 multilib:lib64"
> DEFAULTTUNE_virtclass-multilib-lib32 = "mips64-n32"
> DEFAULTTUNE_virtclass-multilib-lib64 = "mips64"
>
>
> This will set the default ABI to 'o32', with optional n32 and n64 support.  (You
> can switch around the defaulttune values to change which is default and which is
> optional.  A common config is n32 default, o32 / n64 optional.)


I tried adding these settings to a special machine config (but there
should be no
difference with adding them to local.conf) and got a lot of errors from QA on
linux-yocto (because of 32 vs 64 bitness missmatch on kernel objects). Are you
sure that this config works out of box for you?

-- 
With best wishes
Dmitry

