Return-Path: <armccurdy@gmail.com>
Received: from mail-wm0-f47.google.com (mail-wm0-f47.google.com [74.125.82.47])
	by mail.openembedded.org (Postfix) with ESMTP id BE3AA60620
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 Nov 2015 19:42:55 +0000 (UTC)
Received: by wmec201 with SMTP id c201so245212913wme.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 Nov 2015 11:42:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=qmoOqDoY8QULpD6xnIpjPlvFjnxVoWEWYUjnr6j6NIs=;
	b=GtP3uobnt5ntQRhcaFwYTf7Uo9H8voJvLFajvpRlQA9aGB5oFluHxzBVtKLQt+fhnG
	yUxWc9TPaFsIy1ONqPeDymTH0vX2ncxYcHOS+wYebfOS+Yu6WSHUwEBmmuvU7SoNF/3c
	VeBQJGPINGE04wdXBe9IDNcF9ZvrGQQe/QG1ffw+pyhQQPxdyzmQX24vsXbvxF/7JgDd
	iUg1e4T3hPCrZFYYJk6+7zb3M/V4YeTXFzsfQcBSQAmeFzT8njwp39B0GCuk1p3wRPpt
	rzguBE7tkwt3JgeOvY0pzQZv8vZ0LYX7ZUGLwPgHv8TcvmDg5ADX2LxtGcIqDk5wySXn
	6hHA==
MIME-Version: 1.0
X-Received: by 10.194.200.134 with SMTP id js6mr43430203wjc.114.1447789375995; 
	Tue, 17 Nov 2015 11:42:55 -0800 (PST)
Received: by 10.194.140.38 with HTTP; Tue, 17 Nov 2015 11:42:55 -0800 (PST)
In-Reply-To: <CAMKF1sppDtyLvRATLpQHqh8N3ztnyj=r+QPjtwF-jmR+f73QTw@mail.gmail.com>
References: <1447739760-14395-1-git-send-email-armccurdy@gmail.com>
	<1447773377.1472.28.camel@pbcl.net>
	<CAMKF1sppDtyLvRATLpQHqh8N3ztnyj=r+QPjtwF-jmR+f73QTw@mail.gmail.com>
Date: Tue, 17 Nov 2015 11:42:55 -0800
Message-ID: <CAJ86T=Ws95=j4JQ0-_ZOSs0oTnSeiZFKky=0R+GkjcKwoLO=pg@mail.gmail.com>
From: Andre McCurdy <armccurdy@gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] directfb.inc: force bfd linker for armv7a
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
X-List-Received-Date: Tue, 17 Nov 2015 19:42:56 -0000
Content-Type: text/plain; charset=UTF-8

On Tue, Nov 17, 2015 at 11:33 AM, Khem Raj <raj.khem@gmail.com> wrote:
> On Tue, Nov 17, 2015 at 7:16 AM, Phil Blundell <pb@pbcl.net> wrote:
>> On Mon, 2015-11-16 at 21:56 -0800, Andre McCurdy wrote:
>>>
>> +# Workaround for linking issues seen with armv7a + gold
>>> +LDFLAGS_append_armv7a = "${@base_contains('DISTRO_FEATURES', 'ld-is
>>> -gold', ' -fuse-ld=bfd ', '', d)}"
>>>
>>
>> Does the resulting directfb-csource binary actually work with that
>> change?  My recollection is that ld.bfd will just silently permit
>> relocs that gold (correctly) refuses to allow.
>
> thats right. real problem here is that there is a static library
> generating with out pic options and being linked into
> shared object. gold is flagging it since it will fail at runtime.
> Please pass --enable-shared to configure that should help
> if that does not then pass -fPIC in CFLAGS

Note that directfb-csource is an application, not a shared library.

First directfb-csource.c is compiled to directfb-csource.o and then
directfb-csource.o is linked with -lpng16 -ldl -lrt -lpthread to
create the directfb-csource application. I don't see an obvious reason
why -fPIC should be needed when directfb-csource.c is compiled?

