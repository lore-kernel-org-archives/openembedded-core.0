Received: from AM0PR83CU005.outbound.protection.outlook.com (AM0PR83CU005.outbound.protection.outlook.com [52.101.69.75])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.14198.1795778406765604417
 for <openembedded-core@lists.openembedded.org>;
 Fri, 27 Nov 2026 03:20:08 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@vaisala.com header.s=selector1 header.b=Rlt6j7Sb;
 spf=permerror, err=parse error for token &{10 18 spf.protection.outlook.com}: limit exceeded (domain: vaisala.com, ip: 52.101.69.75, mailfrom: niko.mauno@vaisala.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aigXwCNE8kFI3hYEPzKKxzsA0t6pUQm0Z2o8FeYxK61TwuCkqm2aUaZtRu4K6xylUNAlCUUT+4cxq34G18dt5CTDzdPhvzthcwlYG/3OAH/FmF5ytxmZ6cbJhtlZQ5AW3+qvHi38nuYAGOWtAomZxBAU/coPcox1hMxos8RdN3Vncm7KKsuCLmbwoEmH3JlzrrGeZ34K78DIl3UvjqRmJDDDKkEwhJsK4X5yHr4ko1JtHHesPUH2BC0M8+L8b/A7rNzGDdWiPA5yMCXi0+1A4qdo9UFWf9u8gwSa10mkEU6QVqCQe/2teeTF6H/MUxpAGKc5cxN6m7UXKV+ttYd8Jw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OBqyxpK02DapIStzFvm3IzjoCx3hTTKtzXemkMydPNs=;
 b=c8faLwj+JWvsoeacN7khVfRFELvNlEgq48abHUW94mQ8WFL28Khg4S0lBMnYkgBFGJeMUapatraMt3Zdsz8hRsfJ1821J9FMwc1exLvHHCst5U7ShB30tCW+zoG9PwYn7IuAjiAo1OyJwFGWPBg3tMCztia6PBe6QUccctueYNC7UxPjBPQt1aKoR7CjlD9bdFnUzehhYGQIy484EmStRnf9lUXbOZdpEO50j8gZp086ofTrl81LzZVpyjnvZvUxMgdaIMIc93erHgAqHBHbUhDIiJjr7T5NXsYk5lg5im6zwXno8UOqaMRGTWTjECwA1XttDrkGRAVWMvK3ursG0A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vaisala.com; dmarc=pass action=none header.from=vaisala.com;
 dkim=pass header.d=vaisala.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vaisala.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OBqyxpK02DapIStzFvm3IzjoCx3hTTKtzXemkMydPNs=;
 b=Rlt6j7SbUk+WGU51/hWkPU+zqWJHGF4c9r0eoXw0Ek37/3T+wMByHzZglZ8pR82ujJyn+XzOJ1ek/tQqTOT/8r/Owec67s6Ab7NN9ZBthvRXrzWS9OZ8DghLQpclp5/opI4Rry77F7rz2VM6CgjLdJYBKyojd09twLPslrNfZYU/cFd1eVMoKupwIz5/AEQGi1H0lqAuhsfzgvqtwR6q+2JuIhWPao9j5bYamBFHBXXxV7D2mDydjjfQpxsf3OlZ/+CiXc7XU/gyJ5OUnmAJyW23Geq6G0kGgzfl/ldLPXxGTkFlPafJZ6U11PAHqhy/pUwv0MxCT3PtW5huerJ7EQ==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vaisala.com;
Received: from GVXPR06MB9766.eurprd06.prod.outlook.com (2603:10a6:150:1dc::17)
 by VI0PR06MB9086.eurprd06.prod.outlook.com (2603:10a6:800:23d::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.662.9; Fri, 27 Nov
 2026 11:19:59 +0000
Received: from GVXPR06MB9766.eurprd06.prod.outlook.com
 ([fe80::485c:86c9:bd8:53bc]) by GVXPR06MB9766.eurprd06.prod.outlook.com
 ([fe80::485c:86c9:bd8:53bc%6]) with mapi id 15.21.0662.004; Fri, 27 Nov 2026
 11:19:58 +0000
From: Niko Mauno <niko.mauno@vaisala.com>
To: openembedded-core@lists.openembedded.org
CC: ross.burton@arm.com,
	paul@pbarker.dev,
	Niko Mauno <niko.mauno@vaisala.com>
Subject: [PATCH v2] systemd-serialgetty: Fix console baud rates
Date: Fri, 27 Nov 2026 13:19:44 +0200
Message-ID: <20261127111944.23759-1-niko.mauno@vaisala.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <DN58KHZSPJW5.37L7ERKRY60B1@pbarker.dev>
References: <DN58KHZSPJW5.37L7ERKRY60B1@pbarker.dev>
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: GV3P280CA0082.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:150:a::10) To GVXPR06MB9766.eurprd06.prod.outlook.com
 (2603:10a6:150:1dc::17)
Return-Path: niko.mauno@vaisala.com
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GVXPR06MB9766:EE_|VI0PR06MB9086:EE_
X-MS-Office365-Filtering-Correlation-Id: 3ce63b05-3d43-4388-8309-08df4c785ecd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|52116014|23010399003|38350700014|10067099003|56012099006|261026121527099003|261026140227099003|261028144727099003|261022105027099003|261022075727099003|261021123027099003|261021121427099003|261102123227099003|261022115727099003|261009223027099003|22082099003|18002099003|11063799006|5023799004;
X-Microsoft-Antispam-Message-Info: +zueHLTuuCfMdIvEyXIaX+svzXxCTA+7w/65PqRGdI/gLJ00vOB9+gIuZxrI3Um5pLiL65AwQloksK9E4N+HbTDv0ak4mbk0H98y3vzaOpnfzTS7y/vVTPQ+KvuDGo1F7VnVEc5k07gR+GrlHhvpxSX9WD6+LxLQGuv+YRH8ZusK8pvP8RXczKOFZMBuLpaU7VNNH+8UUnAnb70u2v5luabHHbPhwTN2XaB/L9UM5rs5Em9QXaUBNxCGle9H4ToYOxsAqwUnusQLjv0eoVoAY23P6oNw2SLkDd0EzeW1rrlohufOGOwWbfi4mpPZ+lK1B623HfM97sTPDOJ62R0Asqn/ZW4MEfx1sIAA//1YvPbNbhygZih8HIvIdDneGPiQy+qOmv2W4FUDBaXRvUF+JbgjY4E5OQkeGtS3L3xjsYAgHwAHOrUrYCzlfPeZwsie/uECzIKzL/LqMTwvtpPKzk7fnisBRiiHCNoXgw0LxY5VdZlV3Gs0zSUAxK4WZX9zp6UWt9DMG3FDMAs2UfFuUiNvmC2d7q49ZSUmqiWcYm/GhSSAjotfJZvY8HifxagN0LWBZHS1LikoZqIDjXNExxzT6JBq1VS8PDPrN6fAgdwmStCp3NKBUIQg3+SgePVM3lAL+oQxrs4s2XeKtvYyzgOjMMDQH4CHsucHShBGp9sS/K7Fb2X19Mz+uoZ+FJWJUuH7+1IF5swIjfCCQlgTNTECjS8xbfATsjcCet++zIg=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GVXPR06MB9766.eurprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(52116014)(23010399003)(38350700014)(10067099003)(56012099006)(261026121527099003)(261026140227099003)(261028144727099003)(261022105027099003)(261022075727099003)(261021123027099003)(261021121427099003)(261102123227099003)(261022115727099003)(261009223027099003)(22082099003)(18002099003)(11063799006)(5023799004);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?9lFbIRkIe7HNqbwsRTu5tmAySQp9qHef0ehNJN4WW1OxsjPAbarnTWQHDPKu?=
 =?us-ascii?Q?uR27QZ1WESeSZOs8OG2IIkvPJNAjIFD1yK7Pni8HAe+tEWUgL3dJdnvJ4KT2?=
 =?us-ascii?Q?NSpU6jUu/0+iZFep+HOvU1CWCZPx9luQWzl6kjPcHt2qu7S0T0BIu6gUQJrE?=
 =?us-ascii?Q?Qetnu4HEPz5tkb2f6z7BqITI74Agf8Iy0BsxeCAJKp/YxVgU8kU1BWbR0k2q?=
 =?us-ascii?Q?Bm7GNG1qNFwiwNKiEbPfoBaXG4X5rE80PQ9lTvi24oV2SCo1xoZ6GrYF+viA?=
 =?us-ascii?Q?AyOQFAJzVDf9l17ot73FkSDqNGB8ICiJ0lmKqrmJTXO3ti96P7RG2QZh29CG?=
 =?us-ascii?Q?Rv/ZZ/hYE3h1eegp7U/e+Wivyn8ukyvxwbs27le7FtNis7Ie1dpuxkgLlO/W?=
 =?us-ascii?Q?zTsNfm/eaQJxcwsRXMPLll1Vg4tQFJMaCB+tUY5NH4y8Wz90r/U0pm2R1eP4?=
 =?us-ascii?Q?+ve/QzoDbSedi2gGUYf88izm2AQFO8LzN/CwHnMk6JQG9Ht3yd2uBivVWarq?=
 =?us-ascii?Q?FeyeEtaLTxJrnEc+1z50VgfjUUmBKHm0GPoogb30zVux0TG9n9/zKr+gS4Rh?=
 =?us-ascii?Q?VzlqhOsxp8CIh2GSERcqFHWJtt1Eres/oFIhKVhvAD9m7jESRSj0QlAXj/98?=
 =?us-ascii?Q?Rg4+Xwy5y8gRmVh+HjhaAh7Tap32UkrlMWQyK7HFUyrB7drIesWtw3FvBdMc?=
 =?us-ascii?Q?Xvglr1/cmOe52is08nKGN3WTj9ijWJqB0ipCfJMMo6X3PvCAiKzAuASjovuq?=
 =?us-ascii?Q?vF/Smo83tER6UF8UjfO9MW64Xb1kI8Mg3/0xMzM1iyOnq7ewFFsnYYWrF5f4?=
 =?us-ascii?Q?+ge7/E2IZVEmWRmfHlXPNa1mK05dkhWfWB0QBY4zv2rvQUUW6SVRhjQTUn5N?=
 =?us-ascii?Q?zENeenT7lwt4PFSmI+DEC54MhZh1v5/RFusrz5VBcLPaJ/zJaShIXR3OPS8N?=
 =?us-ascii?Q?RImK6e57C4YWZ9rzjXB8X1vnQgXxFXujZeoHd9IKCHj04CtiQ/UIYvkemEyv?=
 =?us-ascii?Q?dKwN3lHWcRWbEWYYP7fJfZjb4g64sS9Zeqmzop1dvB8AaKMt3XOk7rZAbs5k?=
 =?us-ascii?Q?bH5WbEq7sxUs2IqRuRTAzx7zcI1frPOCX0E5NGzWrRKVHPmS5PrpNg0w7X5G?=
 =?us-ascii?Q?zGsGd5PxEXiu9sXwUGlK79SQh6W5ShKVWpXcatQiwzw2OITb/hoVkRgCP1Y6?=
 =?us-ascii?Q?klkhnqDN/gJa45L4gQz0LdeQIyn4Jy/FkKDHnzWeE1W09cBLuRhbiDqKThFh?=
 =?us-ascii?Q?yeUtOGpq/CATSzUog1wVn5B/bnGvS9q0IvaZcJL4AqVAC4dvGPc/+u/oqq22?=
 =?us-ascii?Q?stOWa+tWUtzj+WfjFStG7bopxl6tmc7J5zmyQ1hg9nJCnRcOyRvHm9ngC4Fb?=
 =?us-ascii?Q?3YejjdbIFQ98bt13Sm6oFFX6gN5FDFsSklcuJsaz4agHR4J5SaAO7TwmANBC?=
 =?us-ascii?Q?xilFTJTdYMxwvC1jfvWyoaHNms75qsjY1Ue+OK+kV5kpVGIk6GP+oby5B2Xz?=
 =?us-ascii?Q?0Kwz+P5dhMYWZj/tnRfGHLdsLT1saj0Hp/SYt+E0W4nPxRn+ngL2zrSWu0ek?=
 =?us-ascii?Q?QSsR/HnUlzNt9slk3kBen4Eo1OjY4XDbTqZIgMT5QqdtqdJJGWPo34nl9CEn?=
 =?us-ascii?Q?f5Jopt1nm8RNKMchx5bRYvcKqgSVz7WpTNdArhGwxXrpEloqoeXmqWQA5tbR?=
 =?us-ascii?Q?099QiOuED5GnNoHCYSRGDiuWVnQ1WZIFO8ntKHJ3PO7K2kxt2U0JXtvmca/r?=
 =?us-ascii?Q?DF2f8AJK/Q=3D=3D?=
X-OriginatorOrg: vaisala.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3ce63b05-3d43-4388-8309-08df4c785ecd
X-MS-Exchange-CrossTenant-AuthSource: GVXPR06MB9766.eurprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Nov 2026 11:19:58.2058
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 6d7393e0-41f5-4c2e-9b12-4c2be5da5c57
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UisXgd10f0/aVqAbVlKTA0sQof6Q1f6SmmBd1XI4j7uGsz+Jya4YWkOgHJOftJ53Arhy1n438hFBdVjgTBpygw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR06MB9086
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Fri, 27 Nov 2026 11:20:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/251375
Content-Type: text/plain; charset="utf-8"

Since commit b6a7617145c3 ("systemd-serialgetty: use existing unit
files in systemd") removed the recipe's own serial-getty@.service, the
baud rates in SERIAL_CONSOLES are no longer applied, and any entry
whose rate differs from the first one fails do_install, as the unit
template it copies no longer exists:

  install: cannot stat '.../serial-getty@.service': No such file or directo=
ry

Enable systemd's serial-getty@.service for every console, and give each
one with a numeric rate a drop-in that sets it with stty before agetty
starts. That unit runs agetty with --keep-baud, so agetty keeps the
rate, while the unit itself stays as systemd ships it.

stty comes from busybox or coreutils; without it, the getty still
starts, at the rate the line already has. With nothing answering on
the line, systemd's terminal setup for stty adds about a second before
the login prompt, on top of a similar wait for agetty itself.

Tested on master with qemux86-64 core-image-minimal and
"115200;ttyS0 38400;ttyS1", also reversed: both consoles get a getty
at their configured rate, whether or not the kernel command line sets
one.

Fixes: b6a7617145c3 ("systemd-serialgetty: use existing unit files in syste=
md")
AI-Generated: Uses Claude Code (Claude Opus 5.5)
Signed-off-by: Niko Mauno <niko.mauno@vaisala.com>
---
v2:
- Apply the SERIAL_CONSOLES baud rates with a per-tty stty drop-in
  instead of documenting them as ignored. v1 was "systemd-serialgetty:
  Fix do_install for mixed baud rates".
- After a BREAK, agetty switches to the first rate in systemd's
  115200,57600,38400,9600 list until the getty restarts; the old unit
  ran agetty at one fixed rate.
- Applies to wrynose as-is.
- The code was generated with Claude Code (see the AI-Generated: tag).
---
 .../systemd/systemd-serialgetty.bb            | 25 +++++++++----------
 1 file changed, 12 insertions(+), 13 deletions(-)

diff --git a/meta/recipes-core/systemd/systemd-serialgetty.bb b/meta/recipe=
s-core/systemd/systemd-serialgetty.bb
index c3fe9d5b6d..1c109536e1 100644
--- a/meta/recipes-core/systemd/systemd-serialgetty.bb
+++ b/meta/recipes-core/systemd/systemd-serialgetty.bb
@@ -16,25 +16,24 @@ REQUIRED_DISTRO_FEATURES +=3D "usrmerge"
=20
 do_install() {
 	if [ ! -z "${SERIAL_CONSOLES}" ] ; then
-		default_baudrate=3D`echo "${SERIAL_CONSOLES}" | sed 's/\;.*//'`
 		install -d ${D}${sysconfdir}/systemd/system/getty.target.wants/
=20
 		tmp=3D"${SERIAL_CONSOLES}"
 		for entry in $tmp ; do
 			baudrate=3D`echo $entry | sed 's/\;.*//'`
 			ttydev=3D`echo $entry | sed -e 's/^[0-9]*\;//' -e 's/\;.*//'`
-			if [ "$baudrate" =3D "$default_baudrate" ] ; then
-				# enable the service
-				ln -sf ${systemd_system_unitdir}/serial-getty@.service \
-					${D}${sysconfdir}/systemd/system/getty.target.wants/serial-getty@$tty=
dev.service
-			else
-				# install custom service file for the non-default baudrate
-				install -m 0644 ${S}/serial-getty@.service ${D}${systemd_system_unitdi=
r}/serial-getty$baudrate@.service
-				sed -i -e "s/\@BAUDRATE\@/$baudrate/g" ${D}${systemd_system_unitdir}/s=
erial-getty$baudrate@.service
-				# enable the service
-				ln -sf ${systemd_system_unitdir}/serial-getty$baudrate@.service \
-					${D}${sysconfdir}/systemd/system/getty.target.wants/serial-getty$baud=
rate@$ttydev.service
-			fi
+			ln -sf ${systemd_system_unitdir}/serial-getty@.service \
+				${D}${sysconfdir}/systemd/system/getty.target.wants/serial-getty@$ttyd=
ev.service
+			# agetty runs with --keep-baud, so set the rate it keeps
+			case "$baudrate" in
+			''|*[!0-9]*)
+				;;
+			*)
+				install -d ${D}${sysconfdir}/systemd/system/serial-getty@$ttydev.servi=
ce.d
+				printf '[Service]\nExecStartPre=3D-${base_bindir}/stty -F /dev/%%I %s\=
n' $baudrate \
+					> ${D}${sysconfdir}/systemd/system/serial-getty@$ttydev.service.d/bau=
drate.conf
+				;;
+			esac
 		done
 	fi
 }
--=20
2.47.3

