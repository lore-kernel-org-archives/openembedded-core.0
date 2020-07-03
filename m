Received: from esa2.mentor.iphmx.com (esa2.mentor.iphmx.com [68.232.141.98])
 by mx.groups.io with SMTP id smtpd.web10.10358.1593783535383423511
 for <openembedded-core@lists.openembedded.org>;
 Fri, 03 Jul 2020 06:38:55 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: mentor.com, ip: 68.232.141.98, mailfrom: noor_ahsan@mentor.com)
IronPort-SDR: 0yu5Gj9/hq2+0FQyPa13I1SjdkdmuQNrXeR3wkGEUeO1/GTZvzHnkCs/Hdf5eoZD4XAoqxgcY0
 Vv0pvAV8kbxwLo8CgM3ytz277XzzUSw6a8Hm5/s9KSWs4KA4xrneF69GplXgNvi3GZ4n3szijV
 3sDFHZ3lKowf2bAsp1gixygZGdSv4zwfZyA0AnV/bcwoTMKexzUzADDPr9eXmNjnNKo4h1dYTa
 3DR4JLmApaUrSaxxSj1vdiUYfrz40e6chVTLn1R4Jtk4ohkXrBiIEZ3ojnxsgFVra2e9gStcTO
 fCk=
X-IronPort-AV: E=Sophos;i="5.75,308,1589270400"; 
   d="scan'208";a="50581293"
Received: from orw-gwy-02-in.mentorg.com ([192.94.38.167])
  by esa2.mentor.iphmx.com with ESMTP; 03 Jul 2020 05:38:54 -0800
IronPort-SDR: OBDODg+EcFdKImJ7TJkMn6LrmxtW/1mL44jF114BmQrzOkJufg2TjFwyjK0zvyJ0CczS/uhuD5
 yqgyWiVs13XUi0K9sccDMsJKAHtEHDHku7RzQYPw4py6nhvJ1z2IbOT/0Rkz4Tfx0RSPGNTIjp
 sClsAPu5w3/dnKjdAbx1Wfac8/9oU42I62F6ROzfE01djOLEDnQhGeEwa/vJZ0Q2uym6rDbBrw
 H3HrKn5SsOWLHA5YXogXtyjEq7/H4K+5/V5zOGjMn9Sxsl+jSggcsow7xFdH68jzlh+iJD5vKF
 3eQ=
From: "Noor Ahsan" <noor_ahsan@mentor.com>
To: "Hussain, Ahsan" <Ahsan_Hussain@mentor.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
CC: "richard.purdie@linuxfoundation.org" <richard.purdie@linuxfoundation.org>
Subject: Re: [OE-core] [dunfell][PATCH 2/2] u-boot: avoid blind merging all *.cfg
Thread-Topic: [OE-core] [dunfell][PATCH 2/2] u-boot: avoid blind merging all
 *.cfg
Thread-Index: AQHWTfYLvvCAljh1MkK2T5HimU2yN6j14hdw
Date: Fri, 3 Jul 2020 13:38:49 +0000
Message-ID: <e82184ddbd1d4cd799b82a640d262a95@svr-ies-mbx-02.mgc.mentorg.com>
References: <cover.1593420599.git.ahsan_hussain@mentor.com>
 <b240c5b9856a3ea0f1b7612622d8fdbef38ccd9e.1593420599.git.ahsan_hussain@mentor.com>
In-Reply-To: <b240c5b9856a3ea0f1b7612622d8fdbef38ccd9e.1593420599.git.ahsan_hussain@mentor.com>
Accept-Language: en-US, en-IE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [137.202.0.90]
MIME-Version: 1.0
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hello Richard,

Can you merge this on Dunfell.

Noor
-----Original Message-----
From: openembedded-core@lists.openembedded.org [mailto:openembedded-core@li=
sts.openembedded.org] On Behalf Of Hussain, Ahsan
Sent: Monday, June 29, 2020 2:16 PM
To: openembedded-core@lists.openembedded.org
Subject: [OE-core] [dunfell][PATCH 2/2] u-boot: avoid blind merging all *.c=
fg

From: Jens Rehsack <rehsack@gmail.com>

This fixes u-boot-qoriq breakage of:

    commit 4fde8c8f479f5acd24fb6e0d0b9b4dc94d6f560b
    Author: Ming Liu <ming.liu@toradex.com>
    Date:   Wed Jun 3 13:56:01 2020 +0200

	u-boot: support merging .cfg files for UBOOT_CONFIG

	U-boot recipe supports .cfg files in SRC_URI, but they would be merged
	to .config during do_configure only when UBOOT_MACHINE is set, we
	should also support merging .cfg files for UBOOT_CONFIG.

The intension of 4fde8c8 looks more than append delta-config snippets to u-=
boot config and should probably be rewritten to express that much better th=
an implicitely assume all "*.cfg" are for merging into .config.

Signed-off-by: Jens Rehsack <sno@netbsd.org>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-bsp/u-boot/u-boot.inc | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-bsp/u-boot/u-boot.inc b/meta/recipes-bsp/u-boot/u=
-boot.inc
index 8cfd25020c..7d241916eb 100644
--- a/meta/recipes-bsp/u-boot/u-boot.inc
+++ b/meta/recipes-bsp/u-boot/u-boot.inc
@@ -85,8 +85,10 @@ do_configure () {
                 j=3D$(expr $j + 1);
                 if [ $j -eq $i ]; then
                     oe_runmake -C ${S} O=3D${B}/${config} ${config}
-                    merge_config.sh -m -O ${B}/${config} ${B}/${config}/.c=
onfig ${@" ".join(find_cfgs(d))}
-                    oe_runmake -C ${S} O=3D${B}/${config} oldconfig
+                    if [ test -n "${@' '.join(find_cfgs(d))}" ]; then
+                        merge_config.sh -m -O ${B}/${config} ${B}/${config=
}/.config ${@" ".join(find_cfgs(d))}
+                        oe_runmake -C ${S} O=3D${B}/${config} oldconfig
+                    fi
                 fi
             done
             unset j
@@ -119,7 +121,7 @@ do_compile () {
 		echo ${UBOOT_LOCALVERSION} > ${S}/.scmversion
 	fi
=20
-    if [ -n "${UBOOT_CONFIG}" ]
+    if [ -n "${UBOOT_CONFIG}" -o -n "${UBOOT_DELTA_CONFIG}" ]
     then
         unset i j k
         for config in ${UBOOT_MACHINE}; do
--
2.25.1

