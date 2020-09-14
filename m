Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com [91.207.212.93])
 by mx.groups.io with SMTP id smtpd.web12.54913.1600066021208553355
 for <openembedded-core@lists.openembedded.org>;
 Sun, 13 Sep 2020 23:47:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@st.com header.s=stmicroelectronics header.b=Bb1ghScC;
 spf=pass (domain: st.com, ip: 91.207.212.93, mailfrom: christophe.guibout@st.com)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id 08E6cJ29027630
	for <openembedded-core@lists.openembedded.org>; Mon, 14 Sep 2020 08:46:59 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com; h=from : to : cc : subject
 : date : message-id : content-type : content-transfer-encoding :
 mime-version; s=STMicroelectronics;
 bh=cvRrUbjmi/FiGuReUUkN/W+SIwBgF0FO1O2X8mKh7NU=;
 b=Bb1ghScCW5S8DM+eqd0UeLqGiEese45M5pGWCZYSL2ObzMS1ipgWcwb7GdPSXCUe10F5
 YNuL8zMe6plEctzrtfHABZCO+ey1UrBOjtpjmS8pCwSJ8753IOckc+ppK0CpFyW3OfMI
 ZPnKG7peCK1nkxIjN3AhKmB1IUa/FCVd7T/UWSoBcW0hXnlWgN5LQFp/086Nh58uS/j4
 2sE/De2LAwCT6odqp29nFyeS5MBf4Uaq2smOzLsQO/4/sGyMlHiSPm4Bxes2H8cFQuEf
 zfYScx922z9aBAiaBI0aEvf+D515+pgxEvHJ9zKhx8QcCdT6PNPZCwA2IS9gJ6CdJeHN Sw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
	by mx07-00178001.pphosted.com with ESMTP id 33gkf98r88-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Mon, 14 Sep 2020 08:46:59 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id CA8B610002A
	for <openembedded-core@lists.openembedded.org>; Mon, 14 Sep 2020 08:46:57 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag6node1.st.com [10.75.127.16])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 24BF4212FD3
	for <openembedded-core@lists.openembedded.org>; Mon, 14 Sep 2020 08:46:57 +0200 (CEST)
Received: from SFHDAG6NODE2.st.com (10.75.127.17) by SFHDAG6NODE1.st.com
 (10.75.127.16) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Mon, 14 Sep
 2020 08:46:56 +0200
Received: from SFHDAG6NODE2.st.com ([fe80::a56f:c186:bab7:13d6]) by
 SFHDAG6NODE2.st.com ([fe80::a56f:c186:bab7:13d6%20]) with mapi id
 15.00.1473.003; Mon, 14 Sep 2020 08:46:56 +0200
From: "Christophe GUIBOUT" <christophe.guibout@st.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
CC: Christophe GUIBOUT <christophe.guibout@st.com>
Subject: [PATCH] initramfs-framework: support kernel cmdline with double quotes
Thread-Topic: [PATCH] initramfs-framework: support kernel cmdline with double
 quotes
Thread-Index: AQHWimLWPPx4iSIG6k+fWNCJWSXnjw==
Date: Mon, 14 Sep 2020 06:46:56 +0000
Message-ID: <20200914064632.12530-1-christophe.guibout@st.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.75.127.49]
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235,18.0.687
 definitions=2020-09-13_09:2020-09-10,2020-09-13 signatures=0
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
