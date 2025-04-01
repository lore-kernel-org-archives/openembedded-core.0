Return-Path: <niko.mauno@vaisala.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E7A16C3601C
	for <webhook@archiver.kernel.org>; Tue,  1 Apr 2025 11:32:01 +0000 (UTC)
Received: from OSPPR02CU001.outbound.protection.outlook.com (OSPPR02CU001.outbound.protection.outlook.com [40.107.159.89])
 by mx.groups.io with SMTP id smtpd.web10.16516.1743507111046690231
 for <openembedded-core@lists.openembedded.org>;
 Tue, 01 Apr 2025 04:31:54 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@vaisala.com header.s=selector1 header.b=pmzWJShR;
 spf=permerror, err=parse error for token &{10 18 spf3.vaisala.com}: parse error for token &{10 18 _spf-dc57.sapsf.eu}: limit exceeded (domain: vaisala.com, ip: 40.107.159.89, mailfrom: niko.mauno@vaisala.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NLuUVohXnr/exxe831B5ktmTmQOck9CRxONOFXRXi0mKzkrlCN9J9XRFeteUBKbP4NfTfrYjM/IWrC/s79pKq8envM9Mbi1S+2wbrNmBGf5nzMnYfE2nIYZ94dgtpb56TpIsQRgajFmv5OGGJQhnNbr7NTGEtMcfzKdNyL4BZT847bSW6/tYEGLlZiVAaIAwLWJvl9JzG4L9IknQIoYAQ8vf499v46G6YsgqgeKYO/LnCYWxqVIvCkprpeJwpGNufNb3RkgzK8x4rjq7G0eOHAwCKRc8+tmpYIPsj33XLgHqR9LDbK2+dS61ziIgz3YFDE6pJIzdtkj5zEEkx0g9dA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hxd3Rjf6GyJT0RKxTaf8mBa2G8SOeAgkESvH4Vh6uoY=;
 b=jYy+1dcTLsRyZhG2sQMCqxg5HU4ADArvNZNCjJ6bLtkQ2vwMRHGsS0I+t785x5EeKiLTRFcMWL50FeJEc6PeSJJTvtWXDm7vRBEy72SNYIF4HJ5yRPGCMwC1aBF8wWiyExOnoWaYWnTGA+oAUW5sMjY/5wK72ODCW3zffnyzUQPE9pmCQMd+kE/ouLI0z/Rc9XTWyZUVCJXduwKk3c3JCsn2hJrfPglEMFquvLuRnpbb4a1bChzu4BR4ZGVEvyDT3RQCBg+RM/vjpp50dAYgR39g9Tr8ocGoA2ur0wg4I2Eqev2AQdmyTZhb9Oohbw422p2kQb4tLlvcFqfBDiwXMw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vaisala.com; dmarc=pass action=none header.from=vaisala.com;
 dkim=pass header.d=vaisala.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vaisala.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hxd3Rjf6GyJT0RKxTaf8mBa2G8SOeAgkESvH4Vh6uoY=;
 b=pmzWJShRSztoykwoFF6Znl0IpG3fIB3sG54fbZQDV8SBKXt3b+eMrPfPG9oY2TEaPP4aFocZdTAy/gYrX5QQqWtzyrVURS8F9TA2YMNbgivY4hxJds6YrmoHC3/O2oStlIub/t4BtOEADMnXt7nRwsDyi7J2ycPMYEHtPFs1pBHunqH+W3NZmLvFmbWheXPKTZOSb/qFbV5Qsfo19NP/WjI8EMnPixgLyxYdKDObqOipVYs7hbtZtWyEQA1b8QksYRmEFRZRLnAX1xCmdpML+07EE7EEDO/J5GczY0DDn5xInUGMo1Me9L0UDHaNoVuFMKhytlpMe6PRCQs6sFEhww==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vaisala.com;
Received: from AS4PR06MB8447.eurprd06.prod.outlook.com (2603:10a6:20b:4e2::11)
 by PR3PR06MB7147.eurprd06.prod.outlook.com (2603:10a6:102:87::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.51; Tue, 1 Apr
 2025 11:31:48 +0000
Received: from AS4PR06MB8447.eurprd06.prod.outlook.com
 ([fe80::af93:b150:b886:b2bc]) by AS4PR06MB8447.eurprd06.prod.outlook.com
 ([fe80::af93:b150:b886:b2bc%3]) with mapi id 15.20.8534.048; Tue, 1 Apr 2025
 11:31:48 +0000
From: Niko Mauno <niko.mauno@vaisala.com>
To: openembedded-core@lists.openembedded.org
CC: ross.burton@arm.com,
	Niko Mauno <niko.mauno@vaisala.com>
Subject: [PATCH v3 4/6] systemd: Support using alternative runtime D-Bus
Date: Tue,  1 Apr 2025 11:31:27 +0000
Message-ID: <20250401113129.3531757-4-niko.mauno@vaisala.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250401113129.3531757-1-niko.mauno@vaisala.com>
References: <20250401113129.3531757-1-niko.mauno@vaisala.com>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: GV2PEPF00003852.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:144:1:0:9:0:1a) To AS4PR06MB8447.eurprd06.prod.outlook.com
 (2603:10a6:20b:4e2::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS4PR06MB8447:EE_|PR3PR06MB7147:EE_
X-MS-Office365-Filtering-Correlation-Id: 679e164c-6199-4e41-78c0-08dd7110ca60
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|52116014|376014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?Ye4R9BOO3kkO3zdfk0/dBOeG6kIcuH/3824YUyeC/KKR0uze6QXHYi5MlcgS?=
 =?us-ascii?Q?vpUuCpPO71UT21uIP+ZZU9EvEVEUDxtiBY4ixDGvZhkxE6tYeKwbDDFIDMxy?=
 =?us-ascii?Q?w5Teke39ytZt1PIajHFzu/cl9oSMBfBkbn3IYZ/dRiDAtZT0Ss6GAJr2qRwo?=
 =?us-ascii?Q?HzrmRmLWiuZ5vhFQYfoMF1Gb3iRtDRhgZWzjwuoC+oehw8t0XqhzBeJvP11C?=
 =?us-ascii?Q?8+E5eZ6Kn7RkHpnF6k0ORxazjWBgLBucV3RFp334ECzj1PtTTCJYKNK/thAO?=
 =?us-ascii?Q?65ssaOXilGtLOO3Prby9n4/Vs3VMSF5P9MK1icZicNY2bzPY6Sk4R82D0/7U?=
 =?us-ascii?Q?l+QzQPEdMoT+iMdG+i9S4GRoEIQ5l8K0X5R69QZHrgS+LMGSM4zNjW5kwIVG?=
 =?us-ascii?Q?e0/GrjnW1fHU09uKzgYOSRlt3Xs4OR+YEtBMfsEhdDGUIeG8Qh18jRrmVAGU?=
 =?us-ascii?Q?D2tisssT7XyGqzoJv+IzJhuNQJgj3Szb/Rb1eJhd0wlBYoNqfW7M/CKGwWpM?=
 =?us-ascii?Q?J9E1b1V+c+U7GYpOlBtf5ZVpHiWPq+0724eZniwUoAk7hqVrPg5jPw+awTE9?=
 =?us-ascii?Q?6E8WPBC9Hxn64U3PgkuK55WSSW11xLD5ZbGHM4T4iBr9N7ucPW0dvhpMHtDg?=
 =?us-ascii?Q?jX7LRHFy0aKI0wJndUguqGYbujwbd/iXvVZgnmnv9ljdNrYO/cN4rcAMw1OL?=
 =?us-ascii?Q?0yApZSAaBbQ9lXW/I/ZAYE3ZBrEzjpTAOEoenUj1mrMOy2Efk7ri1N+d290g?=
 =?us-ascii?Q?QjBz09fSgNeLa+ZsFN6C093wgl+hyrgN0KHW3w2dcuDQOoc524HwqY2STDYS?=
 =?us-ascii?Q?UZR9D/fp06BQlekktDlmeT0fl6Z7FBmRcsVwEEC9HGViPnOmASrmzhwUmEkz?=
 =?us-ascii?Q?W2GDfw6duJ2doAourHZKe2kgkmOXPJ7GET/hR4YTbg44Fy8tiXD1CLT4vq7d?=
 =?us-ascii?Q?rrhrWcvslLoTR1sFSG0EO9c50NNfuiPlHfif5Ibv400CcQJsNrNbDbqv2gd7?=
 =?us-ascii?Q?imflNd3PNzUsKc2r23SzEgZNnBJNPHoFpLMvgrik5Nfzfq1TbbR3+v3HK9eZ?=
 =?us-ascii?Q?vOKNUOsvcd/tC7o2lwZmCS6Qsgi225And8nE7VOFW3VanUbbKHOIwpYOem8f?=
 =?us-ascii?Q?GQicSWrlrmVxOTj4JIxWjkXAsfS4VkFthPRv6sJ6DLPyjsJijQwa8jRa6XTy?=
 =?us-ascii?Q?clIk+t06p4DkWoEQ/5mpl/4dwYYvv1PwWIwN+BxLFLcstMAUXfAA8edkVBBB?=
 =?us-ascii?Q?P69x/3vA2Syz4cIDnfpCLTAH9sXDiLvOGiQoDzxuNCeu9UGeIYdEMDZybrxz?=
 =?us-ascii?Q?crYXNhl6OuJISqxLygJOFerA0GRg7r/qjw/0ay0R/deycmNn/TOzP0ANU0Sf?=
 =?us-ascii?Q?+YkZXDts2RnLSAj15QFk0XjUCVfhzFMZg/O0MSRgv6a37Mh1k0lDOL/OqGZO?=
 =?us-ascii?Q?Ou0/mOfGkoqEEPv5L1HN2Joi/pQZHv7c?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS4PR06MB8447.eurprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(52116014)(376014)(1800799024)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?yVwQ9gpK6Yb3mpnvj4XX5DBpboVdU9lNV6/0KV9O+wfVRuJLi6D31rB1oQ5Z?=
 =?us-ascii?Q?ymaIKqlVOngSR7XKchoYjAzw5RgtN+I+2/brGCPXKM+MfW6B06mDgDoRQDxJ?=
 =?us-ascii?Q?Vi1OAaqMSvP/FAwPWniehhZxGuDvScULhWXuGo/BTVw56yQF7fcwfkQYMYnm?=
 =?us-ascii?Q?utQVX29TzK/vU/QmjnJDOExp5ZOKUMAaLXcekmaBFhvyfvzBk4RVDm9h5agR?=
 =?us-ascii?Q?oih0FXJtrYn3X8g98CXrkcC/ngRbaA+bu0YHineXkz0tP3Wq3bd3XeccGDfJ?=
 =?us-ascii?Q?4IJsjlL8PIV7iEmx36hzpCS/Mf+UPk/csr1iBPky5avyaUtjMeCsNSCxmXCP?=
 =?us-ascii?Q?gfpFXQuUHIDfcl3rTN5zgMUtqlg+wRRlp4jdcpM5DsOM9y/cxDe8jim0LfLt?=
 =?us-ascii?Q?sn+p5VIo3x0CDZes+Ygwo2Krsi77Jjmb+DcILHmnWdW53xpAVTiFTFmBAqJZ?=
 =?us-ascii?Q?/T1wY/VuPfSdpzd+HVuxeqEPdxGcnfni4nuIB3hbtc8Bp4MGMvAqcALIpAs6?=
 =?us-ascii?Q?3ibjilag3erKisSdBxbVdneLmt1neWN7nnVGHAGDIEvg088ycG53+/t8C0k7?=
 =?us-ascii?Q?zXCKJhgFlCUBOag1IpMFx8BH0tkINZ8m1lBcSqIqgcEVKKNwq+/gl2Z5jKOQ?=
 =?us-ascii?Q?qGaMFY+X0ggEqSCACJn4n8ClbNcstt9dEE8UkQ9g6Aq4PsJwYot5AcQt/RMj?=
 =?us-ascii?Q?3pz+Ym3bwhfeY5Blvj8UMPZqbaN35z5vetjKQArMaZlQ24g0bb43cQd2u7+K?=
 =?us-ascii?Q?QkQnhWWONskiH3ZI6fM0vJFwYTSaB8wy6hgSG5Hq6BWYfGGXWyE8wwI6rivw?=
 =?us-ascii?Q?wbjK2lWzSEFLTbjgUyRxK6iuD/ya1kVMFypa89K1TYtDIBoWRtrxT47oPMBH?=
 =?us-ascii?Q?QQkjImX1YFzsLDp3ye4O8VlRTQ7w7jjUS1bZjaz10T+Hpp4UQQ/Sxf5KzYih?=
 =?us-ascii?Q?gVAe0RnDxPxLD4+jg7EESsrypmDws85ewMIyjJP/IGHeocSZBNUmqquZC8nc?=
 =?us-ascii?Q?Ws/0aGkDX18SUQV0yk5uuPD6Z3EpX7R0+aGMsgSRl2320VAGTpdpkabPUbJo?=
 =?us-ascii?Q?1Dcu1UuiR0+459PwRKRl0+UGburz42nLjBUzCwpxxF4O0ZQvpW1NLZVVfrvg?=
 =?us-ascii?Q?qU3AofigW3WHExTPts9pXeT7dTYjab3OTVq1JKGhO8yMXYcdCKablrBOnIKc?=
 =?us-ascii?Q?07taubCjpXyqDGfUSY/SsesUeBkr1CDYPntyZIfzAVeJSX97Xo7uTqImB7n1?=
 =?us-ascii?Q?BlzyZmSSshHpuFcYlzA8tqbrLPrfFmNtFTZ2mSPqLrs6nz0OTvVIMGl91bNr?=
 =?us-ascii?Q?2qRP3pubANClqL2K0+pYHrdAx7zpBGyGiaAuz2JxZZG4laoL2LRw+NfF+E0U?=
 =?us-ascii?Q?AHj/i/dhVSmQDn+Dqr8NaAmSQSTfLaksxJFbOckvb/L+mEAXk+eCIsEoLquS?=
 =?us-ascii?Q?SSA8/a43kFJchcYqtJHXduEj/bm3L8F4D1Qm3Wz67KT5R7onHGOq14luYgWe?=
 =?us-ascii?Q?yL4uvll5iNyaAW6TXdOf4gOoj61OZMoMNx0JPiAaoEP8OiqnrDGpgTNWo+h+?=
 =?us-ascii?Q?0SeHuAjkPAt35kaR1eZpxizHiz8lr6pcM687TovsXI2swIABPNdPht4O6VMg?=
 =?us-ascii?Q?dg=3D=3D?=
X-OriginatorOrg: vaisala.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 679e164c-6199-4e41-78c0-08dd7110ca60
X-MS-Exchange-CrossTenant-AuthSource: AS4PR06MB8447.eurprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Apr 2025 11:31:48.6379
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 6d7393e0-41f5-4c2e-9b12-4c2be5da5c57
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3JFHWtMzx0TXWE/BYH2ZT3/qGiivSARjcNLf5+PSpeaiy2ICIxJvRPB1i6RCu1HK1Ut5CrU4drsQ0daMza6Ivg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR06MB7147
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 01 Apr 2025 11:32:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/214019

In order to facilitate oe-core users who wish to use e.g. dbus-broker
as their runtime D-Bus implementation, change the Freedesktop.org
specific D-Bus runtime dependency to honor the new VIRTUAL-RUNTIME_dbus
variable.

Signed-off-by: Niko Mauno <niko.mauno@vaisala.com>
---
 meta/recipes-core/systemd/systemd_257.4.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/systemd/systemd_257.4.bb b/meta/recipes-core=
/systemd/systemd_257.4.bb
index 64fb8fe69a..24aad11c0a 100644
--- a/meta/recipes-core/systemd/systemd_257.4.bb
+++ b/meta/recipes-core/systemd/systemd_257.4.bb
@@ -752,7 +752,7 @@ FILES:${PN} =3D " ${base_bindir}/* \
=20
 FILES:${PN}-dev +=3D "${base_libdir}/security/*.la ${datadir}/dbus-1/inter=
faces/ ${sysconfdir}/rpm/macros.systemd"
=20
-RDEPENDS:${PN} +=3D "kmod dbus util-linux-mount util-linux-umount udev (=
=3D ${EXTENDPKGV}) systemd-udev-rules util-linux-agetty util-linux-fsck uti=
l-linux-swaponoff util-linux-mkswap"
+RDEPENDS:${PN} +=3D "kmod ${VIRTUAL-RUNTIME_dbus} util-linux-mount util-li=
nux-umount udev (=3D ${EXTENDPKGV}) systemd-udev-rules util-linux-agetty ut=
il-linux-fsck util-linux-swaponoff util-linux-mkswap"
 RDEPENDS:${PN} +=3D "${@bb.utils.contains('PACKAGECONFIG', 'serial-getty-g=
enerator', '', 'systemd-serialgetty', d)}"
 RDEPENDS:${PN} +=3D "volatile-binds"
=20
--=20
2.39.5


