Received: from EUR05-VI1-obe.outbound.protection.outlook.com (EUR05-VI1-obe.outbound.protection.outlook.com [40.107.21.135])
 by mx.groups.io with SMTP id smtpd.web12.32963.1599203299160858250
 for <openembedded-core@lists.openembedded.org>;
 Fri, 04 Sep 2020 00:08:21 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@prevas.dk header.s=selector1 header.b=EWXzQYx7;
 spf=pass (domain: prevas.dk, ip: 40.107.21.135, mailfrom: rasmus.villemoes@prevas.dk)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EyvakxWFahcdxCqxWLZ4Ifk3VvOGyFrUuUrTu5Yr+RycvphvegSm4WJ1zNPv7+AB+ixH9UQxQbtHKL9rxK7qHhRn1zszxKGnR6Kvt1+/yxP7h91PLKqGZZiAGwk06YQ7HYqa8eFNs6Jl3KqMQKKm9YzkFe4LDD12WXeo2Yr04zrDnx7LCwUlIDImPHCmI3jCNp9k0zaJv5ib+klN/SKq23vaQEBDcynxzZs7pw2IfMbeQThEBr92azSxuWi3KN6dijE8U3mcvkaUl4r3MdCit8E+FQbPEK4nii+xbcn52WgjdYiSQ5X+xaixhM1kwD+LK40z+eH3l+K9UFQDsa6/XQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JbCehgMxn30bE+5yrRTAxXUxwG549Nl1mbajsU7C678=;
 b=Rsfyh6nJbMshNW9t6s+0BEgYHqWQqIAZhqJ4zSJLNNCUPF3q0qMhJXhebx2PlAHopbDwbPYJjNyvGse0GYbC9/+Zm30ywIgZ1YsQx52IzTBG8fVFzIhS9xNwJu19gJKTLUoTyK7pi6Nd8Ji5DytC07x/pBkBjJtbex31F/KlstYsf0ZCuW8mOCeprOA3ouUeDaZGEP14xzgKT2wjdJtzFo/9/6c4B042Kn6ItbSqAidvDgno4kmtu2iS/MyR5cBncCuDI9xuAXJgog0GqAT155FIuVBm6tUGkHWR96FZRwcQM+0ZI4jOUYYU5ueAwuNm65W4HmXbUba4E8TlVmQIRA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=prevas.dk; dmarc=pass action=none header.from=prevas.dk;
 dkim=pass header.d=prevas.dk; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=prevas.dk;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JbCehgMxn30bE+5yrRTAxXUxwG549Nl1mbajsU7C678=;
 b=EWXzQYx7tYPUaD/a9U2Uoa+IZIgMv0N2VRYACCceXVTUEhaK+V5I8P3dnXP6Guk6Z0fi7sDTkkSSjhFt2YA2fCZKpXjHu+uWKLrfTe80/IX47yqFh2M1MCa23zD5anMxTv/lRZAr0HlH7SdkWTkQ8Ge4wUic+ESGPjJBNWOwyKw=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=prevas.dk;
Received: from AM0PR10MB1874.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:208:3f::10)
 by AM8PR10MB4084.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:1e3::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3348.16; Fri, 4 Sep
 2020 07:08:16 +0000
Received: from AM0PR10MB1874.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::3cfb:a3e6:dfc0:37ec]) by AM0PR10MB1874.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::3cfb:a3e6:dfc0:37ec%3]) with mapi id 15.20.3326.025; Fri, 4 Sep 2020
 07:08:16 +0000
From: "Rasmus Villemoes" <rasmus.villemoes@prevas.dk>
To: openembedded-core@lists.openembedded.org
CC: Richard Purdie <richard.purdie@linuxfoundation.org>,
	chbs@prevas.dk,
	Rasmus Villemoes <rasmus.villemoes@prevas.dk>
Subject: [PATCH] rootfs-postcommands.bbclass: make /etc/timestamp path configurable
Date: Fri,  4 Sep 2020 09:08:07 +0200
Message-ID: <20200904070807.401-1-rasmus.villemoes@prevas.dk>
X-Mailer: git-send-email 2.23.0
X-ClientProxiedBy: AM4PR0302CA0006.eurprd03.prod.outlook.com
 (2603:10a6:205:2::19) To AM0PR10MB1874.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:208:3f::10)
Return-Path: rasmus.villemoes@prevas.dk
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from prevas-ravi.prevas.se (81.216.59.226) by AM4PR0302CA0006.eurprd03.prod.outlook.com (2603:10a6:205:2::19) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3348.15 via Frontend Transport; Fri, 4 Sep 2020 07:08:16 +0000
X-Mailer: git-send-email 2.23.0
X-Originating-IP: [81.216.59.226]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 8ec3f073-3004-4c94-7941-08d850a14bcc
X-MS-TrafficTypeDiagnostic: AM8PR10MB4084:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<AM8PR10MB40843D09797024271FD6DBBA932D0@AM8PR10MB4084.EURPRD10.PROD.OUTLOOK.COM>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	rCcLVYiJlPIazWJlQ2C1hkrtJMzYHhpxILIN+rHXKB0+AkQ2SQ9B3zG/jOy3p0hAsfdTRej/9mv0IxwJuHDzPyt9ki2OZpOXrQFjTJs/5hwPDp76x0lsWEGTITtSz1O4ATU1x8hr2gjT2Bj3HhtlvmNvfwDjNFd7Ich6z0NDz3GCilgXcNl6+Ue6b+kInC7FDO7yfa3Aco/HNtlTIqGtej1ESoXwqwzMgZPER6vmQ88l8L45L7wAr1OU7jtN32TAsYzmH7wdCbP6T9IEl/r3DDJtfgbAMsMAMJmCzB4D2nbpDMI6LxmpnCkjmjgrL42uj5SA8dXvdHMqdr90IMml+Q==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR10MB1874.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(376002)(136003)(366004)(346002)(39850400004)(396003)(66946007)(52116002)(8676002)(6666004)(83380400001)(44832011)(107886003)(66556008)(36756003)(6486002)(66476007)(54906003)(5660300002)(2616005)(956004)(1076003)(8936002)(6506007)(6916009)(8976002)(2906002)(186003)(26005)(316002)(6512007)(478600001)(86362001)(16526019)(4326008);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData: 
	OgWCXsw10l+swbs6E78pPc/oBnxpiuXA3hBXYdDI3KvbEiUaxnmluflmDlPunkBqDm76O0YguYHS33EDZFzD5zmXSaaN+aN4G2MU0OefJFO8GMcyVT7E3Cg5TBgVhCRf7tUZXAjgGK0lNDyRKG3RmVBK2LTChDtofN4oVmddarJP62lqp4VCVDBkQrBqvDKsUe2NBcXczw4Pm93GHScOpG3gnTwpWLW1wd8LY8SkooFXPcPYcME/8szWoVLdxwg7DfPJ+Nln3cITvurVt0gLUAzffouKzMoWAGx3+sNmmbg4gAKGmAaoeFXW+RTRLKwSVa93UgIN9G20bj53rtDamD8HWcTttYBOJBuIT0MwQxmoxcqSEGvdfOxuSdExWUS4vBYnbHViu4P3rjP1eKotNPLdZ08OXGs2bbqow6uFkQabpTDCFGICZzuy7PfTmhQHwiUdTfCHdMEf9x++1sKgAEuYKcz9MFDCoptnMGfiA/ZLQyxSZJEdNAbal/TMVZFXRuUxjrBKYXki5H3Yp6PoJd7C6vlFncX4wkQ2ddjMmHcfZx7ItEkRTHMLpr0mDTjPts2B9cL/YW9ejhON0SSyKUafz2dRvbTK4BV3+OB/PVFHaYA2eb8ER07nNmlZ67gMnK0PF96uv/3a6eQHmaRYJg==
X-OriginatorOrg: prevas.dk
X-MS-Exchange-CrossTenant-Network-Message-Id: 8ec3f073-3004-4c94-7941-08d850a14bcc
X-MS-Exchange-CrossTenant-AuthSource: AM0PR10MB1874.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Sep 2020 07:08:16.6342
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d350cf71-778d-4780-88f5-071a4cb1ed61
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GnV2BMHABv2doGoos8WL+GlcimlDJFVg09ZezeZVR308wytIem7jtRenCcwOLUBb6rPt0iDv8gZlJK3HGi0ZkB55LMdxDdEuuoP1PtHtKwY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR10MB4084
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain

Not every image necessarily wants a timestamp file, and even if it
does, it's possible to create filesystem images that do not have a
/etc directory or where some other location for the file is more
appropriate. So add a ROOTFS_TIMESTAMP_FILE variable weakly defaulting
to /etc/timestamp - setting that to the empty string opts out of
creating the timestamp file.

I wasn't sure whether to spell /etc as ${sysconfdir}, but chose /etc
to stay completely backwards compatible.

Signed-off-by: Rasmus Villemoes <rasmus.villemoes@prevas.dk>
---
 meta/classes/rootfs-postcommands.bbclass | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/meta/classes/rootfs-postcommands.bbclass b/meta/classes/rootfs=
-postcommands.bbclass
index 984730ebe8..cf54f22566 100644
--- a/meta/classes/rootfs-postcommands.bbclass
+++ b/meta/classes/rootfs-postcommands.bbclass
@@ -12,6 +12,7 @@ ROOTFS_POSTPROCESS_COMMAND +=3D '${@bb.utils.contains_any=
("IMAGE_FEATURES", [ 'deb
 ROOTFS_POSTPROCESS_COMMAND +=3D '${@bb.utils.contains_any("IMAGE_FEATURES"=
, [ 'debug-tweaks', 'post-install-logging' ], "postinst_enable_logging; ", =
"",d)}'
=20
 # Create /etc/timestamp during image construction to give a reasonably san=
e default time setting
+ROOTFS_TIMESTAMP_FILE ??=3D "/etc/timestamp"
 ROOTFS_POSTPROCESS_COMMAND +=3D "rootfs_update_timestamp; "
=20
 # Tweak the mount options for rootfs in /etc/fstab if read-only-rootfs is =
enabled
@@ -275,14 +276,18 @@ python write_image_manifest () {
 # Can be used to create /etc/timestamp during image construction to give a=
 reasonably
 # sane default time setting
 rootfs_update_timestamp () {
+	if [ -z "${ROOTFS_TIMESTAMP_FILE}" ]; then
+		return
+	fi
 	if [ "${REPRODUCIBLE_TIMESTAMP_ROOTFS}" !=3D "" ]; then
 		# Convert UTC into %4Y%2m%2d%2H%2M%2S
 		sformatted=3D`date -u -d @${REPRODUCIBLE_TIMESTAMP_ROOTFS} +%4Y%2m%2d%2H=
%2M%2S`
 	else
 		sformatted=3D`date -u +%4Y%2m%2d%2H%2M%2S`
 	fi
-	echo $sformatted > ${IMAGE_ROOTFS}/etc/timestamp
-	bbnote "rootfs_update_timestamp: set /etc/timestamp to $sformatted"
+	mkdir -p $(dirname ${IMAGE_ROOTFS}${ROOTFS_TIMESTAMP_FILE})
+	echo $sformatted > ${IMAGE_ROOTFS}${ROOTFS_TIMESTAMP_FILE}
+	bbnote "rootfs_update_timestamp: set ${ROOTFS_TIMESTAMP_FILE} to $sformat=
ted"
 }
=20
 # Prevent X from being started
--=20
2.23.0

