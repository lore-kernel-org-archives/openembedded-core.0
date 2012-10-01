Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1TIg4m-0006DY-GV for openembedded-core@lists.openembedded.org;
	Mon, 01 Oct 2012 15:30:24 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q91DHP0W003025;
	Mon, 1 Oct 2012 14:17:25 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 02349-06; Mon,  1 Oct 2012 14:17:19 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q91DHDm8003019
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=NO);
	Mon, 1 Oct 2012 14:17:14 +0100
Message-ID: <1349097436.15753.99.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Mark Hatle <mark.hatle@windriver.com>, Laurentiu Palcu
	<laurentiu.palcu@intel.com>
Date: Mon, 01 Oct 2012 14:17:16 +0100
In-Reply-To: <0a88f460fef5d86e2a3ec4158498f025c836cfa9.1348963477.git.mark.hatle@windriver.com>
References: <cover.1348963477.git.mark.hatle@windriver.com>
	<0a88f460fef5d86e2a3ec4158498f025c836cfa9.1348963477.git.mark.hatle@windriver.com>
X-Mailer: Evolution 3.2.3-0ubuntu6 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 03/12] populate_sdk_base: Update extraction script for multilibs
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
X-List-Received-Date: Mon, 01 Oct 2012 13:30:24 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Sat, 2012-09-29 at 19:19 -0500, Mark Hatle wrote:
> When multilibs are enabled, there will be more then one environment
> file created.  We need to be sure to process each environment file.
> The next function can simply use the last environment file processed
> to get the magic value(s) that it requires.
> 
> Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
> ---
>  meta/classes/populate_sdk_base.bbclass |    5 +++--
>  1 files changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/meta/classes/populate_sdk_base.bbclass b/meta/classes/populate_sdk_base.bbclass
> index 6eb6726..1bc1438 100644
> --- a/meta/classes/populate_sdk_base.bbclass
> +++ b/meta/classes/populate_sdk_base.bbclass
> @@ -158,8 +158,9 @@ echo "done"
>  
>  printf "Setting it up..."
>  # fix environment paths
> -env_setup_script=$(find $target_sdk_dir/ -name "environment-setup-${REAL_MULTIMACH_TARGET_SYS}")
> -sed -e "s:$DEFAULT_INSTALL_DIR:$target_sdk_dir:g" -i $env_setup_script
> +for env_setup_script in `find $target_sdk_dir/ -name "environment-setup-*"` ; do
> +  sed -e "s:$DEFAULT_INSTALL_DIR:$target_sdk_dir:g" -i $env_setup_script
> +done
>  
>  # fix dynamic loader paths in all ELF SDK binaries
>  native_sysroot=$(cat $env_setup_script |grep OECORE_NATIVE_SYSROOT|cut -d'=' -f2|tr -d '"')

This is on course to conflict with 

http://git.yoctoproject.org/cgit.cgi/poky/commit/?id=1b6019086c4242c550b4e0551c7b5d206a0d52e1

Can you please talk with Laurentiu and come up with a solution that
works for everyone.

Cheers,

Richard



