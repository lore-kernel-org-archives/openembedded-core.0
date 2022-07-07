X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Date: Thu, 7 Jul 2022 12:26:58 +0200
From: "Alexandre Belloni" <alexandre.belloni@bootlin.com>
Subject: Re: [OE-core] [PATCH] meta: introduce UBOOT_MKIMAGE_KERNEL_TYPE
Message-ID: <Ysa08vADxrU8hENO@mail.local>
References: <20220706111028.149100-1-liu.ming50@gmail.com>
 <YsWW1I3LrrA4YTv1@mail.local>
 <CALatG=7tsPYUtMqZ+etf1UMpRoQtg_dvAhojnkkUsqwOHxAmQw@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CALatG=7tsPYUtMqZ+etf1UMpRoQtg_dvAhojnkkUsqwOHxAmQw@mail.gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
List-id: <openembedded-core.lists.openembedded.org>
To: Ming Liu <liu.ming50@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>, Max Krummenacher <max.krummenacher@toradex.com>

On 07/07/2022 11:53:19+0200, Ming Liu wrote:
> Hi, Alexandre:
> 
> Thanks for the review, I did not quite follow you, you meant the 'type'
> argument being replaced wrongly? I dont see how. Could you share some
> details about your comment?
> 

See below...

> //Ming Liu
> 
> Alexandre Belloni <alexandre.belloni@bootlin.com> 於 2022年7月6日 週三 下午4:06寫道：
> 
> > Hello,
> >
> > On 06/07/2022 13:10:28+0200, Ming Liu wrote:
> > > From: Ming Liu <liu.ming50@gmail.com>
> > >
> > > Sometimes an end user might want to choose another kernel type argument
> > > for uboot-mkimage other than "kernel", for instance: "kernel_noload".
> > >
> > > Let's introduce a variable UBOOT_MKIMAGE_KERNEL_TYPE to support that,
> > > and it could be used by BSP layers as well.
> > >
> > > Signed-off-by: Ming Liu <liu.ming50@gmail.com>
> > > ---
> > >  meta/classes/kernel-fitimage.bbclass     | 2 +-
> > >  meta/classes/kernel-uboot.bbclass        | 3 +++
> > >  meta/classes/kernel-uimage.bbclass       | 2 +-
> > >  meta/lib/oeqa/selftest/cases/fitimage.py | 3 ++-
> > >  4 files changed, 7 insertions(+), 3 deletions(-)
> > >
> > > diff --git a/meta/classes/kernel-fitimage.bbclass
> > b/meta/classes/kernel-fitimage.bbclass
> > > index 7e09b075ff..2112ae4cfa 100644
> > > --- a/meta/classes/kernel-fitimage.bbclass
> > > +++ b/meta/classes/kernel-fitimage.bbclass
> > > @@ -148,7 +148,7 @@ fitimage_emit_section_kernel() {
> > >                  kernel-$2 {
> > >                          description = "Linux kernel";
> > >                          data = /incbin/("$3");
> > > -                        type = "kernel";
> > > +                        type = "${UBOOT_MKIMAGE_KERNEL_TYPE}";
> > >                          arch = "${UBOOT_ARCH}";
> > >                          os = "linux";
> > >                          compression = "$4";
> > > diff --git a/meta/classes/kernel-uboot.bbclass
> > b/meta/classes/kernel-uboot.bbclass
> > > index 2facade818..1bc98e042d 100644
> > > --- a/meta/classes/kernel-uboot.bbclass
> > > +++ b/meta/classes/kernel-uboot.bbclass
> > > @@ -2,6 +2,9 @@
> > >  FIT_KERNEL_COMP_ALG ?= "gzip"
> > >  FIT_KERNEL_COMP_ALG_EXTENSION ?= ".gz"
> > >
> > > +# Kernel image type passed to mkimage (i.e. kernel kernel_noload...)
> > > +UBOOT_MKIMAGE_KERNEL_TYPE ?= "kernel"
> > > +
> > >  uboot_prep_kimage() {
> > >       if [ -e arch/${ARCH}/boot/compressed/vmlinux ]; then
> > >               vmlinux_path="arch/${ARCH}/boot/compressed/vmlinux"
> > > diff --git a/meta/classes/kernel-uimage.bbclass
> > b/meta/classes/kernel-uimage.bbclass
> > > index cedb4fa070..e116bf0265 100644
> > > --- a/meta/classes/kernel-uimage.bbclass
> > > +++ b/meta/classes/kernel-uimage.bbclass
> > > @@ -30,6 +30,6 @@ do_uboot_mkimage() {
> > >                       awk '$3=="${UBOOT_ENTRYSYMBOL}" {print
> > "0x"$1;exit}'`
> > >       fi
> > >
> > > -     uboot-mkimage -A ${UBOOT_ARCH} -O linux -T kernel -C
> > "${linux_comp}" -a ${UBOOT_LOADADDRESS} -e $ENTRYPOINT -n
> > "${DISTRO_NAME}/${PV}/${MACHINE}" -d linux.bin ${B}/arch/${ARCH}/boot/uImage
> > > +     uboot-mkimage -A ${UBOOT_ARCH} -O ${UBOOT_MKIMAGE_KERNEL_TYPE} -T
> > kernel -C "${linux_comp}" -a ${UBOOT_LOADADDRESS} -e $ENTRYPOINT -n
> > "${DISTRO_NAME}/${PV}/${MACHINE}" -d linux.bin ${B}/arch/${ARCH}/boot/uImage
> >
> > I feel like you replace the wrong argument here.

You replace 6O linux by -O ${UBOOT_MKIMAGE_KERNEL_TYPE} while your
commit message suggests you want to replace -T kernel.


> >
> > >       rm -f linux.bin
> > >  }
> > > diff --git a/meta/lib/oeqa/selftest/cases/fitimage.py
> > b/meta/lib/oeqa/selftest/cases/fitimage.py
> > > index e6bfd1257e..7e6479c9ca 100644
> > > --- a/meta/lib/oeqa/selftest/cases/fitimage.py
> > > +++ b/meta/lib/oeqa/selftest/cases/fitimage.py
> > > @@ -763,6 +763,7 @@ FIT_HASH_ALG = "sha256"
> > >
> > >          kernel_load = str(get_bb_var('UBOOT_LOADADDRESS'))
> > >          kernel_entry = str(get_bb_var('UBOOT_ENTRYPOINT'))
> > > +        kernel_type = str(get_bb_var('UBOOT_MKIMAGE_KERNEL_TYPE'))
> > >          kernel_compression = str(get_bb_var('FIT_KERNEL_COMP_ALG'))
> > >          uboot_arch = str(get_bb_var('UBOOT_ARCH'))
> > >          fit_hash_alg = str(get_bb_var('FIT_HASH_ALG'))
> > > @@ -775,7 +776,7 @@ FIT_HASH_ALG = "sha256"
> > >              'kernel-1 {',
> > >              'description = "Linux kernel";',
> > >              'data = /incbin/("linux.bin");',
> > > -            'type = "kernel";',
> > > +            'type = "' + kernel_type + '";',
> > >              'arch = "' + uboot_arch + '";',
> > >              'os = "linux";',
> > >              'compression = "' + kernel_compression + '";',
> > > --
> > > 2.25.1
> > >
> >
> > >
> > > 
> > >
> >
> >
> > --
> > Alexandre Belloni, co-owner and COO, Bootlin
> > Embedded Linux and Kernel engineering
> > https://bootlin.com
> >

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
