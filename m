Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (dan.rpsys.net [93.97.175.187])
	by mail.openembedded.org (Postfix) with ESMTP id 7DC1B60CEB
	for <openembedded-core@lists.openembedded.org>;
	Tue, 28 Jan 2014 12:31:49 +0000 (UTC)
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu4) with ESMTP id
	s0SCVfZu024870; Tue, 28 Jan 2014 12:31:41 GMT
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id wl8Us2XtQRR5; Tue, 28 Jan 2014 12:31:41 +0000 (GMT)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	s0SCVaWR024866
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NOT);
	Tue, 28 Jan 2014 12:31:38 GMT
Message-ID: <1390912291.24655.1.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Khem Raj <raj.khem@gmail.com>
Date: Tue, 28 Jan 2014 12:31:31 +0000
In-Reply-To: <5712962.WyPAeLeASC@leo>
References: <1386380546-13936-1-git-send-email-raj.khem@gmail.com>
	<1760931.7HjZTF9m8R@leo>
	<CABcZANk3D=dL=73=spKrnL-YeOmcxng1EN5ucQu0LD-O48Vd5g@mail.gmail.com>
	<5712962.WyPAeLeASC@leo>
X-Mailer: Evolution 3.8.4-0ubuntu1 
Mime-Version: 1.0
Cc: Chris Larson <clarson@kergoth.com>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] boost: Convert ??= weaker assingment to weak ?= assignment
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
X-List-Received-Date: Tue, 28 Jan 2014 12:31:50 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2014-01-23 at 08:43 -0800, Khem Raj wrote:
> On Thursday, January 23, 2014 09:31:47 AM Chris Larson wrote:
> > On Wed, Jan 22, 2014 at 6:16 PM, Khem Raj <raj.khem@gmail.com> wrote:
> > > On Friday, December 06, 2013 05:42:26 PM Khem Raj wrote:
> > > > ??= does not react at all with
> > > > BOOST_LIBS += "${@base_contains('PACKAGECONFIG', 'python', 'python', '',
> > > > d)}"
> > > > 
> > > > even though we have
> > > > 
> > > > PACKAGECONFIG ??= "" it does not honor it and always add python to
> > > > BOOST_LIBS but the dependency is not added so it fails to build
> > > > complaining for missing python headers which is a understood outcome
> > > > 
> > > > When converted to ?= it works as expected and only add --with-python
> > > > in bjam when python is specified in PACKAGECONFIG otherwise not.
> > > > 
> > > > Is it a bitbake bug ? in anycase ?= should be enough of loose rope
> > > > to let user/distro configure the packageconfig policy
> > > 
> > > OK so the problem is that I have meta-ros in my layer-mix and in that
> > > layer
> > > it defines PACKAGECONFIG ?= "python" IMO it should have appended instead
> > > of
> > > redefining. Thats why I was seeing what I was seeing.
> > 
> > It's worth noting that recipes, in general, should use ?= rather than ??=,
> > but config files, in general, should use ??=. Otherwise it becomes
> > impossible for the config metadata to define an overriding default -- the
> > last ??= wins, after all, and that would always be the recipe. IMO default
> > values in the recipe are there to give sane behavior when there's no
> > configuration coming in from elsewhere, not to override configuration
> > defaults.
> 
> yes I think thats a good point. so lets consider this patch for inclusion
> now we know the reason, I can resubmit with proper subject and patch header

It might be worth trying to standardise this in OE-Core rather that pick
off the recipes one by one. Most new PACKAGECONFIGs are cut and paste
from others so the problem will spread until we fix them consistently.

Cheers,

Richard


