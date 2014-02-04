Return-Path: <koen.kooi@linaro.org>
Received: from mail-wg0-f42.google.com (mail-wg0-f42.google.com [74.125.82.42])
	by mail.openembedded.org (Postfix) with ESMTP id 073976E89B
	for <openembedded-core@lists.openembedded.org>;
	Tue,  4 Feb 2014 11:27:24 +0000 (UTC)
Received: by mail-wg0-f42.google.com with SMTP id l18so4244357wgh.3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 04 Feb 2014 03:27:24 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:message-id:date:from:user-agent:mime-version:to
	:cc:subject:references:in-reply-to:content-type
	:content-transfer-encoding;
	bh=5idMpMbEYGTE6uWwz1G0JQiG/YZo1zHJ0UXBXatCreU=;
	b=SeiV1hTH4rO0HCxlBJ4Tzuzyie+acjvv5WYK3dMhHLIgjp2FwRy2PAnyKKu8dvFZv6
	YvBXQLNLkOBLUgO0i43SDlJkaLsZVCrhJvMfHDDfKrvsPKD+K0j7wetm/vWfxRskKV4K
	bXITkrQDSj292GMWxHWEHE3oeSt0GjARgUyqbRat+Pv7jSYL6blB7gYurCq8qLo+7lXY
	1FPehaTuGAFuqpPoBg4zosCnqU3MF4+d4YJ55cf8WZwmZ241Aqe71O8zoObV84TgH+mT
	Jw37EJbWnTUaruJA1783HhBVfh0mxumXweoOlmlpYN66qEEBbtsoMw+8YJYYJhgnUbPP
	dIKQ==
X-Gm-Message-State: ALoCoQnEzkEyYrbwipyv6maxXX5ilE385zza6rL2gmA4RPiqB9F2LWdSX3Dpig1PoaDCUFZ9ULX3
X-Received: by 10.180.208.73 with SMTP id mc9mr12136411wic.54.1391513244672;
	Tue, 04 Feb 2014 03:27:24 -0800 (PST)
Received: from ?IPv6:2001:610:612:0:5e51:4fff:fec8:7c15?
	([2001:610:612:0:5e51:4fff:fec8:7c15])
	by mx.google.com with ESMTPSA id j9sm51816969wjz.13.2014.02.04.03.27.23
	for <multiple recipients>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Tue, 04 Feb 2014 03:27:24 -0800 (PST)
Message-ID: <52F0CE9B.7060601@linaro.org>
Date: Tue, 04 Feb 2014 12:27:23 +0100
From: Koen Kooi <koen.kooi@linaro.org>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.2.0
MIME-Version: 1.0
To: Otavio Salvador <otavio@ossystems.com.br>, 
	Richard Purdie <richard.purdie@linuxfoundation.org>
References: <1390297632-9966-1-git-send-email-koen.kooi@linaro.org>	<1390312633.874.84.camel@ted>	<52DE7E17.2090301@linaro.org>	<1390316993.874.85.camel@ted>	<52F0ABC7.1010908@linaro.org>	<1391506325.22620.12.camel@ted>
	<CAP9ODKr7Ypt08VYjnZ=1rmmwh-Ri+qjWwc4L9yiF=iw8dE2ArQ@mail.gmail.com>
In-Reply-To: <CAP9ODKr7Ypt08VYjnZ=1rmmwh-Ri+qjWwc4L9yiF=iw8dE2ArQ@mail.gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [RFC][PATCH] package.bbclass: fix strip and split logic
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
X-List-Received-Date: Tue, 04 Feb 2014 11:27:25 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 02/04/2014 12:20 PM, Otavio Salvador wrote:
> Hello Richard,
>
> On Tue, Feb 4, 2014 at 7:32 AM, Richard Purdie
> <richard.purdie@linuxfoundation.org> wrote:
>> On Tue, 2014-02-04 at 09:58 +0100, Koen Kooi wrote:
>>> On 01/21/2014 04:09 PM, Richard Purdie wrote:
>>>> On Tue, 2014-01-21 at 15:03 +0100, Koen Kooi wrote:
>>>>> On 01/21/2014 02:57 PM, Richard Purdie wrote:
>>>>>> On Tue, 2014-01-21 at 10:47 +0100, Koen Kooi wrote:
>>>> I'm ok with it in principle but I'd like to see known build issues fixed
>>>> before it goes in since red autobuilders cause me enough grief
>>>> already ;-).
>>>
>>> What's the status on this? I know a fix went into meta-intel (albeit it
>>> in a legally questionable way, but that's their problem) and the other
>>> affected layers have received patches for it.
>>
>> The last test build I ran:
>>
>> http://autobuilder.yoctoproject.org/main/builders/nightly-fsl-arm/builds/10/steps/BuildImages_1/logs/stdio
>>
>> still shows an error in the fsl-arm layer which I suspect is from this.
>> I was hoping that could get fixed before it merges, its very much still
>> in the queue though.
>>
>> I won't wait forever, equally, maintaining the green builds is proving
>> to consume a lot of my time and if I can avoid adding more failures, I'd
>> prefer to do so.
>
> I asked two fixes for Koen in the patch and I am awaiting this to
> apply his patches.

And I already said I'm not planning to jump through more hoops just to 
get this patch into OE-core.

-- 
Koen Kooi
Builds and Baselines | Release Manager
Linaro.org | Open source software for ARM SoCs

