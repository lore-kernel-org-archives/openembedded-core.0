Received: from mail-pz0-f47.google.com ([209.85.210.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <bruce.ashfield@gmail.com>) id 1SfxGN-0007jL-1S
	for openembedded-core@lists.openembedded.org;
	Sat, 16 Jun 2012 19:58:19 +0200
Received: by dalh21 with SMTP id h21so5059930dal.6
	for <openembedded-core@lists.openembedded.org>;
	Sat, 16 Jun 2012 10:47:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type:content-transfer-encoding;
	bh=BqnaLZrqmrVAt1esix6SOlOhDjKkf0F4FSN3w88Pr4w=;
	b=l9a+/p7mkPQkXphYYealZRnyCv/aIyQoDxFKT2HmJ7JwzFLkbuZdmCfgz2AQM1xLG4
	o3mbrPBozJek6H5y4g/hYfTqYCBIs85gkiVq1QvzDDE1niYTrWvRRB9XZRyvp1A8Dbng
	oRrYId7ahKg5gtPvKXuwYpf6Z27gahwR7/I5TDrHAx+0rKmUHryOeAm48oJwFOd+m83C
	LHxxk5hkfPzrqW31l8nbbJuxZw5i2eWdngxajIgQFD6VrlVpK1ChgpV3z15txdZiPgJ/
	rg48+B9ORpnHfYUS8gN2dtV5VQMzPRA6GOUGbBcCVH6gF6J+rItuOrnLplqcj8BoYh9i
	K8RA==
MIME-Version: 1.0
Received: by 10.68.217.100 with SMTP id ox4mr33175813pbc.87.1339868858121;
	Sat, 16 Jun 2012 10:47:38 -0700 (PDT)
Received: by 10.68.197.4 with HTTP; Sat, 16 Jun 2012 10:47:38 -0700 (PDT)
In-Reply-To: <4FDCC3AC.9030703@intel.com>
References: <cover.1339791495.git.bruce.ashfield@windriver.com>
	<40732c1c548493a69d437f3fbb125affa338b3e9.1339791495.git.bruce.ashfield@windriver.com>
	<4FDCC3AC.9030703@intel.com>
Date: Sat, 16 Jun 2012 13:47:38 -0400
Message-ID: <CADkTA4ORR+sESK=1oGL32W7QavMAqV=8JVHArSkqhXLoWiuRAw@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Cc: liang.li@windriver.com
Subject: Re: [PATCH 1/2] recipes-kernel: make perf a standalone package
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
X-List-Received-Date: Sat, 16 Jun 2012 17:58:19 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Sat, Jun 16, 2012 at 1:34 PM, Saul Wold <saul.wold@intel.com> wrote:
> On 06/15/2012 01:23 PM, Bruce Ashfield wrote:
>>
>> From: Liang Li<liang.li@windriver.com>
>>
>> perf has been coupled to the kernel packages via kernel.bbclass.
>> While maintaining the build of perf out of the kernel source tree
>> is desired the package coupling has proved to be awkward in
>> several situations such as:
>>
>> =A0 - when a kernel recipe doesn't want to build/provide perf
>> =A0 - when licensing of dependencies would prohibit perf and hence
>> =A0 =A0 the kernel from being built.
>>
>> To solve some of these problems, this recipe is the extraction of
>> the linux-tools.inc provided perf compilation into a standalone
>> perf recipe that builds out of the kernel source, but is otherwise
>> independent.
>>
>> No new functionality is provided above what the linux-tools.inc
>> variant provided, but the separate recipe provides baseline for
>> adding new functionality.
>>
>> Signed-off-by: Liang Li<liang.li@windriver.com>
>> Signed-off-by: Bruce Ashfield<bruce.ashfield@windriver.com>
>> ---
>> =A0meta/classes/kernel.bbclass =A0 =A0 =A0 =A0 =A0| =A0 =A07 +----
>> =A0meta/recipes-kernel/perf/perf_3.4.bb | =A0 52
>> ++++++++++++++++++++++++++++++++++
>> =A02 files changed, 53 insertions(+), 6 deletions(-)
>> =A0create mode 100644 meta/recipes-kernel/perf/perf_3.4.bb
>>
>> diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
>> index 116e10b..02234df 100644
>> --- a/meta/classes/kernel.bbclass
>> +++ b/meta/classes/kernel.bbclass
>> @@ -469,7 +469,7 @@ python populate_packages_prepend () {
>> =A0 =A0 =A0 =A0metapkg =3D "kernel-modules"
>> =A0 =A0 =A0 =A0d.setVar('ALLOW_EMPTY_' + metapkg, "1")
>> =A0 =A0 =A0 =A0d.setVar('FILES_' + metapkg, "")
>> - =A0 =A0 =A0 blacklist =3D [ 'kernel-dev', 'kernel-image', 'kernel-base=
',
>> 'kernel-vmlinux', 'perf', 'perf-dbg', 'kernel-misc' ]
>> + =A0 =A0 =A0 blacklist =3D [ 'kernel-dev', 'kernel-image', 'kernel-base=
',
>> 'kernel-vmlinux', 'kernel-misc' ]
>> =A0 =A0 =A0 =A0for l in module_deps.values():
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0for i in l:
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0pkg =3D module_pattern %
>> legitimize_package_name(re.match(module_regex,
>> os.path.basename(i)).group(1))
>> @@ -548,8 +548,3 @@ addtask deploy before do_build after do_install
>>
>> =A0EXPORT_FUNCTIONS do_deploy
>>
>> -# perf must be enabled in individual kernel recipes
>> -PACKAGES =3D+ "perf-dbg perf"
>> -FILES_perf =3D "${bindir}/* \
>> - =A0 =A0 =A0 =A0 =A0 =A0 =A0${libexecdir}"
>> -FILES_perf-dbg =3D "${FILES_${PN}-dbg}"
>> diff --git a/meta/recipes-kernel/perf/perf_3.4.bb
>> b/meta/recipes-kernel/perf/perf_3.4.bb
>> new file mode 100644
>> index 0000000..9c8ceb0
>> --- /dev/null
>> +++ b/meta/recipes-kernel/perf/perf_3.4.bb
>> @@ -0,0 +1,52 @@
>> +SUMMARY =3D "Performance analysis tools for Linux"
>> +DESCRIPTION =3D "Performance counters for Linux are a new kernel-based =
\
>> +subsystem that provide a framework for all things \
>> +performance analysis. It covers hardware level \
>> +(CPU/PMU, Performance Monitoring Unit) features \
>> +and software features (software counters, tracepoints) \
>> +as well."
>> +
>> +LICENSE =3D "GPLv2"
>> +LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Dd7810fab7487fb0aad327b76f1be=
7cd7"
>> +
>
> This fails to find the correct file in the poky-lsb case, not sure what i=
s
> going on yet, but here is the error from the autobuilder.
>
> ERROR: Function failed: perf: LIC_FILES_CHKSUM points to an invalid file:
> /srv/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-x86/build/build=
/tmp/sysroots/qemux86/kernel/source/COPYING
> NOTE: package perf-3.4-r0: task do_configure: Failed
> ERROR: Task 3336
> (/srv/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-x86/build/meta=
/recipes-kernel/perf/perf_3.4.bb,
> do_configure) failed with exit code '1'
>
> This can be reproduced by setting DISTRO=3D"poky-lsb" in your local.conf

ok. Either Liang or myself will have a go with that config. I've never
built poky-lsb
or have any typical use for it .. so I'd never reproduce this in my
own builds :)

Cheers,

Bruce

>
> Please investigate, thanks
>
> =A0 =A0 =A0 =A0Sau!
>
>
>
>> +PR =3D "r0"
>> +
>> +BUILDPERF_libc-uclibc =3D "no"
>> +
>> +PERFDEPENDS =3D " \
>> +virtual/${MLPREFIX}libc:do_populate_sysroot \
>> +${MLPREFIX}elfutils:do_populate_sysroot \
>> +${MLPREFIX}binutils:do_populate_sysroot \
>> +"
>> +RDEPENDS +=3D "elfutils perl python"
>> +
>> +PROVIDES =3D "virtual/perf"
>> +
>> +S =3D "${STAGING_KERNEL_DIR}/source"
>> +B =3D "${WORKDIR}/${BPN}-${PV}"
>> +
>> +EXTRA_OEMAKE =3D \
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 '-C ${S}/tools/perf \
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 O=3D${B} \
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 CROSS_COMPILE=3D${TARGET_PREFIX} \
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 ARCH=3D${TARGET_ARCH} \
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 CC=3D"${CC}" \
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 AR=3D"${AR}" \
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 prefix=3D/usr \
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 NO_GTK2=3D1 NO_NEWT=3D1 NO_DWARF=3D1 \
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 '
>> +
>> +do_configure[depends] =3D "virtual/kernel:do_populate_sysroot"
>> +
>> +do_compile() {
>> + =A0 =A0 =A0 oe_runmake all
>> +}
>> +
>> +do_compile[depends] =3D "${PERFDEPENDS}"
>> +
>> +do_install() {
>> + =A0 =A0 =A0 oe_runmake DESTDIR=3D${D} install
>> +}
>> +
>> +PACKAGE_ARCH =3D "${MACHINE_ARCH}"
>> +
>
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core



--=20
"Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end"


