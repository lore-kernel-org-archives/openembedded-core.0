Return-Path: <mac@mcrowe.com>
Received: from avasout06.plus.net (avasout06.plus.net [212.159.14.18])
	by mail.openembedded.org (Postfix) with ESMTP id 961AA771C6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 12 Nov 2015 12:10:50 +0000 (UTC)
Received: from deneb ([80.229.24.9]) by avasout06 with smtp
	id gcAo1r0010BmcFC01cApnR; Thu, 12 Nov 2015 12:10:49 +0000
X-CM-Score: 0.00
X-CNFS-Analysis: v=2.1 cv=E4sw3vpl c=1 sm=1 tr=0
	a=E/9URZZQ5L3bK/voZ0g0HQ==:117 a=E/9URZZQ5L3bK/voZ0g0HQ==:17
	a=0Bzu9jTXAAAA:8
	a=-An2I_7KAAAA:8 a=kj9zAlcOel0A:10 a=qtqOOiqGOCEA:10
	a=ayZzyg9wDIXhpXhpT8EA:9 a=CjuIK1q_8ugA:10
Received: from mac by deneb with local (Exim 4.84)
	(envelope-from <mac@mcrowe.com>) id 1ZwqiG-0003xf-3Q
	for openembedded-core@lists.openembedded.org;
	Thu, 12 Nov 2015 12:10:48 +0000
Date: Thu, 12 Nov 2015 12:10:48 +0000
From: Mike Crowe <mac@mcrowe.com>
To: OE Core mailing list <openembedded-core@lists.openembedded.org>
Message-ID: <20151112121048.GA13777@mcrowe.com>
References: <1446734821-6011-1-git-send-email-mac@mcrowe.com>
	<CAJ86T=WxqbJ83S4RESL_oKX9gYNg6-aAPGUYR3btSQBhKQo-1g@mail.gmail.com>
	<20151106103004.GA7454@mcrowe.com>
MIME-Version: 1.0
In-Reply-To: <20151106103004.GA7454@mcrowe.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Subject: Re: [PATCH] bitbake.conf, module.bbclass: Support opting out of legacy EXTRA_OEMAKE
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
X-List-Received-Date: Thu, 12 Nov 2015 12:10:55 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Friday 06 November 2015 at 10:30:04 +0000, Mike Crowe wrote:
> It would be great to get to the point that EXTRA_OEMAKE is empty by default
> but I imagine that the experts are already aware of the difficulties with
> doing this which is why the current value has lasted so long.

I had a go at this. Fewer recipes than I expected seem to be affected.

With bitbake.conf containing EXTRA_OEMAKE = "", the following recipes
needed to be changed to explicitly set EXTRA_OEMAKE = "-e MAKEFLAGS=":

 meta/recipes-bsp/pciutils/pciutils_3.3.1.bb
 meta/recipes-connectivity/openssl/openssl.inc
 meta/recipes-core/busybox/busybox.inc
 meta/recipes-devtools/perl/perl_5.22.0.bb

for core-image-minimal to build successfully[1].

I tried core-image-sato but got stuck when apr-util-native wouldn't compile
for me[2], even with stock master.

So, perhaps the situation isn't quite as bad as I feared and it might be
possible to change the default value of EXTRA_OEMAKE.

Mike.

[1] I suspect that perl isn't required by core-image-minimal. That list is
    my complete set of changes from trying to get core-image-sato to build.

[2] x86_64-linux-libtool: compile: unable to infer tagged configuration

