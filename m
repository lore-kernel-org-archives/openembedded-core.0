Return-Path: <pb@pbcl.net>
Received: from hetzner.pbcl.net (mail.pbcl.net [88.198.119.4])
	by mail.openembedded.org (Postfix) with ESMTP id 4408A7720B
	for <openembedded-core@lists.openembedded.org>;
	Wed,  3 Feb 2016 21:24:59 +0000 (UTC)
Received: from blundell.swaffham-prior.co.uk ([91.216.112.25] helo=e130.local)
	by hetzner.pbcl.net with esmtpsa (TLS1.2:RSA_AES_128_CBC_SHA1:128)
	(Exim 4.80) (envelope-from <pb@pbcl.net>)
	id 1aR4v5-0004EZ-D7; Wed, 03 Feb 2016 22:24:59 +0100
Message-ID: <1454534691.7421.71.camel@pbcl.net>
From: Phil Blundell <pb@pbcl.net>
To: Khem Raj <raj.khem@gmail.com>
Date: Wed, 03 Feb 2016 21:24:51 +0000
In-Reply-To: <CAMKF1so4wbS=T6rF-uS5SmgSAA9_QmxtVLm97-mvTKb938p+Dg@mail.gmail.com>
References: <79e1257a6eb8ed2fa57f92fb34adc8b14ed880fe.1454303080.git.raj.khem@gmail.com>
	<e45e550e5d1bdcd4011e9d92c77201596d52ea2b.1454303080.git.raj.khem@gmail.com>
	<1454532171.7421.52.camel@pbcl.net>
	<CAMKF1so4wbS=T6rF-uS5SmgSAA9_QmxtVLm97-mvTKb938p+Dg@mail.gmail.com>
X-Mailer: Evolution 3.12.9-1+b1 
Mime-Version: 1.0
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 8/8] boost: Fix build on soft-float ABI arm systems
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
X-List-Received-Date: Wed, 03 Feb 2016 21:25:01 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2016-02-03 at 12:58 -0800, Khem Raj wrote:
> On Wed, Feb 3, 2016 at 12:42 PM, Phil Blundell <pb@pbcl.net> wrote:
>   I think it might be true
> > that some libraries don't implement fesetenv() when using softfp (i.e.
> > no VFP instructions at all) but that is not necessarily the same thing
> > as the soft float ABI.
> 
> does glibc implement it correctly using soft-fp ? my tests failed for
> glibc thats why
> I used the VFP detection logic

It depends what you mean by "correctly".  If you don't have a VFP unit
then fesetenv() will fail (return nonzero) but the symbols will be
available and there should be no error at build time.  If you do have a
VFP unit and are using it then, irrespective of your ABI, fesetenv()
should succeed and subsequent operations ought to behave correctly.

I think there is a possible hole in the case where you do have a VFP
unit available but have compiled your code -msoft-float, have not
installed a VFP optimized library, and hence are not actually using the
VFP.  In this situation, yes, I think it's quite conceivable that glibc
might be doing the wrong thing.  Fortunately I think this scenario is
rare enough that we probably don't need to worry about it too much.

p.



