Return-Path: <ulf@emagii.com>
Received: from smtp-out12.han.skanova.net (smtp-out12.han.skanova.net
	[195.67.226.212])
	by mail.openembedded.org (Postfix) with ESMTP id 921FE65D63
	for <openembedded-core@lists.openembedded.org>;
	Tue,  8 Apr 2014 08:57:40 +0000 (UTC)
Received: from [10.208.108.139] (95.195.140.139) by smtp-out12.han.skanova.net
	(8.5.133) id 52C0564D018853A5; Tue, 8 Apr 2014 10:57:40 +0200
References: <53430460.4080608@emagii.com> <20140407201730.GF3370@denix.org>
	<710791F9-9387-4DE3-939E-C0AFF4D87E1B@emagii.com>
In-Reply-To: <710791F9-9387-4DE3-939E-C0AFF4D87E1B@emagii.com>
Mime-Version: 1.0 (1.0)
Message-Id: <A23A0544-789D-4D9F-9F5F-E4678F61AA4E@emagii.com>
X-Mailer: iPad Mail (9B176)
From: Ulf Samuelsson <ulf@emagii.com>
Date: Tue, 8 Apr 2014 10:57:37 +0200
To: Ulf Samuelsson <openembedded-core@emagii.com>
Cc: "ulf@emagii.com" <ulf@emagii.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: meta-toolchain-sdk LDFLAGS fails for ARMv7 (beagleboard)
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
X-List-Received-Date: Tue, 08 Apr 2014 08:57:43 -0000
Content-Type: multipart/alternative;
	boundary=Apple-Mail-4570D5E0-2829-415F-B690-3A44B09C1C6D
Content-Transfer-Encoding: 7bit

--Apple-Mail-4570D5E0-2829-415F-B690-3A44B09C1C6D
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=utf-8




8 apr 2014 kl. 08:50 skrev Ulf Samuelsson <openembedded-core@emagii.com>:

> Clearing LDFLAGS allows U-Boot to build.
>=20
> Now trying to build a busybox with static linking, but the SDK only provid=
es the lib<x>.so=20
> and not the lib<x>.a static libraries.=20
>=20
> Any easy way to make it include both?

Found it!

[By default, this toolchain does not build static binaries. If you want to u=
se the toolchain to build these types of libraries, you need to be sure your=
 image has the appropriate static development libraries. Use the IMAGE_INSTA=
LL variable inside your local.conf file to install the appropriate library p=
ackages. Following is an example using eglibc static development libraries:
IMAGE_INSTALL_append =3D " eglibc-staticdev"]

Best Regards
Ulf Samuelsson


>=20
> Best Regards
> Ulf Samuelsson
>=20
> 7 apr 2014 kl. 22:17 skrev Denys Dmytriyenko <denis@denix.org>:
>=20
>> On Mon, Apr 07, 2014 at 10:02:40PM +0200, Ulf Samuelsson wrote:
>>> Trying to build an SDK for the Beaglebone
>>>=20
>>> $ git clone git://git.yoctoproject.org/poky
>>> $ cd poky
>>> $ git checkout -b dora origin/dora
>>>=20
>>> $ . oe-init-build-env
>>>=20
>>> MACHINE is set to "beagleboard" in local.conf
>>=20
>> It's not critical to your case, but in general beagleboard !=3D beaglebon=
e...
>>=20
>> And cutting to the chase - U-boot recipe in OE clears CFLAGS, LDFLAGS and=
=20
>> CPPFLAGS before building it...
>>=20
>>=20
>>> $ ./environment-angstrom-v2013.06
>>>=20
>>> $ bitbake meta-toolchain-sdk
>>>=20
>>> SDK is generated, and installed in /opt/poky/1.5.1 (default)
>>>=20
>>> The toolchain environment file is "sourced"
>>>=20
>>> Then I try to build U-Boot-13.10 (with a minor patch)
>>>=20
>>>=20
>>> $ make am335x_boneblack_config
>>>=20
>>> $ make
>>>=20
>>> After compiling a number of file, the linking of a library fails:
>>>=20
>>> arm-poky-linux-gnueabi-ld.bfd -Wl,-O1 -Wl,--hash-style=3Dgnu
>>> -Wl,--as-needed   -r -o libcommon.o  cmd_bdinfo.o cmd_boot.o
>>> cmd_bootm.o cmd_console.o cmd_dfu.o cmd_disk.o cmd_echo.o
>>> cmd_eeprom.o cmd_exit.o cmd_ext2.o cmd_ext4.o cmd_fat.o cmd_fdt.o
>>> cmd_fs.o cmd_gpio.o cmd_help.o cmd_i2c.o cmd_itest.o cmd_load.o
>>> cmd_mem.o cmd_misc.o cmd_mmc.o cmd_net.o cmd_nvedit.o cmd_pcmcia.o
>>> cmd_sf.o cmd_source.o cmd_spi.o cmd_spl.o cmd_test.o cmd_usb.o
>>> cmd_version.o cmd_ximg.o command.o console.o dlmalloc.o env_attr.o
>>> env_callback.o env_common.o env_flags.o env_mmc.o exports.o
>>> fdt_support.o flash.o hash.o hush.o image-fdt.o image.o main.o
>>> memsize.o miiphyutil.o s_record.o splash.o stdio.o usb.o usb_hub.o
>>> usb_storage.o xyzModem.o
>>> arm-poky-linux-gnueabi-ld.bfd: unrecognized option '-Wl,-O1'
>>> arm-poky-linux-gnueabi-ld.bfd: use the --help option for usage informati=
on
>>> make[1]: *** [libcommon.o] Fel 1
>>> make[1]: L=C3=A4mnar katalogen
>>> "/home/ulf/felabs/sysdev/bootloader/u-boot-2013.10/common"
>>> make: *** [common/libcommon.o] Fel 2
>>>=20
>>> -------------------
>>> The environment looks like:
>>> ------------------------------------------------------------------------=
----------------------------------------------------------------------------=
-----------------------
>>> export PATH=3D/opt/poky/1.5.1/sysroots/x86_64-pokysdk-linux/usr/bin:/opt=
/poky/1.5.1/sysroots/x86_64-pokysdk-linux/usr/bin/arm-poky-linux-gnueabi:$PA=
TH
>>> export PKG_CONFIG_SYSROOT_DIR=3D/opt/poky/1.5.1/sysroots/armv7a-vfp-neon=
-poky-linux-gnueabi
>>> export PKG_CONFIG_PATH=3D/opt/poky/1.5.1/sysroots/armv7a-vfp-neon-poky-l=
inux-gnueabi/usr/lib/pkgconfig
>>> export CONFIG_SITE=3D/opt/poky/1.5.1/site-config-armv7a-vfp-neon-poky-li=
nux-gnueabi
>>> export CC=3D"arm-poky-linux-gnueabi-gcc  -march=3Darmv7-a
>>> -mthumb-interwork -mfloat-abi=3Dsoftfp -mfpu=3Dneon --sysroot=3D/opt/pok=
y/1.5.1/sysroots/armv7a-vfp-neon-poky-linux-gnueabi"
>>> export CXX=3D"arm-poky-linux-gnueabi-g++  -march=3Darmv7-a
>>> -mthumb-interwork -mfloat-abi=3Dsoftfp -mfpu=3Dneon --sysroot=3D/opt/pok=
y/1.5.1/sysroots/armv7a-vfp-neon-poky-linux-gnueabi"
>>> export CPP=3D"arm-poky-linux-gnueabi-gcc -E  -march=3Darmv7-a
>>> -mthumb-interwork -mfloat-abi=3Dsoftfp -mfpu=3Dneon --sysroot=3D/opt/pok=
y/1.5.1/sysroots/armv7a-vfp-neon-poky-linux-gnueabi"
>>> export AS=3D"arm-poky-linux-gnueabi-as "
>>> export LD=3D"arm-poky-linux-gnueabi-ld --sysroot=3D/opt/poky/1.5.1/sysro=
ots/armv7a-vfp-neon-poky-linux-gnueabi"
>>> export GDB=3Darm-poky-linux-gnueabi-gdb
>>> export STRIP=3Darm-poky-linux-gnueabi-strip
>>> export RANLIB=3Darm-poky-linux-gnueabi-ranlib
>>> export OBJCOPY=3Darm-poky-linux-gnueabi-objcopy
>>> export OBJDUMP=3Darm-poky-linux-gnueabi-objdump
>>> export AR=3Darm-poky-linux-gnueabi-ar
>>> export NM=3Darm-poky-linux-gnueabi-nm
>>> export M4=3Dm4
>>> export TARGET_PREFIX=3Darm-poky-linux-gnueabi-
>>> export CONFIGURE_FLAGS=3D"--target=3Darm-poky-linux-gnueabi
>>> --host=3Darm-poky-linux-gnueabi --build=3Dx86_64-linux --with-libtool-sy=
sroot=3D/opt/poky/1.5.1/sysroots/armv7a-vfp-neon-poky-linux-gnueabi"
>>> export CFLAGS=3D" -O2 -pipe -g -feliminate-unused-debug-types"
>>> export CXXFLAGS=3D" -O2 -pipe -g -feliminate-unused-debug-types -fpermis=
sive"
>>> export LDFLAGS=3D"-Wl,-O1 -Wl,--hash-style=3Dgnu -Wl,--as-needed"
>>> export CPPFLAGS=3D""
>>> export OECORE_NATIVE_SYSROOT=3D"/opt/poky/1.5.1/sysroots/x86_64-pokysdk-=
linux"
>>> export OECORE_TARGET_SYSROOT=3D"/opt/poky/1.5.1/sysroots/armv7a-vfp-neon=
-poky-linux-gnueabi"
>>> export OECORE_ACLOCAL_OPTS=3D"-I
>>> /opt/poky/1.5.1/sysroots/x86_64-pokysdk-linux/usr/share/aclocal"
>>> export OECORE_DISTRO_VERSION=3D"1.5.1"
>>> export OECORE_SDK_VERSION=3D"1.5.1"
>>> export PYTHONHOME=3D/opt/poky/1.5.1/sysroots/x86_64-pokysdk-linux/usr
>>> export ARCH=3Darm
>>> export CROSS_COMPILE=3Darm-poky-linux-gnueabi-
>>> ------------------------------------------------------------------------=
----------------------------------------------------------------------------=
-----------------------------
>>>=20
>>> Notable is:
>>> export LD=3D"arm-poky-linux-gnueabi-ld --sysroot=3D/opt/poky/1.5.1/sysro=
ots/armv7a-vfp-neon-poky-linux-gnueabi"
>>> export LDFLAGS=3D"-Wl,-O1 -Wl,--hash-style=3Dgnu -Wl,--as-needed"
>>>=20
>>> =46rom the error message I see:
>>> "arm-poky-linux-gnueabi-ld.bfd -Wl,-O1 ..."
>>>=20
>>> Note that $(CROSS_COMPILE)-ld.bfd is used, not $(CROSS_COMPILE)-ld
>>>=20
>>> so the linker is linking with $(LDFLAGS) which contains switches to
>>> be passed to the compiler, and bombs
>>>=20
>>> Changing LD to:
>>> export LD=3D"arm-poky-linux-gnueabi-gcc --sysroot=3D/opt/poky/1.5.1/sysr=
oots/armv7a-vfp-neon-poky-linux-gnueabi"
>>>=20
>>> Does not help, still you get the same error message with
>>> $(CROSS_COMPILE)-ld.bfd called with "-Wl,..." arguments.
>>>=20
>>> Only when I am setting LDFLAGS=3D"", E.E: not passing arguments to I
>>> can compile U-Boot.
>>>=20
>>> It looks like the toolchain does not handle compiler linker flags
>>> correctly and passes the arguments without parsing to the linker.
>>>=20
>>>=20
>>> If you use the SDK, Is it wrong to do=3D
>>>=20
>>> ${LD} ${LDFLAGS} ??
>>>=20
>>> U-Boot does this in several places?
>>>=20
>>> Using the poky installation to
>>>=20
>>> bitbake core-image-minimal
>>>=20
>>> will complete the build of U-Boot-2013.07, but does not pass these optio=
ns.
>>>=20
>>> arm-poky-linux-gnueabi-ld.bfd  -r -o /home/ulf/felabs/sysdev/poky/build/=
tmp/work/beagleboard-poky-linux-gnueabi/u-boot/v2013.07+gitAUTOINC+62c175fbb=
8-r0/git/spl/common/libcommon.o /home/ulf/felabs/sysdev/poky/build/tmp/work/=
beagleboard-poky-linux-gnueabi/u-boot/v2013.07+gitAUTOINC+62c175fbb8-r0/git/=
spl/common/cmd_nvedit.o /home/ulf/felabs/sysdev/poky/build/tmp/work/beaglebo=
ard-poky-linux-gnueabi/u-boot/v2013.07+gitAUTOINC+62c175fbb8-r0/git/spl/comm=
on/console.o /home/ulf/felabs/sysdev/poky/build/tmp/work/beagleboard-poky-li=
nux-gnueabi/u-boot/v2013.07+gitAUTOINC+62c175fbb8-r0/git/spl/common/dlmalloc=
.o /home/ulf/felabs/sysdev/poky/build/tmp/work/beagleboard-poky-linux-gnueab=
i/u-boot/v2013.07+gitAUTOINC+62c175fbb8-r0/git/spl/common/env_common.o /home=
/ulf/felabs/sysdev/poky/build/tmp/work/beagleboard-poky-linux-gnueabi/u-boot=
/v2013.07+gitAUTOINC+62c175fbb8-r0/git/spl/common/env_nand.o /home/ulf/felab=
s/sysdev/poky/build/tmp/work/beagleboard-poky-linux-gnueabi/u-boot/v2013.07+=
gitAUTOINC+62c175fbb8-r0/git/spl/common/image-fdt.o /home/ulf/felabs/sysdev/=
poky/build/tmp/work/beagleboard-poky-linux-gnueabi/u-boot/v2013.07+gitAUTOIN=
C+62c175fbb8-r0/git/spl/common/image.o /home/ulf/felabs/sysdev/poky/build/tm=
p/work/beagleboard-poky-linux-gnueabi/u-boot/v2013.07+gitAUTOINC+62c175fbb8-=
r0/git/spl/common/memsize.o /home/ulf/felabs/sysdev/poky/build/tmp/work/beag=
leboard-poky-linux-gnueabi/u-boot/v2013.07+gitAUTOINC+62c175fbb8-r0/git/spl/=
common/stdio.o
>>>=20
>>>=20
>>> --=20
>>> Best Regards
>>> Ulf Samuelsson
>>> eMagii
>>>=20
>>> --=20
>>> _______________________________________________
>>> Openembedded-core mailing list
>>> Openembedded-core@lists.openembedded.org
>>> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>> --=20
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-core
> --=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core


--Apple-Mail-4570D5E0-2829-415F-B690-3A44B09C1C6D
Content-Transfer-Encoding: quoted-printable
Content-Type: text/html;
	charset=utf-8

<html><head></head><body bgcolor=3D"#FFFFFF"><div><div><br></div><div><div><=
br></div></div><div><br>8 apr 2014 kl. 08:50 skrev Ulf Samuelsson &lt;<a hre=
f=3D"mailto:openembedded-core@emagii.com">openembedded-core@emagii.com</a>&g=
t;:<br><br></div><div></div><blockquote type=3D"cite"><div><span>Clearing LD=
FLAGS allows U-Boot to build.</span><br><span></span><br><span>Now trying to=
 build a busybox with static linking, but the SDK only provides the lib&lt;x=
&gt;.so </span><br><span>and not the lib&lt;x&gt;.a static libraries. </span=
><br><span></span><br><span>Any easy way to make it include both?</span><br>=
</div></blockquote><div><br></div><span class=3D"Apple-style-span" style=3D"=
-webkit-tap-highlight-color: rgba(26, 26, 26, 0.296875); -webkit-composition=
-fill-color: rgba(175, 192, 227, 0.230469); -webkit-composition-frame-color:=
 rgba(77, 128, 180, 0.230469); "><div>Found it!</div><div><br></div><div>[By=
 default, this toolchain does not build static binaries. If you want to use t=
he toolchain to build these types of libraries, you need to be sure your ima=
ge has the appropriate static development libraries. Use the&nbsp;<a class=3D=
"ulink" href=3D"http://www.yoctoproject.org/docs/1.5.1/ref-manual/ref-manual=
.html#var-IMAGE_INSTALL" target=3D"_top" style=3D"text-decoration: underline=
; background-image: initial; background-attachment: initial; background-orig=
in: initial; background-clip: initial; background-color: transparent; "><cod=
e class=3D"filename">IMAGE_INSTALL</code></a>&nbsp;variable inside your&nbsp=
;<code class=3D"filename">local.conf</code>&nbsp;file to install the appropr=
iate library packages. Following is an example using&nbsp;<code class=3D"fil=
ename">eglibc</code>&nbsp;static development libraries:<pre class=3D"literal=
layout" style=3D"overflow-x: auto; overflow-y: auto; "><font class=3D"Apple-=
style-span" face=3D"Helvetica"><span class=3D"Apple-style-span" style=3D"whi=
te-space: normal; ">IMAGE_INSTALL_append =3D " eglibc-staticdev"]</span></fo=
nt></pre><br>Best Regards<div>Ulf Samuelsson</div></div><div><br></div></spa=
n><br><blockquote type=3D"cite"><div><span></span><br><span>Best Regards</sp=
an><br><span>Ulf Samuelsson</span><br><span></span><br><span>7 apr 2014 kl. 2=
2:17 skrev Denys Dmytriyenko &lt;<a href=3D"mailto:denis@denix.org">denis@de=
nix.org</a>&gt;:</span><br><span></span><br><blockquote type=3D"cite"><span>=
On Mon, Apr 07, 2014 at 10:02:40PM +0200, Ulf Samuelsson wrote:</span><br></=
blockquote><blockquote type=3D"cite"><blockquote type=3D"cite"><span>Trying t=
o build an SDK for the Beaglebone</span><br></blockquote></blockquote><block=
quote type=3D"cite"><blockquote type=3D"cite"><span></span><br></blockquote>=
</blockquote><blockquote type=3D"cite"><blockquote type=3D"cite"><span>$ git=
 clone git://git.yoctoproject.org/poky</span><br></blockquote></blockquote><=
blockquote type=3D"cite"><blockquote type=3D"cite"><span>$ cd poky</span><br=
></blockquote></blockquote><blockquote type=3D"cite"><blockquote type=3D"cit=
e"><span>$ git checkout -b dora origin/dora</span><br></blockquote></blockqu=
ote><blockquote type=3D"cite"><blockquote type=3D"cite"><span></span><br></b=
lockquote></blockquote><blockquote type=3D"cite"><blockquote type=3D"cite"><=
span>$ . oe-init-build-env</span><br></blockquote></blockquote><blockquote t=
ype=3D"cite"><blockquote type=3D"cite"><span></span><br></blockquote></block=
quote><blockquote type=3D"cite"><blockquote type=3D"cite"><span>MACHINE is s=
et to "beagleboard" in local.conf</span><br></blockquote></blockquote><block=
quote type=3D"cite"><span></span><br></blockquote><blockquote type=3D"cite">=
<span>It's not critical to your case, but in general beagleboard !=3D beagle=
bone...</span><br></blockquote><blockquote type=3D"cite"><span></span><br></=
blockquote><blockquote type=3D"cite"><span>And cutting to the chase - U-boot=
 recipe in OE clears CFLAGS, LDFLAGS and </span><br></blockquote><blockquote=
 type=3D"cite"><span>CPPFLAGS before building it...</span><br></blockquote><=
blockquote type=3D"cite"><span></span><br></blockquote><blockquote type=3D"c=
ite"><span></span><br></blockquote><blockquote type=3D"cite"><blockquote typ=
e=3D"cite"><span>$ ./environment-angstrom-v2013.06</span><br></blockquote></=
blockquote><blockquote type=3D"cite"><blockquote type=3D"cite"><span></span>=
<br></blockquote></blockquote><blockquote type=3D"cite"><blockquote type=3D"=
cite"><span>$ bitbake meta-toolchain-sdk</span><br></blockquote></blockquote=
><blockquote type=3D"cite"><blockquote type=3D"cite"><span></span><br></bloc=
kquote></blockquote><blockquote type=3D"cite"><blockquote type=3D"cite"><spa=
n>SDK is generated, and installed in /opt/poky/1.5.1 (default)</span><br></b=
lockquote></blockquote><blockquote type=3D"cite"><blockquote type=3D"cite"><=
span></span><br></blockquote></blockquote><blockquote type=3D"cite"><blockqu=
ote type=3D"cite"><span>The toolchain environment file is "sourced"</span><b=
r></blockquote></blockquote><blockquote type=3D"cite"><blockquote type=3D"ci=
te"><span></span><br></blockquote></blockquote><blockquote type=3D"cite"><bl=
ockquote type=3D"cite"><span>Then I try to build U-Boot-13.10 (with a minor p=
atch)</span><br></blockquote></blockquote><blockquote type=3D"cite"><blockqu=
ote type=3D"cite"><span></span><br></blockquote></blockquote><blockquote typ=
e=3D"cite"><blockquote type=3D"cite"><span></span><br></blockquote></blockqu=
ote><blockquote type=3D"cite"><blockquote type=3D"cite"><span>$ make am335x_=
boneblack_config</span><br></blockquote></blockquote><blockquote type=3D"cit=
e"><blockquote type=3D"cite"><span></span><br></blockquote></blockquote><blo=
ckquote type=3D"cite"><blockquote type=3D"cite"><span>$ make</span><br></blo=
ckquote></blockquote><blockquote type=3D"cite"><blockquote type=3D"cite"><sp=
an></span><br></blockquote></blockquote><blockquote type=3D"cite"><blockquot=
e type=3D"cite"><span>After compiling a number of file, the linking of a lib=
rary fails:</span><br></blockquote></blockquote><blockquote type=3D"cite"><b=
lockquote type=3D"cite"><span></span><br></blockquote></blockquote><blockquo=
te type=3D"cite"><blockquote type=3D"cite"><span>arm-poky-linux-gnueabi-ld.b=
fd -Wl,-O1 -Wl,--hash-style=3Dgnu</span><br></blockquote></blockquote><block=
quote type=3D"cite"><blockquote type=3D"cite"><span>-Wl,--as-needed &nbsp;&n=
bsp;-r -o libcommon.o &nbsp;cmd_bdinfo.o cmd_boot.o</span><br></blockquote><=
/blockquote><blockquote type=3D"cite"><blockquote type=3D"cite"><span>cmd_bo=
otm.o cmd_console.o cmd_dfu.o cmd_disk.o cmd_echo.o</span><br></blockquote><=
/blockquote><blockquote type=3D"cite"><blockquote type=3D"cite"><span>cmd_ee=
prom.o cmd_exit.o cmd_ext2.o cmd_ext4.o cmd_fat.o cmd_fdt.o</span><br></bloc=
kquote></blockquote><blockquote type=3D"cite"><blockquote type=3D"cite"><spa=
n>cmd_fs.o cmd_gpio.o cmd_help.o cmd_i2c.o cmd_itest.o cmd_load.o</span><br>=
</blockquote></blockquote><blockquote type=3D"cite"><blockquote type=3D"cite=
"><span>cmd_mem.o cmd_misc.o cmd_mmc.o cmd_net.o cmd_nvedit.o cmd_pcmcia.o</=
span><br></blockquote></blockquote><blockquote type=3D"cite"><blockquote typ=
e=3D"cite"><span>cmd_sf.o cmd_source.o cmd_spi.o cmd_spl.o cmd_test.o cmd_us=
b.o</span><br></blockquote></blockquote><blockquote type=3D"cite"><blockquot=
e type=3D"cite"><span>cmd_version.o cmd_ximg.o command.o console.o dlmalloc.=
o env_attr.o</span><br></blockquote></blockquote><blockquote type=3D"cite"><=
blockquote type=3D"cite"><span>env_callback.o env_common.o env_flags.o env_m=
mc.o exports.o</span><br></blockquote></blockquote><blockquote type=3D"cite"=
><blockquote type=3D"cite"><span>fdt_support.o flash.o hash.o hush.o image-f=
dt.o image.o main.o</span><br></blockquote></blockquote><blockquote type=3D"=
cite"><blockquote type=3D"cite"><span>memsize.o miiphyutil.o s_record.o spla=
sh.o stdio.o usb.o usb_hub.o</span><br></blockquote></blockquote><blockquote=
 type=3D"cite"><blockquote type=3D"cite"><span>usb_storage.o xyzModem.o</spa=
n><br></blockquote></blockquote><blockquote type=3D"cite"><blockquote type=3D=
"cite"><span>arm-poky-linux-gnueabi-ld.bfd: unrecognized option '-Wl,-O1'</s=
pan><br></blockquote></blockquote><blockquote type=3D"cite"><blockquote type=
=3D"cite"><span>arm-poky-linux-gnueabi-ld.bfd: use the --help option for usa=
ge information</span><br></blockquote></blockquote><blockquote type=3D"cite"=
><blockquote type=3D"cite"><span>make[1]: *** [libcommon.o] Fel 1</span><br>=
</blockquote></blockquote><blockquote type=3D"cite"><blockquote type=3D"cite=
"><span>make[1]: L=C3=A4mnar katalogen</span><br></blockquote></blockquote><=
blockquote type=3D"cite"><blockquote type=3D"cite"><span>"/home/ulf/felabs/s=
ysdev/bootloader/u-boot-2013.10/common"</span><br></blockquote></blockquote>=
<blockquote type=3D"cite"><blockquote type=3D"cite"><span>make: *** [common/=
libcommon.o] Fel 2</span><br></blockquote></blockquote><blockquote type=3D"c=
ite"><blockquote type=3D"cite"><span></span><br></blockquote></blockquote><b=
lockquote type=3D"cite"><blockquote type=3D"cite"><span>-------------------<=
/span><br></blockquote></blockquote><blockquote type=3D"cite"><blockquote ty=
pe=3D"cite"><span>The environment looks like:</span><br></blockquote></block=
quote><blockquote type=3D"cite"><blockquote type=3D"cite"><span>------------=
----------------------------------------------------------------------------=
----------------------------------------------------------------------------=
-------</span><br></blockquote></blockquote><blockquote type=3D"cite"><block=
quote type=3D"cite"><span>export PATH=3D/opt/poky/1.5.1/sysroots/x86_64-poky=
sdk-linux/usr/bin:/opt/poky/1.5.1/sysroots/x86_64-pokysdk-linux/usr/bin/arm-=
poky-linux-gnueabi:$PATH</span><br></blockquote></blockquote><blockquote typ=
e=3D"cite"><blockquote type=3D"cite"><span>export PKG_CONFIG_SYSROOT_DIR=3D/=
opt/poky/1.5.1/sysroots/armv7a-vfp-neon-poky-linux-gnueabi</span><br></block=
quote></blockquote><blockquote type=3D"cite"><blockquote type=3D"cite"><span=
>export PKG_CONFIG_PATH=3D/opt/poky/1.5.1/sysroots/armv7a-vfp-neon-poky-linu=
x-gnueabi/usr/lib/pkgconfig</span><br></blockquote></blockquote><blockquote t=
ype=3D"cite"><blockquote type=3D"cite"><span>export CONFIG_SITE=3D/opt/poky/=
1.5.1/site-config-armv7a-vfp-neon-poky-linux-gnueabi</span><br></blockquote>=
</blockquote><blockquote type=3D"cite"><blockquote type=3D"cite"><span>expor=
t CC=3D"arm-poky-linux-gnueabi-gcc &nbsp;-march=3Darmv7-a</span><br></blockq=
uote></blockquote><blockquote type=3D"cite"><blockquote type=3D"cite"><span>=
-mthumb-interwork -mfloat-abi=3Dsoftfp -mfpu=3Dneon --sysroot=3D/opt/poky/1.=
5.1/sysroots/armv7a-vfp-neon-poky-linux-gnueabi"</span><br></blockquote></bl=
ockquote><blockquote type=3D"cite"><blockquote type=3D"cite"><span>export CX=
X=3D"arm-poky-linux-gnueabi-g++ &nbsp;-march=3Darmv7-a</span><br></blockquot=
e></blockquote><blockquote type=3D"cite"><blockquote type=3D"cite"><span>-mt=
humb-interwork -mfloat-abi=3Dsoftfp -mfpu=3Dneon --sysroot=3D/opt/poky/1.5.1=
/sysroots/armv7a-vfp-neon-poky-linux-gnueabi"</span><br></blockquote></block=
quote><blockquote type=3D"cite"><blockquote type=3D"cite"><span>export CPP=3D=
"arm-poky-linux-gnueabi-gcc -E &nbsp;-march=3Darmv7-a</span><br></blockquote=
></blockquote><blockquote type=3D"cite"><blockquote type=3D"cite"><span>-mth=
umb-interwork -mfloat-abi=3Dsoftfp -mfpu=3Dneon --sysroot=3D/opt/poky/1.5.1/=
sysroots/armv7a-vfp-neon-poky-linux-gnueabi"</span><br></blockquote></blockq=
uote><blockquote type=3D"cite"><blockquote type=3D"cite"><span>export AS=3D"=
arm-poky-linux-gnueabi-as "</span><br></blockquote></blockquote><blockquote t=
ype=3D"cite"><blockquote type=3D"cite"><span>export LD=3D"arm-poky-linux-gnu=
eabi-ld --sysroot=3D/opt/poky/1.5.1/sysroots/armv7a-vfp-neon-poky-linux-gnue=
abi"</span><br></blockquote></blockquote><blockquote type=3D"cite"><blockquo=
te type=3D"cite"><span>export GDB=3Darm-poky-linux-gnueabi-gdb</span><br></b=
lockquote></blockquote><blockquote type=3D"cite"><blockquote type=3D"cite"><=
span>export STRIP=3Darm-poky-linux-gnueabi-strip</span><br></blockquote></bl=
ockquote><blockquote type=3D"cite"><blockquote type=3D"cite"><span>export RA=
NLIB=3Darm-poky-linux-gnueabi-ranlib</span><br></blockquote></blockquote><bl=
ockquote type=3D"cite"><blockquote type=3D"cite"><span>export OBJCOPY=3Darm-=
poky-linux-gnueabi-objcopy</span><br></blockquote></blockquote><blockquote t=
ype=3D"cite"><blockquote type=3D"cite"><span>export OBJDUMP=3Darm-poky-linux=
-gnueabi-objdump</span><br></blockquote></blockquote><blockquote type=3D"cit=
e"><blockquote type=3D"cite"><span>export AR=3Darm-poky-linux-gnueabi-ar</sp=
an><br></blockquote></blockquote><blockquote type=3D"cite"><blockquote type=3D=
"cite"><span>export NM=3Darm-poky-linux-gnueabi-nm</span><br></blockquote></=
blockquote><blockquote type=3D"cite"><blockquote type=3D"cite"><span>export M=
4=3Dm4</span><br></blockquote></blockquote><blockquote type=3D"cite"><blockq=
uote type=3D"cite"><span>export TARGET_PREFIX=3Darm-poky-linux-gnueabi-</spa=
n><br></blockquote></blockquote><blockquote type=3D"cite"><blockquote type=3D=
"cite"><span>export CONFIGURE_FLAGS=3D"--target=3Darm-poky-linux-gnueabi</sp=
an><br></blockquote></blockquote><blockquote type=3D"cite"><blockquote type=3D=
"cite"><span>--host=3Darm-poky-linux-gnueabi --build=3Dx86_64-linux --with-l=
ibtool-sysroot=3D/opt/poky/1.5.1/sysroots/armv7a-vfp-neon-poky-linux-gnueabi=
"</span><br></blockquote></blockquote><blockquote type=3D"cite"><blockquote t=
ype=3D"cite"><span>export CFLAGS=3D" -O2 -pipe -g -feliminate-unused-debug-t=
ypes"</span><br></blockquote></blockquote><blockquote type=3D"cite"><blockqu=
ote type=3D"cite"><span>export CXXFLAGS=3D" -O2 -pipe -g -feliminate-unused-=
debug-types -fpermissive"</span><br></blockquote></blockquote><blockquote ty=
pe=3D"cite"><blockquote type=3D"cite"><span>export LDFLAGS=3D"-Wl,-O1 -Wl,--=
hash-style=3Dgnu -Wl,--as-needed"</span><br></blockquote></blockquote><block=
quote type=3D"cite"><blockquote type=3D"cite"><span>export CPPFLAGS=3D""</sp=
an><br></blockquote></blockquote><blockquote type=3D"cite"><blockquote type=3D=
"cite"><span>export OECORE_NATIVE_SYSROOT=3D"/opt/poky/1.5.1/sysroots/x86_64=
-pokysdk-linux"</span><br></blockquote></blockquote><blockquote type=3D"cite=
"><blockquote type=3D"cite"><span>export OECORE_TARGET_SYSROOT=3D"/opt/poky/=
1.5.1/sysroots/armv7a-vfp-neon-poky-linux-gnueabi"</span><br></blockquote></=
blockquote><blockquote type=3D"cite"><blockquote type=3D"cite"><span>export O=
ECORE_ACLOCAL_OPTS=3D"-I</span><br></blockquote></blockquote><blockquote typ=
e=3D"cite"><blockquote type=3D"cite"><span>/opt/poky/1.5.1/sysroots/x86_64-p=
okysdk-linux/usr/share/aclocal"</span><br></blockquote></blockquote><blockqu=
ote type=3D"cite"><blockquote type=3D"cite"><span>export OECORE_DISTRO_VERSI=
ON=3D"1.5.1"</span><br></blockquote></blockquote><blockquote type=3D"cite"><=
blockquote type=3D"cite"><span>export OECORE_SDK_VERSION=3D"1.5.1"</span><br=
></blockquote></blockquote><blockquote type=3D"cite"><blockquote type=3D"cit=
e"><span>export PYTHONHOME=3D/opt/poky/1.5.1/sysroots/x86_64-pokysdk-linux/u=
sr</span><br></blockquote></blockquote><blockquote type=3D"cite"><blockquote=
 type=3D"cite"><span>export ARCH=3Darm</span><br></blockquote></blockquote><=
blockquote type=3D"cite"><blockquote type=3D"cite"><span>export CROSS_COMPIL=
E=3Darm-poky-linux-gnueabi-</span><br></blockquote></blockquote><blockquote t=
ype=3D"cite"><blockquote type=3D"cite"><span>-------------------------------=
----------------------------------------------------------------------------=
----------------------------------------------------------------------</span=
><br></blockquote></blockquote><blockquote type=3D"cite"><blockquote type=3D=
"cite"><span></span><br></blockquote></blockquote><blockquote type=3D"cite">=
<blockquote type=3D"cite"><span>Notable is:</span><br></blockquote></blockqu=
ote><blockquote type=3D"cite"><blockquote type=3D"cite"><span>export LD=3D"a=
rm-poky-linux-gnueabi-ld --sysroot=3D/opt/poky/1.5.1/sysroots/armv7a-vfp-neo=
n-poky-linux-gnueabi"</span><br></blockquote></blockquote><blockquote type=3D=
"cite"><blockquote type=3D"cite"><span>export LDFLAGS=3D"-Wl,-O1 -Wl,--hash-=
style=3Dgnu -Wl,--as-needed"</span><br></blockquote></blockquote><blockquote=
 type=3D"cite"><blockquote type=3D"cite"><span></span><br></blockquote></blo=
ckquote><blockquote type=3D"cite"><blockquote type=3D"cite"><span>=46rom the=
 error message I see:</span><br></blockquote></blockquote><blockquote type=3D=
"cite"><blockquote type=3D"cite"><span>"arm-poky-linux-gnueabi-ld.bfd -Wl,-O=
1 ..."</span><br></blockquote></blockquote><blockquote type=3D"cite"><blockq=
uote type=3D"cite"><span></span><br></blockquote></blockquote><blockquote ty=
pe=3D"cite"><blockquote type=3D"cite"><span>Note that $(CROSS_COMPILE)-ld.bf=
d is used, not $(CROSS_COMPILE)-ld</span><br></blockquote></blockquote><bloc=
kquote type=3D"cite"><blockquote type=3D"cite"><span></span><br></blockquote=
></blockquote><blockquote type=3D"cite"><blockquote type=3D"cite"><span>so t=
he linker is linking with $(LDFLAGS) which contains switches to</span><br></=
blockquote></blockquote><blockquote type=3D"cite"><blockquote type=3D"cite">=
<span>be passed to the compiler, and bombs</span><br></blockquote></blockquo=
te><blockquote type=3D"cite"><blockquote type=3D"cite"><span></span><br></bl=
ockquote></blockquote><blockquote type=3D"cite"><blockquote type=3D"cite"><s=
pan>Changing LD to:</span><br></blockquote></blockquote><blockquote type=3D"=
cite"><blockquote type=3D"cite"><span>export LD=3D"arm-poky-linux-gnueabi-gc=
c --sysroot=3D/opt/poky/1.5.1/sysroots/armv7a-vfp-neon-poky-linux-gnueabi"</=
span><br></blockquote></blockquote><blockquote type=3D"cite"><blockquote typ=
e=3D"cite"><span></span><br></blockquote></blockquote><blockquote type=3D"ci=
te"><blockquote type=3D"cite"><span>Does not help, still you get the same er=
ror message with</span><br></blockquote></blockquote><blockquote type=3D"cit=
e"><blockquote type=3D"cite"><span>$(CROSS_COMPILE)-ld.bfd called with "-Wl,=
..." arguments.</span><br></blockquote></blockquote><blockquote type=3D"cite=
"><blockquote type=3D"cite"><span></span><br></blockquote></blockquote><bloc=
kquote type=3D"cite"><blockquote type=3D"cite"><span>Only when I am setting L=
DFLAGS=3D"", E.E: not passing arguments to I</span><br></blockquote></blockq=
uote><blockquote type=3D"cite"><blockquote type=3D"cite"><span>can compile U=
-Boot.</span><br></blockquote></blockquote><blockquote type=3D"cite"><blockq=
uote type=3D"cite"><span></span><br></blockquote></blockquote><blockquote ty=
pe=3D"cite"><blockquote type=3D"cite"><span>It looks like the toolchain does=
 not handle compiler linker flags</span><br></blockquote></blockquote><block=
quote type=3D"cite"><blockquote type=3D"cite"><span>correctly and passes the=
 arguments without parsing to the linker.</span><br></blockquote></blockquot=
e><blockquote type=3D"cite"><blockquote type=3D"cite"><span></span><br></blo=
ckquote></blockquote><blockquote type=3D"cite"><blockquote type=3D"cite"><sp=
an></span><br></blockquote></blockquote><blockquote type=3D"cite"><blockquot=
e type=3D"cite"><span>If you use the SDK, Is it wrong to do=3D</span><br></b=
lockquote></blockquote><blockquote type=3D"cite"><blockquote type=3D"cite"><=
span></span><br></blockquote></blockquote><blockquote type=3D"cite"><blockqu=
ote type=3D"cite"><span>${LD} ${LDFLAGS} ??</span><br></blockquote></blockqu=
ote><blockquote type=3D"cite"><blockquote type=3D"cite"><span></span><br></b=
lockquote></blockquote><blockquote type=3D"cite"><blockquote type=3D"cite"><=
span>U-Boot does this in several places?</span><br></blockquote></blockquote=
><blockquote type=3D"cite"><blockquote type=3D"cite"><span></span><br></bloc=
kquote></blockquote><blockquote type=3D"cite"><blockquote type=3D"cite"><spa=
n>Using the poky installation to</span><br></blockquote></blockquote><blockq=
uote type=3D"cite"><blockquote type=3D"cite"><span></span><br></blockquote><=
/blockquote><blockquote type=3D"cite"><blockquote type=3D"cite"><span>bitbak=
e core-image-minimal</span><br></blockquote></blockquote><blockquote type=3D=
"cite"><blockquote type=3D"cite"><span></span><br></blockquote></blockquote>=
<blockquote type=3D"cite"><blockquote type=3D"cite"><span>will complete the b=
uild of U-Boot-2013.07, but does not pass these options.</span><br></blockqu=
ote></blockquote><blockquote type=3D"cite"><blockquote type=3D"cite"><span><=
/span><br></blockquote></blockquote><blockquote type=3D"cite"><blockquote ty=
pe=3D"cite"><span>arm-poky-linux-gnueabi-ld.bfd &nbsp;-r -o /home/ulf/felabs=
/sysdev/poky/build/tmp/work/beagleboard-poky-linux-gnueabi/u-boot/v2013.07+g=
itAUTOINC+62c175fbb8-r0/git/spl/common/libcommon.o /home/ulf/felabs/sysdev/p=
oky/build/tmp/work/beagleboard-poky-linux-gnueabi/u-boot/v2013.07+gitAUTOINC=
+62c175fbb8-r0/git/spl/common/cmd_nvedit.o /home/ulf/felabs/sysdev/poky/buil=
d/tmp/work/beagleboard-poky-linux-gnueabi/u-boot/v2013.07+gitAUTOINC+62c175f=
bb8-r0/git/spl/common/console.o /home/ulf/felabs/sysdev/poky/build/tmp/work/=
beagleboard-poky-linux-gnueabi/u-boot/v2013.07+gitAUTOINC+62c175fbb8-r0/git/=
spl/common/dlmalloc.o /home/ulf/felabs/sysdev/poky/build/tmp/work/beagleboar=
d-poky-linux-gnueabi/u-boot/v2013.07+gitAUTOINC+62c175fbb8-r0/git/spl/common=
/env_common.o /home/ulf/felabs/sysdev/poky/build/tmp/work/beagleboard-poky-l=
inux-gnueabi/u-boot/v2013.07+gitAUTOINC+62c175fbb8-r0/git/spl/common/env_nan=
d.o /home/ulf/felabs/sysdev/poky/build/tmp/work/beagleboard-poky-linux-gnuea=
bi/u-boot/v2013.07+gitAUTOINC+62c175fbb8-r0/git/spl/common/image-fdt.o /home=
/ulf/felabs/sysdev/poky/build/tmp/work/beagleboard-poky-linux-gnueabi/u-boot=
/v2013.07+gitAUTOINC+62c175fbb8-r0/git/spl/common/image.o /home/ulf/felabs/s=
ysdev/poky/build/tmp/work/beagleboard-poky-linux-gnueabi/u-boot/v2013.07+git=
AUTOINC+62c175fbb8-r0/git/spl/common/memsize.o /home/ulf/felabs/sysdev/poky/=
build/tmp/work/beagleboard-poky-linux-gnueabi/u-boot/v2013.07+gitAUTOINC+62c=
175fbb8-r0/git/spl/common/stdio.o</span><br></blockquote></blockquote><block=
quote type=3D"cite"><blockquote type=3D"cite"><span></span><br></blockquote>=
</blockquote><blockquote type=3D"cite"><blockquote type=3D"cite"><span></spa=
n><br></blockquote></blockquote><blockquote type=3D"cite"><blockquote type=3D=
"cite"><span>-- </span><br></blockquote></blockquote><blockquote type=3D"cit=
e"><blockquote type=3D"cite"><span>Best Regards</span><br></blockquote></blo=
ckquote><blockquote type=3D"cite"><blockquote type=3D"cite"><span>Ulf Samuel=
sson</span><br></blockquote></blockquote><blockquote type=3D"cite"><blockquo=
te type=3D"cite"><span>eMagii</span><br></blockquote></blockquote><blockquot=
e type=3D"cite"><blockquote type=3D"cite"><span></span><br></blockquote></bl=
ockquote><blockquote type=3D"cite"><blockquote type=3D"cite"><span>-- </span=
><br></blockquote></blockquote><blockquote type=3D"cite"><blockquote type=3D=
"cite"><span>_______________________________________________</span><br></blo=
ckquote></blockquote><blockquote type=3D"cite"><blockquote type=3D"cite"><sp=
an>Openembedded-core mailing list</span><br></blockquote></blockquote><block=
quote type=3D"cite"><blockquote type=3D"cite"><span><a href=3D"mailto:Openem=
bedded-core@lists.openembedded.org">Openembedded-core@lists.openembedded.org=
</a></span><br></blockquote></blockquote><blockquote type=3D"cite"><blockquo=
te type=3D"cite"><span><a href=3D"http://lists.openembedded.org/mailman/list=
info/openembedded-core">http://lists.openembedded.org/mailman/listinfo/opene=
mbedded-core</a></span><br></blockquote></blockquote><blockquote type=3D"cit=
e"><span>-- </span><br></blockquote><blockquote type=3D"cite"><span>________=
_______________________________________</span><br></blockquote><blockquote t=
ype=3D"cite"><span>Openembedded-core mailing list</span><br></blockquote><bl=
ockquote type=3D"cite"><span><a href=3D"mailto:Openembedded-core@lists.opene=
mbedded.org">Openembedded-core@lists.openembedded.org</a></span><br></blockq=
uote><blockquote type=3D"cite"><span><a href=3D"http://lists.openembedded.or=
g/mailman/listinfo/openembedded-core">http://lists.openembedded.org/mailman/=
listinfo/openembedded-core</a></span><br></blockquote><span>-- </span><br><s=
pan>_______________________________________________</span><br><span>Openembe=
dded-core mailing list</span><br><span><a href=3D"mailto:Openembedded-core@l=
ists.openembedded.org">Openembedded-core@lists.openembedded.org</a></span><b=
r><span><a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedd=
ed-core">http://lists.openembedded.org/mailman/listinfo/openembedded-core</a=
></span><br></div></blockquote></div><div></div></body></html>=

--Apple-Mail-4570D5E0-2829-415F-B690-3A44B09C1C6D--
