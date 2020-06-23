Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web12.13988.1592938225219029118
 for <openembedded-core@lists.openembedded.org>;
 Tue, 23 Jun 2020 11:50:25 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 6358D40BB1;
	Tue, 23 Jun 2020 18:50:24 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id n3wc-IfhbAZx; Tue, 23 Jun 2020 18:50:24 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net [100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 2B21940B92;
	Tue, 23 Jun 2020 18:50:20 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 4DC7B17320F; Tue, 23 Jun 2020 14:50:20 -0400 (EDT)
Date: Tue, 23 Jun 2020 14:50:20 -0400
From: "Denys Dmytriyenko" <denis@denix.org>
To: Fredrik Gustafsson <fredrik.gustafsson@axis.com>
Cc: openembedded-core@lists.openembedded.org,
	tools-cfpbuild-internal@axis.com, hugo.cedervall@axis.com
Subject: Re: [OE-core] Add package managers as a plugin
Message-ID: <20200623185020.GL17660@denix.org>
References: <20200623111328.5838-1-fredrigu@axis.com>
MIME-Version: 1.0
In-Reply-To: <20200623111328.5838-1-fredrigu@axis.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

You mentioned Poky few times below - why is it Poky-specific? Since you are 
not submitting this change to Poky, but to OE-Core instead, can this be used 
by other OE distros?

-- 
Denys


On Tue, Jun 23, 2020 at 01:13:26PM +0200, Fredrik Gustafsson wrote:
> Poky today has three different package managers, the well-known formats deb
> and rpm is supported as well as ipkg that is good for embedded devices.
> 
> When building and having a good cache hit, a significant amount of time is
> spent in the phase of generating a rootfs, which is really about the
> performance of the package manager. ipkg is way slower than deb or rpm. To
> save build time and also get a package manager that is suitanle for use on
> targets where flash memory is a concern, support for apk is suggested.
> 
> However, it might or might not be what's wanted for Poky since it increases
> the test matrix. Therefore this patch series refactors the package
> management code so that it's possible to add more package managers in other
> own layer. I will send another patch serie that will add apk.
> 
> Perfomance metrics below, (note that this includes build times).
> 
> APK
> ===
> bitbake core-image-minimal
> 15.84s user 2.60s system 0% cpu 1:26:19.21 total
> 16.01s user 2.58s system 0% cpu 1:26:03.72 total
> 15.69s user 2.61s system 0% cpu 1:26:45.45 total
> 
> bitbake core-image-minimal -c cleansstate
> bitbake core-image-minimal -c clean
> bitbake core-image-minimal -f -c do_rootfs
> 0.55s user 0.06s system 4% cpu 14.236 total
> 0.54s user 0.08s system 4% cpu 15.247 total
> 0.52s user 0.15s system 4% cpu 15.143 total
> 
> RPM
> ===
> bitbake core-image-minimal
> 18.57s user 3.09s system 0% cpu 1:31:29.09 total
> 18.58s user 3.08s system 0% cpu 1:30:53.80 total
> 18.20s user 3.31s system 0% cpu 1:31:06.69 total
> 
> bitbake core-image-minimal -c cleansstate
> bitbake core-image-minimal -c clean
> bitbake core-image-minimal -c do_rootfs -f
> 0.58s user 0.10s system 3% cpu 19.470 total
> 0.57s user 0.09s system 3% cpu 19.480 total
> 0.60s user 0.07s system 3% cpu 20.381 total

> 

