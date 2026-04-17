Return-Path: <libo.chen.cn@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 527A1F8DFDF
	for <webhook@archiver.kernel.org>; Fri, 17 Apr 2026 08:27:45 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.39930.1776414459538829406
 for <openembedded-core@lists.openembedded.org>;
 Fri, 17 Apr 2026 01:27:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=VUK4h0By;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=856723d307=libo.chen.cn@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63H5qBBU923484
	for <openembedded-core@lists.openembedded.org>; Fri, 17 Apr 2026 08:27:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=PPS06212021;
	 bh=yiS5Nf3jWj4YQUnlwtlpkZSCytPDlhKTp34+CWyPxVc=; b=VUK4h0ByqZf+
	djqQzadzTp9aM2+CKQwG2Zk9ZntvK4iD+RknoaGIZAdOA6eASPHB9AoHYR3KV2aY
	9Mqkq3HJOv46XMKremnvyvAt81m45tJO7dEBIdHFIEVX1Cq1x+0z7pBiUicMzZTx
	iThWq7FS3Ts+6t2w9/YaQPDT2PpGYeEtVU3F0QZCF5uFKramspvKlbMRLrCjhImy
	+5/ONnEJPOCyM+RqN5t/xStfz0nSBchxc4ubeJDRJxzEiwoBmvAX+8PqqkKn014Q
	sohYoUyc60CO/LE/W/PI2IVvb8/8yzPf72SUQCX7DtrA0HD4BdOjXChhenaA5CzF
	7J1nc4zruQ==
Received: from cy3pr05cu001.outbound.protection.outlook.com (mail-westcentralusazon11013025.outbound.protection.outlook.com [40.93.201.25])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4dh877mu77-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Fri, 17 Apr 2026 08:27:38 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mNO065Jdr+Ohg4N19zDkh7GUz4LTuo3jQ548uColD5qvrJ9ZQoLHCGKyfB4bYGBg6Sp5beVRN6+szBAfIFmUup/hSmRAKVZ8Qizt7bvcFa3sW92v3m31jNVaC1tJLFAegFJcqotWXDKL4d0bVU3W/K2gVxzHc3PeZDwwOR20BLGFVya/2njUj10dCaZxVAqY1x+QAzEOEuqHhCxaNxH9liQ7zmcUxeXt06haqHSosmRgekK6kAWfTS10kPDpMOPJRVHrMp9/AZ1d3M9ql394XRWSmGgo6/Y9mpZ3yeB6k3C0CFnPX5xF+Rm+N8QGLUGioPFNNOuu8hkWKHjbaIafKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yiS5Nf3jWj4YQUnlwtlpkZSCytPDlhKTp34+CWyPxVc=;
 b=ZG4g7vtsZCRd1cVoYpMLhLZ9a8kyyyLcOAV/cOTJSrRJ72HqcyrBkAFWZNmIKwiyC/1ks04N32wyM7t11ggPrdpA7NQlxoVQkyEVSlSLuiJVFM1f6lv1DDoLBqm0aEy44JLKBRbsWGPvg0AlX4fAO4PMQoGLhxXK4UvuoM/al11q0ujSMqf+8f9h2/VLERPngHhEELDK1EPeuMCDdTMyK4TzuS/lVKEP7LT52QTIUiynRVJUjzQd38eOdHoZqVc3KFd5ESCgogaahjigO+FcmQvbuWEgtp9A7ylqeaOIxRm1b6Sfi1njzrXztlCEXSQ9d3pB4txn8UATfWepqB6AbQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from BN9PR11MB5354.namprd11.prod.outlook.com (2603:10b6:408:11b::7)
 by PH8PR11MB6732.namprd11.prod.outlook.com (2603:10b6:510:1c8::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9818.25; Fri, 17 Apr
 2026 08:27:34 +0000
Received: from BN9PR11MB5354.namprd11.prod.outlook.com
 ([fe80::4a0e:caa8:c2fa:8700]) by BN9PR11MB5354.namprd11.prod.outlook.com
 ([fe80::4a0e:caa8:c2fa:8700%3]) with mapi id 15.20.9818.017; Fri, 17 Apr 2026
 08:27:34 +0000
From: libo.chen.cn@windriver.com
To: openembedded-core@lists.openembedded.org
Subject: [oe] [meta-oe][scarthgap][PATCH v3 03/11] hdf5: fix CVE-2025-6857
Date: Fri, 17 Apr 2026 16:25:20 +0800
Message-Id: <20260417082520.3451816-1-libo.chen.cn@windriver.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <CA+s=J=zvrCt_hz5vrF0ZT4Gc1yH+K0C0yWe3mqjBtqa7w9Bt9g@mail.gmail.com>
References: <CA+s=J=zvrCt_hz5vrF0ZT4Gc1yH+K0C0yWe3mqjBtqa7w9Bt9g@mail.gmail.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TYCP286CA0201.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:385::15) To BN9PR11MB5354.namprd11.prod.outlook.com
 (2603:10b6:408:11b::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR11MB5354:EE_|PH8PR11MB6732:EE_
X-MS-Office365-Filtering-Correlation-Id: 266530ec-c0d9-48f2-862a-08de9c5b2cd6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|52116014|376014|1800799024|366016|13003099007|38350700014|18002099003|22082099003|56012099003;
X-Microsoft-Antispam-Message-Info: 
	MWa9EhWghr/SVMl7xz/mhAlPrSL5mOPHXB4vjYUBNpbo23DlNQEw1ROykWtAFt8SAEcMLzxjQsZNnU4VmJ4X5jTPnLGQt/QEiQglyifznZfx0U5msLewrJgXSs93ICqYowfEgIDYlMhzN8Fg9O8ouUN8cTERF3s8zTJYL8IsMqvWsBglq3QXHGJtLtJ7zPJqecjfQ1RJvDgzNRDekQbABFnKO2jUwJwamvC/HexVEEjQlQL+5Hc95C2XUjP/EGlJHxtZHLLzmSqsIwdhKp49+HyGEw8DaN4FR0uU5y6nNZtrUP4fURWtJMh1aa4XSH4EOJKrF+9uQfh7ijdcdXU0EO1Y6X6Z0SNr3JVVGXdA47HxMDwPq72pF4FsjuWCIVau6H0P3OxS4CMlWqJlKNkw920zwvK2ppOxDEa1F7ZXJXQ2nmqI4HoK0upUPOJEyz/LMdRUb7tzIcOlcfdtARG8r4pXymHQRLc4JAB/Svru9ZS3JHbXFLjWg1Sskay6cY81qqmyceRoEvkfVX6NYGA+q76CfHJYUUmaX+p5AGbWps2iG7WXxHBVA3oNcT52S8qWj6QqsMBwRiWcVBEcv1SUq5ITDbP67NVRK+gnqqr+kFxy8MIGoV5ncP9xpsIz2/YKgcph9xjyEnK1NB3tw3GkcJMowU7lqxJXzD/LZlW+AebT9ObEa3hQwKJ7iJ3bDiabl40M/qyfeZo2Aj00UfnYXQz+Ew6W1AlTElTbcBho886EC1OVB06zIWH2s98URzccGw3Tu6WjTaPXcAvuBOUR+4uc4CckDjoOtkeY/tx3OvbTCHExZaYs1JJ06N1f1Seg
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN9PR11MB5354.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(1800799024)(366016)(13003099007)(38350700014)(18002099003)(22082099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?M9msGp1eOersvvUvltbVzrtsUXpXxZRuK9D4uQkZhBwOekuuCs+F7GJLXXYG?=
 =?us-ascii?Q?h6Vx8d5kuD4Kak5IaXRobVdZmJqUPwwCZvxz6PVztvgMbdm2WJRLQmEOFSeX?=
 =?us-ascii?Q?GVeo+lcdP9CwS0vvzzupkZv4QT4QOW+dW0FOBFNkIwqXdi8/tKr2QrhciaI+?=
 =?us-ascii?Q?QUoUcDUOWPs69sEvkweQzdJdmpCnVsdTl8AGS5ADyxCHwHQGMwoF9VO4eoOh?=
 =?us-ascii?Q?VT6F7cx+XS90Aya9reUE8b6vpvCGWgnVrFdVE1aYNbElkBKeVhYNgDxz7PsN?=
 =?us-ascii?Q?dkl35Baj9q5qFRiY/dk6d0P5HDJn8P/95w0U2sKVKaN0ybSdG9Kz9gjRoY6p?=
 =?us-ascii?Q?A59/hHMqlp5cUhq6ub9oTTEIAQ3CpQCVcJQoN88fHiGM+R3zPkNYsvSx+mv4?=
 =?us-ascii?Q?x64bGl4z7nMDCU7IIJrobjoa5zCRTvBp1BK+IL1JOcPUIrYt+LxRC2DegPm6?=
 =?us-ascii?Q?A17q+33mAOqeC12gazXLEurV8k02N27HpKBCJQOQo/FsFus1bfvvZ+8TOO3h?=
 =?us-ascii?Q?S6MQ7dO9ciMzuQC2G3ZcZ3D7DWQryuKZA9yKkOCYj3UGU2gLucjVulrLXGIF?=
 =?us-ascii?Q?7eXmbNsBIUIEI2Z7nMh4A6k72NeemQAD4BrNzMzleyV/YCexIbjRx9EcI2MT?=
 =?us-ascii?Q?v2upb9zDB9TeThlnMq4hxkizqH4yB0CMB5vV3jzoz0ZHjjJ8lJ15uM80lkC3?=
 =?us-ascii?Q?Gt3GRHah3oOe2pY4tyPNEopJZUOYt9lsvTX40yxMxvi4W8VD2vOR3nq22G/Y?=
 =?us-ascii?Q?aEmjEYgZIwEgxa1M6kf7DCn+dklMzmjC7RrJs261TT1q56N93EjBqvI8WlFw?=
 =?us-ascii?Q?5035rFn8TAqRip1DTKnu4d1dytm+mDo2S9CJ+6eOBtl/6eR88OEzYXeqWCyt?=
 =?us-ascii?Q?xU8bxjo0L4s/yqDUo543HTCJ0ZGAveDxSzT0dhwzAqyBPTv+NAUD37TzvIns?=
 =?us-ascii?Q?9v25w6WmK2CLgR6YyAQL5b4Eza+7R2OSoDNSHY73YVsZkeDJyuIsBVshgei+?=
 =?us-ascii?Q?Sz4DKoCOx0KLzr/9rj2fJh966If4uG8JUoPA5Dhztd72F/ggKZpOl7MZGWup?=
 =?us-ascii?Q?o7sPRK+fH6AVPRl5CdHd0s91vzOkio2DRQ7T+Gu3PSbklWhfuY3DzbSGtF7p?=
 =?us-ascii?Q?EP1S7hSNIsg/+VgK+OpShfzWOS7i8ay6AZuv7rtGtV8vsgOi8IDfA74xsd8d?=
 =?us-ascii?Q?U5xADCcYIx7lPoRJlb0kVzDiUEbnj9M9DPvhCYj8NBessSLSfJ0u409IY89x?=
 =?us-ascii?Q?9LUX3CFI6j4HAtUOX9j3j8oGdFR1TsUph7ZPHX5evSOfz0YLp8DLQbXKhjh7?=
 =?us-ascii?Q?bUf5/wXz+30hu7XHhTCvcq0wAHf2ZXBy+VlCffbGjBPmqnnwcG4kHlr0OxtB?=
 =?us-ascii?Q?keSIN1pNHtC9DwsvJ8UMSsVit0EvNX9H94N0mJLPASAXsVUyK+GdkVw5pUSK?=
 =?us-ascii?Q?WDyMirSXPHrXCgo8B8YqOMUdV+IMkcLdDoHevlz1Mmohn2LQkxvBNOH3Yf8X?=
 =?us-ascii?Q?XvmhqeH5gqUN3hiVAFeHCne+chy6SaX3QAzt36lY6LCUFVyIqdghGrrqpvFk?=
 =?us-ascii?Q?9cRvl4iIrenaEoUPCR/eiW1sDxcD/KgaiQ+do04PuUAcC31UpQW9Ya1UEba1?=
 =?us-ascii?Q?SDQk8raOxx0mxUaUiypSTmBMFOQrmWcvdBMEQLL/KAh2azGjdohZ1p8rl4U3?=
 =?us-ascii?Q?+lkIVCsE7+8GVORzPUWrQwTwfTIdJfZIH/HPKpsXfpwkZhVjV+iFL8l1EhvP?=
 =?us-ascii?Q?+iaA+wdZXwWNfpvmRFOsrDqWTWxLDV8=3D?=
X-Exchange-RoutingPolicyChecked: 
	CdcEk9zgpsTptqDA8WH+4ox/80lZzKIa/49eijY4nvXJpbsPxR8pHX+zlovCo5m0hxzbd1s5jmGy3S4hWUCbTmjBSQWpCek651JfFj2EPZckKB1wtGzGzYEpFMSg78zJV3RmHqYx6RLZk6pnf/KNHtQy/tgtAJ4pjr2Eq8B4vqogDdufaTlQTtWM3E3+cDeGYtk7I928chh3z3pddTASEyUwpf3leQYaJbuhTVdhT8UPk9Y0aV46eY9/utjodO3gTz5kRYPtfoXk8tJgaQip7hGJMl05NUFj6eZjbQVaFkUm22qk4v6KG/CWpP6AY6C1b+lnLWenlApN8B/+5GBs/Q==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 266530ec-c0d9-48f2-862a-08de9c5b2cd6
X-MS-Exchange-CrossTenant-AuthSource: BN9PR11MB5354.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Apr 2026 08:27:34.4885
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CjSAnLq0dCTffJVkzbXWz0Ao/ipu5mgFCJghH2DvDAEQULd4+bCQjPICM6ZL+rixtQTFNKi1nMnXzLBOCQLcuGUQNIz6QRK1xsZlNoSVJxY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB6732
X-Proofpoint-ORIG-GUID: oCkijW7Pfxet9qpOR3SkG00oCvkZvP2_
X-Authority-Analysis: v=2.4 cv=ZtHd7d7G c=1 sm=1 tr=0 ts=69e1eefa cx=c_pps
 a=7LdyZ4/2TJtu80KvlWUjDA==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=A5OVakUREuEA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=fTW__CHxibyLmBMfj2wP:22 a=PYnjg3YJAAAA:8
 a=NEAV23lmAAAA:8 a=t7CeM3EgAAAA:8 a=4GNiTbcGMzrreblgCxIA:9
 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: oCkijW7Pfxet9qpOR3SkG00oCvkZvP2_
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDE3MDA4MyBTYWx0ZWRfX23JCavassXZe
 wjuwfaNA2OFomLTnqXR2gEYBgPzRdVPuFpA1UfvzEWfTIROMA/PvM6uMglPrnpBcGiJrAOYIM+Q
 hIlp+0I61YNmVjZNQ+DCXOvSevwCmktBy2eV0lsH5grYPmuvcaWMyQNx9AV8vW9GyeCqjxJifuN
 WTuriV3Cb/Kdp6AJu6Fp4Fjsk6pGP+6lUq8Xvr4dZZndbR+IooENilIVuXkTr/WXJClH+Mrl+m3
 zCZyg7kS5QGRTi+mkQP3up64SD1m7mBT3OiQQM2HLuWf7TM8SjrQAqH9yP/HGuyEYtfQnmmJywb
 6a4x8niogaPeJfElO7+OiUI3M1ydEMQsy0gcnCHCcm337rpVzjR+PPyvTg+gGSWpLPz58Fl87jC
 9A2Fb3st15EyojWA6m5LstGfdPB+QYFdd6bCN6bcCR4znigzaKmHnaUf7NGD/ZFGrFUaL7u3oU1
 +TCHqgl98ad3DzyicaQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-16_04,2026-04-16_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1011 malwarescore=0 impostorscore=0 adultscore=0
 suspectscore=0 bulkscore=0 priorityscore=1501 spamscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604070000 definitions=main-2604170083
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 17 Apr 2026 08:27:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/235488

From: Libo Chen <libo.chen.cn@windriver.com>

According to [1], A vulnerability has been found in HDF5 1.14.6 and
classified as problematic. Affected by this vulnerability is the function
H5G__node_cmp3 of the file src/H5Gnode.c. The manipulation leads to
stack-based buffer overflow. It is possible to launch the attack on the
local host. The exploit has been disclosed to the public and may be used.

Backport patch [2] from upstream to fix CVE-2025-6857

[1] https://nvd.nist.gov/vuln/detail/CVE-2025-6857
[2] https://github.com/HDFGroup/hdf5/commit/a8ceb1d95bb997f548c1129363dad53c18540096

Signed-off-by: Libo Chen <libo.chen.cn@windriver.com>
---
 .../hdf5/files/CVE-2025-6857.patch            | 255 ++++++++++++++++++
 meta-oe/recipes-support/hdf5/hdf5_1.14.4-3.bb |   1 +
 2 files changed, 256 insertions(+)
 create mode 100644 meta-oe/recipes-support/hdf5/files/CVE-2025-6857.patch

diff --git a/meta-oe/recipes-support/hdf5/files/CVE-2025-6857.patch b/meta-oe/recipes-support/hdf5/files/CVE-2025-6857.patch
new file mode 100644
index 0000000000..cc1301fb94
--- /dev/null
+++ b/meta-oe/recipes-support/hdf5/files/CVE-2025-6857.patch
@@ -0,0 +1,255 @@
+From eb3af284cc0ac8c758c65f492fc693ed50539592 Mon Sep 17 00:00:00 2001
+From: Libo Chen <libo.chen.cn@windriver.com>
+Date: Thu, 29 Jan 2026 13:59:39 +0800
+Subject: [PATCH] Fix CVE-2025-6857
+
+Add additional checks for v1 B-tree corruption
+
+An HDF5 file had a corrupted v1 B-tree that would result in a stack overflow when performing a lookup on it. This has been fixed with additional integrity checks.
+
+CVE: CVE-2025-6857
+
+Upstream-Status: Backport [https://github.com/HDFGroup/hdf5/commit/a8ceb1d95bb997f548c1129363dad53c18540096]
+
+In addition to the upstream backport, this patch includes two adaptation 
+changes for HDF5 1.14.4. First, the H5B_UNKNOWN_NODELEVEL macro and the 
+exp_level field are introduced in H5Bpkg.h, as these do not exist in 1.14.4 
+due to differences with the 2.0.0 codebase. Second, the 
+"cache_udata.exp_level = H5B_UNKNOWN_NODELEVEL" statements are added in H5B_* 
+functions to initialize the new field.
+
+Signed-off-by: Libo Chen <libo.chen.cn@windriver.com>
+---
+ src/H5B.c    | 92 +++++++++++++++++++++++++++++++++++++++++++---------
+ src/H5Bpkg.h |  6 ++++
+ 2 files changed, 83 insertions(+), 15 deletions(-)
+
+diff --git a/src/H5B.c b/src/H5B.c
+index 5a7a238..4efa679 100644
+--- a/src/H5B.c
++++ b/src/H5B.c
+@@ -140,6 +140,8 @@ typedef struct H5B_ins_ud_t {
+ /********************/
+ /* Local Prototypes */
+ /********************/
++static herr_t    H5B_find_helper(H5F_t *f, const H5B_class_t *type, haddr_t addr, int exp_level, bool *found,
++                                 void *udata);
+ static H5B_ins_t H5B__insert_helper(H5F_t *f, H5B_ins_ud_t *bt_ud, const H5B_class_t *type, uint8_t *lt_key,
+                                     bool *lt_key_changed, uint8_t *md_key, void *udata, uint8_t *rt_key,
+                                     bool *rt_key_changed, H5B_ins_ud_t *split_bt_ud /*out*/);
+@@ -252,26 +254,67 @@ done:
+ } /* end H5B_create() */
+ 
+ /*-------------------------------------------------------------------------
+- * Function:	H5B_find
++ * Function:    H5B_find
+  *
+- * Purpose:	Locate the specified information in a B-tree and return
+- *		that information by filling in fields of the caller-supplied
+- *		UDATA pointer depending on the type of leaf node
+- *		requested.  The UDATA can point to additional data passed
+- *		to the key comparison function.
++ * Purpose:     Locate the specified information in a B-tree and return
++ *              that information by filling in fields of the
++ *              caller-supplied UDATA pointer depending on the type of leaf
++ *              node requested.  The UDATA can point to additional data
++ *              passed to the key comparison function.
+  *
+- * Note:	This function does not follow the left/right sibling
+- *		pointers since it assumes that all nodes can be reached
+- *		from the parent node.
++ * Note:        This function does not follow the left/right sibling
++ *              pointers since it assumes that all nodes can be reached
++ *              from the parent node.
+  *
+- * Return:	Non-negative (true/false) on success (if found, values returned
+- *              through the UDATA argument). Negative on failure (if not found,
+- *              UDATA is undefined).
++ * Return:      Non-negative (true/false) on success (if found, values
++ *              returned through the UDATA argument). Negative on failure
++ *              (if not found, UDATA is undefined).
+  *
+  *-------------------------------------------------------------------------
+  */
+ herr_t
+ H5B_find(H5F_t *f, const H5B_class_t *type, haddr_t addr, bool *found, void *udata)
++{
++    herr_t ret_value = SUCCEED;
++
++    FUNC_ENTER_NOAPI(FAIL)
++
++    /*
++     * Check arguments.
++     */
++    assert(f);
++    assert(type);
++    assert(type->decode);
++    assert(type->cmp3);
++    assert(type->found);
++    assert(H5_addr_defined(addr));
++
++    if ((ret_value = H5B_find_helper(f, type, addr, H5B_UNKNOWN_NODELEVEL, found, udata)) < 0)
++        HGOTO_ERROR(H5E_BTREE, H5E_NOTFOUND, FAIL, "can't lookup key");
++
++done:
++    FUNC_LEAVE_NOAPI(ret_value)
++} /* end H5B_find() */
++
++/*-------------------------------------------------------------------------
++ * Function:    H5B_find_helper
++ *
++ * Purpose:     Recursive helper routine for H5B_find used to track node
++ *              levels and attempt to detect B-tree corruption during
++ *              lookups.
++ *
++ * Note:        This function does not follow the left/right sibling
++ *              pointers since it assumes that all nodes can be reached
++ *              from the parent node.
++ *
++ * Return:      Non-negative on success (if found, values returned through
++ *              the UDATA argument). Negative on failure (if not found,
++ *              UDATA is undefined).
++ *
++ *-------------------------------------------------------------------------
++ */
++static herr_t
++H5B_find_helper(H5F_t *f, const H5B_class_t *type, haddr_t addr, int exp_level, bool *found, void *udata)
+ {
+     H5B_t         *bt = NULL;
+     H5UC_t        *rc_shared;           /* Ref-counted shared info */
+@@ -281,7 +324,7 @@ H5B_find(H5F_t *f, const H5B_class_t *type, haddr_t addr, bool *found, void *uda
+     int            cmp       = 1;       /* Key comparison value */
+     herr_t         ret_value = SUCCEED; /* Return value */
+ 
+-    FUNC_ENTER_NOAPI(FAIL)
++    FUNC_ENTER_NOAPI_NOINIT
+ 
+     /*
+      * Check arguments.
+@@ -306,6 +349,7 @@ H5B_find(H5F_t *f, const H5B_class_t *type, haddr_t addr, bool *found, void *uda
+     cache_udata.f         = f;
+     cache_udata.type      = type;
+     cache_udata.rc_shared = rc_shared;
++    cache_udata.exp_level = exp_level;
+     if (NULL == (bt = (H5B_t *)H5AC_protect(f, H5AC_BT, addr, &cache_udata, H5AC__READ_ONLY_FLAG)))
+         HGOTO_ERROR(H5E_BTREE, H5E_CANTPROTECT, FAIL, "unable to load B-tree node");
+ 
+@@ -329,7 +373,17 @@ H5B_find(H5F_t *f, const H5B_class_t *type, haddr_t addr, bool *found, void *uda
+         assert(idx < bt->nchildren);
+ 
+         if (bt->level > 0) {
+-            if ((ret_value = H5B_find(f, type, bt->child[idx], found, udata)) < 0)
++            /* Sanity check to catch the case where the current node points to
++             * itself and the current node was loaded with an expected node level
++             * of H5B_UNKNOWN_NODELEVEL, thus bypassing the expected node level
++             * check during deserialization and in the future if the node was
++             * cached.
++             */
++            if (bt->child[idx] == addr)
++                HGOTO_ERROR(H5E_BTREE, H5E_BADVALUE, FAIL, "cyclic B-tree detected");
++
++            if ((ret_value = H5B_find_helper(f, type, bt->child[idx], (int)(bt->level - 1), found, udata)) <
++                0)
+                 HGOTO_ERROR(H5E_BTREE, H5E_NOTFOUND, FAIL, "can't lookup key in subtree");
+         } /* end if */
+         else {
+@@ -343,7 +397,7 @@ done:
+         HDONE_ERROR(H5E_BTREE, H5E_CANTUNPROTECT, FAIL, "unable to release node");
+ 
+     FUNC_LEAVE_NOAPI(ret_value)
+-} /* end H5B_find() */
++} /* end H5B_find_helper() */
+ 
+ /*-------------------------------------------------------------------------
+  * Function:	H5B__split
+@@ -425,6 +479,7 @@ H5B__split(H5F_t *f, H5B_ins_ud_t *bt_ud, unsigned idx, void *udata, H5B_ins_ud_
+     cache_udata.f         = f;
+     cache_udata.type      = shared->type;
+     cache_udata.rc_shared = bt_ud->bt->rc_shared;
++    cache_udata.exp_level = H5B_UNKNOWN_NODELEVEL;
+     if (NULL == (split_bt_ud->bt =
+                      (H5B_t *)H5AC_protect(f, H5AC_BT, split_bt_ud->addr, &cache_udata, H5AC__NO_FLAGS_SET)))
+         HGOTO_ERROR(H5E_BTREE, H5E_CANTPROTECT, FAIL, "unable to protect B-tree");
+@@ -532,6 +587,7 @@ H5B_insert(H5F_t *f, const H5B_class_t *type, haddr_t addr, void *udata)
+     cache_udata.f         = f;
+     cache_udata.type      = type;
+     cache_udata.rc_shared = rc_shared;
++    cache_udata.exp_level = H5B_UNKNOWN_NODELEVEL;
+     bt_ud.addr            = addr;
+     if (NULL == (bt_ud.bt = (H5B_t *)H5AC_protect(f, H5AC_BT, addr, &cache_udata, H5AC__NO_FLAGS_SET)))
+         HGOTO_ERROR(H5E_BTREE, H5E_CANTPROTECT, FAIL, "unable to locate root of B-tree");
+@@ -789,6 +845,7 @@ H5B__insert_helper(H5F_t *f, H5B_ins_ud_t *bt_ud, const H5B_class_t *type, uint8
+     cache_udata.f         = f;
+     cache_udata.type      = type;
+     cache_udata.rc_shared = rc_shared;
++    cache_udata.exp_level = H5B_UNKNOWN_NODELEVEL;
+ 
+     if (0 == bt->nchildren) {
+         /*
+@@ -1077,6 +1134,7 @@ H5B__iterate_helper(H5F_t *f, const H5B_class_t *type, haddr_t addr, H5B_operato
+     cache_udata.f         = f;
+     cache_udata.type      = type;
+     cache_udata.rc_shared = rc_shared;
++    cache_udata.exp_level = H5B_UNKNOWN_NODELEVEL;
+     if (NULL == (bt = (H5B_t *)H5AC_protect(f, H5AC_BT, addr, &cache_udata, H5AC__READ_ONLY_FLAG)))
+         HGOTO_ERROR(H5E_BTREE, H5E_CANTPROTECT, H5_ITER_ERROR, "unable to load B-tree node");
+ 
+@@ -1190,6 +1248,7 @@ H5B__remove_helper(H5F_t *f, haddr_t addr, const H5B_class_t *type, int level, u
+     cache_udata.f         = f;
+     cache_udata.type      = type;
+     cache_udata.rc_shared = rc_shared;
++    cache_udata.exp_level = H5B_UNKNOWN_NODELEVEL;
+     if (NULL == (bt = (H5B_t *)H5AC_protect(f, H5AC_BT, addr, &cache_udata, H5AC__NO_FLAGS_SET)))
+         HGOTO_ERROR(H5E_BTREE, H5E_CANTPROTECT, H5B_INS_ERROR, "unable to load B-tree node");
+ 
+@@ -1542,6 +1601,7 @@ H5B_delete(H5F_t *f, const H5B_class_t *type, haddr_t addr, void *udata)
+     cache_udata.f         = f;
+     cache_udata.type      = type;
+     cache_udata.rc_shared = rc_shared;
++    cache_udata.exp_level = H5B_UNKNOWN_NODELEVEL;
+     if (NULL == (bt = (H5B_t *)H5AC_protect(f, H5AC_BT, addr, &cache_udata, H5AC__NO_FLAGS_SET)))
+         HGOTO_ERROR(H5E_BTREE, H5E_CANTPROTECT, FAIL, "unable to load B-tree node");
+ 
+@@ -1782,6 +1842,7 @@ H5B__get_info_helper(H5F_t *f, const H5B_class_t *type, haddr_t addr, const H5B_
+     cache_udata.f         = f;
+     cache_udata.type      = type;
+     cache_udata.rc_shared = rc_shared;
++    cache_udata.exp_level = H5B_UNKNOWN_NODELEVEL;
+     if (NULL == (bt = (H5B_t *)H5AC_protect(f, H5AC_BT, addr, &cache_udata, H5AC__READ_ONLY_FLAG)))
+         HGOTO_ERROR(H5E_BTREE, H5E_CANTPROTECT, FAIL, "unable to load B-tree node");
+ 
+@@ -1923,6 +1984,7 @@ H5B_valid(H5F_t *f, const H5B_class_t *type, haddr_t addr)
+     cache_udata.f         = f;
+     cache_udata.type      = type;
+     cache_udata.rc_shared = rc_shared;
++    cache_udata.exp_level = H5B_UNKNOWN_NODELEVEL;
+     if (NULL == (bt = (H5B_t *)H5AC_protect(f, H5AC_BT, addr, &cache_udata, H5AC__READ_ONLY_FLAG)))
+         HGOTO_ERROR(H5E_BTREE, H5E_CANTPROTECT, FAIL, "unable to protect B-tree node");
+ 
+diff --git a/src/H5Bpkg.h b/src/H5Bpkg.h
+index d1ad647..f75e857 100644
+--- a/src/H5Bpkg.h
++++ b/src/H5Bpkg.h
+@@ -39,6 +39,11 @@
+ /* # of bits for node level: 1 byte */
+ #define LEVEL_BITS 8
+ 
++/* Indicates that the level of the current node is unknown.  When the level
++ * is known, it can be used to detect corrupted level during decoding
++ */
++#define H5B_UNKNOWN_NODELEVEL -1
++
+ /****************************/
+ /* Package Private Typedefs */
+ /****************************/
+@@ -60,6 +65,7 @@ typedef struct H5B_t {
+ typedef struct H5B_cache_ud_t {
+     H5F_t                    *f;         /* File that B-tree node is within */
+     const struct H5B_class_t *type;      /* Type of tree */
++    int                       exp_level; /* Expected level of the current node */
+     H5UC_t                   *rc_shared; /* Ref-counted shared info */
+ } H5B_cache_ud_t;
+ 
+-- 
+2.34.1
+
diff --git a/meta-oe/recipes-support/hdf5/hdf5_1.14.4-3.bb b/meta-oe/recipes-support/hdf5/hdf5_1.14.4-3.bb
index b31a8d8cfa..816bd752a1 100644
--- a/meta-oe/recipes-support/hdf5/hdf5_1.14.4-3.bb
+++ b/meta-oe/recipes-support/hdf5/hdf5_1.14.4-3.bb
@@ -29,6 +29,7 @@ SRC_URI = " \
     file://CVE-2025-44905.patch \
     file://CVE-2025-2309.patch \
     file://CVE-2025-2308.patch \
+    file://CVE-2025-6857.patch \
 "
 SRC_URI[sha256sum] = "019ac451d9e1cf89c0482ba2a06f07a46166caf23f60fea5ef3c37724a318e03"
 
-- 
2.34.1


