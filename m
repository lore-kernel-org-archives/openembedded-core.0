Received: from relay10.mail.gandi.net (relay10.mail.gandi.net [217.70.178.230])
 by mx.groups.io with SMTP id smtpd.web08.1240.1627940858927128787
 for <openembedded-core@lists.openembedded.org>;
 Mon, 02 Aug 2021 14:47:39 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: bootlin.com, ip: 217.70.178.230, mailfrom: alexandre.belloni@bootlin.com)
Received: (Authenticated sender: alexandre.belloni@bootlin.com)
	by relay10.mail.gandi.net (Postfix) with ESMTPSA id AC20F240004;
	Mon,  2 Aug 2021 21:47:36 +0000 (UTC)
Date: Mon, 2 Aug 2021 23:47:35 +0200
From: "Alexandre Belloni" <alexandre.belloni@bootlin.com>
To: Douglas Royds <douglas.royds@taitradio.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [PATCH v2] license_image: Use sstate to populate license directory
Message-ID: <YQhn9yAm61SRLxOX@piout.net>
References: <20210701214437.732187-1-douglas.royds@taitradio.com>
 <YN8IBAtecvRvHaNi@piout.net>
 <3de8742f-498c-7835-ebd7-0ed9fd388bf2@taitradio.com>
MIME-Version: 1.0
In-Reply-To: <3de8742f-498c-7835-ebd7-0ed9fd388bf2@taitradio.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

On 28/07/2021 09:02:27+1200, Douglas Royds wrote:
> On 3/07/21 12:35 am, Alexandre Belloni wrote:
> > On 02/07/2021 09:44:37+1200, Douglas via lists.openembedded.org wrote:
> > > We were getting an endlessly-growing list of directories in
> > > build/tmp/deploy/licenses/ of the form myimage-mymachine-20210629010203.
> > > Use the normal sstate behaviour to clean them. Brings license_image in
> > > line with the do_populate_lic behaviour in license.bbclass.
> > > 
> > > We must only clean the (new) WORKDIR/license-destdir at do_rootfs time,
> > > as the write_package_manifest and license_create_manifest rootfs
> > > postprocess commands write the package.manifest and license.manifest
> > > files at that time. They get stored in the sstate cache at
> > > do_populate_lic_deploy time, alongside the image_license.manifest.
> > > 
> > > Looks like this:
> > > 
> > >      license-destdir/
> > >      ├── myimage-mymachine -> myimage-mymachine-20210629025723/
> > >      └── myimage-mymachine-20210629025723/
> > >          ├── image_license.manifest
> > >          ├── license.manifest
> > >          └── package.manifest
> > > 
> > This ran on the autobuilders and I do believe it is the cause of the
> > following failures:
> > 
> > https://autobuilder.yoctoproject.org/typhoon/#builders/79/builds/2269/steps/14/logs/stdio
> > https://autobuilder.yoctoproject.org/typhoon/#builders/86/builds/2247/steps/14/logs/stdio
> > https://autobuilder.yoctoproject.org/typhoon/#builders/87/builds/2282/steps/14/logs/stdio
> > 
> > Those seem to be pseudo aborts because the link is changing.
> 
> 
> Why would pseudo abort when the link changes? Replacing a symlink seems
> harmless enough ...
> 

You'll get more info here:
https://wiki.yoctoproject.org/wiki/Pseudo_Abort

The issue is probably that he link is modified outside of pseudo's
context.


-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
