Return-Path: <stefan.herbrechtsmeier-oss@weidmueller.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1DEA4C433EF
	for <webhook@archiver.kernel.org>; Fri,  8 Oct 2021 07:48:57 +0000 (UTC)
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (EUR04-DB3-obe.outbound.protection.outlook.com [40.107.6.63])
 by mx.groups.io with SMTP id smtpd.web12.6087.1633679334680079990
 for <openembedded-core@lists.openembedded.org>;
 Fri, 08 Oct 2021 00:48:56 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify"
 header.i=@weidmueller.onmicrosoft.com
 header.s=selector1-weidmueller-onmicrosoft-com header.b=0EKd/29Z;
 spf=pass (domain: weidmueller.com, ip: 40.107.6.63,
 mailfrom: stefan.herbrechtsmeier-oss@weidmueller.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VBDMfHqEE5/074hmtYzHebInmKmRMDRThXY4q2Po0lfQtlR2/TjA+DwSrr3ox7Lf28cejJqP13U86cJwadOGgwL0Me57FqdKkGKVLB4FngHEeNIU1O9dR3eybLVQsf4h2BTmXWInrgPAbbCdtvZF1gN23cofj44c/ZoAksIE/ldBG5c89168+xe0INL3cN2eQrdm2//B0XaUCiAiSJul1RGxApZyenDvDxNKArDtAm4UTHWGXpK5SxxAuyfWPouekFSyXgzguoUqEuhamYzfuE4cmbhkhZTAefEXnZP+LvHkHaPWS0lVm3R1usl92XG7LkXcItUmydeBO8t8/I7kaA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oRCh8rDu5ujKwQfdK5eYUdzez6ktY7BlamG1SwsrXV0=;
 b=GAf9IJT3LrxMxlpefwQi5b3BEuzsAuI46xiAoTYMIWGViEGIyvxApf9yqCjgVNygnO0+JsGs2t5ZpZDK/pHzS5wOg1wxaFOpz6TtJrMzw5d3W+RbOQovfEY2GPgYD93wqrxEPKP6G9glUsYioKYfgJA9tP3I9Z3sfvkTkSkU2Op5j6wKYTac6/SI5pjUXsOcFR51a5XOPuyUwu1Lkl7iuhIbT4rnCV7ASH7fj3DVXYubWD6GMeWgwhP37kOQ97o8Ku/B7Rf87Aoksy3YRtFT9d1fLQA081HbNf9dgvlGPI2KQTq7Q6y4X5IATwVptMmVfJ7Vk6+A8YXTxQBQLB2fOw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=weidmueller.com; dmarc=pass action=none
 header.from=weidmueller.com; dkim=pass header.d=weidmueller.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=weidmueller.onmicrosoft.com; s=selector1-weidmueller-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oRCh8rDu5ujKwQfdK5eYUdzez6ktY7BlamG1SwsrXV0=;
 b=0EKd/29ZEmTGtJiDdwgzY3FY+xTXsA0JQtM8JdIZ7NJ1hwNAv6f30AT2iVGxfbk3noGIuClKXhRcDQdDjarTVxRtF5AE4Ho/XYIenBVtBRKvfFDTdbnPYeEDiLlVSN0ZTRULN9fRKBtfPZJfBsuqEFcse8a70+f76Gtc20O7gPc=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=weidmueller.com;
Received: from PAXPR08MB6969.eurprd08.prod.outlook.com (2603:10a6:102:1d8::23)
 by PA4PR08MB6127.eurprd08.prod.outlook.com (2603:10a6:102:f3::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4587.19; Fri, 8 Oct
 2021 07:48:52 +0000
Received: from PAXPR08MB6969.eurprd08.prod.outlook.com
 ([fe80::8034:af5f:f101:d1f0]) by PAXPR08MB6969.eurprd08.prod.outlook.com
 ([fe80::8034:af5f:f101:d1f0%3]) with mapi id 15.20.4587.022; Fri, 8 Oct 2021
 07:48:52 +0000
From: Stefan Herbrechtsmeier <stefan.herbrechtsmeier-oss@weidmueller.com>
To: openembedded-core@lists.openembedded.org
CC: Stefan Herbrechtsmeier <stefan.herbrechtsmeier@weidmueller.com>
Subject: [PATCH v2 02/12] recipetool: Move license md5sums into CSV files
Date: Fri,  8 Oct 2021 09:48:25 +0200
Message-ID: 
 <20211008074835.10320-2-stefan.herbrechtsmeier-oss@weidmueller.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: 
 <20211008074835.10320-1-stefan.herbrechtsmeier-oss@weidmueller.com>
References: 
 <20211008074835.10320-1-stefan.herbrechtsmeier-oss@weidmueller.com>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: FR3P281CA0051.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:4a::9) To PAXPR08MB6969.eurprd08.prod.outlook.com
 (2603:10a6:102:1d8::23)
MIME-Version: 1.0
Received: from DE10512.weidmueller.com (94.134.181.155) by
 FR3P281CA0051.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:4a::9) with Microsoft
 SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4608.4 via Frontend
 Transport; Fri, 8 Oct 2021 07:48:52 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7cf10e81-289a-43fd-0cb2-08d98a3012bd
X-MS-TrafficTypeDiagnostic: PA4PR08MB6127:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<PA4PR08MB6127CEE35C4035234161F418D7B29@PA4PR08MB6127.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6790;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	QQwQ5He3yaRkYjS8xRdAY1jNsGJxk7gT6RruCEThvGomIs/a9hQ74mRoj+x17PFV+ko76eKWVtT38H9hgBbrSWyCVzQyajZQHYCuqBi9wreqn37H7MdQxKDKwb0Spf03YKJgmPMwxKN3kIF+xgVCTGyZ2g88+csH6YyuXkojShUCVARKcZRX7Qu7dd1D8s98ABopRsOPvO1B05thQNCmoCUwbt7RhZyKjwRy36R5FZyPxhrbcx4wbVgQ3VIFlDvNSmgqeqcAjcowo638cFPurc94YoV4DKxYUgbWScNir4g9X0jYBoxM+wY4AWa4juCDUZcFkswntalT+OWjvnORAqpOkB5/neg+x174I7rH2T1q8eD6imp7wIVOajgc2zEALAT5baLowlGNDUSZqRfnUzkjsMK4cAGjrrJnT2eC7Yz7G5BKgwTYUH9ttV1yffBpUIwmw56kZu1yBGsISK31Id++HfwA4WBDq3rqGeZijVrlYZyqbvXPuZuiUCr77Aa2oiwOIdNGXLwflhfpQ9JhjXN7R+k5nr6F9lsp8A6qXxWjF9J7fndReW8469+fZUSn6nGxBAhpiOOigrVOHoZ31lxkeOJHaOi1gZwaCYRaPkZBaV6dDeGIZdOzbcN+gWqFALnM0jvo4Rtq4/2OrJ4K3xNM08EPNfrTB+vEER/D4a3+Y++AEo3N+O/aCovF0xr+feAdc27e0xbGURM39P5OjWgVpvtJ6eKhbofSkuxu1LMseB+X6/MKG/fiMVAE/hFc
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR08MB6969.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(52116002)(186003)(7696005)(5660300002)(26005)(316002)(8936002)(107886003)(86362001)(8676002)(508600001)(66946007)(6486002)(4326008)(83380400001)(36756003)(66556008)(1076003)(66476007)(2616005)(2906002)(6666004)(956004)(38100700002)(38350700002)(6916009)(42413004)(32563001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?MjXsmQi2scPAwGQbRDMcotQdJK7xJlTTjR3bPMFfXzPpsYNA1kliFam5zAjO?=
 =?us-ascii?Q?WUiggu6l+enFLuH1dbCTydex871vLk1snDl+hpKGiEdLntU9Dv7urn3xSC5u?=
 =?us-ascii?Q?GVr1CmcV2GiH9QyEVwEhmVhAlZqGt8ExAW5pgpq8Yi42YXxgObit8LxGnvPB?=
 =?us-ascii?Q?h5Ym6Dd/2z4yY4iDAtDIzWBiDcJNkzn9WN+pPXPC3VR6xF8LM0pTfDPb1TN8?=
 =?us-ascii?Q?B/APKnduy+EL2j92JG6OM+5LmBD6xN6NOvZ9fmwT2iFP1UqZn3P6Sc1kP7fH?=
 =?us-ascii?Q?fSvv9J5fb5A2jUgGC8zOyU+388tZoTBXpFjIfLdcxFaB1jlfrPSVJiNXDkkb?=
 =?us-ascii?Q?DPrGp/4IPUQ4qlgPM4zGNooU/AUmu8GAIQ6mblcugSdKjfmvUqRbnyGHRmwm?=
 =?us-ascii?Q?fhKXzMzpVZDrWBQRE8FyrK6qF0ZJVLF8CPF2zGx1Oc2jm491EItVof7f0Yzg?=
 =?us-ascii?Q?kvOFs/VOqb8edJnkxv0VRIwLIBFfN37lUeiZxVAcZVWZcBRBOfcmvB0KZry3?=
 =?us-ascii?Q?OB+J75X46NiuByBYIERrEGWpGL638i1kCRDlwSe6sCj8jfQvfW2jTE8t/I5f?=
 =?us-ascii?Q?06ibrtFJWvDIWF9CxrstBZWExaJdnu3s3FP8ZcKUPc2N8eTP1+ierNz/CiK0?=
 =?us-ascii?Q?Kr80YDRv9ZSk/kLzoPNlYFsAgZcTpinp1Qjp9LaiqdiUAXwSDe27RtDVW/MN?=
 =?us-ascii?Q?pKfTWYeF0wKvqD9rjb9xiA7bbNmn4Ygu8sb3c3uYIuDd+u+nQEGv4IfhXPm8?=
 =?us-ascii?Q?XVn7eCiT9wKWjEVMPlByRkFppnlbptSRz4SQe+yDx9DGMTMmmL+RB6N5cBIo?=
 =?us-ascii?Q?KhNYCzfoaymgEdIOX1BYL8k31Lf8GTntMSHX/YZuNlQNXe2B5baDjpmMKtI8?=
 =?us-ascii?Q?bhxgzHImnly/JxIa+fqJ9TRcKRgjppdTs4CoqnJ8kplY8FGyvK9cQxb4oqVZ?=
 =?us-ascii?Q?1pb1zn29i99oYGyBADKu7HKXDUeMvn4UhXCj+2ZqYHV/lGS/CJzxHoX6at5A?=
 =?us-ascii?Q?a6+/HD9EsSNcHbSA1v47W03jLIh2ZZ8yUfT2izBKuH39PvAiCsY8IMprHUN/?=
 =?us-ascii?Q?HHhXRomHG9aQ5Y7Y0n8n0COYOOQUMg8ueWmZyHXR5gmFZD9+HbJSvvjcgecj?=
 =?us-ascii?Q?aYx05MHkGI9F8Ju4pNcumsfihHvo4mCRyr0crRy4TUwJKz3pIp1VLPQ3DiT8?=
 =?us-ascii?Q?Hq7HaAT6Ifp2oMzHrgsY3iN8JfKtioENqh233Rd98xQjjcYBCNLnHPzSJAX5?=
 =?us-ascii?Q?Dfl79o5gLzp/Faxuw1UwYvL/MstB03nSiRaKOVN9YweRq20mTbpUw/4Kzh0s?=
 =?us-ascii?Q?z+LpihDYoAO6F2jB1v9a52hE?=
X-OriginatorOrg: weidmueller.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 7cf10e81-289a-43fd-0cb2-08d98a3012bd
X-MS-Exchange-CrossTenant-AuthSource: PAXPR08MB6969.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Oct 2021 07:48:52.8034
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: e4289438-1c5f-4c95-a51a-ee553b8b18ec
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 LLFU23EvivPPUuvKL2wULrY1trC6STc/vTFOEFe7lxDd5Qw7GsfTPq3rFBUL1bk4KwQGKFJBfrhFJfBQAtqw4g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR08MB6127
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 08 Oct 2021 07:48:57 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/156759

From: Stefan Herbrechtsmeier <stefan.herbrechtsmeier@weidmueller.com>

Signed-off-by: Stefan Herbrechtsmeier <stefan.herbrechtsmeier@weidmueller.c=
om>
---

(no changes since v1)

 scripts/lib/recipetool/create.py    | 52 +++++++++--------------------
 scripts/lib/recipetool/licenses.csv | 37 ++++++++++++++++++++
 2 files changed, 52 insertions(+), 37 deletions(-)
 create mode 100644 scripts/lib/recipetool/licenses.csv

diff --git a/scripts/lib/recipetool/create.py b/scripts/lib/recipetool/crea=
te.py
index 5cd72ea0a7..e88a4253da 100644
--- a/scripts/lib/recipetool/create.py
+++ b/scripts/lib/recipetool/create.py
@@ -1004,6 +1004,7 @@ def handle_license_vars(srctree, lines_before, handle=
d, extravalues, d):
=20
 def get_license_md5sums(d, static_only=3DFalse):
     import bb.utils
+    import csv
     md5sums =3D {}
     if not static_only:
         # Gather md5sums of license files in common license dir
@@ -1011,46 +1012,23 @@ def get_license_md5sums(d, static_only=3DFalse):
         for fn in os.listdir(commonlicdir):
             md5value =3D bb.utils.md5_file(os.path.join(commonlicdir, fn))
             md5sums[md5value] =3D fn
+
     # The following were extracted from common values in various recipes
     # (double checking the license against the license file itself, not ju=
st
     # the LICENSE value in the recipe)
-    md5sums['94d55d512a9ba36caa9b7df079bae19f'] =3D 'GPLv2'
-    md5sums['b234ee4d69f5fce4486a80fdaf4a4263'] =3D 'GPLv2'
-    md5sums['59530bdf33659b29e73d4adb9f9f6552'] =3D 'GPLv2'
-    md5sums['0636e73ff0215e8d672dc4c32c317bb3'] =3D 'GPLv2'
-    md5sums['eb723b61539feef013de476e68b5c50a'] =3D 'GPLv2'
-    md5sums['751419260aa954499f7abaabaa882bbe'] =3D 'GPLv2'
-    md5sums['393a5ca445f6965873eca0259a17f833'] =3D 'GPLv2'
-    md5sums['12f884d2ae1ff87c09e5b7ccc2c4ca7e'] =3D 'GPLv2'
-    md5sums['8ca43cbc842c2336e835926c2166c28b'] =3D 'GPLv2'
-    md5sums['ebb5c50ab7cab4baeffba14977030c07'] =3D 'GPLv2'
-    md5sums['c93c0550bd3173f4504b2cbd8991e50b'] =3D 'GPLv2'
-    md5sums['9ac2e7cff1ddaf48b6eab6028f23ef88'] =3D 'GPLv2'
-    md5sums['4325afd396febcb659c36b49533135d4'] =3D 'GPLv2'
-    md5sums['18810669f13b87348459e611d31ab760'] =3D 'GPLv2'
-    md5sums['d7810fab7487fb0aad327b76f1be7cd7'] =3D 'GPLv2' # the Linux ke=
rnel's COPYING file
-    md5sums['bbb461211a33b134d42ed5ee802b37ff'] =3D 'LGPLv2.1'
-    md5sums['7fbc338309ac38fefcd64b04bb903e34'] =3D 'LGPLv2.1'
-    md5sums['4fbd65380cdd255951079008b364516c'] =3D 'LGPLv2.1'
-    md5sums['2d5025d4aa3495befef8f17206a5b0a1'] =3D 'LGPLv2.1'
-    md5sums['fbc093901857fcd118f065f900982c24'] =3D 'LGPLv2.1'
-    md5sums['a6f89e2100d9b6cdffcea4f398e37343'] =3D 'LGPLv2.1'
-    md5sums['d8045f3b8f929c1cb29a1e3fd737b499'] =3D 'LGPLv2.1'
-    md5sums['fad9b3332be894bab9bc501572864b29'] =3D 'LGPLv2.1'
-    md5sums['3bf50002aefd002f49e7bb854063f7e7'] =3D 'LGPLv2'
-    md5sums['9f604d8a4f8e74f4f5140845a21b6674'] =3D 'LGPLv2'
-    md5sums['5f30f0716dfdd0d91eb439ebec522ec2'] =3D 'LGPLv2'
-    md5sums['55ca817ccb7d5b5b66355690e9abc605'] =3D 'LGPLv2'
-    md5sums['252890d9eee26aab7b432e8b8a616475'] =3D 'LGPLv2'
-    md5sums['3214f080875748938ba060314b4f727d'] =3D 'LGPLv2'
-    md5sums['db979804f025cf55aabec7129cb671ed'] =3D 'LGPLv2'
-    md5sums['d32239bcb673463ab874e80d47fae504'] =3D 'GPLv3'
-    md5sums['f27defe1e96c2e1ecd4e0c9be8967949'] =3D 'GPLv3'
-    md5sums['6a6a8e020838b23406c81b19c1d46df6'] =3D 'LGPLv3'
-    md5sums['3b83ef96387f14655fc854ddc3c6bd57'] =3D 'Apache-2.0'
-    md5sums['385c55653886acac3821999a3ccd17b3'] =3D 'Artistic-1.0 | GPL-2.=
0' # some perl modules
-    md5sums['54c7042be62e169199200bc6477f04d1'] =3D 'BSD-3-Clause'
-    md5sums['bfe1f75d606912a4111c90743d6c7325'] =3D 'MPL-1.1'
+
+    # Read license md5sums from csv file
+    scripts_path =3D os.path.dirname(os.path.realpath(__file__))
+    for path in (d.getVar('BBPATH').split(':')
+                + [os.path.join(scripts_path, '..', '..')]):
+        csv_path =3D os.path.join(path, 'lib', 'recipetool', 'licenses.csv=
')
+        if os.path.isfile(csv_path):
+            with open(csv_path, newline=3D'') as csv_file:
+                fieldnames =3D ['md5sum', 'license']
+                reader =3D csv.DictReader(csv_file, delimiter=3D',', field=
names=3Dfieldnames)
+                for row in reader:
+                    md5sums[row['md5sum']] =3D row['license']
+
     return md5sums
=20
 def crunch_license(licfile):
diff --git a/scripts/lib/recipetool/licenses.csv b/scripts/lib/recipetool/l=
icenses.csv
new file mode 100644
index 0000000000..0d3fb0607b
--- /dev/null
+++ b/scripts/lib/recipetool/licenses.csv
@@ -0,0 +1,37 @@
+0636e73ff0215e8d672dc4c32c317bb3,GPLv2
+12f884d2ae1ff87c09e5b7ccc2c4ca7e,GPLv2
+18810669f13b87348459e611d31ab760,GPLv2
+252890d9eee26aab7b432e8b8a616475,LGPLv2
+2d5025d4aa3495befef8f17206a5b0a1,LGPLv2.1
+3214f080875748938ba060314b4f727d,LGPLv2
+385c55653886acac3821999a3ccd17b3,Artistic-1.0 | GPL-2.0
+393a5ca445f6965873eca0259a17f833,GPLv2
+3b83ef96387f14655fc854ddc3c6bd57,Apache-2.0
+3bf50002aefd002f49e7bb854063f7e7,LGPLv2
+4325afd396febcb659c36b49533135d4,GPLv2
+4fbd65380cdd255951079008b364516c,LGPLv2.1
+54c7042be62e169199200bc6477f04d1,BSD-3-Clause
+55ca817ccb7d5b5b66355690e9abc605,LGPLv2
+59530bdf33659b29e73d4adb9f9f6552,GPLv2
+5f30f0716dfdd0d91eb439ebec522ec2,LGPLv2
+6a6a8e020838b23406c81b19c1d46df6,LGPLv3
+751419260aa954499f7abaabaa882bbe,GPLv2
+7fbc338309ac38fefcd64b04bb903e34,LGPLv2.1
+8ca43cbc842c2336e835926c2166c28b,GPLv2
+94d55d512a9ba36caa9b7df079bae19f,GPLv2
+9ac2e7cff1ddaf48b6eab6028f23ef88,GPLv2
+9f604d8a4f8e74f4f5140845a21b6674,LGPLv2
+a6f89e2100d9b6cdffcea4f398e37343,LGPLv2.1
+b234ee4d69f5fce4486a80fdaf4a4263,GPLv2
+bbb461211a33b134d42ed5ee802b37ff,LGPLv2.1
+bfe1f75d606912a4111c90743d6c7325,MPL-1.1
+c93c0550bd3173f4504b2cbd8991e50b,GPLv2
+d32239bcb673463ab874e80d47fae504,GPLv3
+d7810fab7487fb0aad327b76f1be7cd7,GPLv2
+d8045f3b8f929c1cb29a1e3fd737b499,LGPLv2.1
+db979804f025cf55aabec7129cb671ed,LGPLv2
+eb723b61539feef013de476e68b5c50a,GPLv2
+ebb5c50ab7cab4baeffba14977030c07,GPLv2
+f27defe1e96c2e1ecd4e0c9be8967949,GPLv3
+fad9b3332be894bab9bc501572864b29,LGPLv2.1
+fbc093901857fcd118f065f900982c24,LGPLv2.1
--=20
2.20.1


