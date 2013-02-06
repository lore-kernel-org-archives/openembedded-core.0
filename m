Received: from atl4mhfb03.myregisteredsite.com ([209.17.115.61])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mike.looijmans@topic.nl>) id 1U35Xz-0000OX-NH
	for openembedded-core@lists.openembedded.org;
	Wed, 06 Feb 2013 15:00:24 +0100
Received: from atl4mhob13.myregisteredsite.com
	(atl4mhob13.myregisteredsite.com [209.17.115.51])
	by atl4mhfb03.myregisteredsite.com (8.14.4/8.14.4) with ESMTP id
	r16DiXDd003452 for <openembedded-core@lists.openembedded.org>;
	Wed, 6 Feb 2013 08:44:34 -0500
Received: from mailpod.hostingplatform.com (mail.networksolutionsemail.com
	[205.178.146.50])
	by atl4mhob13.myregisteredsite.com (8.14.4/8.14.4) with ESMTP id
	r16DiWfv011806 for <openembedded-core@lists.openembedded.org>;
	Wed, 6 Feb 2013 08:44:32 -0500
Received: (qmail 10410 invoked by uid 0); 6 Feb 2013 13:44:30 -0000
Received: from unknown (HELO ?192.168.80.45?)
	(mike@milosoftware.com@88.159.208.100)
	by 0 with ESMTPA; 6 Feb 2013 13:44:30 -0000
Message-ID: <51125E3D.20602@topic.nl>
Date: Wed, 06 Feb 2013 14:44:29 +0100
From: Mike Looijmans <mike.looijmans@topic.nl>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/17.0 Thunderbird/17.0
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
References: <1359984404.14071.160.camel@ted>
	<1360157209-19641-1-git-send-email-Martin.Jansa@gmail.com>
In-Reply-To: <1360157209-19641-1-git-send-email-Martin.Jansa@gmail.com>
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
X-List-Received-Date: Wed, 06 Feb 2013 14:00:24 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

(see comment below)

On 02/06/2013 02:26 PM, Martin Jansa wrote:
> * as described in
>    http://git.openembedded.org/openembedded-core/commit/?id=6107ee294afde395e39d084c33e8e94013c625a9
>
> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> ---
>   meta/classes/rm_work.bbclass | 18 ++++++++++++------
>   1 file changed, 12 insertions(+), 6 deletions(-)
>
> diff --git a/meta/classes/rm_work.bbclass b/meta/classes/rm_work.bbclass
> index 997dcd1..5aa5f24 100644
> --- a/meta/classes/rm_work.bbclass
> +++ b/meta/classes/rm_work.bbclass
> @@ -17,15 +17,12 @@ do_rm_work () {
>       cd ${WORKDIR}
>       for dir in *
>       do
> -        if [ `basename ${S}` = $dir ]; then
> -            rm -rf $dir
> -        # The package and packages-split directories are retained by sstate for
> -        # do_package so we retain them here too. Anything in sstate 'plaindirs'
> -        # should be retained. Also retain logs and other files in temp.
> -        elif [ $dir != 'temp' ] && [ $dir != 'package' ]  && [ $dir != 'packages-split' ]; then
> +        # Retain only logs and other files in temp.
> +        if [ $dir != 'temp' ]; then
>               rm -rf $dir
>           fi
>       done
> +
>       # Need to add pseudo back or subsqeuent work in this workdir
>       # might fail since setscene may not rerun to recreate it
>       mkdir ${WORKDIR}/pseudo/
> @@ -54,6 +51,15 @@ do_rm_work () {
>                   i=dummy
>                   break
>                   ;;
> +            # We remove do_package entirely, including any
> +            # sstate version since otherwise we'd need to leave 'plaindirs' around
> +            # such as 'packages' and 'packages-split' and these can be large. No end
> +            # of chain tasks depend directly on do_package anymore.
> +            *do_package|*do_package_setscene)
> +                i=dummy
> +                rm -f $i;

Hmm, I think you intended "rm -f $dir" here? This would only remove a 
file named "dummy".

> +                break
> +                ;;
>               *_setscene*)
>                   i=dummy
>                   break
>

Mike.


