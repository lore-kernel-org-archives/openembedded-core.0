Return-Path: <changqing.li@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1822DFD5335
	for <webhook@archiver.kernel.org>; Fri, 27 Feb 2026 10:09:00 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.92351.1772186933107096908
 for <openembedded-core@lists.openembedded.org>;
 Fri, 27 Feb 2026 02:08:53 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=OA0DBReJ;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=651884c08a=changqing.li@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61R5P2UM2610359
	for <openembedded-core@lists.openembedded.org>; Fri, 27 Feb 2026 02:08:52 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=PPS06212021;
	 bh=USnu2/jRaP/Sjj0zwylKl1tpRpdL4IrJXs0FYnttx+k=; b=OA0DBReJly4Q
	W4K83RWgHBERsD06OPkdtYpOMFBRhrkorUXReqTtf4/W6h5aa+YCTEPOkk/DbCSc
	tIKUJYR1z8LrK0O726ieykS4PDw2U9NygfJRsSkBHc+17RiK1irUBlefT4hpeShd
	hy1eIhebbIxVwehAYwn7ILwFDFbX51jgtnI7Um89x+PZiURyEzTp8meSYB+kSPW9
	WxkLNMH/mGvNb74pvT1rKKPYCqLAMYe6MEO9TsKWXkdDZd3nz684s2tzW4muD+P4
	PzpZauddHfGsKK27YG5NxCQrUXbkmO+FfWEb/O+x6OoJrlpMOIX0TuMp4LGYNsu5
	lqWFNIrXmA==
Received: from ch1pr05cu001.outbound.protection.outlook.com (mail-northcentralusazon11010032.outbound.protection.outlook.com [52.101.193.32])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4cjdu2ssat-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Fri, 27 Feb 2026 02:08:52 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KRMresDO/gYh6rbNbd/ywdHQFzGyvZk3A8Fn8w1wlzAbvuwZlZAAJEAjPqgyY2UMdsWmhXNgvAf94lQgNTVjQIO2Rso71gYaqdhWAVCxCUkcYaHrgsShbhUF+6Q5tkFiz4qEs2hpt5u/it9GXMFjAMl/wDB6XA/JnXgG0Fi0D6Ii+5FGYV8kcT7PgyO9W/PHQg0zmLNtXdAGOf/VsoB04nh6riPfJkQyyw2O53rhCxAXjyQfIUpLXwGxB37g/T+APPlgDWttAMY+fk0KRPqj4bZuWKYVWPBFVo8l7M/mdlfDgcq8F+aByYJAYU4yJLU7M+pox40BfdF5Bs1SLdp1Gg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=USnu2/jRaP/Sjj0zwylKl1tpRpdL4IrJXs0FYnttx+k=;
 b=lMS+Z8PMaMW4b8vESIBlq0kbbmNJMHHPLq0gR/my1Wl01+Av9glODx9Sd/eAYavWQ1elDNeQAmWDvVnbSNf9OKWB3wwW12lnTfnsMHy78hWxGbiiXKoBrxiffnZPzUYsxdJ1cQWLuwaLtKQTC08QXBXGYDjqxPqbzKpbyo7SsJ5SsxoUIOVOD+n3qCqunDNqOVegK9M0qquENr61RjthgUQ/3s3MVfxjqT+zXbdX5PiVYvp6tDNy4cUYq6hxl+1Ml3VOsoCQhUaTeJuqbD4AwkkIcr6f081svU3GsjIjNGSZ1VS7Z52WJBpnN9E3DL686z2RCVjhK3s87tlJqcQcnw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS0PR11MB7312.namprd11.prod.outlook.com (2603:10b6:8:11f::18)
 by DM4PR11MB7205.namprd11.prod.outlook.com (2603:10b6:8:113::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.16; Fri, 27 Feb
 2026 10:08:50 +0000
Received: from DS0PR11MB7312.namprd11.prod.outlook.com
 ([fe80::531e:6ef5:812b:48f6]) by DS0PR11MB7312.namprd11.prod.outlook.com
 ([fe80::531e:6ef5:812b:48f6%5]) with mapi id 15.20.9654.014; Fri, 27 Feb 2026
 10:08:50 +0000
From: Changqing Li <changqing.li@windriver.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH V2] ruby: upgrade from 3.4.7 to 4.0.1
Date: Fri, 27 Feb 2026 18:07:07 +0800
Message-Id: <20260227100707.2369309-1-changqing.li@windriver.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <DGOXT5NS9NUS.TSZ25ARI9R03@bootlin.com>
References: <DGOXT5NS9NUS.TSZ25ARI9R03@bootlin.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2PR01CA0040.apcprd01.prod.exchangelabs.com
 (2603:1096:4:193::14) To DS0PR11MB7312.namprd11.prod.outlook.com
 (2603:10b6:8:11f::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7312:EE_|DM4PR11MB7205:EE_
X-MS-Office365-Filtering-Correlation-Id: a967cc36-3591-4dc0-431f-08de75e83424
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|366016|376014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info: 
	SVXqv9+rqOGOLluAHM5cY7Rps1+UyEvfO4bD+cSxom9hS0rbpisvzprKRmgh+UoA9Ta8EvDYAiWSoHSAuwjTwoHgeakHDoyuetKfg3p1AFgCdkDaGczgFXysQTGibD/anKbdHyhRTmEOrCXclkTlGPwmTwNrv/aa/e0FRJ4uq6GfdSh81VcsEm5nNjojTYAs/TjwyfGjahWCnPlbyt7uer+P4G9hLYdnN5VXQa8lPmq8Qx+QUu+oL8yD715bLQn2OZumDI89KpuUpGFI3lGWulqfAUX2yLFJTlXxtX+nxEOfZXMcAvhICUQGczCtpsrOXNly0/Gojf2igWpXoBt3tIxPqCnlqYc8SfaTZXBXUh6SZFCnVGfSlm9nj0hCUJS4hCEKISflvC8X8UbmMUsCbAxiKMA02zDPiIevFg/mEw+xnm1fFde5PSrlpYc9uCEXc7ZdqLO5C6kLYAAXQYoTtoq+9X3WZst1MdLTJ6nenP62gJcl82sVJBOzmb/d2uZmS2ZGavmWdPfS+tyfYoPtL4YHpbHMW9ne9or6WA064qXaFdeLbbnWS7BxtCUXRVjJdCFntCepMuY6J2cbz8SP+PS9RRqb4BRJk3MmK/fZP0Y69f+/PTpLAaorQOjLrBTGPyBv6CsjklAck2dLujB0UzKdgjDl3RULe+23x1gGTcWOI4Ry9nrcHk+IitROm/un76EVDD4fU1pXTEZSAqZuEdwIv1TDRp61ZtYKoFN3R8RkqA7+5KZJ+JYhMeTOhskV
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB7312.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?Ihwcg0KhZGOGmctpbSpJyiturSGbKAOnjuHnGYzTbgOu0Iv0HyiLl8qZrUc4?=
 =?us-ascii?Q?pfw872fEH6sRf4cb9M4NmcyRYiSSduszTRdvI2whzMKNrMm559LP9VysdAKZ?=
 =?us-ascii?Q?soKWThLlmWppVXcW8A0Ultc6KSG1modY15ND+Wz6R7s0gp0KedtoYHmP4v6T?=
 =?us-ascii?Q?DHxQLIuDjrlFBMTr3Z83/YOQCaCtXq1YmT0o371sODBMLa3ylSQOIXY31X4j?=
 =?us-ascii?Q?qXADLauNSsniixbmrX5dtxHAN41r90g1lyTmLElbjqi5u3pZdmEt3kvxgY94?=
 =?us-ascii?Q?Pou3QRM4BQ29PNJUXpOzwk15FiM6kUZUuzzaX7H49jKcSrfUdHoGYO0dYqwr?=
 =?us-ascii?Q?kbtNmbrDImgLgZX3WdZEFyEG4LR9aPFuQ9scisQlLlh5p5v5pf23R4UwCECX?=
 =?us-ascii?Q?+MobokMwrczFdLrHc52vBfojmciqfCrmTYf86v16t5m2SzBcered7TXsdiMY?=
 =?us-ascii?Q?fBTaDxHK3eU+rjKZEN8Hk38hzMF3YvdigMAPssbIypJt+nE4hPdi9fJ5xkpg?=
 =?us-ascii?Q?Ys4tOP+EJbyo04wfnxuyX3i8JbLbyqLDo72iEZs3CGQT5aQ5BucC376eed1C?=
 =?us-ascii?Q?uoXWDE5W3FVFE8vDP5rfoIp6DfUgVA9fFtOIdHxmfohqurf5YxnAb4UjP5BV?=
 =?us-ascii?Q?z5WAHLKYbgwNQPevQ7xVNoMqhfkWYZ1YBMW3TrfUNxuvjNu8Q2mkIiBkwIWW?=
 =?us-ascii?Q?otGJ6Fsjk+hQ356MxgoB515AcRzFYiZ0etv95oSXyFC1SnQ4bKsZM0ulNp9k?=
 =?us-ascii?Q?DDzmG7nO71RyCsex3Odx6irIupaxy2RkBohCQFkabK160ybL2RQcsF8bU5bP?=
 =?us-ascii?Q?K78tKbnX6P4z8IYmSsLSsG4CWD/9ZTRYlKllek0VP6xhfF+htKJRWXTVkGYe?=
 =?us-ascii?Q?RFhAtl0LVRy6iO9GhJKVNby+EsY108X5Le6zpqnnCEYLI570OZAKAIZvEVp8?=
 =?us-ascii?Q?IaDKcrOn4fKtGfAc8cCxspgqYJuNL/JbvkkUc+nvRbbxS17keuwBuVTki6qP?=
 =?us-ascii?Q?lDEFSu9UazFiUYHQAcDofsqPiqgTyEEzmuIqI3o+QWCak8YaU3N3syPTeHXi?=
 =?us-ascii?Q?hHCxGffcNPOuNcfnSYA3a+R0hE9rbTbtroR4uarq/x0z5JYq6G7LO0LUoJ0V?=
 =?us-ascii?Q?c9C9QrG/GUksz6lDx3gp6ba59+egoL0V1dSkrQOAhkE6XMmPLHHFBQnx51N3?=
 =?us-ascii?Q?Tc3GqaM/2C8VXpsNlAJnuyCfrh03EAxDfRilAjM4GEfaaBalNzo0gj+g1tSb?=
 =?us-ascii?Q?hMdQSxa62NMpsBVxf9/oX/++Ev8I/j1497EkvjAKtrPbJpK2xH7X04LA/d+X?=
 =?us-ascii?Q?ybeaxBk8vOSY1nUf9F1F8xFQnh3hKkuErQd3lUrkI8B+EDFVChYcnuyLPGHP?=
 =?us-ascii?Q?PqYBMx8iCguhgPnDIC4o9oDDGCnhIRvTJNWvqzOtk6G0c4x5/2DLqR+Cvdck?=
 =?us-ascii?Q?1wQmTVK/FCXSEhTdC3veoU4ZMB1zsozoWXTUZY/UucbiDDrnNQ2Lvguw0FrD?=
 =?us-ascii?Q?qjcnIxEjK5Le8jvJk9Y6mNwLIKjS4+K74VjGjGIlp3F71LMocge5br1lW9Ym?=
 =?us-ascii?Q?pSzV0a+P/Tby0nIRxXOV3cJJMu/E2vF+UeJpxwxMXPChYJCP2n+pYdI38W7Z?=
 =?us-ascii?Q?mQhabxHT0I069cnI0f8awDCGcnx3wFsm6aksZ0kKzX4twzmFMOxNPu22y5C5?=
 =?us-ascii?Q?+LpSUu49sOah/SgPzunqjov/40SyPqji5QQa2iHkMaV3tbAOkS1oC9QZrr9P?=
 =?us-ascii?Q?cwtjcFogWr+PDThW/84O8e4gLCssag4=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a967cc36-3591-4dc0-431f-08de75e83424
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7312.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Feb 2026 10:08:50.2298
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8DJ7T45KlLTUTyoLlC9BsmWJr/UiHfo60rkoQTiLhZS5qqnWpZouQpO/B+MSi3eKf2qLQVXSF7WLMDCCRQq0jDWU9JOcEhgJXldu/eDAuxU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB7205
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjI3MDA4NyBTYWx0ZWRfX5jm/sfS/A25j
 G0m/IfVFFpYXOuvdFoAOH9aDb1FPSklc7ZgUu0qKV/dQ0NTMUf7dM6/0ahiyDju6IhuLkmWrLgj
 m9wbrGhecosAMIV6M1oX2sb8hdZKSFLtar+CsVUGJtsBSkvu9pzuLhU8Gvkln/aj8cTXQhE5zbA
 IC4PW/IAZE6r8DtGd9zv987PW9cdNVKuK4CJlQ7gRxZ8lNtSSHO4RpRovL6C1i2YlqCoGCr1ND6
 Xums5LHQ3JSBNOR1X2G2xYR+xPCNAHDBFaI0LOcdiS4ZiNwhMOxR51cB6RfaHIqpdTmEmLHGkEJ
 NY37y9RTYnWYG6sepptdd70fAVq7LH0nbKSqKOU4CuOVzrorwNSay+07FmPyKmxdPWOfBx1J1K+
 c8GTOUw55ZdNfOHyt1WM6RKonTuGeps0GgDzIjtXya8BHhqvraPGelsZt+jrOsswVKLNywgimCb
 951qSVrA9Gqh6ULdyRA==
X-Authority-Analysis: v=2.4 cv=WpMm8Nfv c=1 sm=1 tr=0 ts=69a16d34 cx=c_pps
 a=eJMC1fB0Wmzbl6MXJ2sZyA==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=HzLeVaNsDn8A:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=iKiJcTA2PjBS6x5JeXcw:22 a=NEAV23lmAAAA:8
 a=w2PP7KgtAAAA:8 a=t7CeM3EgAAAA:8 a=xNf9USuDAAAA:8 a=cd34Doh_AAAA:8
 a=cETuxoCwAAAA:8 a=v12xRLZ1AAAA:8 a=8wnqViHQEiZdxbgNwCkA:9
 a=9XI1_r-lHw-hYCDj:21 a=CDB6uwv3NW-08_pL9N3q:22 a=FdTzh2GWekK77mhwV6Dw:22
 a=DGTqSDpDppWLBvRNt63D:22 a=tb6VMGFFq-HsUJGUQiVL:22 a=AgWhkyGJzIdW_ONjbm8h:22
X-Proofpoint-ORIG-GUID: ELWxlJVhlTs4Dsi1d_cWLNtzVxVHV8P6
X-Proofpoint-GUID: ELWxlJVhlTs4Dsi1d_cWLNtzVxVHV8P6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-27_01,2026-02-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 spamscore=0 priorityscore=1501 malwarescore=0
 impostorscore=0 phishscore=0 clxscore=1015 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2602270087
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 27 Feb 2026 10:09:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/232095

License-Update: Add license BSL-1.0 and Apache-2.0

COPYING - Add Cross-links between Japanese and English pages
LEGAL - Update LEGAL for JSON vendored sources

* Patch 0001-Don-t-save-the-original-name-and-timestamp.patch is added
for fixing possible reproducible issue. Package ruby-doc is not
reproducible, sometimes, "last modified: xxx" is added to the file type.
autobuilder reproduces this, but I can not reproduce this locally. Just
pass '-n' option to workaround it.

Refer:
[1] https://github.com/ruby/ruby/commit/e652af18816ffe0b85109b8de0827349bf03f16d
[2] https://github.com/ruby/ruby/commit/d5fbff50c7ff880ae71b8a8ae9aad976c69bea73

Signed-off-by: Changqing Li <changqing.li@windriver.com>
---
 ...save-the-original-name-and-timestamp.patch | 33 ++++++++++++
 ...doc-build-reproducible-documentation.patch | 30 ++++++-----
 .../0006-Make-gemspecs-reproducible.patch     | 52 +++++++++++--------
 .../ruby/{ruby_3.4.7.bb => ruby_4.0.1.bb}     | 12 ++---
 4 files changed, 85 insertions(+), 42 deletions(-)
 create mode 100644 meta/recipes-devtools/ruby/ruby/0001-Don-t-save-the-original-name-and-timestamp.patch
 rename meta/recipes-devtools/ruby/{ruby_3.4.7.bb => ruby_4.0.1.bb} (93%)

diff --git a/meta/recipes-devtools/ruby/ruby/0001-Don-t-save-the-original-name-and-timestamp.patch b/meta/recipes-devtools/ruby/ruby/0001-Don-t-save-the-original-name-and-timestamp.patch
new file mode 100644
index 0000000000..3db5328565
--- /dev/null
+++ b/meta/recipes-devtools/ruby/ruby/0001-Don-t-save-the-original-name-and-timestamp.patch
@@ -0,0 +1,33 @@
+From 6250ed93d1d7407eb84241296d604e6f98ff0a82 Mon Sep 17 00:00:00 2001
+From: Changqing Li <changqing.li@windriver.com>
+Date: Fri, 27 Feb 2026 16:59:24 +0800
+Subject: [PATCH] Don't save the original name and timestamp
+
+Explictly pass -n option to not save the original name and timestamp for
+improving reproducibility. In our test, always set mantype to man, but
+the output like erb.1.gz is not stable, sometimes, "last modified: xxx"
+is added to the file type, which make the build not reproducible.
+
+Upstream-Status: Submitted [https://github.com/ruby/ruby/pull/16265]
+
+Signed-off-by: Changqing Li <changqing.li@windriver.com>
+---
+ tool/rbinstall.rb | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/tool/rbinstall.rb b/tool/rbinstall.rb
+index 874c3ef..0bba588 100755
+--- a/tool/rbinstall.rb
++++ b/tool/rbinstall.rb
+@@ -173,7 +173,7 @@ def parse_args(argv = ARGV)
+   end
+ end
+ 
+-Compressors = {".gz"=>"gzip", ".bz2"=>"bzip2"}
++Compressors = {".gz"=>"gzip -n", ".bz2"=>"bzip2"}
+ def Compressors.for(type)
+   ext = File.extname(type)
+   if compress = fetch(ext, nil)
+-- 
+2.34.1
+
diff --git a/meta/recipes-devtools/ruby/ruby/0003-rdoc-build-reproducible-documentation.patch b/meta/recipes-devtools/ruby/ruby/0003-rdoc-build-reproducible-documentation.patch
index 90b2aee7ea..f0be3e4af6 100644
--- a/meta/recipes-devtools/ruby/ruby/0003-rdoc-build-reproducible-documentation.patch
+++ b/meta/recipes-devtools/ruby/ruby/0003-rdoc-build-reproducible-documentation.patch
@@ -1,4 +1,4 @@
-From 2e140fea6c275f3258893d2da2480027b16efb92 Mon Sep 17 00:00:00 2001
+From 278d02b08f513b288f31648bc5ec5c47ecb61686 Mon Sep 17 00:00:00 2001
 From: Christian Hofstaedtler <zeha@debian.org>
 Date: Tue, 10 Oct 2017 15:04:34 -0300
 Subject: [PATCH] rdoc: build reproducible documentation
@@ -9,29 +9,33 @@ Upstream-Status: Backport [debian]
 
 Signed-off-by: Antonio Terceiro <terceiro@debian.org>
 Signed-off-by: Christian Hofstaedtler <zeha@debian.org>
+
+rebase to version 4.0.1
+Signed-off-by: Changqing Li <changqing.li@windriver.com>
 ---
- lib/rdoc/generator/json_index.rb | 4 ++--
- 1 file changed, 2 insertions(+), 2 deletions(-)
+ .bundle/gems/rdoc-7.0.3/lib/rdoc/generator/json_index.rb | 2 ++
+ 1 file changed, 2 insertions(+)
 
-diff --git a/lib/rdoc/generator/json_index.rb b/lib/rdoc/generator/json_index.rb
-index 065caa4..cfa1f33 100644
---- a/lib/rdoc/generator/json_index.rb
-+++ b/lib/rdoc/generator/json_index.rb
-@@ -176,7 +176,7 @@ class RDoc::Generator::JsonIndex
-     debug_msg "Writing gzipped search index to %s" % outfile
+diff --git a/.bundle/gems/rdoc-7.0.3/lib/rdoc/generator/json_index.rb b/.bundle/gems/rdoc-7.0.3/lib/rdoc/generator/json_index.rb
+index 065caa4..a76c202 100644
+--- a/.bundle/gems/rdoc-7.0.3/lib/rdoc/generator/json_index.rb
++++ b/.bundle/gems/rdoc-7.0.3/lib/rdoc/generator/json_index.rb
+@@ -177,6 +177,7 @@ class RDoc::Generator::JsonIndex
  
      Zlib::GzipWriter.open(outfile) do |gz|
--      gz.mtime = File.mtime(search_index_file)
+       gz.mtime = File.mtime(search_index_file)
 +      gz.mtime = -1
        gz.orig_name = search_index_file.basename.to_s
        gz.write search_index
        gz.close
-@@ -194,7 +194,7 @@ class RDoc::Generator::JsonIndex
-         debug_msg "Writing gzipped file to %s" % outfile
+@@ -195,6 +196,7 @@ class RDoc::Generator::JsonIndex
  
          Zlib::GzipWriter.open(outfile) do |gz|
--          gz.mtime = File.mtime(dest)
+           gz.mtime = File.mtime(dest)
 +          gz.mtime = -1
            gz.orig_name = dest.basename.to_s
            gz.write data
            gz.close
+-- 
+2.34.1
+
diff --git a/meta/recipes-devtools/ruby/ruby/0006-Make-gemspecs-reproducible.patch b/meta/recipes-devtools/ruby/ruby/0006-Make-gemspecs-reproducible.patch
index e2c80e2f6f..aac2bc1502 100644
--- a/meta/recipes-devtools/ruby/ruby/0006-Make-gemspecs-reproducible.patch
+++ b/meta/recipes-devtools/ruby/ruby/0006-Make-gemspecs-reproducible.patch
@@ -1,4 +1,4 @@
-From 2f3d8359ffd1ab07d578c1e991180bc31dc7d143 Mon Sep 17 00:00:00 2001
+From 4d25e9ce0b2795009dd066d7959cf51c4292a343 Mon Sep 17 00:00:00 2001
 From: Lucas Kanashiro <kanashiro@debian.org>
 Date: Fri, 1 Nov 2019 15:25:17 -0300
 Subject: [PATCH] Make gemspecs reproducible
@@ -7,18 +7,21 @@ Without an explicit date, they will get the current date and make the
 build unreproducible
 
 Upstream-Status: Backport [debian]
+
+Rebase to version 4.0.1
+Signed-off-by: Changqing Li <changqing.li@windriver.com>
 ---
- .bundle/gems/bigdecimal-3.1.8/bigdecimal.gemspec | 1 +
- ext/fiddle/fiddle.gemspec                        | 1 +
+ .bundle/gems/bigdecimal-4.0.1/bigdecimal.gemspec | 1 +
+ .bundle/gems/fiddle-1.1.8/fiddle.gemspec         | 1 +
+ .bundle/gems/rdoc-7.0.3/rdoc.gemspec             | 1 +
  ext/io/console/io-console.gemspec                | 1 +
  lib/ipaddr.gemspec                               | 1 +
- lib/rdoc/rdoc.gemspec                            | 1 +
  5 files changed, 5 insertions(+)
 
-diff --git a/.bundle/gems/bigdecimal-3.1.8/bigdecimal.gemspec b/.bundle/gems/bigdecimal-3.1.8/bigdecimal.gemspec
+diff --git a/.bundle/gems/bigdecimal-4.0.1/bigdecimal.gemspec b/.bundle/gems/bigdecimal-4.0.1/bigdecimal.gemspec
 index b6ef8fd..596b8bb 100644
---- a/.bundle/gems/bigdecimal-3.1.8/bigdecimal.gemspec
-+++ b/.bundle/gems/bigdecimal-3.1.8/bigdecimal.gemspec
+--- a/.bundle/gems/bigdecimal-4.0.1/bigdecimal.gemspec
++++ b/.bundle/gems/bigdecimal-4.0.1/bigdecimal.gemspec
 @@ -14,6 +14,7 @@ Gem::Specification.new do |s|
    s.name          = name
    s.version       = source_version
@@ -27,10 +30,10 @@ index b6ef8fd..596b8bb 100644
    s.email         = ["mrkn@mrkn.jp"]
  
    s.summary       = "Arbitrary-precision decimal floating-point number library."
-diff --git a/ext/fiddle/fiddle.gemspec b/ext/fiddle/fiddle.gemspec
+diff --git a/.bundle/gems/fiddle-1.1.8/fiddle.gemspec b/.bundle/gems/fiddle-1.1.8/fiddle.gemspec
 index 0092f52..f77c224 100644
---- a/ext/fiddle/fiddle.gemspec
-+++ b/ext/fiddle/fiddle.gemspec
+--- a/.bundle/gems/fiddle-1.1.8/fiddle.gemspec
++++ b/.bundle/gems/fiddle-1.1.8/fiddle.gemspec
 @@ -8,6 +8,7 @@ end
  Gem::Specification.new do |spec|
    spec.name          = "fiddle"
@@ -39,6 +42,18 @@ index 0092f52..f77c224 100644
    spec.authors       = ["Aaron Patterson", "SHIBATA Hiroshi"]
    spec.email         = ["aaron@tenderlovemaking.com", "hsbt@ruby-lang.org"]
  
+diff --git a/.bundle/gems/rdoc-7.0.3/rdoc.gemspec b/.bundle/gems/rdoc-7.0.3/rdoc.gemspec
+index ada9341..5871ec2 100644
+--- a/.bundle/gems/rdoc-7.0.3/rdoc.gemspec
++++ b/.bundle/gems/rdoc-7.0.3/rdoc.gemspec
+@@ -7,6 +7,7 @@ end
+ 
+ Gem::Specification.new do |s|
+   s.name = "rdoc"
++  s.date = RUBY_RELEASE_DATE
+   s.version = RDoc::VERSION
+ 
+   s.authors = [
 diff --git a/ext/io/console/io-console.gemspec b/ext/io/console/io-console.gemspec
 index 0a19992..4a80529 100644
 --- a/ext/io/console/io-console.gemspec
@@ -52,7 +67,7 @@ index 0a19992..4a80529 100644
    s.email = "nobu@ruby-lang.org"
    s.description = "add console capabilities to IO instances."
 diff --git a/lib/ipaddr.gemspec b/lib/ipaddr.gemspec
-index 5719f83..fe76260 100644
+index cabc916..f9581b8 100644
 --- a/lib/ipaddr.gemspec
 +++ b/lib/ipaddr.gemspec
 @@ -18,6 +18,7 @@ end
@@ -63,15 +78,6 @@ index 5719f83..fe76260 100644
    spec.authors       = ["Akinori MUSHA", "Hajimu UMEMOTO"]
    spec.email         = ["knu@idaemons.org", "ume@mahoroba.org"]
  
-diff --git a/lib/rdoc/rdoc.gemspec b/lib/rdoc/rdoc.gemspec
-index 47f4802..cf0b5f7 100644
---- a/lib/rdoc/rdoc.gemspec
-+++ b/lib/rdoc/rdoc.gemspec
-@@ -7,6 +7,7 @@ end
- 
- Gem::Specification.new do |s|
-   s.name = "rdoc"
-+  s.date = RUBY_RELEASE_DATE
-   s.version = RDoc::VERSION
- 
-   s.authors = [
+-- 
+2.34.1
+
diff --git a/meta/recipes-devtools/ruby/ruby_3.4.7.bb b/meta/recipes-devtools/ruby/ruby_4.0.1.bb
similarity index 93%
rename from meta/recipes-devtools/ruby/ruby_3.4.7.bb
rename to meta/recipes-devtools/ruby/ruby_4.0.1.bb
index 2fbcfd1f1b..e51d0d3e9c 100644
--- a/meta/recipes-devtools/ruby/ruby_3.4.7.bb
+++ b/meta/recipes-devtools/ruby/ruby_4.0.1.bb
@@ -6,11 +6,11 @@ It is simple, straight-forward, and extensible. \
 "
 HOMEPAGE = "http://www.ruby-lang.org/"
 SECTION = "devel/ruby"
-LICENSE = "Ruby | BSD-2-Clause | BSD-3-Clause | GPL-2.0-only | ISC | MIT"
-LIC_FILES_CHKSUM = "file://COPYING;md5=5b8c87559868796979806100db3f3805 \
+LICENSE = "Ruby | BSD-2-Clause | BSD-3-Clause | GPL-2.0-only | ISC | MIT | BSL-1.0 | Apache-2.0"
+LIC_FILES_CHKSUM = "file://COPYING;md5=7674b1080a488809841b13eb57ffb719 \
                     file://BSDL;md5=8b50bc6de8f586dc66790ba11d064d75 \
                     file://GPL;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
-                    file://LEGAL;md5=cb14358b7821c054ae14128885170204 \
+                    file://LEGAL;md5=8c128bc6252da28f51e60e72b5512478 \
                     "
 
 DEPENDS = "zlib openssl libyaml libffi"
@@ -28,6 +28,7 @@ SRC_URI = "http://cache.ruby-lang.org/pub/ruby/${SHRT_VER}/ruby-${PV}.tar.gz \
            file://0006-Make-gemspecs-reproducible.patch \
            file://0001-vm_dump.c-Define-REG_S1-and-REG_S2-for-musl-riscv.patch \
            file://0007-Skip-test_rm_r_no_permissions-test-under-root.patch \
+           file://0001-Don-t-save-the-original-name-and-timestamp.patch \
            "
 UPSTREAM_CHECK_URI = "https://www.ruby-lang.org/en/downloads/"
 
@@ -49,7 +50,7 @@ do_configure:prepend() {
 
 DEPENDS:append:libc-musl = " libucontext"
 
-SRC_URI[sha256sum] = "23815a6d095696f7919090fdc3e2f9459b2c83d57224b2e446ce1f5f7333ef36"
+SRC_URI[sha256sum] = "3924be2d05db30f4e35f859bf028be85f4b7dd01714142fd823e4af5de2faf9d"
 
 PACKAGECONFIG ??= ""
 PACKAGECONFIG += "${@bb.utils.filter('DISTRO_FEATURES', 'ipv6', d)}"
@@ -104,8 +105,7 @@ do_install_ptest () {
     install -D ${S}/tool/test/runner.rb ${D}${PTEST_PATH}/tool/test/runner.rb
     cp -r ${S}/tool/lib ${D}${PTEST_PATH}/tool/
     mkdir -p ${D}${PTEST_PATH}/lib
-    cp -r ${S}/lib/did_you_mean ${S}/lib/rdoc ${D}${PTEST_PATH}/lib
-    cp ${D}${libdir}/ruby/${SHRT_VER}.0/rdoc.rb ${D}${PTEST_PATH}/lib
+    cp -r ${S}/lib/did_you_mean ${D}${PTEST_PATH}/lib
     cp ${D}${libdir}/ruby/${SHRT_VER}.0/did_you_mean.rb ${D}${PTEST_PATH}/lib    
 
     # install test-binaries
-- 
2.34.1


