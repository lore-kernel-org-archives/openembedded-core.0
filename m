Return-Path: <Qi.Chen@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5454CCD3427
	for <webhook@archiver.kernel.org>; Thu,  7 May 2026 06:20:33 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.6087.1778134830956099974
 for <openembedded-core@lists.openembedded.org>;
 Wed, 06 May 2026 23:20:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=Xl86tOK1;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=9587885fd3=qi.chen@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6476I5Cw3915700
	for <openembedded-core@lists.openembedded.org>; Wed, 6 May 2026 23:20:30 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	PPS06212021; bh=gRJMS5GL8isXRemvDkAjKM+VVe1DVLmh8xd7ScAasx0=; b=
	Xl86tOK1pPTzRirQ1XPtA1zdR73Pdgh3B/p2Lc1aWrCUjPfzcUYT9v75STyxHszo
	7PN/0ilt8Xek+QE5xF4+b11UedTnW8rYOZSWbZcEP9+mnOVIpTZWzXxOIWeCnfvH
	O2e5SX0AIkgsBbzuUHENy4OdjN5qZGuRNU82HzKm5O2LwUX1MpsDyRivuhlJfGQR
	+R+xeCCXpMdfrIjAwC43wSw7aDEUneV9fCqiGXsgNIUp4Val3mKt488rf2nRY0jN
	+2h/D+R5IsyRSB3+WOy0/XGsxZJ3V5HJZH0M23HqNeRViOxiUgstNrc2kCvQtkSl
	Jq3tzwP+HPgK1pZanCkCJg==
Received: from bn8pr05cu002.outbound.protection.outlook.com (mail-eastus2azon11011038.outbound.protection.outlook.com [52.101.57.38])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4dwgsddsuy-2
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 06 May 2026 23:20:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HRCcCVAAR7RO3zBOh6XT6QAVq8MrRwmTV5rTNs7ib6DAEOJoZZXC7jjs9c+ZDtZCS0nGrIfeu4yxvIdbl25SqKj1qFw++yJQBtF4tOALUiqteoWXD4+zT8hIlzuY5b/k4Dv+m6GbGo9UINUtT2QSiLTfce8aO9LKpNjvkbww04/vLRFCRqqj4diTQ7IKZcnEjZ8xFh3j6F0IhjSeCPkRyVi6DNxfViyc35g1zmBdpQU1QkKyJLePSr4tEw3cFp1IBU3MRSHThPQ3hHgJBb5nJ0wC2D1R95Exj2xD82BYHYe9UuQQViRA0KwUnWDIiFM4zELsv3UdDY/RVOYKU1Ag0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gRJMS5GL8isXRemvDkAjKM+VVe1DVLmh8xd7ScAasx0=;
 b=DwMhe511Lgt3Neg+Qm/RZSPBhUeOU3f6S5sdRcBhn0Oc0LS+sJIQlP24tLD9B7eW1jXCLdiBiBfHLmZ4ZUY6DL/a0Bw+6mMwV4u3uEys9c2+lJzlh0n9O4m/1bITVNcG3Ps64Guz2qcWt1oBp69WfOiFqXaEZ5dj9kaWp8TI4pEBYlKleO+G7XOVdUtN5UtkTDgm7GdmxjQ54PnI7MnOVriz3s9qpfNU4YmA6l9d9ddFnidaKCnAaozU6muoW5sxW8U+daRWCBYd6up8ENstUiABXwx5AaMx5PTGZB5l/GGyxkQ7HhTEMpfECuDJEeOXjZQYvbxX5W8p34jZVO+oFw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO6PR11MB5602.namprd11.prod.outlook.com (2603:10b6:303:13a::5)
 by PH3PPF383C22AA3.namprd11.prod.outlook.com (2603:10b6:518:1::d17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9891.15; Thu, 7 May
 2026 06:20:28 +0000
Received: from CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::5ad6:8f90:b01d:2c62]) by CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::5ad6:8f90:b01d:2c62%3]) with mapi id 15.20.9891.008; Thu, 7 May 2026
 06:20:28 +0000
From: Qi.Chen@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: alex.kanavin@gmail.com, randy.macleod@windriver.com
Subject: [OE-core][PATCH V2 2/4] systemd: set UPSTREAM_STABLE_RELEASE_REGEX
Date: Thu,  7 May 2026 14:20:08 +0800
Message-Id: <20260507062010.1461027-2-Qi.Chen@windriver.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260507062010.1461027-1-Qi.Chen@windriver.com>
References: <20260507062010.1461027-1-Qi.Chen@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TYCPR01CA0123.jpnprd01.prod.outlook.com
 (2603:1096:400:26d::9) To CO6PR11MB5602.namprd11.prod.outlook.com
 (2603:10b6:303:13a::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR11MB5602:EE_|PH3PPF383C22AA3:EE_
X-MS-Office365-Filtering-Correlation-Id: de03318c-09f6-4270-5cd1-08deac00bbbe
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|376014|52116014|366016|38350700014|22082099003|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info: 
	2ZEykL15JPt1RepWAsy+8CK9w19UAKzId9yk/uD+BFfWo5768ReNF1PIatLLQaSm5W4bCZZC0CscMl/kn/9OVVpwlQX7lIa1mt95SS34RR3RonpVZprSP039xF2RqOUB+Ki7nv7PXks30P5tFpl6/+krrbAwTZ0OQtsn8zK/YwU+v8reCvPhSKO5l4I6mAakk+13O5VoyElAcQ0G7vl2m80v8OttgLAildzBiWYi0hbLQo85Rnh4JyHQXsDiFb9enRUvRr4NRUqul2pKQ29YFB2NpeNw1Q+Wtif7OEPyCZ6jWq+l6oX9dJTZdoKMCVQPpcEg5ul+/WSorPSCUYHZUmmr5MQfsRGXMj7FUqP9vEiUvZbWA890x5WckwjKDTVLI+Z2h2CxMSqTjS9lmQdCAzYqhAervW3RRlM5z3RWy4DkmvWc7pJgsxALXaLMKMvCl5lm9NlWJZqZVPOAHhi7GNdEASVbuj3gqJIEz8sa3PBGhqefZhQdTaEDOY2M4/h1SA/dp/OE3+9HtnWACUubD5Hq84NAQuegexjiCDjrDEEMgr2iwlcofkyC8WCJTsdmgcvUOeQQiInMCvr6u7/fFNaDXGOPDPtr2lL0Pcx7YlTsOVF2xktUFCONbyoVlVoP8yC39QMH2THt2w02NnLFvAHUla1ROkJsaW0OJJ4Mx+hl1/DTJfEHEZ1yi8yLafxWGH4jft94/HujI64G7ru5atWxn1wK9VoE2uA+FV9D2paryQldxYshv3Wk5ONAeiux
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR11MB5602.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(52116014)(366016)(38350700014)(22082099003)(18002099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?KsJTbtzWErtEN1PB5BEfb5M6a78TSGjs/4g3qQXwULWWS+teaUuZBUNlUTAj?=
 =?us-ascii?Q?Afmryepz+Kkznufg0QC1lZzXl6AzMJR8q4Fw/mn9AC3DfgytstKL2YNE+16V?=
 =?us-ascii?Q?pJcyi8A1Cj53lj5EBkdMMVQGawsT/F990PE2Y7ceQqhkE08hLxkxlSTFamqh?=
 =?us-ascii?Q?fbjEh2laCHShwaUzg8o11DhEd4Do5N+qZm08TnYeF/4TEDCFADW/uswTgS61?=
 =?us-ascii?Q?e27lZAXc1HnQ412ue0Ge+nP0t/uqbL0TEqUJR1lebW6/w1N3f17y+BfXq6wH?=
 =?us-ascii?Q?XcdGdewezZaflxfGgt1y3cr3ZazN2+kpBlLDk/2tg1Vj6iIXcslX/LBKAA7p?=
 =?us-ascii?Q?42BUk/SNLn3deoXQHYc0NHybX4rnqSEs6zIQTYOxK16RTMyg3kmibwWMqYrw?=
 =?us-ascii?Q?9ki2XtqUQgpLGXlpQ9LAvwaJ1wpX9+c49UtjJQf2AJXC3Qm7jV/crmFg96u8?=
 =?us-ascii?Q?+xscjPuounVP4W1nNBRv03isw8sqCCIcUWYAGANsu3gHVrZzwT2agHORexs9?=
 =?us-ascii?Q?gTZCJFEtMLD0JzE9o+vOGwBKPbBc/06bVPop7oQZjjf9w5rFgioiz2+LLgfW?=
 =?us-ascii?Q?QKlifq/1M/qiIL68yPrmwtCAvU4x/LIbDNlAZqn83U2FkBfdyg1E9YIeQhAV?=
 =?us-ascii?Q?5q31pwk1lH0GQhD1c5CglSvobn0G9GNDN+2PjWJUTcOqJSdItSSH5TOJYJ5y?=
 =?us-ascii?Q?bAVrcLFWRBYzh7yc/KRskuaaLr9AioBp6/qSCbpLC1CO9jMr51ClBULC2NHj?=
 =?us-ascii?Q?LrC5rL7hMM7Q7MW/fiDKY1KmDdJL0M3ELMbIqwZ63peZtwWVW89SzHd0mfkC?=
 =?us-ascii?Q?1Wu+4HauOrU2DHjjQzi3bGdgz8OADpkiwDOB8f1BaB6WaJZuY2ct/5aL/V9d?=
 =?us-ascii?Q?X2w7Fr07IaSpvYZqC09AqMhwaYO5DZUoxcjFP4H/F3Rcz2TwyiiCU9zEhzZ1?=
 =?us-ascii?Q?O/CmV7wLANvNoDaOP0dov4TcLIGyPIMacJT1XLop50lVtxc8uRY1IpFUbg1G?=
 =?us-ascii?Q?9VbwqOmtujhRLcHFPWk6O/56+6dpj2RJFIuMduPXdWEy4hHMyriXQkt0GDTh?=
 =?us-ascii?Q?/8PEQwSan84oWeC0CqekCefd6a9oJMYM/pwZOm6TjgjDFUqRbuyPWXGnWxkY?=
 =?us-ascii?Q?IezRTtq9zerIKc6DdqUcp0vOMt1z0o1zc5CMWNBAWkug1TjrmiY4IHql7Mau?=
 =?us-ascii?Q?/ZxePYBB91zb6UCfqByY+Ve+n85oIqYqNY295BHWH+T0MweOEAClGIhWPogJ?=
 =?us-ascii?Q?Hm/u4knN0dXyk9cXQ7PFVNP4xK2Dye5OtluwdC6ebrjnweGTf8U8SmQbRX4n?=
 =?us-ascii?Q?3mD7YQnYYp6fBEjFfUgq7oQ3g9LGnXzgwGh0x34hEqdEt6nlXsVBNr1YBHzU?=
 =?us-ascii?Q?NDv6yNroPZlEL0evcf90DMP/oMzqHWPaYcwh6jM4zcCcVwLpZIvAprlTnDkk?=
 =?us-ascii?Q?YV+oyNgmMpyeEfh2ME9SIuRp/6Wky5KPtLQ6xDRKWlgFSzkwvlYb5OWE/6gF?=
 =?us-ascii?Q?vs+JqawRWVSoVdjfKGKyYTW9kYX9hWX3u88DDP5dZSVk9uUEyT21r9t5Jn2w?=
 =?us-ascii?Q?feeD3VlYbrqP5RFX4ws/NVGJEou+r7f9lemYNAn1fpt6KEUP9BtQHMlSnBBp?=
 =?us-ascii?Q?mm5l9GTkEyLQ4Wahzsv2z6AXhS94x1Y+dvKkYjjf901vewXTdaA244cTFnoo?=
 =?us-ascii?Q?yfspIv6+ukmas5R6x7+jMHVA4mvHa7nawzN8wpfwkAEICbSna9NtvsSTv9MR?=
 =?us-ascii?Q?8sVk0nEGww=3D=3D?=
X-Exchange-RoutingPolicyChecked: 
	K4svsQ+aarji00dwRCugZnFCYT9/FRJEKPr8Ldfu+r5PqQ2YlRuA4yHr3ET/3P2whio/VxRFVFdcabHusaVNVX7CUBPZ4VFNbaY8ocssrWzsRVR7RGlG2qIKuafDlyOCO1ySFQXxYPfpRLeqrRzfT1r0Gwb5YMn23+rIcFCwJ8HbSqg/rmBGyaEkWwA300GIiPUWYVxvOzvxrKAP06Rr/3ApoR3xZWsvo3v07reTWB2NTMoxGWqWPxSp/PvtPkf7q72FeyeHCNWdsLO1AIvhwPXDYrKCSZRX/WzmCWORKf7ELV5pOlN/EPitvuGO42r3N/Nnd/3fgW+oBI9cQxLzlg==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: de03318c-09f6-4270-5cd1-08deac00bbbe
X-MS-Exchange-CrossTenant-AuthSource: CO6PR11MB5602.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 May 2026 06:20:28.6144
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: If8W9mBL12A7KKxCzJDzcV2pQTw2+y/Vb/1P2wB54JGPBjPvKqiFYby2XRw506bH6O0WiAvvGcbrt7WvloWlfQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH3PPF383C22AA3
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-GUID: Vh_jeaIMop2WzlvfzkmI4AJE8KBoAJA1
X-Authority-Analysis: v=2.4 cv=JeGMa0KV c=1 sm=1 tr=0 ts=69fc2f2e cx=c_pps
 a=n8wvYzHE7/phCzIUoQmMUw==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=NGcC8JguVDcA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=iKiJcTA2PjBS6x5JeXcw:22 a=t7CeM3EgAAAA:8
 a=tiOQsDj17wmZzvHrvdsA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: giin4XuwQB1CjHq9ncN8ki9jZHSI5I7Q
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA3MDA1OCBTYWx0ZWRfX92REmp6dPT+z
 HWbTlmxLiOkh76EsRWYqWG/CbqYAa/1WixPUwPZi2mpMJeHMK7neXIXZMfGlsWCRSfi6c8W0KB3
 zBsesmoEAjwkCBwgZ3okdX4NtmIeZ4rpn4WB32ocTl8+nJH6ENjU7gPycOpybot756sZ/+1eduK
 kEmLZSxCFpL3O+ebvYJXulSbQm4F72Ay5xpojAqStESJ01zBHYgmiidEY/Z0uWnSzeVKs4ZU5jI
 4Wsqgirlcdy5XIxXXkX6L8HKb0lIsrPBWlysr2AnhjdHcn7jAWDuzvETuDs2Pi5YWmtKdzs/nDX
 aKHuQ8aSJ7QNVQ314Aycea11xrsSQkP41l8zgZu7yUNrEvlmJeyXMxW6l3DJaCt8qF1dCxeamP3
 QYKDGFG0LSBcaxJ5qA+LkfK7Di49LD/uXiGTH7mfZA1rk/5PtZoBwNA2HXzQGsVoJEj5jvzf7hU
 +EUSlpxS/bHoSI8EMHw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-06_02,2026-05-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 suspectscore=0 clxscore=1015 priorityscore=1501
 bulkscore=0 spamscore=0 adultscore=0 lowpriorityscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605070058
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 07 May 2026 06:20:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/236562

From: Chen Qi <Qi.Chen@windriver.com>

For systemd, 259.1 -> 259.2 is a stable upgrade.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 meta/recipes-core/systemd/systemd.inc | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/recipes-core/systemd/systemd.inc b/meta/recipes-core/systemd/systemd.inc
index f107c4c5da..292520e6ae 100644
--- a/meta/recipes-core/systemd/systemd.inc
+++ b/meta/recipes-core/systemd/systemd.inc
@@ -26,3 +26,6 @@ CVE_STATUS[CVE-2026-40223] = "fixed-version: fixed in 259.2"
 CVE_STATUS[CVE-2026-40224] = "fixed-version: fixed in 259.3"
 CVE_STATUS[CVE-2026-40225] = "fixed-version: fixed in 259.5"
 CVE_STATUS[CVE-2026-40226] = "fixed-version: fixed in 259.4"
+
+MAJMIN_VERSION = "${@d.getVar('PV').split('.')[0]}"
+UPSTREAM_STABLE_RELEASE_REGEX = "${MAJMIN_VERSION}\.\d"
-- 
2.34.1


