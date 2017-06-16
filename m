Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 06C5A78243
	for <openembedded-core@lists.openembedded.org>;
	Fri, 16 Jun 2017 22:11:05 +0000 (UTC)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.15.2/8.15.2/Debian-3) with ESMTPSA id
	v5GMB5qU031028
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128
	verify=NOT); Fri, 16 Jun 2017 23:11:06 +0100
Message-ID: <1497651065.24449.25.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Alejandro del Castillo <alejandro.delcastillo@ni.com>,
	openembedded-core@lists.openembedded.org
Date: Fri, 16 Jun 2017 23:11:05 +0100
In-Reply-To: <3a189ae0-064c-299c-84ad-55f9c1ce1331@ni.com>
References: <1497602780-1744-1-git-send-email-richard.purdie@linuxfoundation.org>
	<3a189ae0-064c-299c-84ad-55f9c1ce1331@ni.com>
X-Mailer: Evolution 3.18.5.2-0ubuntu3.2 
Mime-Version: 1.0
X-Greylist: Sender succeeded SMTP AUTH, not delayed by milter-greylist-4.5.11
	(dan.rpsys.net [192.168.3.1]);
	Fri, 16 Jun 2017 23:11:06 +0100 (BST)
X-Virus-Scanned: clamav-milter 0.99.2 at dan
X-Virus-Status: Clean
Subject: Re: [PATCH] package_ipk: Clean up Source entry in ipk packages
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
X-List-Received-Date: Fri, 16 Jun 2017 22:11:11 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2017-06-16 at 13:43 -0500, Alejandro del Castillo wrote:
> 
> On 06/16/2017 03:46 AM, Richard Purdie wrote:
> > 
> > There is the potential for sensitive information to leak through
> > the urls
> > there and removing it brings this into the behavior of the other
> > package
> > backends since filtering it is likely error prone.
> > 
> > Since ipks don't appear to be generated at all if we don't set
> > this, set
> > the field to the recipe name used (basename only, no paths). This
> > avoids
> > information leaking. We may want to drop the field if opkg can
> > allow that
> > at a future point but the recipe name is a suitable identifier for
> > now.
> Looking at opkg-build, opkg requires:
> 
> 	Package, Version, Architecture, Maintainer, Section, Priority,
> Source
> 
> while deb requires:
> 
> 	Package, Version, Maintainer, Description
> 
> It does makes sense to require Architecture, but doesn't make sense
> to me to make Section, Priority and Source mandatory. Opkg does
> process packages that lack those fields.
> 
> This should be a trivial change to opkg-build, which I can submit
> into opkg-utils. Including that patch in the opkg-utils recipe may
> simplify things here.

I agree, I think that may be a worthwhile change. I was a little
surprised it didn't do that already and appears to silently fail if
Source: isn't set (or we fail to check the exit code).

I also have found out some people are using this Source: data to find
recipe information so we likely do need some way to map it back to the
recipe, I'm hoping the filename is good enough for that purpose...

Cheers,

Richard

