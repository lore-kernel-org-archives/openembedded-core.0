Return-Path: <Qi.Chen@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7DAAFCAC582
	for <webhook@archiver.kernel.org>; Fri, 12 Sep 2025 03:33:52 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.7393.1757648022208386717
 for <openembedded-core@lists.openembedded.org>;
 Thu, 11 Sep 2025 20:33:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=F9APosfe;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=1350ab43ad=qi.chen@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 58C2Zg2N247567
	for <openembedded-core@lists.openembedded.org>; Fri, 12 Sep 2025 03:33:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=PPS06212021;
	 bh=0vioW9y85oK9RLV9csdWdxnch2GK1Lgi4zEjM+qyifo=; b=F9APosfec6Cm
	axxMTk3Sz+8KBABW0VP2jbCPoEEBsuKf2qhlq9nWBhcuyg0uAUvotcC8E8YN0mJw
	ZhCT5zWBHivlXT/THqtBwMtLPC34Nn/SAKMtkV2EqzM4E1oihOJISEZ7SfgYRWmV
	YvzgitA7rTqbXEOaxBoxKQzTHi34r3/YBdPcOujBPcrsdw95JAAxqWnTAE3lQo9m
	SW+9iN8ewoBok315Umkfvcyzs0akAH3AdOORH2/Qltkx9sZp5YCIiJdYU1Bu9MW+
	vCsZtMUX+0bDHyCAS/NzaZaufOnbn7c0wNREyaeiJgR102b2bSGMA+sJisIdpFtQ
	9q4I/cT1Lg==
Received: from nam10-bn7-obe.outbound.protection.outlook.com (mail-bn7nam10on2043.outbound.protection.outlook.com [40.107.92.43])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 491ve35ckt-4
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Fri, 12 Sep 2025 03:33:41 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=N7h4eIcjNx3PnNfzUlarghFCRx/o3qDIw8B26PxJrAFtgrGaxzIdMFNeohel7BJ4mHjEcJjjjasNQU/S53HvylooQo7aySu/e8Jd4aYiGMJ2csqeAIFe/yGoyP5taE1cV/ELFqwWrHhL1nrhrnFvwtbcGEFxyPO6hX6aOqmYbC7J/yy+cBUY2YluXFeaWQPHrZEOcbJ//SY+n+IBSsHDsdgo3sE8dabwu8lbx8/7Ve9bCRybwK968T/gpxPep1I4awpZpIaIUbjMPoHUhssr2mZFzvcemqstgvA2tH6FjeHA5SuFf9RDREDqUhAcqZ5V6Ucmh/uFHElgsuxKbxtjdg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0vioW9y85oK9RLV9csdWdxnch2GK1Lgi4zEjM+qyifo=;
 b=QCTbr9W5Yq8JEkHfLczHVcXryyKtR9UwrM777vKcCq7RZkJZ/IwmJFOp0lM2rSLzoBJzIY0tCZbzzcgczsLF3wODK+Wz6kH94M+i1YrFGiVmvVsj0N/SVv2YXQjab09E3/pOaTblvzNly4CZdP3442wBDLyGQujnoaEbzciSf9o/Xy9eiENWrSCGWXuAVPHHbkkOHfX3SxD3opsozUrCHMrquEXxT3DBNB0mfQOEARv/KVzMQjtULFJGa0Au9+udsHsK8sxpXY0fILtFdxXDi0RC7OMTtCXAvJoccXEeYVwMF05MiZiUtvKK4yrCsn8vJlMS4sJ0fkBDC0ngxcGq7w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO6PR11MB5602.namprd11.prod.outlook.com (2603:10b6:303:13a::5)
 by IA3PR11MB9376.namprd11.prod.outlook.com (2603:10b6:208:570::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.22; Fri, 12 Sep
 2025 03:33:39 +0000
Received: from CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::5ad6:8f90:b01d:2c62]) by CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::5ad6:8f90:b01d:2c62%4]) with mapi id 15.20.9094.021; Fri, 12 Sep 2025
 03:33:39 +0000
From: Qi.Chen@windriver.com
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][PATCH 4/4] package_manager/ipk: give out useful reason about an unmatched package
Date: Thu, 11 Sep 2025 20:33:25 -0700
Message-ID: <20250912033325.2887890-4-Qi.Chen@windriver.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250912033325.2887890-1-Qi.Chen@windriver.com>
References: <20250912033325.2887890-1-Qi.Chen@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR03CA0081.namprd03.prod.outlook.com
 (2603:10b6:a03:331::26) To CO6PR11MB5602.namprd11.prod.outlook.com
 (2603:10b6:303:13a::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR11MB5602:EE_|IA3PR11MB9376:EE_
X-MS-Office365-Filtering-Correlation-Id: 4cedfb75-a22f-4011-7ac2-08ddf1ad29af
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|1800799024|376014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?ib4X8UqtOA+YzcthKFFOv+QM08zci9VGVqY2TARRYH4X7Z9glacB9QHO+wgu?=
 =?us-ascii?Q?ONfn7ofMoaxefjgILFV8hvwrksfhvDhfxdRewvUv8COyRPe7SUp7tzwJK9/h?=
 =?us-ascii?Q?lQid5Mn/gJr0RkbGrhpeNYzx4TyP/xlAqvlpeei7O1XJFTcMf13VCxfGdz6k?=
 =?us-ascii?Q?pklzTEmgOUIJrGeo6ehAC1ZthNIX1RUcOEc6FPsHKXa0xmVZqUPsQKLma3jm?=
 =?us-ascii?Q?79o7JWouauvyHYj2irflLckJinFLwdKgcvPx906hO77mV4sCWC0eH5lfx9CB?=
 =?us-ascii?Q?xajNcGrzyEAIDY0OfMb+/JHB7YRj8wNN9I3ie7d6OjyM8BZks+iizcE/aY2I?=
 =?us-ascii?Q?d8AFr20VQqLTTCH5bybT+w2GJspdWWUVSY/ue8RMW9WBvT5P4dfAlT5nXEas?=
 =?us-ascii?Q?lWrcqw5xunOvy2CjqOcGiWVQM+z5P0zIzDtDYQe3/VJyAjMrr4wbb9ohrFO1?=
 =?us-ascii?Q?WXM1TPPNNrCFyPD4Cb9JM+L4bn1X350EAtALACO+9LbEubnZIEQaMM9mplyf?=
 =?us-ascii?Q?tixHjaBaQGxv2H24vq28cAT1c/A7CfH935+wAOgoIJI+TxXy2RwS88vfKnw3?=
 =?us-ascii?Q?3G03a7GOs3LjRrGHxyWbhsjK98AY/C9OSUFxhQprmW/DFLvtEwY3MsJvl8vn?=
 =?us-ascii?Q?yk/1WnamJIjff/z92s9Sfwqm1HmkZkEfrvPS6ciWL2z4SfQI8MjXWEtiYGxM?=
 =?us-ascii?Q?aK9I8rAune/5EAlxgbYfJ1w2HcXpCTG+WuelBQQAq07xcJKbQSveClRPZf98?=
 =?us-ascii?Q?bahAXmMp/I/I/4wpu2C30b2KImKl4K0BlHcPgM3WU/pWRtFVTy9gPPDgj6VB?=
 =?us-ascii?Q?Q/grOLZqZgog7JsvC6gKZzpWbClXnfiZFFHfN3pfAL9SvFQhmnAT+YLrgLWJ?=
 =?us-ascii?Q?KODV+3a7MvZJlr5MNGfePTCw4A5Z8DiH8oTZz0kIWFnjRAm6Wb5/8DSuP3LR?=
 =?us-ascii?Q?3UhXdCiPMtvzGC5Ny3LsjB+DDcdIXJvAzPY8wqcGEmf8kMWIsZU5pEvzibNq?=
 =?us-ascii?Q?432agW/nwbAv4dUvJjjWyLfo9gRV4r6g2F7V51xm+zN40ExnTkF7Jo5Whg86?=
 =?us-ascii?Q?/xxYCP29AObTnzV1WP0zi4ZUPi4PqFJ0uJHL9p2jql7MHdTbTGTZ+DmAbOt8?=
 =?us-ascii?Q?JaCxKIc1OdT0pqwqVlrj0o5qnhT1FZewNc1a+p23+cbLLxcuU2z1qz5dYbv+?=
 =?us-ascii?Q?ELIZBx1lNBJejdYiWJ/IcFe0lKHQR6CHlBEu/ANXcOu4lQHQSbS4peC0BuvT?=
 =?us-ascii?Q?eKfiCf+7oByxfXaxWE2kKZQFOEOYBlYJ01ge9SSrF1zDg1Ef+nT2R4HYf0dp?=
 =?us-ascii?Q?a0rbnoiT5hR+J7T97HU2oj+EU/jiSxJi/NJGGZFzijuo2rttOu1d9ShjXnLB?=
 =?us-ascii?Q?3IP6oC4+rlv4iCcVtlbYRlJicymlPwVVVzssEJNnrPfNlU/HR7zKitP+oP7I?=
 =?us-ascii?Q?NaVH8Zr+Mu/HqQsFVsIOziiiCYoeE/fwGmzAJ10pXdNjwIT5MTVjbA=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR11MB5602.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?MpIzi6RZbTG5lkadD9ovutcsDsLCs9+hV3VS/+EEaRfPT41RzMWU31L/hNx3?=
 =?us-ascii?Q?c0iIBVWPQ/U6AKte/QSebKpc86S2lGRiI94ccyhDJL6gopwHT+Ua8JGn/nDb?=
 =?us-ascii?Q?1NsncFf3ijV11jA6zl8KaigMLbrVEXXY4FIz5qd6yzNdeXOyZHWpMqLMdUPX?=
 =?us-ascii?Q?MM7E+GIpwzabOLSgNthtWw1hAwFXE74A5uw0f2W57tMtwTdlmGmvZm5wwXG0?=
 =?us-ascii?Q?U6paK6+NTXZ4fJec940YXW1JMLcCLK/69LXK4TPuGcrPakfuMXMC9pC2ABcq?=
 =?us-ascii?Q?EyTqL7v3yFqK/vhkHq4SMZSrWU+6n6CC17yswcLbZW7OqgAicwj/Gxoy89cN?=
 =?us-ascii?Q?VVYaCR+AX3ghBXr4k+lQdSXn2GPrpWidz2+vsmXmJKa0JSxiiWATLwbvInk4?=
 =?us-ascii?Q?y04sOGjyAyizHuqfj1JEbGa1XeQR4+XjW25iL6CaXEpfEdAHyW3bDrlDvZ+R?=
 =?us-ascii?Q?TayUe674aFHBlOKQqoP0a/6QTIwMHDyxEBNKE6LZDD5c+R2MOk4eGjk1EQih?=
 =?us-ascii?Q?pHDRoUN+Y6cU38smjncuRF8skEKBsWSdfWmLowQ1YRufVIKxsOUiGKjzOAY5?=
 =?us-ascii?Q?pJRIzLNI5Vdn5uXAEAH6C7q0KQU2i+k1ww+P6EyZ6PUkL/KYoGzwnepWaMa8?=
 =?us-ascii?Q?bNWz1SXbKUOiRWR+6FeacvF3pX19pPo9Q2naeY2b8ZqUtcqO6bO17DREKaOM?=
 =?us-ascii?Q?e7hnU7XGIyb3FnBjFAn561XipJe/nfsJbLvWMXdBIeu6jnktMi4JYyOEDs5b?=
 =?us-ascii?Q?AM5s2siyQ4F0PfuH7OkaPJISmVyG4LGbVC/aWoc197XMDaLH7aP20MyQsvVS?=
 =?us-ascii?Q?blXVY3BHso5XoeDGNwGMF3Laulrzy2HF54nytGt+Rqt6RGfeo/KtS8pNIWAG?=
 =?us-ascii?Q?cs3rqt+f3HRc+arCH1jv1iz/adF07k8bWY51bYpS0s0YXLMxNaMiljRwgDE5?=
 =?us-ascii?Q?gZmMQK6ccFmpl2N/O8Em5y2zvLqhWni57lwbYo+ESJe8SawkewtsOH2VPc2L?=
 =?us-ascii?Q?bXU0hNqvw8QXACfrbLfULBxwSVv8XJ0bHSf89JWxjPl6w5dhwKsCQBXq0ABb?=
 =?us-ascii?Q?jCP2F6t/bUyhfscre8FkOiXEadCyA+T0x/SHedcQV5V3hy20oaZwa2y9sqio?=
 =?us-ascii?Q?NabTguFcgmEhkqKsdQj/awyFpd3oa42DEs1A8Sx12F1VyRkEHv631FReQq55?=
 =?us-ascii?Q?uwxGpF2HJo1viqNUJaOG7IihI4LOOFjXUtKt3TIeXkNpaiuhS3h+wNVWL12B?=
 =?us-ascii?Q?xBzlArZJQDG7/e0cXjnlfEZJ2Jsj7o6oH6eKnV4cPFeEIMTEiBVAfzAK15Qw?=
 =?us-ascii?Q?qXVLH9G4k74CjbXrS9gcbwnRJhLeQp/rj3vhPdo62PvO/95ZlG+Mu+1yLb/K?=
 =?us-ascii?Q?I2jVOscmGHrbCf/35yHPtQUBbtMbwsHC+a/o7+VwTZ1aIuaoskFojvBuhk0X?=
 =?us-ascii?Q?sEWtrPEWJ2WfCY959SzmzXWbhAry3wB39oRXS9a44wRtnqb2/x+bvCESqi/U?=
 =?us-ascii?Q?uzT9yLotCIHlqcIRo7GKMc+wunUoq3fbNkRDmDIUELr1tOBhoaDdQFgKu3Te?=
 =?us-ascii?Q?/BRRIpPUdzwzzavUq7hJjlrzsdZ7WoZhjul7/U+yE7vZvNeHxoFWinjzPyxd?=
 =?us-ascii?Q?OQ=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4cedfb75-a22f-4011-7ac2-08ddf1ad29af
X-MS-Exchange-CrossTenant-AuthSource: CO6PR11MB5602.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Sep 2025 03:33:38.8297
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dp7dbYpZfq4tJOSza2AlnmVB7upAOrh/xorGA3aPaS8ie3eitM8VExAke+nIBAI9fnoH03zTwIDxE39pEG7GVg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA3PR11MB9376
X-Proofpoint-GUID: KH-fQEWVrGcp0XkDUt1oLgucMJLevCZ2
X-Authority-Analysis: v=2.4 cv=U4mSDfru c=1 sm=1 tr=0 ts=68c39495 cx=c_pps
 a=QqSBEdqS7BUxypinyQlWrQ==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19
 a=xqWC_Br6kY4A:10 a=yJojWOMRYYMA:10 a=t7CeM3EgAAAA:8 a=KY3ShUrCpoxh2az84R4A:9
 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: KH-fQEWVrGcp0XkDUt1oLgucMJLevCZ2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTEyMDAzMyBTYWx0ZWRfX3L/WTjzOVcCF
 TR/mtW/mEE2ePTL6tCYmVZWUA2T0nd59J2QnpVaWyGAOtqN/gb5xDw3Dt9/8lbW3gJ3U4cz+hu2
 DkIsuyHiCST+YfrJenKXmahq6XxGJetG2AunvmrQcjYqp+luneeFsK69nDcDM67GcnRWdpFbzfj
 wSu7QT2nAKE88nOuM8odTzIzAKE+TPgSwPfQ2kzC8gtR5QfaqI9pPHaJpFXUosjKvK8lL54j0R1
 MMIU8y3oWgBP2ArrKpcUe4wdYb5NGhT8NTWqvCn4IYZgBhAeFkb0e4A7X691Z9LnemVo9rZ9QcA
 +rdHsZw7QAZUGFso0o89Bj7I0KU4/d7kUt3wIlq2z7wNLJw5OjhQj+G7aOjvqg=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-12_01,2025-09-11_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 spamscore=0 phishscore=0 malwarescore=0
 suspectscore=0 clxscore=1015 priorityscore=1501 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2507300000 definitions=firstrun
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 12 Sep 2025 03:33:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/223303

From: Chen Qi <Qi.Chen@windriver.com>

Give out useful information when a package could not be matched.

Before the change:

  error: opkg_solver_install: No candidates to install catch2 (null)!

With this patch:

  error: opkg_solver_install: No candidates to install catch2 (null)!
  ...
  catch2 is a recipe. Its generated packages are: ['catch2-src', 'catch2-dbg', 'catch2-staticdev', 'catch2-dev', 'catch2-doc']
  Either specify a generated package or set ALLOW_EMPTY:${PN} = "1" in catch2 recipe

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 meta/lib/oe/package_manager/ipk/__init__.py | 16 ++++++++++++++--
 1 file changed, 14 insertions(+), 2 deletions(-)

diff --git a/meta/lib/oe/package_manager/ipk/__init__.py b/meta/lib/oe/package_manager/ipk/__init__.py
index 3d998e52ff..4794f31f88 100644
--- a/meta/lib/oe/package_manager/ipk/__init__.py
+++ b/meta/lib/oe/package_manager/ipk/__init__.py
@@ -307,9 +307,21 @@ class OpkgPM(OpkgDpkgPM):
             if failed_pkgs:
                 failed_postinsts_abort(failed_pkgs, self.d.expand("${T}/log.do_${BB_CURRENTTASK}"))
         except subprocess.CalledProcessError as e:
+            e_output = e.output.decode("utf-8")
+            extra_info = ""
+            unmatched_pkgs = []
+            for e_line in e_output.split('\n'):
+                if "error: opkg_solver_install: No candidates to install" in e_line:
+                    unmatched_pkg = re.search(r"error: opkg_solver_install: No candidates to install ([a-z0-9+\-\._]+)", e_line).group(1)
+                    unmatched_pkgs.append(unmatched_pkg)
+                elif "error: opkg_prepare_url_for_install: Couldn't find anything to satisfy" in e_line:
+                    unmatched_pkg = re.search(r"error: opkg_prepare_url_for_install: Couldn't find anything to satisfy '([a-z0-9+\-\._]+)'", e_line).group(1)
+                    unmatched_pkgs.append(unmatched_pkg)
+            for pkg in unmatched_pkgs:
+                extra_info += self.get_missing_pkg_reason(pkg)
             (bb.fatal, bb.warn)[attempt_only]("Unable to install packages. "
-                                              "Command '%s' returned %d:\n%s" %
-                                              (cmd, e.returncode, e.output.decode("utf-8")))
+                                              "Command '%s' returned %d:\n%s%s" %
+                                              (cmd, e.returncode, e_output, extra_info))
 
     def remove(self, pkgs, with_dependencies=True):
         if not pkgs:
-- 
2.49.0


