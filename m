Return-Path: <otavio.salvador@gmail.com>
Received: from mail-ob0-f181.google.com (mail-ob0-f181.google.com
	[209.85.214.181])
	by mail.openembedded.org (Postfix) with ESMTP id 6CEFC60EEC
	for <openembedded-core@lists.openembedded.org>;
	Wed, 18 Sep 2013 03:36:23 +0000 (UTC)
Received: by mail-ob0-f181.google.com with SMTP id gq1so6566968obb.40
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 Sep 2013 20:36:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date:message-id:subject
	:from:to:cc:content-type:content-transfer-encoding;
	bh=AdupMyRjKFXSDcMW6rYEzBORtw+sMTfVGAARlK2OuWY=;
	b=N4OW7cNS2gviSLaCr4TDaK8SqZRIwLHgCX0pYiqHXTCBNIukdaH5aO7M4iLDCUJSuG
	KqvdjbplbcjVBiFXUmgq6TDSCdyQH71jUOwKBmIdH9AhJQzh3+xmJb+vnxOuL8OTHBH6
	BxA4D9d7znS3jYrDWmmVKSa5LOAFu/uGf450CHKW+MhlS+1xTkjPF0GaxH5Mm1OLJzVl
	5CVS2YTnw6AGAG8r57jug4z3bMEKP3pfzztQBS0KwyV8gp5u61ls5GVBg1yNlQ7Dmrq0
	HsshKtToAUQTCtDIRelb3mMh0FLI/4mGUkmdzljJBPcShxqDdP4dypUr46EfpjJZgSi4
	g6Lg==
MIME-Version: 1.0
X-Received: by 10.182.71.82 with SMTP id s18mr32926250obu.9.1379475385017;
	Tue, 17 Sep 2013 20:36:25 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.182.232.166 with HTTP; Tue, 17 Sep 2013 20:36:24 -0700 (PDT)
In-Reply-To: <5238EA0D.2010108@linux.intel.com>
References: <cover.1379100075.git.anders@chargestorm.se>
	<a8748357e163efb38b354d4142293393c2a2cc9a.1379100075.git.anders@chargestorm.se>
	<5238EA0D.2010108@linux.intel.com>
Date: Wed, 18 Sep 2013 00:36:24 -0300
X-Google-Sender-Auth: PuGufaFCEhOQ4xK-TEScdTABpMk
Message-ID: <CAP9ODKp7fRrXguPO9un4XKJfQfCFOs0gjSErnDAjfmht7evd=w@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Saul Wold <sgw@linux.intel.com>
Cc: Anders Darander <anders@chargestorm.se>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] u-boot-fw-utils: reinstate target recipe for fw_printenv
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
X-List-Received-Date: Wed, 18 Sep 2013 03:36:23 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 17, 2013 at 8:47 PM, Saul Wold <sgw@linux.intel.com> wrote:
> On 09/13/2013 12:21 PM, Anders Darander wrote:
>>
>> The latest upgrade changed u-boot-fw-utils to u-boot-fw-utils-cross, whi=
ch
>> removed the on-target fw_printenv (and fw_setenv).
>>
>> Re-create the updated version of the u-boot-fw-utils recipe.
>>
>> U-Boot does try to strip the fw_printenv binary by default now. To avoid
>> this, without patching the Makefile, we add HOSTSTRIP=3Dtrue to
>> EXTRA_OEMAKE.
>>
>> The new U-Boot do also require us to configure the build for a specific
>> machine, thus we change the package arch.=A7
>>
>> Signed-off-by: Anders Darander <anders@chargestorm.se>
>> ---
>>   meta/recipes-bsp/u-boot/u-boot-fw-utils_2013.07.bb | 31
>> ++++++++++++++++++++++
>>   1 file changed, 31 insertions(+)
>>   create mode 100644 meta/recipes-bsp/u-boot/u-boot-fw-utils_2013.07.bb
>>
>> diff --git a/meta/recipes-bsp/u-boot/u-boot-fw-utils_2013.07.bb
>> b/meta/recipes-bsp/u-boot/u-boot-fw-utils_2013.07.bb
>> new file mode 100644
>> index 0000000..f97df71
>> --- /dev/null
>> +++ b/meta/recipes-bsp/u-boot/u-boot-fw-utils_2013.07.bb
>> @@ -0,0 +1,31 @@
>> +DESCRIPTION =3D "U-boot bootloader fw_printenv/setenv utils"
>> +LICENSE =3D "GPLv2+"
>> +LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D1707d6db1d42237583f50183a565=
1ecb"
>> +SECTION =3D "bootloader"
>> +DEPENDS =3D "mtd-utils"
>> +
>> +# This revision corresponds to the tag "v2013.07"
>> +# We use the revision in order to avoid having to fetch it from the
>> +# repo during parse
>> +SRCREV =3D "62c175fbb8a0f9a926c88294ea9f7e88eb898f6c"
>> +
>> +PV =3D "v2013.07+git${SRCPV}"
>> +
>> +SRC_URI =3D "git://git.denx.de/u-boot.git;branch=3Dmaster;protocol=3Dgi=
t"
>> +
>> +S =3D "${WORKDIR}/git"
>> +
>> +EXTRA_OEMAKE =3D 'HOSTCC=3D"${CC}" HOSTSTRIP=3D"true"'
>> +
>> +do_compile () {
>> +  oe_runmake ${UBOOT_MACHINE}
>> +  oe_runmake env
>> +}
>> +
>> +do_install () {
>> +  install -d ${D}${base_sbindir}
>> +  install -m 755 ${S}/tools/env/fw_printenv
>> ${D}${base_sbindir}/fw_printenv
>> +  install -m 755 ${S}/tools/env/fw_printenv ${D}${base_sbindir}/fw_sete=
nv
>> +}
>> +
>> +PACKAGE_ARCH =3D "${MACHINE_ARCH}"
>>
>
> I think this might need a COMPATIBLE_MACHINE or some check for correct
> systems
>>
>> ERROR: Function failed: do_compile (log file is located at
>> /srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-world/buil=
d/build/tmp/work/qemux86-pokymllib32-linux/lib32-u-boot-fw-utils/v2013.07+g=
itAUTOINC+62c175fbb8-r0/temp/log.do_compile.4727)
>> ERROR: Logfile of failure stored in:
>> /srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-world/buil=
d/build/tmp/work/qemux86-pokymllib32-linux/lib32-u-boot-fw-utils/v2013.07+g=
itAUTOINC+62c175fbb8-r0/temp/log.do_compile.4727
>> Log data follows:
>> | DEBUG: Executing shell function do_compile
>> | NOTE: make -j 16 HOSTCC=3Di586-pokymllib32-linux-gcc  -m32
>> --sysroot=3D/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightl=
y-world/build/build/tmp/sysroots/lib32-qemux86
>> HOSTSTRIP=3Dtrue
>> | System not configured - see README
>> | make: *** [all] Error 1
>> | ERROR: oe_runmake failed
>> | WARNING:
>> /srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-world/buil=
d/build/tmp/work/qemux86-pokymllib32-linux/lib32-u-boot-fw-utils/v2013.07+g=
itAUTOINC+62c175fbb8-r0/temp/run.do_compile.4727:1
>> exit 1 from
>> |   exit 1
>> | ERROR: Function failed: do_compile (log file is located at
>> /srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-world/buil=
d/build/tmp/work/qemux86-pokymllib32-linux/lib32-u-boot-fw-utils/v2013.07+g=
itAUTOINC+62c175fbb8-r0/temp/log.do_compile.4727)
>> NOTE: recipe lib32-u-boot-fw-utils-v2013.07+gitAUTOINC+62c175fbb8-r0: ta=
sk
>> do_compile: Failed

I sent a fix for this.

Please give it a try in autobuilder.

--=20
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

