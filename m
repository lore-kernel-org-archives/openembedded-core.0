Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1SZluw-0005Um-0L for openembedded-core@lists.openembedded.org;
	Wed, 30 May 2012 18:38:38 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q4UGSJrt023405;
	Wed, 30 May 2012 17:28:19 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 23236-04; Wed, 30 May 2012 17:28:13 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q4UGSBiS023399
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Wed, 30 May 2012 17:28:12 +0100
Message-ID: <1338395291.20169.159.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Wed, 30 May 2012 17:28:11 +0100
In-Reply-To: <516ea18ba576f0904bae4b6089838c2dda23f58a.1338284916.git.xiaofeng.yan@windriver.com>
References: <cover.1338284916.git.xiaofeng.yan@windriver.com>
	<516ea18ba576f0904bae4b6089838c2dda23f58a.1338284916.git.xiaofeng.yan@windriver.com>
X-Mailer: Evolution 3.2.2- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Cc: Zhenfeng.Zhao@windriver.com
Subject: Re: [PATCH 1/3] lsbinitscripts: Add initscripts to enhance init functions in an lsb image
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
X-List-Received-Date: Wed, 30 May 2012 16:38:38 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2012-05-30 at 09:47 +0800, xiaofeng.yan@windriver.com wrote:
> From: Xiaofeng Yan <xiaofeng.yan@windriver.com>
> 
> The version of initscripts has more functions than the simple. \
> There could be some errors for current initscripts when running \
> some programe because of absent some functions provided by \
> initscripts.
> 
> [YOCTO #2133]
> 
> Signed-off-by: Xiaofeng Yan <xiaofeng.yan@windriver.com>
> ---
>  meta/recipes-extended/lsb/lsbinitscripts_9.03.bb |   36 ++++++++++++++++++++++
>  1 files changed, 36 insertions(+), 0 deletions(-)
>  create mode 100644 meta/recipes-extended/lsb/lsbinitscripts_9.03.bb
> 
> diff --git a/meta/recipes-extended/lsb/lsbinitscripts_9.03.bb b/meta/recipes-extended/lsb/lsbinitscripts_9.03.bb
> new file mode 100644
> index 0000000..5d2bca8
> --- /dev/null
> +++ b/meta/recipes-extended/lsb/lsbinitscripts_9.03.bb
> @@ -0,0 +1,36 @@
> +DESCRIPTION = "SysV init scripts"

Surely we can be a little more descriptive here and at least mention
LSB?

> +SECTION = "base"
> +LICENSE = "GPLv2"
> +PR = "r0"
> +
> +LIC_FILES_CHKSUM = "file://COPYING;md5=ebf4e8b49780ab187d51bd26aaa022c6"
> +
> +S="${WORKDIR}/initscripts-${PV}"
> +SRC_URI = "http://pkgs.fedoraproject.org/repo/pkgs/initscripts/initscripts-${PV}.tar.bz2/668fa2762b57ef75436303857847bba3/initscripts-${PV}.tar.bz2 \
> +           file://functions.patch \
> +          " 
> +
> +SRC_URI[md5sum] = "668fa2762b57ef75436303857847bba3"
> +SRC_URI[sha256sum] = "d56547a68ce223a7413b2676650b042125f047c8d6d139c5b970e118b3dc958a"
> +
> +do_configure[noexec] = "1" 
> +
> +do_install(){
> +	install -d ${D}/etc/init.d/
> +	install -m 0755 ${S}/rc.d/init.d/functions ${D}/etc/init.d/functions
> +        if [ "${PN}" = "lsbinitscripts" ]; then
> +		mv ${D}${sysconfdir}/init.d/functions ${D}${sysconfdir}/init.d/functions.${PN}
> +	fi
> +}
> +
> +pkg_postinst_${PN}(){
> +        if [ "${PN}" = "lsbinitscripts" ]; then
> +		update-alternatives --install  ${sysconfdir}/init.d/functions functions functions.${PN} 10
> +	fi
> +}
> +
> +pkg_prerm_${PN}(){
> +        if [ "${PN}" = "lsbinitscripts" ]; then
> +		update-alternatives --remove functions  ${sysconfdir}/init.d/functions.${PN}
> +	fi
> +}

Could you update this to use the recently added update-alternatives
class please?

Cheers,

Richard



