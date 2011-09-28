Received: from dan.rpsys.net ([93.97.175.187])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1R8rsH-0002bC-Rq for openembedded-core@lists.openembedded.org;
	Wed, 28 Sep 2011 13:00:29 +0200
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.2/8.14.2/Debian-2build1) with ESMTP id
	p8SB1KoK032738 for <openembedded-core@lists.openembedded.org>;
	Wed, 28 Sep 2011 12:01:20 +0100
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id OTiJhWYUpxFm
	for <openembedded-core@lists.openembedded.org>;
	Wed, 28 Sep 2011 12:01:20 +0100 (BST)
Received: from [192.168.1.40] (tim [93.97.173.237]) (authenticated bits=0)
	by dan.rpsys.net (8.14.2/8.14.2/Debian-2build1) with ESMTP id
	p8SB1FrQ032732
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 28 Sep 2011 12:01:16 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Wed, 28 Sep 2011 11:54:50 +0100
In-Reply-To: <cover.1317193250.git.sgw@linux.intel.com>
References: <cover.1317193250.git.sgw@linux.intel.com>
X-Mailer: Evolution 3.1.91- 
Message-ID: <1317207297.26109.235.camel@ted>
Mime-Version: 1.0
Subject: Re: [CONSOLIDATED PULL 00/29] Picking up patches from OE-Core list
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
X-List-Received-Date: Wed, 28 Sep 2011 11:00:29 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Hi Saul,

On Wed, 2011-09-28 at 00:05 -0700, Saul Wold wrote:
> I have reviewed most of these changes, and the current autobuilder built
> all the changes except the last batch multilib changes since we don't have
> that setup.
> 
> Please review the multi-lib change.
> 
> There was an issue with the Autobuilder, Mips and Eglibc that I need to
> investgate further with Khem, but based on the inital build I think we can
> pull it now and fix it shortly.
> 
> I think that Josh's ghostscript, Bruce's kernel update and my rpm patches
> are suited to be pulled into RC4, other isolated changes are the oprofileui 
> removal of gnome-vfs and Koen's avahi fix.
> 
> Please review and pull as approriate.
> 
> Sau!

I merged these:

> Bruce Ashfield (1):
>   linux-yocto/meta: eg20t and live boot config changes
> 
> Dongxiao Xu (4):
>  multilib.bbclass: map RDEPENDS and LINGUAS_INSTALL for image recipes
>  multilib: remove the multilib handling to allarch 
>   package_rpm: combine normal and multilib solution manifest together
>   libc-package.bbclass: add MLPREFIX when set values to PACKAGES
> 
> Joshua Lock (1):
>   ghostscript: disable check for time.h
> 
> Khem Raj (2):
>   gcc-4.6: Use --with-linker-hash-style configure option
>   eglibc: Add recipes for 2.14
>
> Koen Kooi (1):
>   avahi: fix avahi-systemd dependencies
> 
> Richard Purdie (4):
>   gcc: Fix two QA issues
>   grub: Fix insane/QA architecture warning
>   sqlite3: Fix nativesdk packaging/QA warnings
>   pseudo: Fix QA warnings
> 
> Saul Wold (4):
>   rpm: ensure that magic file is relocatable
>   zypper & sat-solver: needs RDEPENDS on rpm-lib
>   rpm: fix QA Warning on installed but not shipped staticdev filesw
>   distro_tracking: Update Manual Upgrade Checks
> 
> Simon Busch (2):
>   meta: qt4: fix postprocessing of pkg-config files
>   qt4-embedded: move qte.sh profile script into own package
> 
> Tom Zanussi (2):
>   sysprof: update to version 1.1.8
>   blktrace: update to version 1.0.3
> 
> Zhai Edwin (3):
>   oprofileui: remove dependence on gnome-vfs
>   libgsf: remove dependence on gnome-vfs
>   tables: remove it as obsolete recipe

I didn't take this as I think we may need to give meta-oe the
opportunity to take this in, then we'll drop it:

>Zhai Edwin (1):
>   gnome-vfs: remove it as obsolete recipe in favor of GIO/GVFS

I took this but changed the patch as I requested on the mailing list:

>Khem Raj (1):
>   conf,recipes: Add new variable LINKER_HASH_STYLE

I didn't take this since I worry this is where your mips compiler issues
were coming from. If we could reset master on mips, we can figure out if
thats the case. I'm not adversed to the patch, I just think we need to
be careful and figure out if there are regressions coming in through it:

>Khem Raj (1):
>   gcc-4.6: Update to tip of FSF gcc-4_6-branch

These I'm holding pending test reports back from Dongxiao. I merged four
of the multilib patches:

>Dongxiao Xu (6):
>   multilib: add MLPREFIX to deploy folder
>   tune-i586: fix hardcoded TUNE_PKGARCH

Cheers,

Richard



