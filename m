Return-Path: <adrian.ratiu@ni.com>
Received: from ni.com (skprod2.natinst.com [130.164.80.23])
	by mail.openembedded.org (Postfix) with ESMTP id 1609C6FF9F
	for <openembedded-core@lists.openembedded.org>;
	Fri,  8 Jan 2016 09:02:31 +0000 (UTC)
Received: from us-aus-mgwout2.amer.corp.natinst.com (nb-chan1-1338.natinst.com
	[130.164.19.134])
	by us-aus-skprod2.natinst.com (8.15.0.59/8.15.0.59) with ESMTP id
	u0892UaS020377; Fri, 8 Jan 2016 03:02:30 -0600
Received: from adi-pc-linux ([130.164.14.198])
	by us-aus-mgwout2.amer.corp.natinst.com (Lotus Domino Release 8.5.3FP6
	HF1218) with ESMTP id 2016010803022977-1812445 ;
	Fri, 8 Jan 2016 03:02:29 -0600 
Date: Fri, 8 Jan 2016 11:02:21 +0200
From: Ioan-Adrian Ratiu <adrian.ratiu@ni.com>
To: <ross.burton@intel.com>, <openembedded-core@lists.openembedded.org>
Message-ID: <20160108110221.241d58d6@adi-pc-linux>
In-Reply-To: <1450866066-22217-1-git-send-email-adrian.ratiu@ni.com>
References: <1450172969-11076-1-git-send-email-adrian.ratiu@ni.com>
	<1450866066-22217-1-git-send-email-adrian.ratiu@ni.com>
Organization: National Instruments
MIME-Version: 1.0
X-MIMETrack: Itemize by SMTP Server on US-AUS-MGWOut2/AUS/H/NIC(Release
	8.5.3FP6 HF1218|December 12, 2014) at 01/08/2016 03:02:30 AM,
	Serialize by Router on US-AUS-MGWOut2/AUS/H/NIC(Release 8.5.3FP6
	HF1218|December 12, 2014) at 01/08/2016 03:02:30 AM,
	Serialize complete at 01/08/2016 03:02:30 AM
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
	definitions=2016-01-08_03:, , signatures=0
Subject: Re: [PATCH v4] util-linux: create util-linux-runuser package
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
X-List-Received-Date: Fri, 08 Jan 2016 09:02:32 -0000
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset=US-ASCII

On Wed, 23 Dec 2015 12:21:06 +0200
Ioan-Adrian Ratiu <adrian.ratiu@ni.com> wrote:

> Split runuser into its own package (previously provided by util-linux).
> runuser is compiled only when DISTRO_FEATURES includes pam and also the
> package is created only when runuser exists.
> 
> Signed-off-by: Ioan-Adrian Ratiu <adrian.ratiu@ni.com>
> ---
>  meta/recipes-core/util-linux/util-linux.inc | 7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)
> 
> diff --git a/meta/recipes-core/util-linux/util-linux.inc b/meta/recipes-core/util-linux/util-linux.inc
> index cf321c6..551ffbb 100644
> --- a/meta/recipes-core/util-linux/util-linux.inc
> +++ b/meta/recipes-core/util-linux/util-linux.inc
> @@ -29,7 +29,7 @@ PACKAGES =+ "util-linux-agetty util-linux-fdisk util-linux-cfdisk util-linux-sfd
>               util-linux-swaponoff util-linux-losetup util-linux-umount \
>               util-linux-mount util-linux-readprofile util-linux-uuidd \
>               util-linux-uuidgen util-linux-lscpu util-linux-fsck util-linux-blkid \
> -             util-linux-mkfs util-linux-mcookie util-linux-reset \
> +             util-linux-mkfs util-linux-mcookie util-linux-reset util-linux-runuser \
>               util-linux-mkfs.cramfs util-linux-fsck.cramfs util-linux-fstrim \
>               util-linux-partx ${PN}-bash-completion util-linux-hwclock \
>               util-linux-findfs util-linux-getopt util-linux-sulogin"
> @@ -84,6 +84,7 @@ FILES_util-linux-partx = "${sbindir}/partx"
>  FILES_util-linux-hwclock = "${base_sbindir}/hwclock.${BPN}"
>  FILES_util-linux-findfs = "${sbindir}/findfs"
>  FILES_util-linux-getopt = "${base_bindir}/getopt.${BPN}"
> +FILES_util-linux-runuser = "${sbindir}/runuser"
>  
>  FILES_util-linux-pylibmount = "${libdir}/${PYTHON_DIR}/dist-packages/libmount/pylibmount.so \
>                                 ${libdir}/${PYTHON_DIR}/dist-packages/libmount/__init__.*"
> @@ -105,7 +106,11 @@ RREPLACES_util-linux-blkid = "e2fsprogs-blkid"
>  # reset calls 'tput'
>  RDEPENDS_util-linux-reset += "ncurses"
>  
> +RDEPENDS_util-linux-runuser += "libpam"
> +
>  RDEPENDS_${PN} = "util-linux-umount util-linux-swaponoff util-linux-losetup util-linux-sulogin"
> +RDEPENDS_${PN} += "${@bb.utils.contains('DISTRO_FEATURES', 'pam', 'util-linux-runuser', '', d)}"
> +
>  RRECOMMENDS_${PN} = "util-linux-fdisk util-linux-cfdisk util-linux-sfdisk util-linux-mount util-linux-readprofile util-linux-mkfs "
>  
>  RRECOMMENDS_${PN}_class-native = ""

ping?

