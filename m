Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Message-ID: <fdca8e9d3824e0cf0782cf54d2967c7796b44e28.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] gcc: Fix tm.h plugin header
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
Date: Tue, 21 Dec 2021 12:04:27 +0000
In-Reply-To: <429927de-21b9-4c9a-8a8f-93a3b64242b1@www.fastmail.com>
References: <09f8ff3a-829d-41e4-95c1-fd203eaba643@www.fastmail.com>
	 <28190.1639964358069173094@lists.openembedded.org>
	 <429927de-21b9-4c9a-8a8f-93a3b64242b1@www.fastmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-id: <openembedded-core.lists.openembedded.org>
To: Andrei Gherzan <andrei@gherzan.com>, openembedded <openembedded-core@lists.openembedded.org>

On Tue, 2021-12-21 at 11:56 +0000, Andrei Gherzan wrote:
> On Mon, 20 Dec 2021, at 01:39, Bernhard Rosenkränzer via
> lists.openembedded.org wrote:
> > On Thu, Dec 9, 2021 at 07:40 PM, Andrei Gherzan wrote:
> >  
> > > On Thu, 9 Dec 2021, at 16:40, Khem Raj wrote:
> > >  
> > > > On Thu, Dec 9, 2021 at 7:40 AM Andrei Gherzan <andrei@gherzan.com>
> > > > wrote:
> > > >  
> > > > > From: Andrei Gherzan <andrei.gherzan@huawei.com>
> > > > > 
> > > > > On x86-64, tm.h (needed to build gcc plugins) tries to include
> > > > > config/i386/linux64.h, which isn't installed. Fortunately it also
> > > > > isn't
> > > > > used, so simply removing the include statement is an ok fix.
> > > > is it due to multilib support ? if so we might be ok since we may not
> > > > be using it
> > > > but really it will be good to check it with multilib builds of
> > > > x86_64/x86
> > > I don't think it is related to multilib but I'll give multilib a try. In
> > > my case, the issue was revealed when compiling a kernel plugin config. I
> > > can't remember right now which one but I can replicate it for logs.
> > Hi,
> > I've had a closer look at the problem, and can confirm the patch doesn't
> > break even in multilib setups.
> > 
> > The problem is that in a non-multilib setup, the config/i386/linux64.h
> > header is not generated, but tm.h tries to include it nevertheless, causing
> > any gcc plugin that #includes tm.h (such as all the gcc plugins in the
> > kernel -- tm.h is included by scripts/gcc-plugins/gcc-common.h) to fail to
> > build.
> > An alternative fix would be adding
> > mkdir -p ${D}${libdir}/gcc/${TARGET_SYS}/${BINV}/plugin/include/config/i386
> > touch ${D}${libdir}/gcc/${TARGET_SYS}/${BINV}/plugin/include/config/i386/lin
> > ux64.h
> > (creating the file if it isn't there) instead. This would make sure that in
> > cases where config/i386/linux64.h does exist, it doesn't get removed from
> > tm.h (potentially fixing plugins that reference any of the #defines in
> > i386/linux64.h without including the file manually -- but I have yet to see
> > any such plugin).
> > 
> > I will try to get a better fix (not adding the include statement to tm.h in
> > the first place rather than having to remove it later in install scripts)
> > upstream, but in the mean time, the patch fixes our builds before the better
> > fix is ready/applied.
> 
> Ping on this patch. Any chance we can pull it in as a first iteration of the
> solution?

I don't like sed in this context as if the code changes, it silently stops
working and we struggle to know what broke or whether we need to fix it. We
don't have any test case.

Given all that, the touch of the file is a neater solution as it is more obvious
what it is doing. I'd also want to see some more detailed comments in the code
about what it is doing and why.

Maintainability of these kinds of fixes is key.

Cheers,

Richard

