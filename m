Return-Path: <rehsack@gmail.com>
Received: from mail-wm0-f52.google.com (mail-wm0-f52.google.com [74.125.82.52])
	by mail.openembedded.org (Postfix) with ESMTP id EA15577220
	for <openembedded-core@lists.openembedded.org>;
	Thu, 12 Nov 2015 16:13:17 +0000 (UTC)
Received: by wmec201 with SMTP id c201so40849670wme.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 12 Nov 2015 08:13:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:content-type:content-transfer-encoding:subject:date:message-id
	:cc:to:mime-version;
	bh=sudDx67EG5IetfoS9H5r5X+6J2k4dWwCbk7ixoU/vQQ=;
	b=kzGv4Nnlu7wl5qwwu4oNgC7KKsZM0vwxudWMN1LhrGoc3EvVEm/ontq77UBIL8lcK6
	PNmW2A0VsXgtkW1QGz7z6LsocOxXGhFU2BsZ6jxR/lg7cEXpnikF7C4PoDpyez33TpAb
	NRpHHGYHg27piq6YMOoK2+GFGN/f+ZBDGwWKo1vWGa8QTuVYeriqcWbV1hN86HQnYt0Q
	tgyeau5UVN64ucV5FgFeQmKMyYONPErNXKmX0nszwtsha/CE3iqgZ0vBc+MgK1DtMxxp
	6dYDUG9up97zGi4u+HUlGPBYg3L22GPN87od246B1tYzpPCzeLrMyB6+Aj3tIQUslvUX
	78rg==
X-Received: by 10.28.19.65 with SMTP id 62mr17804364wmt.35.1447344797495;
	Thu, 12 Nov 2015 08:13:17 -0800 (PST)
Received: from walter.muppets.liwing.de (p578b540c.dip0.t-ipconnect.de.
	[87.139.84.12]) by smtp.gmail.com with ESMTPSA id
	t126sm31455464wmd.18.2015.11.12.08.13.16
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Thu, 12 Nov 2015 08:13:16 -0800 (PST)
From: Jens Rehsack <rehsack@gmail.com>
Date: Thu, 12 Nov 2015 17:13:15 +0100
Message-Id: <EAB26B29-7295-417E-B128-E8B2CB534DD4@gmail.com>
To: OE-core <openembedded-core@lists.openembedded.org>
Mime-Version: 1.0 (Mac OS X Mail 8.2 \(2104\))
X-Mailer: Apple Mail (2.2104)
Subject: [PATCH] kernel: fix race condition between compile_kernelmodules and shared_workdir
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
X-List-Received-Date: Thu, 12 Nov 2015 16:13:19 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Fixes https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D8127 which =
causes
[ 1225.089323] 8189es: Unknown symbol cfg80211_scan_done (err -22)
[ 1225.095916] 8189es: no symbol version for =
cfg80211_remain_on_channel_expired
when loading external compiled 8189es module.

Signed-off-by: Jens Rehsack <sno@netbsd.org>
---
 meta/classes/kernel.bbclass      | 8 ++++++++
 meta/classes/module-base.bbclass | 2 +-
 2 files changed, 9 insertions(+), 1 deletion(-)

diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
index 5e8b6cf..b75a462 100644
--- a/meta/classes/kernel.bbclass
+++ b/meta/classes/kernel.bbclass
@@ -217,6 +217,14 @@ do_compile_kernelmodules() {
 	unset CFLAGS CPPFLAGS CXXFLAGS LDFLAGS MACHINE
 	if (grep -q -i -e '^CONFIG_MODULES=3Dy$' ${B}/.config); then
 		oe_runmake -C ${B} ${PARALLEL_MAKE} modules =
CC=3D"${KERNEL_CC}" LD=3D"${KERNEL_LD}" ${KERNEL_EXTRA_ARGS}
+
+		# Module.symvers gets updated during the=20
+		# building of the kernel modules. We need to
+		# update this in the shared workdir since some
+		# external kernel modules has a dependency on
+		# other kernel modules and will look at this
+		# file to do symbol lookups
+		cp Module.symvers ${STAGING_KERNEL_BUILDDIR}/
 	else
 		bbnote "no modules to compile"
 	fi
diff --git a/meta/classes/module-base.bbclass =
b/meta/classes/module-base.bbclass
index 8be26c4..cf4b02e 100644
--- a/meta/classes/module-base.bbclass
+++ b/meta/classes/module-base.bbclass
@@ -1,7 +1,7 @@
 inherit kernel-arch
=20
 # This is instead of DEPENDS =3D "virtual/kernel"
-do_configure[depends] +=3D "virtual/kernel:do_shared_workdir"
+do_configure[depends] +=3D "virtual/kernel:do_compile_kernelmodules"
=20
 export OS =3D "${TARGET_OS}"
 export CROSS_COMPILE =3D "${TARGET_PREFIX}"
--=20
2.4.9 (Apple Git-60)

Since 2.0 is out without any such a patch - which leaves probably lots =
of people with broken modules
after upgrading to jethro, please use such a patch (optimized for not =
waiting when no 3rd party modules
are involved) - which hopefully avoids Bruce's performance issue and =
fixes the race condition.

Cheers
--=20
Jens Rehsack - rehsack@gmail.com


