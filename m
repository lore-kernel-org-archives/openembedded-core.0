Return-Path: <joshua.hernstrom@ni.com>
X-Greylist: delayed 309 seconds by postgrey-1.34 at layers.openembedded.org;
	Fri, 07 Nov 2014 18:15:51 UTC
Received: from ni.com (skprod3.natinst.com [130.164.80.24])
	by mail.openembedded.org (Postfix) with ESMTP id D1F6365C87
	for <openembedded-core@lists.openembedded.org>;
	Fri,  7 Nov 2014 18:15:51 +0000 (UTC)
Received: from us-aus-mgwout1.amer.corp.natinst.com (nb-snip2-1338.natinst.com
	[130.164.19.135])
	by us-aus-skprod3.natinst.com (8.14.5/8.14.5) with ESMTP id
	sA7IAhYE026125 for <openembedded-core@lists.openembedded.org>;
	Fri, 7 Nov 2014 12:10:43 -0600
Received: from tyr.amer.corp.natinst.com ([130.164.14.198])
	by us-aus-mgwout1.amer.corp.natinst.com (Lotus Domino Release 8.5.3FP6)
	with ESMTP id 2014110712104307-805488 ;
	Fri, 7 Nov 2014 12:10:43 -0600 
Date: Fri, 7 Nov 2014 12:10:40 -0600
From: Joshua Hernstrom <joshua.hernstrom@ni.com>
To: openembedded-core@lists.openembedded.org
Message-ID: <20141107121040.3488494c@tyr.amer.corp.natinst.com>
X-Mailer: Claws Mail 3.8.0 (GTK+ 2.24.10; x86_64-pc-linux-gnu)
Mime-Version: 1.0
X-MIMETrack: Itemize by SMTP Server on US-AUS-MGWOut1/AUS/H/NIC(Release
	8.5.3FP6|November 21, 2013) at 11/07/2014 12:10:43 PM,
	Serialize by Router on US-AUS-MGWOut1/AUS/H/NIC(Release
	8.5.3FP6|November 21, 2013) at 11/07/2014 12:10:43 PM,
	Serialize complete at 11/07/2014 12:10:43 PM
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:5.12.52, 1.0.28,
	0.0.0000
	definitions=2014-11-07_08:2014-11-07, 2014-11-07,
	1970-01-01 signatures=0
Subject: Re: [PATCH] gptfdisk: add 0.8.10+git version
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
X-List-Received-Date: Fri, 07 Nov 2014 18:15:55 -0000
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset=US-ASCII

Hi Koen,

> Besides from being useful as fdisk replacement this gives us 'sgdisk'
> which can be used to set the GUID for partitions, e.g.
> 
> 	sgdisk -t 1:C12A7328-F81F-11D2-BA4B-00A0C93EC93B /dev/mmcblk0p1
> 
> To mark it as ESP in scripts like mkefidisk.sh.
> 
> Signed-off-by: Koen Kooi <koen@...>
> ---
>  meta/recipes-devtools/fdisk/gptfdisk_git.bb | 22 ++++++++++++++++++++++
>  1 file changed, 22 insertions(+)
>  create mode 100644 meta/recipes-devtools/fdisk/gptfdisk_git.bb
> 
> diff --git a/meta/recipes-devtools/fdisk/gptfdisk_git.bb
> b/meta/recipes-devtools/fdisk/gptfdisk_git.bb new file mode 100644
> index 0000000..62c32c3
> --- /dev/null
> +++ b/meta/recipes-devtools/fdisk/gptfdisk_git.bb
>  <at>  <at>  -0,0 +1,22  <at>  <at> 
>...
> +S = "${WORKDIR}/git"
> +
> +do_install() {
> +    install -d ${D}${bindir}
> +    install -m 0755 cgdisk ${D}${bindir}
> +    install -m 0755 gdisk ${D}${bindir}
> +    install -m 0755 sgdisk ${D}${bindir}
> +    install -m 0755 fixparts ${D}${bindir}

Have you considered splitting this package into separate sub-packages? The util-linux recipe does something similar for the fdisk family of utilities. I had a not-yet-submitted recipe along the same line as yours - the relevant snippets follow for reference:

<snip>
PACKAGES =+ "${PN}-gdisk ${PN}-cgdisk ${PN}-sgdisk ${PN}-fixparts"
FILES_${PN}-gdisk = "${sbindir}/gdisk"
FILES_${PN}-cgdisk = "${sbindir}/cgdisk"
FILES_${PN}-sgdisk = "${sbindir}/sgdisk"
FILES_${PN}-fixparts = "${sbindir}/fixparts"

do_install() {
	install -m 0755 -d ${D}${sbindir}
	sbinprogs="gdisk cgdisk sgdisk fixparts"
	for f in ${sbinprogs}; do
		install -m 0755 ${S}/${f} ${D}${sbindir}
	done
}
</snip>

Cheers,
Josh
--
Joshua Hernstrom
National Instruments

