Return-Path: <deepesh.varatharajan@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 74CCACCD1BF
	for <webhook@archiver.kernel.org>; Tue, 28 Oct 2025 05:24:35 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.5040.1761629073179974330
 for <openembedded-core@lists.openembedded.org>;
 Mon, 27 Oct 2025 22:24:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=dajVu8Yu;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=23964b911a=deepesh.varatharajan@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 59S5I6RK2397973
	for <openembedded-core@lists.openembedded.org>; Mon, 27 Oct 2025 22:24:32 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:message-id:mime-version:subject:to; s=PPS06212021; bh=dfS0kyZhv
	S7NqUveBIDAAk/mm7il8tUD9KFf1JRykgM=; b=dajVu8Yu4MnMrTM8juEXE0A+C
	djznEOCrOC3FOy1j1TMjj0RckFQGUXdWLC2kAQts+FIqsBsJlZvWX84OzrqCKdu9
	m4AVdLuHuwrBmZH974ijVIh2OSAqOlDTf+L+eS+9EPfknIU881AXFdONq+A6LJDe
	1+1/n2smkXhVu3oS7icy2hxwbVDtOjDMC2J5EmQ4OHEuU/PdAqsBLVWTplIrfzce
	lxLxRXxjzRXM7IQJKSilOjWsEkornLYq4Gaak9AffZ8HDC3+Nb39wShw7s90DqO8
	dcVLAjsWltB7A2ecG5Q17wHEsbf0PS6ifZZPYz8qNubPLCIuNKNMnCAsB6C+Q==
Received: from ch1pr05cu001.outbound.protection.outlook.com (mail-northcentralusazon11010045.outbound.protection.outlook.com [52.101.193.45])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4a0x2e2gkd-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Mon, 27 Oct 2025 22:24:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fSVjD+rdc2Jrpiv8fRIMqhvees38VYx8IHy92iuoC+tsG47/A7xy0oDfDKYzPGwcO19flLYiMN8Cy/LAm42anpbEcFqyZXQ4Yzxtz5XmttnruRP+/Hhi3J7Ma/kE1KZj1rz5Y1QFWO44I9OXxAvpXnaQbAaQH2Vtg0ogbh/GuKR/Cb5wuWVQC/Bq7bezwkKWrCA+Zub/XFB/MToPNE51qGXl0TTDZeknyspW4bFZf53kakgiBZPlQ50xc/2fDEsXoSqmkehJ+pyJ94/U/9H2F/z+jDRNKVZB+paMMOU7v9+uaM99ltxv8FuWaMnarLIE6Z3R5fFoNO1GTwIzKxBUSA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dfS0kyZhvS7NqUveBIDAAk/mm7il8tUD9KFf1JRykgM=;
 b=IKixOttvLz+27AbY8z2GS26eS6NJUzW33WWeJmDMOPAUCMMzF/G0HMe2uImtVplmb4+ITLYnZxGVPHj1x1DIWGEJyWM7dPotg8ugoKbEj7N9pLv/L0KLsISXtJs6ZUqDyKluzMsOvKjSEafmNyq+UFBSG30SnMsqdYhxEwDJXBRkqF8cEH1IzhbJpKRA+iC3T+3s0KVqFShRoRkQyvhsygMNQ07PVqs+vEn3h0sjO6kYx4/dmm1YiKPbsR3fDhu9Mf1ri3p3KGr1oFfPU8cHX9IAW+jEoIk5FUXL7AIQJwgAiTs4P2yleOEClQI3YTp6XgkLz6Tbh6EtBw/EYZfQDA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from SJ0PR11MB5648.namprd11.prod.outlook.com (2603:10b6:a03:302::11)
 by MW3PR11MB4747.namprd11.prod.outlook.com (2603:10b6:303:2f::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.12; Tue, 28 Oct
 2025 05:24:30 +0000
Received: from SJ0PR11MB5648.namprd11.prod.outlook.com
 ([fe80::c784:dce5:4b7b:54f]) by SJ0PR11MB5648.namprd11.prod.outlook.com
 ([fe80::c784:dce5:4b7b:54f%5]) with mapi id 15.20.9253.018; Tue, 28 Oct 2025
 05:24:30 +0000
From: Deepesh.Varatharajan@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: Sundeep.Kokkonda@windriver.com, Deepesh.Varatharajan@windriver.com
Subject: [PATCH V2] rust-target-config: Fix ABI override for powerpc64le target
Date: Mon, 27 Oct 2025 22:24:18 -0700
Message-ID: <20251028052418.2551221-1-Deepesh.Varatharajan@windriver.com>
X-Mailer: git-send-email 2.49.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR03CA0079.namprd03.prod.outlook.com
 (2603:10b6:a03:331::24) To SJ0PR11MB5648.namprd11.prod.outlook.com
 (2603:10b6:a03:302::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR11MB5648:EE_|MW3PR11MB4747:EE_
X-MS-Office365-Filtering-Correlation-Id: c8a5616e-164a-4345-3c42-08de15e2454d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|52116014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?YWSOBSR11vA47RltvhCkd3fIJ6oPfU2qAqGAZE42p+TUZ3GE6n66yBj/s/Vy?=
 =?us-ascii?Q?FENn12S/dx1tQTjapAXvj1Gmu1cn4EHgkFwpKChd6KI5KkJFbLnvWW4sDcOl?=
 =?us-ascii?Q?nn9vHSH9DE6XiQVELNUYoT6J3lciTnTe4rQ8SrEVVr2ME2fP2aXCKAYY+zHJ?=
 =?us-ascii?Q?9yXrM80VSdL5Ujd6Gp74JLmirXLIUOts+OCwHVrrti542V+UOPO6MzTzXoSv?=
 =?us-ascii?Q?I5jda5gCwaSAGe3rokEMCeijgk5byBi8un3mmg5WxvwP1aBXo8o4LDPqQF5N?=
 =?us-ascii?Q?1NQKZsqU+M0rRrmcjzY5g8gjh3O/ABVZC8i7Tka4t13e6Kgh3MvcxK1MXOWD?=
 =?us-ascii?Q?oyjiNDV9RYTgRoBCghw4SOiWT8YpvmW2i9Ff9R0rwuJ/VwkJMHFtjqnVL7tV?=
 =?us-ascii?Q?QeNG7fsEtaEyxQ7+FW59OrSmMOSAJODvDQUaLYFkdpQBsHXlEm22IUDy+qOx?=
 =?us-ascii?Q?kGChKfoyo7o3eQ33qRUoeysW3C3iJbEZq1h/6fj69BxuMwVLaWF7+sxXEQ3N?=
 =?us-ascii?Q?SWug0BMX84jxE6nPdgquO5wVtjwNBdWnc+6BEpaSxTN7qNtODVhpSEKNiabN?=
 =?us-ascii?Q?94nv9C7FqtquHqWNNAJbBM5xUG/kgbX/+G/R4BZ/Kqf9w27W1pQbgK8cryEW?=
 =?us-ascii?Q?p7sUNdfmkD1cApDbLXSS7cpoTb9JquyBPzh+1QTWuiCX5mkrLeO0q/UyDRdh?=
 =?us-ascii?Q?eEwMSTTu4XG+KpRv9jd8u7q3vbGgD2E6xpNmnOzL8GHWzzznaGC8WO2UqEMw?=
 =?us-ascii?Q?xEdRtcKhdgYvkHONS4nHZU2CBecn0jcWOBu6ykX9MeXrv5BEsINySpUZdVne?=
 =?us-ascii?Q?HKOQM7eddDGdItDPPVDTc2GpixXtZ2ljoeYCZDcDNDGJXV6CDuHPFpfrUdco?=
 =?us-ascii?Q?BT/S4PjW0Uta2qd0hp5RHddMw+Z6spHOzzVfZ1usPh+RwaeDCDcSJFElbTtX?=
 =?us-ascii?Q?ZN4xbGW19X5KU3Z4nnP78uu70PnMUGrR6tBeyvZQZ0gB5shxkkGaQPmwNsQh?=
 =?us-ascii?Q?R2g67iONh0112HTKUEzS0v3er9nwOMW5L7DkfGsSrJRMvqO5f0D3DjQy6VXf?=
 =?us-ascii?Q?JI69l5MMAtIXBOhycp72Ar4QfB3NS8ID0Kc4M7grV2a63VgFh2A0GVPugKro?=
 =?us-ascii?Q?/7d9JsC0zAP+edlIj01lvsAcn/ht7eIT9iQUKoASt833uaINgMPtvj8yDYLy?=
 =?us-ascii?Q?HxwTzZoQSRgiWfx1jKGTPL85AxJGAlsagjy4Uss9RKcXmperDpDj2IeJ210B?=
 =?us-ascii?Q?YRfiOEGjl3CSvd45557eWVXFz7jBmG39fgYmkTmJYoMkuzectD1o+9vykiSy?=
 =?us-ascii?Q?iyNXnz8/g0/UUgGrdW3QZqSU6dju+qMbHArtQNiC+hDk5DfN2iV0VCSNc7OU?=
 =?us-ascii?Q?wmdipLZnCI2VJrqRM1Iq4XxqfCnDy1s+r+RcgLmIJKafR1Q9u7hF3dRgo2H0?=
 =?us-ascii?Q?HdX8Gadk9KlKNCXG1M84yys2Ex2tlx/6JoPuZDqVasT95PA6rbCHNMzdQHNg?=
 =?us-ascii?Q?eQrT5oi88DoQHAhUHmiJtvJDARLa1QBSLW6C?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR11MB5648.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?4EYd/bVY+UO/xvH//hhmqH4cVX37Xm0ojqAZXvtqK+ZPG+KXQRCA9bJ9z0EY?=
 =?us-ascii?Q?UYgVdcXQuiImZdJ3SKMdSiYTIjmLtDv3DrHf3JbHNSxLeEl7HpgJnwpYsM7A?=
 =?us-ascii?Q?9mMS4UVq27wJCo3GDlpA98KH9wsNhnR8VF9FVclq6Rb03vQwryQpy6CxU83M?=
 =?us-ascii?Q?yajEG6XtzsS0xXo3J9VVIrurNDgKvjHF6/5RmJtLVtZF09Cox6pwk6GBuomD?=
 =?us-ascii?Q?pxVJ4xxH05E55iXafbsThBCc7Px4HED3wr54aWGzvznTFgEw5CzT2wze0YVt?=
 =?us-ascii?Q?mhAIEvO2BQRqEnrf8pTISZON2b8xuPdn/aWOISVMqpBClEhqiTHl3R6wVGiY?=
 =?us-ascii?Q?K2+Rt5F0YSXmjkhZHiObkeDpNmFwKQvQatuzzSzQd+WYqAeaUq8MrF9i2b2O?=
 =?us-ascii?Q?uWpxU8TQ+sWP/jDFY6QLgX7YXnaLvBpT9uM+F0xB/eXHNhfjXHKMSU7kd8Gd?=
 =?us-ascii?Q?Mx99MW/dtIxvr/PaSW5ypvWIuvOnN+muFqwYMn40/ORn/KwEBdrmXvWz333N?=
 =?us-ascii?Q?syM5f12Z3fa/7k96jFER3G2WvVkYUexCri83AAKWB02dSeJadGJhUWE/4WwE?=
 =?us-ascii?Q?+gd/hUlklFLrJAuPJcqSxQ2mlWCht03tzr/hflZtgcatg2fYviDoZEJt4E6r?=
 =?us-ascii?Q?jUeE39vLOshsNq6M1XlwP/RELHGTOurEmSoOCB0h5BwI+mQAJSpH1bnnEF6I?=
 =?us-ascii?Q?G/GyHdCf7ZIOfTidA97GytFRJDJGfcz99iddJaVrnFgEi8+ia3btTI18yCgQ?=
 =?us-ascii?Q?XZFs9K65mVdTvkddv4h62gajME4HDa0C4GSY6fAEpqmxxBiPgfuYlbyVRwk6?=
 =?us-ascii?Q?pRxlwxyUa0QtJ3ph5hPryifhzP8i97Yybks89UFnmaxVujwK6GnFo/VhSCAv?=
 =?us-ascii?Q?MgnuEt39egGooIH5sHIBilLrVSC4xHMfxbr8XF34653r9evtORfku7qeYrzO?=
 =?us-ascii?Q?FEKbew9+x1JCVMfkyeHfms9p6gPheAtNL9lbiR+vnhvLs1Lw3S2QITP2RTBf?=
 =?us-ascii?Q?FhhHlKqQMCAkUJdnvnVQYNE8sL8DOSs9NdX30Wi1Pm0vch08fcNYcSTMiJhI?=
 =?us-ascii?Q?afC/7xvD3fqABNcSu9wjSTZ9pMS1+veneX7uwkDabYiy8SwOJCqZ0a3yN0EA?=
 =?us-ascii?Q?0nWYibciaDZV4HxP0ZNd+YvjMIFAo3/0zWr3VJtbC6HHqep1DEeajCadgKTs?=
 =?us-ascii?Q?yeak/MecFiibtCsk7qAALxb6kXhFugFgvFLOSk/1wDi8zz9qhKOgXgMo9seO?=
 =?us-ascii?Q?wMVIir0Gx3PGVJqnRFba3Sj2j4RO5AlPKNvBPj0SA2uidFB3lPtywfZWOvBy?=
 =?us-ascii?Q?99QPSglAmGfKaIwoWHOC+X3zRQYpfe7KeFS+VODacrivoCpnhLWpHbpoVolL?=
 =?us-ascii?Q?n7uwSX9iymq9QmcgrJEaOHQNtgyv+qAB02V0sdj/evoy+twuMi4jRes3vTE4?=
 =?us-ascii?Q?4LgEI/9LiN7lP7kjLIxlZx19LsUIWwo4nZMeHXDntrsybL63n60mVVbxVlei?=
 =?us-ascii?Q?V2TVo+kmmNYvCw1yFZRRBUKn2hu0+R1MWbN2kHjtXKH8cgc5mSUMoo+zOsvb?=
 =?us-ascii?Q?PkBVxGmWSkkkg7JhOgz8XdtBv5AJDO/vjv/FJdfSV98CsecS1bGArmctX4sN?=
 =?us-ascii?Q?slTJS20YJkfonVa7YWF/c28=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c8a5616e-164a-4345-3c42-08de15e2454d
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR11MB5648.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Oct 2025 05:24:30.3397
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MOCKz3/05cYGOxaKJPQzEaeEZGQH5o+uY7dYHN3qiKJthe804M3oOG7F2BMKjFiwZvUDzaJOKhdu0HvWXge18ehJ7mqzby5FEozjteAnOptHx6A1xtqPtXWimNnRnBP5
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR11MB4747
X-Proofpoint-ORIG-GUID: XgEtxZWLxNT6xxLzmNMpR7v7ReYEcd_P
X-Proofpoint-GUID: XgEtxZWLxNT6xxLzmNMpR7v7ReYEcd_P
X-Authority-Analysis: v=2.4 cv=F6Zat6hN c=1 sm=1 tr=0 ts=69005390 cx=c_pps
 a=ksElJwkXcxqN7TVlQt8uAA==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=t7CeM3EgAAAA:8 a=fZaTti0EJfYLqqMfuvgA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDI4MDA0NSBTYWx0ZWRfX9VeXJndzDLfs
 flihvx+0ZMgoupJxFAjRnPJpfFFZvkn0hDzjrlHzrw76mkHzzIgcjBNy8jxz392PIo/1X3tlgae
 Om2vbOanBY44es64/jb2UtQigYl0XakS0wGyshWaIUVlKMVLAOZz3wE7kicEk2RWRh/YJUaQl6v
 j+JQp8ydBv73YaVjv/8maEeTJh18gIMH1uZq5Z8XlCnk44TUxwdLcO0ksO64YiPlDIGX7Fs36RB
 VzrH1hD30txUPBTgIiEyXNhhXw7gPgstuJza3TB7VLHOO+enjAVLbi67gdTjShJdlSPboMgDgkH
 TjF/rXhragEWRWWLGa9gfe9AglxA6lYl/IFgu+zdmNXNr6ruRd9omeOmnGW6FBUHJlbH6Z3IXRv
 IKEiI33Iw0vMPrIvkB2lJWRI1k4HgQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-28_02,2025-10-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 suspectscore=0 clxscore=1015 adultscore=0
 impostorscore=0 spamscore=0 phishscore=0 malwarescore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510020000 definitions=main-2510280045
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 28 Oct 2025 05:24:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/225375

From: Deepesh Varatharajan <Deepesh.Varatharajan@windriver.com>

Ensure the powerpc64le check is exclusive by using `elif`, preventing the
powerpc64 condition from overriding it. This keeps the ABI as elfv2 for
PPC64LE and fixes related build failures.

Signed-off-by: Deepesh Varatharajan <Deepesh.Varatharajan@windriver.com>
---
 meta/classes-recipe/rust-target-config.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes-recipe/rust-target-config.bbclass b/meta/classes-recipe/rust-target-config.bbclass
index 0c7e3c0090..9ce57843cf 100644
--- a/meta/classes-recipe/rust-target-config.bbclass
+++ b/meta/classes-recipe/rust-target-config.bbclass
@@ -405,7 +405,7 @@ def rust_gen_target(d, thing, wd, arch):
         tspec['llvm-abiname'] = "lp64d"
     if "powerpc64le" in tspec['llvm-target']:
         tspec['llvm-abiname'] = "elfv2"
-    if "powerpc64" in tspec['llvm-target']:
+    elif "powerpc64" in tspec['llvm-target']:
         tspec['llvm-abiname'] = "elfv1"
     tspec['vendor'] = "unknown"
     tspec['target-family'] = "unix"
-- 
2.49.0


