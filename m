Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 6653C75264
	for <openembedded-core@lists.openembedded.org>;
	Thu,  7 Jun 2018 10:42:14 +0000 (UTC)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.15.2/8.15.2/Debian-3) with ESMTPSA id
	w57Ag8Qq007533
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NOT); Thu, 7 Jun 2018 11:42:09 +0100
Message-ID: <8224f706c78b5e41ce6a3673d221a983ccbffe77.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Bruce Ashfield <bruce.ashfield@gmail.com>, Khem Raj <raj.khem@gmail.com>
Date: Thu, 07 Jun 2018 11:42:08 +0100
In-Reply-To: <CADkTA4OwmjAJwxauPDWpxsoxENxSHpiNWkSm-Y8Gi9_CNdrMqg@mail.gmail.com>
References: <cover.1528320772.git.raj.khem@gmail.com>
	<CADkTA4OwmjAJwxauPDWpxsoxENxSHpiNWkSm-Y8Gi9_CNdrMqg@mail.gmail.com>
X-Mailer: Evolution 3.28.1-2 
Mime-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.4 at dan
X-Virus-Status: Clean
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH V2 00/12] Add GCC 8 recipes
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
X-List-Received-Date: Thu, 07 Jun 2018 10:42:14 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2018-06-06 at 20:45 -0400, Bruce Ashfield wrote:
> 
> 
> On Wed, Jun 6, 2018 at 5:37 PM, Khem Raj <raj.khem@gmail.com> wrote:
> > This changeset is including the review feedback from last patchset
> > 
> > - Fixes ppc such that we dont have to change machine options so it
> > remains backward compatible and folks can still use gcc7
> > - Tweaks arm tunes to set -mtune instead of -mcpu, this avoids
> > conflicts between -march/-mcpu
> > - Removes workarounds to avoid these conflicts in valgrind
> > - Add mips 74kc tune files
> > - Linux yocto changes are also part of Bruce's kernel updates but
> > this makes it complete until those changes are pulled in
> 
> Correct. I have all of the gcc8 patches in linux-yocto 4.12/4.14/4.15
> and linux-yocto-dev.
> 
> They should have been covered by my last set of SRCREV updates, and I
> noticed that
> some are in, and some not.
> 
> I'll resubmit my SRCREV queue tomorrow, and that will cover the gcc8
> angle.

Thanks. Khem's series failed since it doesn't cover 4.14, Bruce's
patchset helped a lot.

It looks like we have kernel failures with:

MACHINE="mpc8315e-rdb" DISTRO="poky-lsb" in linux-yocto 4.14
https://autobuilder.yocto.io/builders/nightly-ppc-lsb/builds/1051/steps/BuildImages_1/logs/stdio

MACHINE="mpc8315e-rdb" DISTRO="poky" in linux-yocto 4.15
https://autobuilder.yocto.io/builders/nightly-ppc/builds/1066/steps/BuildImages_1/logs/stdio

MACHINE="edgerouter" DISTRO="poky-lsb" in linux-yocto 4.14:
https://autobuilder.yocto.io/builders/nightly-mips-lsb/builds/1040/steps/BuildImages_1/logs/stdio

MACHINE="edgerouter" DISTRO="poky" in linux-yocto 4.15:
https://autobuilder.yocto.io/builders/nightly-mips/builds/1044/steps/BuildImages_1/logs/stdio

I realised the above may be due to missing BSP SRCREV updates (cc Kevin)?

With gcc 8, it seems we have a problem with meta-mingw:

https://autobuilder.yocto.io/builders/nightly-qa-extras/builds/1062/steps/BuildImages_3/logs/stdio

The build isn't finished but I'm hoping these are the main remaining
issues.

Cheers,

Richard









