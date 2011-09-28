Received: from dan.rpsys.net ([93.97.175.187])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1R908n-0004Xi-JE for openembedded-core@lists.openembedded.org;
	Wed, 28 Sep 2011 21:50:01 +0200
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.2/8.14.2/Debian-2build1) with ESMTP id
	p8SJouZN022006 for <openembedded-core@lists.openembedded.org>;
	Wed, 28 Sep 2011 20:50:56 +0100
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id KzXU6cdRxu6d
	for <openembedded-core@lists.openembedded.org>;
	Wed, 28 Sep 2011 20:50:56 +0100 (BST)
Received: from [192.168.1.40] (tim [93.97.173.237]) (authenticated bits=0)
	by dan.rpsys.net (8.14.2/8.14.2/Debian-2build1) with ESMTP id
	p8SJoo3p022002
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 28 Sep 2011 20:50:52 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Wed, 28 Sep 2011 20:44:24 +0100
In-Reply-To: <34fc595e22f0b359e6ae5ead10c1ecee30a447f6.1316138063.git.raj.khem@gmail.com>
References: <cover.1316138063.git.raj.khem@gmail.com>
	<34fc595e22f0b359e6ae5ead10c1ecee30a447f6.1316138063.git.raj.khem@gmail.com>
X-Mailer: Evolution 3.1.91- 
Message-ID: <1317239072.12332.53.camel@ted>
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
X-List-Received-Date: Wed, 28 Sep 2011 19:50:01 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2011-09-15 at 18:59 -0700, Khem Raj wrote:
> LINKER_HASH_STYLE in OE is set to either 'sysv' or 'gnu'
> depending upon processor architecture e.g. mips does not support
> gnu hash style so is uses sysv
> 
> besides 'sysv' and 'gnu' third option is to set it to 'both' we do
> not do that by default but user can still set it
> 
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>  meta/conf/bitbake.conf                      |    3 ++-
>  meta/conf/distro/include/tcmode-default.inc |    6 +++++-
>  meta/recipes-core/uclibc/uclibc.inc         |    2 +-
>  3 files changed, 8 insertions(+), 3 deletions(-)

The build failure we're seeing on mips is related to this change. I'm
seeing this from "MACHINE=qemumips bitbake -e":

# LINKER_HASH_STYLE_mips64el=sysv
LINKER_HASH_STYLE_mips64el="sysv"
# LINKER_HASH_STYLE=sysv
LINKER_HASH_STYLE="sysv"
# LINKER_HASH_STYLE_mips64=sysv
LINKER_HASH_STYLE_mips64="sysv"
# TARGET_LINK_HASH_STYLE=${@['-Wl,--hash-style=gnu',''][bb.data.getVar('LINKER_HASH_STYLE', d, True) == 'gnu']}
TARGET_LINK_HASH_STYLE="-Wl,--hash-style=gnu"
# TARGET_LDFLAGS=-Wl,-O1 ${TARGET_LINK_HASH_STYLE} ${ASNEEDED}
export TARGET_LDFLAGS="-Wl,-O1 -Wl,--hash-style=gnu -Wl,--as-needed"

Obviously the problem is TARGET_LINK_HASH_STYLE is that value when
LINKER_HASH_STYLE="sysv" :/

We need to fix this...

Cheers,

Richard



