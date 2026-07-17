Return-Path: <Harish.Sadineni@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B9EDDC4451C
	for <webhook@archiver.kernel.org>; Fri, 17 Jul 2026 12:19:27 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.12059.1784290757727014498
 for <openembedded-core@lists.openembedded.org>;
 Fri, 17 Jul 2026 05:19:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=PoBEcyno;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=1658a50258=harish.sadineni@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66HCJGEX1260472
	for <openembedded-core@lists.openembedded.org>; Fri, 17 Jul 2026 12:19:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	PPS06212021; bh=ORI38GkhkszHuIQ+gKM4owQkdcrQJ0DlP0oTBzYK3Yg=; b=
	PoBEcynoP3m2ON068EpnfNm5S8vuja4yBCn2INlBRq4Pdvy0ofQhkDtfAUtkJwEy
	Ew94OMqwX1/Vwluplk2UTm7wJcsIwo8MLrX2BMtvr8RZLtPIIb8DyFmRI6rO0Cs2
	pr8rC6yG+3Vg3tFo8gxJwHv1LBQBZsKc608EKY927QJpMG/M+XXCNoIXPz0OJtGr
	uIRgd6exB2MDNVYXXXX23lWUgLkVq50DkNjV9TyUxlQd/QUoLZnaV2AfwKsuP31Z
	0odwStfRXmPpk6wdsDAhHOuT1Jhq/QrpDZilfyDUvc5i4+oCk1uHL8TbULjig+dH
	nQL27gfw70Sf/Hi6p682mg==
Received: from sj2pr03cu001.outbound.protection.outlook.com (mail-westusazon11012035.outbound.protection.outlook.com [52.101.43.35])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4ffgmtg9r8-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Fri, 17 Jul 2026 12:19:16 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=x/h/VZCxBKLGzrohOqOocwFbwVYPNpp9LWSNTIozQ9SAqra07FPK1h0fb0n537ivAJ47JX6m74p+QvcYXYoke0R+LGHyaM4wXC007uWQKzD5UmeExzroWX9ZSmsbpm5j2zDLVQUetMf/Nv4A9CnPQIb3FdunXHOna6EeyLvgLuj4x1NirCtUGAOEmVkPyAhZw8ZDYQkD5C735MqGgs0EZ14G4eP7mC/Y6m6KG3FB9PaTWq6OUqT90R8DwNHPJXJ/PQP10HFkKDBfr+A55+yT4u8syTfBR7YXavu5G3VUptq1TjTh//MGKhfqYi3im0jdz3ZCPK78mhJSY90C7x3RNg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ORI38GkhkszHuIQ+gKM4owQkdcrQJ0DlP0oTBzYK3Yg=;
 b=MlrYxxKPS4yRO5vJHMG57Unynfx6MqJl8toDfNrHwBd3lIrLTh1djasNp1nVNnWwU8TyLXKdqKNWALUEU2x+D7p5he7BfkvyK4bYamNg5WxjUpVy9Qq84GLTULVyAtmlHmCrnhk6G0vxV3cotr+mYBG5a02lscgEGvrH+ib9rAtR4cAxBga3+ZMqVFIV5a2txP6pA5dZGmLy1eN+z1SpckQdjWNRe6gTMYtaGiJT/MMhvZG4rWSWBP1BA3V3Ug5SLgsfj9NEL789zpdtDbw5/LErxjQpL1vjarsW7bwnYMAuuFmEqcDZSWhnoyKsOLsg46cWp4XtYc59w2rjjg/n0Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from PH0PR11MB5658.namprd11.prod.outlook.com (2603:10b6:510:e2::23)
 by CYYPR11MB8407.namprd11.prod.outlook.com (2603:10b6:930:c1::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.13; Fri, 17 Jul
 2026 12:19:14 +0000
Received: from PH0PR11MB5658.namprd11.prod.outlook.com
 ([fe80::6852:6964:54d3:49c9]) by PH0PR11MB5658.namprd11.prod.outlook.com
 ([fe80::6852:6964:54d3:49c9%6]) with mapi id 15.21.0223.012; Fri, 17 Jul 2026
 12:19:14 +0000
From: Harish.Sadineni@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: Sundeep.Kokkonda@windriver.com
Subject: [PATCH 4/4] populate_sdk_base: add kernel-devsrc via SDK_TOOLCHAIN_LANGS
Date: Fri, 17 Jul 2026 05:18:49 -0700
Message-ID: <20260717121849.2163115-4-Harish.Sadineni@windriver.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260717121849.2163115-1-Harish.Sadineni@windriver.com>
References: <20260717121849.2163115-1-Harish.Sadineni@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BN9PR03CA0438.namprd03.prod.outlook.com
 (2603:10b6:408:113::23) To PH0PR11MB5658.namprd11.prod.outlook.com
 (2603:10b6:510:e2::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR11MB5658:EE_|CYYPR11MB8407:EE_
X-MS-Office365-Filtering-Correlation-Id: b6ffea09-0d10-4a7e-d4cd-08dee3fd9d43
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|23010399003|376014|52116014|366016|1800799024|38350700014|11063799006|56012099006|10067099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: 
	Ige57QOdQpx0IGJJXwo4V/z3GcByQqJevN8McSEpGYSJnMEpMRtklDvrEyEF/ds6eUK0AZhk8WFmimQAOnAyJ0oerUTOHGSMYHbUYHxWaaoFyAGAtptjckZeseaCJeb1am4gqy/O48gX8jtnYwmrWfseSqzNCroK03Q3PIZQgjTAhjAx61m7WX9BTMiBwuBz2bZ35IfaPdnN/Z0FgDg0aBOSAvjoH62oYIZG+S2vg8SwhS6/bZuSP78jy3tYN7pHZDSi7Q9OtIIMx4ULPJgjERwGUMbqBWzFWEI77bCK2npP9UCUkAg85saZbK51gVd20jGZle3/zfeAYF5Y0V3RUz49c/rSMe3cOiA7WRhUubui2MDq+vi1keAGe0N8o6ZjBU8rmMvFBuB92iGgLUB9aDUQ0PaCzOfmMHvFGNqfZBrnKCtGB2NjT7PNSgfzXPhfhr16TxuqJH+KhmZP6b16VkxT+MBdcdmAhf9J8H28/Yy7JyEA/RCwebGotiXzzfAYYGkwNE1gNNaK/9KZkSr9ia/WDbz84qwFsoL7NO06MrJt5gSi8NRT7gznCXdtWxlPd3TenLHksdAJDxGDlWo58U/m4HnKUTwvoAbiHEf8UzlLqehgwcvwBT0uyoAOy7VZCFLyrIbxQUUviHlJGenaZVoSdGCM497jWagFdUrjqf814vsGGef8n3ShDbzL4WhCRPu4mlO0gmqZHyNl2dpl9/AO3nTvwkKR4ULXepi8xFw=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR11MB5658.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(52116014)(366016)(1800799024)(38350700014)(11063799006)(56012099006)(10067099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?T8doLM4Qt/UfTN/5YT4c0JlNSyGuMf9PA1+PMckF2UbBHGjv1uLZ0S67Bx9k?=
 =?us-ascii?Q?YCF9mSFNHZ2TBktKCMhusOofWtFwy00hJOooTXHJclV4FMhNd65RklE9xjSG?=
 =?us-ascii?Q?DMq7L6wuU9OwKhIRJQD5yB0r5rOJPFG34Vanr6mC3K3OD8kpwCl239gfJvzp?=
 =?us-ascii?Q?WGptUiTzDHikwtLdNFs3Rh3+lyDQzDg1AkMQETBgvEfhq0LYLelZiMHWUz0M?=
 =?us-ascii?Q?CWcPuIbXiKNpkecwvofhWTai3eHzBIHmDgXiJTuLsBXXa27You6PQOYKx23z?=
 =?us-ascii?Q?DS1CIsamZZLNQqWzex4o2OMurM2siLwoaJ537j4+W48D1sJSe5SctAJsWEno?=
 =?us-ascii?Q?BKbyjkXr1sd3/o+h22nspzoZiP9z6Y5AkFaTmx+RZyGvGTPKlHZcZNo5dfo+?=
 =?us-ascii?Q?6D9FiVd6194rdRfSEOygCyDy6PtecQaM06m2SZHXnlTm+Fjr1RqyTJJRFVH+?=
 =?us-ascii?Q?SlgxOuGvPupGQLEUimVkQZpuj5RRY6LP8XypmAC16tjlkUpz8Jc1fhx++oYu?=
 =?us-ascii?Q?zoYl4Xm6xRaCBeKFLPlLUBK7RLStERCYXGkHDkeCOhh3u/KmwIM7U5jL0TDQ?=
 =?us-ascii?Q?VJLPy3QQ637SXua5Y347qjjVre2KBVQmqMRoFJ/M3P4MKlsiNWaiNfx6WcQ4?=
 =?us-ascii?Q?o6IIMhHTXRcTyPkuKRQLtqz/8+TtMmilAELSMaFfHQAevkuAuAqTOc9GpAYP?=
 =?us-ascii?Q?SMJhQxluoQiapLU8/rZBxKUZpXMJOGeCHwSjqDoijtwHsVfhQnEQDiRunW2x?=
 =?us-ascii?Q?dTMoI7NEeV5vlaNaaqP3CpspgZnhove3TNJpVNGmo1Z27S25LiIbZG8vWX2x?=
 =?us-ascii?Q?KliZqc06pWqARmNPoLssXof7iBkJ8CZrLbOJHk+bfn6cZvcT6fGlxAQfK75/?=
 =?us-ascii?Q?SvHNoW/TmKWrlWLn5qq7oIKn63mnU1OT+4R2pxrkInR/tXV9jfxFcVCe0/iH?=
 =?us-ascii?Q?lbSgKikVVBsos0Wki6O+r47VIAH0m+pStUztTsWag1daknIoFnWukWxpUfFQ?=
 =?us-ascii?Q?bQpqLE+F69U06GSOOYqxVVPmsQPbkB1tXb4ybdgC4BX+I3esVnsMJ4zLEoB+?=
 =?us-ascii?Q?7AQM2YRRnoimOYrZr0TtzkF8y/BLhuJeKbBQIt/ZS+MiNXvpdXMQ7GCoC1xD?=
 =?us-ascii?Q?ksoqXowiYmxSHrHHb7S1pW+n54EyRR6GfDijZEouPSh4N7zWDQDQ/9oAWqxg?=
 =?us-ascii?Q?j6OL6LiAMXRC3EFrqnqk2tqGP1+szKEnmIQMa8TPTFoPYGuaXFGb5kVA3ooL?=
 =?us-ascii?Q?kzw0phltLLR3HY9LgN8tCu5PtaCrGsM616hp251k+b/Ch5ttSu3FtXiK4OQl?=
 =?us-ascii?Q?mp9btSVBlRqqgRTdYeY+4rne/vPMiL+HLCHyMQTVZg36PZBhv/1oZcLaRXKV?=
 =?us-ascii?Q?zlVuBcGSbXpDgfoujXzlSQtz23YXN4fggndPRSvr7YCq7HJZpwc/Ktxkj07B?=
 =?us-ascii?Q?ph3TsNYDSO/9lJI64pCjX7BpukMEAebFuhX+9FQjI33CAoeplkm5No0Ermuy?=
 =?us-ascii?Q?WJhoh5VvoDAphKhqBUR0twTxHhAeUinjp8sIBLuzlKF0Lg25OIAeXOoCXZu0?=
 =?us-ascii?Q?oinuTgCEXkdrkiuDXOPJYKYr4KqG/PPwkj/AD3jsWMjBWVca3+kaSIFPYBIi?=
 =?us-ascii?Q?SY+dtQvJ6v8qVodxmJHXb73H26KKACHHRAwW0xQDHWD0+/5VHv+fKZTBowFJ?=
 =?us-ascii?Q?XuPLex5d8YNlY5W33Ggrz80YJUQd1cD8n4e/nZoFcrAJEm+PamiubQXM7MRG?=
 =?us-ascii?Q?JiotKt8GiNXlIhcA4HbkqXx9DqdMHN0=3D?=
X-Exchange-RoutingPolicyChecked: 
	XWGsEar0Slngnfv9PYJL0uxqfbXuVVDrrn9/o7F7cp+C0RdMk6tyhSiHzKwD2IyN/b3hz50yU0ShhDzqYmp5kJkvwFDIMERGn15sh/ZXq3J0QZcNrNFvsq3TB7TtB8ewNIJzEbC/BvFOehnFxe4YrXqjvmQ7ZBr/tZA9S75VaBADuzxextjbKmC7GReMAFO+H+k2QSc1kUM3/2oi2QotjUubpE3Z29KA3C/ApbNIOUtgiiKGI0gzMC/cQ8oQhwqBYXd1G6NjXumkRx60oVM6ZXWa/tj4sC+oB6xcqiz2rGrMtrSPHj7Q0y4ypNw0/GOGVzmV5otXwQZv8HiQYJ1/Hw==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b6ffea09-0d10-4a7e-d4cd-08dee3fd9d43
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5658.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jul 2026 12:19:14.1135
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: e0iOtDks9kPrMe5+lJZO/0F7qFEcv+WCsIV/5nZ6bf9/9bhLP/mUEJuy+UsnfkGU9Ts4pKyeb8/vP8xbFFuDa/6/0NMjGLgQqt57Yqul72A=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYYPR11MB8407
X-Authority-Analysis: v=2.4 cv=aITAb79m c=1 sm=1 tr=0 ts=6a5a1dc4 cx=c_pps
 a=MRNWLIXgA5QtCoQasNiLPg==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=RAioF0-LDSMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=klDOsUkWDRETUCZYPvoE:22 a=t7CeM3EgAAAA:8
 a=eMXeQm0sIUGtGZRkP9IA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: 2UUlIsln3QaZtWFJFjJR-_j4K38ZQgx_
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE3MDEyNSBTYWx0ZWRfX8ku5/tg07a3R
 6pJVY0QMHi73RGUGj6oB+fcPR0jqYTkIR9NVa8WdxeyzelPubDy/TmGJvcnhtuI4ZnO1ixIGCMe
 rwBds+2U4r3kiOnQ19IgMqNzZgWq05/6IGIiziFCaNLsyTXRp/gj
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE3MDEyNSBTYWx0ZWRfX+2XECvKVkvg8
 Ix26JDNV3sbOFJ7t28QqK/oYh2NDHmd0AVxcaspamOzx94FO+zuWZo5WITRJtuNfhaUa8quutuZ
 G0fZAAWsHwh6/LAzxId79Dbfk2iIOgp8pbNFkN2FIO9381G1Y8iD1qBe5+nPnrCkbd/f9Cb0Qxp
 w5ggmmZn8yeUbJiGl0H/lJXjV0zpj0rS9bxAeIHGegmyrnfYkVjPjiap6tJ0Z7tf9vdM68AsZXl
 LH2IyqaoysiAHf49uG2cXo4Et0BFxULozqX5rZn3ijv2xObaYMdqKmQxz8iyf+mnd6O1HCOcTHr
 Sr/Xa3gmkhc28ZWGYnBDrnfhMmXo4qd/gW/gb68h6AUy++sBGjb/bMVQTxlzJT1FXKoEDHrI+4n
 MZVlpbHSTKg//6ffLlqxjVq2YFAfOtVEPTUxmcMLAfECJSOZKZRzvzvweSqf8PBkxKVJv8NSAFU
 WSinAM30yPQNmLByC7A==
X-Proofpoint-ORIG-GUID: 2UUlIsln3QaZtWFJFjJR-_j4K38ZQgx_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-17_03,2026-07-17_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 phishscore=0 spamscore=0 clxscore=1015
 adultscore=0 bulkscore=0 impostorscore=0 lowpriorityscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607170125
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 17 Jul 2026 12:19:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/241167

From: Harish Sadineni <Harish.Sadineni@windriver.com>

Add a new "kernel" value for SDK_TOOLCHAIN_LANGS that pulls
kernel-devsrc into TOOLCHAIN_TARGET_TASK. This allows kernel
development headers/sources to be included in the SDK populate_sdk_base:
add kernel-devsrc via SDK_TOOLCHAIN_LANGS

Users who want kernel module development support in their SDK can now
set SDK_TOOLCHAIN_LANGS = "kernel" explicitly.

Signed-off-by: Harish Sadineni <Harish.Sadineni@windriver.com>
---
 meta/classes-recipe/populate_sdk_base.bbclass | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/classes-recipe/populate_sdk_base.bbclass b/meta/classes-recipe/populate_sdk_base.bbclass
index b427ff2761..1d9faecc16 100644
--- a/meta/classes-recipe/populate_sdk_base.bbclass
+++ b/meta/classes-recipe/populate_sdk_base.bbclass
@@ -80,6 +80,7 @@ TOOLCHAIN_TARGET_TASK ?= " \
     ${@multilib_pkg_extend(d, 'packagegroup-core-standalone-sdk-target')} \
     ${@bb.utils.contains('SDK_TOOLCHAIN_LANGS', 'go', multilib_pkg_extend(d, 'packagegroup-go-sdk-target'), '', d)} \
     ${@bb.utils.contains('SDK_TOOLCHAIN_LANGS', 'rust', multilib_pkg_extend(d, 'libstd-rs'), '', d)} \
+    ${@bb.utils.contains('SDK_TOOLCHAIN_LANGS', 'kernel', 'kernel-devsrc', '', d)} \
     target-sdk-provides-dummy \
 "
 TOOLCHAIN_TARGET_TASK_ATTEMPTONLY ?= ""
-- 
2.51.0


