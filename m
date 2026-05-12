Return-Path: <Qi.Chen@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CB5A6CD37BE
	for <webhook@archiver.kernel.org>; Tue, 12 May 2026 03:26:51 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.67667.1778556407381721391
 for <openembedded-core@lists.openembedded.org>;
 Mon, 11 May 2026 20:26:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=ceeP6EiD;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=95926deccb=qi.chen@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64C1dAps3265170
	for <openembedded-core@lists.openembedded.org>; Mon, 11 May 2026 20:26:47 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	PPS06212021; bh=ZiC8zxg93fqnz61cJLLarP+PDqJEksAJuE9Vly3rR9Q=; b=
	ceeP6EiDl8cElQIdPm4Mdh67uxNGdXZAL1CYdxdH0/ulVNh1bNdBMZ64HskfEEYE
	MEMmMgRtV0o2W5hkKLbvVOSsYH8ZnrNe1328Xz22D1QZAhpyjuIFIilox1AQ0FSm
	nikOql3G0riYTyCpUIu28zqeWHIecXJtnjoEilzQSJOJa34ZvVILk2i8cRgdh42I
	RJ3H57GoFHYZN71pvTaFKd9QB8mvG61pqWDPj8irVn9FifIuk2IYtljDYHXoIZrS
	4tQfWv7K+hMWMkaroZc3ooYHNZmCjhn89f9actLffrb9diFOWZbjqyzNh7kAY4PJ
	Yn2up/nIvYqogbjoPpwdMA==
Received: from ch1pr05cu001.outbound.protection.outlook.com (mail-northcentralusazon11010011.outbound.protection.outlook.com [52.101.193.11])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4e3nvg0cbb-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 11 May 2026 20:26:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FMvLDkEJatzIGpZuvfawD02N8xTH7S7MtYBujo4kcbSzJWFDrS8aBnPVSTCiDOwgN7ONWI25LA7lvtP6n5R+hgQUyZX4MB4nH616Zrw6i3gyBrXaO58w7Z8/mN7/fl1G4A40MOSVjd2yXikEOOqOnG9McWLinAr/qO5JwnQbwdfuqQSj7WpNM6WHl0EU10N9wMVwtoqXRYODcLhIUQGjrpq9vEiYYcZdqP5iNk27TgXb/DVtxzR8M4BZLBU8odWbE21Zld4z5Qibi6ktPFrJaqRvsgsH4OcPWzYgXaIO3Vo8k0/cnyGY2+FgPLWBW21/UWmMyCxqriRSHtWAfVE4iw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZiC8zxg93fqnz61cJLLarP+PDqJEksAJuE9Vly3rR9Q=;
 b=btYT9aNGyq6lT1tHqG+oTJ6ph98JygfzQr8QrSfP2Ai9C4j45KSX4u0CqSL0ZHrcEMxIkOf57T6DEQ+e6BRDbgQ7z5Oc3vpsH72GJa8Zc8oPC9aB7obiNjN9y85vBrdjVOTsqKuNWDLaAxdFy8tqHb6VsXITjrpZG8w96PUsGg0yOoUnUoZI/mZwn5/BRK7b45fD+X2ALTDKz2oaiUVu09x5phc7v7WWYVYPW1eDyuLP+XmMKaiLnp11sXASXa/V92zZp7m+cnYCJrK4BMyztJwgCVwYoop/udctmAPLrZbotvN+8qLC+n0IgG8pm0Gi2CMduOinISQ+/5kC7irhMA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO6PR11MB5602.namprd11.prod.outlook.com (2603:10b6:303:13a::5)
 by SA2PR11MB5017.namprd11.prod.outlook.com (2603:10b6:806:11e::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9891.22; Tue, 12 May
 2026 03:26:44 +0000
Received: from CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::5ad6:8f90:b01d:2c62]) by CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::5ad6:8f90:b01d:2c62%3]) with mapi id 15.20.9891.021; Tue, 12 May 2026
 03:26:44 +0000
From: Qi.Chen@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: alex.kanavin@gmail.com, randy.macleod@windriver.com
Subject: [OE-core][PATCH V4 7/7] openssh: set UPSTREAM_STABLE_RELEASE_REGEX
Date: Tue, 12 May 2026 11:26:14 +0800
Message-Id: <20260512032614.2814369-7-Qi.Chen@windriver.com>
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
X-MS-Office365-Filtering-Correlation-Id: ecb11f9b-6360-47ad-8080-08deafd64a4a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|52116014|366016|376014|12006099003|56012099003|18002099003|22082099003|11063799003|38350700014;
X-Microsoft-Antispam-Message-Info: 
	g/vwg3ns47RnP3GlV45zd2mGyJunARrIsYeffZGYRFzhI2eG2cP9B5sih6jitV/7WEtoINlatflR6W9DufFGCK9MGdAXNTFdocTg5GgO7DvAuUMioF9CKMXKF+Fed1BhRpMTGDSSPA20zxc3mWwHSYbB9dID8DUUEl/scK0hMoYttb3a6i9RhCFZDlzXOw0PRS2AG8q/9qg5lzeeBa3XYSjnS/zpRx8KChaYyMZWcoLGNJu2/yeqGZXf56ZIXqL/A0kCfACvw6bSf9zyBAjNBRsLk1/l3Jft3bZDxif7Bzz10P/X0M9UZ3wkGOELYvJ4p8TgkqbjZKMBAFaUCYeWfWPmaGMbmYOqiJNMZsJ5QLDo6a6SnuuxW8lP8Jw5MdRc4/0d3ahnCpD1ug/m4/o8ZFeUGRUshHNNVIa5rSrPc+2Mqiu1hQdtxDm3jB1ePsb9sQ/2YHIHY0Ua0pmUwllom6Hx6BFiNftrzhsVWCFtOn5uln7vKZbaVyY5JG7OYQQBgrElaS9gh7fTAyjk9dm9UzgB9Af+EcDL3HQMICea9lI09AgGysJJ99e/JqN84h4DVNOLjcGykTsU4yP8qOZziTBIiMGRm9HXAQQgxVUJRpQcrBCF1PuDVQEUHCzT/hWa9G6qDmeRYYOOxDU4PoUJXNGV40mUgKlNeyJya2Jyjy8VL5+HXyxbUspDO4kfB4x61FCTm/UYtbxYvirLyJCBJ+xDn/z04CNemTncX5cbLTk0MjkxT6MqDQ1dMdSXV/Db
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR11MB5602.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(52116014)(366016)(376014)(12006099003)(56012099003)(18002099003)(22082099003)(11063799003)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?3vF5tJlSJe/16RoRd8Ya3rqjCzpAYHIPMV2T4oKjruhobfUkHCs4jwJuEU71?=
 =?us-ascii?Q?4Ix1JxD3FH92qECrYmxekn6VuZzgIQDkJuYbBddjiOfU6tUwjw4jQLIhkeny?=
 =?us-ascii?Q?hnQaDlxOiEhotH0oyaBzEmpBpWil5WFHbbzXXis/tzi/UBH3XVTTs8pntK0w?=
 =?us-ascii?Q?R1JPLNhack02LZugH1Asx3/G3/jMVPPoHYXYFltuermv3293Wjo9runLLfzr?=
 =?us-ascii?Q?DTQkaEoTEdXhUo8wahKRHlyZh1moX1J6G2tz00P8N+tOMrYGSO/ljgtZAOx5?=
 =?us-ascii?Q?wiDFGrekidmn8jJ2yPKxzbApPA1D1+HL5gcNnU6LIj+XDXtd4ay4LAg5xvOO?=
 =?us-ascii?Q?O9g4FjeZuQXp8zI7mOEKomnM72bBpcx7Xzi1ohUPxVQ9UZ//ORX/gDKjEYzH?=
 =?us-ascii?Q?Gi8ZD5zTEB1n8dzH8vuo9BBEFYSyaHqGpznWOQrFVBUGXIVRTgNQ71P49mwk?=
 =?us-ascii?Q?ombWVQhfaFL+Ghldgniu0LtDyroLUogNAgy6kFft+AGnbXRbRQFeZsm+b8fS?=
 =?us-ascii?Q?coEckXMmy3nV9KN5ls/SkBGQ8mio7KyPkxF3ewwUhFmGqidUVxSwH5jAx7FX?=
 =?us-ascii?Q?490c8Dn1aAMne7DsV8vq7gUswcdFL5yqR5GMBzTzW/cgPzFxjXOqZVvnDV6v?=
 =?us-ascii?Q?Zd+yscTLV0YMLWYqMz9wA+sIc1U+DdiinM3r6nmrva4y13m2ty7u/h6ELYFo?=
 =?us-ascii?Q?S+waBSCciVm1c10UPQINh0nrEKoSPiF3jXA9rktGuocRRls/HX9CX7+tCNtR?=
 =?us-ascii?Q?pOrqkcW/jFbj5f7ikzjeJategT3pBYKkKUKYYylrjsJhzb4G9oriK5X9OUTl?=
 =?us-ascii?Q?CIb6FXqbBSrR0hJdWlOtmkEWNymt5F3eRyPJ+rK9NdsMg9OtULaRhwYSTzAt?=
 =?us-ascii?Q?e/EkeexJui/NqeTewxJOQZmNUCO07iQXaRBkg83Za9itZ7knCHlz5PMSLYmb?=
 =?us-ascii?Q?hOGIv36yJNc8GpXOTlb7FB3NlJDQmjQPTpsMQgpw2DG0d5BUe5GFSBHFSWA7?=
 =?us-ascii?Q?IllReoNwFbLLANMKNHVVzlNKUYduCkn+5f7JxpyWpNGP6ATvCtFxmnr4NqvI?=
 =?us-ascii?Q?NDc+//mt3bomFIqqNXo2kixm30lvztsyTHJLUnjNRqdI4aKwSLoZqs49Cblk?=
 =?us-ascii?Q?IzTPlVjbJjltzxT6F6mYnJMA2AQHrOlj9Hf+wijuRTAdkGCGnCDokW/XVzWC?=
 =?us-ascii?Q?8ru66dR0pd7oPfnpkP2zA2qu8r/qlSAiiAlPMkq4OFZkCGSyrFVbkhKdDsga?=
 =?us-ascii?Q?QIF39E7ZeC9zfP8nQPW1jb74exV/E4IeWJ9b09F8hrU9GvMhmzTRqITpo2sj?=
 =?us-ascii?Q?f+LD/2blXY8R29nKfb8KxhMgK/2BrJlb+F8gbME6YxyUeiNqOc7Pn6ZH5R7B?=
 =?us-ascii?Q?GW1umdIxCTnzvaLvW1gh8ZgyKNdbGZ9XfP+MCkl5v9PmXPdJJS2qi8Gb79/7?=
 =?us-ascii?Q?G157wId8Ih+XGxJOBbH8qOncvPBZ9n6chbevX9gAdcsxaoFvqiepz7hpQK1C?=
 =?us-ascii?Q?uez8YD3Wdo/TSVAdTIVX4M0gVkm++EmRiQihGgltAoHKxpoq/bYpka5kME7i?=
 =?us-ascii?Q?EVMJL7rbx3YYx+EyESrAgoyA3ZP82tsqY7Sg93Y+m6mCHdOjmyBU5pfaAB9a?=
 =?us-ascii?Q?4679o1lfBCeT2JBQ6C3NER9EYWFD31nVRXAY0bem90Lvrwyw87HcpKbjiv0m?=
 =?us-ascii?Q?jTWB6LD5Z4mGeVLlc/Hpg9rcedWbMnvuXWGeiVi1N6525WJ0HlzwETeN6zXJ?=
 =?us-ascii?Q?/MXH1rkR9Q=3D=3D?=
X-Exchange-RoutingPolicyChecked: 
	Dn8waW6VEfI/p+PyBzm4sSLfU1zUUVR7wilkkqX1SxETRgB1dsuufgPqFzG1QfOoOY63mk939a9RX3DQj02AYLqVAGaygeaJW8VYJ4yqLAFM1ebJu7BScOgbfNaHw26uiwBpWNvbbWvmqCoCv6SaZk0LFQKz3bCCwc1rz8c1VgyK0Zq29T+lkk6ogbYHfhFPEoRO+nP41OWiAK5TYtwlCX2dNEXRcuPxBmLLtiz+YYGpXElMma3FgTKed9oiEccTuONXnATq/CUpUQLkyVDhEkXlgxvPsUIEEJ7zvCEzxuPK3/1nJKlbuEbqgj6ZGKFlbrPU1AGiwr6UgsD+CvFi5A==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ecb11f9b-6360-47ad-8080-08deafd64a4a
X-MS-Exchange-CrossTenant-AuthSource: CO6PR11MB5602.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 May 2026 03:26:44.0538
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zJIvvvTjgOksQOMsKqFOGBRNmPCOJc9R3uS0R86sxkrJ24nAirONaZTtA3T6z0aScWu8JOeriPK9Vv5cgvks8g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB5017
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Authority-Analysis: v=2.4 cv=SYDHsPRu c=1 sm=1 tr=0 ts=6a029df6 cx=c_pps
 a=OswsEo8IlqVTC7zrgcx7Gg==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=NGcC8JguVDcA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=iKiJcTA2PjBS6x5JeXcw:22 a=3tcz3bTJAAAA:8
 a=t7CeM3EgAAAA:8 a=_XbGDX9CfFHujiUbNUQA:9 a=4EbjBm0RLgFgoQzmu6QD:22
 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: n3aVfbCr-_TpUUmFzaU7XoljvCrVp8AF
X-Proofpoint-ORIG-GUID: 83BCY53fgC1VZJWAd6ipIZsx6VtRUovQ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTEyMDAyOCBTYWx0ZWRfXxViOjU3ge53Z
 vXaDKerkbD3eVMf9ZFx8YHcBJIp0yXoz69I9fGlHJt/qOc2/D883/ahdG8q8oA9llFifFetuF66
 7Qjmc0jpQxMVGUHo+CBYzYLFbFimSnUUQw84vuOkJfeT9KtBYuf1WTqjKIn2KUxgIO4DRR99wzZ
 zibC2p5XmTXDScsFmK7hvlPFxL4sCZDaosJ7Ox60SYwVwLpc4HEnKnpw9Y6uVYTGxudmjvg33o8
 6anijAkcfVTl8w0PZglNKYXRwoCHfuAFuF5beGIkCpmvO33hs0n1TnqD7CviIKqJQO8CNNB6whH
 2/+37WdGmgE5Bd2OIN0x97KnQZSJU4uLk4G34InBtO8k2VQcSUvCZmFhuWWkfHZOP+j08rBSq3e
 5iRv05M3MPXO9dglOCHfgdZcWUGYbWCirVFlvq6AnoEj31jX96HsQWL/53NF2mIHE/k77tuaECG
 u6M5K1+bSLiQ5TgX5Hg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-11_05,2026-05-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015 priorityscore=1501 malwarescore=0 adultscore=0
 bulkscore=0 lowpriorityscore=0 phishscore=0 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605050000 definitions=main-2605120028
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 12 May 2026 03:26:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/236850

From: Chen Qi <Qi.Chen@windriver.com>

For openssh, 10.3p1 -> 10.3p2 is a stable upgrade.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 meta/recipes-connectivity/openssh/openssh_10.3p1.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/recipes-connectivity/openssh/openssh_10.3p1.bb b/meta/recipes-connectivity/openssh/openssh_10.3p1.bb
index a050475532..42b60898cf 100644
--- a/meta/recipes-connectivity/openssh/openssh_10.3p1.bb
+++ b/meta/recipes-connectivity/openssh/openssh_10.3p1.bb
@@ -27,6 +27,9 @@ SRC_URI = "https://ftp.openbsd.org/pub/OpenBSD/OpenSSH/portable/openssh-${PV}.ta
            "
 SRC_URI[sha256sum] = "56682a36bb92dcf4b4f016fd8ec8e74059b79a8de25c15d670d731e7d18e45f4"
 
+STABLE_VERSION = "${@d.getVar('PV').split('p')[0].replace('.', '\.')}"
+UPSTREAM_STABLE_RELEASE_REGEX = "${STABLE_VERSION}p\d+"
+
 CVE_STATUS[CVE-2007-2768] = "not-applicable-config: This CVE is specific to OpenSSH with the pam opie which we don't build/use here."
 
 # This CVE is specific to OpenSSH server, as used in Fedora and Red Hat Enterprise Linux 7
-- 
2.34.1


