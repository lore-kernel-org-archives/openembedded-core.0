Received: from NAM04-SN1-obe.outbound.protection.outlook.com (NAM04-SN1-obe.outbound.protection.outlook.com [40.107.70.84])
 by mx.groups.io with SMTP id smtpd.web11.3973.1602728811639914210
 for <openembedded-core@lists.openembedded.org>;
 Wed, 14 Oct 2020 19:26:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=nVHhL6J4;
 spf=pass (domain: windriver.com, ip: 40.107.70.84, mailfrom: qi.chen@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PYuHDnsf1F1IpAIwzQwqRBXcz50MGzN1KLYEKHSpE0Nv7evuYiYQnvgxTn5f9ZB47Rr9y4eIelO4b7+46JNVX12w79De7bB9VA76PVcFufmoK+oyZ3BFicRtPAwykYK5dwE3ha9KRZ3jdefKvVvDShfRzfdM/4aDPnzqCOVZsRGZuNU6pg6tQuFGVHXFvmqnPwUht9rtikSZxSOLLFvg9X4ZLsNBgMd+WCva71lZF9P+ivBjprlTrQr4g0jXpbmEQlkW4qumwb7mEx0OFuBTNKjs1Z5GQOLPfK+WLc6quM9OibGxW8mU+6c99lj/x5oNWgSOJEJTvczcYqlEjZ0XIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Mxr4aTd4OA4U8n4EVBlT0WGUndu2T12eqH7wkGCLBsM=;
 b=UbtOcUkmbzGOEme9c72rXDNoqoDaX3/dnLMNnMisn01Rie4NTWfDj4izNscHrPIh7WWOoQLVcMTnU0hapdFYge+RyKrXS+eTAVEizoTZEZ/1vFxSBcGT37t9X2snSy3ZILlfy/MS87+BeYW9Wq5Mldcd7GyxngX9P0kHOwo6EUHG0nc8OUV2pCX1MBK/APhFRl5cqMHNyHnopRGGSVhoBsBVT4biGe98fWgrh1uzJOe09x097w9WAjkD/6mmlGXa1hso2jMq100fPQYtvP8/PVnpAuyRpmLfilB121anCuQuI0fU3gJH4JUit1inDWnMHAIm1q0beb0dEkouzX4qXA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Mxr4aTd4OA4U8n4EVBlT0WGUndu2T12eqH7wkGCLBsM=;
 b=nVHhL6J4Z4NC7liAix1dccYvxk2GLRLp5oJn5kvjRfJrEtcNqj/1HiczCujpDhP0VMBB6Kp58n5q6E2A4O0OZjabxjTRwoai3lIvsx4ag03v3glKKAvLhAmC2SrVWzaBjt8kgMT/SAM24dbGgI9LIu5dN7vfFZt7z8xV+aTCCtY=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BYAPR11MB3480.namprd11.prod.outlook.com (2603:10b6:a03:79::27)
 by BYAPR11MB3254.namprd11.prod.outlook.com (2603:10b6:a03:7c::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3477.20; Thu, 15 Oct
 2020 02:26:50 +0000
Received: from BYAPR11MB3480.namprd11.prod.outlook.com
 ([fe80::4c97:65e4:a822:4cc1]) by BYAPR11MB3480.namprd11.prod.outlook.com
 ([fe80::4c97:65e4:a822:4cc1%7]) with mapi id 15.20.3455.031; Thu, 15 Oct 2020
 02:26:50 +0000
From: "Chen Qi" <Qi.Chen@windriver.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][PATCH] watchdog: use /run instead of /var/run in systemd service file
Date: Thu, 15 Oct 2020 10:26:30 +0800
Message-Id: <20201015022630.15114-1-Qi.Chen@windriver.com>
X-Mailer: git-send-email 2.17.1
X-Originating-IP: [60.247.85.82]
X-ClientProxiedBy: HKAPR03CA0012.apcprd03.prod.outlook.com
 (2603:1096:203:c8::17) To BYAPR11MB3480.namprd11.prod.outlook.com
 (2603:10b6:a03:79::27)
Return-Path: Qi.Chen@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from pek-lpg-core3.wrs.com (60.247.85.82) by HKAPR03CA0012.apcprd03.prod.outlook.com (2603:1096:203:c8::17) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3477.13 via Frontend Transport; Thu, 15 Oct 2020 02:26:49 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2c9ec1eb-a234-4e87-9e5b-08d870b1c5a5
X-MS-TrafficTypeDiagnostic: BYAPR11MB3254:
X-Microsoft-Antispam-PRVS: 
	<BYAPR11MB3254EA5C435D9799280C9A30ED020@BYAPR11MB3254.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1169;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	uVarWVYYKTHQiRaYxk8jSsa4A2HRRMsvT/Z2ZOaKjs40+lrYICQnt3V2TEqBByXWGGyDaQAixmZDcNcsD7yXSTxczJaIKruDksXHAqu8cHNqJ1OSD9cAoZQtPOQpPJL/QEVofGWJABm61Dhq5dEyX0bNcEuGJHjcGqQ+jF1b+zNABwg5zNJncrTucWxQ/CyEq98KrTMuIYEC44rXTG3AUaQycRX6LLzhgWeKXdgvOi9ftHxaonwm3SHr/5WpP6CdDoTpU66vosbWiwvW+gjKpQu8MVVcGD4mM6kwfwDWWQpmvHQxUkFeFedeAan5uZfhf9uzOWvzgnXcHNqcX5hFiaknoEFGNjVY8W/MAMf7Yh9ckrx3iTHzNKJyFixlXzxE
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR11MB3480.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(376002)(346002)(39850400004)(136003)(366004)(396003)(36756003)(6486002)(6512007)(83380400001)(6506007)(2616005)(1076003)(66476007)(66946007)(34490700002)(86362001)(5660300002)(6916009)(6666004)(66556008)(316002)(478600001)(956004)(26005)(8676002)(16526019)(2906002)(8936002)(52116002)(186003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	sa9IFbeRCyb59ooVXIAgdgbE9BaZ7GgEv2TYc5FzkO5lq6iuQDKwNB+uJNdbuNtlGItyhGDD9ZFg73Vh7/ghzK6G6hPnpROKVXt49Iws+Q14qEa7oQ1xghYUoptIDH4El0yrEXR26zdz2xZe+T13Cv116kYe5QjvZ7eHuWJCaSitFd+mvbcTl0jhO4httkAhnhuedHlEzgqgtDzMp818IBnWGxuLghc4YazVdkazSuDstxutKeXqeRMJtnZqTwJujxJCwgNW6rEZtiv5RuLSQdk6KgYE4TO4gtql8SubX2Uy4TyqBqgW01ZzcEG/r1gfoPtpflkKBYDMNBs7/EkXBmUZzPcfnHYu6xb1/iE4JwMa3SCA272hM2YZDjrcwX99XBcdfy7CzQt6RZ2rx69gjO4J9VyYXgtyQsFVY736LxcjpttS1USk5VzLLcH10A109qTDsmawVxjI6kg7KoQ+dZKGXUwu0AbhzKq9zXTyy1m34EVhK9z6CuvDnDeWZfOI7+LPy9lOkH6Dhpcq80lsrgGEGuYks92QBQ+hnGoYd2irLpdOJhscuXrl6Jf63GZppowW2d3c1UzTF3y3su97ZzRcZd8szDpLtzexQfB44Ym5259lsyD3zD2gy1+9wmmyhh7KXeQ62gVgaMk2pO8PnQ==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2c9ec1eb-a234-4e87-9e5b-08d870b1c5a5
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB3480.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Oct 2020 02:26:50.2421
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wPpQ+5SP920LZ2yWVFXpGEylydQV39D3CJH8wxGGfIDIUERXfk8FUzuJoyXeLm9YKNt3VJU6/9hk290On/mTmA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR11MB3254
Content-Type: text/plain

/var/run in deprecated by systemd, use /run instead, as suggested by systemd.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 ...e.service-use-run-instead-of-var-run.patch | 30 +++++++++++++++++++
 .../watchdog/watchdog_5.16.bb                 |  1 +
 2 files changed, 31 insertions(+)
 create mode 100644 meta/recipes-extended/watchdog/watchdog/0001-wd_keepalive.service-use-run-instead-of-var-run.patch

diff --git a/meta/recipes-extended/watchdog/watchdog/0001-wd_keepalive.service-use-run-instead-of-var-run.patch b/meta/recipes-extended/watchdog/watchdog/0001-wd_keepalive.service-use-run-instead-of-var-run.patch
new file mode 100644
index 0000000000..5c5d2f4e44
--- /dev/null
+++ b/meta/recipes-extended/watchdog/watchdog/0001-wd_keepalive.service-use-run-instead-of-var-run.patch
@@ -0,0 +1,30 @@
+From b5cb6166dbfa57d1d94b19d4a098991a817f68f5 Mon Sep 17 00:00:00 2001
+From: Chen Qi <Qi.Chen@windriver.com>
+Date: Thu, 15 Oct 2020 10:02:17 +0800
+Subject: [PATCH] wd_keepalive.service: use /run instead of /var/run
+
+/var/run is deprecated by systemd, use /run instead.
+
+Upstream-Status: Pending
+
+Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
+---
+ debian/wd_keepalive.service | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/debian/wd_keepalive.service b/debian/wd_keepalive.service
+index 7f8b1dc..0f2a153 100644
+--- a/debian/wd_keepalive.service
++++ b/debian/wd_keepalive.service
+@@ -7,7 +7,7 @@ Type=forking
+ EnvironmentFile=/etc/default/watchdog
+ ExecStartPre=/bin/sh -c '[ -z "${watchdog_module}" ] || [ "${watchdog_module}" = "none" ] || /sbin/modprobe $watchdog_module'
+ ExecStart=/usr/sbin/wd_keepalive $watchdog_options
+-PIDFile=/var/run/wd_keepalive.pid
++PIDFile=/run/wd_keepalive.pid
+ 
+ [Install]
+ WantedBy=multi-user.target
+-- 
+2.17.1
+
diff --git a/meta/recipes-extended/watchdog/watchdog_5.16.bb b/meta/recipes-extended/watchdog/watchdog_5.16.bb
index 0199487e2e..1988952603 100644
--- a/meta/recipes-extended/watchdog/watchdog_5.16.bb
+++ b/meta/recipes-extended/watchdog/watchdog_5.16.bb
@@ -12,6 +12,7 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/watchdog/watchdog-${PV}.tar.gz \
            file://0001-watchdog-remove-interdependencies-of-watchdog-and-wd.patch \
            file://watchdog.init \
            file://wd_keepalive.init \
+           file://0001-wd_keepalive.service-use-run-instead-of-var-run.patch \
 "
 
 SRC_URI[md5sum] = "1b4f51cabc64d1bee2fce7cdd626831f"
-- 
2.17.1

