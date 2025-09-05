Return-Path: <yi.zhao@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 61A06CA0FED
	for <webhook@archiver.kernel.org>; Fri,  5 Sep 2025 06:14:54 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.14919.1757052888278517515
 for <openembedded-core@lists.openembedded.org>;
 Thu, 04 Sep 2025 23:14:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=pcWIFtii;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=134374454b=yi.zhao@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5854TLcJ210278
	for <openembedded-core@lists.openembedded.org>; Fri, 5 Sep 2025 06:14:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=PPS06212021;
	 bh=C4fp3YjfBY5OeS+13klrpjc9RlRe/S0MxkvLQVAxDTA=; b=pcWIFtiiO6U8
	sL8hFOtpni5zketDM/w9okyoQ9dahQP8g0gaqOz3FoAznZcIeCO5eiAfNTfO43wu
	XQkM+PxPfMpMekvFHP+yh4FN8QWh+dPx24/CcPGTDV4ZlvJgB/7ZvcEj0wzHA20k
	G7JqMItZ6iyVGdoOrszi1mWS+M07ctTMsltM/YPlOref4WGC43R3aKKoJQGBvx1a
	0catOF1PoCKUD1sS9NtOCM7uwTw1xyHCpnn5i4FQRHuNr0lSVxUIhXTnJRYL4Mlu
	px4QZykXj8wl0F7HnIZquFc11e+A65ecu1iv4dLXED6Tbf1TpZhk+7OMaSAu75Jj
	2N5IR2TETA==
Received: from nam11-co1-obe.outbound.protection.outlook.com (mail-co1nam11on2046.outbound.protection.outlook.com [40.107.220.46])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 48y7p7hddm-2
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Fri, 05 Sep 2025 06:14:46 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Miv23GHGaDcI1/82xhfE4vrFUZj2aMrIYym2WDGohJHEjo7EvMgM6re5BsuNaGlO7sskZw0Lui0+SG3d6InMoKcOMvlWRd7z9xC2waXMWRxXT1SPHTaJ2QwDMnYR5r/T/IJ6CizzBEauCJPgq3UXuaEKxK67Eydt8rHEQM1MtOPdAN/CrfADp5z4aMzIIBr2F2OjnFwEqaRDYr+Uc5U30s+YdvBAfJ22WmxmDUzahUEhniATOAM1vQMJWWpTtEJvvus7H1oTRbIFEltX4OgfVv1uoeZYcYxzHHPjvagwtIWSRa+VfTGezPIAMHbIAkbd8ghb4Kdu5QCPRYzjFdAYlw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=C4fp3YjfBY5OeS+13klrpjc9RlRe/S0MxkvLQVAxDTA=;
 b=OhWw1vrnPizPP9DNyXeNZGXWndTiV6N37JSZd7WunbVgFziMLH6szPK1aqLVtvNwVoL/tzXcxGQvhHBYfnfOZb2CTThHKDT82hiMMloxT+6hRNiGQZRezVn5YXQ1l3lTesOWo07uREHSNN/H6diGa8BQVz5uiVl3snXcJrLqGd2ji5J0fESRF25v5aSqU+6Y8I+JAORe+RKUgabJFCDtoLZ1jM6bXwxrhI32KEFSE4TEPOyOUHnc+c9q6CINDxKSlJXClfiYFWjsZaJhr3PKGliNDp5xSlr786ESCjEvpCA+idRyvg3Lq0cVHcLWu3T2RoWVjARLbYzPV0kwAgzPNQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS0PR11MB6399.namprd11.prod.outlook.com (2603:10b6:8:c8::5) by
 SJ2PR11MB8371.namprd11.prod.outlook.com (2603:10b6:a03:543::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.19; Fri, 5 Sep
 2025 06:14:44 +0000
Received: from DS0PR11MB6399.namprd11.prod.outlook.com
 ([fe80::2b44:787c:e7ee:bfad]) by DS0PR11MB6399.namprd11.prod.outlook.com
 ([fe80::2b44:787c:e7ee:bfad%4]) with mapi id 15.20.9094.017; Fri, 5 Sep 2025
 06:14:44 +0000
From: Yi Zhao <yi.zhao@windriver.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/2] libsdl2: upgrade 2.32.8 -> 2.32.10
Date: Fri,  5 Sep 2025 14:14:22 +0800
Message-Id: <20250905061422.495303-2-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250905061422.495303-1-yi.zhao@windriver.com>
References: <20250905061422.495303-1-yi.zhao@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR02CA0087.apcprd02.prod.outlook.com
 (2603:1096:4:90::27) To DS0PR11MB6399.namprd11.prod.outlook.com
 (2603:10b6:8:c8::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB6399:EE_|SJ2PR11MB8371:EE_
X-MS-Office365-Filtering-Correlation-Id: 279ccab7-b970-4386-6226-08ddec4381c8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|366016|52116014|376014|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?3ipT5D6AP4XC+GlXf9XscAKKhZzfVJFDttzDX0K+WqbMD8SaPz+MU9qit2Jw?=
 =?us-ascii?Q?fHvwhLReSXUEAby50v95iL91IboEj+8yKUFpoYYiZMUicEXZy1Y+iL9KF6mC?=
 =?us-ascii?Q?ZlnZZECKDuriQeG2eMz1Tdd89v7Yy8vXod8Ik4T4NIHo+9cpITE0bSIcbRUq?=
 =?us-ascii?Q?yKJRcJWbuWVzTBaq4S5pgyHA0aoeWZwomUVSNs/udZlNspC54DAg/o/l7Twe?=
 =?us-ascii?Q?feaVeApr9OY479DxTbkFHbtZ9naa7g6S8HXbfoSdkzcrScLFjYQiYmFWC6l4?=
 =?us-ascii?Q?Vs1nPvhj79AvxCbEiSVYUosQIF1MXQKabz8+93f9OPcQE7aIBNaPyd6sZL+c?=
 =?us-ascii?Q?du+cirI1+8Y3vudiGNRk3XlE+f/75gnCGISw+yuB3LsIL/X6WHOOfoscAO7F?=
 =?us-ascii?Q?EWUVMtGDXGjM+wEV5utSc+Ertc2zVZE9NZ2QZsED9PvIYAZha+Xl8UcoaIRS?=
 =?us-ascii?Q?DTN2TolOfiiTSWPoTisAxuhTaaS7+Fad0KM8WyQV6/uQdU3GmOx/8uVcPbA+?=
 =?us-ascii?Q?zbf/yZlMlwdsxJP3117jvaEzSiB6DPVaHc687rL7L+p5KY05zUKZQej+Ki/0?=
 =?us-ascii?Q?8BUYAHa7LDv8LCudG4PJt0iboprGUEBxS4P024lJXdJRGfWZQv5yTAtOBMMR?=
 =?us-ascii?Q?tAJnDfDE6kY6OgJOd5bBb7DyFdCo5HRvsxYJbWg3UkMEv1O5rDJuIZ1I6Q9W?=
 =?us-ascii?Q?ll+MeEN5dmkf8T4ax9c6fhtXrd+Q7vxI1rLhd3QYCW1Oj6cQyezBbubwY/5R?=
 =?us-ascii?Q?sljV6UQiQvFCLm/I8Ugo2o51oIVtJIP2n7wVJ8QTsmgkdtnMO2YiEFhpxCTN?=
 =?us-ascii?Q?bOTQB+PURTcq/J8AqSMgGwt257P1crhk1uaaNZbbR37u4+cSzqByOCgtOP1Y?=
 =?us-ascii?Q?9unARNxlc5CwN4GOIQzOXbzFkq7zIGO+J4plQzbpsvabHC/hEH+fTZLOhIGn?=
 =?us-ascii?Q?ZucCwUvVVberVM4pLgZ9qzchP8BGrMarn4pzGBdJWS/5/5wx7nqwvZcGiGD1?=
 =?us-ascii?Q?z5osPWgoAnqZuWgddqJrTxN9eg9fQKWnR+F/coNsojE1wqQiXGd4T7NhKe3h?=
 =?us-ascii?Q?uKqmucsMBM6+sdZakUHypOER+OorpAK2xL1fKymJmoP4VEEpJpgkmZa4OcC4?=
 =?us-ascii?Q?Ho/XDCTCflqTIJI7X6HcrtOB66bJELPwC4xj+3wEL3hf10+VP+AzdQAjvWlk?=
 =?us-ascii?Q?rGL6FInnbA+9cbcph53JwLWslGv6lp2tNuE9U692veBkJritr+dszDJnC8Fn?=
 =?us-ascii?Q?JWhOyvmGtLW5sVi3CTuzTkSCbymYLiMf3OzZ1FFOyoC98vvMyQW6MsmRS/Qk?=
 =?us-ascii?Q?VcAsZqGAnSI5OOfe190tzzL23idhYr7jH9kp+ZRzMqRM6urO/c8k/cUam911?=
 =?us-ascii?Q?lCGehatNmXIMW1ZDOMrAbLe+22jU9EdvHx5NgRXiaQsdY9pMfNoR8/69DnHo?=
 =?us-ascii?Q?3EMZI2FdtCp4HiU9Tbw+OUFcMBpfkGMnmBcHO3dfhI0Q0POmljUckcC2j7d5?=
 =?us-ascii?Q?/mCpr8ZjaYXh39o=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB6399.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(52116014)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?MrkQYhPRplOXYUH30dC7sQ1rAVl4/Mc6wxlu75N/9D0blQAo/6hpmZsFnryz?=
 =?us-ascii?Q?NQz7CBCYOclwWZ06P7bArwIlAfF0gCl4sNsK5IG1hZezQj/yBqNKI5Hw1lL4?=
 =?us-ascii?Q?exgxJfKvrmCFoQ2ZYla6sk8t5KfImobuQPniqF2MbLkfCBZfUZnlSK5yFdIy?=
 =?us-ascii?Q?plw0FhqlTwkrRsxN+/rpzcE4ihz6TC2zmMUQyO+y280DEgx/Q2etgIrRIgeP?=
 =?us-ascii?Q?i48xvrSY0qEZ7A8a0RdXrSyiER14Zvd0Q1ZqJa3MpUxwENFqr54YiqFxDxIG?=
 =?us-ascii?Q?YYNDsmv4l0UAbwVd8DS2JRzBEFG/KDhw0YyZhV5c0s/iVxFL90Igt/aZYJ7r?=
 =?us-ascii?Q?c5WbBWxNR5jocXR2DOAY8EWvnFUQl45+QUHvKMRPL8Gt3HW3/Bvr13S+33Ja?=
 =?us-ascii?Q?HjAgEsHLX6qJZfdP25LMLe/bu185Wue3GeV18U1yTy5t9VqSlnIcVTeKlERG?=
 =?us-ascii?Q?q4cQUB9RfcLmnbrCC24Zbm/RyF71kL4agmNZhWj2GDQ3qDLaqI7sgL1CKuJU?=
 =?us-ascii?Q?IAisMi2FckotP7/vXfef9k7OGAOBvl/vpcLBNuTluHSkxR39fe25XGIPV28R?=
 =?us-ascii?Q?Jeu3wPLwcCXtpC+P0SGHem9fHJ0gZOLVQAzz+f5wXyYjHjZENBwzaFlnSR11?=
 =?us-ascii?Q?khWsU+CrQ+IOXpwDRj61Yy36VuUq1Ie8H0eVVtwRsJrMPZ4US9+0s42Bj5eg?=
 =?us-ascii?Q?9BHUO7XsH7LUfHmFIbD90/fKVG+xzbBzp/8JR6+ny2tws9lTrqd1dVhGLmFp?=
 =?us-ascii?Q?B2U3G+hhURyaE+ahFZfrzBq1G/4ybBYXglKiI4U2tuj7mMdnyS6+SiQJBQzB?=
 =?us-ascii?Q?LsGzEonITYGkBXhFf07RFsrHTqZxGIt/ruaUtwKLj6j6M4oVLREIyAIqn+lA?=
 =?us-ascii?Q?Bs04Ncs2g3Rrz4qEl5yy8fMeKpotMJMea9PmYgex3ok+0Cy6q5ttLV+Z7Ry/?=
 =?us-ascii?Q?Bh16W9Lv0VoZF/WRuxwE6aZT9/MrbTbx3gTZ7Vk5UVImzQAyGpu4uVyE0Wwc?=
 =?us-ascii?Q?VNN6UUmkn7/v7/z51Z9D1RNnaPajwTKyWpqDX7XcN7zi/kgZV3BgtJD38HjB?=
 =?us-ascii?Q?/BEqFwGUbUf/PvN8HQ0riL17OiHs1kzz1yuS4BOL4CDHxsJLBYwXJDIEajGH?=
 =?us-ascii?Q?iChI7WwDwKARQZxJTBSuX2WDDEEcHVqV51nxcGCv9fQOuABPcTDKvEA9tM5Q?=
 =?us-ascii?Q?gBRfCq1MHMTgXW6raYLqMwiwv7WHhdBdaat9RHgVJnaRxC3IhyAVGQ5r8N4N?=
 =?us-ascii?Q?acd5B9F0Lzp+QKJmJZRMrNb8LiwmzFPNrhgl4f/Y6amrfgEQ+kVoZGhj7F9c?=
 =?us-ascii?Q?B9ddcae6IHeQHh/CQrIUDpOcnPbJJjJUXiWEEM2MxSZ8P/pwI+RzTuYwh6pO?=
 =?us-ascii?Q?+ulS0Zm5YVbLQyUYkDfymJhDm5/YxYVBtRr9nNtTXZwve+lh/G8E3qYL/PJJ?=
 =?us-ascii?Q?pp1RwTM6MUmK4beT2sQBi5vNPdUV9yId2ek26uG9/c3XYapPxA5ymraah0sc?=
 =?us-ascii?Q?xYgBddbWlXqTMdbyEY1Ejgj3mKHJmKaiuNGWqawtQN6Y+do94iOBXRU0nQDE?=
 =?us-ascii?Q?19OVPf5v7XROIxVU7QY/juogwdZEWr396UarcIdy?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 279ccab7-b970-4386-6226-08ddec4381c8
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB6399.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Sep 2025 06:14:44.2166
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ywdIdRHbfNau+U58u+80eaK3LVKDmU9zUkUNt9nVIGlJ443hVU2tXtpBYDcziI/fzDvk/SwCt4WkEsQVfpSUsQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR11MB8371
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA1MDA1OCBTYWx0ZWRfX2tm+rTUxI8Tt
 h7QSFAz+o0NqUSnSp1XgfFtXXVZSFnVPAj80Ai5N4wm4cj2DYgnsUIcaL1k4DWqob+0sabY0Ouk
 IfT3xUHcYwzV/FbF8UqCRsaVtr7UhgTCbournQDf1hYVb60NsKzvTUGcyjBU1Hq1z/PSrwVdmTu
 YXKAVwqOiGBLHsQwkM6970odikqf/iCQlXIeKp/CDnhbxolGkaesatbCAFHP5+DCJ1/INEtKy7N
 B1TbqKXDZQnt+TwoymQOeZTvfKAQhegpE+ZPkPTvr7x6zFx2f7MpO7DyP7i8+BcgEzvqtZTGTIg
 O1osEcUuG3n/aIP24TYCBTNWRouTz6RcchcCclY43ZFITdNjZWT3i0BwZcn8eM=
X-Proofpoint-GUID: Pl25ghQlslXuWU8_sYfBGFzmKr3Y2NGC
X-Proofpoint-ORIG-GUID: Pl25ghQlslXuWU8_sYfBGFzmKr3Y2NGC
X-Authority-Analysis: v=2.4 cv=faOty1QF c=1 sm=1 tr=0 ts=68ba7fd6 cx=c_pps
 a=WhUEUVamR7lPV9LkVsdNog==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19
 a=xqWC_Br6kY4A:10 a=yJojWOMRYYMA:10 a=rApI4zH3AAAA:8 a=t7CeM3EgAAAA:8
 a=1G2EkqTZUSOtwDQplZIA:9 a=nY6XeQbCzfSyNvKqsd4y:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-05_01,2025-09-04_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 spamscore=0 adultscore=0 malwarescore=0
 impostorscore=0 phishscore=0 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2507300000 definitions=firstrun
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 05 Sep 2025 06:14:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/222975

This is a stable bugfix release, with the following changes:
  Fixed the dock occasionally showing on macOS when launching an SDL app
  Report the correct device audio format when using Pipewire
  Fixed signed 8-bit audio on Android
  Support the "ambient" value for SDL_HINT_AUDIO_CATEGORY on iOS
  Improved thumbstick range for Nintendo Switch Pro Controllers
  Fixed loading user calibration for Nintendo Switch Pro Controllers

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 .../libsdl2/{libsdl2_2.32.8.bb => libsdl2_2.32.10.bb}           | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-graphics/libsdl2/{libsdl2_2.32.8.bb => libsdl2_2.32.10.bb} (97%)

diff --git a/meta/recipes-graphics/libsdl2/libsdl2_2.32.8.bb b/meta/recipes-graphics/libsdl2/libsdl2_2.32.10.bb
similarity index 97%
rename from meta/recipes-graphics/libsdl2/libsdl2_2.32.8.bb
rename to meta/recipes-graphics/libsdl2/libsdl2_2.32.10.bb
index 98291e0f80..834cf096b9 100644
--- a/meta/recipes-graphics/libsdl2/libsdl2_2.32.8.bb
+++ b/meta/recipes-graphics/libsdl2/libsdl2_2.32.10.bb
@@ -25,7 +25,7 @@ SRC_URI = "https://www.libsdl.org/release/SDL2-${PV}.tar.gz"
 
 S = "${UNPACKDIR}/SDL2-${PV}"
 
-SRC_URI[sha256sum] = "0ca83e9c9b31e18288c7ec811108e58bac1f1bb5ec6577ad386830eac51c787e"
+SRC_URI[sha256sum] = "5f5993c530f084535c65a6879e9b26ad441169b3e25d789d83287040a9ca5165"
 
 inherit cmake lib_package binconfig-disabled pkgconfig upstream-version-is-even
 UPSTREAM_CHECK_REGEX = "SDL2-(?P<pver>\d+\.(\d*[02468])+(\.\d+)+)\.tar"
-- 
2.34.1


