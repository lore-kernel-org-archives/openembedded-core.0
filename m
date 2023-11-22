Return-Path: <lukas.funke-oss@weidmueller.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 14755C61D97
	for <webhook@archiver.kernel.org>; Wed, 22 Nov 2023 12:17:18 +0000 (UTC)
Received: from EUR02-DB5-obe.outbound.protection.outlook.com (EUR02-DB5-obe.outbound.protection.outlook.com [40.107.249.77])
 by mx.groups.io with SMTP id smtpd.web10.18029.1700655432088099916
 for <openembedded-core@lists.openembedded.org>;
 Wed, 22 Nov 2023 04:17:13 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@weidmueller.onmicrosoft.com header.s=selector1-weidmueller-onmicrosoft-com header.b=WsjslySv;
 spf=pass (domain: weidmueller.com, ip: 40.107.249.77, mailfrom: lukas.funke-oss@weidmueller.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=e3VTP/gvb7QepT8J4vV/la078zSUaFndm+wFFYewGXLOtGeDySYdzqDHM5gyXTu6Q5ixSpaVhTdTm5Va3TAhh/V66vl/8B/lODckseIoYclhulWJrGL4ay7eBdTZvVntxTt9b1sYyUZlQvNR7vRtPIe61ur0LaODutrBITXXG9x1U3q2b1IOJ6DhalAIdTDwuSsnNtIiqNAip84wxFHFDJ2oHWpi/8PXGXDKrYLOMLlSovVhd2UEwyJq0vcuQgTdvca2jDPFlf6+BcAqy7vCn5l2Iqj8woFNKbmBPvtlvHdCkjpHwCVXj+bXdguTXZdg3lRmjMMTcwcn3AmUpBpvug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eWf5q8R42BZ/JU71OdnohKtOEycIMiIYLIY7k1NtFzM=;
 b=KJ2NSS1VZ8qfejwOb33A5Ii5coL08mOUIu/ioO0/CuiwawT3D65jykTiYzyJ2ZeRfDexMsO1YyI7VWzpebgqPmAHQ3EO5FBh32EOy+z5FkEoBHx0IySgqD0alq4baBt0jzdDGPZ9zHO9nWgxTvTzaJspvOUOQmEcAf/nZKfvOGmP/kGfqFuYP158dusYVw5AZQHriCyy2pu4w4yxIXTLQWxSAmGL0POA9yvvdcYpKqKXSY+evd1/sTlltAbtaTLOl/S84UnyDlm2qREYOPX5BmehSTL5cFyf9hGOgiSKRjjzHhBwFS+fWgwC/z63I/Psnz94SaJqAuR0nobTMqh/Cw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=weidmueller.com; dmarc=pass action=none
 header.from=weidmueller.com; dkim=pass header.d=weidmueller.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=weidmueller.onmicrosoft.com; s=selector1-weidmueller-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eWf5q8R42BZ/JU71OdnohKtOEycIMiIYLIY7k1NtFzM=;
 b=WsjslySvnZg7/LkA/zM2zBbFVdS3+rCchaxf4rr7mWCg7N2rx0+hVriH3NaUOepY/RgLQsWFnftd33xe2WMVmW+31bPGXqe2ySi91bzJZlh59n+fzJbPwcWMZoEKNm0qb15KDzZN+06AE115fXDnwbwssDo0NeLWi3Q4TC6YBS0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=weidmueller.com;
Received: from AS2PR08MB8431.eurprd08.prod.outlook.com (2603:10a6:20b:55a::18)
 by AM8PR08MB6338.eurprd08.prod.outlook.com (2603:10a6:20b:369::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7025.18; Wed, 22 Nov
 2023 12:17:08 +0000
Received: from AS2PR08MB8431.eurprd08.prod.outlook.com
 ([fe80::b914:d9b5:6462:13b6]) by AS2PR08MB8431.eurprd08.prod.outlook.com
 ([fe80::b914:d9b5:6462:13b6%5]) with mapi id 15.20.7025.019; Wed, 22 Nov 2023
 12:17:08 +0000
From: Lukas Funke <lukas.funke-oss@weidmueller.com>
To: openembedded-core@lists.openembedded.org
CC: Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Malte Schmidt <malte.schmidt@weidmueller.com>,
	Lukas Funke <lukas.funke@weidmueller.com>
Subject: [PATCH v4] wic: rawcopy: add support for zstd decompression
Date: Wed, 22 Nov 2023 13:17:02 +0100
Message-ID: <20231122121702.997224-1-lukas.funke-oss@weidmueller.com>
X-Mailer: git-send-email 2.30.2
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: FR0P281CA0091.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a9::11) To AS2PR08MB8431.eurprd08.prod.outlook.com
 (2603:10a6:20b:55a::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS2PR08MB8431:EE_|AM8PR08MB6338:EE_
X-MS-Office365-Filtering-Correlation-Id: e0e0aaf3-ea3e-4a44-f484-08dbeb54f2d0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	P39AX3c298fmXDFRaW5EcxeIFDAWskNpcjyHuAY1YmPr46vlZwXvmeyS4Y3e4dxjUAnDaEE7z5RL2/L7tfrLVqZdG6nErJ8S7IV7ycD6dgsE3iLZKpIxvL1wFiXqELFzFqiv9QwvkTlVYX+9YJVENN18get/H18xyXo43R9enYQDJyQsGSOG1AvmaaNY/8KfnVPu6cUsgppaTS81d/MPkrAF9oCsJxaiavmovKIsLhlHNp0mZWvE9+0rGLOxCJUESzXybnYMv/NJmHWjBrSR02DGVSq+avh4l0amKwI5qaRWo6wOMzXWHA/37s95+4snSmqx2FLUz5eo0Hp0uhUSiILR0uaz4hIEf0jEp2VSNeW4VZtT/gJKw3/W18532GBU5dMDVZLh9QNFJ9BWYORsc4HLs3PUYKgz7TO1MDN+Ib4pM10/AHJND6qNK6aIngN4cWr91RttaSdrTUyZPOStfIoXKZZfjHndD5RJe//4dy5lnKhOkDe5rWGvS+tsBGxHJAfZ1Kaep+4ZYyrZugsO7y7awZCfn9PoqZ19CFjkBfnILcVt067dFhXdJJR20PZA4G8TkQBLD3E6+gEygR2ZSzBQ0jfAeo/eq0d0LqRV0h9T3Qt31CZqq5m/g/HVSq5I
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS2PR08MB8431.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(396003)(376002)(39860400002)(136003)(346002)(366004)(230922051799003)(451199024)(64100799003)(186009)(1800799012)(107886003)(26005)(52116002)(6506007)(6666004)(2616005)(6512007)(83380400001)(2906002)(8676002)(8936002)(4326008)(478600001)(41300700001)(1076003)(4744005)(6486002)(5660300002)(6916009)(316002)(66946007)(66476007)(66556008)(54906003)(86362001)(36756003)(38100700002)(38350700005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?spiai3sPkzo3oGW0Upx5ybp8G1KlFm25NALfJGUs064Bx9ckyk9VC7tmC8Qc?=
 =?us-ascii?Q?lYYSnudiLkDlY9vEhVeaTRxSrixjBHCD38V/hjyD5XdxkXIPUHtbYd2pl0nM?=
 =?us-ascii?Q?hEUbSM11bN2nTd1zHIcfs0FIrKqR9E7Bd3/2tBN9NQeV23yIJUBirnpCTb71?=
 =?us-ascii?Q?9P0xU07wraxFkTWasN5vLfEOjLTCRiK22XLg9QWAUIRvQVblMaWJT0amHGFF?=
 =?us-ascii?Q?m/x91zLfSYwf3d3wkAqf6/euK+/Tjrs+oumnqbcqlBpSsQahcy/uL9fZL3eh?=
 =?us-ascii?Q?4Dz3omQyPJ/8PIxx+pDa2mw9dTbgAHWNdJSXm5fXGgZd5nOFRehrZC1VWjq6?=
 =?us-ascii?Q?fCrVtZvOlGSMebJ1anjdCz0PlE7euFx41Grg+8SzK2ktUrPyKdTrebHgyp7B?=
 =?us-ascii?Q?yiadHMMoEU0qDorDN//C5XtJHPfcfvj45FZPcfGmtTDOmhXXh1j7hhBjesje?=
 =?us-ascii?Q?ccTEZmiACxdy//ZB7o+jYMyopWbVlBLMZ0X9vIEHv3ukZ9WvNg3xQ64fujpH?=
 =?us-ascii?Q?xfT2LQp7j+OCc97vq8N2Nmh6a+2STxTuhyYoQCR5APBkre7RvSGQNqbrHWWP?=
 =?us-ascii?Q?fXDSnaFCpYQVVFLCjrCFpFTjZUpbfQYj1jAsKLDLNcS0kE+J+uALsIkAhjfF?=
 =?us-ascii?Q?xdjlmLFWf3S4uvDgj7mVe/FzRjbMKBRa/ICymH0C9dJp/fZwK5O9vDMtCpR5?=
 =?us-ascii?Q?XUZfT0trFr99N/a86yVym+TZPsdeuTCL74YIAdP335MFmMB90s0vdf8CPahZ?=
 =?us-ascii?Q?f3HnklWSkSG1cQZyOiumAh6MstnesK6DykVchmE2vayHLSRbFehG+2rfB+Sl?=
 =?us-ascii?Q?euDYTekpqXXBb6IlteXIy9faurEkiA9ztPs8gmW1Q/HnDveOPh3lw1Tj93ZL?=
 =?us-ascii?Q?6KEf3+d24v1kg16ArhbsMxX+QgLJS9bVBeg4cnmYtpXND8dFN9KXxw+yD6yl?=
 =?us-ascii?Q?QEpCr4pWJ7EiuHzCehAMehV9ttsMVElBMBCstESyB+MKbaFa3iVT5J1Cn9D2?=
 =?us-ascii?Q?9CdNey0bOExKJc3uqKP8DRRhmkgpT9h3mxaF9CNezgHrTQRMpQGthW8gKi1d?=
 =?us-ascii?Q?zt8lSd6n8lZVfKb6E2epUWwk9gdWQ1eR1ja02Jn1gT6BekUwOUvQBjboqzlf?=
 =?us-ascii?Q?EZ4az1AbfaUlkeqNsnibVJXHObCTp78Vm/oThID2vMNf23jVV7fLcrQrtzwY?=
 =?us-ascii?Q?ztherokJD9O1dOz4vos7iEF9fQ5ZH6s6AY9psPG4vgA0rOVsgWKO027l6lBc?=
 =?us-ascii?Q?0Rk1+8/FcegdR3bN2I0kvMb+77cV+tQzxnOEJPq0ncbg24Da8C+NfdVSHo6q?=
 =?us-ascii?Q?JfADpfBIIfcCoVLcQqwIMaNODR4owygGtbQdBdqmDIjmKf3Y9gC2jIuN+nxi?=
 =?us-ascii?Q?2t1969llMGz94OQyDzNyE9U/KnRWyp4gR9cwZRQf3HkutUFDW+qQlxsRskRc?=
 =?us-ascii?Q?QxnB4S5PS/kxM2ZTE27m0rn5Yuu6p8VGTMaYGStBdwiz4D+8UDmVavt2KAK9?=
 =?us-ascii?Q?fTvpIip0ZJmf2ACWoo/Asucnpbc+2iO0/DNNDtNbRvP04Qv+FQVef+DRjNNw?=
 =?us-ascii?Q?dmHuBiPss7MDTnN/x85RG9Nfm4XuhglaJerBFB4JGMLlCUPIAFmhZmCoSinS?=
 =?us-ascii?Q?0w=3D=3D?=
X-OriginatorOrg: weidmueller.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e0e0aaf3-ea3e-4a44-f484-08dbeb54f2d0
X-MS-Exchange-CrossTenant-AuthSource: AS2PR08MB8431.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Nov 2023 12:17:08.7876
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: e4289438-1c5f-4c95-a51a-ee553b8b18ec
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RCqaFzr7qkQfxdepDIMoZFkSoz5NbOemQKTA2XnJnUn1QWX/cFGDPHz7ZSQUMulul9cgEyZHp9lvwqI7p48XDg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR08MB6338
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 22 Nov 2023 12:17:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/191073

From: Malte Schmidt <malte.schmidt@weidmueller.com>

Add support for zstd decompression in rawcopy plugin. zstd claims
to reach higher, uniform decompression rates.

Signed-off-by: Malte Schmidt <malte.schmidt@weidmueller.com>
Signed-off-by: Lukas Funke <lukas.funke@weidmueller.com>
---
 scripts/lib/wic/plugins/source/rawcopy.py | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/scripts/lib/wic/plugins/source/rawcopy.py b/scripts/lib/wic/pl=
ugins/source/rawcopy.py
index ccf332554e..21903c2f23 100644
--- a/scripts/lib/wic/plugins/source/rawcopy.py
+++ b/scripts/lib/wic/plugins/source/rawcopy.py
@@ -58,7 +58,8 @@ class RawCopyPlugin(SourcePlugin):
         decompressor =3D {
             ".bz2": "bzip2",
             ".gz": "gzip",
-            ".xz": "xz"
+            ".xz": "xz",
+            ".zst": "zstd -f",
         }.get(extension)
         if not decompressor:
             raise WicError("Not supported compressor filename extension: %=
s" % extension)
--=20
2.30.2


