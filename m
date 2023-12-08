Return-Path: <Yash.Shinde@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E6FDBC4167B
	for <webhook@archiver.kernel.org>; Fri,  8 Dec 2023 09:56:21 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.16932.1702029372552774405
 for <openembedded-core@lists.openembedded.org>;
 Fri, 08 Dec 2023 01:56:12 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=ZjrGEBYI;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=07063bb361=yash.shinde@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 3B86P1Kx019815
	for <openembedded-core@lists.openembedded.org>; Fri, 8 Dec 2023 09:56:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=from:to:cc:subject:date:message-id:in-reply-to:references
	:content-transfer-encoding:content-type:mime-version; s=
	PPS06212021; bh=qs37cB5PC9mGCPzeVSrIY1hWmSy4iVt1ZTVrithKMvg=; b=
	ZjrGEBYI7mOM0xY3PxRz8HATAeXAqRq2L9hrNBPEant1U+XaRl/dDeEIysth85BD
	/tGJuEsfOgDh1PxXrERy0JYZMwaESQ3MAQCYySaJewXazIqwS++/7NOgpE/1WjX5
	/7PI5zjohMerA2DWq7nMd0SPy/jDxyPudTQWx28bj57QKVDaWpWamTwUvdR6ifJQ
	XLPLJiuBMvzpwmTnfE9f3f1YJxkMGFbi7m8FNO8UR4R/tECttkZdUEHbKDXtBz0k
	h04oMkwr8FE2N8utegzy8+SVUDKAlO5gCDKIG9yhNyoMS63uUgLhe3O9Xdd3Adz7
	U6RPiFIzOiwNiITlQfjysg==
Received: from nam12-mw2-obe.outbound.protection.outlook.com (mail-mw2nam12lp2041.outbound.protection.outlook.com [104.47.66.41])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3utd53tq2r-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Fri, 08 Dec 2023 09:56:11 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EzDg9aew8XAZxosVRPXJXW/42mWsAVIAw4KTpw/BOgVkh9kdKU3sLEhkL8SnMSFxnFcb31EnQBg1gJwjJTnc1jhIzoZQRQORgltdQsag0tsLgDW7LyEI9+7o++dIfYdswb+4XgVcGmmmNGHNOC2k+6pX96poAr4GKm5NlwPSysW0HBJQYJ+9BwMDaelZXo9dQV2Sb+kEze0DlW8aqR+ObNeLdmmufkupMEFWNrz6xnR1RnErLUrkXN3X6jNTPZDRq14QKFllGg7ofWZ+hirBgHaOaFrewFUcmS4iZcm6oL9mSExIaDM8THd25gS67/FSISHeX8UHSw20xJQryjliZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qs37cB5PC9mGCPzeVSrIY1hWmSy4iVt1ZTVrithKMvg=;
 b=eOjuMRTrw1al1B3prau2GVa200HLElw//cPSzsDj8kDz/Tlh5hRatqTm/pLHu4vMw8dIRXccIh1O//tzZ5JEcqhSjmTqZknmyTWIg2l9sw648iz2izD/qvki5M5jx0aWlbtovNXvpndSl4KcdIw1/U7p1mFC8HDvNw28BLg1SIlutKtiQltQfuciAZQqfeM6uKperx7JQvT9MBqsnnOOvrZ7Vk3Klw/6nvOnHdBxWxPrrPCzzuc5XBFyZKClSXMmUNZQDJSn1x4l8Adk1l24ipPNTfFdzd3EuM/gi32JAf49/qhzos0tiSF+JFS08tU6jgpES4ZA/0UODV/tszDWbQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from SJ1PR11MB6129.namprd11.prod.outlook.com (2603:10b6:a03:488::12)
 by PH0PR11MB7166.namprd11.prod.outlook.com (2603:10b6:510:1e9::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7068.28; Fri, 8 Dec
 2023 09:56:09 +0000
Received: from SJ1PR11MB6129.namprd11.prod.outlook.com
 ([fe80::b5bf:a968:5f25:945]) by SJ1PR11MB6129.namprd11.prod.outlook.com
 ([fe80::b5bf:a968:5f25:945%6]) with mapi id 15.20.7046.033; Fri, 8 Dec 2023
 09:56:09 +0000
From: Yash.Shinde@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: Randy.MacLeod@windriver.com, Umesh.Kallapa@windriver.com,
        Naveen.Gowda@windriver.com, Sundeep.Kokkonda@windriver.com,
        Shivaprasad.Moodalappa@windriver.com, Yash.Shinde@windriver.com
Subject: [PATCH 2/2] rust: Disable rust oe-selftest
Date: Fri,  8 Dec 2023 01:54:55 -0800
Message-ID: <20231208095455.1252421-2-Yash.Shinde@windriver.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231208095455.1252421-1-Yash.Shinde@windriver.com>
References: <20231208095455.1252421-1-Yash.Shinde@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR13CA0031.namprd13.prod.outlook.com
 (2603:10b6:a03:2c2::6) To SJ1PR11MB6129.namprd11.prod.outlook.com
 (2603:10b6:a03:488::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PR11MB6129:EE_|PH0PR11MB7166:EE_
X-MS-Office365-Filtering-Correlation-Id: 5655b022-5c40-41b2-7d54-08dbf7d3e721
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	9uX/XnHvFDZcSCFXt67/1HEKQzKXY2KvFveO5oyQs1a6T/wZN82wFs11vnUrEfR/wfER1lZ/UcZd8B/Zn+GaJb8qmQV1l++ftd1DqZ35KihCh8rT0kkqhH588YEKIQ0RIP3AfZv3IxHRhgKL3BRlie552JfTgiP71DPhSpi20V5F9Ga1YaSQfHISgKcEvRXtWnD+CBtGU+PXFjd4PBGJsGsz1wkaJxk5+zYS6vv0CXGuVxOkGq8Dku3I/L+oydrHVwz6e/YcjPrBF+GO/5kYS3zal20N6df/WP3D2FalTp/NksdyoZkr0SyARDHruHYSHeyFWw1Oz3r02IvAkHhLXt2sKcSs13H64IDzSELuiMXactY6kyWy6pE0DdA+Nw85Hp1zobFXDm/MWNLQmD4GdI+NO/FpLEFBgDcsr9PpSmcNMwz/TNHIWYHkeCFP8fQlIjjxp1uqU60xVsILKvN+sfRTEAW/kruJlQ4gW2eCccXZ7Z3rrlPKOiM6N3shU1I/3Q2ueB1l68b+IqngYW2s2Z5hp+1u9qgJf9xnXESMlEjGL1ldxn8Hl//rdRZtlsdFLz12dtPAbFsL3XeFCT4id8qeyD460h2HLfwEOJqukQ4=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ1PR11MB6129.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366004)(346002)(396003)(39850400004)(136003)(376002)(230922051799003)(1800799012)(451199024)(186009)(64100799003)(5660300002)(2906002)(4326008)(8936002)(8676002)(36756003)(86362001)(41300700001)(38350700005)(83380400001)(9686003)(107886003)(2616005)(1076003)(6512007)(26005)(6916009)(66946007)(66476007)(66556008)(316002)(38100700002)(6666004)(6506007)(52116002)(966005)(6486002)(478600001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?75bBFv6/RJfa4Wxwm0d5s4bI41LAo4Pcsu4hfAgrNBxY+ZdvYCbAHzkHCMhz?=
 =?us-ascii?Q?QhBSRpQtNz6YaydF8B1nlE/ci/M+GOCpWRqM27JtBoJEfzvPr7Mz9etoeMuG?=
 =?us-ascii?Q?Tkxu3AW68v53BD5QAtC3h5Ma6oQ6l00z638oooMs19vdtCTL8OGNNiAplLT0?=
 =?us-ascii?Q?OPYy1FCsRXRLdxjkANhr1mvEFBzkyotxvQIRT1d+tWTgSNwqXfsiyH36Kvas?=
 =?us-ascii?Q?2BF7EkDQs3Lv2NKRFhJMOcEVQ3ZZizmRVvvjlU7g8aSWimnfBpVNxBQnBmfb?=
 =?us-ascii?Q?82dB5X6znEGY8cpcDTCAJEJKe2KTXxeinKiI3ruZHUtos9mO6jg3K5mRQ3Re?=
 =?us-ascii?Q?hWB7B/tzxYyC11RqvwQTNJJgvGzCJ1e2nCQcVRXQmmvI38cBIHckioiB73ku?=
 =?us-ascii?Q?MqwaeMKrqOb/qpWw7S/0R+Uo8dghdFQoDJrjGq3572qblPQ7b0ocHcQIhj0w?=
 =?us-ascii?Q?qLmGcjsLmREEtLJALnS5MXEpBdMUQegHEGBxF9TTud4wxDaXcNT0CjFee/fq?=
 =?us-ascii?Q?cJCVi204rHBIZ1ubobALJMRsCSXAkJ4b4YozfePZwbO7hcu8hAIguzcUMr/F?=
 =?us-ascii?Q?VV22PDXzKvAYIPlkkJ6aEjWJGOLbAMJVdhMPFT527yWB8mCERpQYvENw8YAr?=
 =?us-ascii?Q?d5oC8FqfxAkjBkA3fK+x94pcRZ3gRKjrDStqR5SR/7HOJCm17gtjr59rt5N3?=
 =?us-ascii?Q?TUWwn+ep3XZrfVxN67E+oPpTS0H3hIZe1xXtDa7BgWXUl3NnEu6gqhmFykuy?=
 =?us-ascii?Q?ss3HqmyVa/FUYdeaXYEJs8XIf8A9dsFeaeHNwDkRhAANZOhE8Owr4yXQNhrk?=
 =?us-ascii?Q?/KyrrwZUsvrkkSdpfQhV7Ay11w6njvL7ur6c1uvazQezkXeSq0sxF8WoDVVQ?=
 =?us-ascii?Q?oFN/5J44Z8nidCZ4Z30LP4VHR003u56pIhVq2X/lVtDy9X9z3ieKDxeG3S6Z?=
 =?us-ascii?Q?S8cfTF3K4FEC3oDyk2N486MNk7HjPucL3EeDS5yLBkg9fli9/Yh7p43n5AZO?=
 =?us-ascii?Q?ORp1CJ4glxG0vAIrK7zwFGz96XG6bdQ1e9oE2sFjq4jW/M5WQuWhQNUm73zD?=
 =?us-ascii?Q?I6i+xTTtZgaLe94hiBLdkIiPxU+PYdKODZ0bky5fm2iyKy80cjnBHQo2yVpM?=
 =?us-ascii?Q?L0/XejZbczR/1bB0N1E8SR2up4mZ+5wUrLT36BnsdBhjVYPLcNviFkdU57KX?=
 =?us-ascii?Q?b7hooG8cJWOrecsmyAJQZjB0RsoH3WmpGqwz4hjVGixiJ6nzEWUcRfI25yyr?=
 =?us-ascii?Q?35A8MqBmbYiQDsrWEItT9dFjLBLCEVxXYWloqs5JnmufRTBPVcaNlNLLUucj?=
 =?us-ascii?Q?iKqvkBGfBhfK/h/9u7JfNn0PlHKpPpGM3NR2aOKwXoWM6pH+JsIuYMNX1rOd?=
 =?us-ascii?Q?OdITbrtM55hct9uZqbOqWvgU25MLtC8cjUQo+HkmqNOiJcRODW4R+4z4bsCT?=
 =?us-ascii?Q?HXHXRI3p0dyB8alCz1eSKe4EgbYJLZFe7fUBrqNoUNbGmf7QYWBfjbqnBV9Q?=
 =?us-ascii?Q?dwojimeqzNXoVLoNfKQ/wlPDqk4BczP2rMHfWHPhin4hlqu0jo6cj/tHHYIA?=
 =?us-ascii?Q?Yno41L9KSNDvnnUnRJk1Qq+xNTozrJmeYBPLe7Ej9Nom91MrPdnKvEBEktwj?=
 =?us-ascii?Q?Tg=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5655b022-5c40-41b2-7d54-08dbf7d3e721
X-MS-Exchange-CrossTenant-AuthSource: SJ1PR11MB6129.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Dec 2023 09:56:09.2226
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Z8m72TiSrIGqiO26RpIu2T06NDPjnqWOurRRF9kNQavbrK0X04M5/LLAMOKartXdbzL1WDtRZqJSF99fLd5WTVgPhGsQY6488GjYMIwiAqo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB7166
X-Proofpoint-GUID: 6I7QsRa6LbLojbZoqXiYY5z1ri1c39YM
X-Proofpoint-ORIG-GUID: 6I7QsRa6LbLojbZoqXiYY5z1ri1c39YM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.987,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-11-16_25,2023-11-16_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 bulkscore=0
 adultscore=0 mlxlogscore=901 malwarescore=0 suspectscore=0 spamscore=0
 mlxscore=0 lowpriorityscore=0 priorityscore=1501 phishscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2311290000 definitions=main-2312080081
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 08 Dec 2023 09:56:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/192020

From: Yash Shinde <Yash.Shinde@windriver.com>

After rust is upgraded to 1.71 and later versions, the rust oe-selftest gives
build errors due to unstable nightly options. Thus, disable the test suite
until the issue is fixed

error: the option `Z` is only accepted on the nightly compiler
thread 'main' panicked at 'failed to gather the target spec for x86_64-poky-linux-gnu', synthetic_targets.rs:66:9

After rust is upgraded to 1.71 and later versions, the rust oe-selftest gives
build errors due to unstable nightly options. Thus, disable the test suite
until the issue is fixed.

Following issues are created in Yocto bugzilla and rust upstream to track this issue-

https://bugzilla.yoctoproject.org/show_bug.cgi?id=15275
https://github.com/rust-lang/rust/issues/115642
https://users.rust-lang.org/t/does-rust-test-suite-supports-nightly-options-during-bootstrapping-in-rust/103108
https://users.rust-lang.org/t/unable-to-read-target-specs-when-rust-1-73-is-bootstrapped-in-yocto-poky/102959

Signed-off-by: Yash Shinde <Yash.Shinde@windriver.com>
---
 meta/lib/oeqa/selftest/cases/rust.py | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/lib/oeqa/selftest/cases/rust.py b/meta/lib/oeqa/selftest/cases/rust.py
index 7d148142fc..6dbc517006 100644
--- a/meta/lib/oeqa/selftest/cases/rust.py
+++ b/meta/lib/oeqa/selftest/cases/rust.py
@@ -39,6 +39,9 @@ def parse_results(filename):
 @OETestTag("runqemu")
 class RustSelfTestSystemEmulated(OESelftestTestCase, OEPTestResultTestCase):
     def test_rust(self, *args, **kwargs):
+        # Disable Rust Oe-selftest
+        self.skipTest("The Rust Oe-selftest is disabled.")
+
         # build remote-test-server before image build
         recipe = "rust"
         start_time = time.time()
-- 
2.42.0


