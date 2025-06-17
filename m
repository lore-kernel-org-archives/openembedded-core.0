Return-Path: <SunilKumar.Dora@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AB03BC71136
	for <webhook@archiver.kernel.org>; Tue, 17 Jun 2025 10:09:40 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.15274.1750154975293492897
 for <openembedded-core@lists.openembedded.org>;
 Tue, 17 Jun 2025 03:09:35 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=8263d137de=sunilkumar.dora@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55H7k1qt023920
	for <openembedded-core@lists.openembedded.org>; Tue, 17 Jun 2025 10:09:34 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4790282v76-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 17 Jun 2025 10:09:34 +0000 (GMT)
Received: from m0250812.ppops.net (m0250812.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 55HA9X0l011812
	for <openembedded-core@lists.openembedded.org>; Tue, 17 Jun 2025 10:09:33 GMT
Received: from nam02-dm3-obe.outbound.protection.outlook.com (mail-dm3nam02on2048.outbound.protection.outlook.com [40.107.95.48])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4790282v71-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 17 Jun 2025 10:09:33 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=u881MpILtHJGrv+0Byu+XtjNL13NTp9HYCrFNu/H+3eXg8Wp+gaNNXwjI6bwaRluSS5j+Wjf7NApMv3YPfFRxeY9MZxxIgTjAzotiq+MF5s8nDuV6KgEhafZQaw0TOK+BuX2RrjyPiQHx0iVmStw265N70zLqTIJVVMHr9oWVRoe5px/9jQoPwiHzu259jLIEMx0YUQgutBuu+1FDoS7aWFVUJRFWpC7rlXAPy4KpmfjYC1hmkB+Xip1ntOCHC8RnQrg9CP3xDmX+MUhhs96q1vnw185tcFzFfAWZR9cnFuoERLLDw39rcfaH5xLCJvNpu7QIvJ7f2JxJ02bmFbj9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TGhpq9oD5ez7U8Ejn/rhFhEi1SGvVE8kU1bLaTKI8TM=;
 b=kUiQLsB5rjitOZ/IfeoxQjUiPEbs4Yg3QrNQi82P7fANVGitc89PuQ+tfAttzjl0Y07tXReCMIt3oPfnGnw1XGuVqEuGVhw4vIlXA8IzldXMZmvPzPKJmCIJtJHiOhjxwmUw0B7QnIUDbM7r3lv3gn5XzvVpfS2elmb2tZT9yj2elvVvEoxka9i1ACcwe2PUlynmqG3b2pOLIGGi/dt+ssYeNRqjq8yHKQqze+O0Bh+k8xxR/vZJ1wBGUoI7k85LbjKnfjJv2h14dqd4/Znr39h2R+5pieGwqJ9M/LpzJDIHD+mh7jsSUzlGfsQjW7ViT4qOOxUhVxWZdN05q0Fmfw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS0PR11MB7901.namprd11.prod.outlook.com (2603:10b6:8:f4::20) by
 SJ0PR11MB4880.namprd11.prod.outlook.com (2603:10b6:a03:2af::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.29; Tue, 17 Jun
 2025 10:09:32 +0000
Received: from DS0PR11MB7901.namprd11.prod.outlook.com
 ([fe80::9fa:eb3f:cf26:264d]) by DS0PR11MB7901.namprd11.prod.outlook.com
 ([fe80::9fa:eb3f:cf26:264d%4]) with mapi id 15.20.8835.027; Tue, 17 Jun 2025
 10:09:32 +0000
From: sunilkumar.dora@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: Randy.MacLeod@windriver.com, Sundeep.Kokkonda@windriver.com,
        skandigraun@gmail.com, steve@sakoman.com
Subject: [kirkstone][PATCH V3 3/8] glibc: nptl Remove unnecessary catch-all-wake in condvar group switch
Date: Tue, 17 Jun 2025 03:08:50 -0700
Message-ID: <20250617100855.2696492-4-sunilkumar.dora@windriver.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250617100855.2696492-1-sunilkumar.dora@windriver.com>
References: <20250617100855.2696492-1-sunilkumar.dora@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BY3PR10CA0030.namprd10.prod.outlook.com
 (2603:10b6:a03:255::35) To DS0PR11MB7901.namprd11.prod.outlook.com
 (2603:10b6:8:f4::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7901:EE_|SJ0PR11MB4880:EE_
X-MS-Office365-Filtering-Correlation-Id: 709fe438-0c9f-4f3e-9262-08ddad870da9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|1800799024|376014|52116014|38350700014|13003099007;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?i6HHVFf1RlS73Xw5thYEbvvAHjx9yKiNW01mJ6rFwWG6RS+Z3ngQvC+fiK4+?=
 =?us-ascii?Q?dPFvlG1asdl4xnFuPOGibIueq5KxwCP84lniluSukRJYeL5nwpkLAXBw/cni?=
 =?us-ascii?Q?/zwa+2E4P25zxKISlmLml8tPRLVK4nobFsnJvONK2KdkqbTLLjW6C4HYPO0f?=
 =?us-ascii?Q?+K3dIlsnZVQQTpK5PPKgvckLf4LnatXelxkRDUc1Xavc8O+cInh1BJXG/SBJ?=
 =?us-ascii?Q?ggKdxhcA4fPfhhhIxRDkRBDtI03/ai/i/azGteoMnnDuOgEyF1//zE1JcYd1?=
 =?us-ascii?Q?FXs6B3BPsrg6rInAB/VCdww5VdBC4GJbJCjXeUdqB56DMIHo77mVM9NdX06T?=
 =?us-ascii?Q?ru0uKmZjZFqUxdb/ulhquNkzXRUB6nWMgxMKKaxBeXt/Ek84+8I5zpA/4/2Q?=
 =?us-ascii?Q?IqQYuo1RTgY5DdEM6PawbT8nZaL/l9+5z9RjzgYzZ5Oi64WxGDQ2IFEJg/LF?=
 =?us-ascii?Q?SHx86cSHP7M+Q3Cjrj11dPBuTPj7icVLAcirfEQrG2pQd+LXmEBXRAnoHZ3s?=
 =?us-ascii?Q?jtbpEqVOH9oEp7bqBkgMz1ucVl1N5LAjekDGdNxWUIaHHvM+xwOHAB16dCXc?=
 =?us-ascii?Q?f5lgdK8V01GRHZT1QBAmwdWOHagU1nQtK3BpKMhpVwtiRSoTfp0kAIGxfo1A?=
 =?us-ascii?Q?1DG264x6g1c9zOKmXaxH6l+jYFHU3hC6/S/pxVjH7nAeBlN+tueFr/eDmCuc?=
 =?us-ascii?Q?OWZvstzgnpep99bB1KdaT33FZaoy7E+G0LiVu7S2vG5zYGTwFmPOXz2szkMH?=
 =?us-ascii?Q?if/EljDmXFLV4dSrkvKt+jRYevehNkYx1R7pLY6sqnGtT6HmDVKkbQDxyqQb?=
 =?us-ascii?Q?Zkyaz9kmM0Kb4gc0EMjR4d2yCBNUnrSseiYhmn5CFiLZAPIcGuaWXLOBuTx9?=
 =?us-ascii?Q?ABzm6JtRNeqOFLdZyebvU8XPUnYaEy7vvWfSyKgREVH/0s+B5Imtc2HuW0qZ?=
 =?us-ascii?Q?IbjygYB2yorwbRvnbE7J8AF7J1x8TJ2DpZf9Jn/olIxpdxrYpyC33Hh2pbK9?=
 =?us-ascii?Q?yYYXGfqZ4JJTlKi5IIyDX15EEel9GDdYFdr3d/+K3Z8p+WNwsRZIrWudcoK+?=
 =?us-ascii?Q?HvCT4/iWSTKVTsvr+9f4E+0zVW7s46tLqARQCeaey9O59xahD3Vgm40ZRDiZ?=
 =?us-ascii?Q?HQ5vuQbNHmirW8zmdfopA0dhNUnMaFh0vtdktOT7yMKuymnW2COTLvqqGJrI?=
 =?us-ascii?Q?5YuXOL7aCWDzVoCkFIOZ14ZwN+seb8ek4JeBp5sIZWt3hJReTcKZuw1IQqWr?=
 =?us-ascii?Q?Kr14GDac49O1xFoz54OC0jHx2WRm3gT3hTrL9tjgu1sP8NCL2PqrIiQ326aB?=
 =?us-ascii?Q?VHftgYXbHci3mFivcwItZlQL/bkjYkkntbJ1kA5X/3Z9IJ8i0Xftum2h5X/w?=
 =?us-ascii?Q?oLp2BJT98TT56XBkVUldkFq9pOzQKI/LHqrjn7e6GZF4S2ixfJuc0tY4FfPa?=
 =?us-ascii?Q?MnaSSUsnhDxvlHfWDY4wbV+YS+C2F3Dq?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB7901.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(52116014)(38350700014)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?EPgtxg+aaMV9z9ScLzIy0DGcgzjx6PamoHchtUIKNd2P6u09BTMuDSM6znwW?=
 =?us-ascii?Q?vY48FVLX+WzSYQ9NZD1tU4sjRqJxXntV6jCmyp95xc8EB6Mhhrn4k/VslMqP?=
 =?us-ascii?Q?dMrswrO6rhcxK9pwU991jenrc+2rpyruscxo3BKQiofMUZXXzKeJLnfKGndv?=
 =?us-ascii?Q?MR2hAlVVHBKop3kQ8Bw4GSRAHdfFuLLa2g+D4rUpOeSs0iJYGSCzGdLl7VxI?=
 =?us-ascii?Q?QHxC/TkXGIiwIo7WcEEvVUD78UjoUiVLvDs91skZoAzGIYtgNIxBypZSQyxf?=
 =?us-ascii?Q?kkedo0lQ0fV8SwL00CvST+QUOh9vSBdw9SkeuE/J6TfiUVAgmhd2t8Ezto2Y?=
 =?us-ascii?Q?dzIlQa77et25NAsVmgJKBTP8P9TlN3VTeGfENyK4vaILaqy5LcL5HZumQ9kY?=
 =?us-ascii?Q?XGzq0MvDKi9exE82+xXIOQjC9S4EcJsLTpFhlCV/Ikd5ngyk8Tnel+TrKdSz?=
 =?us-ascii?Q?9wgBuaAwb2j08HrtN/HiK6Xy7a0Tj6XR4iIuCO6kerBDKiKWj31iHq++MnHD?=
 =?us-ascii?Q?uledB5oG77uepfVBgkiBy6vPtmRzC2IVmjhYNFGdg2akTL/oiiMxwOVQfawC?=
 =?us-ascii?Q?+VH61VrJMjiNmrrx3RfbkbHJXONJkxDL+fz0tHbRd+y4hQIo+up0lBGg2GmV?=
 =?us-ascii?Q?IvRymUjRqOQQV5xFxIIIjOZYR7N55oqdnTqTyeW01Pc11Hu9fEunxqJlDHOE?=
 =?us-ascii?Q?kzPdzYREY5jjrMyebQqa4JARHXfie7Kxa5ktBnXbEvq2r0bTLYp0dslAIC76?=
 =?us-ascii?Q?02kRtzhNEdh48cuRglK5zFxsxxhdWpdpxd3JyNJmgRNYZzrd/xl/xQN9wfjc?=
 =?us-ascii?Q?+c7bWwS7Hk2ckZPLZQWw61lHiTkiLp7rGFk191f97SoRg7NHCo9o92a/svi5?=
 =?us-ascii?Q?Jj6XoA2WFTbqn4cMWXBABsLBlPz86ISzXw+eb0Et1TcF5n0y3DmMQaVd0n3U?=
 =?us-ascii?Q?Xbo9BJ3MZgIu9D7qs0VwpwsSXP+LJgQzzdGbjK2+f8HBPzoV0PBH554uCtcZ?=
 =?us-ascii?Q?84Qut8lvJu1rSUPRacy4VwQ/+Jo7hoUtOUlgbMcVAXBDcvLbO9UkfPiUPNYc?=
 =?us-ascii?Q?R6NOOCzz08ocnDMaq+OP3Gh4QAALTUV84VhdBEUxIyOC7MS93pANl0rzYdUT?=
 =?us-ascii?Q?AvKK4tFYsTNnwJVjIizWY132Nhhbula47+JIze3CAaoN+qkIfA/w9WQBl0Pf?=
 =?us-ascii?Q?8fiSOKNMSVTWIeDF8kT2dhTZ80WvLGQB07i00reazZ7uDDwYF/hqN8nDzxxN?=
 =?us-ascii?Q?LdycttD5WjlfyjwFaWxQotuiqD4YWmmqr5fNCQphcFRGwPWjXmZZhJcG5cGK?=
 =?us-ascii?Q?63v6c03QHk1HdpnIp2Trjmu6oDQDoomX7os51KY4Y5acVUU0xXWzQfK4mazZ?=
 =?us-ascii?Q?iIoHpRTYSyuDLAFa5byaq9Aeo0FBwlhx9aBhgAUHy2/uwkUFQPRQDn1hxAlw?=
 =?us-ascii?Q?vMkXmUTUYd0xgMeiOoq207bNlxNI+FXF8IOi6BXjBlYNGzIlTtsMU42cj0KQ?=
 =?us-ascii?Q?g5UhaYJbOOp+saY+oIAnYC0jw+iGNS+9sI1kFj5e+BLrC4Ok77v++5SwTr5i?=
 =?us-ascii?Q?U0tGPmaSfOAEiBWb1jZCJ2475Lj4W+KqjLQI5QKn1MFR/v+LwQmWouCZkRIR?=
 =?us-ascii?Q?Tw=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 709fe438-0c9f-4f3e-9262-08ddad870da9
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7901.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jun 2025 10:09:31.9264
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ktpyr2z+n7vv6jBoanvMMU7GW/4V1gQ4HbuRSbsGSGWZ6fWya9EH9AiNvHumDjX6xasU0K3XsUZXSGrj290ncMYSOB4VTN9vSIAoOzilP0E=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB4880
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjE3MDA4MiBTYWx0ZWRfX6YCDrPgH8Tui 5VmsbvisVX/jpXQZw9218ogS/DD0j1bjB/zcZgrDc5wtoLDhi1RIRq0GPyW70wN6WlT/Dbn/x+g ABcXgVS6Hr/UIOJ2OIT70DuJq8X2R0XIWzbwvdboWWzpJBh4Lmm6tBEFknCrWpagK4v0ZRtq4dk
 kFj3E+fPCrR3PAvBgqTPSwzvBA5aL88aw2sQu8wXh9RvYuenwYrqvhC2httK5+hk26hVkDSSlTP 1Gbc0BGYQpyoSarn8gmFyvKrQ4/Yt+nrcfXjYyfdmSOGQuoviGrzwxgPGq9UQhopZXJlamtL+3G qpqtr5RQmbksWs+z16AEKOGWfzLZdA52eUBWx1yrs39XGabWU3ShvtLthU5ihygV/2KdsluAjYG
 DMTaovRuL4T5sPktXX0S4voYZDV++cL/h7QTvdVAY6cdV3QHv71dLNyZmBwcMk9TyMgMGrHs
X-Proofpoint-GUID: vLXvef3h4yjA1sVjivBHUTE4pnOLjhbn
X-Authority-Analysis: v=2.4 cv=ar2yCTZV c=1 sm=1 tr=0 ts=68513ede cx=c_pps a=9MCiTn2FFLWeZXu3Q3AfBg==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19
 a=xqWC_Br6kY4A:10 a=6IFa9wvqVegA:10 a=CCpqsmhAAAAA:8 a=t7CeM3EgAAAA:8 a=OTrzE_FXVTYtTbWwAisA:9 a=ul9cdbp4aOFLsgKbc677:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: nmFHpwkgwfYDA5fJXP8nxLskCnfDVdk7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-17_04,2025-06-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 phishscore=0
 mlxscore=0 lowpriorityscore=0 suspectscore=0 priorityscore=1501
 malwarescore=0 mlxlogscore=999 impostorscore=0 clxscore=1015 bulkscore=0
 adultscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.21.0-2505280000
 definitions=main-2506170082
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 17 Jun 2025 10:09:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/218872

From: Sunil Dora <sunilkumar.dora@windriver.com>

The following commits have been cherry-picked from Glibc master branch:
Bug : https://sourceware.org/bugzilla/show_bug.cgi?id=25847

Upstream-Status: Backport
[https://sourceware.org/git/?p=glibc.git;a=commit;h=b42cc6af11062c260c7dfa91f1c89891366fed3e]

Signed-off-by: Sunil Dora <sunilkumar.dora@windriver.com>
---
 .../glibc/glibc/0026-PR25847-3.patch          | 77 +++++++++++++++++++
 meta/recipes-core/glibc/glibc_2.35.bb         |  1 +
 2 files changed, 78 insertions(+)
 create mode 100644 meta/recipes-core/glibc/glibc/0026-PR25847-3.patch

diff --git a/meta/recipes-core/glibc/glibc/0026-PR25847-3.patch b/meta/recipes-core/glibc/glibc/0026-PR25847-3.patch
new file mode 100644
index 0000000000..4cfcca846c
--- /dev/null
+++ b/meta/recipes-core/glibc/glibc/0026-PR25847-3.patch
@@ -0,0 +1,77 @@
+From 28a5082045429fdc5a4744d45fdc5b5202528eaa Mon Sep 17 00:00:00 2001
+From: Malte Skarupke <malteskarupke@fastmail.fm>
+Date: Mon, 16 Jun 2025 23:29:49 -0700
+Subject: [PATCH] nptl: Remove unnecessary catch-all-wake in condvar group
+ switch
+
+This wake is unnecessary. We only switch groups after every sleeper in a group
+has been woken. Sure, they may take a while to actually wake up and may still
+hold a reference, but waking them a second time doesn't speed that up. Instead
+this just makes the code more complicated and may hide problems.
+
+In particular this safety wake wouldn't even have helped with the bug that was
+fixed by Barrus' patch: The bug there was that pthread_cond_signal would not
+switch g1 when it should, so we wouldn't even have entered this code path.
+
+The following commits have been cherry-picked from Glibc master branch:
+Bug : https://sourceware.org/bugzilla/show_bug.cgi?id=25847
+
+Upstream-Status: Backport
+[https://sourceware.org/git/?p=glibc.git;a=commit;h=b42cc6af11062c260c7dfa91f1c89891366fed3e]
+
+Signed-off-by: Sunil Dora <sunilkumar.dora@windriver.com>
+---
+ nptl/pthread_cond_common.c | 30 +-----------------------------
+ 1 file changed, 1 insertion(+), 29 deletions(-)
+
+diff --git a/nptl/pthread_cond_common.c b/nptl/pthread_cond_common.c
+index 306a207dd6..f976a533a1 100644
+--- a/nptl/pthread_cond_common.c
++++ b/nptl/pthread_cond_common.c
+@@ -221,13 +221,7 @@ __condvar_quiesce_and_switch_g1 (pthread_cond_t *cond, uint64_t wseq,
+      * New waiters arriving concurrently with the group switching will all go
+        into G2 until we atomically make the switch.  Waiters existing in G2
+        are not affected.
+-     * Waiters in G1 have already received a signal and been woken. If they
+-       haven't woken yet, they will be closed out immediately by the advancing
+-       of __g_signals to the next "lowseq" (low 31 bits of the new g1_start),
+-       which will prevent waiters from blocking using a futex on
+-       __g_signals since it provides enough signals for all possible
+-       remaining waiters.  As a result, they can each consume a signal
+-       and they will eventually remove their group reference.  */
++     * Waiters in G1 have already received a signal and been woken.  */
+ 
+   /* Update __g1_start, which finishes closing this group.  The value we add
+      will never be negative because old_orig_size can only be zero when we
+@@ -240,28 +234,6 @@ __condvar_quiesce_and_switch_g1 (pthread_cond_t *cond, uint64_t wseq,
+ 
+   unsigned int lowseq = ((old_g1_start + old_orig_size) << 1) & ~1U;
+ 
+-  /* If any waiters still hold group references (and thus could be blocked),
+-     then wake them all up now and prevent any running ones from blocking.
+-     This is effectively a catch-all for any possible current or future
+-     bugs that can allow the group size to reach 0 before all G1 waiters
+-     have been awakened or at least given signals to consume, or any
+-     other case that can leave blocked (or about to block) older waiters..  */
+-  if ((atomic_fetch_or_release (cond->__data.__g_refs + g1, 0) >> 1) > 0)
+-   {
+-    /* First advance signals to the end of the group (i.e. enough signals
+-       for the entire G1 group) to ensure that waiters which have not
+-       yet blocked in the futex will not block.
+-       Note that in the vast majority of cases, this should never
+-       actually be necessary, since __g_signals will have enough
+-       signals for the remaining g_refs waiters.  As an optimization,
+-       we could check this first before proceeding, although that
+-       could still leave the potential for futex lost wakeup bugs
+-       if the signal count was non-zero but the futex wakeup
+-       was somehow lost.  */
+-    atomic_store_release (cond->__data.__g_signals + g1, lowseq);
+-
+-    futex_wake (cond->__data.__g_signals + g1, INT_MAX, private);
+-   }
+   /* At this point, the old G1 is now a valid new G2 (but not in use yet).
+      No old waiter can neither grab a signal nor acquire a reference without
+      noticing that __g1_start is larger.
+-- 
+2.49.0
+
diff --git a/meta/recipes-core/glibc/glibc_2.35.bb b/meta/recipes-core/glibc/glibc_2.35.bb
index b7a9a2e0e3..d9073b6d64 100644
--- a/meta/recipes-core/glibc/glibc_2.35.bb
+++ b/meta/recipes-core/glibc/glibc_2.35.bb
@@ -63,6 +63,7 @@ SRC_URI =  "${GLIBC_GIT_URI};branch=${SRCBRANCH};name=glibc \
            file://0024-fix-create-thread-failed-in-unprivileged-process-BZ-.patch \
            file://0026-PR25847-1.patch \
            file://0026-PR25847-2.patch \
+           file://0026-PR25847-3.patch \
            \
            file://0001-Revert-Linux-Implement-a-useful-version-of-_startup_.patch \
            file://0002-get_nscd_addresses-Fix-subscript-typos-BZ-29605.patch \
-- 
2.49.0


