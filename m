Return-Path: <raj.khem@gmail.com>
Received: from mail-wm0-f68.google.com (mail-wm0-f68.google.com [74.125.82.68])
	by mail.openembedded.org (Postfix) with ESMTP id 0D6A2782D7
	for <openembedded-core@lists.openembedded.org>;
	Mon, 24 Jul 2017 13:40:14 +0000 (UTC)
Received: by mail-wm0-f68.google.com with SMTP id m4so15252085wmi.4
	for <openembedded-core@lists.openembedded.org>;
	Mon, 24 Jul 2017 06:40:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=1iNxVxq8Ry1Zt5+lnBmzsQCFIdklX2sxYoL+XZnUmOk=;
	b=LKIU2xGQNsoDucSJGcpH3z5lTDVUQHUTDa/ibvKmuW/fyyuYYDQ4wLepeAwVFL2t4S
	0df0y5hZuCAazs93ZbNtRGzKLj2npXCgSt150OYwGY0eIxaxLZoP33bo9/9wq8RIIT3K
	8UOoqBE5ROdHTrrqUCkTNdrxRFzie6MB0baMrAKJiUItFfVhfiHBacwd67+yuw22PbTK
	nT9g6KVrk2NxB5ZDnkkR3Q6+5c4+HvMCcgXxjveaSncqqpkAa3lP2OQ11LZHjsrYY71l
	toLmjVeKzYMVKfVki5VpU7jLz9GAfYSziAsLm80Iicr8FQm3pPUq3aCeMQ/PYAQmiVc5
	X4aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=1iNxVxq8Ry1Zt5+lnBmzsQCFIdklX2sxYoL+XZnUmOk=;
	b=Q55YmrykyevvtE7y6/Q7hqFBwhseJE6T9ZcNxqBfSFUWCQGDjw34t3IiN+rZVwA/1/
	GnldFFLMJcRslZPtmDdP9y7Zpnz6eA5cQFhjV317cJFt65xp8jMv4hUIqzKzK9ft1m4g
	fQMwortN8448jV/fl6psVROsP1EIwBeSpOwmPT6KSPmqU0G4J4VvBgIlZmj31d8JJSqd
	kQuZYtCFiNEol57LNaWSeZjlgn34soLLBXPgEPETtZcViDUuZ3phbj5FQhWe3hWyjfI6
	E/S5PAmAvMP/olF+7cIZrXY0wJVwsWFIvuUW7/4bBejwDpjBbrhVVRkFOUvtjFlxHLYO
	9POQ==
X-Gm-Message-State: AIVw110gsR5TlEQ42CeqWKWg4ealWAQjjc3ntIgJNhQPcaJD0Q3Bjigi
	JPzsrkrMXcFYHGVty9MbdDnukcfFjw==
X-Received: by 10.80.139.65 with SMTP id l59mr15699582edl.52.1500903615831;
	Mon, 24 Jul 2017 06:40:15 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.80.149.181 with HTTP; Mon, 24 Jul 2017 06:39:45 -0700 (PDT)
In-Reply-To: <CAJTo0LaGMPJj-=c7FarWJAULoCJfSjouPKNSweMAaf-g38toJg@mail.gmail.com>
References: <1500730246-25592-1-git-send-email-liu.ming50@gmail.com>
	<CAJTo0LaGMPJj-=c7FarWJAULoCJfSjouPKNSweMAaf-g38toJg@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 24 Jul 2017 06:39:45 -0700
Message-ID: <CAMKF1soLq6tFwDKBhs_5DxHrNeWr_Hv8kYSvABYsTW_BvgfpKQ@mail.gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>,
	Ming Liu <peter.x.liu@external.atlascopco.com>,
	Ming Liu <liu.ming50@gmail.com>
Subject: Re: [PATCH V2] tclibc-musl.inc: fix bfd "cannot make copy relocation for protected symbol" issues
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
X-List-Received-Date: Mon, 24 Jul 2017 13:40:15 -0000
Content-Type: text/plain; charset="UTF-8"

On Mon, Jul 24, 2017 at 6:18 AM, Burton, Ross <ross.burton@intel.com> wrote:
> If we're going to silently change the linker to bfd under musl if ld-is-gold
> is selected, wouldn't it be better just to throw an exception if both musl
> and ld-is-gold are selected?  Better to tell the user so they can not do
> that than silently ignore what they asked.

yes, that would be better but I am skeptical of disabling it
completely, we should
create testcase and report it to binutils bugzilla


>
> Ross
>
> On 22 July 2017 at 14:30, <liu.ming50@gmail.com> wrote:
>>
>> From: Ming Liu <peter.x.liu@external.atlascopco.com>
>>
>> Quite a few such compiling issues were found when I was building with
>> following configs:
>> ...
>> MACHINE = "beaglebone"
>> TCLIBC = "musl"
>> DISTRO_FEATURES_append = " ld-is-gold"
>> ...
>>
>> fixed by adding bfd binding now ldflags.
>>
>> Signed-off-by: Ming Liu <peter.x.liu@external.atlascopco.com>
>> ---
>>  meta/conf/distro/include/tclibc-musl.inc | 4 ++++
>>  1 file changed, 4 insertions(+)
>>
>> diff --git a/meta/conf/distro/include/tclibc-musl.inc
>> b/meta/conf/distro/include/tclibc-musl.inc
>> index 3d3f6ac..99d52a1 100644
>> --- a/meta/conf/distro/include/tclibc-musl.inc
>> +++ b/meta/conf/distro/include/tclibc-musl.inc
>> @@ -18,6 +18,10 @@ PREFERRED_PROVIDER_virtual/nativesdk-libiconv ?=
>> "nativesdk-glibc"
>>
>>  CXXFLAGS += "-fvisibility-inlines-hidden"
>>
>> +# Workaround for musl libc does not support bfd lazy binding well
>> +# Refer to: https://bugzilla.yoctoproject.org/show_bug.cgi?id=11679
>> +LDFLAGS += "${@bb.utils.contains('DISTRO_FEATURES', 'ld-is-gold',
>> '-Wl,-z,relro,-z,now -fuse-ld=bfd', '', d)}"
>> +
>>  IMAGE_LINGUAS = ""
>>
>>  LIBC_DEPENDENCIES = "\
>> --
>> 2.7.4
>>
>
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

