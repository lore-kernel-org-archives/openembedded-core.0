Return-Path: <niko.mauno@vaisala.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 77FB3C3601F
	for <webhook@archiver.kernel.org>; Tue,  1 Apr 2025 14:05:17 +0000 (UTC)
Received: from AS8PR04CU009.outbound.protection.outlook.com (AS8PR04CU009.outbound.protection.outlook.com [52.101.70.113])
 by mx.groups.io with SMTP id smtpd.web11.20054.1743516309641251854
 for <openembedded-core@lists.openembedded.org>;
 Tue, 01 Apr 2025 07:05:10 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@vaisala.com header.s=selector1 header.b=bQ8lgxjf;
 spf=permerror, err=parse error for token &{10 18 spf3.vaisala.com}: parse error for token &{10 18 _spf-dc57.sapsf.eu}: limit exceeded (domain: vaisala.com, ip: 52.101.70.113, mailfrom: niko.mauno@vaisala.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rJeZgOO6ytkDdtyaZHMf81IxBQU0eGT4UWrXz1csNHgKfzgaqI09IuJkBRLbka6L7K5GviPdF8EWBdlvpnHrqHwJr1jnfb0ev2sk2B6uPGV8Fh2oG7Rwk0a9/GNVzIkQXIwhKRvvMf2Zg+zoAKzG4xz+kkVwDPrdH0XFxZz+JvIyI9/s+ubVbU2JaYMXOP5xiQBS5UEJjxZoPjppCcVXd7SO7ntslPGaqZj09fVKdYgKNa7IfVXI4w/rnIKKziVYFx8ysPDWKfsXAtiBHSGa3nWZavD712Ry3r8Kr6edYgwkbs9SAUzI33ccpkDDVK+PhaHfoBCMkYJoHMujeEp1gA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RfUvcjfosgdjfHJVgW103R9yH/SwnGBV6HKP4YzEDpc=;
 b=IqB+12wLuDOtnpBQnWBbRf7OnHwykdvq+K1RsFg9F/jR4Avy3fXTXCcyiTNrm58jgEwtJPBNOXc1V02/Az3qebnEfdhufBt7DogwpkZMS3x0QlF0oqNoUlaBFtqB94txYNx3n6YRD2zDzztjWVBJsc9R6MFAc02+W5oDObX3vUxAtTGGmgpNBEm8UR6x+XOG3SCrp58iFvxvM1tzGz5nQQx3rjPjfaCUzppQUZgVwA/mqn+4tClh0W+PAqsHgq9lM0xMxWRxVsNM/+DqoBrIqfACEt479piOcqdzpY2zbbpguCzi8ZbyXKTZIabnpNM1EzVjWAeBmClHjN/ed5EMUQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vaisala.com; dmarc=pass action=none header.from=vaisala.com;
 dkim=pass header.d=vaisala.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vaisala.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RfUvcjfosgdjfHJVgW103R9yH/SwnGBV6HKP4YzEDpc=;
 b=bQ8lgxjftPIfnGVAY1Bm0VnOOJUSWVx1XPSxuYa03FMlzmmdwM46JSea7/FtK/kCF24fgXyt+rStmjpKGNvGAQU9Gti1smdrmmCQjUYRvLMkkTEU0SPtJnfh04O1KxyFEGB4UP9sazaEiEPDLUzMgc0Jt5Q7zIlfAgUXBTPiJhDcFCmBehv7NkU0bwK5DPDzA7ylKxVlTzl3AWkNfd5XCnDNIRONkp2Su32ySYCqoU8CFTNCW+kIVi9d8LaRng7sB04Gv7OYV5HrPdKT2ngcYG8qN6i6mQNha3tnenxb2tit/PHZ+zdHA1S6hl82JQEPu4A3Wc8AJtgTj3Klw1cy+g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vaisala.com;
Received: from AS4PR06MB8447.eurprd06.prod.outlook.com (2603:10a6:20b:4e2::11)
 by VE1PR06MB7088.eurprd06.prod.outlook.com (2603:10a6:800:1a8::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.52; Tue, 1 Apr
 2025 14:05:06 +0000
Received: from AS4PR06MB8447.eurprd06.prod.outlook.com
 ([fe80::af93:b150:b886:b2bc]) by AS4PR06MB8447.eurprd06.prod.outlook.com
 ([fe80::af93:b150:b886:b2bc%3]) with mapi id 15.20.8534.048; Tue, 1 Apr 2025
 14:05:06 +0000
From: Niko Mauno <niko.mauno@vaisala.com>
To: openembedded-core@lists.openembedded.org
CC: richard.purdie@linuxfoundation.org,
	ross.burton@arm.com,
	Niko Mauno <niko.mauno@vaisala.com>
Subject: [PATCH v4 2/6] dbus: Allow using dbus-lib with alternative D-Bus
Date: Tue,  1 Apr 2025 14:04:26 +0000
Message-ID: <20250401140430.13837-2-niko.mauno@vaisala.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250401140430.13837-1-niko.mauno@vaisala.com>
References: <20250401140430.13837-1-niko.mauno@vaisala.com>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: GV2PEPF00003849.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:144:1:0:9:0:7) To AS4PR06MB8447.eurprd06.prod.outlook.com
 (2603:10a6:20b:4e2::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS4PR06MB8447:EE_|VE1PR06MB7088:EE_
X-MS-Office365-Filtering-Correlation-Id: 40e4d725-afad-40ba-3e69-08dd712634cb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|52116014|1800799024|376014|366016|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?m+5ZWnc8oXpdrbGteA8KMZqkZNquzhhrmjAvXkya2d3XusGM6WIEmlVuwx91?=
 =?us-ascii?Q?7aHFnz8lBq51uKc9DAZQjZKj1wsxHPmx/mYtnaMRbL/UqIChsfHw8o2w+Qu8?=
 =?us-ascii?Q?RxEqsFpKs7LrCN8OQNfCp3xRo/tMCqX3rOvCvfxjMsZbicwq1l6fDH7VN1ab?=
 =?us-ascii?Q?IFGhSseKnOB6Ib7z50vCn1mAbsH+lhfYiV4zD7gRQc9UHZelt74rxKbeVsEG?=
 =?us-ascii?Q?kLoA9Q9jozcuLZFF1EZXwoH0oIvIKhAftaC5YDl6D/eOh8jtwzohM5GJnc/R?=
 =?us-ascii?Q?TU0XOnJVoIbNZ7srsaPp6R171l0cSKNBdotJp3MS6034tZgzzs6d78BcGA6m?=
 =?us-ascii?Q?tWgy4gfjgstX0PuXeFZexcaCGo5R2MJVX8lqbHRCeq7TaeXd8sR87oPsFLyg?=
 =?us-ascii?Q?M+HLE9gJfnPFhx8kfUzTOe326gNhoh7BhBfVKhqF/bKQz4byv5lQuUcPFGS1?=
 =?us-ascii?Q?lWaoR/Ucqjz0JQTi+P7D8HyJnifMVLCozrya3Sldx+kwCqTu6oULTxHaRrl5?=
 =?us-ascii?Q?LZod9YG88viJJd8cwdLeDGRED7tPf+Ant4sKVyEFjEByDjLDFjfvYKMZMIQe?=
 =?us-ascii?Q?0zOkn7j6mZNSij/hICcpJze9OfUHCr6m1Bkr5BbYiwgysqAP+eBYiu2lpeld?=
 =?us-ascii?Q?2B2s95ujfsXyUAZiN+vvH6vgO3Ca99JXQIXue4mJbojija+BtpUsKTZOQL/G?=
 =?us-ascii?Q?YQXtPXn9oX4C1Qgo6iFIPOeYVCai+NRCtoMUnSFGK88y5yYo9l3mH0PBkEVP?=
 =?us-ascii?Q?CVRtOobeOqjTS9I/FYBSlLrxjpAjjZbml1fzntTLZhEQcFQH5WdwyDTC8RRK?=
 =?us-ascii?Q?3A244jPsqtoXd7KXs6QDykJe32E2ZUo9uys8gkl2uNE0zaGrhB8pbVpHuUzF?=
 =?us-ascii?Q?6SQadiRYr3I+pMN7pOPEzXlZ5mNm5lQNshPCCMvplQ25KWU5AxxZcdciRr2n?=
 =?us-ascii?Q?jGO+/RZ0f1+TAhO9UngMsNhrAOkM4ejOqtnJ5BzJHK+xQhtlYl+eQku+fCfW?=
 =?us-ascii?Q?3hcN36jxvUAmak7xpkUjeuPd4ZQFeLYnj0GN7ZywNgyG2qed6Byskiw/XiSX?=
 =?us-ascii?Q?7r2JMOHCcI6+bKKFn6X7/0Ozg2hmszHkFFEWJmCIJLXNUx0zITxeM990xNsD?=
 =?us-ascii?Q?umFRdkQlj/iIX4tJI8OIkN3+hncYF1nD4D+ovvC+cTpMdG9KAmb/ht1hoqAC?=
 =?us-ascii?Q?2jQ4fdQKsBdS15Ljawk3RxDKAShmHJo3fi44Vyc+I+T8a1hGBNw3Zvwfk8Cw?=
 =?us-ascii?Q?UDr9bvlyJKg3R4Am+6fiF3vQX5TYrz52cMOw+2XmQZbfYtmtxgEK9wvAN2Ke?=
 =?us-ascii?Q?RM24Cs8qqLlwOSBeWnWPs+sKwrWMUkvibnQmuP8E5VU2cmK1poWisoFfRao7?=
 =?us-ascii?Q?6+/ObJYqo5YRfeAniIevY947BwiWuc/cPwp0JxkUcuEM2Snw0jD+SfEFyaI/?=
 =?us-ascii?Q?Nhe0VsluHaYgm4RzAXrAUg5ERKcVN+KH?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS4PR06MB8447.eurprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(1800799024)(376014)(366016)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?+BaSfSYAx74Xh90yDiglzAob2qQVIt16tBcI7UkTV6Jhazk5Adj4nOJBNMWM?=
 =?us-ascii?Q?4VpXDmL5Xe3yTnDekZqqAbUgGxNtKK3ZyUnWLaRGfJbyzyQOWsfwrfqpr5Pc?=
 =?us-ascii?Q?oVy5ZTU9WXvVb1v3sQncF0BwH/NbcPCHSMw8kM/8kcjEsgH6kL47/l5JUtD8?=
 =?us-ascii?Q?a3qxYTS3YW4mKQYBXo7d01jQ2ph0PV405Dfbhl2a/Uj+k8Mp6itYaRKX/Ggt?=
 =?us-ascii?Q?gBsKDWjN94fbPV3XmJwx44kJbRRxijawaEzAmoD34BbiN9Jy6pFlFuRboJKF?=
 =?us-ascii?Q?fPreQUu5dxZLe8HqB1B0u7HOtKnCU9w4UaJCukQJC1vetfAmXyXdf6KFQgOr?=
 =?us-ascii?Q?YBtHDila0gkqNkoyoU77tsJtNXN6ZiIVrNsGq9ZAVaoF9ErLbDiSTSv+y/eN?=
 =?us-ascii?Q?5M4wOSCSv9EmmBz+thB/Rs9aU9BN31DOXwzHDs12XbZtBZ3xjeYyMyStzAEo?=
 =?us-ascii?Q?/KJy4qxuwgEhxkpXkQiut+R1WIo3WT9MiG8TzqN0Ect67GKszWcl+6eEBd+9?=
 =?us-ascii?Q?4n8nUfiUJ+naqO9ZR/2XbDu+QDlGZU3QBl68r5iZ4ej597Wtpktzfs+M0N2q?=
 =?us-ascii?Q?+NtUne5D2RBHUwq30jRmoQC3jy6qhoqRXcKTyJRigqFaVzP96yfEu2DrjC23?=
 =?us-ascii?Q?vI35VywBMnHxq9cntFgKG3FpPNov5ObJqVRg9ux6apb8MkeLpHbup7RkIp6x?=
 =?us-ascii?Q?zOdC57C872zklUH3nmhz6mIyoaXipycXmHzGC1I+7zuyVwYjfIwopO2M7+bu?=
 =?us-ascii?Q?sNas0JJZzvqPqBMY1B71hxPWyCMX+CRf9TBU+vaDD0xsyN2yQ0QHPMHlEVUj?=
 =?us-ascii?Q?Y/idji5s/pgLXh72omnJ4XAzIltbsSCPva18O58SFL3Gz3sQpBS8HIK1yek9?=
 =?us-ascii?Q?u0UkSb1HU0Tj7z4MMsbPnAtwk26vfasKQpE749dVICxk3RuXXuPPgKqUc/xc?=
 =?us-ascii?Q?rn//18kQqwZFPwEDrHGZCNigFFRvgOaSW3J7rp68mkQYUC0BKT75UBAEcowF?=
 =?us-ascii?Q?Qa+wM9f35tUDBFhsc6qD1w73TKmbFbQOPePLkZcT7D0uE2SKoo1elKptJPzP?=
 =?us-ascii?Q?URrE0tVaJQ4xMa75XfMwN8EEsSLeKwdV2JFn81YHXvMft9caAvPDUqtjanma?=
 =?us-ascii?Q?bShOydCtwpt6lTV16htZz6bg3lfDcezlWdciB58IQa0rwM2ORgbhBE67brK8?=
 =?us-ascii?Q?h7A0P+k2Tn8ybafT6JQ32z3JYr0Cqx/GKW+J5dv28kZ29DRrto1q1BMp08wY?=
 =?us-ascii?Q?xAdvlYQtRBABz+LRZtd6hK9h4MfkePDXTFSfKC9LWQKt4knedfX8rEW59Bui?=
 =?us-ascii?Q?trx6L0ldgZeMnquBfIu7PxN83Bsb4ZnYztmxmrmjr69L412WQJoZtPOpth65?=
 =?us-ascii?Q?ayeXz5cFQG80hASCkkIhw1Njyrl6IcXGcWa0+v7N3EC3xO3XrPgD0JDcDTxn?=
 =?us-ascii?Q?BOi3D1ilDsNWXYYSTsxMIkxY/ZOzd31HHHqPthMbGy+i1RPTaAfh/UZEUoVB?=
 =?us-ascii?Q?7K2ytJPsqb7yjNYbplsey1BnGFVT3AMQ+B8lzXshvsq3wYSGc+3O0V5KcfUN?=
 =?us-ascii?Q?p8rGybvmrcwCm+Ge5Y1lXHCiJoYixaxMsQf4MKppbKU8PBjl8I/6fAfS3huN?=
 =?us-ascii?Q?Xw=3D=3D?=
X-OriginatorOrg: vaisala.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 40e4d725-afad-40ba-3e69-08dd712634cb
X-MS-Exchange-CrossTenant-AuthSource: AS4PR06MB8447.eurprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Apr 2025 14:05:06.6547
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 6d7393e0-41f5-4c2e-9b12-4c2be5da5c57
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LvZc+hWsEXgWXIOienR/1D283eJb3m1rnEt+ywejCJI4kpMG7s8dZpsbKE+rObUcS0I0wocNqlYucjNrB4Ft6g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR06MB7088
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 01 Apr 2025 14:05:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/214130

In order to facilitate oe-core users who wish to use e.g. dbus-broker
as their runtime D-Bus implementation, declare the target specific
dbus-lib runtime recommendation so that it will honor the new
VIRTUAL-RUNTIME_dbus variable.

Signed-off-by: Niko Mauno <niko.mauno@vaisala.com>
---
 meta/recipes-core/dbus/dbus_1.16.2.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-core/dbus/dbus_1.16.2.bb b/meta/recipes-core/dbus=
/dbus_1.16.2.bb
index 9475e55b57..eeeecde946 100644
--- a/meta/recipes-core/dbus/dbus_1.16.2.bb
+++ b/meta/recipes-core/dbus/dbus_1.16.2.bb
@@ -105,6 +105,7 @@ FILES:${PN}-tools =3D "${bindir}/dbus-uuidgen \
 "
 FILES:${PN}-lib =3D "${libdir}/lib*.so.*"
 RRECOMMENDS:${PN}-lib =3D "${PN}"
+RRECOMMENDS:${PN}-lib:class-target =3D "${VIRTUAL-RUNTIME_dbus}"
 FILES:${PN}-dev +=3D "${libdir}/dbus-1.0/include ${bindir}/dbus-test-tool =
${datadir}/xml/dbus-1"
=20
 RDEPENDS:${PN}-ptest +=3D "bash make dbus"
--=20
2.39.5


