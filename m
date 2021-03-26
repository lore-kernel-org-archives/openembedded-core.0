Received: from NAM04-BN3-obe.outbound.protection.outlook.com (NAM04-BN3-obe.outbound.protection.outlook.com [40.107.68.57])
 by mx.groups.io with SMTP id smtpd.web09.13342.1616769457423454968
 for <openembedded-core@lists.openembedded.org>;
 Fri, 26 Mar 2021 07:37:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=H0auLlcm;
 spf=pass (domain: windriver.com, ip: 40.107.68.57, mailfrom: yifan.yu@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=E6Q7TCECSyXY5jWCAqNNMQpSa5sWqv3XBVieI4ZQ+DEyK2edEsI7kxkx7eOSYQTwzDlu61+9fkkt39Q45MECEk+UonT7RekOHM4eAlAehe13AKJO0babqVIV4tKbiAuGTjhPnR1eYmu5+6b9du/VI4FcPFFD5YBsXPn+uQDGyUdhGn5CDnb/u3QbGeTtsk74RECONqoSNKOaw2R3dRChim2ysFd5MUg+/RxmQqloG5Zn52OcB3IeslYtC875Xka50VKrjXAO67IkNKOmUZLKIdnnLq56KaRHtqioA8yULpQOmmDmB15yZRYVOHt0c8SNTKeATKs/KKtOwyrCJks+IQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KxsfWG3cVZOuIEySmiuxZQ8dth4ywZja0zyL9HS1LxI=;
 b=mhxKU+WDeh0vGaY9JBYA5n/tiqo0FFZAIsg5u8hwEDqh0/q/J37Uvq+rUfgeq6XazM628X1DnSVc7j/yNDwsIIrU4uCO/C+l0Ev0ahX3XoCKlTndoS0hcKujKukExYNXKqG0/XJRLRfyz9IeZnBG9SD06CJENmDmdMSC81BFaF35icaNRZJsIyjKY0Qj27ReAhMUwDZ5CSOEyVCzBtTU6GvwEgWtWz9VA3VXMkMvsSRrowzfIas2HyW1+sJuMZqprX0QjwBrrmtofEqFuaOxZfSIuOoGcTAxdFuib9gkASWiDO2WXAr8CvcibHze2XYdeXmzLvo12luyUNtZp3s4DA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KxsfWG3cVZOuIEySmiuxZQ8dth4ywZja0zyL9HS1LxI=;
 b=H0auLlcmxIbndzcpAY+b7G6KRpURPGRD5HFS+Z6ElXX/Y1HR8ULCKi4OD5HRLsF/F6HlFz6KZLXZPCvyMES21fGkyjJ+3z9SHVg9X/iP9zarruB1N9yBMmpS8rVa5yyD3EZCiOXOPPd0oTMCzqfpGqE5SexoTBGS0d7tBXJ/cHo=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from SA0PR11MB4719.namprd11.prod.outlook.com (2603:10b6:806:95::17)
 by SN6PR11MB3038.namprd11.prod.outlook.com (2603:10b6:805:cd::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3955.18; Fri, 26 Mar
 2021 14:37:36 +0000
Received: from SA0PR11MB4719.namprd11.prod.outlook.com
 ([fe80::24e6:c5dd:a024:807f]) by SA0PR11MB4719.namprd11.prod.outlook.com
 ([fe80::24e6:c5dd:a024:807f%9]) with mapi id 15.20.3977.029; Fri, 26 Mar 2021
 14:37:36 +0000
From: "Yi Fan Yu" <yifan.yu@windriver.com>
To: openembedded-core@lists.openembedded.org
Subject: [oe-core][PATCH v3 2/2] valgrind: Disable ptest swapcontext.vgtest
Date: Fri, 26 Mar 2021 07:37:10 -0700
Message-Id: <20210326143710.168053-2-yifan.yu@windriver.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210326143710.168053-1-yifan.yu@windriver.com>
References: <166FB59AC0FDC39E.19792@lists.openembedded.org>
 <20210326143710.168053-1-yifan.yu@windriver.com>
X-Originating-IP: [147.11.105.124]
X-ClientProxiedBy: BY3PR04CA0011.namprd04.prod.outlook.com
 (2603:10b6:a03:217::16) To SA0PR11MB4719.namprd11.prod.outlook.com
 (2603:10b6:806:95::17)
Return-Path: yifan.yu@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from ala-lpggp3.wrs.com (147.11.105.124) by BY3PR04CA0011.namprd04.prod.outlook.com (2603:10b6:a03:217::16) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3977.25 via Frontend Transport; Fri, 26 Mar 2021 14:37:35 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 3f360528-ac90-451f-38b6-08d8f064b2bd
X-MS-TrafficTypeDiagnostic: SN6PR11MB3038:
X-Microsoft-Antispam-PRVS: 
	<SN6PR11MB303875D4DC592CF8370AF32280619@SN6PR11MB3038.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3826;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	bu7gY+WiRKhqq3GgmS3OQCNAvACX58ftuilhHtHUTxIdmusZ+rg/FA7wCjHPH1nABRMlBhyEHeezbYKGfmDusylyGqQWhKBxRi2/C0u8ryg5GcmzU5n+s1mXpesaeK6+OHYa/f5UArM8rRrsFW6SQsadjk69C1zwKAE+0s4mCXYQ0avr8z2wd1paoyGYMw2mFZrCM8+sr6Lu1qDKVmS64a6nB2KTGfJQ5RV75URa2Gp1t9TQ/IuppcVLmKitvdAon4KhH96P/blDHVi4FuCEWw9J2dcTL+6XEdWcqwN/oNWNd5Zt93UtZz7acS6nEuCXUmrI38fp6OIjfL8Aash9cijnX7ZS82hoj9edAop+FJN/oYEPWVqDzYlPGNt/FVtX9DvjQz5QEYSDyByie86V4Zkj/RWG+Vtw1snX1BlikwDma4rfJmyKsOMF+gENbNebuCS7hO/1hvxrGMbyIycwm8Ya/UA5ufWggGEkBfDHEoqG9+M3SCnrW/iDoxQbs90RTfs8pZBS04Nwc/B2aZPzWMHWZpOba6ITQzFZxLtIEPRLBoYTmm+4zMpGW/5jNVOqGxPi4pILukp/Xrjw+cwCCjFjX77cC4K0Ws6PyIQzgQhVTQCjZszcrd6EQEjqr6i/s/xYj2lOSlnW+D6fSzm7W1+ac6MLWoU3JHl6NBJCCaf5bz6fisRMakSe5eiIVJpjvgZguv4sSrqmbxQUduG2fQax+m0bQY1sU5ZOCN0iKEg=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SA0PR11MB4719.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(39850400004)(136003)(346002)(376002)(366004)(8936002)(83380400001)(6916009)(5660300002)(316002)(8676002)(36756003)(66556008)(6506007)(66476007)(86362001)(16526019)(6512007)(52116002)(66946007)(6666004)(26005)(2616005)(1076003)(956004)(186003)(478600001)(38100700001)(2906002)(6486002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?us-ascii?Q?Drk+M7N+CYD9xwYvuTpWCv5VJTtsb4XR0nHEMTY4TmlbAj748KChNDY+tTi/?=
 =?us-ascii?Q?/Vt+a+V8k5Gqz565rfL4nhQZZTmqf5ej5vZvNPmm4SxyCcXeeZDN8bE/sl4e?=
 =?us-ascii?Q?mlgEFH7VW7LydO8HfghuDY0r18nidko6G+QMPnS1UeUdae+4KVn5yuCk4mhc?=
 =?us-ascii?Q?HdBpndaLuG18F68Y0DbR3WoqGgLBSHs6oTLIwK7NS13wb2lvVzwweOkpr3J0?=
 =?us-ascii?Q?iLsXhBvy3xDzg9xAbK1BE/T1Xv1/seQ8XwLMk/UUXyP6liIZ1c9Ckv9Xjnbq?=
 =?us-ascii?Q?YizUMw/5m5CKaWcLXcXLV0xVoeiZF9TrV4H2LANyGZXxXx4KwdRpZq6Evstg?=
 =?us-ascii?Q?SoEUEe3hc43FkPq0XtmEkAbOKwbnCTUMvu4OvpuTdkcGgalzfu7AvNg9/UpH?=
 =?us-ascii?Q?pf5vnRoENdi95ZH5ibBAf492mGJNeK4bnT5LAb8jaltuuz9NHFwWNWGFQphM?=
 =?us-ascii?Q?QvKPNuDM+STmqow3STWyAq4A70K0/I+JZQ+PM7Dgysbsurkyt9Pd/bplypZq?=
 =?us-ascii?Q?Sxd2qJvvEMa69PdGBMNb5mtLBpXqRVtoUyWe8TLXiq1rhqeorZuSt6awjwtj?=
 =?us-ascii?Q?7QnkqPBJ6F7RiGG1jpcvvrX1BMQ49pAd8+uCzPj86V1XsywbD8jlBLKkA0Vh?=
 =?us-ascii?Q?OFaB5UwtXPH59hx+JKBAsnR8uVL7/T9V0HGZUn0pD4AGVZBk+Us6QkBOQ7iJ?=
 =?us-ascii?Q?0kg7IOhlhXN+1RZeaPEhofS0H1Mfd4la+EPnm7grFck6cDcaraRa1OAucask?=
 =?us-ascii?Q?SRDh2LluU3xbGqZc+stWbUVDPVU8+C9zEozKdrISo0DG5VowNpwLv8J+Jme6?=
 =?us-ascii?Q?2NFlA3AEjDfs5qLHsaeyYVrbWCAK7zGyHSGZXlOAHAtRiDhF7ofDhiKA7+8K?=
 =?us-ascii?Q?aaBSS0gpd31nlJfU6zWkgTXpr16FPROkdlbDA73E+odtQOzHTDpdO9o9V2x4?=
 =?us-ascii?Q?5fshWLshftmTqHWYC1WnXfoQTQdUci1vkzGz3vCGtU45NUE653xf/FOIgdh7?=
 =?us-ascii?Q?E+nCnQQQewGzshy8V6lfD4hRtuy60gjjAvEc5DlEmmKg6E5pHNI1ft3suN9w?=
 =?us-ascii?Q?duD3L1be/PV0QInSQcbckIYbVeGCumayDZWAeGbzb+ic2Zw59wqVEOBuYLvh?=
 =?us-ascii?Q?Ce0ylZR3hHv1BSqG//o1vFd0rAPEX+d69gAZSjDah36fxY7xc5eDzc4PrHnc?=
 =?us-ascii?Q?SS56WsDVVsvEMTPv85cxrSfAn4HjUb1zw0Crj/Os5VdzydSR5Q5jdSOhJB8x?=
 =?us-ascii?Q?HjKPjzoMCRtAbsifI4Ze7cJD7ZFRpMuGuiZxY+jMLZoA6P3Emsn8oEIgTQIN?=
 =?us-ascii?Q?pqAwuh57cs1z+6qJMOUq0yZZ?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3f360528-ac90-451f-38b6-08d8f064b2bd
X-MS-Exchange-CrossTenant-AuthSource: SA0PR11MB4719.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Mar 2021 14:37:35.9902
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XVpLNWW9+K91vwVey6HaRGhlj5eUmqyZ83SidkwkpeQr/fyC8LpPErqwBb3OBhbTOUjbphzE9PxJL739tyG6xA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR11MB3038
Content-Type: text/plain

New test introduced in valgrind 3.17.0.
Test fails on both qemuarm64 and qemux64.

[YOCTO #14324]

Signed-off-by: Yi Fan Yu <yifan.yu@windriver.com>
---
Changes in V3:

Added Reference to Yocto bug in the patch itself

 ...orarily-drd-tests-swapcontext.vgtest.patch | 29 +++++++++++++++++++
 .../valgrind/valgrind_3.17.0.bb               |  1 +
 2 files changed, 30 insertions(+)
 create mode 100644 meta/recipes-devtools/valgrind/valgrind/0001-Disable-temporarily-drd-tests-swapcontext.vgtest.patch

diff --git a/meta/recipes-devtools/valgrind/valgrind/0001-Disable-temporarily-drd-tests-swapcontext.vgtest.patch b/meta/recipes-devtools/valgrind/valgrind/0001-Disable-temporarily-drd-tests-swapcontext.vgtest.patch
new file mode 100644
index 0000000000..10ec06ccaf
--- /dev/null
+++ b/meta/recipes-devtools/valgrind/valgrind/0001-Disable-temporarily-drd-tests-swapcontext.vgtest.patch
@@ -0,0 +1,29 @@
+From 0f1814a618eff4233e9e8379a8cb2dededdc5a8b Mon Sep 17 00:00:00 2001
+From: Yi Fan Yu <yifan.yu@windriver.com>
+Date: Tue, 23 Mar 2021 11:09:20 -0700
+Subject: [PATCH] Disable temporarily drd/tests/swapcontext.vgtest
+
+New test introduced in valgrind 3.17.0.
+Test fails on both qemuarm64 and qemux64.
+
+Upstream-Status: Pending [Needs more Investigation]
+[YOCTO #14324]
+
+Signed-off-by: Yi Fan Yu <yifan.yu@windriver.com>
+---
+ drd/tests/swapcontext.vgtest | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/drd/tests/swapcontext.vgtest b/drd/tests/swapcontext.vgtest
+index 98e3712c4..5492da31d 100644
+--- a/drd/tests/swapcontext.vgtest
++++ b/drd/tests/swapcontext.vgtest
+@@ -1,4 +1,4 @@
+-prereq: test -e swapcontext && ./supported_libpthread
++prereq: false
+ vgopts: --read-var-info=yes --check-stack-var=yes --show-confl-seg=no --num-callers=2
+ prog: swapcontext
+ stderr_filter: filter_stderr
+-- 
+2.17.1
+
diff --git a/meta/recipes-devtools/valgrind/valgrind_3.17.0.bb b/meta/recipes-devtools/valgrind/valgrind_3.17.0.bb
index 1e29896596..7a6b766121 100644
--- a/meta/recipes-devtools/valgrind/valgrind_3.17.0.bb
+++ b/meta/recipes-devtools/valgrind/valgrind_3.17.0.bb
@@ -43,6 +43,7 @@ SRC_URI = "https://sourceware.org/pub/valgrind/valgrind-${PV}.tar.bz2 \
            file://0001-none-tests-fdleak_cmsg.stderr.exp-adjust-tmp-paths.patch \
            file://0001-memcheck-tests-Fix-timerfd-syscall-test.patch \
            file://0001-Add-missing-musl.supp.patch \
+           file://0001-Disable-temporarily-drd-tests-swapcontext.vgtest.patch \
            "
 SRC_URI[md5sum] = "afe11b5572c3121a781433b7c0ab741b"
 SRC_URI[sha256sum] = "ad3aec668e813e40f238995f60796d9590eee64a16dff88421430630e69285a2"
-- 
2.17.1

