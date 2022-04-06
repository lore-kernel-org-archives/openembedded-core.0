Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Message-ID: <afcc7bdc350eff203b217e8fb1c542bb1a5c2a9d.camel@linuxfoundation.org>
Subject: Re: [PATCH v2 3/3] apt: add apt selftest to test signed package feeds
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
Date: Wed, 06 Apr 2022 12:40:25 +0100
In-Reply-To: <9c8771c5-1b2a-0d6f-0658-ba08dd9ad5fa@gmail.com>
References: <20220403195046.7060-1-fntoth@gmail.com>
	 <20220403195046.7060-5-fntoth@gmail.com>
	 <694f4b0519a5365015c7eb561767b27f3a07e975.camel@linuxfoundation.org>
	 <369e2108-34a9-dbfc-eb09-817a1eee4604@gmail.com>
	 <add235b4921d1a7e7e87ea718624904c1f7b6af2.camel@linuxfoundation.org>
	 <9c8771c5-1b2a-0d6f-0658-ba08dd9ad5fa@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-id: <openembedded-core.lists.openembedded.org>
To: Ferry Toth <fntoth@gmail.com>, openembedded-core@lists.openembedded.org
Cc: Xavier Berger <xavier.berger@bio-logic.net>, Alexander Kanavin <alex@linutronix.de>, Ferry Toth <ftoth@exalondelft.nl>

On Tue, 2022-04-05 at 17:23 +0200, Ferry Toth wrote:
> Op 04-04-2022 om 22:39 schreef Richard Purdie:
>  On Mon, 2022-04-04 at 19:35 +0200, Ferry Toth wrote:
> >  Op 04-04-2022 om 15:58 schreef Richard Purdie:
> > > 
> > > > On Sun, 2022-04-03 at 21:50 +0200, Ferry Toth wrote:
> > > > Looking at the patches I wondered if this would break testimage and
> > > > unfortunately it does:
> > > > 
> > > > https://autobuilder.yoctoproject.org/typhoon/#/builders/50/builds/5013/s
> > > > teps/12/logs/stdio
> > > > https://autobuilder.yoctoproject.org/typhoon/#/builders/76/builds/4975
> > > That is weird, do I understand correctly that it fails on:
> > >   apt-get remove --yes run-postinsts-dev
> > > Reading package lists...
> > > Building dependency tree...
> > > E: Unable to locate package run-postinsts-dev
> > > 
> > > That is actually *) one line I didn't touch. I did note while testing 
> > > that I saw this exact message, however that was not counted as a fail.
> > > 
> > > What could cause this? Because the complaint is it can't remove the 
> > > package because it was not installed.
> > > 
> > > It would be trivial to remove the line
> > > 
> > > *) self.pkg('remove --yes run-postinsts-dev')
> > > 
> > > but how could it have passed the test before?
> > 
> > I think the issue is you edited testimage which is a different set of tests
> > which aren't just called by oe-selftest but by things like 
> That would be my first thought too, but...
> because the failure seems to be on the line self.pkg('remove --yes run-
> postinsts-dev'),  that would mean the line self.pkg('update') passed.
> And that should only pass if it finds a signed repository and has the key
> installed (and believe me, I saw a log of that in the last week).
> So, there may be a second thing wrong?

I was easily able to reproduce this locally and it shows the
setup_source_config_for_package_install() step fails and hence the sources
aren't setup correctly, hence the update probably works.

> Do you know where I can find the log files referred to:
> <..>tmp/work/qemux86-poky-linux/core-image-sato/1.0-
> r0/temp/log.do_testimage.35553
> <..>tmp/work/qemux86-poky-linux/core-image-sato-sdk/1.0-
> r0/temp/log.do_testimage.35362

We can get them off the autobuilder if needed but someone would have to manually
go in and find/share them. The issue does locally reproduce for me with a
"bitbake core-image-sato -c testimage" with package_deb set as the backend.

> or could we do a 'quick' check by changing
>         self.pkg('update')
>         self.pkg('remove --yes run-postinsts-dev')
>         self.pkg('install --yes run-postinsts-dev')
> to 
>         self.pkg('update')
>         self.pkg('install --yes run-postinsts-dev')
>         self.pkg('remove --yes run-postinsts-dev')
> ?

I'm not convinced that would help us...

>  
> > 
> > "bitbake core-image-sato -c testimage"
> > 
> > as well. I'd suggest making the changes in testimage conditional on signing
> > being configured.
> Yes, regardless the above, we need to either make signing always enabled in
> all test cases or detect whether signing is used.
> Do you have a hint if there is a variable to test in class AptRepoTest if
> PACKAGE_FEED_GPG_NAME has been set?
> Otherwise I could just duplicate code and create
> apt.AptRepoTest.test_apt_install_from_repo_signed.
> What would you prefer?
> 

We should be able to test self.tc.td.get('PACKAGE_FEED_GPG_NAME') in the test
and handle accordingly?

I did merge the base changes into the release since I thought it was fair to get
the fixes in before it was built. We just need to get the test sorted now, I
think it is close.

Cheers,

Richard



