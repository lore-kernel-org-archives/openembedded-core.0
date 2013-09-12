Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (dan.rpsys.net [93.97.175.187])
	by mail.openembedded.org (Postfix) with ESMTP id 05CCC60130
	for <openembedded-core@lists.openembedded.org>;
	Thu, 12 Sep 2013 15:39:59 +0000 (UTC)
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r8CFrZjo017718; Thu, 12 Sep 2013 16:53:35 +0100
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id jq8GM19WYpUI; Thu, 12 Sep 2013 16:53:35 +0100 (BST)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r8CFrRvC017694
	(version=TLSv1/SSLv3 cipher=DHE-RSA-CAMELLIA256-SHA bits=256
	verify=NOT); Thu, 12 Sep 2013 16:53:29 +0100
Message-ID: <1379000373.3484.225.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: rongqing.li@windriver.com, "saul.wold" <saul.wold@intel.com>
Date: Thu, 12 Sep 2013 16:39:33 +0100
In-Reply-To: <02e6f25c210b0628dc4ee4482474b0e6ce5606e4.1376379182.git.rongqing.li@windriver.com>
References: <cover.1376379182.git.rongqing.li@windriver.com>
	<02e6f25c210b0628dc4ee4482474b0e6ce5606e4.1376379182.git.rongqing.li@windriver.com>
X-Mailer: Evolution 3.6.4-0ubuntu1 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/1] sstate.bbclass: fix parallel building issue
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
X-List-Received-Date: Thu, 12 Sep 2013 15:40:01 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2013-08-13 at 16:20 +0800, rongqing.li@windriver.com wrote:
> From: "Roy.Li" <rongqing.li@windriver.com>
> 
> sstate_package creates hardlink from sysroot to SSTATE_BUILDDIR, then
> sstate_create_package will store SSTATE_BUILDDIR into a archive file by
> tar, but once other packages install the same file into sysroot, the
> creating the archive file will fail with below error:
> 
>     DEBUG: Executing shell function sstate_create_package
>     tar: x86_64-linux/usr/share/aclocal/xorg-macros.m4: file changed as we read it
> 
> This kind of error is harmless, use --ignore-failed-read to ignore it.
> 
> Signed-off-by: Roy.Li <rongqing.li@windriver.com>


I've dug into this issue a bit and having looked a the code in tar for
this warning, I believe this is the right fix.

Throughout the system we now hardlink files together and the timestamps
of the files can change when the number of hardlinks is changed so its
possible to race against various parts of the system. The aclocal-copy
is the most frequently used so we hit it there easiest.

So I'm now in favour of taking this patch. We could improve aclocal but
that is really a separate issue.

Cheers,

Richard

> ---
>  meta/classes/sstate.bbclass |    2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/meta/classes/sstate.bbclass b/meta/classes/sstate.bbclass
> index c1ca54b..3e2fedd 100644
> --- a/meta/classes/sstate.bbclass
> +++ b/meta/classes/sstate.bbclass
> @@ -565,7 +565,7 @@ sstate_create_package () {
>  	TFILE=`mktemp ${SSTATE_PKG}.XXXXXXXX`
>  	# Need to handle empty directories
>  	if [ "$(ls -A)" ]; then
> -		tar -czf $TFILE *
> +		tar --ignore-failed-read -czf $TFILE *
>  	else
>  		tar -cz --file=$TFILE --files-from=/dev/null
>  	fi



