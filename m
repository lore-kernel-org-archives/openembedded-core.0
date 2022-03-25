Return-Path: <joe.slater@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 33E47C433EF
	for <webhook@archiver.kernel.org>; Fri, 25 Mar 2022 20:49:06 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com
 [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.253.1648241343880498751
 for <openembedded-core@lists.openembedded.org>;
 Fri, 25 Mar 2022 13:49:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=QuAs6v4e;
 spf=permerror,
 err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}:
 invalid domain name (domain: windriver.com, ip: 205.220.166.238,
 mailfrom: prvs=00839d37f9=joe.slater@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id
 22PKjQjo004604
	for <openembedded-core@lists.openembedded.org>;
 Fri, 25 Mar 2022 13:49:03 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=from : to : cc :
 subject : date : message-id : content-transfer-encoding : content-type :
 mime-version; s=PPS06212021;
 bh=VjRbfuNpWYnmkK46/LkUhS+DUi2B92CdNNJSRceuwsk=;
 b=QuAs6v4ekfV0XRA/OIiyzMIdmAUkxawehD2TritTMrK3uxKuy07+IPjnlvg0vFfiORdd
 dQE2aHxA/+lMv8hvF0RTVz7nlbYFIGtfJHhox2jL1CPIGBQ26D8c45LtcfoA5ES5ASFv
 A9q7mJ4x3TcqJaAa0G13un97Sl/XY/FEPOdaCxWYyBmueG4hWL2QpYxciYdj8FpdffNa
 +n1plWWGS0J1QHwnU6rTsy2tYROAj+tLjrYdp/7dhaDNPHeRLf6Mmg/5uTEZyBw2n+Oj
 Q1LS+QkAW6LNsaGPImlcHR8xqB/0fnF6YRspjNjDuqV/vdr93hmMn9X24vRMGFbjxgPF KA==
Received: from nam11-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam11lp2170.outbound.protection.outlook.com [104.47.57.170])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3ewaf3wp70-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
 Fri, 25 Mar 2022 13:49:03 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jI3n3EaKvB9wtDoSR0xuh1HGztZQG/Dt6RDfYcrviiw070L8xZjU5M9FjIFEE43YTx4+WyMhSR9JbZu8Kj48VxLgVHsoLz9BE6JlDILKdpXj1gwpt6tUEXckb8HctFIOpXqZGIO4QEoV0V+kMW0nVq5qBCJ87l0uVBW0lZGpyuQmj41l2nJpJbyDrKysprBQIjHw3Mj+yB0L8DVv65F5tifoOMMpY/ZdzDb7Ta/+Ho7PJ/9XPTCWgGi32APfgLfrYwEXpQINluusVmmcqEfo7tWmHvHaDTywgp4UJpecQTEsaZbblLrrJoxhUuaVs8RIN/piiel1gwr2mUTeuDC5SA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VjRbfuNpWYnmkK46/LkUhS+DUi2B92CdNNJSRceuwsk=;
 b=cbSB2SdPcFmYKzkxI/K6gppGu59ZxdBzUAS4wJHDgerkQZ/4oUgARuYBq50IZWMUxGj4mz4R/02zIydbY71Y6VCdU93nJYCQaHAxxL5DpdpGrUHiz3THBC2dfa9nCs6HJiGkr3KkmCvunrj2OlKrnedXUoJ0mngXhNZGYl97YX4TomNJrC9TRYwryHEUQWARt4uQR+hledHUyG8UPraWToax6Za0EC465iQnevzFwI1rVRZs5PYo0OET9ViwVv9jll+u/C/8dU70CR+be/njchsQ+AXt5PZJR1eyi3EvkLEW0lHIu0ppEz4NZdB9FWa2FmcWyY0gKaFcdLZNBsQ1ng==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from BY5PR11MB3992.namprd11.prod.outlook.com (2603:10b6:a03:188::10)
 by DM5PR11MB0026.namprd11.prod.outlook.com (2603:10b6:4:62::35) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5081.17; Fri, 25 Mar
 2022 20:49:01 +0000
Received: from BY5PR11MB3992.namprd11.prod.outlook.com
 ([fe80::389d:5330:bc19:13c4]) by BY5PR11MB3992.namprd11.prod.outlook.com
 ([fe80::389d:5330:bc19:13c4%7]) with mapi id 15.20.5102.016; Fri, 25 Mar 2022
 20:49:01 +0000
From: Joe Slater <joe.slater@windriver.com>
To: openembedded-core@lists.openembedded.org
Cc: joe.slater@windriver.com, randy.macleod@windriver.com
Subject: [oe-core][hardknott][PATCH 1/1] flac: fix CVE-2021-0561
Date: Fri, 25 Mar 2022 13:48:41 -0700
Message-Id: <20220325204841.24880-1-joe.slater@windriver.com>
X-Mailer: git-send-email 2.35.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR03CA0291.namprd03.prod.outlook.com
 (2603:10b6:a03:39e::26) To BY5PR11MB3992.namprd11.prod.outlook.com
 (2603:10b6:a03:188::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 20573a15-fdae-4c46-c6b5-08da0ea0e3ed
X-MS-TrafficTypeDiagnostic: DM5PR11MB0026:EE_
X-Microsoft-Antispam-PRVS: 
	<DM5PR11MB002614EF6894362DC85CCC50881A9@DM5PR11MB0026.namprd11.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	ObuVN2ggUwh4BSLRbpQSKkgs0rZStDmyeKtlhPrm7ZNxRqO06k35ww3+dPi+NjvvYz5gR9VvwO7vOwB7MKByL5vtf7sclJDtP05GTQSXEucag76cVQJN535McAvemGowQHeZbJr/l46Hfxkygj62qvjNS4arBlRqB38FwfUTFgqb2LVjhEZfRTjyfRh9O2+8rt5YXpMo+j5Q6cO8/SGUP+XL84ZxnD5YrF9ISo395CwMYyTHpFPXQglDjh2iW/3Ln3Hhn8I9PZGTWTpTJmaemjG9cz8ZltfDDj+nsf6lI1Wro1Ljx06BTPk8F49AZZy+q67BW0Js/wwykcXlwul8MmhTGiNrq0IM8RaWpiQqNwoWWZ6Io5ZlqPl6b4ku7rLW/lqJHgljI06h5GqRk1tCBzcYjg+YSLnFN2yM7pY+RylLhoMJ+5nGM2X81Ont89aK7VS+E5TIIwfk3Zn5MwPyfYipMBTYubWfQB16aMB8m6tDSsjKYSotdVzept26kCXnIDjBDaB7OnK17CkSIOo6He3noa7jVKYG776YtF84QTAyDBTnq7NhJyFkBUoloqFvl4Zgvws73L7UG/Qe0Or/7I7bBsvgfQd6dLz+3MDyWt3BF1Im9aiHwQIN7prcxmOXVm2fevvmvCC3IcJYMRHJ85SXT8YVDLzjeDVUQm74RC9DhWKz6TBkz5oT5CDMqnAKjuqgEdxt0yjlrRH9LSru4yIHVEYduKcwf3s/g8GgLGmpPaW1W15iuDvFClE0kdxMW6/ROxfZKJXoD57aDtOnS4R4YX0Z5bT4U1xxYT7Y7iS/p+33CfKxfxFU11LHKNxy
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB3992.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(38100700002)(38350700002)(508600001)(6486002)(6666004)(966005)(36756003)(5660300002)(6916009)(8676002)(86362001)(66556008)(8936002)(66946007)(2906002)(83380400001)(52116002)(66476007)(316002)(107886003)(6506007)(6512007)(26005)(2616005)(44832011)(1076003)(186003)(4326008);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?WmhCwcv2dI0yNmJ2PS0hW0j3ONxU5hS6xU9xKePDDkxQGRmFVvoeWiybSg2y?=
 =?us-ascii?Q?fNoi8UX6I+adNeegSei5U+O/LHbl5cLXTu6t0Hz7/wKh3OFcSF8BGpxX3egB?=
 =?us-ascii?Q?+9Nucvx632eyQFWWhmoKeCz+M2zGeg/lSniAUl4Xn1oLThUBNg9VsExprtUF?=
 =?us-ascii?Q?lNTJHO0l7OxbJ+N1ZyTmrz3DWpifyThS7vLJR/GtdwDo7IxVHBK70vDPcFTc?=
 =?us-ascii?Q?/I6HCw+Y5IswccFDW0oWZBXiv3SoW+J5LIs4PS1t5WCIlhndM4xWWqYRorb9?=
 =?us-ascii?Q?MkS5AtNISh6HQLyHDs4nZKqdDRLkEWRAwN/KTOLct70VLePvpS57U1p7cGHd?=
 =?us-ascii?Q?I/bEzpX2QxKsuFnVSuqYqhzgx1D+hmoXwK/oeY69x9ZhKufdO0X/Dy8uh6en?=
 =?us-ascii?Q?CdIRcRHup3tPq7sfdNHYElc5sIsUaxluwb2qf76pNPkzDv3O1IonlUlVlcIg?=
 =?us-ascii?Q?ax/01OEbEm+VeytXEe/oPtS1x8IezriG7A7cir2Qk1HkdrGobHQ6QnsDPQeJ?=
 =?us-ascii?Q?431ZGFyNnPjI9jSXM5M+pNLPczEkIqJyUZ4Jm2EiRmrvx0A9+Gl/eoAhWlIT?=
 =?us-ascii?Q?5mMxiXXXzv8kGPdpBkP81T8Ka3tUqe/TNnU/n2rTOBIiUWKo+TNBZV2g0BCF?=
 =?us-ascii?Q?eeRcopFCP6VhYITlxjTXH3qf6pA3quFopEwAXu64+krP7OcDTLLnBVuEYsKN?=
 =?us-ascii?Q?aU0Fj5YwoUV+Dg/Jf1Uj6IT4FUGH38/snUVv7/mvshWddV3hNTk86v3imCDg?=
 =?us-ascii?Q?Md8N5e0M4+oNaq3c48CLpNLPsvZMSaxI06izo/jgdjmFKT6w2VHJhI+4IKvL?=
 =?us-ascii?Q?IsBxYtK1GcG0zm3bmbjEepHAwH0yRPlSdtcbtU/2uo3nBzsaZ/9pkzhBRlHh?=
 =?us-ascii?Q?jKGQRhXnFT7KyhevXxX62IKwceJksZ0yPT1s2tDoUhNCg2k4Mu90OjgP+ms7?=
 =?us-ascii?Q?3fBZfPgMEPQ3GxlL7ttutdwTUuNwwU1gCdS84coo6hqf/D7kcSweTdfhMHZu?=
 =?us-ascii?Q?hOlOCRHiAdzVvQkvZhugaI1vTPOSPZI3dkHW50/DfJvjgnLhiNF6UhUab2ss?=
 =?us-ascii?Q?kvs44O2N3IgJE4GkAAtzRc/kg5l1Lo7Rvt+jXso7Hv53KpZRjnFQI+AsetYx?=
 =?us-ascii?Q?E1AdHMO/c/yBjrSmtjwg8RCaGSYDlIjKRn2Z2wVWB8RLOb610whk1hmtUEPI?=
 =?us-ascii?Q?EIarlEDY3tAacPMvTJYsXkX2VNaRMyapCtHQ3rQ4GLZWJtGBPpYEYfRSpi2l?=
 =?us-ascii?Q?8dn/TC7PNAn283flCN9RxbEMriw97U+MjHTY+hgMvU8cIINgNHd2qs39FtyN?=
 =?us-ascii?Q?0tXMVTz3H54NmIR3u0qLIVzPZ80WbZQaFCfSOCq0VpVii8sYMvU7DzIhR0QS?=
 =?us-ascii?Q?gOUZP1DtLw3XhqrotcAnqFC1LajQVo6/DosABUCYq1ZrH/bre1kAa2FXJ0ie?=
 =?us-ascii?Q?JGN/lixTFHw6ipUxEIGw7Gi0ONel3K9v+b0/S2aJ7Ikd9M0D5Hl4AA=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 20573a15-fdae-4c46-c6b5-08da0ea0e3ed
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3992.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Mar 2022 20:49:00.9944
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 hkLC1hYWqqAxI2PFz008WExZasqAEDsoGeXfC7H6AgK2AOcvHjlPt383A+SGX+k80nlUDlODyIk4L5lH3FR/V39wwWkOHyiyc+Yenk3Tezk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR11MB0026
X-Proofpoint-ORIG-GUID: 0COwUoLQd4Y-hkBC6DzRPnccU7lmaM0A
X-Proofpoint-GUID: 0COwUoLQd4Y-hkBC6DzRPnccU7lmaM0A
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.850,Hydra:6.0.425,FMLib:17.11.64.514
 definitions=2022-03-25_07,2022-03-24_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0
 priorityscore=1501 lowpriorityscore=0 impostorscore=0 mlxscore=0
 bulkscore=0 malwarescore=0 mlxlogscore=514 suspectscore=0 clxscore=1015
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2202240000 definitions=main-2203250114
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 25 Mar 2022 20:49:06 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/163653

From: Li Wang <li.wang@windriver.com>

In append_to_verify_fifo_interleaved_ of stream_encoder.c, there is
a possible out of bounds write due to a missing bounds check. This
could lead to local information disclosure with no additional
execution privileges needed. User interaction is not needed for
exploitation.Product: AndroidVersions: Android-11Android ID: A-174302683

References:
https://nvd.nist.gov/vuln/detail/CVE-2021-0561

Upstream patches:
https://github.com/xiph/flac/commit/e1575e4a7c5157cbf4e4a16dbd39b74f7174c7be

Signed-off-by: Li Wang <li.wang@windriver.com>
Signed-off-by: Joe Slater <joe.slater@windriver.com>
---
 .../flac/flac/CVE-2021-0561.patch             | 41 +++++++++++++++++++
 meta/recipes-multimedia/flac/flac_1.3.3.bb    |  1 +
 2 files changed, 42 insertions(+)
 create mode 100644 meta/recipes-multimedia/flac/flac/CVE-2021-0561.patch

diff --git a/meta/recipes-multimedia/flac/flac/CVE-2021-0561.patch b/meta/recipes-multimedia/flac/flac/CVE-2021-0561.patch
new file mode 100644
index 0000000000..b48663ae42
--- /dev/null
+++ b/meta/recipes-multimedia/flac/flac/CVE-2021-0561.patch
@@ -0,0 +1,41 @@
+From e1575e4a7c5157cbf4e4a16dbd39b74f7174c7be Mon Sep 17 00:00:00 2001
+From: Neelkamal Semwal <neelkamal.semwal@ittiam.com>
+Date: Fri, 18 Dec 2020 22:28:36 +0530
+Subject: [PATCH] libFlac: Exit at EOS in verify mode
+
+When verify mode is enabled, once decoder flags end of stream,
+encode processing is considered complete.
+
+CVE-2021-0561
+
+Signed-off-by: Ralph Giles <giles@thaumas.net>
+
+Upstream-Status: Backport
+CVE: CVE-2021-0561
+
+Reference to upstream patch:
+https://github.com/xiph/flac/commit/e1575e4a7c5157cbf4e4a16dbd39b74f7174c7be
+
+Signed-off-by: Li Wang <li.wang@windriver.com>
+---
+ src/libFLAC/stream_encoder.c | 4 +++-
+ 1 file changed, 3 insertions(+), 1 deletion(-)
+
+diff --git a/src/libFLAC/stream_encoder.c b/src/libFLAC/stream_encoder.c
+index 74387ec..8bb0ef3 100644
+--- a/src/libFLAC/stream_encoder.c
++++ b/src/libFLAC/stream_encoder.c
+@@ -2610,7 +2610,9 @@ FLAC__bool write_bitbuffer_(FLAC__StreamEncoder *encoder, uint32_t samples, FLAC
+ 			encoder->private_->verify.needs_magic_hack = true;
+ 		}
+ 		else {
+-			if(!FLAC__stream_decoder_process_single(encoder->private_->verify.decoder)) {
++			if(!FLAC__stream_decoder_process_single(encoder->private_->verify.decoder)
++			    || (!is_last_block
++				    && (FLAC__stream_encoder_get_verify_decoder_state(encoder) == FLAC__STREAM_DECODER_END_OF_STREAM))) {
+ 				FLAC__bitwriter_release_buffer(encoder->private_->frame);
+ 				FLAC__bitwriter_clear(encoder->private_->frame);
+ 				if(encoder->protected_->state != FLAC__STREAM_ENCODER_VERIFY_MISMATCH_IN_AUDIO_DATA)
+-- 
+2.23.0
+
diff --git a/meta/recipes-multimedia/flac/flac_1.3.3.bb b/meta/recipes-multimedia/flac/flac_1.3.3.bb
index cb6692aedf..d3c352cc44 100644
--- a/meta/recipes-multimedia/flac/flac_1.3.3.bb
+++ b/meta/recipes-multimedia/flac/flac_1.3.3.bb
@@ -15,6 +15,7 @@ LIC_FILES_CHKSUM = "file://COPYING.FDL;md5=ad1419ecc56e060eccf8184a87c4285f \
 DEPENDS = "libogg"
 
 SRC_URI = "http://downloads.xiph.org/releases/flac/${BP}.tar.xz \
+           file://CVE-2021-0561.patch \
 "
 
 SRC_URI[md5sum] = "26703ed2858c1fc9ffc05136d13daa69"
-- 
2.35.1


