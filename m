Return-Path: <raj.khem@gmail.com>
Received: from mail-ie0-f172.google.com (mail-ie0-f172.google.com
	[209.85.223.172])
	by mail.openembedded.org (Postfix) with ESMTP id DD31D706B3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 23 Feb 2015 17:30:22 +0000 (UTC)
Received: by iecar1 with SMTP id ar1so25175138iec.11
	for <openembedded-core@lists.openembedded.org>;
	Mon, 23 Feb 2015 09:30:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=GuMqYSi7W7JoDSLRPr/EMexF4Utf5LqBWUDxIUYUYZQ=;
	b=lu/9+f/w097ySe9mmBhoOPrbnAKp1PI4FpTVbWSH6YOO0x/mj1Beamk7uYMWSssG7B
	WGPNYzZztzkFVCkLT5v+A7R8Y7YqKYFqof0D7idzAh7MdCZHRDdHA73kq51syI9C/sid
	4A7JrOVSpoVT7n3X49rxjeO5BLik0f32pHFqQg3ijK0E7PoVKcekF0CiVCtYFhLWTaTx
	KeJfAG7yR+xUEfeZEuTtpJLdkQ5BtUU9BjzUH0qaYHJidVWr8XkMU9P1wCnMkFFiHY0o
	/CVKsCKyIk3PTqMpJZA7C5xeiWMJH3U3BoMk/ihB9k0WDhmh2aIP1f2R/dUscgR91hpi
	FcVg==
X-Received: by 10.42.229.10 with SMTP id jg10mr12670869icb.62.1424712624100;
	Mon, 23 Feb 2015 09:30:24 -0800 (PST)
MIME-Version: 1.0
Received: by 10.50.117.7 with HTTP; Mon, 23 Feb 2015 09:29:53 -0800 (PST)
In-Reply-To: <CABcZANmEy-2kZwNQbXYCJw_vFFU9N_bOpSeUJh86=rUayDf3PA@mail.gmail.com>
References: <cover.1424405852.git.raj.khem@gmail.com>
	<e879427a035a12a0b9040ff948fe3e22618412b8.1424405852.git.raj.khem@gmail.com>
	<88edecf9cc4e46b4fd3dd7e95fb2de450625364a.1424405852.git.raj.khem@gmail.com>
	<CABcZANmEy-2kZwNQbXYCJw_vFFU9N_bOpSeUJh86=rUayDf3PA@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 23 Feb 2015 09:29:53 -0800
Message-ID: <CAMKF1sqaWVtkZqC21AuoQa514LOA3pLOJi01zw5Vn808E=Pgww@mail.gmail.com>
To: Christopher Larson <clarson@kergoth.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 5/5] glibc: Dont offer to be parsed for non-glibc TCLIBC selection
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
X-List-Received-Date: Mon, 23 Feb 2015 17:30:29 -0000
Content-Type: text/plain; charset=UTF-8

On Mon, Feb 23, 2015 at 7:00 AM, Christopher Larson <clarson@kergoth.com> wrote:
>
> On Thu, Feb 19, 2015 at 9:24 PM, Khem Raj <raj.khem@gmail.com> wrote:
>>
>> +    notglibc = (re.match('.*uclibc
>> , d.getVar('TARGET_OS', True)) != None) and (re.match('.*musl,
>> d.getVar('TARGET_OS', True)) != None)
>> +    if notglibc:
>
>
> Pretty sure this is a condition that will never be satisfied. This will only
> succeed if TARGET_OS is both musl and uclibc.

right ! I should have paid more attention. But since bitbake stopped
complaining with my test case
i relied on it not warning me. but I realise it should have just
reused the parser cache

Could we skip on TCLIBC !=
> glibc, to be both future proof and fix the logic?

Actually that was the patch I have done prior to this ( see
meta-linaro) but thats too restrictive since
it also meant that it started to ignore it for nativesdk-libc and we
use glibc as a provider to nativesdk version
of libc even in cases when target libc is musl or uclibc. So TARGET_OS
is really the correct variable here.

> --
> Christopher Larson
> clarson at kergoth dot com
> Founder - BitBake, OpenEmbedded, OpenZaurus
> Maintainer - Tslib
> Senior Software Engineer, Mentor Graphics

