Received: from dan.rpsys.net ([93.97.175.187])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1REg04-0005We-Km for openembedded-core@lists.openembedded.org;
	Fri, 14 Oct 2011 13:32:28 +0200
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.2/8.14.2/Debian-2build1) with ESMTP id
	p9EBXHjY010087 for <openembedded-core@lists.openembedded.org>;
	Fri, 14 Oct 2011 12:33:17 +0100
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id I4yqeEk4gLoU
	for <openembedded-core@lists.openembedded.org>;
	Fri, 14 Oct 2011 12:33:17 +0100 (BST)
Received: from [192.168.1.66] (tim [93.97.173.237]) (authenticated bits=0)
	by dan.rpsys.net (8.14.2/8.14.2/Debian-2build1) with ESMTP id
	p9EBXDHY010083
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 14 Oct 2011 12:33:15 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Fri, 14 Oct 2011 12:26:30 +0100
In-Reply-To: <cover.1318505196.git.Martin.Jansa@gmail.com>
References: <cover.1318505196.git.Martin.Jansa@gmail.com>
X-Mailer: Evolution 3.1.91- 
Message-ID: <1318591599.23801.257.camel@ted>
Mime-Version: 1.0
Subject: Re: [oe-core 00/20] Xorg, mesa changes
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
X-List-Received-Date: Fri, 14 Oct 2011 11:32:28 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2011-10-13 at 13:30 +0200, Martin Jansa wrote:
> Mostly cleanup in mesa directory.
> 
> Most controversial is 
> mesa-dri: introduce MACHINE_DRI_MODULES
> but maybe we can use it as distro variable and keep it with default arch.
> But then we cannot just add ie glamo dri module from meta-openmoko like this:
> http://git.shr-project.org/git/?p=meta-smartphone.git;a=commit;h=b50c8d00cf764c276b0792c0623b8eda3d18d343
> without distro (setting MACHINE_DRI_MODULES) depending on such bsp layer.
> 
> The following changes since commit 5ad1ca59dea6d5045f252ed7b786ad193faced64:
> 
>   xf86-video-intel: Update 2.15.0 -> 2.16.0 (2011-10-12 22:59:14 +0100)
> 
> are available in the git repository at:
>   git://git.openembedded.org/openembedded-core-contrib jansa/x11-v4
>   http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=jansa/x11-v4
> 
> Martin Jansa (20):
>   xserver-xorg: drop xorg-minimal-fonts from RDEPENDS
>   xserver-xorg: move PE to xserver-xorg-common and bump it
>   xorg-driver-common: bump PE for upgrade path for meta-oe users
>   mesa-dri-glsl-native: fix LICENSE
>   mesa: move common patches which could be used in both mesa-dri and
>     mesa-xlib from mesa-dri to mesa
>   mesa-common: add common LIC_FILES_CHKSUM for newer mesa versions
>   mesa-common: MesaDemos is now separate recipes, bump PE, introduce
>     INC_PR
>   mesa-common: use glx-use-tls.inc instead of enabling glx-tls every
>     time
>   mesa-7.11: move shared DEPENDS, SRC_URI, checksums and
>     do_configure_prepend to shared .inc file
>   mesa: move shared PROTO_DEPS, LIB_DEPS and DEPENDS to common .inc
>   mesa: package gl/egl/osmesa to separate packages
>   mesa-xlib: move shared options to .inc
>   mesa-dri: move shared options to mesa-dri.inc
>   mesa-dri: introduce MACHINE_DRI_MODULES
>   mesa-dri: LEAD_SONAME shouldn't be needed now, when we're packaging
>     each lib in separate package
>   mesa-dri: drop COMPATIBLE_HOST, swrast should work for everybody
>   mesa-git: move shared parts from mesa-dri_git to mesa-git.inc and add
>     mesa-xlib_git
>   mesa-git: lower D_P a bit more then all mesa-dri
>   mesa-git: upgrade from 7.7+git to 7.11+git
>   mesa-git: fix LIC_FILES_CHKSUM

I merged most of this. The pieces I didn't take:

* MACHINE_DRI_MODULES piece
* Drop COMPATIBLE_HOST (due to above)
* glx-tls piece
* FILES changes (due to do_install_append)

This was *much* easier to review and I'm grateful for that, thanks!

I think the actions are now:

a) Resolve the MACHINE_DRI_MODULES discussion. Short term we can make
the i915/965 pieces ia32 only and then remove the COMPATIBLE_MACHINES
b) Drop the glx/tls piece
c) Drop the do_install_append

and then we should have this all resolved :)

Cheers,

Richard



