Return-Path: <otavio.salvador@gmail.com>
Received: from mail-ie0-f176.google.com (mail-ie0-f176.google.com
	[209.85.223.176])
	by mail.openembedded.org (Postfix) with ESMTP id 81A996A467;
	Fri,  8 Nov 2013 11:55:53 +0000 (UTC)
Received: by mail-ie0-f176.google.com with SMTP id x13so433458ief.35
	for <multiple recipients>; Fri, 08 Nov 2013 03:55:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date:message-id:subject
	:from:to:cc:content-type;
	bh=F0BDSFlTtnEUzO0C/mnchUrYeJtQ7MokD7tM12ZdKXU=;
	b=mE1tfatX5JNHARSnOQIeV3oFzkfQDRBuW3rVtlIdmwaed8Fd10qEruSguXrkw0Jrkr
	T80f3qL84BlJaMf30z6g03YniQYvK+Dx/AhIvKbsrUIawwdEiUpIQ1mIxPQOkJl368E5
	KD2mJ2klWCPO8VvDyHZR6C3qpRzX5hF4vBIXOd6VSU2lCt8OawiWwG5NTGPGhwQazcx1
	HH5zIELzMs/7PeAabfD4499hW+dQfEHK/C07DfqrFniuTb4c5MCZnKuKa/J2Y0rpdS7B
	QB7V4L8ROxxcS/7rmIjO4Ek+cFMGFgLCNBJwpjDBFK6pz+/z84Am/M8bDN2YV3jVPknT
	wE0g==
MIME-Version: 1.0
X-Received: by 10.50.45.100 with SMTP id l4mr2031395igm.8.1383911754797; Fri,
	08 Nov 2013 03:55:54 -0800 (PST)
Sender: otavio.salvador@gmail.com
Received: by 10.64.20.229 with HTTP; Fri, 8 Nov 2013 03:55:54 -0800 (PST)
In-Reply-To: <1383866418.6271.288.camel@ted>
References: <1381358545.29912.50.camel@ted> <20131028151004.34b2af21@e6520eb>
	<CAMKF1so3GUQZMvLADSCr=Exavo5OVgh==do7aHhe_wUQk9mFHQ@mail.gmail.com>
	<20131029082852.4399ee5e@e6520eb> <1383146112.25877.34.camel@ted>
	<20131102094725.14fb6902@e6520eb>
	<CAAQYJAvvqEByKQRPKRZviqPJmSrDqYt1PvnYPxeJuOSuKO-HaA@mail.gmail.com>
	<1383520239.6271.96.camel@ted>
	<CAAQYJAsRd=4bXxG8h42EbJgnspo_3ge=__GYpqShQom9-n11RA@mail.gmail.com>
	<CAAQYJAttXLv8jQczSLU=8C9iw6z9JS6xbOrOiB7ahaowzLWx8g@mail.gmail.com>
	<1383866418.6271.288.camel@ted>
Date: Fri, 8 Nov 2013 09:55:54 -0200
X-Google-Sender-Auth: 0rrce-VCFTyVToQb0XjaNinBoKk
Message-ID: <CAP9ODKrfJov9n+EmY1sShuHC6kdghTt3m7eagFcYThcC75f5GQ@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>,
	openembedded-core <Openembedded-core@lists.openembedded.org>
Subject: Re: SRC_URI computing order
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
X-List-Received-Date: Fri, 08 Nov 2013 11:55:53 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Thu, Nov 7, 2013 at 9:20 PM, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
> On Wed, 2013-11-06 at 09:45 +0100, Andrea Adami wrote:
>> On Mon, Nov 4, 2013 at 11:13 PM, Andrea Adami <andrea.adami@gmail.com> wrote:
>> > On Mon, Nov 4, 2013 at 12:10 AM, Richard Purdie
>> > <richard.purdie@linuxfoundation.org> wrote:
>> >> On Sun, 2013-11-03 at 23:16 +0100, Andrea Adami wrote:
>> >>> I have to report an undesiderate behavior:
>> >>>
>> >>> the formfactor files in our .bbappend are not considered :/
>> >>> DEBUG: Searching for machconfig in paths:....
>> >>>   /oe/oe-core/meta/recipes-bsp/formfactor/formfactor-0.0/
>> >>>   /oe/oe-core/meta/recipes-bsp/formfactor/formfactor/
>> >>>   /oe/oe-core/meta/recipes-bsp/formfactor/files/
>> >>>   /oe/meta-handheld/recipes-bsp/formfactor/files/poodle
>> >>>
>> >>> so we end up with the empty machconfig of
>> >>> /oe/oe-core/meta/recipes-bsp/formfactor/files/
>> >>>
>> >>> Surely this didn't happen when we tested the recipe.
>> >>
>> >> With which revision of OE-Core? Was this with the dora release tag,
>> >> current dora head or master?
>> >>
>> >> Cheers,
>> >>
>> >> Richard
>> >>
>> >>
>> >
>> > This was with fresh master:
>> >
>> > Build Configuration:
>> > BB_VERSION        = "1.21.0"
>> > BUILD_SYS         = "i686-linux"
>> > NATIVELSBSTRING   = "Gentoo"
>> > TARGET_SYS        = "arm-oe-linux-gnueabi"
>> > MACHINE           = "poodle"
>> > DISTRO_VERSION    = "oe-core.0"
>> > TUNE_FEATURES     = "armv5 thumb dsp"
>> > TARGET_FPU        = "soft"
>> > meta              = "master:511b4194165ed7a5645169e09c27db280d5a5316"
>> > meta-initramfs    = "master:4d62e7f575e2a87197c74ab4639561b45eec0e60"
>> > meta-handheld     = "master:55a310666b543e6beca47fa3c197492d5a6cf8ff"
>> >
>> > Cheers
>> FYI
>> In the hurry for a solution for fixing formfactor and ipaq-boot-params
>> my quick hack was to revert
>>
>> http://cgit.openembedded.org/openembedded-core/commit/meta?id=92cbf7eeea553bfa24c7081473fa8bc4ebc1f552
>>
>> That appears to fix the specific issue...
>
> Its a hacky workaround. The real issue is that you don't set DISTRO and
> this puts a :: into FILESOVERRIDES (and OVERRIDES). I've sent a patch
> out which sets a default for DISTRO since its the nicer way I could find
> to fix this. The behaviour in the above patch is correct.

Can you point this patch?

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

