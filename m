Return-Path: <andrea.adami@gmail.com>
Received: from mail-la0-f47.google.com (mail-la0-f47.google.com
	[209.85.215.47])
	by mail.openembedded.org (Postfix) with ESMTP id 91D996D13F
	for <openembedded-core@lists.openembedded.org>;
	Sat,  9 Nov 2013 20:33:32 +0000 (UTC)
Received: by mail-la0-f47.google.com with SMTP id er20so2908524lab.34
	for <openembedded-core@lists.openembedded.org>;
	Sat, 09 Nov 2013 12:33:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=XCAphTQuXCiKMEiRN2xWrvnFPRaoFgVF9hNEbyaLmZc=;
	b=AZCoD8reHGmEvFSKw/Zu7Hrv8fBNxsA0HccisjVlslH7mm+rMZc3oHQ4xSzso3MKFX
	rTvpD7YgUcfwxzQv//JKDpFXyY16Y5E5w5ge2fpWWvth5U2wJICQRqrclOnr2iCTCtWs
	JUQ+Gpg2U9VSzBccDEKh4ZJ68o4iAz/3vSwLaYJBMtA0ESZ/SJmQeYva5KibpLZcCuZI
	txH1S4+3wriEDbpR0/7318xcSV4H6LCI/us39guD2ojPQouWlWGUlsthTWxKqiTCukqq
	aVl6pqxTz0M2yFHuCbuvKQabFi9NrnM6Iiu89g+A6cKua6V66gE7PdRw7cKNNTy0/3fb
	4jsg==
MIME-Version: 1.0
X-Received: by 10.112.125.33 with SMTP id mn1mr15499960lbb.8.1384029213113;
	Sat, 09 Nov 2013 12:33:33 -0800 (PST)
Received: by 10.112.52.74 with HTTP; Sat, 9 Nov 2013 12:33:33 -0800 (PST)
In-Reply-To: <1383929632.2345.14.camel@ted>
References: <1383923827.2345.2.camel@ted>
	<1383929280.5378.110.camel@dvhart-mobl4.amr.corp.intel.com>
	<1383929632.2345.14.camel@ted>
Date: Sat, 9 Nov 2013 21:33:33 +0100
Message-ID: <CAAQYJAsg4ux4xxKs2boj=Dg7WSJwtdwXO3v1FYj--4xO1t9vxg@mail.gmail.com>
From: Andrea Adami <andrea.adami@gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: "Hart, Darren" <darren.hart@intel.com>,
	openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] kernel: Use hardlinks during do_install for speed
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
X-List-Received-Date: Sat, 09 Nov 2013 20:33:33 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Fri, Nov 8, 2013 at 5:53 PM, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
> On Fri, 2013-11-08 at 16:48 +0000, Hart, Darren wrote:
>> On Fri, 2013-11-08 at 15:17 +0000, Richard Purdie wrote:
>> > Whilst the comment says we can't do this, its incorrect, install operates
>> > on WORKDIR and its hard for different parts of WORKDIR to be on different
>>
>> Is it hard? Or is it not possible / not supported?
>
> Not really possible unless you try very hard. Its not supported. We
> don't even support WORKDIR and sysroot on different disks really.
>
>> My understanding was it was possible and therefor we couldn't hardlink.
>> I'm thrilled at the prospect of being wrong there though!
>
> I'm happy enough to decide we don't support it (and we never have).
>
>> > filesystems. Hardlinking instead of copying is therefore a nice performance
>> > gain.
>> >
>> > Also, completely skip the Documentation directory (adding a dummy Makefile
>> > to keep make happy) and tweak the other cp commands to link since if we
>> > don't we'd get "this is the same file" type errors from cp for some kernel
>> > versions.
>> >
>> > For do_install on linux-yocto, this takes it from 227s -> 84s.
>>
>> This, and the others, are fantastic improvements, thanks RP!
>
> I'm rather happy to find something we can easily fix :)
>
> Cheers,
>
> Richard
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

On my old quad core:

Before: 131.01 seconds
After: 102.29 seconds

Thanks

Andrea

