Return-Path: <nicolas.dechesne@linaro.org>
Received: from mail-qk0-f181.google.com (mail-qk0-f181.google.com
	[209.85.220.181])
	by mail.openembedded.org (Postfix) with ESMTP id DAF23607F8
	for <openembedded-core@lists.openembedded.org>;
	Thu, 17 Nov 2016 18:57:06 +0000 (UTC)
Received: by mail-qk0-f181.google.com with SMTP id x190so233739351qkb.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 17 Nov 2016 10:57:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=UKTU7mi0zPtEI8f+VutAyNOWWwH70RtY0mLCDugys1A=;
	b=TX1Eate1d/HDDLEPD4tJBvHgpLKMZOC/nVr/SsNq57b3ch7mnd8cNem5zrzAXNcpTw
	ZGZQxswfTkCTBVPppYP/vwjU/iTX/zuzjwcZsH5LJzcgto9ctkYOKCGCO0nXsNUOBKrq
	QVNXqMS7cnVg8rlYHhPhhT4qhHQRQ1J4E2wlI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=UKTU7mi0zPtEI8f+VutAyNOWWwH70RtY0mLCDugys1A=;
	b=DHQL/FdYFSycX9zU54QD0xAukaPVqw/7uuTqXCFMJtU8dvurNVPTEWCa4pz/HaufQ9
	NkWDSymCtKlX9pdwv19llOfHal5p6yVaHvgfBGbvcNfMk29R2XrfhDgmG0cxBUvqprUV
	/ieL34fbsj1v7GQkS57r56zZc8JUGD0p+J3LZwKt96giAX02o09ZXL+0/LaHZSl4MO//
	RaTzWK/Bcwmi06oQ7/KB4JFJWFO3c51T0woJLYThCW57FHM5AP286ZOzoE4vs0P/YLzc
	lKq62sYKFNMJOhp9gSRNlujLxUSH9CjcfEhBAC0Cvtkc8G6ypsWRkQ6WL4XyOLkJUtn/
	9OWg==
X-Gm-Message-State: AKaTC00K/pcnNBxBdIOvAxVAtT6YNxwJUFivo4zwk1cyfiBn9U4gewYaqdNm1OcKHjoud0TCau1szeDCRNfzupfl
X-Received: by 10.55.98.73 with SMTP id w70mr5656043qkb.91.1479409027515; Thu,
	17 Nov 2016 10:57:07 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.104.102 with HTTP; Thu, 17 Nov 2016 10:56:47 -0800 (PST)
In-Reply-To: <4181f25d-a2bc-bb94-2b94-4d18ad654ab8@gmail.com>
References: <CAJTo0LbvGwRpzxfOL0505w+Vz=Jhf6O3QOr5Z8SX9XaFqaZ7eg@mail.gmail.com>
	<4181f25d-a2bc-bb94-2b94-4d18ad654ab8@gmail.com>
From: Nicolas Dechesne <nicolas.dechesne@linaro.org>
Date: Thu, 17 Nov 2016 19:56:47 +0100
Message-ID: <CAP71WjwJDTVsAcU9YrVh0uBcQ87Xt6HB9fCuj_t-jHcaGsjEWw@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-architecture
	<openembedded-architecture@lists.openembedded.org>,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: Enabling uninative by default in oe-core?
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
X-List-Received-Date: Thu, 17 Nov 2016 18:57:10 -0000
Content-Type: text/plain; charset=UTF-8

On Thu, Nov 17, 2016 at 7:06 PM, Khem Raj <raj.khem@gmail.com> wrote:
>> Background: uninative is a class that downloads a precompiled host glibc for
>> use in the sysroot, thus isolating the native sysroot from the host
>> environment.  This means greater sstate reuse, as instead of native builds
>> being dependent on the host system they're able to be shared between all
>> hosts.  There is a reference tarball hosted on www.yoctoproject.org
>> <http://www.yoctoproject.org>, and the URL can be overridden by distros if you
>> would prefer to build your own.
>>
>> We enable this in Poky so that we get greater reuse on the autobuilders, and
>> due to some issues with the C++ ABI the eSDK generation in master now requires
>> uninative to be enabled.  The question is: do we now enable uninative by
>> default in oe-core's nodistro (pointing at the yoctoproject tarball), or do we
>> keep it disabled by default and require the user to enable uninative if they
>> wish to build an eSDK?
>>
>> Personally I'm torn: I don't like eSDK not working out of the box, but I don't
>> really like oe-core nodistro depending on uninative.  Though enabling
>> uninative globally does mean everything works out of the box, so following the
>> principle of Least Surprise that's what we should do.
>
> If we are supporing e-SDK in OE-Core then we should enable uninative too
> on the same lines.
>
> It does improve the user experience so I am in favor of adding it
> unconditionally. May be tarball can be hosted on oe mirrors as well for
> redundancy


I am not sure how people would care about that (yet ;-) but uninative
does not work for arm64 (host).

Build Configuration:
BB_VERSION        = "1.32.0"
BUILD_SYS         = "aarch64-linux"
NATIVELSBSTRING   = "Debian-8.6"
TARGET_SYS        = "arm-oe-linux-gnueabi"
MACHINE           = "qemuarm"
DISTRO            = "nodistro"
DISTRO_VERSION    = "nodistro.0"
TUNE_FEATURES     = "arm armv5 thumb dsp"
TARGET_FPU        = "soft"
meta              = "master:9303d8055c45a0f6af295d70a6f6a8b9d8d8a7c9"

ERROR: Uninative selected but not configured correctly, please set
UNINATIVE_CHECKSUM[aarch64]

I don't know much about it, but it would be nice to fix that before we
enable it by default. I will try to have a look at it more closely..

