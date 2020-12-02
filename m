Received: from NAM02-BL2-obe.outbound.protection.outlook.com (NAM02-BL2-obe.outbound.protection.outlook.com [])
 by mx.groups.io with SMTP id smtpd.web12.1574.1606875723955470272
 for <openembedded-core@lists.openembedded.org>;
 Tue, 01 Dec 2020 18:22:05 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=jPl94KVe;
 spf=softfail (domain: windriver.com, ip: <nil>, mailfrom: kai.kang@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=i2dkQxyUB4Lriwvfztcbt0ZmwtS+UKY22qrpBjGX/haJVcDWyot3VKAx2qizZagNO8Rqj6MfMvn1kN3IAYvD0PMBrsqB8a2xNrTJmKGtQ4cO24mAZiosLjbrc726EhFbftgNM/tPaqRS3uepwnLvLOHccSlBjyqMt7Sq9mcU1InUYHwcslym+35DDMUXPDoJffpce5jhXoosxvAqG5F245LyYz5eVoCDztDd5ejxccz5mzxrZgI+l0ne4uusNgQ/sE2S321e1Nm/9LjpmgyT93mOkdEbLEmCvfpHUzJD+R14Ck8trXDDEp0k3UK7ZIM1Jg753a0+pQaXvZJP6ocb3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GuGTZTVUewJabTh0YHCxKB/KEYHkqgZZgP1qxeJ3VFc=;
 b=DTOTwJk3i9JhV7srUJ7SnADiR9JDnxGe931Yrm8vShxDtYn/uD8n+u/0Z9TwSAeUAjpjGwqYHXSR+ICzP7B1L4StEdv4+s60WIrhRg/BvV8H5cIeW3uB6attT6UlAny9s8Tb6m3x0cvsEssXvNoq48awUrNjkM0NDf+6ryuPaUHJda1T3N2ROe/x3Hu4q2Vk07J17kYWywN9BjcrZr19B+eQBUdhwiOWK9jDoZtGggf1eQZ6CHPseh36wB9eEeDSfNg2qqwbYNa9sGgVMSRAX3IFnQgca5qk3z6NIxfIeRzGhG8dEEFRi2a6OnOsIQN5CSWnMsygMP+EK5pPimYlLQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GuGTZTVUewJabTh0YHCxKB/KEYHkqgZZgP1qxeJ3VFc=;
 b=jPl94KVeOW89z6zgPVVb3VlpO0TMqLIqxtO41Gt+Xv5j2wz2Eg4ggiDoY8JGXR90GZhYY6GDbdlDPUXufL5ir0Tg7drVcnFNfoLMeH95NrP6Wi2X/UMfngc/pXexnUwp7XlCihSPfFGajkyF1MX68P+094mIYFAkhUZYysh74vA=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from SN6PR11MB3294.namprd11.prod.outlook.com (2603:10b6:805:c4::33)
 by SN6PR11MB2573.namprd11.prod.outlook.com (2603:10b6:805:53::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3632.17; Wed, 2 Dec
 2020 02:22:04 +0000
Received: from SN6PR11MB3294.namprd11.prod.outlook.com
 ([fe80::b4b5:fc79:127b:66f4]) by SN6PR11MB3294.namprd11.prod.outlook.com
 ([fe80::b4b5:fc79:127b:66f4%6]) with mapi id 15.20.3611.032; Wed, 2 Dec 2020
 02:22:04 +0000
From: "kai" <kai.kang@windriver.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH v3 2/2] systemd.bbclass: update command to check systemctl available
Date: Wed,  2 Dec 2020 10:21:45 +0800
Message-Id: <20201202022145.31476-3-kai.kang@windriver.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20201202022145.31476-1-kai.kang@windriver.com>
References: <20201202022145.31476-1-kai.kang@windriver.com>
X-Originating-IP: [60.247.85.82]
X-ClientProxiedBy: HK2PR02CA0184.apcprd02.prod.outlook.com
 (2603:1096:201:21::20) To SN6PR11MB3294.namprd11.prod.outlook.com
 (2603:10b6:805:c4::33)
Return-Path: kai.kang@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from pek-lpg-core3.wrs.com (60.247.85.82) by HK2PR02CA0184.apcprd02.prod.outlook.com (2603:1096:201:21::20) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3632.17 via Frontend Transport; Wed, 2 Dec 2020 02:22:03 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 945f2f98-0e44-4172-8c8d-08d896690f0d
X-MS-TrafficTypeDiagnostic: SN6PR11MB2573:
X-Microsoft-Antispam-PRVS: 
	<SN6PR11MB25739D55FF959B80880093D795F30@SN6PR11MB2573.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5516;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	M9ykWIJdo/r3zZhNQyBkrdZIjGeOvzGzJhA8c9xVd0XNTIXRCUz4BDOA8yeL280nzBC4wS5/HRRdzUrpFKWhw2nuP5MwHxgqKb2G0u+hqBEgWsbWEazzAtTkDvm9tEnL5pp3u5mKO5mWN5jhUAbxG5we9xi06Dhe/u/31yv4K1tgwyM/I71GbSRy/blC3OcBNJBycyGvfkuo8M5v/+miXqP0NCX5UxGH1ekq47oIuMQKEY8gZiJb+yitY1jTkevLZrtWfaaZICHSfJPPAY839Ht1K0bcMhOpwFbnhOWz5rv6rwlu7WjadKurnJX/amo6xAKfZWoW4HuGUJXVeRrlZw==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN6PR11MB3294.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(136003)(366004)(39850400004)(376002)(396003)(6486002)(8676002)(2906002)(316002)(6666004)(8936002)(52116002)(1076003)(5660300002)(6506007)(6916009)(83380400001)(6512007)(9686003)(478600001)(956004)(86362001)(2616005)(66946007)(66556008)(66476007)(36756003)(16526019)(186003)(26005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?us-ascii?Q?LIiadbh1d8bVua7wScazXNt5Uhdod97LbI2UEN6lfAZnzlTU6wESNssNG/E+?=
 =?us-ascii?Q?oYZHD/mlo3YJt/lvW/WGybM6K2Xg7mxD1dgWFaNllKJl7vBKc8hlHuSfp2aC?=
 =?us-ascii?Q?1N6wXQ67c1uRK304/lJ6b26/cManzPpYJamzyttOFbbqzABV2KpEfRKdnb+H?=
 =?us-ascii?Q?5hOr2uAIchmKzOkdyi5qvwgcYDmHarOR4Hm9SusUxdnwiFny6FCNY6SR9FPq?=
 =?us-ascii?Q?U7yqT2GR0cXUmFTSu+t5ULo5xzQ5CaSTWwV+go/2lR0qjCqote8ahYQFHlLS?=
 =?us-ascii?Q?7uCUK+mhCbjRHbCFfqfvIXiLwF7y76hmK7MTQun2MKIh24qSDVOOrSI0MXwX?=
 =?us-ascii?Q?kCSmNb4NFtTOtAAKMIfliZLew60aH+bYYjSuLc4nKZFz/XwEb7aPL/xpc4ax?=
 =?us-ascii?Q?JzY5TqetXnK9nTluQAlQMiAIOeJ7dO/Zc9RDTapRvB/NvY7DGXmbkh1ssCk0?=
 =?us-ascii?Q?zrN2jDcAhConONuetKzxXbK92M5X524iuZcAJ/6ItWJrrnwSD5gFRB7StJKu?=
 =?us-ascii?Q?CoaKSdEkekJyN9qLkcM6oF+aDf2Bo5xkC9vlhUi16VDQuytX9/msdRR45x96?=
 =?us-ascii?Q?GzEtMC6zNF8PEdILUi/3puz0/antW5aJoQI013uAvtwYBMxwXI4EnAPcjgem?=
 =?us-ascii?Q?GkeZsWiYDHSK3b9AnqgYalslaS2QxzNMsybpq9oYYgNH/A8pXu2RMSt0wwDR?=
 =?us-ascii?Q?jcJnseDVT6LBMehVAGFlONgyCf1YS1F19KsGA9qAX4Nk6aJGNmHei8nT2HWu?=
 =?us-ascii?Q?s/SFx1LBQEi8OPoAPNBUP/exli7h9LA+M7m4gO5vQpTHJ5rV0EgIcb4pooNI?=
 =?us-ascii?Q?/r8Z4NTz56lMgeQAIHjuKwe6j8jNGzUeXCTtaMysTJWIySfi0YpKBcdZbuGq?=
 =?us-ascii?Q?v0zgv0KdTyHI/XdVWsviGCbFje6c8txAWRgDgJuYyUfgtoSUnjN0EH6R9y5d?=
 =?us-ascii?Q?yqAVqrFC9VxTY0iSJlcL4zEha4OcPa8dNJOe+uMcGXM=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 945f2f98-0e44-4172-8c8d-08d896690f0d
X-MS-Exchange-CrossTenant-AuthSource: SN6PR11MB3294.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Dec 2020 02:22:04.4501
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jw/Ed76RHRclSX08v/9A6qeyy6FhXznNbcvvky/ySHV7cdtDmndXmi2K+K5i/kkEoG/pYBQSVQ73wmlXcqWlvw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR11MB2573
Content-Type: text/plain

From: Kai Kang <kai.kang@windriver.com>

When use a core image with systemd as docker image, it fails to
install/remove package which calls systemctl in post scripts.
It fails to run systemctl in a container:

bash-5.0# systemctl
System has not been booted with systemd as init system (PID 1). Can't operate.
Failed to connect to bus: Host is down

So replace the criterion command 'type systemctl' with 'systemctl' in
package post scripts to check whether systemctl available.

Signed-off-by: Kai Kang <kai.kang@windriver.com>
---
 meta/classes/systemd.bbclass | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/classes/systemd.bbclass b/meta/classes/systemd.bbclass
index 9e8a82c9f1..9ec465c759 100644
--- a/meta/classes/systemd.bbclass
+++ b/meta/classes/systemd.bbclass
@@ -23,7 +23,7 @@ python __anonymous() {
 }
 
 systemd_postinst() {
-if type systemctl >/dev/null 2>/dev/null; then
+if systemctl >/dev/null 2>/dev/null; then
 	OPTS=""
 
 	if [ -n "$D" ]; then
@@ -48,7 +48,7 @@ fi
 }
 
 systemd_prerm() {
-if type systemctl >/dev/null 2>/dev/null; then
+if systemctl >/dev/null 2>/dev/null; then
 	if [ -z "$D" ]; then
 		systemctl stop ${SYSTEMD_SERVICE_ESCAPED}
 
-- 
2.17.1

