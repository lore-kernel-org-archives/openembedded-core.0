Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1T32aw-0000jE-LR for openembedded-core@lists.openembedded.org;
	Sun, 19 Aug 2012 12:18:58 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q7JA6vPM024098;
	Sun, 19 Aug 2012 11:06:57 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 23973-01; Sun, 19 Aug 2012 11:06:52 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q7JA6ovr024091
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=NO);
	Sun, 19 Aug 2012 11:06:51 +0100
Message-ID: <1345370811.27428.86.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Sun, 19 Aug 2012 11:06:51 +0100
In-Reply-To: <1345218791-28891-3-git-send-email-andy.ross@windriver.com>
References: <1345218791-28891-1-git-send-email-andy.ross@windriver.com>
	<1345218791-28891-2-git-send-email-andy.ross@windriver.com>
	<1345218791-28891-3-git-send-email-andy.ross@windriver.com>
X-Mailer: Evolution 3.2.3-0ubuntu6 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Cc: openembedded-core@openembedded.org
Subject: Re: [PATCH 2/2] libtool: normalize link paths before considering for RPATH
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sun, 19 Aug 2012 10:18:58 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2012-08-17 at 08:53 -0700, Andy Ross wrote:
> Libtool may be passed link paths of the form "/usr/lib/../lib", which fool
> its detection code into thinking it should be included as an RPATH in
> the generated binary.  Normalize before comparision.
> 
> Signed-off-by: Andy Ross <andy.ross@windriver.com>
> ---
>  meta/recipes-devtools/libtool/libtool-2.4.2.inc    |  1 +
>  .../libtool/libtool/norm-rpath.patch               | 42 ++++++++++++++++++++++
>  2 files changed, 43 insertions(+)
>  create mode 100644 meta/recipes-devtools/libtool/libtool/norm-rpath.patch
> 
> diff --git a/meta/recipes-devtools/libtool/libtool-2.4.2.inc b/meta/recipes-devtools/libtool/libtool-2.4.2.inc
> index 5b9557e..691427e 100644
> --- a/meta/recipes-devtools/libtool/libtool-2.4.2.inc
> +++ b/meta/recipes-devtools/libtool/libtool-2.4.2.inc
> @@ -19,6 +19,7 @@ SRC_URI = "${GNU_MIRROR}/libtool/libtool-${PV}.tar.gz \
>             file://avoid_absolute_paths_for_general_utils.patch \
>             file://fix-rpath.patch \
>  	   file://respect-fstack-protector.patch \
> +           file://norm-rpath.patch \
>            "
>  
>  SRC_URI[md5sum] = "d2f3b7d4627e69e13514a40e72a24d50"
> diff --git a/meta/recipes-devtools/libtool/libtool/norm-rpath.patch b/meta/recipes-devtools/libtool/libtool/norm-rpath.patch
> new file mode 100644
> index 0000000..03a7667
> --- /dev/null
> +++ b/meta/recipes-devtools/libtool/libtool/norm-rpath.patch
> @@ -0,0 +1,42 @@
> +libtool: normalize link paths before considering for RPATH
> +
> +Libtool may be passed link paths of the form "/usr/lib/../lib", which
> +fool its detection code into thinking it should be included as an
> +RPATH in the generated binary.  Normalize before comparision.
> +
> +Signed-off-by: Andy Ross <andy.ross@windriver.com>
> +Upstream-Status: Pending
> +
> +diff -ru a/libltdl/config/ltmain.m4sh b/libltdl/config/ltmain.m4sh
> +--- a/libltdl/config/ltmain.m4sh	2012-08-16 13:58:55.058900363 -0700
> ++++ b/libltdl/config/ltmain.m4sh	2012-08-16 16:34:54.616627821 -0700
> +@@ -7288,8 +7288,13 @@
> + 	      else
> +                 # We only want to hardcode in an rpath if it isn't in the
> +                 # default dlsearch path.
> ++                libdir_norm=`echo $libdir \
> ++                  | sed 's/\/\+\.\(\/\+\|$\)/\//g' \
> ++                  | sed 's/[^\/]\+\/\+\.\.\(\/\+\|$\)//g' \
> ++                  | sed 's/\/\+/\//g' \
> ++                  | sed 's/\(.\)\/$/\1/g'`
> + 	        case " $sys_lib_dlsearch_path " in
> +-	        *" $libdir "*) ;;
> ++	        *" $libdir_norm "*) ;;
> + 	        *) eval flag=\"$hardcode_libdir_flag_spec\"
> +                    func_append dep_rpath " $flag"
> +                    ;;

Can't we use func_norm_abspath here?

Cheers,

Richard




