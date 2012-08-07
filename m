Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1SyebD-0007eJ-Th for openembedded-core@lists.openembedded.org;
	Tue, 07 Aug 2012 09:53:08 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q777fNHS008279;
	Tue, 7 Aug 2012 08:41:23 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 01144-09; Tue,  7 Aug 2012 08:41:18 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q777fFe8008270
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Tue, 7 Aug 2012 08:41:17 +0100
Message-ID: <1344325278.9756.196.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Tue, 07 Aug 2012 08:41:18 +0100
In-Reply-To: <5020AED3.1020406@windriver.com>
References: <501FBD86.3090705@windriver.com> <5020AED3.1020406@windriver.com>
X-Mailer: Evolution 3.2.2- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Cc: "Yang, Liezhi" <Liezhi.Yang@windriver.com>
Subject: Re: Could we build tar-replacement firstly and not parallel if tar-replacement is needed to build
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
X-List-Received-Date: Tue, 07 Aug 2012 07:53:08 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2012-08-07 at 13:59 +0800, Rongqing Li wrote:
> Paste a RFC PATCH
> 
> [RFC PATCH 1/1] bitbake: compile tar-replacement firstly, and not parallel
> 
> Compiling tar-replacement or not is decided by version of host tar,
> if the host tar version is lower than 1.23, Compiling tar-replacement
> is needed.
> 
> When doing popoluate tar-replacement sysroot to write the tar to
> sysroot, but writing is not finished. other packages probably
> use the being written tar to unzip file, which will lead to failure
> and report the below error:
> "bitbake_build/tmp/sysroots/x86_64-linux/usr/bin/tar: Text file busy "
> 
> Now we compile tar-replacement firstly and not parallel to ensure
> that a being written tar command will not be used.
> 
> Signed-off-by: Roy.Li <rongqing.li@windriver.com>
> ---
>   scripts/bitbake |   14 +++++++++++++-
>   1 files changed, 13 insertions(+), 1 deletions(-)
> 
> diff --git a/scripts/bitbake b/scripts/bitbake
> index 3772d82..eb6b144 100755
> --- a/scripts/bitbake
> +++ b/scripts/bitbake
> @@ -134,7 +134,19 @@ if [ $buildpseudo -gt 0 ]; then
>               fi
>           done
>       done
> -    bitbake pseudo-native $TARTARGET $additionalopts -c populate_sysroot
> +
> +    if [ $needtar = "1" ]; then
> +       NUM_THREAD_LINE=`grep -n "^\s*BB_NUMBER_THREADS" conf/local.conf 
> |awk -F':' '{print $1}'`
> +	test -n "$NUM_THREAD_LINE" &&
> +	sed -i ''"$NUM_THREAD_LINE"'s/^\s*BB_NUMBER_THREADS/#\0/g' conf/local.conf
> +
> +	bitbake $TARTARGET -c populate_sysroot
> +
> +	test -n "$NUM_THREAD_LINE" &&
> +	sed -i 
> ''"$NUM_THREAD_LINE"'s/^#\s*BB_NUMBER_THREADS/BB_NUMBER_THREADS/g' 
> conf/local.conf
> +    fi

We are *NOT* running sed over local.conf. What is the user used a
different configuration file for example?

If you're just building tar-native, is there a parallel race possible?
I'm not sure that there is?

For the record I hate this script and what it has become, its horrible.
It started as a workaround for pseudo-native, its becoming a dumping
ground for a whole set of nasty workarounds :(.

Cheers,

Richard



