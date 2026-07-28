Return-Path: <brinkmann@stulz-digital-solutions.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7A1CCC53219
	for <webhook@archiver.kernel.org>; Tue, 28 Jul 2026 09:54:57 +0000 (UTC)
Received: from GVXPR05CU001.outbound.protection.outlook.com (GVXPR05CU001.outbound.protection.outlook.com [52.101.83.83])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.8003.1785232492111517347
 for <openembedded-core@lists.openembedded.org>;
 Tue, 28 Jul 2026 02:54:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@stulzdigitronic.onmicrosoft.com header.s=selector2-stulzdigitronic-onmicrosoft-com header.b=bk0Wg/he;
 spf=pass (domain: stulz-digital-solutions.com, ip: 52.101.83.83, mailfrom: brinkmann@stulz-digital-solutions.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mcLJq57tt6m3yJlC6tiUPOjJkc3wUisS7L8RcOThE8AfKvi9fjD3OUMNuST9TArmnrpBx550d02kB5vviB41RiNpVkOwRVShmzY8ERA25eRt6smhO/jINPo+ty7EO9JRnlr1merWjjm+apb9GkYq5zGSzn0yph82S4DWjmTzhOUISgrMyv39K0R6DBTdf7UNinRiBGLNL8TDsKRvNIzyu5kzZI/2okHB+A0Ec8E8SaoPiA75OfEp3I7HmApBbEsq6r1Zw7GDaKAFMbJ463BDr7ONkZJ3GV8qJutQb6euj+wc3UcUN9aYER3DGa//bzXavcbFk1E/OyVxP1M6C4fXIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yGgwVIuy2aHMZoeu9PaPuTVvbn02mK+zJgkfH+1wiJw=;
 b=I4v4zN5aJJUjvsVSZPUu5OrMRmvjD36rps4RctMeBO3P707r8CjCYpDR2rnJEjdDzFbuqH9jKJpQFVS9DxYYJDWKOICDKBJYo/Aa6Swcc7/YbYQ5tALF8TZck1n27Qz/3XoouYsXS1/3mlsn616BrlyG0RwThqiAaLs8t9CUgQy8ePk1/Aquc2QWaQFP0wqCKVr8+af+bO0XaGq9BsaA9mHfX8Othlakzx7u9iySDhe2bOPEkPLNWsRndNP6P9WBMX+cSmg5AsaEe/SimRyDWAuwjrgS3m6NykaqmYAcewb5DddROULuvHs2PEFOI/PLSqLvgcxdM4Jr+8tEaKUljw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=stulz-digital-solutions.com; dmarc=pass action=none
 header.from=stulz-digital-solutions.com; dkim=pass
 header.d=stulz-digital-solutions.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=stulzdigitronic.onmicrosoft.com;
 s=selector2-stulzdigitronic-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yGgwVIuy2aHMZoeu9PaPuTVvbn02mK+zJgkfH+1wiJw=;
 b=bk0Wg/heoX8y+0aSDgqDlh9oP+eibSCcZUXLPII5UoxZ23tNns2dF9P5zJ63/5PKgRXy1k5n4t3sq/M+Sr7ZDqr7RlAMbSKWBA0QsCCfdse5PMnn1pwIa9aZDjsITTYw+GeH+osQgawP4QDnyfAxACgHNhKqJtLm8LPSHxJER34=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=stulz-digital-solutions.com;
Received: from VI1PR05MB6654.eurprd05.prod.outlook.com (2603:10a6:800:141::20)
 by AM7PR05MB6851.eurprd05.prod.outlook.com (2603:10a6:20b:1a5::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.12; Tue, 28 Jul
 2026 09:54:47 +0000
Received: from VI1PR05MB6654.eurprd05.prod.outlook.com
 ([fe80::748d:efa3:4d81:3551]) by VI1PR05MB6654.eurprd05.prod.outlook.com
 ([fe80::748d:efa3:4d81:3551%6]) with mapi id 15.21.0245.012; Tue, 28 Jul 2026
 09:54:47 +0000
Date: Tue, 28 Jul 2026 11:54:44 +0200
From: Harald Brinkmann <brinkmann@stulz-digital-solutions.com>
To: openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [PATCH] classes/cmake: use correct CMAKE_SYSTEM_NAME
 for baremetal arm target
Message-ID: <amh8ZDouDl5vzykd@rocket>
References: <18C66A4825C2C24A.3010641@lists.openembedded.org>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <18C66A4825C2C24A.3010641@lists.openembedded.org>
X-ClientProxiedBy: ZR0P278CA0020.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:1c::7) To VI1PR05MB6654.eurprd05.prod.outlook.com
 (2603:10a6:800:141::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VI1PR05MB6654:EE_|AM7PR05MB6851:EE_
X-MS-Office365-Filtering-Correlation-Id: b6bbccba-dcd9-426d-1e92-08deec8e41e6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|376014|23010399003|1800799024|56012099006|10067099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: 
	un4yVSVe6ifhq8OL8yYNeVteczfBXUS1QqJpaVTNLKQDwh9FYoEJYnDgeH/RWv2GyRLH2JaK4HroDBGhuupZtjAVrI/eUizye2CnWxx985/35ohaTb4MgtsuylKzwTFQYkBWoV9HP1ijG8IWLsG6Hl8fxmHGGG9IshYMTqFD2oauer53MqKi/S+5/45OuV7bdEO70SlwM54irMO8Jyq5ZYwOTSwMWKI10zLYc6+l+gotX1fmeLk52REO2itXr0x6FKz5U1R2weBfGn1/m9xWfMr0yfAT/qHGsc8qg7r17oErYKWLBjVYnUBEQOyuAWjk0ZArDx/8QxRB26cjJlBH0+eES0gncz05qcv3T76ePwwt4xvsU3oG+jbOZAcgizO3+jipoaJNAiDjjZclVSSeM/xEP841K7QkXaulUavbx6Jab/cNay2Pthg8Lztf8GLUIp5/CLk6qqjUaFUJmh1toDOzx+aEVoq9S6YZp7BPzAdE333HjtjQPGCUlOrbM1cEd5dCklroYjXTIrGSwjwKlDeQuGO+8NIi2Z3YI9VrjdxFjagicP6MyB6gAAz+u3mTYbO0NPSk3vjEEmzgQ+ZvsqDSuCPrFmMfZtrM0mX1PiKg6GVn9OY6ZMENIidGr6tRZAsnKrE5tVsfwVul8OpyXO2a6vVBHKr6J4wwsmBhyNc=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR05MB6654.eurprd05.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(23010399003)(1800799024)(56012099006)(10067099003)(22082099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?U3KI7d+QP1lHpO127x5MdOHuGIEN1wg3MQxcVY9GEs44byijkS+qfGPe/1Yh?=
 =?us-ascii?Q?vK1xf79YHQcZfyVn7D4/PlPYSKpDR1lFdDF1YXZ4qYz5Vv5wytsy2s6Nu7pT?=
 =?us-ascii?Q?Y+SfaKBNPSlbAQ1jrzoomBHqeTCh53c52iualjAtqxMUMf6RCQj1xhYg9tDW?=
 =?us-ascii?Q?pOncH4WFqnNNrP3c3A3DBWU4TTMA4Qrjc7hrsu6SY7+gb2LVClAVSY9j3D4t?=
 =?us-ascii?Q?ojOqwQWAiFE3orGolrgLbFRej1ymGaOzEJYrkv6Ce+Aznsmi8VfdyW39xA8W?=
 =?us-ascii?Q?eldCSJcx1KyF2Ndu4PG8Cke3lQ3BGNdtmSnKR+j26Chlp9X/VQI+a3pvryOF?=
 =?us-ascii?Q?XzPN8ntWSnmsk7LJlLDFNn6T9ybt7Fi03xeav+cenP2UkiPE1ApiyajwE/TO?=
 =?us-ascii?Q?FsJGmq2x1RC+os0crobR7HlDG5p7KLUnwQajKjm3EVl88ubc8zpS6IbI7Mzt?=
 =?us-ascii?Q?2yvbl4H+W/3OuUnEwm5CA/9lA7zQ8MeYMMvFBzVLiIVTm1dMS200zq9YtfAi?=
 =?us-ascii?Q?/ZpgXNMe6HZg7iffaqkmjbt1Ei0ZdlsDq+Xzm6VF7Z8UWCW+YoFXlZ0qY5Jd?=
 =?us-ascii?Q?cxlWli1f2WdHK9v9kvT7t9BA6BC8R5DJrE+LJElo7O62wluW6pNEXnKuhg6H?=
 =?us-ascii?Q?QfrzJHMTBryS/EsTb/kdU1+PKaZnIza4MNefikATBKbF3GP4xUr//ItKXjuY?=
 =?us-ascii?Q?Jtqbl+/0N0iNvbslTPiiCr/ajf0Nrk2wHoqgt895m28FWLyF12UwaNSLrww2?=
 =?us-ascii?Q?mt2R5xnVazPzfzdbPuiuAys1H6jFzUbg7iK2OMsk4gqZiLS5w8hZMmUlzvI2?=
 =?us-ascii?Q?kj4sR34O7okXXxZBk2IzuVypAb0Y5KFaKcw5Sqk6LoryWHwpXvSPaLrv1bcM?=
 =?us-ascii?Q?YXpCUMQBavsrHtfOJpbJOIoBfZWMKqK5oea2VsuDp5z9T2EOjTdaNT5TjmhA?=
 =?us-ascii?Q?+yCfAqGI5cK/J2F7dFW5/tmitmEOhbNb7qt3ouuzqttWqd2GNj58LMg4qUMD?=
 =?us-ascii?Q?+NkRYFAfCK2nES2XwneXFxcWjw5Vqtzws687l5fHtuiIvBs414irrwOsUEV6?=
 =?us-ascii?Q?tKe8Qcl/l1gYflOZX3Bt9dQ49AvoQGzNY8Fa/XQwiMmswwES2cNBYIYpLssG?=
 =?us-ascii?Q?c3hgC20HGQuAKH9nvomtnQ/oB5tuRkiPtf3bOA+w+oV+pZD8Lldu2tuKgFQg?=
 =?us-ascii?Q?cvY1bnltKhrAWKL0VDic745rMIBS2OvBguc4VowhjCyLMkpDYAkIt0VRk9O+?=
 =?us-ascii?Q?/tqc1t/ZWdGwU6yMCf+ETogEDYY1Om8TDEFVOkWSN7yMgk1ivInvzwPu4F0B?=
 =?us-ascii?Q?tr9bI1s2C06p08n52+wAwoHvOHWjrsQQ0p+SA0jaZOtRNzxKyn1Kkz5591TV?=
 =?us-ascii?Q?W5OmCMTr2JZEBfoJ4zgFYZPBEj/NUNWwrxlYBxmt3XAGjwafMjV2nhh0HylZ?=
 =?us-ascii?Q?FvxQKpymPmRFZ5MFgc+CzHQTX54hJMASFAuGbwNAxac4ioMSsDMg9z7VoeD7?=
 =?us-ascii?Q?MRwRFZ/dAGiVjdUZke4NbNd43nVSJyxrr0stdD21dX5reHGICm1808DL1CN/?=
 =?us-ascii?Q?fGEUSbQYPb7IS0HxMkk5sULytNJDt7N+NL9gsop9C4G/QdIBNQ/RUxNJ85Py?=
 =?us-ascii?Q?EtsmYenDPt4JChQdJH063iYzF6BUJpfnCW4yVhM1FbEwVanjxQ0J1tDhi65k?=
 =?us-ascii?Q?wEqF9BINDRiKgHrPmD/I4Y55oi+J6fjPcm4kF5AjTEGefAPFAoXy5IBJobPX?=
 =?us-ascii?Q?vam/gJAjXARc8pcd25iqeNd7lzfVRIkoonESSzurAI+AcJclwXFA?=
X-OriginatorOrg: stulz-digital-solutions.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b6bbccba-dcd9-426d-1e92-08deec8e41e6
X-MS-Exchange-CrossTenant-AuthSource: VI1PR05MB6654.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jul 2026 09:54:46.9965
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 9b1a755a-f0dc-44d7-9180-b42e99016cf5
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0ZM1VMBx6yFFmFVXiKIdlNoMeNalne303fdLwQjoYDK/FurC3sENj7wox+TFYusGLocRqUONUz5creK5obdmsSm1stitB/Fx+Z7xaEsGZxbOuFTLW+DkgZleL5XvAUf3
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR05MB6851
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 28 Jul 2026 09:54:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/242176

tclibc-newlib.inc sets TARGET_OS:arm to 'eabi', which gets assigned to HOST_OS
and is used here to determine CMAKE_SYSTEM_NAME.

Signed-off-by: Harald Brinkmann <brinkmann@stulz-digital-solutions.com>
---
 meta/classes-recipe/cmake.bbclass | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/classes-recipe/cmake.bbclass b/meta/classes-recipe/cmake.bbclass
index 4f59966521..a1eec6b142 100644
--- a/meta/classes-recipe/cmake.bbclass
+++ b/meta/classes-recipe/cmake.bbclass
@@ -103,6 +103,8 @@ def map_host_os_to_system_name(host_os):
         return 'Windows'
     if host_os.startswith('linux'):
         return 'Linux'
+    if host_os == 'eabi':
+        return 'Generic'
     return host_os

 # CMake expects target architectures in the format of uname(2),

