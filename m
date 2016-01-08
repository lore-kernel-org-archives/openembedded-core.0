Return-Path: <armccurdy@gmail.com>
Received: from mail-wm0-f52.google.com (mail-wm0-f52.google.com [74.125.82.52])
	by mail.openembedded.org (Postfix) with ESMTP id AADAA7327E
	for <openembedded-core@lists.openembedded.org>;
	Fri,  8 Jan 2016 18:24:07 +0000 (UTC)
Received: by mail-wm0-f52.google.com with SMTP id f206so184098071wmf.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 08 Jan 2016 10:24:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=39gmA0Ss6eSpvd8JqRsmoaJcKtH+lunwjcfyWlSuxpg=;
	b=wsJQGbZkmVseaaxKHEy7KKwToKMDJmNQECmYtJy6vqkZdG1NVO9+GUfz04/LIbx25Z
	/I1k3awEaEiba0f+bO1EDj1kE5/JPpmXwmzTzP6dFbDswBGgHPz/NaIHjqtZooPOu5Qb
	HbIcEZdKSgfhEi1hEaGUjAUpRYBU3sqCvFHQYApE0lSsNaRHqS5M/loYB++aEMK4d2Uj
	mcM7iNGVTK2w65j3wdXMxt0mh2jzO3R8TRShJcuHJDMIq1MEqSkCqKAvnpMUT8WZj2m0
	PR+j1ujktwt3/UeVPvJZygbRJ2LrkChBzUr1GGex1RZGwDTQLRYUYrrUXNIbjG/7CgEX
	k7kA==
MIME-Version: 1.0
X-Received: by 10.28.104.130 with SMTP id d124mr322228wmc.72.1452277447842;
	Fri, 08 Jan 2016 10:24:07 -0800 (PST)
Received: by 10.194.209.131 with HTTP; Fri, 8 Jan 2016 10:24:07 -0800 (PST)
In-Reply-To: <20160108170054.GB2573@jama>
References: <1452256574-21587-1-git-send-email-Martin.Jansa@gmail.com>
	<1452257072-1799-1-git-send-email-Martin.Jansa@gmail.com>
	<CAJ86T=WNGGp=L358DSu2+VXM4eEdOz9FRcDBkGueUap80RjGBw@mail.gmail.com>
	<20160108170054.GB2573@jama>
Date: Fri, 8 Jan 2016 10:24:07 -0800
Message-ID: <CAJ86T=VQdAB9dRRb4c_XmFOO+BxH13ar=-Fi209Z59Ry6zVy1w@mail.gmail.com>
From: Andre McCurdy <armccurdy@gmail.com>
To: Martin Jansa <martin.jansa@gmail.com>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCHv2][RFC] arch-armv7ve.inc: respect armv7a override as well
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
X-List-Received-Date: Fri, 08 Jan 2016 18:24:07 -0000
Content-Type: text/plain; charset=UTF-8

On Fri, Jan 8, 2016 at 9:00 AM, Martin Jansa <martin.jansa@gmail.com> wrote:
> On Fri, Jan 08, 2016 at 08:24:36AM -0800, Andre McCurdy wrote:
>> On Fri, Jan 8, 2016 at 4:44 AM, Martin Jansa <martin.jansa@gmail.com> wrote:
>> > * in all cases we currently have we consider armv7ve to be compatible with armv7a
>>
>> Is this a short term workaround or a long term solution?
>
> It's just RFC for discussion.
>
>> If it's a long term solution then how will armv7m and armv7r be
>> handled? They are likely to need to duplicate a lot of the current
>> armv7a over-rides too.
>
> armv7a and armv7ve are much closer than armv7a and armv7m or armv7r as
> Khem said in earlier discussion.

I'm not sure what the definition of "close" is here. An armv7a CPU can
not run armv7ve binaries.

Saying armv7a and armv7ve are close is like saying armv4 and armv5 are
close. True in some respects, but they don't define each other's
over-rides.

> And maybe it's because fewer people use
> armv7[rm], but currently these 2 aren't used anywhere as overrides (in
> layers I've in world builds).
>
>> Maybe adding a generic "armv7" over-ride which can be enabled by all
>> armv7 variants is a better option?
>
> Maybe, but that will change how armv7r and armv7m are currently built, I
> cannot say if for better or worse, I don't use either.

I doubt that armv7m or armv7r are buildable at all. Perhaps we should
drop the tune-cortexm1.inc, tune-cortexm3.inc and tune-cortexr4.inc
files completely and stop pretending that they might work?

>> Either way, I'd like to continue cleaning up of the existing armv7a
>> over-rides (e.g. the libav armv7a specific optimisation is likely
>> bogus and should be removed, etc).
>>
>>
>> > Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
>> > ---
>> >  meta/conf/machine/include/arm/arch-armv7ve.inc | 3 ++-
>> >  1 file changed, 2 insertions(+), 1 deletion(-)
>> >
>> > diff --git a/meta/conf/machine/include/arm/arch-armv7ve.inc b/meta/conf/machine/include/arm/arch-armv7ve.inc
>> > index 79e1ef6..d0fdff7 100644
>> > --- a/meta/conf/machine/include/arm/arch-armv7ve.inc
>> > +++ b/meta/conf/machine/include/arm/arch-armv7ve.inc
>> > @@ -3,7 +3,8 @@ DEFAULTTUNE ?= "armv7ve"
>> >  TUNEVALID[armv7ve] = "Enable instructions for ARMv7ve"
>> >  TUNECONFLICTS[armv7ve] = "armv4 armv5 armv6 armv7 armv7a"
>> >  TUNE_CCARGS .= "${@bb.utils.contains('TUNE_FEATURES', 'armv7ve', ' -march=armv7ve', '', d)}"
>> > -MACHINEOVERRIDES =. "${@bb.utils.contains('TUNE_FEATURES', 'armv7ve', 'armv7ve:', '' ,d)}"
>> > +# In all cases we currently have we consider armv7ve to be compatible with armv7a
>> > +MACHINEOVERRIDES =. "${@bb.utils.contains('TUNE_FEATURES', 'armv7ve', 'armv7ve:armv7a:', '' ,d)}"
>> >
>> >  require conf/machine/include/arm/arch-armv6.inc
>> >  require conf/machine/include/arm/feature-arm-neon.inc
>> > --
>> > 2.7.0
>> >
>> > --
>> > _______________________________________________
>> > Openembedded-core mailing list
>> > Openembedded-core@lists.openembedded.org
>> > http://lists.openembedded.org/mailman/listinfo/openembedded-core
>
> --
> Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

