Return-Path: <rasmus.villemoes@prevas.dk>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1C723C02194
	for <webhook@archiver.kernel.org>; Fri,  7 Feb 2025 12:06:52 +0000 (UTC)
Received: from AS8PR04CU009.outbound.protection.outlook.com (AS8PR04CU009.outbound.protection.outlook.com [52.101.70.4])
 by mx.groups.io with SMTP id smtpd.web10.67868.1738929998486476213
 for <openembedded-core@lists.openembedded.org>;
 Fri, 07 Feb 2025 04:06:39 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@prevas.dk header.s=selector1 header.b=HV7sMSG2;
 spf=pass (domain: prevas.dk, ip: 52.101.70.4, mailfrom: rasmus.villemoes@prevas.dk)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tpRGGrdXVwcMq2X6LUWVS2RbqyErAcUpi1RSMGY5T9Rcjv7/MATWNRE11ounVmihZtprnuNNYRIqvrGjmHbYx19O7EAA18fIEpmrcJV7gJ89xdJ1Q8XtAl1hSjsEfFaX+5KXESFtjaMZqDao6BAqXv9wqfjt7nLa4J+kF3ARvW4ve64Y452TMqsUJS4kkhq7ZEkX9w+S8xYnx6vOXY+1mKfFrYH6Wv8dzWB88JQcZr6qCLPCKi+lT2OUFYLyyIsMiQ8iiYVTCfPNYi6gD5v8sg4xbkLg1r3aJDCkgHV6hSdE98MlIZ4xUFwOMtmrMpj7pHZNyddmaw2owOaHaotTFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=myPkKRHit65Qvmuf9SnM14c5hWaIRaa46GdOnckI+9k=;
 b=um7PXzu2eH/xVt3j0RmLJEnpVk7kHQIlaTXZnRKPR+qge7nWcgbj6ax2X6L9FfSSJBBo1yygpafk/AgvaegjHWBxvhVbRQEZDwHsQ4+5IpGeEtPa89R/kGRFkeBf9BcNwPIXmkxhtk+mvt09UzMnEOnMA0uUcCHJORVp5nVw+bCT8aQ6MB0eLKihUey7ijir7mwPeD6Ro6c6rgEMlKDKfRMqaTNBI4X2u1srcFPjJwjLlexFSE0Y6r+VYRpz2jBwlCNWx+rmV+z1s2UcoZWVX4mBhJ94bRIEVfuylMDrJXLWaA1kptkERWZJAyNMPq8qwYcYIEl/aDQ8lQuqbz9NcQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=prevas.dk; dmarc=pass action=none header.from=prevas.dk;
 dkim=pass header.d=prevas.dk; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=prevas.dk;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=myPkKRHit65Qvmuf9SnM14c5hWaIRaa46GdOnckI+9k=;
 b=HV7sMSG2SseT3HZ7yMQ2tbM8R1oNKCGXdxKJaR5RheCB1yB0vrPFkzYPIVtVPO0Eg7vf2APDQnCPTU8mIF56MVCOAvabd+fZy+6C+CZ4IfCkSL+f5Q9Yz/UkRo/+1s/24ZfVFaBEaq7urMP3AKkDYFbDtaLj5wLkXBKjk5DKtNA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=prevas.dk;
Received: from DB7PR10MB2475.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:41::17)
 by GVXPR10MB8958.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:150:1e7::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8445.8; Fri, 7 Feb
 2025 12:06:32 +0000
Received: from DB7PR10MB2475.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::7e2c:5309:f792:ded4]) by DB7PR10MB2475.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::7e2c:5309:f792:ded4%5]) with mapi id 15.20.8422.005; Fri, 7 Feb 2025
 12:06:32 +0000
From: Rasmus Villemoes <ravi@prevas.dk>
To: openembedded-core@lists.openembedded.org
CC: Chen Qi <Qi.Chen@windriver.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>,
	Rasmus Villemoes <ravi@prevas.dk>
Subject: [PATCH] systemd-netlogd: new recipe
Date: Fri,  7 Feb 2025 13:06:28 +0100
Message-ID: <20250207120628.909410-1-ravi@prevas.dk>
X-Mailer: git-send-email 2.48.1
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: MM0P280CA0034.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:190:b::15) To DB7PR10MB2475.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:10:41::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB7PR10MB2475:EE_|GVXPR10MB8958:EE_
X-MS-Office365-Filtering-Correlation-Id: 68ba0ec9-5ff7-4986-bf04-08dd476fdc62
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|52116014|1800799024|376014|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?7CrzCLo1ot86K/9LK7OZR63lzzEZ+TDJ2ndYKFBbBb66V1++zPMHbtXiNQ84?=
 =?us-ascii?Q?GlgwfS4fKQHdAjAvTPsHkqf1C8x2bc6Qcgjxq2nx996c8BEftfL8dwShE6hF?=
 =?us-ascii?Q?RAxU66G1aIiXcRVs5P88nBE2fh5Uwj0lkOpD5mZcmpJEVnxn9WJP3PDnFjle?=
 =?us-ascii?Q?onqpZK6aqRct6WB18C9cDEnqrC2pdW5gxIPshNGE6g9jzlUlqbCU2aAfbxJh?=
 =?us-ascii?Q?BKyNDMhbf5nQqC7KAfIKvq57aPXtayKDAGWhfTZsl9vFGYp7CjllbF2KP02s?=
 =?us-ascii?Q?UjpLV00Hc1y9PYiZMRkd9w81BWe95U49lVtW7Mt3N/mGYUqmhw00NKqVuwHj?=
 =?us-ascii?Q?GpaPdFEvOLRNE7SUMc+jKt7oentmEwqXjGj1/A4S4dAzoEeVaSxMHpHf+cUZ?=
 =?us-ascii?Q?nVKorDAtb/hOMZBA2+bxFo47HClFpXlYQXGB2NpsT0a3cHPh900tv8EMEsmz?=
 =?us-ascii?Q?wYuKb5mb460+UqWFhS4unhVB/A/FpkWG2DIgscL2zdHVrFvcCgK43r7lBONz?=
 =?us-ascii?Q?RAxKmxEwXCCv0PzSL0vQwYngx6oMQBEnqe+AbOWIXD9MiBnqdfZLfnCMmsp2?=
 =?us-ascii?Q?eeRjCBWJUoTe/157nxVKOBQG7DdnqUBN8gfQ88VZxBP7RXd7VY+hKgwwjwFb?=
 =?us-ascii?Q?aYzoaSFfs/syPmafVHntMiZp+xo/RYR8EAk/loPLoSIgqLnK0esP+EG2P1kC?=
 =?us-ascii?Q?K9SnqR4y0r7Y/qlhDdRQhTYzcMNujbbRskGAQaFUHqgvpUPH/FU6nDipxogF?=
 =?us-ascii?Q?nPlTBdStrNcP+ectsD0GiyVqQnD88yGgYWWEa5EJnbfXhdaIUnWf7N8T4FNs?=
 =?us-ascii?Q?aVADMBuljLnFyvM3/aIsJexEHRnNS0T+hGzndMfHv96pUf8MI8yz4nL+ebj6?=
 =?us-ascii?Q?xMzmvB60QV3QaDDk3SccDnw73xtdYGz8Dlz8JUguU4YJGj6GDNy0eYhUbb4Y?=
 =?us-ascii?Q?V+K6GfLkj/qucfe3uppZqvisyC3TuIM6FFcRgJ09eL/JpBUKyjGEejonUV0R?=
 =?us-ascii?Q?nuUSNLLKVhdt88B7EFrQgdfNyXGHdPM+Yfn/upz/jYiyDqxGt3RcbB9WFhO8?=
 =?us-ascii?Q?Up5BmxkhXnkDB48Mi1Yh034zCU32RN33LP4wdjJXQO39UK4Frvw4A+7Hs1xy?=
 =?us-ascii?Q?iTvhpcfNISyH5iHit4RnYiuiDDyva4NkPM59VqafOmNip2l254/XYtMHzc4j?=
 =?us-ascii?Q?TJ29eT9UZBoGToD1LhVRE7hmT96AfJFa37JhSBlV6WWHGc6jKpZ3PgKgGu7v?=
 =?us-ascii?Q?P/EM8hEX/p37flLTgENavXlteKwZz8ylgVqV+OGEU/hIrelU8sdUXVpRTRub?=
 =?us-ascii?Q?Hr7muuHHDG3f3RH7r7tE94NUF4Nvrb3xcFC6v88dsA6eCe26WcbUYclh0vtD?=
 =?us-ascii?Q?YtA2GWeTPE72t98C9fsLrYxpoYZZUQFzF3eRDkH7WccflatgkoUrAwtmYHzc?=
 =?us-ascii?Q?f2ezMNpFYCVIsoBFZVS7wxrfcTG3JOkw?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB7PR10MB2475.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(52116014)(1800799024)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?ip9MOiXpR+8/a4SFTEANFqIvghSGRNy9LuwYiNuPuCtDrhY81CrUAKqEUuPN?=
 =?us-ascii?Q?4vHdOS4v/seqjs2DwpAzPdVJQEydvvbVETNzrjwms91UI3qvBerTm7l8nP+4?=
 =?us-ascii?Q?zTAF/KeP3E4jDXD+RHbDQWl4J8duRTxxv4/IO6o4/kznZeLQOiolPWqKK0VO?=
 =?us-ascii?Q?14czez3tGe9RCVJDKDwEl9yrTvEpIIAyLtATFinnTzHZQA9uYkmNYZATXMaj?=
 =?us-ascii?Q?LSmh2tx6F67AqBWg3ARsanTY2bO+ad/mMwQ5xLqwFA1T8UYHNDzL96RQDSnl?=
 =?us-ascii?Q?15j5pP+hiNRkZgSeL/H1uRXHO8af4QeSQnFTsgzDMJA/gv0rykGLCDtaANwR?=
 =?us-ascii?Q?yKuUitI77VsqOqt0Vii5smBUgKfb7207XIZcX90Xo6wh40S1Ga1eW79FISSp?=
 =?us-ascii?Q?LaH72SAumeLDcgU+ywmfFkmAyuPtDxfIXeQThVLq2zg9nYP4nWNORiGOecx/?=
 =?us-ascii?Q?HD4TuFNiEfGclX51CJo50kdc1fQ/eZW0kiiDGmaQvo7GEauvn9rEDWAFZgNI?=
 =?us-ascii?Q?6g+ZVkonCBREIAUTh7kL9P8Jj+c5TootTHg9sYaPW7ydKVaZuKzDdIaxT902?=
 =?us-ascii?Q?Dh6k2sbviyJ8lSN4/+L/4oXG0A79xIJWOxe6E/3RMIsla3im5zAv8HdC0mBk?=
 =?us-ascii?Q?OoAnbgFulzIOfojFAN+Okz4HkQmE5mn6VtuuDhg8mB9V0Ux3/LavUftU5SAF?=
 =?us-ascii?Q?L8ksCO1dT65wpe+eNp5BKKXypemJNmproFO8Si+mThjlbyPxqkPADoWfbgeC?=
 =?us-ascii?Q?emtOJkalnZHZNP6eaGq+QYOhhLGvxlW/BCR+jPryXRvguWH5xduZoklzpVaP?=
 =?us-ascii?Q?KU+gO+W1Zl7qUkBsowixsP75L/aFtbkI2jofinREgFnZcZdFgkW4Jjg0cr/g?=
 =?us-ascii?Q?HKrzGKf42sNJay/PZJTEeLJ1yhSS0Smemmz7EeToAO3hG9LCFuJaUewA+o1W?=
 =?us-ascii?Q?fzM1ydKFuVWllIfbu1b/Se2MTfY/JVotdeZiU9qZdxxDfEm116PQ2tSb2jJI?=
 =?us-ascii?Q?vvw+dtorxgI0qjaHQwwNetGXfReSo2hNAQ4Q1Favc2uAjfbNpZqJdZf8mqmW?=
 =?us-ascii?Q?gUxIoZ5I47AZdbfGbWncPUm+Lcn0Wdhn/7o6x4SWn1hRdHkltVsTxCfDBHc7?=
 =?us-ascii?Q?rk4huE3u10LnS9boeAOrvC9HvnoEZSoCu9w1XwjFJeMtuiJ+ewTMuVAr1fy0?=
 =?us-ascii?Q?Yfd94qPrnhkfywlLTOZPwbL5UFaUMwk6KMjTAjQkt7KKql9izbfZ5B8rbWe9?=
 =?us-ascii?Q?eOxrHyrKs5Q777YcbfAMwzVz6RKNGUlQlyCljAIATAdSn1S9ymPj3lyllRqP?=
 =?us-ascii?Q?FWxRcqutC2TBGuwSU407DebfuwbNsjelquKHSzQcDXs1teGitMuysR1A/a8L?=
 =?us-ascii?Q?EGVXDE7jimJO5RbrDU0mht1imGpBzylRo+UzrUdW/jpPjgc0/kc6HBNIO79M?=
 =?us-ascii?Q?LoiBM+U37Xmqi8WMkhVprnhHv4hvTbBThEbcc5zuRzc0FqPPTMfiTaAkjv3G?=
 =?us-ascii?Q?c1QWWoP7GT+yut/X7p9/DKhTnFiueAiCOMnjCeuBm9fdJlOVYL+95qHW25lS?=
 =?us-ascii?Q?fq1YyhJ4Ef0R/391hRsTfw3zEj4Gyd2U0BLfuDrS0sqsrWo3gYEv2jojAxUo?=
 =?us-ascii?Q?6w=3D=3D?=
X-OriginatorOrg: prevas.dk
X-MS-Exchange-CrossTenant-Network-Message-Id: 68ba0ec9-5ff7-4986-bf04-08dd476fdc62
X-MS-Exchange-CrossTenant-AuthSource: DB7PR10MB2475.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Feb 2025 12:06:32.2222
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d350cf71-778d-4780-88f5-071a4cb1ed61
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: aEUoH8knNuiPQrSU7Etq4PR/2SOjZ/LO8FQaSvXjTqfwAEzLUa+mC/UH4kcfM1ZU+aZDiPbVB62AwQbgp5wgDVxXF2xhNvxR/cJ05/vJ0vs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR10MB8958
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 07 Feb 2025 12:06:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/210981

From: Rasmus Villemoes <ravi@prevas.dk>

In some deployments, the log aggregator collects log messages in the
syslog format, so systemd-journal-upload and friends can not be
used.

systemd-netlogd is a daemon for filling that gap.

Signed-off-by: Rasmus Villemoes <ravi@prevas.dk>
---
 .../systemd/systemd-netlogd_1.4.4.bb          | 25 +++++++++++++++++++
 1 file changed, 25 insertions(+)
 create mode 100644 meta/recipes-core/systemd/systemd-netlogd_1.4.4.bb

diff --git a/meta/recipes-core/systemd/systemd-netlogd_1.4.4.bb b/meta/reci=
pes-core/systemd/systemd-netlogd_1.4.4.bb
new file mode 100644
index 0000000000..851817e9be
--- /dev/null
+++ b/meta/recipes-core/systemd/systemd-netlogd_1.4.4.bb
@@ -0,0 +1,25 @@
+SUMMARY =3D "Forwards messages from the journal to other hosts over the ne=
twork using the Syslog Protocol"
+
+LICENSE =3D "LGPL-2.1-or-later"
+LIC_FILES_CHKSUM =3D "file://LICENSE.LGPL2.1;md5=3D4fbd65380cdd25595107900=
8b364516c"
+
+SRC_URI =3D "git://github.com/systemd/systemd-netlogd.git;protocol=3Dhttps=
;branch=3Dmain"
+SRCREV =3D "b03cc3b1a75048c7cf19467d8918a4b7320767e6"
+
+inherit meson systemd pkgconfig useradd
+
+S =3D "${WORKDIR}/git"
+
+DEPENDS +=3D "systemd"
+DEPENDS +=3D "openssl"
+DEPENDS +=3D "gperf-native"
+DEPENDS +=3D "python3-sphinx-native"
+
+# systemd-netlogd uses prefix and sysconfdir in a weird way.
+EXTRA_OEMESON +=3D "--prefix ${libdir}/systemd --sysconfdir ${sysconfdir}/=
systemd"
+
+FILES:${PN} +=3D "${libdir}"
+
+USERADD_PACKAGES =3D "${PN}"
+GROUPADD_PARAM:${PN} =3D "-r systemd-journal"
+USERADD_PARAM:${PN} =3D "--system -d / -M --shell /sbin/nologin -g systemd=
-journal systemd-journal-netlog"
--=20
2.48.1


