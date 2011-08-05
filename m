Received: from mx4.leapfrog.com ([63.114.26.254])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dlazzari@leapfrog.com>) id 1QpPgc-000499-PB
	for openembedded-core@lists.openembedded.org;
	Fri, 05 Aug 2011 21:03:59 +0200
Received: from mx4.leapfrog.com (localhost [127.0.0.1])
	by localhost.leapfrog.com (Postfix) with ESMTP id 8EC445E99
	for <openembedded-core@lists.openembedded.org>;
	Fri,  5 Aug 2011 11:34:22 -0700 (PDT)
Received: from NAEXCHHT01.na.leapfrog.com (unknown [10.15.6.13])
	by mx4.leapfrog.com (Postfix) with ESMTP id 6B95D5E6D
	for <openembedded-core@lists.openembedded.org>;
	Fri,  5 Aug 2011 11:34:22 -0700 (PDT)
Received: from naemmail08.na.leapfrog.com ([10.11.5.92]) by
	NAEXCHHT01.na.leapfrog.com ([::1]) with mapi;
	Fri, 5 Aug 2011 11:34:22 -0700
From: Daniel Lazzari <dlazzari@leapfrog.com>
To: "'openembedded-core@lists.openembedded.org'"
	<openembedded-core@lists.openembedded.org>
Date: Fri, 5 Aug 2011 11:34:21 -0700
Thread-Topic: [PATCH v2] Immediately append TCLIBCAPPEND to TMPDIR in
	defaultsetup.conf
Thread-Index: AcxTnkr1zeCJbkz5Th++XchI2gIgqg==
Message-ID: <359B10B9B28B294BAA6405D9320312E0111E934072@naemmail08.na.leapfrog.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
acceptlanguage: en-US
MIME-Version: 1.0
Subject: [PATCH v2] Immediately append TCLIBCAPPEND to TMPDIR in defaultsetup.conf
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
X-List-Received-Date: Fri, 05 Aug 2011 19:03:59 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Immediately append TCLIBCAPPEND to TMPDIR in defaultsetup.conf
    instead of lazily appending it with _append. This fixes a bug where
    the wrong cache was cleared when BB_SRCREV_POLICY =3D "clear".


Signed-off-by: Daniel Lazzari Jr <dlazzari@leapfrog.com>
---
 meta/conf/distro/defaultsetup.conf |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/meta/conf/distro/defaultsetup.conf b/meta/conf/distro/defaults=
etup.conf
index 919ed00..1a29778 100644
--- a/meta/conf/distro/defaultsetup.conf
+++ b/meta/conf/distro/defaultsetup.conf
@@ -11,7 +11,7 @@ require conf/distro/include/tclibc-${TCLIBC}.inc
=20
 # Allow single libc distros to disable this code
 TCLIBCAPPEND ?=3D "-${TCLIBC}"
-TMPDIR_append =3D "${TCLIBCAPPEND}"
+TMPDIR .=3D "${TCLIBCAPPEND}"
=20
 CACHE =3D "${TMPDIR}/cache/${TCMODE}-${TCLIBC}${@['', '/' + str(bb.data.ge=
tVar('MACHINE', d, 1))][bool(bb.data.getVar('MACHINE', d, 1))]}${@['', '/' =
+ str(bb.data.getVar('SDKMACHINE', d, 1))][bool(bb.data.getVar('SDKMACHINE'=
, d, 1))]}"
=20
--=20
1.7.0.4



