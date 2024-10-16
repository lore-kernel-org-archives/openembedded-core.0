Return-Path: <Jinfeng.Wang.CN@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D4BB9D1AD2E
	for <webhook@archiver.kernel.org>; Wed, 16 Oct 2024 08:46:15 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.18686.1729068368541483511
 for <openembedded-core@lists.openembedded.org>;
 Wed, 16 Oct 2024 01:46:08 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=00190da98c=jinfeng.wang.cn@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49G5snQs016882
	for <openembedded-core@lists.openembedded.org>; Wed, 16 Oct 2024 08:46:07 GMT
Received: from nam11-bn8-obe.outbound.protection.outlook.com (mail-bn8nam11lp2169.outbound.protection.outlook.com [104.47.58.169])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 42a3esgceu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 16 Oct 2024 08:46:07 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lB9FupQFM3b9hV9nRxTnVRK7uz0OBIOazHwGkTiSI53NB61RyIUs0fgZG48i28dMYcYuqHDCI4ZK7GRoVlZ06TkNjC0OFDLgGSc+AMs6BDUMSsJ9Vz0dVacQJsMLwLPJ+5vqvxWfU2BxHQYQVGNPD6PraxzUH7XkgPzQYddhjn6W2P7pee15WuZcpxrRL/3kDqprNuBhNBxiQ9qath377BOPPNPYKjVI7bXzDX/SGqk7lSckOrkl0L7bATGD5bjVpyc/966USkvU8yNWl9pdXwd1FT5aMM4vPmgvIDH2imwufRa/LWuc899/86yUR21dSqdOiqOolD/AdN9SjHa0Jw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Jjn4COp5rTUUpFD9b9QK3mCDsBmikgSyqD3WFS0I3uY=;
 b=xdiqkxvtzVmnfcE6946pb9Yd7U9F5LvHbCIMH24r+Pp7BIicRAach2qhJR/h83xwVR52eC5v500ejYAVuGr7m0rh6KCoM2SQC4jgF2/1kLKhbsMaly8StDj6wPpmqdtANqmcYzY16qZRjW8cnyr62Oi3Y8VyGHXjY9mN0c0jlRMjcVsEybqPyaKibJjwjYvUPKv6nhdiqU0UuwrQMlpHFHEUadN18aOuOz29nC+UKBWqeyzuomyQq7NnFJLt165Ei1dilVGA3eGL2gREwMQW9GgqnzHPucF0SJeWaOuuWped+BwQTbOLZBUgd1ZNYBKasaOAba1zBEznI+K4i8dF7g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DM4PR11MB5533.namprd11.prod.outlook.com (2603:10b6:5:38a::7) by
 CO1PR11MB5059.namprd11.prod.outlook.com (2603:10b6:303:9a::10) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8069.17; Wed, 16 Oct 2024 08:45:59 +0000
Received: from DM4PR11MB5533.namprd11.prod.outlook.com
 ([fe80::8ce3:74f6:33ca:3dfd]) by DM4PR11MB5533.namprd11.prod.outlook.com
 ([fe80::8ce3:74f6:33ca:3dfd%6]) with mapi id 15.20.8069.016; Wed, 16 Oct 2024
 08:45:58 +0000
From: jinfeng.wang.cn@windriver.com
To: openembedded-core@lists.openembedded.org
Subject: [oe-core][PATCH] tzdata&tzcode-native: upgrade 2024a -> 2024b
Date: Wed, 16 Oct 2024 16:45:38 +0800
Message-Id: <20241016084538.3146229-1-jinfeng.wang.cn@windriver.com>
X-Mailer: git-send-email 2.25.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SGXP274CA0013.SGPP274.PROD.OUTLOOK.COM (2603:1096:4:b8::25)
 To DM4PR11MB5533.namprd11.prod.outlook.com (2603:10b6:5:38a::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5533:EE_|CO1PR11MB5059:EE_
X-MS-Office365-Filtering-Correlation-Id: 10725f1c-fa74-47bd-afc2-08dcedbef4a4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|366016|376014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?PmoE9UesP5Y0Zvt8utuZZ0xNRGIVZzVl2yPSi36rlN5fa8REy2zFvhZx9X2g?=
 =?us-ascii?Q?8Oa3qY4unndNRXGKsrrWgqz0I8xiyHsWa5o7t9IALqbKGnij2hVhj3XUrUZP?=
 =?us-ascii?Q?O77JmRwo01DaQXaPrL0nIacuY7BAMRFpYOmb/0L47qlzbn0H9ILWbd/zqTZv?=
 =?us-ascii?Q?DLePUtkIcx38CjB3AqNdu5UYdg76Tj31yUoYaDtPSie5WtkdHvKUAAJqDYiM?=
 =?us-ascii?Q?qz6eercwkq3/3iQI8lpSaFUwA2cEzw3raNd9Zg8+Hk5DvNCWicFlMkpaIW2a?=
 =?us-ascii?Q?6xott67DKTysktEQuzxZRIUA3Bw0iQhPQwjpxJDGaY+hFynqIj3EbNwq3QfT?=
 =?us-ascii?Q?COasDSDQk82Jp1tCrjHBDE1QcJhywCA7ZsdDOjTR6WQiUutDFZ5l6rAa3Zqi?=
 =?us-ascii?Q?snYjtBLoEjvmrHjyDpxvur9N8f1ZtwRpjqCcq1PoEC3vr0phVN+Ah+6IZYqk?=
 =?us-ascii?Q?XCZXgEVANr3F1+i+9tzo1Zz0TmaSOPmZybVVQVhqJo/45Fru6UPJE/dh0xcz?=
 =?us-ascii?Q?gF6FRtc9my0WaLEIeJZ5MdQb//CYhyNCPOLmxUgk1JWBlwJONTl/+6/TlAGv?=
 =?us-ascii?Q?ucb/FTozxjV3Qd80vVHjAPpbk6+XORvChlS9K/xyRvU3epr7Ex90bGcIzlMj?=
 =?us-ascii?Q?46x+p3cXwPE1zOFxfy751Gj7TADdolncUm0EmRrt/qr7pREAxLh0mnpxzki5?=
 =?us-ascii?Q?kky2LgxTaFrOE/2zJmUZYMLIQMt6tLJpc4A5whGBXHq8foU7rXy4CNvDD1MX?=
 =?us-ascii?Q?qLgK5KTHWOdVIYaxFVHY+Osns2F1Whn1EDL+nrOpRtSrV7Zb9oeUSWib4ptP?=
 =?us-ascii?Q?orq+ASsWElUegKWYiBzoPXmect6Izukd05a2sjtAUkuqlH0TmDrPIaLdgo+X?=
 =?us-ascii?Q?F+1A30wCfnSfebs2V12k1CXkyWJOLlrYGDwdgNX8itn2HrOrG3wDXQRTgQS8?=
 =?us-ascii?Q?qjRWgHKsXxNVADIuBhi8nSRXV1gykvKTv78grzYuygTlVGT/Xyz0qqcZvC65?=
 =?us-ascii?Q?qOT/5ldnTgUEu9LX28Sw4UZTyQV1iOKOAKlugCCN3B41MXv7+3G5vKDjrLAE?=
 =?us-ascii?Q?mpkj1xsC/ukrYiLlYAzSbyaeVR5lhKPspy5yZGdFOMQB1877oixR1MNL+hwT?=
 =?us-ascii?Q?yW845Ljw6FdyKjLNCOCWMB0FAtai+GHfimcXVia20Bh/wV6ML2wENGYz8psj?=
 =?us-ascii?Q?flJaEOhmcEjvIVXLszgbICybxDqLX0mQFoyZcAv8iAlZNr9sahbKdtZ9Md+b?=
 =?us-ascii?Q?d9av9CvO9C4EdYDcNhF1pd8askiio1I+D28Js0REyA=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR11MB5533.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?bb4RW7orZTI5tOmFBfL8JpNj0YVaYt6KpTh4/fHGG51MnTWoAKlrYLCXzV8H?=
 =?us-ascii?Q?JPqR+murOzXzFWzPIKb47etCpe7mz/MwhHAb2tI60561nXzBNR+38M6TA2Ym?=
 =?us-ascii?Q?JRBO618eUiAOD6nxMWSb8cRr+vZnY9K+pMNdYVoll9WOMABQgyq5bHd1Mwv9?=
 =?us-ascii?Q?1Ur01Yu7+y5WeeiP+bV7YnDI8cngmsG7QjIwaDtaJ3QwkPN5PcNXKXdbEXUI?=
 =?us-ascii?Q?o3yjJrlSBGdy4qi2Pn8hb+IRv3Q06WaizpgtYLL09Lrw/A5nLwdId1ti4v3h?=
 =?us-ascii?Q?XcFFk8TZO0V7P/2gQ+iPa2r4Hd1i1emaXqa/phJnKwT0irxsnAOZ0MfGGCyK?=
 =?us-ascii?Q?saG8o6WX9IwYQKaNkBJ3IqWGbnmILtfAxQtSPRO96B0XOyCZvhpa8W0zGUnE?=
 =?us-ascii?Q?5Y+DxPG5v/l9q7V6NsOd4/0F6ilQTHQQwX9qz49LJPuX3BVG7kmYhaxYsyS0?=
 =?us-ascii?Q?wL7Q+IoiX60QqPX/cL0za0LeBvUNXjFBj2C0czq7wSKhuXzAnPhfWsZYtGCL?=
 =?us-ascii?Q?xhFGGv9kEPZsoMJGHzpoZt4WcYnD7ssvzBfTrmJYjg8JNboOgeFZUpugaFKo?=
 =?us-ascii?Q?qLHO3Twvd4xWhPQUFpwokmiy2Y3wrrPq/4ohQE8jd/enyw8qKtCVuso5nnCP?=
 =?us-ascii?Q?Fyqh4kxACQFLcUIPcdTwCno11K9jxYuyRv7X8cyfAmeV4EOyv4WsxpFsrjv+?=
 =?us-ascii?Q?hWngxPcJd+WqYofNodLSgGGNo+yYUYmeECMigBb8Rg4dNBAIrvGUHMYdlR/0?=
 =?us-ascii?Q?/MX0PrIfXrBuwXIXc6FI/rnHVEXCSVTTgGCBZwo+XhjOYm0OK0hDoi5XKQz8?=
 =?us-ascii?Q?dSZYzyJEWv82Kzg5eY0nN5wjF/DGydxBlyQlSZ446kJ/L1OKo5u9TQFZNhZc?=
 =?us-ascii?Q?qzpOyMRSYL4ARXBi5Ll83SDLRSKiou4SdLQ2PBTceHyanEVEiBbjbLx1HfFC?=
 =?us-ascii?Q?AoHlwfxtnGM25ghyXXxUli4KKWGTLoR+fl6kJamFJ+FoeUnT24n+R0F19rV3?=
 =?us-ascii?Q?EdRBH3EjlfcZmRY57i6Y9iJWOSA0Mq/p0pU6HpPPc0kKTiQmaBs6KD0Upzff?=
 =?us-ascii?Q?HEQcE8UURqH6lGxSLyfqTmPFp3j342AoMlFoF8wzZ8l86ySXOjM0hmkPbc0w?=
 =?us-ascii?Q?SYEbQczpDwW0j6d+btbBIIJ6VXzeuY7KIPgaufz9Mo/PjKsqdKjrnGcqXODj?=
 =?us-ascii?Q?6QNuVzYO2Alm7UbkcUImTJw2ZHXBND0iWOkiIAIaMqeUTA9G+2/s9cV6plod?=
 =?us-ascii?Q?m4mA6u6ou1ePNNTELAp5s0bPl9G4cYP8OorwGlxwHmcqpS0AL4NQdIGi2IEO?=
 =?us-ascii?Q?wzrHwF/MhQ0kWDR1gGKHRoDW/JxzTe/2kv1MZBYgbUD+g+QELMqhD/c8BiQq?=
 =?us-ascii?Q?rLDJEUmyC6akzSYjkRHoLCBcTboyZr+wAIinuSDi31ojdGhAm/uqlFNbHQYQ?=
 =?us-ascii?Q?A3wvyW6/tFreW/8Di7UgPHZevImuy1afTBFFelDCqx+DJoAgxlCQsHVCKPMX?=
 =?us-ascii?Q?LUEhRtCXy0BTgXTNYgohRxYoYQRuN1h8ASaX6b4pnot8zhP4S9jzHCIKu35S?=
 =?us-ascii?Q?6UHzXINe0DxGoW/SlKs1hHoQQibU54mjo7cF21G/TdXtqQQwROHY78ImjVrk?=
 =?us-ascii?Q?jg=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 10725f1c-fa74-47bd-afc2-08dcedbef4a4
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5533.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Oct 2024 08:45:58.7622
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: phb2+aCzjzDx92fkM6yq/AOha/SA6VAQ7hRtenOs44xNdPzmodWj3pcBiMsbV2hh9yRT8D69d1HwKYfCT8JMeCFBRiRxWngQbJDbQ+TZ0RY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB5059
X-Proofpoint-GUID: nm76Q4sCclr3Qz4Nht9DrKQNlh2v42Xs
X-Proofpoint-ORIG-GUID: nm76Q4sCclr3Qz4Nht9DrKQNlh2v42Xs
X-Authority-Analysis: v=2.4 cv=cPWysUeN c=1 sm=1 tr=0 ts=670f7d4f cx=c_pps a=NZTPE88KBhpz0z3fOSYQ1w==:117 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=DAUX931o1VcA:10 a=bRTqI5nwn0kA:10 a=t7CeM3EgAAAA:8 a=I0CVDw5ZAAAA:8 a=vEEcL3scq_NeQSkCwNIA:9
 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-10-16_06,2024-10-15_01,2024-09-30_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0 mlxscore=0
 suspectscore=0 phishscore=0 adultscore=0 priorityscore=1501 spamscore=0
 clxscore=1015 malwarescore=0 impostorscore=0 bulkscore=0 mlxlogscore=724
 classifier=spam authscore=0 adjust=0 reason=mlx scancount=1
 engine=8.21.0-2409260000 definitions=main-2410160057
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 16 Oct 2024 08:46:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/205957

From: Jinfeng Wang <jinfeng.wang.cn@windriver.com>

Signed-off-by: Jinfeng Wang <jinfeng.wang.cn@windriver.com>
---
 meta/recipes-extended/timezone/timezone.inc | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-extended/timezone/timezone.inc b/meta/recipes-extended/timezone/timezone.inc
index 4734adcc08..adf095280f 100644
--- a/meta/recipes-extended/timezone/timezone.inc
+++ b/meta/recipes-extended/timezone/timezone.inc
@@ -6,7 +6,7 @@ SECTION = "base"
 LICENSE = "PD & BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=c679c9d6b02bc2757b3eaf8f53c43fba"
 
-PV = "2024a"
+PV = "2024b"
 
 SRC_URI =" http://www.iana.org/time-zones/repository/releases/tzcode${PV}.tar.gz;name=tzcode;subdir=tz \
            http://www.iana.org/time-zones/repository/releases/tzdata${PV}.tar.gz;name=tzdata;subdir=tz \
@@ -16,5 +16,5 @@ S = "${WORKDIR}/tz"
 
 UPSTREAM_CHECK_URI = "http://www.iana.org/time-zones"
 
-SRC_URI[tzcode.sha256sum] = "80072894adff5a458f1d143e16e4ca1d8b2a122c9c5399da482cb68cba6a1ff8"
-SRC_URI[tzdata.sha256sum] = "0d0434459acbd2059a7a8da1f3304a84a86591f6ed69c6248fffa502b6edffe3"
+SRC_URI[tzcode.sha256sum] = "5e438fc449624906af16a18ff4573739f0cda9862e5ec28d3bcb19cbaed0f672"
+SRC_URI[tzdata.sha256sum] = "70e754db126a8d0db3d16d6b4cb5f7ec1e04d5f261255e4558a67fe92d39e550"
-- 
2.34.1


