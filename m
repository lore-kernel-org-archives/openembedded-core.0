Return-Path: <Hemanth.KumarMD@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 97B5BCD5BA7
	for <webhook@archiver.kernel.org>; Tue, 19 May 2026 07:26:04 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.16417.1779175560295072517
 for <openembedded-core@lists.openembedded.org>;
 Tue, 19 May 2026 00:26:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=baEaJgxp;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=9599376d2f=hemanth.kumarmd@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64J5F2wS3076794
	for <openembedded-core@lists.openembedded.org>; Tue, 19 May 2026 00:26:00 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	PPS06212021; bh=8XPbZgjMin1DspNpFmFHx0ebJETBpd+3R1VKtxTZUs0=; b=
	baEaJgxpwHuCo3+3FTy32/3axIUDhdzDH1FIEUH0HJr3wph9oX9L3OPyC2ZnMPVu
	zaJddFTegQ9R8172AIVGnrq0GXKN4iwmOyrk91XpPCPi4Xo8x29hS7FhicZHSmBd
	mNA6D3dlSqA/2nGBm0fhJr96aWTOeu9CoG7azcaAH0LoG2PF2R1zwVyY+vgY85br
	On12aBNodrOp+U8MtS9A+iNvtnf4yYx7yJ6sya/KwbRqzYvhhoZUCRRAR1nwoaHO
	htKwOauEpNFbM+pO2T1zxjnGXn1sLYt4XV+S5DeJDh1ZaA7qu0PgjGk7DndkLUWh
	BSETZED755CGh3N1acaoPg==
Received: from ph8pr06cu001.outbound.protection.outlook.com (mail-westus3azon11012022.outbound.protection.outlook.com [40.107.209.22])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4e6r3gaxe8-6
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 19 May 2026 00:25:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=P/edrKSuwg9Ote4eRoowu6oS3R5SwIYZtMsrINV55U2w2LjlFcCt1QhVoDG1WYEI9ntGir6qyaKv+GI90fbSlhAc1bcgnSpSM4EDkAsFvpLR8av/55Si4LRQvrJcfeaGFbNjdeTlINdzIe/Uwb9zwHTbBg7biNa+8jtSkaaxVDzYRuaKKODjrcF3zT1UnEJHhjQYpqbzscXP4S2Y+DoPUn4utET4eYpestoAQx75lYObDbCY59PQ+6i5wlFms9629GGEEWeH9I5+BJOfLhZJq018lCvrHrY+TW+/nxlqX893TajInNqUmbXtHFVoH8g9ZjYibRvtHcQgTFIN4l0IkQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8XPbZgjMin1DspNpFmFHx0ebJETBpd+3R1VKtxTZUs0=;
 b=Zcgvbe9i0EDF3hqpl8AUu+VZp4CjjRt2PjbWUhemvG67lAmJPRO9bxc3abvmSp5XIPC6Pce+l/m6bh9rKT/N+Q9rSHLwpF4PZzUcc6S0l3YTeWKU0BVaZqlkgDhDg3zD48Ri/tYnOiGMM6DE3CpCtdG3yuaSo2hkVLMeuWGfywkcmsUbste4SD/0nWJMQXiwXQ2b5iKdUVJ4t5oM3evOAv6WfRhRR/Vd7hHOXPEqZ669oZuJ4P6gn0hGDNcHoNeWz2kQ3oTfE2kLdMNB9eBz2Ig9dENHziWhqOm9kehU4Ww04XreoZik0gWuMKinPqowsPQIP2L5atQjFvwUshMIHQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DM6PR11MB4564.namprd11.prod.outlook.com (2603:10b6:5:2a0::7) by
 IA1PR11MB8175.namprd11.prod.outlook.com (2603:10b6:208:44f::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.25.21; Tue, 19 May
 2026 07:25:55 +0000
Received: from DM6PR11MB4564.namprd11.prod.outlook.com
 ([fe80::21dd:5cab:fc47:1dfe]) by DM6PR11MB4564.namprd11.prod.outlook.com
 ([fe80::21dd:5cab:fc47:1dfe%3]) with mapi id 15.20.9913.009; Tue, 19 May 2026
 07:25:55 +0000
From: Hemanth.KumarMD@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: Sundeep.Kokkonda@windriver.com, Randy.MacLeod@windriver.com
Subject: [PATCH v3 11/12] libc-test: add libatomic-staticdev to ptest RDEPENDS
Date: Tue, 19 May 2026 00:25:33 -0700
Message-ID: <20260519072534.24588-12-Hemanth.KumarMD@windriver.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20260519072534.24588-1-Hemanth.KumarMD@windriver.com>
References: <20260519072534.24588-1-Hemanth.KumarMD@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: DM6PR02CA0076.namprd02.prod.outlook.com
 (2603:10b6:5:1f4::17) To DM6PR11MB4564.namprd11.prod.outlook.com
 (2603:10b6:5:2a0::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR11MB4564:EE_|IA1PR11MB8175:EE_
X-MS-Office365-Filtering-Correlation-Id: 6487422d-9361-4aff-e5d1-08deb577dd02
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|52116014|376014|1800799024|366016|22082099003|18002099003|56012099003|11063799003|38350700014;
X-Microsoft-Antispam-Message-Info: 
	FVRAwdYN8SsOdpd+0x/EJG2UOxHY6rfENlV+PZLrAh85UtlQwd50TrEkF2bDKyF4X8Q7DbOxQNPWswVXd0/uze3TGBzZQEZjibl4QHnAlw2USPclCNTyr9qCAPdqH/omSbvOgbmVWtCdkZWy6vk29JHqS7p7yh1hCtsQ5qDSeFIFoIAAQ+swKIRm0++GtdqktEhJMmV8ryNcYV4oOzmZmll18oMc/lAX2efOMn9NYabV6N5cWOh/m+YyJeU36FvD/haac7HNhMC7TlnKpIDsIuxtCLXaNs45rpT1eniexPYcbVnIcmsHqeDayut83sZKlUEAZ3/oegLldxk0U9ODUJLGpUIdN1H1KWhC9MV+LGUkS6BYGWWA/dVCboyRQJDmJfaotQh5ml7enVChazPC2LmEyVNdSyP8LvmveeEQnCrwgx1x0K9zEu0OG2AVEpmUDXIwmGB+QxdfejC/e61kDkquHwgrer/V60CaurxiPQiBSbpYgdURe6PqlCgVBMGpivG1xV6lmMI3FQJJStKp5k7pHwlac/gk6ULU9E6LGWSKDiELg5C1nn4SDt85RYBoN139PfDjKYD/VKqlcjfSYZtMRC1vRCIKtKTl7GuPICeddLmGiSFiP9mJzQVn4KDDjLjoXSQ52IQTqXWr204vju9mLcn1lxn1InQpBEzvJQc7OKgTEq82+FPdBD0iheiELLD0K1+nyutomYO6QNQjxsIPLLO1m54XTcZzo94Cn4tpgXPF0fCO5JZAL0D5Oo0C
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR11MB4564.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(1800799024)(366016)(22082099003)(18002099003)(56012099003)(11063799003)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?WvqqENa2LjUkPnvwTaygz9K4Tn9DvV0fd95JNoaqUUVgeJPG/YB1LBVPyo8l?=
 =?us-ascii?Q?QbDYcz9lMOz8eO6Ru0f0adeDp9UTPvlQuYOIlfLcYQdyRpuQ+0Uswf+bRXVq?=
 =?us-ascii?Q?BgR2cvI1Qquk7e3FIerX6N+QRl01xLPxep/zs7mlK83J7bl5lj5GXhtUuX6n?=
 =?us-ascii?Q?KiE81BgdmyowargIPYOMNCX9w1V20NsLM4QEvCT530HCIeggUb9056zgaJRO?=
 =?us-ascii?Q?yj/aAJnlMjgxHjubGbfqbCOpJGlN9dCZA3coRDSMi0gyARcnPzT+gxy0kEAU?=
 =?us-ascii?Q?LB8wPQd23QVIawv5+C8DMOkB8iD/243vbH145vBB5AwoIql6/KsYnVqaOqVX?=
 =?us-ascii?Q?KAGhPwp/g9Oxdl96ErSLFVZL5rarketR5FtmkI5NAKSxrmaJXChHoZ7fml4f?=
 =?us-ascii?Q?m7D9Rjg0Mzx6mcaexyueuPW3u39KrPwy+PdZtHow0oeHF9XxoDkMOwcrQxBH?=
 =?us-ascii?Q?nyujB8qy6Yw5rbg1ZfNj/fpbfTKrDqdwz+A3jzVSXFJdIkPwkxYi0w3uiArX?=
 =?us-ascii?Q?HMs/N9EERAHyKjTgx9oUD73LYzOSg9jGZEhK//HOKaOAfLNeHeaAd5D3Ld/7?=
 =?us-ascii?Q?2NIdfkusF+qr88qDf4bgR2Gfg/HHA2F5Ja/K+td8EoFDNb8OwpTo2s4jkzLD?=
 =?us-ascii?Q?OEfv+MCAnsmJGbnCuDgM54ZEcQ0iSc0aKkIFADsQD2nXDLv6kcOSpP3RMNfC?=
 =?us-ascii?Q?PyLTMy9lHuaXtQResm8LytQnI57Cds+FrNNHqwrVf4MLbcwqlPS8u57Wlhkv?=
 =?us-ascii?Q?haWH45PhcBCcoB6lZo0qq0nPyYQ6t11a2V37ap+XCh24xpVK43VygkZ/5THH?=
 =?us-ascii?Q?GkryZvqdmQXR6IyI4rkWHoEi4H0FEXy6i9WqVaPNnA/mNyYY7PMNQjGCQSF8?=
 =?us-ascii?Q?mV2nNG90RTQwjGnTqnTjhj2YhC26FUZa5swfdeuGdIuNOmpwdlsV80twgssM?=
 =?us-ascii?Q?upOoY2WCGQUkLfCqkE81LyuIklOn8fgAc2LVj9Gf+2QedTSNuoVFGjb+X+w7?=
 =?us-ascii?Q?1LN47xXNa8eh+ldIjr4WQBIvtv6y33BxxKqVLo1NKYfSh6NWx7bSSBDq9Dvp?=
 =?us-ascii?Q?5dmo8saChF78NPcgfVHLXo4o4GqDiydGkCs7AmcNJEL2LJ5e4/MfEIApXyJQ?=
 =?us-ascii?Q?JD/cU0n3Q6CIMONYVOh51VOYSTiucCg5wo9ajlFIgYizvDdwjSvlxbxkufcV?=
 =?us-ascii?Q?SABQTY0YtLSreNOdVoQ3LgCXwg6Gq/RxfcEXNEbB4byGqDGYNSDkmgWMexfl?=
 =?us-ascii?Q?RuL3BUNthc2K9KPM74SUMoQBtr6/am6aWVj+ptlzmLNfoLSMYNteEhySzdu7?=
 =?us-ascii?Q?i3IKXHiYIM3fg2AJzNiqsUmHaOuZc6a4dPSrkmMlHKd5ToxwS7MCH12pABzK?=
 =?us-ascii?Q?gDzT5aK67XUSJsIUniUu1taO0J7DiajMIBXtVMVNlI87FyX7wuvR3n6QUmT1?=
 =?us-ascii?Q?iU1QjU74eA3RAnQ1Wa3bz7kiy3QJwwE6M6TH1BHRUMYioitEp1AEAs4Utc+D?=
 =?us-ascii?Q?fmyBwHCFpce9lbTEd6dGeSZlxtKOL9GYgewsBhSNT4M1DyUJe9/UBXGnIHxa?=
 =?us-ascii?Q?dkKMgwWb+1j06B5rdAesPcyouOpYqfMIWn1ZVJyoeg1ISNnKi6+twI5TvH71?=
 =?us-ascii?Q?eb3GLd+g6FsQit0o7F+VcLA9niLQ7oKm5J4dVK/AKxFTWZ/LxrOXpH/IHR2z?=
 =?us-ascii?Q?fHKtedQlEnrfwt+S2iUOBf/znb1GObWagRna1/cakuji8B+Ddrb8GwLZZ9ss?=
 =?us-ascii?Q?2FtQgQbDAiYszeliN4daicPNdTAVlKQ=3D?=
X-Exchange-RoutingPolicyChecked: 
	gRC29Gwz66O1BT5qfWoXF0O4lrj8LFkE6W8S9mbT+BAyBV/NTY7pZ2OOtaaCoxssCK7oEoCl2GgLnjgwXRi4p31D+n+esZ1OPSt2gdc4pzNfgNbDjoA1lP0ygLA+V9JvJyuvFsdQldggO8+ZY/wBRg47Whv09q6HjQlMtNmU8PQZndUqoE+X+GH+7leIvzncD03dCKSult9ogym/AuJMv/MklmF+nc3mNeL2CiCoIKX9glDo3D2b1vU7nhGIrcH1Pp0I9wC4XfN7fG0/Jf7JqDNO1lkC13W/ZDNyCtN5Uf3s2SGr04CyBkk9+TznH7F/zdtkxUZQ2HilJP5Z0pgRQg==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6487422d-9361-4aff-e5d1-08deb577dd02
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB4564.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 May 2026 07:25:54.8665
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QXIM6tYSbogFo1GZMVenN8pttB+i27mYfycnVvafVvFqD6PzOTo9y/ExxvOGMQyHxEy2o6HZqwMFPdFFUZ9LET3zJtUfQ/L7EqnIElKKITg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB8175
X-Proofpoint-GUID: 4XhduyTVKxGWeTrH6ztF8GGWyCtNVjVA
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE5MDA3MiBTYWx0ZWRfX2fhnyXi/T4tp
 /Ayxs5kPVsua7bFokombF65Y+dh+EMJxoY81SI95cUcEwsjYcqd5ioNdncWEuv88cm+3zteGKoP
 GfPSYpG5hG6BokWh+DDqptfHcSGHmhLgGvx85FNh5XVQE17t1lhTUTzJ+j8dj5KBOkiSa0mgndc
 egPMsskOrDVhMSVCgU+5EHgX9PA/SaEWzzmKeU/VDfncF4NiQJHQ2gviQjIbxsGycNzM4wEtx1Y
 l19nMc09NgT53WXxCM1NaBxL1HeYOk9AkyvlKDOVyQbAAI4MTrh614UDHafJnbo26iNRTqRkCDl
 WdXJnqYCETJMSDlnWECzqfly5Pyc/nf+2VyP9JNPkO2dFk2GPebGQX0+Dze6aR7PjLGYOa/6ikS
 7n03QjFtKUvn2TxLwIpLSmLaUfrWWbjwlZnJAdEc6sCGkQ+8Cr5WC62uZpfg2ZVW0hiidTG2Y75
 8KH/4f1jE857QptBKWQ==
X-Authority-Analysis: v=2.4 cv=I45Vgtgg c=1 sm=1 tr=0 ts=6a0c1087 cx=c_pps
 a=LdSsacNKwWtvIYfRw5AjOg==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=NGcC8JguVDcA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=iKiJcTA2PjBS6x5JeXcw:22 a=t7CeM3EgAAAA:8
 a=Dw_uWjk0AuXv41BXO6IA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: 4XhduyTVKxGWeTrH6ztF8GGWyCtNVjVA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-19_02,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 suspectscore=0 lowpriorityscore=0
 adultscore=0 clxscore=1015 spamscore=0 malwarescore=0 impostorscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2605130000
 definitions=main-2605190072
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 19 May 2026 07:26:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/237286

From: Hemanth Kumar M D <Hemanth.KumarMD@windriver.com>

GCC 16 adds libatomic_asneeded.a which is required when statically
linking. The libc-test static tests fail on musl without it. Add
libatomic-staticdev alongside musl-staticdev for the same reason.

Signed-off-by: Hemanth Kumar M D <Hemanth.KumarMD@windriver.com>
---
 meta/recipes-core/musl/libc-test_git.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-core/musl/libc-test_git.bb b/meta/recipes-core/musl/libc-test_git.bb
index 9d159ea9d2..d9999ec377 100644
--- a/meta/recipes-core/musl/libc-test_git.bb
+++ b/meta/recipes-core/musl/libc-test_git.bb
@@ -36,6 +36,7 @@ RDEPENDS:${PN} = " \
 
 RDEPENDS:${PN}-ptest = " \
      ${PN} \
+     libatomic-staticdev \
      locale-base-en-us \
      musl-staticdev \
      sed \
-- 
2.49.0


