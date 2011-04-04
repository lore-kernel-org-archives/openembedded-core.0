Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1Q6j3N-0004ck-1e for openembedded-core@lists.openembedded.org;
	Mon, 04 Apr 2011 14:38:45 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p34CafRW015972
	for <openembedded-core@lists.openembedded.org>;
	Mon, 4 Apr 2011 13:36:41 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 15532-10 for <openembedded-core@lists.openembedded.org>;
	Mon,  4 Apr 2011 13:36:37 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p34CaZdp015966
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 4 Apr 2011 13:36:35 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <727e14088ae90f5662a7905c3ced4a5a39eb9ce3.1301631488.git.raj.khem@gmail.com>
References: <cover.1301631488.git.raj.khem@gmail.com>
	<727e14088ae90f5662a7905c3ced4a5a39eb9ce3.1301631488.git.raj.khem@gmail.com>
Date: Mon, 04 Apr 2011 13:36:32 +0100
Message-ID: <1301920592.24596.350.camel@rex>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.2 
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [PATCH 26/46] perl_5.12.2.bb: By defualt undefine features not found in uclibc
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
X-List-Received-Date: Mon, 04 Apr 2011 12:38:45 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2011-03-31 at 21:29 -0700, Khem Raj wrote:
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>  meta/recipes-devtools/perl/perl-5.12.2/config.sh |   14 +++++++-------
>  meta/recipes-devtools/perl/perl_5.12.2.bb        |   10 ++++++++++
>  2 files changed, 17 insertions(+), 7 deletions(-)
> 
> diff --git a/meta/recipes-devtools/perl/perl-5.12.2/config.sh b/meta/recipes-devtools/perl/perl-5.12.2/config.sh
> index 12d44a8..77067e1 100644
> --- a/meta/recipes-devtools/perl/perl-5.12.2/config.sh
> +++ b/meta/recipes-devtools/perl/perl-5.12.2/config.sh
> @@ -87,7 +87,7 @@ cat='cat'
>  cc='gcc'
>  cccdlflags='-fPIC'
>  ccdlflags='-Wl,-E -Wl,-rpath,/usr/lib/perl5/5.12.2/@ARCH@-thread-multi/CORE'
> -ccflags='-D_REENTRANT -D_GNU_SOURCE -fno-strict-aliasing -pipe -fstack-protector -D_LARGEFILE_SOURCE -D_FILE_OFFSET_BITS=64'
> +ccflags='-D_REENTRANT -D_GNU_SOURCE -fno-strict-aliasing -pipe -D_LARGEFILE_SOURCE -D_FILE_OFFSET_BITS=64'
>  ccflags_uselargefiles='-D_LARGEFILE_SOURCE -D_FILE_OFFSET_BITS=64'
>  ccname='gcc'
>  ccsymbols=''
> @@ -108,7 +108,7 @@ cpio=''
>  cpp='cpp'
>  cpp_stuff='42'
>  cppccsymbols=''
> -cppflags='-D_REENTRANT -D_GNU_SOURCE -fno-strict-aliasing -pipe -fstack-protector'
> +cppflags='-D_REENTRANT -D_GNU_SOURCE -fno-strict-aliasing -pipe'
>  cpplast='-'
>  cppminus='-'
>  cpprun='gcc -E'

This looks like a sign that we should be putting our cc flags into here
then stack-protector is either used or not used as per the global
configuration.

> @@ -194,7 +194,7 @@ d_dosuid='undef'
>  d_drand48_r='define'
>  d_drand48proto='define'
>  d_dup2='define'
> -d_eaccess='define'
> +d_eaccess='undef'
>  d_endgrent='define'
>  d_endgrent_r='undef'
>  d_endhent='define'
> @@ -490,12 +490,12 @@ d_statfs_f_flags='undef'
>  d_statfs_s='define'
>  d_statvfs='define'
>  d_stdio_cnt_lval='undef'
> -d_stdio_ptr_lval='define'
> +d_stdio_ptr_lval='undef'
>  d_stdio_ptr_lval_nochange_cnt='undef'
> -d_stdio_ptr_lval_sets_cnt='define'
> +d_stdio_ptr_lval_sets_cnt='undef'
>  d_stdio_stream_array='undef'
> -d_stdiobase='define'
> -d_stdstdio='define'
> +d_stdiobase='undef'
> +d_stdstdio='undef'
>  d_strchr='define'
>  d_strcoll='define'
>  d_strctcpy='define'

What is the implications for a (e)glibc system of changing these?
Shouldn't these become a sed line like the target specific pieces below?

Cheers,

Richard


> diff --git a/meta/recipes-devtools/perl/perl_5.12.2.bb b/meta/recipes-devtools/perl/perl_5.12.2.bb
> index 184e1e7..0a6cf14 100644
> --- a/meta/recipes-devtools/perl/perl_5.12.2.bb
> +++ b/meta/recipes-devtools/perl/perl_5.12.2.bb
> @@ -145,6 +145,16 @@ do_configure() {
>  	       -e 's,/perl5,/perl,g' \
>              config.sh-${TARGET_ARCH}-${TARGET_OS}
>  
> +       case "${TARGET_ARCH}" in                                                                      
> +                x86_64 | powerpc | s390)                                                              
> +                        sed -i -e "s,\(need_va_copy=\)'undef',\1'define',g" \                         
> +                                config.sh-${TARGET_ARCH}-${TARGET_OS}                                 
> +                        ;;                                                                            
> +                arm)                                                                                  
> +                        sed -i -e "s,\(d_u32align=\)'undef',\1'define',g" \                           
> +                                config.sh-${TARGET_ARCH}-${TARGET_OS}                                 
> +                        ;;                                                                            
> +        esac                                                                                          
>          # These are strewn all over the source tree
>          for foo in `grep -I -m1 \/usr\/include\/.*\\.h ${WORKDIR}/* -r | cut -f 1 -d ":"` ; do
>              echo Fixing: $foo




