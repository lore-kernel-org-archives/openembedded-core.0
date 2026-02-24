Return-Path: <changqing.li@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D3BC4EC1133
	for <webhook@archiver.kernel.org>; Tue, 24 Feb 2026 01:53:46 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.11212.1771898017464678431
 for <openembedded-core@lists.openembedded.org>;
 Mon, 23 Feb 2026 17:53:37 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=IzYnSdkL;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=6515bcc28d=changqing.li@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61O0lsPN2846252
	for <openembedded-core@lists.openembedded.org>; Mon, 23 Feb 2026 17:53:36 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PPS06212021; bh=k7GaWrInccqQ4M9TmPFp
	IxPoUaE28wXGJkKt5bQ4g8I=; b=IzYnSdkLLKsCa1ozM/kDSnRrtswW4RvGPpuu
	BYPzgBocq/tFK9JN2VMsluxqTjsOFaKO/MA7RFTS4CMH4U6ijvi/tKIVJNCul7pP
	EUblqfiBWEouzVmVL0i7DY5sTLsekeYg8qR/PrTwc8jF9jRMYym2dpgPc15C84Xj
	gCWAEiD/DW55si5fQ++6NmLEQi5jp7PQ62l1jpet8sGM+CTLUYHPzyuWcP6wl+oR
	rI2mkTHPXUZ3CKjeEcUSNgxe+VG1nHLWOvOqjHOslbdocGYxvU4dVkjdb5NijHYj
	oOw9yhkCWcxMS69z4Qzcz33RzPcdRKRYgWFfpx/eYJVGwqrRAg==
Received: from cy3pr05cu001.outbound.protection.outlook.com (mail-westcentralusazon11013050.outbound.protection.outlook.com [40.93.201.50])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4cfd3k29f2-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Mon, 23 Feb 2026 17:53:36 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oj214b3JDSv4X1sf2SVN1iLGru3tjI/m5TKnH9g6WubAJaMvuR2LtStcNBl56v/xGEEbGDjMLv0yiuHQ9BWU/qZZC25Mp0zEIsuTYqlKsWMBVXcHGaTf7qQe7CqEGf81Avg+t/wKsjTWyzMYDK6nk8R3J9hCx7ThdjqR16s0AjHRjumyIIJid9VWTs3/REcpAkZJZxmioG5ngQCcCzAFJTjDEv/X2lBJYGtP0SW0yiJYij54Du1fKHrAD0EzkUU1pQn83NweScZEk5GimeG6403t2IafRXtXjn/Z4fsxa7n1BIPreYN19oJtJu2R6U0KN6Mfos2p+14X+Bxsc+FIcQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=k7GaWrInccqQ4M9TmPFpIxPoUaE28wXGJkKt5bQ4g8I=;
 b=TdKfxWY2kCZnBxmNKsENmgxGTHtZgUHTYsrUNFa9wcUaim53FspQ33tkR8FBe7GhJne2xxbp9gr6POOCgQYUwYrRH57/1QsnXzLj69jQmfX2/JJ9zkXTgpAVZCXL4cNNXYVG54V83ZW2G7yB89mei9kYik6uGmbvTkRpJtTLc91SnyuuQavVWCar3kzQczEWN0LCXuyJeJwsoZWMrTPPXnVqzmUmd9C/+dGhqwiHd0KAZXzpFjb1D9nxUft3WZPBeddvgFProLnWzZRxx5/gGMGo2sdnAXuwxR9BAoqcJJguc6JJOC6XSwVN1Dc3bsZfnrvbkVymSkhEOGIe2yq+Bw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS0PR11MB7312.namprd11.prod.outlook.com (2603:10b6:8:11f::18)
 by DM6PR11MB4689.namprd11.prod.outlook.com (2603:10b6:5:2a0::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.21; Tue, 24 Feb
 2026 01:53:34 +0000
Received: from DS0PR11MB7312.namprd11.prod.outlook.com
 ([fe80::531e:6ef5:812b:48f6]) by DS0PR11MB7312.namprd11.prod.outlook.com
 ([fe80::531e:6ef5:812b:48f6%5]) with mapi id 15.20.9632.017; Tue, 24 Feb 2026
 01:53:34 +0000
From: Changqing Li <changqing.li@windriver.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] mesa: upgrade from 25.3.3 to 25.3.5
Date: Tue, 24 Feb 2026 09:52:46 +0800
Message-Id: <20260224015246.3339792-1-changqing.li@windriver.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: KUZPR06CA0008.apcprd06.prod.outlook.com
 (2603:1096:d10:30::18) To DS0PR11MB7312.namprd11.prod.outlook.com
 (2603:10b6:8:11f::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7312:EE_|DM6PR11MB4689:EE_
X-MS-Office365-Filtering-Correlation-Id: bcfe905d-07bd-4c05-d6f1-08de734784d8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|52116014|376014|366016|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?gLvmJyfNZvhJ3kstzopv/ATrZIbgRoFT332P4eA6tE2JHWECw/uL8JGoslhq?=
 =?us-ascii?Q?+TGHgl960pQy85RXYrz7FGQ/UVLz1UJQm1Xj/2Q9ZdxFcddSUJclVF5zUFjp?=
 =?us-ascii?Q?WjciahqmRTaP+/TOAWwkL/HPQcol/k2EH123gvdVdZuxDxszaOh8mYC3ptTT?=
 =?us-ascii?Q?etQQ4eYFakk6rYb/X+GxpvKcewzNjYw5xr2QHTtqppvFmuANvCl30CPnjiCQ?=
 =?us-ascii?Q?Ab5cKzm1a/f/CUtEB2++8A5KT9vMKtsA2kLRivq9YTjc5pOFxI/rlDL2wPVf?=
 =?us-ascii?Q?Dj1MbmKgyuUGhw7+4cZT1htnU3IbB+sSyT0Q8SGw15ihVRt7TFiwAXNILbVL?=
 =?us-ascii?Q?aP+I/E4crXMwVcVi1KBxDNZU5YWWqP7GjT9brziqW62lk4ts8NOLLKgIES21?=
 =?us-ascii?Q?KUaPiYAj/x3SXUAetlU52JZ7xz69MnqM557tLwLaqAkNZJ4uOi3Nk/WBJeqk?=
 =?us-ascii?Q?9yElGmoKfmTLx52fQAVXEWo0iSPNSyqDEKT96kypiaGx6Wr8jHh7HCbpxwV6?=
 =?us-ascii?Q?aHmD9lHoXqgXB7OWXjcd6UVs+tiORPNjui5ljvjGiNT32HXRLy2Igf+RgdEn?=
 =?us-ascii?Q?ujpIRdTxmU3hVAFaJiWDAjNcnOHGgodbs7994828/blqUpTM6FqN/aeRrE9Q?=
 =?us-ascii?Q?WMY+z1ljwswhtnfu0lcmLDfUnzi8VUtbIB9R6jZsNP8wNp51rzH7IduV2kVJ?=
 =?us-ascii?Q?MstFf47XfcJKzlg3AVI5hNa/spZsgcDPsEPPd2+lTj8vE1NJP/Y4t7MpEavt?=
 =?us-ascii?Q?rMvKLKOBcYOMZLhpAn8S4GOvemJCD9Cy2oG1EZXFXnJ9wRr4LLAWL2FdLTck?=
 =?us-ascii?Q?H+K0x1TBhWO47rm60gsLn+/uXRNuFxCNx6z+bfya66DwYDxE2HtTtkdNH5U5?=
 =?us-ascii?Q?Pe+ZvIrMCC3nKJqXqZTcOZbXeNETm4JJ+Xp8OiSV4MWRI+rTJ+lffNFYVuAf?=
 =?us-ascii?Q?vhtHQSE4c6wlOErImzljtdtD/aeyA7XBFsrF8V2z/BO6BqjD4OB6h6qldJbU?=
 =?us-ascii?Q?4ahr0y/UFE4c5maY73I5iaWfJ56Y2D7BmrA1d88Wmpa8FjRhaohNL+KgqvQR?=
 =?us-ascii?Q?TOXcfIm8YI03dJ+wn4eyQWofTlB7WZngl2/a8X1tcn0/G7WiLYtIn/WkXbgL?=
 =?us-ascii?Q?YCt6rWdXZNEIa37+/IoET+Krq8avefsRoOyVX4FHxc2vM+86pQjEfFvoWsv+?=
 =?us-ascii?Q?SNpAnEexGhLdqlixt1KznHxowt44cwSqA+EF7UG8Uu5qb6QERBvbpsa1fwk6?=
 =?us-ascii?Q?Wnij7+gwgQPqlgw4UX4mKKxf3Kr8hfsKhRQCbatrVdMbSS+4dqXUm09w5Y0p?=
 =?us-ascii?Q?N1gcUT2XCFdWXBI/eZtHHJOarnNaC6glybD86d8t22nDLiWaA900UaKSBKNi?=
 =?us-ascii?Q?hIl6g9W6NUQkEsdWaiOpYHxPTGk10hJsOSXr7iIKINqzpfDQ4Ozn1X37mM3m?=
 =?us-ascii?Q?jjOKGPrBEYeF2RVy+EJp1025fqcX/NLAF7cM/Rw5rbZTMq6uRp8BKD2yWVQ4?=
 =?us-ascii?Q?FvwGs0mSLBU21V2XANU6+8d/DRxQ/116g8dLWZLsRvZFOKBB5eubLNpqlIKm?=
 =?us-ascii?Q?h1kSau3Lc1t45P0Glk+vGnzwmlysuGwfI6ZwcZ2R?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB7312.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(52116014)(376014)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?II50e2yi5B9rzDQ88y/9H1cQbPVfTvs/7jdWEIgSAczk6LfW/uQDibzWLr7N?=
 =?us-ascii?Q?4qJgPyZF3vDHHqcotocw+A4D8hnkYXEbeC9SWF6KkV7yAXBexhpNNAWRIvg7?=
 =?us-ascii?Q?dU0Ijcyt937e52lmckthFZrE9GYcBzFm+jQYhphcS9cmAEye4HvRXhgfDgYZ?=
 =?us-ascii?Q?7ZkCUGBnsKxTSw/9MqTYJnzuNsGgo0mbSyVJ/i3wfuPF3kLqIEXoSSJS1GZd?=
 =?us-ascii?Q?Tmcb4DeuQZbWnKaYtS7iUc5Jg4JMGwEan3ppRTX7rp1i1aY7yh3+X7UKSlSs?=
 =?us-ascii?Q?q8FpxQu2Ak2E/FATC3/pk86MNaZOuN2NVcdLmHyOoja9n+JZQd5VYdHQFXej?=
 =?us-ascii?Q?uWWTMI2TocB8Hgzu67VvzwZ7lPRNwbY+xJO3Lu+uNkhBS9FLe1ImpW3fkEHZ?=
 =?us-ascii?Q?DYURQ77Z8GEQwzTvChj6wFBbyfa6dQnquyoQYC3YvAfSdpereuHoTv3AV2t5?=
 =?us-ascii?Q?plRLPBKDXLEIjbAxDhX9W/lz6qbjRWrf8ql/sUFxo5Kgb8CmV08/kl6J1ltn?=
 =?us-ascii?Q?m1BKoIHuBl6bXZ3jVqHn716kHjZB2Hq1/oImYwF01LFVfBuk/B3y9fJDE5Jd?=
 =?us-ascii?Q?R5T8KzUqCbgyhIQRDV1rF5hZ7qffv76OyIul5qs5LZabEOjEHG7qyX+niil5?=
 =?us-ascii?Q?pzkrMrA29Gtjv5T0NtX7TxbJwPHYFy/c/5AG+g7H7fkQ8F+zJbYq7NRIOZUJ?=
 =?us-ascii?Q?PetwMiLi8ag5zxlZJNo/u2j/9b63L/BRdT4Ek2ocP/dzqhNwWtn8fpgvEthq?=
 =?us-ascii?Q?wYqb03LS5xrqCpDoQ7iF22o5TEAX88PYskgqr+mx4WF0dmIYZZJoidJeZAU8?=
 =?us-ascii?Q?lRTJRvfWkc8CgBIysx02JceP62qIC0gDh0YIHlNJ68r/Dzx4TH0vYKH7Wq64?=
 =?us-ascii?Q?ytHyUwgW7rUSkq4DaUv6EIwh3ghKaCwbCiShqCdVACDkPVReplVL7qIJslMo?=
 =?us-ascii?Q?dt+rm3qRkY5KspDH0Ume6d12GJmYezB5KUbwlWwMkEAtwiqd0LcmerML5FGZ?=
 =?us-ascii?Q?UF+DF4TR1ciw7a4xYEvLiYFAKPMxRhUs1AAhd9NIkPYkUIpGuDMUO4pvTihE?=
 =?us-ascii?Q?4kwex+lA5tz8wdU9Mr/3m0BO+MaFlPlidMLQYDxpXLbJQiNt1UpuanwkREJx?=
 =?us-ascii?Q?wABpjDL4+bvy5IPUm/dZUOP6BWFtbu1MguO1xVktTJnKCIvqnkMWU0bfXSHZ?=
 =?us-ascii?Q?86dPAm+MzBJW4pVZz+zNAjWm3jEyvrYDfs+HN+fRhdesQuNdtJNXUcm0zYUc?=
 =?us-ascii?Q?TueOyHo5Ke2ANYaF7/40dXPnK7aThZbbBf4DJLeyTuUU1TlS7cYL4Ze66npG?=
 =?us-ascii?Q?HplK63GBlUCTKuEcyrfHJqOoaqabM7qs/LcBKxfzwIumkHbCzxj6gOHBSncr?=
 =?us-ascii?Q?zOOVzsft8DxzHAhrEtxR7nB5inkhG7CANg+6ayIJPBVbaqHlkwqg8jyoh6Bd?=
 =?us-ascii?Q?IGOR02FQK6XVo92p9wbpcM0cnphUs0l5qizMafFvIyjaO4lwUukFENKZQWVc?=
 =?us-ascii?Q?s101fuYUpItsrKIhe26qB0hOHaC2w9LK8L+NfNQdv3/cpjiFicIehpUY7fL6?=
 =?us-ascii?Q?V45136GMyGkhtl1zc7SbS7E3c0pfAcHoBna7ltKZTOruBccOlq+iJJn3Z4eu?=
 =?us-ascii?Q?rgTxvXCq1d11EnnJEKRdOvUk1u45EPK98RH4Kp4cnTTlRW3Ar0W9GIXlfT4P?=
 =?us-ascii?Q?YrXSoI8lBjPhuOYkY39kfK0FcB6y/zlMl0fSbbdpzHyuRGljn8tIDPzrWB70?=
 =?us-ascii?Q?ARDoxKt2CcsM8DovvWd4nOsunmtmkms=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bcfe905d-07bd-4c05-d6f1-08de734784d8
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7312.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Feb 2026 01:53:34.5439
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: I/6axWdfEfvHqal2JTfD3VLr1n/f4F0gH6s0BcgfBALCALMolYKWWCHhhwLC2GiUxqyE305+xfXFoSl5SU4wd3aBWNRZMUmVziZXNguxfA8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB4689
X-Proofpoint-GUID: TA7r9Pk_nWKC7z28O2ONZv6y_Sv5q2rD
X-Authority-Analysis: v=2.4 cv=Bo2QAIX5 c=1 sm=1 tr=0 ts=699d04a0 cx=c_pps
 a=IN6nX5sQGDwae/9PVKyrlQ==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=HzLeVaNsDn8A:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=iKiJcTA2PjBS6x5JeXcw:22 a=ZpVaWaFtAAAA:8
 a=t7CeM3EgAAAA:8 a=RroQsQTsBbO9FLATM3QA:9 a=5tn4MO8azEBWFjlAA-rn:22
 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: TA7r9Pk_nWKC7z28O2ONZv6y_Sv5q2rD
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjI0MDAxNCBTYWx0ZWRfX7rZZC98aqaIG
 5cMLT8ZlG5yazjn2kVDUAaq8SBWGg01ZX1QhHLYjCpeB81kGsIiO8CAvV8yMdKlNznVNd6OSFuH
 c/Xactbh36GaAmmRd1M+rA3ypKU6hdmc9QRlGeiPOqwAgZUbwdXfXIZtWazIP8JnxFKt5EZ7Win
 lbYF2gM5CH3loLUdYMHFbq9IKYO7ICicLlyuydc4nGSpjbcGqeKc6Q3b/nYxNiHzvUanKD6VeqQ
 UUvHqfVkb/a4TJUsexd6/SWJoeMdo/9ArSZwIqdFDfuOYxo7QTdZo+x6nmqfyFsbrPur1dZOtah
 6yw9+8YcMEb1Uxw3LIVyZ2cmZNW9bmhGZhoC0fTUKENj/t994IuyBz+ZZZLCs6dUCXhaJQC4DUe
 9yKjlkR8OPC2P1I53yuLyhVz/HI+EobpSBPj7z+q/W8rIahEkq9KNa+SNlxPyEAzLHC24oxdQxJ
 lzbJte23iZ9bNg2/y6w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-23_06,2026-02-23_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 bulkscore=0 clxscore=1015 suspectscore=0
 malwarescore=0 adultscore=0 phishscore=0 priorityscore=1501
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2602130000
 definitions=main-2602240014
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 24 Feb 2026 01:53:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/231729

Signed-off-by: Changqing Li <changqing.li@windriver.com>
---
 meta/recipes-graphics/mesa/mesa.inc | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-graphics/mesa/mesa.inc b/meta/recipes-graphics/mesa/mesa.inc
index 1607fddd4b..e790e4bce5 100644
--- a/meta/recipes-graphics/mesa/mesa.inc
+++ b/meta/recipes-graphics/mesa/mesa.inc
@@ -22,8 +22,8 @@ SRC_URI = "https://archive.mesa3d.org/mesa-${PV}.tar.xz \
            file://0002-rocket-drop-file-names-from-the-generated-file.patch \
 "
 
-SRC_URI[sha256sum] = "05328b3891c000e6a110a3e7321d8bfbb21631d132bf86bd3d4a8f45c535ef6b"
-PV = "25.3.3"
+SRC_URI[sha256sum] = "be472413475082df945e0f9be34f5af008baa03eb357e067ce5a611a2d44c44b"
+PV = "25.3.5"
 
 UPSTREAM_CHECK_GITTAGREGEX = "mesa-(?P<pver>\d+(\.\d+)+)"
 
-- 
2.34.1


