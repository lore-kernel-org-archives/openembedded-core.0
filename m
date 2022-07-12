Return-Path: <akash.hadke@kpit.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 19CC5C43334
	for <webhook@archiver.kernel.org>; Tue, 12 Jul 2022 14:43:40 +0000 (UTC)
Received: from IND01-BMX-obe.outbound.protection.outlook.com
 (IND01-BMX-obe.outbound.protection.outlook.com [40.107.239.68])
 by mx.groups.io with SMTP id smtpd.web08.10088.1657637010411584712
 for <openembedded-core@lists.openembedded.org>;
 Tue, 12 Jul 2022 07:43:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kpit.com header.s=selector1 header.b=xOSatcF3;
 spf=pass (domain: kpit.com, ip: 40.107.239.68,
 mailfrom: akash.hadke@kpit.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aCWDZdkTYKtSnrusUTqiIawFM6MNHNfwsF0UC19vkRp9RLfk6anlU549N/X40Icbqa4/y8YxvKZpCRdJXn00vNUYyNcMorq1tPSBlNiscmQr1HM5mBMeXtKwtOnF78S+KlgQSvCVzNEpgjU/LBXpRPZ4emzkFBQrg/Pax7Xj04udX/6H3CqCnP9USSVBK0c2kwNwQftwA2UVVr3u8ieUxwkAZmRnm80oMZtwOCg6AsllI++gLSoAXObcTPY7ils4j+ZYPAF0uQ46umqFQK+lRjEoXZfg5lTGcZKHqCDkQdCHfWUiO0uZbjoqXLq1yD5eanqga2jKYB7RgZd3S4XXKw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0O314WZuihfGNEsOcwYsN93V4CvI8MMS2TYiyG8psEI=;
 b=Qj4UtXydffqLXdiqetH2z95oGyDJu1+MmwYpHiNK9HMCYHz8vJXvkmKkhUouHmusoUK9OUUNb2+7EFuv/R7T2WqiV0jNFiQDLOsuG4R4S8KVjskoD4qAVaFuCsvRXZkPGZT/OYb7z+7ihageQNwIPRodjCy3HhCkjlu1feVHv/WuXrUDRgf68bwNIqEU7yDXPwEvJWW1SH1oX9gQ6vhDRyXOw/4ZmjjGpwvz1j/Qv46PcE+01KbVb/RNQFcigKoQcvKB1EKarWhCkAlpYU5/oVnOHUf3KgC7nH0XJPq442TAHoJGAUIAd+LWu4cTgrSqXg81iawfDp5k5MpwnKAZMA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=kpit.com; dmarc=pass action=none header.from=kpit.com;
 dkim=pass header.d=kpit.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kpit.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0O314WZuihfGNEsOcwYsN93V4CvI8MMS2TYiyG8psEI=;
 b=xOSatcF3pNEKbMcOElQ99KvnstTStT5HcKngyGBTUOycSLX97WnuXW+FAP0UYT7Y2Klp+XZPVW/c65IY8ewDmXRbxr6xdOvDAfhC/wqd/nZ/La82T2ZgR9/pUYKjhX5dJ5kfvZpUlsNE7/Ey61bxb3UQX18hBwX7AYWGdzWZsWk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=kpit.com;
Received: from PN3PR01MB6712.INDPRD01.PROD.OUTLOOK.COM (2603:1096:c01:89::13)
 by MAZPR01MB6767.INDPRD01.PROD.OUTLOOK.COM (2603:1096:a01:51::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5417.15; Tue, 12 Jul
 2022 14:43:25 +0000
Received: from PN3PR01MB6712.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::57:e269:a77f:d5d9]) by PN3PR01MB6712.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::57:e269:a77f:d5d9%4]) with mapi id 15.20.5417.026; Tue, 12 Jul 2022
 14:43:25 +0000
From: Akash Hadke <akash.hadke@kpit.com>
To: openembedded-core@lists.openembedded.org
Cc: ranjitsinh.rathod@kpit.com
Subject: [poky][master][kirkstone][PATCH 2/2] cve-check.bbclass: Add new
 variable 'CVE_CHECK_WITH_DB'
Date: Tue, 12 Jul 2022 16:42:46 +0200
Message-Id: <20220712144246.8942-2-akash.hadke@kpit.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220712144246.8942-1-akash.hadke@kpit.com>
References: <20220712144246.8942-1-akash.hadke@kpit.com>
Content-Type: text/plain
X-ClientProxiedBy: AM6P191CA0045.EURP191.PROD.OUTLOOK.COM
 (2603:10a6:209:7f::22) To PN3PR01MB6712.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:89::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 5a5c4f65-c1c3-4ca4-9d1f-08da6414e057
X-MS-TrafficTypeDiagnostic: MAZPR01MB6767:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	/Mbb7i0mpXwbtn0Hh+ivwrubhJ4XP6j8xUKWTiLxDxwwtEIGjN46Wmrbn6jSqCKsrD8PAcw1BNAN4YDc8CAsPygtfM5Bd+bUyiUhynNFVO3mDFjprduwU/h1efiClICxBNADPpH4POUwgq5uv5wPSw29aVyUUCfDLhuw/Ld4OrImva9mCcmUNoNWg1jGs5/bBJevwRTsOnU+BXrS1qG3u3PQPhmjN2aEObCLtqb1Ga1cQnlIr4v2WzDBoWpFRbCkP0ZwvkTVfJfCJWy4IevnIk49+j8OIhGCuI5nOahUCIUpaMIhzPntdnMeCUQpbnTxqLUXEwNcWTwoa4xUOshxxufphXcD8Em8paqg/p2IegMWXE/sznF5nCY95X2oaZvjcqbgJHDx1olUpiuospVMuaIl2CC9DNEjFmFZFt7n/uVar/jL/CHNE4Y2PlBA4fBUv5Ck8VdNxAHsHpgxPzX8b3otCAQQ5gaLUul3ABcPGNGJvYdrhrHS5btQIFYrREN0iFvShFvGuxqG+cXBUTdi+mQLJ1daU+d/4EVenjuSy4Gf5k3ik9KxRQLtkPOrqGfjbtI9m1mKCp4OoE7Hu5XBKprN6ic8rea8NOdXGZMnxOap5/Eay4TYr4bFlKCH04vdNM8tMBzl3eG55NWLQKsAkgU/I1r0ljstGAw8RAION8LvKHQ7CCxJxbwa5kqMWXMO+oPtvDLjFEWkpx15dVf25XOxYPY0lP7Lit4214Nob+jaCDiFgnNFjKIMP3aPmKkb/Qh2IsiMKyGs1Cqjgk6mwgn/9Tv/+zNc5s8ruMEZUuOGnVBmPX2S4uyGizoTvFKb
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PN3PR01MB6712.INDPRD01.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230016)(4636009)(396003)(136003)(366004)(346002)(376002)(39860400002)(186003)(2616005)(6506007)(107886003)(6512007)(66556008)(38350700002)(38100700002)(1076003)(52116002)(26005)(86362001)(2906002)(6486002)(83380400001)(66476007)(6666004)(478600001)(66946007)(8936002)(41300700001)(5660300002)(316002)(44832011)(6916009)(8676002)(4326008)(36756003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?wCfYZ9Aty1/pIbwkk9r0lZzyB0rH+/T3Fna4EoQXYW8PlvUDcAW2fEQffors?=
 =?us-ascii?Q?YEVcXMHCh3qfH4X9pfzF1p/rtrx1QmtSTPR5wNhPrvz9ooVYiL1WLH3p5iDm?=
 =?us-ascii?Q?dvO+6kcfyCQPZWxKp2BjokGdz2ejxHib/lYyC+546XLY2PM2JeCSpzH4OXmS?=
 =?us-ascii?Q?wS04ZyN3TLQFWRENcSGg1BeZj/OvTq7t+QVUvDG+eTiC6m+Ra0i8kYoWuioP?=
 =?us-ascii?Q?1noqV+A4dYzOZG18o3d4RART4Exhp8rsbSYr50rInHBufHhbJH2RbQdZ7MWv?=
 =?us-ascii?Q?McH17YU/IEymKGj3wCWJ2krLVN0tjQGMRy4Y1ZEl4VFBp0I0gef7Z7MT0lgX?=
 =?us-ascii?Q?IUNtiBFznt8SyJmufEg5RNmKkdekYa3ReEpGBiftLuW8zKgR1tAlH6Dneh3G?=
 =?us-ascii?Q?HYiynfOcgPui6G00kVDjmk2IPXW+B241sl2RzcU6woT3V75iYieaSkz1nS8B?=
 =?us-ascii?Q?pCNCjCHyvgl52GuI8LyOgRQ0Xzuyb6fna480XeIsPGIwL1Oray55BA/qG9Bb?=
 =?us-ascii?Q?oX5bxkLkhNKR2W89TAPfK5ARmmT9u/jxZKa5m24cE/UNK42/qc7WO1+CDW1K?=
 =?us-ascii?Q?yp3GIR9jtQ7sUkhneDTDdRFKFTxfr9NZEu457wNcYchblU0wQvCIvXbMYAdN?=
 =?us-ascii?Q?FUG7QAmaMVmrlxwlkknjlQneGVxFi1TH6cqWkPwLaRWIlSXy2L2uuGpD2vCz?=
 =?us-ascii?Q?VJO5D/GfrrjHEB++JGFkbuqOWuThg24GTcwPcrbrTMCJqs9XbzgKLm37WCJ5?=
 =?us-ascii?Q?ffYxCZLBAOUBoHzQavowLTRErB3kbDRfa2+tc3Pg8t+IwUFJBgAXiYitooPx?=
 =?us-ascii?Q?yZt+q3nj93DbbH3ci0ou/za5pwZPBZrkThIyZ7vlEnjrKPzO3xw+K+cRw0zv?=
 =?us-ascii?Q?ZDjYMsRhqeAomA5PlrQp1XufvYmDd8MLRdNej6UdFEFfu7WYscpxctjA8g2s?=
 =?us-ascii?Q?eLrCJlZa2TOSLdJAK9yP4rCoAL96LcyvGlQYCHMDgY0WQ78cWvL2YvpAPKrj?=
 =?us-ascii?Q?PmHcUbeKfNNccvWXZyV5HGiEkGiZFf7wqj4snCAWFxoIGAh0UkAJhN7LKgf1?=
 =?us-ascii?Q?dRxJYKFROsgxzHdxvahZsSHRgEjS5JZFJJUYblTEqm0czyw1rbBb8iTwiLRd?=
 =?us-ascii?Q?mpoTd0A09mO4nBPy3Hqty6X2Jnlp9w/0IQflWcUkT8gPqZwkbRoEm8CK15+o?=
 =?us-ascii?Q?LEkyGaPrzDJPPryz6iH8nE72ATXa2lRGHQTMfBiVxgIn+KqC54ddA5FIck0s?=
 =?us-ascii?Q?B0J1JobfQZ45gnfRfgUi3Z3jHzxObYpdOXlsiRFhcAyj4YCDn1xtvwyEFDWG?=
 =?us-ascii?Q?f0ekMvIfAxWZzADf3gWmpz27IFwldP7Hm2XrIqgM7FSpyqGekVdA3qGK5BFL?=
 =?us-ascii?Q?R0cYE479J2AK69RKjkmObMsmiPbg95m/i2QdVm92E/qzb1Pd+DPNkWfgYMdh?=
 =?us-ascii?Q?ABzXmBDjP33w9qBHBNStsL+hhCDMlC2bEqhjtHIwUT7BWSrYCNS9E4WB8rwi?=
 =?us-ascii?Q?aPImmGtuvcfvjWqBt954ZmRVkv700enmPjXEIqKjGE6tqu7lJc18qdGBpYoc?=
 =?us-ascii?Q?bM2zOxEh0bE+oyWJjna/+fCTPbqwzyajQUyNqIA6?=
X-OriginatorOrg: kpit.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 5a5c4f65-c1c3-4ca4-9d1f-08da6414e057
X-MS-Exchange-CrossTenant-AuthSource: PN3PR01MB6712.INDPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jul 2022 14:43:25.5432
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3539451e-b46e-4a26-a242-ff61502855c7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 gIePboR1w8vkJbmgog7dYT3vQ3N3Z4wV+sbju/8QIZSs/siJiOXXZ9jtsCzczJQmjLu9QVFOtF64j75k3zACkg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MAZPR01MB6767
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 12 Jul 2022 14:43:40 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/167932

Introduce a new variable 'CVE_CHECK_WITH_DB' default set
to '0', when it is set to non zero value it avoids CVE scan for
unpatched CVEs from NVD DB.
It will work as the second operational mode for cve-check.bbclass
which only exports the data.

Signed-off-by: Akash Hadke <akash.hadke@kpit.com>
---
 meta/classes/cve-check.bbclass | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/meta/classes/cve-check.bbclass b/meta/classes/cve-check.bbclass
index 2f1a3ec706..7e5e083eb7 100644
--- a/meta/classes/cve-check.bbclass
+++ b/meta/classes/cve-check.bbclass
@@ -82,6 +82,9 @@ CVE_CHECK_LAYER_INCLUDELIST ??= ""
 # set to "alphabetical" for version using single alphabetical character as increment release
 CVE_VERSION_SUFFIX ??= ""
 
+# set to "1" for avoiding full scan for unpatched CVEs
+CVE_CHECK_WITH_DB ??= "0"
+
 # Patched CVEs from recipe will be assigned to this variable
 CVE_PATCHED ??= ""
 
@@ -147,7 +150,7 @@ python do_cve_check () {
     """
     from oe.cve_check import get_patched_cves
 
-    if os.path.exists(d.getVar("CVE_CHECK_DB_FILE")):
+    if os.path.exists(d.getVar("CVE_CHECK_DB_FILE")) and d.getVar("CVE_CHECK_WITH_DB") == "0":
         try:
             patched_cves = get_patched_cves(d)
         except FileNotFoundError:
@@ -162,7 +165,7 @@ python do_cve_check () {
 }
 
 addtask cve_check before do_build
-do_cve_check[depends] = "cve-update-db-native:do_fetch"
+do_cve_check[depends] = "${@'cve-update-db-native:do_fetch' if d.getVar('CVE_CHECK_WITH_DB') == '0' else ''}"
 do_cve_check[nostamp] = "1"
 
 python cve_check_cleanup () {
-- 
2.17.1


