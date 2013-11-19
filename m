Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-lb0-f174.google.com (mail-lb0-f174.google.com
	[209.85.217.174])
	by mail.openembedded.org (Postfix) with ESMTP id 4FB626D01E
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Nov 2013 17:56:57 +0000 (UTC)
Received: by mail-lb0-f174.google.com with SMTP id c11so2102579lbj.33
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Nov 2013 09:56:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=ubhaav3zCRQw4uu0HRQ9b/mDzXQG/lxzykJJocSsRYU=;
	b=Cwk69ALV0HrOYp8435muvU9eze2Abz90mGsVP/tN8zAJ+R6PPmo8NSRMy/jZFrGCSW
	YM/iSXhmTODdpYdkwEc4BicEr7jeBwBi7wVFC342hlQhgDPELGMR1XWZjPIvSfU46vlX
	9EjxGjZYel886OzeKNh4jj4zPvTJSeyEdvKIQSq5tMd74WZElZ8aUrsxWroRlhSTZTYd
	tjQuHUu2xX/b8DDudPQLhBhejRIMG2PZuhFcdfWCyCHltsLLz/2SMlC78G4G0nIsBb66
	rvAYAngd7DVhPjdhvCLQyiip/mlIdHaFgE+4GKbbh7bmCUzm/Q404llHGKmtc682af15
	GYTg==
MIME-Version: 1.0
X-Received: by 10.152.30.99 with SMTP id r3mr19910838lah.25.1384883818418;
	Tue, 19 Nov 2013 09:56:58 -0800 (PST)
Received: by 10.112.14.200 with HTTP; Tue, 19 Nov 2013 09:56:58 -0800 (PST)
In-Reply-To: <1384883176.16887.9.camel@ted>
References: <20131119173725.GA13018@mcrowe.com>
	<1384882665-26840-1-git-send-email-mac@mcrowe.com>
	<1384882665-26840-2-git-send-email-mac@mcrowe.com>
	<CADkTA4MQF4be4RO0vm=a2Rv404M9sjK6ZFE7V0hV_gDBX5hvMQ@mail.gmail.com>
	<1384883176.16887.9.camel@ted>
Date: Tue, 19 Nov 2013 12:56:58 -0500
Message-ID: <CADkTA4PcKgf+HW0zXAY4Kf8LqqFB_zryNqvcqa-mNfCoBZ2YoQ@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Mike Crowe <mac@mcrowe.com>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/2] kernel.bbclass: Call make with correct variables in kernelscripts_sstate_postinst
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
X-List-Received-Date: Tue, 19 Nov 2013 17:56:57 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Tue, Nov 19, 2013 at 12:46 PM, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
> On Tue, 2013-11-19 at 12:41 -0500, Bruce Ashfield wrote:
>> On Tue, Nov 19, 2013 at 12:37 PM, Mike Crowe <mac@mcrowe.com> wrote:
>> > Ensure that the environment variable and command line arguments that are
>> > used when calling make in kernel_do_compile are used in
>> > kernelscripts_sstate_postinst.
>>
>> What issue was this causing for you ? The scripts are native, and hence
>> should just be using the build machines compiler, linker and don't need
>> the kernel args.
>>
>> So I'm not convinced that we need this patch, without seeing a tangible
>> issue that was triggered.
>
> I think for some arches at least, something targetish is being cleaned
> and then needing to be rebuilt.

Right. I suppose that if you are installing a mips->mips compiler, then the
target toolchain is required. That really wasn't the intention of this change,
so it likely isn't properly restricted to the native build case (Where native
is a x86 development machine).

But with Phil pointing out the module.bbclass 'make scripts' code again,
I'd like to figure out why it wasn't working for the original bug report and try
to drop all of this mess.

Bruce

>
> I don't want to have to add dependencies for the toolchain so we need to
> look into this further.
>
> Mike: which arch was this on and do you have the compile error?
>
> Cheers,
>
> Richard
>



-- 
"Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end"

