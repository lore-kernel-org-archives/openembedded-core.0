Return-Path: <stefan.herbrechtsmeier-oss@weidmueller.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 09498C433EF
	for <webhook@archiver.kernel.org>; Fri,  8 Oct 2021 07:43:05 +0000 (UTC)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (EUR05-AM6-obe.outbound.protection.outlook.com [40.107.22.57])
 by mx.groups.io with SMTP id smtpd.web08.5884.1633678981685181195
 for <openembedded-core@lists.openembedded.org>;
 Fri, 08 Oct 2021 00:43:04 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify"
 header.i=@weidmueller.onmicrosoft.com
 header.s=selector1-weidmueller-onmicrosoft-com header.b=mGOcB3A4;
 spf=pass (domain: weidmueller.com, ip: 40.107.22.57,
 mailfrom: stefan.herbrechtsmeier-oss@weidmueller.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gx7NOBWorGLxIgGBdTrmq4LVV3C9hu/C1el6fUfqfU/XtvS3N4lwQuP5pwvZDbKzuj85QUs7DL9blpliQNTlyPydkrDcN65vDkcbpWY1RNwQUVRPPr0IY1JYv7PCFpzXwu2GkpSHb8tWgo4HKvMVHsRbR4C9dKZ9nlrCPUJFnCSVi0Nr+DE/mq9IKhSaNN2pQTrBCVxK4bDkGMats13ZFXYFeVb9nQZ+kjbxAw6c5JBWp96eM3tmFuNl9xZNFkBMh8mHE6kWZTgsIVTo09D7n9U3c8L21y6N68NmAZixlYgji192lpduyDpC/EYD+lavqPbXn/5wbjN9tboYt0t/0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pPR1kzMuuhyOBoGHXo3FBht3+uemlOS+rYK3ClEHhtY=;
 b=EVDIRwB4NtTvE55fV+80tgC7+Va1L/Ty8s8+S/lzickeWqg6iGoCG2SZotmpZq9Mgy4QUJRIuwspdDtRpRvjRnF8gFNR4NIc/VRByYABPKo7rJtsHzN92U2gqomVtgdZW2VwOlObmmxEc5iUi3aTwnr/blU/e7aMiQ/MFSsXUibU2lDOShn61HhjhHAsuSSWI7ni/T5wRZ/fXIySO9nOA5W+VBVV+SQ3mQ5y4371Ja5iV2yJWaDJVZi0d+5lFarTtF/RxJQtyCtx6N5CndJcFTBTx1QPpcwDPc9NaMsSMQbSSr1Ftm+91zIzK5MrcP5GRV7NvG7U5+qMDPnbsEF25Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=weidmueller.com; dmarc=pass action=none
 header.from=weidmueller.com; dkim=pass header.d=weidmueller.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=weidmueller.onmicrosoft.com; s=selector1-weidmueller-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pPR1kzMuuhyOBoGHXo3FBht3+uemlOS+rYK3ClEHhtY=;
 b=mGOcB3A4Ab9tTakGvhiseZ+wqGLn8K4hae5c/oTNbpLRGxFFLpkB2ah+74nuKHPzkZtAhGAnCH0Nwbv6Ql1UrKH7ZrkpIN44305U/PwRlK38D5SL7DV1EfhPyg7PMqGjpPRN+6LUkqpl7xid9yQ3RAUNkrCkz4AxSqSKEzquIyM=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=weidmueller.com;
Received: from PAXPR08MB6969.eurprd08.prod.outlook.com (2603:10a6:102:1d8::23)
 by PR3PR08MB5772.eurprd08.prod.outlook.com (2603:10a6:102:8f::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4587.19; Fri, 8 Oct
 2021 07:42:59 +0000
Received: from PAXPR08MB6969.eurprd08.prod.outlook.com
 ([fe80::8034:af5f:f101:d1f0]) by PAXPR08MB6969.eurprd08.prod.outlook.com
 ([fe80::8034:af5f:f101:d1f0%3]) with mapi id 15.20.4587.022; Fri, 8 Oct 2021
 07:42:59 +0000
From: Stefan Herbrechtsmeier <stefan.herbrechtsmeier-oss@weidmueller.com>
To: openembedded-core@lists.openembedded.org
CC: Stefan Herbrechtsmeier <stefan.herbrechtsmeier@weidmueller.com>
Subject: [PATCH 05/12] recipetool: ignore empty license files
Date: Fri,  8 Oct 2021 09:42:21 +0200
Message-ID: <20211008074228.8635-5-stefan.herbrechtsmeier-oss@weidmueller.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: 
 <20211008074228.8635-1-stefan.herbrechtsmeier-oss@weidmueller.com>
References: <20211008074228.8635-1-stefan.herbrechtsmeier-oss@weidmueller.com>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: AM6PR08CA0023.eurprd08.prod.outlook.com
 (2603:10a6:20b:b2::35) To PAXPR08MB6969.eurprd08.prod.outlook.com
 (2603:10a6:102:1d8::23)
MIME-Version: 1.0
Received: from DE10512.weidmueller.com (94.134.181.155) by
 AM6PR08CA0023.eurprd08.prod.outlook.com (2603:10a6:20b:b2::35) with Microsoft
 SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4587.18 via Frontend
 Transport; Fri, 8 Oct 2021 07:42:58 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 20c90daf-5e88-4819-633c-08d98a2f3fe4
X-MS-TrafficTypeDiagnostic: PR3PR08MB5772:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<PR3PR08MB577244E87427F97CDEACE7C2D7B29@PR3PR08MB5772.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1201;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	6O72QK2xiW+1NgxZjvTaY5qssfko2eeUAiAQEVtp1iwvbrDZvHbbGjtRf7pjqeuVJMf6bjbxMbB6t5DZO0BTRu/caF3AYs3E96HX5Gfh/D6fhI7Wl9PkZ7bTudaJtlJiBr4gK1m3jWVW9b6rlMJygQt0aVDt03OzkMhkqxljLYcEqE1mB8tubgBdj4zpE8jYycvPS50uOJUUr5bK0VbHPdzrJOUOqkRJLepSuEMJSE94GzgZ1nJcyJY+xJTPqR7lkhj1FTgU6W4ksgGN/RefEtQC5QybVCV4cBZlejGCMJJ/acORWEjmkWdj64XDWQv3M31sNRYMb7yXDXGdO3WTtL27/tJehcr0hSitcj3kxZ6UMJL06ES2ErC9uetwqHn+Co1T7sQz95LEXXdBe5WQQ4J1gofGpGXubApSxG96B7F4Zz8lxMeghqM6A/hlFTUcWE1QlfYtEC95ItBCYN6pmr539h6df0ibz5ROfxa8xzWGuY4FtKkzQZAj+xo4TGYG+eo0X+k113YG+dogZhKbQUq9M+KnmRRI+GKGW5ZK8IuHohTbzMrYhCBg9uabA/YQbyrPwwRpR+Ha5IWMI64akt/Iole8aMw2GcNnmYSZIE/N+lhowagliHcuxRdHf8mYdeZCWz6/QUbNTd/cjI4nZS5hzJgm3DpdJg9GlteJn4it8vcLKj/XdkFLtrV+OgbBRIqZ384savzemyxaBeuJvg==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR08MB6969.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(38350700002)(36756003)(316002)(26005)(83380400001)(6916009)(38100700002)(86362001)(4326008)(6486002)(4744005)(508600001)(66946007)(2616005)(2906002)(186003)(5660300002)(1076003)(956004)(8676002)(107886003)(8936002)(6666004)(66476007)(66556008)(7696005)(52116002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?GhYv9rkm/dlI0Xqhf8V/aXHJpczgwwExZERNiepeBvU3C8vLBBVCncNIq0fN?=
 =?us-ascii?Q?QOE386bpE6b0pdejyELKiVTYFVIssuxMfQ2WS1fzyqguuV3OKOBcWOq93quN?=
 =?us-ascii?Q?aQcXEpiibozKeXMqlt7FETLTAzYYEd6NIkBZ5u/GHBdMawYAF6dDQfcd2nRv?=
 =?us-ascii?Q?9dRZ9TngAx7/sBw5j9oJMXFIkvlgE+pOcwrBVE2Rl2x28BJghZ1zvfpXeKfF?=
 =?us-ascii?Q?vHX3xKGwc6R7cBjl/iIi8t0DM8KAUu15J3t7nAIo7GnZlFfMsq1O2BWNRilf?=
 =?us-ascii?Q?svYoVEOcf4kdh8Es4nreItMOPfBTKQCKzMePiCqzPUrymwuNdPQGlgwgNVSw?=
 =?us-ascii?Q?lyoLV/aJ3Shj4zhxEr34Xv+cs/4QPR6K8IpNpufeY4bjxNR1MJ286A6PAat7?=
 =?us-ascii?Q?NhQ2QREUEBWXk/KLGYYm6Ur98E83Wls/5YvR4r+PKUc1ILg7sKCqDNfLt9uZ?=
 =?us-ascii?Q?klBaK6KlMVXYf+hBaJAH456/Q03qGJ3vF7tFbY0Esvfg8pSJ1d6LWSuV5vgZ?=
 =?us-ascii?Q?nBPunBBzXcFzgZzhfrg6LE3Gj2uAYFhT/2CJNsrtLSOdAMPbeuXEc8LfEOdA?=
 =?us-ascii?Q?u29hun2yfH1Hqzmy6ittNFVZ3mle4FV80h25wzOcZjZAZM+WRctVwCPr/bez?=
 =?us-ascii?Q?Sto9p8ia+mLt/NOB/BK3reYm0z5TdpfmGNyNklgETg7Py1l4nsgPIrfybh17?=
 =?us-ascii?Q?pVCSuigXrhF22mx3N+puhJKX59IpN8+ipYIpZ1+8c7NLRcyFun0iEHRs4Y9e?=
 =?us-ascii?Q?D2qaZ60U+Yq0Zj0uxqgoxRy6/6IUt+Qs1/EpXxUbnkSzVWzvjtNw5EFWpsSF?=
 =?us-ascii?Q?JAdHeBkl/VkXRLbNAYIgL2UUX6qFEO0NJ2nq5cbfXYyJWJrxF6PJRghtdhZb?=
 =?us-ascii?Q?Iif8BsSWnDwV1zfjD81prPyOb4GJtjeuPIQVcWMDPDj2POZl5YucDnP1Ia41?=
 =?us-ascii?Q?qP2o2EOJVXR9YM6NRn/tJAU5CzbdBeXNd+jNHMLMwPMlm3R/ipfsaMzFRVGb?=
 =?us-ascii?Q?aQjGZLtkdJeDO0t8vOdp9iPsiNSen5ZT5cDvRZulFtyMaWz0ZsnuIKx78LDY?=
 =?us-ascii?Q?JzW3yflQGPi1LtRntH/C0v6j1/9/ovLxhMivZ6OSNE6comED5aP1RPPnkcSq?=
 =?us-ascii?Q?Krg8Ov1G5lj0m1pf7GXGHi6daBOXZDvkO1yMNmqKyo5oSFQD+7wZzWlXr+bz?=
 =?us-ascii?Q?7MsU+vv9zPTyng2uskAfSRPbgMD+xYT9njPgWBcvqHYuRj0Obxnw36lIOtvF?=
 =?us-ascii?Q?LS9ijLg07siOg/FE8Uicf7vq73uU2v9Pms7I3x/S7DD94GQHxAEOveGWiu42?=
 =?us-ascii?Q?SckqCfct3DLN+tghzBTFu6AQ?=
X-OriginatorOrg: weidmueller.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 20c90daf-5e88-4819-633c-08d98a2f3fe4
X-MS-Exchange-CrossTenant-AuthSource: PAXPR08MB6969.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Oct 2021 07:42:59.1456
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: e4289438-1c5f-4c95-a51a-ee553b8b18ec
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 zBYSZGJRRrdzlXxLuLsIIdiyrw9W/UKHw5CT0yzAV6DWS2KPxsXGwmtdi4dB5aPOZ+ec1VW52jloXE13VjEVqg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR08MB5772
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 08 Oct 2021 07:43:04 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/156747

From: Stefan Herbrechtsmeier <stefan.herbrechtsmeier@weidmueller.com>

Signed-off-by: Stefan Herbrechtsmeier <stefan.herbrechtsmeier@weidmueller.c=
om>
---

(no changes since v1)

 scripts/lib/recipetool/create.py | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/scripts/lib/recipetool/create.py b/scripts/lib/recipetool/crea=
te.py
index 893980a5ce..87b25ebc7e 100644
--- a/scripts/lib/recipetool/create.py
+++ b/scripts/lib/recipetool/create.py
@@ -1126,9 +1126,10 @@ def guess_license(srctree, d):
         license =3D md5sums.get(md5value, None)
         if not license:
             license, crunched_md5, lictext =3D crunch_license(licfile)
-            if not license:
+            if lictext and not license:
                 license =3D 'Unknown'
-        licenses.append((license, os.path.relpath(licfile, srctree), md5va=
lue))
+        if license:
+            licenses.append((license, os.path.relpath(licfile, srctree), m=
d5value))
=20
     # FIXME should we grab at least one source file with a license header =
and add that too?
=20
--=20
2.20.1


