Return-Path: <Harish.Sadineni@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A1216E92703
	for <webhook@archiver.kernel.org>; Sat, 27 Dec 2025 11:33:47 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.6436.1766835220753582624
 for <openembedded-core@lists.openembedded.org>;
 Sat, 27 Dec 2025 03:33:40 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=XzJP3qFi;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=44567337af=harish.sadineni@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BRBSdeE1086363
	for <openembedded-core@lists.openembedded.org>; Sat, 27 Dec 2025 03:33:40 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	PPS06212021; bh=zhLNl2NSGvJNCOW6F/zLd57C6NnLEpqpxLX8nnx0XvY=; b=
	XzJP3qFi57yOnmoLnxw0gyn7Vr+/7MO4GrhEdzOFxmOF8Rjh9Z7gMnwSr1Vxvb37
	1Pn7mBcZBI1LX3g6aUEO+R4Tu//d9ZWoEe2/xkWL4V2O7/YcVe5BqDudpvEky/ik
	t62Plafi16IgbmJUDirOpi95NiFouF5OwJfvWMn35PK/LfdmXGGHFuFMeQAV5K7N
	IkhqHtDuDMFqtnXOAQiIbtsb97DSq/XKU7r5h8I8BLrPaWRtY/KAD2BsAevVZ8bc
	K+qcuZiBS8gMnLgWUkNbey+jaUomfa+O9MQ/nw3A/cByJ2xuGJc5DB4hSch/hhR9
	xBP88Db6OCD66VObUd1jeA==
Received: from ph7pr06cu001.outbound.protection.outlook.com (mail-westus3azon11010061.outbound.protection.outlook.com [52.101.201.61])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4babm202mb-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Sat, 27 Dec 2025 03:33:40 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=E2AVw3Gq6ayzSx+ocozhlmirqelyjskvhDwSiEjLt895LyoUYRrQuCNYkyWzYeKc3vdU6+QcDvuU7HWDgNOYlGd74u5LAJHChIYProDaMZPX1vhS7rR2Hpr5xHIkLSDiMDn+9FxRtoGHvWMVxtmnO1MuIP+dsSKJTTspxOQFeHef3M0BO2lh2Ohpi87VgR38NPCCVm6S08kgWEeVojtFQ2IV3E/G2jqFkxhgTJ9XA3FRa8zDEOK4SXdmtGQeYDNCIiKrhldsCFQ4tIGAY3K3JawRGQDw5c3+rn2/vPVIiIubuxMBvREoxfEKR1g6g2yM/ax15PNybxrOoM+0OgiBAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zhLNl2NSGvJNCOW6F/zLd57C6NnLEpqpxLX8nnx0XvY=;
 b=bE9P7HcT95r50Lx+Ddn6tcmVo7wmJ1DDEpdDofoYztZ0g9l/U++CdPO1pkQ5DQXjabO2AMoI57FARTI4RqlQ/TXv4ldgVT04PLFJISdPPMtXhRxGpVYtPL0CRNB6PuFrIgITmldHWLq/SbPPxXUOED5h8n/bGrT7idyoygZbKq01Uy1V2apyeHW7zXXitJqwN8ro3TBgQ00ZC1WIy5pogUyKKMyDghjvKYD//yx/JW1XPttn93YcIa0/3sMaF78LtWHP4cnXiFVF9hJse6o7qcBUaqZqx1hfafKymoCcqM4D7jV+VEr5VuQuIIjnZJ+3qUXPSRqJ9fu6U2xm/qX9VA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from PH0PR11MB5658.namprd11.prod.outlook.com (2603:10b6:510:e2::23)
 by SJ0PR11MB5087.namprd11.prod.outlook.com (2603:10b6:a03:2ad::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9456.12; Sat, 27 Dec
 2025 11:33:38 +0000
Received: from PH0PR11MB5658.namprd11.prod.outlook.com
 ([fe80::f440:269f:9645:29c0]) by PH0PR11MB5658.namprd11.prod.outlook.com
 ([fe80::f440:269f:9645:29c0%6]) with mapi id 15.20.9456.013; Sat, 27 Dec 2025
 11:33:38 +0000
From: Harish.Sadineni@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: Randy.MacLeod@windriver.com, Sundeep.Kokkonda@windriver.com,
        bruce.ashfield@gmail.com, yoann.congal@smile.fr,
        elmehdi.younes@smile.fr
Subject: [PATCH 04/16] bitbake.conf: Include "rust-kernel" in native/nativesdk feature filters
Date: Sat, 27 Dec 2025 03:32:39 -0800
Message-ID: <20251227113251.773795-5-Harish.Sadineni@windriver.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20251227113251.773795-1-Harish.Sadineni@windriver.com>
References: <20251227113251.773795-1-Harish.Sadineni@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR13CA0049.namprd13.prod.outlook.com
 (2603:10b6:a03:2c2::24) To PH0PR11MB5658.namprd11.prod.outlook.com
 (2603:10b6:510:e2::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR11MB5658:EE_|SJ0PR11MB5087:EE_
X-MS-Office365-Filtering-Correlation-Id: 3bf2f9fd-fba8-40ad-a921-08de453bc79b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|52116014|376014|366016|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?QQJPh9xq1XNQkVcA2WiUj3X5KviY5dyzhe0mWn+JNchjfyFmS7qweerHpR8R?=
 =?us-ascii?Q?b4V968DG6BXe43gUY8wwZrQPqhuXPnvZZ1PYxxg8SU3iCfEdxCPSt2iHPePz?=
 =?us-ascii?Q?xCAwm5EpqgvLHkEe/NBXI3+raW0OJeS8G3sUN3ade81S0AYXrInw5798Hmtm?=
 =?us-ascii?Q?AqHZ/JcTF7YV5GVmQ8U3cned9QJbX+Nht+tEgF+RJMYScEV9nwBbOHsEAwbM?=
 =?us-ascii?Q?zxVknp4d5B1U1UFh1rOrsOTxPqjURtSpbInAcvcVvwZDcpQoq1mQnbpR+4fC?=
 =?us-ascii?Q?ozb+aQrMwJDRH95V3uD735P10uEDJYwsySLn8EJuQUA2AV+JUcnmCrkaL3Bl?=
 =?us-ascii?Q?J+Ta7RnzyS/VbTFO9apOM4eJPxQuIJBC2GkM1Q15lQOxXG89HW/yUPe3RalF?=
 =?us-ascii?Q?coYM8BFSwb1qC6i2jsUshSFJ8NEkzEacOZn0XI5ESVINV15m7YaqJBog07D2?=
 =?us-ascii?Q?S5Y1gFRGz2HjJiF4uYfxqeDY9Lr6SBGlk60xNPsZAPDshvH8WiaXdFCYvR7F?=
 =?us-ascii?Q?eoaEcQMPpmdvMKIHPIKCt65TewxTS4lgPnW9Ec4EGtxUnkn+rfyNeB3AA6ZD?=
 =?us-ascii?Q?EyFCz7AoFfR5K6KoXnj5kdDhMCBsG+L92ot168Tnt8Eiz7hSy2FlmvK9DZpL?=
 =?us-ascii?Q?Iu7+I8jg9nBOBIBVfWY0n3Y7wMBNMHOBm8BI7xdK6SRMVmQ3FeOcO5Ycr8VV?=
 =?us-ascii?Q?fclJRES90P5gRh0N5Vohkev0KK3z5RXzN9+pCQmwC6TuAzq/1yJ+rvh55TNk?=
 =?us-ascii?Q?ckQVaCJ6r5SezhmdGqV96n35JubO6SkqeGrXA23WxoDfLrhRkJZia2LdNQPX?=
 =?us-ascii?Q?OyqE9oHcCoYEvPwtNBvs5P0A4DDgx2YQ/k/7lzovi0E4QkV2LN6b5MeRcobv?=
 =?us-ascii?Q?Kb7Ir1pD0WP9nu6vFyZU7q9WVk4sfMZs0cFL6ITRMTpdroUXs1407KDp73Zi?=
 =?us-ascii?Q?tnW6+dDlQWI78t7Dzdn0yCsUtRuy0mRILgYQcXT4cKMo+rrrEm0gSlcp2WTB?=
 =?us-ascii?Q?QezYQ3TM0RaPWAX9QwoxMN7VLSGbVhJNeZyvPQwSfRtNwicr/Emn0hSOEDXU?=
 =?us-ascii?Q?Fwx3upjQ52h+YJ4Iq7JjoupKqUeGomwDfcWQNLh9FcZFX5Oh40jegRj2w+XY?=
 =?us-ascii?Q?MXp/FeAr5UCGnSKRXXLeq7cWFcLLMF0FnGsTewzFOC3rvgQSNCy6yNZ7SIn5?=
 =?us-ascii?Q?t3aQdkY6HxoSokJ9IfmlSsTkqDCeyTPeo13j3L4incQl2b+IEitkxyoJRReK?=
 =?us-ascii?Q?EO9uL7e19QJ4l8sVicdERvWoRbOtNeDpfuj1DgzPtjBXBFA7Yf7siSDmt1bd?=
 =?us-ascii?Q?BWFt9ScKknfBChqzrdiLpw0oITH/J/h584qVJh2gDvhFDbiRIG+RSy78vgae?=
 =?us-ascii?Q?vNJYTipAWF1QfuvFGyMDVWyuTI+nMGdd16FaDPCMuVOWoe9uATJe4MU8UIGj?=
 =?us-ascii?Q?sU7WfjaEO3D77wyrH/STl/LhjIUR7wme60izj54ZUpDzKkDnKBHjmcnRxwPy?=
 =?us-ascii?Q?6wKM6g8yM+PYrPdaEZkX6NuX4ca6wPmJTeWP?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR11MB5658.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(52116014)(376014)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?KYzpfO+kNtUL4iyVNUPmXx0ruVdW7mew6XEsyGsqCHd3hagQEje185WsHx8J?=
 =?us-ascii?Q?Pi0ECXaQELF/9F2VwXY2WHElX485p2jfRVwO5xEArigHPLEy7r75hmXCxJXl?=
 =?us-ascii?Q?Ju1L4X1oDJ6SgcpthWTk9zm9LHhJq0OsquxDddpsb9bpqF2P2KicQO/Lz4ia?=
 =?us-ascii?Q?Zn5wprAkCazQkMZJJ84roSRXQ/RQaHg9N/B93w/Yw0FZVeCvYmRYzPOzNJkR?=
 =?us-ascii?Q?mMl6PecLy/TAGjrh3QQ0kpS6gYQflSasT+yTpjXz/35fYSZiQDQvJ0Buqeth?=
 =?us-ascii?Q?ES2EsPbxpE1MTB1HczjBsLkaeaRNoV9TftA6rp67fWDAi84EfDEc3sFtuPhi?=
 =?us-ascii?Q?U/Mm65mQ8KXrOqAvpy3ZvORFm8FDvkKaCosl+GRHXQox2KHVofNTnBMG+nZo?=
 =?us-ascii?Q?Pg6bS/pvKWzpk2+AkBz5EcJfrtBIlWeOQOX+oU1SYcAKL/uPWgq0rm2Xqh8x?=
 =?us-ascii?Q?j0weR7w1wT7Wklly7vn5WFrXBbGAUIJpJcLv41awLykTois9ynrgluaJw6ka?=
 =?us-ascii?Q?e7STRPabULjvIKxTUN0E6tAux4qY9HXGQsp9fGTpVdO+fif75VvyOjEeEXT7?=
 =?us-ascii?Q?qB7y6gCovTFNUwPRGAiChwqZntQi9JCo95l6Et6YpWnSm9SQlMNWQIQLWqU2?=
 =?us-ascii?Q?4HJVBVw6HFwqAxvfh6DA3tYyfJUi7JzLgDviHtmsy2xRXiuPzku4mHdH3mgf?=
 =?us-ascii?Q?3UaipJNBOEwH/UqSXSJQfAEh4VbPzPcstchaLzG8uP1+Yk+iCNVxwHg43OL7?=
 =?us-ascii?Q?oOe9Gse2R4YAqNa6YRMPNJZbkd3x9Xsd07PYHIX2cEsz7O2pO8qgCfq/80vI?=
 =?us-ascii?Q?GK/cEEYh0/C6uaXx+kJKFJpC1/5JJuwqvjcQDvt0n9dm45soR+Cn6zFenYfn?=
 =?us-ascii?Q?3W/uvrjsZyoj+YtrywgdAXWPpGxJ8e6fF71KOoQwJ5ZqqPH1Mn8DeLYeq2+1?=
 =?us-ascii?Q?AwjxUgML4gBAQsWAoXFBqUhYGGLzr987cEKOpIDaePmWwfqdF9TW+G8wxgWO?=
 =?us-ascii?Q?iTnBWOAA7d1YJTXd9PLaRXQi/6hci1Astq9U/5njuPnCv6kloUm++YLjOwa4?=
 =?us-ascii?Q?xQ9KmtUlYZWCH9zjWZwAHBzlBns9xXgDHF245HfhiBYU/j/qewHrN4gQhCib?=
 =?us-ascii?Q?ltnecMMK/92s44TwtlgjzvtFF6byE+xju1V/rl+ibEmf7OqUdWcKZcJehuZt?=
 =?us-ascii?Q?uGQZ27iy2x5GReEaTps6KwvULQq14UE7waH77SgcS6ZkBcfFcEGGockZ0h0G?=
 =?us-ascii?Q?X56EISAo8csAEjqAKtGHIIaVpR4UBlWwl72l66l5LIbYanLvq3x0Fei0Gx9R?=
 =?us-ascii?Q?ApS2GTi5qPe5atTM+qjtpmkl4sQOYtQVIS209uh+MBKV1nLLGRo981nol3f4?=
 =?us-ascii?Q?Ze5wIajmHFvhDTpH1zEmSUE2IJM1yQKN493GBKJ2p2tMw8GznOuJVRgL+kUT?=
 =?us-ascii?Q?yRD2IMsZitM2PLOYonjnnx8wY7MPmZJP7GvtXVub+vsD5Xy4eK1VMOXiBsXA?=
 =?us-ascii?Q?m4E65v58QLTu1Hj+G483+v+Y/mqyzDNhdUDiv/VE9fhR3R9d97pT5XrLAFUM?=
 =?us-ascii?Q?3wHKsM5h5tA5XtjJhMgY9lOElMr+A/xT0ZNZO1COz2QqDBCmQ5JXtTfDyOsz?=
 =?us-ascii?Q?cEXePdTkLh44WJf8wt+HMg64g26bovt1QVCZEmCSXIfDeD4jLz/hXS0EDVwl?=
 =?us-ascii?Q?jidS+K0OhvUrDLS+j+Zly21FKSM3yQhkgUmF+A+6pYq3umTmuE6pXPdF6zsh?=
 =?us-ascii?Q?d+wnxGJ+teJugkrfhNFtMMuONSXeQLE=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3bf2f9fd-fba8-40ad-a921-08de453bc79b
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5658.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Dec 2025 11:33:38.8232
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2bVy9i0YzTXnvLAmQhO9HrttLQ/5fvBHPac7U+ow6OxLFU6JPU7WgJ5/5Np+hPiJZWxrebL8+1pOk6U8ftLhXlrHnFC1Mf37Q1VsuYFrneY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5087
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-ORIG-GUID: pc_8LMCQmdVrupsLmuIvOpMfxXX4F3B5
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjI3MDEwNyBTYWx0ZWRfX2ig1g4fZE7iX
 0cqmnZ+BaJ3p8zyUxd2F746X5ON7G7CsIcovh5hq+K4EVunI9JgQsuccA8Y1W6z5AAf9X/kQFHx
 TynDLJH4bP5yOqju6iBXXut3BB84H09xlOqWwYZETGSycacp5MgB2x15l6bz13byHu8uCLrQqe0
 WC5oHgq7ZQWayYsad/6r6ZmIekdgqv9AHd1KnLsMt7ttIE3MFkgxH5Klvls8wsYq2yN4tc0O1pN
 htT51WIbm30VOI8fuZBtOoP+OoBI5DdHAOjix1poPiB9LZsDutYgvZ2d+bLO63A2HYsoAPcmIiP
 hmt4Et3ElT956+2b6G8mDuY4GpaVxr3eqtIhE8Un6YDXdrkxDO1GgxlDJFh3aN1kYI4f5gyPEcq
 B4qHXk1a14tectdlKJewTpvsLQg80hvNc9CpkwcmIb6i2W//DJ4QkGeMPNZnzFtD429u5PZ0Rgj
 dKVbOiYutMkdsTV4HUQ==
X-Proofpoint-GUID: RSRIyPb84WtaQZ9ZOQZ4KnFRHlT8QiKL
X-Authority-Analysis: v=2.4 cv=bN0b4f+Z c=1 sm=1 tr=0 ts=694fc414 cx=c_pps
 a=0p5N1A/s2xr2YPsuh+j7dg==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=wP3pNCr1ah4A:10 a=VkNPw1HP01LnGYTKEx00:22
 a=t7CeM3EgAAAA:8 a=xWBQjpzubWhZ7YZo0B4A:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-27_03,2025-12-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 bulkscore=0 suspectscore=0 phishscore=0
 adultscore=0 lowpriorityscore=0 spamscore=0 clxscore=1015 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512270107
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 27 Dec 2025 11:33:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/228558

From: Harish Sadineni <Harish.Sadineni@windriver.com>

When enabling Rust in kernel, native and nativesdk variants of rust need
to conditionally install Rust standard library sources to support 'make rustavailable'
in the kernel build system.

By adding 'rust-kernel' to DISTRO_FEATURES_FILTER_NATIVE and
DISTRO_FEATURES_FILTER_NATIVESDK, the 'rust-kernel' feature automatically
propagates from target DISTRO_FEATURES to native/nativesdk builds

Signed-off-by: Harish Sadineni <Harish.Sadineni@windriver.com>
---
 meta/conf/bitbake.conf | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
index 88f4d0df69..c0bebc3ceb 100644
--- a/meta/conf/bitbake.conf
+++ b/meta/conf/bitbake.conf
@@ -917,8 +917,8 @@ DISTRO_FEATURES_NATIVESDK:mingw32 = "x11 ipv6"
 
 # Normally target distro features will not be applied to native builds:
 # Native distro features on this list will use the target feature value
-DISTRO_FEATURES_FILTER_NATIVE ?= "api-documentation debuginfod opencl opengl wayland"
-DISTRO_FEATURES_FILTER_NATIVESDK ?= "api-documentation debuginfod opencl opengl wayland"
+DISTRO_FEATURES_FILTER_NATIVE ?= "api-documentation debuginfod opencl opengl rust-kernel wayland"
+DISTRO_FEATURES_FILTER_NATIVESDK ?= "api-documentation debuginfod opencl opengl rust-kernel wayland"
 
 DISTRO_FEATURES_BACKFILL = "pulseaudio sysvinit gobject-introspection-data ldconfig"
 MACHINE_FEATURES_BACKFILL = "rtc qemu-usermode"
-- 
2.49.0


