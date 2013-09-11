Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (dan.rpsys.net [93.97.175.187])
	by mail.openembedded.org (Postfix) with ESMTP id 248926BEC0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 Sep 2013 08:40:15 +0000 (UTC)
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r8B8rsKA024002; Wed, 11 Sep 2013 09:53:54 +0100
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id yquJKr-EccGB; Wed, 11 Sep 2013 09:53:54 +0100 (BST)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r8B8rn1Y023987
	(version=TLSv1/SSLv3 cipher=DHE-RSA-CAMELLIA256-SHA bits=256
	verify=NOT); Wed, 11 Sep 2013 09:53:51 +0100
Message-ID: <1378888802.3484.170.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: rongqing.li@windriver.com
Date: Wed, 11 Sep 2013 09:40:02 +0100
In-Reply-To: <934e6208f68c0801666853fc81c3f67b39c368cb.1378884764.git.rongqing.li@windriver.com>
References: <cover.1378884764.git.rongqing.li@windriver.com>
	<934e6208f68c0801666853fc81c3f67b39c368cb.1378884764.git.rongqing.li@windriver.com>
X-Mailer: Evolution 3.6.4-0ubuntu1 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/1] ptest-runner: trivial fixes and refine
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
X-List-Received-Date: Wed, 11 Sep 2013 08:40:16 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2013-09-11 at 15:34 +0800, rongqing.li@windriver.com wrote:
> From: Roy Li <rongqing.li@windriver.com>
> 
> 1. ptest files may be installed under /usr/lib64/ for 64bit filesystem
> or under /usr/lib/ for 64bit multilib filesystem, so we should check both
> directories
> 
> 2. If a soft link is linking to a directory under the same directory, we
> only run once.
> 
> [YOCTO #5125]
> [YOCTO #5126]
> 
> Signed-off-by: Roy Li <rongqing.li@windriver.com>
> ---
>  .../ptest-runner/files/ptest-runner                |   30 +++++++++++++++-----
>  1 file changed, 23 insertions(+), 7 deletions(-)
> 
> diff --git a/meta/recipes-support/ptest-runner/files/ptest-runner b/meta/recipes-support/ptest-runner/files/ptest-runner
> index 4f3c7ce..724e066 100644
> --- a/meta/recipes-support/ptest-runner/files/ptest-runner
> +++ b/meta/recipes-support/ptest-runner/files/ptest-runner
> @@ -1,16 +1,32 @@
>  #!/bin/sh
>  
>  echo "START: $0"
> -cd /usr/lib
> -for x in *
> +
> +for libdir in /usr/lib/ /usr/lib64/


We shouldn't hard code this. To keep things simple, I think you need to
search /usr/lib*...

Cheers,

Richard

>  do
> -    if [ -x "/usr/lib/$x/ptest/run-ptest" ]; then
> -       date "+%Y-%m-%dT%H:%M"
> +
> +    [ ! -d "$libdir" ] && continue
> +
> +    cd "$libdir"
> +    for x in `find -L ./ -name run-ptest -type f -perm /u+x,g+x`
> +    do
> +        # test if a dir is linking to one that they are under same directory
> +        # like perl5-->perl
> +        ptestdir=`dirname $x|cut -f2 -d"/"`
> +        if [ -h "$ptestdir" ]; then
> +            linkdir=`readlink -f "$ptestdir"`
> +            if [ `dirname "$linkdir"`"/" = "$libdir" ]; then
> +                continue
> +            fi
> +        fi
> +    
> +        date "+%Y-%m-%dT%H:%M"
>          echo "BEGIN: $x"
> -        cd /usr/lib/$x/ptest
> +        pushd `dirname "$x"`
>          ./run-ptest
> +        popd
>          echo "END: $x"
> -       date "+%Y-%m-%dT%H:%M"
> -    fi
> +        date "+%Y-%m-%dT%H:%M"
> +    done
>  done
>  echo "STOP: $0"



