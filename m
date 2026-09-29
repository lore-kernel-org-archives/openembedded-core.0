Return-Path: <sumanth.gavini@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 95034C9832A
	for <webhook@archiver.kernel.org>; Tue, 29 Sep 2026 16:02:13 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.630.1790697730974208686
 for <openembedded-core@lists.openembedded.org>;
 Tue, 29 Sep 2026 09:02:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=QWWcjFM7;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=473248f204=sumanth.gavini@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68TEA3fr759650
	for <openembedded-core@lists.openembedded.org>; Tue, 29 Sep 2026 16:02:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:message-id:mime-version:subject:to; s=PPS06212021; bh=NBsGAaKWH
	BXlme1+koYYbua0z2qeOVFlMje1KaenUnM=; b=QWWcjFM78VIiflKRrFWEGOnUv
	G0UjvYclWpacvKUhg9wlj2XDqPbk+bnckvPMH7r7AZ6xxqqr9Sl/AKtVOsIMylmR
	qwWCr0Gqqm8fbV7DGkCnDDva6FgDLL+gA3WoRNHP2pfp0R0rlD/OSfxLm50ug6Fc
	g9U+KvSAY9m4nFTT+PEOvbNC47kPK1mccE089eXSjuRg10eogyCqj/qRFx1QSJG+
	sHJvLAUA80OLsJ0z6SYoO6cM37CveUErxdxcev2MeCX/Q3MvjbbrOi15g9lhK13O
	hGRHkjxtWd2IZQG6dKeF8XjXhtWSmgBhjq9tmqiJCrmNjicNZT9woD4Sn4oDw==
Received: from bn8pr05cu002.outbound.protection.outlook.com (mail-eastus2azon11021076.outbound.protection.outlook.com [52.101.57.76])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4gx38wcwdh-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 29 Sep 2026 16:02:09 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pt5TaCZn8u8/AZI5dlC4WXB/3J8+P5StiCUYM8mPAmux61XiZKxqsC0WOZjdSwMKd3psqsSyt0UO1lyo1fbaEpqWhDX8nL0lYDrkHeqQgX9mBtnX+e1OQCXZlowtGvsJhx51TjS1rIqcTsoIR8MoS1B3pO9/TKuxZV4MnedzMCgoW6pRN88BYLk95vYcjKezYkH9mKW5nzfa00YcICyPCtMhAnbkJVn6tDv7M6lpTUDgSQULKUJq8Snv4kmw6QkXgq6myMy8Nxakvdl2DSNAFv/Fh86lEFBw32b9Orc07Ase5c4kQdzg5k3WIFBq0rPM1M67ISd0p+RphfEDORVtPg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NBsGAaKWHBXlme1+koYYbua0z2qeOVFlMje1KaenUnM=;
 b=NLYootZv1tte8PISZxQJjcyIcpdFzkLV7OnLT16emTinWtPrVy3aQdJAJ9RU9KhclkWfglX1EHGzO39EbkcuHa/smJCdxOxqdA+akhTmnbijPkS4Jsi5LbSJaNCoqGP5/5peyJI2Wv6U9TOOQaGfSXey6b8WgTG2QPvFl56rs2QvfKOhWB2mqLUW01R8Cf9e7CRUyFK32dfMaABQlYp8bz2mnNj6I87o2K+fib+p06I9jIEzVhAeDBzat8E2NIs8VnfZUUjrQkFBuxnNYqnhIBuTA/H12kHxSEU7th5INi156Y/fYOb0WPD0UowwBauvx0pDh7sM6a0CoCx3RfmYNg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=windriver.com;
Received: from SN6PR11MB2864.namprd11.prod.outlook.com (2603:10b6:805:63::26)
 by CH3PR11MB8363.namprd11.prod.outlook.com (2603:10b6:610:177::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.24; Tue, 29 Sep
 2026 16:02:06 +0000
Received: from SN6PR11MB2864.namprd11.prod.outlook.com
 ([fe80::57cd:f606:2a6e:4d1e]) by SN6PR11MB2864.namprd11.prod.outlook.com
 ([fe80::57cd:f606:2a6e:4d1e%5]) with mapi id 15.21.0451.022; Tue, 29 Sep 2026
 16:02:06 +0000
From: Sumanth Gavini <sumanth.gavini@windriver.com>
To: openembedded-core@lists.openembedded.org
Cc: sumanth.gavini@windriver.com, randy.macleod@windriver.com
Subject: [PATCH] less: upgrade 704 -> 710
Date: Tue, 29 Sep 2026 09:01:48 -0700
Message-ID: <20260929160148.1379655-1-sumanth.gavini@windriver.com>
X-Mailer: git-send-email 2.49.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: PH8P223CA0015.NAMP223.PROD.OUTLOOK.COM
 (2603:10b6:510:2db::34) To SN6PR11MB2864.namprd11.prod.outlook.com
 (2603:10b6:805:63::26)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN6PR11MB2864:EE_|CH3PR11MB8363:EE_
X-MS-Office365-Filtering-Correlation-Id: 933ae931-ef02-4897-7ae4-08df1e430218
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|366016|1800799024|52116014|23010399003|12006099003|18002099003|38350700014|10067099003|260925022911599003|260925021311599003|260925021911599003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info: 
	oNBc8T2W2XTl1lGvuSX/A7CdbmctRuH1IIzK7Jw2cEDwX/qOwXlnkvWPdSGxz977CiD7LF/AZZOD9XTRdR38SwlOXgpM8ULEV3rAowKv3P36MPxYs8AUE1rufqFKFhfF5QMXHvbiRotyiWFWQDL1h0t8Il6TIN9I6ZQGm60AEKnHH95N7Jw1H5RyYnSM9kaktUzrPvauIIAxdEBlkHz9+9GOQezkTd3opx80VUnIzwRhbhzPVKI35IYgnxw4vo1duaHN5te+ySG7FX3PUtwPe/cC5tHT9HJhXMCwyE71amO9RGjUzqm115PkEEox58xi06/DnYgxfaoDXQuozAUBISVwXhOTvHDJIV0o/DmhNxFn2fhkgrHxkKex5HPlOXb4Go/xXAyl5+PoZGzgRN4jYwn4HvS3sYUBWkQbg1ZUxM360tAAfZLwhH8j1DVc10XIJd96NK45GV4Y/9nCER2ghkT9HKDmHKpDEL3BUoTWR5DjQd0zkbJG1Vx2S8EvXDgjc+vXIuj+P4paUsWewPbUgEgUdG7DrwJs8E2cAqsqmNRufcTkgBwU1sZDmw+smMOcmKytuxDaCSIgxYRMpM3DNsTyCwhmLug1I3kfL5DQ4+jucYlCv/CaEkyKCEHspIiNmZpq6KjI8fC6rRNQuLGMNhFEQ5NfmFpAZPj7szHsoMg=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN6PR11MB2864.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(52116014)(23010399003)(12006099003)(18002099003)(38350700014)(10067099003)(260925022911599003)(260925021311599003)(260925021911599003)(56012099006)(11063799006);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?kODyNeVR+dPt55NwWAg55OLm95hyvz3oZpn/Hrp/D0NwjTPVGjulRgoj7wpK?=
 =?us-ascii?Q?gvceTi8o44jdIVilvcJSHfpR9U+aqS+tK0QBlvF5VrPvUaUo8U3SYal4Zz6G?=
 =?us-ascii?Q?9YXkSHfb3u3KWQUaSS7/ixfwbJdj5IUosCD+D99DaKXY0wgqVhJu2+SSxAEN?=
 =?us-ascii?Q?fI0DO9NxPYn8NyRnnCIjxm4XNl36HNOwoQwKc7I1oyLC+DFIXxX7lZu99SVp?=
 =?us-ascii?Q?cWINhVOyDQggsY2UFza7o6uflmATBCCxDT9gkWvHFLuRYMHgX/shQulZ5C89?=
 =?us-ascii?Q?/F4vwukq8dXw3zaiEcDkbmBhA8TyvmT8Fyl+QCM2fjLkVi2znLyeuYWRd8WP?=
 =?us-ascii?Q?9gBES1HcRKFccMgEjcVQNuoP5FqS13T7px7CHkUWeC6n9QyfSS/3KuwENqZx?=
 =?us-ascii?Q?onM98/tpY++c+PGA/DEqMhQW4MjOXVUCv4vXyg8y4tsDZUGiWdsY91CQIulU?=
 =?us-ascii?Q?8L0AgLzNcmH01sdSFqbLhBRjmJCf5geJgHIssXs8hDja4PGTqpEM0GOJON9u?=
 =?us-ascii?Q?Dx3fCesKiR+7sQTU+E7oHwqi7izGDW9FYNwSpfd+HutnhQTkVJ/MiZU7NnWd?=
 =?us-ascii?Q?+dvwlsUhzM38vtRwkkHSVtkrLB1SaeZzWdW9b/X+MCbYHv3z2nXSHNJzz9M4?=
 =?us-ascii?Q?aQVsH2yrxxNXXPchoE87sGai41AvrZvHGW3NztYz/kiyoAthgqcgszfNsKra?=
 =?us-ascii?Q?lB5KPJv7eHM9obaNhjpVDSFKG5t7nneXvjTkavuxdV0X4MUhonanshtfZZjA?=
 =?us-ascii?Q?1UprI7Z/jx3uMByDBNJ6mkah7FDqrhcUmS28XIyGsNN+s/+bgl0LobMhuBai?=
 =?us-ascii?Q?dbonMW2iYbHjNGoBwWhijco59pLdLX0ezF+r5s6j+8khG10K8CWTUS8JAlzA?=
 =?us-ascii?Q?P2l9+Yr+CNYTtDX13U7A4JcwDEM7GIIfzN2fEWV6tA+SHuyyB02OnwWOjJeB?=
 =?us-ascii?Q?c0H0G+KQRMMX/jN2aAOwZSAdiOgO3TRMRg0rZ2yEzdhEMixmZGAQezf3EXMD?=
 =?us-ascii?Q?b6R3aP/K8lkoTijETHUZ6RlZ7dNl+KhdvPnqJPI2TWQI4ZBYXe7hqTrUetPS?=
 =?us-ascii?Q?eNkinR1iRr1Xl6U/DjbkkvNgjpQsEdRF708XXDfaDTuoHfwVzIgX5snovhzw?=
 =?us-ascii?Q?JyDyFHLZEP+3NJndkj6enrxg24BdvkwL7y26BKQvb+i7yfEqkTwZy3Y3XfSl?=
 =?us-ascii?Q?AYgrtkgffwC/P6QwRnpZ1UhSO0+FlJSaTm0QVUD/DfmCWnWVWW3fO28ISlRB?=
 =?us-ascii?Q?KVlFoGPCK+6BAS178IkqaEuvFfwOaiE4RU2J3oz8MrGxLLGy1ASLeGijUunT?=
 =?us-ascii?Q?q/qKTVqMyWLWF8YA6XFbVDljPz2Gky4EoQkGtxuzFcFOUq07dSKE2B/dB3QU?=
 =?us-ascii?Q?ZeXAGMeWfHwbodRIraCQYfbm8QuqsEGi0lthaxGAojDY9uBqCSETXtAw3nwu?=
 =?us-ascii?Q?Zlt+zpzSm6HmRmnhvbIv/jjUyYpAEF9cZEfm24UPTT1pGSk7v/mPGLhsLzVD?=
 =?us-ascii?Q?cXimFDINWdUqkiGE595ICskO5lqrEhY7naUHMrd8nJhI824OLPOiGnv0Qa+p?=
 =?us-ascii?Q?Iwqz3l5gLcLSbN3yK8KGOX+0SjsVwenNq6dlM/qYZ70A7VEieFaeHL4VN+CX?=
 =?us-ascii?Q?06RhAK3VZRWZjAh0gAmgcOgJCWn1KrvCmGVQE6Ko1McYBi2k1OP79OypqSWn?=
 =?us-ascii?Q?Vfy78JzCS3Ara3PbWpZlw4q0I7l5dtgpESUQuzh88VpMaN29gCJU6GtQ/5qr?=
 =?us-ascii?Q?R0Y3wmqdNqBuytJ7tb0SqOQ2EQirLbU=3D?=
X-Exchange-RoutingPolicyChecked: 
	5nXVg24IplP79cjJTdYYd4yN5LT7Hmow2lXds0fjiqyjK0c6Df4APCMyQzp1v5baLl+5cXORQ/Qia+jKtFDUmfeMWOkeIcX2jqwJk5v/Bf1y+JEdGGEx6jrJhQg8G8E3PmPPjsWTR7gyl3okIdHkvSCjfECUAWDHgD/ewafirURsbe9+nWwCtPmGbq1W2dwTb07sdntevEygPb5U7eiHOauk8puwadZRoplsPb88YBG4I6u72pvZjyeVO6qjQf1N4nQwkEO2+VFW8tSzKFvDXQls2MAJ4VpMHMMZp8bbD2dvnXigxfaBogbe+co6lBBs1gytBx3n7a+cDMQyHaId7Q==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 933ae931-ef02-4897-7ae4-08df1e430218
X-MS-Exchange-CrossTenant-AuthSource: SN6PR11MB2864.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Sep 2026 16:02:06.1101
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KHwdtnI3zVSX6KkjCqaoKkD8HskEz2A2g+mLXE7qck9z+u/nRAeRU8o0ymLHqVnqCLoNPydWQysSh+5zd9mWsJzSYu3MWEfx00JgCKmGGrE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB8363
X-Proofpoint-GUID: lN6vGAJOvXRkDIoA22uOZyEaSILTOjhG
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI5MDA2MyBTYWx0ZWRfX6xshyqurpx9m
 uoDU/nGFSIQdnxo1ExD+sTh54e589Ke5NawSO+6OGmwtZg5i5xQo3vydQBSEueWSCSTFddUNuPw
 guvoL+DMhKU64AiU0/NPpTNis+dgUNJZ745dbyHT8YxZAHRH4+Fwfe+MSCGBm+ND7cptsdwN7Sn
 OpDqWqhms8EPs4xvjCcm/7/296PL4v86gyVdWbxFRYKI6byC/G4XHUXOP2VBxMvV0XCDTHU7eEh
 1kjgVfXKMKq2AP9QhfCIUkIflp2lVQzOa3oBquoztN83cf+RV/zCnMOvJ68t9mVhSvss5fhdKl/
 xW2kx0KT5p8ZiYJ/04Vst4kRP/nktm5VWNlcR7y5k1nV/K0rvfGO1l7BI2FkntBzs8VgZG/ik7s
 FZzKtW2pQKCJSaozuRt/YMyNcXJ+E1HyE6iq+Y5OY2JqPuqVyvBS/2/33MCWL9XXhMUvKciiToU
 KUFbdjRa0c48daVuTGQ==
X-Proofpoint-ORIG-GUID: lN6vGAJOvXRkDIoA22uOZyEaSILTOjhG
X-Authority-Analysis: v=2.4 cv=ZYSIpcVA c=1 sm=1 tr=0 ts=6abbe101 cx=c_pps
 a=A1ZJ2ZpE7ptU6E6UTMl5DA==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=VdqzKS8jKosA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=klDOsUkWDRETUCZYPvoE:22 a=4avBbA3pAAAA:8
 a=t7CeM3EgAAAA:8 a=RP-aTKZqsUBj-kOCCI0A:9 a=FNuvnhAvCZ4ZEIA-sn9Q:22
 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI5MDA2MyBTYWx0ZWRfX5IEfZLIU1hBw
 CzeUitMviGFCTDDaMfd3Cs7v5u4f3yZMdk6BKrDslpKIaMQLQ5ULgDMmZO+PDaP+kBNDmBhqixG
 oMeWCyPKEj9K4biJFRSDgwdrLOP68oTUbZaBjLSLyl4dsxSkb7Ip
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-29_04,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0 clxscore=1015 priorityscore=1501 impostorscore=0
 phishscore=0 suspectscore=0 lowpriorityscore=0 adultscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609290063
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 29 Sep 2026 16:02:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/246878

Changelog is here:

* https://greenwoodsoftware.com/less/news.710.html

Signed-off-by: Sumanth Gavini <sumanth.gavini@windriver.com>
---
 meta/recipes-extended/less/{less_704.bb => less_710.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-extended/less/{less_704.bb => less_710.bb} (94%)

diff --git a/meta/recipes-extended/less/less_704.bb b/meta/recipes-extended/less/less_710.bb
similarity index 94%
rename from meta/recipes-extended/less/less_704.bb
rename to meta/recipes-extended/less/less_710.bb
index dc841a9ae6..f3f5ebd6a1 100644
--- a/meta/recipes-extended/less/less_704.bb
+++ b/meta/recipes-extended/less/less_710.bb
@@ -29,7 +29,7 @@ SRC_URI = "http://www.greenwoodsoftware.com/${BPN}/${BPN}-${PV}.tar.gz \
            file://run-ptest \
            "
 
-SRC_URI[sha256sum] = "20a0b0a2bb2525fa53c7eee9beb854b4c9cf172eabb209af7020743547bfe9fb"
+SRC_URI[sha256sum] = "d1008fb78dcae1323ddab664bcb352a61f022b1b131bd8018548e021d975ec7a"
 
 UPSTREAM_CHECK_URI = "http://www.greenwoodsoftware.com/less/download.html"
 
-- 
2.51.0


