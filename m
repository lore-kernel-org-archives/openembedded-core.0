Received: from NAM12-BN8-obe.outbound.protection.outlook.com (NAM12-BN8-obe.outbound.protection.outlook.com [40.107.237.63])
 by mx.groups.io with SMTP id smtpd.web10.6892.1602818677087324830
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 Oct 2020 20:24:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=PumaENDo;
 spf=pass (domain: windriver.com, ip: 40.107.237.63, mailfrom: qi.chen@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LXJHSWmkOBElc2ojzi1Y+tDy/OX1rZTBGKkcawx9q+q9StCVeXfNudxvrCZXwxoReP4e6EJzAQD0Rl+bPA6bSlJMysjcFTv9owGayEz3hIH9KpoQnpe8Jo46jq3jp5DIGI72bSBAH4/MDaOAX1kz7Zd2Pj8Jy3OrDYWHR/MYsNllCnwq0leWEAcONSLXynT2hg/c2n8ZlvKKMhMaTTiVJtLEN8UbENCSeYBDc4OQDtmQnmiIHqOo/FTJPIFtO1m110A6PswmbUePNcjl7N5UgOKlzSjqRiJDEwB2nToEPQT8BmhU3H4wUZVdDzvG7KhrUov2maOwXY2ZL8roYU9cLg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tXM1LXDVu4mwKsP77BM2QM2K/lcAaU+Ji4NbbD3LicY=;
 b=HN16WsG+6wp6VYfrJqAvOJvdAguwYIFwFRXf4HkInEVe3krF10vfzcR7qLPWm2j+4B9uUd6GVvYVvi19OkS6jOZ5BUFqOTRTxd746hpRcuvp85af23WF0rbPlyZxcKfE17CgFN/bXH5I78RhhhJQ+pICxSa+QEDF2c0+3vxru+rQyV2HNCUt9ye8F1dMaUOcL+ZI86A8Ezcn/Uf9hhC8d1sJmhIj1jMRSGUaUUleSaCq965H0XcG86NyoZNgz7/lffcyP4fNKKKECdZaS0mg3xUXRsTEMjUXitsWlRWJ/NgEQxxN6bA9P0tQbTP45A8WSuk3qRhpV7d8gjNQ1iT+AQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tXM1LXDVu4mwKsP77BM2QM2K/lcAaU+Ji4NbbD3LicY=;
 b=PumaENDoTPH+IiI3VGfFYGea76vPqg3d1UpQN/lV1by4XDk7Rg93rSfcmna7pXIeAOEaysg3aL9QFiTnQJILoJ2SUFPG9U3ljP1AMKnR2p7Ts0VKipTiRVDwN+Hss8nvCdN1XX4zAq0ejgIq7FqPiHGDtbejnYwZjXFSPZMRMJs=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BYAPR11MB3480.namprd11.prod.outlook.com (2603:10b6:a03:79::27)
 by BYAPR11MB2839.namprd11.prod.outlook.com (2603:10b6:a02:c8::33) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3455.26; Fri, 16 Oct
 2020 03:24:25 +0000
Received: from BYAPR11MB3480.namprd11.prod.outlook.com
 ([fe80::4c97:65e4:a822:4cc1]) by BYAPR11MB3480.namprd11.prod.outlook.com
 ([fe80::4c97:65e4:a822:4cc1%7]) with mapi id 15.20.3455.031; Fri, 16 Oct 2020
 03:24:25 +0000
From: "Chen Qi" <Qi.Chen@windriver.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][PATCH] cups: use /run instead /var/run in systemd's unit file
Date: Fri, 16 Oct 2020 11:23:53 +0800
Message-Id: <20201016032353.17983-1-Qi.Chen@windriver.com>
X-Mailer: git-send-email 2.17.1
X-Originating-IP: [60.247.85.82]
X-ClientProxiedBy: HK0PR01CA0058.apcprd01.prod.exchangelabs.com
 (2603:1096:203:a6::22) To BYAPR11MB3480.namprd11.prod.outlook.com
 (2603:10b6:a03:79::27)
Return-Path: Qi.Chen@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from pek-lpg-core3.wrs.com (60.247.85.82) by HK0PR01CA0058.apcprd01.prod.exchangelabs.com (2603:1096:203:a6::22) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3477.20 via Frontend Transport; Fri, 16 Oct 2020 03:24:24 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e3f3bda5-c85f-4c97-8be7-08d87182fb8f
X-MS-TrafficTypeDiagnostic: BYAPR11MB2839:
X-Microsoft-Antispam-PRVS: 
	<BYAPR11MB2839F7D37B8203D550ADDCE9ED030@BYAPR11MB2839.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:655;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	7Ur/WE8Mkph1mjzXy8W+CJO7a7Z/Wjt9prz+yWJ/10xO6mw9J3yb/Uv6ceQ4AXvdJ+2D8kXqabkULD2DWJ/NSOfY4GiN6ry3NHgp/xqgzJVG4dowC49gAYVRUA0xAv2rJ/7vtBIoqOT2vF9TN7HMp5DX7lJq7PphiOcaXb/z8hbMUG8oPVJf5MPI9aVWFH3qdZ6KZLyLX/Z0TrTjaM9PHnjm0StQw7Yh3MU/s5WpIg1oCqsk3nuO32ekJLh5vzmBUEpzSyYsT+cybf4DXM9vHfNOKI2FRHKBS+05SJTIU4exWZ2LKccJwxmKYm/CvIoDmlIV171jVZBC0lY/vsQi49WxW14n6RrJT/tSSFAsS6ZYARID6U1w1V3I1RA2WlVsJkjKlq/eVI/22M4LXM8+ArYIpJtyHMeSumPhy7Ef9mfezXSrGAaMyrLElnX/GUeJV5txbEohJ6nBDVTU2RaVrg==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR11MB3480.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(346002)(366004)(39850400004)(396003)(376002)(36756003)(83380400001)(2906002)(8676002)(34490700002)(2616005)(66556008)(66476007)(66946007)(956004)(5660300002)(316002)(8936002)(1076003)(6512007)(86362001)(6916009)(6666004)(478600001)(6486002)(16526019)(26005)(186003)(6506007)(52116002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	QFPC5/PT46EyBmqWw4fjGsHVB5NlW7lj1MV5MbTw3/yBNQDmpOxZj8gGo5MF5SCNdStocZDLhygKTCK2qGnUscKh5KdShs1WtXPLgQno/eg+6B+YnjMUu6hiZlJXd+/o3WxobZyDHg8yGV+OrTNEQX9Jx2FRX85G86M6QWZx5Tyj+58iZd7HA2ugI/vGH22me0d+1S+rjfOkcpwzOJYoE+a7/yRpb1MiIyE6MgtXV7KIRweyLEXerT9AQaXKqWOf5+Hu7wElc3OG5IVIFlIVCZBcgT9T4l+baSif3wt8juSR41QsiKwcy9WdT9SMQzW64U/6JqTDuE2vfrsrcx+9Oai1aSBJT8vZQA2KRB7pkbsGu6NApoDjrvHBIqUReusxdUXtsqRFi0xSjGDJSFQOXMVVEv5c0Y38gMyYGwLrV26C26y6cKqkAxJM3Jj2QkTXFL5TxbomJq7I0N5o6LJcNIM+kIwTE2AskmEx2a6MwybuFObElU3aVhUtGky6gdz1phw9UgFCecyDivosOAwd6v9NaWxyqD7E6fuUODHK3zglbXqP9KNfy5uFgkI3DQeK6QcnoEim+e8QEefi+jhOCYEmudTogmTCLcK5Hd3ly7pw6z0VLibU9Una6b+d0LxY0X2iWgbH4a0qapVEk0xuvA==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e3f3bda5-c85f-4c97-8be7-08d87182fb8f
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB3480.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Oct 2020 03:24:25.6369
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pFbHF8CVdtXzc3m3TLTBp2M9RxJ8LS0XtqQ57rZJcfBoSq0MJ/DZxY/VyFdnfPd8xQKEwc/YUftCc6fbIPrqtw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR11MB2839
Content-Type: text/plain

/var/run has been deprecated by systemd, so use /run instead,
as suggested by systemd.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 meta/recipes-extended/cups/cups.inc           |  1 +
 ...sd.socket-use-run-instead-of-var-run.patch | 28 +++++++++++++++++++
 2 files changed, 29 insertions(+)
 create mode 100644 meta/recipes-extended/cups/cups/0001-org.cups.cupsd.socket-use-run-instead-of-var-run.patch

diff --git a/meta/recipes-extended/cups/cups.inc b/meta/recipes-extended/cups/cups.inc
index 1765944568..f56233acac 100644
--- a/meta/recipes-extended/cups/cups.inc
+++ b/meta/recipes-extended/cups/cups.inc
@@ -13,6 +13,7 @@ SRC_URI = "https://github.com/apple/cups/releases/download/v${PV}/${BP}-source.t
            file://0002-don-t-try-to-run-generated-binaries.patch \
            file://0003-cups_1.4.6.bb-Fix-build-on-ppc64.patch \
            file://0004-cups-fix-multilib-install-file-conflicts.patch \
+           file://0001-org.cups.cupsd.socket-use-run-instead-of-var-run.patch \
            file://volatiles.99_cups \
            file://cups-volatiles.conf \
            "
diff --git a/meta/recipes-extended/cups/cups/0001-org.cups.cupsd.socket-use-run-instead-of-var-run.patch b/meta/recipes-extended/cups/cups/0001-org.cups.cupsd.socket-use-run-instead-of-var-run.patch
new file mode 100644
index 0000000000..e8fbd19104
--- /dev/null
+++ b/meta/recipes-extended/cups/cups/0001-org.cups.cupsd.socket-use-run-instead-of-var-run.patch
@@ -0,0 +1,28 @@
+From 5b1d90bc6bbb25eaf01855cb0fd5e0a9c9e1fa7f Mon Sep 17 00:00:00 2001
+From: Chen Qi <Qi.Chen@windriver.com>
+Date: Fri, 16 Oct 2020 11:22:01 +0800
+Subject: [PATCH] org.cups.cupsd.socket: use /run instead of /var/run
+
+Upstream-Status: Pending
+
+Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
+---
+ scheduler/org.cups.cupsd.socket | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/scheduler/org.cups.cupsd.socket b/scheduler/org.cups.cupsd.socket
+index 9cb4613..899e00b 100644
+--- a/scheduler/org.cups.cupsd.socket
++++ b/scheduler/org.cups.cupsd.socket
+@@ -3,7 +3,7 @@ Description=CUPS Scheduler
+ PartOf=org.cups.cupsd.service
+ 
+ [Socket]
+-ListenStream=/var/run/cups/cups.sock
++ListenStream=/run/cups/cups.sock
+ 
+ [Install]
+ WantedBy=sockets.target
+-- 
+2.17.1
+
-- 
2.17.1

