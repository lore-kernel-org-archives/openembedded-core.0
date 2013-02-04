Received: from dan.rpsys.net ([93.97.175.187])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1U2MJr-0001xS-8p for openembedded-core@lists.openembedded.org;
	Mon, 04 Feb 2013 14:42:52 +0100
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r14DW5XS006094; Mon, 4 Feb 2013 13:32:05 GMT
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id mbXlp6bu4Y67; Mon,  4 Feb 2013 13:32:05 +0000 (GMT)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r14DVx1w006070
	(version=TLSv1/SSLv3 cipher=DHE-RSA-CAMELLIA256-SHA bits=256
	verify=NOT); Mon, 4 Feb 2013 13:32:02 GMT
Message-ID: <1359984404.14071.160.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Martin Jansa <martin.jansa@gmail.com>
Date: Mon, 04 Feb 2013 13:26:44 +0000
In-Reply-To: <1359741581-16500-1-git-send-email-Martin.Jansa@gmail.com>
References: <1359741581-16500-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: Evolution 3.6.2-0ubuntu0.1 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] rm_work: remove package and packages-split dirs
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
X-List-Received-Date: Mon, 04 Feb 2013 13:42:57 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2013-02-01 at 18:59 +0100, Martin Jansa wrote:
> * as described in
>   http://git.openembedded.org/openembedded-core/commit/?id=6107ee294afde395e39d084c33e8e94013c625a9
> 
> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> ---
>  meta/classes/rm_work.bbclass | 13 +++++++++----
>  1 file changed, 9 insertions(+), 4 deletions(-)
> 
> diff --git a/meta/classes/rm_work.bbclass b/meta/classes/rm_work.bbclass
> index 997dcd1..24d0679 100644
> --- a/meta/classes/rm_work.bbclass
> +++ b/meta/classes/rm_work.bbclass
> @@ -19,13 +19,13 @@ do_rm_work () {
>      do
>          if [ `basename ${S}` = $dir ]; then
>              rm -rf $dir
> -        # The package and packages-split directories are retained by sstate for 
> -        # do_package so we retain them here too. Anything in sstate 'plaindirs' 
> -        # should be retained. Also retain logs and other files in temp.
> -        elif [ $dir != 'temp' ] && [ $dir != 'package' ]  && [ $dir != 'packages-split' ]; then
> +        # Anything in sstate 'plaindirs' should be retained. 
> +        # Also retain logs and other files in temp.
> +        elif [ $dir != 'temp' ]; then
>              rm -rf $dir
>          fi

The first part of the comment is wrong and we might as well drop the if
[ `basename ${S}` = $dir ]; too? 

>      done
> +
>      # Need to add pseudo back or subsqeuent work in this workdir
>      # might fail since setscene may not rerun to recreate it
>      mkdir ${WORKDIR}/pseudo/
> @@ -54,6 +54,11 @@ do_rm_work () {
>                  i=dummy
>                  break
>                  ;;

I'd put a comment in here: "We remove do_package entirely, including any
sstate version since otherwise we'd need to leave 'plaindirs' around
such as 'packages' and 'packages-split' and these can be large. No enf
of chain tasks depend directly on do_package anymore.". 

> +            *do_package|*do_package_setscene)
> +                i=dummy
> +                rm -f $i;
> +                break
> +                ;;
>              *_setscene*)
>                  i=dummy
>                  break

Otherwise looks good, this is simpler than I'd expected which is nice :)

Cheers,

Richard



