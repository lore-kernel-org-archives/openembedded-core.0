Return-Path: <otavio.salvador@gmail.com>
Received: from mail-yk0-f177.google.com (mail-yk0-f177.google.com
	[209.85.160.177])
	by mail.openembedded.org (Postfix) with ESMTP id 8FCAD60144
	for <openembedded-core@lists.openembedded.org>;
	Tue,  2 Dec 2014 12:42:38 +0000 (UTC)
Received: by mail-yk0-f177.google.com with SMTP id 9so5694635ykp.8
	for <openembedded-core@lists.openembedded.org>;
	Tue, 02 Dec 2014 04:42:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date:message-id:subject
	:from:to:cc:content-type;
	bh=M2uu5C1vD6uW4r7+RN4Vsm2/YDdhmwG/ZNOihgU24kk=;
	b=HI+FTxsMyhFbPk+mJYDyvydbyinK8TosVOzEVqOtP+KsHjj2WkD3jmTHq0h0iyJsyr
	p5nLF9t7/51N9gA1Q9qrLNr9rFO7opHM3rB9KjFb35E6noW+ZXykQSbLoU9/6tl5E2VF
	CYMXkUyr8e96qPQ0SXLHAp7rCTDzkLs8WK6/bcj+x9tB3UYxRhtqSRkUskIbtg3dRJuu
	tZ6Xxm9F0yZxZq5M6taz2bVh3pLqymAjGGwV61DSbSYZ7iQHPmFRKCNZ+Gluix/831d9
	NiYAZDEzBxJ1lCpm1FQ9atffPis3C9jjeYlwxVf0Mz44Pj7SRqzxCAK3SRgXukTdqFVP
	HA0Q==
MIME-Version: 1.0
X-Received: by 10.236.39.139 with SMTP id d11mr39278240yhb.90.1417524158697;
	Tue, 02 Dec 2014 04:42:38 -0800 (PST)
Sender: otavio.salvador@gmail.com
Received: by 10.170.142.132 with HTTP; Tue, 2 Dec 2014 04:42:38 -0800 (PST)
In-Reply-To: <1416806674-15725-1-git-send-email-B40290@freescale.com>
References: <1416806674-15725-1-git-send-email-B40290@freescale.com>
Date: Tue, 2 Dec 2014 10:42:38 -0200
X-Google-Sender-Auth: 7oqT9ttTfTsdnpGsq8Sv7ay4rbc
Message-ID: <CAP9ODKpC_enxcMuq6GHQ-AaH+JTj4BOcJFyaPFkKW1xWUGeDsg@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Chunrong Guo <B40290@freescale.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2 2/2] u-boot.inc : add compile multiple u-boot feature
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
X-List-Received-Date: Tue, 02 Dec 2014 12:42:44 -0000
Content-Type: text/plain; charset=UTF-8

Hello Chunrong,

On Mon, Nov 24, 2014 at 3:24 AM, Chunrong Guo <B40290@freescale.com> wrote:
> Signed-off-by: Chunrong Guo <B40290@freescale.com>
> ---
>  meta/recipes-bsp/u-boot/u-boot.inc | 56 +++++++++++++++++++++-----------------
>  1 file changed, 31 insertions(+), 25 deletions(-)
>
> diff --git a/meta/recipes-bsp/u-boot/u-boot.inc b/meta/recipes-bsp/u-boot/u-boot.inc
> index c695b73..bd76241 100644
> --- a/meta/recipes-bsp/u-boot/u-boot.inc
> +++ b/meta/recipes-bsp/u-boot/u-boot.inc
> @@ -63,25 +63,32 @@ do_compile () {
>                 echo ${UBOOT_LOCALVERSION} > ${S}/.scmversion
>         fi
>
> -       oe_runmake ${UBOOT_MACHINE}
> -       oe_runmake ${UBOOT_MAKE_TARGET}
> +    for type in ${UBOOT_MACHINE}; do
> +        oe_runmake O=${type} ${type}
> +        oe_runmake O=${type} ${UBOOT_MAKE_TARGET}
> +        cp  ${S}/${type}/${UBOOT_BINARY}  ${S}/${type}/u-boot-${type}.bin
> +    done
> +
>  }

The out of tree build has caused some headache in one of our internal
customer layers; it was indeed caused by a "bug" in the respective
recipe but I think it is worth mention that it now builds using out of
tree in the commit log so people are aware.

There are two things which has catch my attention here:

 * filename uglyness: the filename in deploy dir is using the
UBOOT_MACHINE however the UBOOT_CONFIG 'name' would be better as it is
more meaningful.

 * difficulty to figure the binary when generating the rootfs: in
meta-fsl-arm, for example, we generate the .sdcard rootfs and using
the patch we now have...

ERROR: Error: The image creation script
'.../tmp/work/imx6qsabresd-oel-linux-gnueabi/core-image-minimal/1.0-r0/temp/create_image.sdcard'
returned 1:
0+0 records in
0+0 records out
0 bytes (0 B) copied, 1.3395e-05 s, 0.0 kB/s
Model:  (file)
Disk .../tmp/deploy/images/imx6qsabresd/core-image-minimal-imx6qsabresd-20141202123437.rootfs.sdcard:
67.1MB
Sector size (logical/physical): 512B/512B
Partition Table: msdos
Disk Flags:

Number  Start   End     Size    Type     File system  Flags
 1      4194kB  12.6MB  8389kB  primary               lba
 2      12.6MB  62.9MB  50.3MB  primary

dd: opening `.../tmp/deploy/images/imx6qsabresd/u-boot-imx6qsabresd.imx':
No such file or directory
WARNING: .../tmp/work/imx6qsabresd-oel-linux-gnueabi/core-image-minimal/1.0-r0/temp/create_image.sdcard:1
exit 1 from
  dd if=.../tmp/deploy/images/imx6qsabresd/u-boot-imx6qsabresd.imx
of=.../tmp/deploy/images/imx6qsabresd/core-image-minimal-imx6qsabresd-20141202123437.rootfs.sdcard
conv=notrunc seek=2 skip=0 bs=512

ERROR: Function failed: do_rootfs
ERROR: Logfile of failure stored in:
.../tmp/work/imx6qsabresd-oel-linux-gnueabi/core-image-minimal/1.0-r0/temp/log.do_rootfs.31415
ERROR: Task 7 (.../poky/meta/recipes-core/images/core-image-minimal.bb,
do_rootfs) failed with exit code '1'

Do you have any idea how we could address those issues?

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

