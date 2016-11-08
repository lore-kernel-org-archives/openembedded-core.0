Return-Path: <armccurdy@gmail.com>
Received: from mail-wm0-f68.google.com (mail-wm0-f68.google.com [74.125.82.68])
	by mail.openembedded.org (Postfix) with ESMTP id 85E2D65D00
	for <openembedded-core@lists.openembedded.org>;
	Tue,  8 Nov 2016 02:32:40 +0000 (UTC)
Received: by mail-wm0-f68.google.com with SMTP id a20so8951755wme.2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 07 Nov 2016 18:32:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=tjTpva1RW25rBPgFo21gcBPU8TMZN6b4kajqIr/p3Rc=;
	b=EO8f20T5s2fDzRjiMnbs+/Md+Fmvqd38t4bF6ONddp1S+Dyb9qImxAy2wE7BjZZhyd
	bp1d5eFugMVJDrNJ1iWi10ONYUHbVDVZnvie94AKZB5d5NrJG9UaKIy4e2Jf9qnQkrgx
	s/oMFYB4UOZ7cTGJ0cyzLbs85oiArbQzIFJyDOKHhNUfSct4GYcRt3PJkLV5U+tpSY7C
	/AXYDDRPRztXma6wYLeA1pywlau6us7bfb10nGW7BKnI+jzg9M2p62gKCkPppU+ABWL/
	UVK8I6+xf2cb344urywz4i0h6QWwUzakXA0wVMRTau+MlY1XXlQ6pgu+Iz3C1tem5nzl
	8rag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=tjTpva1RW25rBPgFo21gcBPU8TMZN6b4kajqIr/p3Rc=;
	b=kVWLBJHv3wH6s76T3JQKXxp/f7cPoi6W1v/Xp3P3vivcTF1axRmrXMYh2Jk1dfBq/P
	jooCljEXgETBAlPy/zneDi0AFUQYLvUxS+oK0c/UV/t95pTeJeiEBdzLc9HBoRNisDT1
	O3NNQmOEK0nyuUu7/ixB2rjE6bEkn3i88rM1Ya5QaPfZrHrIDLFrk8+uB/2OWqhuBpDx
	E5AyuQccONJvinatROtpet37w28/UrzV3o8KABI+va9hQa38AjzYtm1YJD+PhpnbU7a6
	fVLOz4c+LTAGjcBhKFeh6XLX5kea/IvFJhb/Xikwxx5YzJTZvwcK6dSDNTneyjZSKmGm
	PU0g==
X-Gm-Message-State: ABUngvf743S8NvMtSXM5B2L0XlxTUyDcxyLpC6gXfVTbvpn9mYXRI10OR0poAEQLY+fgchBYkQtt/jsR/YYeSQ==
X-Received: by 10.28.18.5 with SMTP id 5mr9419538wms.35.1478572361259; Mon, 07
	Nov 2016 18:32:41 -0800 (PST)
MIME-Version: 1.0
Received: by 10.194.45.33 with HTTP; Mon, 7 Nov 2016 18:32:40 -0800 (PST)
In-Reply-To: <dfeea628-1c1b-1e1e-b015-aa4cd5b9b42c@gmail.com>
References: <20161107150135.40266-1-Zubair.Kakakhel@imgtec.com>
	<20161107150135.40266-2-Zubair.Kakakhel@imgtec.com>
	<dfeea628-1c1b-1e1e-b015-aa4cd5b9b42c@gmail.com>
From: Andre McCurdy <armccurdy@gmail.com>
Date: Mon, 7 Nov 2016 18:32:40 -0800
Message-ID: <CAJ86T=UAjjvEOoxJjWX16x-iDNqb-EAHqgCEBZ9_SyW00W7mEg@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: [Patch 01/13] arch-mips: Add MACHINEOVERRIDES variables to reduce duplication
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
X-List-Received-Date: Tue, 08 Nov 2016 02:32:40 -0000
Content-Type: text/plain; charset=UTF-8

On Mon, Nov 7, 2016 at 9:30 AM, Khem Raj <raj.khem@gmail.com> wrote:
>
> On 11/7/16 7:01 AM, Zubair Lutfullah Kakakhel wrote:
>> In some cases, each MIPS variant in a recipe requires a duplicate
>> line. Even if the passed flag is the same.
>>
>> Add global MACHINEOVERRIDES variables for the following
>>  * mipsarch           : All MIPS
>>  * mipsarchr6         : All MIPS R6
>>  * mipsarcho32{el}    : All MIPS o32
>>  * mipsarchn32{el}    : All MIPS n32
>>  * mipsarchn64{el}    : All MIPS n64
>>
>> This is intended to reduce duplications in recipes
>>
>> [YOCTO #10404]
>>
>> Signed-off-by: Zubair Lutfullah Kakakhel <Zubair.Kakakhel@imgtec.com>
>> ---
>>  meta/conf/machine/include/mips/arch-mips.inc | 7 +++++++
>>  1 file changed, 7 insertions(+)
>>
>> diff --git a/meta/conf/machine/include/mips/arch-mips.inc b/meta/conf/machine/include/mips/arch-mips.inc
>> index 6069ca1..5b42841 100644
>> --- a/meta/conf/machine/include/mips/arch-mips.inc
>> +++ b/meta/conf/machine/include/mips/arch-mips.inc
>> @@ -50,6 +50,13 @@ MIPSPKGSFX_32R6 = "${@bb.utils.contains('TUNE_FEATURES', 'mipsisa32r6', 'isa32',
>>  TUNE_ARCH = "mips${MIPSPKGSFX_32R6}${MIPSPKGSFX_64R6}${MIPSPKGSFX_BYTE}${MIPSPKGSFX_R6}${MIPSPKGSFX_ENDIAN}"
>>  TUNE_PKGARCH = "${MIPSPKGSFX_VARIANT_tune-${DEFAULTTUNE}}${MIPSPKGSFX_FPU}${MIPSPKGSFX_ABI}"
>>
>> +# Various Global Machine Overrides
>> +MACHINEOVERRIDES =. "mipsarch:"
>> +MACHINEOVERRIDES =. "${@bb.utils.contains('TUNE_FEATURES', 'r6', 'mipsarchr6:', '' ,d)}"
>> +MACHINEOVERRIDES =. "${@bb.utils.contains('TUNE_FEATURES', 'n32', 'mipsarchn32${MIPSPKGSFX_ENDIAN}:', '' ,d)}"
>> +MACHINEOVERRIDES =. "${@bb.utils.contains('TUNE_FEATURES', 'o32', 'mipsarcho32${MIPSPKGSFX_ENDIAN}:', '' ,d)}"
>> +MACHINEOVERRIDES =. "${@bb.utils.contains('TUNE_FEATURES', 'n64', 'mipsarch64${MIPSPKGSFX_ENDIAN}:', '' ,d)}"
>
> how about mips16 ?

We explicitly removed _thumb as an over-ride for ARM, so adding the
equivalent for MIPS would be odd, unless you see a clear need for it?

  http://git.openembedded.org/openembedded-core/commit/?id=351443d71eb246a946b41f12b54d57b36fe1574e

>> +
>>  # Base tunes
>>  AVAILTUNES += "mips mips64-n32 mips64 mipsel mips64el-n32 mips64el mips-nf mips64-nf-n32 mips64-nf mipsel-nf mips64el-nf-n32 mips64el-nf"
>>  TUNE_FEATURES_tune-mips = "o32 bigendian fpu-hard"
>>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

