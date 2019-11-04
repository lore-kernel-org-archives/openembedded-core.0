Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id 06F047F8CB
	for <openembedded-core@lists.openembedded.org>;
	Mon,  4 Nov 2019 15:40:51 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 476H7k39QYz72;
	Mon,  4 Nov 2019 16:40:49 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1572882051;
	bh=UdKZ7GimP2UL8d7S9sEGintAXqg2t4Tj50YjomBPwoU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=jWGGnhM+ltJCPggj4fSI1XtGSe873fvAIBF4/A7poZfFbKk/QHg/qb+wjXyrfNQEa
	ySV7wveVZBOAp4oPAeqOnC6xlIy1qqpz9DySu9Qs9Ao6kcOqVznmuDBM9WwXXX+2q8
	XeFlSBo/9p0ldKCNRLa4Ncft79GnbTO1u5ZHS6fqwOM+PCL0ueuQBeOaLNyx5iE88s
	yq0vR6bC2X8gMy+IwLTEgDynJHBef83VillS0BnykxHHWIpULGLemcvGBH1YTi2LW7
	PDa9CjrU2Nwhub46SvjMDb0GA/H0n69fRcOgVvhQKJLk6CYy7jPW0KnffbyvGjOTIr
	P5CYWSGM5QS4QVTpgdFrkGkecRgNRu2EcwE4wqF05Xj0H0wrf3w5EuZ20+7QTXOdNa
	3u3vRUxXHgI22bDAXEFKQuv4kxjuSfyTf2yDtGB1oRmgdiqWm4q0JNPkYTr6QyMkVt
	URDA0qwzZdCI4jbmoa3hy98rhtvTJYd1eWeQjuumaq4XJJqW4rNBfgBQbIuluY/fL9
	erpqebuTtVWI+k78kwZ34NnxVN6+y7SYMX5CawyXEPJRZOMpvbvlqBBRqeSuWfWBT9
	vzOZ0QMZknp4krNxOGiHzdv0FOysicKxmBuWEwqUT7B6B2eemF2cAEXarUgzA1eFZN
	0kpyHujrZGedqT5AttQN6V9Q=
Date: Mon, 4 Nov 2019 17:40:47 +0200
From: Adrian Bunk <bunk@stusta.de>
To: Ross Burton <ross.burton@intel.com>
Message-ID: <20191104154047.GB5390@localhost>
References: <20191104124251.21923-1-ross.burton@intel.com>
	<20191104140115.GA5390@localhost>
	<e1411b32-8500-2971-ff45-ec717c14d3be@intel.com>
MIME-Version: 1.0
In-Reply-To: <e1411b32-8500-2971-ff45-ec717c14d3be@intel.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] libpng: whitelist CVE-2019-17371
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
X-List-Received-Date: Mon, 04 Nov 2019 15:40:52 -0000
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

On Mon, Nov 04, 2019 at 02:24:08PM +0000, Ross Burton wrote:
> On 04/11/2019 14:01, Adrian Bunk wrote:
> > On Mon, Nov 04, 2019 at 12:42:51PM +0000, Ross Burton wrote:
> > > This is actually a memory leak in gif2png 2.x, so whitelist it in the libpng
> > > recipe.
> > > 
> > > Signed-off-by: Ross Burton <ross.burton@intel.com>
> > > ---
> > >   meta/recipes-multimedia/libpng/libpng_1.6.37.bb | 3 +++
> > >   1 file changed, 3 insertions(+)
> > > 
> > > diff --git a/meta/recipes-multimedia/libpng/libpng_1.6.37.bb b/meta/recipes-multimedia/libpng/libpng_1.6.37.bb
> > > index 66af2f3d60e..07970e14360 100644
> > > --- a/meta/recipes-multimedia/libpng/libpng_1.6.37.bb
> > > +++ b/meta/recipes-multimedia/libpng/libpng_1.6.37.bb
> > > @@ -29,3 +29,6 @@ PACKAGES =+ "${PN}-tools"
> > >   FILES_${PN}-tools = "${bindir}/png-fix-itxt ${bindir}/pngfix ${bindir}/pngcp"
> > >   BBCLASSEXTEND = "native nativesdk"
> > > +
> > > +# CVE-2019-17371 is actually a memory leak in gif2png 2.x
> > > +CVE_CHECK_WHITELIST = "CVE-2019-17371"
> > 
> > These should use += to not overwrite whitelists defined by
> > the distribution or the user.
> 
> IMHO, the distribution or user should be using _append.   The whitelist
> should be explicitly per-recipe: there's a CVE which is tagged incorrectly
> as being in openssl *and* mod_ssl, we don't want to whitelist it globally
> but only in openssl.
>...

What I had in mind are a distribution-wide cve-whitelist.inc included 
from the distro conf or using CVE_CHECK_WHITELIST in conf/local.conf,
you don't want to start creating dozens of bbappend files in such 
usecases.

This CVE where a change in OpenSSL created a vulnerability in Apache
would go to the global whitelist for me when I am not using Apache.
In OE it should not be whitelisted in both OpenSSL and Apache, but
this is a different situation.

> Ross

cu
Adrian

-- 

       "Is there not promise of rain?" Ling Tan asked suddenly out
        of the darkness. There had been need of rain for many days.
       "Only a promise," Lao Er said.
                                       Pearl S. Buck - Dragon Seed


