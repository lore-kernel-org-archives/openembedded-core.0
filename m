Return-Path: <jaipaul.cheernam@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A104ECA6014
	for <webhook@archiver.kernel.org>; Thu,  8 Oct 2026 19:59:36 +0000 (UTC)
Received: from OSPPR02CU001.outbound.protection.outlook.com (OSPPR02CU001.outbound.protection.outlook.com [40.107.159.57])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.3384.1791489566310501056
 for <openembedded-core@lists.openembedded.org>;
 Thu, 08 Oct 2026 12:59:29 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=eF/TRP7e;
 spf=pass (domain: est.tech, ip: 40.107.159.57, mailfrom: jaipaul.cheernam@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UN94B0NX4pqg8+VVQfbKtiTxOQZiMfaO3SCNN4JXKqlRYxgfOhFtSepnEG79rJG3cYryQU+EUW98RrKM71mmP3TRWH5yTeXLa9BAHmIyeh40xaY2pe9zEqRz9YrkVXdWyFjZq/LWj3EbmTrRNXJSnTPn8myYhQ8VMjAQyC6rRh5GKtRZw2kCCgHjWlp0BJK/87erNIPwYHCGqmtb9JDc6bnh24s9ZU0iJHg6Rnas6sq08roM2st3cqKq/z10LLfS3EAu7gWrv35GVe16FGNWlhCpCraLwNFjp2rXuXv8xBbUSJj0k9uqUcsLAjNulyeZ8KDp5ozG8dQySOuQElNuLw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=snObXQ0d1bkxGBbTI61v+G9AdF7ctWNhQzoX4sbeLYs=;
 b=P1v4gWBALNgoxu88yjbYy8JawUmr3AuTzREEfUrtZ4r7HRUqlR4wAIVZfrLy0t/rFW1oO63zP73V6ii8Kt9qDsaXXRI6tcETyachiN1UC0RCw6Ockc9L7goo+mpy4BpQW1ZKFFWyGIW/DXkTRrIKHi21gDIHU1PQzkEr6fIhOiOzBDUf6RWszBeR+KO55UFWArjMy4Rw2AB5QxHqN6mcJmQ9MagdhC7XWC4xEyeyA9v4rr1nkFGL/YQeTLE5fAocQtEr0olLcPt3FqlVHK622bzFGZtKJYnD824dpAk9midN0Aexmhuiw3YHzkJVPRbaDUTWCyhH6MNqYgxR2pLVvQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=snObXQ0d1bkxGBbTI61v+G9AdF7ctWNhQzoX4sbeLYs=;
 b=eF/TRP7eDuMmfjHg4lo2ULdwb8UnnW8O6+TP+vsFHg8v9jeF52+q6R7bgiO9gQ4NaHdFWjamyXhzwFxOfmi0DeSW2BsFmtqjkud13/Ii0OPTJiiaD/Z+M+ljKDHzODy21lSZmuN+JdthJN97MGpUdTtdGVyYT0PybOGxOpH/yaPoH8XFpIh0n+s4XpwwFD8Kzgoui1H0ctTtDg0NRy5dRydaVvOlZCyGD6SQS5ePr98O/Y1SrkF9P6sBJ4tgoTFeBgVxeFXbjp94H11hY1FuYVBU9Um29me1D2darYtV9Eb0GhmcmjwNDZkVAtN+N8OC26h7Rdw8IGCas21Cgt9/tw==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from AM6P189MB3107.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:6c0::19)
 by DB4P189MB3118.EURP189.PROD.OUTLOOK.COM (2603:10a6:10:5dc::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.17; Thu, 8 Oct
 2026 19:59:23 +0000
Received: from AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 ([fe80::bc97:3847:8f02:acb]) by AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 ([fe80::bc97:3847:8f02:acb%6]) with mapi id 15.21.0496.010; Thu, 8 Oct 2026
 19:59:23 +0000
From: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 3/6] powertop: upgrade 2.16 -> 2.16.1
Date: Thu,  8 Oct 2026 21:59:14 +0200
Message-ID: <20261008195917.22382-3-jaipaul.cheernam@est.tech>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20261008195917.22382-1-jaipaul.cheernam@est.tech>
References: <20261008195917.22382-1-jaipaul.cheernam@est.tech>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: DB9PR02CA0012.eurprd02.prod.outlook.com
 (2603:10a6:10:1d9::17) To AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:20b:6c0::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM6P189MB3107:EE_|DB4P189MB3118:EE_
X-MS-Office365-Filtering-Correlation-Id: ca798552-3c86-46cd-2897-08df2576a5da
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|23010399003|376014|1800799024|56012099006|11063799006|10067099003|18002099003|22082099003|3023799007;
X-Microsoft-Antispam-Message-Info: 
	YW9dZVWxcZVtYOKHK/9Cwm691cXSSNNPNQZ8W4isz0yHEXwrK//Nl4SwhkBSDTyyqFk2OsbE1Dvr6ns0+KFlVc1UOuIWVVdTQKYDyY1GV1nxWMK9CbN/wL/ySMrFOSRSmOVb+FSHidLVdUOzbSFi4qOMtMxmfwIqh5Zom7EVnY9Ko9krVUNBd8IxxXEhEycjozPhRQSXH4V9KzcG15oMTmrivyPo+ew7x10jqmAzbzZuTA+VzjP+U+D7/MuZLr8OS5HwVJVI99gOav8JTAte4hF05Ubz6Zr0BrxpaaP5btvXs1xRVkUAQO3SrTSeVnVqcOASJz2lFzpFVq0Don4O/H4QCkBtlPw6XL5GBvPqSiTXgJIbqMz1mESTTCqBC9r0Rs+U8bqQKqLoCV815wBEsFOHvcPbooyBoAQSIM/lGHVPiOZZpoGXYp4er29l1ImoaQON/rbt+eUUCkt4BG9cWz2iURDq7gBzfbJYIcL/zZge4tUojOLHgJ3vUeOr+q1fw2ETqEu3Qat64MxoGQg9iKrdiBA+Vkh8ye/lM1WrelcEcKWyDsQZC6W8sGCWLg52Y41nl2kn8QOvJbQcrw8P7okcu4sfGUPMwSjoG6mjvwLay00zY21+r/Ou8sl5KXv0j00Ub3KWioE/N1Wb0Nuq61fiJq+x2OWVhzdnIQXqthE=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6P189MB3107.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(376014)(1800799024)(56012099006)(11063799006)(10067099003)(18002099003)(22082099003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?dteRReAgIMfI6/aqhoJEXv6Jq0rqgwfouKWl/I1BawxiIX39LeF8rBg89qiF?=
 =?us-ascii?Q?j6/gIOG0CbUCCSVeO2ZUbKK/w1T/5NJIRKY1LZiWFVmQuNX7u7Z9s0evRTL/?=
 =?us-ascii?Q?9NzjiZ9EBR5dCh1RQ46EOuF9NBtxZZ9c6M5NwoKujF4LvHnIhpINbsjZcIoo?=
 =?us-ascii?Q?xjbw5KgreiZkTcoW6xQDbfAdeWHXXbqhVEyggG14uJzlRIgdezHmEbxyrI7j?=
 =?us-ascii?Q?g5W2f2Ttah+yiu5bEo8c5PjsHkEi/B5acimfgUxXfrMoJRcQ/Nqvf6XCkO/r?=
 =?us-ascii?Q?ubiDOGG/4CGg9algfIIO69ePCceDJFHD8drtmREgl7ojnfJSfanzfoKG8USd?=
 =?us-ascii?Q?EkE6jGWTpjz8YSxH0K39wg5Z7GM9994j0J/g/VYRLF9cTOfjDGofVBTetyi5?=
 =?us-ascii?Q?/WI+9ApEh1M8xAhOw4zq/D+flDkHy/drU5Gj8pJXm8MN0F0COfjmInl1EO2/?=
 =?us-ascii?Q?rK7wmrjMUT6/JND14/rvtsYJDqz7b4EOGSyNMZjPKGVzviBDzn9Oaqo/3aos?=
 =?us-ascii?Q?+mW8JiypojvnZDmp+NDCfkCQCnAua3aBDF7qZjFGBzUT4bE+qqFOiDsuPEWZ?=
 =?us-ascii?Q?yvlM2zXo18Rz/mjLVfm+dQ4KU7f4Fz/5wA2cqkoKf7/nW2F0OK6GMZQGixw7?=
 =?us-ascii?Q?ZLZw2zt8mvaNMfnfmLDFBNHU6Ygq86KNj03C3gOeKKDorl+KBEJTKSGk3nbe?=
 =?us-ascii?Q?qGMA4vSDntF/iAekz3kvakHg1OlB7cSB6/KzPUALhgqzTkrZ97tk43UdgfKw?=
 =?us-ascii?Q?EHJYjWcmSsWLnpOxcIYi9nGqNpHLvpNm1qaKPOGHtsruyr5wnN1FA1kNNoZG?=
 =?us-ascii?Q?wSoku6BJRP8WrbLDMOjgFqd9L2LtVmMJ7WJ32WoqrgZy7ZV22nQjLMgR4B+N?=
 =?us-ascii?Q?JbAlOAX4tQnN94TM9CDp0rvCoc1J87BEyYujqnO/nzYwO0i+mSpc2d9t1Tzk?=
 =?us-ascii?Q?mlIO3hXe7kwpPUUntroRED+/dei7QQJoc+OFchH4Zht34khXIoWHtf61Ut80?=
 =?us-ascii?Q?WXqf/Yesm54gljpEkuIcxzKYMNgxv6VxWaSyh+ABW6S7IuH0xaYCZ2gIcvHW?=
 =?us-ascii?Q?a4TpADl7PI+rXkE/BXwrZSA+cW/fNuhCL9W4g6431b/r91/p6rZaNcitGZZ5?=
 =?us-ascii?Q?1D21eiHSqUaG3fv2bmn1OscMsKCxNVicOjW/J4u7AnjokxMu42EUI0Ya5qsj?=
 =?us-ascii?Q?9wE94On22DinnrrV5m7CW0/jceefItyq90GQTEb0NwwNBNn9xiscmfLCew1V?=
 =?us-ascii?Q?1QjIiyZTfg1fyqOEkEaZGH3a19JJMwKM6UxpPx9di/24UjhN/5SFfQd26Aqi?=
 =?us-ascii?Q?YsQad9aibnauV4iwACyhdzC2yBDsqeLvwyj7d9DzPOdT36JlllU7Jr4pr4z2?=
 =?us-ascii?Q?i2fuNPzJvZjK95saxhvliS4HnzEjR8qyvON2O+orMAUm5N19MfnLe5j6gJ0h?=
 =?us-ascii?Q?628RjNG4jc/JztDhdZaw+gizyGW7gGkrxpw41HJ9Dgv5srwqIGcQb3y5WAAv?=
 =?us-ascii?Q?MhQH7WxyEsnEcMhel8luAuFKbHpMbScMML3h5lJuKXSQkgJSv9ij4Xr3/Eix?=
 =?us-ascii?Q?S40sAHol75xs6RuPfutZtfvzSD+/P4Sfsmd0N/L3MISCu0IKdBvI+9LehxFW?=
 =?us-ascii?Q?eqDz5A9fkqSJUj3qh8DLmtXuhCwGSTl/TeLJLPe5PD3tOWXCwXVr64T4t0y5?=
 =?us-ascii?Q?ySh++fX/wpuEPVjr1ny9KKi3TXQsxsgATicn/oaa9PYiyFT5brdwfivCZ3RH?=
 =?us-ascii?Q?70yh0XnYKwJMWharwunrw5QjxKJhylw=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: ca798552-3c86-46cd-2897-08df2576a5da
X-MS-Exchange-CrossTenant-AuthSource: AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Oct 2026 19:59:23.0654
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XIi2k0x6PY+eE0rhxxl3u0caNThUHhgPtVIg+qY0u0OgVeMiM6E250itUXB33uFcIlsdIRgmI+cvfVY5rc9+WYXt05AABHyuE3MKXVBU9ik=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB4P189MB3118
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 08 Oct 2026 19:59:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/247444

release: bump version to v2.16.1 and update translations/release notes
devlist: migrate owning devuser/devpower vectors to unique_ptr
Migrate tab_windows to sole unique_ptr ownership
local.md: document tab_windows mixed-ownership scoping notes
process/work: migrate all_work to map<unsigned long, unique_ptr<work>>
process/timer: migrate all_timers to map<uint64_t, unique_ptr<timer>>
parameters: migrate past_results to vector<unique_ptr<result_bundle>>
devices: migrate all_devices to vector<unique_ptr<device>>
devfreq: drop non-actionable "Devfreq not enabled" stderr message
local.md: note cursor_down() scroll-cap pitfall from #217
display: fix broken cursor navigation on WakeUp/Tunables tabs
Log RAII migration progress in local.md
Convert 4 more single owning pointers to unique_ptr (RAII pass 2)
Update local.md with unique_ptr conversion pattern learnings
Fix review item #1: convert report_maker's formatter to unique_ptr
Fix review item #3: device_has_runtime_pm() misreads legitimate zero values
Fix review items #4 and #5: unused include and unenforced invariant
Add audited .clang-format and reformat two review-flagged files
docs: record std::from_chars leading-plus-sign gotcha in local.md
devlist,extech: modernize remaining strtoull/strtod to std::from_chars
Merge pull request #219 from prownd/parameters-show-power-estimates-with-25=
0-or-
more-parameters-s01
Merge pull request #227 from prownd/main-add-vi-style-navigation-keys-s01
Merge pull request #226 from prownd/tests-don-t-read-the-host-MSRs-in-the-
rapl_interface-tests-s01
Merge pull request #225 from prownd/meson-point-PACKAGE_BUGREPORT-at-the-Gi=
tHub-
issue-tracker-s01
Merge pull request #224 from prownd/process-drop-debug-printf-that-corrupts=
-the-
interact-screen-s01
docs: record RAPL stub fail-injection testing pattern in local.md
drop stale file left over from autoconf
tests: add regression test for gpu_rapl_device uninitialized energy (PR #22=
3)
Merge pull request #223 from prownd/gpu_rapl_device-don-t-use-an-uninitiali=
zed-
energy-value-s01
Merge pull request #222 from prownd/main-check-the-statfs-result-before-usi=
ng-
it-s01
docs: note fs_compile_project fix and remaining run_cpp issue
Merge pull request #221 from prownd/extech-reject-invalid-BCD-digits-and-do=
n-t-
report-errors-as-power-s01
docs: update local.md with PR review workflow notes
main: use EXIT_FAILURE/EXIT_SUCCESS and std::from_chars for option parsing
Merge pull request #220 from prownd/main-accept-s-and-reject-non-positive-
numeric-option-values-s01
main: add vi-style navigation keys
tests: don't read the host MSRs in the rapl_interface tests
meson: point PACKAGE_BUGREPORT at the GitHub issue tracker
process: drop debug printf that corrupts the interactive screen
gpu_rapl_device: don't use an uninitialized energy value
main: check the statfs() result before using it
extech: reject invalid BCD digits and don't report errors as power
main: accept -s and reject non-positive numeric option values
parameters: show power estimates with 250 or more parameters
Merge pull request #218 from EkaterinePapava/master
po: Add Georgian translation
po: Add Georgian translation
devices: hide rfkill from Device stats list
Bump version to 2.16.1-rc1
remove legacy autoconf support
Bump autoconf C++ standard requirement to C++20
Merge pull request #212 from jubalh/fix-missing-files
Add missing files to Makefile.am

Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
---
 .../powertop/{powertop_2.16.bb =3D> powertop_2.16.1.bb}           | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-kernel/powertop/{powertop_2.16.bb =3D> powertop_2.16.1=
.bb} (93%)

diff --git a/meta/recipes-kernel/powertop/powertop_2.16.bb b/meta/recipes-k=
ernel/powertop/powertop_2.16.1.bb
similarity index 93%
rename from meta/recipes-kernel/powertop/powertop_2.16.bb
rename to meta/recipes-kernel/powertop/powertop_2.16.1.bb
index 674cf67b5a..4cfff1da1c 100644
--- a/meta/recipes-kernel/powertop/powertop_2.16.bb
+++ b/meta/recipes-kernel/powertop/powertop_2.16.1.bb
@@ -7,7 +7,7 @@ LICENSE =3D "GPL-2.0-only"
 LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D12f884d2ae1ff87c09e5b7ccc2c4ca7=
e"
=20
 SRC_URI =3D "git://github.com/fenrus75/powertop;protocol=3Dhttps;branch=3D=
master;tag=3Dv${PV}"
-SRCREV =3D "6147262e506c607036eaca4182ee491b61d06aa3"
+SRCREV =3D "11db5648c9fdea97d36ce6a11ef282e4e037aa92"
=20
 inherit meson gettext pkgconfig bash-completion
=20

