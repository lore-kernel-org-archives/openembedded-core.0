Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1QROWu-0002Ta-Ls for openembedded-core@lists.openembedded.org;
	Tue, 31 May 2011 14:58:40 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p4VCtVvZ013999
	for <openembedded-core@lists.openembedded.org>;
	Tue, 31 May 2011 13:55:31 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 13754-04 for <openembedded-core@lists.openembedded.org>;
	Tue, 31 May 2011 13:55:28 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p4VCtKb1013983
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 31 May 2011 13:55:24 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <4F2950C9-0608-4BA7-A4C1-392C3DFB8DD4@dominion.thruhere.net>
References: <1306844141.27470.360.camel@rex>
	<4F2950C9-0608-4BA7-A4C1-392C3DFB8DD4@dominion.thruhere.net>
Date: Tue, 31 May 2011 13:55:05 +0100
Message-ID: <1306846505.27470.370.camel@rex>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.2 
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: "all" architecture packages
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 31 May 2011 12:58:40 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2011-05-31 at 14:26 +0200, Koen Kooi wrote:
> Op 31 mei 2011, om 14:15 heeft Richard Purdie het volgende geschreven:
> 
> > Hi,
> > 
> > There have been various comments on the list and in the bugzilla about
> > issues with "all" architecture recipes.
> > 
> > To start cleaning this up I've merged:
> > 
> > http://git.openembedded.net/cgit.cgi/openembedded-core/commit/?id=26e5e5feb695864b11e47e24017e254c28f14494
> > 
> > which creates an "allarch" class and starts to convert some recipes over
> > to using it. There is further information in the commit message. Use of
> > the class ensures the packages really are suitable for all architectures
> > and that the sstate packages are reusable.
> > 
> > The list of packages which still need attention are:
> > 
> > meta/recipes-connectivity/resolvconf/resolvconf_1.48.bb                 
> > meta/recipes-devtools/update-alternatives/update-alternatives-dpkg.inc  
> > meta/recipes-gnome/gnome/gnome-common_2.28.0.bb                         
> > meta/recipes-gnome/gnome/gnome-icon-theme_2.31.0.bb                     
> > meta/recipes-gnome/hicolor-icon-theme/hicolor-icon-theme_0.12.bb        
> > meta/recipes-graphics/ttf-fonts/liberation-fonts_1.04.bb                
> > meta/recipes-graphics/ttf-fonts/liberation-fonts_1.06.bb                
> > meta/recipes-graphics/ttf-fonts/ttf-bitstream-vera_1.10.bb              
> > meta/recipes-graphics/xcursor-transparent-theme/xcursor-transparent-theme_0.1.1.bb
> > meta/recipes-graphics/xorg-font/encodings_1.0.4.bb                      
> > meta/recipes-graphics/xorg-font/font-alias_1.0.3.bb                     
> > meta/recipes-graphics/xorg-font/font-util_1.2.0.bb                      
> > meta/recipes-graphics/xorg-font/xorg-font-common.inc                    
> > meta/recipes-graphics/xorg-font/xorg-minimal-fonts.bb                   
> > meta/recipes-kernel/linux-firmware/linux-firmware_git.bb                
> > meta/recipes-sato/sato-icon-theme/sato-icon-theme.inc                   
> > meta/recipes-sato/sato-icon-theme/sato-icon-theme_0.4.1.bb              
> > meta/recipes-support/hal/hal-info.inc                                   
> > 
> > Some of these are easy, some trigger configure tests for the cross
> > compiler and are harder to fix.
> > 
> > If a package can't use allarch.bbclass, its a strong indicator it
> > shouldn't be PACKAGE_ARCH = "all"...
> 
> What about recipes that have an arch component and noarch config files
> split out? A made-up example would be udev and udev-rules. Is it still
> possible to do PACKAGE_ARCH_udev-rules = "all" in the udev recipe?

Those continue to work as before, the recipe is built as target/machine
specific with "all" shared components that overwrite each other.

I'm not 100% sure what value marking them as "all" has mind...

Cheers,

Richard





