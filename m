Return-Path: <denis@denix.org>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.17])
	by mail.openembedded.org (Postfix) with ESMTP id ACE2277E7F
	for <openembedded-core@lists.openembedded.org>;
	Thu, 18 May 2017 01:08:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id B70DC208C5;
	Thu, 18 May 2017 01:08:14 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo03-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id vzT5-zVUh7Ea; Thu, 18 May 2017 01:08:14 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-85-143.washdc.fios.verizon.net
	[100.15.85.143])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 81A6020756;
	Thu, 18 May 2017 01:08:11 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 195361624C6; Wed, 17 May 2017 21:08:11 -0400 (EDT)
Date: Wed, 17 May 2017 21:08:11 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: Max Krummenacher <max.oss.09@gmail.com>
Message-ID: <20170518010811.GS28053@denix.org>
References: <CAJ+vNU02n6DavkhuwM8gU7daWLyyd4QHgd0N5topHJQiO2_6RA@mail.gmail.com>
	<1495052131.7502.1.camel@gmail.com>
	<CAJ+vNU1kh56xNCvy77zMM2Pc5hnaM+jFBhzdvip5h2dQ_+YMNA@mail.gmail.com>
	<1495060628.9242.2.camel@gmail.com>
MIME-Version: 1.0
In-Reply-To: <1495060628.9242.2.camel@gmail.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: poky@yoctoproject.org, openembedded-core@lists.openembedded.org
Subject: Re: populate sdk broken for u-boot-mkimage
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
X-List-Received-Date: Thu, 18 May 2017 01:08:14 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, May 18, 2017 at 12:37:08AM +0200, Max Krummenacher wrote:
> Am Mittwoch, den 17.05.2017, 14:29 -0700 schrieb Tim Harvey:
> > On Wed, May 17, 2017 at 1:15 PM, Max Krummenacher <max.oss.09@gmail.com> wrote:
> > > Hi Tim
> > > 
> > > Just sent a patch which may fix what you see.
> > > 
> > > Regards
> > > Max
> > > 
> > > Am Mittwoch, den 17.05.2017, 12:36 -0700 schrieb Tim Harvey:
> > > > Greetings,
> > > > 
> > > > I'm running into the following build error when trying to create an
> > > > SDK for an image that includes u-boot-mkimage-native.
> > > > 
> > > > The nativesdk-u-boot-mkimage do_package task fails with:
> > > > ERROR: nativesdk-u-boot-mkimage: chrpath command failed with exit code 7:
> > > > b'/usr/src/ventana/yocto/pyro-2.3/build/tmp/work/x86_64-nativesdk-fslcsdk-linux/nativesdk-u
> > > > -boot
> > > > -mkimage/1_2017.01-r0/package/opt/fslc-x11/2.3/sysroots/x86_64-fslcsdk-linux/usr/bin/uboot
> > > > -mkimage:
> > > > RPATH=/usr/src/ventana/yocto/pyro-2.3/build/tmp/work/x86_64-nativesdk-fslcsdk-linux/nativesdk
> > > > -u
> > > > -boot-mkimage/1_2017.01-r0/recipe-sysroot-native/usr/lib:/usr/src/ventana/yocto/pyro
> > > > -2.3/build/tmp/work/x86_64-nativesdk-fslcsdk-linux/nativesdk-u-boot-mkimage/1_2017.01
> > > > -r0/recipe
> > > > -sysroot-native/lib\n'b"new
> > > > rpath '$ORIGIN/../../../../../../../usr/src/ventana/yocto/pyro-2.3/build/tmp/work/x86_64
> > > > -nativesdk
> > > > -fslcsdk-linux/nativesdk-u-boot-mkimage/1_2017.01-r0/recipe-sysroot
> > > > -native/usr/lib:$ORIGIN/../../../../../../../usr/src/ventana/yocto/pyro
> > > > -2.3/build/tmp/work/x86_64
> > > > -nativesdk-fslcsdk-linux/nativesdk-u-boot-mkimage/1_2017.01-r0/recipe-sysroot-native/lib'
> > > > too large; maximum length 287\n"
> > > > DEBUG: Python function perform_packagecopy finished
> > > > DEBUG: Python function do_package finished
> > > > ERROR: Function failed: perform_packagecopy
> > > > 
> > > > I'm guessing this has something to do with the long list of args in
> > > > EXTRA_OEMAKE_class-nativesdk from
> > > > http://git.yoctoproject.org/cgit.cgi/poky/tree/meta/recipes-bsp/u-boot/u-boot-mkimage_2017.01.
> > > > bb
> > > > 
> > > > Any ideas?
> > > > 
> > > > Regards,
> > > > 
> > > > Tim
> > 
> > Max,
> > 
> > indeed your patch '[OE-core] [PATCH] u-boot-mkimage: fix nativesdk
> > build' resolves my problem.
> > 
> > This should be backported to at least the pyro branch as well I would assume?
> 
> Yes, I expect that pyro has the same issue, morty likely does not though.

I can confirm this does not affect morty.

-- 
Denys

