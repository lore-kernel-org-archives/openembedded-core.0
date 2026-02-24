Return-Path: <changqing.li@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2E35DEFB7ED
	for <webhook@archiver.kernel.org>; Tue, 24 Feb 2026 02:47:27 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.11982.1771901243567041799
 for <openembedded-core@lists.openembedded.org>;
 Mon, 23 Feb 2026 18:47:23 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=UOYw45pt;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=6515bcc28d=changqing.li@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61O1IXD22561401
	for <openembedded-core@lists.openembedded.org>; Tue, 24 Feb 2026 02:47:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PPS06212021; bh=jCTbecWDzd3wk9ygJghW
	1G4lqfOC7wD9mtxM4Uu3B7A=; b=UOYw45ptggh1qilyt/qwwWdfCVgJ1RTCTVJZ
	pNsEGQaDvenFQRx4dh2danUCE0HDdsqG15gcK3+CJrevh0oz/uyA0qwtYoKxD4Kp
	JIbNmznjCBsTRhB3pCq7qlb5hsNl8wnK7puv2Yo8LycrtxGaWtWWpIUNUfbiq4CY
	rCJVgyANSLcHTQKx3pVUlU84NNz0SkzAr2C8GL4rSOn0Ru+lMVE56C32+hqt00ZT
	XI7Ed3J4vulnkOkxoMtMQuONxm0GbHsuR0Jv+OLpCZzIVnyyeCxpH+TN/fXRoORD
	HlkoRnxc22WjISxjURWtnqvYvl+vMFwHGrwSPxJG2dstlox3xw==
Received: from sn4pr0501cu005.outbound.protection.outlook.com (mail-southcentralusazon11011058.outbound.protection.outlook.com [40.93.194.58])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4cf1wvar11-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 24 Feb 2026 02:47:22 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EHQW/zGm/RlSNEZaELqWu6c++g61JXnTsKT/IeNahkrmE8obhIzOMK0h940WKwLXJAAlBhS/kYE54a+HuPrQTwThwKoiiVseuv9IRGhUEL03blaRb1z/gD01uxD0L0WrKGDKaof1B8WgTyPix+SPTQucIegn3p/q50yNt4Fbsmy8/Hj67eeb2NsaWhZ55WJUO/dfGJSCSrRIhq/EbDcOy4h6v96++et86BTtqkAwUOp5vdHV4v/bohRIg62ghIZSlAn+bSGZHW8thq6DLLQMK0c/h78wTqlXITDpc3zckOTz/VLtM5LDYdT17gPrR74JFHUA/1A16imjEA5XZCR5Fg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jCTbecWDzd3wk9ygJghW1G4lqfOC7wD9mtxM4Uu3B7A=;
 b=SBSKxHxDUbOF37G1eyMxPtP6MdtCW2jtL9dHgxkhfDl3uH6WKYjloA5BRi1O5LL5Iyl9qhVvTXSquijS2g4T9l9z3G8CpThU4nEHlBF3KQWObd2lAiTNoBWpgqTBU6SrB5yLoyOlXC6ouOcMUwqTLvYdntvV0jJlNPz+nprkZfRjx3BLNMmi5FlsNAAt0eaYRVvuBGlm6kFiBKaYKUU3jzQ+IKrfNMu+JlG2F3rpy/jS9qoyvmScEpJJFtLBVj7md9F1zP/n4SVbAgVJB/HIZ5Bhu/4K5Kjzn4vCT3rtFCmwtyo8C5rBmf/PYHGZIcm1grn6Z11lgK574FtE9argGg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS0PR11MB7312.namprd11.prod.outlook.com (2603:10b6:8:11f::18)
 by PH7PR11MB6054.namprd11.prod.outlook.com (2603:10b6:510:1d2::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.22; Tue, 24 Feb
 2026 02:47:20 +0000
Received: from DS0PR11MB7312.namprd11.prod.outlook.com
 ([fe80::531e:6ef5:812b:48f6]) by DS0PR11MB7312.namprd11.prod.outlook.com
 ([fe80::531e:6ef5:812b:48f6%5]) with mapi id 15.20.9632.017; Tue, 24 Feb 2026
 02:47:20 +0000
From: Changqing Li <changqing.li@windriver.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH V2] perlcross: upgrade from 1.6.2 to 1.6.4
Date: Tue, 24 Feb 2026 10:46:59 +0800
Message-Id: <20260224024659.1155296-1-changqing.li@windriver.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2P153CA0008.APCP153.PROD.OUTLOOK.COM
 (2603:1096:4:140::19) To DS0PR11MB7312.namprd11.prod.outlook.com
 (2603:10b6:8:11f::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7312:EE_|PH7PR11MB6054:EE_
X-MS-Office365-Filtering-Correlation-Id: 2a69012c-6249-4ae3-1e7d-08de734f07de
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|366016|376014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?FvBtDlu/2XyO5qHKW1HmRtTVOMiPgx6sqS2QKREbf3rJ8wEDZ2ykCKkIv+lR?=
 =?us-ascii?Q?DjtmlZVJGGpLxcx91Amv9KlTjqKqouwAkThJ7INvvK5+hh0VJk0pBHarHX3X?=
 =?us-ascii?Q?dPDSLCyNENG/xZ0YpMWK5WFby9wOKl4XW9mtJA5/9Kf/kkyl//DHFhL0A3Kk?=
 =?us-ascii?Q?BDWWhkA+aNQ/LvIB9eNPLq4V9UfVDPqT0scbgdKm2duuEFG0oVzV8Ghh1+yK?=
 =?us-ascii?Q?/xhjsIzsMwwWzH5aqNZWJVPhF7JVNqAcdu0vaPAE6OrntnzVsMMUdQwXbAUh?=
 =?us-ascii?Q?I0faSk+G19M7Or/J/OP8hrGT955ep7rk0LzJBYBlVO07w+ghQZXC0NO52BwT?=
 =?us-ascii?Q?HtRL91zmPG1fTmsf/dSLnwpxG1qCNGhGP9+DGpFZvVuVVL+JRcSKt3AqkjGE?=
 =?us-ascii?Q?9VCh7tvu4vT8r/EB5b7Yjs6bLNYxHDGjAJBPU9si8aYu+8kjPP5enstR8sxH?=
 =?us-ascii?Q?9591cNis7bQRqKwQA0rwYusewnKsJLFIqoAx3qvXDygcdU3cTGmBbJTnW37o?=
 =?us-ascii?Q?ta5qge6S/Le6NUy1PxsyEfO7iLvtYCFjtZhXSTgfy14pVutNmCcgKlQqHRCl?=
 =?us-ascii?Q?HKauQkDnoS9PdKVLV+3vpOkQClh4AXP0h/h0x/tDcTuxfXto1vBdHXAFMqm+?=
 =?us-ascii?Q?i8lHi8vHtQclGeY/rgHIhQ4GdnEjU4bwkWvjmUbfvHQMk/rvsTq9D+vHVX5J?=
 =?us-ascii?Q?m3H/ClpX3gs/6s/2wMha50ZujY7xnmhWDnlRG+nAhVbruSXMXkTe5NMZHchJ?=
 =?us-ascii?Q?7/bTFuhMxqalJdERt5EAiw1oOFjzNVK8HiYWPd6kVeO8gY1aDiRonj6Rie0u?=
 =?us-ascii?Q?M1KaSs9ynRIlULCakg45NxrP2AVA8h+MC2kZ2/jFp2In5KE46+y55974H2wx?=
 =?us-ascii?Q?FGatHXHFhKcJZ41MLZdHWtdH3/ZuZvqVOEnl5XvRVZoAD74fHu1EH5+X26Lv?=
 =?us-ascii?Q?IPjJ4gQk9cSx9l9+Mtyoy/3FD/YwZEnha2gnjbrk1eH/KbP+/XekAC+pY0QX?=
 =?us-ascii?Q?8RZZAB6wSqv6V2vCvOJr2bFhQSrjOC/0nwRolOeM4lBImWol8T4WDQkD4Ta/?=
 =?us-ascii?Q?hEiMNtseFmSdItn/BUV8purgXXgqbPm9wPVd35FiPWuDPv9eKB+vyq3ty6Xm?=
 =?us-ascii?Q?9vBh99OsCs6Oj7ae4MRIld5kORe1NwZQe1EB3CdsgXQNGPy3Idindg5URIWt?=
 =?us-ascii?Q?kgCq6adUULir3bwdDj2pq6//qFhPMqs4C2l60cT/R62xJdYccJ5YVMFIngJI?=
 =?us-ascii?Q?OwMAC1OAAvuULdQ1D548cZ9INQsaQRisIXoGKbFPvDbH1UreFe3mW7TdBLld?=
 =?us-ascii?Q?BGiEuB33nsEbl/U8mOtkoA6UGUnDL0Lod5t1/ES4/271lUHAQIkUpKvuoDmn?=
 =?us-ascii?Q?tFieGoIxDEPs6jtiFTFI4mDW8KD9En4VIOdDbiPOtZErYgWnbAbIGcmJpIIQ?=
 =?us-ascii?Q?OkzuY+zaGYIK7TRee5HS4JrqFolhCpPUQYH2O7iSZaFGbkFrDQXDcj/4zwLM?=
 =?us-ascii?Q?tPTe2yddtOXV9mk1ozV3BqsHfROEOqZ2omtavj8zcdh2gzPNAAk4PjbzRWrE?=
 =?us-ascii?Q?cLqti6YEs6oGf+RlEyRNgvFWiu0be0OlD8VXMLa7CTsegf6GIX5YIB3NhhzO?=
 =?us-ascii?Q?mDRjLmwE4c3rGzZa3VrbEvf0KBAIKatJ5C4tD+FeuvGo?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB7312.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?3edqrHePyMzzpiBtoVd8Xt/7u+eA0HwBhJD2+PZ8gpbFPUtY6Ne2wVZH0K3r?=
 =?us-ascii?Q?QB4pvhbNk15W9hTmBpCw2B4NRbkbv1r3qQuYVTiwXhMSoK89Uu0ov3/twDut?=
 =?us-ascii?Q?ozPjt+EhqGGFvIyG8ZePZ/JDLK1Xh2tTuAyqvnhy+uSdlBQQ3nxr2FBeAo27?=
 =?us-ascii?Q?OlWL3d3C+oeN8q0b9eojydnuhr8u8qDYVoFwoE1chBEt/5InFikrm3fXu6QE?=
 =?us-ascii?Q?0y5VXw4GiuGPzWn7mgKlTgBvQi48hI4E7moIdaJJ8qLiV/+41F3jU+p5ciGr?=
 =?us-ascii?Q?gIHMMG0q6TH10BI9YuytM3TbGeYtfrJ0RoFSoMsaot3ssIo2AdbYDObDj7WR?=
 =?us-ascii?Q?3Nl+ZEQFDJZ09GlevYjcxx/8D/adKMilYE8kXK9VQGHZOnEUbIiGGF4tXaMD?=
 =?us-ascii?Q?jcncu3k8lTzqWxW/e9DUaxGuE0OMUaFhU6JxWJ9+4sVjSaRuO1weWw40HLCg?=
 =?us-ascii?Q?B8+FpUvIALl6AkmVQuuoxQZ1NgoUpSPyt/A7R37dl+rpFoGj+tmAwtubzhuX?=
 =?us-ascii?Q?NAuWdfFX0D9k7PnBE/L3jq9hnMZ2AfQDO/g8nX9AbxDlXZUevP443qq4GhhW?=
 =?us-ascii?Q?RLbVS0eqR9DU7fPRJN2iPetL4Uu9PQMlYII6vfUJ6c4/tOYXI0BbWUAlG2Aa?=
 =?us-ascii?Q?sscImWhCMGt9Gpfv1Fgf0HUgZwzSlqdLhsF/vhVpYj+gALV0WgYtM1zfejPR?=
 =?us-ascii?Q?QJhUq3OBPBLtUsi0NHMJloXKxYRKX5nuPa/0K56gYkJCQze7q7t0f27yQ0Tj?=
 =?us-ascii?Q?Nw9vyDg9Nn5b1yxAxyM8D8slDmFGuvfvjV3+Qp8F2lAq0CMqAQSGO76W4GT6?=
 =?us-ascii?Q?1fmLWfcyic20xfvcOYFkOQRnZ6/YVWPXhZw2nr3av8fNePalEXH535NM6lGL?=
 =?us-ascii?Q?IT4J/a44AuAkMzjAXCA8vjRiwUMsyr8OY5dluxBAtrssiJRCENb8Nqv68We3?=
 =?us-ascii?Q?nSzfxE/ecZTqiD1gi7qvZXWh9aCks4UytKfLrmtQI8GlsIwyQ3HIuz/TXfEp?=
 =?us-ascii?Q?ThVdFJzeaiq+TYtDgy1RGb5AN3Ml+N/qi9KBZnWRFzOJ3BqR0RWuoN2qKqyW?=
 =?us-ascii?Q?jE0733+1GrjiTD6/WkzGWWvoXm91cixKqjCoPJl21TpRvgL80qZtq3iy7CTv?=
 =?us-ascii?Q?U5/BYmnHarUrmoji1qhu9JzTmwWb0eWqIbh0Qy4nrXUKGtS4SFh4WpNs4CUo?=
 =?us-ascii?Q?LhqN0q7N45q2CbHxozwH/kyZoBmjmTzgCxoFZ1I418VzyHt46NwAMc8zIYLZ?=
 =?us-ascii?Q?7m9odub6DbOBIzTnJ8vLpkS1s0vZlhTlp0u4G7mX5Cy/1o0kRbM3gI+tyc+q?=
 =?us-ascii?Q?VkDJb+eIED2h+pPabBPcfNU3KUol6qcOeshaAFpko7cwMxQq8NUdAPLM907l?=
 =?us-ascii?Q?4N3nhVRWL3exyuMJdBzBVTuOxUN0uIbscNQDj2ao5XpGqviu/vEiJ71Ukt14?=
 =?us-ascii?Q?qurmeTKlSOxov1CublOVucoQwJbN1cdkRr/jQtc8XndZrPmzXYjhWa1iRy+f?=
 =?us-ascii?Q?teRrmV/WFP9uqIp8lx55B1hdI6IXldZuqawOZit3ZtLUy8Bz3oZpyemYtECn?=
 =?us-ascii?Q?jswDwC8d9SG/Twf+AmSn4NpR++q9r+S+CaEQtPQz9Pjv7m9NmcsR3Kj3bOLg?=
 =?us-ascii?Q?93GdHEs3Ru2lVpDMk+8/40QKnNAMfYAj5sJ4Efncsmx/7ZJS/DhATxMQBYA9?=
 =?us-ascii?Q?c2jUNak9gDEzg+W1MQzlbx/qsa5BEknwX7NLBn9Jyj2iVkT80hJWD1lYhSk+?=
 =?us-ascii?Q?qcQXPNilm8PbksvYr6alUUaGWPTddDo=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2a69012c-6249-4ae3-1e7d-08de734f07de
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7312.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Feb 2026 02:47:20.7723
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sZWsJaZHvBltdH0m8Tfokt0OGzj6U/ceN118LYYna966JSms3Pwi9pnqHAXAQq0wiR+B9As8x5C9P/R7p5JLMyR75ZVfL066tnpGFVgfF8I=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6054
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjI0MDAyMyBTYWx0ZWRfX/aRx5gYKl1tR
 Hx5KoG5YRG3DY6187Jjwe/0Xg4k1U4AnhEeBdBsu0s7N0y9F3K3VoTVKrkDSoMFz3qydnLTdCM7
 uN9wYasVMpnkRopWZZr2LtNn8ima7j5f+fYxOwYhuNo3ITGdtg6Ifmb29U5nLNYZxPtAsyc0gWe
 K4JrL3AuVrvKRjAtxGYrBj7ypJ8ypmzgVp3Ah3BigXyYptbxf5E824vgRJrQEC1X9mwAmT5XjtD
 NnSeacOTdov0NDdUze73MS9xcqiQ9omaMJCbofkjt5hBK24YxZaFKcQVXtwR0lUQHOX3ieH7lrt
 TnUnjp3ppL2AMECD/bt8/tRrNQ/Nz8sCIzorCstMSWFhMuMThJtcGwrOtBqjiZ55F+q70Enc0aZ
 uJT8aNQ4DSNoITsZpnvX9Nk94Wumq6JEfSjc60ahVM6AKx2yaHYEIYd1O9+Ffe+8m2ODwxSP8o+
 vuxfh7gQI+/N9l8w5cg==
X-Proofpoint-GUID: DWsLm-GbKc7I4uimOTmXDvOLOveWkFFR
X-Proofpoint-ORIG-GUID: DWsLm-GbKc7I4uimOTmXDvOLOveWkFFR
X-Authority-Analysis: v=2.4 cv=F+hat6hN c=1 sm=1 tr=0 ts=699d113a cx=c_pps
 a=ZGXiQjv6iMHL+sQqMZfKuw==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=HzLeVaNsDn8A:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=klDOsUkWDRETUCZYPvoE:22 a=1jPp1DPGAAAA:20
 a=t7CeM3EgAAAA:8 a=uVFQ_WrOHC__exutptQA:9 a=FdTzh2GWekK77mhwV6Dw:22
 a=bA3UWDv6hWIuX7UZL3qL:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-23_06,2026-02-23_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 phishscore=0 lowpriorityscore=0 malwarescore=0
 clxscore=1015 impostorscore=0 bulkscore=0 priorityscore=1501 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2602240023
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 24 Feb 2026 02:47:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/231737

https://github.com/arsv/perl-cross/releases/tag/1.6.4

Include support for perl 5.40.3, perl 5.42.0

Signed-off-by: Changqing Li <changqing.li@windriver.com>
---
 .../perl-cross/{perlcross_1.6.2.bb => perlcross_1.6.4.bb}       | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/perl-cross/{perlcross_1.6.2.bb => perlcross_1.6.4.bb} (92%)

diff --git a/meta/recipes-devtools/perl-cross/perlcross_1.6.2.bb b/meta/recipes-devtools/perl-cross/perlcross_1.6.4.bb
similarity index 92%
rename from meta/recipes-devtools/perl-cross/perlcross_1.6.2.bb
rename to meta/recipes-devtools/perl-cross/perlcross_1.6.4.bb
index debf2717ce..3c544c9746 100644
--- a/meta/recipes-devtools/perl-cross/perlcross_1.6.2.bb
+++ b/meta/recipes-devtools/perl-cross/perlcross_1.6.4.bb
@@ -18,7 +18,7 @@ SRC_URI = "${GITHUB_BASE_URI}/download/${PV}/perl-cross-${PV}.tar.gz;name=perl-c
            "
 GITHUB_BASE_URI = "https://github.com/arsv/perl-cross/releases/"
 
-SRC_URI[perl-cross.sha256sum] = "131f7496152ee32067dbac2bc9b44b2f582fc778140e545701b3b2faee782f1d"
+SRC_URI[perl-cross.sha256sum] = "b6202173b0a8a43fb312867d85a8cd33527f3f234b1b6e591cdaa9895c9920c7"
 
 S = "${UNPACKDIR}/perl-cross-${PV}"
 
-- 
2.34.1


