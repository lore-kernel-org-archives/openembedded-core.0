Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (dan.rpsys.net [93.97.175.187])
	by mail.openembedded.org (Postfix) with ESMTP id E9E9B610F6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 24 Jan 2014 13:43:54 +0000 (UTC)
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu4) with ESMTP id
	s0ODhAS7019385; Fri, 24 Jan 2014 13:43:50 GMT
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id qzUCM-CFVLl9; Fri, 24 Jan 2014 13:43:49 +0000 (GMT)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	s0ODhiNE019406
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NOT);
	Fri, 24 Jan 2014 13:43:46 GMT
Message-ID: <1390571019.17424.173.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Robert Yang <liezhi.yang@windriver.com>
Date: Fri, 24 Jan 2014 13:43:39 +0000
In-Reply-To: <0fbf5062299128b4b654de870a54f22a7cf8633a.1390220655.git.liezhi.yang@windriver.com>
References: <cover.1390220655.git.liezhi.yang@windriver.com>
	<0fbf5062299128b4b654de870a54f22a7cf8633a.1390220655.git.liezhi.yang@windriver.com>
X-Mailer: Evolution 3.8.4-0ubuntu1 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/1] e2fsprogs/populate-extfs.sh: fix a problem on dash
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
X-List-Received-Date: Fri, 24 Jan 2014 13:43:57 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2014-01-20 at 20:24 +0800, Robert Yang wrote:
> The dash can't handle the or [[ in parameter expansion, for example:
> 
> A=/usr/bin/[[
> B=[[
> C="${A%$B}"
> 
> The C should be "/usr/bin" in common, but it will be /usr/bin/[[ on
> dash, use dirname to fix it.
> 
> NOTE:
> There are 3 lines about parameter expansion, only fix the
> DIR="${DIR%$TGT}" since the other 2 works will and are very useful in
> this case.
> 
> [YOCTO #5712]
> 
> Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
> ---
>  meta/recipes-devtools/e2fsprogs/e2fsprogs/populate-extfs.sh | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

I'm afraid I had to revert this as it caused other build failures:

http://autobuilder.yoctoproject.org/main/builders/build-appliance/builds/18/steps/BuildImages_1/logs/stdio

Can you look into why that happened and resent the patch please?

Cheers,

Richard

> diff --git a/meta/recipes-devtools/e2fsprogs/e2fsprogs/populate-extfs.sh b/meta/recipes-devtools/e2fsprogs/e2fsprogs/populate-extfs.sh
> index 7de720b..9b55a4b 100644
> --- a/meta/recipes-devtools/e2fsprogs/e2fsprogs/populate-extfs.sh
> +++ b/meta/recipes-devtools/e2fsprogs/e2fsprogs/populate-extfs.sh
> @@ -23,7 +23,7 @@ DEBUGFS="debugfs"
>  	find $SRCDIR | while read FILE; do
>                  TGT="${FILE##*/}"
>                  DIR="${FILE#$SRCDIR}"
> -                DIR="${DIR%$TGT}"
> +                DIR="$(dirname $DIR)"
>  
>  		# Skip the root dir
>  		[ ! -z "$DIR" ] || continue



