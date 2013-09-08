Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (dan.rpsys.net [93.97.175.187])
	by mail.openembedded.org (Postfix) with ESMTP id 061C56156F
	for <openembedded-core@lists.openembedded.org>;
	Sun,  8 Sep 2013 23:03:56 +0000 (UTC)
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r88NHMnu019936; Mon, 9 Sep 2013 00:17:22 +0100
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id 2zwawRFlEHIH; Mon,  9 Sep 2013 00:17:21 +0100 (BST)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r88NHIDt019932
	(version=TLSv1/SSLv3 cipher=DHE-RSA-CAMELLIA256-SHA bits=256
	verify=NOT); Mon, 9 Sep 2013 00:17:19 +0100
Message-ID: <1378681423.3484.101.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Martin Jansa <martin.jansa@gmail.com>
Date: Mon, 09 Sep 2013 00:03:43 +0100
In-Reply-To: <1378652471-27278-1-git-send-email-Martin.Jansa@gmail.com>
References: <1378652471-27278-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: Evolution 3.6.4-0ubuntu1 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] package.bbclass: Call os.chmod after os.mkdir
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
X-List-Received-Date: Sun, 08 Sep 2013 23:03:57 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Sun, 2013-09-08 at 17:01 +0200, Martin Jansa wrote:
> * in 556dee0c4d6d8a87c0cddbd2f60fe5917d009f18 os.chmod was replaced by 2nd param
>   to os.mkdir:
>   -      bb.utils.mkdirhier(dest)
>   -      fstat = os.stat(src)
>   -      os.chmod(dest, fstat.st_mode)
>   +      fstat = cpath.stat(src)
>   +      os.mkdir(dest, fstat.st_mode)
> 
>   but fstat in os.mkdir, doesn't work the same as good old os.chmod:
>   >>> p='test-p'
>   >>> os.mkdir(p, 041777)
>   >>> oct(os.stat(p).st_mode)
>   '041775'
>   >>> os.chmod(p, 041777)
>   >>> oct(os.stat(p).st_mode)
>   '041777'
> 
> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> ---
>  meta/classes/package.bbclass | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/meta/classes/package.bbclass b/meta/classes/package.bbclass
> index bdac2bd..c96acd2 100644
> --- a/meta/classes/package.bbclass
> +++ b/meta/classes/package.bbclass
> @@ -988,8 +988,9 @@ python populate_packages () {
>              def mkdir(src, dest, p):
>                  src = os.path.join(src, p)
>                  dest = os.path.join(dest, p)
> +                bb.utils.mkdirhier(dest)
>                  fstat = cpath.stat(src)
> -                os.mkdir(dest, fstat.st_mode)
> +                os.chmod(dest, fstat.st_mode)
>                  os.chown(dest, fstat.st_uid, fstat.st_gid)
>                  if p not in seen:
>                      seen.append(p)

Can we set and then restore the umask to avoid having to do this? I ask
since from what I remember, changing things like this is quite expensive
performance wise :(

Cheers,

Richard



