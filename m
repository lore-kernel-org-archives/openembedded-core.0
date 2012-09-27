Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1THHdK-0004lG-KT for openembedded-core@lists.openembedded.org;
	Thu, 27 Sep 2012 19:12:18 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q8RGxRQM001536;
	Thu, 27 Sep 2012 17:59:27 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 01198-03; Thu, 27 Sep 2012 17:59:23 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q8RGxIiM001530
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=NO);
	Thu, 27 Sep 2012 17:59:19 +0100
Message-ID: <1348765159.11186.11.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: wenzong.fan@windriver.com
Date: Thu, 27 Sep 2012 17:59:19 +0100
In-Reply-To: <ae8afc91a951339570a19ea607c8452037078a73.1348734058.git.wenzong.fan@windriver.com>
References: <cover.1348734058.git.wenzong.fan@windriver.com>
	<ae8afc91a951339570a19ea607c8452037078a73.1348734058.git.wenzong.fan@windriver.com>
X-Mailer: Evolution 3.2.3-0ubuntu6 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Cc: Zhenfeng.Zhao@windriver.com, openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/1] autotools.bbclass: using relative paths for acpaths
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
X-List-Received-Date: Thu, 27 Sep 2012 17:12:18 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2012-09-27 at 16:23 +0800, wenzong.fan@windriver.com wrote:
> From: Wenzong Fan <wenzong.fan@windriver.com>
> 
> Fix autotools.bbclass to use relative paths for acpaths instead of
> absolute ones. Since absolute paths may cause potential autoreconf
> error like:
> 
>     Can't exec "/bin/sh": Argument list too long ...
> 
> This error occurs while building coreutils with long TMPDIR, because
> it has bunch of m4 files need to be expanded.
> 
> [YOCTO #2766]
> 
> Signed-off-by: Wenzong Fan <wenzong.fan@windriver.com>
> ---
>  meta/classes/autotools.bbclass |    3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/meta/classes/autotools.bbclass b/meta/classes/autotools.bbclass
> index e4e034b..874e01d 100644
> --- a/meta/classes/autotools.bbclass
> +++ b/meta/classes/autotools.bbclass
> @@ -130,7 +130,8 @@ autotools_do_configure() {
>  		if [ x"${acpaths}" = xdefault ]; then
>  			acpaths=
>  			for i in `find ${S} -maxdepth 2 -name \*.m4|grep -v 'aclocal.m4'| \
> -				grep -v 'acinclude.m4' | sed -e 's,\(.*/\).*$,\1,'|sort -u`; do
> +				grep -v 'acinclude.m4' | sed -e 's,\(.*/\).*$,\1,'|sort -u| \
> +				sed -e 's,${S},\.,'`; do
>  				acpaths="$acpaths -I $i"
>  			done
>  		else

We applied this but it nearly instantly caused build failure reports.
Anything with multiple configure.ac files where sub configures are used
such as bdwgc-native will fail after this.

I've therefore reverted it and we need to find another way.

Cheers,

Richard



