Return-Path: <abhishek.bachiphale@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 82D25C5DF6D
	for <webhook@archiver.kernel.org>; Wed, 19 Aug 2026 07:25:53 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.1848.1787124346846126749
 for <openembedded-core@lists.openembedded.org>;
 Wed, 19 Aug 2026 00:25:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=J8GqYaRq;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=26916d43a5=abhishek.bachiphale@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67J6SipK2842602
	for <openembedded-core@lists.openembedded.org>; Wed, 19 Aug 2026 07:25:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PPS06212021; bh=KpiqQsdNUP/mOmmNoy8v
	Q9U/Pj2hqmqK+WLcSQ0D0so=; b=J8GqYaRqC3VbYf1Wg3iFhnybiSNvUpusA+0K
	OU/ad2uuqCCdiuVEvkBlRue/rCTVIwJalULGAl6hKITW1P3kDWCxnYHHZHwupEfe
	a7zkjBSgoSPRtQnVLWUwinEQKZ8bAMFzD6ifvhfv+Hpwq/qHERkbbuB+odLFYOfk
	wBbypNyBpwcuGNjNCaXi+LPsAWmfVBGLJOz8ucsngNs24/5owEksg09B2peHZhc8
	GD2z0lAfL1L4m8F2MBviaJZqamQXrOO0zOqy4jMr3S2hvTieeJpoWJWjfSwY2uCS
	Gyo3wi4+SBhLw1x+/mQUGnuOpz7ujo2jyiZ6CELbivoGmz0bIg==
Received: from sn4pr2101cu001.outbound.protection.outlook.com (mail-southcentralusazon11022102.outbound.protection.outlook.com [40.93.195.102])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4g4yd9gn1v-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 19 Aug 2026 07:25:45 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bW5zA7t/o6d5+QydkMTWzNdEspOOFkGxlQuRz271CXiAj3MXwyw7ZziMWfZ7uIi/kEmOihVhhYoj8WOWh8542li9mRp2kou8tTpjwasztWXaSinE2buVw07dunYMA+ztO4gqNVWaWsCzNVfvTm8ISrwQBxNB2+HcODcAYUroZYKcfYJVpO8eoadVz1jQQinDrVI222TPtV9pg9SiRBYrua6hBVR1fdUHCNUnswKu1OFg7aabT5FZFccpNlhScoIetsetc9afydU3jNBhVYiRARraFB0zu0Js/g/IwZ4ULjI4ez86ykR6o+wIgbWgpy68GX9S1E0EJ/h7ibYNBCgSyw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KpiqQsdNUP/mOmmNoy8vQ9U/Pj2hqmqK+WLcSQ0D0so=;
 b=Ye8VzgSv1d1B3dp2B7NeIoamMDUI5giGkNnU/lr18migu3DWfG8wdpPUQF2V+j72NRxTeirQNmuEs8ufnoz0K+iXKDgunjTV4EKHfEalp61Em0XVGHrL6+P9nGtJRC1IszH6lzZ9fmCn1jOMVrxTXFk+zlH54b3UuyQLnKOO0Uisk6kD1KJojpK020FdeVjo3cYMWEVS41iv5YZZXjzklsXBp1tUFRt1Yf5PO2aotKy7ag+w9GpRUEbFsfKZLYNpOOmIe6kdHCBp+r72cTI2Cpw7AR/xnyhP2NEedY+eDFAA0jtixTVZSouotiM/+nyKKvtKdN+8uHgTEx/WZHGdXA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from IA0PR11MB8399.namprd11.prod.outlook.com (2603:10b6:208:48d::9)
 by DS4PPFDBB3A2AD4.namprd11.prod.outlook.com (2603:10b6:f:fc02::57) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.8; Wed, 19 Aug
 2026 07:25:42 +0000
Received: from IA0PR11MB8399.namprd11.prod.outlook.com
 ([fe80::ea10:3d10:93bf:f83c]) by IA0PR11MB8399.namprd11.prod.outlook.com
 ([fe80::ea10:3d10:93bf:f83c%4]) with mapi id 15.21.0339.007; Wed, 19 Aug 2026
 07:25:41 +0000
From: Abhishek Bachiphale <Abhishek.Bachiphale@windriver.com>
To: openembedded-core@lists.openembedded.org,
        Abhishek.Bachiphale@windriver.com
Subject: [wrynose][PATCH] perl: fix CVE-2026-42496 and CVE-2026-42497
Date: Wed, 19 Aug 2026 12:55:13 +0530
Message-Id: <20260819072513.3074937-1-Abhishek.Bachiphale@windriver.com>
X-Mailer: git-send-email 2.40.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SE2P216CA0161.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:2cb::15) To IA0PR11MB8399.namprd11.prod.outlook.com
 (2603:10b6:208:48d::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA0PR11MB8399:EE_|DS4PPFDBB3A2AD4:EE_
X-MS-Office365-Filtering-Correlation-Id: 0689005d-83f3-4f68-2a68-08defdc31334
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|52116014|376014|1800799024|23010399003|10067099003|56012099006|6133799003|12006099003|18002099003|11063799006|13003099007|38350700014;
X-Microsoft-Antispam-Message-Info: 
	Xqcdk69tHTWlkEZUr8YYTvg4k4ltPMGABPI9nNw982co9n1oUix05xEn674a0o4lSMaqYkNN2oolrbFldGsL9UKZH1NYhZgiPpdWxkkuPiAwy9RSE+fB76vcXlZEsYBqDEew7YstgijuWKnrBPSeemqIGhboyJiJrQg5Vs+/ZOxxAHgE0eEoQww0/LVyADSshIaVHfHgKsIQ0BSFT7bz9qLIRopM4KdsONPIRdEog7Za7ywXxIOm6yjKZw/FfY04KM3lmZjkadho+Fdc946DlczIcgN3CDeiBoKAOHmYmIKAEJWLj3m0uk/OacCuYHmPY5tlUeF52qAqg0bsAoZc1plxCC3h5XVviBMYpshoGGT6gfi6d8Iv8dVexayAodk9zr9Sm0lIG1O0GalMqnYn0094NFy64yYoSak76cTez+Xk/TbnUQg0KetTr43tR2LKLKuSxYEFB7hexTBmPBffd5DAYGVtG0qiCXuSRgvTLOMvut5MvDxfVia7NbrD/0n2wjXyOUd/ZQJEcl888RkMXV0PBG+DFAU6Z6Gnk9DYdA9viyxJfYpHgNf8fmZY2JQLpsqtWCnh0CiNpJ5k/KDCcOiqijhQsh/7FFoOpQ56AN8109TB87o6wFIQR74GZ06Q3CNfvt80cywanfUXUcVvhnI3el1eYxqOUG62g52yzNXRlmEtow5QB2sza4vfnEg0zkO5nbLUPuqclVXXKXnzBihe1dmijMFHnd8Xdx6lia8=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA0PR11MB8399.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(52116014)(376014)(1800799024)(23010399003)(10067099003)(56012099006)(6133799003)(12006099003)(18002099003)(11063799006)(13003099007)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?cmWofWQUj6KQU9rgioWqX1hzRsfMOscoWVWYxa1fNER/x7HpSSEs93LrSbIr?=
 =?us-ascii?Q?/5PdO/Q+GyxcqNU4DbOHf3tzHpKp/NGRzrhNc4yTnea95/BWkiun5med7bqJ?=
 =?us-ascii?Q?sCOA2ETtbYOmmMvcGHmk+UHti0F0tWwHzMmJxI9Py2YY31gU0HeavxLA46uN?=
 =?us-ascii?Q?NMo+6rbnRGGV2ODW07x19jhN+qPDTXGMkBo+IM9KkpQPTYdTANNutv5ugxNO?=
 =?us-ascii?Q?sxVcyq+CppKa+OswMNzlJZnGMGK8BrmNs9gY/SxUlvsi7TW6N1+U+RCu1zFV?=
 =?us-ascii?Q?VYZcCJHnzUPS+tknJqrOoQGaULD90DMUhlB0k7LVJ2XjgBDSa28Es9XJYwZe?=
 =?us-ascii?Q?U6dD8GwWZHwLasaP+LqDFbG2D2f7OlIVuB+kC0K0ZjiJT/2YOL/J+i4KSA1D?=
 =?us-ascii?Q?tJ2Qikld3jHU7aSzEIJrVxWP5TEA2VHSAQywkOZrRNl/2utGRiNe/sB6K4gU?=
 =?us-ascii?Q?kzDjSUjNdyD0s0Rak8xG5RNfjXYgKLu3kFTQ7QuyxWwlfJF72UCYWTkCpL+J?=
 =?us-ascii?Q?gb51jhz9ogbcDCc0Ktv9qkXU8dEPOB1j4bpvyCev2xT3mjnW9gA1VtqQVQ5a?=
 =?us-ascii?Q?WzhqT6lXSqa4o4mQvNYj2mBtNC0NTzYNPPVBuPm6Mzi2PDv2oQ4CvgYlpWv7?=
 =?us-ascii?Q?bF4a7yEPtizMAlmDM6E8Mze/tuw0wgwcM7vR+X3CyaIwC6W8yAgDOprDgFFM?=
 =?us-ascii?Q?PueQ3PRSMhN4zTDg6ZuD4DyuC8dcKuH9in0cDtauwCYqZ0XPXu7clXMlgwjZ?=
 =?us-ascii?Q?kIICtRKlQz1U+1SJqYU9k1T1o397y+7N6kvq73yZ0AlqYVGh74sYrijuAaxo?=
 =?us-ascii?Q?HFs3ZEMN7CQPDz/dS8sL8bjEIqHNd4t5UUpQvkJt6UqOiyef/ZXboPQVVBKB?=
 =?us-ascii?Q?IS0LUXIzDWi4fdSbGBsRonTcVw5ltCQ/ver7jfprzMrx+GCRz3Q8BsHYheUb?=
 =?us-ascii?Q?BOAXcNCHwro8GCU0jab/ZOleIlPcJ2RFMqvfxooO8UQET5wTmQ10UjeyeDNF?=
 =?us-ascii?Q?+EvjQGrHuCrkXmRy5ZxQQXor0Q7LgU3g1G1/Ic8KEOmeLdk7brpNsT2LYi3z?=
 =?us-ascii?Q?qeWSSx91rH6yP1GsOoONDQGLsUnxyNFALz6CCHYV1Oyjx3bzBmMd/8lQK0Yf?=
 =?us-ascii?Q?Fknw20RUvxkEc7VA607Buox8sQXZH4PNdYAGH4d3JXyp8lIX3MX4vmZTE7A9?=
 =?us-ascii?Q?fVyQapWLsJKV625NzjSf1vr7We439V0wsNY58arHsiAz85vSKYzj/7KWgBmu?=
 =?us-ascii?Q?SzdtudDkp1KO+xpH+guAWz+cYn0EB+L2qTKRT23CuyVG7K04o+RGp3zEN1c9?=
 =?us-ascii?Q?6hos4qQlwF8Qkc2FUtuLpKIhGiHluBAPc9HXPWDyWh+NZeW2+tAkfx8kaNnP?=
 =?us-ascii?Q?Ry5a0DhdmUnk3/5Q8HWD8Y4u/gOK7zZ+JxmlryTrOl13bAtGiIOEZObEK2BK?=
 =?us-ascii?Q?N1xcXhEAK0Zddsf63A5cNEiydDInLzfBb9sAHfYbDVKWEQoRRtaMlZJCUy2P?=
 =?us-ascii?Q?hYpPpOE5C4iBUwtwf/2FfZUCRHCxGzxxWAMS4T+PY8h/IqL4zoZPYHPfmD3l?=
 =?us-ascii?Q?e6fnnhmlNG2IDHqzP5moofZ5c+Gp0onEONVRQpfp01q60FSdQu3bWKXC03ht?=
 =?us-ascii?Q?XQJjkgOC2CHY3/jJtr30+cu+QdPM9reZWsVkse1oPnZ7SDmM/GeLgrS5AvL9?=
 =?us-ascii?Q?viYVqjKwVCrBj3Zg9LJbfL45TLAb9VqmWJ2ccb4hsHyOidclAw6wdpLkzvnv?=
 =?us-ascii?Q?UCk5QyAWHdSEHJgg0smnvcSv9qyue5Oil8E/3H87LODi5OnrowdW?=
X-Exchange-RoutingPolicyChecked: 
	MP3U1atYpvobyhjIGmSMxNLVuGoyLuMu1Lg9EbTY1vsT+Okws8XGDE0EHACI1oM7ESG5eBL28KjFfE8h/NsK7k92RhjRWKJMvCWerT5BQLDz6RF23TkOS9UKZ+W2N9VzIpXZawdVSG72Ic9iVt/vyijhy98TwvLluotti0Ir9z2bIFRPC+55LTxtH1nmvxlGEZT4srfNt5CrfSfUjrHicA2Ncymkmb6cy++7WtVuFHfRevfM2/S/4UyKxh0VD6fIMQIz8wcup1vu+TPppWQb2P60MP4NsAwfefbD0k/XTZERCKG8zW+Kvy0MkuQrqqZ5eh3BHPrYIf2HK3InAPlh6g==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0689005d-83f3-4f68-2a68-08defdc31334
X-MS-Exchange-CrossTenant-AuthSource: IA0PR11MB8399.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Aug 2026 07:25:41.8508
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3b60k6B8KKF2TglZDI3cK0UK+JpcN221NH5bZSZzpWS3BOntaeiRO8m7RkLseHhlQj0OPtMvWSe810RCHNXpoI7Yn/XTc1RYhDAq9qGdFb6LreHsx13uizQXmgtRVSo3
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS4PPFDBB3A2AD4
X-Authority-Analysis: v=2.4 cv=MbJcfZ/f c=1 sm=1 tr=0 ts=6a855a79 cx=c_pps
 a=wVfAXNSrx9oslCtdZ7LgKA==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=Sv0fKeRqtYgA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=klDOsUkWDRETUCZYPvoE:22 a=PYnjg3YJAAAA:8
 a=NEAV23lmAAAA:8 a=eNcD7ojaAAAA:8 a=t7CeM3EgAAAA:8 a=lXupWXD2AAAA:8
 a=uwCf13SJ4fwNhUlfeiUA:9 a=rRYMMicksRHQPzyJ67jW:22 a=FdTzh2GWekK77mhwV6Dw:22
 a=T8C0HOiIgABR7DzDG2IE:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE5MDA1NCBTYWx0ZWRfX7VEmBzuMpGgN
 Te6bRVD3Ae0pVlG/qegoxATCB6lhP8whnLBZoeGFtMEFr0GeUp+mzUAY1ApZEnykjxR1nmrFRKg
 O60CHPGIK6I9xAbIV6S1nhkhGFQCAVT1Ofzqk2LG11DdpWtUBI2M
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE5MDA1NCBTYWx0ZWRfX6meDKpbfqk2B
 vuL0jPaR7YjohYJzTWW81uY7SO+Lg2J9jLgCNsJVoxiI++g07BEHwK3tDmuP9j7kddvWonqnbyu
 y6virgt/DX9UzmB0H/LLBxvzYrz3Rv/mwknHTB3Wc5mkhC30sZyHFEuT5dB0zrMmDIDvjpo5EiQ
 mTRkJBdivqSrj2UnAK0lzTE2o4td3TfjNIdhAamO2k3HZI8FKC2YeJGVqRYrZ0hxbJ24jiCSqmz
 OQTXthFyIuvsur7xTNLMBTf/6Q1jA2ruIPTYWY1I4m15VY/aMsgifGOMVoy+KkXLazlBRJEEdH3
 IxpS3jOfI10I0gW2lOL3RccpIWfbpVqPF7XaRqU2WYBs/y2TfmenGawOyd3T9aNbCzmF8YArZ9r
 slU0RbcMShNvc2HpGbJ3I8mV1bNlI/7mPZbqtiWIIKHRKpIn6apNSRD9oMPh4HFJMDP2u5z8EO0
 quZ44DsQZwzBE8q5nJQ==
X-Proofpoint-ORIG-GUID: 7w5qa-OmFIiLanxMU1ox0ujIOdtgtZ3H
X-Proofpoint-GUID: 7w5qa-OmFIiLanxMU1ox0ujIOdtgtZ3H
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-19_02,2026-08-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 clxscore=1015 priorityscore=1501 bulkscore=0
 suspectscore=0 phishscore=0 malwarescore=0 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608190054
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 19 Aug 2026 07:25:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/243717

Archive::Tar before 3.08 passes the tar header's linkname directly to
symlink()/link() in _make_special_file() without validating absolute
paths or '..' segments. This allows a crafted tar archive to create
symlinks or hardlinks targeting paths outside the extraction directory,
leading to arbitrary file read/write.

Backport patch to fix CVE-2026-42496 and CVE-2026-42497.

Reference:
[https://nvd.nist.gov/vuln/detail/CVE-2026-42496]
[https://nvd.nist.gov/vuln/detail/CVE-2026-42497]

Upstream Patch:
[https://github.com/jib/archive-tar-new/commit/17c873492a05eddc0de18c1485e0b2cccd5a9158]

Signed-off-by: Abhishek Bachiphale <Abhishek.Bachiphale@windriver.com>
---
 .../perl/files/CVE-2026-42496.patch           | 99 +++++++++++++++++++
 meta/recipes-devtools/perl/perl_5.42.0.bb     |  1 +
 2 files changed, 100 insertions(+)
 create mode 100644 meta/recipes-devtools/perl/files/CVE-2026-42496.patch

diff --git a/meta/recipes-devtools/perl/files/CVE-2026-42496.patch b/meta/recipes-devtools/perl/files/CVE-2026-42496.patch
new file mode 100644
index 0000000000..ae370340cf
--- /dev/null
+++ b/meta/recipes-devtools/perl/files/CVE-2026-42496.patch
@@ -0,0 +1,99 @@
+From edde2083c6e93e42b979068af5529710b5e2a7ab Mon Sep 17 00:00:00 2001
+From: Stig Palmquist <stig@stig.io>
+Date: Thu, 21 May 2026 19:59:21 +0100
+Subject: [PATCH] Validate symlink and hardlink linkname in SECURE MODE
+
+Archive::Tar before 3.08 passes the tar header's linkname directly to
+symlink()/link() in _make_special_file() without validating absolute
+paths or '..' segments. This allows a crafted tar archive to create
+symlinks or hardlinks targeting paths outside the extraction directory,
+leading to arbitrary file read/write.
+
+Add validation in SECURE EXTRACT MODE (the default) to reject:
+- Symlink/hardlink targets with absolute paths
+- Symlink/hardlink targets containing '..' path traversal
+
+Adjusted patch paths from upstream Archive::Tar standalone repository
+(lib/Archive/Tar.pm) to match perl5 source tree layout
+(cpan/Archive-Tar/lib/Archive/Tar.pm).
+
+Upstream-Status: Backport [https://github.com/jib/archive-tar-new/commit/17c873492a05eddc0de18c1485e0b2cccd5a9158]
+
+CVE: CVE-2026-42496
+CVE: CVE-2026-42497
+
+Signed-off-by: Chris 'BinGOs' Williams <chris@bingosnet.co.uk>
+Signed-off-by: Abhishek Bachiphale <Abhishek.Bachiphale@windriver.com>
+---
+ cpan/Archive-Tar/lib/Archive/Tar.pm     | 30 +++++++++++++++++++++++++
+ cpan/Archive-Tar/t/04_resolved_issues.t |  2 ++
+ 2 files changed, 32 insertions(+)
+
+diff --git a/cpan/Archive-Tar/lib/Archive/Tar.pm b/cpan/Archive-Tar/lib/Archive/Tar.pm
+index 2df0931..733feef 100644
+--- a/cpan/Archive-Tar/lib/Archive/Tar.pm
++++ b/cpan/Archive-Tar/lib/Archive/Tar.pm
+@@ -954,6 +954,19 @@ sub _make_special_file {
+     my $err;
+ 
+     if( $entry->is_symlink ) {
++        if( !$INSECURE_EXTRACT_MODE ) {
++            my $linkname = $entry->linkname;
++            if( File::Spec->file_name_is_absolute($linkname) ) {
++                $self->_error( qq[Symlink '] . $entry->full_path .
++                    qq[' has absolute target. Not extracting under SECURE EXTRACT MODE] );
++                return;
++            }
++            if( grep { $_ eq '..' } File::Spec->splitdir($linkname) ) {
++                $self->_error( qq[Symlink '] . $entry->full_path .
++                    qq[' target attempts traversal. Not extracting under SECURE EXTRACT MODE] );
++                return;
++            }
++        }
+         my $fail;
+         if( ON_UNIX ) {
+             symlink( $entry->linkname, $file ) or $fail++;
+@@ -967,6 +980,23 @@ sub _make_special_file {
+                 $entry->linkname .q[' failed] if $fail;
+ 
+     } elsif ( $entry->is_hardlink ) {
++        if( !$INSECURE_EXTRACT_MODE ) {
++            my $linkname = $entry->linkname;
++            if( File::Spec->file_name_is_absolute($linkname) ) {
++                $self->_error( qq[Hardlink '] . $entry->full_path .
++                    qq[' has absolute target '$linkname'. Not extracting ] .
++                    qq[under SECURE EXTRACT MODE: extraction itself chmods ] .
++                    qq[the shared inode.] );
++                return;
++            }
++            if( grep { $_ eq '..' } File::Spec->splitdir($linkname) ) {
++                $self->_error( qq[Hardlink '] . $entry->full_path .
++                    qq[' target '$linkname' attempts traversal. Not ] .
++                    qq[extracting under SECURE EXTRACT MODE: extraction ] .
++                    qq[itself chmods the shared inode.] );
++                return;
++            }
++        }
+         my $fail;
+         if( ON_UNIX ) {
+             link( $entry->linkname, $file ) or $fail++;
+diff --git a/cpan/Archive-Tar/t/04_resolved_issues.t b/cpan/Archive-Tar/t/04_resolved_issues.t
+index b3566a1..08d339a 100644
+--- a/cpan/Archive-Tar/t/04_resolved_issues.t
++++ b/cpan/Archive-Tar/t/04_resolved_issues.t
+@@ -220,6 +220,7 @@ if ($^O ne 'msys') # symlink tests fail on Windows/msys2
+ 		}
+ 
+     { #use case 1 - in memory extraction
++      local $Archive::Tar::INSECURE_EXTRACT_MODE=1;
+ 			my $t=Archive::Tar->new;
+ 			$t->read( $archname );
+ 			my $r = eval{ $t->extract };
+@@ -231,6 +232,7 @@ if ($^O ne 'msys') # symlink tests fail on Windows/msys2
+ 
+ 		{ #use case 2 - iter extraction
+ 		  #$DB::single = 2;
++      local $Archive::Tar::INSECURE_EXTRACT_MODE=1;
+ 			my $next=Archive::Tar->iter( $archname, 1 );
+ 			my $failed = 0;
+ 			#use Data::Dumper;
diff --git a/meta/recipes-devtools/perl/perl_5.42.0.bb b/meta/recipes-devtools/perl/perl_5.42.0.bb
index 1833b7a352..70e14a9699 100644
--- a/meta/recipes-devtools/perl/perl_5.42.0.bb
+++ b/meta/recipes-devtools/perl/perl_5.42.0.bb
@@ -18,6 +18,7 @@ SRC_URI = "https://www.cpan.org/src/5.0/perl-${PV}.tar.gz;name=perl \
            file://0001-cpan-Sys-Syslog-Makefile.PL-Fix-_PATH_LOG-for-determ.patch \
            file://CVE-2026-8376-01.patch \
            file://CVE-2026-8376-02.patch \
+           file://CVE-2026-42496.patch \
            "
 SRC_URI:append:class-native = " \
            file://perl-configpm-switch.patch \
-- 
2.40.0


