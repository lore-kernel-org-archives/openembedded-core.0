Received: from mail-we0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1SUMXH-0002jy-0V
	for openembedded-core@lists.openembedded.org;
	Tue, 15 May 2012 20:31:51 +0200
Received: by werg55 with SMTP id g55so3143619wer.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 15 May 2012 11:21:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=content-type:mime-version:subject:from:in-reply-to:date
	:content-transfer-encoding:message-id:references:to:x-mailer
	:x-gm-message-state;
	bh=S9DzJ/ecWHEpiByymZLkAfI0bA5dHw56UXuw8Bv/Q2E=;
	b=YJcfAwhxkmFzpW+jYkcQ3Unw+oOEc72zlMWy4oxyoLMYyqIIfQKcdt35WOx4jAzb+e
	c+zjCwbDo/zW93mJ7E+vc8F4zEJWz2el45oC/SdAM3mMCgoPUzFjPlRPkykVW57ubUkl
	8oytnkt7OCc6uFMAUFi1efMVObH5A0mtpI5Cwf3l3a0/S2GBH6VUbAGizOvSVsNNBZgf
	28zsQzAMz5MAR8ODEK8G62bMLpPGPJWgJA0SKNnDNJjbXQhF+rpULLJn+h5/I4RVgGNL
	BiwNAK9AJkbP2dXJpAzXYUGEEBU86bK4ehrHP+NoByu6/9gVbWI/TACgzZkcBcPJb8xl
	6U/Q==
Received: by 10.180.105.69 with SMTP id gk5mr34230071wib.3.1337106110526;
	Tue, 15 May 2012 11:21:50 -0700 (PDT)
Received: from [172.20.1.36] (ip545070eb.adsl-surfen.hetnet.nl.
	[84.80.112.235])
	by mx.google.com with ESMTPS id n11sm7084184wiv.9.2012.05.15.11.21.48
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 15 May 2012 11:21:49 -0700 (PDT)
Mime-Version: 1.0 (Apple Message framework v1278)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <1337104514.2711.45.camel@ted>
Date: Tue, 15 May 2012 20:21:48 +0200
Message-Id: <BBE73C71-81C8-4E97-9BE3-075F5AE8C2F6@dominion.thruhere.net>
References: <cover.1337003246.git.otavio@ossystems.com.br>
	<f1b02094a00615abfdee28e820c70e50c2ca9471.1337003246.git.otavio@ossystems.com.br>
	<FD8F6943-F6C7-4588-B5F6-BAA1BE723FF9@dominion.thruhere.net>
	<CAP9ODKqS16XxB0pSXdf7RONbRCagQL=9B=ia44vjDDFwneOY4w@mail.gmail.com>
	<1337104514.2711.45.camel@ted>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Mailer: Apple Mail (2.1278)
X-Gm-Message-State: ALoCoQmtAx3VL4AfnZsOuXTHbMm9wx7Abe4+vNJ12hU3prT383AXznaMNDrMgT6snwlCNuHX/X9O
Subject: Re: [PATCH 1/1] kmod: fix installation path of pkgconfig files
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 15 May 2012 18:31:51 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 15 mei 2012, om 19:55 heeft Richard Purdie het volgende geschreven:

> On Mon, 2012-05-14 at 12:24 -0300, Otavio Salvador wrote:
>> On Mon, May 14, 2012 at 11:06 AM, Koen Kooi =
<koen@dominion.thruhere.net> wrote:
>>>=20
>>> Op 14 mei 2012, om 15:47 heeft Otavio Salvador het volgende =
geschreven:
>>>=20
>>>> The pkgconfig files need to be installed in ${libdir} instead of
>>>> ${base_libdir}.
>>>=20
>>> Thanks for the patch, I was working on something similar :) I talked
>> with the kmod and udev people and they asked why we want kmod libs
>> in /lib instead of /usr/lib. I didn't have an answer to that, does
>> anyone else have a decent one? If not, let's not mess with $prefix =
and
>> remove all the do_install changes.
>>=20
>> OE-Core try to allow the use of /usr in a separated partition so it
>> seems it is a requirement for it to work in initrdless systems.
>=20
> I've heard requests from people that / be bootable with /usr being
> mounted later. For something like kmod, there is therefore a case for
> putting the library in base_libdir, not libdir. Not doing so sounds =
like
> a bit of a cop-out from the maintainers.

Good luck with booting a split /usr without udev. Can we *please* get =
the .pc in the right place so udev builds before trying to fix =
pie-in-the-sky things like split /usr?=


