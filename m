Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1RW4ID-00016z-I9 for openembedded-core@lists.openembedded.org;
	Thu, 01 Dec 2011 11:55:06 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id pB1AmOUp013437
	for <openembedded-core@lists.openembedded.org>;
	Thu, 1 Dec 2011 10:48:24 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 12698-08 for <openembedded-core@lists.openembedded.org>;
	Thu,  1 Dec 2011 10:48:19 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id pB1AmGfX013431
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 1 Dec 2011 10:48:17 GMT
Message-ID: <1322736506.17484.104.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Thu, 01 Dec 2011 10:48:26 +0000
In-Reply-To: <7c75cf6a7d4a3c102f1f44eca16eb5c43c530391.1322731182.git.dexuan.cui@intel.com>
References: <cover.1322731182.git.dexuan.cui@intel.com>
	<7c75cf6a7d4a3c102f1f44eca16eb5c43c530391.1322731182.git.dexuan.cui@intel.com>
X-Mailer: Evolution 3.2.1- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [PATCH 3/3] runqemu-ifup, runqemu-internal: be wiser when locating the network tools
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 01 Dec 2011 10:55:06 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2011-12-01 at 17:21 +0800, Dexuan Cui wrote:
> When working on the self-hosted-image work, I found the PATH variable in the
> Level-1 target doesn't have /sbin and /usr/sbin, so "runqemu" can't
> run properly since the tools are installeld at
> /sbin/ifconfig
> /sbin/route
> /usr/sbin/iptables
> 
> The patch is used to fix the issue by setting a temp PATH when running which.
> 
> Signed-off-by: Dexuan Cui <dexuan.cui@intel.com>
> ---
>  scripts/runqemu-ifup     |    8 +++++---
>  scripts/runqemu-internal |    3 ++-
>  2 files changed, 7 insertions(+), 4 deletions(-)
> 
> diff --git a/scripts/runqemu-ifup b/scripts/runqemu-ifup
> index 870cb6b..9e697a8 100755
> --- a/scripts/runqemu-ifup
> +++ b/scripts/runqemu-ifup
> @@ -64,7 +64,9 @@ if [ $STATUS -ne 0 ]; then
>  	exit 1
>  fi
>  
> -IFCONFIG=`which ifconfig 2> /dev/null`
> +PATH_TMP="/sbin:/bin:/usr/sbin:/usr/bin:/usr/local/sbin:/usr/local/bin"
> +
> +IFCONFIG=`{ PATH=$PATH:$PATH_TMP; which ifconfig 2> /dev/null; }`
>  if [ "x$IFCONFIG" = "x" ]; then
>  	# better than nothing...
>  	IFCONFIG=/sbin/ifconfig

I don't really like this, its getting hard to understand whats going on.
Can we abstract this to a function which tries PATH, then tries our own
PATH_TMP? This would reduce code duplication and makes it clearer what
the code is doing...

Cheers,

Richard



