Return-Path: <Hemanth.KumarMD@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 15E18CDB466
	for <webhook@archiver.kernel.org>; Thu, 25 Jun 2026 06:52:45 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.5813.1782370362254634260
 for <openembedded-core@lists.openembedded.org>;
 Wed, 24 Jun 2026 23:52:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=mG9S7Hdb;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=0636a81255=hemanth.kumarmd@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65P4u7m7452408
	for <openembedded-core@lists.openembedded.org>; Wed, 24 Jun 2026 23:52:41 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:message-id:mime-version:subject:to; s=PPS06212021; bh=XwbZqeWHR
	HBUHU2WHVSRIPv2bnCR/Kz8ppQRZL45v20=; b=mG9S7HdbH4d85ZQKk+hnPDmuF
	KyMp29s4ky1U2vNOhb7TNpxD3OosFUN+1zqM6qwL0YiZ+sPhAR6UdBrQHcXvJNVZ
	b/r4qDrgAm8rsuUxtphMzbSo+p/16JJlof8UTmsb1tyhE16h5I8e+ZNJwOR4lYLp
	8HMgmpB3+Vntm5XlrcNNrmZzLkKY+19APrgLLhcrYZetVo+eLKyfMvj2h+KCygey
	gguggIdG7tCgu/yD51oejs6DRFOWffFw8WKUbN9aMdaD4tKMXXLtZlq4s0bbI9fX
	DmINLQ94YCnkqkytGi6Rtiu6rwTaqhaoy9BMEQ33D6Og3EOlwaV0ViiwrU+xw==
Received: from ch5pr02cu005.outbound.protection.outlook.com (mail-northcentralusazon11012032.outbound.protection.outlook.com [40.107.200.32])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4f0sybg93d-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 24 Jun 2026 23:52:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ni5j6CU6MdD0DHZmtd7kEfNwI95Uaczz/jtYPgVNYSVOuunsSJU1kvkKRLRlFIBWrDUoe9gcsS+6S/pIP86X2RiapTBMd0fc4lYaNQL28kyLnFSfqFr4JhLY5QrBRZdSLOeR1wOSoa4HuAnqplxNh+hwMLmCF+78pIyAeoMhOortmonH815XKsE72cnwZX+CuTTUbfrNTD5RwdYgg4X0WngdMnLB2XPNGapK5TZHQxN1gJFBAjg9x4Yz5iUTF7zgk1yTqUoZjB9jZoMCjTNJV7s8K7zEvy8G2R4buWMjyEMgAr5ATHH3/aXkrNcLRHz0+VUZH8foY3ITxXoiAZz8tQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XwbZqeWHRHBUHU2WHVSRIPv2bnCR/Kz8ppQRZL45v20=;
 b=GkgICzuSBJ9PNeRCyZXPYa7DQMvC2PWvzlTAcgSVQ6ATr3RseR69AHz9IcjrOqYHT3TaGvaDs1EMrJBsAumQe/jIhgeCt2kXL58T+KRiA/twv83N9HiQxY+ZvrtpWuSPTdXpFTEqdlozxVniIWklZ/zCj2bVWfLeIlIwYNMkt6jHVULC7Tq4k0DsA1TJKJ5cZMMpPO2mlKFfSXhqvZLfWOptXsnKMZ9D6v1jtV9lcqzgWCA+rlR38AKoInU+6ab2/8EBuvTYkX+mIWm4KFJmwOOu11Z1gtSDXeLkYXoPMp7BKD07qziKOACyhvGAV7SsWY3j0syznsz9bB/aUDZIVA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DM6PR11MB4564.namprd11.prod.outlook.com (2603:10b6:5:2a0::7) by
 CH3PR11MB8517.namprd11.prod.outlook.com (2603:10b6:610:1ad::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.17; Thu, 25 Jun
 2026 06:52:35 +0000
Received: from DM6PR11MB4564.namprd11.prod.outlook.com
 ([fe80::21dd:5cab:fc47:1dfe]) by DM6PR11MB4564.namprd11.prod.outlook.com
 ([fe80::21dd:5cab:fc47:1dfe%3]) with mapi id 15.21.0159.015; Thu, 25 Jun 2026
 06:52:35 +0000
From: Hemanth.KumarMD@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: Randy.MacLeod@windriver.com, Sundeep.Kokkonda@windriver.com,
        Hemanth.KumarMD@windriver.com
Subject: [PATCH v2] sanity.bbclass: warn on cargo config files outside the build tree
Date: Wed, 24 Jun 2026 23:52:13 -0700
Message-ID: <20260625065213.2634586-1-Hemanth.KumarMD@windriver.com>
X-Mailer: git-send-email 2.49.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR05CA0162.namprd05.prod.outlook.com
 (2603:10b6:a03:339::17) To DM6PR11MB4564.namprd11.prod.outlook.com
 (2603:10b6:5:2a0::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR11MB4564:EE_|CH3PR11MB8517:EE_
X-MS-Office365-Filtering-Correlation-Id: 4002873c-b64d-467a-98d2-08ded28656b5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|52116014|376014|23010399003|366016|1800799024|38350700014|56012099006|11063799006|18002099003|3023799007;
X-Microsoft-Antispam-Message-Info: 
	r0ldcLpvMfJhJlmlKS2MZaG6U9j+OqJ96Ev0zvReVA9ahV4A5/Ni+9qULcN/39HayaRFV7u8V0j8hlo/Gg5VKD5Ue7o3Q4MQm8Csc9Oejwh7IkT+vXgUAs+O3e/xtYQnUggLya3fWrnXFBo4mry11hWMZCZcvS5Js18frJRJweeGWr1k6eWYc2JJ0Tn8g9hAE8jTK3JG/TA6BOPVJEhzPIR+88Vo4Zk4z0/27ykWdsMiBiDJnswsCqbaaZiRghNEcKhMBE8JCFbZHhs7zy6ajeNaORPl2SuiokRkCknvdcGJntKDiBWJwdJsLc9ioPh3iLdg2kzF2v4Ed86wRmC+LXSEOomRcHYkmWdMXBOR+PMq2mwru5cK43e/4FpwR5qne/yWC3AVwPn5vk/QWX4u6TpgsT18nUqMRtFXpyt+CF+ELCCo4pBoWRkxqFRYBZoXlOJBeliLAw4P3B6dOM1d4vNjiK5T8kTXmOVwMTY304aI6pTpTEt4+lRC7OWIryh5th0z01edIs7+/b4sE+zCjZuTNGpN5TaH3qCTv1h1xEUIH1t08lg5PRp85O9JHE4rEJVHDmIxbuwa60UncDjrzF4wjyTi868HDMzGSfv8j8MtpPyu7bixLQSPr0BLQ3eAOFxLAsATsMTb/MT2/KU+zDQn5dHIbdyV5ve3LRPY5IT8b2ODXcPZSTePQsxad9rUmrNJupyPRTzQ2WkGP3L0byjmtGODBf8QcAJ0TajPvwg=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR11MB4564.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(23010399003)(366016)(1800799024)(38350700014)(56012099006)(11063799006)(18002099003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?4rx3DbhGiXEC/ez4vr1cFOS1/odOmkjxlf7NZ0WKe7Y6zMguEujtoIkVewkM?=
 =?us-ascii?Q?vjxNlOlzPvnuHDYHyMrFAhxjIcQPDXBRk7s8onMQ2n/fRm6FiVF4Vlq3fbmw?=
 =?us-ascii?Q?svrSXHqZDM9qHkB+Y1G+cCS21FrZ+cv+xM+cEUIH65nRAEI19kJhH/SjUSv6?=
 =?us-ascii?Q?1ZqJHnCl46K1oaeHtPBgic7uxvhPamamZkGIRsP/pY+FIzBMwdgYVureQQ6C?=
 =?us-ascii?Q?dP8JE1OiT4DtoskyalRf9s1a1XKo3feqiwykdmV67hcRnJyO0KOmmaol4VMp?=
 =?us-ascii?Q?52p46BNykK6mj+XkY83yaLiinrQXzcgGLJPyCnwLyrR99ffr5OJklqDnLDvL?=
 =?us-ascii?Q?f9w/YPn+fFOVrpIu7Kh4VCtXuHlxwDvybmprf+THNRuvRisvumqEokhGWqtC?=
 =?us-ascii?Q?71NyDnRnQJ1NMXDWf0LLpFkRPy/CPT157FuwGNUkgAemm1djNRTxkm6p6NwB?=
 =?us-ascii?Q?D/yeHsracM8GivoDjVcL4VZ/SMlD6Z5LTHr691m6c8npjAeOwCLGXVCfnDda?=
 =?us-ascii?Q?F8hai5MtvqD+nA0Oava+HPWxs1eaImtjyE9lbUrap7Vw4yuBnoWRKVLqel/o?=
 =?us-ascii?Q?+C848loHYdIZ0AhGe0BedBznCSri8uYAS8pLzh3ze03UfgkURRmP9dp5EIht?=
 =?us-ascii?Q?7IM1Gxd3SD0htHXj4x/M6m5Vn/bd0T0/o37Dfl6nntNbyDPByMBEy5+4docA?=
 =?us-ascii?Q?k181MzWebmDopug+p4W4/s3N7OadA9s4gb9Rfo1IMyZNPZhmuRwLp5XowAlK?=
 =?us-ascii?Q?/XmWD/3EQt5KnP6zpmosY84KDBTRXzyQ/wF8ARE6uW+VKJwWXjtMODE4pQtM?=
 =?us-ascii?Q?/+qDqonxgTGX3l4ZhjbElTu/2nDOh25w/LhYZxuXncIS3tQ1H2HIhdIhJ1ZD?=
 =?us-ascii?Q?+DiqAYx5uvzJJBrtvo/7D1mwKsDnqHKtNhP0eSag9t+dxEwuU1dGTn5VWJkQ?=
 =?us-ascii?Q?VEh89a6O3epa1zKeNIN22V64xN2o0vTaBaIPo7+v0I2q7Wbug9zV4eLAuVGk?=
 =?us-ascii?Q?+RtyBOiJUEHk9DYEqmy/llcnS2ZwH6gNk+0DjcqmQDGdN24Ho2TXMY2yOwYj?=
 =?us-ascii?Q?e0qQ7HF2peCf5ILJCR4DDnGIpN9F6wNiJs9h1vu4bY4I3mW3GNpzgovyIuMI?=
 =?us-ascii?Q?Tob7dukSbjYJjv+YKXAklew9dwyjlnLryA2Egv7VNEcxnkGu7whWWbsLH3lD?=
 =?us-ascii?Q?fmp2jvymhTs2X7o428/kBBeV2agHKFogjs64M9pgeT4vuizfyPvkOA3/8GPL?=
 =?us-ascii?Q?QDhU0YKlqfhFy/EagF9sbViFRm1gTqJcxw8UostyaXc7iYXkyWPhlCNWi92+?=
 =?us-ascii?Q?NTip/IqL8ji0vUPTSzgHEgtRsbNyu1DPpphpFDIo4hiCb5UFq+Amj/7tFUej?=
 =?us-ascii?Q?b9tnmuZUTboD5V1XhXY9NivJzwAQOMxbfBE4KsyY652jpHNvU/bperKPjRa5?=
 =?us-ascii?Q?Xkwf6BbY21qKQtuvAnkyxd6S1ZEwwHKbmTQ4M/29YRKEPckFFbp8HazhOmfw?=
 =?us-ascii?Q?zP77V4D0HkT+ORSG7rsxiYWWEvk7iasQG/PEEE7Ujs2dHVNMVuxqsMlZpZqu?=
 =?us-ascii?Q?+rgOOjS0pZLwvyyfaZuca5prsH8FsK3odlm+fGjnIBoJhLA7tR+e8SQylz0F?=
 =?us-ascii?Q?ptNYkAJ0khyjOAI3v6ql0i/WuFgWOYTI+z+nnq/MDxz7IT6dKFS2PrUQhAMi?=
 =?us-ascii?Q?ldByU6Cx2XzBcbSO2AfoxpD8tpxlXJlmvJqoQaMWbshlYvGB9giZrEt2KCuu?=
 =?us-ascii?Q?ppQpI5UU/ZfTPDf7rDmRMarE7CWxs1I=3D?=
X-Exchange-RoutingPolicyChecked: 
	IumzmcimhzpqwfxMEjMiS1lw1MwnW+iWffEnjYDTnlZ5eywvS/Vbnwt7WM2joRfx6jFMIKMyZ8dhiP3NEVj0imk7t86eoFNYXItuS27YUXfTk4SQkQ2ZrgJpOabnMQbSz9GENxndKi9fMQQfikDxjBrPMezmIVfJx/Ry4WlKAdRAMWty81a1M3z+AglqZrnicK88D/B1SMUB7+A3Pc0bG5R4gHtTj6A5AEj5mWacQqhY4RWGITzVwKKlo4bskd9/VqmjrJHXpGW8HPChpSmHu/r+Mqm7gbRmq814BNwFdLpFiQ3bsOUs0oROHKo46JUHWMMWi/9Vefkuu0Q4P1m6Hg==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4002873c-b64d-467a-98d2-08ded28656b5
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB4564.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jun 2026 06:52:35.7063
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rhs+Img22ESExOf2Szhfq2iGvBC579t/vHYP4RIOIQHZZyKcfdky5VeAe9VQfxT52rrkQiJ9w5hFj8/mSYvtz5nvi5mlPjPUhAfraE9/KDs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB8517
X-Proofpoint-GUID: E1SU7nw57svYVfm7yNWV70NK-9bCMH-4
X-Proofpoint-ORIG-GUID: E1SU7nw57svYVfm7yNWV70NK-9bCMH-4
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI1MDA1OCBTYWx0ZWRfX/VEKXk7JBpso
 Bizwe1LROoomhVzZkowWka97ghBgDJF0BfZmXuNjRwC0QEwbdGRCjAWjptsx5vfEo3i3FFXbdsg
 O+DyEy/oJGWLP4XfV5tOkXF/TGfxtE1rwQs8d8Lzo93eBsZ78gqq93klHbc+LIKAuarkwEFYd4M
 29dObEklClPnOdul4KWGIrsl2WXzMItrWX+C8n6f2matmlAiZqI5N/I72I5o+a1EyyOvYGrvreT
 QYkUfDdPM0WdCHLPKMqs4+MGrRl23hcnjfK+jYMGFurtm1Ukq7kNnwyekUQx0E3SLa0nlt6BVlj
 WYAGk2Cp22jY9E3ktcjZpPs2iOit1w2+CgWLDD7cg8Zz+wTPyoraGI/Izn1ochjQO/n91rX+Xjn
 Gx22xRb6edJQj48N/2oiaOF3dtn+Gi4XiLqypCxRq40N2n/WXSvr0CfKCxXcY1aJD3EEvuC4CRI
 WTI1yT94HthhO0v5bwg==
X-Authority-Analysis: v=2.4 cv=MpFiLWae c=1 sm=1 tr=0 ts=6a3cd039 cx=c_pps
 a=uEYA0xFIOgoeTHFe+isxXg==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=FelO9ux0wxsA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=HK-ge7EqtdluswH-FwHe:22 a=NEAV23lmAAAA:8
 a=iGHA9ds3AAAA:8 a=t7CeM3EgAAAA:8 a=6l6b2v__q5i8A1H3Te4A:9
 a=nM-MV4yxpKKO9kiQg6Ot:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI1MDA1OCBTYWx0ZWRfXxJtZoF7MMVHP
 dEnV3NeORIeA27SY8Pd4trtNOiQ+vu1no0LJJAu+yQ4XzOgM2Li48e0m0XgECm6lXHgJ+IG9n/N
 S5bbxp8PppuH74VpSl0sPPDgSmQ+g4TehiYAcEpP7Tmo6E0kGTum
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-25_01,2026-06-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015 adultscore=0 malwarescore=0 phishscore=0
 priorityscore=1501 impostorscore=0 lowpriorityscore=0 bulkscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2606250058
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 25 Jun 2026 06:52:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/239544

From: Hemanth Kumar M D <Hemanth.KumarMD@windriver.com>

Cargo walks from CWD up to the filesystem root merging every
.cargo/config[.toml] it finds. Any such file above BASE_WORKDIR is
silently picked up and can override Yocto's linker, registry or
compiler settings, leading to build failures.

Until cargo provides a proper fix upstream, add a warning so users
get a clear diagnostic instead of a build error.

Upstream meta-issue: https://github.com/rust-lang/cargo/issues/9769

[YOCTO #15637]

Signed-off-by: Hemanth Kumar M D <Hemanth.KumarMD@windriver.com>
---
 meta/classes-global/sanity.bbclass | 33 ++++++++++++++++++++++++++++++
 1 file changed, 33 insertions(+)

diff --git a/meta/classes-global/sanity.bbclass b/meta/classes-global/sanity.bbclass
index bdfa7f059d..5c5cf311da 100644
--- a/meta/classes-global/sanity.bbclass
+++ b/meta/classes-global/sanity.bbclass
@@ -854,6 +854,38 @@ def sanity_check_locale(d):
     except locale.Error:
         raise_sanity_error("Your system needs to support the en_US.UTF-8 locale.", d)
 
+def check_cargo_config(d):
+    # Cargo merges .cargo/config[.toml] from every directory between CWD and
+    # the filesystem root. Warn for anything found in ancestor directories
+    # above BASE_WORKDIR that Cargo would pick up silently.
+    import os
+
+    base_workdir = d.getVar('BASE_WORKDIR')
+    ancestor = os.path.dirname(base_workdir)
+    found = []
+    last_ancestor = None
+    while True:
+        for name in ('config', 'config.toml'):
+            cfg = os.path.join(ancestor, '.cargo', name)
+            if os.path.exists(cfg):
+                found.append(cfg)
+                last_ancestor = ancestor
+                break
+        parent = os.path.dirname(ancestor)
+        if parent == ancestor:
+            break
+        ancestor = parent
+
+    if found:
+        bb.warn("Cargo config file(s) found at %s which is/are outside the build "
+                "directory. Cargo will silently apply their settings during the "
+                "rust/cargo build and can override Yocto's settings like linker, "
+                "registry or compiler settings causing build failures. You can "
+                "either remove these file(s) or move your build directory outside "
+                "of %s to fix this. "
+                "See https://bugzilla.yoctoproject.org/show_bug.cgi?id=15637 for more details."
+                % (', '.join(found), last_ancestor))
+
 def check_sanity_everybuild(status, d):
     import os, stat
     # Sanity tests which test the users environment so need to run at each build (or are so cheap
@@ -873,6 +905,7 @@ def check_sanity_everybuild(status, d):
         status.addresult('Bitbake version %s is required and version %s was found\n' % (minversion, bb.__version__))
 
     sanity_check_locale(d)
+    check_cargo_config(d)
 
     paths = d.getVar('PATH').split(":")
     if "." in paths or "./" in paths or "" in paths:
-- 
2.49.0


