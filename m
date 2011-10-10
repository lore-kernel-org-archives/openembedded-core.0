Received: from mail.geekisp.com ([216.168.135.169] helo=starfish.geekisp.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <philip@balister.org>) id 1RDN3d-0006gP-AE
	for openembedded-core@lists.openembedded.org;
	Mon, 10 Oct 2011 23:06:45 +0200
Received: (qmail 11724 invoked by uid 1003); 10 Oct 2011 21:01:02 -0000
Received: from unknown (HELO ?192.168.1.108?)
	(philip@opensdr.com@96.240.183.10)
	by mail.geekisp.com with (DHE-RSA-AES256-SHA encrypted) SMTP;
	10 Oct 2011 21:01:02 -0000
Message-ID: <4E935D0D.7030108@balister.org>
Date: Mon, 10 Oct 2011 17:01:01 -0400
From: Philip Balister <philip@balister.org>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.2.23) Gecko/20110928 Fedora/3.1.15-1.fc14 Thunderbird/3.1.15
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <1318241454-10545-1-git-send-email-koen@dominion.thruhere.net>
In-Reply-To: <1318241454-10545-1-git-send-email-koen@dominion.thruhere.net>
X-Enigmail-Version: 1.1.2
Subject: Re: [PATCH] util-linux 2.19.1: split blkid out into its own	subpackage
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
X-List-Received-Date: Mon, 10 Oct 2011 21:06:45 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

On 10/10/2011 06:10 AM, Koen Kooi wrote:
> Recent udev versions require blkid from u-l, not from e2fsprogs. In general all the non fsck related binaries from e2fsprogs are deprecated.
> 
> Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>

Acked-by: Philip Balister < philip@balister.org>

> ---
>  meta/recipes-core/util-linux/util-linux.inc       |   15 ++++++++++++++-
>  meta/recipes-core/util-linux/util-linux_2.19.1.bb |    2 +-
>  2 files changed, 15 insertions(+), 2 deletions(-)
> 
> diff --git a/meta/recipes-core/util-linux/util-linux.inc b/meta/recipes-core/util-linux/util-linux.inc
> index 8762ac6..67d81b9 100644
> --- a/meta/recipes-core/util-linux/util-linux.inc
> +++ b/meta/recipes-core/util-linux/util-linux.inc
> @@ -29,7 +29,7 @@ PACKAGES =+ "util-linux-agetty util-linux-fdisk util-linux-cfdisk util-linux-sfd
>               util-linux-swaponoff util-linux-losetup util-linux-umount \
>               util-linux-mount util-linux-readprofile util-linux-libblkid \
>               util-linux-libblkid-dev util-linux-libuuid util-linux-libuuid-dev \
> -             util-linux-uuidgen util-linux-lscpu util-linux-fsck"
> +             util-linux-uuidgen util-linux-lscpu util-linux-fsck util-linux-blkid"
>  
>  EXTRA_OECONF = "--disable-use-tty-group --disable-makeinstall-chown --enable-elvtune --enable-init --enable-kill --enable-last \
>   --enable-mesg --enable-partx --enable-raw --enable-rdev --enable-reset \
> @@ -56,6 +56,11 @@ FILES_util-linux-lscpu = "${bindir}/lscpu"
>  
>  FILES_util-linux-fsck = "${base_sbindir}/fsck*"
>  
> +# Util-linux' blkid replaces the e2fsprogs one
> +FILES_util-linux-blkid = "${base_sbindir}/blkid*"
> +RCONFLICTS_util-linux-blkid = "e2fsprogs-blkid"
> +RREPLACES_util-linux-blkid = "e2fsprogs-blkid"
> +
>  RRECOMMENDS_${PN} = "util-linux-fdisk util-linux-cfdisk util-linux-sfdisk util-linux-mount util-linux-readprofile "
>  RDEPENDS_${PN} = "util-linux-umount util-linux-swaponoff util-linux-losetup perl"
>  
> @@ -262,4 +267,12 @@ pkg_prerm_util-linux-fsck () {
>  	update-alternatives --remove fsck fsck.${PN}
>  }
>  
> +pkg_postinst_util-linux-blkid () {
> +	update-alternatives --install ${base_sbindir}/blkid blkid blkid.${PN} 100
> +}
> +
> +pkg_prerm_util-linux-blkid () {
> +	update-alternatives --remove blkid blkid.${PN}
> +}
> +
>  BBCLASSEXTEND = "native"
> diff --git a/meta/recipes-core/util-linux/util-linux_2.19.1.bb b/meta/recipes-core/util-linux/util-linux_2.19.1.bb
> index 39ff68c..04f4457 100644
> --- a/meta/recipes-core/util-linux/util-linux_2.19.1.bb
> +++ b/meta/recipes-core/util-linux/util-linux_2.19.1.bb
> @@ -1,5 +1,5 @@
>  MAJOR_VERSION = "2.19"
> -PR = "r7"
> +PR = "r8"
>  require util-linux.inc
>  
>  # note that `lscpu' is under GPLv3+


