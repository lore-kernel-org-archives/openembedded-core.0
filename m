Return-Path: <yi.zhao@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F0119C43334
	for <webhook@archiver.kernel.org>; Sat, 23 Jul 2022 07:27:21 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com
 [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web09.4249.1658561240926947259
 for <openembedded-core@lists.openembedded.org>;
 Sat, 23 Jul 2022 00:27:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=ehMuiovN;
 spf=permerror,
 err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}:
 invalid domain name (domain: windriver.com, ip: 205.220.178.238,
 mailfrom: prvs=42030cfc59=yi.zhao@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id
 26N7RKle014428
	for <openembedded-core@lists.openembedded.org>; Sat, 23 Jul 2022 07:27:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=from : to :
 subject : date : message-id : content-transfer-encoding : content-type :
 mime-version; s=PPS06212021;
 bh=/RpxHzXQrmGIiE+MaEM1xubtXy9JEmH4QIKffqSQJ9U=;
 b=ehMuiovNA9QsldBZPQFNVlf2Hv2P1hu7VZf5wskaaLmW/+6kFYbIw0IAm95JKwTjTuxb
 FcYH/VYClqbSCLHSItxKuId1a5I+iKSZxMbwiTLGJ40kfdhZY47ctpH50gME3lfvAVXg
 1OYlIct8jdkZtlwKnnpSvOwyLIZgccho5H+YzQCLICDs6cPmH5Ocpyro0eQUpEmXztT3
 yIwW6POZJHYalXSaQLjwZ8BGx72qcqkr/DIg64rOVdMcTB+f2Ml65DwVGCzgDtNumfLN
 VVCHdas3Q45RNDaxjgp4hR/EhOH21+itmcnfo2qV0Ricf/phC0xiN21XLmDYND4F7mgp QA==
Received: from nam10-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam10lp2101.outbound.protection.outlook.com [104.47.55.101])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3hg7y8r4db-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
 Sat, 23 Jul 2022 07:27:19 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FUGWyOVs8pldeLr9j6LBN0NJewtIxLW+UspDsGAiK1Xt3icxtZ29ATySpCGmhXjKe75suu83X+UsWctLpZCwj8u4fEIbCnNRz+58fwJOHuQvjngo10dB1wn+DT9zwOx6aFG1UcnZIuZeq/+z5/HoUknDj62Zs/+w/wOK8wuHQGofseBONX8dVdw1BUqm2C66FVtuXpuh2LT4z25bzMvoYaMb6cbm8LLkHVYhcEGftSIWVwRMayDgR/Wi2Lm9uTxTcj4QVS6+3XMS4c5L5LMAdf97KCDLS/MVPKGO8zgl6U/jYhExhoIR15JTDHUvHh9XI1Q7fYxDQ7Xf+dvmxJ32iw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/RpxHzXQrmGIiE+MaEM1xubtXy9JEmH4QIKffqSQJ9U=;
 b=Fgl56whv6sppfOsKwdRmai8MUKm+uy4iMPgdQPqvivmAEFhRuV2CtPCNyyHWkN1uO7/rU99S/K54yrqz6aU6mUNfu/OUUKyf1HaAUrldOU1S7idz36XnG7D9w9I/WxllvBlDUkHSTWjPuS+9xYqUhhYkDoKJYRJC7hq+O7U2g0OXifEgZdM6Mzhi7YewgR/PbAd5eh9+wJss90ZC8/t5d+SddTl2TOZRpL35Bv1NrAq3F4aPX95QxWFKv/m4LEXPzNPDVR+QVVJ54ZmmwtXf8EL0kuEk9ikVhboWNAkkMZ4aOjDba3mNWrdjVk/bq2tqop78mcQTlb/nKVE7itm8+Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO1PR11MB4867.namprd11.prod.outlook.com (2603:10b6:303:9a::13)
 by MWHPR11MB1981.namprd11.prod.outlook.com (2603:10b6:300:111::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5458.19; Sat, 23 Jul
 2022 07:27:17 +0000
Received: from CO1PR11MB4867.namprd11.prod.outlook.com
 ([fe80::48ea:c4c0:360f:7c16]) by CO1PR11MB4867.namprd11.prod.outlook.com
 ([fe80::48ea:c4c0:360f:7c16%6]) with mapi id 15.20.5458.020; Sat, 23 Jul 2022
 07:27:17 +0000
From: Yi Zhao <yi.zhao@windriver.com>
To: openembedded-core@lists.openembedded.org
Subject: [kirkstone][PATCH] tiff: Security fixes CVE-2022-1354 and
 CVE-2022-1355
Date: Sat, 23 Jul 2022 15:27:06 +0800
Message-Id: <20220723072706.2540924-1-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.25.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR01CA0152.apcprd01.prod.exchangelabs.com
 (2603:1096:4:8f::32) To CO1PR11MB4867.namprd11.prod.outlook.com
 (2603:10b6:303:9a::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 8ec1777d-b25a-49a6-8518-08da6c7cc5a8
X-MS-TrafficTypeDiagnostic: MWHPR11MB1981:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	UGlfy4jjvfYt3xg6hSq8LiLflwqBJ5jU/EY6NNfToRjavPLCxfWPpoWWffMQfi7sKLZQ84IcsMZaYthET7DOPUv7t9ugcQmP+6EjcwxSGWb93cVkssRKEUFkobIELuS6CHVTpbgfJBSHbBdFI3uizAiD4vwaxqW+mY2F9WPXbE6fsFV9FTXY7Zr4gbPDIVAJE7io19zrwQCPkt1VmDGr58XlRejNnp++uEd/J3ueLXPqn/i9zxMtyglQy1q+0gYOdKBxVydaaouH7o45TQBmpnQnJ0NpQFx81V8abiYR4xHjmf6uG7sCQsFNxUeav+/1zz6JvEqWiPnglFHCrQYjklNAB0+B+xgt8LTTxxIRtJUi6pXNUMxnHpCOVlvHdrx1vGYG0bZK1+ceAyFIyu6PLikd+WEvmGWFKqrrS/bMUHVzu+rw+IEPPJ3G3rG4U0FjuYjWJ0iM9McHwDvJvqb/GIN5Q2z3iKRCwejWT3sPdnX8f3eg2JZBqXXW0UTgvfA8j0m86Cb7rsL+PXMdbkQpTcb7qFPSxIql2iT71QFnmptgtA/uhVSGpjivzik9Zzg0jq/rpnhPxprbcng3mPsvA8m8qtu6zN/VKUjljlSnU0WGJgIODkiVaoYPgA6MzoU6K1CbBU7EnFy3tDQ6w1Al50YPTraAHCODNgO+1b0oN6saykPxElQ34Ktdw9QBZS7wd8/iQAHLyMBOOG7DL19GaDZzO0Aq8+o3HT8BbcEnROdE+XRNMvz8acXj5k1gzhSb7gmck9MDw9l+TODSaQ8w/4ZXlqSocoKTfLy/aWornhccI+rqcA0I1CQOocTFn1xLQLtqzxVPiFo/cKNzkcCovrpT2Z/3YAeZWyTRfleuzdiU9MGql85oxP1i+0eTIKfiO3X3SBIzNMarTLeSZa5h1Q==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB4867.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(39850400004)(346002)(396003)(376002)(136003)(366004)(8676002)(66556008)(83380400001)(66476007)(26005)(2906002)(66946007)(41300700001)(6666004)(30864003)(478600001)(8936002)(44832011)(5660300002)(6506007)(6512007)(38350700002)(52116002)(966005)(38100700002)(6486002)(186003)(316002)(36756003)(6916009)(1076003)(2616005)(15650500001)(86362001)(21314003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?VEuLg2GMYEGPNcW+kbFvFqAOqJxqdkO3AE5rcsfxSC7349OwxFG2utS36Pfo?=
 =?us-ascii?Q?aHbt5uXcvluS2RRsL1/lY+Tas9+WIuyEs2dOzcof4KjW5xhIVEAOdboBfbiE?=
 =?us-ascii?Q?Ic52Qe/uwkpIfMv0HraYv4rElEFJr+WV+u1LlhMJFvD9LZrIeUXAUozhjoss?=
 =?us-ascii?Q?S/1CWs4+Vtg6A7z/PahjdlVVa0APOM2VAWyezt+FDHaU5EtPIv3AeJXcTYyf?=
 =?us-ascii?Q?BB3frrGjWcilmG41Y12quTd4psKkfL5M/wPEgDCdvE/VOSxegTXqfo5wLCNN?=
 =?us-ascii?Q?MRwGK4RbjuIlmB0j9YX175pFoj46bT09agEPmdojyJZj4yhCgguGCpT2zQgl?=
 =?us-ascii?Q?naCow7YGlFT4FwCYBI0eW0du4FLbEp+UaMe/oobn0yNcI3yKg0ojU6S/7BtX?=
 =?us-ascii?Q?a+mHmnosGUNqau62w7LLJ10sLDWzXCMj0P5AZ8z6JEaRBRiscc+x5Rrco4vu?=
 =?us-ascii?Q?smHRKjyvw2id7WLIIYPfn7zfqSbUHUPvZT+HwR/XLwnWw+adWzLlwx3TBocA?=
 =?us-ascii?Q?8CSomttnCPgbUnXxsv04Y8I12WiIO09nusEIbJ4itVgPryh+DCkVeVb5g8vb?=
 =?us-ascii?Q?k6YxJZkueIa3vsQlHnm/ABY9IrlPim12wxg/p7UKTAlOU47MiKZ77LrF95TO?=
 =?us-ascii?Q?PZz1bz/o/lh0I2l6JeJlGma/LAoPcW/mdHUFlXTLe2PgGzOd+9oqEivkejWs?=
 =?us-ascii?Q?S3bi0QcaQ8tDYFugh9++/5oDCJtqQx9H+GfCYvnndS43IHPPfvFyNM+GZ5DB?=
 =?us-ascii?Q?nSEvj3I44T7XcC7hbI7Ew5EKG0lTWPRMlLuSYCCSjiJ6G8Nv9sNldYWV5F7+?=
 =?us-ascii?Q?iWT+xenM/NREJy0Tw3aS3+AgJtFRTAzRlmUADFUhxdATytUHaqqkeNVKYEWZ?=
 =?us-ascii?Q?1/2s5/AgLi9g+P4//HisPT+LfKAMfZTcKW/LJHBvC8YFw389KgU802+iYq62?=
 =?us-ascii?Q?Oh2+c1VFLpw2IIm8ZOgBtsgJPFaIiGHSsWlMLQErv7XlQmtNQjEwl2fTT5KK?=
 =?us-ascii?Q?BMGTd9xGr7xh0Vqh3JBLJ081PlNmwcNZTE5LSHr6HV/nfoRFqoZvKI/7NDm9?=
 =?us-ascii?Q?fTQO+XAjH1TzZrA8GTuPL28EMhbvSHS2eCgmZKxrnZCv5DNPn1ZgVTjtXwi0?=
 =?us-ascii?Q?KF1LKuutVQxT3USMGfSxYdcXPXJdbI1/J7RNlUkE5XPejYdxthpv9IjBW975?=
 =?us-ascii?Q?QIAIoWMDs+e2K9TtoWbChkDJMqwu42cr+CPMynCvXLyReFIFcUApXe4jy3+j?=
 =?us-ascii?Q?zFSy5B7VMoCzthM969v4Kd5fxA6S666znZ4eLdUYgNutFrc0hYKxHXXEK1AI?=
 =?us-ascii?Q?HmqV9FVc1YEDg+H3zQ/80CnZXkDP4skQVtkd9Ae0nXqiYwW/ZSQlfXjEKacp?=
 =?us-ascii?Q?mT6X2p6wbRdnKmrWv+Qejojzg2PdZrgazGMsETHiaxdGKY7eYPVqF2X4574y?=
 =?us-ascii?Q?30e0nUVsr3akWRrSTGkOGYNULEBFUPeO8PwQFPHN4UXkoIkB5xS9dAMt5ekY?=
 =?us-ascii?Q?jqQ1MKvUtEp3VoVFN4PgQ2fPoXQD5Vr7WVLaBqENGWPhQpbJRNZCSs6O+KYD?=
 =?us-ascii?Q?d/nh8oRicPTkcVeIcoqUwHY84hzeZxnyUsLImfca?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 8ec1777d-b25a-49a6-8518-08da6c7cc5a8
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB4867.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jul 2022 07:27:17.5808
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 UAjegjCccCGDdhUyWwu89uTCHol+N0drZui2GUxUAiSw/jvlBTWX25FORAdC5HWbHG96lVkgkjn0mxncLJ1vIA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR11MB1981
X-Proofpoint-GUID: y15VQ6Shj3hEYsN9bvcuHVT2Ua4W73Bd
X-Proofpoint-ORIG-GUID: y15VQ6Shj3hEYsN9bvcuHVT2Ua4W73Bd
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-07-22_06,2022-07-21_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0
 mlxlogscore=522 lowpriorityscore=0 adultscore=0 mlxscore=0 bulkscore=0
 malwarescore=0 phishscore=0 clxscore=1015 priorityscore=1501 spamscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2206140000 definitions=main-2207230031
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 23 Jul 2022 07:27:21 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/168428

References:
https://nvd.nist.gov/vuln/detail/CVE-2022-1354
https://security-tracker.debian.org/tracker/CVE-2022-1354

https://nvd.nist.gov/vuln/detail/CVE-2022-1355
https://security-tracker.debian.org/tracker/CVE-2022-1355

Patches from:

CVE-2022-1354:
https://gitlab.com/libtiff/libtiff/-/commit/87f580f39011109b3bb5f6eca13fac543a542798

CVE-2022-1355:
https://gitlab.com/libtiff/libtiff/-/commit/c1ae29f9ebacd29b7c3e0c7db671af7db3584bc2

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 .../libtiff/tiff/CVE-2022-1354.patch          | 212 ++++++++++++++++++
 .../libtiff/tiff/CVE-2022-1355.patch          |  62 +++++
 meta/recipes-multimedia/libtiff/tiff_4.3.0.bb |   2 +
 3 files changed, 276 insertions(+)
 create mode 100644 meta/recipes-multimedia/libtiff/tiff/CVE-2022-1354.patch
 create mode 100644 meta/recipes-multimedia/libtiff/tiff/CVE-2022-1355.patch

diff --git a/meta/recipes-multimedia/libtiff/tiff/CVE-2022-1354.patch b/meta/recipes-multimedia/libtiff/tiff/CVE-2022-1354.patch
new file mode 100644
index 0000000000..71b85cac10
--- /dev/null
+++ b/meta/recipes-multimedia/libtiff/tiff/CVE-2022-1354.patch
@@ -0,0 +1,212 @@
+From 87881e093691a35c60b91cafed058ba2dd5d9807 Mon Sep 17 00:00:00 2001
+From: Even Rouault <even.rouault@spatialys.com>
+Date: Sun, 5 Dec 2021 14:37:46 +0100
+Subject: [PATCH] TIFFReadDirectory: fix OJPEG hack (fixes #319)
+
+to avoid having the size of the strip arrays inconsistent with the
+number of strips returned by TIFFNumberOfStrips(), which may cause
+out-ouf-bounds array read afterwards.
+
+One of the OJPEG hack that alters SamplesPerPixel may influence the
+number of strips. Hence compute tif_dir.td_nstrips only afterwards.
+
+CVE: CVE-2022-1354
+
+Upstream-Status: Backport
+[https://gitlab.com/libtiff/libtiff/-/commit/87f580f39011109b3bb5f6eca13fac543a542798]
+
+Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
+---
+ libtiff/tif_dirread.c | 162 ++++++++++++++++++++++--------------------
+ 1 file changed, 83 insertions(+), 79 deletions(-)
+
+diff --git a/libtiff/tif_dirread.c b/libtiff/tif_dirread.c
+index 8f434ef5..14c031d1 100644
+--- a/libtiff/tif_dirread.c
++++ b/libtiff/tif_dirread.c
+@@ -3794,50 +3794,7 @@ TIFFReadDirectory(TIFF* tif)
+ 		MissingRequired(tif,"ImageLength");
+ 		goto bad;
+ 	}
+-	/*
+-	 * Setup appropriate structures (by strip or by tile)
+-	 */
+-	if (!TIFFFieldSet(tif, FIELD_TILEDIMENSIONS)) {
+-		tif->tif_dir.td_nstrips = TIFFNumberOfStrips(tif);  
+-		tif->tif_dir.td_tilewidth = tif->tif_dir.td_imagewidth;
+-		tif->tif_dir.td_tilelength = tif->tif_dir.td_rowsperstrip;
+-		tif->tif_dir.td_tiledepth = tif->tif_dir.td_imagedepth;
+-		tif->tif_flags &= ~TIFF_ISTILED;
+-	} else {
+-		tif->tif_dir.td_nstrips = TIFFNumberOfTiles(tif);
+-		tif->tif_flags |= TIFF_ISTILED;
+-	}
+-	if (!tif->tif_dir.td_nstrips) {
+-		TIFFErrorExt(tif->tif_clientdata, module,
+-		    "Cannot handle zero number of %s",
+-		    isTiled(tif) ? "tiles" : "strips");
+-		goto bad;
+-	}
+-	tif->tif_dir.td_stripsperimage = tif->tif_dir.td_nstrips;
+-	if (tif->tif_dir.td_planarconfig == PLANARCONFIG_SEPARATE)
+-		tif->tif_dir.td_stripsperimage /= tif->tif_dir.td_samplesperpixel;
+-	if (!TIFFFieldSet(tif, FIELD_STRIPOFFSETS)) {
+-#ifdef OJPEG_SUPPORT
+-		if ((tif->tif_dir.td_compression==COMPRESSION_OJPEG) &&
+-		    (isTiled(tif)==0) &&
+-		    (tif->tif_dir.td_nstrips==1)) {
+-			/*
+-			 * XXX: OJPEG hack.
+-			 * If a) compression is OJPEG, b) it's not a tiled TIFF,
+-			 * and c) the number of strips is 1,
+-			 * then we tolerate the absence of stripoffsets tag,
+-			 * because, presumably, all required data is in the
+-			 * JpegInterchangeFormat stream.
+-			 */
+-			TIFFSetFieldBit(tif, FIELD_STRIPOFFSETS);
+-		} else
+-#endif
+-        {
+-			MissingRequired(tif,
+-				isTiled(tif) ? "TileOffsets" : "StripOffsets");
+-			goto bad;
+-		}
+-	}
++
+ 	/*
+ 	 * Second pass: extract other information.
+ 	 */
+@@ -4042,41 +3999,6 @@ TIFFReadDirectory(TIFF* tif)
+ 			} /* -- if (!dp->tdir_ignore) */
+ 		} /* -- for-loop -- */
+ 
+-        if( tif->tif_mode == O_RDWR &&
+-            tif->tif_dir.td_stripoffset_entry.tdir_tag != 0 &&
+-            tif->tif_dir.td_stripoffset_entry.tdir_count == 0 &&
+-            tif->tif_dir.td_stripoffset_entry.tdir_type == 0 &&
+-            tif->tif_dir.td_stripoffset_entry.tdir_offset.toff_long8 == 0 &&
+-            tif->tif_dir.td_stripbytecount_entry.tdir_tag != 0 &&
+-            tif->tif_dir.td_stripbytecount_entry.tdir_count == 0 &&
+-            tif->tif_dir.td_stripbytecount_entry.tdir_type == 0 &&
+-            tif->tif_dir.td_stripbytecount_entry.tdir_offset.toff_long8 == 0 )
+-        {
+-            /* Directory typically created with TIFFDeferStrileArrayWriting() */
+-            TIFFSetupStrips(tif);
+-        }
+-        else if( !(tif->tif_flags&TIFF_DEFERSTRILELOAD) )
+-        {
+-            if( tif->tif_dir.td_stripoffset_entry.tdir_tag != 0 )
+-            {
+-                if (!TIFFFetchStripThing(tif,&(tif->tif_dir.td_stripoffset_entry),
+-                                         tif->tif_dir.td_nstrips,
+-                                         &tif->tif_dir.td_stripoffset_p))
+-                {
+-                    goto bad;
+-                }
+-            }
+-            if( tif->tif_dir.td_stripbytecount_entry.tdir_tag != 0 )
+-            {
+-                if (!TIFFFetchStripThing(tif,&(tif->tif_dir.td_stripbytecount_entry),
+-                                         tif->tif_dir.td_nstrips,
+-                                         &tif->tif_dir.td_stripbytecount_p))
+-                {
+-                    goto bad;
+-                }
+-            }
+-        }
+-
+ 	/*
+ 	 * OJPEG hack:
+ 	 * - If a) compression is OJPEG, and b) photometric tag is missing,
+@@ -4147,6 +4069,88 @@ TIFFReadDirectory(TIFF* tif)
+ 		}
+ 	}
+ 
++	/*
++	 * Setup appropriate structures (by strip or by tile)
++	 * We do that only after the above OJPEG hack which alters SamplesPerPixel
++	 * and thus influences the number of strips in the separate planarconfig.
++	 */
++	if (!TIFFFieldSet(tif, FIELD_TILEDIMENSIONS)) {
++		tif->tif_dir.td_nstrips = TIFFNumberOfStrips(tif);  
++		tif->tif_dir.td_tilewidth = tif->tif_dir.td_imagewidth;
++		tif->tif_dir.td_tilelength = tif->tif_dir.td_rowsperstrip;
++		tif->tif_dir.td_tiledepth = tif->tif_dir.td_imagedepth;
++		tif->tif_flags &= ~TIFF_ISTILED;
++	} else {
++		tif->tif_dir.td_nstrips = TIFFNumberOfTiles(tif);
++		tif->tif_flags |= TIFF_ISTILED;
++	}
++	if (!tif->tif_dir.td_nstrips) {
++		TIFFErrorExt(tif->tif_clientdata, module,
++		    "Cannot handle zero number of %s",
++		    isTiled(tif) ? "tiles" : "strips");
++		goto bad;
++	}
++	tif->tif_dir.td_stripsperimage = tif->tif_dir.td_nstrips;
++	if (tif->tif_dir.td_planarconfig == PLANARCONFIG_SEPARATE)
++		tif->tif_dir.td_stripsperimage /= tif->tif_dir.td_samplesperpixel;
++	if (!TIFFFieldSet(tif, FIELD_STRIPOFFSETS)) {
++#ifdef OJPEG_SUPPORT
++		if ((tif->tif_dir.td_compression==COMPRESSION_OJPEG) &&
++		    (isTiled(tif)==0) &&
++		    (tif->tif_dir.td_nstrips==1)) {
++			/*
++			 * XXX: OJPEG hack.
++			 * If a) compression is OJPEG, b) it's not a tiled TIFF,
++			 * and c) the number of strips is 1,
++			 * then we tolerate the absence of stripoffsets tag,
++			 * because, presumably, all required data is in the
++			 * JpegInterchangeFormat stream.
++			 */
++			TIFFSetFieldBit(tif, FIELD_STRIPOFFSETS);
++		} else
++#endif
++        {
++			MissingRequired(tif,
++				isTiled(tif) ? "TileOffsets" : "StripOffsets");
++			goto bad;
++		}
++	}
++
++        if( tif->tif_mode == O_RDWR &&
++            tif->tif_dir.td_stripoffset_entry.tdir_tag != 0 &&
++            tif->tif_dir.td_stripoffset_entry.tdir_count == 0 &&
++            tif->tif_dir.td_stripoffset_entry.tdir_type == 0 &&
++            tif->tif_dir.td_stripoffset_entry.tdir_offset.toff_long8 == 0 &&
++            tif->tif_dir.td_stripbytecount_entry.tdir_tag != 0 &&
++            tif->tif_dir.td_stripbytecount_entry.tdir_count == 0 &&
++            tif->tif_dir.td_stripbytecount_entry.tdir_type == 0 &&
++            tif->tif_dir.td_stripbytecount_entry.tdir_offset.toff_long8 == 0 )
++        {
++            /* Directory typically created with TIFFDeferStrileArrayWriting() */
++            TIFFSetupStrips(tif);
++        }
++        else if( !(tif->tif_flags&TIFF_DEFERSTRILELOAD) )
++        {
++            if( tif->tif_dir.td_stripoffset_entry.tdir_tag != 0 )
++            {
++                if (!TIFFFetchStripThing(tif,&(tif->tif_dir.td_stripoffset_entry),
++                                         tif->tif_dir.td_nstrips,
++                                         &tif->tif_dir.td_stripoffset_p))
++                {
++                    goto bad;
++                }
++            }
++            if( tif->tif_dir.td_stripbytecount_entry.tdir_tag != 0 )
++            {
++                if (!TIFFFetchStripThing(tif,&(tif->tif_dir.td_stripbytecount_entry),
++                                         tif->tif_dir.td_nstrips,
++                                         &tif->tif_dir.td_stripbytecount_p))
++                {
++                    goto bad;
++                }
++            }
++        }
++
+ 	/*
+ 	 * Make sure all non-color channels are extrasamples.
+ 	 * If it's not the case, define them as such.
+-- 
+2.25.1
+
diff --git a/meta/recipes-multimedia/libtiff/tiff/CVE-2022-1355.patch b/meta/recipes-multimedia/libtiff/tiff/CVE-2022-1355.patch
new file mode 100644
index 0000000000..e59f5aad55
--- /dev/null
+++ b/meta/recipes-multimedia/libtiff/tiff/CVE-2022-1355.patch
@@ -0,0 +1,62 @@
+From fb1db384959698edd6caeea84e28253d272a0f96 Mon Sep 17 00:00:00 2001
+From: Su_Laus <sulau@freenet.de>
+Date: Sat, 2 Apr 2022 22:33:31 +0200
+Subject: [PATCH] tiffcp: avoid buffer overflow in "mode" string (fixes #400)
+
+CVE: CVE-2022-1355
+
+Upstream-Status: Backport
+[https://gitlab.com/libtiff/libtiff/-/commit/c1ae29f9ebacd29b7c3e0c7db671af7db3584bc2]
+
+Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
+---
+ tools/tiffcp.c | 25 ++++++++++++++++++++-----
+ 1 file changed, 20 insertions(+), 5 deletions(-)
+
+diff --git a/tools/tiffcp.c b/tools/tiffcp.c
+index fd129bb7..8d944ff6 100644
+--- a/tools/tiffcp.c
++++ b/tools/tiffcp.c
+@@ -274,19 +274,34 @@ main(int argc, char* argv[])
+ 			deftilewidth = atoi(optarg);
+ 			break;
+ 		case 'B':
+-			*mp++ = 'b'; *mp = '\0';
++			if (strlen(mode) < (sizeof(mode) - 1))
++			{
++				*mp++ = 'b'; *mp = '\0';
++			}
+ 			break;
+ 		case 'L':
+-			*mp++ = 'l'; *mp = '\0';
++			if (strlen(mode) < (sizeof(mode) - 1))
++			{
++				*mp++ = 'l'; *mp = '\0';
++			}
+ 			break;
+ 		case 'M':
+-			*mp++ = 'm'; *mp = '\0';
++			if (strlen(mode) < (sizeof(mode) - 1))
++			{
++				*mp++ = 'm'; *mp = '\0';
++			}
+ 			break;
+ 		case 'C':
+-			*mp++ = 'c'; *mp = '\0';
++			if (strlen(mode) < (sizeof(mode) - 1))
++			{
++				*mp++ = 'c'; *mp = '\0';
++			}
+ 			break;
+ 		case '8':
+-			*mp++ = '8'; *mp = '\0';
++			if (strlen(mode) < (sizeof(mode)-1))
++			{
++				*mp++ = '8'; *mp = '\0';
++			}
+ 			break;
+ 		case 'x':
+ 			pageInSeq = 1;
+-- 
+2.25.1
+
diff --git a/meta/recipes-multimedia/libtiff/tiff_4.3.0.bb b/meta/recipes-multimedia/libtiff/tiff_4.3.0.bb
index c2d4b35d49..149516508f 100644
--- a/meta/recipes-multimedia/libtiff/tiff_4.3.0.bb
+++ b/meta/recipes-multimedia/libtiff/tiff_4.3.0.bb
@@ -19,6 +19,8 @@ SRC_URI = "http://download.osgeo.org/libtiff/tiff-${PV}.tar.gz \
            file://0005-fix-the-FPE-in-tiffcrop-393.patch \
            file://0006-fix-heap-buffer-overflow-in-tiffcp-278.patch \
            file://0001-fix-the-FPE-in-tiffcrop-415-427-and-428.patch \
+           file://CVE-2022-1354.patch \
+           file://CVE-2022-1355.patch \
            "
 
 SRC_URI[sha256sum] = "0e46e5acb087ce7d1ac53cf4f56a09b221537fc86dfc5daaad1c2e89e1b37ac8"
-- 
2.25.1


