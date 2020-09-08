Received: from smtp1.axis.com (smtp1.axis.com [195.60.68.17])
 by mx.groups.io with SMTP id smtpd.web11.29974.1599597012960517074
 for <openembedded-core@lists.openembedded.org>;
 Tue, 08 Sep 2020 13:30:14 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@axis.com header.s=axis-central1 header.b=VWdaS+rJ;
 spf=pass (domain: axis.com, ip: 195.60.68.17, mailfrom: fredrik.gustafsson@axis.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=axis.com; l=7117; q=dns/txt; s=axis-central1;
  t=1599597013; x=1631133013;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=S5hKh9VxLulsy0UjJkYGnCAZxD8AX1e7sZE4vEjhvYA=;
  b=VWdaS+rJ+3jLZmTCuyRJNX5ydc2cJxgJrPPtneI0Lkkbaxog2jSSbTBe
   2OcaLlOmdd3nWlBclTTNzc8sGxFsoz/qSpwtHm+QOd6gI0TFOL33q4P2x
   eR7CwXPYUtVjdUj/Fuzps4jMn50RaeG+yxuoqqLbGTXXTS76X9HL8ITyx
   qhWucDPv1I0fcp5VuLMaGDGlxnF2yyA8V65ZQar1Y5Qm8b+djyFhHFhc5
   LZtEXV1CW871vYq4Fir2URwmCacgrL1Cvq3BSVLHscGV97kwZu+B+N3l8
   j+h27tI1X/0cUOivQtHeXpoMwzS9dOUmmLgxdwunnaDm+CggHaa27RVtf
   w==;
IronPort-SDR: 5iUOn+J2+XOPRZ/N117UsKGrD5soe3Id3z1sFsB8pb82mx99l3EFKt07k9LIhJI42QC1NgKPJ/
 d/jcXbmYqX8WAxvT3LouApY9F49zT/6IsOtR/Jtbkrka0R/CsXazwtmsAA35zEKyBiOjkzlNh9
 9nHI2AsYHjyViesPdb1+MQgZGg8DE3Y26RJUTNg1GPYtri0VKX05BPlzSN8AEN5W2VfBLd0Jcu
 0iTj7v1IeW+BRlhL3oWSIiQyXewjnGsUZetNMxS4F9qa9+ylByavh0ZyPVux6S73825q3VdJyf
 z/U=
X-IronPort-AV: E=Sophos;i="5.76,407,1592863200"; 
   d="scan'208";a="12684632"
From: "Fredrik Gustafsson" <fredrik.gustafsson@axis.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>, tools-cfpbuild-internal
	<tools-cfpbuild-internal@axis.com>
Subject: Re: [OE-core] [PATCH] package management: Allow dynamic loading of PM
Thread-Topic: [OE-core] [PATCH] package management: Allow dynamic loading of
 PM
Thread-Index: AQHWhc4/dC+jFhhjcUyWsCYgEfhCs6leeEQAgAC2v1E=
Date: Tue, 8 Sep 2020 20:30:10 +0000
Message-ID: <1599597009964.10273@axis.com>
References: <20200908105307.5033-1-fredrigu@axis.com>,<bd66a483ac0504535603012078f6c845175a3780.camel@linuxfoundation.org>
In-Reply-To: <bd66a483ac0504535603012078f6c845175a3780.camel@linuxfoundation.org>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.0.5.60]
MIME-Version: 1.0
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

=0A=
________________________________________=0A=
From: Richard Purdie <richard.purdie@linuxfoundation.org>=0A=
Sent: Tuesday, September 8, 2020 1:25 PM=0A=
To: Fredrik Gustafsson; Fredrik Gustafsson=0A=
Cc: openembedded-core@lists.openembedded.org; tools-cfpbuild-internal=0A=
Subject: Re: [OE-core] [PATCH] package management: Allow dynamic loading of=
 PM=0A=
=0A=
On Tue, 2020-09-08 at 12:53 +0200, Fredrik Gustafsson wrote:=0A=
> Dynamic loading of package managers will allow other layers to simply=0A=
> add their package manager code in package_manager/ and have bitbake=0A=
> find=0A=
> it according to the package manager configuration. This is useful for=0A=
> adding new (faster) package managers to Open Embedded while not=0A=
> increasing the=0A=
> test scope or require Open Embedded to support more package managers.=0A=
>=0A=
> How this is tested:=0A=
> * Build core-image-minimal with all three package managers=0A=
> * Build the sdk with all three package managers. dpkg fails, but=0A=
>   it fails on master as well.=0A=
> * Run the complete test suite, all tests passed except 16=0A=
> * Run those 16 tests on master and verify that they fail there as=0A=
> well=0A=
> * Fix errors making tests works on master but not with this patch.=0A=
=0A=
Did you test both the sdk and esdk? Which tests are failing? Are these=0A=
oe-selftests? They all should pass and do on the autobuilder?=0A=
=0A=
We're over a week past feature freeze and this series has a troubled=0A=
history of testing so realistically this needs to be 3.3 material at=0A=
this point (just to ensure we have the same expectations).=0A=
=0A=
Cheers,=0A=
=0A=
Richard=0A=
=0A=
=0A=
Hi Richard,=0A=
I'm sorry that you experienced trouble with this patch series. That's=0A=
why I've tried to be really clear on what's tested and not tested. I don't=
=0A=
mind running tests, but of course I might miss which tests that should be r=
un.=0A=
=0A=
I did the following test:=0A=
set PACKAGE_CLASSES =3D rpm=0A=
bitbake core-image-minimal # OK=0A=
bitbake core-image-minimal -c populate_sdk # OK=0A=
bitbake core-image-minimal -c populate_sdk_ext # fail=0A=
# Failed to generate filtered task list for extensible SDK=0A=
# Fails on master as well=0A=
=0A=
oe-selftest -a=0A=
=0A=
set PACKAGE_CLASSES =3D ipk=0A=
bitbake core-image-minimal=0A=
bitbake core-image-minimal -c populate_sdk # OK=0A=
bitbake core-image-minimal -c populate_sdk_ext # fail=0A=
# Failed to generate filtered task list for extensible SDK=0A=
# Fails on master as well=0A=
=0A=
set PACKAGE_CLASSES =3D deb=0A=
bitbake core-image-minimal=0A=
bitbake core-image-minimal -c populate_sdk # fail=0A=
# dpkg: nativesdk-qemu-helper: dependency problems, but configuring anyway =
as your requested=0A=
# Fails on master as well=0A=
=0A=
And also ran oe-selftest -a with the follwing erros:=0A=
2020-08-28 21:39:27,092 - oe-selftest - INFO - RESULTS - imagefeatures.Imag=
eFeatures.test_all_users_can_connect_via_ssh_without_password: ERROR (=0A=
26.84s)=0A=
2020-08-28 21:39:27,092 - oe-selftest - INFO - RESULTS - imagefeatures.Imag=
eFeatures.test_non_root_user_can_connect_via_ssh_without_password: ERR=0A=
OR (26.86s)=0A=
2020-08-28 21:39:27,092 - oe-selftest - INFO - RESULTS - package.PackageTes=
ts.test_gdb_hardlink_debug: ERROR (165.96s)=0A=
2020-08-28 21:39:27,092 - oe-selftest - INFO - RESULTS - package.PackageTes=
ts.test_preserve_ownership: ERROR (30.97s)=0A=
2020-08-28 21:39:27,093 - oe-selftest - INFO - RESULTS - runtime_test.Syste=
mTap.test_crosstap_helloworld: ERROR (768.02s)=0A=
2020-08-28 21:39:27,093 - oe-selftest - INFO - RESULTS - runtime_test.Syste=
mTap.test_crosstap_pstree: ERROR (12.23s)=0A=
2020-08-28 21:39:27,093 - oe-selftest - INFO - RESULTS - runtime_test.Syste=
mTap.test_crosstap_syscalls_by_pid: ERROR (11.61s)=0A=
2020-08-28 21:39:27,093 - oe-selftest - INFO - RESULTS - runtime_test.Syste=
mTap.test_crosstap_syscalls_by_proc: ERROR (11.61s)=0A=
2020-08-28 21:39:27,093 - oe-selftest - INFO - RESULTS - runtime_test.TestE=
xport.test_testexport_basic: ERROR (33.40s)=0A=
2020-08-28 21:39:27,093 - oe-selftest - INFO - RESULTS - wic.Wic2.test_bios=
plusefi_plugin_qemu: ERROR (7.40s)=0A=
2020-08-28 21:39:27,093 - oe-selftest - INFO - RESULTS - wic.Wic2.test_expa=
nd_mbr_image: ERROR (32.09s)=0A=
2020-08-28 21:39:27,093 - oe-selftest - INFO - RESULTS - wic.Wic2.test_qemu=
: ERROR (34.10s)=0A=
2020-08-28 21:39:27,093 - oe-selftest - INFO - RESULTS - wic.Wic2.test_qemu=
_efi: ERROR (29.09s)=0A=
2020-08-28 21:39:27,093 - oe-selftest - INFO - RESULTS - wic.Wic2.test_rawc=
opy_plugin_qemu: ERROR (53.20s)=0A=
2020-08-28 21:39:27,093 - oe-selftest - INFO - RESULTS - buildoptions.Archi=
verTest.test_arch_work_dir_and_export_source: FAILED (14.04s)=0A=
2020-08-28 21:39:27,093 - oe-selftest - INFO - RESULTS - containerimage.Con=
tainerImageTests.test_expected_files: FAILED (18.34s)=0A=
2020-08-28 21:39:27,093 - oe-selftest - INFO - RESULTS - devtool.DevtoolAdd=
Tests.test_devtool_add_fetch_git: FAILED (7.82s)=0A=
2020-08-28 21:39:27,093 - oe-selftest - INFO - RESULTS - distrodata.Distrod=
ata.test_checkpkg: FAILED (100.84s)=0A=
2020-08-28 21:39:27,093 - oe-selftest - INFO - RESULTS - fetch.Fetch.test_g=
it_mirrors: FAILED (5.81s)=0A=
2020-08-28 21:39:27,093 - oe-selftest - INFO - RESULTS - incompatible_lic.N=
oGPL3InImagesTests.test_core_image_full_cmdline: FAILED (74.05s)=0A=
2020-08-28 21:39:27,093 - oe-selftest - INFO - RESULTS - recipetool.Recipet=
oolTests.test_recipetool_create_git_http: FAILED (1.60s)=0A=
2020-08-28 21:39:27,093 - oe-selftest - INFO - RESULTS - recipetool.Recipet=
oolTests.test_recipetool_create_github: FAILED (3.59s)=0A=
2020-08-28 21:39:27,093 - oe-selftest - INFO - RESULTS - recipetool.Recipet=
oolTests.test_recipetool_create_npm: FAILED (1.70s)=0A=
2020-08-28 21:39:27,093 - oe-selftest - INFO - RESULTS - runtime_test.TestI=
mage.test_testimage_dnf: FAILED (144.74s)=0A=
2020-08-28 21:39:27,093 - oe-selftest - INFO - RESULTS - runtime_test.TestI=
mage.test_testimage_install: FAILED (50.83s)=0A=
2020-08-28 21:39:27,093 - oe-selftest - INFO - RESULTS - runtime_test.TestI=
mage.test_testimage_virgl_gtk_sdl: FAILED (108.25s)=0A=
2020-08-28 21:39:27,093 - oe-selftest - INFO - RESULTS - runtime_test.Posti=
nst.test_failing_postinst: UNKNOWN (61.95s)=0A=
2020-08-28 21:39:27,093 - oe-selftest - INFO - RESULTS - runtime_test.Posti=
nst.test_postinst_rootfs_and_boot_systemd: UNKNOWN (1375.15s)=0A=
2020-08-28 21:39:27,093 - oe-selftest - INFO - RESULTS - runtime_test.Posti=
nst.test_postinst_rootfs_and_boot_sysvinit: UNKNOWN (383.32s)=0A=
=0A=
Here I know that our corporate network might be a culprint. Some tests also=
 worked with I ran only that test. Is there anyway I can trigger a test wit=
h=0A=
this patch on the autobuilder?=0A=
=0A=
I was hoping to get this into 3.2, but I appreciate that you're clear. Is t=
here something I can do to lower the risk of this patch enough to make it s=
uitable for 3.2?=0A=
=0A=
BR=0A=
Fredrik=
