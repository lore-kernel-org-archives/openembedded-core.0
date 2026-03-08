Return-Path: <Hemanth.KumarMD@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F0254EA8529
	for <webhook@archiver.kernel.org>; Sun,  8 Mar 2026 15:09:22 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.40615.1772982558677660688
 for <openembedded-core@lists.openembedded.org>;
 Sun, 08 Mar 2026 08:09:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=PMK9Jdy8;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=75278c0199=hemanth.kumarmd@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 628EQ7gi606391
	for <openembedded-core@lists.openembedded.org>; Sun, 8 Mar 2026 15:09:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	PPS06212021; bh=DUNUgrGiszkJESSGCX3WI02P75trkUUpJXmvTF4GuAg=; b=
	PMK9Jdy85YBleaELWcFizb0iGXC/Mi/PTGfK+k4gH0qe6PLi8MDS/TOntjZYciq6
	gskTffexq4ZWgh2JtQVV+ZCcTZcnUGl5SEQf0ApkIJRR+EJrhmge02vS0BqOMcFj
	Hhujy1UpiXJL0hk8uLDSWPZKnjwGKg5yMeSUJr2eI+kTbtzACo+TLV7xlCCiqhER
	MxNeqTqJlEvx/gn6B4T0QyJWpiz4SEFwzAKkto/tUXDXYQQiQ6XMMYUyW3EmqSri
	5QC4gMoSRktI5xprUpB2VKiF5pZDWH2hFsmPlHlcgaRLO6QGspabdLKgLVWvpWCr
	7uC+rpGf6hu1Pi7VFRScZg==
Received: from bn8pr05cu002.outbound.protection.outlook.com (mail-eastus2azon11011054.outbound.protection.outlook.com [52.101.57.54])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4cr97v948x-5
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Sun, 08 Mar 2026 15:09:17 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=B4edpb5cHD+WvyerR2OhOkyAQWqYVXfk5ax3+MTnwJDUdAt6HxyLP4bmjtsZZ8sjcVJfHKm7qIjorwoS5zn1qp/RjR7EiYg3U7Dn277nPgzaG59BbqSBVXbekZ86F+0Di/Un52pZyFxZnYWw0cMsiDoD9og7izdFiImfaNt5Ih3rU+GHpr4o2XdfB84alQhQm66bw1tTSRS1Gw7FQaf/UFGAL27Nx/kJYsOibBVeE3VAMDNuVZ1tJ0xANlPzMb9POAZePdvXbP+cvuBhc+6tmRYTRdn5lTFkeNBI8Fn0iBc1HrGq7+hTM0LjAhjNNPoFU6OkBt9b7WOyeeD6D7BApQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DUNUgrGiszkJESSGCX3WI02P75trkUUpJXmvTF4GuAg=;
 b=acXTD+FM+RWHQHktRm8jmRiYBsXlehJBTAlVrFp6+8BELj0feD72c7E31WBycQTaM7KhOvQ+JjOxPnUvAEweAqG0sAy5iI+4TlDelaQxMNI7SjOVqkg8llHS+/bRX191TG787GquBiL6YrbYz7pFNf0mK3zZ2f6sMsQbRrG2oA+cGh4FpKs2A/2N6iVnOSjAXqKLQ7X/f4gtknltOYRjXtayRE9yR9UzAzfDL6GIhFSKpcGUn91tq3oIOgfol+yi47a2AfwAYNnszphyt7onnIl5Ddhazm5j04ChmXYMABgthh8ObZfYeiMWHuZpqzXYuy2BMKsXK3G0NcF9Jpk1gQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DM6PR11MB4564.namprd11.prod.outlook.com (2603:10b6:5:2a0::7) by
 LV3PR11MB8460.namprd11.prod.outlook.com (2603:10b6:408:1b4::5) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9700.8; Sun, 8 Mar 2026 15:09:15 +0000
Received: from DM6PR11MB4564.namprd11.prod.outlook.com
 ([fe80::21dd:5cab:fc47:1dfe]) by DM6PR11MB4564.namprd11.prod.outlook.com
 ([fe80::21dd:5cab:fc47:1dfe%4]) with mapi id 15.20.9700.009; Sun, 8 Mar 2026
 15:09:14 +0000
From: Hemanth.KumarMD@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: Sundeep.Kokkonda@windriver.com, Randy.MacLeod@windriver.com
Subject: [PATCH v2 5/7] libxcrypt: avoid discarded-qualifiers build failure with glibc 2.43
Date: Sun,  8 Mar 2026 08:07:19 -0700
Message-ID: <20260308150834.2508331-5-Hemanth.KumarMD@windriver.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20260308150834.2508331-1-Hemanth.KumarMD@windriver.com>
References: <20260308150834.2508331-1-Hemanth.KumarMD@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR03CA0062.namprd03.prod.outlook.com
 (2603:10b6:a03:331::7) To DM6PR11MB4564.namprd11.prod.outlook.com
 (2603:10b6:5:2a0::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR11MB4564:EE_|LV3PR11MB8460:EE_
X-MS-Office365-Filtering-Correlation-Id: 612e73fc-90f3-4a7e-8bfc-08de7d24a946
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|52116014|376014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info: 
	dW4emwhF/aK1KTz1VfRU9vBYyFc9Nulx/+BsKGBc3UGgRxb9CLHB65I0gzxDtRKbDiAW8xy7mWF7U+grqUVKV2IYUHHEht0bCibmBEC8v8icT8XU1U646PifRxr2tPv69pA3Quspwbisky0ZL5kyF+0kgblwHvBq/KsztZ15n1UJII1V0sjI4Ui/qWYAZgdUYY/z2e8PprRPvRibYN+mX4eEFleadCq8A2mDKWx8keXuLF1KN/kj7nZcuYVwy4EoKphCdnKiHa9cd8ds2YA1/p2+WtgUa2Oze2unjDI/gZ4vyauUl+VPb1A6cV4rfE6ajpwe3lctmwglLCLS9iViJnFLsV+9QOSZ237a6zuHMU+JvLMDywFFOGVjmpv9AFlmVD8yNZTgLqUUqjpKiYPhslagY7Cs20ArGHacB4h0o3/p1JhyZ7F2PowIxbbGYED695cnt8PadZgrgIMoAzdcHtZeWKnAPv0TzOCoSgJazau80+qGUFWWl+G6zyvWOnlAGtPFSxR8q64txMpbJCsKucV0aLu+w0H6S/3ZXS0vwe0mzrgDtNe6mdL8W3rmmvnaiAgUsZYzLB8QP3ktiK+hs4WioEb9zGOTBcQZI+3fj0kKgQs2FTK19nqBQrrR4Kd8ejg87NWTy8fa7vu3NzPJCknCpaWTscyfpe6oYlc2W/v5wr6aR5/ZsCyevkHhpuV3N/ZN+O0nz6+274AZ1romQafTzTCnEMvyEguSmAKq8AJR9leBgjrFFWCy6R3WO7xKPLuU7TgYRDcGr6lPXcfCMrpqihBfuloaL/SkGWtrtdk=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR11MB4564.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(52116014)(376014)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?W49d10NrnmxnE2vIgLldcKRsocXJf7nxP5skEZBDzwAjkEO0kPLHAcfaEmWj?=
 =?us-ascii?Q?HeCoJeG/E3qPoKPgfAyIpHp7ecc2atpJljOMHJ3g18w0OSQWoKVtvDm4bUkH?=
 =?us-ascii?Q?Hz15MRx7DJ9sG7hkiVWp0keIwTbVLCtkvuDhL3wNIBuHPmx90AsgcLzyKOWx?=
 =?us-ascii?Q?tQaBN/yLw/JWnMIqNH7+DFkCMAEV/oWl6ayBpZLTDYIB+9ydrNPVlbZ/lL6e?=
 =?us-ascii?Q?1yF5ceSOh8etK6/cf6V6Ef8j8ZP2RRkYKky783NzoF2QYlh021vquwGvq363?=
 =?us-ascii?Q?r5ExL/ULSqmSk1R54i6+8yCQo5m4D2H5EO9HmMweTtsv9l6W0SW+ajlttK8z?=
 =?us-ascii?Q?ZelHrpUwSt70NMRZ/0OPMcDG+OjARemESfCD1PRUHgh2lJrTntLiZuItvzza?=
 =?us-ascii?Q?R92bJpRvTLXCUns434As9IrDTcwF8ug+r8cG6bh58wWc51n0GMAnIedfHqLM?=
 =?us-ascii?Q?85CfdNM9AiA4vvdPCibhzbWqVitIgmGu6HYzG7v158k+7UiDiPSnoR3TO/7E?=
 =?us-ascii?Q?A/sezFwBIXt95pWn4vKpUL4gnD1aL0VkgTNwjfOSVEfj+08ZGiPf828DqenO?=
 =?us-ascii?Q?wcD0xgj3b5rWLtJV9B5DCUY4465A8eMCteWzD4HaMA7bLHLMPJJWghNB+DzB?=
 =?us-ascii?Q?sMu7dPj5vs1GmGhoTgfTfQeaXMPIDai5ch1IkeamXVvXS3H+FUdebe3ZAdXj?=
 =?us-ascii?Q?Ooyrh5nMj92r6BTJICObhA221h5SMFbhFiZFgW6k/PZAh8OSWamsMERqkoUg?=
 =?us-ascii?Q?EDs6QB2eQL6Qay0mIKKHI52f+CBkvKs3IDzDTX94eAitJKsjI0x0wGMTTXF0?=
 =?us-ascii?Q?M48MgYSvSNGdn5LXyfR5ItbvY7uQYl5JjoASB/q0nrXxoUBh7caSpZEiI9Bc?=
 =?us-ascii?Q?pTlYJ+7zKRZGRSIA1RCD86+i1kQjZbGmxuWThnNCDm8gc4MhDMR/D1ga3jbt?=
 =?us-ascii?Q?zVFMEbMfGsR9KKkq4s/VRPTILcxM7nDdUvnAHLIstlDn4cPYt690ZmT1x73N?=
 =?us-ascii?Q?s/jz1gklOM3Bv/rfaLq5hpImELSbWieGEgSIHgW8oLMN0JW8YNpwl2wwYH8F?=
 =?us-ascii?Q?NxsBmYKsPeQ1XWfLi589ITGqVSZfPBlT9xLGsgGB92jrimyaJvs/4iHaJXuV?=
 =?us-ascii?Q?Q24UFxNhh2epmfZJs6ClhEhuYr1tjAy+EsTErpPzQ22DAlfc2Bk8k+mkYMpT?=
 =?us-ascii?Q?OR3LiIGvvcWtCxVn29ttlMiQjzgxgVkp2yyyvObx71xeeMAJWJalw24TI8cq?=
 =?us-ascii?Q?CTBfwmZIq3KVeHbdEPHEbr2Zmzdz8nrDPgZFojo04myXzal2kAbJtks7UzgY?=
 =?us-ascii?Q?x2XpkG1sMO6UMo6e6Z3Vf3k4RcDZr5XHtDpZ9YHOCZjqxJWrGMTkMOqbPlXa?=
 =?us-ascii?Q?EnkODUuyj0fD+3oUwsdWSiHt/NZdup42o/hT+xnhL/IdCmeKBbQkQi73tY9Y?=
 =?us-ascii?Q?v1c83tZMkJoOcoop0xYnDbt2BwTYXseGh0pY9TUFTgkXQ9kl+mGLaLSdvtaB?=
 =?us-ascii?Q?ivtw3usVLmrarjB9amgW++RcQzgTR4Z7FY7xrTUJOvRbG440T3rGlkEhIqLh?=
 =?us-ascii?Q?I/RRZB8kC6K0+c+Z/RAa+gNjVfed+gNCncN4HqIL4QfFC9vfT9Pav2dxBPuf?=
 =?us-ascii?Q?CmpJhjb/Uj0JS+RU/qG4tJCnedEc/9vicYPcHuVJC259cbtq74Wy0c+hS0ym?=
 =?us-ascii?Q?4iGXfBd7+D5Qj/Y64HmD/WxRw86XwwImRMUdYUrhgwbDEzm1AWUAt9LXzNYb?=
 =?us-ascii?Q?1AzxBy9jV362LhwG19sJShsXxaNqwUY=3D?=
X-Exchange-RoutingPolicyChecked: 
	CRrjXwM6MMgpBQDSDEhZ4uere+Dp4G41d8YaQO4ggBFAXzMY7fjhhqyjJf5ZpwXqc0ob0OgElDJ8B6K5GumWIUMoSUucOneYR+UG0xRSJw6tUsDPW2mw0htX4rKIwAfbAA4cjeAny+97H7nwwD13nOg9g/CvCUDw9iMHlNV7io+4Pc2Q/iOWxGHiFpcjOONTafsivtDE9n6RQ++nQj/YjsaTRgmUTA0z2ntL1BxIZLFGoFcvSTKeqlklANybllixGheowZp/WnnLZYXYMwPIUsdHJ1gbytlGrRBpYrD6sR++/PxX6gn7hgymbfcY7nRJDeDli24nvOoq1i9SbtFhQQ==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 612e73fc-90f3-4a7e-8bfc-08de7d24a946
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB4564.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Mar 2026 15:09:14.7654
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kMmTKr0Q+++3Hk7DRutlK5IkDE6AdknIRWeLXRG0W3C2iDsuzAAKsFB3/lMdqm7wwWm15LfH7FyGD1JlUhGsDhWgG7YC1hbsNBs6k6t8f8o=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR11MB8460
X-Proofpoint-ORIG-GUID: HyhHQhUcR6lvPu2gfA-8xMyBsxlT4gcs
X-Authority-Analysis: v=2.4 cv=B9a0EetM c=1 sm=1 tr=0 ts=69ad911d cx=c_pps
 a=F7X/6K5kN+zqVHn88SdM/A==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=Yq5XynenixoA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=klDOsUkWDRETUCZYPvoE:22 a=t7CeM3EgAAAA:8
 a=AJhpoo_iYQvPctpxBLYA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA4MDEzOSBTYWx0ZWRfX7t7tplwjtOJi
 bTXGD9QRfrYU/NMrIzyrspgWYkwNCJYCE2YLQ79tXhTOd7WnXj3quNrQcdWEne5vLn13VbXe85l
 RQCw9R3SEp6lbT7Yj704JpbyLKCx7GW0PSsO6MdNR40C1TfpTOjJxZepPzKDOx9yuD27UcIhX+X
 Z9R/KRnY8EZIbOKtTpxFVkHBQTIbFTWw126BuNwA628Gm1TsNAnrQYy8JWOpNBKPMBDa9Gvs7d5
 kUsPMuXPz5Vrer1zDOOB4Eow2RQs+ccJMpdPiphpi57MDca+6V1fMMtVKM6R9iR6/4gtYZQ8kbs
 WZp3+3KTi8H/KtAAZjLHNt0RFtp0bmpqnXls43tlSMlpcvQyNsxclcLdY1wgEWLPDdguFqcHJg/
 jF1yZYnmC7iSziGhaDNxJxxrZSsD6WXaXup8THiFJOpHOI5YcqZ85/CPuZsBw28vZ51HVtYvYfV
 h9/RZZ7T7pgp9AzuIYg==
X-Proofpoint-GUID: HyhHQhUcR6lvPu2gfA-8xMyBsxlT4gcs
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-08_04,2026-03-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 clxscore=1015 priorityscore=1501 impostorscore=0
 spamscore=0 suspectscore=0 malwarescore=0 phishscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603080139
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 08 Mar 2026 15:09:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/232657

From: Hemanth Kumar M D <Hemanth.KumarMD@windriver.com>

With the glibc 2.43 upgrade, building libxcrypt triggers a
-Wdiscarded-qualifiers warning in crypt-gost-yescrypt.c and
crypt-sm3-yescrypt.c which becomes a build failure due to -Werror.

Add -Wno-error=discarded-qualifiers to CFLAGS as a workaround until
the issue is fixed in libxcrypt upstream.

Signed-off-by: Hemanth Kumar M D <Hemanth.KumarMD@windriver.com>
---
 meta/recipes-core/libxcrypt/libxcrypt.inc | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-core/libxcrypt/libxcrypt.inc b/meta/recipes-core/libxcrypt/libxcrypt.inc
index 9aed0b9d81..de79fe3c78 100644
--- a/meta/recipes-core/libxcrypt/libxcrypt.inc
+++ b/meta/recipes-core/libxcrypt/libxcrypt.inc
@@ -17,6 +17,7 @@ PROVIDES = "virtual/crypt"
 BUILD_CPPFLAGS = "-I${STAGING_INCDIR_NATIVE}"
 TARGET_CPPFLAGS = "-I${STAGING_DIR_TARGET}${includedir} -Wno-error"
 CPPFLAGS:append:class-nativesdk = " -Wno-error"
+CFLAGS += "-Wno-error=discarded-qualifiers"
 
 API = "--disable-obsolete-api"
 EXTRA_OECONF += "${API}"
-- 
2.49.0


