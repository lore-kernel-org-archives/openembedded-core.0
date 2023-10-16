Return-Path: <Deepthi.Hemraj@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D5E3ECDB482
	for <webhook@archiver.kernel.org>; Mon, 16 Oct 2023 11:30:39 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.118392.1697455830353439820
 for <openembedded-core@lists.openembedded.org>;
 Mon, 16 Oct 2023 04:30:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=jIZ89AGi;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=8653d93643=deepthi.hemraj@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id 39G5014G009382
	for <openembedded-core@lists.openembedded.org>; Mon, 16 Oct 2023 11:30:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=from:to:cc:subject:date:message-id:in-reply-to:references
	:content-transfer-encoding:content-type:mime-version; s=
	PPS06212021; bh=3O5GXLDZKbhVBQrhHAcIRXPXNju+jgTipnaK/9XqQgc=; b=
	jIZ89AGixaIsbZrEzq3nycsxfDJS61lHft96XkaRg2X6QeetMBaX70tRgvyZFiZL
	usvn/Z8cHj9HFjbWnB/ZHiDzZd89Y3PnQe4xcIF3kxnPD+McTOIAkDOS3yOcSkwP
	8NKtsiUfklcKOS6t5sOFVV4BYla2dC4C+FH72Xlc/J+psdWt4oOJlGZoTTCkGIat
	Em1RuzE4KqFI2xLC5YKqtnhy59WE8qhV1eKCj5jt+FaxFovORu2TxQmFnQMBhcTY
	4kvgCapkt3Y0j9QMjNNCaIjJqM91cDXgRuh9a66v0442x1ol3L9gLGGtWsDTlN2D
	nicO/7bU9J4gMCBEfF6/tw==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3tqhy61rr9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Mon, 16 Oct 2023 11:30:29 +0000 (GMT)
Received: from m0250812.ppops.net (m0250812.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.22/8.17.1.22) with ESMTP id 39GBSch7002604
	for <openembedded-core@lists.openembedded.org>; Mon, 16 Oct 2023 11:30:29 GMT
Received: from nam10-dm6-obe.outbound.protection.outlook.com (mail-dm6nam10lp2101.outbound.protection.outlook.com [104.47.58.101])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3tqhy61rr7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 16 Oct 2023 11:30:29 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=B6csK6DoUf51AxPvkn0/wvyyVT0KLCGz9ZHPAjBzCffwdq+9VcK3+EhFZCii2f556X6swO/W0YX9O0i/Kf12ytPquWFkWQG4+SumuH7rlPVlZx3cyZ1bWym+5uf7e6Lr1yYA9fIs3HO7STkPk1oJHaQrhdP09EJNwNqgVx66gmCBftiRvBCLl+ENHCZPOnksfziGeGxa5b/Ylw3Wlmh6Vu/TomDT2tRQ2srOZSzl4wE+Ryuoai9cFpYqodz5OwYkZJsq/4aXzu9VdZSOR+zF7HDxb9tqeA2tllhObguZBTN8Cr9MY/mPWlECuM7ADYe9gvAtQG/VcFl3HAsxmsH9xw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3O5GXLDZKbhVBQrhHAcIRXPXNju+jgTipnaK/9XqQgc=;
 b=Pu9Q+6soH7VpB0ees+JzUXQnD5MPJEVn3oIFtx+umA6pk4O1F9IS1HtGZLbRvxVevvyjbRd83gSdTscw7AZSBZnf7brgGOcFLrzuKKH+wOvhSRZcmp6RMof//ByKIrUDxrESaS+WRG6dXCYUlPmq9hMXLXbYL1I1vdJcywKda2huqEPzPmX2+NzhY1lH2jovmcv7hR94U0Jb136Ifas8CmLDQ7NiTUX5WPdEGXgtmrbgNj2GcKNVxhO4Gd/G2gG6A6nJZhwp2v6EgpFPqyrA76eJJ06qf8HDVpVBA6aROfu25AAzMLXickNddYO7PHZENObixSFkN8jDLLKBADDyoA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from PH7PR11MB6449.namprd11.prod.outlook.com (2603:10b6:510:1f7::17)
 by IA0PR11MB8353.namprd11.prod.outlook.com (2603:10b6:208:489::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6886.35; Mon, 16 Oct
 2023 11:30:27 +0000
Received: from PH7PR11MB6449.namprd11.prod.outlook.com
 ([fe80::1bc0:182d:fc84:69eb]) by PH7PR11MB6449.namprd11.prod.outlook.com
 ([fe80::1bc0:182d:fc84:69eb%6]) with mapi id 15.20.6886.034; Mon, 16 Oct 2023
 11:30:27 +0000
From: Deepthi.Hemraj@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: Randy.MacLeod@windriver.com, Umesh.Kalappa@windriver.com,
        Naveen.Gowda@windriver.com, Shivaprasad.Moodalappa@windriver.com,
        Sundeep.Kokkonda@windriver.com, steve@sakoman.com
Subject: [kirkstone][PATCH V3 2/2] binutils: Fix CVE-2022-47011
Date: Mon, 16 Oct 2023 04:27:52 -0700
Message-Id: <20231016112752.958551-2-Deepthi.Hemraj@windriver.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20231016112752.958551-1-Deepthi.Hemraj@windriver.com>
References: <20231016112752.958551-1-Deepthi.Hemraj@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BYAPR07CA0082.namprd07.prod.outlook.com
 (2603:10b6:a03:12b::23) To PH7PR11MB6449.namprd11.prod.outlook.com
 (2603:10b6:510:1f7::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6449:EE_|IA0PR11MB8353:EE_
X-MS-Office365-Filtering-Correlation-Id: 423d2f39-7c88-40d4-8f3e-08dbce3b4b85
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	lwBGIB+uW0v4FUftVcp1lbJumO/k1fRmCtaLYK0ubefwVzBp20Nj8y8jmF1zaLortBGaw/j3Ad0w9UgBO7+ocrMPMeWfx82QGuwgruMpJpk3urfqb849fqNsWaKOvTESRc/Kd6gsWWcLLGsljLrnUmL0i70BzgzSlxPgi0jiL99nIgm/pZRNa8D8SAwI10RlFGurPMqCj+IEuTaC6f7CeuzYXE8Bx5/yTxierA15Z1FgyePsofROr0S4NnnMRBxxIC0oWDyxtjxnjsiXHHFlXv2Zy0oVtj/RpkdZPKord/Sq2xjRA1lXfFF70WD0dxl0geIQ91VcJAFICiWyhYrjIOLmucp389JNkXOKZqW0q+fZW8o2yluc+PsHDfjgMHCznLTTtKC/QgVsc8ycpgdfQOUfCm/t0D7Xdaik3RqpkrnryPpGGaNzcOIZojmu7MUUZ9JN2WqzxGsmSe7Eda06cS9Rg85PvxC9zoLRCx3WEKIBApT2vWcM2x2zpSBBRDkejaagaHYxw7B99/zt2JTIsW1CO0BBc/FAQWsnMr/NIqJIBcfx8Xvcx/H44lHJ+HmUL4IrAfvkckD+k1u9M0GB9Ihwv4qr60/wQMiIzHVEoaI=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR11MB6449.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366004)(346002)(376002)(136003)(39850400004)(396003)(230922051799003)(451199024)(64100799003)(186009)(1800799009)(6506007)(52116002)(5660300002)(6666004)(2906002)(1076003)(26005)(36756003)(2616005)(83380400001)(38100700002)(86362001)(9686003)(6512007)(6486002)(966005)(478600001)(66946007)(66476007)(66556008)(6916009)(41300700001)(316002)(38350700005)(8676002)(8936002)(4326008);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?pTVA5kG9PKFRS8J+SjOBIV5uCvetscqNmbp+PJA2yMIREPUOxdLFNF44P4kr?=
 =?us-ascii?Q?tK90kc8JSp3+DzUsQ/BhZlbLZKUDUtxkyXS+r7Q8+3qISQkpU6uQ0Bff8G7S?=
 =?us-ascii?Q?KBOwF1ut96rD7BYA0mUCLhgroMLP5a3Hj71Kh/wa2mfY0o1TKEpkD6xUPpmX?=
 =?us-ascii?Q?r6PQENHvUASEHmcFJpET3oIWLcnr+rjgbVuKqpVJ12mi3ITk8hWNS3k1jfbz?=
 =?us-ascii?Q?xuMvz8kURaIMtW/ztnPx6lwBO2mqGBcJpGbT9XuhNeHe3/XidokEV3IJJ57f?=
 =?us-ascii?Q?Uz7IheOP9oLWZ4wqvomNQktFmvk0w5L4i2+FPR3U/QXZOBoDunoowwelENHm?=
 =?us-ascii?Q?EsroQJSNuUFFHLAa4C8JT4Coei1YqPUeuvdaBRSzI1tjuhhltEgS6bIK1QU9?=
 =?us-ascii?Q?f7VYmb7TNi5QxqE4AUAjh/NSTq5aaj+UAYnvmIZlgXalA+k30SCbgbHA3DQA?=
 =?us-ascii?Q?GbGRVx7AKC6A4K4+yoMj1dv/wz1QIfUs1Uxc1r6tHZXSqxOBGpPKTt5oG7q9?=
 =?us-ascii?Q?6wNJs7ztMSPjn8ewhZn8uez43E4Bow25y2d37ekREM3AJfpB910UGeUMzVJA?=
 =?us-ascii?Q?qzSnoXNYRFCB/NeRT8MuwequXesYgeOwSoW/4v+Qf1YAEXQCNMUwIQnePI48?=
 =?us-ascii?Q?hPJYjtsky16AUWgGrtukAn5FyRxcgwfMd3rVFlEo4OXzqRr3L2Jml0C1I6XT?=
 =?us-ascii?Q?yz/zEHB3Xmed6lQhmFb+jM72Qj8CrvGS0hq/nBW+r9rZ0THlmC+d/WjvgrYC?=
 =?us-ascii?Q?Ax8uxfAElrNb2FUfvq+jp86G0ZmEhk2JnmguwkgYUYJdc9FwYQV33E7g+B+j?=
 =?us-ascii?Q?2kOitDXyI4B2l6xTN4o6zkq77mf8WyrILcGGOj82sfpRzOn2xbS/IbZpNGDH?=
 =?us-ascii?Q?U93S+N6Wvp7WWR2aieZiVcEaDiVV6rid0K3R3oHKTDuX/NK3uJB7oEtyRTv7?=
 =?us-ascii?Q?km6lDyirqVX3VNfZF8/W/Xc2gxoS9BSxkyt94201m9BXBXX4CjUTq4xcdZgd?=
 =?us-ascii?Q?FOJzDL1Gw5qDQnbmxdGmpWsiNKapLUTN/qikCLPIaKX/E28GgTr4knEvzcNt?=
 =?us-ascii?Q?/hoFVE6OnRiWq+PsC7tOpBaTSUr2jif2s0TqkbfGiRIAaiLWOIDmEt4yGYRJ?=
 =?us-ascii?Q?OBiYiKemZUgRptD8D9KJ7LxbI+7IkoHPDKXZb+LLC4GFr+OfwQ1rcuerQZyc?=
 =?us-ascii?Q?i6OsHMiEg/MO+Rv7vQLg2b0gA1EMp31rz433nqxphwS11CIEMwinOzTtRtlS?=
 =?us-ascii?Q?jdnjpNx5ZDCF4YjEY6P+gcGbuUbeB2HqL4oeSZHNw7J7w2ZwN6DNdlF9U2wp?=
 =?us-ascii?Q?309YYraNGcIMW6Acx+rlQD6ViM7D11BlSZFdrMRzsjU20g2gKcA8npwahU/N?=
 =?us-ascii?Q?aSUuK2iZQMB0Eej8E0jeIkJp5KgTFB9hDBoMlE9/fdDa1YUmtFuLXZq2ND5Q?=
 =?us-ascii?Q?4be52m1W56iUO+mKhO2QBMem87nhLBAoMvOMJM4k4NJvCVgeDJ0ES6grD8Oj?=
 =?us-ascii?Q?xbDY1RxzKdpBdlX9NyoMEfP2Owhv6PE2N7nEVFJCd6d/Jfn4Vw3dY9awUwVg?=
 =?us-ascii?Q?WSTFCtmiqZTTF0gEFraR0ZtwiP78dsXdQztawYpWlPZU1f42TRHiCP3A+foB?=
 =?us-ascii?Q?8Q=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 423d2f39-7c88-40d4-8f3e-08dbce3b4b85
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6449.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Oct 2023 11:30:26.9542
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: T2ZnJU622Z6JAhP407QcrQuncPtm+AIRPFwjy+UvVsntBzNXSZFdnpZUnx5IOmQv+lMnwv/kHqb2w4x3TDUDlftCxe/NwAB7QziQLyx1pM8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR11MB8353
X-Proofpoint-ORIG-GUID: 4_89AEfvc19b5s_K5OB6pHmybx854uuJ
X-Proofpoint-GUID: EzQ5md-IdrW3HByX01AA7ihd4G4pBkwO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.980,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-10-16_04,2023-10-12_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 mlxlogscore=801 malwarescore=0 lowpriorityscore=0 suspectscore=0
 mlxscore=0 phishscore=0 spamscore=0 bulkscore=0 clxscore=1015 adultscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2309180000 definitions=main-2310160101
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 16 Oct 2023 11:30:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/189286

From: Deepthi Hemraj <Deepthi.Hemraj@windriver.com>

Signed-off-by: Deepthi Hemraj <Deepthi.Hemraj@windriver.com>
---
 .../binutils/binutils-2.38.inc                |  1 +
 .../binutils/0028-CVE-2022-47011.patch        | 35 +++++++++++++++++++
 2 files changed, 36 insertions(+)
 create mode 100644 meta/recipes-devtools/binutils/binutils/0028-CVE-2022-47011.patch

diff --git a/meta/recipes-devtools/binutils/binutils-2.38.inc b/meta/recipes-devtools/binutils/binutils-2.38.inc
index 6c670ce4e3..cd7a5c32a5 100644
--- a/meta/recipes-devtools/binutils/binutils-2.38.inc
+++ b/meta/recipes-devtools/binutils/binutils-2.38.inc
@@ -57,6 +57,7 @@ SRC_URI = "\
      file://0026-CVE-2023-1972.patch \
      file://0025-CVE-2023-25588.patch \
      file://0027-CVE-2022-47008.patch \
+     file://0028-CVE-2022-47011.patch \
      file://0029-CVE-2022-48065-1.patch \
      file://0029-CVE-2022-48065-2.patch \
      file://0029-CVE-2022-48065-3.patch \
diff --git a/meta/recipes-devtools/binutils/binutils/0028-CVE-2022-47011.patch b/meta/recipes-devtools/binutils/binutils/0028-CVE-2022-47011.patch
new file mode 100644
index 0000000000..73ae46e218
--- /dev/null
+++ b/meta/recipes-devtools/binutils/binutils/0028-CVE-2022-47011.patch
@@ -0,0 +1,35 @@
+From: Alan Modra <amodra@gmail.com>
+Date: Mon, 20 Jun 2022 01:09:13 +0000 (+0930)
+Subject: PR29261, memory leak in parse_stab_struct_fields
+X-Git-Tag: binutils-2_39~225
+X-Git-Url: https://sourceware.org/git/?p=binutils-gdb.git;a=commitdiff_plain;h=8a24927bc8dbf6beac2000593b21235c3796dc35
+
+PR29261, memory leak in parse_stab_struct_fields
+
+	PR 29261
+	* stabs.c (parse_stab_struct_fields): Free "fields" on failure path.
+
+Upstream-Status: Backport [https://sourceware.org/git/?p=binutils-gdb.git;a=commitdiff_plain;h=8a24927bc8dbf6beac2000593b21235c3796dc35]
+
+CVE: CVE-2022-47011
+
+Signed-off-by: Deepthi Hemraj <Deepthi.Hemraj@windriver.com>
+
+---
+
+diff --git a/binutils/stabs.c b/binutils/stabs.c
+index 796ff85b86a..bf3f578cbcc 100644
+--- a/binutils/stabs.c
++++ b/binutils/stabs.c
+@@ -2367,7 +2367,10 @@ parse_stab_struct_fields (void *dhandle,
+ 
+       if (! parse_stab_one_struct_field (dhandle, info, pp, p, fields + c,
+ 					 staticsp, p_end))
+-	return false;
++	{
++	  free (fields);
++	  return false;
++	}
+ 
+       ++c;
+     }
-- 
2.39.0


