Return-Path: <deepesh.varatharajan@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D5AE8D262B2
	for <webhook@archiver.kernel.org>; Wed, 21 Jan 2026 07:54:59 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.7203.1768982088918516666
 for <openembedded-core@lists.openembedded.org>;
 Tue, 20 Jan 2026 23:54:51 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=cVu3BP3f;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=548136b405=deepesh.varatharajan@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60L1Y2Hp3155707
	for <openembedded-core@lists.openembedded.org>; Wed, 21 Jan 2026 07:54:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:message-id:mime-version:subject:to; s=PPS06212021; bh=IWvrAof0I
	pyG/wnr3SPSK/A4kP6yvBMKTeRyqbS0OTQ=; b=cVu3BP3ft8kqdK4cewlm9t8fu
	r54xyTw6D0gU+nGVdGYY5GAEngorVlmqq9cm92BIlwtb6NKK5c70lchup+x9JWd6
	g6f+pD8XpQ8B5fYVWby3vpDmEdkw4uWZwPgga51Df9ZYPDsBOA1Sa2ok5Du56wU9
	5bgFuhydIHRSv9BLqzKAcVm/MEOtpl/q2Xc+I0/49EPhG5bib7VjHqr+fq1EtrUI
	gpwYJn9Cb2A7YrNnPrLoPeb+B92Fz6mbb5IYP8dxlC+K9h1Otz8LXOa3nSeEYxlt
	VcMgF1tz1yMAQv9iFwRxwFyH87hrBJl6oUb/UprU7beqETxeN/RyMg69dnceQ==
Received: from ch4pr04cu002.outbound.protection.outlook.com (mail-northcentralusazon11013067.outbound.protection.outlook.com [40.107.201.67])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4btn74r95m-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 21 Jan 2026 07:54:47 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hfHsQOcy/bep2YwN3xcHOoasMp53QR+bueh5Z2+UUwqyy6Sg/HwYRQUYaVF/KmWtTC+pw/W3QmKpOUjaQy9IYjvTU+5N4ZrJUYN0dEtpMHIl6xgHySeBYGRBkjQZ0nLVhWtBnKU8v3pzqHpypXRBgBs+fMfFTUny7wM5R8stBOg2PvHBB4fByfQF8QZ5t7Bl2Ovxv7x3xpa9ZBqPVKUO9kJH7uBeo6YRFDnjSZ/UVoEp8QHNIle29kqVsuY01/7eBQBoxwetRqzWn90BAdzbLkQvJdDvDxMsbeO3LOYWiQaMKw1T/Bxnphb6e84Gmtc1H+5wXmeFKCl28hUfEQhn6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IWvrAof0IpyG/wnr3SPSK/A4kP6yvBMKTeRyqbS0OTQ=;
 b=dy1SnJRw35Mmx2KtZjJTkdeY8chd4p6WkK2kb609Lo065GyfqmMWq0qQG0nggFVxfgCl6MwfvEbti6ytDFp1KgcYST9yFSDCqca8u1v/w3ScZNXWhBpw6Q8JvGQEVt26f4xEL49uyiJ3E4klDy54utJWSvHmhfs5W5i8iToP06WZgcwebv7AgKY8sB/t2M3/LBhFvrE/DlahTTUlOx4NzD5cj/lOhqLO/kos6t9xBqjqZsZeb4ybcinHeE0PLP72N/pCNFGKT2ju1rdA5E58P+hg5MCdznmCqZYqStTIk8h+zG5SfT/DM6Pe42YgaRyT4dU2dL1Ba5jJCCXxLPOnvQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from SJ0PR11MB5648.namprd11.prod.outlook.com (2603:10b6:a03:302::11)
 by SA1PR11MB8473.namprd11.prod.outlook.com (2603:10b6:806:3a7::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.9; Wed, 21 Jan
 2026 07:54:43 +0000
Received: from SJ0PR11MB5648.namprd11.prod.outlook.com
 ([fe80::c784:dce5:4b7b:54f]) by SJ0PR11MB5648.namprd11.prod.outlook.com
 ([fe80::c784:dce5:4b7b:54f%3]) with mapi id 15.20.9520.011; Wed, 21 Jan 2026
 07:54:43 +0000
From: Deepesh.Varatharajan@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: Sundeep.Kokkonda@windriver.com, Deepesh.Varatharajan@windriver.com
Subject: [PATCH] rust: Drop oeqa-selftest-Increase-timeout-in-process-sigpipe-ru.patch
Date: Tue, 20 Jan 2026 23:54:30 -0800
Message-ID: <20260121075430.436353-1-Deepesh.Varatharajan@windriver.com>
X-Mailer: git-send-email 2.49.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR13CA0007.namprd13.prod.outlook.com
 (2603:10b6:a03:2c0::12) To SJ0PR11MB5648.namprd11.prod.outlook.com
 (2603:10b6:a03:302::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR11MB5648:EE_|SA1PR11MB8473:EE_
X-MS-Office365-Filtering-Correlation-Id: dc06f220-7490-41de-5ac3-08de58c25675
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|52116014|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?txeCz+L2Zj/+OwsDctsscqPGb7EUrC37JgwQi/8jxbfqeTeu9UhftD4VcWHA?=
 =?us-ascii?Q?pmxdZImCvGN+WCjCvKbbMx9vrw79xWtJpLsAEcPS47dwSJvXR80aP1P6SDLN?=
 =?us-ascii?Q?fvVoXd7GQIQsDalmnNCcjGyMHASBzAurQdkLVpcmVwHuc94M7s5sNTkmJDwu?=
 =?us-ascii?Q?keE6HQMXK4hYeUEbJYNTve3LFyyfz8m3fo1GNV30x7ol3ge7F1RBLIfuTYXF?=
 =?us-ascii?Q?s2RDWXn6bB2vpgRAggYzPTDCIYeWO2azlx8/mURSUeUH3iI5stwPyIGcJrZV?=
 =?us-ascii?Q?lyrDnaXoCgQKOc0iI9+ICygCpDlH5gQbZcZbevxn20BLkFkwWv/lUcbA00p4?=
 =?us-ascii?Q?/VXThsoImprhfwamuH4ON3lxS87uPjz1QCA/mW4LScbNRjRQokCl91oIV4oc?=
 =?us-ascii?Q?Wz0BmqMda66ENjWTN9ywJ8OEMEW2jxADtv9bt2gv1fsPwjHrBy6VutsIusxu?=
 =?us-ascii?Q?hyxYVNrrikb09VYIWpAZaQeGtuv5Gh+PKoza4ESg8/xv0+DBem9Z6P5UrS99?=
 =?us-ascii?Q?5DgT//8vLSCgRtdarsuviNB1JjAcRHa2eLS4MqENnJ7PQLu1TyHVFzHICx6G?=
 =?us-ascii?Q?zaagt5vN+6BoHCTF2E/4ktbib4hQ5LpxZl7a0FFrqmmJvD/M58y5c3e4Qhtt?=
 =?us-ascii?Q?LaTn+9P9VUesWSRrS+F4/we0Y2br6J0LvkRRXf2DTsFp0eOxZ8nGzc+FqFYh?=
 =?us-ascii?Q?SZVg3gP7U4bRsTG5SypGFv1FULQsk97FT1wYVELaDeMlqirYILinYXrTEDP8?=
 =?us-ascii?Q?ikA5CO6PlYD2Xn38tBJXDQq5+9odQUd6TqeuJwASj+Q61Co7PcOlZ4Dv1FJ9?=
 =?us-ascii?Q?0lEiNsDKBL15FfIKHPQhsq67V/1gUU8ghYgPtq9wPPyv7fLHFaM2AxvHeXAS?=
 =?us-ascii?Q?PbC2PKwqTx3wL56QGSPdQBGhSXRotB8NpgNoOCyy6bgvlvrQuI8dCAwfpjQg?=
 =?us-ascii?Q?vYUOmr31BBCtl3ba1qx7KeF0xTGZhxi+iT+s1lkfypAGeiHHmE83kJpVsOgI?=
 =?us-ascii?Q?C5Xq+NA5tHhG2WJn9UGJH8MeY4DqYyMpwsa8Va1OyHXcg5jLvtHtSfoea/EZ?=
 =?us-ascii?Q?hlSqMepySL2kSOmSLLZZi0SHHm5GUs8zyApuhCSAJTiO4wqcBBtKHlvB+1Lw?=
 =?us-ascii?Q?4G3GBB/PhX1NCMkGUpEzvNBaLVYvTapxGuXhK2p1zjMhlNm+Gin2KK8lMHiM?=
 =?us-ascii?Q?UBozlW9r6IR64BJc7tDIuroYcuuu/xx4JE22AXGh5Br90eI09hVj3V/oq4Ap?=
 =?us-ascii?Q?rck1YPCgHjnVXtslh5NqTGco97YSeDQjGbJGAGl2r1CnTTkdbYermvnlFhkR?=
 =?us-ascii?Q?0H+LuIK90wu/UfhW4XC9nNTlqD6GK64BWD8Jqfl/P47Ch4GUZ0tiST5MaNkV?=
 =?us-ascii?Q?leFtXKM5n9UzKLJcAmeSKsVvwsBSqMe0PIYG45+TlfkLkaSTo/WLVMyFPI7k?=
 =?us-ascii?Q?atfDAvFVWlmVX6yqZzR+MmLzuxOA+YtSeZp2fN4eWPTAwQJOooqNbxJaoyb0?=
 =?us-ascii?Q?WiDpnNo7OqqExh/aWaBOlVV4J1UQhKDt/IBW+4Wovxf2Eme2/4SzE5d7MG9r?=
 =?us-ascii?Q?d16yfa09DgqAPQUXbBM=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR11MB5648.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(366016)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?o5B1/NPGqQEoGiYxLPcJGFqK14oIu8ZLWuTgLGbx35LIk6P0PgBitj6wnVjn?=
 =?us-ascii?Q?vOhCE08QVmOmA6DhrQbGrICkFsIdkcsm/1s+jaky0YyCuXqZU8DE2j1xyjaE?=
 =?us-ascii?Q?SayybAc1xTkfASuwRjrQKtmzBWftzrb9ZB1AQcxhuRX6U29rH5evCBAz4iDK?=
 =?us-ascii?Q?i6YQs7Q2aEPtaqRBTS981iFHATDdfbBUQKjuertDhSxjFyMQYoNSzv/xwCIL?=
 =?us-ascii?Q?chXlHgFc3FEPn6Uvf4xuHklbCF1HL0jUApQFx4nv57ezOE2brqPaW7AhOfIB?=
 =?us-ascii?Q?qv61wxKngI9EHUlfxqComz7BF8HIZThGZSzcUQjOKjK9Cw7XDQBFQ2vTPKN0?=
 =?us-ascii?Q?QgjlpWhD2e+R7GqpJ5eeTIH9uK5nsCXg+Wtry52gO9G834oi0BAC5Y6LUqBq?=
 =?us-ascii?Q?9Alid+0FwYSvlCczqFdWJwhz8J/kQ1x87WTSNzB9wH62seZZB7ISJ/zqQOZy?=
 =?us-ascii?Q?Kc5aZmTiVyKJykcqtMb1+blAI7TANz2BZ7E2I8m/bgpYulIDODQqvym7cDrl?=
 =?us-ascii?Q?qyVGKAKZbd5Z9eILaRqKNzwVsC555LDx9ryHa2wA7JQlVUO4rSChqH/HpDam?=
 =?us-ascii?Q?EmakXpAmP627nsv254lNE9ni4p9YJ+90aP+7gNKyEOLQRJk0XKO2F+Mt26H5?=
 =?us-ascii?Q?pTT1IWrAiaiDbNmBdmHTt0e883apZUouXq4dvylPou/n77/A/LsaLiW7c42b?=
 =?us-ascii?Q?RExX1SAnWrDIy7f96UzaH+xh/DKisj+Te/eNcuFrZdrQiE96PUG6M1gDon3z?=
 =?us-ascii?Q?QRMOdP36deJ0iSglnUUGTe/vG1CSrww5VJd8dqzfW1ZSFVhoTavAMic5GzRG?=
 =?us-ascii?Q?GewHdYCgsASZQM3OBoVFwqj3ZpL/MS5eRMxUkdnoYcqa0DmFvQIUCO6/1M5O?=
 =?us-ascii?Q?89SdLqps+c3bDBh7FaVct3SGc22unmbleLRHdqHgp0jNwqCucnP4jVlWrMFh?=
 =?us-ascii?Q?ZHWec59xdfCANKp1sVPEt+rdHwbMqswjL4ULqKa4kyvTewJOs7G/c8YxLHok?=
 =?us-ascii?Q?HhxQoB5V0o0BQKvmfSMZApK0w7CN31z75Hx3pG0gzPA0EyNwm30CrKh9TqLS?=
 =?us-ascii?Q?KYDkYyuw4mdAbaKr/PJ1ABIkLzYOlVSAq12qiRyaFa6NJ55DlHzW5irEn0/J?=
 =?us-ascii?Q?3To3qIBm320/7K6aWWrg3HoWAs5NvqBwUgbTOX2dWDl/0YgN7TBG095AIZn4?=
 =?us-ascii?Q?w8hizfcWrC00Z0itBEA25fhVFrpxSQjyTOrq2en2fcciEFSCbEF0kmOphNrj?=
 =?us-ascii?Q?dBXHU8g0j8rINdFVWfdBr3ySVwRKckSO0Af8xOP2jomRwJgTTufybzfw+7/H?=
 =?us-ascii?Q?AKLxnkbzCTHS+3hrcboQ/h1DUbizug0NIkAQ/I9k+ab378cj71TKw5jQqXmY?=
 =?us-ascii?Q?alCcxL1qfN0onRRVUsmYamC/HPcYVEHZz/qCOn1WWaX24xuM54ni/W+RBSMu?=
 =?us-ascii?Q?65YjtprKSwDwPRGV7EjhcOaTLejKWPZOKCTU+BAMefh+XDK0LLxfxV0Vm4Nt?=
 =?us-ascii?Q?TVQECsVO4V0kOoN1YfFIHWt5fTtLa4C7qH4JAjsQoVjryHRqPAKSt231575G?=
 =?us-ascii?Q?nJINEJ5O1jL0Q5D6hn/1B986Upq0AnVNkUyQ/og3pPmaxUknZd65I1X4GpRX?=
 =?us-ascii?Q?GjSEqe5Mtp88TUgkdk7nfOWxoliivgFpV1qrORLVKwGB64nfy13vIzjfVVAv?=
 =?us-ascii?Q?xUBzxKep0rA353sNcLOjb0DN6fgFnQYrYh0QbPhraLVkiqD7SYpLuBYmOlJS?=
 =?us-ascii?Q?/ZGdjZaSQOF1WmokTZhrkWrfehgB7Ifa973L6g+9VQUHdaC/p0aL?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dc06f220-7490-41de-5ac3-08de58c25675
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR11MB5648.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jan 2026 07:54:43.1990
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: x42ogtOoJSFrouojtvimacn5e1+/iNXQkA02vLXcJjeq9a6z1neTHk4wN6SbWtILPTtLPsjmt/dwL90ztBaZBEa5V1kGajuTdCvvf5U9HpQ9tqwRQiy64azyktpfjxfT
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB8473
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTIxMDA2NSBTYWx0ZWRfX8ZFNru7Ugb7O
 u/KrYCKTTdDIzbo4jAPWsSpv5sCxRy9f3uTVqUhndQOptJqwiku+Z10ZDTnafHw15hvmW0zmkc3
 qs3oFfEOTm37B445xWaZ5OOxsTPmJ3Dyv65+YjUPY+5lg+vHx8n5DnCaP+k2zj36C5GaYDmT32w
 igsL24RvxyiECdiTaJqdoS33HP+fauwIZd1W2KTXiBtm3dnsUVYFUM7JItVsJwzA3keu6H3scgo
 n4sCa7Dy1LVIH6iY2FaxH8vumKGWqFauZOXDCeuBrp/sUlECnpa8LvMzuLYRot4oHjUIvn++bUn
 gFZ4X1FxBSo2w4o1RzQ0KsudQ3dM/HrYYe/mbz6TXY74ST8SjLDlT86wDDrr1TDWlj2xZtlgL13
 5MSNVSC4a2tswupjPTAeqb+CeHVpbxwcXfb1E3onuWQB4L1M7ohNQoQt0F5+eTxIYphWfnyTU5J
 OyG1P4uJLcf74U16rrw==
X-Proofpoint-GUID: MdRsnmfZHee82o5vX7Mz6v9OvzuzvlZO
X-Authority-Analysis: v=2.4 cv=C6rkCAP+ c=1 sm=1 tr=0 ts=69708647 cx=c_pps
 a=WMD2V7/OXcB8V+UEbxscyA==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=vUbySO9Y5rIA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=ei4SEBeUAAAA:8 a=t7CeM3EgAAAA:8 a=a_U1oVfrAAAA:8 a=q1SAu9DnQ7EJbCrOdkMA:9
 a=8zIOOLb7Ym0NljyPXbuS:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: MdRsnmfZHee82o5vX7Mz6v9OvzuzvlZO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.20,FMLib:17.12.100.49
 definitions=2026-01-21_01,2026-01-20_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 suspectscore=0 lowpriorityscore=0 impostorscore=0
 adultscore=0 malwarescore=0 spamscore=0 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601210065
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 21 Jan 2026 07:54:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/229797

From: Deepesh Varatharajan <Deepesh.Varatharajan@windriver.com>

This patch was originally added to address a rare failure on the PPC
target observed in AB. Currently, we are no longer testing the PPC
target in OE-Core. Therefore, we can remove this local patch. We have
also verified PPC testing locally several times without this patch,
and the issue has not reoccurred.

Signed-off-by: Deepesh Varatharajan <Deepesh.Varatharajan@windriver.com>
---
 ...crease-timeout-in-process-sigpipe-ru.patch | 31 -------------------
 meta/recipes-devtools/rust/rust-source.inc    |  1 -
 2 files changed, 32 deletions(-)
 delete mode 100644 meta/recipes-devtools/rust/files/oeqa-selftest-Increase-timeout-in-process-sigpipe-ru.patch

diff --git a/meta/recipes-devtools/rust/files/oeqa-selftest-Increase-timeout-in-process-sigpipe-ru.patch b/meta/recipes-devtools/rust/files/oeqa-selftest-Increase-timeout-in-process-sigpipe-ru.patch
deleted file mode 100644
index 5bd1abffb4..0000000000
--- a/meta/recipes-devtools/rust/files/oeqa-selftest-Increase-timeout-in-process-sigpipe-ru.patch
+++ /dev/null
@@ -1,31 +0,0 @@
-From b4524278985f517b0785b6f64a21380dcf1ff096 Mon Sep 17 00:00:00 2001
-From: Peter Tatrai <peter.tatrai.ext@siemens.com>
-Date: Mon, 4 Nov 2024 13:58:16 +0100
-Subject: [PATCH] oeqa/selftest: Increase timeout in process-sigpipe rust test
-
-This patch increases the timeout for the process-sigpipe rust test, which
-occasionally fails when the server is under heavy load. Increasing the timeout
-reduces the likelihood of false negatives under load.
-
-Fixes [YOCTO #15625]
-
-Upstream-Status: Inappropriate [OE testing specific]
-
-Signed-off-by: Peter Tatrai <peter.tatrai.ext@siemens.com>
----
- tests/ui/process/process-sigpipe.rs | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/tests/ui/process/process-sigpipe.rs b/tests/ui/process/process-sigpipe.rs
-index 11f363d62..c12d66016 100644
---- a/tests/ui/process/process-sigpipe.rs
-+++ b/tests/ui/process/process-sigpipe.rs
-@@ -23,7 +23,7 @@ use std::thread;
- fn main() {
-     // Just in case `yes` or `while-echo` doesn't check for EPIPE...
-     thread::spawn(|| {
--        thread::sleep_ms(5000);
-+        thread::sleep_ms(50000);
-         process::exit(1);
-     });
-     // QNX Neutrino does not have `yes`. Therefore, use `while-echo` for `nto`
diff --git a/meta/recipes-devtools/rust/rust-source.inc b/meta/recipes-devtools/rust/rust-source.inc
index d7d44510e4..3edf0899ab 100644
--- a/meta/recipes-devtools/rust/rust-source.inc
+++ b/meta/recipes-devtools/rust/rust-source.inc
@@ -4,7 +4,6 @@ SRC_URI += "https://static.rust-lang.org/dist/rustc-${RUST_VERSION}-src.tar.xz;n
             file://0001-Define-more-ioctl-codes-on-riscv32gc-unknown-linux-g.patch;patchdir=${RUSTSRC} \
             file://rust-oe-selftest.patch;patchdir=${RUSTSRC} \
             file://repro-issue-fix-with-cc-crate-hashmap.patch;patchdir=${RUSTSRC} \
-            file://oeqa-selftest-Increase-timeout-in-process-sigpipe-ru.patch;patchdir=${RUSTSRC} \
             file://0001-src-core-build_steps-tool.rs-switch-off-lto-for-rust.patch;patchdir=${RUSTSRC} \
             file://revert-link-std-statically-in-rustc_driver-feature.patch;patchdir=${RUSTSRC} \
             file://0001-riscv32-Define-plain-syscalls-as-their-time64-varian.patch;patchdir=${RUSTSRC} \
-- 
2.49.0


