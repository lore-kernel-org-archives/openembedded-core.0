Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.11830.1601982889860491649
 for <openembedded-core@lists.openembedded.org>;
 Tue, 06 Oct 2020 04:14:50 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 953C81477
	for <openembedded-core@lists.openembedded.org>; Tue,  6 Oct 2020 04:14:49 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 40A853F66B
	for <openembedded-core@lists.openembedded.org>; Tue,  6 Oct 2020 04:14:49 -0700 (PDT)
From: "Ross Burton" <ross@burtonini.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 3/3] boost: consolidate and update library list
Date: Tue,  6 Oct 2020 12:14:44 +0100
Message-Id: <20201006111444.3952584-3-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201006111444.3952584-1-ross.burton@arm.com>
References: <20201006111444.3952584-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Add some new libraries to the list (fiber, headers, type_erasure).

Move context/coroutine to the list instead of using overrides as it
builds everywhere I can test it.

Remove the mips16e override for wave as Boost fails so dramatically with
mips16e enabled that this isn't even close to a fix. Someone who cares
can fix this properly.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/recipes-support/boost/boost.inc | 18 ++++++------------
 1 file changed, 6 insertions(+), 12 deletions(-)

diff --git a/meta/recipes-support/boost/boost.inc b/meta/recipes-support/=
boost/boost.inc
index 89df754744..cbf9cad707 100644
--- a/meta/recipes-support/boost/boost.inc
+++ b/meta/recipes-support/boost/boost.inc
@@ -14,11 +14,15 @@ BOOST_LIBS =3D "\
 	atomic \
 	chrono \
 	container \
+	context \
 	contract \
+	coroutine \
 	date_time \
 	exception \
+	fiber \
 	filesystem \
 	graph \
+	headers \
 	iostreams \
 	log \
 	math \
@@ -27,23 +31,13 @@ BOOST_LIBS =3D "\
 	regex \
 	serialization \
 	system \
-	timer \
 	test \
 	thread \
+	timer \
+	type_erasure \
 	wave \
 	"
=20
-# only supported by x86 and powerpc
-BOOST_LIBS_append_x86 =3D " context coroutine"
-BOOST_LIBS_append_x86-64 =3D " context coroutine"
-BOOST_LIBS_append_powerpc =3D " context coroutine"
-BOOST_LIBS_append_arm =3D " context coroutine"
-BOOST_LIBS_append_aarch64 =3D " context coroutine"
-# need consistent settings for native builds (x86 override not applied f=
or native)
-BOOST_LIBS_remove_class-native =3D " context coroutine"
-# does not compile
-BOOST_LIBS_remove_mips16e =3D "wave"
-
 # optional libraries
 PACKAGECONFIG ??=3D "locale python"
 PACKAGECONFIG[locale] =3D ",,icu"
--=20
2.25.1

