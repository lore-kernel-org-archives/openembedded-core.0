Return-Path: <sakib.sajal@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0B138C77B7A
	for <webhook@archiver.kernel.org>; Wed, 24 May 2023 05:29:23 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.2356.1684906158641514485
 for <openembedded-core@lists.openembedded.org>;
 Tue, 23 May 2023 22:29:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=bg0CNp3v;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=45082ad12b=sakib.sajal@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 34O59in5027564
	for <openembedded-core@lists.openembedded.org>; Wed, 24 May 2023 05:29:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=from : to :
 subject : date : message-id : content-transfer-encoding : content-type :
 mime-version; s=PPS06212021;
 bh=sUhKAzrMckuYCwOwBUCY/wp11FbEe/v28xz/DkO6GM0=;
 b=bg0CNp3vusjnewLoMSYWyz/q/b8KRqKVVkJKX9TQPVLOn0eVuDX+lQbEFEkqxs5MV0+A
 QeUVTNYMUbZv4CXu1K67ZFh5318Ecin6np/cwYU9vdXbmaaRwxaymrV8rBCgRvVrzbvM
 ajrA7DcduJIhmIMRzPrhMInyUhVLk1IIKr0jqvBv9bg2Su721TSHTL5txbLluC6RGqYm
 NT2I2NU/uyNaCibv4jbsG1j6WERoggwSR7UIMIUh1r4XMf35ZvyqPBzAOUm2fpAmXcab
 HdZDVmofTyHeZP/hy1k+7bJiZ5ndXUF8r+UlPEkxKXO/6E/pXviWX0BlGiuxdylvKFLO RA== 
Received: from nam11-co1-obe.outbound.protection.outlook.com (mail-co1nam11lp2169.outbound.protection.outlook.com [104.47.56.169])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3qpkn1km60-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 24 May 2023 05:29:17 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=n2w1D6hymTAVyXOGIQsiXYPxpysOP5mZS6QXo02J/Rtwv4LvKF65GM/l6AZvoJynJ9hUKAwBwEUocifQQ83mVJ5IuFGjWG4TjLoQrRD4y7D1qBOEtrbh1wM/FrJlLYut155QqgzpNiZPwzxY+5FIEPS8YeoZMYFKS0yFPVwGGxzVIW2gJEo4YR8mYhheFfFATqx5E3Xk4ExdApm0wn/IZRCRrvMUp/fxoprGlMQhaZEPDmqv4RBMHGysJJTN+LoXb8xrCGso2es3KccJ+lkQWgRaYnigPb8DkQEHBuoj7qXvX9xUTrbCrMvJUXPI2bSgSVO7GcD1H2Xf7jkBfOrQWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sUhKAzrMckuYCwOwBUCY/wp11FbEe/v28xz/DkO6GM0=;
 b=mW9J6CYdRF96tf7sa9lgglSJizavLGy88yWOMyLpTtqcRKlL+uprzG6IkaJqB1PVjBodesxAjVsdwfb52hXzZtAtx6atlEAKmP5IN7rKsh22VtnHn+v80yMdgKvD+TL25ddMy5lNUGB4byZHQJwj7hsyFX9GWBz/U4aFQ/hGKiynFZLH1DgC7hej5XyYw+RWtWLnFLbc1d/yDtN5Y1XSCJMv1I2rCaP6lUs3tadWbsOKGjJqzVDOvZltT9jqlXBi49O5KdCssG7HZPXDnA6Yca7mFFgXYkGRr1xS1+/EngdKxamdooEpV1FxE+qjnVtqV4sfTGXwJoc8ZN1B55og8A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DM6PR11MB2538.namprd11.prod.outlook.com (2603:10b6:5:be::20) by
 CO1PR11MB4850.namprd11.prod.outlook.com (2603:10b6:303:9c::7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6433.15; Wed, 24 May 2023 05:29:15 +0000
Received: from DM6PR11MB2538.namprd11.prod.outlook.com
 ([fe80::61aa:b66e:fce4:b592]) by DM6PR11MB2538.namprd11.prod.outlook.com
 ([fe80::61aa:b66e:fce4:b592%5]) with mapi id 15.20.6411.028; Wed, 24 May 2023
 05:29:14 +0000
From: Sakib Sajal <sakib.sajal@windriver.com>
To: openembedded-core@lists.openembedded.org
Subject: [kirkstone][PATCH] go: fix CVE-2023-24540
Date: Wed, 24 May 2023 01:28:53 -0400
Message-Id: <20230524052853.1666676-1-sakib.sajal@windriver.com>
X-Mailer: git-send-email 2.40.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MN2PR14CA0023.namprd14.prod.outlook.com
 (2603:10b6:208:23e::28) To DM6PR11MB2538.namprd11.prod.outlook.com
 (2603:10b6:5:be::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR11MB2538:EE_|CO1PR11MB4850:EE_
X-MS-Office365-Filtering-Correlation-Id: bdbd1dff-589e-4a48-6eab-08db5c17cfd8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	pEFnTgVzQ4BWCrg0o/U0GTj3eiOGfp92zLnTqzNEEEsH40TLOEj/Vqusr3Q66XKic1PrDjwH7PRxHXCsUPY/sKjPekSC2XMtm+sV5fA7biNR8TmF6XJVCw1Fhe8Z9O0+oucts5nojcOsnx3flClrhCXL1EFXk6CxEjKoJ8C8k9yCiAMnVp4/02kHo9aFtig47DjxP56qyO3ABoxA+wX/Y+mlw5Kl+5OOAOPR8oi6zFz8IB+KGf3pnHVFeJJhKI+dArChyp4Y7mabnPRMK8EFuuPYfHX3SqZmjMp3Hef78Mo4Mj16Ad0NHOOMvEA/M1hYOp2a3EIAKPTc4/THDTxgDvMas69ClJGf5IdkJ3hrhOMVPQ/tPI1bqiMRNGceh6UcIWtaehdts9oL+IdqFvR7kXXjjUEDkm87dBSuYMCmhIOMmNqpTE97Lu4aLdziRYN6qqTzEbIjeGr0+LjtK3mQD9Vd/IOtogFkfbgZriKwEK0UsCINY6m0RO5yF7G65dLcVywwEN0FrqmbJ1HOX9NUCqG4S/yoyALKrwCr1A2nHpF7bzUYIdQIcXSK5TFD5YxANwlbXZ4ubvu+2qH1jRhFcxy0DJ9SSB8V5ucyD+5Ci4I=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR11MB2538.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(366004)(396003)(346002)(136003)(376002)(39850400004)(451199021)(6486002)(52116002)(478600001)(1076003)(6506007)(6512007)(186003)(2616005)(26005)(966005)(6666004)(38100700002)(38350700002)(6916009)(83380400001)(36756003)(86362001)(8676002)(316002)(66946007)(2906002)(66556008)(66476007)(8936002)(41300700001)(44832011)(5660300002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?ybpcMbIuBJ83AZKc3WXA3EfGHrBcYnTofA4GU0EMcPQQXKyojODtSMiyHRlD?=
 =?us-ascii?Q?03maQ2MSZxoXBEGEjIFC3b+7lHcAnfOFTWl4kJx/hEn2IEOJwGWy8m79bmKw?=
 =?us-ascii?Q?nyG/I4XI63HZPVkbLr8iftKf3eT9W5ucncpY6pT4nKeTlDT2Roc34/qnbQGq?=
 =?us-ascii?Q?eePfvtaHIJ4JOGvv1RuG7A+5Ar3IKNO2UhF/AW8rcgeAiLqAIfl79gM9AER7?=
 =?us-ascii?Q?QqsVTJfVnEfabhPYvYhf7u8mmcgAP9atoNhPZuObwfDImEpIH0k43XpyXSw3?=
 =?us-ascii?Q?Gbm6rmaMEmHHj5fqGBuGVGrD6KQkY3ioS3zBxQbqkgfEWerW4kXc7P00CgRw?=
 =?us-ascii?Q?aBTUwDIk6frBLjC5qv0deIaREiydJR80lj9cuktC/8P6THWPztaO/4gKyPw7?=
 =?us-ascii?Q?OL0oRBvT91XdCQ+oICLmb6A3GEozKFLvPbO184wNX3paK/qxRtNV6nczRZHX?=
 =?us-ascii?Q?YPwqV4AoLwpCeWT8A16SuvZxEdAeWMUZXV/x6GyQjhetrnB3u6U8yyjucYuZ?=
 =?us-ascii?Q?i4j2LgTAwPLLy3b9fHtgjOasscw7+h5HDGAZY5ksEBesfkh8CvpKylq2Wdjd?=
 =?us-ascii?Q?7H31zltKby21Vq1hhIK2r1w2bEs/ksZpgJNvtDPFOpRitKIP5XdDNcaBSr7U?=
 =?us-ascii?Q?tlZk+kB78lhkSzJCaZ1iJf6dT803wAF0WW/CNdqfUcmmTMRbtX+/9M+MMJa0?=
 =?us-ascii?Q?hWNPC8O+KvkLV3AGEnuctyZq9pe+YY5xEdRtjYDcoHdmfBwjoK6RhEeONYfi?=
 =?us-ascii?Q?bp/tGi8bAxuyBkScvEjrCnwPJclzyn2XwGrbJlNDFydUyFCD+ESdQn3sAYrb?=
 =?us-ascii?Q?8ZhZ1bmVSNZIF62xTs/zidCyIarhl6XjWlBXpq5wpjM70StR9CpxSwuuRRPd?=
 =?us-ascii?Q?xWWIASIFKOrbzSMJJOBxJwmTxL+YHESFE+gKi7tqBN41jZdX4d1rDZehn5O7?=
 =?us-ascii?Q?plvmtjgom+X4SnXr8vCea+j90xAi9NtQ0qtfifAgSs0/23cnMqQAA17F/UMH?=
 =?us-ascii?Q?0S47nVTg+5yyCfPwxj17P0zOFIroIrFyuaen2BrCs+grhJus5vQX+jc20haA?=
 =?us-ascii?Q?b7JQ3EK1G5c19Pv4DSgoMNkLMXMgIMNEaJDsxZ7U/NpGkEeO9PSFEBS1Zu/7?=
 =?us-ascii?Q?72W1dTSCsrHug5vEeTAsXZyLNo1EpYHl9o+RyGN1H9Q7xuqvVBHbb8rDN5sK?=
 =?us-ascii?Q?8tivq4TA7/C+7dg49mSHkp0uG4QALK+FD1o/kl8aRoVVHcUdHP4t+IyQVU8v?=
 =?us-ascii?Q?ChjdoBmtosNmVOc9dGc4NnOeuIgSJA3taglwnvT6eFzFp9vT0ywXv898SkKS?=
 =?us-ascii?Q?f63cqkvrrkNTGRRkkw905aNCbmar8qWmqAqURFGRlX5TfL2kZEar9c+EBOHK?=
 =?us-ascii?Q?Z2CaozZ3aybF7JoHNCAwwFrDhSpxfPNSOpitVZEpXp8Fcvq6lBpVdP2jYuO3?=
 =?us-ascii?Q?c/MpossVawwKFA7deo52NSdpUJIatfc6lmK+6uLBinEzIFCt7tttAZXPDh9F?=
 =?us-ascii?Q?7hEEI4yN+z/iywpeVInhlMDYbkV6B63u87qkmqSNjdShXLzf8XUOB3JwYCVm?=
 =?us-ascii?Q?oiz3FSLeW7ygMfiqfbPbsErG+St/NVo6QkzbPKh0VTUEDTnhTLcgY8/lfY9X?=
 =?us-ascii?Q?AA=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bdbd1dff-589e-4a48-6eab-08db5c17cfd8
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB2538.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 May 2023 05:29:14.6029
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: W106I2YJRBqLsKVSwJ0pXkObKX0oajccKx6ICFFIhXmb6OysQ4OPfFe4ew7qmP9BG0aWPy3LOQUrQB4pdoCD9YjZLU0xbJ1XoJUxU43Odpo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB4850
X-Proofpoint-ORIG-GUID: MGGRh2Phfa1stemFTXNcYDtTwtGROTNq
X-Proofpoint-GUID: MGGRh2Phfa1stemFTXNcYDtTwtGROTNq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.573,FMLib:17.11.176.26
 definitions=2023-05-24_02,2023-05-23_02,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0
 mlxlogscore=999 priorityscore=1501 adultscore=0 lowpriorityscore=0
 mlxscore=0 suspectscore=0 bulkscore=0 clxscore=1015 spamscore=0
 phishscore=0 impostorscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2304280000 definitions=main-2305240045
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 24 May 2023 05:29:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/181657

Backport from go-1.19:
html/template: handle all JS whitespace characters

Signed-off-by: Sakib Sajal <sakib.sajal@windriver.com>
---
 meta/recipes-devtools/go/go-1.17.13.inc       |  1 +
 .../go/go-1.19/CVE-2023-24540.patch           | 93 +++++++++++++++++++
 2 files changed, 94 insertions(+)
 create mode 100644 meta/recipes-devtools/go/go-1.19/CVE-2023-24540.patch

diff --git a/meta/recipes-devtools/go/go-1.17.13.inc b/meta/recipes-devtools/go/go-1.17.13.inc
index d7cb47ebf4..e5e9d841c4 100644
--- a/meta/recipes-devtools/go/go-1.17.13.inc
+++ b/meta/recipes-devtools/go/go-1.17.13.inc
@@ -30,6 +30,7 @@ SRC_URI += "\
     file://CVE-2023-24537.patch \
     file://CVE-2023-24534.patch \
     file://CVE-2023-24538.patch \
+    file://CVE-2023-24540.patch \
 "
 SRC_URI[main.sha256sum] = "a1a48b23afb206f95e7bbaa9b898d965f90826f6f1d1fc0c1d784ada0cd300fd"
 
diff --git a/meta/recipes-devtools/go/go-1.19/CVE-2023-24540.patch b/meta/recipes-devtools/go/go-1.19/CVE-2023-24540.patch
new file mode 100644
index 0000000000..4ed9ba7096
--- /dev/null
+++ b/meta/recipes-devtools/go/go-1.19/CVE-2023-24540.patch
@@ -0,0 +1,93 @@
+From 2305cdb2aa5ac8e9960bd64e548a119c7dd87530 Mon Sep 17 00:00:00 2001
+From: Roland Shoemaker <bracewell@google.com>
+Date: Tue, 11 Apr 2023 16:27:43 +0100
+Subject: [PATCH] html/template: handle all JS whitespace characters
+
+Rather than just a small set. Character class as defined by \s [0].
+
+Thanks to Juho Nurminen of Mattermost for reporting this.
+
+For #59721
+Fixes  #59813
+Fixes CVE-2023-24540
+
+[0] https://developer.mozilla.org/en-US/docs/Web/JavaScript/Guide/Regular_Expressions/Character_Classes
+
+Change-Id: I56d4fa1ef08125b417106ee7dbfb5b0923b901ba
+Reviewed-on: https://team-review.git.corp.google.com/c/golang/go-private/+/1821459
+Reviewed-by: Julie Qiu <julieqiu@google.com>
+Run-TryBot: Roland Shoemaker <bracewell@google.com>
+Reviewed-by: Damien Neil <dneil@google.com>
+Reviewed-on: https://team-review.git.corp.google.com/c/golang/go-private/+/1851497
+Run-TryBot: Damien Neil <dneil@google.com>
+Reviewed-by: Roland Shoemaker <bracewell@google.com>
+Reviewed-on: https://go-review.googlesource.com/c/go/+/491355
+Reviewed-by: Dmitri Shuralyov <dmitshur@google.com>
+Reviewed-by: Carlos Amedee <carlos@golang.org>
+TryBot-Bypass: Carlos Amedee <carlos@golang.org>
+Run-TryBot: Carlos Amedee <carlos@golang.org>
+
+CVE: CVE-2023-24540
+Upstream-Status: Backport [ce7bd33345416e6d8cac901792060591cafc2797]
+
+Signed-off-by: Sakib Sajal <sakib.sajal@windriver.com>
+---
+ src/html/template/js.go      |  8 +++++++-
+ src/html/template/js_test.go | 11 +++++++----
+ 2 files changed, 14 insertions(+), 5 deletions(-)
+
+diff --git a/src/html/template/js.go b/src/html/template/js.go
+index b888eaf..35994f0 100644
+--- a/src/html/template/js.go
++++ b/src/html/template/js.go
+@@ -13,6 +13,11 @@ import (
+ 	"unicode/utf8"
+ )
+ 
++// jsWhitespace contains all of the JS whitespace characters, as defined
++// by the \s character class.
++// See https://developer.mozilla.org/en-US/docs/Web/JavaScript/Guide/Regular_expressions/Character_classes.
++const jsWhitespace = "\f\n\r\t\v\u0020\u00a0\u1680\u2000\u2001\u2002\u2003\u2004\u2005\u2006\u2007\u2008\u2009\u200a\u2028\u2029\u202f\u205f\u3000\ufeff"
++
+ // nextJSCtx returns the context that determines whether a slash after the
+ // given run of tokens starts a regular expression instead of a division
+ // operator: / or /=.
+@@ -26,7 +31,8 @@ import (
+ // JavaScript 2.0 lexical grammar and requires one token of lookbehind:
+ // https://www.mozilla.org/js/language/js20-2000-07/rationale/syntax.html
+ func nextJSCtx(s []byte, preceding jsCtx) jsCtx {
+-	s = bytes.TrimRight(s, "\t\n\f\r \u2028\u2029")
++	// Trim all JS whitespace characters
++	s = bytes.TrimRight(s, jsWhitespace)
+ 	if len(s) == 0 {
+ 		return preceding
+ 	}
+diff --git a/src/html/template/js_test.go b/src/html/template/js_test.go
+index d7ee47b..8f5d76d 100644
+--- a/src/html/template/js_test.go
++++ b/src/html/template/js_test.go
+@@ -81,14 +81,17 @@ func TestNextJsCtx(t *testing.T) {
+ 		{jsCtxDivOp, "0"},
+ 		// Dots that are part of a number are div preceders.
+ 		{jsCtxDivOp, "0."},
++		// Some JS interpreters treat NBSP as a normal space, so
++		// we must too in order to properly escape things.
++		{jsCtxRegexp, "=\u00A0"},
+ 	}
+ 
+ 	for _, test := range tests {
+-		if nextJSCtx([]byte(test.s), jsCtxRegexp) != test.jsCtx {
+-			t.Errorf("want %s got %q", test.jsCtx, test.s)
++		if ctx := nextJSCtx([]byte(test.s), jsCtxRegexp); ctx != test.jsCtx {
++			t.Errorf("%q: want %s got %s", test.s, test.jsCtx, ctx)
+ 		}
+-		if nextJSCtx([]byte(test.s), jsCtxDivOp) != test.jsCtx {
+-			t.Errorf("want %s got %q", test.jsCtx, test.s)
++		if ctx := nextJSCtx([]byte(test.s), jsCtxDivOp); ctx != test.jsCtx {
++			t.Errorf("%q: want %s got %s", test.s, test.jsCtx, ctx)
+ 		}
+ 	}
+ 
+-- 
+2.40.0
+
-- 
2.40.0


