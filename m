Return-Path: <niko.mauno@vaisala.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3F078C3065C
	for <webhook@archiver.kernel.org>; Thu,  4 Jul 2024 07:15:54 +0000 (UTC)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (EUR05-AM6-obe.outbound.protection.outlook.com [40.107.22.118])
 by mx.groups.io with SMTP id smtpd.web10.5136.1720077346210939763
 for <openembedded-core@lists.openembedded.org>;
 Thu, 04 Jul 2024 00:15:46 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@vaisala.com header.s=selector1 header.b=RHFFTHYO;
 spf=permerror, err=parse error for token &{10 18 spf3.vaisala.com}: parse error for token &{10 18 _spf-dc57.sapsf.eu}: limit exceeded (domain: vaisala.com, ip: 40.107.22.118, mailfrom: niko.mauno@vaisala.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=C/P65rmbY2yLOkmOlLNUzk4faNWMBpBU7eNLDZav7DRU3yktEsKeG0JAfJ4lwfoREwVoP/0dlWV/aVe/4wjwvOoVeMqcX4/jjMuzgiWYgDGrdTzvVjp5eQnnpIzBnGepUVRYExbY+IUkhIyua0owgK6+h0+woGINMOYsE6ewihkI4TYzn+/xukkBsjf7Yn3PPsqhs+V1kC3I4UEztZ2wgwn+abQYpE/XdkYtvsmkKnMXQXSY+5y8s6wVZqJDlALfLGvIn7BQfE1mal1qzsALPZZ5xpy+8n9acvqK740Ae7QSZsc8EyHnZVwTtkuuh30E0sL2dStXvjJyNtkuCTr2hg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/KDC2b+ltMIV4oAmDCQDEtSuMRZ/IiqdZODoCILwT+A=;
 b=G7Rp7D0NGFi5HjGhvTNVMwBlpSerevY8c4nMcACjZSA6vF/Fe748oI7S2yDW7ie/TU65QBX/CKhF/AwY0CT/AfORoD7fkiHAoTy8CZ/WbxI/XnafOAZe5afR4A1UDG2o/ByhioKE3lOByFCfxu6CA53wUb6tgAV5uEJ5xwPZqYUdqa0PFmX5ZjDh5Nu59bVR0AIUzlTn1jjB/NuQSxCqV94ZRpWvRiMkhhbKJrftX9MSkovM4OmaxmwQX3SlHoBfnl4Fydty79YDnXbdUhjAWOYrYYOblPF18h+mLyEDm+g5dFRb27VURxjAV1y5GqOYQBLO8HX3qGJ5uCCsFfbIyA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vaisala.com; dmarc=pass action=none header.from=vaisala.com;
 dkim=pass header.d=vaisala.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vaisala.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/KDC2b+ltMIV4oAmDCQDEtSuMRZ/IiqdZODoCILwT+A=;
 b=RHFFTHYOxo40N0PN9aMSuVzVodHMb+f3AV4kt5+fu81GVwxOatlvEMAW/RPxbaN3rtAe7jTe+OSFctFdOolFxuiHS+rNheyBh9MqaWPCm+XizLkT/PTeB5QhltBWn1FjjdDNFLkIJdslHpHkCYmhwMw5+GhZCoEmB8Pjmzo8X16HBUrj6jnVstGryHeL+qqLrY25SxUjWfWN64Xmu76Czl3ZvVuAtQwGseKiSNIAcE9DwTvdiqGFNvXz93CXyV05ufQ00Vn1LlnS0jV19NmAdrtSpNFvFxLcmhpa8pIPmFBlgQXVZDCHS8QG2eou8+32aAIDte9CW4Sb+Lf1cZM+Kw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vaisala.com;
Received: from AS4PR06MB8447.eurprd06.prod.outlook.com (2603:10a6:20b:4e2::11)
 by PR3PR06MB6971.eurprd06.prod.outlook.com (2603:10a6:102:90::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7741.25; Thu, 4 Jul
 2024 07:15:43 +0000
Received: from AS4PR06MB8447.eurprd06.prod.outlook.com
 ([fe80::af93:b150:b886:b2bc]) by AS4PR06MB8447.eurprd06.prod.outlook.com
 ([fe80::af93:b150:b886:b2bc%5]) with mapi id 15.20.7741.027; Thu, 4 Jul 2024
 07:15:43 +0000
From: niko.mauno@vaisala.com
To: openembedded-core@lists.openembedded.org
CC: Niko Mauno <niko.mauno@vaisala.com>
Subject: [PATCH 2/2] systemd: Mitigate /var/log type mismatch issue
Date: Thu,  4 Jul 2024 07:15:19 +0000
Message-ID: <20240704071519.566147-2-niko.mauno@vaisala.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240704071519.566147-1-niko.mauno@vaisala.com>
References: <20240704071519.566147-1-niko.mauno@vaisala.com>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: GV3PEPF00002E2F.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:158:401::7) To AS4PR06MB8447.eurprd06.prod.outlook.com
 (2603:10a6:20b:4e2::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS4PR06MB8447:EE_|PR3PR06MB6971:EE_
X-MS-Office365-Filtering-Correlation-Id: 92e6ecb5-426a-409c-43bb-08dc9bf91ddd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|366016|52116014|376014|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?OvysileUQecxcsoDW60h/18TrIWCYaCONLefmrA97wtOyr6rYL9LcxvNPKiX?=
 =?us-ascii?Q?s5a7nN/AiomGufN0sfD17HyLtM0JbrBopGlRJOHR8Qn2plMKxXd7q2RnJOUY?=
 =?us-ascii?Q?jhAuqx+xhOQvxbdo3/Zr6hqWqPw+AnXWDLWv4DChOjLos41J49N6T6sS7Gul?=
 =?us-ascii?Q?D19y1yJJSonGoAIv6HqgPCj3TMTNB7tHvOla3q3GtwO2GA/GEebDy5JtJO5B?=
 =?us-ascii?Q?LdhIIj9IxqoXglBdH30oZIOGAvMWEx8XWjfGZnL0LHvqSm2vEuN7u5kmKtYZ?=
 =?us-ascii?Q?vtTIMeH1bNYuddhIEyrL6d1JYR0OjCiO3gpUY5Jyhy6moXVubg6WvwFRU0Jt?=
 =?us-ascii?Q?GRzw+XLhA8Eboninm2ZkYg+Ic9JG6b6viliCUibB99gR1Ei8eFL1nlbgNohs?=
 =?us-ascii?Q?AgSFzFExItm4hyk4HowG7HqrkZa+RKJ8PakGGh0R8VTm+zpn5CjbxiWXVTbv?=
 =?us-ascii?Q?RMz/70Z+S1rqbQ/ckaff8y37rdOnL1baraQtIkLgb53/6MOrkRuMRrNJcujc?=
 =?us-ascii?Q?sXO0dHEgEj7Tbdp2hIMgd+P42AKDKmUsGxvBjHpqtopfMV1vBFgmue3oNHaX?=
 =?us-ascii?Q?2Pu5ZYM0c6xX5XnAT9B2TPioAUx/xaTmn8kvWDHOGSGHIvjkl0DdFGwmYtue?=
 =?us-ascii?Q?07jcRlULeOgLxTeq2TaA1BJsisjUwZKgTec3EDxs1/wUAPHzXDypQ1wzkSgQ?=
 =?us-ascii?Q?zrZiPSPdFuQT1S1IPt62bnbf//K7iuYBlBtTeGSjzLGyNgIGwe5Q+IBltpdu?=
 =?us-ascii?Q?4oqNNhe8QTvXTX5tqGxZJauVIDjZIcIkxfokO/z5vauTK5Bcd/QbMoFYbVx8?=
 =?us-ascii?Q?QdCLwZBkQpvQG09WJwImADx72AYqq+yWM7AeykzeW3L0tMGg0DJG6JFKH+7r?=
 =?us-ascii?Q?MIpdJCj37MzjdV4HZMgrCpN+N9ODjBIi+0TEaRRJTC1G30iMCSUT/Qsb7jLP?=
 =?us-ascii?Q?Pw4yUh66S1D8WewmCAvUR5c1jrbltVZIdvTyMCUZnp3ojQ0O/KwUG408jd8a?=
 =?us-ascii?Q?sYY70fthKX8XpjmXQx+Fl1Q5jVaJfDCK/LouIpQ3vax761J//qVSYZPPFc0u?=
 =?us-ascii?Q?cZPO/3oQP7Nok0Z5i7ldHq66uBdidwkW6M5VQE5mikClpXvTH4DfsO1c7CXy?=
 =?us-ascii?Q?D9TnieoCTnYViM6tCGJlvNPkKsR01hZKi33BksBmWNCz4pSaNtb1fm5CcV/+?=
 =?us-ascii?Q?eFam4l5ywCmtqXbdcj4Np6ix6tYyQBTHoxXaKFJRaJ/VHeKgo3V2qg7VDHJv?=
 =?us-ascii?Q?mxjlZ766VVI6EPN7itVXUsJSIJhkg5OjJxuDXpX8dJzTYNKc8/zgw3RSGxCu?=
 =?us-ascii?Q?C7YEpapOHap0v6FWF5tFOPQIPl0fUxBMl5UEwihnJQaAisjSqZZf/2Q3kPr6?=
 =?us-ascii?Q?I4tan7xjrSrrl7wwaBN3YOv/LD4YXcmp+K8H29VsW7e2M5j2mQ=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS4PR06MB8447.eurprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(52116014)(376014)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?FSHJA0JcOm3Oy3QP8ReFBUFUu99l2Cl2S+1Y6dSRJ5nCDfJKNWQVGYA86Rzh?=
 =?us-ascii?Q?GSw8kheE2L4ny+Ko3UgOM34aGWhsnwdvcaJi1PtN6NmvbWLE1V2LaUt6OoiP?=
 =?us-ascii?Q?aLqTQMyActw0VkTprpzi4sDLD4fHzOCkNidNIQLdBc7f+ZeS1Ev7s3Sjlmfw?=
 =?us-ascii?Q?WF4WcVMMjAGNA4WMegFdx+waMfBVmqYLdpuSf3rjfGSrzsfzG/TMuodzVfBw?=
 =?us-ascii?Q?wD+IvVsYpC/SGsTTFvsgNWpKY2lZFWlqwbSXhBNK0NfuQOHklva4a6wI8j9P?=
 =?us-ascii?Q?1E+c6ZpdGZiRlJu5q45oEpo78xXSpjIoQAEOznJYWaI63XYFO85iyc/ubKHN?=
 =?us-ascii?Q?5OVporxL+wEeCRWKrfIeWI5xqBKaX90OMj3tfZi9J6jg/d7dX26VqFKpGVdd?=
 =?us-ascii?Q?HBFW5v2wCg+9JtMF8M4IcZn+KCpCFHxMCkUIUpUPo0EDCiu+Bw7Y1VVXNIZo?=
 =?us-ascii?Q?ZVGs0e11tbY5usaPOw2F+SMIYX+1ok64D4T+OJxdTQKwPseYhWk5Gc3y4Ww7?=
 =?us-ascii?Q?IPxrmsfBHrwOvjeX6tEnw3uXHvMYWwQb1z8SwEx/bceLxDO4MakoFuSUbKNk?=
 =?us-ascii?Q?B6+wp0JsFC20oKFJgOOhM7PeI9FxmiOEl856a4UPbQKsdUeggBlsIaANJO+L?=
 =?us-ascii?Q?AW8e5gEc8VpygFY9l1a1iOghmIOil/EXg99XN44Ita5aLQhf4vCtEea6juW/?=
 =?us-ascii?Q?e+JdRFPdd8eXU137K3ysf7ZqzeW31ZsUgSyM+6hA3evvac4HlLrp3iqFDkXg?=
 =?us-ascii?Q?rBiqmO9h8AgVwVON/ouE8R6znEeMflVAJ2wpcvwVu2v8bgoXhjlv65DfDRrO?=
 =?us-ascii?Q?VGllmNTy/78QJtgpq6vz4Y71evWZPtoBOFr26Ds2U8zO5o5KpfZiuyf8WByD?=
 =?us-ascii?Q?k/87G5EVfzxEPk4Vk8GO9hZsAJGOPpgFavmV7NHoQYKW/RaggT+9TGouBM2k?=
 =?us-ascii?Q?sHbS0/AzB690iu9gofwbTfaeWR4WRh/L74nbrKiVFnT8nRIMOwo3pAECnnzc?=
 =?us-ascii?Q?oj+mp0aEJH+c/qJCab8q0vpfiNM9jPqfqyhTP0t9+/uMu3+Wf+Ywe2ah3tY1?=
 =?us-ascii?Q?FRl45YD4rUmZVT4La6WU+1CXFtwCp65uzroeo7OUL2+zhcxys+xCf+CVOU7L?=
 =?us-ascii?Q?88wyWrQi2reG75t7wgW2c8VWZp9qK9AaH8k5Al0z1pyuC1Pltssqp8lMF9ol?=
 =?us-ascii?Q?YnvLtuqQZUNtkhJtoCTLyd/ROy6ix8x/uRwoSdPTu6r5m2Ekkki9CbUIbiOs?=
 =?us-ascii?Q?HSmFTxFsji+IHLKkT/e1JcKy/1+RumxlgHybsBqpafQnBNm+xxw7qnrZ1JOH?=
 =?us-ascii?Q?1bDQrRj2mmnTAYxWakygWxCHo7YzKmtT1IXV3oR8wKGuor5PwQe5gQ/JIQub?=
 =?us-ascii?Q?+q/amhT2DhG7qsw6/OiSY1icydc6WNm5Pd+O+dMruvgPwOL0gK4ixYfQf0kF?=
 =?us-ascii?Q?LrbdvqEfJx2lqUJp7oob1Id1zlaraijFAYA2pfz5y1qSDqMkwiul/u/rrRnr?=
 =?us-ascii?Q?kCt9chwIBDHkmRZY1TvHOnWO+dmyohSDVP3tKGx2cZvj14DerPzAHQtLbaBH?=
 =?us-ascii?Q?bLpq2xe2kQqvjTV7Tt1caMOPv8X22Pljnwll0woy2KI5FbAFR9M+vJhYJDWP?=
 =?us-ascii?Q?1g=3D=3D?=
X-OriginatorOrg: vaisala.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 92e6ecb5-426a-409c-43bb-08dc9bf91ddd
X-MS-Exchange-CrossTenant-AuthSource: AS4PR06MB8447.eurprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jul 2024 07:15:43.1239
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 6d7393e0-41f5-4c2e-9b12-4c2be5da5c57
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1Kh0z47tO2UGqp9XWmNdF7hk2l+tySwdMpThbpdkBNLIXfWxoNxEqWifOsfBL3+h7zm0bUH3ZygOiwh1Ku1LKA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR06MB6971
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 04 Jul 2024 07:15:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/201521

From: Niko Mauno <niko.mauno@vaisala.com>

When VOLATILE_LOG_DIR evaluates as True, the base-files recipe provides
/var/log -> /var/volatile/log symlink which is in conflict with systemd
upstream tmpfiles.d/var.conf.in which defines it as a directory.

This generates following error in journal:

  Jul 03 14:28:00 qemux86-64 systemd-tmpfiles[165]: "/var/log" already exis=
ts and is not a directory.

Mitigate the issue by defining /var/log as symlink corresponding to
the one created by base-files, when appropriate.

Signed-off-by: Niko Mauno <niko.mauno@vaisala.com>
---
 meta/recipes-core/systemd/systemd_255.6.bb | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-core/systemd/systemd_255.6.bb b/meta/recipes-core=
/systemd/systemd_255.6.bb
index 0376412f61..db37776fd6 100644
--- a/meta/recipes-core/systemd/systemd_255.6.bb
+++ b/meta/recipes-core/systemd/systemd_255.6.bb
@@ -313,9 +313,10 @@ do_install() {
 	fi
=20
 	if "${@'true' if oe.types.boolean(d.getVar('VOLATILE_LOG_DIR')) else 'fal=
se'}"; then
-		# /var/log is typically a symbolic link to inside /var/volatile,
-		# which is expected to be empty.
+		# base-files recipe provides /var/log which is a symlink to /var/volatil=
e/log
 		rm -rf ${D}${localstatedir}/log
+		printf 'L\t\t%s/log\t\t-\t-\t-\t-\t%s/volatile/log\n' "${localstatedir}"=
 \
+			"${localstatedir}" >>${D}${nonarch_libdir}/tmpfiles.d/00-create-volatil=
e.conf
 	elif [ -e ${D}${localstatedir}/log/journal ]; then
 		chown root:systemd-journal ${D}${localstatedir}/log/journal
=20
--=20
2.39.2


