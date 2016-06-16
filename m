Return-Path: <anujx.mittal@intel.com>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	by mail.openembedded.org (Postfix) with ESMTP id C4769607F8
	for <openembedded-core@lists.openembedded.org>;
	Thu, 16 Jun 2016 05:51:01 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by fmsmga104.fm.intel.com with ESMTP; 15 Jun 2016 22:51:02 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.26,478,1459839600"; d="scan'208";a="998696047"
Received: from pgsmsx105.gar.corp.intel.com ([10.221.44.96])
	by orsmga002.jf.intel.com with ESMTP; 15 Jun 2016 22:51:02 -0700
Received: from pgsmsx101.gar.corp.intel.com ([169.254.1.41]) by
	PGSMSX105.gar.corp.intel.com ([169.254.4.204]) with mapi id
	14.03.0248.002; Thu, 16 Jun 2016 13:49:13 +0800
From: "Mittal, AnujX" <anujx.mittal@intel.com>
To: 'Khem Raj' <raj.khem@gmail.com>
Thread-Topic: [OE-core] [PATCH] gcc: make sure header path is set correctly
Thread-Index: AQHRxhyDTo267/ZBFEK3oaK71wsS4Z/q4H6AgACSUjA=
Date: Thu, 16 Jun 2016 05:49:12 +0000
Message-ID: <DFCB2C9E62139C41B3FDE8F2B4659331D2E8D4@PGSMSX101.gar.corp.intel.com>
References: <1465895420-1660-1-git-send-email-anujx.mittal@intel.com>
	<2CA6588C-87EE-4A88-9669-024C67DB9B8C@gmail.com>
In-Reply-To: <2CA6588C-87EE-4A88-9669-024C67DB9B8C@gmail.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ctpclassification: CTP_IC
x-titus-metadata-40: eyJDYXRlZ29yeUxhYmVscyI6IiIsIk1ldGFkYXRhIjp7Im5zIjoiaHR0cDpcL1wvd3d3LnRpdHVzLmNvbVwvbnNcL0ludGVsMyIsImlkIjoiZDMzMjJhNzYtMjFmNi00YWZhLTlhODEtMDUxNTE3N2MzNTA4IiwicHJvcHMiOlt7Im4iOiJDVFBDbGFzc2lmaWNhdGlvbiIsInZhbHMiOlt7InZhbHVlIjoiQ1RQX0lDIn1dfV19LCJTdWJqZWN0TGFiZWxzIjpbXSwiVE1DVmVyc2lvbiI6IjE1LjkuNi42IiwiVHJ1c3RlZExhYmVsSGFzaCI6IlFuNDBvMDI1ZGJ6MUJhMTZCK3FBdmxCMkszZG1WMDFMUmIwTE1rXC9IUE1nPSJ9
x-originating-ip: [172.30.20.206]
MIME-Version: 1.0
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] gcc: make sure header path is set correctly
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
X-List-Received-Date: Thu, 16 Jun 2016 05:51:03 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable



> -----Original Message-----
> From: Khem Raj [mailto:raj.khem@gmail.com]
> Sent: Thursday, June 16, 2016 10:47 AM
> To: Mittal, AnujX <anujx.mittal@intel.com>
> Cc: openembedded-core@lists.openembedded.org
> Subject: Re: [OE-core] [PATCH] gcc: make sure header path is set correctl=
y
>=20
>=20
> > On Jun 14, 2016, at 2:10 AM, Anuj Mittal <anujx.mittal@intel.com> wrote=
:
> >
> > We're setting the native header paths in do_configure_prepend,
> > and don't need to set them again here.
> >
> > This results in gcc-target not being able to locate the headers
> > and not being able to detect glibc version, which in turn
> > results in SSP support not getting detected even though it's available
> > in libc.
> >
>=20
> what is this being set to in do_conigure_prepend ?
> that value may not be right for target recipe. For target we are setting =
sysroot to /
> and if we do not have this option set then it will set native-system-head=
ers dir to
> be
> / relative and not cross sysroot relative. So it will use your build host=
s installation
> for these headers which is not correct either. Have you looked deeper int=
o why its
> not
> finding ssp support inside the cross sysroot?

It's being set to /usr/include:

	# teach gcc to find correct target includedir when checking libc ssp suppo=
rt
	mkdir -p ${B}/gcc
	echo "NATIVE_SYSTEM_HEADER_DIR =3D ${SYSTEMHEADERS}" > ${B}/gcc/t-oe
	cat ${S}/gcc/defaults.h | grep -v "\#endif.*GCC_DEFAULTS_H" > ${B}/gcc/def=
aults.h.new
	cat >>${B}/gcc/defaults.h.new <<_EOF
#define NATIVE_SYSTEM_HEADER_DIR "${SYSTEMHEADERS}"
#define STANDARD_STARTFILE_PREFIX_1 "${SYSTEMLIBS}"
#define STANDARD_STARTFILE_PREFIX_2 "${SYSTEMLIBS1}"
#define SYSTEMLIBS_DIR "${SYSTEMLIBS}"
#endif /* ! GCC_DEFAULTS_H */
_EOF
	mv ${B}/gcc/defaults.h.new ${B}/gcc/defaults.h

Having set NATIVE_SYSTEM_HEADER_DIR again in gcc-target just results in gcc=
 not being able to find features.h at all, which is present in the target s=
ysroot.

Because it's not able to find features.h, it just assumes that glibc versio=
n available is 0 and hence disables ssp support. Setting NATIVE_SYSTEM_HEAD=
ER_DIR to /usr/include just makes sure that target_system_dir in configure =
script is set to right header path within target sysroot & it can pick up t=
he right header relative to the sysroot.

When configure option is passed, gcc detects target_system_dir (where featu=
res.h is present) to be <build_sysroot>/<build_sysroot>/usr/include instead=
 of <build_sysroot>/usr/include.

I've made sure that its picking up the header from target sysroot rather th=
an my host. My host machine has glibc 2.19 whereas the target sysroot has 2=
.22

Thanks,
Anuj

