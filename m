Return-Path: <cristian.iorga@intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 4C23861EEB
	for <openembedded-core@lists.openembedded.org>;
	Mon, 22 Jul 2013 10:17:07 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 22 Jul 2013 03:17:07 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.89,718,1367996400"; d="scan'208";a="374046730"
Received: from irsmsx103.ger.corp.intel.com ([163.33.3.157])
	by fmsmga002.fm.intel.com with ESMTP; 22 Jul 2013 03:17:07 -0700
Received: from irsmsx151.ger.corp.intel.com (163.33.192.59) by
	IRSMSX103.ger.corp.intel.com (163.33.3.157) with Microsoft SMTP Server
	(TLS) id 14.3.123.3; Mon, 22 Jul 2013 11:17:05 +0100
Received: from irsmsx105.ger.corp.intel.com ([169.254.7.52]) by
	IRSMSX151.ger.corp.intel.com ([169.254.4.10]) with mapi id
	14.03.0123.003; Mon, 22 Jul 2013 11:17:04 +0100
From: "Iorga, Cristian" <cristian.iorga@intel.com>
To: Jonathan Liu <net147@gmail.com>, "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core] [PATCH] boot-directdisk: use awk instead of echo -ne
	for	dash compatibility
Thread-Index: AQHOhUC1iiaxBBiJCU+HU2HFBnuR7ZlwfqkQ
Date: Mon, 22 Jul 2013 10:17:04 +0000
Message-ID: <969F26A8BAB325438E7EB80D3C3134FB16C0733E@IRSMSX105.ger.corp.intel.com>
References: <1374322280-1792-1-git-send-email-net147@gmail.com>
In-Reply-To: <1374322280-1792-1-git-send-email-net147@gmail.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [163.33.239.181]
MIME-Version: 1.0
Subject: Re: [PATCH] boot-directdisk: use awk instead of echo -ne for	dash compatibility
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
X-List-Received-Date: Mon, 22 Jul 2013 10:17:07 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

ACK.

-----Original Message-----
From: openembedded-core-bounces@lists.openembedded.org [mailto:openembedded=
-core-bounces@lists.openembedded.org] On Behalf Of Jonathan Liu
Sent: Saturday, July 20, 2013 3:11 PM
To: openembedded-core@lists.openembedded.org
Subject: [OE-core] [PATCH] boot-directdisk: use awk instead of echo -ne for=
 dash compatibility

The echo command is a dash shell built-in and does not support the
-n and -e options so use awk instead.

This fixes the partition table being corrupted when writing the MBR
disk signature into the image.

[YOCTO #4859]

Signed-off-by: Jonathan Liu <net147@gmail.com>
---
 meta/classes/boot-directdisk.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/boot-directdisk.bbclass b/meta/classes/boot-direc=
tdisk.bbclass
index 182957b..8a55aae 100644
--- a/meta/classes/boot-directdisk.bbclass
+++ b/meta/classes/boot-directdisk.bbclass
@@ -81,7 +81,7 @@ build_boot_dd() {
 	parted $IMAGE set 1 boot on=20
 	parted $IMAGE print
=20
-	echo -ne "$(echo ${DISK_SIGNATURE} | fold -w 2 | tac | paste -sd '' | sed=
 's/\(..\)/\\x&/g')" | \
+	awk "BEGIN { printf \"$(echo ${DISK_SIGNATURE} | fold -w 2 | tac | paste =
-sd '' | sed 's/\(..\)/\\x&/g')\" }" | \
 		dd of=3D$IMAGE bs=3D1 seek=3D440 conv=3Dnotrunc
=20
 	OFFSET=3D`expr $END2 / 512`
--=20
1.8.3.2

_______________________________________________
Openembedded-core mailing list
Openembedded-core@lists.openembedded.org
http://lists.openembedded.org/mailman/listinfo/openembedded-core

