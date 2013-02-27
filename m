Received: from atl4mhfb02.myregisteredsite.com ([209.17.115.56])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mike.looijmans@topic.nl>) id 1UAfaV-0007GN-Le
	for openembedded-core@lists.openembedded.org;
	Wed, 27 Feb 2013 12:54:23 +0100
Received: from atl4mhob12.myregisteredsite.com
	(atl4mhob12.myregisteredsite.com [209.17.115.50])
	by atl4mhfb02.myregisteredsite.com (8.14.4/8.14.4) with ESMTP id
	r1RBbxAu006327 for <openembedded-core@lists.openembedded.org>;
	Wed, 27 Feb 2013 06:38:00 -0500
Received: from mailpod.hostingplatform.com (mail.networksolutionsemail.com
	[205.178.146.50])
	by atl4mhob12.myregisteredsite.com (8.14.4/8.14.4) with ESMTP id
	r1RBbwOn002408 for <openembedded-core@lists.openembedded.org>;
	Wed, 27 Feb 2013 06:37:58 -0500
Received: (qmail 27249 invoked by uid 0); 27 Feb 2013 11:37:58 -0000
Received: from unknown (HELO ?192.168.80.45?)
	(mike@milosoftware.com@88.159.208.100)
	by 0 with ESMTPA; 27 Feb 2013 11:37:58 -0000
Message-ID: <512DF015.8070102@topic.nl>
Date: Wed, 27 Feb 2013 12:37:57 +0100
From: Mike Looijmans <mike.looijmans@topic.nl>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130106 Thunderbird/17.0.2
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
References: <1361294595-2454-1-git-send-email-milo-software@users.sourceforge.net>
In-Reply-To: <1361294595-2454-1-git-send-email-milo-software@users.sourceforge.net>
Subject: Re: [PATCH v2] util-linux: Add package for libmount
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
X-List-Received-Date: Wed, 27 Feb 2013 11:54:23 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Is there any feedback on this patch yet?

Mike.

On 02/19/2013 06:23 PM, MiLo wrote:
> The libmount shared library was part of util-linux. This caused
> util-linux-mount to RDEPEND on util-linux, so including that would
> also drag in all of util-linux and all its recommendations.
>
> To break this circular dependency, add a libmount package that holds
> the libmount.so.* files, just like the other libraries built by util-
> linux.
>
> Signed-off-by: MiLo <milo-software@users.sourceforge.net>
> ---
>   meta/recipes-core/util-linux/util-linux.inc       |    3 +++
>   meta/recipes-core/util-linux/util-linux_2.22.2.bb |    2 +-
>   2 files changed, 4 insertions(+), 1 deletions(-)
>
> diff --git a/meta/recipes-core/util-linux/util-linux.inc b/meta/recipes-core/util-linux/util-linux.inc
> index 10439c0..bd7b089 100644
> --- a/meta/recipes-core/util-linux/util-linux.inc
> +++ b/meta/recipes-core/util-linux/util-linux.inc
> @@ -31,6 +31,7 @@ SRC_URI = "${KERNELORG_MIRROR}/linux/utils/util-linux/v${MAJOR_VERSION}/util-lin
>   PACKAGES =+ "util-linux-agetty util-linux-fdisk util-linux-cfdisk util-linux-sfdisk \
>                util-linux-swaponoff util-linux-losetup util-linux-umount \
>                util-linux-mount util-linux-readprofile util-linux-libblkid \
> +             util-linux-libmount util-linux-libmount-dev \
>                util-linux-libblkid-dev util-linux-libuuid util-linux-libuuid-dev \
>                util-linux-uuidgen util-linux-lscpu util-linux-fsck util-linux-blkid \
>                util-linux-mkfs util-linux-mcookie util-linux-reset"
> @@ -64,6 +65,8 @@ FILES_util-linux-reset = "${base_bindir}/reset"
>
>   FILES_util-linux-libblkid = "${base_libdir}/libblkid.so.*"
>   FILES_util-linux-libblkid-dev = "${base_libdir}/libblkid.so ${base_libdir}/libblkid.la ${includedir}/blkid ${libdir}/pkgconfig/blkid.pc"
> +FILES_util-linux-libmount = "${base_libdir}/libmount.so.*"
> +FILES_util-linux-libmount-dev = "${base_libdir}/libmount.so ${base_libdir}/libmount.la ${includedir}/libmount ${libdir}/pkgconfig/mount.pc"
>   FILES_util-linux-libuuid = "${base_libdir}/libuuid.so.*"
>   FILES_util-linux-libuuid-dev = "${base_libdir}/libuuid.so ${base_libdir}/libuuid.la ${includedir}/uuid ${libdir}/pkgconfig/uuid.pc"
>   FILES_util-linux-lscpu = "${bindir}/lscpu"
> diff --git a/meta/recipes-core/util-linux/util-linux_2.22.2.bb b/meta/recipes-core/util-linux/util-linux_2.22.2.bb
> index dd95573..f91784b 100644
> --- a/meta/recipes-core/util-linux/util-linux_2.22.2.bb
> +++ b/meta/recipes-core/util-linux/util-linux_2.22.2.bb
> @@ -1,5 +1,5 @@
>   MAJOR_VERSION = "2.22"
> -PR = "r0"
> +PR = "r1"
>   require util-linux.inc
>
>   # note that `lscpu' is under GPLv3+
>



