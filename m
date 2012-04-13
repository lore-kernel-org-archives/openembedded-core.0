Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1SIiaZ-00040T-Nv for openembedded-core@lists.openembedded.org;
	Fri, 13 Apr 2012 17:39:07 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q3DFTg0c004407;
	Fri, 13 Apr 2012 16:29:42 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 03662-09; Fri, 13 Apr 2012 16:29:38 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q3DFTYjY004400
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Fri, 13 Apr 2012 16:29:36 +0100
Date: Fri, 13 Apr 2012 16:29:36 +0100
From: richard.purdie@linuxfoundation.org
Message-ID: <1334330976.7309.77.camel@ted>
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [PATCH] perl: fix re-execution of task
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
X-List-Received-Date: Fri, 13 Apr 2012 15:39:07 -0000

> ---
 a/meta/recipes-devtools/perl/perl_5.14.2.bb
> +++
 b/meta/recipes-devtools/perl/perl_5.14.2.bb
> @@ -164,8 +164,12 @@
 do_configure() {
>  	esac
>          # These are strewn all over the source
 tree
>          for foo in `grep -I -m1 \/usr\/include\/.*\\.h ${WORKDIR}/*
 -r | cut -f 1 -d ":"` ; do
> -            echo Fixing: $foo
> -           
 sed -e "s%/usr/include/%${STAGING_INCDIR}/%g" -i $foo
> +		# D2194:Fixing
 the issue "patch file link is replaced with modified file"
> +		# Ignore if
 file is a link, as actual file will also get caught during grep 
> +		if [
 ! -h $foo ]; then
> +			echo Fixing: $foo
> +			sed -e
 "s%/usr/include/%${STAGING_INCDIR}/%g" -i $foo
> +	    	fi
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Venkata ramana gollamudi <ramana.gollamudi@huawei.com>
Cc: "'openembedded-core@lists.openembedded.org'"
 <openembedded-core@lists.openembedded.org>, Sanil kumar
 <sanil.kumar@huawei.com>
Date: Fri, 13 Apr 2012 16:29:36 +0100
In-Reply-To: <36ED13F3654AE54CA763E6821D93A5711043A0F7@szxeml534-mbs.china.huawei.com>
References: 
	<36ED13F3654AE54CA763E6821D93A5711043A0F7@szxeml534-mbs.china.huawei.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.2.2- 
Content-Transfer-Encoding: 7bit
Mime-Version: 1.0

On Fri, 2012-04-13 at 11:46 +0000, Venkata ramana gollamudi wrote:
> perl package do_configure is changing "/perl-5.14.2/patches/h2ph-multiarch.diff"
>  from link to normal file in the process of correcting the paths.
> So when patch task is re-executed after complete package building, giving error.
> 
> This path correction is not required for links as the link target file
>  will be also be modified individually.
> Fix done to ignore the path correction during do_configure,
>  if file is a link.
> 
> [Yocto #2194]
> 
> Signed-off-by: Venkata Ramana Gollamudi <ramana.gollamudi@huawei.com>
> ---
>  meta/recipes-devtools/perl/perl_5.14.2.bb |    8 ++++++--
>  1 files changed, 6 insertions(+), 2 deletions(-)
> 
> diff --git a/meta/recipes-devtools/perl/perl_5.14.2.bb b/meta/recipes-devtools/perl/perl_5.14.2.bb
> index 92ca9b8..414aa22 100644
> --- a/meta/recipes-devtools/perl/perl_5.14.2.bb
> +++ b/meta/recipes-devtools/perl/perl_5.14.2.bb
> @@ -164,8 +164,12 @@ do_configure() {
>  	esac
>          # These are strewn all over the source tree
>          for foo in `grep -I -m1 \/usr\/include\/.*\\.h ${WORKDIR}/* -r | cut -f 1 -d ":"` ; do
> -            echo Fixing: $foo
> -            sed -e "s%/usr/include/%${STAGING_INCDIR}/%g" -i $foo
> +		# D2194:Fixing the issue "patch file link is replaced with modified file"
> +		# Ignore if file is a link, as actual file will also get caught during grep 
> +		if [ ! -h $foo ]; then
> +			echo Fixing: $foo
> +			sed -e "s%/usr/include/%${STAGING_INCDIR}/%g" -i $foo
> +	    	fi
>          done
>  
>          rm -f config

I think its a bad idea to assume patches are symlinks. Could we add
something like --exclude=patches to the grep command?

Secondly, the above will still cause problems if ${STAGING_INCDIR}
contains /usr/include which it usually will, for example if:

STAGING_INCDIR=/foo/usr/include

then you can end up with:

/foo/foo/foo/foo/usr/include

after a few runs. This fix therefore still needs some work.

Cheers,

Richard







