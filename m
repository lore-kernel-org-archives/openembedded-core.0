Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (dan.rpsys.net [93.97.175.187])
	by mail.openembedded.org (Postfix) with ESMTP id B1F706E82C
	for <openembedded-core@lists.openembedded.org>;
	Mon, 27 Jan 2014 14:51:28 +0000 (UTC)
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu4) with ESMTP id
	s0REpN9V005149; Mon, 27 Jan 2014 14:51:23 GMT
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id o3N50kNFInkb; Mon, 27 Jan 2014 14:51:23 +0000 (GMT)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	s0REpKGk005106
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NOT);
	Mon, 27 Jan 2014 14:51:22 GMT
Message-ID: <1390834275.17424.256.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Martin Jansa <martin.jansa@gmail.com>
Date: Mon, 27 Jan 2014 14:51:15 +0000
In-Reply-To: <981d02338666c368a371adb1bc0a5417b4a39138.1390052619.git.Martin.Jansa@gmail.com>
References: <cover.1390052619.git.Martin.Jansa@gmail.com>
	<981d02338666c368a371adb1bc0a5417b4a39138.1390052619.git.Martin.Jansa@gmail.com>
X-Mailer: Evolution 3.8.4-0ubuntu1 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/2] sstatesig: include native/cross/nativesdk deps in target signatures
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
X-List-Received-Date: Mon, 27 Jan 2014 14:51:30 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Sat, 2014-01-18 at 15:02 +0100, Martin Jansa wrote:
> * I don't have any real evidence or good statistics for this, but when
>   comparing signature dumps from my big bitbake world builds I usually
>   see a lot of rebuilds caused by changes in .bbclasses and only very
>   rare would be the case where oe-core upgrade brings changes in -native
>   recipes and no change in .bbclasses used from target recipes
> * changing the default to include them shouldn't cause significant
>   increase in rebuilds and sstate reuse a bit safer
> * people working on toolchain (e.g. using gcc from AUTOREV) can easily
>   extend sstate_rundepfilter to ignore them again (it's easier than
>   removing existing filter), example how add own signature handler in
>   your layer is here:
>   https://github.com/openwebos/meta-webos/commit/9ac3a7c803e7793b3274e4998f167b6278db8042
> 
> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> ---
>  meta/lib/oe/sstatesig.py | 4 ----
>  1 file changed, 4 deletions(-)

Whilst I merged this, we do have a problem here. This change means that
the sstate is locked to the build system architecture.

For example, if you have a 32 bit machine, it can't use any of the
sstate built on a 64 bit machine and vice versa.

I'm not sure what we do about this but its a problem...

Cheers,

Richard

> diff --git a/meta/lib/oe/sstatesig.py b/meta/lib/oe/sstatesig.py
> index 3011f16..8b0e344 100644
> --- a/meta/lib/oe/sstatesig.py
> +++ b/meta/lib/oe/sstatesig.py
> @@ -36,10 +36,6 @@ def sstate_rundepfilter(siggen, fn, recipename, task, dep, depname, dataCache):
>      if isPackageGroup(fn):
>          return False  
>  
> -    # Drop native/cross/nativesdk dependencies from target recipes
> -    if isNative(depname) or isCross(depname) or isNativeSDK(depname):
> -        return False
> -
>      # Exclude well defined machine specific configurations which don't change ABI
>      if depname in siggen.abisaferecipes and not isImage(fn):
>          return False



