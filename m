Return-Path: <Noor_Ahsan@mentor.com>
Received: from relay1.mentorg.com (relay1.mentorg.com [192.94.38.131])
	by mail.openembedded.org (Postfix) with ESMTP id C038B6CEE8
	for <openembedded-core@lists.openembedded.org>;
	Mon, 28 Oct 2013 10:13:36 +0000 (UTC)
Received: from svr-orw-exc-10.mgc.mentorg.com ([147.34.98.58])
	by relay1.mentorg.com with esmtp 
	id 1VajpK-0000j6-KB from Noor_Ahsan@mentor.com 
	for openembedded-core@lists.openembedded.org;
	Mon, 28 Oct 2013 03:13:38 -0700
Received: from SVR-IES-FEM-01.mgc.mentorg.com ([137.202.0.104]) by
	SVR-ORW-EXC-10.mgc.mentorg.com with Microsoft
	SMTPSVC(6.0.3790.4675); Mon, 28 Oct 2013 03:13:38 -0700
Received: from EU-MBX-01.mgc.mentorg.com ([169.254.1.38]) by
	SVR-IES-FEM-01.mgc.mentorg.com ([169.254.201.149]) with mapi id
	14.02.0247.003; Mon, 28 Oct 2013 10:13:37 +0000
From: "Ahsan, Noor" <Noor_Ahsan@mentor.com>
To: "Shakeel, Muhammad" <Muhammad_Shakeel@mentor.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core] [PATCH] sysvinit-inittab: Fix getting tty device
	name	from SERIAL_CONSOLES entries
Thread-Index: AQHOw25wdYkIFqtJVE+CHYnQPPILhZn/L/xAgArVkIA=
Date: Mon, 28 Oct 2013 10:13:36 +0000
Message-ID: <365E1805BC95084CBE82381A0B869994DE540F32@EU-MBX-01.mgc.mentorg.com>
References: <1381158304-931-1-git-send-email-muhammad_shakeel@mentor.com>
	<365E1805BC95084CBE82381A0B869994DE53BF6B@EU-MBX-01.mgc.mentorg.com>
In-Reply-To: <365E1805BC95084CBE82381A0B869994DE53BF6B@EU-MBX-01.mgc.mentorg.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [137.202.0.76]
MIME-Version: 1.0
X-OriginalArrivalTime: 28 Oct 2013 10:13:38.0667 (UTC)
	FILETIME=[5EBBBBB0:01CED3C6]
Subject: Re: [PATCH] sysvinit-inittab: Fix getting tty device	name	from SERIAL_CONSOLES entries
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
X-List-Received-Date: Mon, 28 Oct 2013 10:13:37 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hello Saul,

I there any issue with this patch? We need this patch for our release.

Noor

-----Original Message-----
From: openembedded-core-bounces@lists.openembedded.org [mailto:openembedded=
-core-bounces@lists.openembedded.org] On Behalf Of Ahsan, Noor
Sent: Monday, October 21, 2013 5:46 PM
To: Shakeel, Muhammad; openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [PATCH] sysvinit-inittab: Fix getting tty device nam=
e from SERIAL_CONSOLES entries

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
_______________________________________________
Openembedded-core mailing list
Openembedded-core@lists.openembedded.org
http://lists.openembedded.org/mailman/listinfo/openembedded-core

