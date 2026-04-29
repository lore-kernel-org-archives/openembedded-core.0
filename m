Return-Path: <changqing.li@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B150AFF8867
	for <webhook@archiver.kernel.org>; Wed, 29 Apr 2026 06:16:03 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.5393.1777443357380005585
 for <openembedded-core@lists.openembedded.org>;
 Tue, 28 Apr 2026 23:15:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=fd0+rYcP;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=9579970def=changqing.li@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63T4hm0G3687161
	for <openembedded-core@lists.openembedded.org>; Tue, 28 Apr 2026 23:15:57 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PPS06212021; bh=fXrDvpiatgaQAEaLw91R
	MvWRI4MzWsD9OXEaVfsFYTA=; b=fd0+rYcPVvYblJBnfyNx4nSROHJeeR07so3p
	29fpOMuMh0kecP/V/ICIbfPLoW9CMzqxJ+Llm1wA0fPH2uWzv7UeVJs9IBpQegPk
	aqsiJqyBPS9pIrlWFSk2GcOgLDFc2utO4UzHNSzC+pb9tEWbw2891RNdBp9/pzWH
	My7XSPgKIa/r9+XfL42qdjXfv6ZP0VAsCSc/z8HuGTGp7pyTtoebvyGZZjjuzsw8
	CN/oFHN8scYwV36HYhL7orJooVJbLAQXhjmt0B4UpaJgfUar8XP/d67RjGqczUGD
	5S46/qnhjPEB1ZV3lkxVmtcLh04v9PGoDVHDBEEum+3z1B9Zgw==
Received: from byapr05cu005.outbound.protection.outlook.com (mail-westusazon11010017.outbound.protection.outlook.com [52.101.85.17])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4drrw2vaqr-2
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 28 Apr 2026 23:15:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fuzsvc8TurAABEFft4Y0vEjo0Hz/zW0qnTMZLFORlUYZuEtIWogaRo4n7BbfZKZyiAQtvg4rR6VopdG0xz/5FbL6qrm4m38647kH2BploMzt98nmmiTCLiUK5SeRabEHdgcWChWu76sN2fcN0hrIiQd8GqtM841CGZoIRbz0/XcTfQklVkqQvBAUOrhf6COQcDdc5L/i+kG3YT5+rdSrv6JFp7iul7PR0JiQMJHZpNfxjxwRuZFFF5N8zcCLD/IdU50kFrDHb9TRNzMOfh1RxI9JQQWqBgCGMdywcBJhzOpjDuEvdlgzCDLTozfkOflvvTkPW/78xuLQhi+qTqnSTw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fXrDvpiatgaQAEaLw91RMvWRI4MzWsD9OXEaVfsFYTA=;
 b=PYbF6Locu9ZljOj+/F4Zaf1pxw34Wbcx7LB6OvYkBDEZVVgXJP3WHENU+re4BP/CSFhi2UeuxZF05JHEuEcVCV684m3PrAGiPlIEwvt7MBGFLL7vqfONelRNGWTroMYaOfF6I+8FwmI1ySr215O6Ht56dySB2WXqDm52JQ3eewEJ2XPZ9+tYBgboY72guh08KZbRXKO0JqPy7j4b/1v2puGZKb6SO/8AYOKs5tptRo8k2Elmm476jhW+NUKHx8tb1n9SIXDR33yTrD+s5I+sMnBRcWSZgcP9ZaAI6PM0OlIxuU0vtRZxaSJhmh5YxixZxDx/600J+fhDzhbbFYEI9Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS0PR11MB7312.namprd11.prod.outlook.com (2603:10b6:8:11f::18)
 by LV8PR11MB8535.namprd11.prod.outlook.com (2603:10b6:408:1ed::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.16; Wed, 29 Apr
 2026 06:15:49 +0000
Received: from DS0PR11MB7312.namprd11.prod.outlook.com
 ([fe80::531e:6ef5:812b:48f6]) by DS0PR11MB7312.namprd11.prod.outlook.com
 ([fe80::531e:6ef5:812b:48f6%5]) with mapi id 15.20.9870.020; Wed, 29 Apr 2026
 06:15:49 +0000
From: Changqing Li <changqing.li@windriver.com>
To: openembedded-core@lists.openembedded.org
Subject: [scarthgap][PATCH 1/4] libsoup: fix CVE-2025-14523
Date: Wed, 29 Apr 2026 14:15:30 +0800
Message-Id: <20260429061533.858115-1-changqing.li@windriver.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2PR02CA0054.apcprd02.prod.outlook.com
 (2603:1096:4:196::13) To DS0PR11MB7312.namprd11.prod.outlook.com
 (2603:10b6:8:11f::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7312:EE_|LV8PR11MB8535:EE_
X-MS-Office365-Filtering-Correlation-Id: 0d4eab5d-2b5b-4630-4c6c-08dea5b6c213
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|52116014|376014|366016|38350700014|13003099007|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info: 
	YZqB8AZ0cKe1h7wEYz83Ga8axpHT3DsD+p0O1crr7YD3LMX408ger33E8iSwFPiJTXek1EQO0f9XouB6b3u81YfVVIw6cEdDD+1/zAHdzOeAxCKhQSbh5Jj3GhOeL2fLj1k2fEHYI0iO0kv6xkDrIWXPgECYVxaf2oo8hzsU5nN74duh6B5pjnKTmbhqVQpv+yEov2xUfHG6vEe92zaptqf6oJUIKtMFRe7K5xyR+dehhxjcTnUTmq63suP/BnjrYnh4KV4AZL4/9xL4kslqfM4jvUVWGeGB/dXDPV5t/QY5iDAO8tBrxkD8Di8E4IqUnL1kwuYF/Ws0HcTnsXPbhBFFn4c3JBdxtbwGoiIIgPxh615gMJYUeB2r87DJNZO2vUNqzzE87wePUuVmwini0k9BG+eHkf9r6awQTKE/6cRLU807UNAS8SZq00E4duqgGZ5mHOLzdoQPk31Tzj6W0kThB+H3S5Y8jt/zK/FmkD+YP/mGjJE9cjxFpg4lZVN//9TT0+71X/H9YJZrartHqvvo99FBP77iF+qTlYTZhgMoOOSqCJLAdeBRxCDen4DRyxtyGOAdPuz6cBInDmEKfH98p+qpTiPRQgL/vbOtWeGMOBqQKq7Ekjc1IqfMWu5gGwWTXD/CvAUPW/38GLnYLmT+j86fnzLm3iCX2G0fLGYxEjYABJvnAKwt0BcA8WwYeOvk4CF2ymXOo+IQN2LnJnRTVw+uD9gnpzTRaJWl/8nxS0rXXNbpwYqjV5xrhh3l
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB7312.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(52116014)(376014)(366016)(38350700014)(13003099007)(56012099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?0NBDqyXSpntrD2OsugVBNKJi5Mb2GVd8JsxuSSYsg/5LTazfjGzdbq/TVLNY?=
 =?us-ascii?Q?Hq70lXID1CHxLyDx2abF71y4VRxFC8JfzJyWwnGViD7sz8siP8+qSOHqhUdL?=
 =?us-ascii?Q?AFY1DupeBzOinOEotgp64uXD7OV4W660Mzjw346L9jQQ+2DTjJYusgYPFsgq?=
 =?us-ascii?Q?HhPxGemOAFjv0ld362XT8NPHMrIfVR6pLSLkSaD3lSKhsAWrm7zEACn1bkFt?=
 =?us-ascii?Q?gg2JJRKIia2QzMImzYN3KJbXF6eZnL4cDz+ptC+QnjGfzvmy3A9+KjhRoI0+?=
 =?us-ascii?Q?TwjD/lFvQvSED/tzeFFxx2QMQ4+4ZVcmeB/XBhSYvXvAK2/L3SpXP0p+CsyT?=
 =?us-ascii?Q?VUxvai39MmPDxV/K0WihQ+4W1wONd1VUHUyLNogYDEYQ23U4ARd0j0ptOOWQ?=
 =?us-ascii?Q?Y8W9H1pK3JxcwAkBIhA5KUw18svSAuze6McmH9m1RWqUjUDcuv4rZ+5eBMz9?=
 =?us-ascii?Q?1lkeFAQ3mwf/PJcwKbcGTTyzJ7AHtzOOzENjBmdGLbMypEE8T+fUYU2KV+Vz?=
 =?us-ascii?Q?/e8MIckwiFBsNxAphe0XYyuBFwXgW99L8qVkAlSQjMvGs9UcDyzJ0MKI4UyT?=
 =?us-ascii?Q?32Ewl4jw41Mhyj7ZM4oO36v9Oeb3fP93VNuGDOAnqK4DY+ayAUx+Ph85eLll?=
 =?us-ascii?Q?jKwsBrqZdPfwh3dYHjWKWOMNmdaeSRgyG7FaLB9jcF37OciZGwIcg/gBr99p?=
 =?us-ascii?Q?tDnBZRaKz54wZR084Z48HDIDkJWYwwF7nALcSK0Xo3mw9QYykvJQD2vjBU8y?=
 =?us-ascii?Q?XUQAHhbeOnbL7fHsbPs5gfHYx68qlOnIa6u0ZhXE/TgLPUEZvXvWvrEzvXXP?=
 =?us-ascii?Q?YqWkC5bltz0FYO2kavlRNz/gq2ArSYXmNbQYYNl12HDiMKx8Wlfz2biwEbGR?=
 =?us-ascii?Q?hCa+FKnLE1YbVJl3ENWZ7W5tvlWCcJiXPrtXEFNXItPYVv7Tj3RTUcX+JAcu?=
 =?us-ascii?Q?U3sz8npQzepsFeGRHxQ+yeK+ggOD1z3yUtNFdWrNaoCobEqYlkwoqtwf5cwc?=
 =?us-ascii?Q?qcsuz8HoglRhTZxCl937TeEMXu4rqL/HJ0RRlo3LKTAmAh0XSOWLDrJvifBS?=
 =?us-ascii?Q?kX7y4x2sjyWEqgrmCCHNZX+PPAggJ7e+PHP425VL/Qj3EpdzXUtiD8gLSoj1?=
 =?us-ascii?Q?yQMNpKjLB8I2iIBk+xD/BAECgpSF8DRJ+6f0QRN9c+pwzj4B6+29YvuPxkcJ?=
 =?us-ascii?Q?EvN2ToaYzKFYTLQLbjpjI86e95xXRl0tRbqMwC4hfptIl9632Ub2mWwQoEwe?=
 =?us-ascii?Q?TWYrLL+5k30Tx//GCgKyV1YI74iEqv7I9bLHde2lDS0B9nGkdyQXznVYsgDJ?=
 =?us-ascii?Q?VdTOWUkl/nT5y9Yb6DYDcIKpm5/OS5IVOz6TkBOSQdEeQUGMGtHTHDQ0Mwkf?=
 =?us-ascii?Q?F2afD7i3d0s5BLlbUrmjJe3lF3qgPV4w9aAnpCwEET2LKXOX88S5zr57K7uj?=
 =?us-ascii?Q?08pg86iWPNAUCLe8k36gcmNOGItTIB6j+5ibpKbsZ5EqiSy4CpqYHdnxDGka?=
 =?us-ascii?Q?dPgSq5KxTxDzcHRUYOPkiAqjVmH2SKkQbgRQ9Rkbsz6q/8RPyscepAYdfJ6a?=
 =?us-ascii?Q?BB8P4/M1FxHxfm/z/AzG9OLbn19d597xkoHaTRhR22Ni4sPZyTgy0040XSKq?=
 =?us-ascii?Q?PT3dp9XIOs369BR8a69pzZo6TX0d9MJQPvnN36KsOFrxQ44WgCLVyZCsMMfc?=
 =?us-ascii?Q?jI5xx+nUlpwdFFTV60JU78Zi8PQVld8uPxPdmsVOFQsOqUhMs277PY6LPcN3?=
 =?us-ascii?Q?ZnlK61jeXQVCAi+aFT0/QdtHzKbC9Ls=3D?=
X-Exchange-RoutingPolicyChecked: 
	OoPmxNiWCbubY1o1iPtNqFjcwG/v/lASfRHs3ayv2g91ct3pUs+dU+hkU5uBrFldJkTpV/9qrPcHNl9eqhS4/iOcIwMa+scGFrKD2oAKzHsnFph6GSUzQ2BJf4wtLTm4OLK9XwU/uSY+zPLqu6f07tw7dvx6kj8k90Ouu/ti6lMpNEO0+aScydzwiCDQFhFaLAVlg3GN91Kp+jWR7RgdiOmT08jfHV6QG4EslkpmJr213NyO8J55+EazysjrXs11Sh+gcWFIDaQjEOg0RlnMLIEB4l6XpEbedFtAtibmkmCSQFw7LU6umm7ugjkHWGD7fMB7PWfQaWmSxr0UoaDOOw==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0d4eab5d-2b5b-4630-4c6c-08dea5b6c213
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7312.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Apr 2026 06:15:49.6032
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: L7wbq5hc34Ogtg9Qd7s8i61x556AJVLX2FizSpKQp3W3H6RUaywd7jl05p1f7QjnHhrsdcKfegrJnDVNBe82zrc0yWey2D2ZpmFyp+3rMwI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR11MB8535
X-Proofpoint-GUID: nnfPj-7_iwJ8OKpmbvk_6l6e_4CrwmSN
X-Proofpoint-ORIG-GUID: nnfPj-7_iwJ8OKpmbvk_6l6e_4CrwmSN
X-Authority-Analysis: v=2.4 cv=Pu+jqQM3 c=1 sm=1 tr=0 ts=69f1a21c cx=c_pps
 a=+9lCAQqCkh6G/pz+5LnHJg==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=A5OVakUREuEA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=HK-ge7EqtdluswH-FwHe:22 a=GHR8O2WEAAAA:20
 a=A1X0JdhQAAAA:8 a=t7CeM3EgAAAA:8 a=20KFwNOVAAAA:8 a=QIhr-27iAAAA:8
 a=Gw6MPTbC6v1-z_N7XooA:9 a=FdTzh2GWekK77mhwV6Dw:22 a=cgaYBWEFosGJW4rWv5Lf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI5MDA1OCBTYWx0ZWRfXyOSCwYDTJuDY
 J9dSsaeUcKd1xVsMXUf36dSqS50Wk+Lr1H1R3+5v2fkJzCF2tOSwifJg+uUsLGsGJNBz1y/YUfh
 myQuFm1V+DSAqq5Uv0LyIMdmIQJvaOm6bc/Px4FAqjmb6fh0hsKPiB9S8en9oVgMi54W5B5eF22
 5EHaXKsf3fBnb6P5MTW04JF9U8uDkVpVMCGCL0tFCJz8lvSpktUd2wXgs7Pw4yf+NCVCpcAUUNY
 hcfrwQyAqeXri+3TYqNG2oLXafVeRfZJHe1jwWd2MkzvWddOPP2oPKEaLHtZU0DEOro9oMbDRkw
 75MTMVlsnuLC68ugiA8qWl+hf3pWFtp7s4EBLHSbsmVLchAV1YEMs/OcaVlaud+dNUEYq29ZSWk
 YXiT+ZCcKh5RmyzWO6PaV82wOH8aXinM6+zgskcu0x5LOEB0z1og2Q/mk9iZ6yXayTzxWfsWNlO
 rA019sOAPLAYCD4y+8Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-28_05,2026-04-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 spamscore=0 clxscore=1015 impostorscore=0
 suspectscore=0 priorityscore=1501 adultscore=0 phishscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604290058
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 29 Apr 2026 06:16:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/236077

Refer:
https://gitlab.gnome.org/GNOME/libsoup/-/work_items/472

Signed-off-by: Changqing Li <changqing.li@windriver.com>
---
 .../libsoup-3.4.4/CVE-2025-14523.patch        | 715 ++++++++++++++++++
 meta/recipes-support/libsoup/libsoup_3.4.4.bb |   1 +
 2 files changed, 716 insertions(+)
 create mode 100644 meta/recipes-support/libsoup/libsoup-3.4.4/CVE-2025-14523.patch

diff --git a/meta/recipes-support/libsoup/libsoup-3.4.4/CVE-2025-14523.patch b/meta/recipes-support/libsoup/libsoup-3.4.4/CVE-2025-14523.patch
new file mode 100644
index 0000000000..1cf5c9d667
--- /dev/null
+++ b/meta/recipes-support/libsoup/libsoup-3.4.4/CVE-2025-14523.patch
@@ -0,0 +1,715 @@
+From 70123da95418f5d6e00e8ac2d586fb6c5d02cdc6 Mon Sep 17 00:00:00 2001
+From: Michael Catanzaro <mcatanzaro@redhat.com>
+Date: Wed, 7 Jan 2026 14:50:33 -0600
+Subject: [PATCH] Reject duplicate Host headers
+
+RFC 9112 section 3.2 says:
+
+A server MUST respond with a 400 (Bad Request) status code to any
+HTTP/1.1 request message that lacks a Host header field and to any
+request message that contains more than one Host header field line or a
+Host header field with an invalid field value.
+
+In addition to rejecting a duplicate header when parsing headers, also
+reject attempts to add the duplicate header using the
+soup_message_headers_append() API, and add tests for both cases.
+
+These checks will also apply to HTTP/2. I'm not sure whether this is
+actually desired or not, but the header processing code is not aware of
+which HTTP version is in use.
+
+(Note that while SoupMessageHeaders does not require the Host header to
+be present in an HTTP/1.1 request, SoupServer itself does. So we can't
+test the case of missing Host header via the header parsing test, but it
+really is enforced.)
+
+Fixes #472
+
+Upstream-Status: Backport [https://gitlab.gnome.org/GNOME/libsoup/-/commit/aecd8daadc110f8561fb2d6b2806a4cacf2e4c85]
+CVE: CVE-2025-14523
+
+Signed-off-by: Changqing Li <changqing.li@windriver.com>
+---
+ libsoup/soup-headers.c                 |   3 +-
+ libsoup/soup-message-headers-private.h |   4 +-
+ libsoup/soup-message-headers.c         |  80 +++++++------
+ tests/header-parsing-test.c            | 148 +++++++++++++++++--------
+ 4 files changed, 153 insertions(+), 82 deletions(-)
+
+diff --git a/libsoup/soup-headers.c b/libsoup/soup-headers.c
+index 155c11d..3fec9b3 100644
+--- a/libsoup/soup-headers.c
++++ b/libsoup/soup-headers.c
+@@ -139,7 +139,8 @@ soup_headers_parse (const char *str, int len, SoupMessageHeaders *dest)
+ 		for (p = strchr (value, '\r'); p; p = strchr (p, '\r'))
+ 			*p = ' ';
+ 
+-		soup_message_headers_append_untrusted_data (dest, name, value);
++		if (!soup_message_headers_append_untrusted_data (dest, name, value))
++                        goto done;
+         }
+ 	success = TRUE;
+ 
+diff --git a/libsoup/soup-message-headers-private.h b/libsoup/soup-message-headers-private.h
+index 9815464..770f3ef 100644
+--- a/libsoup/soup-message-headers-private.h
++++ b/libsoup/soup-message-headers-private.h
+@@ -10,10 +10,10 @@
+ 
+ G_BEGIN_DECLS
+ 
+-void        soup_message_headers_append_untrusted_data  (SoupMessageHeaders *hdrs,
++gboolean    soup_message_headers_append_untrusted_data  (SoupMessageHeaders *hdrs,
+                                                          const char         *name,
+                                                          const char         *value);
+-void        soup_message_headers_append_common          (SoupMessageHeaders *hdrs,
++gboolean    soup_message_headers_append_common          (SoupMessageHeaders *hdrs,
+                                                          SoupHeaderName      name,
+                                                          const char         *value);
+ const char *soup_message_headers_get_one_common         (SoupMessageHeaders *hdrs,
+diff --git a/libsoup/soup-message-headers.c b/libsoup/soup-message-headers.c
+index d69d6e8..ce4b3b3 100644
+--- a/libsoup/soup-message-headers.c
++++ b/libsoup/soup-message-headers.c
+@@ -267,12 +267,16 @@ soup_message_headers_clean_connection_headers (SoupMessageHeaders *hdrs)
+ 	soup_header_free_list (tokens);
+ }
+ 
+-void
++gboolean
+ soup_message_headers_append_common (SoupMessageHeaders *hdrs,
+                                     SoupHeaderName      name,
+                                     const char         *value)
+ {
+         SoupCommonHeader header;
++        if (name == SOUP_HEADER_HOST && soup_message_headers_get_one (hdrs, "Host")) {
++                g_warning ("soup_message_headers_append_common: Rejecting duplicate Host header");
++                return FALSE;
++        }
+ 
+         if (!hdrs->common_headers)
+                 hdrs->common_headers = g_array_sized_new (FALSE, FALSE, sizeof (SoupCommonHeader), 6);
+@@ -284,32 +288,18 @@ soup_message_headers_append_common (SoupMessageHeaders *hdrs,
+                 g_hash_table_remove (hdrs->common_concat, GUINT_TO_POINTER (header.name));
+ 
+         soup_message_headers_set (hdrs, name, value);
++        return TRUE;
+ }
+ 
+-/**
+- * soup_message_headers_append:
+- * @hdrs: a #SoupMessageHeaders
+- * @name: the header name to add
+- * @value: the new value of @name
+- *
+- * Appends a new header with name @name and value @value to @hdrs.
+- *
+- * (If there is an existing header with name @name, then this creates a second
+- * one, which is only allowed for list-valued headers; see also
+- * [method@MessageHeaders.replace].)
+- *
+- * The caller is expected to make sure that @name and @value are
+- * syntactically correct.
+- **/
+-void
+-soup_message_headers_append (SoupMessageHeaders *hdrs,
+-			     const char *name, const char *value)
++static gboolean
++soup_message_headers_append_internal (SoupMessageHeaders *hdrs,
++                         const char *name, const char *value)
+ {
+ 	SoupUncommonHeader header;
+         SoupHeaderName header_name;
+ 
+-	g_return_if_fail (name != NULL);
+-	g_return_if_fail (value != NULL);
++	g_return_val_if_fail (name != NULL, FALSE);
++	g_return_val_if_fail (value != NULL, FALSE);
+ 
+ 	/* Setting a syntactically invalid header name or value is
+ 	 * considered to be a programming error. However, it can also
+@@ -317,23 +307,22 @@ soup_message_headers_append (SoupMessageHeaders *hdrs,
+ 	 * compiled with G_DISABLE_CHECKS.
+ 	 */
+ #ifndef G_DISABLE_CHECKS
+-	g_return_if_fail (*name && strpbrk (name, " \t\r\n:") == NULL);
+-	g_return_if_fail (strpbrk (value, "\r\n") == NULL);
++	g_return_val_if_fail (*name && strpbrk (name, " \t\r\n:") == NULL, FALSE);
++	g_return_val_if_fail (strpbrk (value, "\r\n") == NULL, FALSE);
+ #else
+ 	if (*name && strpbrk (name, " \t\r\n:")) {
+-		g_warning ("soup_message_headers_append: Ignoring bad name '%s'", name);
+-		return;
++		g_warning ("soup_message_headers_append: Rejecting bad name '%s'", name);
++		return FALSE;
+ 	}
+ 	if (strpbrk (value, "\r\n")) {
+-		g_warning ("soup_message_headers_append: Ignoring bad value '%s'", value);
+-		return;
++		g_warning ("soup_message_headers_append: Rejecting bad value '%s'", value);
++		return FALSE;
+ 	}
+ #endif
+ 
+         header_name = soup_header_name_from_string (name);
+         if (header_name != SOUP_HEADER_UNKNOWN) {
+-                soup_message_headers_append_common (hdrs, header_name, value);
+-                return;
++                return soup_message_headers_append_common (hdrs, header_name, value);
+         }
+ 
+         if (!hdrs->uncommon_headers)
+@@ -344,21 +333,48 @@ soup_message_headers_append (SoupMessageHeaders *hdrs,
+ 	g_array_append_val (hdrs->uncommon_headers, header);
+ 	if (hdrs->uncommon_concat)
+ 		g_hash_table_remove (hdrs->uncommon_concat, header.name);
++        return TRUE;
++}
++
++/**
++ * soup_message_headers_append:
++ * @hdrs: a #SoupMessageHeaders
++ * @name: the header name to add
++ * @value: the new value of @name
++ *
++ * Appends a new header with name @name and value @value to @hdrs.
++ *
++ * (If there is an existing header with name @name, then this creates a second
++ * one, which is only allowed for list-valued headers; see also
++ * [method@MessageHeaders.replace].)
++ *
++ * The caller is expected to make sure that @name and @value are
++ * syntactically correct.
++ **/
++void
++soup_message_headers_append (SoupMessageHeaders *hdrs,
++			     const char *name, const char *value)
++{
++	soup_message_headers_append_internal (hdrs, name, value);
+ }
+ 
+ /*
+- * Appends a header value ensuring that it is valid UTF8.
++ * Appends a header value ensuring that it is valid UTF-8, and also checking the
++ * return value of soup_message_headers_append_internal() to report whether the
++ * headers are invalid for various other reasons.
+  */
+-void
++gboolean
+ soup_message_headers_append_untrusted_data (SoupMessageHeaders *hdrs,
+                                             const char         *name,
+                                             const char         *value)
+ {
+         char *safe_value = g_utf8_make_valid (value, -1);
+         char *safe_name = g_utf8_make_valid (name, -1);
+-        soup_message_headers_append (hdrs, safe_name, safe_value);
++        gboolean result = soup_message_headers_append_internal (hdrs, safe_name, safe_value);
++
+         g_free (safe_value);
+         g_free (safe_name);
++        return result;
+ }
+ 
+ void
+diff --git a/tests/header-parsing-test.c b/tests/header-parsing-test.c
+index 9490559..98a22a4 100644
+--- a/tests/header-parsing-test.c
++++ b/tests/header-parsing-test.c
+@@ -24,6 +24,7 @@ static struct RequestTest {
+ 	const char *method, *path;
+ 	SoupHTTPVersion version;
+ 	Header headers[10];
++	GLogLevelFlags log_flags;
+ } reqtests[] = {
+ 	/**********************/
+ 	/*** VALID REQUESTS ***/
+@@ -33,7 +34,7 @@ static struct RequestTest {
+ 	  "GET / HTTP/1.0\r\n", -1,
+ 	  SOUP_STATUS_OK,
+ 	  "GET", "/", SOUP_HTTP_1_0,
+-	  { { NULL } }
++	  { { NULL } }, 0
+ 	},
+ 
+ 	{ "Req w/ 1 header", NULL,
+@@ -42,7 +43,7 @@ static struct RequestTest {
+ 	  "GET", "/", SOUP_HTTP_1_1,
+ 	  { { "Host", "example.com" },
+ 	    { NULL }
+-	  }
++	  }, 0
+ 	},
+ 
+ 	{ "Req w/ 1 header, no leading whitespace", NULL,
+@@ -51,7 +52,7 @@ static struct RequestTest {
+ 	  "GET", "/", SOUP_HTTP_1_1,
+ 	  { { "Host", "example.com" },
+ 	    { NULL }
+-	  }
++	  }, 0
+ 	},
+ 
+ 	{ "Req w/ 1 header including trailing whitespace", NULL,
+@@ -60,7 +61,7 @@ static struct RequestTest {
+ 	  "GET", "/", SOUP_HTTP_1_1,
+ 	  { { "Host", "example.com" },
+ 	    { NULL }
+-	  }
++	  }, 0
+ 	},
+ 
+ 	{ "Req w/ 1 header, wrapped", NULL,
+@@ -69,7 +70,7 @@ static struct RequestTest {
+ 	  "GET", "/", SOUP_HTTP_1_1,
+ 	  { { "Foo", "bar baz" },
+ 	    { NULL }
+-	  }
++	  }, 0
+ 	},
+ 
+ 	{ "Req w/ 1 header, wrapped with additional whitespace", NULL,
+@@ -78,7 +79,7 @@ static struct RequestTest {
+ 	  "GET", "/", SOUP_HTTP_1_1,
+ 	  { { "Foo", "bar baz" },
+ 	    { NULL }
+-	  }
++	  }, 0
+ 	},
+ 
+ 	{ "Req w/ 1 header, wrapped with tab", NULL,
+@@ -87,7 +88,7 @@ static struct RequestTest {
+ 	  "GET", "/", SOUP_HTTP_1_1,
+ 	  { { "Foo", "bar baz" },
+ 	    { NULL }
+-	  }
++	  }, 0
+ 	},
+ 
+ 	{ "Req w/ 1 header, wrapped before value", NULL,
+@@ -96,7 +97,7 @@ static struct RequestTest {
+ 	  "GET", "/", SOUP_HTTP_1_1,
+ 	  { { "Foo", "bar baz" },
+ 	    { NULL }
+-	  }
++	  }, 0
+ 	},
+ 
+ 	{ "Req w/ 1 header with empty value", NULL,
+@@ -105,7 +106,7 @@ static struct RequestTest {
+ 	  "GET", "/", SOUP_HTTP_1_1,
+ 	  { { "Host", "" },
+ 	    { NULL }
+-	  }
++	  }, 0
+ 	},
+ 
+ 	{ "Req w/ 2 headers", NULL,
+@@ -115,7 +116,7 @@ static struct RequestTest {
+ 	  { { "Host", "example.com" },
+ 	    { "Connection", "close" },
+ 	    { NULL }
+-	  }
++	  }, 0
+ 	},
+ 
+ 	{ "Req w/ 3 headers", NULL,
+@@ -126,7 +127,7 @@ static struct RequestTest {
+ 	    { "Connection", "close" },
+ 	    { "Blah", "blah" },
+ 	    { NULL }
+-	  }
++	  }, 0
+ 	},
+ 
+ 	{ "Req w/ 3 headers, 1st wrapped", NULL,
+@@ -137,7 +138,7 @@ static struct RequestTest {
+             { "Foo", "bar baz" },
+ 	    { "Blah", "blah" },
+ 	    { NULL }
+-	  }
++	  }, 0
+ 	},
+ 
+ 	{ "Req w/ 3 headers, 2nd wrapped", NULL,
+@@ -148,7 +149,7 @@ static struct RequestTest {
+ 	    { "Blah", "blah" },
+ 	    { "Foo", "bar baz" },
+ 	    { NULL }
+-	  }
++	  }, 0
+ 	},
+ 
+ 	{ "Req w/ 3 headers, 3rd wrapped", NULL,
+@@ -159,7 +160,7 @@ static struct RequestTest {
+ 	    { "Blah", "blah" },
+ 	    { "Foo", "bar baz" },
+ 	    { NULL }
+-	  }
++	  }, 0
+ 	},
+ 
+ 	{ "Req w/ same header multiple times", NULL,
+@@ -168,7 +169,7 @@ static struct RequestTest {
+ 	  "GET", "/", SOUP_HTTP_1_1,
+ 	  { { "Foo", "bar, baz, quux" },
+ 	    { NULL }
+-	  }
++	  }, 0
+ 	},
+ 
+ 	{ "Connection header on HTTP/1.0 message", NULL,
+@@ -178,21 +179,21 @@ static struct RequestTest {
+ 	  { { "Connection", "Bar, Quux" },
+             { "Foo", "bar" },
+ 	    { NULL }
+-	  }
++	  }, 0
+ 	},
+ 
+ 	{ "GET with full URI", "667637",
+ 	  "GET http://example.com HTTP/1.1\r\n", -1,
+ 	  SOUP_STATUS_OK,
+ 	  "GET", "http://example.com", SOUP_HTTP_1_1,
+-	  { { NULL } }
++	  { { NULL } }, 0
+ 	},
+ 
+ 	{ "GET with full URI in upper-case", "667637",
+ 	  "GET HTTP://example.com HTTP/1.1\r\n", -1,
+ 	  SOUP_STATUS_OK,
+ 	  "GET", "HTTP://example.com", SOUP_HTTP_1_1,
+-	  { { NULL } }
++	  { { NULL } }, 0
+ 	},
+ 
+ 	/* It's better for this to be passed through: this means a SoupServer
+@@ -202,7 +203,7 @@ static struct RequestTest {
+ 	  "GET AbOuT: HTTP/1.1\r\n", -1,
+ 	  SOUP_STATUS_OK,
+ 	  "GET", "AbOuT:", SOUP_HTTP_1_1,
+-	  { { NULL } }
++	  { { NULL } }, 0
+ 	},
+ 
+ 	/****************************/
+@@ -217,7 +218,7 @@ static struct RequestTest {
+ 	  "GET", "/", SOUP_HTTP_1_1,
+ 	  { { "Host", "example.com" },
+ 	    { NULL }
+-	  }
++	  }, 0
+ 	},
+ 
+ 	/* RFC 2616 section 3.1 says we MUST accept this */
+@@ -228,7 +229,7 @@ static struct RequestTest {
+ 	  "GET", "/", SOUP_HTTP_1_1,
+ 	  { { "Host", "example.com" },
+ 	    { NULL }
+-	  }
++	  }, 0
+ 	},
+ 
+ 	/* RFC 2616 section 19.3 says we SHOULD accept these */
+@@ -240,7 +241,7 @@ static struct RequestTest {
+ 	  { { "Host", "example.com" },
+ 	    { "Connection", "close" },
+ 	    { NULL }
+-	  }
++	  }, 0
+ 	},
+ 
+ 	{ "LF instead of CRLF after Request-Line", NULL,
+@@ -249,7 +250,7 @@ static struct RequestTest {
+ 	  "GET", "/", SOUP_HTTP_1_1,
+ 	  { { "Host", "example.com" },
+ 	    { NULL }
+-	  }
++	  }, 0
+ 	},
+ 
+ 	{ "Mixed CRLF/LF", "666316",
+@@ -261,7 +262,7 @@ static struct RequestTest {
+ 	    { "e", "f" },
+ 	    { "g", "h" },
+ 	    { NULL }
+-	  }
++	  }, 0
+ 	},
+ 
+ 	{ "Req w/ incorrect whitespace in Request-Line", NULL,
+@@ -270,7 +271,7 @@ static struct RequestTest {
+ 	  "GET", "/", SOUP_HTTP_1_1,
+ 	  { { "Host", "example.com" },
+ 	    { NULL }
+-	  }
++	  }, 0
+ 	},
+ 
+ 	{ "Req w/ incorrect whitespace after Request-Line", "475169",
+@@ -279,7 +280,7 @@ static struct RequestTest {
+ 	  "GET", "/", SOUP_HTTP_1_1,
+ 	  { { "Host", "example.com" },
+ 	    { NULL }
+-	  }
++	  }, 0
+ 	},
+ 
+ 	/* If the request/status line is parseable, then we
+@@ -293,7 +294,7 @@ static struct RequestTest {
+ 	  { { "Host", "example.com" },
+ 	    { "Bar", "two" },
+ 	    { NULL }
+-	  }
++	  }, 0
+ 	},
+ 
+ 	{ "First header line is continuation", "666316",
+@@ -303,7 +304,7 @@ static struct RequestTest {
+ 	  { { "Host", "example.com" },
+ 	    { "c", "d" },
+ 	    { NULL }
+-	  }
++	  }, 0
+ 	},
+ 
+ 	{ "Zero-length header name", "666316",
+@@ -313,7 +314,7 @@ static struct RequestTest {
+ 	  { { "a", "b" },
+ 	    { "c", "d" },
+ 	    { NULL }
+-	  }
++	  }, 0
+ 	},
+ 
+ 	{ "CR in header name", "666316",
+@@ -323,7 +324,7 @@ static struct RequestTest {
+ 	  { { "a", "b" },
+ 	    { "c", "d" },
+ 	    { NULL }
+-	  }
++	  }, 0
+ 	},
+ 
+ 	{ "CR in header value", "666316",
+@@ -336,7 +337,7 @@ static struct RequestTest {
+ 	    { "s", "t" },		/* CR at end is ignored */
+ 	    { "c", "d" },
+ 	    { NULL }
+-	  }
++	  }, 0
+ 	},
+ 
+ 	{ "Tab in header name", "666316",
+@@ -351,7 +352,7 @@ static struct RequestTest {
+ 	    { "p", "q z: w" },
+ 	    { "c", "d" },
+ 	    { NULL }
+-	  }
++	  }, 0
+ 	},
+ 
+ 	{ "Tab in header value", "666316",
+@@ -364,7 +365,7 @@ static struct RequestTest {
+ 	    { "z", "w" },	/* trailing tab ignored */
+ 	    { "c", "d" },
+ 	    { NULL }
+-	  }
++	  }, 0
+ 	},
+ 
+ 	/************************/
+@@ -375,77 +376,77 @@ static struct RequestTest {
+ 	  "GET /\r\n", -1,
+ 	  SOUP_STATUS_BAD_REQUEST,
+ 	  NULL, NULL, -1,
+-	  { { NULL } }
++	  { { NULL } }, 0
+ 	},
+ 
+ 	{ "HTTP 1.2 request (no such thing)", NULL,
+ 	  "GET / HTTP/1.2\r\n", -1,
+ 	  SOUP_STATUS_HTTP_VERSION_NOT_SUPPORTED,
+ 	  NULL, NULL, -1,
+-	  { { NULL } }
++	  { { NULL } }, 0
+ 	},
+ 
+ 	{ "HTTP 2000 request (no such thing)", NULL,
+ 	  "GET / HTTP/2000.0\r\n", -1,
+ 	  SOUP_STATUS_HTTP_VERSION_NOT_SUPPORTED,
+ 	  NULL, NULL, -1,
+-	  { { NULL } }
++	  { { NULL } }, 0
+ 	},
+ 
+ 	{ "Long HTTP version terminating at missing minor version", "https://gitlab.gnome.org/GNOME/libsoup/-/issues/404",
+ 	  unterminated_http_version, sizeof (unterminated_http_version),
+ 	  SOUP_STATUS_BAD_REQUEST,
+            NULL, NULL, -1,
+-	  { { NULL } }
++	  { { NULL } }, 0
+ 	},
+ 
+ 	{ "Non-HTTP request", NULL,
+ 	  "GET / SOUP/1.1\r\nHost: example.com\r\n", -1,
+ 	  SOUP_STATUS_BAD_REQUEST,
+ 	  NULL, NULL, -1,
+-	  { { NULL } }
++	  { { NULL } }, 0
+ 	},
+ 
+ 	{ "Junk after Request-Line", NULL,
+ 	  "GET / HTTP/1.1 blah\r\nHost: example.com\r\n", -1,
+ 	  SOUP_STATUS_BAD_REQUEST,
+ 	  NULL, NULL, -1,
+-	  { { NULL } }
++	  { { NULL } }, 0
+ 	},
+ 
+ 	{ "NUL in Method", NULL,
+ 	  "G\x00T / HTTP/1.1\r\nHost: example.com\r\n", 37,
+ 	  SOUP_STATUS_BAD_REQUEST,
+ 	  NULL, NULL, -1,
+-	  { { NULL } }
++	  { { NULL } }, 0
+ 	},
+ 
+ 	{ "NUL at beginning of Method", "666316",
+ 	  "\x00 / HTTP/1.1\r\nHost: example.com\r\n", 35,
+ 	  SOUP_STATUS_BAD_REQUEST,
+ 	  NULL, NULL, -1,
+-	  { { NULL } }
++	  { { NULL } }, 0
+ 	},
+ 
+ 	{ "NUL in Path", NULL,
+ 	  "GET /\x00 HTTP/1.1\r\nHost: example.com\r\n", 38,
+ 	  SOUP_STATUS_BAD_REQUEST,
+ 	  NULL, NULL, -1,
+-	  { { NULL } }
++	  { { NULL } }, 0
+ 	},
+ 
+ 	{ "No terminating CRLF", NULL,
+ 	  "GET / HTTP/1.1\r\nHost: example.com", -1,
+ 	  SOUP_STATUS_BAD_REQUEST,
+ 	  NULL, NULL, -1,
+-	  { { NULL } }
++	  { { NULL } }, 0
+ 	},
+ 
+ 	{ "Unrecognized expectation", NULL,
+ 	  "GET / HTTP/1.1\r\nHost: example.com\r\nExpect: the-impossible\r\n", -1,
+ 	  SOUP_STATUS_EXPECTATION_FAILED,
+ 	  NULL, NULL, -1,
+-	  { { NULL } }
++	  { { NULL } }, 0
+ 	},
+ 
+ 	// https://gitlab.gnome.org/GNOME/libsoup/-/issues/377
+@@ -453,21 +454,40 @@ static struct RequestTest {
+ 	  "GET / HTTP/1.1\r\nHost\x00: example.com\r\n", 36,
+ 	  SOUP_STATUS_BAD_REQUEST,
+ 	  NULL, NULL, -1,
+-	  { { NULL } }
++	  { { NULL } }, 0
+ 	},
+ 
+ 	{ "NUL in header value", NULL,
+ 	  "HTTP/1.1 200 OK\r\nFoo: b\x00" "ar\r\n", 28,
+ 	  SOUP_STATUS_BAD_REQUEST,
+            NULL, NULL, -1,
+-	  { { NULL } }
++	  { { NULL } }, 0
+ 	},
+ 
+ 	{ "Only newlines", NULL,
+ 	  only_newlines, sizeof (only_newlines),
+ 	  SOUP_STATUS_BAD_REQUEST,
+            NULL, NULL, -1,
+-	  { { NULL } }
++	  { { NULL } }, 0
++	},
++	{ "Duplicate Host headers",
++	  "https://gitlab.gnome.org/GNOME/libsoup/-/issues/472",
++	  "GET / HTTP/1.1\r\nHost: example.com\r\nHost: example.org\r\n",
++	  -1,
++	  SOUP_STATUS_BAD_REQUEST,
++	  NULL, NULL, -1,
++	  { { NULL } },
++	  G_LOG_LEVEL_WARNING
++	},
++
++	{ "Duplicate Host headers, case insensitive",
++	  "https://gitlab.gnome.org/GNOME/libsoup/-/issues/472",
++	  "GET / HTTP/1.1\r\nHost: example.com\r\nhost: example.org\r\n",
++	  -1,
++	  SOUP_STATUS_BAD_REQUEST,
++	  NULL, NULL, -1,
++	  { { NULL } },
++	  G_LOG_LEVEL_WARNING
+ 	}
+ };
+ static const int num_reqtests = G_N_ELEMENTS (reqtests);
+@@ -915,10 +935,17 @@ do_request_tests (void)
+ 			len = strlen (reqtests[i].request);
+ 		else
+ 			len = reqtests[i].length;
++
++		if (reqtests[i].log_flags)
++			g_test_expect_message ("libsoup", reqtests[i].log_flags, "*");
++
+ 		status = soup_headers_parse_request (reqtests[i].request, len,
+ 						     headers, &method, &path,
+ 						     &version);
+ 		g_assert_cmpint (status, ==, reqtests[i].status);
++		if (reqtests[i].log_flags)
++			g_test_assert_expected_messages ();
++
+ 		if (SOUP_STATUS_IS_SUCCESSFUL (status)) {
+ 			g_assert_cmpstr (method, ==, reqtests[i].method);
+ 			g_assert_cmpstr (path, ==, reqtests[i].path);
+@@ -1312,6 +1339,32 @@ do_bad_header_tests (void)
+ 	soup_message_headers_unref (hdrs);
+ }
+ 
++static void
++do_append_duplicate_host_test (void)
++{
++   SoupMessageHeaders *hdrs;
++   const char *list_value;
++
++   hdrs = soup_message_headers_new (SOUP_MESSAGE_HEADERS_REQUEST);
++   soup_message_headers_append (hdrs, "Host", "a");
++
++   g_test_expect_message ("libsoup", G_LOG_LEVEL_WARNING,
++                      "soup_message_headers_append_common: Rejecting duplicate Host header");
++   soup_message_headers_append (hdrs, "Host", "b");
++   g_test_assert_expected_messages ();
++
++        /* Case insensitive */
++   g_test_expect_message ("libsoup", G_LOG_LEVEL_WARNING,
++                      "soup_message_headers_append_common: Rejecting duplicate Host header");
++   soup_message_headers_append (hdrs, "host", "b");
++   g_test_assert_expected_messages ();
++
++   list_value = soup_message_headers_get_list (hdrs, "Host");
++   g_assert_cmpstr (list_value, ==, "a");
++
++   soup_message_headers_unref (hdrs);
++}
++
+ int
+ main (int argc, char **argv)
+ {
+@@ -1327,6 +1380,7 @@ main (int argc, char **argv)
+ 	g_test_add_func ("/header-parsing/content-type", do_content_type_tests);
+ 	g_test_add_func ("/header-parsing/append-param", do_append_param_tests);
+ 	g_test_add_func ("/header-parsing/bad", do_bad_header_tests);
++	g_test_add_func ("/header-parsing/append-duplicate-host", do_append_duplicate_host_test);
+ 
+ 	ret = g_test_run ();
+ 
+-- 
+2.34.1
+
diff --git a/meta/recipes-support/libsoup/libsoup_3.4.4.bb b/meta/recipes-support/libsoup/libsoup_3.4.4.bb
index c09b06fec2..6be31806f1 100644
--- a/meta/recipes-support/libsoup/libsoup_3.4.4.bb
+++ b/meta/recipes-support/libsoup/libsoup_3.4.4.bb
@@ -46,6 +46,7 @@ SRC_URI = "${GNOME_MIRROR}/libsoup/${SHRT_VER}/libsoup-${PV}.tar.xz \
            file://CVE-2025-2784.patch \
            file://CVE-2025-4945.patch \
            file://CVE-2025-12105.patch \
+           file://CVE-2025-14523.patch \
 "
 SRC_URI[sha256sum] = "291c67725f36ed90ea43efff25064b69c5a2d1981488477c05c481a3b4b0c5aa"
 
-- 
2.34.1


