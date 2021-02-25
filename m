Received: from NAM11-DM6-obe.outbound.protection.outlook.com (NAM11-DM6-obe.outbound.protection.outlook.com [])
 by mx.groups.io with SMTP id smtpd.web08.9895.1614252359452554353
 for <openembedded-core@lists.openembedded.org>;
 Thu, 25 Feb 2021 03:26:00 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=igRNiSXb;
 spf=softfail (domain: windriver.com, ip: <nil>, mailfrom: liezhi.yang@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XjcaoSAlxiNe2laKzS2BnLep+Cjszt0d01RkEsIQ3uw/8mKgEbt8gnkcjcv2JKmAZRvxV7Vbe5YXGUXqryTdXKNFQZnRfU0xCkCwkkAwd1DW572bepV90r4PvROIJ8ppepdhf63j7jKQ4fDu+7gnkcKrZt3MCVtUTibzRqNo6eM1uIK0UcVebljNcBci1qLR2FxkeEENcLbyvJEwIEcL1ALY557L2yso0lDIWVRAymDzKUsWnaYp+UpiOHNbDrrupBPiSJCAo2h3iEpdW9RsZxAQ3eCC7tqjmH4nXVuTT6tg+92eCKQ7eZjybWsZL7LwWLkwuTJlg8Ot97VgcwMBdw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KvZpO5im5tDLvrb0uh3lN2pUV+pfm/0acZojzPUsTK4=;
 b=NcNTTjWo/s+A0v14ekFe2MVMj/spZsDRGRkGFehQwZlRPyj8Gi0sMbazxfugpYkj3m5bt53fg0pTP17MHlT6h8E7pRAGjYKmI80qxeNomxoAuuWBA5/JAaKNTiB2FPTokCoCkX+xA9Aksc42IQ8KqeeZ9bC5vzlqG4FrXZYmTpsrOvkRFL4WWWO2xqdsWZ9DwdLx8e3XlnjrQWBc66D5mBxiJLeTUcm8XWppsGxgaYMQ0bw83fxqvj0V1VT3Uq0lJcBKJehNxlOPh0SfeNJSyXflrQ/PYnALW5/GMaHGGWbQ7wzd25qlbbuUl3lGV/k8Zgxk+AlBAZfVukTwknIPKw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KvZpO5im5tDLvrb0uh3lN2pUV+pfm/0acZojzPUsTK4=;
 b=igRNiSXbHuH0lr0j7eJQsFDocIWpHETPannV/ICchVPtxIXjnGHecUa1suJlTEyk/mviaYgjoF3nlHplA3JPD6qyXfkfSvRNMSxfmdcnhw+zOH4fLzJ2eFxbzjuP1t6xJVuHNL5kHmd4PWZydyvckYA+rqS/Pwa+Y9qVTel7cls=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BYAPR11MB3736.namprd11.prod.outlook.com (2603:10b6:a03:f6::10)
 by BYAPR11MB3143.namprd11.prod.outlook.com (2603:10b6:a03:92::32) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3890.20; Thu, 25 Feb
 2021 11:25:55 +0000
Received: from BYAPR11MB3736.namprd11.prod.outlook.com
 ([fe80::dcc7:5da3:6cfe:b3d9]) by BYAPR11MB3736.namprd11.prod.outlook.com
 ([fe80::dcc7:5da3:6cfe:b3d9%7]) with mapi id 15.20.3868.033; Thu, 25 Feb 2021
 11:25:55 +0000
From: "Robert Yang" <liezhi.yang@windriver.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/1] socat: Exit when the file associated with an FD is destroyed
Date: Thu, 25 Feb 2021 03:25:46 -0800
Message-Id: <2fc3ec398db0998427e1d0cc351dfcc91d59a3f0.1614252295.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1614252295.git.liezhi.yang@windriver.com>
References: <cover.1614252295.git.liezhi.yang@windriver.com>
X-Originating-IP: [147.11.105.124]
X-ClientProxiedBy: MW4PR04CA0302.namprd04.prod.outlook.com
 (2603:10b6:303:82::7) To BYAPR11MB3736.namprd11.prod.outlook.com
 (2603:10b6:a03:f6::10)
Return-Path: liezhi.yang@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from ala-lpggp3.wrs.com (147.11.105.124) by MW4PR04CA0302.namprd04.prod.outlook.com (2603:10b6:303:82::7) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3890.20 via Frontend Transport; Thu, 25 Feb 2021 11:25:53 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 01ac71dd-7c7a-45ce-6914-08d8d9801d13
X-MS-TrafficTypeDiagnostic: BYAPR11MB3143:
X-Microsoft-Antispam-PRVS: 
	<BYAPR11MB3143787197FA877A4A8147ADFF9E9@BYAPR11MB3143.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1091;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	QdcfUkVKzI2HcbTv9K9L5YxGVSFsLQhvnbunKLfqK2swyrg8mMxgAP6l2tI1chfNdRkmmOdIWGCJHYsjRs+7ZhRQ3AXuMQTEvLF9IpNMKy1drhPp0aekFTSadDUI7SQKEZv2fkP8AtaWOVj/esuGXz7RRsKqTYL4QfR68D5dR8I+G3lxextUCPZjWzFgD6MtSLq2Tp/64axyUQMBTVBNvnFFg729PVe0QqfgHjn81BazyDNPaL8cI52eEAd1iTYiyr2bnVSv50THoIrbyQFwMp9nydLwOkEZ2dhh8d4N7X59Ep//sFX+xV8uS+Tpj88vi9KR1uAv7gWDMenOqdqOBEnk7a6KJS6XHgLNLbzw/Gy72GIBp1jj5XEkXrvyGnJBvw+GgATMkJ7WBTFdRUGH/VuP3K+e/Wesz59Y0RQvWRq3gnT2u0o9PPLTIFFbJIRliAdOPNZhZfpk1D8kr+1dOVCcBUdCH+fClSWYJ9kE1Iq8loEkkuRdEQaUf1B1sRTMUuJDY/9hMe7emGh6lFUUcht0zo9m9hUhc70G0GZpZyhHz3SSdCGk2wzlCFlpWfzyjzcqyHGjXh/533dfu6r9dMHcKK0A78Yg12B473a1nwM=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR11MB3736.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39840400004)(396003)(136003)(346002)(376002)(366004)(6512007)(2906002)(83380400001)(6486002)(52116002)(26005)(16526019)(6506007)(5660300002)(66476007)(6916009)(316002)(66556008)(186003)(86362001)(6666004)(956004)(66946007)(8676002)(8936002)(478600001)(36756003)(2616005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?us-ascii?Q?UXZgEQGLcUIDhYdUL3hn1l6aaP1h7/1S2T1k2Co4lQclsOmLWJycYCoe90hM?=
 =?us-ascii?Q?UA4tYHsIkAAnSlDHji2jEi30jr8cOH1QCO9pxd9A8YD31ewlGVDlLQqs3h/4?=
 =?us-ascii?Q?3r1yYSW47SqQJGKAkzUGlLU6mph4mJOkSBHBc3eM4acpx4b/xOCkxjZhpZBG?=
 =?us-ascii?Q?pprxN4w+6nl0a99+JprF45IOUPMKPwCBxvAYPT2aoD1Amdx4CBfxXIMmQxv+?=
 =?us-ascii?Q?sfSdbb/BewZAYaZV4Hkdj0gu5jjDldPqtOX/avcW2HEeZCoUBsmOgjISfmna?=
 =?us-ascii?Q?7nXx0xC7gRvfRgjWZ/6mwq2GaiH5oRYcrYJvSCknV9NnAmy1O4FHeBxFUWip?=
 =?us-ascii?Q?hIjV16vn29yjA5Nqljd74u1viKT31JO0uB+Mll+5XtKbyAFE95AtvRbYBlIO?=
 =?us-ascii?Q?zYqJ+CNOe1Qq/RXyYdQS6wB61iYK22jmqQ9g/4A80ktZvog18TiUQQghY8xe?=
 =?us-ascii?Q?0NwLTAZRqSjUTlqw9ZHWG4qvucOdzibv8eWK4LQYG/tMCxSj3Xz/5bX/2mSV?=
 =?us-ascii?Q?ASTfE7oQRe/MrkC5ndugoFn/9PKaI3M7JFfC+zBwxEIyJh+XJoN5ir5gewqF?=
 =?us-ascii?Q?FD4TSm5BQwVZe1PLWwFZwrsUT8vxYPH0o4ZniOSK1HpXXBmFl8rgqZpaFcd5?=
 =?us-ascii?Q?BaZf+r/q0CAYfjfuG9nP8fM6PiktDm/lODPEtbsWsMCTk5AVAofCZs+sOcXy?=
 =?us-ascii?Q?7MFCGzlrHW8Lc1OXh0lgZZAL8DAQgFtYE5+Hzfx5tScMylqCg7JzLM9NkHAh?=
 =?us-ascii?Q?Uo+l1NG8rmwS6Uq4MiwoRCnzSqvTXTKs7RSykfjL139HjXfhaA9LurqN5E1I?=
 =?us-ascii?Q?tGydORPk2VQgceWhJjAIn4BjCWNWf8PhNl5DKOdosFp+1BtqediksEAB7zni?=
 =?us-ascii?Q?BJfWgJL7PJ5PJL6BM8wTIAcrCYtAJbqfYgOhadXReouQe+y3DbKHzB1MBpt3?=
 =?us-ascii?Q?KvJFR+dFxtEM5fmqJMe5if5N9l6jiA0RRDsaG/ouwdQwgpylIKHiGIF0iHG7?=
 =?us-ascii?Q?oe2qHrwBzKJ9WM9oKcnIMXTp9dWH1ikri8tNylfjMKWa7sYhBU6izh6spiWB?=
 =?us-ascii?Q?q5djFk5S7htZfMfZ6h5YCcHtiOmmei/je8zCkfiQKoZOYNCr9NaOcsECKUC7?=
 =?us-ascii?Q?TB2Pi+rG+PYyk/7fotzsY7ivhlO5GO0+1Hm1jBl5PaVIbKcmfnJFSD/rj0uf?=
 =?us-ascii?Q?UCoczMbYWunvJzWdioqFkJje6NeXyyRwaUhZTlDdtsh/FX7e8uxNOiliPaMN?=
 =?us-ascii?Q?7xIflJWwhm/RN/cESRAutqgg55ssdFFxqb0hLdwYIAURusjMnoD68m6fyhfO?=
 =?us-ascii?Q?xh9PSjXVK9PW+DLIh+KwyIjb?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 01ac71dd-7c7a-45ce-6914-08d8d9801d13
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB3736.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Feb 2021 11:25:54.2216
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: oZGsYZQ+wGeA+xW40oXLUXJ3UD47zCc/VKVaAjGeUw4jgJivo8ts2LD8VvePDL99zOUplahwQZ8c8Nfs7BfN7BmN6sL4SwSk1JAG4s8tdoM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR11MB3143
Content-Type: text/plain

In many scenarios the receipt of an EOF will coincide with the
teardown of the file which the FD is associated with by the
application on the other side of the file pipe. If a timeout (-t) is
used socat continues to poll for new data (read) and send any new data
(write) until the timeout. This can lead to input/output errors as the
FD exists still but the file it was openned on is gone, and no check
is done on writes.

To get around this a check is added after the EOF is received that the
file still exists, and if not we proceed to exit immediately. This
will avoid i/o errors and will also cause a quicker return as we don't
have to wait for the timeout.

The original author is Mark Asselstine <asselsm@gmail.com>.

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 ...le-associated-with-an-FD-is-destroye.patch | 62 +++++++++++++++++++
 .../socat/socat_1.7.4.1.bb                    |  1 +
 2 files changed, 63 insertions(+)
 create mode 100644 meta/recipes-connectivity/socat/files/Exit-when-the-file-associated-with-an-FD-is-destroye.patch

diff --git a/meta/recipes-connectivity/socat/files/Exit-when-the-file-associated-with-an-FD-is-destroye.patch b/meta/recipes-connectivity/socat/files/Exit-when-the-file-associated-with-an-FD-is-destroye.patch
new file mode 100644
index 00000000000..b5ac62f6169
--- /dev/null
+++ b/meta/recipes-connectivity/socat/files/Exit-when-the-file-associated-with-an-FD-is-destroye.patch
@@ -0,0 +1,62 @@
+From 956d4b00a101f61b4cfaafa0856b646646536492 Mon Sep 17 00:00:00 2001
+From: Mark Asselstine <asselsm@gmail.com>
+Date: Mon, 7 Dec 2015 21:27:35 -0500
+Subject: [PATCH] Exit when the file associated with an FD is destroyed
+
+In many scenarios the receipt of an EOF will coincide with the
+teardown of the file which the FD is associated with by the
+application on the other side of the file pipe. If a timeout (-t) is
+used socat continues to poll for new data (read) and send any new data
+(write) until the timeout. This can lead to input/output errors as the
+FD exists still but the file it was openned on is gone, and no check
+is done on writes.
+
+To get around this a check is added after the EOF is received that the
+file still exists, and if not we proceed to exit immediately. This
+will avoid i/o errors and will also cause a quicker return as we don't
+have to wait for the timeout.
+
+Signed-off-by: Mark Asselstine <asselsm@gmail.com>
+
+Upstream-Status: Submitted [socat@dest-unreach.org]
+
+Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
+
+---
+ socat.c | 9 +++++++++
+ 1 file changed, 9 insertions(+)
+
+diff --git a/socat.c b/socat.c
+index b619a3d..de4a14b 100644
+--- a/socat.c
++++ b/socat.c
+@@ -773,6 +773,7 @@ int _socat(void) {
+    int polling = 0;	/* handling ignoreeof */
+    int wasaction = 1;	/* last poll was active, do NOT sleep before next */
+    struct timeval total_timeout;	/* the actual total timeout timer */
++   struct stat file_stat;
+ 
+ #if WITH_FILAN
+    if (socat_opts.debug) {
+@@ -1123,6 +1124,10 @@ int _socat(void) {
+ 	    xioshutdown(sock2, SHUT_WR);
+ 	    XIO_RDSTREAM(sock1)->eof = 3;
+ 	    XIO_RDSTREAM(sock1)->ignoreeof = false;
++	    if (fstat(XIO_GETRDFD(sock1), &file_stat) == -1 || file_stat.st_nlink == 0) {
++	       Notice1("socket 1 (fd %d) is gone", XIO_GETRDFD(sock1));
++	       break;
++	    }
+ 	 }
+       } else if (polling && XIO_RDSTREAM(sock1)->ignoreeof) {
+ 	 polling = 0;
+@@ -1146,6 +1151,10 @@ int _socat(void) {
+ 	    xioshutdown(sock1, SHUT_WR);
+ 	    XIO_RDSTREAM(sock2)->eof = 3;
+ 	    XIO_RDSTREAM(sock2)->ignoreeof = false;
++	    if (fstat(XIO_GETRDFD(sock2), &file_stat) == -1 || file_stat.st_nlink == 0) {
++	       Notice1("socket 2 (fd %d) is gone", XIO_GETRDFD(sock2));
++	       break;
++	    }
+ 	 }
+       } else if (polling && XIO_RDSTREAM(sock2)->ignoreeof) {
+ 	 polling = 0;
diff --git a/meta/recipes-connectivity/socat/socat_1.7.4.1.bb b/meta/recipes-connectivity/socat/socat_1.7.4.1.bb
index 5a13af91bc5..82b66aed927 100644
--- a/meta/recipes-connectivity/socat/socat_1.7.4.1.bb
+++ b/meta/recipes-connectivity/socat/socat_1.7.4.1.bb
@@ -10,6 +10,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
                     file://README;beginline=257;endline=287;md5=82520b052f322ac2b5b3dfdc7c7eea86"
 
 SRC_URI = "http://www.dest-unreach.org/socat/download/socat-${PV}.tar.bz2 \
+           file://Exit-when-the-file-associated-with-an-FD-is-destroye.patch \
 "
 
 SRC_URI[md5sum] = "36cad050ecf4981ab044c3fbd75c643f"
-- 
2.17.1

