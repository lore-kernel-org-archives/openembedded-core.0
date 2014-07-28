Return-Path: <freesilicon@gmail.com>
Received: from mail-yk0-f176.google.com (mail-yk0-f176.google.com
	[209.85.160.176])
	by mail.openembedded.org (Postfix) with ESMTP id B50C165CFF
	for <openembedded-core@lists.openembedded.org>;
	Mon, 28 Jul 2014 12:15:11 +0000 (UTC)
Received: by mail-yk0-f176.google.com with SMTP id 19so4570692ykq.21
	for <openembedded-core@lists.openembedded.org>;
	Mon, 28 Jul 2014 05:15:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type:content-transfer-encoding;
	bh=7ZnR65zxGu+2TSW07aKh8zDgNB/8+f48zlWRY2/2xsU=;
	b=SLLN8v5INm1Jk2/hmIldMwxcy40J5u6LXLuhPGMa4aZNzVF7FpXW63qXOiZliNWNfq
	BP/ZAFwCYETUtP05buvqm2xDxJeJfRpi0M1deUAUwnLOFRqf4perGNXcxSmFktE/o+VX
	FNDMMxphBxE9vSKC2xcPGhMACrELEJ25fO9Sk/E7SSPAhE1UQvYR0L2oSoiaYIdg54Mi
	Ewz2grGPECXYo8UJMZuUg1yMXDZkN2JgwUIeGQKLDi+lopfQ3ywJz332hUqsxqTlN5kr
	EoIqeK2JKpxMMr3v19Fqv6ZV9SV9/2cBw1rTAtvJywy/MuRJPPwJy4cL61yM7w03eUmp
	Z0Pg==
MIME-Version: 1.0
X-Received: by 10.236.57.232 with SMTP id o68mr48112493yhc.75.1406549712677;
	Mon, 28 Jul 2014 05:15:12 -0700 (PDT)
Received: by 10.170.123.210 with HTTP; Mon, 28 Jul 2014 05:15:12 -0700 (PDT)
In-Reply-To: <20140728135853.35af7ee0@e6520eb>
References: <1406541304-18741-1-git-send-email-freesilicon@gmail.com>
	<20140728135853.35af7ee0@e6520eb>
Date: Mon, 28 Jul 2014 14:15:12 +0200
Message-ID: <CAKRNOGx_e_cNLuzhETFuL2k12fhGsHBPdYT9ND8uP_F67=VA7A@mail.gmail.com>
From: David Vincent <freesilicon@gmail.com>
To: =?UTF-8?B?RXJpYyBCw6luYXJk?= <eric@eukrea.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] barebox: Add recipe
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
X-List-Received-Date: Mon, 28 Jul 2014 12:15:20 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hi Eric,

2014-07-28 13:58 GMT+02:00 Eric B=C3=A9nard <eric@eukrea.com>:
> Hi David,
>
> Le Mon, 28 Jul 2014 11:55:04 +0200,
> David Vincent <freesilicon@gmail.com> a =C3=A9crit :
>
>>
>> barebox (formerly known as u-boot-v2) is a bootloader that inherits the
>> best of U-Boot and the Linux kernel. This commit adds the possibility to
>> use it as a virtual/bootloader instead of U-Boot.
>>
>> Signed-off-by: David Vincent <freesilicon@gmail.com>
>> ---
>>  meta/recipes-bsp/barebox/barebox.inc          |   73 ++++++++++++++++++=
+++++++
>>  meta/recipes-bsp/barebox/barebox_2014.07.0.bb |   15 +++++
>>  2 files changed, 88 insertions(+)
>>  create mode 100644 meta/recipes-bsp/barebox/barebox.inc
>>  create mode 100644 meta/recipes-bsp/barebox/barebox_2014.07.0.bb
>>
>> diff --git a/meta/recipes-bsp/barebox/barebox.inc b/meta/recipes-bsp/bar=
ebox/barebox.inc
>> new file mode 100644
>> index 0000000..68aeb68
>> --- /dev/null
>> +++ b/meta/recipes-bsp/barebox/barebox.inc
>> @@ -0,0 +1,73 @@
>> +SUMMARY =3D "The Barebox Bootloader"
>> +DESCRIPTION =3D "Barebox (formerly known as u-boot-v2) is a bootloader =
that inherits the best of U-Boot and the Linux kernel: The size and look-an=
d-feel of u-boot, with driver model and lots of design concepts from the ke=
rnel."
>> +HOMEPAGE =3D "http://www.barebox.org"
>> +SECTION =3D "bootloaders"
>> +PROVIDES =3D "virtual/bootloader"
>> +
>> +inherit cml1 deploy kernel-arch
>> +
>> +EXTRA_OEMAKE =3D 'CROSS_COMPILE=3D${TARGET_PREFIX} CC=3D"${TARGET_PREFI=
X}gcc ${TOOLCHAIN_OPTIONS}"'
>> +
>> +BAREBOX_BINARY ?=3D "barebox.bin"
>> +BAREBOX_IMAGE ?=3D "barebox-${MACHINE}-${PV}-${PR}.bin"
>> +BAREBOX_SYMLINK ?=3D "barebox-${MACHINE}.bin"
>> +
>> +do_configure () {
>> +     # Copy defconfig to .config if .config does not exist. This allows
>> +     # recipes to manage the .config themselves in do_configure_prepend=
().
>> +     if [ -f "${WORKDIR}/defconfig" ] && [ ! -f "${B}/.config" ]; then
>> +             cp "${WORKDIR}/defconfig" "${B}/.config"
>> +     fi
>> +
>> +     # Use board default defconfig if .config does not exist. This allo=
ws
>> +     # recipes to manage the .config themselves in do_configure_prepend=
().
>> +     if [ ! -f "${B}/.config" ]; then
>> +             oe_runmake_call ${BAREBOX_TARGET}
>> +     fi
>> +
>> +     cml1_do_configure
>> +}
>> +
>> +do_compile () {
>> +     if [ "${@bb.utils.contains('DISTRO_FEATURES', 'ld-is-gold', 'ld-is=
-gold', '', d)}" =3D "ld-is-gold" ] ; then
>> +             sed -i 's/$(CROSS_COMPILE)ld$/$(CROSS_COMPILE)ld.bfd/g' ${=
S}/Makefile
>> +     fi
>> +
> I had to add that a few year ago : is that still needed ?

Don't know, I've taken that directly from u-boot recipe (didn't want
to reinvent the wheel)

>
>> +     unset CFLAGS CPPFLAGS LDFLAGS
>> +     oe_runmake
>> +}
>> +
>> +do_install () {
>> +     install -d ${D}/boot
>> +     install ${S}/barebox-flash-image ${D}/boot/${BAREBOX_IMAGE}
>> +     ln -sf ${BAREBOX_IMAGE} ${D}/boot/${BAREBOX_BINARY}
>> +
>> +     # Install target tools if available
>> +     install -d ${D}${sbindir}
>> +
>> +     if [ -e ${WORKDIR}/scripts/bareboxenv-target ]; then
>> +             install -m 0755 ${WORKDIR}/scripts/bareboxenv-target ${D}$=
{sbindir}/bareboxenv
>> +     fi
>> +
>> +     if [ -e ${WORKDIR}/scripts/bareboxcrc32-target ]; then
>> +             install -m 0755 ${WORKDIR}/scripts/bareboxcrc32-target ${D=
}${sbindir}/bareboxcrc32
>> +     fi
>> +
>> +     if [ -e ${WORKDIR}/scripts/kernel-install-target ]; then
>> +             install -m 0755 ${WORKDIR}/scripts/kernel-install-target $=
{D}${sbindir}/kernel-install
>> +     fi
>> +}
>> +
>> +FILES_${PN} =3D "/boot ${sbindir}"
>
> Why not splitting the tools in their own package so that we can have
> the tools on the target without having the binary in /boot ?

Create a barebox-tools recipe should also solve some problems I have
building the said tools (but it is more a question related to barebox
team than OE). I can do it if this request gets accepted. Could be a
v2 for this patch.

>
>> +
>> +do_deploy () {
>> +     install -d ${DEPLOYDIR}
>> +     install ${S}/barebox-flash-image ${DEPLOYDIR}/${BAREBOX_IMAGE}
>> +
> Why don't you use $BAREBOX_BINARY instead of hardcoding
> barebox-flash-image which won't work on old versions of barebox where
> barebox's binary is named barebox.bin ?

I didn't know that, but I am not sure I can use $BAREBOX_BINARY since
this variable is used in $DEPLOY_DIR. I tried to mimic u-boot recipe
behavior as much as possible.

>
> Best regards,
> Eric

Greetings,

David

