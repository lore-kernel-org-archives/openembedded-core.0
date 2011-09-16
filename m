Received: from dan.rpsys.net ([93.97.175.187])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1R4XfZ-0002kb-V6 for openembedded-core@lists.openembedded.org;
	Fri, 16 Sep 2011 14:37:26 +0200
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.2/8.14.2/Debian-2build1) with ESMTP id
	p8GCcHxC015006 for <openembedded-core@lists.openembedded.org>;
	Fri, 16 Sep 2011 13:38:17 +0100
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id EIBgdqYL9cEp
	for <openembedded-core@lists.openembedded.org>;
	Fri, 16 Sep 2011 13:38:17 +0100 (BST)
Received: from [192.168.1.36] (tim [93.97.173.237]) (authenticated bits=0)
	by dan.rpsys.net (8.14.2/8.14.2/Debian-2build1) with ESMTP id
	p8GCcDAd015001
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 16 Sep 2011 13:38:15 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Fri, 16 Sep 2011 13:32:01 +0100
In-Reply-To: <cover.1316126173.git.dvhart@linux.intel.com>
References: <cover.1316126173.git.dvhart@linux.intel.com>
X-Mailer: Evolution 3.1.91- 
Message-ID: <1316176329.20858.1.camel@ted>
Mime-Version: 1.0
Subject: Re: [PATCH 0/2] initrd contamination and explict PATH
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
X-List-Received-Date: Fri, 16 Sep 2011 12:37:26 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2011-09-15 at 15:41 -0700, Darren Hart wrote:
> I ran into a bit of a nasty issue where EXTRA_IMAGE_FEATURES set in my
> local.conf was causing core-image-initramfs to pull a bunch of files into
> my initrd, including bash and a 100+MB vmlinux image. The 85M initrd caused
> some strange initial boot behavior, and bash in the initrd caused our init
> scripts to fail as bash has a different default PATH than busybox.
> 
> The following patches address these issues.
> 
> Live boot tested on 32 bit x86.
> 
> The following changes since commit bb4a5c44da23a1bb363f1f081cf1644fd7975957:
> 
>   linux-yocto: remove emenlow from meta-yocto bbappend (2.6.37 version) (2011-09-15 11:27:22 +0100)
> 
> are available in the git repository at:
>   git://git.pokylinux.org/poky-contrib dvhart/initrdscripts
>   http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=dvhart/initrdscripts
> 
> Darren Hart (2):
>   Set an explicit path for the initrd scripts
>   Prevent IMAGE_FEATURES from contaminating initrd
> 
>  .../images/core-image-minimal-initramfs.bb         |    3 +++
>  meta/recipes-core/initrdscripts/files/init-boot.sh |    2 ++
>  .../initrdscripts/files/init-install.sh            |    2 ++
>  meta/recipes-core/initrdscripts/files/init-live.sh |    4 +++-
>  4 files changed, 10 insertions(+), 1 deletions(-)

Merged to master but I had to add PR bumps for the script PATH changes.

We shouldn't really be hardcoding the paths but using the expressions
${bindir} etc and making substitutions in the scripts too but we can
leave that issue for another time (they already had other hardcoded
issues).

Cheers,

Richard




