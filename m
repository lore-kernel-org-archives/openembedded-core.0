Return-Path: <joshua.g.lock@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 5F7D27017B
	for <openembedded-core@lists.openembedded.org>;
	Mon, 22 Aug 2016 10:42:49 +0000 (UTC)
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
	by fmsmga101.fm.intel.com with ESMTP; 22 Aug 2016 03:42:50 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.28,559,1464678000"; d="scan'208";a="159281933"
Received: from jlock-mobl1.ger.corp.intel.com ([10.252.24.69])
	by fmsmga004.fm.intel.com with ESMTP; 22 Aug 2016 03:42:48 -0700
Message-ID: <1471862567.5256.18.camel@linux.intel.com>
From: Joshua Lock <joshua.g.lock@linux.intel.com>
To: =?ISO-8859-1?Q?Andr=E9?= Draszik <git@andred.net>, 
	openembedded-core@lists.openembedded.org
Date: Mon, 22 Aug 2016 11:42:47 +0100
In-Reply-To: <1471852964.3713.7.camel@andred.net>
References: <cover.1471620482.git.joshua.g.lock@intel.com>
	<cover.1471620482.git.joshua.g.lock@intel.com>
	<d7af57b9c8284eaa96fa6c0a560c0047b03fb911.1471620482.git.joshua.g.lock@intel.com>
	<9D776326-1F02-4F8E-B61C-DF3971141312@gmail.com>
	<1471632399.5679.22.camel@linux.intel.com>
	<1471852964.3713.7.camel@andred.net>
X-Mailer: Evolution 3.20.5 (3.20.5-1.fc24) 
Mime-Version: 1.0
Subject: Re: [PATCH 2/5] security_flags: pass ssp-buffer-size param to stack protector
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
X-List-Received-Date: Mon, 22 Aug 2016 10:42:50 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Mon, 2016-08-22 at 09:02 +0100, André Draszik wrote:
> On Fr, 2016-08-19 at 19:46 +0100, Joshua G Lock wrote:
> > 
> > On Fri, 2016-08-19 at 10:07 -0700, Khem Raj wrote:
> > > 
> > > 
> > > > 
> > > > 
> > > > 
> > > > On Aug 19, 2016, at 8:34 AM, Joshua Lock <joshua.g.lock@intel.c
> > > > om>
> > > > wrote:
> > > > 
> > > > This tells the compiler to use a canary to protect any function
> > > > which
> > > > declares a character array of 4 or more bytes on its stack,
> > > > rather
> > > > than the default of 8 or more bytes.
> > > 
> > > Thats fine, however, it slows down the code, strong option was a
> > > compromise
> > > otherwise we could just use fstack-protector-all
> > 
> > It's my understanding that the ssp-buffer-size parameter changes
> > the
> > size of buffer the base, fstack-protector, protections affect and
> > that
> > the performance impact is less significant than adding protections
> > to
> > all functions via stack-protector-all?
> 
> I understand it as follows instead:
> 
> --param=ssp-buffer-size=X only makes sense together with -fstack-
> protector, as -fstack-protector can to be configured for the minimum
> size of arrays to protect (8 by default, if --param=ssp-buffer-size=
> is not given).
> 
> --param=ssp-buffer-size=X does not make sense with -fstack-protector-
> strong as this version protects arrays of *any* size anyway.
> 
> https://gcc.gnu.org/ml/gcc-patches/2012-06/msg00974.html
>   -> This also has the design doc towards the end.
> https://lwn.net/Articles/584225/
> 
> So I don't think this patch is needed at all...

Thanks for the link, having read the patch and design doc I'm inclined
to agree.

> > 
> > FWIW, the related options in Fedora and Ubuntu:
> > 
> > * Ubuntu: -fstack-protector --param=ssp-buffer-size=4 (default in
> > hardened builds)
> > * Fedora: -fstack-protector-strong --param=ssp-buffer-size=4
> > (default
> > in all builds)
> 
> Debian (sid) uses -fstack-protector-strong (without ssp-buffer-size).
> 

Thanks, I couldn't find a Debian system on Friday evening.

Regards,

Joshua

