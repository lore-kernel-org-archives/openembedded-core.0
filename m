Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 9344D77D72
	for <openembedded-core@lists.openembedded.org>;
	Fri,  7 Apr 2017 07:48:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.15.2/8.15.2/Debian-3) with ESMTP id v377lrrI024807; 
	Fri, 7 Apr 2017 08:47:58 +0100
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id PZPQBwhixSYo; Fri,  7 Apr 2017 08:47:58 +0100 (BST)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.15.2/8.15.2/Debian-3) with ESMTPSA id
	v377aenC023867
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128
	verify=NOT); Fri, 7 Apr 2017 08:36:41 +0100
Message-ID: <1491550600.17200.82.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: yin.thong.choong@intel.com, openembedded-core@lists.openembedded.org
Date: Fri, 07 Apr 2017 08:36:40 +0100
In-Reply-To: <1491467730-8418-5-git-send-email-yin.thong.choong@intel.com>
References: <1491467730-8418-1-git-send-email-yin.thong.choong@intel.com>
	<1491467730-8418-5-git-send-email-yin.thong.choong@intel.com>
X-Mailer: Evolution 3.18.5.2-0ubuntu3.1 
Mime-Version: 1.0
Subject: Re: [PATCH v3 4/8] logrotate: replace fedorahosted.org SRC_URI with github.com source
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
X-List-Received-Date: Fri, 07 Apr 2017 07:48:02 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Thu, 2017-04-06 at 01:35 -0700, yin.thong.choong@intel.com wrote:
> From: Choong YinThong <yin.thong.choong@intel.com>
> 
> fedorahosted.org was retired on March 1st, 2017. This is to
> update the SRC_URI to point to github.com.
> 
> [YOCTO #11226]
> 
> Signed-off-by: Choong YinThong <yin.thong.choong@intel.com>

This failed autobuilder testing in multilib builds:

https://autobuilder.yocto.io/builders/nightly-world-lsb/builds/214/steps/BuildImages/logs/stdio
https://autobuilder.yocto.io/builders/nightly-world/builds/214/steps/BuildImages/logs/stdio

Probably you need ${BPN}, not ${PN}.

>  meta/recipes-extended/logrotate/logrotate_3.9.1.bb | 19
> +++++++++++++++----
>  1 file changed, 15 insertions(+), 4 deletions(-)
> 
> diff --git a/meta/recipes-extended/logrotate/logrotate_3.9.1.bb
> b/meta/recipes-extended/logrotate/logrotate_3.9.1.bb
> index 9c2dfe0..5cbd9ff 100644
> --- a/meta/recipes-extended/logrotate/logrotate_3.9.1.bb
> +++ b/meta/recipes-extended/logrotate/logrotate_3.9.1.bb
> @@ -1,6 +1,6 @@
>  SUMMARY = "Rotates, compresses, removes and mails system log files"
>  SECTION = "console/utils"
> -HOMEPAGE = "https://fedorahosted.org/logrotate/"
> +HOMEPAGE = "https://github.com/logrotate/logrotate/issues"
>  LICENSE = "GPLv2"
>  
>  # TODO: logrotate 3.8.8 adds autotools/automake support, update
> recipe to use it.
> @@ -10,14 +10,25 @@ DEPENDS="coreutils popt"
>  
>  LIC_FILES_CHKSUM =
> "file://COPYING;md5=18810669f13b87348459e611d31ab760"
>  
> -SRC_URI = "https://fedorahosted.org/releases/l/o/logrotate/logrotate
> -${PV}.tar.gz \
> +# When updating logrotate to latest upstream, SRC_URI should point
> to
> +# a proper release tarball from https://github.com/logrotate/logrota
> te/releases
> +# and we have to take the snapshot for now because there is no such
> +# tarball available for 3.9.1.
> +
> +S = "${WORKDIR}/${PN}-r3-9-1"
> +
> +UPSTREAM_CHECK_URI = "https://github.com/${PN}/${PN}/releases"
> +
> +SRC_URI = "https://github.com/${PN}/${PN}/archive/r3-9-1.tar.gz \
>             file://act-as-mv-when-rotate.patch \
>             file://update-the-manual.patch \
>             file://disable-check-different-filesystems.patch \
>              "
>  
> -SRC_URI[md5sum] = "4492b145b6d542e4a2f41e77fa199ab0"
> -SRC_URI[sha256sum] =
> "022769e3288c80981559a8421703c88e8438b447235e36dd3c8e97cd94c52545"
> +# Checksum changed due to tarball source folder changes in upstream
> +			
> +SRC_URI[md5sum] = "8572b7c2cf9ade09a8a8e10098500fb3"
> +SRC_URI[sha256sum] =
> "5bf8e478c428e7744fefa465118f8296e7e771c981fb6dffb7527856a0ea3617"
>  
>  PACKAGECONFIG ?= "${@bb.utils.filter('DISTRO_FEATURES', 'acl
> selinux', d)}"
>  
> -- 
> 2.7.4
> 

