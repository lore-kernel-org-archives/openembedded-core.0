Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (dan.rpsys.net [93.97.175.187])
	by mail.openembedded.org (Postfix) with ESMTP id 5651D6077F
	for <openembedded-core@lists.openembedded.org>;
	Mon,  6 Jan 2014 12:25:53 +0000 (UTC)
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	s06CPlrY018318; Mon, 6 Jan 2014 12:25:48 GMT
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id u-Y82N8oyykO; Mon,  6 Jan 2014 12:25:47 +0000 (GMT)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	s06CPdcQ018300
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NOT);
	Mon, 6 Jan 2014 12:25:41 GMT
Message-ID: <1389011136.22784.7.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Ming Liu <ming.liu@windriver.com>
Date: Mon, 06 Jan 2014 12:25:36 +0000
In-Reply-To: <1384426288-3534-1-git-send-email-ming.liu@windriver.com>
References: <1384426288-3534-1-git-send-email-ming.liu@windriver.com>
X-Mailer: Evolution 3.8.4-0ubuntu1 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] sstate: Add optimizing logic for crosssdk setscene dependencies
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
X-List-Received-Date: Mon, 06 Jan 2014 12:25:54 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2013-11-14 at 18:51 +0800, Ming Liu wrote:
> This patch mainly aims to add optimisation for crosssdk setscene dependency
> validating which we haven't handled in current logic, and which I think we
> could have as we've already implemented to native/cross, although there
> are albeit not many crossdk tasks, we could still get some performance
> enhancement.
> 
> And it also fix a vulnerability of some certain workflow, think about the
> following scenario with current logic:
>     bitbake nativesdk-eglibc-initial -c cleansstate
>     bitbake gcc-crosssdk-initial -c clean
>     bitbake gmp-native -c clean
>     bitbake libmpc-native -c clean
>     bitbake mpfr-native -c clean
>     bitbake gcc-crosssdk-initial
>     bitbake nativesdk-eglibc-initial
> 
> Aboving will fail for absence of a few native libraries required by
> gcc-crosssdk-initial.
> 
> Also modified some places in current code except the optimisation, as
> following:
> 1 Remove isNative function since no code is referring it.
> 2 Add do_package to the list that don't exist and are noexec.

I've split this patch up as its doing too many things at once. In
particular, I think we should keep the "isNativeCross()" function name
instead of adding Crosssdk to the name since it just makes things more
confusing to read.

I've take a part for the crosssdk part in master-next which is being
tested at the moment, can you resent the do_package part by itself
please?

I don't quite understand how the sequence of commands above breaks
things or how this patch fixes it. Are you sure this wasn't fixed by:

http://git.yoctoproject.org/cgit.cgi/poky-contrib/commit/?h=ciorga/PUs&id=1dcbf3096d7d42032faade96dae89c25a4feca7a

which would be the real bug?

Cheers,

Richard


