Received: from dan.rpsys.net ([93.97.175.187])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1R92uY-000811-UX for openembedded-core@lists.openembedded.org;
	Thu, 29 Sep 2011 00:47:31 +0200
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.2/8.14.2/Debian-2build1) with ESMTP id
	p8SMmPGh027776 for <openembedded-core@lists.openembedded.org>;
	Wed, 28 Sep 2011 23:48:26 +0100
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id Wn3dbzC-rrR7
	for <openembedded-core@lists.openembedded.org>;
	Wed, 28 Sep 2011 23:48:25 +0100 (BST)
Received: from [192.168.1.40] (tim [93.97.173.237]) (authenticated bits=0)
	by dan.rpsys.net (8.14.2/8.14.2/Debian-2build1) with ESMTP id
	p8SMmJQC027700
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 28 Sep 2011 23:48:21 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Wed, 28 Sep 2011 23:41:54 +0100
In-Reply-To: <CAMKF1so4ufCEdDUraPgK0BUGFvawpSLY8OCcC=i=o3R7+CL5Bg@mail.gmail.com>
References: <cover.1316138063.git.raj.khem@gmail.com>
	<34fc595e22f0b359e6ae5ead10c1ecee30a447f6.1316138063.git.raj.khem@gmail.com>
	<1317239072.12332.53.camel@ted>
	<CAMKF1so4ufCEdDUraPgK0BUGFvawpSLY8OCcC=i=o3R7+CL5Bg@mail.gmail.com>
X-Mailer: Evolution 3.1.91- 
Message-ID: <1317249721.12332.74.camel@ted>
Mime-Version: 1.0
Subject: Re: [PATCH 1/4] conf, recipes: Add new variable LINKER_HASH_STYLE
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
X-List-Received-Date: Wed, 28 Sep 2011 22:47:31 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2011-09-28 at 14:24 -0700, Khem Raj wrote:
> On Wed, Sep 28, 2011 at 12:44 PM, Richard Purdie
> <richard.purdie@linuxfoundation.org> wrote:
> > On Thu, 2011-09-15 at 18:59 -0700, Khem Raj wrote:
> >> LINKER_HASH_STYLE in OE is set to either 'sysv' or 'gnu'
> >> depending upon processor architecture e.g. mips does not support
> >> gnu hash style so is uses sysv
> >>
> >> besides 'sysv' and 'gnu' third option is to set it to 'both' we do
> >> not do that by default but user can still set it
> >>
> >> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> >> ---
> >>  meta/conf/bitbake.conf                      |    3 ++-
> >>  meta/conf/distro/include/tcmode-default.inc |    6 +++++-
> >>  meta/recipes-core/uclibc/uclibc.inc         |    2 +-
> >>  3 files changed, 8 insertions(+), 3 deletions(-)
> >
> > The build failure we're seeing on mips is related to this change. I'm
> > seeing this from "MACHINE=qemumips bitbake -e":
> >
> > # LINKER_HASH_STYLE_mips64el=sysv
> > LINKER_HASH_STYLE_mips64el="sysv"
> > # LINKER_HASH_STYLE=sysv
> > LINKER_HASH_STYLE="sysv"
> > # LINKER_HASH_STYLE_mips64=sysv
> > LINKER_HASH_STYLE_mips64="sysv"
> > # TARGET_LINK_HASH_STYLE=${@['-Wl,--hash-style=gnu',''][bb.data.getVar('LINKER_HASH_STYLE', d, True) == 'gnu']}
> > TARGET_LINK_HASH_STYLE="-Wl,--hash-style=gnu"
> > # TARGET_LDFLAGS=-Wl,-O1 ${TARGET_LINK_HASH_STYLE} ${ASNEEDED}
> > export TARGET_LDFLAGS="-Wl,-O1 -Wl,--hash-style=gnu -Wl,--as-needed"
> >
> > Obviously the problem is TARGET_LINK_HASH_STYLE is that value when
> > LINKER_HASH_STYLE="sysv" :/
> >
> > We need to fix this...
> >
> 
> here is my MACHINE=qemumips bitbake -e run on latest oe-core/master
> http://paste.ubuntu.com/698725/

Right, I found the problem, posted the patch and then decided I'd merge
it rather than have anyone suffer any more broken builds:

http://git.openembedded.org/cgit.cgi/openembedded-core/commit/?id=5839702da70cec32f01e58280629f6bcf74d0034

So I think this should be resolved now.

Cheers,

Richard





