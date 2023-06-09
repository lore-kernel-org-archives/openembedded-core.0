Return-Path: <joerg.sommer@navimatix.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B5E90C7EE37
	for <webhook@archiver.kernel.org>; Fri,  9 Jun 2023 08:52:07 +0000 (UTC)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (EUR05-VI1-obe.outbound.protection.outlook.com [40.107.21.85])
 by mx.groups.io with SMTP id smtpd.web11.8717.1686300725523273990
 for <openembedded-core@lists.openembedded.org>;
 Fri, 09 Jun 2023 01:52:05 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@navimatix.de header.s=selector1 header.b=3R5Ot6Dl;
 spf=pass (domain: navimatix.de, ip: 40.107.21.85, mailfrom: joerg.sommer@navimatix.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Canic2dIgyATiShF4pUQgCSbdPmMd3gnrdW0snQsf+KF9JZT5ri4IwHnwh/DpTsKONMVxOQUIT2CWeD7VV99/Y0KL7mAnRvLNaHmvVbzEkETTfMlfRiT56IoAd17gGbZTQIEOSYyqMHeRzvmZWr8APzHWfBjsjYMMJq9HkF7Lvp0/zWuvC4eqMC0dO8u2YZh75mOPwWPsaR+2yz4/dYZlo3TGmUADQX5i+n7r4KEGmZKb6piU22K7vKlCgKMZSj1Hi+MXVbAw4kj/PJcZDl1jJo7nzS8gC+tspsMM8a2tZIV9NLiFsm/NSF8Ddbuk04I7MRd135Tmvozr7wZTqCpKw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9J0HCBGWqcusv/9ocdqeHCGo48okc5BaqQYSb1QB/uc=;
 b=QWDyZb0S3fQcLCp58IBKFuABe8NXMAUGoKAKsvuPGjOEJVhxHYCRbnG3N87GRNfjUyFcfoKt5q/KJGOSeduQfMQmx+dYILXY7F3v5j4Ptmu+pn8AGGvUvJMByPXU1psTqwHG8Lkv1lTuTqxRnmif1g/CFrPXtnhYFcI5KR2QXZBRYqq1ESueYnvE+UJgVDd2Ttwp6h/CBtxvc4IxMVX51XeMFvVZINzhXwzevcbjhAsU9ieK61YI9FAgrYieppdvi+u7nF1Jw5KggBW3EJUYH1ltwoYAbDopwhxj1d86hi+QisyEIBZVWv8LrQ2atyEJYcOTl+8bn6tFwBhkMby6YA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=navimatix.de; dmarc=pass action=none header.from=navimatix.de;
 dkim=pass header.d=navimatix.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=navimatix.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9J0HCBGWqcusv/9ocdqeHCGo48okc5BaqQYSb1QB/uc=;
 b=3R5Ot6Dl03sT+TmehsEh26rXpxZm1n+YjwdERGtGAqa7br75BGmWODwiLSXK80IQthjFn2yJ+dxGHoG7VoRJxlij6AytwS59LyabvhRSmdiHjrrLFmV+4zivJKwXXxHGRcQH7S3Lo7I/Ui3RJXTE6iCD8BUoiVazy+wsD/3FNbY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=navimatix.de;
Received: from VI1PR0102MB3136.eurprd01.prod.exchangelabs.com
 (2603:10a6:803:5::26) by AS4PR01MB8896.eurprd01.prod.exchangelabs.com
 (2603:10a6:20b:4e3::5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.33; Fri, 9 Jun
 2023 08:52:00 +0000
Received: from VI1PR0102MB3136.eurprd01.prod.exchangelabs.com
 ([fe80::1549:2f60:3152:7383]) by
 VI1PR0102MB3136.eurprd01.prod.exchangelabs.com
 ([fe80::1549:2f60:3152:7383%6]) with mapi id 15.20.6455.030; Fri, 9 Jun 2023
 08:51:59 +0000
From: =?UTF-8?q?J=C3=B6rg=20Sommer?= <joerg.sommer@navimatix.de>
To: poky@lists.yoctoproject.org,
	openembedded-core@lists.openembedded.org
CC: =?UTF-8?q?J=C3=B6rg=20Sommer?= <joerg.sommer@navimatix.de>
Subject: [PATCH 1/2] runqemu-gen-tapdevs: Refactoring
Date: Fri,  9 Jun 2023 10:51:05 +0200
Message-ID: <ee3b417ac5a2acf9c8bd5bbe149794e313bfdaad.1686300665.git.joerg.sommer@navimatix.de>
X-Mailer: git-send-email 2.34.1
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: BE1P281CA0371.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:b10:82::22) To VI1PR0102MB3136.eurprd01.prod.exchangelabs.com
 (2603:10a6:803:5::26)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VI1PR0102MB3136:EE_|AS4PR01MB8896:EE_
X-MS-Office365-Filtering-Correlation-Id: 16a17488-66ef-451f-c7ba-08db68c6c981
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	klC3GxHSFndRZE55bAxg27oeqPxl9MhjsTQIJhIA0APTQHkb/ReVM85pkyuu7N+v7kIIVQH85BwPtFoPSzD0VK9vZgxrsMlo5D+A7q340Ii1syTjlWWb02x/t8mpap0dFYzn8hagWF3CnzgJ4w7jebpSp/+aMOu3UmUfzLkuzCJoT3dlMo/4QtARvtRkEvBm7PCDMfYCJLOoXqTaGA30kILOIcsrKSe+J67ntJXQCo25knDupjR8hqRGzWWRufogmQ/O+5wDMnf/MbiWBoBEqZvT46KsPqsWi01RgQdlSPMBuETBuf0GPplSPFjb06Tys7VfsBemzJxAB+QV0HlOChy1gA15IimcnleAzHBl5EN8wNTkdYiV4W8pKIQB2GXF6AowhrA8oYhUR/0I4EQJUiGpwUOapxDYriGA22QVlRPyhZ2L+G3cV4hLjY5CsXvZB4rTb5pfkr734yrbM5o0JvJF+1uZGzyPYtwNlP+A1prP5IzqiSLxTZikBtySwis6lu/wgMppwBlW5JdmbCkrB11LSuwEW1pF0VruEUfiU6V1k4GDH8DvS15mNyvHRsReieaLiZzRO1+VJHj6q9ikvIQObn1IJW1BRRIzBno8pq+/HEMSV7oYRF3V7qcs6kO6
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR0102MB3136.eurprd01.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(396003)(366004)(346002)(376002)(136003)(39840400004)(451199021)(6512007)(6506007)(26005)(186003)(2616005)(83380400001)(107886003)(6666004)(52116002)(2906002)(66556008)(66476007)(66946007)(6486002)(5660300002)(8936002)(8676002)(86362001)(38100700002)(36756003)(41300700001)(508600001)(316002)(38350700002)(4326008);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?n5Dlzg4wKmiIuO/r48CRTJDR0OerdA/cUvuE4HeKxgIjpeoBUH9f7xqAOWA6?=
 =?us-ascii?Q?TKS9ex2IHxGk9Pfb4H0i8d5Q94Xq1JzZpM4VzFb8k64LYI/illz+qDO5sY5s?=
 =?us-ascii?Q?kZuzn7nukR/rWMNiT0lW1aMbzHn135/TRPyES4xgTXB84KgnwXBN7NOeyqa8?=
 =?us-ascii?Q?IiJ/qm6h8+7yZfMHdfHxgIW6lMfWxz1dHN1N5XlHsWKn07y/ihFCjJ7gzhvF?=
 =?us-ascii?Q?y3oCfxVbHUIlVMgltNfLBT079zHPw19JebPpy5YvFb0hlRSQA7nADgDfPlA8?=
 =?us-ascii?Q?Y6qE7z4P5ql/YGBM8fVPNKC6vTUpJmtGLTN5u8ymTek9CaV091qFX/6z1Qj8?=
 =?us-ascii?Q?LPv9xtjc1gIw+hvsugp2mAv6G3laLPeLFTrdJWcnY3duWFLl/zqvoqXoqlGw?=
 =?us-ascii?Q?mlcD5rDH7d4KXOVGijwSp2sBb+zCpyneire2QDhmklCYte8Zf6QZL+Ff0FwH?=
 =?us-ascii?Q?Vtv0v1ZdrV8fqBAJH7ydl/ID/1B8iSm+REzf4QIWOnugwUUVqQUXoO5ahJcH?=
 =?us-ascii?Q?yhw25bIbFNfJPLAjQS4f5L92nk0iQsmd991Nh2pC8TgTMpRl/f/diK2Ie5hv?=
 =?us-ascii?Q?8swacvp/jnKixb44rftGqwc6RWzuWA24sRgDutXA3PdQtDM/YRngZ9YRSLJ/?=
 =?us-ascii?Q?rR3Rl7/2zSX4kujdLATzjiLft43tePzzNQ/KtpeB8jxVFUpJJNZChltWhOWp?=
 =?us-ascii?Q?BhZMmTorbX38xQc2LuqepvGXTVXxqGFdFY5oxRnI4j1aMmNOJaiIdJL86oEG?=
 =?us-ascii?Q?9q8uWO9jA07sEkSyDMViqM/A22/xg5/UrLNZ2LdHr7yNFL1+zadsRe3AaBOm?=
 =?us-ascii?Q?ZZ8ZPXE/+4XJeCJRhjyo74Q3U92XNtKNKVdhFho8Akrj38Lk23cF0Nejt58D?=
 =?us-ascii?Q?L5W87oSCIHrnBd97tH6YDTozF1fVpme2dtEjw0FquM2s2qqXWIvV8HU2Tj/R?=
 =?us-ascii?Q?KpwGpFSalH272Wco+W5uvt1isBauHSax2idxDtMKQta/J1HXvS8n04GbDExC?=
 =?us-ascii?Q?VX2p5kb3l4dOZHP470QPidV4bUFQSZu9lOvBG+eZ3dIQQ25tiEl9jMKlf9sJ?=
 =?us-ascii?Q?CSVtxIo5Ea69BCpjODCu4c/WYbo9NPNvi9DWNxkTohAj6nKSCgaYC7CzoGTS?=
 =?us-ascii?Q?oBDWApd34sjvKzgSZnCw6La4GXAnbrHJaLmbmHvzcQYsyxO5bk5L+wghTC86?=
 =?us-ascii?Q?XvTuxKpQ8ey7aTb25/NzlMh6jO3n2Zn00xS+lJcsvM5M6lOYYvh70dFU/9fC?=
 =?us-ascii?Q?4h/2JXN9nG7AXCFjVcrQN3DReCXRWdgS0sEGEpSF86HITTGMkWY+u2fJRld/?=
 =?us-ascii?Q?dD1sY3RjdeK+lwcGwfBTSZCQi1JTA+utOyT5pyTYiB+VxjBPo0hT+3CcoeLT?=
 =?us-ascii?Q?pW09Wj672oxsVS4uVS6q6D/wBwUiu7udRYjTOiAeDtEHPMzU6RGhiRyo6hTN?=
 =?us-ascii?Q?sUVaNaCV2j8GjwyEZMMq1OIjOQRvncleHeQBk535nzMdJtp4my0B7lXE01+W?=
 =?us-ascii?Q?ML4eIOmoh/fvu4LXYYZE0LBDI+WRtl0AhzfXtO2TSd0scPQIXrfxrwH7KFK5?=
 =?us-ascii?Q?rVaTlV00UcuHHokZWTAED8yRzITgQuxtWbmPYd8QNJe6unC++xfPJJEc3txe?=
 =?us-ascii?Q?qg=3D=3D?=
X-OriginatorOrg: navimatix.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 16a17488-66ef-451f-c7ba-08db68c6c981
X-MS-Exchange-CrossTenant-AuthSource: VI1PR0102MB3136.eurprd01.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jun 2023 08:51:59.7765
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: c87b4f54-b992-4813-8f3f-4a876324197f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZTJsRoppx+VaGHLQzcHbdFmgO8IBYov5d1mRiqBCkvv1BwmGR7AVrhgYpxwAXhQIahKdB928WxN5kgVHp1+AmSSG8w9XHqrcm7nBfkEvjjg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4PR01MB8896
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 09 Jun 2023 08:52:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/182546

The changes are mostly about early exit which causes indentation changes;
check with `git diff -w`. Another change is the check for ip by simply
calling it and deciding upon the exit code, if it's fine or not.

Signed-off-by: J=C3=B6rg Sommer <joerg.sommer@navimatix.de>
---
 scripts/runqemu-gen-tapdevs | 77 ++++++++++++++++++-------------------
 1 file changed, 37 insertions(+), 40 deletions(-)

diff --git a/scripts/runqemu-gen-tapdevs b/scripts/runqemu-gen-tapdevs
index a6ee4517da..f2d6cc39c2 100755
--- a/scripts/runqemu-gen-tapdevs
+++ b/scripts/runqemu-gen-tapdevs
@@ -44,6 +44,12 @@ GID=3D$2
 COUNT=3D$3
 STAGING_BINDIR_NATIVE=3D$4
=20
+# check if COUNT is a number and >=3D 0
+if ! [ $COUNT -ge 0 ]; then
+	echo "Error: Incorrect count: $COUNT"
+	exit 1
+fi
+
 TUNCTL=3D$STAGING_BINDIR_NATIVE/tunctl
 if [[ ! -x "$TUNCTL" || -d "$TUNCTL" ]]; then
 	echo "Error: $TUNCTL is not an executable"
@@ -62,48 +68,39 @@ if [ ! -x "$RUNQEMU_IFUP" ]; then
 	exit 1
 fi
=20
-IFCONFIG=3D`which ip 2> /dev/null`
-if [ -z "$IFCONFIG" ]; then
-	# Is it ever anywhere else?
-	IFCONFIG=3D/sbin/ip
-fi
-if [ ! -x "$IFCONFIG" ]; then
-       echo "$IFCONFIG cannot be executed"
-       exit 1
-fi
-
-if [ $COUNT -ge 0 ]; then
-	# Ensure we start with a clean slate
-	for tap in `$IFCONFIG link | grep tap | awk '{ print \$2 }' | sed s/://`;=
 do
-		echo "Note: Destroying pre-existing tap interface $tap..."
-		$TUNCTL -d $tap
-	done
-	rm -f /etc/runqemu-nosudo
-else
-	echo "Error: Incorrect count: $COUNT"
+if ! interfaces=3D`ip link` 2>/dev/null; then
+	echo "Failed to call 'ip link'" >&2
 	exit 1
 fi
=20
-if [ $COUNT -gt 0 ]; then
-	echo "Creating $COUNT tap devices for UID: $TUID GID: $GID..."
-	for ((index=3D0; index < $COUNT; index++)); do
-		echo "Creating tap$index"
-		ifup=3D`$RUNQEMU_IFUP $TUID $GID $STAGING_BINDIR_NATIVE 2>&1`
-		if [ $? -ne 0 ]; then
-			echo "Error running tunctl: $ifup"
-			exit 1
-		fi
-	done
+# Ensure we start with a clean slate
+for tap in `echo "$interfaces" | sed '/^[0-9]\+: \(docker[0-9]\+\):.*/!d; =
s//\1/'`; do
+	echo "Note: Destroying pre-existing tap interface $tap..."
+	$TUNCTL -d $tap
+done
+rm -f /etc/runqemu-nosudo
=20
-	echo "Note: For systems running NetworkManager, it's recommended"
-	echo "Note: that the tap devices be set as unmanaged in the"
-	echo "Note: NetworkManager.conf file. Add the following lines to"
-	echo "Note: /etc/NetworkManager/NetworkManager.conf"
-	echo "[keyfile]"
-	echo "unmanaged-devices=3Dinterface-name:tap*"
-
-	# The runqemu script will check for this file, and if it exists,
-	# will use the existing bank of tap devices without creating
-	# additional ones via sudo.
-	touch /etc/runqemu-nosudo
+if [ $COUNT -eq 0 ]; then
+	exit 0
 fi
+
+echo "Creating $COUNT tap devices for UID: $TUID GID: $GID..."
+for ((index=3D0; index < $COUNT; index++)); do
+	echo "Creating tap$index"
+	if ! ifup=3D`$RUNQEMU_IFUP $TUID $GID $STAGING_BINDIR_NATIVE 2>&1`; then
+		echo "Error running tunctl: $ifup"
+		exit 1
+	fi
+done
+
+echo "Note: For systems running NetworkManager, it's recommended"
+echo "Note: that the tap devices be set as unmanaged in the"
+echo "Note: NetworkManager.conf file. Add the following lines to"
+echo "Note: /etc/NetworkManager/NetworkManager.conf"
+echo "[keyfile]"
+echo "unmanaged-devices=3Dinterface-name:tap*"
+
+# The runqemu script will check for this file, and if it exists,
+# will use the existing bank of tap devices without creating
+# additional ones via sudo.
+touch /etc/runqemu-nosudo
--=20
2.34.1


