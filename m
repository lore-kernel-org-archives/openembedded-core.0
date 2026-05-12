Return-Path: <li.zhou@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 08476CD4F26
	for <webhook@archiver.kernel.org>; Tue, 12 May 2026 06:56:03 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.69765.1778568959301729701
 for <openembedded-core@lists.openembedded.org>;
 Mon, 11 May 2026 23:55:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=TWxYQ5Oo;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=959290bac4=li.zhou@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64C55aci3447047
	for <openembedded-core@lists.openembedded.org>; Tue, 12 May 2026 06:55:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:message-id:mime-version:subject:to; s=PPS06212021; bh=qrhk4FyOc
	am3YPcJCeD9XFlNcnhIGXK+to4WcfVe3pA=; b=TWxYQ5Ood02XYOrUFwmySdC93
	9KvPS3eT/wpkuWqKIsZCA1ZDUrfO+tgGhIyWqrRAwCf12btfMaRGwZ+wZdT5WLP4
	b+ybdfB5kKax4xu0teHiIvSEvlXQsDqknzBaDRX/hkA9Mdj8GcUnnmEZ+xq9ofJ8
	3/4AMksW5JtfdcPKg9WZchb/iJhMaRVnZO5KYKUTnOsJ3bcffpskgGUpuEtWLAZP
	vT/rRj4n8cYzFtHLfWKewmTKZ6uXq1WxegvFSXwX0hW9vFYjHeaTygyJ83TtzZmu
	vEHr5vCUAiMw37FmijG5Juk3JRSufsm+AhCDWeJGstGBB/52il32QBya358Eg==
Received: from ph8pr06cu001.outbound.protection.outlook.com (mail-westus3azon11012053.outbound.protection.outlook.com [40.107.209.53])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4e3nvhrhbd-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 12 May 2026 06:55:58 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fWxlOwkd9+HP7Bg67tC4zQEqlcb1//pMvlPhatOloz1suR/b9Ktbzu+xUonTc9Yyag/KbgRwUkZGzL0wIgeFGKc7wEklbjlaYx+qISBlbeNClrsBxu0DIIQcn2bPnQIDAaK4/fo7ouXfK74bnt+PAD41lV38YGxd5z4Py+z9Zu99X93JyKRI8Ty9SA3d4NGh2wplPVAZ9hBL+pbljr78ooixbZdM7JWIZKs7ybLzPFX4cXrkUQsMNnNvX+PHFOmg32vfNkDFKdw5Eyhn3LZcZre4dXd82nzLPBqwK8TmBLup11BrT2g6IOixPds9FI1t4DNoclwC7pzxv9IiU3nWLg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qrhk4FyOcam3YPcJCeD9XFlNcnhIGXK+to4WcfVe3pA=;
 b=jifRzfLr+ds9imeUU08qjwvw/z6ou6W3wvIel42eA+rn6xvqp+S2VspGECKAaL/EIW2/ihoUqBo0fN71BYlI0ec2VaUQamDi0nKR2zKrxB1KVqbO0B308KPXBc0OlLZamL6smGDMG47spSpuLN1BDHttyQ+CmbErmM4mEesCFMjMPIbc7RecJP/SBkmadIkBQ1kKT5aA7S2fT00Bp24p1R7McIKGsb38PJRzRBLPSFesVsUeq7R1I7ZO6k6kIvPDSxLQK44LKWUGtj2eoxKJ06iRPktg2vODEOPLV1uWMvBQuagzzF6IVVZmn8r0qYLbG0/3la8UDWS0diJ6/x1CSA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from SJ2PR11MB7453.namprd11.prod.outlook.com (2603:10b6:a03:4cb::19)
 by MW6PR11MB8312.namprd11.prod.outlook.com (2603:10b6:303:242::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9913.11; Tue, 12 May
 2026 06:55:54 +0000
Received: from SJ2PR11MB7453.namprd11.prod.outlook.com
 ([fe80::3198:3bc6:ec3e:b2ae]) by SJ2PR11MB7453.namprd11.prod.outlook.com
 ([fe80::3198:3bc6:ec3e:b2ae%5]) with mapi id 15.20.9913.009; Tue, 12 May 2026
 06:55:54 +0000
From: Li Zhou <li.zhou@windriver.com>
To: openembedded-core@lists.openembedded.org
Cc: Li Zhou <li.zhou@windriver.com>
Subject: [OE-core][PATCH] xrandr: upgrade 1.5.3 -> 1.5.4
Date: Tue, 12 May 2026 14:55:35 +0800
Message-Id: <20260512065535.117922-1-li.zhou@windriver.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR04CA0206.apcprd04.prod.outlook.com
 (2603:1096:4:187::21) To SJ2PR11MB7453.namprd11.prod.outlook.com
 (2603:10b6:a03:4cb::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ2PR11MB7453:EE_|MW6PR11MB8312:EE_
X-MS-Office365-Filtering-Correlation-Id: e0ab41b9-4c93-4891-ec45-08deaff382ce
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|376014|52116014|1800799024|18002099003|3023799003|38350700014|11063799003|56012099003;
X-Microsoft-Antispam-Message-Info: 
	uF5sdi6KTODdHQkbukoM3J9JOpFJHdrVn6jfOTRhBT3DlU39mdiO0aSfeniKwLWp79qYT8VFx77rWPrBGk6CW8uoGuiX041BH3c5010QPIoMu+GX1e6wd0zNiuU0CGRuGZ0TakDjQTDX4QyJQxEPRAkvwkJEh2G8XuhmJ96jc5YVbX77ETw4GD02EGH/1LzA0XyuLFdUu8OZGhLBccuufhruPM1aCrO9HlOPgSMhd1jGxz5uIaMEknuGv/XX5TUv3P395CeEsHFWTrZ5fGNnt09NowBcfntMOgidKrLwKqE6XDsymbepmMlsPVwr9OPoXy1QtMFYR1MliHe7uNPqbAOWJ+Ep6w59yr9MMdBnrOKhQvAdMMlS9puCAgd5BfKSKWilVfxyBMmm3f8jvUCfda995f+9maKASjvsknQE95u+8yj3O7ZjPABdwjkqJZQwSh8TC4cL7/NY8A5n6lOPtaMUbX/SBuNieCE1L13hVxUhMgHZX5docKi7F2Zg/zcQwdtMWv31jdH7l28SJEdc20F+WmypH2+eUZzKYgHzA2NUHIqg1AjvXucL4/JAqU7tecHfFFsZY5msr/tCSqKctSA7ipGG0fNOg0+kmge9uspbjMafnjz+Tem/a4kNFFs0EDklkCxwWFjXHYraEPRKJO3JuaaI0Sj5W44LdG7M03+p9+VIdaGf0mm+iFzXyuNajg9aKOM6kx2EJkDsC8rBBN9eCkB0xKBQ920TNvVd+R5yKZGkEHFLiu6LDYW33l8a
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR11MB7453.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(52116014)(1800799024)(18002099003)(3023799003)(38350700014)(11063799003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?a6OpCqaFfHNDeW4cFS00HSxuf64sUcI6eKNpi9dm1uSmS6drenYQup1OMCnt?=
 =?us-ascii?Q?a1R/RrpUKuh/T4H/mu0nHJZp/e2/qyMcfIisT9cqmvIueprFM6AoxgLF/l8m?=
 =?us-ascii?Q?regYDlzOolZbv7v6EKE/mdlHrKo1KSxogfmii8yxHZOYaGJ4i3UQUp/3xGf4?=
 =?us-ascii?Q?T+OXpSizxuSEXLAvzRbh2hhFrJOVtyCEKq19QB3QaZXajaL/u8tiakTBRjs4?=
 =?us-ascii?Q?A6LxHl2TbgLZyA/78SVZGI2cGdp70vWxyfFqA9vc1dTwq8t88JVI6s0N8Hjf?=
 =?us-ascii?Q?AeIsxP/t8Lzzpbrl2Ft4PeAULZijR2h2yEF8jTI4ybppSxhnP3y9ajzhtcnJ?=
 =?us-ascii?Q?ssezi944OCtCcEs/Hj/jg4bDaWNF5YEbOwJLzvCu3tNaRKPfj5y8tGZ6ADh5?=
 =?us-ascii?Q?njdWZQ9B/xwGBksv4vC3LEeUY3EddJKHM0EKONd/2x8g2eXHrQxoJ63qhG+x?=
 =?us-ascii?Q?yT6T8mdwzEae9YMfMwy2FYxMthIHVyGqagj3fEYtcXm5DCm5Qdtu1IqfQ4y5?=
 =?us-ascii?Q?1q7/NhBQrlv7z156BPH80Oc7ksf+0Ytb4h/4gK0ZBGvROmBITOU7jMlfh+BR?=
 =?us-ascii?Q?o/Hxe638NT8F4mCwSIwTJvLpFKsua36zswqlc3qVNXC65Jn6Aiexd9Zd24+V?=
 =?us-ascii?Q?t8ueLi/WfcLxJmuUeMLQjYTL8KHVL0DZufMjbWAqkgpDOtRd0W5qKsZR2i3t?=
 =?us-ascii?Q?utz2aKqOCMMywL00FdhEVggfYkRP9kcnjiXWXb9kE3O4OeupemcAm6hoqVnT?=
 =?us-ascii?Q?xj8bVYkRc8RGNZXz9iY48/3uHP9a/il3GFEr64vcC4BNFTcIXB4tUyuwQppE?=
 =?us-ascii?Q?CHAkGC5WwGsCroOOrFwEnH6bXRpIa1dXkJyTC9PSSj4wcKpWO+jiAnBIN4pM?=
 =?us-ascii?Q?g0SLb1p/rs9+ojRmPnjHNoCy6gBMZX8hKtBNc1X4yKAjmqMNpHlEFnc6tvB4?=
 =?us-ascii?Q?N/GLvlgNgxHlQ3Dy7FE4e23bnyfZ28zHmLf1bP7dH0IqYHlZCdyJurkurvtG?=
 =?us-ascii?Q?xGlp8fYoYqla5gDdrsuQqoZpzEH+mSWeUUUbHBliazcWrKa0vCpzJ+JOXZyU?=
 =?us-ascii?Q?X1jp15R/bFmF1NGXZL7hW+Hy69cfCC4esmoq4Gpcp/xEtVqf5C2inh3xzy0L?=
 =?us-ascii?Q?jRSzljeqA4L1I4cRD3bE2mM9t1gV+iez5jyM4XGuHoTUyrUJdTSf+azO4MdR?=
 =?us-ascii?Q?c5s4Ys3FPpm0bgbNiSVBlRaiS8rG9i/nowq8yDIAxRQsfLxkriFIlc3ttURV?=
 =?us-ascii?Q?crrfG87N95DPnddBVo+Cq6zetWlHthKqM57+IGKinMuFGEUBm0RDeDxNLevX?=
 =?us-ascii?Q?W81+G0Eozzqts7YQVUNxxTC++O6Ql+bx+9/8nQWr+MmDFh64GQIkGXeyUrZ2?=
 =?us-ascii?Q?mtEXQKNxOgWRMQIUeWN6NiNCqpNCiiVwb3+zyI8UUSz5H1IZ6vIBhmah4I5x?=
 =?us-ascii?Q?5QfMZQj0PsYUr9g2IuZdZSrP0V3J2PCxtwBMjf3wsuftPI5g4HAnWK5tWvRt?=
 =?us-ascii?Q?9aBowM1FLkbW5VPOXfHts5BBB7+LHw+EAN9TjuFxCP7TVEytR0GRV6ug+ZI5?=
 =?us-ascii?Q?P7m231g886ELLwuur61MiDxIS7e9kFHJa6tQEiqZ6uQL7TnIyXYOc6GJjNF7?=
 =?us-ascii?Q?F9D3EcbxkmYELFM3NfENoIti83Po0K0Fbt0qzlfXXhni05GG0J/72YYx867T?=
 =?us-ascii?Q?6AnO7gCEqkNpznRdmT09jvL4mFB6IgiX7iur6/UnhO+2W4cY01HsstsSR6/U?=
 =?us-ascii?Q?/HwaWwEbAQ=3D=3D?=
X-Exchange-RoutingPolicyChecked: 
	rTR8OwRL+WdQqYtQ0/3C8ffT/UVf1If0yG2jI8fTBxnRpBWqmaYKHYmEmqJ6cygRJQ64jRujN3DJteHm8rwijTXbpn8mG8Hl6LDfsX4aj2vbmngLjY7xs9/PKLhUzSrApvwdMMBbgEW9ZMNdY4wDfGJIBaBT6i5+7wZ/6GhItOijhhYM7hy0NwUvZIDARIOlOiHeX8D6zitrXKDrMlf2nQ79K924IqUGLstNBuMkOqxn3uZ6KEKuNYsl9gmBMJSrAG59G3ip+yieKfZPua9x+5v7dlcHlBO2wq7msUUilxYuzUhDOUkqdqgNgOodsjOmtacSz4LAp8ESM4DRPA5XWQ==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e0ab41b9-4c93-4891-ec45-08deaff382ce
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR11MB7453.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 May 2026 06:55:54.1162
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HbE/ejJZquEhVun/4/IfT/BQPY2hQh+blpeo1ugczvRbLO4Kas6HvPIjFwEbNGtVIRvt0mSYMMua6CS7w2rtsQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW6PR11MB8312
X-Proofpoint-GUID: ArXjGXJtLb5tCI7Fp1jimQCsfK-4VtCL
X-Proofpoint-ORIG-GUID: ArXjGXJtLb5tCI7Fp1jimQCsfK-4VtCL
X-Authority-Analysis: v=2.4 cv=b4mCJNGx c=1 sm=1 tr=0 ts=6a02cefe cx=c_pps
 a=5XdDR3/zV2dQAmk0xmzXVw==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=NGcC8JguVDcA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=klDOsUkWDRETUCZYPvoE:22 a=t7CeM3EgAAAA:8
 a=F5Vi2CEgCvfDx2jnrcAA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTEyMDA2NiBTYWx0ZWRfXx46CR5eOACx3
 dLH0/OlYA2JEoQnG4Gm6j1iHiNNY3DhQASbcJJzJmdaycRAlZ3U6hqgC5lQbIn0zQSJ5NSL0zlK
 061kxFYncKlwV9WtoLXKLkfcjN11VIjT45yqe1eIFIz1GX1fUaluShilKpfGiUx8IovYrMTrOec
 6vmTjii+/1wC9BFplXrZOvqIdXGaMF0bO2AY12dy2lvvBQfYorZB2ryLm0sI5uNb96PzUj5KFBb
 YbLLOnwlMw4PlBaNYPLXIKSZi+y8uHIyOarxydQ22oL/gQmxpmGu0RdVtAXKtf2vNK6Frou1+sd
 CjxCp5t7KO7/Q8PFCYikGYU9vvgWIDt/izchTSrZeK4m1Ir9L3wgH8N2sJkI1QDb5vFUIhXGf+/
 pr0nRLULaZlTkRoa1+yUQlQTFiV/HGl/NrIKN0As/Gpy5GpvLGmkW209NZfrLMjnTAQ4+XyPrXN
 +1aOF/MOxTj/ZexAecA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-11_05,2026-05-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1011 priorityscore=1501 lowpriorityscore=0 spamscore=0
 suspectscore=0 impostorscore=0 bulkscore=0 malwarescore=0 adultscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605050000
 definitions=main-2605120066
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 12 May 2026 06:56:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/236851

Changelog:
==========
- meson: Add option to build with meson
- COPYING: Add missing copyright notices from source files
- gitlab CI: drop the ci-fairy check-mr job
- set_gamma_info: fix heap-buffer-overflow with empty gamma ramps
- Add more checks for malloc()/calloc() failure
- Strip trailing whitespace from source files
- man page: fix warnings from `mandoc -T lint`
- xrandr man page NAME line doesn't give functionality
- Additional man page formatting fixes
- xrandr.1: some editorial changes for this man page
- Improve man page formatting
- xrandr: Warn when running with Xwayland

Signed-off-by: Li Zhou <li.zhou@windriver.com>
---
 .../xorg-app/{xrandr_1.5.3.bb => xrandr_1.5.4.bb}             | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-graphics/xorg-app/{xrandr_1.5.3.bb => xrandr_1.5.4.bb} (68%)

diff --git a/meta/recipes-graphics/xorg-app/xrandr_1.5.3.bb b/meta/recipes-graphics/xorg-app/xrandr_1.5.4.bb
similarity index 68%
rename from meta/recipes-graphics/xorg-app/xrandr_1.5.3.bb
rename to meta/recipes-graphics/xorg-app/xrandr_1.5.4.bb
index 75656af9ea..ad864c8ed1 100644
--- a/meta/recipes-graphics/xorg-app/xrandr_1.5.3.bb
+++ b/meta/recipes-graphics/xorg-app/xrandr_1.5.4.bb
@@ -7,11 +7,11 @@ reflection of the outputs for a screen. It can also set the screen \
 size."
 
 LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://COPYING;md5=fe1608bdb33cf8c62a4438f7d34679b3"
+LIC_FILES_CHKSUM = "file://COPYING;md5=97a36d5c66965b1cea4666b3708ca6e8"
 DEPENDS += "libxrandr libxrender"
 PE = "1"
 
 SRC_URI_EXT = "xz"
-SRC_URI[sha256sum] = "f8dd7566adb74147fab9964680b6bbadee87cf406a7fcff51718a5e6949b841c"
+SRC_URI[sha256sum] = "2cafccb2aaf2491a4068676117a0d4f90ab307724b96fffc54cd1da953779400"
 
 BBCLASSEXTEND = "native nativesdk"
-- 
2.34.1


