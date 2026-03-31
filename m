Return-Path: <david.partain@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D03A61061B3C
	for <webhook@archiver.kernel.org>; Tue, 31 Mar 2026 12:14:50 +0000 (UTC)
Received: from MRWPR03CU001.outbound.protection.outlook.com (MRWPR03CU001.outbound.protection.outlook.com [40.107.130.17])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.18537.1774959154366200963
 for <openembedded-core@lists.openembedded.org>;
 Tue, 31 Mar 2026 05:12:34 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=eBj2qMYI;
 spf=pass (domain: est.tech, ip: 40.107.130.17, mailfrom: adarsh.jagadish.kamini@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ll5gC60ClV0xCpMs6STt7+Iy5BzuNLBA+H6jLCpwwhzzM18sigdXJPoM5/f5mbErlpryIHMseZvxIG1ndAqt4ttt9CR7A49Jq8MJbJDlOar2VoCDHO2TtyzewYsg3+p4KfqPfDoAA5mCajmss1c40vv7dex6lNOBxVwvOJv8YMUqCfn60YX6f4x0g3obwsu6VjB3MjeUKg31/NZYKoEh6npkFxwD108gBTbjlcNRaEilDG2kKcHxIRvy2hKdIG/Q3CAmKo6oblrlwBJpF0H3WNQZDhABjOtz9fbbk5ZUj3V1CJpmmjAQFNOZhHuflYBJ3CPeNWWlVUUAJLSfh456Tw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TNOt8BCVFoOimvZFVWCgy3ofP8rlpATrnqmHCbN/EKs=;
 b=q7XtXOjtx3yYAl5M6Gc8JLodTPAtiGWCBR2YQRFXy9xaGW2YPwgfWIDrSQokLDO2FOqsrY25CKhZP8z0LaLBmXfgraT6NUTKkHdltSNoM1HHgB4x6HBrYfekfalmafN4udbLembFglNDbkq+GF4pJ2gabSDdbFbewHmkOewYO/bcFHfDfhZoAi6CLonnELmlOvZ0+3MjM8V+BXC+kTI6OMviI0Np+qqS+1owRMTZ53rPxNEPuVwongf5rNMy0mAubEFmOqlt/FjTdvfAXkiiYcFgKPrdjOEViuxJE9rX2KM+LILS7IEw4DjwkKYpfxTxIN96c0THnr4WxnrK8LGnVw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TNOt8BCVFoOimvZFVWCgy3ofP8rlpATrnqmHCbN/EKs=;
 b=eBj2qMYI5MUy32ETOvQXF9BRrsGonWo4HYqJjYRehzBQdwqxqAUH1s2QJuBu/1Tja+zX7PyvGcYlMSCHEzNk+OKBZSoWGtE3gJyIQiv6ZDERgqixSiUBy3pMeDcEfRgf+OrpA7V82chgBeLZTJILB1CbpRo+J4vBw0+sPnsHQC6M5AFl8y+oYpBdV9iYhKPoFZJfwqQ3A/k5KLejJfb3Mwzzcli2cntbPPyk6g8Ryk4OmzJ85BSsAr54GVHckZRs3mYGQKZ2fZ+TMRNyyxRjdP8vWj2gcIIVZYXuqUYOx/yVpokoBs0bDMq89c7sbqetlAoWnr9pWMUs6EYR1isAmg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from AS8P189MB1672.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:396::9)
 by DBBP189MB1258.EURP189.PROD.OUTLOOK.COM (2603:10a6:10:1ec::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.28; Tue, 31 Mar
 2026 12:12:29 +0000
Received: from AS8P189MB1672.EURP189.PROD.OUTLOOK.COM
 ([fe80::f147:85e5:34de:eeff]) by AS8P189MB1672.EURP189.PROD.OUTLOOK.COM
 ([fe80::f147:85e5:34de:eeff%6]) with mapi id 15.20.9769.014; Tue, 31 Mar 2026
 12:12:29 +0000
From: "Adarsh Jagadish Kamini" <adarsh.jagadish.kamini@est.tech>
To: openembedded-core@lists.openembedded.org
CC: Adarsh Jagadish Kamini <adarsh.jagadish.kamini@est.tech>
Subject: [OE-core][scarthgap][PATCH] binutils: mark CVE-2025-69650 and CVE-2025-69651 as disputed
Date: Tue, 31 Mar 2026 14:12:24 +0200
Message-ID: <20260331121224.165204-1-adarsh.jagadish.kamini@est.tech>
X-Mailer: git-send-email 2.43.0
X-ClientProxiedBy: DB8P191CA0025.EURP191.PROD.OUTLOOK.COM
 (2603:10a6:10:130::35) To AS8P189MB1672.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:20b:396::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8P189MB1672:EE_|DBBP189MB1258:EE_
X-MS-Office365-Filtering-Correlation-Id: b400a477-f5da-4447-3472-08de8f1ec773
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|1800799024|376014|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info: 
	bD8is9Vp6zGEB2HWjQ422yowlxKWfut/jSOGP6j37BcbnAAir96m+6AcoIKhYaK6+e0LIv7qjuWyCbSy57z7XQnOh7/jrJfdL4xCgZKbNboQ2YAos3QLR4wgalQ5vrrL4vJ0IMBUkKjjzx2ZRX7lNyiBbraOGyHXht9eaubMJjjqXv/CKKmSHjdvDG2gRW67y0rPQ4nXalgAJgmy94hY/xSgtf6OijpDrgHITiOQvIElWsfxhyCeglS8vzVYjD1B+JoR2XL4B5dW41k9mpOg9URuUYYPPbFUQSzcATw6Cp7Da5bXn3zbScBEd9uz10jkJTABD2f5muvwCHV3NddYpBBEpx3YrqzKKZwRDAoKI4nrk6joODdh3q94E82jYNbhrayQa0ETA53f7bR2665u9iSw/g8lphlkfVgFnC9hsyiGJ4OaIfohm54abZN2IulugfKaIVFaJxG1sbfs69ezMLIvBfxoWMlVGJMgUeO3uV8M73ZGI2oPNAHnqAsGuhSHBEVWaP2Mq63V8idktMXXmxwJXbNSqeCt7wdqrsitgqIja/ihjARjHFTSyt37sOQlI1QMlc91LvWrm1kbjLXL5jhFCuLzurUnX26VUBD3Kwfm0NfC7Ya0usdI2rAh7SHjCkJvu495pjXfWrBxJDvpJVL/qDbvmzBtgOb5Xl9q/9DbcAe0iJBY/guarIDlmFXlRV0yuLBJC05og4yzX8Oif6XUnLpjNyaa1JaNmIa9c/HmhRvDBSRXTPJ0NV5qvd6U
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8P189MB1672.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(56012099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?7a9ukuoxd6qf+Y33CCUExpDFHKCiCJfpfjKrUfLDHH+gfPhDE4YajAcc8dKw?=
 =?us-ascii?Q?qUWgVkRSgRCnSzjebPPLKHuLklOC4TayR+IIKZSSKQpPm5KDTM/gHpkZy+3R?=
 =?us-ascii?Q?YC4x5ljoYdGwWCSZYR4cxoH15OtVovMSeK/+zdYE9eQOgKPwrfc36G4dUc1e?=
 =?us-ascii?Q?LJh0gNHCU4xZM0phpWDIYRMiBDbceH2EZRjX/aH9ustYodxw/KXwQXdihLf7?=
 =?us-ascii?Q?nMbGbbxrcMKgchtH4RI07is6B5JApwMJ+7xkogFWeNmonbz1UD97TJkKoF+z?=
 =?us-ascii?Q?X4Onfk1Zn0qAVGv6ELMsnTkrw8OC35yF31rqJB5/cvN9Ltq+nBUY9jkU5+PD?=
 =?us-ascii?Q?ODSMk4h40bR+XdroBbTad2+18Dhl1VOP6Yx9mr4U7J7w8ihQsANsgl9qHSHo?=
 =?us-ascii?Q?XgQETXZXsgOIgC2xEj4OsgS2RNvfZ/9QLJf0kWqnTbdtZ5Rt64g0K40D4L1w?=
 =?us-ascii?Q?/CIFTbHptpQT76ZB98uIEVVygJbBtKWkKmbcZLXNBM2QHPHh6rQa67eVGJNE?=
 =?us-ascii?Q?Jt1DgR9jeShAjPEwvq31U+jEvCz4mIQ+B+L9HcjVDuvMpcbJnXZfstwWaZs3?=
 =?us-ascii?Q?QSctgPEUk6YI5d8S0yOi9qj2pluPRe4fVPPq57bN3UYlI0mInF07g90ZfV6B?=
 =?us-ascii?Q?neQkiwEFRMQumyWsO+47bnAA+9ubiw2N0Xs9J99hs/j3XnfG45W8glbwUOH8?=
 =?us-ascii?Q?lFbJ8SiwKtAkQUHtkaVmLMUdz8f59o6r6es0ppYqGgw5n1JA+AKtPcFC1u+/?=
 =?us-ascii?Q?PokWtXhnfpbW2FXGUZs4IkE8iyYPwlqQZ0P2XBnnylZ5xzYfgaXJ6oP1dwMj?=
 =?us-ascii?Q?zJtlSPndZYmheLQ2BQdpYfAApnqFBuAgw+t3M+sk730jgS8a88tWmAR1QtmW?=
 =?us-ascii?Q?im+RLFSf8GQfTEB2+6NLjfMAEGSibdOBwdGh1TqZk06lYgPJIt+ovpvk3cY5?=
 =?us-ascii?Q?NWz8gl6kgxtChDjbibgTptuOmB12aXj6m8G9jbYVc8f9CqMKl5cwcR1y7F9G?=
 =?us-ascii?Q?LiGgvwUrKLN2RdfdvdZ/xyvq7gPyiFtw/CGPLkx7i8EXr2JfLH+QgE/H3xO9?=
 =?us-ascii?Q?rFPaTqHksT0Br4PzJ5ga1LnDzvUBZ8Q9ESXTvPsaz1D5Afsq58CrDnZC96Hv?=
 =?us-ascii?Q?sXIru7ZfYvCykYYe5txRiOdW03PQexAqCWA9DJrmHNQQz6Nz/aZTCjL/aMb9?=
 =?us-ascii?Q?4rKzzilEVtKJjmqmnaUxCJndawYOGtwN67+nCrbJa18Lqf/DEznX7Aqgui16?=
 =?us-ascii?Q?LIUGVkldSDK/UwGkenJmOEgZNjHhQhU/5nRw0HBKpex9rJ/mxoC84/AsxgeX?=
 =?us-ascii?Q?QyOdk0PjjP9hwnFy2a6gmm132WAqm12NfxHwZxNpfNKYNICOcHYpfsYzR/il?=
 =?us-ascii?Q?7w6AyvTY99JjjboUfGR2kQdEKjDPV/8O1+U1UYb1zwwmLcP21iJNpkfFtwx9?=
 =?us-ascii?Q?EwbhzM48wasEpRVjUkE7b5FbzAijsvACcgmAM1rS9XC8s9EVKGu452FOUp5A?=
 =?us-ascii?Q?zr01qVzkllVkb9Ql6jFRubpvU9f7nFhXMJRTngWrgOU5mpob3XR/DZfAclNJ?=
 =?us-ascii?Q?9v6J8gJ1h7+jglg6EoLHhr3fsCvrmx2WybQXjxWQgUI+5vhRoCat1tURGDYa?=
 =?us-ascii?Q?1L1+VMRyV1l5ErVTjE0f0rtvzwpqPXARAhh4imTvbPZSmF3wGl3We3RhHvZG?=
 =?us-ascii?Q?8/jzECc8AD47TzG7RJ/qbhT00IpSGOj7My44ahWJ4E6CnCFKOhllgOSZaDJz?=
 =?us-ascii?Q?hO02t/oZL6FDT/BDYPoFSft5L+vStU8=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: b400a477-f5da-4447-3472-08de8f1ec773
X-MS-Exchange-CrossTenant-AuthSource: AS8P189MB1672.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Mar 2026 12:12:29.2101
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0jDQSyEcldD9WLsrWPKcL0ndVtdH1hLX1s4VLDgyBp356GC0h4VOKRyr4oTBzSFJQbhZHPI21yE5PMrDev9a182vCMmhlz3GtYrMmFM5PEc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBP189MB1258
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 31 Mar 2026 12:14:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/234284

From: Adarsh Jagadish Kamini <adarsh.jagadish.kamini@est.tech>

Both CVEs are disputed by third parties. The observed behavior
(double free / invalid pointer free in readelf) only occurred in
pre-release code and did not affect any tagged version [1][2].

CVE_STATUS[CVE-2025-69650] =3D "disputed: observed behavior only in pre-rel=
ease code, does not affect any tagged version"
CVE_STATUS[CVE-2025-69651] =3D "disputed: observed behavior only in pre-rel=
ease code, does not affect any tagged version"

[1] https://www.cve.org/CVERecord?id=3DCVE-2025-69650
[2] https://www.cve.org/CVERecord?id=3DCVE-2025-69651

Signed-off-by: Adarsh Jagadish Kamini <adarsh.jagadish.kamini@est.tech>
---
 meta/recipes-devtools/binutils/binutils-2.42.inc | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-devtools/binutils/binutils-2.42.inc b/meta/recipe=
s-devtools/binutils/binutils-2.42.inc
index 839d31242e..e27502af72 100644
--- a/meta/recipes-devtools/binutils/binutils-2.42.inc
+++ b/meta/recipes-devtools/binutils/binutils-2.42.inc
@@ -20,6 +20,8 @@ UPSTREAM_CHECK_GITTAGREGEX =3D "binutils-(?P<pver>\d+_(\d=
_?)*)"
=20
 CVE_STATUS[CVE-2023-25584] =3D "cpe-incorrect: Applies only for version 2.=
40 and earlier"
 CVE_STATUS[CVE-2025-1180] =3D "patched: fixed by patch for CVE-2025-1176"=
=20
+CVE_STATUS[CVE-2025-69650] =3D "disputed: observed behavior only in pre-re=
lease code, does not affect any tagged version"
+CVE_STATUS[CVE-2025-69651] =3D "disputed: observed behavior only in pre-re=
lease code, does not affect any tagged version"
=20
 SRCREV ?=3D "f9488b0d92b591bdf3ff8cce485cb0e1b3727cc0"
 BINUTILS_GIT_URI ?=3D "git://sourceware.org/git/binutils-gdb.git;branch=3D=
${SRCBRANCH};protocol=3Dhttps"
--=20
2.34.1


