Received: from forward100o.mail.yandex.net (forward100o.mail.yandex.net [37.140.190.180])
 by mx.groups.io with SMTP id smtpd.web12.1722.1610785150166871390
 for <openembedded-core@lists.openembedded.org>;
 Sat, 16 Jan 2021 00:19:10 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@yandex.ru header.s=mail header.b=qoXyCKSE;
 spf=pass (domain: yandex.ru, ip: 37.140.190.180, mailfrom: amozzhuhin@yandex.ru)
Received: from sas1-ad61ad785433.qloud-c.yandex.net (sas1-ad61ad785433.qloud-c.yandex.net [IPv6:2a02:6b8:c08:37a4:0:640:ad61:ad78])
	by forward100o.mail.yandex.net (Yandex) with ESMTP id A25334AC17CA
	for <openembedded-core@lists.openembedded.org>; Sat, 16 Jan 2021 11:19:06 +0300 (MSK)
Received: from sas1-37da021029ee.qloud-c.yandex.net (sas1-37da021029ee.qloud-c.yandex.net [2a02:6b8:c08:1612:0:640:37da:210])
	by sas1-ad61ad785433.qloud-c.yandex.net (mxback/Yandex) with ESMTP id eGbglxeGSB-J6D4Hq0L;
	Sat, 16 Jan 2021 11:19:06 +0300
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex.ru; s=mail; t=1610785146;
	bh=3af8VdVY00+YdRSTspcMZ/dihbB4dz1hhQH4imfE3AI=;
	h=Date:Subject:To:From:Message-Id:Cc;
	b=qoXyCKSEXEoS7J6OMaRDqYbp2MDUod+0X7scCjhkU8TjPxN+zDBsceW44BT4rBjiL
	 zfLrjy3KwHKgXF7wiDMkEhjr/7iyeuNcW8BKlP5SNaHJ4H575On5a7fpkVJbjXHIv6
	 QWaNrF13w1udV/bmhD1bxrWThhpxryxKyvQZapCw=
Authentication-Results: sas1-ad61ad785433.qloud-c.yandex.net; dkim=pass header.i=@yandex.ru
Received: by sas1-37da021029ee.qloud-c.yandex.net (smtp/Yandex) with ESMTPSA id 3Q3xuDszHK-J5JKvLW1;
	Sat, 16 Jan 2021 11:19:05 +0300
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(Client certificate not present)
From: amozzhuhin@yandex.ru
To: openembedded-core@lists.openembedded.org
Cc: Andrey Mozzhuhin <amozzhuhin@yandex.ru>
Subject: [PATCH] toolchain-shar-extract.sh: Handle special characters in script path
Date: Sat, 16 Jan 2021 11:18:41 +0300
Message-Id: <20210116081841.2600301-1-amozzhuhin@yandex.ru>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Extracting SDK archive may fail if the script is run using a path with
special characters such as space or asterisk. This is because the shell
interprets such characters after expanding the $0 variable.

Added quotes to all uses of the shell variable $0 to fix this.

Signed-off-by: Andrey Mozzhuhin <amozzhuhin@yandex.ru>
---
 meta/files/toolchain-shar-extract.sh | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/meta/files/toolchain-shar-extract.sh b/meta/files/toolchain-=
shar-extract.sh
index bea6d4189a..dd9342758b 100644
--- a/meta/files/toolchain-shar-extract.sh
+++ b/meta/files/toolchain-shar-extract.sh
@@ -95,7 +95,7 @@ while getopts ":yd:npDRSl" OPT; do
 		listcontents=3D1
 		;;
 	*)
-		echo "Usage: $(basename $0) [-y] [-d <dir>]"
+		echo "Usage: $(basename "$0") [-y] [-d <dir>]"
 		echo "  -y         Automatic yes to all prompts"
 		echo "  -d <dir>   Install the SDK to <dir>"
 		echo "=3D=3D=3D=3D=3D=3D=3D=3D Extensible SDK only options =3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D"
@@ -111,17 +111,17 @@ while getopts ":yd:npDRSl" OPT; do
 	esac
 done
=20
-payload_offset=3D$(($(grep -na -m1 "^MARKER:$" $0|cut -d':' -f1) + 1))
+payload_offset=3D$(($(grep -na -m1 "^MARKER:$" "$0"|cut -d':' -f1) + 1))
 if [ "$listcontents" =3D "1" ] ; then
     if [ @SDK_ARCHIVE_TYPE@ =3D "zip" ]; then
-        tail -n +$payload_offset $0 > sdk.zip
+        tail -n +$payload_offset "$0" > sdk.zip
         if unzip -l sdk.zip;then
             rm sdk.zip
         else
             rm sdk.zip && exit 1
         fi
     else
-        tail -n +$payload_offset $0| tar tvJ || exit 1
+        tail -n +$payload_offset "$0"| tar tvJ || exit 1
     fi
     exit
 fi
@@ -242,14 +242,14 @@ fi
=20
 printf "Extracting SDK..."
 if [ @SDK_ARCHIVE_TYPE@ =3D "zip" ]; then
-    tail -n +$payload_offset $0 > sdk.zip
+    tail -n +$payload_offset "$0" > sdk.zip
     if $SUDO_EXEC unzip $EXTRA_TAR_OPTIONS sdk.zip -d $target_sdk_dir;th=
en
         rm sdk.zip
     else
         rm sdk.zip && exit 1
     fi
 else
-    tail -n +$payload_offset $0| $SUDO_EXEC tar mxJ -C $target_sdk_dir -=
-checkpoint=3D.2500 $EXTRA_TAR_OPTIONS || exit 1
+    tail -n +$payload_offset "$0"| $SUDO_EXEC tar mxJ -C $target_sdk_dir=
 --checkpoint=3D.2500 $EXTRA_TAR_OPTIONS || exit 1
 fi
 echo "done"
=20
--=20
2.25.1

