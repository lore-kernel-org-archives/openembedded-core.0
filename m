Return-Path: <daniel.dragomir@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 11DA1E9E308
	for <webhook@archiver.kernel.org>; Wed, 11 Feb 2026 13:11:57 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.18522.1770815507659570373
 for <openembedded-core@lists.openembedded.org>;
 Wed, 11 Feb 2026 05:11:47 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=GcfEU6G+;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=6502e2c8d8=daniel.dragomir@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61B5Jpb14165743
	for <openembedded-core@lists.openembedded.org>; Wed, 11 Feb 2026 05:11:47 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PPS06212021; bh=pzmlne8lUUrcn8VPq99u
	t104ZksdcfuYzlLrGD/YeTc=; b=GcfEU6G+rOvxgpTcoMCQwbBqNzlsqNH3rCQm
	u5/vfuq85H+QI6vW2415eKXC1R/9NexDdYgVp3OXqNRelJTnyZTbKgYMyTfhthF2
	Qvx/K/66itqbTlv6cp3OlxXLgyaACk/NIG951R/XpwswMBWFhf5Z76c1QkiYTxac
	qTX1tbkaF8GQWcimy1gXp9KDiKTp4Ho1GFPOGNhdePvCTVqM+efGDf0zfBy/840E
	b5b45sHSqVRAmiHQoS4QjCMks2iywd7HmaXhjOHhRAVLVRytZNHwXcPsjf1VHVxj
	10FKhEV6lnnv6TWLFWiKE4C32Y4kN98ODiiHh1uApA4LHVi/mQ==
Received: from ch4pr04cu002.outbound.protection.outlook.com (mail-northcentralusazon11013037.outbound.protection.outlook.com [40.107.201.37])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4c61j4vfyt-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 11 Feb 2026 05:11:46 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ElpJxLvNnKKdkO0Ibm41AwxRX0N3vsM2r8cvdT1GuedJjdcmJ3d+nR2LGkdkPQ6kPkfDxBPbmtuUV4slhvAGl9UgS/XgunFv5r2JCF191bolceY7rCmtKhQ1+c3mU2/YaAKvq2fGegDTwWJNHT18ABqB6rRrdOFZCL8QwLVwFIJS1xE5udkDCdUWNyOIbS1eEf63EnRM9KoxDAWLYSBp7bSvCXXdUuktijbUMJnYOQTB3Q6cvJMJmbTxhHpp2V2JXreLiYy10qHCsoNipACRrbsMLSC4y83Upqh5iQrdgZo0gYYPAorW5Ew5AX333GEXU8lrY2seUNQxlC6XAwbGWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pzmlne8lUUrcn8VPq99ut104ZksdcfuYzlLrGD/YeTc=;
 b=bg0sRyoD9yo+3DFDTOmOmZO35p9Cr+EFssYnVUcis9274e/HhcLuzlAN9oX1nuxbFmG68NWP1AzhajE1QnzzJVSiCmgeDlkP3NV8sKLdQGlwO+R+h5EPIp/T0dXNk0VHAPq4MJq18qhyIZTVx59V7xlcroeSUoowGAqSk8Bj8UvOTihaxfijjyE5vSfLV8V85OXwScrIp2IgTEADIU/AeFpbe1BKvuShARszL5nwjKkKowBn35PfoVg4NnndlTt4bKcMrA7gl5GnIKlXnVaHbVs+MjFbmWRPI0Vx7LbVDN5YQ9TNU1FToQbdasmco+ysqjmpk6+VFyrETAANDK4FJw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from BY1PR11MB7981.namprd11.prod.outlook.com (2603:10b6:a03:52f::12)
 by BL1PR11MB5254.namprd11.prod.outlook.com (2603:10b6:208:313::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9611.10; Wed, 11 Feb
 2026 13:11:44 +0000
Received: from BY1PR11MB7981.namprd11.prod.outlook.com
 ([fe80::f002:6d1e:9df4:52b1]) by BY1PR11MB7981.namprd11.prod.outlook.com
 ([fe80::f002:6d1e:9df4:52b1%4]) with mapi id 15.20.9587.016; Wed, 11 Feb 2026
 13:11:43 +0000
From: Daniel Dragomir <daniel.dragomir@windriver.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][PATCH v3] wic/engine: error on old host debugfs for standalone directory copy
Date: Wed, 11 Feb 2026 15:11:20 +0200
Message-Id: <20260211131120.2502404-1-daniel.dragomir@windriver.com>
X-Mailer: git-send-email 2.25.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: VI1PR09CA0146.eurprd09.prod.outlook.com
 (2603:10a6:803:12c::30) To BY1PR11MB7981.namprd11.prod.outlook.com
 (2603:10b6:a03:52f::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY1PR11MB7981:EE_|BL1PR11MB5254:EE_
X-MS-Office365-Filtering-Correlation-Id: 58231064-149e-46ca-49f3-08de696f1a3b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|1800799024|376014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?dplm1Ghs6C/JTELbLxHJw+hdAST1+fc8bJEgBJlXDs2c/n2YusQ851mW+a0f?=
 =?us-ascii?Q?7r+V2UgMKhbYtV1FnjAPN2XxrTo6IATqNkYyBxgQOtQnc7lXChwUMuKITZDL?=
 =?us-ascii?Q?ccZhPEA/iZCrAoSZ70xPMIaqzaKoEIoie4ZCXup+KBk7InG0jdk0dWJzCxbO?=
 =?us-ascii?Q?EDYdiIenvPNK0mK58JNQhbCuSlxf1vqBvLQbed5e8+Nl5uq2XRHuQeHf75MX?=
 =?us-ascii?Q?3e4Nn3EYuMixjfPaly7qjIlQOlULr8wpuhu4ivj0NKJbqqZqaPWa3u53rQE+?=
 =?us-ascii?Q?CMtsAeNy+ecSOj8YepaJY27lKTdweedLz1l/A6LwG7dlISl3+6RCqPSPRs9u?=
 =?us-ascii?Q?FbUx7KqqqxmWcEov88ACL1K9nqHSOrST1tMcuQMemaIclQt02M/iRrADJlrl?=
 =?us-ascii?Q?BSzeTkGENAyH6/QYqHhYiQGr2uqbkfalBjqsbomcY2CszVsz+nEc8Q4/AffG?=
 =?us-ascii?Q?Imn24/R5bhBFV6rrayiKQhS2qWmgxDcWo1WkQFWNbxkXqqhsUfJs2bIJuYM8?=
 =?us-ascii?Q?11lBR6Cfc3RgIYRdNPTWpngLNtAXHLY8C2yTESAgyUcjP/3WQNy/kRMl8ahi?=
 =?us-ascii?Q?NuzFJixANvIROgORS1Hw37FEFeG24cXOmmqgvEOqKexFdMGm2WxLT227tK+y?=
 =?us-ascii?Q?gEq2+RcIvE8+aCUfr5G41jn8j0VNKVIr12tQ1Gz5FmkbvVquqydTVBkHqeQX?=
 =?us-ascii?Q?IkyABos+bLdAlo+9k+RSEcrxsgtdxPoMTsGG4abI6H0kJGy+9OGXSVDowfwH?=
 =?us-ascii?Q?H+JMxPz99xXQXyeZRfxBr6PeM4znaaRGAl5hyWtF/cdTJqrhPYobMFo3pI2X?=
 =?us-ascii?Q?APK22NVI9L7I+dWrIyZIoBP3lM66JbSwSrFzJTVpVhsC7xuLcFu6ksHdvgwN?=
 =?us-ascii?Q?43sLrvQNTq+IRVhi/H4IRPEj2n4CCljsGE8+NKnkfqPRhmF0Rse4lqQh10M4?=
 =?us-ascii?Q?B46th3LUF4+3TyfS/8a9I3NNvdeoKxLcaLOy8xMllyCPS3/l1GqMKpzHJSWt?=
 =?us-ascii?Q?QqYzqYfrSmzXS54wg5pRepqjY2XExVlaRe4B4DyaKyFRxpbgEuJ/rvz+Ymuu?=
 =?us-ascii?Q?9MZFd3zqPtUsiRa1M+8qkMs+ip7KtOMBnFwZtz1UXv3fG7wuQqpMGvRum7M0?=
 =?us-ascii?Q?LKOqtA1jwtbZwpSyC527csNL6F1gn6Ix9nHwDk3FKqoTWi9Ss8WGIoV1w1wE?=
 =?us-ascii?Q?dZz18H5pFwCsZEnX0dzJI6HwfG//GUSXCKKfz8SOE9cFVar/+/wxoKZMypRI?=
 =?us-ascii?Q?Zkg3tuFuG0mXv2qE0sdGawct8X5zcDFuZWsR8WnGk2nfD4jNOwlSCbZXvqBr?=
 =?us-ascii?Q?h7y0aIxAYVsipL2ZS9g+HKL9TQWlOwlWm2uaFk16I4NV61KCyV+HWRFYq0OO?=
 =?us-ascii?Q?sOMHOU0nRwtELDjWb5S4Jz8RjlNRipR2zmQOZCi7oqBz6v819SWFGEl4PQlF?=
 =?us-ascii?Q?Zjn0NhvHx2ZSQUhdqtE4Iso+JKx16oEHfn/PQYcFIeftbJ6san1g6vyUND+w?=
 =?us-ascii?Q?GCtvb1RLi8TyrDm23k4/hGwJYF2DSKBpvSQDqYwRG94S0MMNv5T/RF47njOi?=
 =?us-ascii?Q?dOwhx8LYk5oVbBMOSASkMHrovovhhtNiJn7UyUlE+6TuxAwRA1Q4WqOS8xhk?=
 =?us-ascii?Q?KHmvT9lAHJW0/70UGfo3FtY=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY1PR11MB7981.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?dP+uUjvHHS7GS/IUZD6pqb9jYthBQuFQF8owwNZpFDnOj07iRSV51f/7Vb1f?=
 =?us-ascii?Q?lxlUYC9GYUikc+1CyYIw8QnrG/x193hgsW8b759aKTwC37MTUwvJc7S2dHLu?=
 =?us-ascii?Q?kDclHObMEBU+JDy6OUhQPQKB/kyeOf807pbAcmKSg+217zkW04D77xzJYp/U?=
 =?us-ascii?Q?mwNzgQrfGXXhY6JEKe9o4aRTTP79ry7Rt1nYpKubqeID5Y6enuiDMp42oXtd?=
 =?us-ascii?Q?7t+o5ZO9QQeRDr6gfWGj6JPBmo/9JvKJeMwjJT9nYtogeEauhr6GQ5kahEsW?=
 =?us-ascii?Q?l1k5ZcqNQMJyBfz066fos34dXeIJYh2J8scdBPkRDnIhuyTac5hHJWqFDBrx?=
 =?us-ascii?Q?QnS1X4t3MIpAPc0sJ4XsF4gPzb2OI7fch6VCcfCRTMufah7p1f7Tw0moVDwi?=
 =?us-ascii?Q?GToBZXtI3lTNewGa/kJdb7qWH8V5bgkv2mql5An9/GMGegRUsPNKQpkyWXyS?=
 =?us-ascii?Q?BFo1Rd1fbIav0ujOA4911erlahAGQtJHGThesM2k928KYrhBkk5qt5LTvkEW?=
 =?us-ascii?Q?N/D7Fhc0XObFB/gtXw8YWZDV9ZPnQ4XI/xy/jZgeoWS++kjuhyaem5f8oFsn?=
 =?us-ascii?Q?KGFnFYB3vSkZGKikRnetirULXuSolVYjzFFK9Jw8MRha7xxiLrccX+PxlDzB?=
 =?us-ascii?Q?JV14KbJ2xjuSI9vLal0v9tCLmlEyyRKmIkdWCAaQe5ODwNS18hnoEvM13zur?=
 =?us-ascii?Q?k6hTZBx4pFN5wLc7zYUWxSeQbcKnq4LIRm4eL1CEne4+LOchZ+MQNCCYrtWX?=
 =?us-ascii?Q?7ok1M6Y+MTzPeew40OYEDP2UxUdTGT1m9/dCLN5858j8rsHIxpM/7vQnKUxg?=
 =?us-ascii?Q?2D6UMHxv3nLf0XdaICne0g7Dwofk5fL6r4PGtcjdu88JEVha8flIMQVbJtDs?=
 =?us-ascii?Q?fvmrDzQfKgYZ9xF0lnoYLg+RJRbwrCsk33hxsCEnBGZ9NufDS/JY2VpQl/7C?=
 =?us-ascii?Q?q/30UA7V55FtUSYt6J679QTL4UeevttfZ6kmP75rhs1rMi94uUU9g7es3F86?=
 =?us-ascii?Q?4n7hOQwemMEqVNJkp7BvQU93tM6RG5ZlXkPJE5Nq0Mcf6znF/RJ7XwiuJ/cL?=
 =?us-ascii?Q?ntexEXcIc+49D4ubEyhrWVa8UKbLgJkICAeNX0eycB4gdA23x0kew/FMxfQ7?=
 =?us-ascii?Q?NTzXfiLkOi7qbh/bbuVAUvzSedxwv2/uYdBGDxATAqzHo0ybt/hr9HILPJT8?=
 =?us-ascii?Q?Fh3iD+SCpZpPCvU8SbMY54vprYNRisUd2uYZp1kXLRUgRvnpPy22RIgzJbeL?=
 =?us-ascii?Q?SSwRfgY6Z7i9ouKC+yjgVxlSghMqH86t+lmW3r/rBwMx+GMmBszBXzVABNZD?=
 =?us-ascii?Q?1Z7jreahX7iTAFg9H1I2pb6+ci1KK7gnlZQ2GlyiXpYTkUu9mR+PWwvG01Bm?=
 =?us-ascii?Q?/LQITRwRI9Z6Z2YD1HJX9iJvPrizam8fZHpXtjTgUrXgZxIDGC9Xxt5pQZr5?=
 =?us-ascii?Q?xm5anGYGkT64gDnSlvWzkxx2pii7Xh2F3mF06rujTegPNHYOaXHV7L9e7Vum?=
 =?us-ascii?Q?3xOMhEdOc9VhKe19V22qjfdg3jYXgybsbAVABp111CIONnZnakrq9st+Tcj1?=
 =?us-ascii?Q?iz4+eMIIA0e2OwykXoDSZEc7YtF7Q1nHrMqEFWjWFigOHZ+xAuTvjPO2rdwD?=
 =?us-ascii?Q?72iM1QebL+PwwQUNDjXoXffzmwGpS+zqU9pXv881msxQOxzC61661obeWo2d?=
 =?us-ascii?Q?c4A2lRHfig9iWzvJ7fJ+krwC568ekj7sxXdzioHlkbtAAHdnPZH0qvGVUpgY?=
 =?us-ascii?Q?g0bIK2IGV5O1aw37ZGDaVMynHdmDkYY=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 58231064-149e-46ca-49f3-08de696f1a3b
X-MS-Exchange-CrossTenant-AuthSource: BY1PR11MB7981.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Feb 2026 13:11:43.8759
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Aya3iH95fsXeGIRS2K+VfFPPP9STYIWp/+MjGnl4WLe7cdtbFn7leA7lu5EY6lX87nukGUP0FktGO/Cs5kXBe2E2GNyLFpoMv6U29E3sObw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR11MB5254
X-Authority-Analysis: v=2.4 cv=Wb0BqkhX c=1 sm=1 tr=0 ts=698c8012 cx=c_pps
 a=ypQUhvKNp2hcSTodc3zn+Q==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=HzLeVaNsDn8A:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22 a=t7CeM3EgAAAA:8
 a=eUBKwln-REtu_DbdvHUA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: -7LiFuaeMbSTJqvXdqfIX2WYpDdfvKwX
X-Proofpoint-GUID: -7LiFuaeMbSTJqvXdqfIX2WYpDdfvKwX
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjExMDEwMSBTYWx0ZWRfX3oKyL4JEhmJt
 MyL1zKwsnvc5/uQcdgwChONzMcAIkPmW4S7Tr5PTNXXbXDshL+EFnYvAkDkjykr4NADTEKZRz+D
 Bc4AZJPBVC/5xuRoBDQ7pdffac2zudn9zAmI2IAyMs9aGWGOdD3dLqdYdQRKB7UIWRGfJUmtmzw
 0NFVtmkjpsDmjfSG+ZAbWAy9K/mA6OQR/sb9GACNnFE4xKV9L6Dgv7f7sMdtTfkNvcg48EphMah
 xYxAWylDDvcIQ5nV9FUejHop7IGOQCRaUpoIW+MyaDvsLooIYCA7bUinUoaDaGKv0hH0k51kFxt
 +r1TY9tiCvejabvp7oRemV0UvpAUGu1GluHj9cfUlxM0GOmtY4iDBAHJQDNdpe/t/DtLbFOoiOV
 moy7HFC379ZKdFfMRkYAE2fvxT0QA6Us2DF1/5Hdb6wYxBZTbaMeko4jjC5+INbTlIz4hpSuIqg
 0ZLd0iN1PuRDC8mrScg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-11_01,2026-02-11_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 malwarescore=0 bulkscore=0 lowpriorityscore=0
 adultscore=0 clxscore=1015 suspectscore=0 phishscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602110101
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 11 Feb 2026 13:11:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/230991

When wic is used in standalone mode, it relies on host tools such as
debugfs. For directory host->image copies into ext* partitions, wic
uses scripted debugfs "-f" input with multiple mkdir/write commands.

Older host debugfs versions (< 1.46.5) may behave unreliably in this
mode and can silently miss files. This does not affect builds using
debugfs from OE where the version is known to be sufficiently new.

Add a debugfs version check and emit an error when an older host
debugfs is detected. The error is shown once per run and halts execution.

Changes in v2:
- adjust the last working debugfs version to 1.46.5

Changes in v3:
- switch debugfs check from warning to error

Signed-off-by: Daniel Dragomir <daniel.dragomir@windriver.com>
---
 scripts/lib/wic/engine.py | 29 +++++++++++++++++++++++++++++
 1 file changed, 29 insertions(+)

diff --git a/scripts/lib/wic/engine.py b/scripts/lib/wic/engine.py
index 565a0db38a..8ca8ed0dbd 100644
--- a/scripts/lib/wic/engine.py
+++ b/scripts/lib/wic/engine.py
@@ -220,6 +220,34 @@ def wic_list(args, scripts_path):
 
     return False
 
+_DEBUGFS_VERSION = None
+
+def debugfs_version_check(debugfs_path, min_ver=(1, 46, 5)):
+    global _DEBUGFS_VERSION
+
+    if _DEBUGFS_VERSION is None:
+        out = ""
+        for flag in ("-V", "-v"):
+            try:
+                out = exec_cmd(f"{debugfs_path} {flag}")
+                break
+            except Exception:
+                continue
+
+        import re
+        m = re.search(r"(\d+)\.(\d+)\.(\d+)", out or "")
+        _DEBUGFS_VERSION = tuple(map(int, m.groups())) if m else None
+
+    ver = _DEBUGFS_VERSION
+
+    if ver is not None and ver < min_ver:
+        raise WicError(
+            "Sorry, debugfs 1.46.5 or later is required for this script. "
+            "Older versions of debugfs can make directory copies into ext* partitions "
+            "via scripted debugfs (-f) unreliable or broken. Detected version: %s"
+            % (".".join(map(str, ver)) if ver else "unknown")
+        )
+
 
 class Disk:
     def __init__(self, imagepath, native_sysroot, fstypes=('fat', 'ext')):
@@ -334,6 +362,7 @@ class Disk:
         if self.partitions[pnum].fstype.startswith('ext'):
             if isinstance(src, str): # host to image case
                 if os.path.isdir(src):
+                    debugfs_version_check(self.debugfs)
                     base = os.path.abspath(src)
                     base_parent = os.path.dirname(base)
                     cmds = []
-- 
2.25.1


