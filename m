Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (dan.rpsys.net [93.97.175.187])
	by mail.openembedded.org (Postfix) with ESMTP id 3D03B6B39C
	for <openembedded-core@lists.openembedded.org>;
	Fri, 22 Nov 2013 12:06:47 +0000 (UTC)
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	rAMC6efk015384; Fri, 22 Nov 2013 12:06:40 GMT
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id Gl58NN16HCoF; Fri, 22 Nov 2013 12:06:40 +0000 (GMT)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	rAMC6XMF015380
	(version=TLSv1/SSLv3 cipher=DHE-RSA-CAMELLIA256-SHA bits=256
	verify=NOT); Fri, 22 Nov 2013 12:06:34 GMT
Message-ID: <1385121989.16887.157.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Phil Blundell <pb@pbcl.net>
Date: Fri, 22 Nov 2013 12:06:29 +0000
In-Reply-To: <1385120462.15760.33.camel@phil-desktop.brightsign>
References: <cover.1385098685.git.Qi.Chen@windriver.com>
	<8403fc751bcf1e0b62b600ed40e00256963f357d.1385098685.git.Qi.Chen@windriver.com>
	<1385120462.15760.33.camel@phil-desktop.brightsign>
X-Mailer: Evolution 3.6.4-0ubuntu1 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/1] image.bbclass: depends on virtual/kernel
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
X-List-Received-Date: Fri, 22 Nov 2013 12:06:47 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2013-11-22 at 11:41 +0000, Phil Blundell wrote:
> On Fri, 2013-11-22 at 13:39 +0800, Qi.Chen@windriver.com wrote:
> > Add 'virtual/kernel' to DEPENDS in image.bbclass so that the kernel
> > can get built by default. Otherwise, the kernel will not get built
> > unless it's required by other packages like v86d. As a result, if
> > we build 'core-image-minimal' for qemumips, the kernel is not built,
> > and we have 'bitbake linux-yocto' before we can use runqemu to start
> > the target.
> 
> Not all images do actually need a kernel, and this will cause a
> dependency loop for old-style initramfs images that are dependencies of
> virtual/kernel itself.
> 
> If you just want to ensure that the kernel is available at deployment
> time, perhaps you could make virtual/kernel be a dependency of do_deploy
> specifically (rather than do_configure as you have it here).
> Alternatively, if this is a specific problem for core-image-minimal,
> maybe the virtual/kernel dependency should just go in there.

I think it just happens that core-image-minimal doesn't install any
kernel modules so shows the symptoms.

The best thing to do here is probably have a dependency on specifically
on virtual/kernel:do_deploy since anyone building an image would usually
want to trigger that. I appreciate there are some cases where you
wouldn't but those are in a minority.

Cheers,

Richard


