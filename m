Return-Path: <andrea.adami@gmail.com>
Received: from mail-la0-f45.google.com (mail-la0-f45.google.com
	[209.85.215.45])
	by mail.openembedded.org (Postfix) with ESMTP id B96986D13F
	for <openembedded-core@lists.openembedded.org>;
	Sat,  9 Nov 2013 20:38:54 +0000 (UTC)
Received: by mail-la0-f45.google.com with SMTP id el20so2907747lab.32
	for <openembedded-core@lists.openembedded.org>;
	Sat, 09 Nov 2013 12:38:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=qUloVzqtdyksPfA7TCcvGBJS6zccak9y0yfgjLpMbP4=;
	b=dSNChIEYHj0+18dMObqFFlZtQ99MS3zqz0bPTILXui7bJuCf79numuAwphaLnK/7gs
	Tq1gBnQGIYc7vWZ9INEjh6mmkcYeHVPGtOZnATE47JPCoPQ75Mg+imNvSuLNiUyUbSfz
	o8NUCYkDpUuNVZK9oVAFKioRfA2qcUBIiQv08nvn5dV83zfJSIBE3wwVzCfnA8z8x6pp
	JRwDEiK29hAemJi/6/zC8fYSeYNuC9Ej+GGIRcBCA0IpsBTeJuggsP5Br85lLx5f9k5y
	YP29dFovCPW6fBPPsaanteHmrf3FjnuMl13Eh0pp89obik90c5LkP1QnisT2dezPRt4D
	I6sg==
MIME-Version: 1.0
X-Received: by 10.112.205.164 with SMTP id lh4mr15427511lbc.15.1384029535292; 
	Sat, 09 Nov 2013 12:38:55 -0800 (PST)
Received: by 10.112.52.74 with HTTP; Sat, 9 Nov 2013 12:38:55 -0800 (PST)
In-Reply-To: <1383931424.5378.131.camel@dvhart-mobl4.amr.corp.intel.com>
References: <1383923880.2345.4.camel@ted> <527D0624.3060407@windriver.com>
	<1383926139.2345.7.camel@ted> <527D0A44.7020005@windriver.com>
	<1383929419.2345.11.camel@ted>
	<1383931424.5378.131.camel@dvhart-mobl4.amr.corp.intel.com>
Date: Sat, 9 Nov 2013 21:38:55 +0100
Message-ID: <CAAQYJAv9BxmjsskLP+-26b=HkRWpLYxzsmzQVyo-norREhSUOA@mail.gmail.com>
From: Andrea Adami <andrea.adami@gmail.com>
To: "Hart, Darren" <darren.hart@intel.com>
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] kernel: Use hardlinks for do_populate_sysroot for speed
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
X-List-Received-Date: Sat, 09 Nov 2013 20:38:56 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Fri, Nov 8, 2013 at 6:23 PM, Hart, Darren <darren.hart@intel.com> wrote:
> On Fri, 2013-11-08 at 16:50 +0000, Richard Purdie wrote:
>> On Fri, 2013-11-08 at 10:59 -0500, Bruce Ashfield wrote:
>> > On 13-11-08 10:55 AM, Richard Purdie wrote:
>> > > On Fri, 2013-11-08 at 10:41 -0500, Bruce Ashfield wrote:
>> > >> On 13-11-08 10:18 AM, Richard Purdie wrote:
>> > >>> The kernel tree is large and doesn't need to be copied. Override
>> > >>> the default sysroot handling function to use a hardlink copying
>> > >>> function in python.
>> > >>>
>> > >>> This commit also drops the copying of the /lib directory which
>> > >>> just contains the kernel modules. We never use those in the sysroot
>> > >>> so there is little point in carrying those around.
>> > >>>
>> > >>> For linux-yocto this takes the do_populate_sysroot time 24s -> 14s.
>> > >>
>> > >> Fantastic. One less thing for me to dig into later. I thought this
>> > >> was already in place, so I'm pleasantly surprised that there was a
>> > >> time savings to be found!
>> > >
>> > > I was somewhat surprised too.
>> > >
>> > > We still need to optimise what we install in do_install since that is
>> > > where significant gains can still be made.
>> >
>> > Agreed. I started some changes in that area right after ELC-e, I'll
>> > try and get them out sooner rather than later.
>>
>> I thought I'd share this for people's interest:
>>
>> http://dan.rpsys.net/kernelbuildissue.png
>>
>> Its the output from pybootchart of a bitbake core-image-sato from
>> scratch. I've zoomed out to put some bars in particular into
>> perspective.
>>
>> The pink colour is linux-yocto:do_install, the cyan is
>> linux-yocto:do_package and the blue is linux-yocto:do_populate_sysroot.
>> The uncoloured bar at the bottom is linux-yocto:do_package_write_rpm.
>>
>> So the final thing to build is the kernel by quite some margin, its
>> holding the rest of the build up.
>>
>> Hopefully these patches start to improve that a bit!
>>
>
> Yup, linux-yocto do_package is the biggest build-time hindrance for me
> and something we've wanted to look into for a long time. Great to see
> some progress.
>
> --
> Darren Hart
> Intel Open Source Technology Center
> Yocto Project - Linux Kernel
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

On my old quad core:

Before: 95.24 seconds
After: 83.25 seconds

Thanks

Andrea

