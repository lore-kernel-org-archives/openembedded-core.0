Return-Path: <Harish.Sadineni@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 421E1EE6450
	for <webhook@archiver.kernel.org>; Thu, 12 Sep 2024 05:47:10 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.40574.1726120020446421276
 for <openembedded-core@lists.openembedded.org>;
 Wed, 11 Sep 2024 22:47:00 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=9985bb68a1=harish.sadineni@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 48C4Negf003370
	for <openembedded-core@lists.openembedded.org>; Wed, 11 Sep 2024 22:47:00 -0700
Received: from nam02-dm3-obe.outbound.protection.outlook.com (mail-dm3nam02lp2045.outbound.protection.outlook.com [104.47.56.45])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 41gj44dfq5-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 11 Sep 2024 22:46:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bHGIohIsxQf8gUVeTcgq6pRGeJI147EaQaz5PFooe3JE37RNCtPkUeUtbWMt4eXuUZVHmZ/IbEcb9FSW3L4abGAnfEAp0E/oGE/k2Lr2TbUHku1gB8qDG+37Kid9k7OotVemdYtKqcMPIHzJ3po1pav8ptsOpyW8GKcWPyhycFhBWv7EDn23NTK+EPCrd6TYGGYy5btfux/EqCxZ1+ITQfh9dYc/xb5EKG5Jv7PqwKep/5cD6EjmWJOcopq9mTwjAEusyYHfKSTIr4pCykYCGgc3UaNLRn9gyK61yP0oF6JRybd4Y44EQRcWGipkBmeLlWo9o3V1Ae72OcZUCc7g5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/q8wRZVaRT5rRFumdQ85Irq6xiMqxApCw19g74dW/U4=;
 b=OujLpjnUYYwx529XOL2u6j9ZuSc/BRbmVWOxJAW+wSL5ZFnSLzK9wx+l94SZ5DMhmPb2uEezBhomLGizSLCSuvHm+4CL5l2ACrDvGvKwfPaLi5oyVjCa2leXrNK8JslaxLNHedcgV9RJcwhVb3ii+pMXJ2VT9XjoMKzxwmLD2RVIk7yKMEeXpF8n3jZ1MtGyGUObAh33c9X7JBbCYUtWvghJYJJ1kF5FC4G0WfWOxV/1U4+B4KERSxeZNAv99gVvV8N8qN+JDKVhYz77uP5ofM4IfMn4sfuiUcSG50EfeSIUtbETjfYb9Uo1vt3PntVECtbvpborATDKlUzRQVSoRQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from PH0PR11MB5658.namprd11.prod.outlook.com (2603:10b6:510:e2::23)
 by DS0PR11MB8687.namprd11.prod.outlook.com (2603:10b6:8:1be::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7875.21; Thu, 12 Sep
 2024 05:46:58 +0000
Received: from PH0PR11MB5658.namprd11.prod.outlook.com
 ([fe80::f440:269f:9645:29c0]) by PH0PR11MB5658.namprd11.prod.outlook.com
 ([fe80::f440:269f:9645:29c0%6]) with mapi id 15.20.7939.022; Thu, 12 Sep 2024
 05:46:57 +0000
From: Harish.Sadineni@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: Randy.MacLeod@windriver.com, Naveen.Gowda@windriver.com,
        Sundeep.Kokkonda@windriver.com
Subject: [PATCH v3 2/3] binutils-cross-canadian: add gprofng package as runtime dependency
Date: Wed, 11 Sep 2024 22:46:27 -0700
Message-ID: <20240912054628.1539323-2-Harish.Sadineni@windriver.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240912054628.1539323-1-Harish.Sadineni@windriver.com>
References: <20240912054628.1539323-1-Harish.Sadineni@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0P220CA0014.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:a03:41b::22) To PH0PR11MB5658.namprd11.prod.outlook.com
 (2603:10b6:510:e2::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR11MB5658:EE_|DS0PR11MB8687:EE_
X-MS-Office365-Filtering-Correlation-Id: 50eb9a9b-81ef-4243-5a00-08dcd2ee5068
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|1800799024|376014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?k4oaW/5Za1VQQ3NwtYW9U+lS75TQN5eTtOczxcu124QWfhBuznutP6C7sxTg?=
 =?us-ascii?Q?P2PqPNnNDSkZQk5QFveWG3LKU4CIb3tiHOUKNvdFQh4EnyrVVU2J39R5G0ak?=
 =?us-ascii?Q?+fVXa90ziKN79KrTWdFjSJLZrWMYzkDB60eF8ypGFX9mLhY00D0Kw+525rlH?=
 =?us-ascii?Q?WT7E0i1LkKkNZYvdXpgrGM1p35lE1SMNhYmLI6WD1XUhbZB3qebrVRbaO6XZ?=
 =?us-ascii?Q?2sdZbk68sw+GfS+pkvIMuVhjxeoxfRrWvslOscxpSDK6xxDBDqU7D/2fGPAi?=
 =?us-ascii?Q?spYHe4CvWHlmHPPCpcWbe15w/DsnC3sPhBuVPlhs18xIeoC5xvKTUK0msJvE?=
 =?us-ascii?Q?kmc0A/tQpuSDv2K4NUqaIrD+wlRMu5AwGUfmxhHjtMKV5WMtnTnKZxtFZjGA?=
 =?us-ascii?Q?WMsTEJ56RKbiZZ18tSlnIhLH1P7aOYTlwLoygbc+DMNXqk4z+FGrCbITi44L?=
 =?us-ascii?Q?RLsIEEmyoAcEaX00MTYY951ls4wuQOwKnBiV5I0dc+OzNypVNkmcqmtt5Mxn?=
 =?us-ascii?Q?LLWTPOjl+vnwtF3VQwB+e+cmglLONgHgTw2loqvddbcJFPNB7u6uLIG/haW/?=
 =?us-ascii?Q?aw/LpqVjQ1yRPDgJkMQ6LL/dyEsMsmMubfabmoGG5BRNo1AfY/TZKkwz6pgk?=
 =?us-ascii?Q?RKFW5Os0J/rDJRRcGl4hzUkpjYhZRwv9MLsme+Sgb0Ix0rq/cDfI3dBJ/ls9?=
 =?us-ascii?Q?44KpeFd9NGmHNcfXLs6JvyXhnryZrqCsdBEhl0FRO+T7rg+It/RSBFOvR02+?=
 =?us-ascii?Q?MWwmgpyebyafxS+glHl17YF39TYSxEXw5MB7oZvZsop+G8fWHx1dXWqdROdY?=
 =?us-ascii?Q?/a7juphtjx4OkJUUSsFFY46ZrbWq7Bjh51jjxLEBqKfvtHYdEecvyO9XiNrh?=
 =?us-ascii?Q?QgrbC/f4V0NsJDBZwveTQJAhxtpoimR75WXLAkKO3M0Fo/hNpZWdLaIr5rUB?=
 =?us-ascii?Q?hN0jMeoovCyqgVypcX95Ny83gwPQfV4HQk/JBSITtpU4fGkdwJ5w6RI+4tXa?=
 =?us-ascii?Q?IPDmAKuxBhfIB1b2B+9ICFk5D/NGENxsJVU7UTAS5U7t16WWtdskmlP8tvDZ?=
 =?us-ascii?Q?T9XsFnocu4ys5Zocanowtela3McMaAafNbDIlGQzZrN856h3sS7G5IgUgent?=
 =?us-ascii?Q?GiUpGD+R5hhsOX81dqdHnG/Yi0TMOkEoeaqhezT4wYivj+qN29UgVXZjwZsS?=
 =?us-ascii?Q?uCa8OpHYOXcIsmcFwwuAoRG+1jzB0x4O4bzAE2K1npNSXqtcKpLKzEbIFb+5?=
 =?us-ascii?Q?11jHJfo+nyN9Q5/V6PBh3EhdAM5qfNoZ8CYApv+Tfi400bJuQCl6IQst+8XZ?=
 =?us-ascii?Q?XTKSp2lI6V4V1EcAsD9IjzRCW2MLzgoybTNhHeiOGBcrLepnWXx79nmEyled?=
 =?us-ascii?Q?pKBsyBxpjagAgL5xFwsoGKRu0Ujemz+eaHNV3azC67Ab83WJTg=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR11MB5658.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?/P6S/kXt5tIQobUB0UwaHB1ylFF6n0iOeDb/XUNv7CXfrlN3/2Qf0UHFSZ6Z?=
 =?us-ascii?Q?RePaeTXEfadjLT5vEecThG29N9IRHA7sHHXGfCnh6o3eZzPbAWwdQaMILql6?=
 =?us-ascii?Q?6P0fPxHb/UM9ZUydIl8oLcuOanRrFchdblkk7h0PVdTfp+qHvzuDLg47++k/?=
 =?us-ascii?Q?3wJSDMO7LVtVIUQecmzQFD+2fbHnHu83nGEy6GKlalobO8UvcZzRufkRx/dh?=
 =?us-ascii?Q?VTwJzcO4NXLyHFO5TwMTNUQ7g/NBkt/ES+kkxC4ekWER1ugUYXXOsJ9brIhS?=
 =?us-ascii?Q?VDxKc7N/qqBXXyrQPY+DZYStrh7IajZedUnOzHZGnf20kbtoj8SlK2AWCX+W?=
 =?us-ascii?Q?5b37cjLLsx5Ut0lig3g0BxDZ3V96SmivAbe1NPgBiHU2w1+BoXm4nzg4/fV5?=
 =?us-ascii?Q?EF+HR2VmEcO2GsUJzCXUcDiXTsVyPCBSIVaphBa9LT84hH7EeoMUBzfaRpUl?=
 =?us-ascii?Q?imQSO8qnpugyxr2AyCNg1N+ciSlOMLGKrW9ky9m+v1xOsx+sRWnp7FvqGBWZ?=
 =?us-ascii?Q?Ynh08/0Fh29twMEOwG+A/ki54nI5EEifcRiwmMnDKZ0Z5WHOMBd9oA+tWTFB?=
 =?us-ascii?Q?H//aYqtVonS7pzqzcRmKUktwYZnBHyJ9Md/2Y6mBEf4z5OLzvvk95dC2HGk+?=
 =?us-ascii?Q?VhOMn7rF0Dwav+prG5lR2kxrjwAY0A3/euEFQBz5kHsIeBNIHu7RQzEViRyf?=
 =?us-ascii?Q?zN8ldY0WzGy0zcoGKytpNcoO9CXY95N7LqN3Qyf3RhVyVZaeeQBXr+OfaBLA?=
 =?us-ascii?Q?B/1Ktn0PnxbXUx1yIkpvtoDTAc67+D/JswV95Jnm1WC1TK0f9wCww+nAOcWp?=
 =?us-ascii?Q?RptzRsvFaQ8MuoliUbAVMcGqVngRjDhbx1jjMq2pYmJ2DgzfRntd3k5kJSP7?=
 =?us-ascii?Q?qzpUfmf75g2KN8C4DpWgXv/ejVHrMjT++1vzSE5aUV2uu43l6EQaplalXWck?=
 =?us-ascii?Q?v6OMLWuffhP2+aL6nsWsB/wn55MNKgEaTFZfFfEwgsm9B5wLewY+aTpHjYb9?=
 =?us-ascii?Q?f1MBb0cKnf8c3i+ZHkGDS6NiHMDxY+oubOUwmXj9DdCQlwUXMD0kUDn5p1Ar?=
 =?us-ascii?Q?g1+H5C0XEqyUNk3OthwhVoui9dzev55FVSv3+ooCEo3xQty2S5W4Kfm7oCGV?=
 =?us-ascii?Q?lR2V1tI30REWROOKVZkBErsKgGXsqjqFYQnBD9JP253OMEZODfU+lzhbILD0?=
 =?us-ascii?Q?7dlbZVYnqEeFHfKoiIBs7juudFeJiMqics/vkzztVIlmXhWK9xT/1nJruu7z?=
 =?us-ascii?Q?5c+tKKFpfFVsiNuTaHaosX/2/qPvlTwCBYnF2ij6ZvjUix8mvSUq304W0IIM?=
 =?us-ascii?Q?ILjpCGpZzSoksHOTt7Yrp9Xm13aK3nMixWr5eJrUf9lMNNHvuPQfCbPeEUCl?=
 =?us-ascii?Q?83kGX7TKmvKkafdMzjtHtLLNGpLaW4R1w5Ohion9mBTcXBygMqTt9VihWU9c?=
 =?us-ascii?Q?uisZfCYEoGgpK83EcaJTnHpRtavAhk09e9JS0KLThYaREotU1aQW0EK+iVCH?=
 =?us-ascii?Q?5mSvhN2xt8oax2XQSgXEJevSG7rXm0ay4mwpJI1qtePFIlPOpxDcTQSizAFf?=
 =?us-ascii?Q?qIU8dP9FugDAHmWobE9TJlpXLB5np9t4S+ybZQIUoorUzTuvv0BGkfSFE1GJ?=
 =?us-ascii?Q?bw=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 50eb9a9b-81ef-4243-5a00-08dcd2ee5068
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5658.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Sep 2024 05:46:57.4291
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7b6p+r8SZv18rpxFcK9I13u/OjfHiYKhXzVs+NbLakoplmXoYY9oyx35NztCYDjAD1HwT1uxSRyZeotzI4fTurg9MJ5g5YfE0Wp+ufzdLLA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB8687
X-Proofpoint-GUID: b9APxRUe-jNH5OBq4dgHB3Xm30vEYttk
X-Authority-Analysis: v=2.4 cv=DZxFqetW c=1 sm=1 tr=0 ts=66e28054 cx=c_pps a=fpyyTn7Kx2iM0+fj1eipXw==:117 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=EaEq8P2WXUwA:10 a=bRTqI5nwn0kA:10 a=t7CeM3EgAAAA:8 a=zfpZWKuSmmXx9e4e2KEA:9
 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: b9APxRUe-jNH5OBq4dgHB3Xm30vEYttk
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-11_02,2024-09-09_02,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0
 mlxlogscore=988 lowpriorityscore=0 mlxscore=0 spamscore=0
 priorityscore=1501 impostorscore=0 adultscore=0 clxscore=1015 phishscore=0
 bulkscore=0 malwarescore=0 classifier=spam authscore=0 adjust=0 reason=mlx
 scancount=1 engine=8.21.0-2408220000 definitions=main-2409120041
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 12 Sep 2024 05:47:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/204421

From: Harish Sadineni <Harish.Sadineni@windriver.com>

In SDK, while running "x86_64-poky-linux-gp-collect-app ./exe" fails
to create 'test.1.er' due to missing gprofng configure file in sysconfdir
and aborting with below error while generating the profiling data.
 - configuration error: can not find libgp-collector.so. run aborted

Signed-off-by: Harish Sadineni <Harish.Sadineni@windriver.com>
---
 meta/recipes-devtools/binutils/binutils-cross-canadian.inc | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-devtools/binutils/binutils-cross-canadian.inc b/meta/recipes-devtools/binutils/binutils-cross-canadian.inc
index 62ebb3f5bc..7f2699089e 100644
--- a/meta/recipes-devtools/binutils/binutils-cross-canadian.inc
+++ b/meta/recipes-devtools/binutils/binutils-cross-canadian.inc
@@ -30,3 +30,4 @@ do_install () {
 }
 
 BBCLASSEXTEND = ""
+RDEPENDS:${PN} = "nativesdk-gprofng"
-- 
2.43.0


