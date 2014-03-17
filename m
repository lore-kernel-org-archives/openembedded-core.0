Return-Path: <raj.khem@gmail.com>
Received: from mail-ie0-f175.google.com (mail-ie0-f175.google.com
	[209.85.223.175])
	by mail.openembedded.org (Postfix) with ESMTP id AB4B96F725
	for <openembedded-core@lists.openembedded.org>;
	Mon, 17 Mar 2014 16:07:07 +0000 (UTC)
Received: by mail-ie0-f175.google.com with SMTP id to1so5627407ieb.20
	for <openembedded-core@lists.openembedded.org>;
	Mon, 17 Mar 2014 09:07:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=BgH7U6O8qxPRR5XAbXOo0p5nxOadkjD61KWWYKe+yMc=;
	b=iIZWzTPFYwAQDmghnpwQw/YTud4UdSv2B5iOV/x+7BvzEhBu5DOCED8qfSyUKogEb0
	USvPrUXPZ28dzozJeEJbsNT4J+40on+PiNbHFcPl2xLBQZHfDdJgU98IRtbVNmf4bovs
	NiMVvt4Qo8fG6uo6h6LeDVeclq8wjLxD5tFagOg/QWejeZ/epdd7ap/IzjfuW2HxYlHE
	Flg0O4Q5JI2fOg6zbh4WNEfL8W2/1XdTRWa2wpGwEINhbtU//Mm1dW/2JvBPWZtunrqM
	R/R5yNAA5MfR6Xx2VAet2+lDoa9HRzfVLVf2QymjdnN6bXQdCO7uugUsH2ocQ83CbzE3
	XZHA==
X-Received: by 10.42.20.6 with SMTP id e6mr19277140icb.29.1395072428204; Mon,
	17 Mar 2014 09:07:08 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.50.224.136 with HTTP; Mon, 17 Mar 2014 09:06:37 -0700 (PDT)
In-Reply-To: <1395055876.3808.38.camel@ted>
References: <cover.1394948105.git.raj.khem@gmail.com>
	<1395055876.3808.38.camel@ted>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 17 Mar 2014 09:06:37 -0700
Message-ID: <CAMKF1sp+=gNJGsgAQAEhg2z_F1_fMG0_E7_j0ekBi+d_dPO-og@mail.gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 0/7] systemd-211 upgrade and uclibc fixes
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
X-List-Received-Date: Mon, 17 Mar 2014 16:07:09 -0000
Content-Type: text/plain; charset=UTF-8

On Mon, Mar 17, 2014 at 4:31 AM, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
> On Sat, 2014-03-15 at 22:42 -0700, Khem Raj wrote:
>> Finally, managed to get systemd 211 to boot on uclibc and eglibc
>> on all supported qemu machines, this should fix bug #5940
>>
>> Additional functionality in uclibc is needed to support this
>> systemd
>>
>> gnutls, glib-2.0, intltool fixes are uclibc specific and are needed
>> to get uclibc images going
>>
>> util-linux fix is moulded to support uclibc
>>
>> I have been testing this fix on the qemuarm/qemuppc/qemumips/qemux86/qemux86-64
>> on both uclibc/eglibc images and its been working good.
>>
>> The following changes since commit 58aae40bbf8edd9c5ca70b2094eeb724391f1993:
>>
>>   eglibc: Update SRC_URI to point to final download location (2014-03-13 20:44:48 -0700)
>>
>> are available in the git repository at:
>>
>>   git://git.openembedded.org/openembedded-core-contrib kraj/systemd-211
>>   http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=kraj/systemd-211
>>
>> Khem Raj (7):
>>   uclibc: Implement clock_adjtime()
>>   uclibc: Remove iconv.h
>>   gnutls: Link in pthread explicitly for uclibc
>>   glib-2.0: Fix localedir expectations for uclibc
>>   util-linux: scanf_cv_alloc_modifier changed from 'as' -> 'ms'
>>   intltool: Define DATADIRNAME=share for uclibc based systems
>>   Upgrade to systemd 211+
>
> I tried this on the autobuilder, with and without the pulseaudio 4->5
> upgrade. The result was:
>
> http://autobuilder.yoctoproject.org/main/builders/nightly-qa-systemd/builds/111
> http://autobuilder.yoctoproject.org/main/builders/nightly-qa-systemd/builds/112
>
> so I'm afraid I can't take the systemd part of this series. Its getting
> late in the cycle for a pulseaudio 4->5 upgrade too :/

I was fighting with runtime issues than the build time so I was
building minimal images for quick debug/test cycles.
my bad since I kept pulseaudio out of this pull request the systemd
patch that Martin had
was also left out.


>
> Does anyone have any strong opinions on this?

Give it a shot, if you can otherwise it can wait, 208 still shows
issues with journald where journal
sometimes misses chunks of logs of chatty daemons for an interval of
time after few hours of running, I haven't seen this issue with 211
yet so this is an improvement.
however 208 will keep getting fixes it probably isnt a bad choice to
stick with for this release.

>
> Cheers,
>
> Richard
>
>

