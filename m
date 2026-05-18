Return-Path: <Qi.Chen@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 99411CD4F3C
	for <webhook@archiver.kernel.org>; Mon, 18 May 2026 05:56:38 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.2312.1779083789345473790
 for <openembedded-core@lists.openembedded.org>;
 Sun, 17 May 2026 22:56:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=Ij3ma2qU;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=9598bf1d35=qi.chen@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64I22jlA252669
	for <openembedded-core@lists.openembedded.org>; Sun, 17 May 2026 22:56:29 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	PPS06212021; bh=2pkdhY2S5i3DvnGoBWkNQEQy/fPyGL64cwnt29YgS7g=; b=
	Ij3ma2qUCw5TPdp0yBQ2Hh5nMKEznpTb5R2OQHst49ar8yKvJIDvfrC8Vzrt+pnP
	VzTVdMkSrNYwWB7364MT3FWvXDPoUTrZRWKQeIGeFyBDV++/er83hwSdQeYRLdLG
	qBNwsI/oXl/AbR9QvGakP4epuCcbG+oIz5sqTSpt2tizYg/1utoyqVyA0Hmuz2Xj
	+pQ4DqbzJqsX525R3ghOdG4SiP1oRkpPqE1gtF6mF+Ocwaokkduc1RBtaS4RCWI+
	c5JYLrsIT6S4v9c2LRv7gxekUCOoBj5KmFaZHaRcO67nQgJ8rnH4iCRapvWUWHx2
	vNTgGXNt85tquyLgtA15UA==
Received: from bl2pr02cu003.outbound.protection.outlook.com (mail-eastusazon11011009.outbound.protection.outlook.com [52.101.52.9])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4e6r3g9bgk-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Sun, 17 May 2026 22:56:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YRn3Z8AmtrZuz9IS4t8NM6nZ5TA/Ju34BnFRyg4EoeGBkg85arLtpS8Smgh8SQl096WP43CN7Qr6bFW/G7zGfU3FpOQSyJwrDBPfulE3qZVAyCecxKNQe/R2ySbQfOqbOfzlWLpUiIcfP2exEO4CufKoxLgEZZqo8eWkoDQ7BQ6XbZM1qZhqp8cBTXcra8WjiLNCv+QgJp4pXQfBGqJZ48wo82bR2+UaebKxBqNR4ZFSCmuSGjKDyryhdEYM3rFOtQAo8gqEPUEO3eLYPHJxOgI1M/D2Yil1Jcul2XiMN7n41bDTlOYFBDpPQr0sK/YRP08lqU1vJHQEk3ISSvXC8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2pkdhY2S5i3DvnGoBWkNQEQy/fPyGL64cwnt29YgS7g=;
 b=huYuR8cBglB29+eZFI0l5mcu5w/5W8JOvXb07TZ7T5mvQgrHcxHjBqyv9m59Fi701ujFvsI75WpgjDaa7GkiuFk92HiRh3exqpMDe68+VNQodL0Cjb4+N5wTXrVI3xRW4Zc76RB2XUOPOC/MNJ2a3BceKayWU08PF4X8zmglno+Tyyp6FKIYGCu0QXUSU5DjnynxnWFXVG0v7rzmWEGoPkFMBy8tHTJffHNvBdY064bFQtfwNl6t4/y8PP+k+IUMEPyVGBlX8GVZz3RAdNYEzFjqOteGOQlkFGImmdEQdi7nYQBzVQeFO2cyjlhwfYB6hWyOPuH0hsoXgM+ZY0QIfg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO6PR11MB5602.namprd11.prod.outlook.com (2603:10b6:303:13a::5)
 by CH2PR11MB8780.namprd11.prod.outlook.com (2603:10b6:610:284::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.25.22; Mon, 18 May
 2026 05:56:26 +0000
Received: from CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::5ad6:8f90:b01d:2c62]) by CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::5ad6:8f90:b01d:2c62%3]) with mapi id 15.21.0025.022; Mon, 18 May 2026
 05:56:26 +0000
From: Qi.Chen@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: alex.kanavin@gmail.com, randy.macleod@windriver.com
Subject: [OE-core][PATCH V6 6/7] util-linux: inherit upstream-stable-release-point
Date: Mon, 18 May 2026 13:55:57 +0800
Message-Id: <20260518055558.3982813-6-Qi.Chen@windriver.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260518055558.3982813-1-Qi.Chen@windriver.com>
References: <20260518055558.3982813-1-Qi.Chen@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SE2P216CA0186.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:2c5::14) To CO6PR11MB5602.namprd11.prod.outlook.com
 (2603:10b6:303:13a::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR11MB5602:EE_|CH2PR11MB8780:EE_
X-MS-Office365-Filtering-Correlation-Id: 183d4e5b-a332-40ec-3709-08deb4a232c4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|52116014|376014|366016|56012099003|18002099003|22082099003|11063799003|38350700014;
X-Microsoft-Antispam-Message-Info: 
	8CyhvA/SUXuiumDh/FeiA+etehl8ueOE3xpQbArrFbaV6vG2ayRLpPBvnxeGS08wVafUrzXuvOzpZ++y/IQYMqYUwrGQd/H4oTTFrw2Qud7ot8oG199u8Nunk/KwiqdwT1PA440iBSccumC85N9W5lSRK9yS+hzDnFAZgD3FljpH9R+vjDwiAmvpoEysjN0o5YvpiGyyymKwSJnjtknpeZdLun2zCtb/oYr8DOA+SO/00C/9yEIjldjt488mEJA9swyfCCpAkaUQY7/zypPJO/l//ri3KomgpmcbNo5qV00A7QmPoxzBrPf7riZXskTnx47F0gt1K+FsgSBd7SkFd92MDDLiy2GiWEckrDoqM+lv7HY6YADQVdAgw/gURZVx9BSOPUfr5cKsTzwDRdpMGXhXOzoM6SM9k9hk7fWl7HZKRsXi2tCqxW7gDWqarBJJD/UzXglYKgGjNOnLPgyUTm3BqLdAk0CvZhjtMIbLydZpTbnuxRLh6nepT1BBB+270R84wWCySbzFDIw+gYk0/DoqcXd+6VhIRmSruoQnVyfpZ771geTciUGpSeW/MrgToXKEAldLE+jgJdVt+W3id/uz3gztsNi7mDr2Nw+WifUTCNxz5bUG4QOFqrAPkhcEhDeuHu4JEJnC8vcg8qbO977OX3mhbS5/yh/JDBeZCgQRDB5l3AlKdU8wP6Na/4D9VWx+FmVJWz4brOLmRypRBnrQHzSLhW45pDyUqPvGt1lnVLNrc4EB1UkaOOaJfpuG
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR11MB5602.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(52116014)(376014)(366016)(56012099003)(18002099003)(22082099003)(11063799003)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?/7wHRQaeIsTq6exLtSYUxCtm6kAw1/875DItCMOKKyQeAGpKBZVvgPLB1F/X?=
 =?us-ascii?Q?XOX9hvctuuANcr9JAyNPtyNR3o4F18udF6MF3OEpZHBYkPRCd31+E9X/B6CE?=
 =?us-ascii?Q?9WLlLoENxp6EN5qqPvMxZF3nyClB6m4InuuSm37L7SjM8KTVb3CzwezfzReY?=
 =?us-ascii?Q?iMZ49iEBwn1HVK76UMApH1zAi96B5XrrBhawyb2u2R25idYtWdJy/RZzHqrZ?=
 =?us-ascii?Q?CHy+OU9QeswcDdvb2K846s4SJbL7fGUQT1S/UfXr16urymScZU/dubVC6Aqo?=
 =?us-ascii?Q?WmQeyDud4OGWO7KeXYmugEl+1y0gAlu0GKjNP7KpDDJOCkgJXhCbIVULIDbS?=
 =?us-ascii?Q?O+tF8XPVFEQNGtbQzJuluEKBmXONSt/l7HZNnSG6yJGnTliQqNp53UB+4tSj?=
 =?us-ascii?Q?+D7M1LNdFEmNv4KQb3eojhrjWvPfScoEqWiWbYZVqv5qRJEvn5ZZyWmxDVfZ?=
 =?us-ascii?Q?HYcaFHgfBNa8PfN+ZFgFrasBB3M0/p8kajBOjZ2173dgzBVYN7aYGxBC9QwC?=
 =?us-ascii?Q?Sabe9Q04cmx4LcEWMbY4/HZtzPANtMMlqUtr2jjRRpX30taHUV3dqnrGVUSi?=
 =?us-ascii?Q?u4y2cdvQwr2KUxMYUPKv9fzU+fvgkPPJJ2fuKt6WxX4TtZ2DZvqY3Je84cAv?=
 =?us-ascii?Q?oDdh4jPNAp0Cv9WimTuuP/A3N9y+dx9r7PhmRUSnidVvv8IGZ8AEszbWifUj?=
 =?us-ascii?Q?ebuK/hoyHBvWEDZ3kAKGNVPW/c014fQtorR9uE6CB5e3HKpB3UpZmRe/1lCK?=
 =?us-ascii?Q?dg7tgArgm1F7DNHR7wB05dPRFK5Z4niSRV4MiJ8RUXmTvkCrdloEEudlKVmn?=
 =?us-ascii?Q?B9sv8r0P91Ntzeke1xTKgWfY2gm36QT9xNQ66C242LxLkxah3qn4MKO8Ai7d?=
 =?us-ascii?Q?haxc/lag9ic1K7pPkw/szPeRBbLGCNe7BgoYApddAmbYJQBXwz+zckoLAn9j?=
 =?us-ascii?Q?C8vnhZ+MIqrDoE66gTlYL8P9aMivXLLAUmlIlr+kMz5YTUuiY9Yh41i+czcK?=
 =?us-ascii?Q?jGDKg+65SMIa6Ipt0yVC+ifOOpdrtgC+z+6P6xPFl42RAPkJAkMFCORLC0ot?=
 =?us-ascii?Q?SHR2XTqKjtwttxSZ7ITpX2NbwNTy3JYkruSJ2ksg9sacJDYjj1vJ7HlGR7VA?=
 =?us-ascii?Q?+2zokOzICIM7LZWKBflKWYBmOP3ecBWeSsN3lJYrloWaNLft/AwUfG/vXiJc?=
 =?us-ascii?Q?U1MW7SfWqzEjV0eXjQHTU0lx7nFPvj6rbE5H5e5Wya78wOdbRkE4eSBvgutO?=
 =?us-ascii?Q?cnUZ/a/cIYcVq4yYMHQnyqidi4UZGGwR9/WD1OCpbpWKmugaufkPO4l4VTlu?=
 =?us-ascii?Q?zyKhdp7a/V791p1D4eBmkKdZf8bpijFNGqExTGnIx7KHWXiHSGvTGebkIxYc?=
 =?us-ascii?Q?kVUKI0FvXX3xgMzSS1WLUGCCexh8fmAyOtCmGtPVpndsEn07jS/mVgHqKCki?=
 =?us-ascii?Q?/oUDIZPuQEqJv01oi4LrLDU8jGbKbOHFqlGKhuiGnGEw1DhpUQjiXzKISjl2?=
 =?us-ascii?Q?Ugquxlab9KgQzmg7Gtb24ptg7/gu+zni9Yg0IMUO0N4Ns+3WDY0Ej8468ixO?=
 =?us-ascii?Q?LFPXWbDWJOem13S8jTKsXjhsurCHbdfK9mkxFjmH/+aJz+c1ATr4ongu357h?=
 =?us-ascii?Q?A9Yoq1Brj6Zp3bEl3ko0LybK+bjtBfDRwWPt09R7hOswZ7aczgPW7J6QRzAw?=
 =?us-ascii?Q?St9cg3IS+CtfOY4APVkZtUrRu0qfnBXEW+kq8dPfCj8ogKthpQBn/a2PJ+2R?=
 =?us-ascii?Q?0BNuM6Locg=3D=3D?=
X-Exchange-RoutingPolicyChecked: 
	lnxq2l1hKA62kor+th+wrdWdB+0zLOmG/MZjnxKytEz0OyhlsbqBdk4ZzjwunTNrDs5E6GzPX9Er9iEaeunrvad4KYbWwDac8lTSmAJ8P7+IAT09UpdTNgZmCPO77lFUC2NQWeYClSWCKTbOAJQfQOYXcHAA5plLcbgH6376AMI2Hksk4Q1sSburVsVutxZkICGIp++Pz3/caa7VzGJ8jY60leJK+3kYZ5X0wkyz6bTGo6V/thqeQNypDVEPwoDKLDKkk8CzRqQRVdRbdjdOvJwgWcaJgvtDvO9bCuVpWornQBbD5c/poeFTZg5l+msFroPOjsXDZpR7mlytJqpnRQ==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 183d4e5b-a332-40ec-3709-08deb4a232c4
X-MS-Exchange-CrossTenant-AuthSource: CO6PR11MB5602.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 May 2026 05:56:26.6145
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HRP4Z2WWxIa34DIyKvE/0t0kWNs8I7cxu1cPPeoyuR5VQdebghc8MH5FUOL6UMeAB9/2zaXa4zBoTVPJqcgh9w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR11MB8780
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-GUID: a0XCv8TCTkh59WWiP-x6JETT5VB3Cswc
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE4MDA1NSBTYWx0ZWRfX+Jy9cfd1wwfg
 zTvUDZJsdgbd1YWSB30GnR8VEWNtMX82x3AyL2M+4YzNgo2crM3oCNA3DxT5zgkKZFX+qpfdISy
 aH+xTwClkLoiQ5bjCC8ZExHrrmMHbB0/nvWmUJqSZ217zoBl7gjnR+i6KyqhK2g0YmL+kzBoikg
 PqCC3PahOWFi/vzyEm0v2wc+6n7V1Zw4HxSRJofG4YEtq21pla1DIpFiazfaSXdCMqVwLfgxiXB
 finPTMS3U6e/2S3VtGBVMzTygAqqccFXA8y52koub6wH/Ooaw8p0TMXJqso0zJGG9grTlWPa1eT
 GC8r7DIAy4u650Hg2araCkeA1sAzIrEAxRF3FlTyF3hwpBfS7cSguFx9ko2AdSTamRCSHe/VV4D
 KvxE1vxnX/EC2Iy96vplLHduSfjTftBkbmddmLYscvLtwWvr7N99F4A0yhjB29HUmSFJJSwXkLj
 4Fv15hZ5KhbtUdY8gxQ==
X-Authority-Analysis: v=2.4 cv=I45Vgtgg c=1 sm=1 tr=0 ts=6a0aaa0c cx=c_pps
 a=kBTuJkHEWKOaoYTOH1TR3A==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=NGcC8JguVDcA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=iKiJcTA2PjBS6x5JeXcw:22 a=NEAV23lmAAAA:8
 a=t7CeM3EgAAAA:8 a=pmzwAjFSpYc_cExjFc4A:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: jmLx9AB34xo7MSB2Dv6D8hAUvZakLoS6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-18_01,2026-05-15_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 suspectscore=0 lowpriorityscore=0
 adultscore=0 clxscore=1015 spamscore=0 malwarescore=0 impostorscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2605130000
 definitions=main-2605180055
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 18 May 2026 05:56:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/237200

From: Chen Qi <Qi.Chen@windriver.com>

util-linux has x.y.z version scheme and the bump in z is a stable
version upgrade. For example, 2.41.1 -> 2.41.2 is a stable version
upgrade.

* Evidence

  Its repo[1] contains branches like:
    origin/stable/v2.39
    origin/stable/v2.40
    origin/stable/v2.41

[1] https://github.com/util-linux/util-linux.git

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 meta/recipes-core/util-linux/util-linux.inc | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-core/util-linux/util-linux.inc b/meta/recipes-core/util-linux/util-linux.inc
index 0235862666..1068e24b76 100644
--- a/meta/recipes-core/util-linux/util-linux.inc
+++ b/meta/recipes-core/util-linux/util-linux.inc
@@ -25,4 +25,6 @@ SRC_URI = "${KERNELORG_MIRROR}/linux/utils/util-linux/v${MAJOR_VERSION}/util-lin
 
 SRC_URI[sha256sum] = "3330d873f0fceb5560b89a7dc14e4f3288bbd880e96903ed9b50ec2b5799e58b"
 
+inherit upstream-stable-release-point
+
 CVE_PRODUCT = "util-linux"
-- 
2.34.1


