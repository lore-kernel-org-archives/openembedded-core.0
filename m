Return-Path: <Qi.Chen@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D855CC3DA47
	for <webhook@archiver.kernel.org>; Thu, 11 Jul 2024 07:56:59 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.6984.1720684617945707632
 for <openembedded-core@lists.openembedded.org>;
 Thu, 11 Jul 2024 00:56:58 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=7922740ab3=qi.chen@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 46B5DVwc020873
	for <openembedded-core@lists.openembedded.org>; Thu, 11 Jul 2024 07:56:57 GMT
Received: from nam12-mw2-obe.outbound.protection.outlook.com (mail-mw2nam12lp2040.outbound.protection.outlook.com [104.47.66.40])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 406u4x4pvv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Thu, 11 Jul 2024 07:56:56 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MuWmW1NC7rc2rybYew7h3LEKx6tsVDEt+dj1T+WGI1R+erePXdQN0nbtJZhmCKnQJOrQuu8Xf2pUkhxzL+wIvzbmmgbs+CRWy8JNU+r6/gjeR0qhQg4lTiQAQcNQMqAbBElfAQ9LsRkjWbYv+XDONudFMLyBUSb7FNSNkSlHzv7R9IJoGGw9LaMFbCD9/0DWZnpdsjUKBUxZXRhKgiTXeStRlkzxDciwGz8Qt2nq7PpbPUy9iowEU0bCWOQaYNn4INjbFmTTdQfynVzBHOf0hNtwOz7tLQYUDbUGIBuyJbTEA3T6HXybld9gndQevY7jKT3lyQhxcXZNEQ7d/bkItw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5LutVUc6LMoTuf9U0Fh621utbyZh08xXKWCRaJqsAls=;
 b=Inub0yTIdVDcCrj601kPClgjlqhL8ZtB8gbeaoPJxyKQvEYZtBulEaXqjH0vyNMwhTyuennuQLOG5CdMB7g27JbqsB72CoZmYB+jLhyqiiC8pXILKXaCpooPl9P9mAZgwPfwRLQyrl+1hZNBtZ2h/eUEBeQvshvTTHw/ljMtMB2ydTdrzOgAOpSz/BRvLtR6/bsz7BKopT6IiYp5E25/xT43KkYZ+r1QSZY1AO9GrSMFKmMEf4IINFjTNIENqYVKsdKWr/lL69+IxQONdrTO7OetzR699jAhhFs6eGiRM43LI2MdDTBYzKtWtGh7PmG3Sg1IF9nagAvmBTtLIPp6pg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO6PR11MB5602.namprd11.prod.outlook.com (2603:10b6:303:13a::5)
 by PH7PR11MB7051.namprd11.prod.outlook.com (2603:10b6:510:20e::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7741.35; Thu, 11 Jul
 2024 07:56:53 +0000
Received: from CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::a7e3:721d:9cec:6093]) by CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::a7e3:721d:9cec:6093%4]) with mapi id 15.20.7741.033; Thu, 11 Jul 2024
 07:56:53 +0000
From: Qi.Chen@windriver.com
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][PATCH V2 5/5] pciutils: remove textrel INSANE_SKIP
Date: Thu, 11 Jul 2024 00:56:37 -0700
Message-Id: <20240711075637.3023203-5-Qi.Chen@windriver.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240711075637.3023203-1-Qi.Chen@windriver.com>
References: <20240711075637.3023203-1-Qi.Chen@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR13CA0010.namprd13.prod.outlook.com
 (2603:10b6:a03:2c0::15) To CO6PR11MB5602.namprd11.prod.outlook.com
 (2603:10b6:303:13a::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR11MB5602:EE_|PH7PR11MB7051:EE_
X-MS-Office365-Filtering-Correlation-Id: 72188828-1147-472f-0bc4-08dca17f0606
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|52116014|376014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?A8UfsM7zok2l68DDgyIQZWhQY4XVdjgUd4Fip1lRcng/z57FTFIJNriFyDKN?=
 =?us-ascii?Q?/uigo+2ozknvR1YcA/ErySs48xAjAejAJhZOLhIBbMnzJ8qjcyly5H7vJW4I?=
 =?us-ascii?Q?gIaYfyAgv1tcplpn+KLrPTZgOJfUoCsdmzjD9HK+coZAJXVmP1IY66AGtqmI?=
 =?us-ascii?Q?LqkBYN8a3BjtMGPgo0/QClKAKMuCxzQyZtbrsJEX8Hn0wJY1SSeuGR8L0/9G?=
 =?us-ascii?Q?Ro4x/kcEFrMBjV7SrC0awHseh/YsblSuU70MSisd8mRWOcAhR9pp65zdpGPJ?=
 =?us-ascii?Q?Ly2wmUFSH9auYhK4w9LRyhXKxwl8Zz6tx194dMuWSbYoCtoGsIgJkW/DPhxt?=
 =?us-ascii?Q?gZoEySk5DUcKTfbWFxEgAX06RITMtp0uicIm5ssy9LRYCpcFD2pwwoNs1tg6?=
 =?us-ascii?Q?3g4RWOALpePOSrrYMkk/D7WSlu+c1zOB89SC6OXKDJdqSbC7W8culuaDs+NF?=
 =?us-ascii?Q?7C4j8mpemaxpctm1LzdgSpFfTSLevxpkafhdEelTYok8coIiHvfzR4w3QvNg?=
 =?us-ascii?Q?5KYw9XXxC6AapYJui7Ql5ZVJzxt/+Crqyt29FTCkuTQdiGoXCWDccUy1mZsh?=
 =?us-ascii?Q?byr56M+XWYkxOahNsQApKwyfJiAojUY8eemdw7Zk2MkFDcxeo3driR3uynJe?=
 =?us-ascii?Q?rxhyyiEeI2/PilMhAKRl51MbSqQu0rkHtlFB2kh6Wa9c344+RVWH8q6W4pbF?=
 =?us-ascii?Q?dnhoOO1qhd9jpYM4STSyjMHdPq9SnyWn2cDUV46N8EZksMMpsC++zbt445eW?=
 =?us-ascii?Q?16zCb4szGfzow7Yi6dV5lVPzsJJRJfTvQgpOhx3bJlgzCxxfkinj3UezzwFx?=
 =?us-ascii?Q?v6acCTc/OcLr8XR7yOGzt+AU69qLjaXwVGGB7jJwcgb/hBOtXkdi+pE64Ke1?=
 =?us-ascii?Q?6GgBT8fF7P5IhUrsTiwzktclD2m0gHkVHFCKdTjDqahAtWeCVn8gwZR7o6bO?=
 =?us-ascii?Q?7wgY6Stwb1fxP3gxnk8c0ceCoWAGjXUahQ4EpUAzpWJuNWJNKlaY8E+0Xay8?=
 =?us-ascii?Q?+1lW5tWrrrNrOUtHcjDvy0knfKtYfpHn5c5rBde98rvmzf+etHAVcH/sa3Kp?=
 =?us-ascii?Q?dkvr9rlpwTsvCoTZPJeGhdBWvMVND5DQDBj0IJlEcD0k1iBHuZg4G5XPYgWX?=
 =?us-ascii?Q?CsVXwGrBvGLT3aAzLkc8i0E5Vo+87IIeari8dAibdr/csciBkYKjXxy6MOt2?=
 =?us-ascii?Q?kgUTp6xB2i2paOqmPkD9zFOnYamLDzVZpm0O1ZR/NEVjsagifGMQbWJ0SG58?=
 =?us-ascii?Q?UuRwPPik9W1GcKEkqvRLi0znY8EKLBap7yz3Sez2J3BS3CxoEbARkZciiXHJ?=
 =?us-ascii?Q?rG0l4lu+k3ziSFDwn4FIn0lHHXwDcZWyK1EypzK7nU3+xuDR5esJyypIdwTL?=
 =?us-ascii?Q?ty7SYUPTR+iK147psmBj4Balq/vcZNLhPFtFgQySCA85QYFQsA=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR11MB5602.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?FJ0HIAdlFMokl7Z05PZnnuGjzm0Hw9bXpptHgN7XRPOI4NgzPCcwTCeCEPVn?=
 =?us-ascii?Q?UX3RheNjPsKyuUvpE3T+1KO5zSAbcZLoLLnCo6d1RTmr8UYjTls2TNVTpNhh?=
 =?us-ascii?Q?POOesLSmGKDYXnFrdL4FSOyVFghDHDGIXAwZc38clHJwEFo2EYkU7JtSOGLQ?=
 =?us-ascii?Q?RgX9feSOwbg4YwGVYX3R8LPFH++qkhYgNuogEV6UwQojm2YMEwVIHtWUFDQa?=
 =?us-ascii?Q?x3Qv09RNXUlsw1Y9nZjZ61bWf7lvODnZjc4jc3FXX+KoJQadzOaFxIzA5Ge/?=
 =?us-ascii?Q?3Y5D4ftaRQK0UX7UxY12/J2B4fL49nF4uvP5CnmuO1qZ9GKquZFtdhAOiOZF?=
 =?us-ascii?Q?gFN1Pf1u1DJo3Edbfz8R5trRR6R3yzoDU961sCZA5eRW4gw+I+/o8Po9sqmE?=
 =?us-ascii?Q?UYj4AcaQtkG+79394IG/kJPLUy4Aocew4vU7bWJuMpkK54Zr/kHvs6Zs6x9V?=
 =?us-ascii?Q?yMRxa8J5BZ8j2vqyTbk6DeEd8HvPbUJ2nt43dr/GDoSCXGsEZLMVtxr2VMKs?=
 =?us-ascii?Q?qPFub/oHdj/ERP3os9kkS4C1qiOdmVZWX99do/kRBIMMVfLCyxHyqCg2DVHB?=
 =?us-ascii?Q?IVlpU6gtaPCp+vyK2iEoNOF+zM7Zk7puR+MZmCcpfXKdPlXnn+EOkwztFBBY?=
 =?us-ascii?Q?+M8NuwZbPDVoXW2NjntKiLW7nuzP66BZTViIEjwnt10rVG1PboAmPtGkTxf3?=
 =?us-ascii?Q?jTgbl30BsHpnfWl/WN4hhf52FP3z1JpOYUY7rJ4IjkAPgB48BpXmkAIdi6SZ?=
 =?us-ascii?Q?a8hWhfKANenUa74YwK54X2pGLbSeMiVBDjkAu6irGG+MBU807XSsawx83YrV?=
 =?us-ascii?Q?6GWUFigDJBSJSQCMj+39fU3DCScibg0D5d+D9NOA409tLTY0cnjoykzHyMVA?=
 =?us-ascii?Q?0kHFnCrA/7SCBWkkQCh8K/c5Xv3aSI9YCyVTsH3nZD2s/shJA1Q7L6JZIj7K?=
 =?us-ascii?Q?OLZW2fcMpS/96n/G/Ki8kJBEFvq8uR+OMcymbO8JO9H/650sh7Fxtf2bsXWn?=
 =?us-ascii?Q?riE1Kw9tRRNbmUNV6dEorHTTel+Pl/APvmI5Eu5+MnA+kH7EHT4vw28byKKY?=
 =?us-ascii?Q?/YFioccGjC7HUSC+b+oi4/6NGpI3gSwlBH9IAAMxm2GaBE321W05fUMEkwI1?=
 =?us-ascii?Q?33w6CdoQtE+JjXDKhhnVIGeFNLttFDYiZ5zFMx/bAnuBCKvtiSwr8k8XjDnC?=
 =?us-ascii?Q?6rm0U6k3JrrS+12Sh+1FcfXv0L7mDkyruzmyAN/IPSLlFKITTBYbioDRPAns?=
 =?us-ascii?Q?8xFRModmO7QBCTe/v1mjT3okRqgSFfl8D3UrwcqtXcikpiDUbsvPISbjkOly?=
 =?us-ascii?Q?J1Txc7DpvxZwL+DjZzbzwPEt4soPYh8tP/RGRul8YyNb7QhM4O06jttqkPZX?=
 =?us-ascii?Q?G/tHBBkDtTcj79U52hnTi3TJYdm7GQyPxIoKGuyIc5c3Srv5xn/ZpYQb5AJA?=
 =?us-ascii?Q?60PK5f2XbHCEx2jmklk4Y4D4NvrWIpnJzb0RBt+fOM+PSB2X8SHFVhOp8g3z?=
 =?us-ascii?Q?V3JZUT4b4waH9F9EUNScJIXizqIReSnwdq3lZo7+or66r5W/7fNAwxG8Jez1?=
 =?us-ascii?Q?YTlrEMxn36xkxeR+Rn++gY0dhKuOdr8dyOL+DPKW?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 72188828-1147-472f-0bc4-08dca17f0606
X-MS-Exchange-CrossTenant-AuthSource: CO6PR11MB5602.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jul 2024 07:56:51.5605
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PeuiLm996M/BMYpyZKMD9rnleTXvHUr2p0v8Mle/Wwdv+D+Q9yG9GIJu+HUnPsK48WoP1rMaXFeCEtYrl3JOUw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB7051
X-Proofpoint-ORIG-GUID: FSLyP_OZmTB7oFmAEHEtkOIzU_rG7Yfe
X-Proofpoint-GUID: FSLyP_OZmTB7oFmAEHEtkOIzU_rG7Yfe
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-11_04,2024-07-10_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 adultscore=0
 malwarescore=0 bulkscore=0 clxscore=1015 spamscore=0 mlxlogscore=724
 priorityscore=1501 lowpriorityscore=0 suspectscore=0 phishscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.21.0-2406140001 definitions=main-2407110054
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 11 Jul 2024 07:56:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/201763

From: Chen Qi <Qi.Chen@windriver.com>

The current pciutils does not have this textrel problem any more.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 meta/recipes-bsp/pciutils/pciutils_3.13.0.bb | 2 --
 1 file changed, 2 deletions(-)

diff --git a/meta/recipes-bsp/pciutils/pciutils_3.13.0.bb b/meta/recipes-bsp/pciutils/pciutils_3.13.0.bb
index 0b876c7070..74edd8686b 100644
--- a/meta/recipes-bsp/pciutils/pciutils_3.13.0.bb
+++ b/meta/recipes-bsp/pciutils/pciutils_3.13.0.bb
@@ -47,8 +47,6 @@ DESCRIPTION:${PN}-ids = "Package providing the PCI device ID database for pciuti
 RDEPENDS:${PN} += "${PN}-ids"
 
 FILES:libpci = "${libdir}/libpci.so.*"
-# The versioned symbols in libpci appear to be causing relocations
-INSANE_SKIP:libpci += "textrel"
 
 ALTERNATIVE:${PN} = "lspci"
 ALTERNATIVE_PRIORITY = "100"
-- 
2.25.1


