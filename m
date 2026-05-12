Return-Path: <Qi.Chen@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D3BEECD343F
	for <webhook@archiver.kernel.org>; Tue, 12 May 2026 03:26:51 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.67451.1778556402760211064
 for <openembedded-core@lists.openembedded.org>;
 Mon, 11 May 2026 20:26:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=PhfelRF8;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=95926deccb=qi.chen@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64C0eSXG2992667
	for <openembedded-core@lists.openembedded.org>; Tue, 12 May 2026 03:26:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	PPS06212021; bh=IW99ojSc++WvF+rAW/RtZtQhOmIT95W8Iisezk/c3+4=; b=
	PhfelRF8SxsfAIFlDq+XPUyfDw5uWxiFrleIDmxIU45Y9Pup7O1S1z2eGLhhb9SI
	cQMqNa1bZZoVUgSfuea8u1yrbVLUvMJZ3O70JjJ5GabSnB61wSrcooFMAeHNgtTp
	5t/sRono8P62nEPJiCwFwINwbRu33nLruJ/wFXqfsz8mjOVIwxgHlf1idHXfYtvI
	1kyItoxHp08/nbLK3RLdVOCqPs/zzWl4nrqZJOReQhjdsOe8UcqjWAPoZxBvShxZ
	uvBL8YtTNSCOuBjulSilbWaaHXsbiumujRO98PBrYntP5ZDs6O3yS0FkmNxjbjNj
	OhzFY4rRVjSFqeMf0zzS/A==
Received: from sn4pr0501cu005.outbound.protection.outlook.com (mail-southcentralusazon11011065.outbound.protection.outlook.com [40.93.194.65])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4e3nvhrc6k-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 12 May 2026 03:26:41 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SMNviFFaeOuJH1mqHTmCMTBduji57SaewPE9DVVEMbLOtfnC+tV1sp0cXtT7LWbLjnLIx9bK44fWo4HPOhOalzNGOe2eAW1hYV6mEnGfMUbg+Mep9I6tdZP5AsPIfI00PkIhgOvDlfT+wpv9zQ2BoIm8v6FiO4Z/XbURZht9Rr8Inf/7rgG/snSiRKmGV86PZ4Xzq8eya0bZpHZ9Rqqg4lrrlw6IWPJGrL/0WGR/LmwHHOw++cRkqJHWLS6XLP64ywaJpcL2YfXUQlDgVUjeTUFC3WSiuaoxU6dSUez9ojcouIEBO8CTiAmzJpQ7k2L6x+/GX46NCTo6c++FvTEduw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IW99ojSc++WvF+rAW/RtZtQhOmIT95W8Iisezk/c3+4=;
 b=DbfNQY2f/P4cDQx8z0QYZ2NvUoIfjnTWrbpebJLPkNGKA3JNNBVOxZi6QKoyLRl18ZmHPqaD/2jA5eP1zWBA6oJE4j+5ITbM2kM8OuW3/VPz8zWjKXi/zv6SdgbRlEpPFLoTiEiU8SOV0jHpK1cGp9EAB0TZMr1wIMyWZJNGdyLN/hhiJoXjUmJF+4yRBtqOaTiB3MuyV+fWxMdwhXujCxAVMsFyaTTEPjqNMEPyShZiQCxROA5Pj9q3Z4pbNVExtAhUkTn3syKwR9VjXrBrKdqte5i5PNsPsZZWcsbQk1Gsjnvabl9oz2zy6wbYoNGagaxrRc6PL0o1N4bm5mg/aQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO6PR11MB5602.namprd11.prod.outlook.com (2603:10b6:303:13a::5)
 by SA2PR11MB5017.namprd11.prod.outlook.com (2603:10b6:806:11e::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9891.22; Tue, 12 May
 2026 03:26:39 +0000
Received: from CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::5ad6:8f90:b01d:2c62]) by CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::5ad6:8f90:b01d:2c62%3]) with mapi id 15.20.9891.021; Tue, 12 May 2026
 03:26:39 +0000
From: Qi.Chen@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: alex.kanavin@gmail.com, randy.macleod@windriver.com
Subject: [OE-core][PATCH V4 5/7] kmod: inherit upstream-stable-release-point
Date: Tue, 12 May 2026 11:26:12 +0800
Message-Id: <20260512032614.2814369-5-Qi.Chen@windriver.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260512032614.2814369-1-Qi.Chen@windriver.com>
References: <20260512032614.2814369-1-Qi.Chen@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SE2P216CA0105.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:2c4::16) To CO6PR11MB5602.namprd11.prod.outlook.com
 (2603:10b6:303:13a::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR11MB5602:EE_|SA2PR11MB5017:EE_
X-MS-Office365-Filtering-Correlation-Id: d51ff094-a50d-4acd-bebc-08deafd647b9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|52116014|366016|376014|12006099003|56012099003|18002099003|22082099003|11063799003|38350700014;
X-Microsoft-Antispam-Message-Info: 
	ixMHQg1WcdORZfNu6LkQufUnwr8z/zPK0tlx4MbsjuApRAVMg4HF9zzMbXva0l34ZD/wYRFZJuha8PupyDj2Jr72MKmGHs4aiey7DGOtlEw+PjcG8pHN7DZC3rAXrljAGy4cOrveBnTQUKyI5jUXA/4E9+EFuIGlCrTMkUv2UZT+seBH864AvgcjJmOer/76bec/K+gXx+EjZHcvFVSHSzd4uZlfhnHihyCzfmTy3YjpofDnob93PkvT4lr0ScyzX4A1YRy45s7pt/SoB5eo36GNq6XK9+ZSs1beu1YMYM2yQskB4T4N60w1qGKx7qocCZcEyyBhhJEhUPsIE/MnG84HnaCNkAVev/FoIQt+672cWpo0aBVG8i5O9fozT27EKfa0H46Nre2xjaz+Xtz5BU8d4ukXCJN+WyAI5Nv1a8QImzfs831xo5R5xNJJXt8lNha8JJqhR0gDGm6SpKco0rH3VvNCqDP4m0ptJ2q/y51fu3yXem4lRmqMJ4QIZn3uvYKp3Wlwu6hItxUjGblMBo5HoiltNbq8i+I/tOf/Zs1elQuxC6ufQLC8/vj2lpwh7/V8/Q1LVw6iAKywkYuaWkI4m324vESMpYiswtRUKYVytwm8KbQ6fgxtYSY2GOLW0cQ7Vny1WDx82LiENxre0jRsDy6U8zSDerlfvjksHWnpM898sEyI2u5l7H5+qPOmyIG5/mDOyLpXwePaMB1hboxkscr7XCX1BHTpgRcwCY3RshZVY4DkyEs6X7YhaS30
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR11MB5602.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(52116014)(366016)(376014)(12006099003)(56012099003)(18002099003)(22082099003)(11063799003)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?+kwGieWHz3fmFOfckQKnOc3zhAIEVGmNeMDuTG9cQ0QsjAXMaxYy3D2MpgWF?=
 =?us-ascii?Q?GrqamuyTLX6tSt2DxxVdYLQxe17gExQS9OvoLlMI+rBe2iIYHlDhChSshnC9?=
 =?us-ascii?Q?UUxPFSMTumJJxeCUS4FMBglA7kwRpeeM0bEV7cewtUwCkG+uytMnyq2/qJJl?=
 =?us-ascii?Q?aV8IKbmLE8/61qwy6VHeEe7VQ+mKYANbzPIYOfL/pZsH8Y26Yg+t4Vr4qisZ?=
 =?us-ascii?Q?DXmRhTRpUfF3QeGad/rqQ0mBTMpOuKSQOx1huagvBgHHBil9rpNGaakGUe+E?=
 =?us-ascii?Q?vTx0Tvi2VGMZhkkqNOnFSUvmm6GoXSoGgvt5qnBQjReZCHRLIzKAkOf9//Is?=
 =?us-ascii?Q?57le71BoAYkgl8c30w+bTV7YTjkrrUsg1YQBgw9D/kCB32v43J49ZFXz4eXa?=
 =?us-ascii?Q?bbjunmU7s62VGfd3/ETdfQGCeEF/2Axqu4K/cvJqyF+NSFQ3hVS4eyGHCgqX?=
 =?us-ascii?Q?N3doj4QkglMjO92VbUg6tPgvEUsjIEinp81c4Moh11hqAXQqFZDkbjZq3nCV?=
 =?us-ascii?Q?vP3IURBKn0WgZgYmZW8nXMLDfLEzCo1GAQAH3AWw58vMcY7VbrC0s/rWrDAm?=
 =?us-ascii?Q?06p4mlJDWoq08prDLjuH4OIblcdgnE7J9CSdqpHb49fkMBM1T4y/nmW6/MRZ?=
 =?us-ascii?Q?fRAYc0q6olvm671lM073UeVErdAmQYlBB+tz4M4+0eltXhtg5r4ovpiRJRjv?=
 =?us-ascii?Q?2Scun1ckvm592yXKJF+V+ZfTRYAxW485y5ujQBPW0/Koi/tel9v4nh/O1nHs?=
 =?us-ascii?Q?INkrgDmidnV1afnQi1NetNwTr4cX5BEbIWMlIvdML61f/czob1PuSLoBPI31?=
 =?us-ascii?Q?E5nrLiE11KzJH31708g8Bg/IoS+cUTxfQF4dByhPozPvym+IS2Dart2f1dhs?=
 =?us-ascii?Q?iaqpuGCV0Sl7mJ7c2nqY/ot8Nx+3WSLMvhR9TcY//VNqdjwz9CUztTXYTevn?=
 =?us-ascii?Q?bTiBb51p9P0fI5ysqDW9yyv4iu0A2O4JhUXE2YdlSE1pc2FQOU2I7QDh5EqZ?=
 =?us-ascii?Q?tCA1GtCtyowJZ5W823vplo5LlKb8xnAROfJPBLDd1K1WL+REnjmFhXIpo5AH?=
 =?us-ascii?Q?XpwRp9oG7eu5hGxxoV7fIBy6Z48uAJbjuSmz91kdMoO2oIN9vL6Sii8ZDxBt?=
 =?us-ascii?Q?JIW9gp2v12tRU3ovJ4IQEvafRkThOgPfotjgduPYjqy1I7NQ8J0zhqXm85/F?=
 =?us-ascii?Q?ixzZn0Pmgb3ffXiuP9Bcfqdk5/IvaGNubWLypYyecsdGW6HngXl7+pKVoWLe?=
 =?us-ascii?Q?gfgUvQ7MbxL/zHV2SyCJwOqEInulaIOrVYaaclladx4VqW23IrE1EHiGEcVB?=
 =?us-ascii?Q?DuUEkC6TUemMH2l7s3nAuiLDfLYi7kHpQktsJsJ1bmlUxCPPz1xZ+jDhE6S3?=
 =?us-ascii?Q?3eZDSWUg4b7+OCnhFjiMHLBOQQVYLOtOj1lsgwinFdsfpferIYFDEwhhytGw?=
 =?us-ascii?Q?34GDAvhv8U6kVF4pRk54AcfV/kTHQPVdMPoHyiLdYpsg3OuekTvlSb+2+TMg?=
 =?us-ascii?Q?L+FTxVl2vF6+ftH/TU6eb8vqZs/KKOYTNqN8A58Zz5Nb02N4iyoLxl45WeJr?=
 =?us-ascii?Q?UcM9uZ+PaGIINrngYfVZP8JRVBpt381cnLF3NXBIezHSzjiZzaP3dsiHGeKB?=
 =?us-ascii?Q?kNl/1DQiFolwZHQKPzVdRD1g2FjDeRz3Hf70K3kWAmqw/wTKF0onbFQ0UUD+?=
 =?us-ascii?Q?HkfSE/boLBzCI0r84NAeDnXCq+ODhQdXmlcMGCizjXgU0Rognfa+o1vvstc4?=
 =?us-ascii?Q?hNcpIWGv1w=3D=3D?=
X-Exchange-RoutingPolicyChecked: 
	ACrsCTZr9tuzyu5vmr3EFfjoReocd+CCykDlViTpQk5xk6HPLjY5jYeYmM3Q3QXPqn+rceAdQvCuuQUJH6y5fQ/JvH9VDwPXMIOMPd9jcPz7y8iy0o951DNztIM9+oHHyA2MB8toGqs/l674fPGHwneHjKEkEB3NDWjWiVJ2joq6DhXtqN5B65N28T7eUQgujgtWPmh1FJZY9GQ08U/z/y3iunAu9M1U18Z1B0QNiZrGjZJ2yY1NNf/zXw2dmgkq6GwfC1Wirj8dxcPlUMoPEmRtWFgHFrhCmYhn7ERuB0EhLoB3Hyx6scEYJqGWW/xkh0zEGx0cM/F6klupjKZG0g==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d51ff094-a50d-4acd-bebc-08deafd647b9
X-MS-Exchange-CrossTenant-AuthSource: CO6PR11MB5602.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 May 2026 03:26:39.8069
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5CHeO5Q6bnpFExzFLUrscknzNKCHq/IBOuU/Z2fOgbacn5UN10dQ3/sPcTOZHnvd0+WZewsrUxg0Ov1IRzq6IA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB5017
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-GUID: zQv-jBOn5WS9oJ8pOKIrRmwTPhHPZf7q
X-Proofpoint-ORIG-GUID: Mb5slEovQCzd5O6Vx2FSkyU2pJyXYtLL
X-Authority-Analysis: v=2.4 cv=b4mCJNGx c=1 sm=1 tr=0 ts=6a029df1 cx=c_pps
 a=JPuSXJPnATmcGobPKBfcew==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=NGcC8JguVDcA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=klDOsUkWDRETUCZYPvoE:22 a=VwQbUJbxAAAA:8
 a=t7CeM3EgAAAA:8 a=_aJgn0iUmd-qJxb44P4A:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTEyMDAyOCBTYWx0ZWRfXwaqrKzb5PDne
 tIjczNIHzEDolS0+JGdfe/VBs1h5YQG1dNfspKosOLJT1KN7VZlc4R/5WI3i2PYP8WWvbrZtRQc
 ZJyLp26bzA2vWSHvjcH1lB/gaG4DfQp19xqJm6OXTZV7NWC6/tOe9ofhuLZu/kF1G6pFsG3h2fW
 y/JhcUQHCXL7OV3yuXVQSrZ/LdxkeVj+iAyO2mtn926Y7dJYsc4HEqfgBLcgEENHYFo6gt1zGrH
 N87ODHTQF9X3MgjPsKZyPW4UFrTjt5Y3DVTQLtRj5tEl6/h8XCl00FbEZj4h+leGSvWouy1Tf9o
 BDiAAY0fGCC9GvXLf+0R95c4+qc4ExyTf8TIeLc0x/7EtfdpQkq0UidibYv2MbyibNT1ZTqGJNS
 sJrBQlVvg2J6tmmdkKNxz0Ll/CDueMSWc9CrFoBFpHV+iJUrCtFBJSkxq7BKMHd4uB2O0mjQXdG
 xjMAdVuHmOvPZ08oydw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-11_05,2026-05-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 lowpriorityscore=0 spamscore=0
 suspectscore=0 impostorscore=0 bulkscore=0 malwarescore=0 adultscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605050000
 definitions=main-2605120028
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 12 May 2026 03:26:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/236848

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


