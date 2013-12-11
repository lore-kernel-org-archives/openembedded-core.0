Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (dan.rpsys.net [93.97.175.187])
	by mail.openembedded.org (Postfix) with ESMTP id 6675D60EFA
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 Dec 2013 15:19:02 +0000 (UTC)
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	rBBFIsvH016254; Wed, 11 Dec 2013 15:18:55 GMT
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id w34X9pzL99ul; Wed, 11 Dec 2013 15:18:54 +0000 (GMT)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	rBBFIZos016248
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NOT);
	Wed, 11 Dec 2013 15:18:48 GMT
Message-ID: <1386775110.4332.90.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: David =?ISO-8859-1?Q?Nystr=F6m?= <david.c.nystrom@gmail.com>
Date: Wed, 11 Dec 2013 15:18:30 +0000
In-Reply-To: <1386773181-24944-1-git-send-email-david.nystrom@enea.com>
References: <1386773181-24944-1-git-send-email-david.nystrom@enea.com>
X-Mailer: Evolution 3.8.4-0ubuntu1 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] image.bbclass: Allow creation of meta-packages for images
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
X-List-Received-Date: Wed, 11 Dec 2013 15:19:02 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Wed, 2013-12-11 at 15:46 +0100, David Nyström wrote:
> No packages were created for core-image-minimal et.c. which
> is a known top level interface for Yocto/OE users.
> 
> When installing from a repo, it would be good if these interfaces
> were common. If not, users are left with
> packagegroup-core-*, which names are not always easy to parse.
> 
> Signed-off-by: David Nyström <david.nystrom@enea.com>
> ---
>  meta/classes/image.bbclass | 12 ++++--------
>  1 file changed, 4 insertions(+), 8 deletions(-)

I'm not sure we can do this since there isn't one magic package group
which represents a given image. The problem is it needs to account for
IMAGE_FEATURES as well and I think this could end up confusing users
more than helping them.

Cheers,

Richard

> diff --git a/meta/classes/image.bbclass b/meta/classes/image.bbclass
> index cc65e35..e875b8a 100644
> --- a/meta/classes/image.bbclass
> +++ b/meta/classes/image.bbclass
> @@ -8,11 +8,12 @@ POPULATE_SDK_POST_TARGET_COMMAND += "rootfs_install_complementary populate_sdk;
>  
>  inherit gzipnative
>  
> +ALLOW_EMPTY_${PN} = "1"
> +PACKAGES = "${PN}"
>  LICENSE = "MIT"
> -PACKAGES = ""
>  DEPENDS += "${MLPREFIX}qemuwrapper-cross ${MLPREFIX}depmodwrapper-cross"
> -RDEPENDS += "${PACKAGE_INSTALL} ${LINGUAS_INSTALL}"
> -RRECOMMENDS += "${PACKAGE_INSTALL_ATTEMPTONLY}"
> +RDEPENDS_${PN} += "${PACKAGE_INSTALL} ${LINGUAS_INSTALL}"
> +RRECOMMENDS_${PN} += "${PACKAGE_INSTALL_ATTEMPTONLY}"
>  
>  INHIBIT_DEFAULT_DEPS = "1"
>  
> @@ -659,11 +660,6 @@ do_configure[noexec] = "1"
>  do_compile[noexec] = "1"
>  do_install[noexec] = "1"
>  do_populate_sysroot[noexec] = "1"
> -do_package[noexec] = "1"
> -do_packagedata[noexec] = "1"
> -do_package_write_ipk[noexec] = "1"
> -do_package_write_deb[noexec] = "1"
> -do_package_write_rpm[noexec] = "1"
>  
>  addtask rootfs before do_build
>  # Allow the kernel to be repacked with the initramfs and boot image file as a single file



