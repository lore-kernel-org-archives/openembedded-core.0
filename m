Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (dan.rpsys.net [93.97.175.187])
	by mail.openembedded.org (Postfix) with ESMTP id 1433A6A5B4
	for <openembedded-core@lists.openembedded.org>;
	Thu, 13 Jun 2013 15:00:37 +0000 (UTC)
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r5DF6DQ4009993; Thu, 13 Jun 2013 16:06:14 +0100
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id NoPw_sx2AePm; Thu, 13 Jun 2013 16:06:13 +0100 (BST)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r5DF6BR7009989
	(version=TLSv1/SSLv3 cipher=DHE-RSA-CAMELLIA256-SHA bits=256
	verify=NOT); Thu, 13 Jun 2013 16:06:12 +0100
Message-ID: <1371135625.20823.59.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Mike Crowe <mac@mcrowe.com>
Date: Thu, 13 Jun 2013 16:00:25 +0100
In-Reply-To: <1371132404-27250-1-git-send-email-mac@mcrowe.com>
References: <20130521084102.GA31419@mcrowe.com>
	<1371132404-27250-1-git-send-email-mac@mcrowe.com>
X-Mailer: Evolution 3.6.4-0ubuntu1 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] sstate.bbclass: binutils-cross is not a safe dependency
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
X-List-Received-Date: Thu, 13 Jun 2013 15:00:38 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2013-06-13 at 15:06 +0100, Mike Crowe wrote:
> gcc always needs binutils in order to be useful. If binutils-cross is
> considered to be a safe dependency then gcc-cross can be reconstructed into
> the sysroot without binutils. Anyone who tries to use the compiler will end
> up using the system binutils which is either a bad thing (relying on system
> tools) or a very bad thing (it will be for the wrong architecture.)
> 
> In the absence of a better fix let's just stop binutils-cross being
> considered a safe dependency. The downside of this is that any
> reconstructing any other recipe that depends on binutils from the sstate
> cache will also cause binutils to be reconstructed.
> 
> Signed-off-by: Mike Crowe <mac@mcrowe.com>
> ---
>  meta/classes/sstate.bbclass |    2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> I tried and failed to come up with a better fix for this problem. This
> fix at least means that everything will build using the correct
> version of binutils even if slightly more files are reconstructed from
> the sstate cache than would be desirable.

The correct fix for this is to whitelist the gcc depending on binutils
case but leave this "safe" version in place.

Cheers,

Richard


> 
> diff --git a/meta/classes/sstate.bbclass b/meta/classes/sstate.bbclass
> index 28dc312..0de62d8 100644
> --- a/meta/classes/sstate.bbclass
> +++ b/meta/classes/sstate.bbclass
> @@ -655,7 +655,7 @@ def setscene_depvalid(task, taskdependees, notneeded, d):
>      def isNativeCross(x):
>          return x.endswith("-native") or x.endswith("-cross") or x.endswith("-cross-initial")
>      def isSafeDep(x):
> -        if x in ["quilt-native", "autoconf-native", "automake-native", "gnu-config-native", "libtool-native", "pkgconfig-native", "gcc-cross", "binutils-cross", "gcc-cross-initial"]:
> +        if x in ["quilt-native", "autoconf-native", "automake-native", "gnu-config-native", "libtool-native", "pkgconfig-native", "gcc-cross", "gcc-cross-initial"]:
>              return True
>          return False
>      def isPostInstDep(x):



