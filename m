Received: from bear.ext.ti.com ([192.94.94.41])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin@ti.com>) id 1RNmme-0006fc-N8
	for openembedded-core@lists.openembedded.org;
	Tue, 08 Nov 2011 15:36:17 +0100
Received: from dlep36.itg.ti.com ([157.170.170.91])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id pA8EShda006005
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 8 Nov 2011 08:28:43 -0600
Received: from dlep26.itg.ti.com (smtp-le.itg.ti.com [157.170.170.27])
	by dlep36.itg.ti.com (8.13.8/8.13.8) with ESMTP id pA8EShFI022603
	for <openembedded-core@lists.openembedded.org>;
	Tue, 8 Nov 2011 08:28:43 -0600 (CST)
Received: from DFLE70.ent.ti.com (localhost [127.0.0.1])
	by dlep26.itg.ti.com (8.13.8/8.13.8) with ESMTP id pA8ESh1B014340
	for <openembedded-core@lists.openembedded.org>;
	Tue, 8 Nov 2011 08:28:43 -0600 (CST)
Received: from DFLE30.ent.ti.com ([fe80::648b:2220:c6fb:4e6]) by
	DFLE70.ent.ti.com ([fe80::db3:609a:aa62:e1ec%22]) with mapi id
	14.01.0323.003; Tue, 8 Nov 2011 08:28:43 -0600
From: "Ambrose, Martin" <martin@ti.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: uClibc Errors
Thread-Index: AcyeIrWWrQbxrcnUTeiV6gfV9UFbBg==
Date: Tue, 8 Nov 2011 14:28:42 +0000
Message-ID: <4E4787E2B8CABC46A0EF2ED925CDD8DD08FF5B@DFLE30.ent.ti.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-cr-hashedpuzzle: ARtu AZp1 BZ2r Buq5 CGWG Cq9E DLRE DMlB Dz33 D2he FIAq
	Gk+O G6H2 H5XY Je5E Jxqs; 1;
	bwBwAGUAbgBlAG0AYgBlAGQAZABlAGQALQBjAG8AcgBlAEAAbABpAHMAdABzAC4AbwBwAGUAbgBlAG0AYgBlAGQAZABlAGQALgBvAHIAZwA=;
	Sosha1_v1; 7; {F8305C82-ED87-4733-89F8-22A7147FD511};
	bQBhAHIAdABpAG4AQAB0AGkALgBjAG8AbQA=; Tue,
	08 Nov 2011 14:28:39 GMT;dQBDAGwAaQBiAGMAIABFAHIAcgBvAHIAcwA=
x-cr-puzzleid: {F8305C82-ED87-4733-89F8-22A7147FD511}
x-originating-ip: [157.170.170.90]
MIME-Version: 1.0
Subject: uClibc Errors
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
X-List-Received-Date: Tue, 08 Nov 2011 14:36:17 -0000
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Hello.

My goal is to get a baseline uClibc image for an arm architecture.
I've tried various mechanisms but eventually end up with build/run-time err=
ors.

First attempt was to only use oe-core and specify the following in local.co=
nf
    TCLIBC =3D "uclibc"
    USE_NLS =3D "no"
    USE_NLS_glib-2.0 =3D "no"
    USE_NLS_glib-2.0-native =3D "yes"
    USE_NLS_gcc-cross =3D "no"

I try to build core-image-minimal but get an armv5te-oe-linux-uclibceabi/gl=
ib-2.0-1_2.30.0-r2/glib-2.30.0 build error:
	./.libs/libglib-2.0.so: undefined reference to `qsort_r'

I'm surprised this is even trying to build given my settings in local.conf.

Next I tried with the meta-micro layer and replace the above conf changes w=
ith just
    DISTRO=3D "micro-uclibc"

Then build micro-base-image and get this packaging error
	ERROR: QA Issue: non -dev/-dbg/-nativesdk package contains symlink .so: uc=
libc-thread-db path \
	'/work/armv5te-oe-linux-uclibceabi/uclibc-0.9.32-r4.3/packages-split/uclib=
c-thread-db/lib/libthread_db.so'

I worked around this by overriding the OE packaging variables in local.conf=
 (moved dev-so).
	WARN_QA =3D "ldflags useless-rpaths rpaths dev-so"
	ERROR_QA =3D "debug-deps dev-deps debug-files arch la2 pkgconfig la perms"

Once built I get an immediate error on boot
	/sbin/init: can't resolve symbol '__register_frame_info'
	Kernel panic - not syncing: Attempted to kill init!

I'm wondering if there is a simple mechanism to clean up the unwind binding=
s via OE settings.

In general, is there a "known-good" procedure for building/using uClibc via=
 oe-core +/- layers?

Regards,
Martin



