Return-Path: <anibal.limon@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 4E1A2606BF
	for <openembedded-core@lists.openembedded.org>;
	Tue, 26 Jul 2016 16:18:45 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by fmsmga101.fm.intel.com with ESMTP; 26 Jul 2016 09:18:44 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.28,425,1464678000"; 
	d="asc'?scan'208";a="1024281977"
Received: from alimonb-mobl1.zpn.intel.com (HELO [10.219.5.54]) ([10.219.5.54])
	by orsmga002.jf.intel.com with ESMTP; 26 Jul 2016 09:18:43 -0700
To: Bruce Ashfield <bruce.ashfield@windriver.com>,
	ed.bartosh@linux.intel.com, openembedded-core@lists.openembedded.org,
	Saul Wold <sgw@linux.intel.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>
References: <20160726143244.GA9326@linux.intel.com>
	<579781A4.707@windriver.com>
From: =?UTF-8?B?QW7DrWJhbCBMaW3Ds24=?= <anibal.limon@linux.intel.com>
X-Enigmail-Draft-Status: N1110
Message-ID: <57978D8B.7080204@linux.intel.com>
Date: Tue, 26 Jul 2016 11:19:23 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.3.0
MIME-Version: 1.0
In-Reply-To: <579781A4.707@windriver.com>
Subject: Re: 2.7% build time regression caused by enabling debug/printk.scc KERNEL_FEATURE
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
X-List-Received-Date: Tue, 26 Jul 2016 16:18:46 -0000
X-Groupsio-MsgNum: 84920
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature";
	boundary="XcA41se6HQhkiAtg9dcgDrrFojX5Ku9hp"

--XcA41se6HQhkiAtg9dcgDrrFojX5Ku9hp
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: quoted-printable


Hi,

I was thinking about how many more times takes to build and run the 2.7%
for me is reasonable since it's only enabled on qemu machines for
debugging purposes.

One alternative will be only enable this feature in AB builds another
one is that RP suggest to split into more kernel configurations
printk.cfg and printk_early.cfg and see how many more time takes only
with printk. [1]

+ RP and Saul

[1]
http://git.yoctoproject.org/cgit/cgit.cgi/yocto-kernel-cache/tree/feature=
s/debug/printk.cfg

	alimon


On 07/26/2016 10:28 AM, Bruce Ashfield wrote:
> On 2016-07-26 10:32 AM, Ed Bartosh wrote:
>> Hi all,
>>
>> We've noticed quite big increase of core-image-minimal build time
>> caused by commit
>> d55b7650d305ffad953dd36595ee6b9aa8df5a72 linux-yocto: Enablei
>> debug/printk.scc KERNEL_FEATURE on qemuall machines.
>>
>=20
> That commit only enables the following options:
>=20
> CONFIG_PRINTK=3Dy
> CONFIG_PRINTK_TIME=3Dy
>=20
> CONFIG_EARLY_PRINTK=3Dy
>=20
> CONFIG_EARLY_PRINTK_DBGP=3Dy
> CONFIG_EARLY_PRINTK_EFI=3Dy
> CONFIG_TTY_PRINTK=3Dy
>=20
> And yes, that will add some size to the kernel, but I'm not seeing
> similar size increases here.
>=20
> If you take a look through the kernel source and build, there are
> relatively few additions to the actual kernel build that change
> based on those options, and most of them are runtime changes versus
> build-time changes.
>=20
>> Here are results of /usr/bin/time -v bitbake core-image-minimal for th=
is
>> and previous commits:
>>
>> linux-yocto: Enable debug/printk.scc KERNEL_FEATURE on qemuall
>> machines: d55b7650d305ffad953dd36595ee6b9aa8df5a72
>>          Command being timed: "bitbake core-image-minimal"
>>          User time (seconds): 14966.24
>>          System time (seconds): 3829.23
>>          Percent of CPU this job got: 1212%
>>          Elapsed (wall clock) time (h:mm:ss or m:ss): 25:50.52
>>          Average shared text size (kbytes): 0
>>          Average unshared data size (kbytes): 0
>>          Average stack size (kbytes): 0
>>          Average total size (kbytes): 0
>>          Maximum resident set size (kbytes): 917592
>>          Average resident set size (kbytes): 0
>>          Major (requiring I/O) page faults: 8105
>>          Minor (reclaiming a frame) page faults: 628476540
>>          Voluntary context switches: 26886617
>>          Involuntary context switches: 2033535
>>          Swaps: 0
>>          File system inputs: 3160048
>>          File system outputs: 78417720
>>          Socket messages sent: 0
>>          Socket messages received: 0
>>          Signals delivered: 0
>>          Page size (bytes): 4096
>>          Exit status: 0
>>
>> commit: nativesdk-packagegroup-sdk-host: Add wayland-scanner to the
>> SDK native toolchain: e833508075bcb8f2d1ccddcf46f579aea7a2ab1d
>>          Command being timed: "bitbake core-image-minimal"
>>          User time (seconds): 14526.89
>>          System time (seconds): 3770.74
>>          Percent of CPU this job got: 1193%
>>          Elapsed (wall clock) time (h:mm:ss or m:ss): 25:33.44
>>          Average shared text size (kbytes): 0
>>          Average unshared data size (kbytes): 0
>>          Average stack size (kbytes): 0
>>          Average total size (kbytes): 0
>>          Maximum resident set size (kbytes): 917792
>>          Average resident set size (kbytes): 0
>>          Major (requiring I/O) page faults: 8058
>>          Minor (reclaiming a frame) page faults: 618283939
>>          Voluntary context switches: 26538183
>>          Involuntary context switches: 1859365
>>          Swaps: 0
>>          File system inputs: 3191584
>>          File system outputs: 66411592
>>          Socket messages sent: 0
>>          Socket messages received: 0
>>          Signals delivered: 0
>>          Page size (bytes): 4096
>>          Exit status: 0
>>
>> The total time (user time + system time) incresed by 2.72% which seems=

>> quite a lot.
>>
>> diff of tasks utime shows biggest difference in do_package* tasks.
>> This is probably
>> due to increased size of packages:
>>
>> do_bundle_initramfs:utime: 21         |   do_bundle_initramfs:utime: 3=
2
>> do_compile:utime: 47                  |   do_compile:utime: 51
>> do_compile_kernelmodules:utime: 39    | =20
>> do_compile_kernelmodules:utime: 42
>> do_configure:utime: 20                |   do_configure:utime: 24
>> do_deploy:utime: 38                   |   do_deploy:utime: 35
>> do_fetch:utime: 25                    |   do_fetch:utime: 28
>> do_install:utime: 26                  |   do_install:utime: 22
>> do_kernel_checkout:utime: 21          |   do_kernel_checkout:utime: 24=

>> do_kernel_configcheck:utime: 21       |   do_kernel_configcheck:utime:=
 21
>> do_kernel_configme:utime: 23          |   do_kernel_configme:utime: 23=

>> do_kernel_link_images:utime: 24       |   do_kernel_link_images:utime:=
 22
>> do_kernel_metadata:utime: 25          |   do_kernel_metadata:utime: 23=

>> do_package:utime: 396                 |   do_package:utime: 378
>> do_packagedata:utime: 35              |   do_packagedata:utime: 34
>> do_package_qa:utime: 460              |   do_package_qa:utime: 492
>> do_package_write_rpm:utime: 431       |   do_package_write_rpm:utime: =
399
>> do_patch:utime: 25                    |   do_patch:utime: 25
>> do_populate_lic:utime: 30             |   do_populate_lic:utime: 29
>> do_populate_sysroot:utime: 33         |   do_populate_sysroot:utime: 3=
0
>> do_shared_workdir:utime: 24           |   do_shared_workdir:utime: 25
>> do_sizecheck:utime: 23                |   do_sizecheck:utime: 21
>> do_strip:utime: 23                    |   do_strip:utime: 23
>> do_uboot_mkimage:utime: 25            |   do_uboot_mkimage:utime: 24
>> do_unpack:utime: 21                   |   do_unpack:utime: 22
>> do_validate_branches:utime: 23        |   do_validate_branches:utime: =
24
>>
>> There is also quite big increase in consumed disk space by the kernel
>> and modules:
>> $ ls -lh
>> ./tmp.bad/work/qemux86-poky-linux/linux-yocto/4.4.14+gitAUTOINC+4800a4=
00d5_8361321fec-r0/image/boot/vmlinux-4.4.14-yocto-standard
>>
>> -rw-r--r-- 1 ed ed 261M Jul 25 12:39
>> ./tmp.bad/work/qemux86-poky-linux/linux-yocto/4.4.14+gitAUTOINC+4800a4=
00d5_8361321fec-r0/image/boot/vmlinux-4.4.14-yocto-standard
>>
>> $ ls -lh
>> ./tmp.prev/work/qemux86-poky-linux/linux-yocto/4.4.14+gitAUTOINC+4800a=
400d5_8361321fec-r0/image/boot/vmlinux-4.4.14-yocto-standard
>>
>> -rw-r--r-- 1 ed ed 19M Jul 25 17:34
>> ./tmp.prev/work/qemux86-poky-linux/linux-yocto/4.4.14+gitAUTOINC+4800a=
400d5_8361321fec-r0/image/boot/vmlinux-4.4.14-yocto-standard
>>
>>
>> $ ls -lh
>> tmp.bad/deploy/images/qemux86/modules--4.4.14+git0+4800a400d5_8361321f=
ec-r0-qemux86-20160725092744.tgz
>>
>> -rw-rw-r-- 2 ed ed 99M Jul 25 12:39
>> tmp.bad/deploy/images/qemux86/modules--4.4.14+git0+4800a400d5_8361321f=
ec-r0-qemux86-20160725092744.tgz
>>
>> $ ls -lh
>> tmp.prev/deploy/images/qemux86/modules--4.4.14+git0+4800a400d5_8361321=
fec-r0-qemux86-20160725105810.tgz
>>
>> -rw-rw-r-- 1 ed ed 4.3M Jul 25 17:34
>> tmp.prev/deploy/images/qemux86/modules--4.4.14+git0+4800a400d5_8361321=
fec-r0-qemux86-20160725105810.tgz
>>
>>
>> Any thoughts on this? Is it normal or it should be tested further and
>> fixed?
>=20
> I'm not sure that this is related to the debug printk build, but
> anything that that could be increasing footprint and build time
> like that should be looked into.
>=20
> Without messing with the oe-core commit that enabled the feature, has
> someone done a build, gone into the kernel .config, disabled the option=
s
> and then rebuilt ? I'd start there to rule out that the option is
> actually doing something that significant to the build itself.
>=20
> .. but I can't say much more than that, since as you can see by the
> commit, I'm not on the sign-off list, so I don't have all the backgroun=
d.
>=20
> Bruce
>=20
>>
>> --=20
>> Regards,
>> Ed
>>
>=20


--XcA41se6HQhkiAtg9dcgDrrFojX5Ku9hp
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBAgAGBQJXl42NAAoJEGJqcE9h3glgTc8P/RXXuz2CnHVIY4A6AIep52uJ
0Fk+N4MP1diLsIv1ilKgewFhS7prktbLqFA4/3i9Z0xNtNzj0l2Jf+pkqlwKQIaN
A0gn6hjxsCxZylIFD+3Bigh9kscBKP1Va1BDq4MyE6rKv8A0iSN/SqcJ3jmUbnOk
5S4j4liXCZQBxST/HXzqXLWNXd7twP3rsrHao06aj6rMigDQC1eTG5AxXzsczSsm
NJscQU9jE8lil8oLLMFOZPhly/z3sntDlpfjUTYHpy/Wo075vCKvXWqeWtI3whoa
zQFfzx9MnSMqk4ZhTGm3MqwsZSnahw+eoWQz7rQFEwGby+LR65Pe+vqHDcqp+6y+
ziZ33IukWczTepAs4Xtg5w/memfnHu3CCuUWFjdB8aEx2y6GK3wvVATnyz0mf9gB
qthRqxC1d0qcxk1hNa30TYvRnc4YDakWnzdct8xRanyg2zH24V8nh0buvPHMzbay
iiqAZlrzaqE1tItyLh9Xwip43e97zv1jnmz1qS7C0kWBt39l1QGuvN8qLzA0hqYS
KMTFomFa2T9ESU4Dpf9DdI7oCLnp+Ug5p6BciKpYN21vS6ZJiVik/PJn+9AUPw9r
Ff2qcooPeinhs4dAivbyIBX/xCq9ctiLSI65MS3k+OskftW++arRq1+SzvSNvysC
tz/ZX5uXgP4CFW+90Dkp
=oySg
-----END PGP SIGNATURE-----

--XcA41se6HQhkiAtg9dcgDrrFojX5Ku9hp--
