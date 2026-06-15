Return-Path: <anders.heimer@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4565ECD98C7
	for <webhook@archiver.kernel.org>; Mon, 15 Jun 2026 11:14:14 +0000 (UTC)
Received: from MRWPR03CU001.outbound.protection.outlook.com (MRWPR03CU001.outbound.protection.outlook.com [40.107.130.33])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.127225.1781522047034917484
 for <openembedded-core@lists.openembedded.org>;
 Mon, 15 Jun 2026 04:14:07 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=DD7x42M+;
 spf=pass (domain: est.tech, ip: 40.107.130.33, mailfrom: anders.heimer@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=acxHFIyLFBCmv5Xcf3bpCvpmD671Ibt5jLHVcb7Wi3Fgw/Lr9zLrQrSHDn2qpKHG2D8MA9durbihu55Dl6O+YsgOzPbYhAy3mjEEreYhiQoKwGlvspHZZ7RPG3PUdxyd12xYxn/mN8Ghq6pKG2vY7pATiWDyA7cJG9IpFVcgrogNOXtFEn2j6duPMI10FYFyT/5fEBPqCxrNDKAJaCH4nhEDVRsFHry6cJZoZYGBkRHpGkjlZYeIbrdpILGPxDrAaqgh+riS3fBMQhPG84wK9YfpWo7Dsv+cGveeWbEY5WiFCL5CC/tGEjHhmpI5/j5WndmfOHkH0uyTNDwC0Ubdog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=m/mHWwNaYDXBlp7hWUHUL7b1s/CvHrV1NClYy4EPxNc=;
 b=sjySRTQax0ZVGzzot9RLkxyjx7NvwDuGydblOBW73xkWzoBAhKpk9zrVqtx7RjZF1ePHlZXUk/ulGOJdPKkObfVIUUvEcLTMNrpTmCRr3o08bQjqZULJ2heSlV7izHJnqgbOvudtB+PNPsRgrOrZ05e3USWnS1i/hMixqbtM1/GpcCeQ+ZGCDO7KDBjWMie3tWHCLAK70k/EPsH9SrTGZw2bJVRztoOALXWmTPCTxzwRPRNLaV050N12nIBygrrS41US5Egj+cUKasSmK170XSvk4PtS0r6YGF/Y9ZoWkmrgN0ns93XJpjyCQjpY3hBqme8bd5YQuUe1f8aRBCcfTw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=m/mHWwNaYDXBlp7hWUHUL7b1s/CvHrV1NClYy4EPxNc=;
 b=DD7x42M+8Jzy19pHjgtpu/YvR8/QIFLRDxvyOZTJOo8g7/IW/m8TXaK5y5zLV0yhQkUkwG4jQed1vi3PyC8vGmDobmqFu5xrGv+gPyZB5k3rqwG/044tSIXSRwf4HXMeCNHdBX9AD84fmt2y3GMHxtem/EbhYFJ02fbIUpGfKZN0HKzXwfxCCtwma5HHnftK5fUHS9mf2bWvn5Da3/bmZabptSycRp2ImapjCfoVeJ7oMIAN+g+1o/dHpecY4RCgQGnCy2HnvMKqiXRsIL9qkfzqL4fjd8LOUiV69T4+R0l2MCKsqaMwAiSFEuXpKa/++bfmsDHIMROLA6/I3iEx3w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from DB9P189MB1641.EURP189.PROD.OUTLOOK.COM (2603:10a6:10:2ac::9) by
 FRWP189MB3253.EURP189.PROD.OUTLOOK.COM (2603:10a6:d10:17d::14) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.113.18; Mon, 15 Jun 2026 11:14:03 +0000
Received: from DB9P189MB1641.EURP189.PROD.OUTLOOK.COM
 ([fe80::90da:b700:f102:5c82]) by DB9P189MB1641.EURP189.PROD.OUTLOOK.COM
 ([fe80::90da:b700:f102:5c82%6]) with mapi id 15.21.0113.015; Mon, 15 Jun 2026
 11:14:03 +0000
From: Anders Heimer <anders.heimer@est.tech>
To: openembedded-core@lists.openembedded.org
CC: Anders Heimer <anders.heimer@est.tech>
Subject: [PATCH] archiver: fix .pc tar exclude pattern
Date: Mon, 15 Jun 2026 13:14:00 +0200
Message-ID: <20260615111400.1387263-1-anders.heimer@est.tech>
X-Mailer: git-send-email 2.43.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: DB9PR02CA0004.eurprd02.prod.outlook.com
 (2603:10a6:10:1d9::9) To DB9P189MB1641.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:10:2ac::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB9P189MB1641:EE_|FRWP189MB3253:EE_
X-MS-Office365-Filtering-Correlation-Id: 456a190a-f50c-40af-7e35-08decacf3500
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|376014|1800799024|23010399003|56012099006|11063799006|18002099003;
X-Microsoft-Antispam-Message-Info: 
	QxgR7ouv5M+F67vIDQaWzagnXqRt8k4Qx8TGOeYyLaAf+XeQM9C3c/qhzySaAovtnOTlxf1deEt5/wzglVIe5FjpYokkm5RZDmdWCBuMEtUsH3RoznQrWLU5+OYdLsDEiJukcLcRtCMl/r1yA5R1gIW7QhxXScJqGzf+Y6GBK0Q3qODNRghIpEj30/DoLLhE9Jd8GhQEQ2WZzzAvLna5gDJM7+O6DEPoB4f2dUXTIapdkuzBxmltXR1hhWimPhlrThWQsNC978mnPaunJnvTGuwsOg763bQ/HGVaRJQd9xYNCfkFkw/OC+RF+ChQmP72NXWOcB431IkN9zK86HVFZtfaJsKhRVD9wH21C8SY8b93di2W51CydLrv6ucIKSHpoP9qFiozPhoNkgWpm1wjjb/5AqnZdmCQ99tzTEl3oh6kfX6+Y7m2drijbhvRmDxsSKzDNU23iJBOSmc6bFAipOg32fKW3KbYbegAkxu3JrMBOSbM/+lwZi/yCOKKyBbn0fPFaFcJiPE1MjDF8fopM32bWd3imw0TId5j/gPOT+Vf2FrDA0k/KPQsUzZenxqtDIXkjUnWzZEgGHXTyrhfyrN86B8kfWCWUfAE+sVqzeVua1KeMqJt6Q36sJqcVsZj4jQJLSnDwqOxcQ/SAA8zz+LnS26f2pGN3nidRv4TqWMS8zf0c5VdYn3adsUw8WPp
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9P189MB1641.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(23010399003)(56012099006)(11063799006)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?n6rfnnr6B3DJ8AEJFKRQcvMzp/KzO+VpQGjytTSqvxWl05W9twx/H9iLp7YQ?=
 =?us-ascii?Q?r0dIs5nKW5aeK2ViBCoiOy6kXLXhLEn0Z8Y0j3ErOo/nnDObOkeHV3MN4DH+?=
 =?us-ascii?Q?59MpePIowIaM/FTodDy+U+FWR1jjzJ5x45Edd5gnacbgsZ1aCT7ORMQb/RPB?=
 =?us-ascii?Q?ILkBAM5V5lWGOInI5y65J9XmmdpW8Z/7ckJF0PIRi0b/e90ElDejqT27Uusd?=
 =?us-ascii?Q?27/jablcMqRh+80/j/Zh9aWb6YT7+NhaTsU5wk1/lEgW28X6Kg+Q8dCCEx3h?=
 =?us-ascii?Q?KEztwbaH9v0VXen9xC1cWJ3hO5K1xGUEcbLfAubfAjCjqeQLH9lZDFSWt3HI?=
 =?us-ascii?Q?zfMCuN67wQy8cjTzX3xuAzP74TWpKZzcLO9qB4H7upq6UwH2sQRJ18IBRSZo?=
 =?us-ascii?Q?1eqe8wScALUgSaYqekL6CgfvdCChGYG2Av4X8Ce/waYKR40+AuhcfasYJ5Lc?=
 =?us-ascii?Q?sAY9tYuxZdP/NZ3O69SdcJYLRM3RmDsqVdJzdRui1JSsHL/YhnvO8n7duZPF?=
 =?us-ascii?Q?lk4ZJ5k4bv8lXwyAlWjr46UW+moS2VwNp/4h/ncz/9bmhblHGTGLv/Tv2BSF?=
 =?us-ascii?Q?FG9kzhpfQ6GN13NqvXZcs+nuIKJvUqq6lNw9Y48ZPVFlDewfJ5GaCVcmxWOa?=
 =?us-ascii?Q?tPI8fObtqJYTYl2mKwqEkzlRjtVLOjFsdxb41yL3RHb3jpf1DGGP3pHPz1/T?=
 =?us-ascii?Q?8J0+fXWzdS1q6OypnoxSUYguh2LbDpK7NljwJK7DhDoXR91fKqCO2vuwEDYQ?=
 =?us-ascii?Q?cPNiECSacjnEtEORhQfvZVWDiYYsaoTRy/+yjENcQPa2bRGlwsWv0DGHNkfC?=
 =?us-ascii?Q?/A1w6U1m1AlzQzdxvaaqHKOlV1qJlqA1gvF+yX0KGUPOxYevxMv9OrggCExU?=
 =?us-ascii?Q?wSN2nHlvdlSpvyO77MPYRqaOT5F1bi2vkOgvD8lZs/0oMU4qkOvkvPFMZWjK?=
 =?us-ascii?Q?pq+e3ZmgU4PySQ2rhI4hlVVvS8ZurvT4um1KC0t2MZA9ei0zFCnqHzlA8SAu?=
 =?us-ascii?Q?MHseARrzqEmVnrKyhbKIm0TWa+HXDntmRheGJZ9glmCJn46t+8aFrEzWd4vp?=
 =?us-ascii?Q?PmE2jZoicC5ZSMfFq3ySaSXp4DgZbzkDCh0PGkfXCGQLrHAOskcEsGQxLBTi?=
 =?us-ascii?Q?/ugsF4tyl8HUi5ErJRNVEwUXHZUtT5rq7xgPX5j1dBiydj1LuMZrP26BIdpW?=
 =?us-ascii?Q?1+C5utPeVVX5U6Qh2h5IlH/NKZQgqr1bPLQsk1KRHnl8NwYqTi1QsSjgSW13?=
 =?us-ascii?Q?CalRkLxUt1OZVRMF3wDw9aiGYmuAa5pycTkrWITuzvofzGaVcys999OigoOU?=
 =?us-ascii?Q?vHrxdwgbjh6Ip7/xjX4M68svbq5AgoRdqh2Dm7PfYcU6Rz/d6EYq2Byf2pow?=
 =?us-ascii?Q?VNgrRLWkBQyx8C9QH1HF0QUcxl1YmdRfGWKN89qvopsa0WQ6uz+yefmEtrqa?=
 =?us-ascii?Q?ybf2PE42q+YraGhN+ExqtmC1l8D8Xyrp69b8u6hNcFe4clnELN5xwvoChx8/?=
 =?us-ascii?Q?TNij4NlqgyZNLDa3gfU+I6WXc//VGIM1HWBX0Cw3J9PR7nZLkrobaD/N5fck?=
 =?us-ascii?Q?0zAbGgRFu3JCqoVd/pXvJtFUSinTCgrIBhY7agM3hN/WziN9SBKaCvQE3e8Y?=
 =?us-ascii?Q?yAlRvo2Qy1gQPfreK1tQS79TcEfQD1UYQ1adRDnZkMn0u5ZY1Ef1Jcwv6XxT?=
 =?us-ascii?Q?AHl6inrQUgbgoCadhJwUSgpEZXJbanAQ/CmGcob85sWBd43INkd4bXI4cYne?=
 =?us-ascii?Q?ZxL0n/eLaw=3D=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: 456a190a-f50c-40af-7e35-08decacf3500
X-MS-Exchange-CrossTenant-AuthSource: DB9P189MB1641.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jun 2026 11:14:03.0223
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MjYoOv9sINm7EbaV+sfmW8p3UgAt+EkqQkTFDEQ7mAnHLa2aRew0fY/jo/z7fmfe/rY6x98z7fp+jp/yhiVmzQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: FRWP189MB3253
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 15 Jun 2026 11:14:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/238836

Remove shell quote characters from the .pc exclude argument now that tar is
run with an argv list.

Fixes: 7390e72669 ("classes/lib: Start to covert strings to lists...")
Signed-off-by: Anders Heimer <anders.heimer@est.tech>
---
 meta/classes/archiver.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/archiver.bbclass b/meta/classes/archiver.bbclass
index fede565573..0c3581e2f8 100644
--- a/meta/classes/archiver.bbclass
+++ b/meta/classes/archiver.bbclass
@@ -483,7 +483,7 @@ def create_tarball(d, srcdir, suffix, ar_outdir):
     bb.note('Creating %s' % tarname)
     dirname =3D os.path.dirname(srcdir)
     basename =3D os.path.basename(srcdir)
-    tar_cmd =3D ["tar", "--exclude=3Dtemp", "--exclude=3Dpatches", "--excl=
ude=3D'.pc'", '-cf', tarname, basename, '-I', compression_cmd]
+    tar_cmd =3D ["tar", "--exclude=3Dtemp", "--exclude=3Dpatches", "--excl=
ude=3D.pc", '-cf', tarname, basename, '-I', compression_cmd]
     subprocess.check_call(tar_cmd, cwd=3Ddirname)
=20
 # creating .diff.gz between source.orig and source

