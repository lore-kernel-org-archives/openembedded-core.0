Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1QSFSK-0004P2-HS for openembedded-core@lists.openembedded.org;
	Thu, 02 Jun 2011 23:29:29 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p52LQFwL029879
	for <openembedded-core@lists.openembedded.org>;
	Thu, 2 Jun 2011 22:26:15 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 29759-02 for <openembedded-core@lists.openembedded.org>;
	Thu,  2 Jun 2011 22:26:10 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p52LQ7k0029870
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 2 Jun 2011 22:26:08 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <1307008107.2529.175.camel@phil-desktop>
References: <1307008107.2529.175.camel@phil-desktop>
Date: Thu, 02 Jun 2011 22:25:46 +0100
Message-ID: <1307049946.27470.589.camel@rex>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.2 
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [PATCH] rpm: avoid dependency on perl and python for -native build
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
X-List-Received-Date: Thu, 02 Jun 2011 21:29:29 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2011-06-02 at 10:48 +0100, Phil Blundell wrote:
> Update override naming (_native -> _virtclass-native) to disable perl
> and python bindings when building native rpm, and adjust the DEPENDS to
> match.
> 
> Perl bindings were, in fact, already disabled for both native and target
> builds so it's only the python ones that have really changed.
> 
> Signed-off-by: Phil Blundell <philb@gnu.org>
> ---
>  meta/recipes-devtools/rpm/rpm_5.4.0.bb |   10 ++++++----
>  1 files changed, 6 insertions(+), 4 deletions(-)
> 
> diff --git a/meta/recipes-devtools/rpm/rpm_5.4.0.bb b/meta/recipes-devtools/rpm/rpm_5.4.0.bb
> index d3f85f2..5c30f1c 100644
> --- a/meta/recipes-devtools/rpm/rpm_5.4.0.bb
> +++ b/meta/recipes-devtools/rpm/rpm_5.4.0.bb
> @@ -42,8 +42,10 @@ HOMEPAGE = "http://rpm5.org/"
>  LICENSE = "LGPL 2.1"
>  LIC_FILES_CHKSUM = "file://COPYING.LIB;md5=2d5025d4aa3495befef8f17206a5b0a1"
>  
> -DEPENDS = "bzip2 zlib python perl db openssl elfutils expat libpcre attr acl popt"
> -PR = "r16"
> +rpmdeps = "bzip2 zlib db openssl elfutils expat libpcre attr acl popt"
> +DEPENDS = "${rpmdeps} python perl"
> +DEPENDS_virtclass-native = "${rpmdeps}"
> +PR = "r17"
>  
>  # rpm2cpio is a shell script, which is part of the rpm src.rpm.  It is needed
>  # in order to extract the distribution SRPM into a format we can extract...
> @@ -92,7 +94,7 @@ WITH_PYTHON = "	--with-python=${PYTHON_BASEVERSION} \
>  		--without-pythonembed \
>  	      "
>  
> -WITH_PYTHON_native = " --without-python"
> +WITH_PYTHON_virtclass-native = " --without-python"
>  
>  # Perl modules are not built, but they could be enabled fairly easily
>  # the perl module creation and installation would need to be patched.
> @@ -100,7 +102,7 @@ WITH_PYTHON_native = " --without-python"
>  #WITH_PERL = "	--with-perl --without-perlembed"
>  WITH_PERL = "	--without-perl"
>  
> -WITH_PERL_native = " --without-perl"
> +WITH_PERL_virtclass-native = " --without-perl"
>  
>  WITH_DB = "--with-db --with-dbsql --without-db-tools-integrated --without-sqlite"
>  

This appears to break the rpm-native build with:

| checking whether to build with Lua library... no
| ++ executing failure action
| ++ mapping --with-pcre=yes to --with-pcre="external:internal:none"
| ++ searching location: external
| ++ searching location: internal
| -- skipping not existing local sub-directory: pcre
| ++ searching location: none
| -- no operation
| checking pcre.h usability... no
| checking pcre.h presence... no
| checking for pcre.h... no
| checking for pcre_compile in -lpcre... no
| checking whether to build with PCRE library... no
| ++ executing failure action
| configure: error: PCRE is mandatory. If you don't have  libpcre then --with-pcre=internal could be used
| ERROR: oe_runconf failed
| ERROR: Function 'do_configure' failed (see /media/build2/builds/rptest/b2/tmp/work/x86_64-linux/rpm-native-5.4.0-r17/temp/log.do_configure.8572 for further information)
| ERROR: Function 'do_configure' failed (see /media/build2/builds/rptest/b2/tmp/work/x86_64-linux/rpm-native-5.4.0-r17/temp/log.do_configure.8572 for further information)
NOTE: package rpm-native-5.4.0-r17: task do_configure: Failed
ERROR: Task 48 (virtual:native:/media/build2/builds/rptest/meta/recipes-devtools/rpm/rpm_5.4.0.bb, do_configure) failed with exit code '1'
ERROR: 'virtual:native:/media/build2/builds/rptest/meta/recipes-devtools/rpm/rpm_5.4.0.bb' failed

:(

Cheers,

Richard




