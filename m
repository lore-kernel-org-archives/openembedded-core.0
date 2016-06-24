Return-Path: <ting.liu@nxp.com>
X-Greylist: delayed 142195 seconds by postgrey-1.34 at layers.openembedded.org;
	Fri, 24 Jun 2016 02:45:01 UTC
Received: from emea01-am1-obe.outbound.protection.outlook.com
	(mail-am1on0060.outbound.protection.outlook.com [157.56.112.60])
	by mail.openembedded.org (Postfix) with ESMTP id 4E18A607F8
	for <openembedded-core@lists.openembedded.org>;
	Fri, 24 Jun 2016 02:45:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=lOGwFnOpzSLjb6vN+MK9Q876UedmQrfpAi5n0rweea0=;
	b=NqgMmz6bb5ddp6yCalkp5HJKOOenn1Myh3RL5XOXqU8EqcRvhx97HTB5QqtgJA2idokihDY0YS4O/vnGUooRUbf5AtLjjhBGx4u4x5T4OyX9XwCcWu/apcWtTAxqeoR3jjEM/RFlkoSHiptz3SMzC/0314vpPtqc4CvYHzmIbms=
Received: from DB3PR04MB042.eurprd04.prod.outlook.com (10.242.136.151) by
	DB3PR04MB041.eurprd04.prod.outlook.com (10.242.136.142) with Microsoft
	SMTP Server (TLS) id 15.1.517.8; Fri, 24 Jun 2016 02:29:26 +0000
Received: from DB3PR04MB042.eurprd04.prod.outlook.com
	([fe80::3131:6aa6:231e:9fae]) by DB3PR04MB042.eurprd04.prod.outlook.com
	([fe80::3131:6aa6:231e:9fae%21]) with mapi id 15.01.0517.014;
	Fri, 24 Jun 2016 02:29:23 +0000
From: Ting Liu <ting.liu@nxp.com>
To: Robert Yang <liezhi.yang@windriver.com>, Stephen Arnold
	<stephen.arnold42@gmail.com>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core] [PATCH v4] qemu-native: set ld.bfd, fix cflags, and
	set some environment vars
Thread-Index: AQHRy1rT4y0WKx+TCk2XcpX8RfK2iZ/2slEAgAE2STA=
Date: Fri, 24 Jun 2016 02:29:22 +0000
Message-ID: <DB3PR04MB0422B332B7EE939EE1BB31D992E0@DB3PR04MB042.eurprd04.prod.outlook.com>
References: <CAOLEWZUQRF1LBjviUmbHqLO6kTM=ExC=4soBBTmdhvpuRekbmw@mail.gmail.com>
	<576B95C8.7070002@windriver.com>
In-Reply-To: <576B95C8.7070002@windriver.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
	smtp.mailfrom=ting.liu@nxp.com; 
x-originating-ip: [199.59.231.64]
x-ms-office365-filtering-correlation-id: b88e3dd4-2a42-43b8-84ad-08d39bd75ab9
x-microsoft-exchange-diagnostics: 1; DB3PR04MB041;
	6:BVmcNOLDR+h//HtsmYFd0FZ9etRxE3ce/v9GtjVJ34oSYd6JX5zHKgdvh3qpbUllJPr1t+sTZYgY30CiSCjxnFHWLvniqXkh5FFd3+mYZ22EM4PEypx/VdUimZ0KNuupMZuykwL+8nnSBlXwsHM7l9Jf6qaVI8qftwtH7/dJo7PEGCj3hn8Gcanm4V3yEfUvJMdBiFrT/V0mA3qEanYisSr8vIWmWSQzCVwuevjVHFG1CI4sTAih3KB5NALRf9cHZfDLaMKQ3dZIeYofA3tiYQ6MqvwADUDE8KtlZg97AOYo8ADPUA34xFSXFz0dE+zefMbWvVg/sbyDRnwlkuxhiFa8jHE1E//5wFv+FGNmKXw=;
	5:2U3FIM4qNn+fg5ZzxqT0Rmmbe8Izw9HFRtMULghLVpKwKZmtj74osoelOa2d5gJPgJTDg0nXhO7RSiUvGRIqZ3VWLC0Wq/pbi9V1RvMSeBlKn18bwXdiwFc8hKnLQeTXmFvDZFnqrnP6zs8ahfRSrQ==;
	24:acAgPCjQ/VNcnFe1ujW/ebnVpFoSVBaE8J1WkDAYQ368A9F8uHcYOh/Wf8BIn0H9T8beCZcYMkbjJ2Jz/a9F2VzvmV4LukRMq3D+I8m/7SU=;
	7:ET87t4wy4YqyHtbkfMLfVVnpVfXJCZYCeMrfbrs0RrR3c8ZyjBPfX5pC+DZA/4Q4jgR/ZP6wlfPRDZRsIzOLhB3O37gXT1P5J2q8sGjP2HDB1+woDPw9kS+98HshUIEEyD8AGOL0toNoQqTzfZOg21ZJWIF6jCSSFaXQGzayl155VgDBV2Vt7x3ot4tSLn3e0EdyJjaT1TL4tW7UX52j2fiJ5+TSV9YwonV/WhUOt6kSMWX82AujjCDvUR8X7Jt0
x-microsoft-antispam: UriScan:;BCL:0;PCL:0;RULEID:;SRVR:DB3PR04MB041;
x-microsoft-antispam-prvs: <DB3PR04MB041E4FEE91500ED2F1669F6992E0@DB3PR04MB041.eurprd04.prod.outlook.com>
x-exchange-antispam-report-test: UriScan:(264703809997249);
x-exchange-antispam-report-cfa-test: BCL:0; PCL:0;
	RULEID:(601004)(2401047)(8121501046)(5005006)(10201501046)(3002001)(6055026);
	SRVR:DB3PR04MB041; BCL:0; PCL:0; RULEID:; SRVR:DB3PR04MB041; 
x-forefront-prvs: 0983EAD6B2
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10009020)(6009001)(7916002)(24454002)(13464003)(199003)(377454003)(189002)(174874002)(19580405001)(19580395003)(107886002)(9686002)(81156014)(81166006)(5250100002)(189998001)(8676002)(92566002)(106356001)(106116001)(305945005)(68736007)(15975445007)(105586002)(5001770100001)(97736004)(1720100001)(2950100001)(2900100001)(6116002)(101416001)(54356999)(3280700002)(74316001)(33656002)(87936001)(586003)(2906002)(5002640100001)(3846002)(3660700001)(7846002)(66066001)(76576001)(7696003)(76176999)(50986999)(86362001)(575784001)(8936002)(7736002)(102836003)(5003600100003);
	DIR:OUT; SFP:1101; SCL:1; SRVR:DB3PR04MB041;
	H:DB3PR04MB042.eurprd04.prod.outlook.com; FPR:; SPF:None;
	PTR:InfoNoRecords; A:1; MX:1; CAT:NONE; LANG:en; CAT:NONE; 
received-spf: None (protection.outlook.com: nxp.com does not designate
	permitted sender hosts)
spamdiagnosticoutput: 1:99
spamdiagnosticmetadata: NSPM
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Jun 2016 02:29:22.8973 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB3PR04MB041
Subject: Re: [PATCH v4] qemu-native: set ld.bfd, fix cflags, and set some environment vars
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
X-List-Received-Date: Fri, 24 Jun 2016 02:45:04 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Same issue on CentOS 6.7. Older gcc does not support -fuse-ld=3Dbfd.

-Ting

> -----Original Message-----
> From: openembedded-core-bounces@lists.openembedded.org
> [mailto:openembedded-core-bounces@lists.openembedded.org] On Behalf
> Of Robert Yang
> Sent: Thursday, June 23, 2016 3:55 PM
> To: Stephen Arnold <stephen.arnold42@gmail.com>; Patches and
> discussions about the oe-core layer <openembedded-
> core@lists.openembedded.org>
> Subject: Re: [OE-core] [PATCH v4] qemu-native: set ld.bfd, fix cflags, an=
d set
> some environment vars
>=20
>=20
> Hi, I got build errors on Ubuntu 12.04 with this patch:
>=20
> | DEBUG: Executing shell function do_configure
> |
> | ERROR: "gcc " cannot build an executable (is your linker broken?)
>=20
>=20
> // Robert
>=20
> On 06/21/2016 09:18 AM, Stephen Arnold wrote:
> > And I finally figured out git send-email no longer has a
> > --subject-prefix=3D option so it looks like --compose and hand-edit the
> > Subject line in the patch is the only way to increment the version.
> >
> > This is [PATCH v4] btw...
> >
> > Steve
> >
> > On Mon, Jun 20, 2016 at 5:54 PM, Stephen Arnold <sarnold@vctlabs.com>
> wrote:
> >> The main thing is build failures with gold linker, but qemu is also a
> >> little too aggressive at finding random tools on the build host, so
> >> we also set the build env for qemu-native and make sure it doesn't
> >> reset its own (hard-coded) cflags when we don't want it to.
> >>
> >> Signed-off-by: Stephen Arnold <sarnold@vctlabs.com>
> >>
> >> The cflags patch was imported from Gentoo Portage and has been
> >> manitained over several versions; this version was rebased against
> >> upstream qemu git.
> >>
> >> Upstream-Status: Inappropriate
> >>   - Patch addresses distribution maintenance and build environment
> >>     sanity.
> >>
> >> Signed-off-by: Stephen Arnold <nerdboy@gentoo.org>
> >> ---
> >>   meta/recipes-devtools/qemu/qemu.inc                | 11 ++++++--
> >>   .../qemu/qemu/qemu-2.6.0-cflags.patch              | 31
> ++++++++++++++++++++++
> >>   meta/recipes-devtools/qemu/qemu_2.6.0.bb           |  1 +
> >>   3 files changed, 41 insertions(+), 2 deletions(-)
> >>   create mode 100644
> >> meta/recipes-devtools/qemu/qemu/qemu-2.6.0-cflags.patch
> >>
> >> diff --git a/meta/recipes-devtools/qemu/qemu.inc
> >> b/meta/recipes-devtools/qemu/qemu.inc
> >> index bf689bb..0a68f05 100644
> >> --- a/meta/recipes-devtools/qemu/qemu.inc
> >> +++ b/meta/recipes-devtools/qemu/qemu.inc
> >> @@ -30,8 +30,10 @@ SRC_URI_append_class-native =3D "\
> >>
> >>   EXTRA_OECONF +=3D "--target-list=3D${@get_qemu_target_list(d)} --
> disable-werror  --disable-bluez --disable-libiscsi --with-system-pixman -=
-
> extra-cflags=3D'${CFLAGS}'"
> >>
> >> -EXTRA_OECONF_class-nativesdk =3D "--target-
> list=3D${@get_qemu_target_list(d)} --disable-werror \
> >> -                               "
> >> +EXTRA_OECONF_class-nativesdk =3D "--target-
> list=3D${@get_qemu_target_list(d)} --disable-werror"
> >> +
> >> +EXTRA_OEMAKE_append_class-native =3D "
> LD=3D"${TARGET_PREFIX}ld.bfd" AR=3D"${AR}" OBJCOPY=3D"${OBJCOPY}"
> LDFLAGS=3D"${LDFLAGS}""
> >> +
> >>   export LIBTOOL=3D"${HOST_SYS}-libtool"
> >>
> >>   do_configure_prepend_class-native() { @@ -40,6 +42,11 @@
> >> do_configure_prepend_class-native() {
> >>          if [ ! -z "$BHOST_PKGCONFIG_PATH" ]; then
> >>                  export
> PKG_CONFIG_PATH=3D$PKG_CONFIG_PATH:$BHOST_PKGCONFIG_PATH
> >>          fi
> >> +
> >> +       # Alter target makefiles to accept CFLAGS set via env
> >> +       sed -i -r \
> >> +               -e 's/^(C|OP_C|HELPER_C)FLAGS=3D/\1FLAGS+=3D/' \
> >> +               "${S}"/Makefile "${S}"/Makefile.target
> >>   }
> >>
> >>   KVMENABLE =3D "--enable-kvm"
> >> diff --git a/meta/recipes-devtools/qemu/qemu/qemu-2.6.0-cflags.patch
> >> b/meta/recipes-devtools/qemu/qemu/qemu-2.6.0-cflags.patch
> >> new file mode 100644
> >> index 0000000..5b78edf
> >> --- /dev/null
> >> +++ b/meta/recipes-devtools/qemu/qemu/qemu-2.6.0-cflags.patch
> >> @@ -0,0 +1,31 @@
> >> +From 5d29baaf7a8c09f2f97231116e0f396b0402b23d Mon Sep 17 00:00:00
> >> +2001
> >> +From: Steve Arnold <stephen.arnold42@gmail.com>
> >> +Date: Sun, 19 Jun 2016 11:29:44 -0700
> >> +Subject: [PATCH] configure: remove hard-coded flags and let build
> >> +env handle  it
> >> +
> >> +Apply distribution patch for handling debug and fortify source option=
s.
> >> +
> >> +Signed-off-by: Steve Arnold <nerdboy@gentoo.org>
> >> +---
> >> + configure | 4 ----
> >> + 1 file changed, 4 deletions(-)
> >> +
> >> +diff --git a/configure b/configure
> >> +index 10cb212..6f1b10c 100755
> >> +--- a/configure
> >> ++++ b/configure
> >> +@@ -4539,10 +4539,6 @@ fi
> >> + if test "$gcov" =3D "yes" ; then
> >> +   CFLAGS=3D"-fprofile-arcs -ftest-coverage -g $CFLAGS"
> >> +   LDFLAGS=3D"-fprofile-arcs -ftest-coverage $LDFLAGS"
> >> +-elif test "$fortify_source" =3D "yes" ; then
> >> +-  CFLAGS=3D"-O2 -U_FORTIFY_SOURCE -D_FORTIFY_SOURCE=3D2 $CFLAGS"
> >> +-elif test "$debug" =3D "no"; then
> >> +-  CFLAGS=3D"-O2 $CFLAGS"
> >> + fi
> >> +
> >> + ##########################################
> >> +--
> >> +2.8.1
> >> +
> >> diff --git a/meta/recipes-devtools/qemu/qemu_2.6.0.bb
> >> b/meta/recipes-devtools/qemu/qemu_2.6.0.bb
> >> index e391326..62c509b 100644
> >> --- a/meta/recipes-devtools/qemu/qemu_2.6.0.bb
> >> +++ b/meta/recipes-devtools/qemu/qemu_2.6.0.bb
> >> @@ -8,6 +8,7 @@ SRC_URI +=3D "file://configure-fix-Darwin-target-
> detection.patch \
> >>               file://Qemu-Arm-versatilepb-Add-memory-size-checking.pat=
ch \
> >>               file://no-valgrind.patch \
> >>               file://pathlimit.patch \
> >> +            file://qemu-2.5.0-cflags.patch \
> >>              "
> >>   SRC_URI_prepend =3D "http://wiki.qemu-
> project.org/download/${BP}.tar.bz2"
> >>   SRC_URI[md5sum] =3D "ca3f70b43f093e33e9e014f144067f13"
> >> --
> >> 2.8.1
> >>
> >> --
> >> _______________________________________________
> >> Openembedded-core mailing list
> >> Openembedded-core@lists.openembedded.org
> >> http://lists.openembedded.org/mailman/listinfo/openembedded-core
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

