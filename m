Return-Path: <otavio.salvador@gmail.com>
Received: from mail-ob0-f173.google.com (mail-ob0-f173.google.com
	[209.85.214.173])
	by mail.openembedded.org (Postfix) with ESMTP id C324E6B266
	for <openembedded-core@lists.openembedded.org>;
	Mon, 22 Jul 2013 15:23:59 +0000 (UTC)
Received: by mail-ob0-f173.google.com with SMTP id wc20so8191707obb.4
	for <openembedded-core@lists.openembedded.org>;
	Mon, 22 Jul 2013 08:24:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:cc:content-type
	:content-transfer-encoding;
	bh=JLSZbGG1565Z0Gj7S+AhNdpNOm5d5hqFYIJhQIkJewc=;
	b=rIqiWuiQ6TGx3dB+DhUqUewx2m3X8ZIp5OmiqQ4Rx/5n1LF4WZqaG20mCWL4/RnrS9
	aPnmarKK+Mz0dJvIHVkdbnripLATH8vojdeyHpeniYBoHlZhUTOOj9DdtQhEz8Eyf3KU
	J7LoclFkUyNszQtKIqviF4UFg1uggvUlAA0dZxfFjuvQ16bq5vnELcM71ewUfBc6hLsz
	OOs0vke0GLYf87GNXdaetj42uCUzkciOUm4HnUBCuv1IIWmTh2g/UVfFhsAQdnBE9/pr
	elAEr0YGkqePDlQJ1bqzLeIQItD+yphTAEeW1Yp+SdK/CrNQ5MPEZSrcox6wkt6fkrQK
	m53w==
MIME-Version: 1.0
X-Received: by 10.60.115.199 with SMTP id jq7mr26627541oeb.19.1374506639740;
	Mon, 22 Jul 2013 08:23:59 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.182.60.166 with HTTP; Mon, 22 Jul 2013 08:23:59 -0700 (PDT)
In-Reply-To: <CADkTA4MRXOK2P3HwMtt=ntXraJR=se+VyQyP-BKCOW89nA8RFA@mail.gmail.com>
References: <CAPaOLoJa1UjGaPqVeSmJavm0rMzNoFE6+KzfDO3ALOjRJeJ3Hg@mail.gmail.com>
	<1374501746-23540-1-git-send-email-andre.draszik@linaro.org>
	<CADkTA4MRXOK2P3HwMtt=ntXraJR=se+VyQyP-BKCOW89nA8RFA@mail.gmail.com>
Date: Mon, 22 Jul 2013 12:23:59 -0300
X-Google-Sender-Auth: bTc_1AU0h_GbAsxgkhBlpfXZdmY
Message-ID: <CAP9ODKpzHm==YmttmgMkVD2-bqz0ds24ZZnqS+3kq+GQY=rEXw@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] linux-dtb: allow to build dtb using support from kernel
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
X-List-Received-Date: Mon, 22 Jul 2013 15:24:00 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 22, 2013 at 11:52 AM, Bruce Ashfield
<bruce.ashfield@gmail.com> wrote:
> On Mon, Jul 22, 2013 at 10:02 AM, Andr=E9 Draszik
> <andre.draszik@linaro.org> wrote:
>> Currently, OE is unable to use the linux kernel's built-in
>> support to generate a device tree blob (dtb). This is an
>> issue for device tree source (dts) files that need to be run
>> through CPP (dtsp).
>
> It's not clear to me (from the commit message), why the dtc recipe can't
> provide what we need. I don't object to using the in kernel tree dtc, but
> all the reasons why there are no other options need to be in the commit
> message.
>
>>
>> The kernel build system has built-in support for device tree
>> source files that /include/ additional files and it also
>> supports the source file to be pre-processed using CPP.
>>
>> This commits lets OE use kbuild if $KERNEL_DEVICETREE points
>> to file(s) that are located in arch/${ARCH}/boot/dts/, e.g.
>> KERNEL_DEVICETREE =3D "<machine>.dts". In this case, no
>> dependency is added on dtc-native, as that is not needed any
>> more.
>>
>
> What happens with SDK builds ? i.e. if nativsdk versions of the dtc recip=
e are
> used, we'll still have the functional gap.
>
>> The previous way of handling dts files, i.e. compilation via
>> the stand-alone dtc-native, is still supported - it is triggered
>> by specifying the full path to the dts file, as before, e.g.
>> KERNEL_DEVICETREE =3D "arch/${ARCH}/boot/dts/<machine>.dts"
>>
>> Signed-off-by: Andr=E9 Draszik <andre.draszik@linaro.org>
>> ---
>>  meta/recipes-kernel/linux/linux-dtb.inc | 75 ++++++++++++++++++++++++++=
+------
>>  1 file changed, 63 insertions(+), 12 deletions(-)
>>
>> diff --git a/meta/recipes-kernel/linux/linux-dtb.inc b/meta/recipes-kern=
el/linux/linux-dtb.inc
>> index 7747718..75b8b76 100644
>> --- a/meta/recipes-kernel/linux/linux-dtb.inc
>> +++ b/meta/recipes-kernel/linux/linux-dtb.inc
>> @@ -1,28 +1,66 @@
>> +inherit kernel-arch
>> +
>>  # Support for device tree generation
>>  FILES_kernel-devicetree =3D "/boot/devicetree*"
>>  KERNEL_DEVICETREE_FLAGS ?=3D "-R 8 -p 0x3000"
>>
>>  python __anonymous () {
>> +    from os import path
>> +
>>      devicetree =3D d.getVar("KERNEL_DEVICETREE", True) or ''
>>      if devicetree:
>> -        depends =3D d.getVar("DEPENDS", True)
>> -        d.setVar("DEPENDS", "%s dtc-native" % depends)
>> +        S =3D d.getVar("S", True)
>> +        for DTS_FILE in devicetree.split():
>> +            DTS_FILE =3D S + "/" + DTS_FILE
>> +            if os.path.exists(DTS_FILE):
>> +                # full path given, use dtc-native
>> +                print "old style KERNEL_DEVICETREE, adding depend on dt=
c-native"
>> +                depends =3D d.getVar("DEPENDS", True)
>> +                d.setVar("DEPENDS", "%s dtc-native" % depends)
>> +            else:
>> +                # new style - it's just a file name, under arch/${ARCH}=
/boot/dts
>> +                # we don't need dtc-native, as we use the kernel's comp=
iler
>> +                print "new style KERNEL_DEVICETREE"
>
> There really needs to be a flag or other option to override this detectio=
n.

Yes; I flag would be good indeed.

>>          packages =3D d.getVar("PACKAGES", True)
>>          d.setVar("PACKAGES", "%s kernel-devicetree" % packages)
>>  }
>>
>> -do_install_append() {
>> +do_compile_append() {
>>         if test -n "${KERNEL_DEVICETREE}"; then
>>                 for DTS_FILE in ${KERNEL_DEVICETREE}; do
>>                         if [ ! -f ${DTS_FILE} ]; then
>> -                               echo "Warning: ${DTS_FILE} is not availa=
ble!"
>> -                               continue
>> +                               if [ ! -f arch/${ARCH}/boot/dts/${DTS_FI=
LE} ]; then
>> +                                       echo "Warning: ${DTS_FILE} is no=
t available!"
>> +                                       continue
>> +                               fi
>> +
>> +                               # standard build using kbuild
>> +                               echo "Info: standard kbuild for device t=
ree blob"
>> +                               DTS_BASE_NAME=3D`basename ${DTS_FILE} | =
awk -F "." '{print $1}'`
>> +
>> +                               unset CFLAGS CPPFLAGS CXXFLAGS LDFLAGS M=
ACHINE
>> +                               oe_runmake ${DTS_BASE_NAME}.dtb CC=3D"${=
KERNEL_CC}" LD=3D"${KERNEL_LD}" ${KERNEL_EXTRA_ARGS}
>>                         fi
>> +               done
>> +       fi
>> +}
>> +
>> +do_install_append() {
>> +       if test -n "${KERNEL_DEVICETREE}"; then
>> +               for DTS_FILE in ${KERNEL_DEVICETREE}; do
>>                         DTS_BASE_NAME=3D`basename ${DTS_FILE} | awk -F "=
." '{print $1}'`
>> -                       DTB_NAME=3D`echo ${KERNEL_IMAGE_BASE_NAME} | sed=
 "s/${MACHINE}/${DTS_BASE_NAME}/g"`
>>                         DTB_SYMLINK_NAME=3D`echo ${KERNEL_IMAGE_SYMLINK_=
NAME} | sed "s/${MACHINE}/${DTS_BASE_NAME}/g"`
>> -                       dtc -I dts -O dtb ${KERNEL_DEVICETREE_FLAGS} -o =
${DTS_BASE_NAME} ${DTS_FILE}
>> -                       install -m 0644 ${DTS_BASE_NAME} ${D}/boot/devic=
etree-${DTB_SYMLINK_NAME}.dtb
>> +                       if [ ! -f ${DTS_FILE} ]; then
>
> Since install comes after compile, it would be better to test on the resu=
lts of
> the compile phase (i.e. is there a dtb already), and keep the checking on=
 the
> existence of the DTS in as few places as possible. In particular, since t=
here
> should still be an opt-out flag, having as few touches as possible is bet=
ter.
>
>
>> +                               if [ ! -f arch/${ARCH}/boot/dts/${DTS_FI=
LE} ]; then
>> +                                       echo "Warning: ${DTS_FILE} is no=
t available!"
>> +                                       continue
>> +                               fi
>> +
>> +                               install -m 0644 arch/${ARCH}/boot/${DTS_=
BASE_NAME}.dtb ${D}/boot/devicetree-${DTB_SYMLINK_NAME}.dtb
>> +                               continue
>> +                       fi
>> +                       dtc -I dts -O dtb ${KERNEL_DEVICETREE_FLAGS} -o =
${DTS_BASE_NAME}.dtb ${DTS_FILE}
>> +                       install -m 0644 ${DTS_BASE_NAME}.dtb ${D}/boot/d=
evicetree-${DTB_SYMLINK_NAME}.dtb
>>                 done
>>         fi
>>  }
>> @@ -30,15 +68,28 @@ do_install_append() {
>>  do_deploy_append() {
>>         if test -n "${KERNEL_DEVICETREE}"; then
>>                 for DTS_FILE in ${KERNEL_DEVICETREE}; do
>> +                       DTS_BASE_NAME=3D`basename ${DTS_FILE} | awk -F "=
." '{print $1}'`
>>                         if [ ! -f ${DTS_FILE} ]; then
>> -                               echo "Warning: ${DTS_FILE} is not availa=
ble!"
>> -                               continue
>> +                               if [ ! -f arch/${ARCH}/boot/dts/${DTS_FI=
LE} ]; then
>> +                                       echo "Warning: ${DTS_FILE} is no=
t available!"
>> +                                       continue
>> +                               fi
>> +
>> +                               # standard build using kbuild
>> +                               echo "Info: standard kbuild for device t=
ree blob"
>>                         fi
>> -                       DTS_BASE_NAME=3D`basename ${DTS_FILE} | awk -F "=
." '{print $1}'`
>> +
>>                         DTB_NAME=3D`echo ${KERNEL_IMAGE_BASE_NAME} | sed=
 "s/${MACHINE}/${DTS_BASE_NAME}/g"`
>>                         DTB_SYMLINK_NAME=3D`echo ${KERNEL_IMAGE_SYMLINK_=
NAME} | sed "s/${MACHINE}/${DTS_BASE_NAME}/g"`
>> +
>>                         install -d ${DEPLOYDIR}
>> -                       install -m 0644 ${B}/${DTS_BASE_NAME} ${DEPLOYDI=
R}/${DTB_NAME}.dtb
>> +
>> +                       if [ -f arch/${ARCH}/boot/dts/${DTS_FILE} ]; the=
n
>
> This should really be testing on the dtb, not the DTS. We could also
> have a single install
> line, if any testing is done at the top of the routine and a single
> variable set to point to
> the dtb, wherever it may be.
>
> Cheers,
>
> Bruce
>
>> +                               install -m 0644 ${B}/arch/${ARCH}/boot/$=
{DTS_BASE_NAME}.dtb ${DEPLOYDIR}/${DTB_NAME}.dtb
>> +                       else
>> +                               install -m 0644 ${B}/${DTS_BASE_NAME}.dt=
b ${DEPLOYDIR}/${DTB_NAME}.dtb
>> +                       fi
>> +
>>                         cd ${DEPLOYDIR}
>>                         ln -sf ${DTB_NAME}.dtb ${DTB_SYMLINK_NAME}.dtb
>>                         cd -
>> --
>> 1.8.2
>>
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>
>
>
> --
> "Thou shalt not follow the NULL pointer, for chaos and madness await
> thee at its end"



--
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://projetos.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

