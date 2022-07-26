Return-Path: <sakib.sajal@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3272CC433EF
	for <webhook@archiver.kernel.org>; Tue, 26 Jul 2022 05:01:51 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com
 [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web12.3093.1658811705017343928
 for <openembedded-core@lists.openembedded.org>;
 Mon, 25 Jul 2022 22:01:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=W62SBA35;
 spf=permerror,
 err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}:
 invalid domain name (domain: windriver.com, ip: 205.220.178.238,
 mailfrom: prvs=4206887e6d=sakib.sajal@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id
 26Q51hR8007871
	for <openembedded-core@lists.openembedded.org>; Tue, 26 Jul 2022 05:01:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=from : to :
 subject : date : message-id : content-transfer-encoding : content-type :
 mime-version; s=PPS06212021;
 bh=5M10MGogfkakqYnzked+L588+dWz5IFk+iFQfolv2Uc=;
 b=W62SBA35uxPnfwnb+DxzpxSUxoHO4Vkg6B5TQ5LHQNuEqrfXQCSFGTnKP3m2ymbx1ub2
 zi8yPP/3bA0HTau+EB0XdDXUGgVzjwaQoDGuYe4Y5suHV7uqob5C8q+2uFyNjdKZg1cL
 opSOpMPYA7wogz0ewx4QwZDcxpLa+kuioeF2F9OocXuCt8+VeWnLI0JyGDC1dGy4A0Iz
 so3HcGo28SzumtLYlB+Ax0jObLopTrLZWoz+U8x7dNuWM6huF/vqHaSUxDQs/yCJIx36
 gKbSop+d05sNLkX4PAExsjH+UIz4Y255E7GOf4O9kqB6Gx9+ZXQXP7Q563wVQvg9om52 SA==
Received: from nam11-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam11lp2168.outbound.protection.outlook.com [104.47.57.168])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3hg671a5ab-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
 Tue, 26 Jul 2022 05:01:43 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=msyGIwZJ25SsgUvgJMJDdgHqwMmyG30bL5Oad5spLe3/RwadcCB6SapPWzJb07jXlax3QWUZeBWHxZwn+YiqbDvOkjhfAbARwVPHuBy5fo4fQN7ri8FApc3y3KyzNR4TSxR3LBabt+FVEe+I/04+l1GDzRlkM64PXYhAzADL3G9axA5rGiJROCiB4UvnPR5I0X/5+xpUqGf3oHLO9Gillhnk3P/Qsd5rgxK4j6ytXNkhi2ImRqUnOAEDSwh1SoAerXMVjfOsKIYMSwXTkznFiPj4DEnVRCtFc8VxsqsH5AQTZgyu8MW8WJetiCqnHvIfugUnyvWFlXxSwRMQU+AbeA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5M10MGogfkakqYnzked+L588+dWz5IFk+iFQfolv2Uc=;
 b=RlIISD59qELAf2t7hVoClw4zAPmbSlcmOOL/2FozzDQYpH2i91Zf4xpnr3nSd682PV+e6Gdu3xjfrgAmiTmplMjk3soBvnlIWA3iEnLhfAQQVNgOVSziMkFrHdyHI2tFsGW7cW4xlMqahE+auZCNvzRbfJMU4jfUuLoRM/L1HjM1yBf7fQzSyDG6l5Zi7W3wSTx/BOqsfkHBwDqm7+EuZwPQR9Y5Q6sViCBqy5KubVomkLicAgzx5T6us/vd35Mya1Pn7JazD4VZgmFS02VW2kHYnxBXumA15NcE++v22c08uoK43/xKMTeqpd4z3GKmbnUQsYXQknHsiuoD7irxWA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DM6PR11MB2538.namprd11.prod.outlook.com (2603:10b6:5:be::20) by
 BL0PR11MB3442.namprd11.prod.outlook.com (2603:10b6:208:68::19) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5458.21; Tue, 26 Jul 2022 05:01:40 +0000
Received: from DM6PR11MB2538.namprd11.prod.outlook.com
 ([fe80::a807:4bee:8e08:3053]) by DM6PR11MB2538.namprd11.prod.outlook.com
 ([fe80::a807:4bee:8e08:3053%7]) with mapi id 15.20.5458.024; Tue, 26 Jul 2022
 05:01:40 +0000
From: Sakib Sajal <sakib.sajal@windriver.com>
To: openembedded-core@lists.openembedded.org
Subject: [kirkstone][PATCH] go: update v1.17.10 -> v1.17.12
Date: Tue, 26 Jul 2022 01:00:28 -0400
Message-Id: <20220726050028.2095-1-sakib.sajal@windriver.com>
X-Mailer: git-send-email 2.33.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: YQBPR01CA0081.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:3::17) To DM6PR11MB2538.namprd11.prod.outlook.com
 (2603:10b6:5:be::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 34930aee-3947-408a-6cca-08da6ec3ed3f
X-MS-TrafficTypeDiagnostic: BL0PR11MB3442:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	B3u+UGIkvPiExJ81kifKdPjELGSz0x95hKvkDk7LQc+mCGCg8s0efisyXVq5JTS3YdN7ZkKU5ID6Q6efw31tGc5W4snZW2x58uTYVQDg0Pu5rAQfRqBcmBJEjYgMlq7S/0oE1xYoKhRebZ/RNXqp06suRxkg85MjuQmnLmBwMsg0ok0x166/26uag9jhMebuQDna7OwbJnXNN7hK8FxJ+nJPexo//6Mebu38j/CFWo/T0SlK+LM5iOsXx2oBHWzvoD7DR0KxwQjCczQ/UgcpPRExsgKKeeB5dqewch4KIC2/3KzVq4KHYvE15UaWqbysazcUqm0776cVJhQTVEf+VS6Q3cu5PyqzdZ8wCkrxT8wMhk8JDgVe9+JEXReGfVBi57zdolngNp3IWxnCSEB4KJSOnzcV/EtRkbdX8od+t7/Fye+iwF7dT1xMyjl+otB5wgjdh6CZqkzNU7Iegp591n/xpqI2VoKOOoQ//4+Nx7sDfcVdXdSUvEYF5eD1X8J3qsjRP6jvK+mFuWpkFmCngaCejod1v/M1nk+s0lEzOMjjYv6n+asrUldJnBgxfnvHEUr8KqwgHpqgewsxN24eodEVnOb08iRgK1hMvjvBkd/oATE0wP2KgTidMV067TVwr9fKEI0MkIGsSi6eBIjdyiOox49dyIZS8EJdGkqwx5wJnZ1FgVnB9KnwXYSEN0lzKZuyz9PbZAA/rIq4H5LaccKku5DeeiblMrklMBg31Hv5cSWH9lyCC/Tj+eraEE7Qgdey3DJpH4Gy4+lZUSYPlYZUlqd48N5yLD+rcnq6JImxm+mT22um74ohaixrMLV5
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR11MB2538.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(396003)(39850400004)(136003)(376002)(346002)(366004)(38100700002)(6916009)(38350700002)(41300700001)(2906002)(66476007)(316002)(8676002)(66556008)(66946007)(86362001)(36756003)(26005)(1076003)(52116002)(6506007)(8936002)(478600001)(6486002)(5660300002)(83380400001)(6666004)(44832011)(186003)(6512007)(2616005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?sId8RP4KOoPm2nHJrwRejMd2B6MkE1viF33HG556X0j5PoU7ubQZZ6SmqEoW?=
 =?us-ascii?Q?2xUXx2omVq2yivGfVH4mie9WXDZIG7IyhynGNKWyXGxqbGIohdzve8iJe0Gr?=
 =?us-ascii?Q?8H4ay4oEiWQxfJRwgoh24w5Nl2/DIAEgN7VaDJ+lPNZXUXoGoYg6S7kwsYaK?=
 =?us-ascii?Q?CV5mQ9QCLeTthp9CKWZasumESfj6SfJxtoBzRifEYRJuWW7pygEoPmSULIFy?=
 =?us-ascii?Q?gIdKVVJSjbfaCg0F4oxxmdhtjj/vzKKfiGEiY70VQCrl159wd3dhn89mw/7e?=
 =?us-ascii?Q?zEZv6gfkkaGSY3MXR6c9GNc5uZt34DqjQ20N+9VcnzG06a4BHSfWeipaH9WU?=
 =?us-ascii?Q?UQBkeao8WBT/FzeG0mPWxsva6i/vcsrIRIuHZz68msZH/ItNB3L3xOT9R9U6?=
 =?us-ascii?Q?Ob6LqsBaJJxgWu5XuTs2DBpPYSWFw29DXm2w1jQHyq/xsfoAI3oklA9Oss+v?=
 =?us-ascii?Q?p1/yJwVxWkRfE5ShRpNK2UVj07yhlll9hRKHBsA977rXUCc8EEi8s3cIxtPr?=
 =?us-ascii?Q?a+kcoQ/ROEQCIZxc94nq0pIu84kCuvjRxaatuDYEZCd244LdKGZ61OVPClNN?=
 =?us-ascii?Q?HQjPxKRAmcrT41lI/dp8HOSIvyKdo8sNCKpL3S9BRpjty24vlYlnccH6d5Rz?=
 =?us-ascii?Q?8K/qRgHpDOXPEisxdZib/87wlETXNh656vm17UjdxohKW36bVwxKq9Dpbp4l?=
 =?us-ascii?Q?5MTXfoEJERbxt1WscebA9A4blnO2Dbn9+tokBNKHclpR6u3y66yv1ee0/+0a?=
 =?us-ascii?Q?WSYQZ3W6L/0RUBXArRU2m/lX7is4ltOflEQNb6/hCzIsoQHpTLdyyPPohoZ3?=
 =?us-ascii?Q?O0TwCGk4kZCnoPFjVJomN3Zz9WgF5LPdvR1wsvE1xkxYj6Y8vlSi9PAEITZ+?=
 =?us-ascii?Q?yv5X4lRwHGrJSq1toTHRdXkWukn7lMupZVczRrahbiVg0IqsTecGhAC/onfC?=
 =?us-ascii?Q?cuUXDiuJf37uSfyY35BRIHru5KZZwQJRV8MqRtmAryfFGqpHbwAwNCclXSD8?=
 =?us-ascii?Q?g20yx2ujga7YuAzkUIPIXxuhY37QUKJ6E3xxkqzENhji8ntrKLdBhHxKKde+?=
 =?us-ascii?Q?qtUbNTVluOx2MUOHZQtBBMvoAFsjG+qczm/aRR2zTgdQAptpmrTZTsTk6GgS?=
 =?us-ascii?Q?UhyGY8plnPH7oSfNJ860/qWLdUiG4GGop7vNXfGvw4R1tCccvMlmQLt9BF44?=
 =?us-ascii?Q?6aQqNkohrgxLYgKxGuxN9vKKiiVAs2skcb131XhvQEhL/9g0m5SZHc77cbvd?=
 =?us-ascii?Q?DdqMukI7uTYsiTLY4QLtZYkW/4W0HM5HTYrQlPUajl5IAAyDpUiGFwYwt8dp?=
 =?us-ascii?Q?kTu9ZroKGXgGE0rLhl8fWI+hnRvMFrv6MfQQozzgjarYdoX28gqkE14xAA+i?=
 =?us-ascii?Q?VpL5XnUQgwbk9jNnR4M1LEaijhPPyRHx4osoo/bDFqeMQp8HSTwj48OH0CH1?=
 =?us-ascii?Q?tVAQn+1OctrLnkRJUQHnxOU2QMjcRch/OXRBAK6lDDtKVrDIzYaTFs0zqOIS?=
 =?us-ascii?Q?v1vjkjOuMm+iqrsextbrGIf9EvugHihPLygN14TRhC5iqDGylC8NERkvTfVo?=
 =?us-ascii?Q?BaiMBTuAjg+MUQ/K66eNGrPvQhHezxCWb0tGKVZbQafJFuZuxgsgHTTF5xqS?=
 =?us-ascii?Q?Qw=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 34930aee-3947-408a-6cca-08da6ec3ed3f
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB2538.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jul 2022 05:01:40.5318
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 v/rMYLhpAJ7jypFF63RXw28bD3MYytN30CoIJxvbVI4ujA0t90zwUmDwWzqMBE/STK0qwQqXr02OAlCCYtNx4gmCM+SiakFdR0aEDv33AP0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR11MB3442
X-Proofpoint-ORIG-GUID: 4VJ5wRWJQZPdngFAjiYkxs6KUgwOTGgz
X-Proofpoint-GUID: 4VJ5wRWJQZPdngFAjiYkxs6KUgwOTGgz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-07-25_13,2022-07-25_03,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0
 adultscore=0 phishscore=0 suspectscore=0 bulkscore=0 malwarescore=0
 mlxlogscore=999 mlxscore=0 priorityscore=1501 clxscore=1015
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2206140000 definitions=main-2207260019
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 26 Jul 2022 05:01:51 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/168494

go.git$ git log --oneline go1.17.10..go1.17.12
1ed3c127da (tag: go1.17.12) [release-branch.go1.17] go1.17.12
cd54600b86 [release-branch.go1.17] encoding/gob: add a depth limit for ignored fields
76f8b7304d [release-branch.go1.17] path/filepath: fix stack exhaustion in Glob
8c1d8c8362 [release-branch.go1.17] io/fs: fix stack exhaustion in Glob
0117dee7dc [release-branch.go1.17] compress/gzip: fix stack exhaustion bug in Reader.Read
ba8788ebce [release-branch.go1.17] go/parser: limit recursion depth
2678d0c957 [release-branch.go1.17] encoding/xml: limit depth of nesting in unmarshal
58facfbe7d [release-branch.go1.17] encoding/xml: use iterative Skip, rather than recursive
ed2f33e1a7 [release-branch.go1.17] net/http: preserve nil values in Header.Clone
d13431c37a [release-branch.go1.17] net/http: don't strip whitespace from Transfer-Encoding headers
ae2dfcc1c8 [release-branch.go1.17] runtime: add race annotations to cbs.lock
fc07039e23 [release-branch.go1.17] runtime: add race annotations to metricsSema
9ef614f5aa [release-branch.go1.17] cmd/compile: allow 128-bit values to be spilled
b1be664d64 [release-branch.go1.17] runtime: store consistent total allocation stats as uint64
77cc1c0def [release-branch.go1.17] cmd/go: pass --no-decorate when listing git tags for a commit
8d2935ab7c [release-branch.go1.17] cmd/dist: test cgo internal linking on darwin-arm64
651a8d81ba [release-branch.go1.17] cmd/dist: skip internal linking tests on arm64
26cdea3acc (tag: go1.17.11) [release-branch.go1.17] go1.17.11
4c69fd51a9 [release-branch.go1.17] path/filepath: do not remove prefix "." when following path contains ":".
909881db03 [release-branch.go1.17] misc/cgo/testsanitizers: buffer the signal channel in TestTSAN/tsan11
03c2e56f68 [release-branch.go1.17] crypto/tls: avoid extra allocations in steady-state Handshake calls
c15a8e2dbb [release-branch.go1.17] crypto/tls: randomly generate ticket_age_add
590b53fac9 [release-branch.go1.17] os/exec: return clear error for missing cmd.Path
2be03d789d [release-branch.go1.17] crypto/rand: properly handle large Read on windows
65701ad2b4 [release-branch.go1.17] misc/cgo/testsanitizers: use buffered channel in tsan12.go
e846f3f2d6 [release-branch.go1.17] runtime: skip TestGdbBacktrace flakes matching a known GDB internal error
a9003376d5 [release-branch.go1.17] cmd/dist: consistently set PWD when executing a command in a different directory
0e7138a102 [release-branch.go1.17] runtime: mark TestGcSys as flaky

Signed-off-by: Sakib Sajal <sakib.sajal@windriver.com>
---
 meta/recipes-devtools/go/{go-1.17.10.inc => go-1.17.12.inc}   | 2 +-
 ...o-binary-native_1.17.10.bb => go-binary-native_1.17.12.bb} | 4 ++--
 ...cross-canadian_1.17.10.bb => go-cross-canadian_1.17.12.bb} | 0
 .../go/{go-cross_1.17.10.bb => go-cross_1.17.12.bb}           | 0
 .../go/{go-crosssdk_1.17.10.bb => go-crosssdk_1.17.12.bb}     | 0
 .../go/{go-native_1.17.10.bb => go-native_1.17.12.bb}         | 0
 .../go/{go-runtime_1.17.10.bb => go-runtime_1.17.12.bb}       | 0
 meta/recipes-devtools/go/{go_1.17.10.bb => go_1.17.12.bb}     | 0
 8 files changed, 3 insertions(+), 3 deletions(-)
 rename meta/recipes-devtools/go/{go-1.17.10.inc => go-1.17.12.inc} (92%)
 rename meta/recipes-devtools/go/{go-binary-native_1.17.10.bb => go-binary-native_1.17.12.bb} (83%)
 rename meta/recipes-devtools/go/{go-cross-canadian_1.17.10.bb => go-cross-canadian_1.17.12.bb} (100%)
 rename meta/recipes-devtools/go/{go-cross_1.17.10.bb => go-cross_1.17.12.bb} (100%)
 rename meta/recipes-devtools/go/{go-crosssdk_1.17.10.bb => go-crosssdk_1.17.12.bb} (100%)
 rename meta/recipes-devtools/go/{go-native_1.17.10.bb => go-native_1.17.12.bb} (100%)
 rename meta/recipes-devtools/go/{go-runtime_1.17.10.bb => go-runtime_1.17.12.bb} (100%)
 rename meta/recipes-devtools/go/{go_1.17.10.bb => go_1.17.12.bb} (100%)

diff --git a/meta/recipes-devtools/go/go-1.17.10.inc b/meta/recipes-devtools/go/go-1.17.12.inc
similarity index 92%
rename from meta/recipes-devtools/go/go-1.17.10.inc
rename to meta/recipes-devtools/go/go-1.17.12.inc
index e71feb5d02..77a983f9d0 100644
--- a/meta/recipes-devtools/go/go-1.17.10.inc
+++ b/meta/recipes-devtools/go/go-1.17.12.inc
@@ -17,7 +17,7 @@ SRC_URI += "\
     file://0001-exec.go-do-not-write-linker-flags-into-buildids.patch \
     file://0001-src-cmd-dist-buildgo.go-do-not-hardcode-host-compile.patch \
 "
-SRC_URI[main.sha256sum] = "299e55af30f15691b015d8dcf8ecae72412412569e5b2ece20361753a456f2f9"
+SRC_URI[main.sha256sum] = "0d51b5b3f280c0f01f534598c0219db5878f337da6137a9ee698777413607209"
 
 # Upstream don't believe it is a signifiant real world issue and will only
 # fix in 1.17 onwards where we can drop this.
diff --git a/meta/recipes-devtools/go/go-binary-native_1.17.10.bb b/meta/recipes-devtools/go/go-binary-native_1.17.12.bb
similarity index 83%
rename from meta/recipes-devtools/go/go-binary-native_1.17.10.bb
rename to meta/recipes-devtools/go/go-binary-native_1.17.12.bb
index 0f49cebcb7..b034950721 100644
--- a/meta/recipes-devtools/go/go-binary-native_1.17.10.bb
+++ b/meta/recipes-devtools/go/go-binary-native_1.17.12.bb
@@ -8,8 +8,8 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=5d4950ecb7b26d2c5e4e7b4e0dd74707"
 PROVIDES = "go-native"
 
 SRC_URI = "https://dl.google.com/go/go${PV}.${BUILD_GOOS}-${BUILD_GOARCH}.tar.gz;name=go_${BUILD_GOTUPLE}"
-SRC_URI[go_linux_amd64.sha256sum] = "87fc728c9c731e2f74e4a999ef53cf07302d7ed3504b0839027bd9c10edaa3fd"
-SRC_URI[go_linux_arm64.sha256sum] = "649141201efa7195403eb1301b95dc79c5b3e65968986a391da1370521701b0c"
+SRC_URI[go_linux_amd64.sha256sum] = "6e5203fbdcade4aa4331e441fd2e1db8444681a6a6c72886a37ddd11caa415d4"
+SRC_URI[go_linux_arm64.sha256sum] = "74a4832d0f150a2d768a6781553494ba84152e854ebef743c4092cd9d1f66a9f"
 
 UPSTREAM_CHECK_URI = "https://golang.org/dl/"
 UPSTREAM_CHECK_REGEX = "go(?P<pver>\d+(\.\d+)+)\.linux"
diff --git a/meta/recipes-devtools/go/go-cross-canadian_1.17.10.bb b/meta/recipes-devtools/go/go-cross-canadian_1.17.12.bb
similarity index 100%
rename from meta/recipes-devtools/go/go-cross-canadian_1.17.10.bb
rename to meta/recipes-devtools/go/go-cross-canadian_1.17.12.bb
diff --git a/meta/recipes-devtools/go/go-cross_1.17.10.bb b/meta/recipes-devtools/go/go-cross_1.17.12.bb
similarity index 100%
rename from meta/recipes-devtools/go/go-cross_1.17.10.bb
rename to meta/recipes-devtools/go/go-cross_1.17.12.bb
diff --git a/meta/recipes-devtools/go/go-crosssdk_1.17.10.bb b/meta/recipes-devtools/go/go-crosssdk_1.17.12.bb
similarity index 100%
rename from meta/recipes-devtools/go/go-crosssdk_1.17.10.bb
rename to meta/recipes-devtools/go/go-crosssdk_1.17.12.bb
diff --git a/meta/recipes-devtools/go/go-native_1.17.10.bb b/meta/recipes-devtools/go/go-native_1.17.12.bb
similarity index 100%
rename from meta/recipes-devtools/go/go-native_1.17.10.bb
rename to meta/recipes-devtools/go/go-native_1.17.12.bb
diff --git a/meta/recipes-devtools/go/go-runtime_1.17.10.bb b/meta/recipes-devtools/go/go-runtime_1.17.12.bb
similarity index 100%
rename from meta/recipes-devtools/go/go-runtime_1.17.10.bb
rename to meta/recipes-devtools/go/go-runtime_1.17.12.bb
diff --git a/meta/recipes-devtools/go/go_1.17.10.bb b/meta/recipes-devtools/go/go_1.17.12.bb
similarity index 100%
rename from meta/recipes-devtools/go/go_1.17.10.bb
rename to meta/recipes-devtools/go/go_1.17.12.bb
-- 
2.33.0


