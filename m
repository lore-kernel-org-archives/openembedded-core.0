Return-Path: <Qi.Chen@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 177E6CD484C
	for <webhook@archiver.kernel.org>; Wed, 13 May 2026 05:24:13 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.903.1778649844715082401
 for <openembedded-core@lists.openembedded.org>;
 Tue, 12 May 2026 22:24:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=j1y7GGWU;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=959349fd7a=qi.chen@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64D3Lc56147001
	for <openembedded-core@lists.openembedded.org>; Tue, 12 May 2026 22:24:04 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	PPS06212021; bh=IW99ojSc++WvF+rAW/RtZtQhOmIT95W8Iisezk/c3+4=; b=
	j1y7GGWUuareaoK1O67sbkkse5nxZ81PC/fJQz2k8TYqb2rfKecKWWKVEobDFVsW
	WKiyFjtWi+O1tWkrPnesSVXQ6qm5+fJ32icpNtJNSQqB5nP1caW0stp5llzzHXpZ
	VJddyiYFjH5uMWlx15tzSapGDh/eE7EYzq9JLu0zxaqQi8rlGWCWYfWMVrx1DUkq
	CAMy7ijWPqhsJUCogxzKXCkzEbgyr00yZZKhkfKo68q2Z8J227PdPRiVPGhGqqv3
	G0StHXeVDV8XazkSJLeE/DqbZsriR9HUvoJqTjk7M6tGtVvnG3Q8jNm4Q8Y4Quc9
	6nFWBV3HMqCDKlfEOCfTyA==
Received: from dm5pr21cu001.outbound.protection.outlook.com (mail-centralusazon11011055.outbound.protection.outlook.com [52.101.62.55])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4e4g7g85ya-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 12 May 2026 22:24:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FGsiLhIBsjlI1AoUl9qYrEp0Kp8NKEMQ5QszRSglTN5DkQweLiOVjEVwAjdwzRhH7ScLpI2W/LZkdN+uVarIvoLkM1RExG5f8ZuNLK2/t3sdTPEFmQX8Qsq92cj6q8zsA5kTXyfhD9BlKj2zRmzEQGMtatGQBNdPMRO+IgKlI1yHd0SreGoEAXMMcrmudMNcVlhYiNny2AcBeOEAdGi8OsY+eNsBINTsRzYzBSeXut6cgAVWyuyz7UL6daQfOr+028eGkAnq7iiXXdkxaiQiJKamuSmEPtF4dF10A8JP6C1pmLY7NUXy5EOuiVIlEwo8kYKv0fd/2nCbfRGsM6/C7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IW99ojSc++WvF+rAW/RtZtQhOmIT95W8Iisezk/c3+4=;
 b=BHQ5hUSYANN3F78Nvg4302FxSDB4lxvIfXjNy+T6TMhR8tve6BcNVh+6YcTyFB8y/SXphbK38wrBlzIMv0TUmoZEDYDH/Am6obzrPwuvGSzXpBtsl4n3uVczGXDd6Ebl3P79nGf9gg7tPJ4oUmqjqeHKI7MmVZd90WKJJrkEla8bUw+L78aEqv3Us6W4cU0kWk1jogLoCzuakUJGgz6UBCxlLYPBncf8i4DZ5qgbJCHsrlij+7+iw8vWtVvTAFnnRlaLKAnVlYREagY4QWVY51tD/pRGbdmrq8bfiKiiuUu4U9lBo/UQzx+tyRaY6AwYLkyoGORIPoHwsYjCNibAeA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO6PR11MB5602.namprd11.prod.outlook.com (2603:10b6:303:13a::5)
 by DS7PR11MB8855.namprd11.prod.outlook.com (2603:10b6:8:257::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9913.11; Wed, 13 May
 2026 05:24:01 +0000
Received: from CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::5ad6:8f90:b01d:2c62]) by CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::5ad6:8f90:b01d:2c62%3]) with mapi id 15.20.9913.009; Wed, 13 May 2026
 05:24:01 +0000
From: Qi.Chen@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: alex.kanavin@gmail.com, randy.macleod@windriver.com
Subject: [OE-core][PATCH V5 5/7] kmod: inherit upstream-stable-release-point
Date: Wed, 13 May 2026 13:23:32 +0800
Message-Id: <20260513052334.2271800-5-Qi.Chen@windriver.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260513052334.2271800-1-Qi.Chen@windriver.com>
References: <20260513052334.2271800-1-Qi.Chen@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SE2P216CA0116.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:2c9::13) To CO6PR11MB5602.namprd11.prod.outlook.com
 (2603:10b6:303:13a::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR11MB5602:EE_|DS7PR11MB8855:EE_
X-MS-Office365-Filtering-Correlation-Id: 4ee73c51-3d9d-4133-8ded-08deb0afd6b5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|376014|52116014|1800799024|12006099003|56012099003|22082099003|18002099003|38350700014|11063799003;
X-Microsoft-Antispam-Message-Info: 
	E7XvR4ulTcIpmUvVeSuEw2JNrU+A7ksJmtJeFXx8bMCjapfFCtthUSXoD4c58LUVoaOIyH5x7vw3oYn1S2Mjt8o3USzB6rRIsFAI33QG8akb8G8wKvc439jy8/Jzwfr87KbJB5JrawsmTqdh6ejF39T4yEDC5LhdfjwRVN8tgcB8cDUVoHGcwwZWTPCkd4e8/fzZOUb/1mNeCmFzamLeKgmg4MS9uW66li7oa28JuP60ui8TPNqb3HBF8up2Ow3S1Cq+G30CpXye9wSH/npYZZxL+7YCQCzd4zRdCFgMeidHOas//tmB0ZJE9fCc6nu/lBbeQCSq4mmS8mERsI/BLvsmiM/iKika7eRo/GZqcKq2TbDZnCQdVbQt1c+sd4HsyZ8ikmS2VTeXC4be3xaQ9uKyKr/ql9LBp1qxS7EbNI08UrKebl9usGhehY+zSkPxq9Z7oDYTy7OA3qoLO9dMS/5n39a03BXST1XIjnZq8XYlghmcWdfCHE2MLW0XpT9gENraeKUCCGW74slb2B/7hNUw54y5aKtX7qgKhxffzqs759yNEFztTs+MYosdzALp73cc7NkkTXEGGkQ7CKB3JGz3+tjMTi+97299HoxOERBminAsLZmyZprqVw2LMU0o9ZPhplE4qHsur7fuN9ZjkHP63cNXV3m3X+r+4GjEbRImTHQsf/dZcZWB4gqTdut7zvvRYO+cw6Ji9ACP2o8yfSuANbi1eStwK5RYPRYOezCrd+DhX3UA59xoXIstAZXY
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR11MB5602.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(52116014)(1800799024)(12006099003)(56012099003)(22082099003)(18002099003)(38350700014)(11063799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?BBBc4uanTG1FCh/lZKclSLexyFWxwPAmKhCX7jsAdK2ugM5XkoNB7H/DdAhQ?=
 =?us-ascii?Q?gb3v60UHwc8f66j/ASHg+OA930BvXDIDPW+cmT9kquM2Ar2guuIGW+WF3A0o?=
 =?us-ascii?Q?NFDYgwyy+D08InOKf3C3kw1gm/6gHBE9lTiUbCbItDricshmyegP926QFkjh?=
 =?us-ascii?Q?8tGt4WogRAKWK9fp/TCgnnFlTO2SSKGPCYVPDuQ25FNSIiX2j2PicpNIPjHl?=
 =?us-ascii?Q?YpeipFUsr5jIsR5SWOTdvd9NxRzwSq0zQ+yYG/NIz6Yk/YSJAWKiWFBQhFEe?=
 =?us-ascii?Q?QxeX7SRkaCIWiI/s8jj8tsMCpCefHLE82ENixV0qzTvzvsCjwCrt1iltps0m?=
 =?us-ascii?Q?UfpNWrRWrXXemABeEk+gzw1pZExbzp2S7rrT0O5Lv9U0Ap0v6JbZWAf2grO6?=
 =?us-ascii?Q?xC7HxcfcRoLQM4BEY+nKthxYsSSsy1jD2+EjgqrdAUVRZR9roK/01Lef1GE3?=
 =?us-ascii?Q?ad4fXFMk1YhObmG3XUpl9wB//hC2eepxMY+1PQAsSbFbb5sQsze/ZKo+uX+2?=
 =?us-ascii?Q?B2uPVz4Bj67JpRHqF9EAjszw4eI2TIMue9Msq7Dl99mIDgft97LAtMbQPVdT?=
 =?us-ascii?Q?tG90HgnCuNw4xbTUV9vEFTddqau8NuV7eUE4yStXITUi0KWh1js7+VKja52+?=
 =?us-ascii?Q?u8cRPskzDmIl5r8+D6+5ucyVy9Jlz0wiZQwQpTKHssNS9Bbvv5exfrZDnB8x?=
 =?us-ascii?Q?a7Ilz2gfkExHWmNbgy95igO6xVSKUXAvSSiJ13tbxZH2SEuq4y0on4OCs8ye?=
 =?us-ascii?Q?PKQUWBxF31EDuJRlEqvmO931he+UjGhWtvdJqDfqgfSRYpQs9qy0/Vf4MLji?=
 =?us-ascii?Q?oZ5WZXHPT5S50pNguNMwqw9JYwp2OAhdNekw+eZ4kCo4Tqe/YtqSerWlYZAg?=
 =?us-ascii?Q?yzSfnfwoeAUNOaxB00kVHImNy4ofdidA3dXd7zwmglAngI5JyGlM6ySDJcJf?=
 =?us-ascii?Q?/hA7aqAQB6R88ax8z1rcdI3CxGcoLZePRtaJ0NblAkWBPNpwxpIOmtZBG7tP?=
 =?us-ascii?Q?hBE2OLy5jz//9j4SvELvZvbV43VNJVi0zn85E8Jw8n2JVmTO+YQ9LIZsPDuT?=
 =?us-ascii?Q?gPKFfygMhdx4J5JMdU8zqgQ1Kv4iFxrB9KQYao2R4jwKCSWrHviQLsqke4bs?=
 =?us-ascii?Q?+rSVHtWmfOjdB+8+xqLVSPZJONmpmlD6egfH1KvsLKxvv8rPc0XgNsth8WAi?=
 =?us-ascii?Q?oPlISwfBjnXDfiyVbu4WG42JnTe1PR3ZAeZ/EpOFrr0heVEFElgPsqOslbpW?=
 =?us-ascii?Q?vqEH+2Vy1oePELYY7vpuk4qgqhVzXxIV6t8DB2Ri/pDw3SLgI0MfcOVmWs6G?=
 =?us-ascii?Q?JpP4SHkIHxREdbQELB3G+s01DoXIAALpxQiO13T/KBKp+L5BR1JMcKtaCG1i?=
 =?us-ascii?Q?phrumQKHi3eVA5JCs9001kR9c+MsqaDSDGw5J5w4CUtlvEgDgU/U/VyRlzsm?=
 =?us-ascii?Q?D7PhlhVitF9MzditjVy9BNppyif0UD1lJbRqDsUq8BSf5rZlpxfQ2Kzvz483?=
 =?us-ascii?Q?h4dgJwV1IsC6pOBZbB3LUfHaqItw9ojAmR/d2w2IS7bg5r5lV1Ua+12NUB5c?=
 =?us-ascii?Q?dky4uYbtxz7twhBAoQtFQ/uEnDrPbhY9JUIKc68Toc7crr1AkVFRssw+jgk/?=
 =?us-ascii?Q?/vN49e8INlnjVgcVm3yqdzQ4C8wQ44l5wdVUoinFi3DSajWvic/2aMyz3OtJ?=
 =?us-ascii?Q?YcNe6jEPkUQ0b/wXg/2TduOxBewbtyQXakp2OPMdQ8sk5sH3CNaVakPlwxLP?=
 =?us-ascii?Q?2XHHah4WjA=3D=3D?=
X-Exchange-RoutingPolicyChecked: 
	maszypr2DxO669VF1npYyfZ4G5tblM+Ms4T+/t8wPbm+O3wGF3uMAZEol2jgGkj/sQRfKu/emYZXXCZQ7kKjYFG+s7SuZlw5NLVEilI0ZCl1iP0aCLm0HNefchse/0ShY18/144zU78TL58cfF+csWom5KF1sK1I7vF/viOt4i7ZHhoO5xc9Gf/LPjpmdcd1zWgf1430QfpQdpShcOyBFOAgB22GbAzEpdiG7ITxOgQJ+dVaB1Oh9Pw2dSoaZkmUOOp6deNnn5Oz2+ucmXxq/b7rjE/UNPI+d+N0qt5qCMycCdJnNK26G19pSTSIy+Ke5Z5Lc5REA1+SxLfL9Zw88Q==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4ee73c51-3d9d-4133-8ded-08deb0afd6b5
X-MS-Exchange-CrossTenant-AuthSource: CO6PR11MB5602.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 May 2026 05:24:01.1421
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zzu42U4Vm/VM9Xo0VcSoCeivlUprMRjvdFlVGen4JUWdablsWFbS4P+OyoCIt0tLEw0NcMJS2YQMuLe13rI0VQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB8855
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTEzMDA1MSBTYWx0ZWRfXyw0FlP4jcPFk
 ljYfFcwcmLa+gxRDTrAcw9GR5+paTbTXYE/Xo4L4pRpSnWFRMUZAZlQ61bS7BfKajCLyMK7cAbL
 6iWxVTz6gE+dbBNxI0Wh3jzGoCdFhvnTZA0EF+G6VeGSqwHMi10P3w+eV0d47qd8YswsOuMeI0d
 A1BMhreb1e/VI4NCDYxxz2ulPqGaNWjPtzqfiqkmo/lnEkrVainKol9MYTo5nBIHk7zI2jX9Qrl
 oc8qqiWlVcz90YSq8hzffxdUEWAZjXbTIgfQOJmBEfe/Vop6bSOqctvONa2ynqv85X3JCKKGw+Y
 v2aHsQW+HbXWcZZDScx1WEuzcP3jMQYdVQcWBp4LySmsJ67sbeJyuBI9hUuKs0DjLBM5uAliBtc
 QBxjw6jc9Q+U1oeUzTJlyGh8m5Ukf18k99WIZMndmPhc3RYxYbzxWdlhWRKh25IKdu+HWfz2huH
 a/KKI5nIJjXIJIc8S0A==
X-Proofpoint-ORIG-GUID: PmOWfS2KnpksHKjj9gpum7sIfqzbkAzG
X-Proofpoint-GUID: PEh-fLtJYv434pYbEu8KAuotlXpzPntQ
X-Authority-Analysis: v=2.4 cv=Q7jiJY2a c=1 sm=1 tr=0 ts=6a040af4 cx=c_pps
 a=3V8RUmgbnuIO8ORuzDaQ6A==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=NGcC8JguVDcA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=iKiJcTA2PjBS6x5JeXcw:22 a=VwQbUJbxAAAA:8
 a=t7CeM3EgAAAA:8 a=_aJgn0iUmd-qJxb44P4A:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-11_05,2026-05-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 impostorscore=0 malwarescore=0 priorityscore=1501 bulkscore=0
 suspectscore=0 clxscore=1015 lowpriorityscore=0 phishscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605050000 definitions=main-2605130051
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 13 May 2026 05:24:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/236924

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


