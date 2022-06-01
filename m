Return-Path: <jpuhlman@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Message-ID: <fc3e29ca-68b6-7ee3-e79e-5ac0fcf937f4@mvista.com>
Date: Wed, 1 Jun 2022 16:04:24 -0700
MIME-Version: 1.0
Subject: Re: [OE-core] [kirkstone][PATCH] gcc: depend on zstd-native
References: <20220601205504.3464879-1-jpuhlman@mvista.com>
 <17046dccfb415c1afa9851ab45b90fe04114798a.camel@linuxfoundation.org>
 <b282c6d5-454c-43ed-e9b2-3737a8120558@mvista.com>
 <CAOSpxdaBLC1SffjnhK1+6g197MVGL29nCOG-=T7dHkitMrFb2w@mail.gmail.com>
From: "Jeremy Puhlman" <jpuhlman@mvista.com>
In-Reply-To: <CAOSpxdaBLC1SffjnhK1+6g197MVGL29nCOG-=T7dHkitMrFb2w@mail.gmail.com>
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"; format="flowed"
Content-Transfer-Encoding: 8bit
List-id: <openembedded-core.lists.openembedded.org>
To: Steve Sakoman <steve@sakoman.com>
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>, openembedded-core@lists.openembedded.org



On 6/1/2022 3:29 PM, Steve Sakoman wrote:
> On Wed, Jun 1, 2022 at 12:27 PM Jeremy Puhlman <jpuhlman@mvista.com> wrote:
>>
>>
>> On 6/1/2022 3:15 PM, Richard Purdie wrote:
>>> On Wed, 2022-06-01 at 16:55 -0400, Jeremy Puhlman wrote:
>>>> Sharing sstate cache binaries between two systems, one with libzstd installed
>>>> and the other without, leads to various gcc components being linked against
>>>> the system libzstd and failing to run on the system with out it installed.
>>>>
>>>> Make zstd-native from our system available.
>>>>
>>>> Signed-off-by: Jeremy A. Puhlman <jpuhlman@mvista.com>
>>>> ---
>>>>    meta/recipes-devtools/gcc/gcc-11.2.inc | 2 +-
>>>>    1 file changed, 1 insertion(+), 1 deletion(-)
>>>>
>>>> diff --git a/meta/recipes-devtools/gcc/gcc-11.2.inc b/meta/recipes-devtools/gcc/gcc-11.2.inc
>>>> index 68e0d203fc..e2a28468f5 100644
>>>> --- a/meta/recipes-devtools/gcc/gcc-11.2.inc
>>>> +++ b/meta/recipes-devtools/gcc/gcc-11.2.inc
>>>> @@ -11,7 +11,7 @@ BINV = "11.2.0"
>>>>    FILESEXTRAPATHS =. "${FILE_DIRNAME}/gcc:${FILE_DIRNAME}/gcc/backport:"
>>>>
>>>>    DEPENDS =+ "mpfr gmp libmpc zlib flex-native"
>>>> -NATIVEDEPS = "mpfr-native gmp-native libmpc-native zlib-native flex-native"
>>>> +NATIVEDEPS = "mpfr-native gmp-native libmpc-native zlib-native flex-native zstd-native"
>>>>
>>>>    LICENSE = "GPL-3.0-with-GCC-exception & GPL-3.0-only"
>>> Does master have that issue?
>>>
>>> Cheers,
>>>
>>> Richard
>> I would would be really surprised if it didn't, since it appears gcc is
>> explicilty decidding to use the library if it is there. The patch
>> cherry-picks with
>> name fuzzing so if we want to start it there, I can resubmit on master.
> Yes, please do!  I'll cherry-pick to kirkstone after it hits master.

Did a quick build on master and yeah, it links against libzstd.so.1.

tmp/work/x86_64-linux/gcc-cross-x86_64/12.1.0-r0/image/home/cluge/builds/centos7/x86-generic-64-5.10-4.0-cgx/build/tmp/work/x86_64-linux/gcc-cross-x86_64/12.1.0-r0/recipe-sysroot-native/usr/libexec/x86_64-poky-linux/gcc/x86_64-poky-linux/12.1.0/cc1
   NEEDED               libmpc.so.3
   NEEDED               libmpfr.so.6
   NEEDED               libgmp.so.10
   NEEDED               libz.so.1
   NEEDED               libzstd.so.1
   NEEDED               libm.so.6
   NEEDED               libc.so.6
   NEEDED               ld-linux-x86-64.so.2

Patch for master submitted.

>
> Steve

