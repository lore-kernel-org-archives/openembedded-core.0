Return-Path: <joerg.sommer@navimatix.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C8DFEF8D763
	for <webhook@archiver.kernel.org>; Thu, 16 Apr 2026 16:38:20 +0000 (UTC)
Received: from PA4PR04CU001.outbound.protection.outlook.com (PA4PR04CU001.outbound.protection.outlook.com [40.107.162.129])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.19171.1776357499228846088
 for <openembedded-core@lists.openembedded.org>;
 Thu, 16 Apr 2026 09:38:20 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@navimatix.de header.s=selector1 header.b=gtyRdAdb;
 spf=pass (domain: navimatix.de, ip: 40.107.162.129, mailfrom: joerg.sommer@navimatix.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YzewmNiL+qwowhrNmEhDgDDVXHrLoM87Dmo+IZdBYBtH0SG4J6/Pgy6dBweOaui/eVipk7eupzHpXCE1ezQFyXMU82d0acH1yd2c2SfVw4jOF67PKdGmI6FSmjsSHXPf+wN+CD8gGFxgNnBaxUKnsCMZEdjbjytSMxXetuDJ4X42LsIMFcSEqrkNRLBCHA1FvBY6rpmClK2QK+PsbidCuB0ksHIVm7rMLGSaO7UHjL63LXAjVLDWK6NZSb1lVW/JxfeMnLlSn23UMRspIvKWbPNpUG/1kkh5uhl4Z7H8JTUEkrWb9mgE+GP1wMjeklt41V8iquUuork/V+JgQOSskA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=X742569dH84rw7k6/mW1khd/Dja60J9LSJDiz0tlOiU=;
 b=J8x9c+r//CdhyYoKmPZYdwnYra5VDqsACV03QabYrejNpRDk3nTMfwnwVogEDMnCK+pMF191+eiAerBdbpeDb22Z59EStwuzAOlBZyYsV3EZV5S3fLylsCsT+Mtx9D7WyuR/z6SGObFVVaGoi2iMvEt+apobCQAjD34hSpf2+d9psumWmqamb0mdj/NkeYS7L7VaREQV0X8/ZmIa+zOY/Ka0ZuNZ7k9iOqxWYFxXH0YLvwLbBFyd4QKDEx9DmZvYqkhwO7rHWJTqHyGj5nirk9n8aSmFS8MNsGf33eL8jXXsW8rct0OJ3nUpi3oodULyXKXzQGSw+HP1vKmjzgsxrw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=navimatix.de; dmarc=pass action=none header.from=navimatix.de;
 dkim=pass header.d=navimatix.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=navimatix.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=X742569dH84rw7k6/mW1khd/Dja60J9LSJDiz0tlOiU=;
 b=gtyRdAdbeaj3EQ7Ot6pcUMFTbwGQfxXLrdMvvgDdGsNXWRDOLFpSm4CIfhQc5YAap12W7Dqr9nZrmxY/Ugr+Jh71ENnGtXJ51td4YSfg5P+NsJ4yC+hvGZehYyiG9dTM1EtGaSwzYhiDVR6n2lErxiaQLErUr309UFojmrkAANU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=navimatix.de;
Received: from GV2PR01MB11835.eurprd01.prod.exchangelabs.com
 (2603:10a6:150:2cb::8) by PR3PR01MB6634.eurprd01.prod.exchangelabs.com
 (2603:10a6:102:2e::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9818.21; Thu, 16 Apr
 2026 16:38:15 +0000
Received: from GV2PR01MB11835.eurprd01.prod.exchangelabs.com
 ([fe80::d5c3:2dea:3d98:25fd]) by
 GV2PR01MB11835.eurprd01.prod.exchangelabs.com ([fe80::d5c3:2dea:3d98:25fd%3])
 with mapi id 15.20.9818.023; Thu, 16 Apr 2026 16:38:14 +0000
Date: Thu, 16 Apr 2026 18:38:13 +0200
From: =?utf-8?B?SsO2cmc=?= Sommer <joerg.sommer@navimatix.de>
To: openembedded-core@lists.openembedded.org, joerg.sommer@navimatix.de
CC: =?utf-8?B?SsO2cmc=?= Sommer <joerg.sommer@navimatix.de>
Subject: [PATCH] run-postinsts: Replace which by command -v
Message-ID: <cfc0fd54a4efc5ba57ecf7a84980be54169ca07a.1776357492.git.joerg.sommer@navimatix.de>
X-Mailer: git-send-email 2.53.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: BE1P281CA0477.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:b10:7e::22) To GV2PR01MB11835.eurprd01.prod.exchangelabs.com
 (2603:10a6:150:2cb::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR01MB11835:EE_|PR3PR01MB6634:EE_
X-MS-Office365-Filtering-Correlation-Id: 42449e5c-cfaa-4d65-afae-08de9bd68e40
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|376014|366016|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info: 
	ECXd/chk2S7bquIA4z3deZ+WanZ5QKhttQ8QDblVTMPAZh9Sg/+Ab8NgbeLHzk+U3k7lTMbrN8tBwVSnd0zCwI9w0XWgzrFQbaIJNLz15MvV6pwxNyN5r+yIQCHmdAW1/AgS9oxOFpES9fMZp1E5ldM1RqlMQCgjmcru0VXw2CrBFTCMpZYrf5pquoGM+bdUKZc7twbat3KNTHK46w8GbNxgp+O3WmtmqItOb9LVlcphuZotyQziV1EMi/eF5TGX7JGC1pIi0mBNbqCsGS2rvtoDELIyrwcONHDeinsC7DapS1LAawXivw0lPLww+WfrYOe/ISOJk/TjNDTVavVNotajZ/rm3XsjszX5uyto6rc+z6jOL2s44GCuCf9KUily7Fk29tGxIsX7FXPolYomsFPKUiU5iZhwyOhnUsRResr6pIs2sGQxkHQ9Nk7RR3VJCtHVARiSNcova6ayQ/xDC78f5V3Ovh62Z4Y98wJzgSk9BuyEfwwLlJSPlVfsfOmGhs3cQJgEtB8hkj/p+tzgAsMCtdyI2nk4K1DZxpQtWzyESz+J2rRy9UakvJB/loq4k4sAzuQiZ9UafnnDGz+4CfTLULa0135NzrsrjT77f9Ff1zOnGN9pylXTllQZqAOHUEazdllc1hMWDBcNYoFLi8iqq2qIRfDtJSYf+oi5hkuF1GH9iMw5Dls3uOLr6QubMXIhdHwJgGCHtaEQwYyH1qegEcU0VfSXLDhvfICkzeM=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR01MB11835.eurprd01.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(56012099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?uVAzchn3nRcUQzdQBRYnAEpP/zeerhSpRPK2TTkP6jUibwbVZvg9l4qw+5Fp?=
 =?us-ascii?Q?Kfhn6oCzb4W6Ky8Dt9Fnowa5u6Ymyf5bSa6mjmIy9v4xk+oKzklssqfH/g6G?=
 =?us-ascii?Q?DR6nqZslcv7fbaDXChmDN01kY3gtQwvAMRXU8pf8rYaiRQjOAiAEtMvEHR10?=
 =?us-ascii?Q?gp6fmCavgrLUWtTROCBYSyvcdwTfwyE7cbbQoyzRRkEt9VHokNUgZypYTOpp?=
 =?us-ascii?Q?Xd+2RGYacO/U2Jlg5ptUUxz7kZicl7l9u4MwAUiqbv4+ivqYlt61cP8Fqdvu?=
 =?us-ascii?Q?/dafjFDcO3OWjrqO9YygIZFDP4Ess6e8azatBNYFFrtehKbaHJdF7vN3ODKM?=
 =?us-ascii?Q?JejpUiXLD4VIydS8XR3qzFtrbZKyZT9j4h9tTHokyTg48Ea6lXmmvBAnSI0P?=
 =?us-ascii?Q?cjE/5dzztz738Drgu4Y5AyFAzZF7HEDEGhbaPOTChQv/M4qTE4x18HO11/XV?=
 =?us-ascii?Q?QuBHqdaq16CQHJ7CMhllle/VQeFgKoTeW2xTaOuRH8sauyAlRWfkK7BWdiTQ?=
 =?us-ascii?Q?h4GlsdYC+Tv0D6O60gzpgIyRVC0ZrHqC3V+0E2plO+dEiFBE+3uwk+qstsGR?=
 =?us-ascii?Q?9pcyttFl8hIhQTOReY/alh/Ljix8AO742ZKIF8C5ptgVK7rLuJDxsfDRhRC7?=
 =?us-ascii?Q?k2p82qH951I7Peq87nZs8uaSqNRQK22/QjHflWt0wj/kzMW7CSWX4wmX+YrA?=
 =?us-ascii?Q?481oi9FQHQAhg0Y3Hf5V/nFaBHBxlfcNn0nmdwGf3PkswRFh+gstQ8CVuRGl?=
 =?us-ascii?Q?GTk0iOUL2pSZr2uLWC4ffxJdyTEskLTMyeANzSUblLKyos8/O4XR1Cac9XM1?=
 =?us-ascii?Q?DiJWJ9XkShCDU22C9QBJf9PolN+ACRsY30UTszJw478pcwAo5QoaB2gvFKGj?=
 =?us-ascii?Q?+XFQSIiHK3weCrc8uddcmUvOqzzoJpzfajlrnPrVpVe9ay+QBkLsVb3LgqW5?=
 =?us-ascii?Q?pNYZCtUdq2Y3F3gADuaMFK+KOJyb73m1iqkZGgcp0yMSCoB8Zp8Ik3nh3lbn?=
 =?us-ascii?Q?faw1oNFgK4LO41YEVQEd7WRjuPDJwLGixnXpAVbkujY1MyzIeIZNwi4jKZPr?=
 =?us-ascii?Q?lNqJrx4gpRna2Har8uyUWVwJ/mn09S/Z860phE6rVxAJPHelpZZFPWy/jQHJ?=
 =?us-ascii?Q?eEbLyYoMzGZMZov3jKA/wWX0uvAv7XlA44JlMx+cSWUGeYHNjMdiGaDYkj1P?=
 =?us-ascii?Q?g4yQr35FAUe+GNjQ5qnUEM94I3TEL4lReleTHTmQkYPYgOTTBpU9TKbSRt2/?=
 =?us-ascii?Q?9Rq+J+RCU+CriTRrmFVEvpqAtbKGg+NwAVQDaU3i/AFph0G3uuFk15WHV88F?=
 =?us-ascii?Q?wedp9/0F+ixOdJQisWGkUkKSZSujqBiYH1nl/QvcgG/1CVLv3XI4CL4VBsSw?=
 =?us-ascii?Q?0D6JaqjqF9CYtABeIxixR9QBBSLAuZE3qtvQSioWbj/5DS8PAjpqB4W2FD76?=
 =?us-ascii?Q?VHgc+uEro34QKsdssK0m1NQeWgtLixq6rPSQTp9o6raITmE2BRBdPVXS+3Ih?=
 =?us-ascii?Q?T3tsYB9S6fcNTmsOgJNyuAeh0U+53DdV5X/GBDjRhEOLUwRJFS1INcxm/d9X?=
 =?us-ascii?Q?Egw6bb+kTSK8DP2ENxDqDt/s0QZc3RHLOl4lWkW30R1zRoT9rfBkuWcj6zlU?=
 =?us-ascii?Q?fdRMSFCN+RwiCADIXwUA5lT1eYlEsxb3nYD/r9EmjGjpgua97Y4BQDU86bNt?=
 =?us-ascii?Q?1kyf9LZeycjq/ii+479XaswaHCME42yX6xSxuxqg0G5Yzp3S5nTO8Afe1iGY?=
 =?us-ascii?Q?+WwlcxKfXFrZwx8V4jNGE0Nfw9IO3Po=3D?=
X-OriginatorOrg: navimatix.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 42449e5c-cfaa-4d65-afae-08de9bd68e40
X-MS-Exchange-CrossTenant-AuthSource: GV2PR01MB11835.eurprd01.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Apr 2026 16:38:14.7041
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: c87b4f54-b992-4813-8f3f-4a876324197f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2cMfXMv3/uKEHP1mHYyhRI8UdhHoxPbKD51vnI2TvCkhD756Na5gUgLBMsPGTX7cDnhAkWHYzPFOqNi5aLktLDJJgYTQLCiMOsq2bty6cUo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR01MB6634
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 16 Apr 2026 16:38:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/235414

From: J=F6rg Sommer <joerg.sommer@navimatix.de>

The command *which* can be provided by the packages which, debianutils,
busybox, or zsh. But if none of these are installed, the call fails. The
POSIX way to check for a command is `command -v` and suppress the output in
case of success.

Signed-off-by: J=F6rg Sommer <joerg.sommer@navimatix.de>
---
 meta/recipes-devtools/run-postinsts/run-postinsts/run-postinsts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/run-postinsts/run-postinsts/run-postinst=
s b/meta/recipes-devtools/run-postinsts/run-postinsts/run-postinsts
index e8c31e04ce..be752a95f0 100755
--- a/meta/recipes-devtools/run-postinsts/run-postinsts/run-postinsts
+++ b/meta/recipes-devtools/run-postinsts/run-postinsts/run-postinsts
@@ -41,7 +41,7 @@ for pm in $backend_list; do
 done
=20
 remove_rcsd_link () {
-	if [ -n "`which update-rc.d`" ]; then
+	if command -v update-rc.d >/dev/null; then
 		update-rc.d -f run-postinsts remove
 	fi
 }
--=20
2.53.0


