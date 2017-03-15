Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id CE71D730DE
	for <openembedded-core@lists.openembedded.org>;
	Wed, 15 Mar 2017 22:17:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	v2FMGxcd018422; Wed, 15 Mar 2017 22:16:59 GMT
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id EqdUX92Bljf6; Wed, 15 Mar 2017 22:16:59 +0000 (GMT)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	v2FMGtUB018417
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Wed, 15 Mar 2017 22:16:56 GMT
Message-ID: <1489616215.13980.82.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Juro Bystricky <juro.bystricky@intel.com>,
	openembedded-core@lists.openembedded.org
Date: Wed, 15 Mar 2017 22:16:55 +0000
In-Reply-To: <1489616018-8969-2-git-send-email-juro.bystricky@intel.com>
References: <1489616018-8969-1-git-send-email-juro.bystricky@intel.com>
	<1489616018-8969-2-git-send-email-juro.bystricky@intel.com>
X-Mailer: Evolution 3.18.5.2-0ubuntu3.1 
Mime-Version: 1.0
Cc: jurobystricky@hotmail.com
Subject: Re: [PATCH 1/3] build-appliance-image: use pip3-native
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
X-List-Received-Date: Wed, 15 Mar 2017 22:17:21 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Wed, 2017-03-15 at 15:13 -0700, Juro Bystricky wrote:
> Do not rely on pip3 being installed on the host.
> Use pip3-native instead.
> 
> [YOCTO#10909]
> [YOCTO#11022]
> 
> Signed-off-by: Juro Bystricky <juro.bystricky@intel.com>
> ---
>  meta/recipes-core/images/build-appliance-image_15.0.0.bb | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/meta/recipes-core/images/build-appliance-image_15.0.0.bb 
> b/meta/recipes-core/images/build-appliance-image_15.0.0.bb
> index 0db1fb0..730989e 100644
> --- a/meta/recipes-core/images/build-appliance-image_15.0.0.bb
> +++ b/meta/recipes-core/images/build-appliance-image_15.0.0.bb
> @@ -18,10 +18,10 @@ IMAGE_ROOTFS_EXTRA_SPACE = "41943040"
>  # Do a quiet boot with limited console messages
>  APPEND += "rootfstype=ext4 quiet"
>  
> -DEPENDS = "zip-native"
> +DEPENDS = "zip-native python3-pip-native"
>  IMAGE_FSTYPES = "vmdk"
>  
> -inherit core-image module-base
> +inherit core-image module-base setuptools3
>  
>  SRCREV ?= "8343ed93c4278715aa1582d3cadedf8f197b4089"
>  SRC_URI = "git://git.yoctoproject.org/poky;branch=master \
> @@ -95,6 +95,8 @@ fakeroot do_populate_poky_src () {
>  	echo 'gtk-theme-name = "Clearlooks"' >
> ${IMAGE_ROOTFS}/etc/gtk-2.0/gtkrc
>  
>  	# Install modules needed for toaster
> +	export STAGING_LIBDIR=${STAGING_LIBDIR_NATIVE}
> +	export STAGING_INCDIR=${STAGING_INCDIR_NATIVE}
>  	export HOME=${IMAGE_ROOTFS}/home/builder
>  	mkdir -p ${IMAGE_ROOTFS}/home/builder/.cache/pip
>  	pip3 install --user -I -U -v -r
> ${IMAGE_ROOTFS}/home/builder/poky/bitbake/toaster-requirements.txt


Looks good, thanks. Can you also drop "pip" from bitbake.conf's
HOSTTOOLS_NONFATAL please?

Cheers,

Richard

