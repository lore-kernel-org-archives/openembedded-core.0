Return-Path: <denis@denix.org>
Received: from vms173007pub.verizon.net (vms173007pub.verizon.net
	[206.46.173.7])
	by mail.openembedded.org (Postfix) with ESMTP id 0BAE46CA7E
	for <Openembedded-core@lists.openembedded.org>;
	Thu, 26 Sep 2013 22:40:33 +0000 (UTC)
Received: from gandalf.denix.org ([unknown] [108.45.150.102])
	by vms173007.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0MTR00E6W8APUH90@vms173007.mailsrvcs.net> for
	Openembedded-core@lists.openembedded.org;
	Thu, 26 Sep 2013 17:40:16 -0500 (CDT)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id 46FE720120; Thu,
	26 Sep 2013 18:40:00 -0400 (EDT)
Date: Thu, 26 Sep 2013 18:40:00 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: Jason Wessel <jason.wessel@windriver.com>
Message-id: <20130926224000.GA31328@denix.org>
References: <1360697804-39039-1-git-send-email-jason.wessel@windriver.com>
MIME-version: 1.0
In-reply-to: <1360697804-39039-1-git-send-email-jason.wessel@windriver.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: Openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] libtool-native_2.4.2.bb: Always use /bin/sed for SED
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
X-List-Received-Date: Thu, 26 Sep 2013 22:40:34 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

On Tue, Feb 12, 2013 at 01:36:44PM -0600, Jason Wessel wrote:
> If you never use sstate and always build everything from scratch you
> will never see this problem.  However, if you use sstate and build
> directories that last a long time eventually you can end up with the
> scenario where libtool gets a hard coded path in it for sed, and sed
> may not exist.  The reason you don't see this problem to often if you
> generally build from scratch is that libtool builds before sed and
> will pickup the host's /bin/sed.
> 
> The way to reproduce the issue is:
> 
> bitbake some_image
> bitbake -c cleansstate libtool-native
> bitbake sed-native
> bitbake libtool-native
> bitbake -c clean sed-native
> bitbake ANY_PACKAGE_THAT_USES_LIBTOOL_NATIVE
> 
> In my case I used modphp, which doesn't exist in the oe-core. You will
> end up with a strange looking error like:
> 
> | make[1]: *** [buckets/apr_buckets_alloc.lo] Error 1
> | /opt/build/bitbake_build/tmp/sysroots/x86_64-linux/usr/bin/x86_64-linux-libtool: line 981: /opt/build/bitbake_build/tmp/sysroots/x86_64-linux//bin/sed: No such file or directory

Sorry for bringing up this old thread. I'm seeing these and similar errors now 
(nothing really changed in my setup, but some race got them exposed).

I do see that the proposed patch got merged all the way back in February. But 
looks like it wasn't enough.

I've just seen this error about missing sysroots/x86_64-linux//bin/sed coming 
from nativesdk-gettext compilation while calling i686-linux-libtool, i.e. the 
nativesdk version of libtool. Should be easy to duplicate the below patch for 
libtool from native to nativesdk recipe.

And another error was from sysroots/x86_64-linux/usr/bin/opkg-build during 
do_package_write of some other package. Should opkg-utils-native be patched 
the same?

Denys


> The solution is to always use /bin/sed for libtool-native.
> 
> Signed-off-by: Jason Wessel <jason.wessel@windriver.com>
> ---
>  .../libtool/libtool-native_2.4.2.bb                |    3 ++-
>  1 files changed, 2 insertions(+), 1 deletions(-)
> 
> diff --git a/meta/recipes-devtools/libtool/libtool-native_2.4.2.bb b/meta/recipes-devtools/libtool/libtool-native_2.4.2.bb
> index f12e6a1..18188ef 100644
> --- a/meta/recipes-devtools/libtool/libtool-native_2.4.2.bb
> +++ b/meta/recipes-devtools/libtool/libtool-native_2.4.2.bb
> @@ -2,12 +2,13 @@ require libtool-${PV}.inc
>  
>  DEPENDS = ""
>  
> -PR = "${INC_PR}.0"
> +PR = "${INC_PR}.1"
>  SRC_URI += "file://prefix.patch"
>  
>  inherit native
>  
>  EXTRA_OECONF = " --with-libtool-sysroot=${STAGING_DIR_NATIVE}"
> +CACHED_CONFIGUREVARS += "ac_cv_path_SED=/bin/sed"
>  
>  do_configure_prepend () {
>  	# Remove any existing libtool m4 since old stale versions would break
> -- 
> 1.7.1
> 
> 
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core

