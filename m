Return-Path: <peng.zhang1.cn@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6E4B6CCD1A5
	for <webhook@archiver.kernel.org>; Mon, 27 Oct 2025 06:09:41 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.25787.1761545374289940035
 for <openembedded-core@lists.openembedded.org>;
 Sun, 26 Oct 2025 23:09:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=qGNIoOST;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=23958346cd=peng.zhang1.cn@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 59R5coMc2351312
	for <openembedded-core@lists.openembedded.org>; Mon, 27 Oct 2025 06:09:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=PPS06212021;
	 bh=CZsy0bXrc/xkAa7VGJjUd9ozWMY5EHmXCHLe29DdxZ0=; b=qGNIoOSTGxst
	+EeaXCNr+p9aGRJ3/HZOh8uA3QQqsnITkeHZUrJbXOC8iXFBpyD2XY1MAlNz36JJ
	lLvkHLgqApRU8iTCaT9cnWMRuic1c64EoKDtImkWr9m+YjG5kl5RVbwf/3tB773t
	RHEIWYBRj+TvAt9y+GcRiKmgYkT7gdrVm/S+DnitNusYDVgwGI1+DHCRdYTBF49m
	baMcrLjxXtnt/Rvb0Ipzfyclv0lqXPC9hQ5HnhKQrHayblYNLSU+35gqkRoq1HQ/
	hzrQ79c9iSHvLrTvQY4OD3fPM+ZdUf8NdPagGMcf67ltFAuG3eTqgbrp+bMFq9OW
	fTpo75IK5g==
Received: from bn1pr04cu002.outbound.protection.outlook.com (mail-eastus2azon11010064.outbound.protection.outlook.com [52.101.56.64])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4a0ks01h5e-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Mon, 27 Oct 2025 06:09:33 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vhitTMg1u8VUx4Iux+NTU4lqzjFVrTFjebHeqbp3NDTgSyy7Rk/d3D/R2znxLVIJ0uTcGYpk9VPMTqHZ5byKxuPLZl4U9y31a6WGhSaGZTiOGqaA4pU+1N3OQ67IO7XsfiS2tDeiNLs/l4ecyUCnJMWMBx8RsPFOwjkzyo0U6ABnreKpc2mpZk+9HmjGXpkqArcn0KgzBbovbFEO8pMx7ZcAnU5iYjwKAgtf4F1DLvvZclN0AnWWjXyNUFkC5gfCCzm0BT7LLnKfGxq61L5biri0OJZz3efzSPJ1CBi9eqj3tw2r7v8ZQr/b0rB7EPA0Gfv67UkGSLiuIkVxK+Y4TQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CZsy0bXrc/xkAa7VGJjUd9ozWMY5EHmXCHLe29DdxZ0=;
 b=WOI55nUoHRvEU1PBxZuSzFfNpq2+8VJzB+i6BCiRWy9bTx7rpS17iVa4OesfP2WXyDbctXuBDP8vE2QjG4XNKq6U0QlO7Daa4el9bc3tx96nZRdBswtOs/xRW7K90Cf+SbJzyUtH03bO7x9/eYvllJGAAzq+I3PjCDpBQBcFmRyj8VrHwe6wSKnRbbDLe45cfz32SH8a1IAp1nP8o3Tk1x0P/UyCMt1lq91kjBsDwfUZFzebuCQ2O9fQ4gGYeZ2TDYWMQ0/vWUaR8Q0mALYbZrAGTndF+P88v+z/44iv+6ciGqJsH+2JLwS+AovCNXh/BQIjX04dvxgMcagMfwZBDg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CH3PR11MB8562.namprd11.prod.outlook.com (2603:10b6:610:1b8::13)
 by PH7PR11MB5820.namprd11.prod.outlook.com (2603:10b6:510:133::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.17; Mon, 27 Oct
 2025 06:09:31 +0000
Received: from CH3PR11MB8562.namprd11.prod.outlook.com
 ([fe80::24c6:f8fc:1afe:179f]) by CH3PR11MB8562.namprd11.prod.outlook.com
 ([fe80::24c6:f8fc:1afe:179f%6]) with mapi id 15.20.9253.017; Mon, 27 Oct 2025
 06:09:31 +0000
From: peng.zhang1.cn@windriver.com
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][master][PATCH 2/2] avahi: fix CVE-2024-52615
Date: Mon, 27 Oct 2025 14:09:15 +0800
Message-ID: <20251027060915.930984-2-peng.zhang1.cn@windriver.com>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20251027060915.930984-1-peng.zhang1.cn@windriver.com>
References: <20251027060915.930984-1-peng.zhang1.cn@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TYCPR01CA0063.jpnprd01.prod.outlook.com
 (2603:1096:405:2::27) To PH7PR11MB8570.namprd11.prod.outlook.com
 (2603:10b6:510:2ff::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB8562:EE_|PH7PR11MB5820:EE_
X-MS-Office365-Filtering-Correlation-Id: 99801ed3-8a0e-4caf-e55b-08de151f6485
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|52116014|376014|1800799024|366016|13003099007|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?N3LWm+G7F3rioWiFtx3uTmEH8hoZcoizpzRo4Moo4pGaNYnwBYr3KSMpSoLo?=
 =?us-ascii?Q?FhGnSnOMs4aYDAq7jn1d7jkTvUNmYeQSN7oarlLrU0sOlMKMzMwILGOEjkzL?=
 =?us-ascii?Q?MDWiGzpo2uGrxGTTYrFXkWwog9IGEy0xNkepBKHMVs6anNYlaqLmVvxYgIxq?=
 =?us-ascii?Q?bv8tXj+MqBthiXf+BhGnQcraqzu0Fv9e5mwF7nqBr2dnGLMuDjRLsyqBjQZi?=
 =?us-ascii?Q?V6DnMYH+lLsJrfnaNDk/IW5BLKZ0PND6Z7cl0lKFfVdl31v34cDbpWwupB2y?=
 =?us-ascii?Q?WWTkYTWnS22A/0+rag9+Fui8RjJpuD+7GUdDTUMEAn7zAuIZBvPpT07tZfTx?=
 =?us-ascii?Q?jEYDCH3an14vIbISjUl+wZqCA2WF0FpebhqtAXDjQ5SBDjzE/deXCQL1GBl7?=
 =?us-ascii?Q?fLU9Z6DHIzjZRaCEAJ1zJaxCewN5gVAubgBgUxpVqgklU54fSY2YA51/flcu?=
 =?us-ascii?Q?nJGTLJlg+CFsPfhzbwg3xlowBToofvE9I+kQH7egdjSRFkdaVmLDU4N+iC/H?=
 =?us-ascii?Q?RV7onlZjRGE2aCQ+NyXVpFxznykqsP5/K4oBHj/94LTt+RLiHjBDT/GbYjF/?=
 =?us-ascii?Q?a1bziQISvGYAOcjsQgK2hnzqH1sBRJokg93BZAHXID+VZI1mqF+o+NNSx4Fp?=
 =?us-ascii?Q?ddt6II4lvGEF81HszQMINJ1ivp2uEa4WaqhUNL/bsKpeh+oVUhPDipH0Quko?=
 =?us-ascii?Q?7Aw1GkUp7fcK7ZcMxwQ4hrVvW81acAOhTLAXv7A/mgctAiXp7O+TTDrjZYkt?=
 =?us-ascii?Q?rOogfmVaClGnTOWbd86ScPeSBeoFt0R2Q0BMpYVVLgptG+4wOhpbncUFyVLM?=
 =?us-ascii?Q?BrDQQn9sSU2m1jjR9Tpu68w1XVScH+llu1akRDOO0ai97InpyD3nqLr04MM/?=
 =?us-ascii?Q?KPCFV07HTms5iyLfOipYjVxJjnMw04T5Kz0laHlB3h2ivE7/3s3p504Ct5Gx?=
 =?us-ascii?Q?i0gtud4VYAEIswyetm6EuBNPkS/OTuVhctN5cVuXGZmDbZ/gVGMR7i1wqI9c?=
 =?us-ascii?Q?ZPLIx0XyXx7pAd8QurG0uttUJy/7ZQWxa8oCK/lrmbqnhfsYbseueJLHCPi/?=
 =?us-ascii?Q?ja00N+bwOoEC1wmvWXmuXQ53j0GmKDJSKhoDLXbr6TCPz9DoQIWa65QQz5m3?=
 =?us-ascii?Q?LigPJ1AHWHUI1wcEzUfcc1rMiWI3VGVJUlSXBLYKaqojbRShkE8rfn9We7j0?=
 =?us-ascii?Q?UXiWhHwmGx/QokQLVcpMyC4Iy+DECELrJ33DCdN/5YkAH36swPFjOHqNCrhJ?=
 =?us-ascii?Q?tcoRBjqjxjGeIHQUltA5r65Io13D/u4joYnF9oC0mtpAAAGm2byM3Er9l4aK?=
 =?us-ascii?Q?1U/ACj3tvJ3AlwVXrn0rZ4OddM5nSBdN5UzQpf6TXs1xiZjEDJpHAM3BxQmx?=
 =?us-ascii?Q?P958+YFjIAtOZQsW0RB/TE/Ywd5RiT1LZw2MfHEePQeHydHDs7aMM0Azb2fE?=
 =?us-ascii?Q?Nk0IY21LT6xxQ6d3wDt1nLex+wXy9pQurDDVciH7lg8ZPKNcMGt5YiXp0K15?=
 =?us-ascii?Q?QcOhqfRWa+q1nYbc1xaB6YUFvHYExcmhtFHGso4/a4koBJh7d6LIYDhaeQ?=
 =?us-ascii?Q?=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR11MB8562.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(1800799024)(366016)(13003099007)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?Pzl8B321JBbfC0WgTc/taueeqxUWurh+PR9wRXXczjyO2HkV+jZ8ElgAxWpC?=
 =?us-ascii?Q?48WQgpqJ3V+3m1ZKuF49MDl4+RdUGBNuCiWaifNYntu0gBLSq41fLMd4FQEk?=
 =?us-ascii?Q?xnshZgXtMLe3Itq1suZNntdBKj70Wr/OxJ6vAqbEV4B7ULwyg2XKEPw/DSG7?=
 =?us-ascii?Q?iMs/fpSBvo3/V0C74ydK4CqZFlvlnx6hD/VPRvkWOF9xp3RKh6H2SYcwRwt0?=
 =?us-ascii?Q?nA2x1GephGI1LRIynE7e44RvasjBLaBhP0DJ4SQB7e1FitKWSQHtffnc3aJY?=
 =?us-ascii?Q?whFkzWeAnf2waS+lfA/Pf/368FOKcnXe6wESa78MCc4WMpTm0hqMX/yjbHbw?=
 =?us-ascii?Q?I4D7PJRRT9Uc6CbvA9JqDPV7GiXmK1nl9I7gVcOwDo9MVLxa8SW0FR4X/at4?=
 =?us-ascii?Q?iba8fZTFRovNksiIRUnxCy7JzhMHRTXx0GUy1BhAEnqHXuM2ceL98DAk16J1?=
 =?us-ascii?Q?H818taur2mItwkNr1JUJ7EaPU2GmROStqkdNtz6TwwUDtfBg4rqCDVFHvB7m?=
 =?us-ascii?Q?yqspy3z8uQoJBl72LmnEtRrsTh42gPo80tkiWEoOFoVzEtgz2LfDwXZpmh/s?=
 =?us-ascii?Q?TkcMVgRSDp7468f8r0ZE4kgKhiBlv0d694zk5qdxHwqxa8KBmL3zMHiZam3l?=
 =?us-ascii?Q?7hj5ZNT5FfeNB1Vx9Tb6c/RsqFUAcoN45fhFbaMckWM81HKBnt2mHdxVjUJQ?=
 =?us-ascii?Q?Me8Uo0s4istEnFhd/aG4vYjk2+QazgVqNQ+SNmUDzuTjHL736oDgK2O0UdSh?=
 =?us-ascii?Q?+0wJw12WTpQ9fvarc+2KWHunSH/v37fVRQ6xVkhZ2qOEfS9oK2MqDOjqfaKR?=
 =?us-ascii?Q?n4omyqNxjzwiRSJCqkPc5xX8QmddfSbanar7sWuIjrvA0JMkhlQt9ZEUQRkZ?=
 =?us-ascii?Q?cIbBay1eG9YzrctxuQfsYqgEP+S/52dSLi5SZGske7C5/o0boz+lB32pN12p?=
 =?us-ascii?Q?Ng5ggaDDBndE4xITcVxxCbnqpkCRb63yIDB9By1pSLZOfqUQcF085o3DOYW1?=
 =?us-ascii?Q?DZbbVHauZDNW/YG6aGfE9OWUvAtcyrtYUBxVYdrukOVWvQRi6nZOk2WZbr5b?=
 =?us-ascii?Q?f+1UTtIHjLXVzqawyxLlifnVFMts55SGNMApQ8goj1OZoMZ2W1KjBdEuND1E?=
 =?us-ascii?Q?ZdcfPiEc79FLy8aIZvJWamJfXa3OxapJ/x1+Cun/XTls3b2CzZfCqW2+iA+q?=
 =?us-ascii?Q?4F0yh4OirsWcGvJ/Q7i3ZDT0jfytw+hdZt2u/i2H8tpUgiXZ5mAgXz2Orrn7?=
 =?us-ascii?Q?22xe1aCy05yjFpbDjnN8CLtiW98gq7+q595q35meTwuBhpSeGjJD5evk9AuF?=
 =?us-ascii?Q?C7qMbUzN9qVDjvhBsmFUjeiNycDuoP6WC6LX/S3Z4ebmSjlc4WML6x2CtinX?=
 =?us-ascii?Q?UT4Xrhx3oIXQzI3TZdixU8OwOyODdoFTEnLfb+ZCeAWGSQiDJI/fnAiphclF?=
 =?us-ascii?Q?ObsK0qRXNFmPY2D7HAgXFULC/4oG3TYjHA93lAAaVIUwVzgeUNI14SnWp91O?=
 =?us-ascii?Q?/++RFZp/iwFMQuP4A8kSg9bZm7PhLK8zKpS0L6pGqK445/Q7pnmF/zJkv4NA?=
 =?us-ascii?Q?1Pw+Umga1Ghu0E5RVu0BGnnfGsesJ9PSrRj3ERsGIp7vULYkAbNGacBcV83S?=
 =?us-ascii?Q?LA=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 99801ed3-8a0e-4caf-e55b-08de151f6485
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB8570.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Oct 2025 06:09:31.7621
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9HJ+GQmddc7Wz+z63gek/Yvocw9GrSJQf956Qxwkr8gUIEBQWnthMrylzvJqoZPPorqYqN7KWG8HtYPmoNTcZaMQtuLC1mhOiTLiVQrGVFY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB5820
X-Proofpoint-GUID: DqscdsBSnpK6uf0PXBWRf71KgwdUaBKn
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDI3MDA1NSBTYWx0ZWRfX6P9uE1ngaH7E
 0EtmsosVVO5O/GTofJ9fohV9ihojWDgJ/LVlKbqtNIu8QMa+3A3Up0yUxXGirsjMD/lgx0lwJvc
 MjZ4LNapcNt2hiNE2OGco7uqUPjJHA0/R4fwWephhQu5XmV4m+9LzgPEb6cNIKYsUBa1lsxmehb
 vx4fi+qDvhGBEQyqKbOATASxzpB1uZixNiR4RgIJ2FEcus4rcjF8uFePOPk1wQhsjpx3kffenKl
 AZ5JjFip+cihu6WQ8TF6hjVe9Ooh+XXpumF33VCeS1CRNUWwBkJH8DDgy3J6VA8xFDT+r6/PbBE
 mMP7Z1lQeUnpZZzlFV2eEF3BzmjCcp4Q7domQbzBFOmE5N5Gte/oL7j8FKS2iufiQb59i7vrvd1
 UcI4OQkENpoqBzTqsHXUJUsfXkvHsQ==
X-Authority-Analysis: v=2.4 cv=CIknnBrD c=1 sm=1 tr=0 ts=68ff0c9d cx=c_pps
 a=tGbvjRCxuxMasaU8K2d5rg==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=PYnjg3YJAAAA:8 a=NEAV23lmAAAA:8 a=t7CeM3EgAAAA:8 a=_enOPnqeAAAA:8
 a=20KFwNOVAAAA:8 a=A2HaFPfzqYc8LxoZLAkA:9 a=FdTzh2GWekK77mhwV6Dw:22
 a=XAbD3I9PDrnSMThV5XoS:22
X-Proofpoint-ORIG-GUID: DqscdsBSnpK6uf0PXBWRf71KgwdUaBKn
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-27_03,2025-10-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 priorityscore=1501 impostorscore=0
 lowpriorityscore=0 bulkscore=0 suspectscore=0 phishscore=0 adultscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2510020000
 definitions=main-2510270055
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 27 Oct 2025 06:09:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/225322

From: Zhang Peng <peng.zhang1.cn@windriver.com>

CVE-2024-52615:
A flaw was found in Avahi-daemon, which relies on fixed source ports for wide-area
DNS queries. This issue simplifies attacks where malicious DNS responses are injected.

Reference:
[https://nvd.nist.gov/vuln/detail/CVE-2024-52615]
[https://github.com/avahi/avahi/security/advisories/GHSA-x6vp-f33h-h32g]

Upstream patches:
[https://github.com/avahi/avahi/commit/4e2e1ea0908d7e6ad7f38ae04fdcdf2411f8b942]

Signed-off-by: Zhang Peng <peng.zhang1.cn@windriver.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
(Cherry pick from commit: ec22ec26b3f40ed5e0d84d60c29d8c315cf72e23)
Signed-off-by: Zhang Peng <peng.zhang1.cn@windriver.com>
---
 meta/recipes-connectivity/avahi/avahi_0.8.bb  |   1 +
 .../avahi/files/CVE-2024-52615.patch          | 228 ++++++++++++++++++
 2 files changed, 229 insertions(+)
 create mode 100644 meta/recipes-connectivity/avahi/files/CVE-2024-52615.patch

diff --git a/meta/recipes-connectivity/avahi/avahi_0.8.bb b/meta/recipes-connectivity/avahi/avahi_0.8.bb
index 734a73541f..4fe8ba4d28 100644
--- a/meta/recipes-connectivity/avahi/avahi_0.8.bb
+++ b/meta/recipes-connectivity/avahi/avahi_0.8.bb
@@ -36,6 +36,7 @@ SRC_URI = "${GITHUB_BASE_URI}/download/v${PV}/avahi-${PV}.tar.gz \
            file://CVE-2023-38472.patch \
            file://CVE-2023-38473.patch \
            file://CVE-2024-52616.patch \
+           file://CVE-2024-52615.patch \
            "
 
 GITHUB_BASE_URI = "https://github.com/avahi/avahi/releases/"
diff --git a/meta/recipes-connectivity/avahi/files/CVE-2024-52615.patch b/meta/recipes-connectivity/avahi/files/CVE-2024-52615.patch
new file mode 100644
index 0000000000..9737f52837
--- /dev/null
+++ b/meta/recipes-connectivity/avahi/files/CVE-2024-52615.patch
@@ -0,0 +1,228 @@
+From 4e2e1ea0908d7e6ad7f38ae04fdcdf2411f8b942 Mon Sep 17 00:00:00 2001
+From: Michal Sekletar <msekleta@redhat.com>
+Date: Wed, 27 Nov 2024 18:07:32 +0100
+Subject: [PATCH] core/wide-area: fix for CVE-2024-52615
+
+CVE: CVE-2024-52615
+Upstream-Status: Backport [https://github.com/avahi/avahi/commit/4e2e1ea0908d7e6ad7f38ae04fdcdf2411f8b942]
+
+Signed-off-by: Zhang Peng <peng.zhang1.cn@windriver.com>
+---
+ avahi-core/wide-area.c | 128 ++++++++++++++++++++++-------------------
+ 1 file changed, 69 insertions(+), 59 deletions(-)
+
+diff --git a/avahi-core/wide-area.c b/avahi-core/wide-area.c
+index 00a15056e..06df7afc6 100644
+--- a/avahi-core/wide-area.c
++++ b/avahi-core/wide-area.c
+@@ -81,6 +81,10 @@ struct AvahiWideAreaLookup {
+ 
+     AvahiAddress dns_server_used;
+ 
++    int fd;
++    AvahiWatch *watch;
++    AvahiProtocol proto;
++
+     AVAHI_LLIST_FIELDS(AvahiWideAreaLookup, lookups);
+     AVAHI_LLIST_FIELDS(AvahiWideAreaLookup, by_key);
+ };
+@@ -88,9 +92,6 @@ struct AvahiWideAreaLookup {
+ struct AvahiWideAreaLookupEngine {
+     AvahiServer *server;
+ 
+-    int fd_ipv4, fd_ipv6;
+-    AvahiWatch *watch_ipv4, *watch_ipv6;
+-
+     /* Cache */
+     AVAHI_LLIST_HEAD(AvahiWideAreaCacheEntry, cache);
+     AvahiHashmap *cache_by_key;
+@@ -125,35 +126,67 @@ static AvahiWideAreaLookup* find_lookup(AvahiWideAreaLookupEngine *e, uint16_t i
+     return l;
+ }
+ 
++static void socket_event(AVAHI_GCC_UNUSED AvahiWatch *w, int fd, AVAHI_GCC_UNUSED AvahiWatchEvent events, void *userdata);
++
+ static int send_to_dns_server(AvahiWideAreaLookup *l, AvahiDnsPacket *p) {
++    AvahiWideAreaLookupEngine *e;
+     AvahiAddress *a;
++    AvahiServer *s;
++    AvahiWatch *w;
++    int r;
+ 
+     assert(l);
+     assert(p);
+ 
+-    if (l->engine->n_dns_servers <= 0)
++    e = l->engine;
++    assert(e);
++
++    s = e->server;
++    assert(s);
++
++    if (e->n_dns_servers <= 0)
+         return -1;
+ 
+-    assert(l->engine->current_dns_server < l->engine->n_dns_servers);
++    assert(e->current_dns_server < e->n_dns_servers);
+ 
+-    a = &l->engine->dns_servers[l->engine->current_dns_server];
++    a = &e->dns_servers[e->current_dns_server];
+     l->dns_server_used = *a;
+ 
+-    if (a->proto == AVAHI_PROTO_INET) {
++    if (l->fd >= 0) {
++        /* We are reusing lookup object and sending packet to another server so let's cleanup before we establish connection to new server. */
++        s->poll_api->watch_free(l->watch);
++        l->watch = NULL;
+ 
+-        if (l->engine->fd_ipv4 < 0)
+-            return -1;
++        close(l->fd);
++        l->fd = -EBADF;
++    }
+ 
+-        return avahi_send_dns_packet_ipv4(l->engine->fd_ipv4, AVAHI_IF_UNSPEC, p, NULL, &a->data.ipv4, AVAHI_DNS_PORT);
++    assert(a->proto == AVAHI_PROTO_INET || a->proto == AVAHI_PROTO_INET6);
+ 
+-    } else {
+-        assert(a->proto == AVAHI_PROTO_INET6);
++    if (a->proto == AVAHI_PROTO_INET)
++        r = s->config.use_ipv4 ? avahi_open_unicast_socket_ipv4() : -1;
++    else
++        r = s->config.use_ipv6 ? avahi_open_unicast_socket_ipv6() : -1;
+ 
+-        if (l->engine->fd_ipv6 < 0)
+-            return -1;
++    if (r < 0) {
++        avahi_log_error(__FILE__ ": Failed to create socket for wide area lookup");
++        return -1;
++    }
+ 
+-        return avahi_send_dns_packet_ipv6(l->engine->fd_ipv6, AVAHI_IF_UNSPEC, p, NULL, &a->data.ipv6, AVAHI_DNS_PORT);
++    w = s->poll_api->watch_new(s->poll_api, r, AVAHI_WATCH_IN, socket_event, l);
++    if (!w) {
++        close(r);
++        avahi_log_error(__FILE__ ": Failed to create socket watch for wide area lookup");
++        return -1;
+     }
++
++    l->fd = r;
++    l->watch = w;
++    l->proto = a->proto;
++
++    return a->proto == AVAHI_PROTO_INET ?
++                avahi_send_dns_packet_ipv4(l->fd, AVAHI_IF_UNSPEC, p, NULL, &a->data.ipv4, AVAHI_DNS_PORT):
++                avahi_send_dns_packet_ipv6(l->fd, AVAHI_IF_UNSPEC, p, NULL, &a->data.ipv6, AVAHI_DNS_PORT);
+ }
+ 
+ static void next_dns_server(AvahiWideAreaLookupEngine *e) {
+@@ -246,6 +279,9 @@ AvahiWideAreaLookup *avahi_wide_area_lookup_new(
+     l->dead = 0;
+     l->key = avahi_key_ref(key);
+     l->cname_key = avahi_key_new_cname(l->key);
++    l->fd = -EBADF;
++    l->watch = NULL;
++    l->proto = AVAHI_PROTO_UNSPEC;
+     l->callback = callback;
+     l->userdata = userdata;
+ 
+@@ -314,6 +350,12 @@ static void lookup_destroy(AvahiWideAreaLookup *l) {
+     if (l->cname_key)
+         avahi_key_unref(l->cname_key);
+ 
++    if (l->watch)
++            l->engine->server->poll_api->watch_free(l->watch);
++
++    if (l->fd >= 0)
++        close(l->fd);
++
+     avahi_free(l);
+ }
+ 
+@@ -572,14 +614,20 @@ static void handle_packet(AvahiWideAreaLookupEngine *e, AvahiDnsPacket *p) {
+ }
+ 
+ static void socket_event(AVAHI_GCC_UNUSED AvahiWatch *w, int fd, AVAHI_GCC_UNUSED AvahiWatchEvent events, void *userdata) {
+-    AvahiWideAreaLookupEngine *e = userdata;
++    AvahiWideAreaLookup *l = userdata;
++    AvahiWideAreaLookupEngine *e = l->engine;
+     AvahiDnsPacket *p = NULL;
+ 
+-    if (fd == e->fd_ipv4)
+-        p = avahi_recv_dns_packet_ipv4(e->fd_ipv4, NULL, NULL, NULL, NULL, NULL);
++    assert(l);
++    assert(e);
++    assert(l->fd == fd);
++
++    if (l->proto == AVAHI_PROTO_INET)
++        p = avahi_recv_dns_packet_ipv4(l->fd, NULL, NULL, NULL, NULL, NULL);
+     else {
+-        assert(fd == e->fd_ipv6);
+-        p = avahi_recv_dns_packet_ipv6(e->fd_ipv6, NULL, NULL, NULL, NULL, NULL);
++        assert(l->proto == AVAHI_PROTO_INET6);
++
++        p = avahi_recv_dns_packet_ipv6(l->fd, NULL, NULL, NULL, NULL, NULL);
+     }
+ 
+     if (p) {
+@@ -598,32 +646,6 @@ AvahiWideAreaLookupEngine *avahi_wide_area_engine_new(AvahiServer *s) {
+     e->server = s;
+     e->cleanup_dead = 0;
+ 
+-    /* Create sockets */
+-    e->fd_ipv4 = s->config.use_ipv4 ? avahi_open_unicast_socket_ipv4() : -1;
+-    e->fd_ipv6 = s->config.use_ipv6 ? avahi_open_unicast_socket_ipv6() : -1;
+-
+-    if (e->fd_ipv4 < 0 && e->fd_ipv6 < 0) {
+-        avahi_log_error(__FILE__": Failed to create wide area sockets: %s", strerror(errno));
+-
+-        if (e->fd_ipv6 >= 0)
+-            close(e->fd_ipv6);
+-
+-        if (e->fd_ipv4 >= 0)
+-            close(e->fd_ipv4);
+-
+-        avahi_free(e);
+-        return NULL;
+-    }
+-
+-    /* Create watches */
+-
+-    e->watch_ipv4 = e->watch_ipv6 = NULL;
+-
+-    if (e->fd_ipv4 >= 0)
+-        e->watch_ipv4 = s->poll_api->watch_new(e->server->poll_api, e->fd_ipv4, AVAHI_WATCH_IN, socket_event, e);
+-    if (e->fd_ipv6 >= 0)
+-        e->watch_ipv6 = s->poll_api->watch_new(e->server->poll_api, e->fd_ipv6, AVAHI_WATCH_IN, socket_event, e);
+-
+     e->n_dns_servers = e->current_dns_server = 0;
+ 
+     /* Initialize cache */
+@@ -651,18 +673,6 @@ void avahi_wide_area_engine_free(AvahiWideAreaLookupEngine *e) {
+     avahi_hashmap_free(e->lookups_by_id);
+     avahi_hashmap_free(e->lookups_by_key);
+ 
+-    if (e->watch_ipv4)
+-        e->server->poll_api->watch_free(e->watch_ipv4);
+-
+-    if (e->watch_ipv6)
+-        e->server->poll_api->watch_free(e->watch_ipv6);
+-
+-    if (e->fd_ipv6 >= 0)
+-        close(e->fd_ipv6);
+-
+-    if (e->fd_ipv4 >= 0)
+-        close(e->fd_ipv4);
+-
+     avahi_free(e);
+ }
+ 
+@@ -680,7 +690,7 @@ void avahi_wide_area_set_servers(AvahiWideAreaLookupEngine *e, const AvahiAddres
+ 
+     if (a) {
+         for (e->n_dns_servers = 0; n > 0 && e->n_dns_servers < AVAHI_WIDE_AREA_SERVERS_MAX; a++, n--)
+-            if ((a->proto == AVAHI_PROTO_INET && e->fd_ipv4 >= 0) || (a->proto == AVAHI_PROTO_INET6 && e->fd_ipv6 >= 0))
++            if (a->proto == AVAHI_PROTO_INET || a->proto == AVAHI_PROTO_INET6)
+                 e->dns_servers[e->n_dns_servers++] = *a;
+     } else {
+         assert(n == 0);
-- 
2.50.0


