Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1SfYAX-00081n-Jp for openembedded-core@lists.openembedded.org;
	Fri, 15 Jun 2012 17:10:38 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q5FExx8V014614;
	Fri, 15 Jun 2012 15:59:59 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 13532-10; Fri, 15 Jun 2012 15:59:55 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q5FExqw0014608
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Fri, 15 Jun 2012 15:59:53 +0100
Message-ID: <1339772393.7261.6.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Fri, 15 Jun 2012 15:59:53 +0100
In-Reply-To: <cf3611bc2fea78d0aa3d042e000edb0e86534297.1339751573.git.xiaofeng.yan@windriver.com>
References: <cover.1339751573.git.xiaofeng.yan@windriver.com>
	<cf3611bc2fea78d0aa3d042e000edb0e86534297.1339751573.git.xiaofeng.yan@windriver.com>
X-Mailer: Evolution 3.2.2- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Cc: Zhenfeng.Zhao@windriver.com
Subject: Re: [PATCH 2/3] lsbinitscripts: Remove original /etc/init.d/functions when building an lsb image
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
X-List-Received-Date: Fri, 15 Jun 2012 15:10:38 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2012-06-15 at 17:30 +0800, xiaofeng.yan@windriver.com wrote:
> From: Xiaofeng Yan <xiaofeng.yan@windriver.com>
> 
> The linking will fail when an original functions exist. So remove the
> original functions when building an lsb image and make functions linking to
> functions.lsbinitscripts successfully.
> 
> [YOCTO #2133]
> 
> Signed-off-by: Xiaofeng Yan <xiaofeng.yan@windriver.com>
> ---
>  meta/recipes-extended/lsb/lsbinitscripts_9.03.bb |    8 +++++++-
>  1 file changed, 7 insertions(+), 1 deletion(-)
> 
> diff --git a/meta/recipes-extended/lsb/lsbinitscripts_9.03.bb b/meta/recipes-extended/lsb/lsbinitscripts_9.03.bb
> index dd92a92..73bea2f 100644
> --- a/meta/recipes-extended/lsb/lsbinitscripts_9.03.bb
> +++ b/meta/recipes-extended/lsb/lsbinitscripts_9.03.bb
> @@ -2,7 +2,7 @@ DESCRIPTION = "SysV init scripts which only is used in an LSB image"
>  SECTION = "base"
>  LICENSE = "GPLv2"
>  DEPENDS = "popt"
> -PR = "r0"
> +PR = "r1"
>  
>  LIC_FILES_CHKSUM = "file://COPYING;md5=ebf4e8b49780ab187d51bd26aaa022c6"
>  
> @@ -25,3 +25,9 @@ do_install(){
>  	install -d ${D}/etc/init.d/
>  	install -m 0755 ${S}/rc.d/init.d/functions ${D}/etc/init.d/functions
>  }
> +
> +pkg_postinst_${PN} () {
> +	if [ -f "/etc/init.d/functions" ]; then
> +		rm -f /etc/init.d/functions
> +	fi
> +}

This looks highly suspicious to me. Shouldn't the other provider of this
be put under control for update-alternatives too or something?

Cheers,

Richard



