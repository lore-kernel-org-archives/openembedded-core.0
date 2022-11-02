Return-Path: <Zheng.Qiu@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B56DFC433FE
	for <webhook@archiver.kernel.org>; Wed,  2 Nov 2022 14:42:35 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.6959.1667400150501123378
 for <openembedded-core@lists.openembedded.org>;
 Wed, 02 Nov 2022 07:42:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=hjqOZvAv;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=83055649e1=zheng.qiu@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 2A2CB8nS029127
	for <openembedded-core@lists.openembedded.org>; Wed, 2 Nov 2022 14:42:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=from : to : cc :
 subject : date : message-id : content-transfer-encoding : content-type :
 mime-version; s=PPS06212021;
 bh=UC2op2GHtXUSXbHyCzNXnO464vX0nRiCTA01EmOijjo=;
 b=hjqOZvAvVtmtxJnQvOoOdLy/fxLAw5GSlHw3t1eytRqXZjBNT4TCpGEu2EqSjIeMmqi5
 fGR/YISl4pFigkp6iW5h4wg1GevqzT+J830ENeI0+4+vZ69HqxzOHzuRK6ttn9/pQxNC
 5DayjVjzVql0q+0uNkOvWxaGWJ+1MQomhUw/O2yeU3qCUw/jjR0r2hBwpiVDHh13TDPk
 LiG67Ry+TaMZlGojWl1KCHiw0446yuFtTw5hA59q9h97DWEPvGQCEyYmnfNpm+aUtUx/
 lYKXCKPwnH2Ol0YSa+NqaZpdAeB4elmcVwP+9+cXutUSsyuNfagCx45gFZX86eQZU4h0 Yw== 
Received: from nam12-bn8-obe.outbound.protection.outlook.com (mail-bn8nam12lp2176.outbound.protection.outlook.com [104.47.55.176])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3kgu5c3dvb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 02 Nov 2022 14:42:29 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DTLY9EgO+jH6/h6KtkVxblUOx0WLJdZDFUxiI0VY2O04sx7o00k+9DSUFv1fNUkzKV5cIjK1Rcg5CBRMtpCBWk1sMUmpWDvStWuauL23X3XMUKm7uhENLsmrUsJdA2ZRbxTml9/ST94XGuYRpkY5I1MThzF49PrgxbLml9k5TJHw8uD2DqYUv/icuWrOma1bGMXrWLQSXIsEqKMhDm/WZNsrBMjKeQOyvvHVBTMloy2nBAK2NIVncxwknGazkKBZd8HAnxGlDoDOWTJrm0hiK5t1k9nRTN6GDQu+cSAP6OwEgS2zuGImtjEfIc+D5+tx87cHM6xPjHSDIxknkmAxlA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UC2op2GHtXUSXbHyCzNXnO464vX0nRiCTA01EmOijjo=;
 b=kQrdzbDMYNUxpxPPNel9lYP7STcfWUlB9BBvuZy0ISa2md0DVi6qPAzD24BMoOqtvraP8AyPK2HS0QlGwn+bPTEQHZn4WLa2TTl79kQO9mkfH5ZXj/20M0TKMqSUKvfcuU9oQc8XWWYfipyB/Ul53Z+2DuKICw+/f92Ehfofe2RgTEi8L1LTtRKv6J0O9o+h7ASvpXdS9Nzb9h40DNo01CDteJegn202gDBgWj29aF0yDjBO3GXV+leM4O2Ac6aAMTJeSgG7Plu8OlFgFMtwUzSpkZFOFhS8rbMN9vz02CdwmqlmoztQYZq8b8Ii6Nr5o9zNorLNHbllmGiMwUp9uw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DM4PR11MB5536.namprd11.prod.outlook.com (2603:10b6:5:39b::15)
 by DM4PR11MB5550.namprd11.prod.outlook.com (2603:10b6:5:38b::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5791.20; Wed, 2 Nov
 2022 14:42:27 +0000
Received: from DM4PR11MB5536.namprd11.prod.outlook.com
 ([fe80::76f2:e715:ba23:e517]) by DM4PR11MB5536.namprd11.prod.outlook.com
 ([fe80::76f2:e715:ba23:e517%7]) with mapi id 15.20.5769.021; Wed, 2 Nov 2022
 14:42:27 +0000
From: Zheng Qiu <zheng.qiu@windriver.com>
To: openembedded-core@lists.openembedded.org
Cc: zheng.qiu@windriver.com, randy.macleod@windriver.com
Subject: [master][PATCH] valgrind: update to 3.20.0
Date: Wed,  2 Nov 2022 10:41:59 -0400
Message-Id: <20221102144159.3362-1-zheng.qiu@windriver.com>
X-Mailer: git-send-email 2.33.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: YT1PR01CA0093.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:2d::32) To DM4PR11MB5536.namprd11.prod.outlook.com
 (2603:10b6:5:39b::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5536:EE_|DM4PR11MB5550:EE_
X-MS-Office365-Filtering-Correlation-Id: 19f66512-fca9-48b0-9982-08dabce07686
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	MxhlMAsXMkInqxYKhQTZaqEY3lzr/qQZTNA/U4tBBacq2q6eCx1xdk07VtZigiDlGtqu7rhk8yxAedvJKgQp2cYgjD4HsXJEMV3wULJ7iaUFheO/9cK6kWziJ0oJkQynINxhpP67wFkENk8aDiG0nYFvu7MRdDGCyoPUP3FBnJmO/oCxpwoS3RcaOr3VwMsEBlNpkfOFJ+M+/6CFkED39mk4XQ+za7t0glg6hUw8U5HnNBgPlfYnsYjtKGIFhpr4DCsXuWPdYBPt6aX8MH51Bb7ds6rAroo2FkJP+Wqcal80VqeX2bp+jjtYLajzaTarEJ/ftRZ1cRO4w9uxj8Q3kFF8bjfldI3HTcWlit0nXLyYWzfwY37rdKEirIgSK6UKn39ZPsRmWjt1RnQW0aPTckuiPDWqKbvkWa6eqAUq5XfHBFxhGiGbUMp1+Uc2uTvRPk5+CWYRXdEBIw/9Hir4jx0vZw/+0D1oNidZB/czG2vw/0oKzr5H4uLKuBPYDfHW0VAOnbRPFzY/sihacUeMBkIdk+qtlI32HdHuFWdpmtaL/xzR8BfrH+vSkJeUqIW+trMzL1iuwXqIhMlL1o8jpNcRSooohbTL+tOSjfIdWD7DS/+PX6SfF3rsakUglzuoZ33mQxgj2YtR1YFxNm7EaDtuyC6PXDaIDXK6xHGbrlVH/UOTn3NuSGP4fVSyhkx0lFrmcgx0yoLJUag9ZCPYxpYTIZAGm2+xO/Q+d2VlpopdlRB5W6mCz2nRRI4cTip8yIy/GKDjEJNaXGOtLzzMFdvyrBFLPNHcZ2dwmvAE6Ck=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR11MB5536.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(396003)(366004)(39850400004)(376002)(346002)(136003)(451199015)(26005)(6512007)(41300700001)(36756003)(83380400001)(2616005)(2906002)(44832011)(15650500001)(5660300002)(8936002)(1076003)(86362001)(38350700002)(38100700002)(186003)(316002)(6916009)(6666004)(107886003)(52116002)(478600001)(6486002)(8676002)(66556008)(66476007)(4326008)(66946007)(6506007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?zpuO3IZil+cZ60crErDdMgsZMB66xRQ0v2FkUG1KkVzBl6vlPIXaL7q1j3Tp?=
 =?us-ascii?Q?9toyP/ySqqUNegsajyRsDbIwqzc63CzjxelPBJ3Q0JeCwIpoBkDWLbBcKUFY?=
 =?us-ascii?Q?NlHVTlyTo+1YqP0vHowEVaHHeo94+CjS2QbGRK+1hBdjSbonKRS6H6B9eF85?=
 =?us-ascii?Q?RhWLc700KtfsW9WWptGJZm7NOdu0jLwg+ZPMLiIHYuQ0uxiXOAdeNOYImnvv?=
 =?us-ascii?Q?d6+imfHzMxY2eu0STvEoFBpVsahFgoiBYVfLvLkbaoIeBfDXaKfZeBc909Vw?=
 =?us-ascii?Q?sYnDaQIthakwYlNUVytXzYfFy7/Wwwu/X2H/Dgo9kFdnuKimNgU/mEv8MlyN?=
 =?us-ascii?Q?wDXjOIhzH/HUupE7qlqmC1qutTDP3lMfOXIkN1Re9+aS/Id5Z0LeDEHYL2r4?=
 =?us-ascii?Q?feva8OegYO0skNxEDLI2mF0gvpk7q0tiRNlPlExCUGvmZqme94Shmp9C9Lt1?=
 =?us-ascii?Q?QhrD8CQNwnHC1NTc3tcdIjHXm+FBID3sD25ZPEH6wgTlg3aUbdLSPz3m5Y/p?=
 =?us-ascii?Q?IEuEJ9GIz//dFWqfeRdfQVqMHuKNtRk4tnd0jfAMQCo/DPb9nledUsfC4+UA?=
 =?us-ascii?Q?jkas9UWllYUyF/0/1of3AEUogk0dMmHYKv3DiICfccphOzN0WRrVpmLQkE2l?=
 =?us-ascii?Q?7lZC0nacXKZOmi2MDSUTXP9cvk1pCMQqAioLSudxBSW5zE7h0g5suhYXixUA?=
 =?us-ascii?Q?Xdk9ArIO2mSNTzKiYU0L4rXjlwF3TxgyMyFWmYQ6pAaSqcZWd7zLf/sa4nUN?=
 =?us-ascii?Q?t4iqgLq0qyAAFaDianyJXAZjkgiwsMBl0RxHmZMx77nKrePvu1u01ovHG0wk?=
 =?us-ascii?Q?bVQLXOnkG5o6NwJQsbEo+/ExKdeBqYmyMxhKKrOEtJ6ia+jEkK7YDKR5BOPp?=
 =?us-ascii?Q?JugIxsOkaHRi1mNteBjft8McAsTrh16n6GQqlzJ/kReJ5+XqnJmh1Yo6InRp?=
 =?us-ascii?Q?WNM0xNN821P5afCqTNeV50Vo2IQzzMIqnER1ZpLqqcy0hrFduoBXjwEWMqak?=
 =?us-ascii?Q?4BbTGw38a5LM+ryphjliN+4Ibr7oizXxHAdZ3zOPkS9wuKJ1swLHnIJPHz9C?=
 =?us-ascii?Q?S/JxJENA6zxYXRBgAE/mk9Y9E7MhA4ltuE9FATI2Xk5IBNS40Qn2tyBMSWMM?=
 =?us-ascii?Q?2Pi0TwBL4A5M9wVt4CZTVCQY1qjxL98gLHT5W4vJcnjvFk7QPo0QpHpHL07S?=
 =?us-ascii?Q?7RByeK8fywzSOHHFPQlmR7fCu/nPMkbn98FnMUCmKGXoWJwFpjwCxlKt+3eN?=
 =?us-ascii?Q?BvaBf6DkiF9DJ4A28h0lyJcRxpaWAYmdAN8xL9P8XmLdoQocsVY8FN7hC8eR?=
 =?us-ascii?Q?bPFFPOOsfXQum4CWJ+N76zW7t7JoLTt18QdBUexWqGjmLJI/n225sdzUEaM4?=
 =?us-ascii?Q?tfuH50aBftPKloyC+s03soFTlvZ3yR+tBFZAhUJE5fVg1b5EbENYdFFroTJT?=
 =?us-ascii?Q?JUXx4cp7a11bpS35GkLSIfLL3OJjVVgHDWs88T0ibzErejBt1UHKISDoZSdU?=
 =?us-ascii?Q?PI5jiYPhc7fSozwghw8ATd5DMuWBkwecBsddydZIDzr2RV1TLEnp7lxI/WhY?=
 =?us-ascii?Q?hDZOzLz+CQhigL8E7Mc6Yr/3Y0SWFtmaCn5FvXmUWwYjF8hMhUAhFTE0WtEw?=
 =?us-ascii?Q?zA=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 19f66512-fca9-48b0-9982-08dabce07686
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5536.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Nov 2022 14:42:27.5137
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: T5US6iYQHvVpVA91VjLCzzSsQih5A2DZSNzq1P+G993p4cdr36EPCxp6VB1X0eASzq54uwqbv5drpO3xXoMzUQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB5550
X-Proofpoint-ORIG-GUID: yhk3Jeb1GoS8W9HlTy6yo8UYBs49w8Ow
X-Proofpoint-GUID: yhk3Jeb1GoS8W9HlTy6yo8UYBs49w8Ow
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-11-02_11,2022-11-02_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0
 impostorscore=0 lowpriorityscore=0 phishscore=0 mlxscore=0 bulkscore=0
 suspectscore=0 clxscore=1015 mlxlogscore=924 priorityscore=1501
 spamscore=0 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2210170000 definitions=main-2211020094
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 02 Nov 2022 14:42:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/172589

Changes in this update includes:
* The option "--vgdb-stop-at=event1,event2,..." accepts the new value
  abexit. This indicates to invoke gdbserver when your program exits
  abnormally (i.e. with a non zero exit code).
* Fix Rust v0 name demangling.
* The Linux rseq syscall is now implemented as (silently) returning
  ENOSYS.
* Add FreeBSD syscall wrappers for __specialfd and __realpathat.
* Remove FreeBSD dependencies on COMPAT10, which fixes compatibility
  with HardenedBSD
* The option --enable-debuginfod=<no|yes> [default: yes] has been added
  on Linux.
* More DWARF5 support as generated by clang14.

Drop the patch 0001-Fix-drd-tests-shared_timed_mutex.cpp.patch which was
merged upstream.

ptest result:
System   Pass  Fail  Skip
x86-64   717   0     20

Signed-off-by: Zheng Qiu <zheng.qiu@windriver.com>
Signed-off-by: Randy MacLeod <randy.macleod@windriver.com>
---
 ...Fix-drd-tests-shared_timed_mutex.cpp.patch | 26 -------------------
 ...{valgrind_3.19.0.bb => valgrind_3.20.0.bb} |  3 +--
 2 files changed, 1 insertion(+), 28 deletions(-)
 delete mode 100644 meta/recipes-devtools/valgrind/valgrind/0001-Fix-drd-tests-shared_timed_mutex.cpp.patch
 rename meta/recipes-devtools/valgrind/{valgrind_3.19.0.bb => valgrind_3.20.0.bb} (98%)

diff --git a/meta/recipes-devtools/valgrind/valgrind/0001-Fix-drd-tests-shared_timed_mutex.cpp.patch b/meta/recipes-devtools/valgrind/valgrind/0001-Fix-drd-tests-shared_timed_mutex.cpp.patch
deleted file mode 100644
index 738bf87c92..0000000000
--- a/meta/recipes-devtools/valgrind/valgrind/0001-Fix-drd-tests-shared_timed_mutex.cpp.patch
+++ /dev/null
@@ -1,26 +0,0 @@
-From 900b3f9b0765488f0e1f457ff5d5d1e3efe897de Mon Sep 17 00:00:00 2001
-From: Alexander Kanavin <alex@linutronix.de>
-Date: Wed, 27 Apr 2022 10:01:22 +0200
-Subject: [PATCH] Fix drd/tests/shared_timed_mutex.cpp
-
-Upstream-Status: Submitted [https://bugs.kde.org/show_bug.cgi?id=453055]
-Signed-off-by: Alexander Kanavin <alex@linutronix.de>
----
- drd/tests/shared_timed_mutex.cpp | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/drd/tests/shared_timed_mutex.cpp b/drd/tests/shared_timed_mutex.cpp
-index 9741169..dfd97a4 100644
---- a/drd/tests/shared_timed_mutex.cpp
-+++ b/drd/tests/shared_timed_mutex.cpp
-@@ -43,6 +43,7 @@ void g()
-         if (test_mutex.try_lock_shared_until(then))
-         {
-             test_mutex.unlock_shared();
-+            break;
-         }
-     }
-     if (i == 3)
--- 
-2.30.2
-
diff --git a/meta/recipes-devtools/valgrind/valgrind_3.19.0.bb b/meta/recipes-devtools/valgrind/valgrind_3.20.0.bb
similarity index 98%
rename from meta/recipes-devtools/valgrind/valgrind_3.19.0.bb
rename to meta/recipes-devtools/valgrind/valgrind_3.20.0.bb
index cb85e1d463..d641f5c000 100644
--- a/meta/recipes-devtools/valgrind/valgrind_3.19.0.bb
+++ b/meta/recipes-devtools/valgrind/valgrind_3.20.0.bb
@@ -38,9 +38,8 @@ SRC_URI = "https://sourceware.org/pub/valgrind/valgrind-${PV}.tar.bz2 \
            file://0001-none-tests-fdleak_cmsg.stderr.exp-adjust-tmp-paths.patch \
            file://0001-memcheck-tests-Fix-timerfd-syscall-test.patch \
            file://0001-docs-Disable-manual-validation.patch \
-           file://0001-Fix-drd-tests-shared_timed_mutex.cpp.patch \
            "
-SRC_URI[sha256sum] = "dd5e34486f1a483ff7be7300cc16b4d6b24690987877c3278d797534d6738f02"
+SRC_URI[sha256sum] = "8536c031dbe078d342f121fa881a9ecd205cb5a78e639005ad570011bdb9f3c6"
 UPSTREAM_CHECK_REGEX = "valgrind-(?P<pver>\d+(\.\d+)+)\.tar"
 
 COMPATIBLE_HOST = '(i.86|x86_64|arm|aarch64|mips|powerpc|powerpc64).*-linux'
-- 
2.33.0


