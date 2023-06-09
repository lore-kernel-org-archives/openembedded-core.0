Return-Path: <joerg.sommer@navimatix.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8CEA6C7EE2E
	for <webhook@archiver.kernel.org>; Fri,  9 Jun 2023 08:52:17 +0000 (UTC)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (EUR05-VI1-obe.outbound.protection.outlook.com [40.107.21.65])
 by mx.groups.io with SMTP id smtpd.web11.8718.1686300728168327432
 for <openembedded-core@lists.openembedded.org>;
 Fri, 09 Jun 2023 01:52:08 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@navimatix.de header.s=selector1 header.b=uomulFeI;
 spf=pass (domain: navimatix.de, ip: 40.107.21.65, mailfrom: joerg.sommer@navimatix.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=k5Epu1oZNmU26+Q1xrnsybTRteC+Xa83DQx9wPtYmTIsspTviGiBwHzbex4fHfTlcdbIznF1zyGZdBz7WtJh0TITRSwoYYDqZWAChlFLJeb4yrN9o9YSyS3oL4+Pwi8i0WCm5rJ0nzKgjKwVnGXocswYYRPOcxZNilDgQO32IhVF9iiXj/HRQVBAaGfmqcAYVHmoni2OmgkVxgcHWrrdLsKKvGmLDKr3HOqxull5rcS0qktseb6ron1CK7Ww15u33JUBSZPU517a7Lg1CopvWSMxhYS4UL3YJFrowbHf3P/UCcGjEh0H5qyFGnVCv79bt1cVFWJpdVo/jVpLWTX2kg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1r7LBDKusqPGfnHkNoJ5BB3RHHasVIDK3EksDUuMUls=;
 b=D5UsoEUS78Woh3pxk+zA+6WuQ1l5XfFTuWtZVLSd9z3W/GEMj4PHNG9Yj8KnS+sXG5PKdGZZrTQE+pPmmNgotcok52L+5R/n000CbXi3CwFeXfTl+QKUSBAJqQcK8F1HfAyTMEG1xI7uYCjLdA8wQAhoUJqYSeJP7FncQirfT4icUkwGYb7qIui/McqybEill6WejIloMMgrwDumFcJP9tazFiDgNVZzHC9yZah9KZkYbWr0WrILQDh2NXMlJnKYoQPF/Ivfz/SQmWEznuyhA7PdayOKGarYhcUeIHAH25apiS3sp9DtvXNYmAgcYGSklBvwgrq7DIVZMB4/+lWsjQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=navimatix.de; dmarc=pass action=none header.from=navimatix.de;
 dkim=pass header.d=navimatix.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=navimatix.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1r7LBDKusqPGfnHkNoJ5BB3RHHasVIDK3EksDUuMUls=;
 b=uomulFeIBFa5MGV6pwM7XQviwwkBnoZ5g91hL0MOlgxu+CqoVIBPu2OwnqCnZiv6/PU5/UhAmP0kAbh4EjKwCGB/7w63/cjVK5qyOdQwXJSIec21pJhwleVEiOfs/Fn6J+3fcD5sKW4AfuC8tKuy1IIn9gAYMbE5ewY6UrXw9b0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=navimatix.de;
Received: from VI1PR0102MB3136.eurprd01.prod.exchangelabs.com
 (2603:10a6:803:5::26) by AS4PR01MB8896.eurprd01.prod.exchangelabs.com
 (2603:10a6:20b:4e3::5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.33; Fri, 9 Jun
 2023 08:52:05 +0000
Received: from VI1PR0102MB3136.eurprd01.prod.exchangelabs.com
 ([fe80::1549:2f60:3152:7383]) by
 VI1PR0102MB3136.eurprd01.prod.exchangelabs.com
 ([fe80::1549:2f60:3152:7383%6]) with mapi id 15.20.6455.030; Fri, 9 Jun 2023
 08:52:05 +0000
From: =?UTF-8?q?J=C3=B6rg=20Sommer?= <joerg.sommer@navimatix.de>
To: poky@lists.yoctoproject.org,
	openembedded-core@lists.openembedded.org
CC: =?UTF-8?q?J=C3=B6rg=20Sommer?= <joerg.sommer@navimatix.de>
Subject: [PATCH 2/2] runqemu-ifupdown/get-tapdevs: Add support for ip tuntap
Date: Fri,  9 Jun 2023 10:51:06 +0200
Message-ID: <91fca441bb3b2040a2c25ad6d6dc14526c6a6fe0.1686300665.git.joerg.sommer@navimatix.de>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <ee3b417ac5a2acf9c8bd5bbe149794e313bfdaad.1686300665.git.joerg.sommer@navimatix.de>
References: <ee3b417ac5a2acf9c8bd5bbe149794e313bfdaad.1686300665.git.joerg.sommer@navimatix.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: BE1P281CA0371.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:b10:82::22) To VI1PR0102MB3136.eurprd01.prod.exchangelabs.com
 (2603:10a6:803:5::26)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VI1PR0102MB3136:EE_|AS4PR01MB8896:EE_
X-MS-Office365-Filtering-Correlation-Id: 9309ea1c-0f42-4d7c-66d1-08db68c6cd1c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	HSJ9tHZGDx8euzoYrCh753roUSjNui/SUzBNnr7Srei0qhBCmdCKqeU7+7TsKikMEWr10A6h8hXt5l1/fch8cgtEle4zASOAz7qAzS3ICtjHffZrI0tgrH39Ew6iIpQFOM7EhcuJV2HhiuHP4Kk0LKcAPI4dEpVrmwyisUKWYEZKLMUaQibyU2kj2OxEcwljLRhYXOCtgclcYwxXY0bokJrwkVrg2Ma21NMEAqkzxFK+9nghl9yNeflLT7EPJxUYyQaM2gpbK+2k+xJeAVVsja+7MCEugyyna8wIEbIMc+NENr6J+GW87FGhdFx0Y7026+LjEDKU4xsxcjOswjMInzdPpnRxuiOat+BMWdaOWxFDLAY+JXN25g0NvV6H1DRrOzOH+EwZCf5UBo5dqKDuwfM+ujNnLiy8+M7xLg/Lp/0Ugx8jrC6HncV0I3EbpFrgHjgSUlVR/j+QoqMJdpW4Fh3ErQEjjoVNHCVxIGoDVfXX4/W7Qk3jSxBYBofJO3Zo58cPFGJk/PJb66TJeaIJyf8j+HLVEgatZ4N634B+MkfUpUBXZE0Ndlf1d+DBdG9Ow09HAdvY3UTJ4ayIiNR58ofHCY6f51Jo0n/qBh5f0+E=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR0102MB3136.eurprd01.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(396003)(366004)(346002)(376002)(136003)(39840400004)(451199021)(6512007)(6506007)(26005)(186003)(2616005)(966005)(83380400001)(107886003)(52116002)(2906002)(66556008)(66476007)(66946007)(6486002)(5660300002)(8936002)(8676002)(86362001)(38100700002)(36756003)(41300700001)(508600001)(316002)(38350700002)(4326008);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?B8yINB7qT5gUebBPyB7lTD11T5rUkRX5Jx9icDZwzHFvjNpWUngs0Y5F1aK6?=
 =?us-ascii?Q?bgVcpR5k62pWpXM9UX7yqRJZPQ1P4dE5AaQ7fVJ/jKDD5/ylAlBBKgAYZB1P?=
 =?us-ascii?Q?D3HyMaDumTzrdV158Q6uMcTsNUaRs1v/t29JMi8UJAHIiQqWKIGCDN+KX/g9?=
 =?us-ascii?Q?uIQev1/zPAsLqPJoy9OLnlnThyNgknTxR8h3zZiziBIQFYkNBHVJDE2/f+JK?=
 =?us-ascii?Q?1fcNxDs5qKhGACfAIaTZQ822RXOAU4HGu3DrTPzwoKliS8zUJ97m6qIIgtIZ?=
 =?us-ascii?Q?xdzIA7+ZIBj0bHPRBIs87Jq9r5cHskPJhF0mZ5cVD1+d0OUG2jJNYs1TJn+m?=
 =?us-ascii?Q?+GrLnZQFiTrJnNIpp1fxDi62WkxggDJEUpcQLJ7Z1ZQkbkz/woFldpU+BpdG?=
 =?us-ascii?Q?YohRiu/1ibKoi/xcH+urFMbmUbM4aygY/qC+V38vMgRWDgSnMGuV7y1lYvzt?=
 =?us-ascii?Q?JIKzsC4RJEGGQGgK7TzaV02mp3guTjNm5Sm9H3zsB/r5SVMtf8NvDrhCd/sJ?=
 =?us-ascii?Q?wjAArnrqjqZ8qUeIuPRuEQCsBuAu3UCvHhN7Cf8qIggxPDg1+TjxI9e6sfOA?=
 =?us-ascii?Q?4Z/2Tkx6bvHsgLriw52QYHsX3K3Kf1WGlUoT1lTyxyt7ODAsZTE/5Dpd3w8s?=
 =?us-ascii?Q?M71TKtRdLSJeiVREk/wyLmBx0kcxkjR03+c/Qx/9UFOsp2Ky6mo4qgvtCZUu?=
 =?us-ascii?Q?1/sE8eklkY1zkbwNKQaUA5u+154a2H0w8pK42eNIAAx1bK6DvndYb9H9wosr?=
 =?us-ascii?Q?E68lMBoNkzS6lXUcz6IxZxEpQTHbKxgqPXcnAC5YvugVHzPN0o9M6HZtgLTg?=
 =?us-ascii?Q?zk/wR275mYC6tTjRsMjB2I/MPtnpKTV9i4Y9bbH4H044Su1pooJwXfHRgKuE?=
 =?us-ascii?Q?2GBIVSbCcKTq4R7cghT40RJyD5TApUquJTJKDBqAnvpjNJr/A54uFgvqNlfZ?=
 =?us-ascii?Q?nrldm6RPZy/NTz7DY4NeMl1OJqJpS7TvlyQseLMTbAFY1Euqgm78qtNMm3El?=
 =?us-ascii?Q?VUbzQetI+IIfuby8wJal00lKUBOuCCQC9Qjg6pbaIV+NQfD3qJ97AmxkLE/b?=
 =?us-ascii?Q?wKF5Fij8CT93en+JGOpfxHfGC283YyH5wK0r5O1JRw9bZCqZxvyc8p3uQEk1?=
 =?us-ascii?Q?75edzbwDoII7G+5oGMXk77WESC710/W+C/Vvcztk7VeyAYT9j1FQisCxIW+Q?=
 =?us-ascii?Q?ZODAu9p02cuVaXrLPClBLfK3jhP3qJx5/hqpnmsm3ZV8fxmVr7jJhEoPPvdK?=
 =?us-ascii?Q?RZGnIlIxoTRx3KmysjjpPvtEhNjeNdmTANAEg0IrpG+6HfSKOR1RNS7Qoq/h?=
 =?us-ascii?Q?cb7Ru909aTrM3sVt4hIx3R8/hXzMxHA+9RyrHpHpATVq2aXtGb6dA5ILcly3?=
 =?us-ascii?Q?MFLWWSpAAz3xoZJ5ycNhbo+fuPjbU+m48jGqBrF63FeE8PwO1vrh5CUp8x3b?=
 =?us-ascii?Q?Q6rShtmWGzucaTQVVZOcAt6s3OjIJqEOqcdjNeRehGjqZQJfVVoWIBJrdwTQ?=
 =?us-ascii?Q?7OZLO3WKvSYPD9LKa9+SrhbqkMZt++jxlhkBqYQPqDhALPGc+Qg+pitMjdsv?=
 =?us-ascii?Q?qVvVwmIibaBdJGs8gAca6Yw02r8fTgtQUV8+eQqD33Tejcf20EzvMZHKSDpn?=
 =?us-ascii?Q?UQ=3D=3D?=
X-OriginatorOrg: navimatix.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 9309ea1c-0f42-4d7c-66d1-08db68c6cd1c
X-MS-Exchange-CrossTenant-AuthSource: VI1PR0102MB3136.eurprd01.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jun 2023 08:52:05.7994
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: c87b4f54-b992-4813-8f3f-4a876324197f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Y6Kj5EeDXTSBJR3Lha1Fsuibut8b+N41TIzPI05v9T1ICOTZ0LDPdmUPPgHBngOIRP+peGRTzCFHAANlN3GdWjBvaF9shNqjEekEJLE+uW4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4PR01MB8896
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 09 Jun 2023 08:52:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/182547

The *ip* command supports the creation and destruction of TAP devices since
2009 and might be more likely installed on systems then *tunctl*. Therefore
it should be tried to setup or teardown the TAP interface with *ip* before
falling back to *tunctl*.

https://git.kernel.org/pub/scm/network/iproute2/iproute2.git/commit/?id=3D5=
80fbd88f75cc9eea0d28a48c025b090eb9419a7

Signed-off-by: J=C3=B6rg Sommer <joerg.sommer@navimatix.de>
---
 scripts/runqemu-gen-tapdevs | 26 +++++++++++++++++---------
 scripts/runqemu-ifdown      | 14 ++++++++------
 scripts/runqemu-ifup        | 31 +++++++++++++++++++------------
 3 files changed, 44 insertions(+), 27 deletions(-)

diff --git a/scripts/runqemu-gen-tapdevs b/scripts/runqemu-gen-tapdevs
index f2d6cc39c2..ffb82adce6 100755
--- a/scripts/runqemu-gen-tapdevs
+++ b/scripts/runqemu-gen-tapdevs
@@ -50,12 +50,6 @@ if ! [ $COUNT -ge 0 ]; then
 	exit 1
 fi
=20
-TUNCTL=3D$STAGING_BINDIR_NATIVE/tunctl
-if [[ ! -x "$TUNCTL" || -d "$TUNCTL" ]]; then
-	echo "Error: $TUNCTL is not an executable"
-	usage
-fi
-
 if [ $EUID -ne 0 ]; then
 	echo "Error: This script must be run with root privileges"
 	exit
@@ -68,15 +62,29 @@ if [ ! -x "$RUNQEMU_IFUP" ]; then
 	exit 1
 fi
=20
-if ! interfaces=3D`ip link` 2>/dev/null; then
+TUNCTL=3D$STAGING_BINDIR_NATIVE/tunctl
+ip_supports_tuntap=3Dfalse
+if interfaces=3D`ip tuntap list` 2>/dev/null; then
+	ip_supports_tuntap=3Dtrue
+	interfaces=3D`echo "$interfaces |cut -f1 -d:`
+elif [[ ! -x "$TUNCTL" || -d "$TUNCTL" ]]; then
+	echo "Error: $TUNCTL is not an executable"
+	usage
+elif interfaces=3D`ip link` 2>/dev/null; then
+	interfaces=3D`echo "$interfaces" | sed '/^[0-9]\+: \(docker[0-9]\+\):.*/!=
d; s//\1/'`
+else
 	echo "Failed to call 'ip link'" >&2
 	exit 1
 fi
=20
 # Ensure we start with a clean slate
-for tap in `echo "$interfaces" | sed '/^[0-9]\+: \(docker[0-9]\+\):.*/!d; =
s//\1/'`; do
+for tap in $interfaces; do
 	echo "Note: Destroying pre-existing tap interface $tap..."
-	$TUNCTL -d $tap
+	if $ip_supports_tuntap; then
+		ip tuntap del $tap mode tap
+	else
+		$TUNCTL -d $tap
+	fi
 done
 rm -f /etc/runqemu-nosudo
=20
diff --git a/scripts/runqemu-ifdown b/scripts/runqemu-ifdown
index e0eb5344c6..f72166b32b 100755
--- a/scripts/runqemu-ifdown
+++ b/scripts/runqemu-ifdown
@@ -33,13 +33,15 @@ fi
 TAP=3D$1
 STAGING_BINDIR_NATIVE=3D$2
=20
-TUNCTL=3D$STAGING_BINDIR_NATIVE/tunctl
-if [ ! -e "$TUNCTL" ]; then
-	echo "Error: Unable to find tunctl binary in '$STAGING_BINDIR_NATIVE', pl=
ease bitbake qemu-helper-native"
-	exit 1
-fi
+if !ip tuntap del $TAP mode tap 2>/dev/null; then
+	TUNCTL=3D$STAGING_BINDIR_NATIVE/tunctl
+	if [ ! -e "$TUNCTL" ]; then
+		echo "Error: Unable to find tunctl binary in '$STAGING_BINDIR_NATIVE', p=
lease bitbake qemu-helper-native"
+		exit 1
+	fi
=20
-$TUNCTL -d $TAP
+	$TUNCTL -d $TAP
+fi
=20
 IFCONFIG=3D`which ip 2> /dev/null`
 if [ "x$IFCONFIG" =3D "x" ]; then
diff --git a/scripts/runqemu-ifup b/scripts/runqemu-ifup
index bb661740c5..5fdcddeeda 100755
--- a/scripts/runqemu-ifup
+++ b/scripts/runqemu-ifup
@@ -41,22 +41,29 @@ USERID=3D"-u $1"
 GROUP=3D"-g $2"
 STAGING_BINDIR_NATIVE=3D$3
=20
-TUNCTL=3D$STAGING_BINDIR_NATIVE/tunctl
-if [ ! -x "$TUNCTL" ]; then
-       echo "Error: Unable to find tunctl binary in '$STAGING_BINDIR_NATIV=
E', please bitbake qemu-helper-native"
-	exit 1
+if taps=3D$(ip tuntap list 2>/dev/null); then
+	tap_no=3D$(( $(echo "$taps" |sort -r |sed 's/^tap//; s/:.*//; q') + 1 ))
+	ip tuntap add tap$tap_no mode tap group $2 && TAP=3Dtap$tap_no
 fi
=20
-TAP=3D`$TUNCTL -b $GROUP 2>&1`
-STATUS=3D$?
-if [ $STATUS -ne 0 ]; then
-# If tunctl -g fails, try using tunctl -u, for older host kernels=20
-# which do not support the TUNSETGROUP ioctl
-	TAP=3D`$TUNCTL -b $USERID 2>&1`
+if [ -z $TAP ]; then
+	TUNCTL=3D$STAGING_BINDIR_NATIVE/tunctl
+	if [ ! -x "$TUNCTL" ]; then
+		echo "Error: Unable to find tunctl binary in '$STAGING_BINDIR_NATIVE', p=
lease bitbake qemu-helper-native"
+		exit 1
+	fi
+
+	TAP=3D`$TUNCTL -b $GROUP 2>&1`
 	STATUS=3D$?
 	if [ $STATUS -ne 0 ]; then
-		echo "tunctl failed:"
-		exit 1
+	# If tunctl -g fails, try using tunctl -u, for older host kernels
+	# which do not support the TUNSETGROUP ioctl
+		TAP=3D`$TUNCTL -b $USERID 2>&1`
+		STATUS=3D$?
+		if [ $STATUS -ne 0 ]; then
+			echo "tunctl failed:"
+			exit 1
+		fi
 	fi
 fi
=20
--=20
2.34.1


