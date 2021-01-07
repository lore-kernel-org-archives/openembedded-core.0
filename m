Received: from IND01-MA1-obe.outbound.protection.outlook.com (IND01-MA1-obe.outbound.protection.outlook.com [40.107.138.81])
 by mx.groups.io with SMTP id smtpd.web08.6285.1610014318156753246
 for <Openembedded-core@lists.openembedded.org>;
 Thu, 07 Jan 2021 02:11:58 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kpit.com header.s=selector1 header.b=gMRqbMKx;
 spf=pass (domain: kpit.com, ip: 40.107.138.81, mailfrom: sana.kazi@kpit.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WEi8w5iUJb0mY+jWCbGSfzUFWK+3BJUAaHyCHGP6XtGfqC4xvHBYauebnAy1rsvv/q6g6rHBHgff8fkG181031q/2hZzZ5bWnM4UXrQJq3tAXmxZDSGu4nYBVQu5Y3U57UU6x9iqLe0iOHf0+ps0UoyvjreqCCDi874y2qBIXBHLGcsXs4zdAWpGJ25xPX2H/pV8QHRT9FLMrEMMSQJtygG4lBedubPNgWAfIyUXjhSgGE/lweW/BexeyRwuNhv6VAjVe7WIUpfUUzWW9/6nTtAaQXywId5H5tRsAaHWWnr19ONy3E8BWnrcJz0q8rfUW85P0hMcGlZ5MsEV7axA/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=stXCDk4DQgo6UoSDLIMRZD/pboUlRdR0YIZPysmrm3o=;
 b=TIEbb5VYVIyDsIhot6K1UesjgiX9VeERrpZFQnfH1CNNWsz9VUHUk5updjzr//J+sScOcRpl5adA8VE4peJXZ0sg/NmGnuRQoVbFJ938snFiOmzyBuXL/ivXOrSLUnJSV+W2dNg+kqi3wZpP30SIdw60JAGNDQ1ew3w4sGFHWzjTlVfj/ZyPU1mxW5Hbxj13WCBmg0+/9gvTjBr4+1WEQFRDR9tIogIdp6wm1Kz7cDY1QyZuZwkaVUjT3kG/zTl+w/WynOEef4Cc7uNbfSgI+/eNrce8mRBnB9/hbFH3RrCQTptr3l2NnHxKuLucLQHCJrq4Ra5ef2BHon+tpOPOdg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=kpit.com; dmarc=pass action=none header.from=kpit.com;
 dkim=pass header.d=kpit.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kpit.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=stXCDk4DQgo6UoSDLIMRZD/pboUlRdR0YIZPysmrm3o=;
 b=gMRqbMKxtHOVf/Qlphb/8baaSGrqW6Yhb3S0wGunLncR/RfiptvKq43j+vKGFZl71n7QGIJLOvw3WsFXewTSOprNHwFr+mSowWS2RHL6fxCewtmJsOE1+zAHzm/2XOieY6dtIQpIgJe7qpK1RisoaIGqwjYp9bcnCDQLl8J3GxQ=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=kpit.com;
Received: from MA1PR01MB3228.INDPRD01.PROD.OUTLOOK.COM (2603:1096:a00:79::22)
 by MAXPR0101MB1483.INDPRD01.PROD.OUTLOOK.COM (2603:1096:a00:19::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3742.6; Thu, 7 Jan
 2021 10:11:54 +0000
Received: from MA1PR01MB3228.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::c0c3:d811:3987:df57]) by MA1PR01MB3228.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::c0c3:d811:3987:df57%5]) with mapi id 15.20.3742.006; Thu, 7 Jan 2021
 10:11:54 +0000
From: "Sana Kazi" <Sana.Kazi@kpit.com>
To: Openembedded-core@lists.openembedded.org,
	raj.khem@gmail.com
Cc: nisha.parrakat@kpit.com,
	Aditya.Tayade@kpit.com,
	Harpritkaur.Bhandari@kpit.com
Subject: [poky][sumo][PATCH 4/4] libsndfile1: fix CVE-2019-3832
Date: Thu,  7 Jan 2021 15:41:01 +0530
Message-Id: <20210107101101.31004-1-sanak@kpit.com>
X-Mailer: git-send-email 2.17.1
X-Originating-IP: [2401:4900:5194:2007:f9cf:4c7f:ce96:878]
X-ClientProxiedBy: BM1PR0101CA0020.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:b00:18::30) To MA1PR01MB3228.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a00:79::22)
Return-Path: sanak@kpit.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (2401:4900:5194:2007:f9cf:4c7f:ce96:878) by BM1PR0101CA0020.INDPRD01.PROD.OUTLOOK.COM (2603:1096:b00:18::30) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3742.6 via Frontend Transport; Thu, 7 Jan 2021 10:11:53 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: bd9eb25d-8622-46ea-804d-08d8b2f4a8ac
X-MS-TrafficTypeDiagnostic: MAXPR0101MB1483:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<MAXPR0101MB14833B4DA95D896FB568B2DE99AF0@MAXPR0101MB1483.INDPRD01.PROD.OUTLOOK.COM>
X-MS-Oob-TLC-OOBClassifiers: OLM:862;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	iIQv1yRphkAeeKzPj1v6rzPXyY5/cLodplJxktHZd16m5Lv06b/+lMG0fn9z70y7+hrA6Awr+spUyrfmDD35zX8Qrk8CBQQVZb9QeQj7pxg4mCB/dAzDMEzl576cLV1PujA9OrlT5IKVwMDzvMYRtOBHPAXfjmGj0e22dbtU5qR4o+A6yOL4YbljCYorEwyYEfD2FFNXu6lfKDbj6Frbqv3jcqOEnUb4Ejh6CizdDHBVdm9FE+dbQ54BJhcjtDa8BaMcDHsRSBmib2MHIVMLfO+ty659EMhLctv3Hva17PXAntY3T3WGEe83xID78Z0MTZ1Bu2ZXAxPM34J9fUiSFJAy8afttYJ7Gyf7BLcipvSbDbmA15tEPfy7rGuS8YpnmUOggWyXrxHvp4EtDX77NlKkxVgekWKOTe2K9I0/OrbEPlBP/Oq96w5/EYKMrUlx8Zng1vta6lxzfxMdU2BCiX5xYoBiSqVJqZvD1QY6dRRlRA1oo2CG3pKAZ432ByJvV2rjxYh4a2jzOvReeVW4sQ==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MA1PR01MB3228.INDPRD01.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(4636009)(366004)(39850400004)(136003)(396003)(376002)(346002)(52116002)(6666004)(66574015)(5660300002)(36756003)(2906002)(6486002)(316002)(6512007)(4326008)(66476007)(83380400001)(186003)(16526019)(66556008)(66946007)(8676002)(478600001)(107886003)(1076003)(8936002)(69590400011)(2616005)(6506007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?us-ascii?Q?PDjUILVvysLqE/i9WbInL6rriePzkPs9Hxvr8ENAsMysg11wA44VMhwWOunA?=
 =?us-ascii?Q?8m9s5CGwWLZBIL9ZfQm7SGNl+MrA/KJOZpgbANDtHf+a6GZ4Zr89aYzmGKz2?=
 =?us-ascii?Q?s/E0vrVaDxqB6jHM/eSn9knooBIthc2O5xUAg2EXI+wBejfTvcYj0m1YRtwk?=
 =?us-ascii?Q?Hpu+bUJD1qkuGWZywQ9A2QF/xQgqOVBhCDZLCnkVY0frIjGIzfGCf31QvERF?=
 =?us-ascii?Q?SZjqgpBdHShXPP79wQi/3Fb3CAaXHbuNkgeo3XRznyvG4maC/8HeZ6opU+u9?=
 =?us-ascii?Q?PObg6MN9F6eGEyW4BayF5k5xRw3VDChse2od/hPODb2TmsHU9IQ6khL/C0QB?=
 =?us-ascii?Q?ILVvAaM/gXIYEWspMCDaZpwBkgopUX05YEwOMxIn6GRs2a0WAMJoTW663JnA?=
 =?us-ascii?Q?ooWCMwGWRCMoNPZtYU+KMv0vro8/WtnQlvO9WjMjNbEvznhKbZjhcSZrRAYT?=
 =?us-ascii?Q?nKvxR/ItDdtJEJgH7Q2KoHBqaAgIgXiSM8LrGJNe41L5xYJ8vtyGnnYV7oXO?=
 =?us-ascii?Q?mOMGIcjUjvw4ry/77zLEEb0Lc/3ozvWhv85b+UR0O46tP9cQewgLUoXAYYok?=
 =?us-ascii?Q?ak7lbNT/W/6sfcVeICxbVGoZJVlQW3PDDZrjlLRcESePe5Y0oRbTangqslWs?=
 =?us-ascii?Q?Z/YAr60opRCCoacZMRhjbK8/LkStv0wBe0ew84mTxX8Xfjj+axY2G73Ho08m?=
 =?us-ascii?Q?eGcCb29avpPZz/CchB9roX2WF5rULjFRQau/CTN76wYme5ITcY9U64bockn2?=
 =?us-ascii?Q?wVGgiSWlfDADfS8XiQcUlI3K4xTwP5AiNyi/s7MhI65wKPn1Lp0XvZd/gqeg?=
 =?us-ascii?Q?LFmemE0XorhlVd7ue7DiNpuCPZ9OOcbKGnZAGVNrzGyuKpE7ypLuswoiGDjf?=
 =?us-ascii?Q?8lOo3UcSn6/tRHssILDdKy6wGNcPGj4muuocVWIHGfw29bxZSTGJWtGDRNDb?=
 =?us-ascii?Q?Vr0xBx3M1nUVK1nFdeqA/9KvYK4nzzUSAwixEDx91G4jwtX/cguURmwfANfb?=
 =?us-ascii?Q?oGleZnSHOx6HgieIyJ+SswO967rQwuj2/IWZvr426uQrNSgKLwkNhng3qm1E?=
 =?us-ascii?Q?vc+i3Ril?=
X-OriginatorOrg: kpit.com
X-MS-Exchange-CrossTenant-AuthSource: MA1PR01MB3228.INDPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jan 2021 10:11:54.2538
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3539451e-b46e-4a26-a242-ff61502855c7
X-MS-Exchange-CrossTenant-Network-Message-Id: bd9eb25d-8622-46ea-804d-08d8b2f4a8ac
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: H1TQBAH7N1TvcXyAOJbiE+DAj+tgiORNq40XgvM1TGbNCfNbWZq08cmqScO4wu1v
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MAXPR0101MB1483
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

From: Ross Burton <ross.burton@intel.com>

The previous fix for CVE-2018-19758 wasn't complete, so backport another pa=
tch
to solve it properly.

(From OE-Core rev: aeaca9bb1b1c8bf44818945dc4b2cbd6d4b5cef2)

Signed-off-by: Ross Burton <ross.burton@intel.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Sana Kazi <Sana.Kazi@kpit.com>
---
 .../libsndfile1/CVE-2019-3832.patch           | 37 +++++++++++++++++++
 .../libsndfile/libsndfile1_1.0.28.bb          |  5 +++
 2 files changed, 42 insertions(+)
 create mode 100644 meta/recipes-multimedia/libsndfile/libsndfile1/CVE-2019=
-3832.patch

diff --git a/meta/recipes-multimedia/libsndfile/libsndfile1/CVE-2019-3832.p=
atch b/meta/recipes-multimedia/libsndfile/libsndfile1/CVE-2019-3832.patch
new file mode 100644
index 0000000000..ab37211399
--- /dev/null
+++ b/meta/recipes-multimedia/libsndfile/libsndfile1/CVE-2019-3832.patch
@@ -0,0 +1,37 @@
+From 43886efc408c21e1e329086ef70c88860310f25b Mon Sep 17 00:00:00 2001
+From: Emilio Pozuelo Monfort <pochu27@gmail.com>
+Date: Tue, 5 Mar 2019 11:27:17 +0100
+Subject: [PATCH] wav_write_header: don't read past the array end
+
+CVE-2018-19758 wasn't entirely fixed in the fix, so fix it harder.
+
+CVE: CVE-2019-3832
+Upstream-Status: Backport [7408c4c788ce047d4e652b60a04e7796bcd7267e]
+Signed-off-by: Ross Burton <ross.burton@intel.com>
+
+If loop_count is bigger than the array, truncate it to the array
+length (and not to 32k).
+
+CVE-2019-3832
+
+---
+ src/wav.c | 6 ++++--
+ 1 file changed, 4 insertions(+), 2 deletions(-)
+
+diff --git a/src/wav.c b/src/wav.c
+index daae3cc..8851549 100644
+--- a/src/wav.c
++++ b/src/wav.c
+@@ -1094,8 +1094,10 @@ wav_write_header (SF_PRIVATE *psf, int calc_length)
+               psf_binheader_writef (psf, "44", 0, 0) ; /* SMTPE format */
+               psf_binheader_writef (psf, "44", psf->instrument->loop_coun=
t, 0) ;
+
+-              /* Loop count is signed 16 bit number so we limit it range =
to something sensible. */
+-              psf->instrument->loop_count &=3D 0x7fff ;
++              /* Make sure we don't read past the loops array end. */
++              if (psf->instrument->loop_count > ARRAY_LEN (psf->instrumen=
t->loops))
++                      psf->instrument->loop_count =3D ARRAY_LEN (psf->ins=
trument->loops) ;
++
+               for (tmp =3D 0 ; tmp < psf->instrument->loop_count ; tmp++)
+               {       int type ;
+
diff --git a/meta/recipes-multimedia/libsndfile/libsndfile1_1.0.28.bb b/met=
a/recipes-multimedia/libsndfile/libsndfile1_1.0.28.bb
index b28f675286..e52105fa2b 100644
--- a/meta/recipes-multimedia/libsndfile/libsndfile1_1.0.28.bb
+++ b/meta/recipes-multimedia/libsndfile/libsndfile1_1.0.28.bb
@@ -13,6 +13,11 @@ SRC_URI =3D "http://www.mega-nerd.com/libsndfile/files/l=
ibsndfile-${PV}.tar.gz \
            file://CVE-2017-14245-14246.patch \
            file://CVE-2017-14634.patch \
            file://CVE-2018-13139.patch \
+           file://0001-a-ulaw-fix-multiple-buffer-overflows-432.patch \
+           file://CVE-2018-19432.patch \
+           file://CVE-2017-12562.patch \
+           file://CVE-2018-19758.patch \
+           file://CVE-2019-3832.patch \
           "

 SRC_URI[md5sum] =3D "646b5f98ce89ac60cdb060fcd398247c"
--
2.17.1

This message contains information that may be privileged or confidential an=
d is the property of the KPIT Technologies Ltd. It is intended only for the=
 person to whom it is addressed. If you are not the intended recipient, you=
 are not authorized to read, print, retain copy, disseminate, distribute, o=
r use this message or any part thereof. If you receive this message in erro=
r, please notify the sender immediately and delete all copies of this messa=
ge. KPIT Technologies Ltd. does not accept any liability for virus infected=
 mails.
