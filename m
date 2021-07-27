Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 by mx.groups.io with SMTP id smtpd.web09.3711.1627403134597350413
 for <openembedded-core@lists.openembedded.org>;
 Tue, 27 Jul 2021 09:25:35 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@denx.de header.s=phobos-20191101 header.b=bZCqUeV+;
 spf=pass (domain: denx.de, ip: 85.214.62.61, mailfrom: marex@denx.de)
Received: from tr.lan (ip-89-176-112-137.net.upcbroadband.cz [89.176.112.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(No client certificate requested)
	(Authenticated sender: marex@denx.de)
	by phobos.denx.de (Postfix) with ESMTPSA id DF46D831D6;
	Tue, 27 Jul 2021 18:25:32 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
	s=phobos-20191101; t=1627403133;
	bh=X1d20yvnKYJjA0rcQ03t8Ay0AFsuc0rFQXvPX6zWrFA=;
	h=From:To:Cc:Subject:Date:From;
	b=bZCqUeV+AxjpnP8CgDhH4wJKmsr4PwGTn4sgXLVeKvD526SXpl6foVUHoliwx/ZRL
	 MiwvpR4wVGqikAuoTNuAPucxAUvtq+vBy8Y9OLtTo2w8tpXdIFhTbKKhnP5RI2NIaP
	 8g3rnm2T2XruWrkwJLi1NpKK+x8w4jhss2BnsTTpEBotgEFA3XgM4T8PvLkfHrd8il
	 Wa7BS2PbRVwOReSbyj9ZWcWpgyaO5BnsD5NkkMyLveowY9tzm+8TwL0SOrFH2rw0bz
	 bZxf7zXlnEOJ0BrveICuRNrGb9uLApF3k7V5KxAPEqDo2Po/6bBfq8LxxHXpwB7hpw
	 U7aTkCD7XCyCg==
From: "Marek Vasut" <marex@denx.de>
To: openembedded-core@lists.openembedded.org
Cc: Marek Vasut <marex@denx.de>,
	Richard Purdie <richard.purdie@linuxfoundation.org>,
	Sinan Kaya <okaya@kernel.org>
Subject: [PATCH] kernel-uboot: Handle gzip and lzo compression options
Date: Tue, 27 Jul 2021 18:25:29 +0200
Message-Id: <20210727162529.9618-1-marex@denx.de>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.103.2 at phobos.denx.de
X-Virus-Status: Clean
Content-Transfer-Encoding: quoted-printable

Since 5c72105e29 ("kernel-uboot: allow compression option to be configura=
ble")
it is possible to select kernel compression method, however the resulting
image is always compressed with gzip, so selecting any other method than
gzip results in unbootable images. Add support for lzo for starters, sinc=
e
that is fast to decompress and useful in low boot time scenarios.

Note that we should likely add some check for unsupported compression
methods. We should also add dependency on lzop-native I think.

Signed-off-by: Marek Vasut <marex@denx.de>
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Sinan Kaya <okaya@kernel.org>
---
 meta/classes/kernel-uboot.bbclass | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/meta/classes/kernel-uboot.bbclass b/meta/classes/kernel-uboo=
t.bbclass
index b1e7ac05c2..2daa068298 100644
--- a/meta/classes/kernel-uboot.bbclass
+++ b/meta/classes/kernel-uboot.bbclass
@@ -22,7 +22,11 @@ uboot_prep_kimage() {
 	[ -n "${vmlinux_path}" ] && ${OBJCOPY} -O binary -R .note -R .comment -=
S "${vmlinux_path}" linux.bin
=20
 	if [ "${linux_comp}" !=3D "none" ] ; then
-		gzip -9 linux.bin
+		if [ "${linux_comp}" =3D "gzip" ] ; then
+			gzip -9 linux.bin
+		elif [ "${linux_comp}" =3D "lzo" ] ; then
+			lzop -9 linux.bin
+		fi
 		mv -f "linux.bin${linux_suffix}" linux.bin
 	fi
=20
--=20
2.30.2

