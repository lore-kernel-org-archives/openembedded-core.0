Received: from linux.microsoft.com (linux.microsoft.com [13.77.154.182])
 by mx.groups.io with SMTP id smtpd.web12.9678.1622134978910872015
 for <openembedded-core@lists.openembedded.org>;
 Thu, 27 May 2021 10:02:59 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@linux.microsoft.com header.s=default header.b=OcdUuXIO;
 spf=pass (domain: linux.microsoft.com, ip: 13.77.154.182, mailfrom: alhe@linux.microsoft.com)
Received: from alsamon-xub.lan (cpe-68-201-52-49.elp.res.rr.com [68.201.52.49])
	by linux.microsoft.com (Postfix) with ESMTPSA id 7B10F20B7188;
	Thu, 27 May 2021 10:02:57 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com 7B10F20B7188
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
	s=default; t=1622134978;
	bh=hlLNmRf7rSu7JEJ5ar+XLVIU1/OEeVLe1BbmJFfh+2w=;
	h=From:To:Cc:Subject:Date:From;
	b=OcdUuXIO+kWb/u1LLtH1zwm3sGBMH6FINcsjnzrASmoi63vP7a/jHQanufkUlJ5z9
	 /u0GfAj8ZKlXmBsxeAVE8ppRAUUbPvtzMxoNDj3F8Mi5E3NxXJMao3pDtLX2BrPu+I
	 ORQgItqw2BbR0NQYv7UjFq+CtpaEx0jAQqOn1Mb8=
From: "Alejandro Hernandez Samaniego" <alhe@linux.microsoft.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>,
	Leon Woestenberg <leon@sidebranch.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>,
	Alejandro Hernandez Samaniego <alhe@linux.microsoft.com>
Subject: [PATCH] gcc-cross-canadian: Install gcc/g++ wrappers for musl
Date: Thu, 27 May 2021 11:02:45 -0600
Message-Id: <20210527170245.2179602-1-alhe@linux.microsoft.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

From: Khem Raj <raj.khem@gmail.com>

gcc needs -mmusl option to be passed in SDK since we ship crossdk compile=
r
configured for glibc by default, this helps in creating correct
compiler defaults for musl based SDK compilers

[YOCTO #13459]

(From OE-Core rev: e6fbac7aeabe00d8fb734992012dd629a8527b25)

Cc: Leon Woestenberg <leon@sidebranch.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Alejandro Hernandez Samaniego <alhe@linux.microsoft.com>
---
 .../gcc/gcc-cross-canadian.inc                | 23 +++++++++++++++++++
 1 file changed, 23 insertions(+)

diff --git a/meta/recipes-devtools/gcc/gcc-cross-canadian.inc b/meta/reci=
pes-devtools/gcc/gcc-cross-canadian.inc
index 553ef7fe62..c5935b978d 100644
--- a/meta/recipes-devtools/gcc/gcc-cross-canadian.inc
+++ b/meta/recipes-devtools/gcc/gcc-cross-canadian.inc
@@ -139,6 +139,29 @@ do_install () {
 	chown -R root:root ${D}
 =09
 	cross_canadian_bindirlinks
+
+	for i in linux ${CANADIANEXTRAOS}
+	do
+		for v in ${CANADIANEXTRAVENDOR}
+		do
+			d=3D${D}${bindir}/../${TARGET_ARCH}$v-$i
+			install -d $d
+			for j in ${TARGET_PREFIX}gcc${EXEEXT} ${TARGET_PREFIX}g++${EXEEXT}
+			do
+				p=3D${TARGET_ARCH}$v-$i-`echo $j | sed -e s,${TARGET_PREFIX},,`
+				case $i in
+				*musl*)
+					rm -rf $d/$p
+					echo "#!/usr/bin/env sh" > $d/$p
+					echo "exec \`dirname \$0\`/../${TARGET_SYS}/$j -mmusl \$@" >> $d/$p
+					chmod 0755 $d/$p
+					;;
+				*)
+					;;
+				esac
+			done
+		done
+	done
 }
=20
 ELFUTILS =3D "nativesdk-elfutils"
--=20
2.25.1

