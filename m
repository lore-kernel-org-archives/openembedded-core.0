Return-Path: <enoch.ng@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4009DC43327
	for <webhook@archiver.kernel.org>; Fri, 26 Jun 2026 21:13:50 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.44202.1782508420655548213
 for <openembedded-core@lists.openembedded.org>;
 Fri, 26 Jun 2026 14:13:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=KCq8N1NN;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=0637d7b1f8=enoch.ng@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65QJ2SnC230819
	for <openembedded-core@lists.openembedded.org>; Fri, 26 Jun 2026 14:13:40 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PPS06212021; bh=0p+Qh9ze3tvkhALxuhqM
	uKqmBS8SAJcq8D5V8onHl8c=; b=KCq8N1NN0jXe51nil+4TWUDyRtptKaakVebm
	LStWeITikE9NAKAqa9yKrqz7dqhvwLO558YliMEt/1FVir26Hl0kiFgrM4SAiA8y
	gkQBBMVgCrAJUlf2jho1DzQPNP7QTKevgTXIe+O+64+HbPgFzOZ9EuJpeydqOlsh
	mi44jGjQ175pgw40Q7phii0h6YV64H5xhBFoWRZn1LtwGw0irgdzwwGgS3OujlES
	S93k/nqCTync5xeS1qcqf5MLb10nTwX5EAu+98ezhU80HIyTGEuDTnNBQm30Gyks
	qTUG3RQBleAc0riGhn5fOjqOFJkSQgB9P1eEZKTgZGACw50SFA==
Received: from ch1pr05cu001.outbound.protection.outlook.com (mail-northcentralusazon11010024.outbound.protection.outlook.com [52.101.193.24])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4f1ewphf8m-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Fri, 26 Jun 2026 14:13:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yX26rF+LSEQY71FLKOZJ8A/G43jCM3bYaGMCcIZtE9FsriIGoenJl4eiEK/R7ObEwq5yuWUHA+H4EuqRP0vz+w5qLd3D9HM388JOS1MD4cc79iOYqjplof+IM2S8ox+V3zZLPfQDtwJPM0+XXRtuZYOz/Vka4r8TIMntGQe374I/8BXAvRQeHGhJ0TkXsSYF3VrxpFBE03UUGZwZEULfs3n4i8ZE64kO0hlVBObR6nlM4SuOGCg2NRdA8J4oJ1etIn/lMpusQhzUENXlc9+xFkSvZkyoYYERoaevf9hTT9+Kp5yNkbmgKa6ak5eT6CCcJW1cNeHyv3V6Llf4G4uE3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0p+Qh9ze3tvkhALxuhqMuKqmBS8SAJcq8D5V8onHl8c=;
 b=JDvKiEYTmjlqgm0Yf+wk5u3Mi2qUEFT3nZyTI/N2k9q0lQzSI/6C0UOY4Zmtf/47YdVu3AnHKn1cSWodDCbV0wesDSNCoSeeb9fw+oXR7WV+NgWzk+SGSDx5z1Xl9lSDMJXK+AAj4vklyD8g1FEOhuw8MepYE+mdmY9h9SXFIpDrYCQxyRMJL4hxJdgfy7zBVxYWz5gOUwtFhzGoVXGoZbvE6wbbxjmEQkfr7yehB9YWkYHALQm0TOROMeQHhAvkdNeRC3ZlQ1ZOwhHsVYwdltZMweiedrR0le0xXZyTFO+ZaeMvQaNf/GdLhLjUhdN8RfeID0NQDNxaxG8+pHC4DQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS4PPF10012BF96.namprd11.prod.outlook.com (2603:10b6:f:fc02::a)
 by PH7PR11MB5793.namprd11.prod.outlook.com (2603:10b6:510:13a::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.17; Fri, 26 Jun
 2026 21:13:35 +0000
Received: from DS4PPF10012BF96.namprd11.prod.outlook.com
 ([fe80::170c:4549:2a55:8f53]) by DS4PPF10012BF96.namprd11.prod.outlook.com
 ([fe80::170c:4549:2a55:8f53%5]) with mapi id 15.21.0159.018; Fri, 26 Jun 2026
 21:13:35 +0000
From: Enoch Ng <enoch.ng@windriver.com>
To: openembedded-core@lists.openembedded.org
Subject: [oe-core][wrynose][PATCH] libxpm: upgrade 3.5.18 -> 3.5.19
Date: Fri, 26 Jun 2026 16:13:08 -0500
Message-ID: <20260626211308.19000-1-enoch.ng@windriver.com>
X-Mailer: git-send-email 2.43.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR03CA0126.namprd03.prod.outlook.com
 (2603:10b6:a03:33c::11) To DS4PPF10012BF96.namprd11.prod.outlook.com
 (2603:10b6:f:fc02::a)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS4PPF10012BF96:EE_|PH7PR11MB5793:EE_
X-MS-Office365-Filtering-Correlation-Id: c6d47743-2428-45e9-e3ec-08ded3c7c8e1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|23010399003|1800799024|366016|52116014|376014|18002099003|56012099006|11063799006|38350700014;
X-Microsoft-Antispam-Message-Info: 
	KsBhjs/BEDsGDKjNw1Y1QUamYY1YmjjxRlODZqA0BznmEVVdcfOS6SQXbQCPGI25JaHTTYV54sqk45S/jau9o7SjWYgd0WAZPmg6wCA2wPMBi6FSI+xWBB+LOIptURy3XJt0Sof8/8U3S4w3UyH8+lISEip8qhXZ+Ot67dlsdMRUkKlzrnIwKopTF414ex+InoyjPVMuckO4OXUuAG1aXAJDjIknWVgD7hnaNg3f67+dVA1tPtNI+lTEjOM2z9SO3CTsfcufEDSKjbxOFXBQKVSy4kH2esGlzJ3WW+ntt5ThGBByBusb3hncsc3ixxVu8xJg0uu1xigun+jRcwasZOU+vb2bX86nc0aEl9yzUDDrOpHGn0ZujgMPzxpYs/n2dgMAnCrUAuPAtWLg/KmT6mIkTnVIyl4Ob+SsRfOBtX4BzM+5XtRAm2KOBfKv0neNO5AhQCTwvodxPQTPKcoLenKwyLd+fTUu9xHTnPdXe2JrLCUXJPVxe+YYQf/v78rz1K2J+/2SC5wlZ7aL77Qg7uRc1X08oPf1iPL0MqNfo0hbskYgFUwPuZZb3U40YvZGSg1Bz6SoAh45/K+xfYVoeD7Wfo01zwCOl2d8bN2KCh4jqEtjss8HVsxp4z/hBvuBonZrgGP/MLrLA9vl376tgWPHrIDNU7HYqOJGJpjluVF3PkrVN8BeU+MTgoGZymm4w55N4mw5rD5HozLUn4U8Yg==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS4PPF10012BF96.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(366016)(52116014)(376014)(18002099003)(56012099006)(11063799006)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?LDB/osi8m/yRuadcSaFp2Ysv3WZY4L2r0i+yzUfqe20yGHxgPmys1PboHfCn?=
 =?us-ascii?Q?M843tc2oZNqWAajR371vMWpddyWX9aqQW8cCgObjOXyeJxG2tZN29zBqGwmJ?=
 =?us-ascii?Q?BTSus4pDP3MOQ4v+/QYjFsBiF9LyFeVA/Vvr8kVe4AidbHrsJSlU7Su5EADd?=
 =?us-ascii?Q?NskQMRMxhsRseGYk1xXnB7zzcg75Fx/W3du71OY0b0TrlQdcsYXYq0wz3V1v?=
 =?us-ascii?Q?eShyGx8skCvznmaDsYeaDUfwlml4ReThVEUNSp4W4ktiv9Hlr/8N0PscXaX3?=
 =?us-ascii?Q?8kAoyibWX02fGdGIBNf0B020KVMqoY3R2A66c1FDi4mTNmWNHT14LYetyByI?=
 =?us-ascii?Q?DEEdIgc/eBGE45kFubfgF3dL0ml8QK2l68Pu48jCMErOfWhzjIQ+F6PWbTN6?=
 =?us-ascii?Q?FspV+m9HV/MdOH3RZHRoxBrDOiWthbMMrJW2r9UG6qaxoOivQUMO+TbTg0Xf?=
 =?us-ascii?Q?ox/1Hc9EoKww8hsRRW25Y7mdbx8CAyAAMWxzZLb75m3gX7ffz/LT5G0nlZGo?=
 =?us-ascii?Q?2hE3jdrMHarrSH3wAh4TLWWcEe9mw4kJURRv5IMrae+WcDpDnD9E83iidjT+?=
 =?us-ascii?Q?dFZHNZRYZ32VkBfGEtVmLjxcObwM6GUKRcG81yaddW64vqjdNz60cEdV08OM?=
 =?us-ascii?Q?HJnulzqwbIgvQnG/d8fardHlfGjoQAZOTvhPjExr6goa+vi5fmhKNays1GCo?=
 =?us-ascii?Q?18uveWYKl9T7VBHikocgroC0miRHDL3jSWJbLDSCpAPA/cBmiZMumZZVEr/F?=
 =?us-ascii?Q?wOsJPxQtjhuDh/ltQuekO0TGEJLJ1pAf2rhtEB/gRdGMNYiu3cZXTRFtNIr9?=
 =?us-ascii?Q?6gEYaBUprhleMalBPKp543WObufKCg0lloZfKwDd/ou5H4m+b//LO1TGuwvn?=
 =?us-ascii?Q?E7EnmASm+w84zBuwMmoy3QTWaj99MPYhmc3nNm1efcYKZ+lU+hl+9Pnv4YBp?=
 =?us-ascii?Q?tAIH0fuwfECZHRMwOv6K7LwBAbgVwhNGNsbuOqgxnK4leuKG5BylgTnl8B1m?=
 =?us-ascii?Q?Jz7qxrJDp+SVpoLOMXPdxXzyyiqpfD0Ry3Rmw3H9sArrKtoavZdnRjDHAFxX?=
 =?us-ascii?Q?ili7rRShdeuzyZQOL7pIuynm9wMV8Z4cxIYKv6k8BlB50SVOM1lQO1+6uAvS?=
 =?us-ascii?Q?5Cw4w5ihzhfIEH+8vSIWJwsI1tW/ICbljHRg5JonglfixSh80nplDwj/FJ1d?=
 =?us-ascii?Q?H3VQWQKcIOgVu1+rsiT8UZRweYaNafNVbrzppyWGNTDGXbF8bmV8R4Yl3rvP?=
 =?us-ascii?Q?sDhN/bvUqxGv2l4H6n8h3OscVTK4BhRVQzDbXv1U50AtguDONCZyDHdxRmmL?=
 =?us-ascii?Q?09TekwMWRuj+eeahNoQSUOQf8lGp3HfOLKtkN3fD2NKPF0nC1CLFSnTXAjUf?=
 =?us-ascii?Q?QV52EXx+V8f30HAEb4mqgaCw+fca4DOASzZe8L5ihRRajY5Ndmf+icqVpG1E?=
 =?us-ascii?Q?bliKdIK+POKdrvfh9W4cHQsPFwiJGDTRcF8utGDHpWqJC41RgsmbNJroL6Q9?=
 =?us-ascii?Q?kAp02NQxrWMeG2+OF2507Ju8avaYMvhCN21tQ9nhTZWOuQ0N379fKZcUmZ4l?=
 =?us-ascii?Q?Ue7I6ztWwORJbsun5l619B81B8CzM20IjhDfZvefqjOWA1ZJx6PccZ/DcSR1?=
 =?us-ascii?Q?EN85R292prgOuNfdb4DnJxXCRX93oIeTy8aj1rJaGf9HTMBbYk6W+qNVDp6F?=
 =?us-ascii?Q?1G7qKSKyI7fprxGjCnoxk9bSxH0fDid1x7F+du2EQ84m3Dvhgn3/cyN0SB8h?=
 =?us-ascii?Q?4RZ3rC7xng=3D=3D?=
X-Exchange-RoutingPolicyChecked: 
	NgVr1mEmq7lNW1BABLXH3Xb7RK4g3AgVGC3yTjWxukvsHaBQ2FD4EPPYddwc2HVVl1E0h940MUtwqZIE95kLxYfsJauFN3VrszdjH1TQN7nQqhpjHxm5VUG8OuizzOPQd4B3MjDEkd4N+LGON6IRciKTkKq4rW6ADilPzqa3kgI9W5P8b/3fZLcLkB6EL9fe8a9GUTvLfy4skdUPiaUHzfOxQzmpQnA6gMjOChmKTelvWuqn4iEquGd7kHsVDVLRP+rL5qz+GV4/fMs2QGg7YmrrI+vqvNpJPIk7WR7t7o3KUtcvW/VFwCfs9hu25c0VJJFCGwIe2ruExUrWa7gpcQ==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c6d47743-2428-45e9-e3ec-08ded3c7c8e1
X-MS-Exchange-CrossTenant-AuthSource: DS4PPF10012BF96.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jun 2026 21:13:35.7180
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 80CaAdMINKsYY0j2HH2CrEm+d9WzQVYJrrAalqbk6TMKIxYnbj6pJtAIeungMAnLsX/+CqxZWGlpeOs/dnmI0Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB5793
X-Proofpoint-ORIG-GUID: h2mATR0RwelGwDZWxSoUgHRf5lgvfKgU
X-Proofpoint-GUID: h2mATR0RwelGwDZWxSoUgHRf5lgvfKgU
X-Authority-Analysis: v=2.4 cv=AdSB2XXG c=1 sm=1 tr=0 ts=6a3eeb84 cx=c_pps
 a=T1Ebi/dL4O4Qy7Yf5tf31Q==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=FelO9ux0wxsA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=HK-ge7EqtdluswH-FwHe:22 a=ag1SF4gXAAAA:8
 a=t7CeM3EgAAAA:8 a=grcuqCQ3AWXUjb5msecA:9 a=Yupwre4RP9_Eg_Bd0iYG:22
 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI2MDE3NSBTYWx0ZWRfX4Suuv8d7kbEX
 II2oAof905POW5r9Q28a9qKI17k2hpTE4q4F7dsiIebsj3hBfvWGetnZmBWXw1wcONoHrL5j5+O
 CYZz/QbeeOT2L2mUw9pRyCYV7QjzvH/CbWonqBOKCVOCWhy/Joa86JFwYm1jr5E64SVTLyER19q
 ouPKIaAPOia9Dp1IJcJEMYmP+YrGVO4s3utIExbAYKMdmkWScixRE31D5ps25ecVXsQcNGfn4qd
 mntnKp30La5aEe7UKQTgS2suUhCvUTnjzUXjsfuT4QS63f8T9Ic6opfZYS+JHVB2F9fl8oQ81gk
 cSUO04By7LRR091QpP9LoO6IyDj5wqMw548TElyuP8PJXdbwgURCn7JlNfC+ioFPXwYeme+AcPM
 JcRu5+5ynhERZDf6m+zCqdlm4J7BGmVpM120a5PVrAvh3N0QVO7htA9N6AnUudxcOklwT93YG/g
 zMi9QTUEoHi5kwtKorA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI2MDE3NSBTYWx0ZWRfX4IJVdNbnlWEN
 v0Z1n//O5rG5vT9r9D67tVCygjWLi2giLYDZjN51AlmO2rN5GMPXOQSIdrhbeeqpnSirJwQpSvd
 d282PN/prTANtXwyew3CxJ0ederxsHKOmMT6wwlm0BBZ1MKEOOza
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-26_05,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 adultscore=0 spamscore=0 clxscore=1011
 phishscore=0 malwarescore=0 lowpriorityscore=0 priorityscore=1501
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2606260175
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 26 Jun 2026 21:13:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/239661

From: Richard Purdie <richard.purdie@linuxfoundation.org>

A vulnerability in the `xpmNextWord()` function could cause an internal pointer to read beyond the file's end due to improper validation of file boundaries. This issue was fixed in libXpm 3.5.19.

The changes between 3.5.18 and 3.5.19 contain only the fix to CVE-2026-4367.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Enoch Ng <enoch.ng@windriver.com>
---
 .../xorg-lib/{libxpm_3.5.18.bb => libxpm_3.5.19.bb}             | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-graphics/xorg-lib/{libxpm_3.5.18.bb => libxpm_3.5.19.bb} (88%)

diff --git a/meta/recipes-graphics/xorg-lib/libxpm_3.5.18.bb b/meta/recipes-graphics/xorg-lib/libxpm_3.5.19.bb
similarity index 88%
rename from meta/recipes-graphics/xorg-lib/libxpm_3.5.18.bb
rename to meta/recipes-graphics/xorg-lib/libxpm_3.5.19.bb
index 94bf28232e..32e052fd42 100644
--- a/meta/recipes-graphics/xorg-lib/libxpm_3.5.18.bb
+++ b/meta/recipes-graphics/xorg-lib/libxpm_3.5.19.bb
@@ -22,6 +22,6 @@ PACKAGES =+ "sxpm cxpm"
 FILES:cxpm = "${bindir}/cxpm"
 FILES:sxpm = "${bindir}/sxpm"
 
-SRC_URI[sha256sum] = "b4ed79bfc718000edee837d551c35286f0b84576db0ce07bbbebe60a4affa1e4"
+SRC_URI[sha256sum] = "ad3576d689221a39dc728f0e0dc02ca7bb6a0d724c9a77fd1bfa1e9af83be900"
 
 BBCLASSEXTEND = "native"

