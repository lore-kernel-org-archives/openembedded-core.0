Return-Path: <Ghanshyam.BanaitSanjay@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 92C84C624D7
	for <webhook@archiver.kernel.org>; Thu,  3 Sep 2026 10:07:35 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.4264.1788430046604968541
 for <openembedded-core@lists.openembedded.org>;
 Thu, 03 Sep 2026 03:07:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=PkCI3MEZ;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=37067ca2dc=ghanshyam.banaitsanjay@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68392Rdd2571565
	for <openembedded-core@lists.openembedded.org>; Thu, 3 Sep 2026 03:07:26 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PPS06212021; bh=lGq2TzrpTjYK499jKDtG
	QjmSfKv3hrz08OMI88V7poY=; b=PkCI3MEZe22iGqe3ba3s5VFBKoxAEbYSWVuC
	8awFgfFauyF9UtNKsqPwl7yjSl/EtYpW4GYmg6cRGEs9d6osIOnZZaWZ1eHRqhAT
	b2w0apu+69apTKI7haNGSMWBMwrxTMQKg9KEv42J3eBDywOF2BqoR+LfuKbx5XUM
	5JAqKJa3Zt1ihH8wm62Ug+VWBkNr5Xg2hvzIHnDUVEYoJ2YdpjHSytKAookj9Z1q
	9MwL+1cpIrmwrXLgBz8EYpwN7TQKO74EcgmVu2cuz74VHQFx3bkdM6pC07iNtOaT
	nno+JftU5XOTrndgzGdsRccQKPWx6GcF72TK4PsQu0zxtAmgOQ==
Received: from sj2pr03cu001.outbound.protection.outlook.com (mail-westusazon11022088.outbound.protection.outlook.com [52.101.43.88])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4gf5qsg3k1-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Thu, 03 Sep 2026 03:07:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Z2e6D19rxQlCO8H0lLo7CAZDoFtphC1jVCHs5ntXCA7g+w11dFzQSzudUrZwTiZHyCfkrR8rAaQEJ4jlaENpMj4M7ckSLjau1RRAsk/DeI6P+g0hV8OBl4p1brl8zrg6Rl1TEdIqVWYJOhdc9w+uqeG4g0nFSyCGKeLBghMQEipFBAquoPnahmuBX7GqwrzoffKSdmBV2SLrupMp9Yz4u6KmfWdlHGyj9qeFdx1o6PIk56pnUSnLdRr9570Ggv6M10iLMaiy9HvGXINaRx6x6tVMs4Wd3ugcU2q4YwX+kIfedbwEPpmtXwrKy2jb+Z0p6pxLdAU5GA6TbH8rLo+PRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lGq2TzrpTjYK499jKDtGQjmSfKv3hrz08OMI88V7poY=;
 b=iryDRiJ0sr4TRanSf/ZTCOMe/5OUrfV1Gve3tjl+2iuy6Dk/UsO5/nctU9U7Dp1lqqt2o8WNXc+jO/cDFaiXMF2QFn+5xlegRqY7+xQyOeH/pfPjLX+1GbRLgNALSqEMvAhx5YeI4NwUXGMkyIA1Txmby9fTYU32La/hTmaM4Ivdpah23yPUZrbsA+ZCtDbF8aIalLzvraPHVY4SiGAEIkrO7UTxSOVPD9pSehDgNxipXOdwVJ1NjTCSpbF7R/XfDNfIVLV9E/ej3DU0L0V/FRjmZwsdLNOyBCx2bHoWHMIXqBCIFz65tHY9t99dgrndHcpOiyFhGUzt1iuw5A3QqA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from SJ5PPF57F27BA08.namprd11.prod.outlook.com
 (2603:10b6:a0f:fc02::82b) by MW3PR11MB4539.namprd11.prod.outlook.com
 (2603:10b6:303:2f::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.13; Thu, 3 Sep
 2026 10:07:23 +0000
Received: from SJ5PPF57F27BA08.namprd11.prod.outlook.com
 ([fe80::68e:cafc:75a:3e02]) by SJ5PPF57F27BA08.namprd11.prod.outlook.com
 ([fe80::68e:cafc:75a:3e02%8]) with mapi id 15.21.0360.008; Thu, 3 Sep 2026
 10:07:23 +0000
From: Ghanshyam Banait <Ghanshyam.BanaitSanjay@windriver.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][wrynose][PATCH] libssh2: fix CVE-2026-58051
Date: Thu,  3 Sep 2026 15:36:55 +0530
Message-Id: <20260903100655.2460077-1-Ghanshyam.BanaitSanjay@windriver.com>
X-Mailer: git-send-email 2.40.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TY4PR01CA0029.jpnprd01.prod.outlook.com
 (2603:1096:405:2bd::18) To SJ5PPF57F27BA08.namprd11.prod.outlook.com
 (2603:10b6:a0f:fc02::82b)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PPF57F27BA08:EE_|MW3PR11MB4539:EE_
X-MS-Office365-Filtering-Correlation-Id: 80e4b31f-7cae-4d37-44fb-08df09a325c8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|376014|23010399003|52116014|366016|13003099007|38350700014|10067099003|56012099006|11063799006|18002099003|12006099003;
X-Microsoft-Antispam-Message-Info: 
	j6d5rrAzncvd/tIohWa+xUA9piJ51AjvbEpF3KmvSRoiAT4ZSRvUczN+hPezlTv1H1bT5Is7s+KkoUfM81T+ypFNouRJ4KChBpX6ZD1Uj31S3R6TKiKjlIJHlO4c+zKTt8paHVkK1kDsO4EA9apJyFzYLnvyAsX5CuQtiZg8tytNt9DvNt7q75HArmZ5V/4T4vt5k4IW0rW7zGWUEYvBsYudGVDvqq9Tf91xS4ModOzxvqUPk8ffHIadSHGd8KfIilRiMaZfbF9GPwrObPE8raAcuwo6psL3gwk1HODgLSRlFZlEVLBuRhAwS9NZ2x5Alezu6SYQ+XInH2rcNsaLrD/W5UYEI//ULVfn2GhLJ71Eu6Zkr+k+XcDG90U2BFBM5LKnSzpxCRU6gr7RY9KLrOKGdKZKjO3eZL5+5WGG0qG03joXhLsYvTDPhRfTDHzh08DNx8B0yTsvT0WyyF61l3dHSY4sD1GyVcwmLZXpc92ouxBDVw2/p6lBmnAwgOKvSJbt0bC3mFhe8DtYd3OOTF3IjtKY9gZYYZ4wnzDITwhT82wg9aWlvDkbnnBOVfCQdtpJb5q9YcZZ2gUMr+MQ08qQXoFOqvqecGUCRCycc0nQgW3WTZrZ+TqXdZFTM6hn2RrthbGEWwg4f0mBcAlmi5QTNUiuETYRIHxirzWyF18=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ5PPF57F27BA08.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(23010399003)(52116014)(366016)(13003099007)(38350700014)(10067099003)(56012099006)(11063799006)(18002099003)(12006099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?7S8Z1O0PQcL8alXb/dd3WHzV1GcazaWqy8rcoXgBLhun12my5HnZdejS8L8s?=
 =?us-ascii?Q?QB+x6Q/ZOnH+w6azEUsTIU3vq6+CWB3Jsevmk5J6UonTeJ2ashbmwD5XG9aS?=
 =?us-ascii?Q?RkH0sj4diAZt/eJr4szJ3DxM3XoFKY0QBhp1DhFyi4N4UL9cesQZP7G06KzM?=
 =?us-ascii?Q?yMRVQieH2CNUQUY66Xr6SiVMpOnnejrcZjO5aXUiSienu0YYXnvxgrYI3i4C?=
 =?us-ascii?Q?j8VHEtUZ2xSTW1hFZKFKVsd83bl+FeueqXIql2YVmCce5kdtD90kmNsvAF8s?=
 =?us-ascii?Q?Q7fFiwzpTPFO4GPoM4shP+x8HVlSRpUektksiJ29NuX1rb9CekZgg8TfBH3K?=
 =?us-ascii?Q?/TJstFoM9iaH+wIhbfyr3pEfKiwVnHuSuN6BedOzPR3Fbo29omhcNFvAjRfc?=
 =?us-ascii?Q?RL2YLdAm77qOugpfMZFIZqiXBQyuMISX2PEQNSVBpj+y2DAwhM4AVSylnKN6?=
 =?us-ascii?Q?WbCNSBjiwLHXAatKHfj0ezoh+jynhc65xLLZ+noTL/bYdxAW0Y4zx3yKW3uR?=
 =?us-ascii?Q?NdKeIh0Vj+Mg4eXlUXZbrgfMKM2vCXwBBOdxNH5NXQUiliKgZoS74ADZoSZ1?=
 =?us-ascii?Q?Xsx+RspumlgCxUENtFogX1U7Ru7811kuMRtrwvckCJsUkX2+b0Wf+SqlxCbB?=
 =?us-ascii?Q?gh+GZSdEJ5ssTWulOkBD4T5L/v/y9fJDR9QEfzXLI7+nAfsXAxeBb/EO628V?=
 =?us-ascii?Q?03U4IlnCxg6jfHrrJI8afPsq2PJRWskKeC06oegyHBxNFoJudF1HUgn2Gf7Y?=
 =?us-ascii?Q?opR/V+NH3vKIFhRsxvVLdVDTTa0ZayFIA9kjr5r6kILLWmEP3t9+gLokVPbD?=
 =?us-ascii?Q?XDW4qu37PX1HnLg053Kt0dPWLQj8BubtClrkVjKOk/ZcWGQJam6LV5okh9Uo?=
 =?us-ascii?Q?epgH3ATYvjByEfP8w2zIy2mb1y9Zw4+VsCRn/d7ffKNU30M9OYlWIA8RI2Yh?=
 =?us-ascii?Q?T4IODdYAqlW0Lm4ygwiZ9KsMJZ6pMCxLcB1rXBdLniIVUdMorHlueCE7aSy+?=
 =?us-ascii?Q?xEvTOvL4caAmy1LCCpGgHpB1CWwTor3RysK8blFu+SzFzAOYOMkXcnVXA/Cj?=
 =?us-ascii?Q?ZbFPBIsn8oXK6JrGbTud0r5TlaIB7ChkLYfc+/lNM+Gb2ckW/RWwmBPJUWS1?=
 =?us-ascii?Q?lhGzr0mnQSRtccEY26Wn4+3SaPe1mFKFHwnbBBPBIBy39hiHSHqcjxlYFWXw?=
 =?us-ascii?Q?EMbY6TulBiaYvbrUmLo4Etq2SohkH0ri5PuPyfD6yqrDOEJh1OfZ2zHmNXFd?=
 =?us-ascii?Q?/3wxDfpiRloQr6aeBxO5OeqIMjV5NiMYXVsS6NQwp/6zbTm6o8e0frJXEktn?=
 =?us-ascii?Q?gGYUbMhiO707nhNWxL+ICkU/eFlpr1wLD9zfsoxh4E85i8kzb8kJTNBD+pSv?=
 =?us-ascii?Q?iVlZQBvLhcMdoVXUKI5rGYEDx1VeiS8FTrfB67QWaiO+HvTQ33OeRpwaePjK?=
 =?us-ascii?Q?ILDNm70fPtg1vCdY/v4Eglo6lQW2sO7t59/77Z6vyqsYigQlrlpvB5yBO9zZ?=
 =?us-ascii?Q?0emNKUEua3wCv0badadtkhetSA2h5SeL6AkbOID355GXleng1wNG1OOcVq/e?=
 =?us-ascii?Q?YZ0kSxlchwY4bNICgFnMa5AHJ5vq5psGparMxTxrwJ0u9YME4RwcBOFzONDr?=
 =?us-ascii?Q?F0BS3P6fn5FO9as0H+TVpkow7d4vNL96sU1zWmb/O1IqSF93u0+PgSOfjG2j?=
 =?us-ascii?Q?dPhF1xrzmQpIxcAnrfSySntNZdMv8zBGkJbR6LxAXcuGX8rGwpyZO/SFcyiC?=
 =?us-ascii?Q?kH0tfOmPZJEiWr904Vw3qjXoy64S1ui0KsgLZYa7zuzz10mXoNdj?=
X-Exchange-RoutingPolicyChecked: 
	EVYjZk6Ba8knKRP9zQRLD50CwKtvR6w/Gsy7fCPaOGSFJwxtonswZjRaEsZUDbyz8g/ugCOLWDp2eTiOOtrhVWeOp/TBO1Qr77UgyEMXfu8RFIIjx+8i+32OvoXuuMxCP/TysdAWUvXMYTRVx1uTyxljoaEc4x+IRU21305IV4Gkj6CfblfArzaA+MH8JIfo7j66MVfE1OF5OwJT0YDN0C1ZCAiH6Jx1PDxRVI72B9zu/vRiA+wjpfnZ0uDFdsK73F3bmAvW/1R4M05F/ozdKz11M9l5laaAeCSshGQeEvP8uvt9dtCGP87exnSTroLO+SxDA2BX+zbVJVYuFex7FQ==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 80e4b31f-7cae-4d37-44fb-08df09a325c8
X-MS-Exchange-CrossTenant-AuthSource: SJ5PPF57F27BA08.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Sep 2026 10:07:23.0504
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xWRmnQOGNwobr5DN/7c5zk7upgSp/jSFD3UzNMru30kr5Ve5M5GjguGFf+IdoULp6hwyaEyR36J9TzaAJ4qgnPmcsZmfH0E/3EACLLAySgAx6HaCNG1nUfZQyKRdGudi
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR11MB4539
X-Proofpoint-ORIG-GUID: d8sMCbtG1vXVIEgUde247ftGpw9uQUwE
X-Authority-Analysis: v=2.4 cv=AMY1HWas c=1 sm=1 tr=0 ts=6a9946de cx=c_pps
 a=R/EmBLgrFYJi0SEZwJtDOg==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=VdqzKS8jKosA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=iKiJcTA2PjBS6x5JeXcw:22 a=PYnjg3YJAAAA:8
 a=NEAV23lmAAAA:8 a=oeppcwj8AAAA:8 a=t7CeM3EgAAAA:8 a=aV93AJox-TxQ-MY7focA:9
 a=EbX5vdCAct3xugfmopdr:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: d8sMCbtG1vXVIEgUde247ftGpw9uQUwE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAzMDA4NyBTYWx0ZWRfX0qCZoIhoywzS
 rPmdB/8GFnxR3L7wC/49WNlJaCGe5S/2uG6GKM7ZGFnvIOIcdgzjbz/1U1gW3IhNs8hotU5mMNZ
 J68cfYj6IzZq6mkFY9SskILseuUItHgDwIKHyILNAnmjgCLlREqNFNFTY6iA8bdnHaKH1dv8Zqh
 h0WN9VkdZF0N5chWMyyL80AlyPTqmiATDN4kwyIgH5DqQurYRgoX1AHbbDjJsvVACjHUfBueE5M
 GW6yzzsd1GR41t7wutR3AtvgjmrFZEUdEBMB/G7OWeH8FHFZu/dkn+WotX9GW0xnBpkhmrEa76e
 CC2AKmjNLGLUTWFtcECym++IJ0iUe/T/ZcRxPsiWXb0ayU6MeL+Ost6trKQrsuvcc8WH7PbRks2
 bmjSpNZKYso6ls1Xq5zL1YE/31k/qyeOjzHuq59NRm6gxQBT2IV/7OwHXC/1PaCqJcqeDJukbOA
 2ihiukYV3cH+5aXNZZg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAzMDA4NyBTYWx0ZWRfX7hU5iTwQS3PY
 342wW1E+A0u9y66xO+6AOR2IXecwpWKFtitmKzQ+Qm+eF8X3iThyU2My4AFhlV2gw4Crjkfr/BW
 EWUX6FLhU5kEo7QGGUSmIQexRFMGel10n7jdWfLQ0bCCHJia75DS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-03_02,2026-09-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 priorityscore=1501 suspectscore=0 phishscore=0 spamscore=0
 malwarescore=0 adultscore=0 clxscore=1015 lowpriorityscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609030087
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 03 Sep 2026 10:07:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/245024

libssh2 through 1.11.1 grows its publickey list with SSH2_REALLOC but does not zero-initialize new entries before parsing populates them,
so a parse failure reaching the cleanup path leaves libssh2_publickey_list_free operating on an uninitialized entry.
A malicious SSH server offering the publickey subsystem can use a malformed response to make cleanup free an uninitialized,
attacker-influenceable attrs pointer in a connecting libssh2 client.

Reference:
https://nvd.nist.gov/vuln/detail/CVE-2026-58051

Backport the patch to fix CVE-2026-58051.
https://github.com/libssh2/libssh2/commit/a9758da45a52bc8c630ec9493804d0c6ea30b24a

Signed-off-by: Ghanshyam Banait <Ghanshyam.BanaitSanjay@windriver.com>
---
 .../libssh2/libssh2/CVE-2026-58051.patch      | 34 +++++++++++++++++++
 .../recipes-support/libssh2/libssh2_1.11.1.bb |  1 +
 2 files changed, 35 insertions(+)
 create mode 100644 meta/recipes-support/libssh2/libssh2/CVE-2026-58051.patch

diff --git a/meta/recipes-support/libssh2/libssh2/CVE-2026-58051.patch b/meta/recipes-support/libssh2/libssh2/CVE-2026-58051.patch
new file mode 100644
index 0000000000..20f454a304
--- /dev/null
+++ b/meta/recipes-support/libssh2/libssh2/CVE-2026-58051.patch
@@ -0,0 +1,34 @@
+From a9758da45a52bc8c630ec9493804d0c6ea30b24a Mon Sep 17 00:00:00 2001
+From: Viktor Szakats <vszakats@users.noreply.github.com>
+Date: Mon, 29 Jun 2026 19:12:21 +0200
+Subject: [PATCH] publickey: fix potential arbitrary free in
+ `libssh2_publickey_list_fetch()` (#2127)
+
+Due to uninitialized list entry.
+
+Reported-and-patch-by: Behzod Abdullayev
+Reported-by: Sharique Raza
+
+Follow-up to e15f5d97a04cc676ce117dd324fef85b046207a9
+
+CVE: CVE-2026-58051
+
+Upstream-Status: Backport [https://github.com/libssh2/libssh2/commit/a9758da45a52bc8c630ec9493804d0c6ea30b24a]
+
+Signed-off-by: Ghanshyam Banait <Ghanshyam.BanaitSanjay@windriver.com>
+---
+ src/publickey.c | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/src/publickey.c b/src/publickey.c
+index b7f384310e..a0d3100005 100644
+--- a/src/publickey.c
++++ b/src/publickey.c
+@@ -905,6 +905,7 @@ int libssh2_publickey_list_fetch(LIBSSH2_PUBLICKEY *pkey,
+                     goto err_exit;
+                 }
+                 list = newlist;
++                memset(&list[keys], 0, sizeof(list[keys]));
+             }
+             if(pkey->version == 1) {
+                 unsigned long comment_len;
diff --git a/meta/recipes-support/libssh2/libssh2_1.11.1.bb b/meta/recipes-support/libssh2/libssh2_1.11.1.bb
index 52684ae74e..3c72f844ad 100644
--- a/meta/recipes-support/libssh2/libssh2_1.11.1.bb
+++ b/meta/recipes-support/libssh2/libssh2_1.11.1.bb
@@ -21,6 +21,7 @@ SRC_URI = "http://www.libssh2.org/download/${BP}.tar.gz \
            file://CVE-2026-66034.patch \
            file://CVE-2026-66035.patch \
            file://CVE-2026-58050.patch \
+           file://CVE-2026-58051.patch \
            "
 
 SRC_URI[sha256sum] = "d9ec76cbe34db98eec3539fe2c899d26b0c837cb3eb466a56b0f109cabf658f7"
-- 
2.40.0


