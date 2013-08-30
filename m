Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (dan.rpsys.net [93.97.175.187])
	by mail.openembedded.org (Postfix) with ESMTP id 7A4C06BD6D
	for <openembedded-core@lists.openembedded.org>;
	Fri, 30 Aug 2013 15:29:37 +0000 (UTC)
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r7UFfIkh006871; Fri, 30 Aug 2013 16:42:11 +0100
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id FZ0PoO2d-PaL; Fri, 30 Aug 2013 16:42:11 +0100 (BST)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r7UFg7Kh007091
	(version=TLSv1/SSLv3 cipher=DHE-RSA-CAMELLIA256-SHA bits=256
	verify=NOT); Fri, 30 Aug 2013 16:42:09 +0100
Message-ID: <1377876563.1059.100.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Robert Yang <liezhi.yang@windriver.com>
Date: Fri, 30 Aug 2013 16:29:23 +0100
In-Reply-To: <521FF438.5040702@windriver.com>
References: <cover.1377781793.git.liezhi.yang@windriver.com>
	<454944e7bd4c831bea934852393d8e16abe1d5ff.1377781793.git.liezhi.yang@windriver.com>
	<1377795605.1059.20.camel@ted> <521FF438.5040702@windriver.com>
X-Mailer: Evolution 3.6.4-0ubuntu1 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/1] sstate.bbclass: check before open the manifest
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
X-List-Received-Date: Fri, 30 Aug 2013 15:29:37 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2013-08-30 at 09:24 +0800, Robert Yang wrote:
> 
> On 08/30/2013 01:00 AM, Richard Purdie wrote:
> > On Thu, 2013-08-29 at 09:13 -0400, Robert Yang wrote:
> >> The python stack trace would be printed if we:
> >>
> >> $ bitbake make (the make-3.82 will be built)
> >> // Edit make.inc
> >> $ bitbake make-3.81
> >
> > This is at best hiding the real problem. Why is bitbake building
> > make-3.82 when you asked for make-3.81?
> >
> > I tried this here and also see the warning:
> >
> > ERROR: Multiple .bb files are due to be built which each provide make
> > (/media/build1/poky/meta/recipes-devtools/make/make_3.81.bb /media/build1/poky/meta/recipes-devtools/make/make_3.82.bb).
> >   This usually means one provides something the other doesn't and should.
> >
> > so bitbake is basically telling you there is a problem already. So there
> > are two issues:
> >
> 
> What I thought was that let the user know the normal error, but we can do
> more to fix it as you pointed out.
> 
> > a) Why is make 3.82 being built?
> 
> Ah, yes, that's problem, I will do more investigation.
> 
> > b) If multiple identical PNs are being built we probably should hard
> > error out since its not supported in the slightest. The sstate race you
> > mention is the least of the problems :(.
> >
> 
> OK, I will try to fix such a case:
> 
> bitbake make-3.81 make-3.82

I think this should just give an error.

Cheers,

Richard


