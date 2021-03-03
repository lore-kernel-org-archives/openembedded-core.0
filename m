Received: from NAM02-BL2-obe.outbound.protection.outlook.com (NAM02-BL2-obe.outbound.protection.outlook.com [40.107.75.81])
 by mx.groups.io with SMTP id smtpd.web11.578.1614797646836633703
 for <openembedded-core@lists.openembedded.org>;
 Wed, 03 Mar 2021 10:54:07 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=CpzVt2RL;
 spf=pass (domain: windriver.com, ip: 40.107.75.81, mailfrom: stefan.ghinea@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=S6wJd3PqYNwGVx1oZS3utNGPIdrFB/FOkxcKqJPFi2ZuvD0XucV+FLPqcR2cK1v9hehSNOnX7mBQtu/JU20i+eYy/jXgGXHT+QgYoLk9hlt0Kyuiz1w/LR0pY65Aff9lklSHZNUO/y0jOd0SFHmBYcTiy2C7Vp+Y5SJKpSyL7dhiYhDL2rHmFH+5+UJ5tbW7UHxAjVAShSFn/zDARmzEXF+EwGscfaZOeUIGzz5F/eqTyiAMGEEFBll9qfTLzSb2SEh/Ehj613l8E2YpsdU6yNlaaEnZORUhKhuxtejZqDhtfjoBwLXn2QYyO3oZhpMgOXsZFXa/S5LfhbyW5i7f1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=z0OQSHrAzsfjLeFs29I1TpQvssYgoh32TsshQYj1ciM=;
 b=GhjE2ntpfnHXaaYYSlvKGGN4kWFFZhUxqtkfdj2753IRzT0H7u0B1sCGZzFHh6aaqj7vrDHEfexgAJkFcIkf1c3VSiVM5I9kbdSv66k6ibz8UPpAc4S8WB1fSraYPQ/vPTgWiB74Yl+Jnb1U8dQ01KCxZGo+QtADzT4xltVxBNKCnuXtzAcFkNq3YP4Tt4tKHpzebnRy9lsNgAUdPeBvnhJWDwVEDn8cMKCQedv9EGMV+8moqhe5LKFNkXsltdNiQkSR8i/P6ysbcxdIx3HWjJE1iPRS4QeSI81rIi8fdj0VsxsaxezTKQfPEbCTJ7pIxqM5RS54ZZPRaBUHt1MdFA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=z0OQSHrAzsfjLeFs29I1TpQvssYgoh32TsshQYj1ciM=;
 b=CpzVt2RL1cY23+3eAA4G64EDp2fpXkd2TGgI9lEoeSeYZkUzouDM5n4IToUmw0WJs9wzzguufOQ9N9hCNveOCzNHJa1Dbsg+WPUU448KR9YWTyPVoDoS5jlZMaAMk9DoFIQZwGJ7TKCvrq0S6nj22I56/XwFAVQXQcaZmdplCp8=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from SJ0PR11MB4989.namprd11.prod.outlook.com (2603:10b6:a03:2d9::22)
 by BYAPR11MB2870.namprd11.prod.outlook.com (2603:10b6:a02:cb::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3890.28; Wed, 3 Mar
 2021 18:54:03 +0000
Received: from SJ0PR11MB4989.namprd11.prod.outlook.com
 ([fe80::31f5:2e4:c15a:6df0]) by SJ0PR11MB4989.namprd11.prod.outlook.com
 ([fe80::31f5:2e4:c15a:6df0%6]) with mapi id 15.20.3912.017; Wed, 3 Mar 2021
 18:54:03 +0000
From: "Stefan Ghinea" <stefan.ghinea@windriver.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] [OE-core] [meta-openembedded] hostapd: fix CVE-2021-27803
Date: Wed,  3 Mar 2021 20:53:41 +0200
Message-Id: <20210303185341.32122-1-stefan.ghinea@windriver.com>
X-Mailer: git-send-email 2.17.1
X-Originating-IP: [89.137.231.29]
X-ClientProxiedBy: VI1PR0701CA0048.eurprd07.prod.outlook.com
 (2603:10a6:800:90::34) To SJ0PR11MB4989.namprd11.prod.outlook.com
 (2603:10b6:a03:2d9::22)
Return-Path: stefan.ghinea@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (89.137.231.29) by VI1PR0701CA0048.eurprd07.prod.outlook.com (2603:10a6:800:90::34) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3912.9 via Frontend Transport; Wed, 3 Mar 2021 18:54:02 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 0f78b241-4d00-4054-ef8a-08d8de75b6d1
X-MS-TrafficTypeDiagnostic: BYAPR11MB2870:
X-Microsoft-Antispam-PRVS: 
	<BYAPR11MB28703816E84ACC9B7B8C5ECDF2989@BYAPR11MB2870.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	JnYAT92maAUwqNQuPCLz8BSxurz8Al0adjLEg5IqCj1dlKDlkUlM/ZAt8xPJxcfsAI8iX1YbD9gT9nViLyFs6dAyJX94loy+80lNdaJxZ/O2T1OzmQj1oIvipUe08GPWueih1zrURkCDJ2glA8BRlNraI3s5LS7hw/vuomyU6iMo2UHrMHhoQmtuiy6hPcK5qQQVW1OFzHKb7fDQJOUzfitQJRnJquEOEERrLJgDGhlotFndFBMwd0tmZxR3c7Lqfe+nRgx6EI6pIgxwuPoEiVnPdCFaS85Pd6LDORI7sigFzfYdftGXOmfIFfJAw50Ndm3we4XU+BtN6B/hwBzNRpkjh+LQ/ViegX68ofs/xoJOaufMDomAaZk9nCElzVm7z+gLm3OixGcPRdVyHtzs1zePaGYd4uWSY7xNKg6KjmXmui9cKRFfjcUxSXI92feOMYqLq0v82EZQv+8En/mwXBMv7ofEDfHQ/x88jizj7ygw7CwXQ/WcWVcFpcjOrvqAkBxnnnwKH3/slgGvfzL7Jec+x0R9uAK+SBsq10IM9+o/zwl3i5835528adxM9UwgZqYS4t2ScJpdyRKcdBYmZ7r/vPERKNdla2rfBOXGOk+EY7KiGiYXIH+/mqMJDp9pjIhFxkm/4Ejjl20Mno7j/g==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR11MB4989.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(366004)(136003)(346002)(39850400004)(376002)(186003)(6506007)(2906002)(26005)(6512007)(1076003)(86362001)(956004)(66556008)(2616005)(6666004)(66946007)(316002)(8936002)(36756003)(5660300002)(66476007)(16526019)(52116002)(8676002)(966005)(6486002)(83380400001)(478600001)(69590400012)(6916009)(44832011);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?us-ascii?Q?RjTG4u9rIpbsND2QJGzqwyO9ftuaFv2PSZ6XGJmIbCyZ43aSAM3hVQHpKmBD?=
 =?us-ascii?Q?6NSOLr7yA6UEgQFw5jMZXOrO7wD7D/XLcpxCvUHAQgB7RXXUYvJsfBMroQbx?=
 =?us-ascii?Q?pIiUSDH+TA28uLnONi3EOUOSIaxUlbALpQ7eCD1fbjLiW9zsJxpCj8dbWXMX?=
 =?us-ascii?Q?UtKenV7SoAA1k0PFBlvnfITeICsnWKL6i0jNqEHNq/1zdRhObyLFLhi4kDCT?=
 =?us-ascii?Q?imb4etE062UfrFpdW0ss5kNqxFNpPKIik0bh+uaWv2lb4znbYrrqwrUwlgYp?=
 =?us-ascii?Q?qbwknuJ7LKffXkl1IT6w4tWb6/C3Q5thR7sA9fv3F1jgHf8SXRtkOiWmriQk?=
 =?us-ascii?Q?9GDtwr+IYyDjjsVDRGDdHBL06D45SQSg9VmSzI6Fbw79XDGG9F1anrhgG+6N?=
 =?us-ascii?Q?Hb7AeI12LwhLwamVuzUkz04anwEJU6Zf/sQ4ARX27jucYH/sV1ywv9xrhmWN?=
 =?us-ascii?Q?QHNeiPBL2rEVy/hqkzjPIfXHoRqJN/hreQ+XgIwAfCpbVYwSETUEQSzDx120?=
 =?us-ascii?Q?roWyzcwOvh9vwNI4SNO9QQ3l5V066S80AhvB8hU5wuHjL/Y494er6zbtycX5?=
 =?us-ascii?Q?ACvdkGe9RTtdb5iqSEjd4g/DBK3FjXt5LW4rKaBb3LOT/GvbHn0kEnZRQKGi?=
 =?us-ascii?Q?p/Yf9z3jl/1T6bxyWlS8U1AzZfjhrin6pf3qqCTl+JDiEcaOL1sNQ6XXizCC?=
 =?us-ascii?Q?HpOhWpvEJFNunwOvMGmcD1STRMn8eFJ4TVgX4CuuJkb/ANmvqKSeDxshuHLS?=
 =?us-ascii?Q?8jKmdjFmCNA5aC07BEiTvHmZ219ItwOBJ/Yt/kk/s2i16QppXDvSyJJI7lOs?=
 =?us-ascii?Q?YdO3uY8fqSo/JQMvDgzsbONFtIcNQE1xTO5o+nfI0Hd122X4kl4GrARxeo3q?=
 =?us-ascii?Q?5OfpBDN93DKqVakiF77Fy/q8QdjRgh43szkYiRP5vkrudgMidX1Yub5qM94b?=
 =?us-ascii?Q?hRI154+Ip/zYA7jJUhj8XdCk6QFHqT1pao/sCA33bA1Ty+fqD2IJz6+KxM9O?=
 =?us-ascii?Q?d8lC12apjmfp4TTwfoK22bTKEVsIYOl1f777lyxE4weEj58DgT/48/aerYJT?=
 =?us-ascii?Q?Zk5EX9jXj4vdIFpk/FCXBxdAew7ifPR7gRPN9GEkVNpC8QFXpFuBFoPTyo5S?=
 =?us-ascii?Q?WVG67PqAHhLRVExRP30tts8i2WOw6acTgbMram32/2unyG+rtt/Zeav6mLVV?=
 =?us-ascii?Q?HzoG9O6miQ1Ll1jATDl62dQlRPX3LZ8p7MCE16qnOrfpJYpbefTznS5h/gIZ?=
 =?us-ascii?Q?t/68ua/+u9nLG9guUaOQ4hHpzCzaDvkzvnQsZwjzcLOdwNY0kt/BmfVkN85d?=
 =?us-ascii?Q?jLJZlEsBhgbYJcC4sqoUyoyu?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0f78b241-4d00-4054-ef8a-08d8de75b6d1
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR11MB4989.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Mar 2021 18:54:03.4807
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BDsZeesFBHm8S3joUM0JbvGNnOIlI8vCVVL68iF9qsclxWCtmqbx0N2MsdzBkjuQodd9j1HpUH6RUtDcLk5TGFcjLX8r3li+45mCqvePLL4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR11MB2870
Content-Type: text/plain

A vulnerability was discovered in how p2p/p2p_pd.c in wpa_supplicant
before 2.10 processes P2P (Wi-Fi Direct) provision discovery requests.
It could result in denial of service or other impact (potentially
execution of arbitrary code), for an attacker within radio range.

References:
https://nvd.nist.gov/vuln/detail/CVE-2021-27803

Upstream patches:
https://w1.fi/cgit/hostap/commit/?id=8460e3230988ef2ec13ce6b69b687e941f6cdb32

Signed-off-by: Stefan Ghinea <stefan.ghinea@windriver.com>
---
 .../hostapd/hostapd/CVE-2021-27803.patch      | 58 +++++++++++++++++++
 .../hostapd/hostapd_2.9.bb                    |  1 +
 2 files changed, 59 insertions(+)
 create mode 100644 meta-oe/recipes-connectivity/hostapd/hostapd/CVE-2021-27803.patch

diff --git a/meta-oe/recipes-connectivity/hostapd/hostapd/CVE-2021-27803.patch b/meta-oe/recipes-connectivity/hostapd/hostapd/CVE-2021-27803.patch
new file mode 100644
index 000000000..004b1dbd1
--- /dev/null
+++ b/meta-oe/recipes-connectivity/hostapd/hostapd/CVE-2021-27803.patch
@@ -0,0 +1,58 @@
+From 8460e3230988ef2ec13ce6b69b687e941f6cdb32 Mon Sep 17 00:00:00 2001
+From: Jouni Malinen <jouni@codeaurora.org>
+Date: Tue, 8 Dec 2020 23:52:50 +0200
+Subject: [PATCH] P2P: Fix a corner case in peer addition based on PD Request
+
+p2p_add_device() may remove the oldest entry if there is no room in the
+peer table for a new peer. This would result in any pointer to that
+removed entry becoming stale. A corner case with an invalid PD Request
+frame could result in such a case ending up using (read+write) freed
+memory. This could only by triggered when the peer table has reached its
+maximum size and the PD Request frame is received from the P2P Device
+Address of the oldest remaining entry and the frame has incorrect P2P
+Device Address in the payload.
+
+Fix this by fetching the dev pointer again after having called
+p2p_add_device() so that the stale pointer cannot be used.
+
+Fixes: 17bef1e97a50 ("P2P: Add peer entry based on Provision Discovery Request")
+Signed-off-by: Jouni Malinen <jouni@codeaurora.org>
+
+Upstream-Status: Backport
+CVE: CVE-2021-27803
+
+Reference to upstream patch:
+[https://w1.fi/cgit/hostap/commit/?id=8460e3230988ef2ec13ce6b69b687e941f6cdb32]
+
+Signed-off-by: Stefan Ghinea <stefan.ghinea@windriver.com>
+---
+ src/p2p/p2p_pd.c | 12 +++++-------
+ 1 file changed, 5 insertions(+), 7 deletions(-)
+
+diff --git a/src/p2p/p2p_pd.c b/src/p2p/p2p_pd.c
+index 3994ec0..05fd593 100644
+--- a/src/p2p/p2p_pd.c
++++ b/src/p2p/p2p_pd.c
+@@ -595,14 +595,12 @@ void p2p_process_prov_disc_req(struct p2p_data *p2p, const u8 *sa,
+ 			goto out;
+ 		}
+ 
++		dev = p2p_get_device(p2p, sa);
+ 		if (!dev) {
+-			dev = p2p_get_device(p2p, sa);
+-			if (!dev) {
+-				p2p_dbg(p2p,
+-					"Provision Discovery device not found "
+-					MACSTR, MAC2STR(sa));
+-				goto out;
+-			}
++			p2p_dbg(p2p,
++				"Provision Discovery device not found "
++				MACSTR, MAC2STR(sa));
++			goto out;
+ 		}
+ 	} else if (msg.wfd_subelems) {
+ 		wpabuf_free(dev->info.wfd_subelems);
+-- 
+2.17.1
+
diff --git a/meta-oe/recipes-connectivity/hostapd/hostapd_2.9.bb b/meta-oe/recipes-connectivity/hostapd/hostapd_2.9.bb
index 68dc12370..ae497b6ae 100644
--- a/meta-oe/recipes-connectivity/hostapd/hostapd_2.9.bb
+++ b/meta-oe/recipes-connectivity/hostapd/hostapd_2.9.bb
@@ -12,6 +12,7 @@ SRC_URI = " \
     file://init \
     file://hostapd.service \
     file://CVE-2019-16275.patch \
+    file://CVE-2021-27803.patch \
 "
 
 SRC_URI[md5sum] = "f188fc53a495fe7af3b6d77d3c31dee8"
-- 
2.17.1

