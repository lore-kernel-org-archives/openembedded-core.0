Return-Path: <Hemanth.KumarMD@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E2E11E98FA9
	for <webhook@archiver.kernel.org>; Thu,  9 Apr 2026 03:46:08 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.124185.1775706362113982955
 for <openembedded-core@lists.openembedded.org>;
 Wed, 08 Apr 2026 20:46:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=QonU3HaU;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=855948da1d=hemanth.kumarmd@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6392Ff9H4122792
	for <openembedded-core@lists.openembedded.org>; Wed, 8 Apr 2026 20:46:01 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:message-id:mime-version:subject:to; s=PPS06212021; bh=LzFa4w74w
	M8kCLJNmX5Spy/WxB4QK67CHw5Dh+uVxgU=; b=QonU3HaUYCHXVKvi5+xEPI5EF
	w/dCshzhS8qOXbOlOYz43CVc5dNulv7aa4MHkbE2at0B+f0VU1iGO6iF5HKt5wk/
	ovYehkfXg1KXJeOWZ6mwEK5nkK2prG+FufYfcmnlQZv3wLGlP5KOjWWdL8kahin6
	2yK2NS98a29+IrufZxtkpLqhW+rkk2iG3pekwP9zBtHfq06GdTw58a5jMo1GhisK
	NDi8Wpm8Hwo7j/Yn5XPTJGQ4eQ7JJSWXtH+WNdjr1D7MSJz5t9hWH4S3Uup3qItO
	csmGvbY2O6kBxiP65w56z6qUV0KV+H7F0lOnpoRs2XPuljbQmSg4pAszktHFQ==
Received: from dm1pr04cu001.outbound.protection.outlook.com (mail-centralusazon11010029.outbound.protection.outlook.com [52.101.61.29])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4dcmrmkjg3-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 08 Apr 2026 20:46:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fvGy3Wt80BSm2bUlpjxaLaWTSuIbR66Lq2kQCTs1dR80WyiRLqyu0etbbnmzJ5DM0++81u2Jm3RyY/6K5iMexRME9w92eFuNpIm2UlINGUBFjkz+pfwKXPOz30y50509FFAixY4M6G50v6W/YHWGnf+fwg7k8Ykj265GWEASZQ90ofjSo17D+W0+dYVFO1jjD8mVH7OfuACJCyAHD0z7886WGBU7kPf8EcYuJx1X7Rdj/o4DmWyd/6PmFj7DXXnJ9+n7rUDVlWNAQKRG+xEBENoHb/xn+1Z1we78JVE9Sk5lELiEJLxP8z7uVEsDH44fkpfmMyZEp/krUEqs3gTQyg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LzFa4w74wM8kCLJNmX5Spy/WxB4QK67CHw5Dh+uVxgU=;
 b=QC+SmGvoWeoAuzRjWEHHDT56sSV39tAEZ/ANrn1z3HY0s4lyvPja9rfgdhJAFuppa45yqrm4Nr18otGXCPaVvesVUd1hxGmlz1Aoi9tdgT+4FPXMpl+aXvF+K+Rkquq0FGT8CUaALCSQS5B03mZVCWBoIX/kJBWVABuk0DjvPS3bevy6uIjL4o8yIvckk44QTolRbWMzGjwAds+TJPYl9t40+8nL4QSMXMtEG7Mz3fKhtIasM9GkOJR6XJUQQ2qZM3KNnsiLcy0CipkUeT2SXhPson31RIwu+CaTru4Us/xmYzPWpsegouxk4TKwWH9O4+WDgupMySoxj8MLuRU6nw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DM6PR11MB4564.namprd11.prod.outlook.com (2603:10b6:5:2a0::7) by
 CY5PR11MB6235.namprd11.prod.outlook.com (2603:10b6:930:24::20) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9769.8; Thu, 9 Apr 2026 03:45:58 +0000
Received: from DM6PR11MB4564.namprd11.prod.outlook.com
 ([fe80::21dd:5cab:fc47:1dfe]) by DM6PR11MB4564.namprd11.prod.outlook.com
 ([fe80::21dd:5cab:fc47:1dfe%3]) with mapi id 15.20.9769.017; Thu, 9 Apr 2026
 03:45:58 +0000
From: Hemanth.KumarMD@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: Sundeep.Kokkonda@windriver.com, Hemanth.KumarMD@windriver.com
Subject: [PATCH v2] glibc: stable 2.43 branch updates
Date: Wed,  8 Apr 2026 20:43:32 -0700
Message-ID: <20260409034332.1834104-1-Hemanth.KumarMD@windriver.com>
X-Mailer: git-send-email 2.49.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR03CA0223.namprd03.prod.outlook.com
 (2603:10b6:a03:39f::18) To DM6PR11MB4564.namprd11.prod.outlook.com
 (2603:10b6:5:2a0::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR11MB4564:EE_|CY5PR11MB6235:EE_
X-MS-Office365-Filtering-Correlation-Id: 9529f342-71ed-499f-d886-08de95ea82e9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|366016|376014|52116014|56012099003|18002099003|38350700014;
X-Microsoft-Antispam-Message-Info: 
	x0pz+mjrxmPoSjarvPzj/uAhfrkYDsbgxkI6yTdLKmh75xjBUJN8okh5nB78pyJSSerKnIe3ExK9qPpglfkJ/zOHuawRP5SF3PibeJPrAaWIEWoa2/at5MsByvvPZ8SXyQL0uZpKYgYe2IwP4AoHRGqi/Wf9V3g3mBDsyIeAe7Co9dYJ68NNgnoZ9PXxdae5RYhH+Ep7OK+YzmnGWLXoaRKD+xeQCSc5LfFfUIrmiK57bu0J6xOKgfbCYlpOC7+c/0of8kQSoAIb2y9RGxDUo6UEFpd8XqQ4+R2BjoT0KixhgYbEfoNdVydeWqNuHEIFO9dkgn1ORB+KwJsWzTGXrdlYl+jtXs7mYJGHVd22kIHHEJIfV91oclc1C8yjp3shD8cJW6F/ijxZA0e9BD8QUJYYYpSreDLgBYPcRWuLEUlRLdV6N8xVSasucExVEWnjf04rQjZR7Rl5qYFOzTA/rloqIoO7p8HjqcUJ1a/Hhehw5UhvHLiyHvvsGbc6lGHnx8ZItq7X8Y6gCTWAdjUgAeSrxFsArdMZoITquD9IFuoaM6wH6Pzf0GYNHdxvCUfAnJaedCfICh7TXxvfNpLW82Ql2a4r8HdNj1vHmfxOZtgsrg1lQKJMAu0yPwbCuJlgnqfiqSvqhCldDCr6EL90s8FyA4phxI6RYucHEN6/s2DiBU6SaGEPvgwEnKeVoY46eS04zEMeeoMK/z6Z77a6P4AT4/86Bgo6wrBUHSckFyKQPYypBoWV257ORIoIYZazCIiozCk4UZV4yzM0k3ScxfiWnSeQVAZnscZavG2UatE=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR11MB4564.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(52116014)(56012099003)(18002099003)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?LAKGsPXISCSt1u3j974uPUe7JXmZlhxFs1HnYA49Fsn97s1zDYZ8sR3FJbFq?=
 =?us-ascii?Q?4ZL2KullcxeDkbUPMMD1ghapoy7JAUfsI1AalBc4MwbvrwDkjH3JhGBNj1C+?=
 =?us-ascii?Q?JgHgeWWACQj+LrE7iJbiMaP1MlCHt0hAO+gzG6MEocp3nam8Ujy7tHI3AYY7?=
 =?us-ascii?Q?CjCnoVYKfZXoy+JNU1MJGT+w/C7RvIpFtq6IvCNmHztoiMYh91Pt0Cfh/FY5?=
 =?us-ascii?Q?s0EC9vwrWjYcOm5hP8ImxSbGgKTGaMhZJ3Y0Xqi/HhZFAxwMqjUowIjrP5Nm?=
 =?us-ascii?Q?HNKx4HAU8I8/2RD5N+A5AnHBxqNFVyQy3rm/EI6Dq9uV1c0WxcozxuyNfaAk?=
 =?us-ascii?Q?fW7yDAI4xS2VSdNACQRhJhstNLvmm40ip9XFu+8BcvTE3pVSMJ/HwyhOdfdL?=
 =?us-ascii?Q?cZeN1Ov+y12e1U8Bb1h1BVxXSIoDEyxzz+6WQtsgzXJmcZj/jBw8rBlHCDiW?=
 =?us-ascii?Q?vkumjAu0+oGJZIbNH5Gq9ZkIH787Ofdkrm5xFYLw4MKK3eS+ZubtX7lvFOW5?=
 =?us-ascii?Q?EVtSMoGk0FRgmNaTONTxR1h81pqJAbhhptrW7PNqdO17fBH+6JKHJsALWOMi?=
 =?us-ascii?Q?BWJku56XHv9LvhYwqOKEzlXkGU9k7Z2wi/OHNszXoc3nJ7ajllsfMNf5AKhC?=
 =?us-ascii?Q?iUljgyQfwstmNc4Ed0UaiZYSjLGCEtdNkZwZaCj5QuJjT9nPVxMegLU8H/Es?=
 =?us-ascii?Q?1x3+b6lrFULJC4yv94nvMNErpWWSuIuRSx76K4RfObk01VDh0QSqS2LPm3Jg?=
 =?us-ascii?Q?nJkDH1ynFqm5pj0TlY0DGiftMvbpfKSyoRzeVPuXWJAtpaq9jED+91SrDeP+?=
 =?us-ascii?Q?a2kI2WNtrDAK0Y24sodCm85U9eShf0KzPxvOCtoLgm09XIMqiN8aDszMijjO?=
 =?us-ascii?Q?lcKpQhBZOHzA+iQn4J7tWTUG1gf6+G0EcrC9YufCn16JQeLX2M3fVUSXqHCV?=
 =?us-ascii?Q?rPI56G+ZFFRQihHSX7+9Ixto42UN4LU7qFktjCwKl9eX7aaxfaFdjPWYcvPA?=
 =?us-ascii?Q?TkBjollyYkeuNnj2mRCh1BB4SbC7167zJfxv0zBiuMuHQB5Igq6ZoGq1aZtY?=
 =?us-ascii?Q?BGNmUD+ge9mkUTXehokbiwGyPjzSohCYj1ICAvp/3lWPVIkIk6t4MnlayUc3?=
 =?us-ascii?Q?OSB7oglh5oKcenPt39gu6IbruIHc1ROUUZbYzicMmOhXVRwwf5Z6VPI3xaTt?=
 =?us-ascii?Q?4NeiIt5mNtoZ/g9srpbvfkw3XgMwZ29yKrm8YjcEMp5YQX88ufng67a9Op5V?=
 =?us-ascii?Q?9IlccomgYyRRbZdTOwoQe8C7f+U4TGqAyfLh9yRXKRSdmyuZ0Ui4noSS+KAI?=
 =?us-ascii?Q?w1hyEpPbLSl7Eak/7AixDAr7VQWxLuhw6cXebZBP6yRoybXDStyfH9JqyDvb?=
 =?us-ascii?Q?rjDz/C1vQc8lBD7N28vZJcBj/dhxlxPFBNyTr9+nWtCqRlCVqGQTNMVcX61H?=
 =?us-ascii?Q?QdyxUZuE9aLLIPHLSjDmx9+F0+z9JQpJmhbhEh07OPunYUy0LW7Noca6i9gr?=
 =?us-ascii?Q?jmWECY3ntIk6m7zJ1NGvPvk3cRUYWxJ4l4hV3mkC1auG1pvmTH8glf4253OU?=
 =?us-ascii?Q?hlrg9RDbLivt01VahfXXMmlKNt7WdLiw7W2aL+c4AOrjgVMbklVpkugCMjV8?=
 =?us-ascii?Q?e0gnqqaXIWvMkVuSqXMTl+0x2NzeUBZoKmX/fVEc956//nRgoKcxbQoBQ5pp?=
 =?us-ascii?Q?MJwayKOHKpU9Y6D5QHf3wCxwU4pcfTd22+iZWUGVst0nXieVnvlqroYwzSqj?=
 =?us-ascii?Q?tKq3HkQigIb6SUXUTA4wTV1uj6JffnI=3D?=
X-Exchange-RoutingPolicyChecked: 
	AM7KjrBzIx/MAjuKxg1I+BqSbSGkL+n6JD8JgJSCARJF2qK21TQ0W+Qw3gAWchkyscbm3LlTIdmYXmyUFcctexHh/JMmXgBILSVgocqTLTMhSqYa558tkLqckZriY4ykCr1yx7nVb+QMsPBXEmoW5OJP46xGKoCrGr9PVYVXBXnSAIbyCv4K2NezvB8QW+meUPxmKcKlazz6xQwO/C4j2cK9iTzOI3Aditt2NphRyfQWaKtZhoESlFVTKltLfnV4hFnMcHIsht8m6wjW04vi7azJ02VTNryOrAxdgfGJi48dW16ziMDWd6VDkJ1Kn/IICzJFwhhcq1frWhmTsCtejQ==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9529f342-71ed-499f-d886-08de95ea82e9
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB4564.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Apr 2026 03:45:58.5840
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JnpNMpKQGx659lw3YCAf5/UAVWg2I9Y1+mo/LSghKuBHdyEk8RwzRkEDw0I54CEoaIkCsLRZYhgGREVZMtz4soPOTdt7OW1w8yFChIx0YlY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR11MB6235
X-Proofpoint-ORIG-GUID: oZFdHco0LirSj6Yqs161ZbcIDSciIBvx
X-Proofpoint-GUID: oZFdHco0LirSj6Yqs161ZbcIDSciIBvx
X-Authority-Analysis: v=2.4 cv=PpWjqQM3 c=1 sm=1 tr=0 ts=69d720f9 cx=c_pps
 a=cmOV2DJVr4PNgr62m/JMKg==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=A5OVakUREuEA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=iKiJcTA2PjBS6x5JeXcw:22 a=t7CeM3EgAAAA:8
 a=CCpqsmhAAAAA:8 a=XmQ5O-EmEw9oFXjD4CIA:9 a=FdTzh2GWekK77mhwV6Dw:22
 a=ul9cdbp4aOFLsgKbc677:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA5MDAzMCBTYWx0ZWRfX72S88Mx3UtUR
 4w3bA6bhUhHsfP+mD9m5+mv5zsNt6gGo6IRy/QlO2M2sfvZ/MfOPWdm2r1HcwWaWzLaXDzLZaBs
 pt6Ps+Kwngj1ExI/CA998HEAkpCmNCWAhG8BLY42qvUHQ+BONGiCrHROF26mJTrn58Uksfat7AQ
 +CJ86Gms33iw8qpbQZOzWRzIHs1dci+2UDkfJTcx3SQ5r3bnZM37rmi2/w5Du4GoXNHarZgD4Ck
 15qMzs2IoAjpctsNmZ8yxQ04c5OmHz5l5lfOQwJyF9qra3no0wqY2UJhZQXi8Zc/z8F0ON65Mpe
 XkSVUPm68BK2QPu4w9f9OyTYaKz9Tw3N2sLxydhzJK5TXZ8rSuf3YUAHbpcl986CQjd6DJiECCs
 Idmc+Afnb4GmmJzWSs7f1KjVq795z+oXKkdsZ+Xpi95KYJu28DJezitl41ie3vdTAdzQWrcbsm/
 Z/9niISdjAlxDQzNXDg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-09_01,2026-04-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 malwarescore=0 spamscore=0 priorityscore=1501
 adultscore=0 suspectscore=0 lowpriorityscore=0 phishscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604010000 definitions=main-2604090030
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 09 Apr 2026 03:46:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/234872

From: Hemanth Kumar M D <Hemanth.KumarMD@windriver.com>

$ git log --oneline 856c426a753450b8c6861a5b994a564f4fc16d4b..ce1013a197eb4a3b8ff2b07e0672f4d0b976ce7c

ce1013a197 tests: fix tst-rseq with Linux 7.0
60cabd0464 riscv: Resolve calls to memcpy using memcpy-generic in early startup
02ffd413cf elf: Use dl-symbol-redir-ifunc.h instead _dl_strlen
2695314378 elf: parse /proc/self/maps as the last resort to find the gap for tst-link-map-contiguous-ldso
dd9945c0ba resolv: Check hostname for validity (CVE-2026-4438)
5c6fca0c62 resolv: Count records correctly (CVE-2026-4437)
2be6cf2e75 posix: Run tst-wordexp-reuse-mem test
305ce0b588 aarch64: Tests for locking GCS
2ee41ba6ec aarch64: Lock GCS status at startup
fa4a40c7d4 tests: aarch64: fix makefile dependencies for dlopen tests for BTI
9898ea58b5 malloc: Avoid accessing /sys/kernel/mm files
c3ceb93dc4 Add BZ 33904 entry to NEWS
911bd469f8 debug: Fix build with --enable-fortify-source=1 (BZ 33904)
48f5a05a7a nss: Missing checks in __nss_configure_lookup, __nss_database_get (bug 28940)
d6cb7ce0e9 Linux: In getlogin_r, use utmp fallback only for specific errors
140c760d71 nss: Introduce dedicated struct nss_database_for_fork type

Testing Results:
+--------------+--------+--------+------+
| Result       | Before | After  | Diff |
+--------------+--------+--------+------+
| PASS         | 6770   | 6774   | +4   |
| XPASS        | 4      | 4      |  0   |
| FAIL         | 29     | 28     | -1   |
| XFAIL        | 16     | 16     |  0   |
| UNSUPPORTED  | 489    | 490    | +1   |
+--------------+--------+--------+------+

Changes in testcases:
+------------------------------------------------------+--------+-------------+
| Testcase                                             | Before | After       |
+------------------------------------------------------+--------+-------------+
| elf/tst-tls20                                        | FAIL   | PASS        |
| posix/tst-wordexp-reuse-mem                          | N/A    | PASS        |
| resolv/tst-resolv-invalid-ptr                        | N/A    | PASS        |
| resolv/tst-resolv-dns-section                        | N/A    | PASS        |
| nss/tst-nss-malloc-failure-getlogin_r                | N/A    | UNSUPPORTED |
+------------------------------------------------------+--------+-------------+

Justification:

commit - 2be6cf2e75 posix: Run tst-wordexp-reuse-mem test
Fixes Makefile dependency to ensure the testcase is executed.
Passing new testcase:
+PASS: posix/tst-wordexp-reuse-mem

commit - dd9945c0ba resolv: Check hostname for validity (CVE-2026-4438)
Adds validation for hostname parsing and introduces a regression test.
Passing new testcase:
+PASS: resolv/tst-resolv-invalid-ptr

commit - 5c6fca0c62 resolv: Count records correctly (CVE-2026-4437)
Fixes DNS answer section parsing and adds a regression test.
Passing new testcase:
+PASS: resolv/tst-resolv-dns-section

commit - 48f5a05a7a nss: Missing checks in __nss_configure_lookup, __nss_database_get (bug 28940)
Fixes null pointer dereference and improves NSS handling.
Added testcase:
UNSUPPORTED: nss/tst-nss-malloc-failure-getlogin_r

Signed-off-by: Hemanth Kumar M D <Hemanth.KumarMD@windriver.com>
---
 meta/recipes-core/glibc/glibc-version.inc | 2 +-
 meta/recipes-core/glibc/glibc_2.43.bb     | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-core/glibc/glibc-version.inc b/meta/recipes-core/glibc/glibc-version.inc
index 89be8fcb88..015e7943c5 100644
--- a/meta/recipes-core/glibc/glibc-version.inc
+++ b/meta/recipes-core/glibc/glibc-version.inc
@@ -1,6 +1,6 @@
 SRCBRANCH ?= "release/2.43/master"
 PV = "2.43+git"
-SRCREV_glibc ?= "856c426a753450b8c6861a5b994a564f4fc16d4b"
+SRCREV_glibc ?= "ce1013a197eb4a3b8ff2b07e0672f4d0b976ce7c"
 SRCREV_localedef ?= "cba02c503d7c853a38ccfb83c57e343ca5ecd7e5"
 
 GLIBC_GIT_URI ?= "git://sourceware.org/git/glibc.git;protocol=https"
diff --git a/meta/recipes-core/glibc/glibc_2.43.bb b/meta/recipes-core/glibc/glibc_2.43.bb
index 7a2089140c..ffc17eb072 100644
--- a/meta/recipes-core/glibc/glibc_2.43.bb
+++ b/meta/recipes-core/glibc/glibc_2.43.bb
@@ -17,7 +17,7 @@ Allows for ASLR bypass so can bypass some hardening, not an exploit in itself, m
 easier access for another. 'ASLR bypass itself is not a vulnerability.'"
 
 CVE_STATUS_GROUPS += "CVE_STATUS_STABLE_BACKPORTS"
-CVE_STATUS_STABLE_BACKPORTS = "CVE-2025-15281 CVE-2026-0861 CVE-2026-0915"
+CVE_STATUS_STABLE_BACKPORTS = "CVE-2025-15281 CVE-2026-0861 CVE-2026-0915 CVE-2026-4437 CVE-2026-4438"
 CVE_STATUS_STABLE_BACKPORTS[status] = "cpe-stable-backport: fix available in used git hash"
 
 DEPENDS += "gperf-native bison-native"
-- 
2.49.0


