Return-Path: <yi.zhao@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 499F5C8303F
	for <webhook@archiver.kernel.org>; Tue,  1 Jul 2025 15:48:01 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.524.1751384874846141570
 for <openembedded-core@lists.openembedded.org>;
 Tue, 01 Jul 2025 08:47:55 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=927761a2af=yi.zhao@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5615OYb0004027
	for <openembedded-core@lists.openembedded.org>; Tue, 1 Jul 2025 15:47:54 GMT
Received: from nam12-mw2-obe.outbound.protection.outlook.com (mail-mw2nam12on2040.outbound.protection.outlook.com [40.107.244.40])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 47j5m1b8t9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 01 Jul 2025 15:47:53 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OUiCFgBEb56el1kiR/1Ix8/D4qlYEQNvph3TNOGoAA0lwikNQDIGuAaUznFnbXnVcIzhZY4dbYa4DgRSjY686zXi3545Y68eCKRIA0G9ZtvFQRvyBxuHB+FyAbFRvrWZvXilR3eQJY0H1kuGX77bHoDodJHl0Ml9KIWj4ewEupngWfWPRSz+CYHfcTzDvRyUsgOGN/EWd/x+0T31ntsJtkqzuehKciBK7WnlSsRljY+rWOp9wi5KMF4u+2W4HBPONX7zs089ApyQFRRO+l9uGOE/SUrFV1+7IWK9LvU0H6YjzLd7hpT3lpTr0w9ErrQRuFzpmyufy3UDybx+YY6kmg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8FoDQOJybMUetasaXIo9WnaShsHtlID9Rk7CTQEZL50=;
 b=Dal79BLhDUpzX8n0byj1jbkroTAs63nYRq5rNpCKyd22iCBL4QCVkr6xOpzx0iwDB845fnpR7WD2MDvwRd0qQOAklcG++OVlhBIbiBS6fsny0bxFY480FkC/SU8UHeQ9O2rXpy4uwx7UcoA9xErGrZOMHrd30UCzR26UGwRLpkRzhA9QTVoyGhTCo0J4DTL7dtlpSQKeBjbF13Oa3ZRHT6vTshd5pa0KTesaC9yTmECEhY5EgEU+KD/24R+vizsKMkJ1fQrv5K1XpxobKdOrTHLQ6KYfnkvFaXyZ7ZlUF89XP685v2Gyz+Yzad2HzA9BqcNE/+2J94UO0y4i3VLcug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS0PR11MB6399.namprd11.prod.outlook.com (2603:10b6:8:c8::5) by
 DM4PR11MB8130.namprd11.prod.outlook.com (2603:10b6:8:181::8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8880.24; Tue, 1 Jul 2025 15:47:52 +0000
Received: from DS0PR11MB6399.namprd11.prod.outlook.com
 ([fe80::2b44:787c:e7ee:bfad]) by DS0PR11MB6399.namprd11.prod.outlook.com
 ([fe80::2b44:787c:e7ee:bfad%3]) with mapi id 15.20.8880.027; Tue, 1 Jul 2025
 15:47:51 +0000
From: Yi Zhao <yi.zhao@windriver.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 3/9] libgpg-error:: drop -unknown suffix from version number
Date: Tue,  1 Jul 2025 23:47:25 +0800
Message-Id: <20250701154731.1465906-4-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250701154731.1465906-1-yi.zhao@windriver.com>
References: <20250701154731.1465906-1-yi.zhao@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SEWP216CA0090.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:2bf::13) To DS0PR11MB6399.namprd11.prod.outlook.com
 (2603:10b6:8:c8::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB6399:EE_|DM4PR11MB8130:EE_
X-MS-Office365-Filtering-Correlation-Id: 8eec47af-fdb7-48ac-3c50-08ddb8b6a2e5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|52116014|366016|1800799024|376014|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?NZGFqjbNKbMt/fPzAfSE4tR0aPaEeNXRmkIFSlNXMCtv5jGkxkXJJykgcFIn?=
 =?us-ascii?Q?nCd8aYZQJ3Te2P82X1vShegVlOPzp5JJL5m4/vFVcuZvejEd+QVo40pnqkHQ?=
 =?us-ascii?Q?tJZx9MPLBBLbxF0RkjgKIh+77R4Of9eXuPApbNakZ8qRNnpS85tVaMGvr5Vz?=
 =?us-ascii?Q?Nc7X46y/ji0bb2z5O6x6Kw7avq5HzfjBtK5nkpUIjlXnnTwxmKaiz1p67iwX?=
 =?us-ascii?Q?dBZMdHqWT+XlWmbY0Y6VVaHNeO1DwvFAgnYPCmH72TIsZVvM7w5SWL/4w3BB?=
 =?us-ascii?Q?qKNsN9ZZ+8NCXMRXXp4N8iGAlFjc3ghLUDoOuMbtkUSd7ee9N1cxx5MsUfza?=
 =?us-ascii?Q?R58W7RRGuiqqdnFet3LzCVQWHB3l766wn/skJZhR7NW7n2fac57c4mYhpa9v?=
 =?us-ascii?Q?7xlZwrhmuk4k2cegaZhziazd4GbDSP0cc4QR6De8wwhB6am3xjrbEeCUPolG?=
 =?us-ascii?Q?Dfg0I3at7f6FYjTXePQ36v/NV3liiopDHjJPmlmij2U8oqFEER/572nzObkq?=
 =?us-ascii?Q?mnz7QX33KdywSIcFGKGi5A6VVYAMsZrHGHZEjv6D1/PVEU8BsnlNJajlkueo?=
 =?us-ascii?Q?kWSdQLt6Wp4BqO/KJyEKhW2iVdR1nYKvtGYmEa1gFKFKakKUCGx7QFDbURhb?=
 =?us-ascii?Q?vRISRH69KO3Lf6NUiiH33Xatv5upF4RNNZ7PqHXeRlGqIXImK0c6wxQCO5GC?=
 =?us-ascii?Q?o5nmLqgjPwhbccZ7MkEpv8KvnW5zB6122bmF4/ko2IxluoccJXcoxmRpCbSQ?=
 =?us-ascii?Q?dkDZSMQ2eZLeWNDIffexAhvkmqZ6ZVRwMOOB90dBcB8asqUDcfHMNg0hu/2u?=
 =?us-ascii?Q?SdXOgSYAUbZRroPOAiRgRKfNjImXF1VEfTtc183i51YHc7ryJkXPEb9vCyln?=
 =?us-ascii?Q?M66XOd4IQIL0uYQZEbNHamM7j1xQ/XbePKur4MvwoUEBEoCn16Izm8N7NRO6?=
 =?us-ascii?Q?LP8o2ArLy4ZOyGRnNuSyWS7E7zGLQeqOEMn3CCpnijTd1pvmhRaJ9r1tDQPT?=
 =?us-ascii?Q?98JYqHg/NghrsZGZCj0ojE1XN/m7OJ16bhCRVYYU/BnVnud6JCG27ltvIEbr?=
 =?us-ascii?Q?by5nMJy0+IJcmZ+JA2yxie31ohuQMULXDDxaoU+7q5imyqOevJbtmKtJFPMt?=
 =?us-ascii?Q?qN7ZehzZfFGDhss05thQGHEcqYytKBaiB4dHw/Hq4ytAN9l6Zzq4xZB87DJ4?=
 =?us-ascii?Q?ciGfJbX8/WQdpZZDs4FoEKpOHFFboy35yF9s0a2027Mog7ioHpfPS/T7M/r8?=
 =?us-ascii?Q?QsBcbCS8+nrdOo923Y7GMLD7QQ/uNsP241AGH0S50okoVHohG3n1W8NDGmhS?=
 =?us-ascii?Q?y0EEWUL+OIFmQAICBqU4ylNOeVqmUCkwTGDIteNz7tsbkH7Y/io1rytyMjBD?=
 =?us-ascii?Q?XYIC5Pisjm3Xs7PlL3fblnEBXzzb9GgUJ/ya2+uxbD0kDzsl4qeZwGesewXd?=
 =?us-ascii?Q?3UP3ECsXRobA84s2XzZVW+Ekr5YQvenA3YCHViNek+ojzx1CJD4pRQ=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB6399.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(366016)(1800799024)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?/S+gltoksxdoqBSRkgdDZRDxtNq7aq6xhLywsRA6hU4deHkmX8c2YVXPsjUI?=
 =?us-ascii?Q?kaKWLx9mPjWLHNzBOxBfJHVGGBcyIemaJeShFVR3Ggd14udu2EvPaZtOn4zS?=
 =?us-ascii?Q?vcuYmN3zY3NfyM0nvGep1AiAyUDEBvt13M6T4ArEqONhzlMuJ5lIfC3oqLGN?=
 =?us-ascii?Q?BCoGCGbJDT62+bTmT1iTuxst8qHdYwbjVKNmeD43yOb+jGqDCCWFUx+VmTyG?=
 =?us-ascii?Q?g58Fel9b7HZyrSKDpDtsYIsNhNayjPUImDMauQANsDMARG/hRgq4e0ynpSRA?=
 =?us-ascii?Q?LIHlDJWM3jdvVNv0tFQqgfIM+NUl+AVGOtAZw+SS2B7prvCE/+vsG1oYI1u+?=
 =?us-ascii?Q?0HrzqODdNuQOg2OV3BYu73NbGFlVLyKr2lpw/8kyM82nHQhX/ouGHvNz872l?=
 =?us-ascii?Q?umGOgz2ulOOuPsf3R/R1NwiD0/LmPfGtHMEJCjd4Z63y7GEuyMqz8Yem0UiV?=
 =?us-ascii?Q?hgKrQre7VsOkOrnjRT/nnZGjj/THqV+PY9Ns3OyppEf9WoR840/wfVhm3rxg?=
 =?us-ascii?Q?e9AbAjr1Z7zoV3h//1kRTgDdXca6QK/Ivh3vtXekjvcE/wpGsXDVBtAVd9KE?=
 =?us-ascii?Q?xGlSxiRT0ghdTtFWg1Z74CmYq1LPoF8k8d4FXOd7XEP2Sj0OP2aqTd12Lb6J?=
 =?us-ascii?Q?SBIL+0ySNX79Tq7GHnLRPUcmUNcA463wOZTvMhc1xci9cIzdNewUJZKWd9wV?=
 =?us-ascii?Q?VaD9OlCSHrSdSPEKvdlvIMduaCaEwG/XMS91jmep7DqDg5i5Xakf86lIwXa8?=
 =?us-ascii?Q?sHWtH0MOuyM1rElGxzkIHTXW36oxW6NyCY6KiVpI3oGUbrJc/3VmSyXG9zPS?=
 =?us-ascii?Q?7n1BMWv8RVbiYJTAAA61Koat+Aczf7idnMAxPwyH5lhZi+FcX/kHC1LDkKaG?=
 =?us-ascii?Q?Xe/vhw3SahsJJS6SFz+GvXAXyyW+QUNSl8HjpqzHvZjzjsg5vVWIti4OmAiu?=
 =?us-ascii?Q?OJIUDPhZ3KsRwbFRe2IZIEU3Pf4r1PlJKaO1nRWYMlvCIjcM5h0sAaw/zHb2?=
 =?us-ascii?Q?kYV9Et1hu6w0xwafCK87trLSzMt0HmQkfnHV9Pa1Jh0iYkeD3Wt2PR0b3Prs?=
 =?us-ascii?Q?/t44+6nPcK3PolBtI3WrhWGMcxE8TlJ7fYDEYuUbdYgNu9ay2zYnJJBL1eF+?=
 =?us-ascii?Q?kXdl3++X2HRGGtiXJ3XOlqiEIrkPeC5Gx0E6KhHOF3BW1ivM46cpajHSTmHt?=
 =?us-ascii?Q?zjQjoUqH3MSfpFsiBqpbO3466Rl4YSQsMQx5U7u9FAwVMzBz1W61iL+qLXW7?=
 =?us-ascii?Q?R5lGhfDdsu5rcldRaVPoo9xTyoy+IyPM4kFPZ9wDDpm6ZRoI8OdVdz1iP43v?=
 =?us-ascii?Q?fCIm7U44DLT0Ehptb7JlP7VbUcSH/UIqtTvrVOBA0HM0OKSTYHWxb3jTHPko?=
 =?us-ascii?Q?LTUrHqv+ieLAtS+fp6RP6VivZukb5UNjcZPseH7F/ZmMAzzF6DhE1q6Woxqw?=
 =?us-ascii?Q?BiaygQNF23hsvsHzEZ3f6Qkm660iFO5tR4L4H7GGG3bItk0y0v2fXlWHo0Db?=
 =?us-ascii?Q?VFPzVfspO6ICjTJMbJxhDYHWSVy+Ip3/ke52VGWOGaPHE+lecqgxz9ydhAu9?=
 =?us-ascii?Q?mKZW8bCqSkwoALi6kUTYPEZpVhrnwyo1aXY549Yc?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8eec47af-fdb7-48ac-3c50-08ddb8b6a2e5
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB6399.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jul 2025 15:47:51.7550
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tTLWIn0MDpS51QiBY6KvXpXKMEkkL3iXCekFuhZR/vUxpNptyL5T/1fK+8L3ZmSw5RXztWr6TaJJZCJfpjkeNg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB8130
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzAxMDEwNiBTYWx0ZWRfX8eE0I4QWWuoe C0TzOJaFThA6ubG/IB3l3vIoiQIXhhSs39kc4YhTVfxvurihQ/BAJWaa6LJxl22jY4/ytLN0SQG TUavwDNol46Oc5RcT3T/3jKBjN0j8t7d/lY0tMMX7SyLrsXC+0W12zZmnutrO3e3TYHuEFTKy8K
 7gZd8KDjRMIS13Pj0O7JMZmPh4ciT5xyVTcUym0vcS6m5ZuzpgT1RF5EwHuDT8coLNq+63iDb2F dqDEcJyF3t5WhfOy2W9f9lh8RGdlx2pmRE6J7EA6qCBZLRVOFQikcibi3KWrN28iJGjtsRiVSVp MQbC/BtQ/dzr3BEakgwitRUgRnRbASNYu1UpbR/s/oZ0PKnjjuHJVdWTVVxwBd4I6g9tE3DBFrB
 jD/z/gw04BFJqdb3efDSzl4WZKCQicXujedASbrKYnNegnKSnZsg7Jf1nzvWYHRRzb/NUVG8
X-Authority-Analysis: v=2.4 cv=IOsCChvG c=1 sm=1 tr=0 ts=68640329 cx=c_pps a=mi3bKrpD1VGuQXVfC4HZlQ==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19
 a=xqWC_Br6kY4A:10 a=Wb1JkmetP80A:10 a=t7CeM3EgAAAA:8 a=YiRakp0qnORxFgeXCpYA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: 26olfFoFRlvjna6slDtkquuMZk2NnMTi
X-Proofpoint-ORIG-GUID: 26olfFoFRlvjna6slDtkquuMZk2NnMTi
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-01_02,2025-06-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 clxscore=1015
 priorityscore=1501 adultscore=0 spamscore=0 mlxscore=0 lowpriorityscore=0
 mlxlogscore=615 malwarescore=0 suspectscore=0 impostorscore=0 bulkscore=0
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.21.0-2505280000
 definitions=main-2507010106
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 01 Jul 2025 15:48:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/219591

Inherit drop-unknown-suffix to remove unknown suffix in runtime version.

Befor the fix:
$ gpg-error --version
gpg-error (libgpg-error) 1.55-unknown

After the fix:
$ gpg-error --version
gpg-error (libgpg-error) 1.55

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 meta/recipes-support/libgpg-error/libgpg-error_1.55.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-support/libgpg-error/libgpg-error_1.55.bb b/meta/recipes-support/libgpg-error/libgpg-error_1.55.bb
index 842f54b0ff..ab10b91e82 100644
--- a/meta/recipes-support/libgpg-error/libgpg-error_1.55.bb
+++ b/meta/recipes-support/libgpg-error/libgpg-error_1.55.bb
@@ -23,7 +23,7 @@ SRC_URI[sha256sum] = "95b178148863f07d45df0cea67e880a79b9ef71f5d230baddc00711285
 
 BINCONFIG = "${bindir}/gpg-error-config"
 
-inherit autotools binconfig-disabled pkgconfig gettext multilib_header multilib_script ptest
+inherit autotools binconfig-disabled pkgconfig gettext multilib_header multilib_script ptest drop-unknown-suffix
 
 RDEPENDS:${PN}-ptest:append = " make bash"
 
-- 
2.34.1


