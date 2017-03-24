Return-Path: <d.schultz@phytec.de>
Received: from root.phytec.de (mail.x-arc.co.uk [217.6.246.34])
	by mail.openembedded.org (Postfix) with ESMTP id 5F84C77A30
	for <openembedded-core@lists.openembedded.org>;
	Fri, 24 Mar 2017 13:34:00 +0000 (UTC)
Received: from idefix.phytec.de (idefix.phytec.de [172.16.0.10])
	by root.phytec.de (Postfix) with ESMTP id 1FC58A001D4;
	Fri, 24 Mar 2017 14:34:33 +0100 (CET)
Received: from [172.16.25.214] ([172.16.25.214])
	by idefix.phytec.de (IBM Domino Release 9.0.1FP7)
	with ESMTP id 2017032414340025-406066 ;
	Fri, 24 Mar 2017 14:34:00 +0100 
To: openembedded-core@lists.openembedded.org
References: <20170324111502.23474-1-ejo@pengutronix.de>
From: Daniel Schultz <d.schultz@phytec.de>
Message-ID: <d277a548-fc71-01a7-d995-1f9c9301db51@phytec.de>
Date: Fri, 24 Mar 2017 14:34:00 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.5.1
MIME-Version: 1.0
In-Reply-To: <20170324111502.23474-1-ejo@pengutronix.de>
X-MIMETrack: Itemize by SMTP Server on Idefix/Phytec(Release 9.0.1FP7|August
	17, 2016) at 24.03.2017 14:34:00,
	Serialize by Router on Idefix/Phytec(Release 9.0.1FP7|August  17,
	2016) at 24.03.2017 14:34:00
X-TNEFEvaluated: 1
Cc: ejo@pengutronix.de
Subject: Re: [PATCH] image_types: perform fsck on created ext image
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
X-List-Received-Date: Fri, 24 Mar 2017 13:34:01 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable

Hi Enrico,

I have sent fixes for the same problem on Monday.
These include a fix of the wrong return code after optimizations (now it=20
returns 0) and an fsck execution after the creation of EXT partitions.

The patch which is identical to yours wasn't applied so far, the other=20
ones were.

--=20
Mit freundlichen Gr=C3=BC=C3=9Fen,
With best regards,
   Daniel Schultz

Am 24.03.2017 um 12:15 schrieb Enrico Jorns:
> When performing a file system check, the image created with mkfs will
> trigger Pass 3A ('Optimizing directories') which turns the file system
> into state "changed" (EXT2=5FFLAG=5FCHANGED).
>
> This will let fsck request a reboot by setting the return code flag "2".
>
> The result of this is that each ext-image built with oe-core will
> trigger a reboot during the first time an fsck is triggered.
>
> A common case where this might occur is when fsck detects having
> a future superblock write time. This always happens when booting a
> newly created ext4 rootfs with a target that does not have a recent time
> set.
>
> This patch moves the initial fsck run that performs the optimization
> from the target to the host system and thus prevents the target from
> performing an avoidable reboot.
>
> Signed-off-by: Enrico Jorns <ejo@pengutronix.de>
> Signed-off-by: Ulrich =C3=96lmann <uol@pengutronix.de>
> ---
>  meta/classes/image=5Ftypes.bbclass | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/meta/classes/image=5Ftypes.bbclass b/meta/classes/image=5Fty=
pes.bbclass
> index 1ce8334e3a..52d3af0cc1 100644
> --- a/meta/classes/image=5Ftypes.bbclass
> +++ b/meta/classes/image=5Ftypes.bbclass
> @@ -66,6 +66,8 @@ oe=5Fmkext234fs () {
>  	# Create a sparse image block
>  	dd if=3D/dev/zero of=3D${IMGDEPLOYDIR}/${IMAGE=5FNAME}${IMAGE=5FNAME=5F=
SUFFIX}.$fstype seek=3D$ROOTFS=5FSIZE count=3D$COUNT bs=3D1024
>  	mkfs.$fstype -F $extra=5Fimagecmd ${IMGDEPLOYDIR}/${IMAGE=5FNAME}${IMAG=
E=5FNAME=5FSUFFIX}.$fstype -d ${IMAGE=5FROOTFS}
> +	# Error codes 0-3 indicate successfull operation of fsck (no errors or =
errors corrected)
> +	fsck.$fstype -pvfD ${IMGDEPLOYDIR}/${IMAGE=5FNAME}${IMAGE=5FNAME=5FSUFF=
IX}.$fstype || [ $? -le 3 ]
>  }
>
>  IMAGE=5FCMD=5Fext2 =3D "oe=5Fmkext234fs ext2 ${EXTRA=5FIMAGECMD}"
>


