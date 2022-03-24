Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Message-ID: <6dad87edfe80040678963ca18842a3ddf337e35c.camel@linuxfoundation.org>
Subject: Re: [PATCH v1 1/2] gpg-sign: Add parameters to gpg signature function
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
Date: Thu, 24 Mar 2022 12:03:25 +0000
In-Reply-To: <a338dc08-b564-4f83-9f88-1e7dd1823f6d@gmail.com>
References: <20220322211949.7423-1-fntoth@gmail.com>
	 <fe0f9ee8-e3d0-1681-af93-fa97019b8a0c@gmail.com>
	 <e2b6066a69cf7933b0618a66b7e1b3589ff6da5c.camel@linuxfoundation.org>
	 <a338dc08-b564-4f83-9f88-1e7dd1823f6d@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-id: <openembedded-core.lists.openembedded.org>
To: Ferry Toth <fntoth@gmail.com>, openembedded-core@lists.openembedded.org
Cc: Xavier Berger <xavier.berger@bio-logic.net>

On Thu, 2022-03-24 at 12:23 +0100, Ferry Toth wrote:
> > On Wed, 2022-03-23 at 19:34 +0100, Ferry Toth wrote:
> > > 
> > > I forgot to add a cover letter, sorry for that. The 2 patches  together 
> > > implement DEB repository signing.
> > > 
> > > This is necessary since Gatesgarth |apt| (1.8.2) has become more strict 
> > > and doesn’t allow unsigned repositories by default.
> > > 
> > > It is possible to override this behavior |but||| is more work then to 
> > > enable signed DEB repositories. These patches makes DEB a first class 
> > > citizen as IPK and RPM.
> > > 
> > > Patches have been in use in meta-intel-edison since Gatesgarth, see 
> > > https://edison-fw.github.io/meta-intel-edison/5.0-Creating-a-deb-
> > > repository.html\
> > What puzzles me is that we can build root filesystems using apt, we test
> > this on
> > the autobuilder. Saying repositories are broken since gatesgarth therefore
> > seems
> > confusing in the commit message.
> Good question. When I (meta-intel-edison) build the rootfs using DEB's it just
> works.
> Could it be that during rootfs build dpkg is used and not apt? I think I have
> seen that in the logs.

It definitely uses apt.

> Of course apt uses dpkg to install a package as well, but it refuses to
> download the package from a repo when it's not signed. 

Perhaps the difference is the packages are local and not remote?

> > I guess we must configure apt to override that during the rootfs process and
> > likely an end user with a remote feed could do the same, possibly with a
> > warning
> > from apt?
>  I believe there is no issue during rootfs generation.
>  
> > I'm also worried that there isn't any automated testing of this change. The
> > reason I worry is that since we don't show any testing failures right now,
> > there
> > is clearly a hole in our automated testing coverage and there is no
> > guarantee
> > that this feature will keep working. It is these smaller corner case issues
> > which tend to make or break the project's experience as if a feature is
> > present,
> > people expect it to work. Can we improve the testing situation?
> It doesn't seem to be a particularly volatile area in the code. I refreshed
> Xavier's patches for Gatesgarth, and am actively using unchanged patch on
> Honisiter.
> I don't know how the automated testing is working but I guess for RPM a repo
> is generated using a small layer? And then tested on a qemu running the
> rootfs?
> Should be almost same for deb/apt, maybe could be modified from rpm test?

I think the rpm test is test_testimage_dnf in
meta/lib/oeqa/selftest/cases/runtime_test.py. You'd run it with:

oe-selftest -r runtime_test.TestImage.test_testimage_dnf

> Point is: currently deb is documented as a feasible package format to generate
> a repo. But it really is not without these signing patches. So we could either
> deprecate deb's (no, no please don't) or fix it.
> These patches fix it. With or without automated testing, it is already better
> then the current situation.

I'm not sure it is. The project gains yet another set of config options which we
don't have tests for and the maintainer stress levels in trying to keep it all
working just get worse.

We have a huge number of ways people can configure the builds. The only way the
project manages to keep all of this working is through automated testing, there
is simply no other way to do it. I appreciate adding tests is a pain and nobody
likes doing it. It does however let the project stay functional for everyone's
diverse use cases.

There are all kinds of patches I could take because the improve some corner
case. In most cases we don't know what else they might break or whether that
code continues to be used or stays working. I therefore do really want tests for
new configurations.

Who should write those tests? If you don't/can't as some actively using the
feature, it means someone else has to, but who?

I've not decided what to do with the patches to be honest but the merge and not
bother with tests argument doesn't sit well with me.

Cheers,

Richard

