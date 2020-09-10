Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com [91.207.212.93])
 by mx.groups.io with SMTP id smtpd.web10.22910.1599746796003031761
 for <openembedded-core@lists.openembedded.org>;
 Thu, 10 Sep 2020 07:06:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@st.com header.s=stmicroelectronics header.b=rXhxj+oQ;
 spf=pass (domain: st.com, ip: 91.207.212.93, mailfrom: christophe.guibout@st.com)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id 08AE3Zb1017219
	for <openembedded-core@lists.openembedded.org>; Thu, 10 Sep 2020 16:06:33 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com; h=from : to : cc : subject
 : date : message-id : content-type : content-transfer-encoding :
 mime-version; s=STMicroelectronics;
 bh=cvRrUbjmi/FiGuReUUkN/W+SIwBgF0FO1O2X8mKh7NU=;
 b=rXhxj+oQl8fDZIlfask8Au+BthPlIDhRk2iQHKMv+AU6XKn9JL4tYlap7Lm2KiyOLfvc
 EMopLIshawIL88CCrzmCEOT9zCO4cPJuioW84xezd81/9ge8JNPbEHhqCKdm6EjeINjL
 XZEs77JJGKi+uVxeMjeiSaUfbDKJorw0J2rIF3xY84DQxlWPBwGoqAK8qW9eK0BH+ZP2
 7OZIUN56XW/C0i9Qh/Trvvp2zlxzjb2gxAo4sIRxi8IJgviuYAHlvIeMKjkHP3fZ38zI
 g97cVibuwfdA8Y4TlCX0hMNLqcBJyADo9zxdVVO9VNYDH/2NU2ONPequfDSLdHTlFtGF Ag== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
	by mx07-00178001.pphosted.com with ESMTP id 33c1jfbwy7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Thu, 10 Sep 2020 16:06:33 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id E1A9510002A
	for <openembedded-core@lists.openembedded.org>; Thu, 10 Sep 2020 16:06:32 +0200 (CEST)
Received: from Webmail-eu.st.com (gpxdag6node4.st.com [10.75.127.80])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 2D6F62ADA18
	for <openembedded-core@lists.openembedded.org>; Thu, 10 Sep 2020 16:06:32 +0200 (CEST)
Received: from GPXDAG6NODE5.st.com (10.75.127.81) by GPXDAG6NODE4.st.com
 (10.75.127.80) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Thu, 10 Sep
 2020 16:06:31 +0200
Received: from GPXDAG6NODE5.st.com ([fe80::1512:89:fa19:a556]) by
 GPXDAG6NODE5.st.com ([fe80::1512:89:fa19:a556%19]) with mapi id
 15.00.1473.003; Thu, 10 Sep 2020 16:06:31 +0200
From: christophe.guibout@st.com
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
CC: Christophe GUIBOUT <christophe.guibout@st.com>
Subject: [PATCH] initramfs-framework: support kernel cmdline with double quotes
Thread-Topic: [PATCH] initramfs-framework: support kernel cmdline with double
 quotes
Thread-Index: AQHWh3uVOQabfj079k66eKJesFD/Fw==
Date: Thu, 10 Sep 2020 14:06:31 +0000
Message-ID: <20200910140622.20040-1-christophe.guibout@st.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.75.127.48]
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235,18.0.687
 definitions=2020-09-10_03:2020-09-10,2020-09-10 signatures=0
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

It avoids init to crash when kernel cmdline contains a string with
spaces inside, like that:
dyndbg=3D"file drivers/usb/core/hub.c +pltf"

Signed-off-by: Christophe Guibout <christophe.guibout@st.com>
---
 .../initrdscripts/initramfs-framework/init          | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/meta/recipes-core/initrdscripts/initramfs-framework/init b/met=
a/recipes-core/initrdscripts/initramfs-framework/init
index c71ce0ce8c..567694aff7 100755
--- a/meta/recipes-core/initrdscripts/initramfs-framework/init
+++ b/meta/recipes-core/initrdscripts/initramfs-framework/init
@@ -88,12 +88,25 @@ fi
=20
 # populate bootparam environment
 for p in `cat /proc/cmdline`; do
+	if [ -n "$quoted" ]; then
+		value=3D"$value $p"
+		if [ "`echo $p | sed -e 's/\"$//'`" !=3D "$p" ]; then
+			eval "bootparam_${quoted}=3D${value}"
+			unset quoted
+		fi
+		continue
+	fi
+
 	opt=3D`echo $p | cut -d'=3D' -f1`
 	opt=3D`echo $opt | sed -e 'y/.-/__/'`
 	if [ "`echo $p | cut -d'=3D' -f1`" =3D "$p" ]; then
 		eval "bootparam_${opt}=3Dtrue"
 	else
 		value=3D"`echo $p | cut -d'=3D' -f2-`"
+		if [ "`echo $value | sed -e 's/^\"//'`" !=3D "$value" ]; then
+			quoted=3D${opt}
+			continue
+		fi
 		eval "bootparam_${opt}=3D\"${value}\""
 	fi
 done
--=20
2.17.1
