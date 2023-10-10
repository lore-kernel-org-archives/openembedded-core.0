Return-Path: <william.lyu@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8164ECD80DD
	for <webhook@archiver.kernel.org>; Tue, 10 Oct 2023 14:10:49 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.92651.1696947040639367432
 for <openembedded-core@lists.openembedded.org>;
 Tue, 10 Oct 2023 07:10:40 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@windriver.com header.s=PPS06212021 header.b=YHDX66qu;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=8647bc4a70=william.lyu@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id 39ACL158020520
	for <openembedded-core@lists.openembedded.org>; Tue, 10 Oct 2023 14:10:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=from:to:subject:date:message-id:content-type
	:content-transfer-encoding:mime-version; s=PPS06212021; bh=rANmg
	r4Yt6mwLiwdRm5chMZUxp3m5OqqI6AFTh9UYjc=; b=YHDX66qu4RxKnZiA7JMtk
	q7obLHLVfhOv8AilZE6nyjcO5bFW5oCuqVT8mo/o2+YKFaP3pKCfI6ovL6QQKvt6
	ffP0QE6SmVqrZyfK/D7cbZXtkvODQlsnhrZAhk/Bt0NBjbkU697nClrksukG/LvX
	UYaZTeKMsTfK8t29zo7XbX0FTpsA86qo5hcCJufk67cZxnxBWvBQDs829uivvGFw
	RbgH0uHAw7Lo5Y1+vValJdQ1pVkff+35rGnvqzkt7zm5L9kJGDzmkcGgnCXgtuaC
	yh1e4bqweDfwYdDxws/qHkxXvPlLATZ5z6mKK0qOwj+uWci1O/m+KpK5slfMVmIo
	w==
Received: from nam11-co1-obe.outbound.protection.outlook.com (mail-co1nam11lp2168.outbound.protection.outlook.com [104.47.56.168])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3tjxa6arpm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 10 Oct 2023 14:10:39 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NL9WIvfO9nBCJ4ODSoXegiriIESw2rCmqlqxFR7X8D8sueLjILg7MF6c750J0VzPxiXvqbx2a/IBdIk8ne6YdJhXrbzlHtixDPJ6ThKYVj9/QVZ1Dc8EJ+0pLp1BJoO4R02DtDjZHwci/ybpA+F8UNOkNfsULEp6/3oruubDp5bJG8rLpsGUNxgsTz31Eul6tBgbdBmv/qf2hzYf1W3vkxsQpe2d9HXsIbPOP5Fzry9fOrERUfAhW0gpx6LcGASAbmbE2jFEN/LW7ICz5n/JM/P8K/iT1Cn4c+TKsNZtMFpotlSmmW0lKxFPtcQfjuAuF9OHpLsz54U0gb8RHgQJgQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rANmgr4Yt6mwLiwdRm5chMZUxp3m5OqqI6AFTh9UYjc=;
 b=dNbNKhyKmwiFNDjboRilrVKHVyIrHH5PjwHKeRz3imN+X8nsg9sAYwqyLxaoowOUwqX5JZqy16ZlGJqT/0B4aCcAg9RaYPrnuqWUDCwlf51GnGYfakv+ZW9gm465pyhjyYxLRA7Z8IoDBCBPbU7fI1P12d32Tbvu5fBxg1iViCI+vU/9ZpmI3q4/rk4HIUoGURKOp0BVfP255tzVG0mNTcn0Lb0eS+qdocfi0SAnU1IP2IrPjBQSrvCaYyyWYBizrWOPVJgPiSNJNkKbXFVDizCVHqOk7iUJid8Q+BZOwklWRrdYOzWpsZEJaKxWeul983rgmwJwl2d6zbFB8uMu7w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CY5PR11MB6342.namprd11.prod.outlook.com (2603:10b6:930:3d::20)
 by CH3PR11MB8548.namprd11.prod.outlook.com (2603:10b6:610:1ba::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6863.37; Tue, 10 Oct
 2023 14:10:35 +0000
Received: from CY5PR11MB6342.namprd11.prod.outlook.com
 ([fe80::c557:c593:fa75:31bc]) by CY5PR11MB6342.namprd11.prod.outlook.com
 ([fe80::c557:c593:fa75:31bc%3]) with mapi id 15.20.6838.040; Tue, 10 Oct 2023
 14:10:35 +0000
From: William.Lyu@windriver.com
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] perl: fix intermittent test failure
Date: Tue, 10 Oct 2023 10:10:07 -0400
Message-Id: <20231010141007.1943009-1-William.Lyu@windriver.com>
X-Mailer: git-send-email 2.25.1
Content-Type: text/plain; charset=utf-8
X-ClientProxiedBy: SJ0PR13CA0098.namprd13.prod.outlook.com
 (2603:10b6:a03:2c5::13) To CY5PR11MB6342.namprd11.prod.outlook.com
 (2603:10b6:930:3d::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6342:EE_|CH3PR11MB8548:EE_
X-MS-Office365-Filtering-Correlation-Id: 32b0e6d0-ed6d-4ace-33c9-08dbc99aabe7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	LhSa+lUm5KSthWY6S7in5X/OGBaoloJNmmzbHfXbBQLArczJmMiXfRPQ0gSJrwmMdPDrlTgX60xcF5IRBeELJbZWc5xrGL4i7vFldB0ZCGeCdKOa4o6dE4/1XO0aNT0dLuNhel4b1w1n5k9fGl4uNqgSWjJiHpYFmlGcdghYuHD4HIL/nrGMdyrlAdoFfWxc+6TWGmU/s9/4XtJA5IgfiPveseMQUw66PQYjHgMK93ChpmT6UwFtK1Hg+5RWu51CRgRNmf+FYKLR0Q+9KBGBojqoz/pwBlkhkg7sMwZgJv71yzTytA98K1tMLpP/Bh/emXnyHafYfHlXlzwxusCYSg6V1V3Z2dPtDQi9bfmnS64jOpxhSrq0JSL7TmrpTzlXq3xS6QjuSObGbQwlS0tNNhnzbi/koCsO7V2juDN/hmb/V2xdX+eI6L2HduMA47Smu5JQvSHr7jG/UrHuk7hFQl0R+RM7j/Y/1uBqyanPZ6AmH8NWz0LaVAbUzcYR2ca5Yf+iACLWfBUtHV9hJGPkT/mQ/16g3XepVvW67EzlJP8bPTjQAnBmAorgSq0n7LYVyIR+opJdsCiOy16e8jqHJXrviBFxPNh3bOZ9iTDH/Pc=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY5PR11MB6342.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(39850400004)(396003)(366004)(136003)(346002)(376002)(230922051799003)(451199024)(186009)(1800799009)(64100799003)(6512007)(2616005)(9686003)(6506007)(52116002)(1076003)(478600001)(316002)(41300700001)(6486002)(83380400001)(66574015)(966005)(2906002)(66476007)(66556008)(5660300002)(6916009)(66946007)(8676002)(8936002)(26005)(38350700002)(38100700002)(36756003)(86362001)(6666004);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?ZUpXWlRISmNITXhZcmtTS2lyRjVGdmFyL1pTL0xoaG4vcjhNL3d3VnpsUGVr?=
 =?utf-8?B?bE45aEg1UXNXakhYdkxlUFAxMjJTT1Nnd09EL2xlTUFUL3A2QUI3QW5aWVNQ?=
 =?utf-8?B?bXMzTTcyVUNpZmFjVTZ4Z0Vac1N3c0hNMG9YK3gxbnNPZzRKbWJBeExQTnFt?=
 =?utf-8?B?L0M4TG13QmlsNnlEcU8vMWdjOHcrOExwejNrSE5VcDNMb20ycjBWQWZWV2Z0?=
 =?utf-8?B?VFQ5RjJBUDlISTdlczQ1MEVDbGJMRmFmQ2ZPNjFSUnhtcHlveUJCSTM2SUpC?=
 =?utf-8?B?bm5iQ3dyU0tuVjI0MEFUNDJ4YUNtUlZnc3kyUW5xaWx5dXJ1MzJudzZINy9I?=
 =?utf-8?B?NUR3TVpEblhuTFdqWmxxeXJmZloxd1JTMUo0bG1vTkcvVm9jMkwvRjBHRVFD?=
 =?utf-8?B?bFpFTVNqVC9BdUJxY3pscWNhUkZQeVNYNEJqV2Z1bm5VZmVZMjRHZlg2c2Zt?=
 =?utf-8?B?MUZwa24yNTRaZkdRRURIdWxPNGZIaTQzSHFqTUJvZkZaTVF6U1J0eFlieHI1?=
 =?utf-8?B?V2dyWlE3U2xPT0pzYVp2dGluRWlraFlPWDV2NUg4RmhRNjY5K21qanZUbGl6?=
 =?utf-8?B?YjJWNytJd2Y4eWRLUndpR2F2WDlhWENFcmpLRGFhQmJwWkVPOS9NMGluRmw5?=
 =?utf-8?B?M2drWmovTG5jNkw0UHRBQVhZVzdyejY3MmpieTdPWHpDN2tQUlgrTTFXRU9z?=
 =?utf-8?B?cUF0UkJhaVBBOGh0TzRiRW00citHeXRYZWhEUTg1UXI3N1dLZXZWYm1ITGR3?=
 =?utf-8?B?RFY0MENiWndqcHhDRTNLTEsyRVdoZVpuQTZ1ZWtheUJZZE5PRG9wcWp4TlI0?=
 =?utf-8?B?MFg4WUFoY2puL0I0U1hkbE5UTlBCcm5xdnU4MXJqRm5Jd0pTbjlmVzkzYWVZ?=
 =?utf-8?B?bWdyMDlyVFArSUdJcks2dko2NEpKYnA2WWNHVnVXYlM0dm9JMlVTSTl0Mmpr?=
 =?utf-8?B?eWhXWWpWVk90a1BLSEtQb0kwbTVSblpVRlZPdGVvd3FhZ096MllYUSs3dkpU?=
 =?utf-8?B?TnFneVJXWjFuN3JEQlI2UEJwaHZBVE8xcnRPR0NQRmd1dTQ5eWxZMDZEbUVD?=
 =?utf-8?B?dUZnVzdRYkRINTlTZW5ya1hRZTV2OGg2UThVSUpkMVQwSlNMK1Bpby9lYWZk?=
 =?utf-8?B?TStoZWczZHFZU2pqenFpWW1xS3NaSVJMdGRCK0c0diszZ3BEODMwS21RQUNZ?=
 =?utf-8?B?VFFGdWRJVk1WVXd1YU9mbUtxK0NBUWxkYm9vb05oQXNQWTdaWk9CWFZ4eXJs?=
 =?utf-8?B?TVFTRGlEaUE5bTJoS0hEaGRod2luVjAwR1BVSW9Fcm5jMENOOVU0ZXRqcHBw?=
 =?utf-8?B?U1RGTEc3TlRTU3pEUTdydEhEb1hablJpREd0MlFGcU53eW1BTHZLOEh5WWhN?=
 =?utf-8?B?NVU1NHF3dkk0V1grVVNyeWs5YTBha3BKejBtWW02V3FkU053UDJTUkpzOEpE?=
 =?utf-8?B?T1U2OXVZQi9ndGdjMXNyOWgxMlM5ZlNSUHlEbkZmbWo1VVR5L2FWaFN0Y3BX?=
 =?utf-8?B?VFFuZCtGQXlqYTNTYkVuMXNPaVVtK1J1Wk1qWnREV2lFdjRqTk9ZbG1CNVlT?=
 =?utf-8?B?eHhLdEJJSU1xQ3NoOXJVSjk3bWVHa1BmbnlNTGhaVEh1T3dzNFRJRDg4V0NX?=
 =?utf-8?B?WG9GVzcwRHhUUW5ibjg2QjFzRVVQSXBGTmFqcjVxcjNocHN3VkRJWDI5bVhZ?=
 =?utf-8?B?Z0QwNmFoZnpNQnlEdnpVUXRLMXBxS1NXc0ZkVTZQa3BycGNDN2ZhbDk1WDRO?=
 =?utf-8?B?NTZtZkdCYUFGeGV6eVh0WkRreW5kSzNpU0FuTEtuNWJPS1FVRUI4SVYybDRI?=
 =?utf-8?B?aHViR054VDNxZ1JsaWs2RmZ6S3RQSFpBaWpHOE5JeHp5Y20wNGJ2MXlaU2F2?=
 =?utf-8?B?ZnhyWmVlMm5WVHVjanZSVFJzS1JmU0tZWjgwcG1reGU3Qm8vbTNRdGVjQit6?=
 =?utf-8?B?S2diVWJWWVFzQ01UWWk1UjJzYjVNQUtKNDBubFRpdzdiY3BsYzV3YWFudzhx?=
 =?utf-8?B?RUlKdno1T3NaZFhKWFlvSUdTbFlhVVhLcGh6NTJvVzhGZnY5QnJGVG1pT3I2?=
 =?utf-8?B?blpQUFlqV25wMHpSd1A5REJIUHJmcysyQ1FRb05KUFFNeGtjeG04dWRlSWd2?=
 =?utf-8?B?SHBteCtoSGFTZWF2NWlCY1NsQWZ4N0hFNlh0aFNSUEVneCt2UHEzZm1XSk44?=
 =?utf-8?B?TkE9PQ==?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 32b0e6d0-ed6d-4ace-33c9-08dbc99aabe7
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6342.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Oct 2023 14:10:35.1356
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PQHSN3ue0FZDI4tJOkHrAn2oM8Nmp3QqNgxEh+KbVCCm2n0+tDf88MPennGFHMsDtjM01BzZJCdytw4xiBuMthR2Xg6BgC2TVQYue7MYIds=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB8548
X-Proofpoint-GUID: tBi1jKRQTDqKSU8vByNTckUQDHOfTocj
X-Proofpoint-ORIG-GUID: tBi1jKRQTDqKSU8vByNTckUQDHOfTocj
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.980,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-10-10_10,2023-10-10_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 spamscore=0
 phishscore=0 priorityscore=1501 bulkscore=0 clxscore=1011 adultscore=0
 lowpriorityscore=0 mlxlogscore=888 malwarescore=0 mlxscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2309180000 definitions=main-2310100103
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 39ACL158020520
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 10 Oct 2023 14:10:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/188897

From: William Lyu <William.Lyu@windriver.com>

Fixes [YOCTO #15136]

This fix addresses the intermittent failure of the Perl ptest
t/op/sigsystem.t.

Signed-off-by: William Lyu <William.Lyu@windriver.com>
Signed-off-by: Randy MacLeod <randy.macleod@windriver.com>
Reported-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
---
 ...ent-failure-of-test-t-op-sigsystem.t.patch | 77 +++++++++++++++++++
 meta/recipes-devtools/perl/perl_5.38.0.bb     |  1 +
 2 files changed, 78 insertions(+)
 create mode 100644 meta/recipes-devtools/perl/files/0001-Fix-intermitten=
t-failure-of-test-t-op-sigsystem.t.patch

diff --git a/meta/recipes-devtools/perl/files/0001-Fix-intermittent-failu=
re-of-test-t-op-sigsystem.t.patch b/meta/recipes-devtools/perl/files/0001=
-Fix-intermittent-failure-of-test-t-op-sigsystem.t.patch
new file mode 100644
index 0000000000..86fd42cd3d
--- /dev/null
+++ b/meta/recipes-devtools/perl/files/0001-Fix-intermittent-failure-of-t=
est-t-op-sigsystem.t.patch
@@ -0,0 +1,77 @@
+From 75d974a58c461b3b5d35280e497810e46abae4ca Mon Sep 17 00:00:00 2001
+From: William Lyu <William.Lyu@windriver.com>
+Date: Wed, 4 Oct 2023 08:58:41 -0400
+Subject: [PATCH] Fix intermittent failure of test t/op/sigsystem.t
+
+[Perl issue #21546] -- https://github.com/Perl/perl5/issues/21546
+
+This fix addresses the intermittent failure of the test
+t/op/sigsystem.t by improving its robustness. Before the fix, this
+test waits a hard-coded amount of time in the parent process for the
+child process to exit, and the child process may not be able to exit
+soon enough. With this fix, the parent process in this test polls for
+whether the SIGCHLD handler reaped the child process for at most 25
+seconds.
+
+Upstream-Status: Backport [commit ID: 75d974a]
+
+Signed-off-by: William Lyu <William.Lyu@windriver.com>
+Signed-off-by: Randy MacLeod <randy.macleod@windriver.com>
+Reported-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
+
+Committer: William Lyu is now a Perl author.
+---
+ AUTHORS          |  1 +
+ t/op/sigsystem.t | 17 ++++++++++++++---
+ 2 files changed, 15 insertions(+), 3 deletions(-)
+
+diff --git a/AUTHORS b/AUTHORS
+index 21948bfdc7..527dd992fd 100644
+--- a/AUTHORS
++++ b/AUTHORS
+@@ -1443,6 +1443,7 @@ Wayne Scott                    <wscott@ichips.inte=
l.com>
+ Wayne Thompson                 <Wayne.Thompson@Ebay.sun.com>
+ Wilfredo S=C3=A1nchez               <wsanchez@mit.edu>
+ William J. Middleton           <William.Middleton@oslo.mobil.telenor.no=
>
++William Lyu                    <William.Lyu@windriver.com>
+ William Mann                   <wmann@avici.com>
+ William Middleton              <wmiddlet@adobe.com>
+ William R Ward                 <hermit@BayView.COM>
+diff --git a/t/op/sigsystem.t b/t/op/sigsystem.t
+index 25da854902..831feefb0f 100644
+--- a/t/op/sigsystem.t
++++ b/t/op/sigsystem.t
+@@ -37,7 +37,15 @@ SKIP: {
+     test_system('with reaper');
+=20
+     note("Waiting briefly for SIGCHLD...");
+-    Time::HiRes::sleep(0.500);
++
++    # Wait at most 50 * 0.500 =3D 25.0 seconds for the child process to=
 be=20
++    # reaped. If the child process exits and gets reaped early, this po=
lling
++    # loop will exit early.=20
++
++    for (1..50) {
++	last if @pids;
++	Time::HiRes::sleep(0.500);
++    }
+=20
+     ok(@pids =3D=3D 1, 'Reaped only one process');
+     ok($pids[0] =3D=3D $pid, "Reaped the right process.") or diag(Dumpe=
r(\@pids));
+@@ -50,8 +58,11 @@ sub test_system {
+     my $got_zeroes      =3D 0;
+=20
+     # This test is looking for a race between system()'s waitpid() and =
a
+-    # signal handler.    Looping a few times increases the chances of
+-    # catching the error.
++    # signal handler. The system() call is expected to not interfere wi=
th the=20
++    # SIGCHLD signal handler. In particular, the wait() called within s=
ystem()=20
++    # is expected to reap the child process forked by system() before t=
he=20
++    # SIGCHLD signal handler is called.=20
++    # Looping a few times increases the chances of catching the error.
+=20
+     for (1..$expected_zeroes) {
+ 	$got_zeroes++ unless system(TRUE);
+--=20
+2.25.1
+
diff --git a/meta/recipes-devtools/perl/perl_5.38.0.bb b/meta/recipes-dev=
tools/perl/perl_5.38.0.bb
index 956e4d64d7..639664e355 100644
--- a/meta/recipes-devtools/perl/perl_5.38.0.bb
+++ b/meta/recipes-devtools/perl/perl_5.38.0.bb
@@ -17,6 +17,7 @@ SRC_URI =3D "https://www.cpan.org/src/5.0/perl-${PV}.ta=
r.gz;name=3Dperl \
            file://0002-Constant-Fix-up-shebang.patch \
            file://determinism.patch \
            file://0001-cpan-Sys-Syslog-Makefile.PL-Fix-_PATH_LOG-for-det=
erm.patch \
+           file://0001-Fix-intermittent-failure-of-test-t-op-sigsystem.t=
.patch \
            "
 SRC_URI:append:class-native =3D " \
            file://perl-configpm-switch.patch \
--=20
2.25.1


