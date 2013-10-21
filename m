Return-Path: <Noor_Ahsan@mentor.com>
Received: from relay1.mentorg.com (relay1.mentorg.com [192.94.38.131])
	by mail.openembedded.org (Postfix) with ESMTP id 88B3C6D073
	for <openembedded-core@lists.openembedded.org>;
	Mon, 21 Oct 2013 12:45:53 +0000 (UTC)
Received: from svr-orw-fem-01.mgc.mentorg.com ([147.34.98.93])
	by relay1.mentorg.com with esmtp 
	id 1VYErq-0003J3-W3 from Noor_Ahsan@mentor.com 
	for openembedded-core@lists.openembedded.org;
	Mon, 21 Oct 2013 05:45:55 -0700
Received: from SVR-IES-FEM-05.mgc.mentorg.com ([137.202.0.112]) by
	svr-orw-fem-01.mgc.mentorg.com over TLS secured channel with
	Microsoft SMTPSVC(6.0.3790.4675); Mon, 21 Oct 2013 05:45:54 -0700
Received: from EU-MBX-01.mgc.mentorg.com ([169.254.1.38]) by
	SVR-IES-FEM-05.mgc.mentorg.com ([137.202.0.112]) with mapi id
	14.02.0247.003; Mon, 21 Oct 2013 13:45:53 +0100
From: "Ahsan, Noor" <Noor_Ahsan@mentor.com>
To: "Shakeel, Muhammad" <Muhammad_Shakeel@mentor.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core] [PATCH] sysvinit-inittab: Fix getting tty device
	name	from SERIAL_CONSOLES entries
Thread-Index: AQHOw25wdYkIFqtJVE+CHYnQPPILhZn/L/xA
Date: Mon, 21 Oct 2013 12:45:52 +0000
Message-ID: <365E1805BC95084CBE82381A0B869994DE53BF6B@EU-MBX-01.mgc.mentorg.com>
References: <1381158304-931-1-git-send-email-muhammad_shakeel@mentor.com>
In-Reply-To: <1381158304-931-1-git-send-email-muhammad_shakeel@mentor.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [137.202.0.76]
MIME-Version: 1.0
X-OriginalArrivalTime: 21 Oct 2013 12:45:54.0973 (UTC)
	FILETIME=[7B8124D0:01CECE5B]
Subject: Re: [PATCH] sysvinit-inittab: Fix getting tty device name	from SERIAL_CONSOLES entries
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
X-List-Received-Date: Mon, 21 Oct 2013 12:45:54 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hello,

Kindly merge this patch we need it for Yocto 1.5.

Noor

-----Original Message-----
From: openembedded-core-bounces@lists.openembedded.org [mailto:openembedded=
-core-bounces@lists.openembedded.org] On Behalf Of Shakeel, Muhammad
Sent: Monday, October 07, 2013 8:05 PM
To: openembedded-core@lists.openembedded.org
Subject: [OE-core] [PATCH] sysvinit-inittab: Fix getting tty device name fr=
om SERIAL_CONSOLES entries

From: Muhammad Shakeel <muhammad_shakeel@mentor.com>

Currently the part after "tty" in the device name go into label along with =
everything after that part. For example if SERIAL_CONSOLES=3D"115200;vt100;=
ttyS0"
than label=3DS0 but if SERIAL_CONSOLES=3D"115200;ttyS0;vt100" than label=3D=
S0;vt100.
If SERIAL_CONSOLES=3D"..;ttyX;..", part after 'X' should also be trimmed.

Signed-off-by: Muhammad Shakeel <muhammad_shakeel@mentor.com>
---
 .../sysvinit/sysvinit-inittab_2.88dsf.bb           |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/sysvinit/sysvinit-inittab_2.88dsf.bb b/meta/=
recipes-core/sysvinit/sysvinit-inittab_2.88dsf.bb
index 23c284d..05ba410 100644
--- a/meta/recipes-core/sysvinit/sysvinit-inittab_2.88dsf.bb
+++ b/meta/recipes-core/sysvinit/sysvinit-inittab_2.88dsf.bb
@@ -22,7 +22,7 @@ do_install() {
     for i in $tmp
     do
 	j=3D`echo ${i} | sed s/\;/\ /g`
-	label=3D`echo ${i} | sed -e 's/^.*;tty//'`
+	label=3D`echo ${i} | sed -e 's/^.*;tty//' -e 's/;.*//'`
 	echo "$label:12345:respawn:${base_sbindir}/getty ${j}" >> ${D}${sysconfdi=
r}/inittab
     done
=20
--
1.7.9.5

_______________________________________________
Openembedded-core mailing list
Openembedded-core@lists.openembedded.org
http://lists.openembedded.org/mailman/listinfo/openembedded-core

