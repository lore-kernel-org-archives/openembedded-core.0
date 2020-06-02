Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web10.4844.1591128415646922044
 for <openembedded-core@lists.openembedded.org>;
 Tue, 02 Jun 2020 13:06:56 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id ECC1F40C2F;
	Tue,  2 Jun 2020 20:06:54 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id A_fFT42J1Bhg; Tue,  2 Jun 2020 20:06:54 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net [100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id C126E40A2D;
	Tue,  2 Jun 2020 20:06:51 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 1A9DC173205; Tue,  2 Jun 2020 16:06:51 -0400 (EDT)
Date: Tue, 2 Jun 2020 16:06:51 -0400
From: "Denys Dmytriyenko" <denis@denix.org>
To: Gregor Zatko <gzatko@gmail.com>
Cc: Andreas Oberritter <obi@opendreambox.org>,
	openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [PATCH] update-alternatives: introduce new package as a opkg-utils spin-off
Message-ID: <20200602200651.GW17660@denix.org>
References: <20200602190925.384853-1-gzatko@gmail.com>
 <20200602214305.6a3500f2@opendreambox.org>
 <bded0f0277713e63b4df6f8657acee567229e0eb.camel@gmail.com>
MIME-Version: 1.0
In-Reply-To: <bded0f0277713e63b4df6f8657acee567229e0eb.camel@gmail.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Jun 02, 2020 at 09:45:28PM +0200, Gregor Zatko wrote:
> On Tue, 2020-06-02 at 21:43 +0200, Andreas Oberritter wrote:
> > Hello Gregor,
> > On Tue,  2 Jun 2020 21:09:25 +0200"Gregor Zatko" <gzatko@gmail.com>
> > wrote:
> > > In some cases there is a need for update-alternatives script which
> > > gets builtwithin opkg-utils recipe into a standalone package.
> > > However, this causes tomany unnecessary dependencies, including
> > > Python, bc, OpenSSL etc. to be built.
> > > In this commit a standalone lightweight recipe for update-
> > > alternatives thatshouldn't be dependent on nothing other than bash.
> > > https://bugzilla.yoctoproject.org/show_bug.cgi?id=8879
> > > 
> > > Signed-off-by: Gregor Zatko <gzatko@gmail.com>---
> > > .../conf/distro/include/default-providers.inc |  6 +--
> > > meta/conf/layer.conf                          |  3 +-
> > > .../packagegroups/packagegroup-self-hosted.bb |  1 + .../opkg-
> > > utils/opkg-utils_0.4.2.bb            | 25 +--------- .../update-
> > > alternatives_0.4.2.bb              | 49 +++++++++++++++++++
> > 
> > why did you change the name from update-alternatives-opkg to update-
> > alternatives? I would prefer to keep the suffix in order to be able
> > to distinguish it more easily from other implementations, e.g.
> > dpkg's.
> > Best regards,Andreas
> 
> I have no problem to revert the name back to original. However, I'm not
> sure whether this patch will be accepted because it seems to solve only
> a minimal part of the problem or nothing at all :-)

And what exactly are you trying to solve then?

It seems you are more concerned with build-time dependencies than you are with 
run-time ones. Building opkg-utils is a drop in the bucket (it is quite small) 
and can usually be ignored, as long as it's not installed when you don't need 
it. The resulting update-alternatives-opkg package is a tiny one with no extra 
RDEPENDS and that's what matters.

If your concern is that it builds opkg-utils and its dependencies even though 
you may be using rpm, then it is also true in the other direction - rpm gets 
built when IPK/opkg is the default package manager...

-- 
Denys
