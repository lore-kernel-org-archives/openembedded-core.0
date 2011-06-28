Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1QbYds-0006Xz-U8 for openembedded-core@lists.openembedded.org;
	Tue, 28 Jun 2011 15:47:53 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p5SDIZ88024604
	for <openembedded-core@lists.openembedded.org>;
	Tue, 28 Jun 2011 14:18:35 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 24412-04 for <openembedded-core@lists.openembedded.org>;
	Tue, 28 Jun 2011 14:18:31 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p5SDIR8b024598
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 28 Jun 2011 14:18:27 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <1865303E0DED764181A9D882DEF65FB6A167F0C70B@shsmsx502.ccr.corp.intel.com>
References: <1865303E0DED764181A9D882DEF65FB6A167F0C70B@shsmsx502.ccr.corp.intel.com>
Date: Tue, 28 Jun 2011 14:18:13 +0100
Message-ID: <1309267093.20015.293.camel@rex>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.2 
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [Draft design][RFC] Running postinst at rootfs generation time
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
X-List-Received-Date: Tue, 28 Jun 2011 13:47:53 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Hi Dexuan,

On Tue, 2011-06-28 at 10:09 +0800, Cui, Dexuan wrote:
> Hi all, below is an initial investigation about the task and we'll
> continue to further look into it.
> 
> In poky we have 2 types of postinst scripts:  one (type-1) can be (and
> has already been) run at rootfs generation time and the other (type-2)
> has to be delayed to the first-boot of target device. Type-2 makes
> target device's first-boot slow and it would be great if we can fix it
> and convert it to type-1.
> 
> We can instrument a first-boot with minimal/sato first to see which
> postinstalls take the most time and then prioritise those ones to fix.
> 
> I figurerd out a list of 33 recipes in total(recipes with the same
> name but with different versions are counted once) we possibly need to
> fix.
> For the recipes, we need try to find recipe-specific ways(use
> appropriately modified native utilities to generate caches, files, etc
> as necessary on the target filesystem).

Out of interest, how long were these different groups of postinstall
taking on the target device?

> 11 recipes: these could be easily fixed if we add the properly-adjusted utilities "adduser, addgroup, pwconv, etc". Scott is actually adding the utilites: http://git.pokylinux.org/cgit/cgit.cgi/poky-contrib/commit/?h=sgarman/useradd-rebased&id=99e54d9696104ed38ec1e3464e17aa1f9b8d98ac
> meta/recipes-devtools/distcc/distcc_2.18.3.bb
> meta/recipes-extended/cronie/cronie_1.4.7.bb
> meta/recipes-extended/at/at_3.1.12.bb:47
> meta/recipes-support/hal/hal.inc:45
> meta/recipes-core/dbus/dbus.inc:49
> meta/recipes-connectivity/openssh/openssh_5.8p2.bb
> meta/recipes-connectivity/ppp-dialin/ppp-dialin_0.1.bb
> meta/recipes-graphics/x11-common/xserver-nodm-init.bb
> meta/recipes-multimedia/pulseaudio/pulseaudio.inc:87
> meta/recipes-extended/shadow/shadow_4.1.4.3.bb:125
> meta/classes/libc-package.bbclass

We should definitely fix these now we have the user code.

> 6  recipes: these should be easily fixed since the scripts are not related to special native utilites.
> meta/recipes-extended/sudo/sudo.inc
> meta/recipes-extended/sysklogd/sysklogd.inc
> meta/classes/update-rc.d.bbclass
> meta/recipes-connectivity/ppp/ppp_2.4.5.bb
> meta/recipes-graphics/pango/pango.inc
> meta/recipes-gnome/gtk+/gtk+.inc
>  
> 4 recipes: we may need to add gtk-update-icon-cache-native.
> meta/classes/gtk-icon-cache.bbclass
> meta/recipes-gnome/librsvg/librsvg_2.32.1.bb
> meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.22.1.bb
> meta/recipes-sato/sato-icon-theme/sato-icon-theme.inc
> 
> 3 recipes: need to add gconftool-2-native?
> meta/classes/gconf.bbclass
> meta/recipes-graphics/mutter/mutter.inc
> meta/recipes-sato/matchbox-sato/matchbox-session-sato_0.1.bb

I suspect this category and the once above (icon-cache) are the slowest
on the target device?

> 3 recipes: "dpkg --configure, opkg-cl configure": looks it's possible to fix them if we specify proper parematers?
> meta/recipes-devtools/dpkg/dpkg.inc
> meta/recipes-devtools/opkg/opkg_svn.bb
> meta/recipes-devtools/opkg/opkg_0.1.8.bb
> 
> 1 recipe: prelink: we could propablly fix it, but I'm not sure yet.
> meta/recipes-devtools/prelink/prelink_git.bb
> 
> 1 recipe: "/etc/init.d/populate-volatile.sh update ; DBUSPID=`pidof dbus-daemon`": We can't fix this one.
> meta/recipes-connectivity/wpa-supplicant/wpa-supplicant-0.7.inc
> 
> The below 4 recipes need the related utilities and need more investigation. 
> 
> 1 recipe: update-modules
> meta/recipes-kernel/update-modules/update-modules_1.0.bb
> 
> 1 recipe: systemctl
> meta/recipes-connectivity/avahi/avahi.inc
> 
> 1 recipe: fc-cache
> meta/recipes-graphics/ttf-fonts/liberation-fonts_1.04.bb:37
> 
> 1 recipe: gtk-query-immodules-2.0
> meta/recipes-sato/matchbox-keyboard/matchbox-keyboard_git.bb

This looks like a good start to me but I'd be interested to see the
relative lengths of time these postinstalls take...

Cheers,

Richard



