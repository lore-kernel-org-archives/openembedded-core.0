Return-Path: <Harish.Sadineni@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D53C0CF887C
	for <webhook@archiver.kernel.org>; Thu, 20 Nov 2025 15:27:06 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.36873.1763652426222211113
 for <openembedded-core@lists.openembedded.org>;
 Thu, 20 Nov 2025 07:27:06 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=Bz6ZeU0Y;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=341909d004=harish.sadineni@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AK6eq7F243882
	for <openembedded-core@lists.openembedded.org>; Thu, 20 Nov 2025 07:27:06 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	PPS06212021; bh=cfulRwytJfi9vWAecnMqzcC79bviZ/lLbO8BEB8uLKg=; b=
	Bz6ZeU0YLg8YeAn9ykZHS0eVnJsgxVdXzVhhiBmKtkf12t8U9UWKXCCFAaG956qA
	xxz6Qs1MPjW9GRQPBp9GZDAgVKGpK7R67BfnrvG+Tzz+oUpV8RrR3qXkZAQKhb2h
	GeCDhWKfpYPIwC2Dqr4eXw0U7q5sK47QOwCg6obZN5R9Yh+Vyhq6dBQCUOHImYBx
	VTWBq7h9A4dPHJfM3BwiSyBt2LGdc13PtBEy1lg1XJ3vKJDHwo6DNMYmuhpdtMOm
	VT2gAy4yafO+Y3zt6kfXJLo7in835y+qAQ7FElgcCGujIWvcKB5hQzD4MvMhXZfl
	ffvh3R2rMz8ZWl6PdgvhBQ==
Received: from byapr05cu005.outbound.protection.outlook.com (mail-westusazon11010024.outbound.protection.outlook.com [52.101.85.24])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4aenp2xge6-2
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 20 Nov 2025 07:27:05 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cW2wygWZAAVlb90gAs2A93hCX56MymrMbKLsCkPBTMs+0R/PSHhc6fMoNgxmiH0+6hhxiZpM4Kj5m7ss1XDi60WF7aeDWRy/+C3DpAvPsvRNNq/hljmsE39MfsdF4zY2Sv0jhBFfIXIi/YzCGCP9/nZAJJ2HRsZDwG6o/ljPH+9z93pummSfiPsdldR6ri3qdrMXnqW2HABCNFvomiQS7icjXjJWiAXxQYcDExazXEzLXrzFbkaX9xiOVQTOfPSiWmkfVR6JmCjBJWdwBLFrHSjq2fHabXr04mgaIMo5zERPE/kgF55+MuOxDcCFtSDAd4wa4+FJzfURewiJoL7ajA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cfulRwytJfi9vWAecnMqzcC79bviZ/lLbO8BEB8uLKg=;
 b=BkUlpuudGRbAtpoF7CYqbJWqhoJQWEejtNGV27ZZdulfqTGrWr2/kSP8rJncWoVFGg6t6VMR5n5Z/986MVCzHwhWs6aEkT9sZ/dgQfMaIxPF3K06HwbRp5gNMleom+zHN2KXatf/jzX84YLvpB+LZv1BO9zQtGgBO6xgZ0QTNsie6W04WuRdjn5CyPrSx/0fOWvBp2Q95jbeFA8sVXrkWxGKEPAjFAz6NPcuBlQdPwHp2V2TPiN0j8V5pRCltP61SBjhjhbadYeYJHSKKe22V58CaZugS5Nm9EQw5jhjyrOHjoStCit/pzHWk66R9EYGB0cHCvpGsGyEgAzCMOT5Bg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from PH0PR11MB5658.namprd11.prod.outlook.com (2603:10b6:510:e2::23)
 by MN2PR11MB4760.namprd11.prod.outlook.com (2603:10b6:208:266::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.11; Thu, 20 Nov
 2025 15:27:03 +0000
Received: from PH0PR11MB5658.namprd11.prod.outlook.com
 ([fe80::f440:269f:9645:29c0]) by PH0PR11MB5658.namprd11.prod.outlook.com
 ([fe80::f440:269f:9645:29c0%6]) with mapi id 15.20.9343.009; Thu, 20 Nov 2025
 15:27:03 +0000
From: Harish.Sadineni@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: Randy.MacLeod@windriver.com, Sundeep.Kokkonda@windriver.com,
        bruce.ashfield@gmail.com, yoann.congal@smile.fr,
        elmehdi.younes@smile.fr
Subject: [PATCH RFC v4 01/11] bindgen-cli: extend BBCLASSEXTEND to include nativesdk
Date: Thu, 20 Nov 2025 07:26:39 -0800
Message-ID: <20251120152649.1128685-2-Harish.Sadineni@windriver.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20251120152649.1128685-1-Harish.Sadineni@windriver.com>
References: <20251120152649.1128685-1-Harish.Sadineni@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR03CA0161.namprd03.prod.outlook.com
 (2603:10b6:a03:338::16) To PH0PR11MB5658.namprd11.prod.outlook.com
 (2603:10b6:510:e2::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR11MB5658:EE_|MN2PR11MB4760:EE_
X-MS-Office365-Filtering-Correlation-Id: deb25992-4055-4d19-e65e-08de284941c9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|376014|52116014|366016|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?k+P9NZ8b7lvO2hzRfHEW+ei5559DsVK8zojEFwhLPf3Fs1Qu+ncD7FWpIll1?=
 =?us-ascii?Q?Y3ExH5Wypy7bgphQ7CfwvV15qRYwPIzFzWk3lYM7Q8JZ1HSzKuum6J8e+pYg?=
 =?us-ascii?Q?cbO97g5u6c90pt3xQDIEHN9e/8PotOfGxYSssGPMGRRjZDs/VefT6XCz6rHT?=
 =?us-ascii?Q?WmS53IH3YLNDPWV9HU2HJtyJF5OTL8OeasiUsVaoymiao+BIPAyQAzWFP5Co?=
 =?us-ascii?Q?5YUyCH0rphmUgyrla+TKnNuST296PkyGyuB43yxbkKK1BiEdMvv6WuxxiUTU?=
 =?us-ascii?Q?nHI1atDT1c3xiEhQp32lgja6oolv0RgbgXAwevXUQKIfkMdk7YFMyyanDypx?=
 =?us-ascii?Q?UV9/dQwp27DdPRfqIFoKC5pfOBzT5x/s5sXGw4ZEWkYv3NcU+pcAhKpsJfQc?=
 =?us-ascii?Q?/qfEGeIqiGbmTsSZWwHOc8bSXlSi1SMNf2l1Vsf8Z+5nzBkoVwHTppwDA9v2?=
 =?us-ascii?Q?qUgV5oc4wecFgO39YzApb88qUC9/sjuOxNTBH8sVAua0BzJ/dN0khewUMv7U?=
 =?us-ascii?Q?R3ssnFLFY9/2vfHlhFzOVOqStYtzLUgOfQKxlX7iOiu3wJOZvdOuJAy3M+9r?=
 =?us-ascii?Q?JpUEFqsvhziS/yBBlxN1xeiKTKLCFZrm4bd+0VSIIyiQEMe9Eu4/padeuw/2?=
 =?us-ascii?Q?OzE/SJWyt3DGsPX1v+D6juo94ob9LDk8hfdUFlZjOya/lWOZFg5axo5bf7Sq?=
 =?us-ascii?Q?X6+ELl1KzTH8mgzWxrUzTbVqJbebjhtpF3Y1belgko2gSZvSiQgLs2QoB9zj?=
 =?us-ascii?Q?5fGSuWGiuq0MluOrqIogJ6f4kqkwpUwcwxAuM5QQ0MB3MkKY2C5RETfkg8Vc?=
 =?us-ascii?Q?xLhxoMHxrSGpEWheQUCPLsxYjOxSpr8qgD0lpMch9SlZ9DnPQZQfJRMcre20?=
 =?us-ascii?Q?yL+i6knlzjQGvTra6F5jRBdB2dePhu3LHkJpXyHI3WvGYBXOo8v87CE7DXO9?=
 =?us-ascii?Q?cf9Gh5gTOemtUr8QKomNxCKEOcuYeazz3B33tqwWrT+ec2ILHpf2M+ew6oIT?=
 =?us-ascii?Q?5wVI1Pnj+1B81CYc1OuWuJSeiROjk7DSCZnJFuHSAsr0iQArFBCOsyDQPNTW?=
 =?us-ascii?Q?MSjXYUK40zyDZapgzriobrvVusfliNNanUzbfhAkXPrrdrzHYSCmhV39yDw7?=
 =?us-ascii?Q?sUnBGU2Upn+25geWP4JSleF02G8aX/CWXUAbQTl1M1awwQ+yllPs+9P+yyJQ?=
 =?us-ascii?Q?emzpkThO8eMiBQwFlIM626aIHSWWZpquqLn+SoPLd2GaMtLigIGPzz2CyR6Q?=
 =?us-ascii?Q?u1jtKwjxE1fUCJr8EzFrYN/XVJF6VsLaa+ABzU5bRz2NtuHzhzfuwweamWf5?=
 =?us-ascii?Q?CAK/Pi8ZsJHHgjA6z3RoB/xrUneU3ZnXe7O7keS0+UP8xn5EISrKP6lt2xv6?=
 =?us-ascii?Q?OjZifvrvtwCxPLlkXGPgFt7DkMZqixv+gYKh0haxWaBqjoxfa+GGRxylrMgX?=
 =?us-ascii?Q?MqXQQRpXiHHpSlz8AcMg3lTXywMHGa8hDTjGPrQ3+kuAENTfzHtEUP+/2gWv?=
 =?us-ascii?Q?rh0TDUJUqRmeaISMkdvOZm00MKK2yOG6/FD5?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR11MB5658.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(52116014)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?uJtOWDpuWAjcGk8uZGtTkxRsmqg4qWmQ0mc2jqAcvYeK2+fkMjIPgjZHIFMN?=
 =?us-ascii?Q?hinSTzU5jM4zYycl6gFjwoOYns0eCM9JuPgdXNs2gekRtamib/yFIny40qco?=
 =?us-ascii?Q?7Qsw3v6eLpbPNbTzSRFYRyXAfw62K4Xwsb6CQxcHQ6yAl5tT1ByHa1uxtDCk?=
 =?us-ascii?Q?V1sKGo6qGEAVLqnRUMtgsJo5lpDOl3CH5JsO7/5xyYm0Rtxvea1iJUDg7Tt1?=
 =?us-ascii?Q?3RpA8tsC4EK8Q/RFAk0hffNxMyOQPv0IgNIRBJ08Br+T4Z81cHwdg9Lq3YoG?=
 =?us-ascii?Q?zHVS59OefHnzSlpiY0+3I4V+QQhZhoNlVDTRmgY85qJm+enoMQM+w8P82Gwg?=
 =?us-ascii?Q?EYYGFHliyWMv4FINstRUl7CCxGSxRmSBDmVb8vee67Fn5q8t3cUX94ehFNku?=
 =?us-ascii?Q?E3N7bHYu/n6A7QwJ4WcA53qtRFmWXiRO0OGTU+z+SwKaiTINXd78QZ6R9L4i?=
 =?us-ascii?Q?5Qmxr46DB9hjGAxZF/uhiOxb/u8YiV50Rl0sMVsDo5XUyPNKVfZ80cups3Bt?=
 =?us-ascii?Q?fH/0sNA9oAXBStccFSDbdPbSYRvPkdSNLYUWUZZM8WruC/fIwM+ghgMHaSs0?=
 =?us-ascii?Q?kQhljdNhuEO+scKLNBeXfetebOB0huopSggqQbc7SWLLcmTSS2MAJWGK4YCR?=
 =?us-ascii?Q?O4v6aoX4Rc8H5L3eCdguXWQqxJY8wC/ZUe6zLfXqIoVKAaWyeYbAf0PH80co?=
 =?us-ascii?Q?J3m3/KFMLYj63nkeLlbZAsNxjUf2NKQLtqO0uAUwQWnHxNnh5jKf59cL1bcn?=
 =?us-ascii?Q?32X3H8RHPIYOw5OMLDeVtfAG1x0HtRcOAXhhfj5FK4DZcP70b8+AhqDk5ah7?=
 =?us-ascii?Q?/71HF7khTpG89zCY9soQonAOZ4dTfbUsBnaN6Zfm3+TXlPj9c22Qhz1qrtjS?=
 =?us-ascii?Q?zwBEdWZhYdKobkVY+SbcFpbM+u6phOLoxf385aqiOtPXjds3v+olt4YRmvTo?=
 =?us-ascii?Q?Vtl/PeLI0Ti6AIz7NVXCa558PjGfhjw6S9DZEAK97sKaKhXnbaHz6+3sVvmQ?=
 =?us-ascii?Q?ScZ8SdTRnji6WpXDWujwSOTcB1pFYd3vwfbRXiUtBjV7GwnMoCrENNBorFI0?=
 =?us-ascii?Q?jKER0G0s7a9O3S4dVnByAIPuy9t6PjiOpFxKX8J8BKatu4VrZuIg/I3AiVfn?=
 =?us-ascii?Q?mRNPWMImsZu4hp9Ozqq+3gCowce0jXs28ozpK9zrczZgYfPSd/HFeJs0B1FQ?=
 =?us-ascii?Q?ZJPb1rXEuFhmmwlv/1UzORbDwx/eteHnkfiAJUJ43scCWz1bZVf0IHT3T3hZ?=
 =?us-ascii?Q?wbZQkhpbYf/zyFszUnG7uChAlGF6tM3B0/RbUEV+hKZt36f/sPmiIHDjKzfh?=
 =?us-ascii?Q?jjnZTHER6342fZ6pn543yfTTrwUTxOxRNTphAAqlSTU02CEOwib8Bfv955rF?=
 =?us-ascii?Q?fRgD+LXGzyTZQ2NZ55Oc6fMX4w0JNUTXKCxOf9GwLVOTWCiFKkTSauzxr2Wk?=
 =?us-ascii?Q?8C57WJ5kYcypyClu99vkBevQFosnH8khd+XTToDWBKp4Ik7eEA4HFZVzMOhB?=
 =?us-ascii?Q?wcxa+bwXBL5hZ/5WKxRDLGaJ7zr0KQVcpUZilfhN0MzbNGllBsvgnA8aQfWx?=
 =?us-ascii?Q?wXJPDAVuzMFakGTFjpJUVEUaU1j6+HqYGYceC2IB7U56ixec+pG/EwPTe+Eo?=
 =?us-ascii?Q?0qNHccRwkB0Fm8/F4MRM2I0=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: deb25992-4055-4d19-e65e-08de284941c9
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5658.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Nov 2025 15:27:03.6123
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tU9eP5rYzmWM1x3R+CQ9lBsdMfKDOOPWYCSQyZh6ueiUPkd6KGoE/krZRBEZzrcwZZjzNAxZJkywmoM8RECz6zBD55xk7/oCV2YYzm6mSdA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB4760
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTIwMDEwMSBTYWx0ZWRfXxoqsxOTfOKWD
 O6aNpYeDwcNjws9mQJW9vTYUVbJFbKimKFgG6IujS9J+nS/27vK1Uap/BG4n5kSxtFoqtbR3S9x
 iljTm71PXyv+4M8P9JgG4far7Lg4xwDm6Ygk9zTdzWN9K7ef4140zR13UsFRbLAsLicihQcUFdn
 r3n82ZzQuW4FaboaTpgBOg5u2phAGQuWFg15dj/lbgkoJbseZcFid48E4xg5gto1xuCDNdy1a50
 8i4CewOd1RSZc0RQ9TXO1MBiMgs7OP9bzmIIQmobfDhl5u/Kg8/FokYJ3FYCB0hnTByZb8G1i4V
 ft61Di8NXe0+9xNaGTFjk25GzDokC4vczEm1RX6/LXZol6s/h45u46Yt44TuE35tXDEoRmtj5w5
 Vq7bFr0f6uO9VIVCPupmo5Wo/1E58A==
X-Proofpoint-ORIG-GUID: Prq7fuksLc1P-f5ocVjxQru2ngSm1mED
X-Proofpoint-GUID: hglFlHOPbMGu7zgZFylfmsSnOe8MpHBb
X-Authority-Analysis: v=2.4 cv=Z6Xh3XRA c=1 sm=1 tr=0 ts=691f3349 cx=c_pps
 a=N6jWaT6qAb3kxWP2Z7atcw==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=6UeiqGixMTsA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=t7CeM3EgAAAA:8 a=giED5mSNaOMbM826fEsA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-20_05,2025-11-20_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 spamscore=0 phishscore=0 suspectscore=0 adultscore=0
 lowpriorityscore=0 impostorscore=0 malwarescore=0 clxscore=1015
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2511200101
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 20 Nov 2025 15:27:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/226624

From: Harish Sadineni <Harish.Sadineni@windriver.com>

To support building Rust bindings in the SDK environment, bindgen needs to
be available for the `nativesdk` class as well.

This is required as part of making Rust available, where bindgen is a common
dependency for generating Rust FFI bindings from C headers during cross-compilation.

Signed-off-by: Harish Sadineni <Harish.Sadineni@windriver.com>
---
 meta/recipes-devtools/bindgen-cli/bindgen-cli_0.72.1.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/bindgen-cli/bindgen-cli_0.72.1.bb b/meta/recipes-devtools/bindgen-cli/bindgen-cli_0.72.1.bb
index 2f3ec04e82..72dadfe52f 100644
--- a/meta/recipes-devtools/bindgen-cli/bindgen-cli_0.72.1.bb
+++ b/meta/recipes-devtools/bindgen-cli/bindgen-cli_0.72.1.bb
@@ -15,4 +15,4 @@ do_install:append:class-native() {
 	create_wrapper ${D}/${bindir}/bindgen LIBCLANG_PATH="${STAGING_LIBDIR_NATIVE}"
 }
 
-BBCLASSEXTEND = "native"
+BBCLASSEXTEND = "native nativesdk"
-- 
2.49.0


