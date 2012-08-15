Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1T1lUn-0001Db-T8 for openembedded-core@lists.openembedded.org;
	Wed, 15 Aug 2012 23:51:22 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q7FLdPuT005710
	for <openembedded-core@lists.openembedded.org>;
	Wed, 15 Aug 2012 22:39:25 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 03626-09 for <openembedded-core@lists.openembedded.org>;
	Wed, 15 Aug 2012 22:39:17 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q7FLdCAp005701
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 15 Aug 2012 22:39:15 +0100
Message-ID: <1345066752.14667.23.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Wed, 15 Aug 2012 22:39:12 +0100
In-Reply-To: <10192d7fd47ea041f73511eaa8b5e56c13152951.1345047378.git.ross.burton@intel.com>
References: <cover.1345047378.git.ross.burton@intel.com>
	<10192d7fd47ea041f73511eaa8b5e56c13152951.1345047378.git.ross.burton@intel.com>
X-Mailer: Evolution 3.2.3-0ubuntu6 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [PATCH 1/2] make: add make-replacement-native 3.81
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
X-List-Received-Date: Wed, 15 Aug 2012 21:51:22 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2012-08-15 at 17:18 +0100, Ross Burton wrote:
> GNU Make 3.82 has some regressions regarding parallel processing that causes
> some packages to fail, specifically WebKitGTK+.  Add make-replacement-native
> 3.81 so that those packages can depend on a Make which is known to work.
> 
> Signed-off-by: Ross Burton <ross.burton@intel.com>
> ---
>  meta/recipes-devtools/make/make-replacement-native_3.81.bb |    6 ++++++
>  1 file changed, 6 insertions(+)
>  create mode 100644 meta/recipes-devtools/make/make-replacement-native_3.81.bb
> 
> diff --git a/meta/recipes-devtools/make/make-replacement-native_3.81.bb b/meta/recipes-devtools/make/make-replacement-native_3.81.bb
> new file mode 100644
> index 0000000..716a8b5
> --- /dev/null
> +++ b/meta/recipes-devtools/make/make-replacement-native_3.81.bb
> @@ -0,0 +1,6 @@
> +require make_${PV}.bb
> +
> +inherit native
> +
> +BPN = "make"
> +EXTRAINSTALL = ""

Unfortunately we have some experience with these replacement recipes and
they need some "special" handling. You need to install make into a
subdirectory off ${bindir} and then add it to PATH in the webkit recipe.
There is precedent for this:

http://git.yoctoproject.org/cgit.cgi/poky/commit/?id=3f05622bac998f351168eb49a5ca96e7473f51be

So BBCLASSEXTEND the make recipe, add a PROVIDES, then do a
EXTRANATIVEPATH += "make-native" in the webkit recipe.

The reason for this elaborate dance is so we avoid races, nothing should
be executing the make binary when we do anything to it with sstate
(install or remove it). Admittedly this is much more critical when there
is an associated library like bzip but we need to set the right example.

Cheers,

Richard

 



