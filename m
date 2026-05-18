Return-Path: <Qi.Chen@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0B3EACD343F
	for <webhook@archiver.kernel.org>; Mon, 18 May 2026 05:56:28 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.2430.1779083787568700425
 for <openembedded-core@lists.openembedded.org>;
 Sun, 17 May 2026 22:56:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=e21MKihS;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=9598bf1d35=qi.chen@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64I4m7sN534759
	for <openembedded-core@lists.openembedded.org>; Sun, 17 May 2026 22:56:27 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	PPS06212021; bh=IW99ojSc++WvF+rAW/RtZtQhOmIT95W8Iisezk/c3+4=; b=
	e21MKihSbjKRN9AhIhnzb5NAHTVC5cU+oMcDeC1bxFPPG7321+DpEu57H15ZeBNU
	WOOkjZAWkYmlKOgpxI38Qk5Zyv9bkKE1vkMSkb9VV3NfKI8Q8fnV4J90HfOaFTFi
	dbK2IhjOK8fJtjnJNNHb4J+JMq+YNJoW79K97QQ/pmTWPiT9IO9O9b+Zn4SSoQ6q
	1KD/CeJgO3BR3bKH8K3x7wOCz7Bv37Fr6kpJO+4/QA6sEE4pir3xdaoI8AqDB2iU
	ozEpWhRTQAoJrm3vKdsdJN+AmDsGhuR8/2FBfxyx2GRLDWUXp8eMWS8ZpbrsMFAL
	UvbN7+d0bP3TS/3aJG809w==
Received: from bl2pr02cu003.outbound.protection.outlook.com (mail-eastusazon11011059.outbound.protection.outlook.com [52.101.52.59])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4e6r3g9bge-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Sun, 17 May 2026 22:56:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=h/Pit6uI8gXQEz0F/3s3kRT6wZfo8r7d5HVJYkbod4ht32Wm3q4MhfxMZ/xQ+MIZJP+mW+loWEvpCGWVq3LoBSrapBN4ZfRVmpsXIQjXUIGPFf5eGBncmRBRfYlJxQwajRGjHdahOKE4VKERvn86kCodh+Y+1zFiLkZy8H+8QFECKCYqnlc/rRt6Dp5FMeOi1xNnt2WgMppZGkqVceelFIzH+CiZQrAAY0UbayBi2AAXYGS0IhAFyIX28f7lLrOwgEdkHV+69ZiNm8vOvpwgQloz+6s94Vo6Yqx3aUjjPSoj/G4KZKtMONwJU26PXjYafbmJnnUElxMbPJgEFSnESw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IW99ojSc++WvF+rAW/RtZtQhOmIT95W8Iisezk/c3+4=;
 b=F+FEv7kfLNCL8RNe1ZNkscK6ToHkkW7rfjL4Zj+Gv2AMa4II9c/NEOHYFqNwpm1O0OwAX4o3g4EJ3J655/Maa0ncG+qwi1OvdpSgl5kdYqQ+VNcj3S7z/1lHbX8F0ijAXcQtcJeyIaZZXDCnqo22Fq03hOfsBMI1p4GIR0x+qWVQcutfFRw9DYIPyB1/Sf0sO9eZWqpLNyC2dyzqIAj08JdLyhNfVoBKMZ+xs7wofQua/k7ktEQGHZMfscQRaDqnQ+0U1dwI1O25VCNSEOvDKJQE81/e25ttjJIyiJYr8vWWqEJk/6L1rTdBTM27ADyp27yDe3OwWOrsXKa98e1ytg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO6PR11MB5602.namprd11.prod.outlook.com (2603:10b6:303:13a::5)
 by CH2PR11MB8780.namprd11.prod.outlook.com (2603:10b6:610:284::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.25.22; Mon, 18 May
 2026 05:56:24 +0000
Received: from CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::5ad6:8f90:b01d:2c62]) by CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::5ad6:8f90:b01d:2c62%3]) with mapi id 15.21.0025.022; Mon, 18 May 2026
 05:56:24 +0000
From: Qi.Chen@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: alex.kanavin@gmail.com, randy.macleod@windriver.com
Subject: [OE-core][PATCH V6 5/7] kmod: inherit upstream-stable-release-point
Date: Mon, 18 May 2026 13:55:56 +0800
Message-Id: <20260518055558.3982813-5-Qi.Chen@windriver.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260518055558.3982813-1-Qi.Chen@windriver.com>
References: <20260518055558.3982813-1-Qi.Chen@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SE2P216CA0186.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:2c5::14) To CO6PR11MB5602.namprd11.prod.outlook.com
 (2603:10b6:303:13a::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR11MB5602:EE_|CH2PR11MB8780:EE_
X-MS-Office365-Filtering-Correlation-Id: ad529190-0477-4656-857b-08deb4a231bd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|52116014|376014|366016|56012099003|18002099003|12006099003|22082099003|11063799003|38350700014;
X-Microsoft-Antispam-Message-Info: 
	+WR/IEBCzwgLWfPKZmmqwYUomJkg5xoJTdmu+dZjTX3dpKj99qXHPjoT7sjLMfYZzf6bq1qca01Sef/u3B/Z6qWSjlqHPXPQ8jh5z37aZcB50ebr2bCUfyiA2vYZuvXc6qaOuazek+RCpfToomZ2MYcSoRkPbx1uQZim2jjPbznO6+jRihNrVDs1G3Ue4Juxmn5t7qdAFcgORu/BX8eTbpdvEZXz2RBwdLJCjffjeTK1DEiTLzjzZwrAia0JXKKB8fZahPKJPZftOC/HRdlOp0LYXJT7mvGwOEZJWCvPrCOzsqN5NDlDH4uaCU1NuumjBatzrmpqIduuHklF8HRhowPViyCJKuN2Q7Ox/0Wse/7dHSoDj1YBgRpPNJV1ZCkgyJYhJ47a19IKbdgwMhrdLV+VAnKjwHLEi1lroXP5F1FEhNBb0pcI7KCx18uJIrvrc1ZZUOcaiQc+o7X5vCsm7My9d7YJ8KabMuwQV7sh7QDKoiJ/rLsGWYwj7lxjH3aS7rlv+pGTg6WTereh3UgxxE+Vg6fUHDm5+2NoLJxp+3b5O74u/4IYTjjy7OPVIQuixyNyXlrdR+PngguQbEKKcku8sGYTjPIhzvcWYZ3vxwk6OSswj8q3Y5gOcDeK3ZvT66BuuLLFhGs+rieKtDydynFGKAPbR1OUqhJcXVU8oOK7Kmfd2QTsFvR3KQeb4mYpTmYb8hNL/yzAIe+Ehv9oUPqzi+4ZMgyOIsgtDQI+jib0xQTAcx91Mf7dfLn3SuEu
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR11MB5602.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(52116014)(376014)(366016)(56012099003)(18002099003)(12006099003)(22082099003)(11063799003)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?qgCbV0qS6UiyDHPpzcuyBAEV68htArNpRBx4h+byFmrf/7Dyhd16/DlVLwRu?=
 =?us-ascii?Q?0JgIoAwbCDFGaJHIUxIb4i7tkHZlZnZZo8XnzcB0tgOeaojq8EJPJOS+Iy3X?=
 =?us-ascii?Q?IlWRbP4hV1QWJGfc8iGOpbuSoi8xUHJOg/Aoyqjqb3D4vNZ0TQg+t2UupSEd?=
 =?us-ascii?Q?Kw+tAxESeyPzlWyn+Lz95iHUvnZKamGMK+8NgjHP9OR5j27M4fkqzuPHnuX2?=
 =?us-ascii?Q?cZCQMYmsbOscIxovbaKDjRvMijtVgSPVJhlUQA2rb6XVZq64cFjVl/5U2K+U?=
 =?us-ascii?Q?ElrNBkhKcGx1K7rJzKDSDBVe0Z8TyO6d4T1OvibtaTrB7FsZblB4UmXqh+bg?=
 =?us-ascii?Q?0RhPaC2G6GOUxhSti3sz/P+WlPWqX913OoTvY20XBq35LL8cqvA+oFBR17uW?=
 =?us-ascii?Q?tr6VZDjB/TRaiRJasFU3felDWkXnqJYVBTapuDctskBqTZeRDfpKNh8+k8oO?=
 =?us-ascii?Q?8owRQla4oYDGHw15GpDDZ58H2es1uNsbrv5fASS9TN3lWC0WPkCzbuLKd/pv?=
 =?us-ascii?Q?L8UZ63AJayt0C8uXyjgYBApPYdd92hqFDYB08Utha218eXfp5a5G/rQf8UGi?=
 =?us-ascii?Q?aC29VoiYD+sdXadNGV1cggrWLQFtmk7ec2Pf4FDz0qYhmOsT/SIoosLdQhbx?=
 =?us-ascii?Q?DqFa6CH//XHaJ9hCtJbLY+n8FF3jytIF/q3b64VJw5C1Xg6fN02y3P7FMEco?=
 =?us-ascii?Q?idbzzXHUMzTRqgQ/WAI/a8bkN/qBglt2MciX5zVP1R4XjyFl6wiIe3cqHHqc?=
 =?us-ascii?Q?Fd9lpdwHWXF0jP8sCba98larlBhZdPIQf9zZURLYxhGmmFShsG/lc67gPFci?=
 =?us-ascii?Q?04iXYmgfO70mTeJuyX1goa4/k9JxS/VwtEuHbp2IU3aVYTQmLwNgUVvYEH+a?=
 =?us-ascii?Q?2Xn4uF0kKvY4qHvmqsg21oA6eYUl2Yobq99kZ9Lz8yjUgxRHcy0Q7DlLvFzo?=
 =?us-ascii?Q?/7Epgg2pm0nhvWr99vSiXF83CX6RStmetHTyz+0qj0b8P7C8Tawo3xqqtOJh?=
 =?us-ascii?Q?muz53Hdq+JApbT0c5CwhwMSf52uv2G8t82zTK8RphIlguwId8CliX/NUJpdt?=
 =?us-ascii?Q?HrzdvlPN/NwNTMydWfRti1BsIc4zmR/KM8NSzMzHFiYEhT+YWHDKJzX9ncP7?=
 =?us-ascii?Q?YqI6vZX1H7OrxtL2pDgSPsPr1SnfTeOXDeWvLRqAWh1d32vPnZltmCWJjvyX?=
 =?us-ascii?Q?lU5ZHTAeLHybxMi3u2Ch49jhTy1EGc6rxvLa5BfHj2Z8vRTbe0Vz1saB9XBe?=
 =?us-ascii?Q?NcX6XPrxcCBunOlwnG5IwNzKuQJmC+w9ID2AXuVNYpNG67EG/59MRLe8CPAs?=
 =?us-ascii?Q?SnfnScjS0EQigJiZHZRlBGd7IcmVl8x6rOIz4FXwaPsRTpeDvgSi+G7lAPez?=
 =?us-ascii?Q?7yPSGLifK1nYT8a5FJj3SpcccM0wkoZxUXfUBuIgWlZcr60lOg71h4Xp6X2F?=
 =?us-ascii?Q?S/60k6c8DOfB9tM/nkPPoWviJKmOhglK7Z5JoDAazze0Fhv3aHjNf+M+tJbv?=
 =?us-ascii?Q?xNlBQbc2GpJpeBqvPwrlRA1RS9zMQe9V6aGj9TCwyGGtZZKL3RrvbpFQ+bqc?=
 =?us-ascii?Q?fNZK6wHjIgj5leD8mDhn1wYviPKHlD5nhNkJPz9Pq8pLtg5uh5wvnURCzifH?=
 =?us-ascii?Q?m/5qYSKJI4KeIl/5cMtJsrCmmPsPnTZSi4UjT7IcDEo3AV5pnixkH4TA4sGz?=
 =?us-ascii?Q?twfFpauSrND7kpWYUB0Eo5F6nqjstOj0LaaLOamDrV4SVfAOEh4xTI5VY2Ie?=
 =?us-ascii?Q?s/0f14uMEg=3D=3D?=
X-Exchange-RoutingPolicyChecked: 
	cI1ZtYOQ9srIFN3e5ckC+28hFnxgtdkak2cANsVaL97SVaVmhw6lLAGmTnG3CfQ2iQ6rVLAzbEhUULrmKjWm0ybsdzT2shpLDXa4X+Ie4dN5LUXJvZBd0yTKApca6lgo5djmgm/7HYphhDKNE1irQ6xGpNxhx0vrf3mdq4L++mLhEyY67BP/UAmjgT7zWxE/pYWH83m8hKFpMtKGHomvZJ9Wql7XZfPumCGevayniaz20F1IMowCFIn83qWEdLbgry2ZJTJiHVwJ7c0EdFTS5ORH02SWfKEk22gsEk7DhxqHIKKJwovtz5g0GicMbak8E3lQscosDcLSzmCx55lllw==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ad529190-0477-4656-857b-08deb4a231bd
X-MS-Exchange-CrossTenant-AuthSource: CO6PR11MB5602.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 May 2026 05:56:24.7328
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: e9NSz/srfGKoU8n5T7Z+He75I9XYSf4n2WzcXZ1C3h27yx5krPdSCPKJ3WXO5wPQonAy8TRucRd/KIV5DE0AsA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR11MB8780
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-GUID: 7xQ4I7osD8Wfwcv9nIrzj-1xyoghOOG1
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE4MDA1NSBTYWx0ZWRfX+Se56uaaHdyk
 ccIl8ehPmjb384wqPWHr5CmnvDkkr2K4zij+6uIZOXGTorm6emGdXz55jU27TBtGmlcHCU0BoCw
 x7lKOk30WNVD260zCE3lZkg3qiNyPsZ660MO9HbWh5GNCB1tSp9CDbm4b8ZF+uUCjkoIsl7iEQ9
 UxoOLkksLD5km+vb3q/FPicDV8RR7sRWAGNskNBjFdLnm+zDpw3m+M4iCJPOZyZvfRLMR+nzRSc
 m7Xjjz6Mdec2YsHRvJeOIL/MQ0JqCMBeF62Ux+XA4EomgleH8p4JQkNQga+Kxne2NuE+9gkBp+n
 xmW648x0y+24zdDirEmzMtUAkr/2pbS/qmnMqz2v48TGeDbl3vBBU1w8R7UokziXHO/urcK3yj+
 20i2rvb1G1jcYl4O1pIKrf5UwfmZE+mIdSeB1ttSuz6JguZRKcHsvK/52UyZLShAzVf0EuxLx+D
 n9/Fl+jo2+3OD2DE9Lw==
X-Authority-Analysis: v=2.4 cv=I45Vgtgg c=1 sm=1 tr=0 ts=6a0aaa0b cx=c_pps
 a=MNM/txilNqeExyaWs+jKwg==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=NGcC8JguVDcA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=iKiJcTA2PjBS6x5JeXcw:22 a=VwQbUJbxAAAA:8
 a=t7CeM3EgAAAA:8 a=_aJgn0iUmd-qJxb44P4A:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: QaElDRsGuek0g8yrx6hWKOAdUrcDxvlu
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-18_01,2026-05-15_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 suspectscore=0 lowpriorityscore=0
 adultscore=0 clxscore=1015 spamscore=0 malwarescore=0 impostorscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2605130000
 definitions=main-2605180055
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 18 May 2026 05:56:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/237199

From: Chen Qi <Qi.Chen@windriver.com>

Upgrades like 34 -> 34.1 or 34.1 -> 34.2 for kmod are stable upgrades.

* Evidence

  Its repo contains a branch called:
  origin/kmod-34.y

  Its tags are like:
  v32
  v33
  v34
  v34.1

  So we can infer that the maintenance policy for kmod is that
  upgrades such as 33 -> 34 contains features and upgrades such
  as 34 -> 34.1 is a stable upgrade. And such maintenance policy
  is likely to continue.

[1] https://git.kernel.org/pub/scm/utils/kernel/kmod/kmod.git

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 meta/recipes-kernel/kmod/kmod_34.2.bb | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-kernel/kmod/kmod_34.2.bb b/meta/recipes-kernel/kmod/kmod_34.2.bb
index e5923a64cf..a61466cefb 100644
--- a/meta/recipes-kernel/kmod/kmod_34.2.bb
+++ b/meta/recipes-kernel/kmod/kmod_34.2.bb
@@ -13,13 +13,15 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=a6f89e2100d9b6cdffcea4f398e37343 \
                     file://libkmod/COPYING;md5=a6f89e2100d9b6cdffcea4f398e37343 \
                     file://tools/COPYING;md5=751419260aa954499f7abaabaa882bbe \
                    "
-inherit bash-completion gtk-doc manpages meson pkgconfig update-alternatives
+inherit bash-completion gtk-doc manpages meson pkgconfig update-alternatives upstream-stable-release-point
 
 SRC_URI = "https://www.kernel.org/pub/linux/utils/kernel/${BPN}/${BP}.tar.xz \
            file://depmod-search.conf \
            "
 SRC_URI[sha256sum] = "5a5d5073070cc7e0c7a7a3c6ec2a0e1780850c8b47b3e3892226b93ffcb9cb54"
 
+STABLE_VERSION_PARTS = "1"
+
 EXTRA_OEMESON += "\
     -Ddistconfdir=${nonarch_base_libdir} \
     --bindir=${base_bindir} \
-- 
2.34.1


