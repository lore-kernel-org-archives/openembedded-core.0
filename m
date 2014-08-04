Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id B791C65CB2
	for <openembedded-core@lists.openembedded.org>;
	Mon,  4 Aug 2014 13:51:11 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 04 Aug 2014 06:51:12 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.01,798,1400050800"; d="scan'208";a="579749479"
Received: from unknown (HELO peggleto-mobl5.ger.corp.intel.com)
	([10.252.122.206])
	by fmsmga002.fm.intel.com with ESMTP; 04 Aug 2014 06:51:10 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: "Robert P. J. Day" <rpjday@crashcourse.ca>
Date: Mon, 04 Aug 2014 14:51:10 +0100
Message-ID: <6176158.8TjiodiSmq@peggleto-mobl5.ger.corp.intel.com>
Organization: Intel Corporation
User-Agent: KMail/4.13.3 (Linux/3.15.7-200.fc20.x86_64; KDE/4.13.3; x86_64; ; )
In-Reply-To: <alpine.LFD.2.11.1408040933500.8919@localhost>
References: <alpine.LFD.2.11.1408021229180.24061@localhost>
	<14511164.eDDSBeL19z@peggleto-mobl5.ger.corp.intel.com>
	<alpine.LFD.2.11.1408040933500.8919@localhost>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: can pkg_{pre, post}rm functions be run at all for image creation?
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
X-List-Received-Date: Mon, 04 Aug 2014 13:51:17 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Monday 04 August 2014 09:42:35 Robert P. J. Day wrote:
> On Mon, 4 Aug 2014, Paul Eggleton wrote:
> > On Sunday 03 August 2014 02:56:04 Robert P. J. Day wrote:
> > > On Sat, 2 Aug 2014, Khem Raj wrote:
> > > > On 14-08-02 15:57:00, Robert P. J. Day wrote:
> > > > > On Sat, 2 Aug 2014, Khem Raj wrote:
> > > > > > On Sat, Aug 2, 2014 at 9:34 AM, Robert P. J. Day
> > 
> > <rpjday@crashcourse.ca> wrote:
> > > > > > > say, pkg_prerm() functions would never be written with respect
> > > > > > > to
> > > > > > > the
> > > > > > > variable ${D}, which would be relevant only during image
> > > > > > > creation.
> > > > > > > but
> > > > > > > i can see things like this in sysklogd.inc:
> > > > > > > 
> > > > > > > pkg_prerm_${PN} () {
> > > > > > > 
> > > > > > >         if test "x$D" = "x"; then
> > > > > > 
> > > > > > note that its not ${D} (bitbake context) but $D which is evaluated
> > > > > > in the context when the script is run.
> > > > > > 
> > > > >   i still don't understand ... what are the possible values of $D
> > > > > 
> > > > > here, and what would they represent?
> > > > 
> > > > At build time it will not be expanded by bitbake like ${D} is. but
> > > > during image creation it will be. But when doing on-device install
> > > > of this package $D will be empty. Its a way to differentiate actions
> > > > during image creation and on-device install/update/remove
> > > > 
> > >   but the yocto dev manual states pretty clearly that pkg_prerm and
> > > 
> > > pkg_postrm functions are *not* used during image creation. so you're
> > > saying they are? under what circumstances?
> > 
> > They wouldn't normally be. You could in theory issue some package
> > removal commands as part of postprocessing on the image but I can't
> > see much use for that given we have things like PACKAGE_EXCLUDE now.
> 
>   oooooh ... that's still kind of weaselly terminology. :-) i'm not
> *trying* to be annoyingly pedantic, but this is just the kind of thing
> that students tend to ask about, which is why i want to nail the
> details.

Is this pointless right now? Yes. Does it hurt? No.

>   the current docs state that pkg_*rm routines are *not* run during
> image creation, and i'm going to accept that. that means that if a
> pkg_*rm routine *is* written with reference to ${D}, as long as that's
> run on the target, it won't make a difference. so the references to
> ${D} in that context don't *hurt*, they're just unnecessary. and
> potentially confusing, which is why i'm trying to clarify this. (every
> pkg_*rm routine i've seen, *if* it tests the value of ${D}, bailed if
> it was set, which makes sense if they should never, ever be invoked at
> image creation time.)

Yes, but when we are talking about preinst/postinst/prerm/postrm, as mentioned 
before it is $D *not* ${D}. If you use ${D} instead there, you will have 
problems.

>   WRT stuff run at rootfs postprocessing time, sure, you could always
> run a package removal command, but clarify this for me -- once you're
> into rootfs postprocessing, you're running in a "pseudo" environment
> such that you are *effectively* running inside that rootfs, no? so in
> that case, all filename references would be full names WRT to the root
> filesystem -- no references to ${D}. is that correct? or am i just
> confused?

You are a bit confused yes. do_rootfs may be running under pseudo, but it is 
not chrooted such that / is the root of the image being constructed; hence why 
you need to use $D in order to be looking in the right place in both contexts 
(during constructing the rootfs on the build machine where $D is set, and on 
the target where $D is not set).

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre

