Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1QEjRl-0004Uj-Sc
	for openembedded-core@lists.openembedded.org;
	Tue, 26 Apr 2011 16:41:02 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 26 Apr 2011 07:38:31 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.64,268,1301900400"; d="scan'208";a="425713879"
Received: from unknown (HELO [10.255.12.231]) ([10.255.12.231])
	by azsmga001.ch.intel.com with ESMTP; 26 Apr 2011 07:38:30 -0700
Message-ID: <4DB6D8E6.90706@linux.intel.com>
Date: Tue, 26 Apr 2011 07:38:30 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.1.10) Gecko/20100621 Fedora/3.0.5-1.fc13 Lightning/1.0b2pre
	Thunderbird/3.0.5
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
References: <cover.1303757256.git.raj.khem@gmail.com>
	<e5c0091a01641a3a2b55321cf5b4a5a9e91ef8e5.1303757256.git.raj.khem@gmail.com>
In-Reply-To: <e5c0091a01641a3a2b55321cf5b4a5a9e91ef8e5.1303757256.git.raj.khem@gmail.com>
Subject: Re: [PATCH 13/17] perl_5.12.2.bb: Undefine features not found	in uclibc
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
X-List-Received-Date: Tue, 26 Apr 2011 14:41:02 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 04/25/2011 11:55 AM, Khem Raj wrote:
> Signed-off-by: Khem Raj<raj.khem@gmail.com>
> ---
>   .../perl/perl-5.12.2/native-ssp.patch              |   16 ----------------
>   meta/recipes-devtools/perl/perl_5.12.2.bb          |   16 ++++++++++++++++
>   2 files changed, 16 insertions(+), 16 deletions(-)
>   delete mode 100644 meta/recipes-devtools/perl/perl-5.12.2/native-ssp.patch
>
Khem, Nitin:

With perl being updated to 5.12.3 at this point, can you confirm this 
patch removal is still correct

Sau!

> diff --git a/meta/recipes-devtools/perl/perl-5.12.2/native-ssp.patch b/meta/recipes-devtools/perl/perl-5.12.2/native-ssp.patch
> deleted file mode 100644
> index e1e6f08..0000000
> --- a/meta/recipes-devtools/perl/perl-5.12.2/native-ssp.patch
> +++ /dev/null
> @@ -1,16 +0,0 @@
> -Upstream-Status:Inappropriate [embedded specific]
> -
> -Fix for compiling with ssp enabled gcc:
> -See http://bugs.openembedded.net/show_bug.cgi?id=1980
> -
> -diff -Naur perl-5.8.7.orig/cflags.SH perl-5.8.7/cflags.SH
> ---- perl-5.8.7.orig/cflags.SH	2002-09-30 10:59:07.000000000 +0000
> -+++ perl-5.8.7/cflags.SH	2005-10-02 04:08:39.000000000 +0000
> -@@ -165,6 +165,8 @@
> - esac
> -
> -     : Can we perhaps use $ansi2knr here
> -+    [[ $file == regcomp ]]&&  export ccflags="${ccflags} -fno-stack-protector"
> -+    [[ $file == regexec ]]&&  export ccflags="${ccflags} -fno-stack-protector"
> -     echo "$cc -c -DPERL_CORE $ccflags $optimize $warn"
> -     eval "$also "'"$cc -DPERL_CORE -c $ccflags $optimize $warn"'
> diff --git a/meta/recipes-devtools/perl/perl_5.12.2.bb b/meta/recipes-devtools/perl/perl_5.12.2.bb
> index 9ce8156..b841e7d 100644
> --- a/meta/recipes-devtools/perl/perl_5.12.2.bb
> +++ b/meta/recipes-devtools/perl/perl_5.12.2.bb
> @@ -131,6 +131,12 @@ do_configure() {
>                          -e "s,\(getnetent_r_proto=\)'\w+',\1'0',g" \
>                          -e "s,\(d_sockatmark=\)'define',\1'undef',g" \
>                          -e "s,\(d_sockatmarkproto=\)'\w+',\1'0',g" \
> +                       -e "s,\(d_eaccess=\)'define',\1'undef',g" \
> +                       -e "s,\(d_stdio_ptr_lval=\)'define',\1'undef',g" \
> +                       -e "s,\(d_stdio_ptr_lval_sets_cnt=\)'define',\1'undef',g" \
> +                       -e "s,\(d_stdiobase=\)'define',\1'undef',g" \
> +                       -e "s,\(d_stdstdio=\)'define',\1'undef',g" \
> +                       -e "s,-fstack-protector,-fno-stack-protector,g" \
>                       config.sh-${TARGET_ARCH}-${TARGET_OS}
>           fi
>
> @@ -145,6 +151,16 @@ do_configure() {
>   	       -e 's,/perl5,/perl,g' \
>               config.sh-${TARGET_ARCH}-${TARGET_OS}
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
>           # These are strewn all over the source tree
>           for foo in `grep -I -m1 \/usr\/include\/.*\\.h ${WORKDIR}/* -r | cut -f 1 -d ":"` ; do
>               echo Fixing: $foo


