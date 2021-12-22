Return-Path: <Qi.Chen@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D6F33C433EF
	for <webhook@archiver.kernel.org>; Wed, 22 Dec 2021 02:11:40 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com
 [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.14449.1640139100055323458
 for <openembedded-core@lists.openembedded.org>;
 Tue, 21 Dec 2021 18:11:40 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=NaZJkskR;
 spf=permerror,
 err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}:
 invalid domain name (domain: windriver.com, ip: 205.220.166.238,
 mailfrom: prvs=79909bdf5a=qi.chen@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id
 1BM1fAqJ022386
	for <openembedded-core@lists.openembedded.org>;
 Tue, 21 Dec 2021 18:11:39 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=from : to :
 subject : date : message-id : in-reply-to : references :
 content-transfer-encoding : content-type : mime-version; s=PPS06212021;
 bh=/4DcdrA5njxsQApkQc2qO54q6vYjm7lFGavu07HGWOA=;
 b=NaZJkskR3ofNG8mLoQNqZao7MxmBaM/ZPbjn0tZfAU+AEThewWeL0d61IwC7FM0u+gZ7
 ayr2QvsM8gddfdxXMXwh0iD5z+NCm6Qmems/kCutwTh2kOqsfLJvjc1Aj0zpLz2dj7P+
 zSRXatXmAL9pTxz5jteU58UhFBmU58+2dj4Tx9hDUDgAw1fDAas69E4Lcl6w8p2jUXFY
 7yUW99tId4Pm/AxN+2IywmMdufmbP5FZJikUjIuCLz5jTcm4M6ZTRviqkxHLrTEz1GMS
 AVJXXl0pc40n/Z9zlppTfTmaILbUCGhaSgayxibFfR5r1EbZSOXMgmzKtcIHLZVE1C27 Lw==
Received: from nam11-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam11lp2177.outbound.protection.outlook.com [104.47.57.177])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3d2rdahgxj-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
 Tue, 21 Dec 2021 18:11:39 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=g7wsN7A1jnIjGR5MELXWbw0PFIKkaHsFq8opOM3wO+JQegd+4T4IujJMutdPBWxERsviKKObLSmLxwUW3MfAs4mbKjb67yTuGflSClAahesPDYcAzJzx9YnBdggWpB+zGWn1s1/zZqFAL2Zd3tR+CV1khxlbEaPdb99fn3ZtzBCQFqbAFLED/AZvqXkD2Mx4kQM8gRfKXN5rnbm5rP5vx2nENWwW3GUZ+pquGVkaB5gVLi1+Dau4UqIOqeASoG962nQVIwQF57MqWDfEMZ6kr2KehYtbfEU33ax7zxOnwTR59qXMEdCXInnSE3+pK822s1vTZMTYrtcdhjhv71TCGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/4DcdrA5njxsQApkQc2qO54q6vYjm7lFGavu07HGWOA=;
 b=DrF2K9ppeD1MAwQYpti3tVjufQ+PkRYelIcnDZ8dAMmVd9LzH99dwMKovkkLGaOpVMCiZUA5qjsYhAkNNaTyJQg67AO4ZKNSptEn/fVEaQS87TYO4r9WhxwDk0Lu38u9SWVUO7uqDboQ9G0680qDKHLTNNOol6GQ3ZcRUOmNMLbyZAHenfA7rErrM1xgymLwd8zS4SAK2glhoO69GgEmPnFjKEGE9yjma2LjRKTzyksoffy7l1csdOzSJ1nd8lKhgrRJr+EfF4NSDTEWJTdQ4HHxNz8wXE2pLKqg5cAgZwgkXbp3ZDnWbGS9/fTnivG2QW5JNMZkIjRAT3kULdw9FQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO6PR11MB5602.namprd11.prod.outlook.com (2603:10b6:303:13a::5)
 by CO6PR11MB5602.namprd11.prod.outlook.com (2603:10b6:303:13a::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4801.14; Wed, 22 Dec
 2021 02:11:37 +0000
Received: from CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::e4bd:c128:9168:b142]) by CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::e4bd:c128:9168:b142%3]) with mapi id 15.20.4801.020; Wed, 22 Dec 2021
 02:11:37 +0000
From: Chen Qi <Qi.Chen@windriver.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][hardknott][PATCH 2/3] busybox: Fix for CVE-2021-42376
Date: Tue, 21 Dec 2021 18:11:24 -0800
Message-Id: <20211222021125.55893-2-Qi.Chen@windriver.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211222021125.55893-1-Qi.Chen@windriver.com>
References: <20211222021125.55893-1-Qi.Chen@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BY3PR04CA0013.namprd04.prod.outlook.com
 (2603:10b6:a03:217::18) To CO6PR11MB5602.namprd11.prod.outlook.com
 (2603:10b6:303:13a::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: cff57d1e-1571-42d0-8635-08d9c4f06229
X-MS-TrafficTypeDiagnostic: CO6PR11MB5602:EE_
X-Microsoft-Antispam-PRVS: 
	<CO6PR11MB56025079D5CEA0B679CAA491ED7D9@CO6PR11MB5602.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:23;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	cLktLofLlMhBmFIboMxPTb2Y8Pm0Fce019KWhC0qF9nMT3yXsQICTIIh2m5i08JbuqDomu4rRSD1KRrx1i7o3ow39O070mQJD9ruis0ZzVEH0DkaRUTfZpaVlK55HtycqhK7ba9n0R6/3S0vXOKEE42IXbv0kqGXOBZMV5zdEUzBIKo3YjL8sFR6ruxmtLZ3iIujPG4fDQL0q6Z6RkoimOgnuoyb5Mj+lAEyBgwfhPH/aEwji5UkhhZ3/uxy8D6Tp3LcNrqHlWFZulG0GUaQVOs576+3vOyJok9vatMDL1Og7JZTdiH1ipu/Zi67FbYluay5udM0o4Sy5oqTl9lbU7RDgMmtqhx5aq3IvxuFvg7QnHCqWFzIXid85d2vQerQckOdPQ6TjJwzx+NvunjA/tBdcjX+gwTNEfoNUeYXLTBKLYNHnrVyqeAxjuexW5K54YUy5gBIuHzOm55aDP2BUyI0kX3+6bNprLmjMq3KruKFvSgOBvoWrhNBC4Je2FTk/yjK6TS92C9NaKm9MJSc1+Vft3lUwD/itvMleTkuiQ5lbA7FUZCsfcrDSttM4kOFANvQ1jQNVPjqc21iD7QpQL46QucWcQJoslPtE0X/iXIvcbifnq8bmn7w5DWKG3ELk7XEt/e7Fv2hwh+CeF2R3qUr3bvhMUG6WM7Fb+RS4XWyfHMPlnaqvwbNp9QM7LrobO7Y5G99+KbescZsXxgypC5ueZPJGQiryn0Rg+4KQQqtFAmnMQP+FtnxmzLLt1bt3o9XxpjEuDjDTd22gVGgyU5XBvTtKILrx9tSSlVz3AI=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR11MB5602.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(6916009)(508600001)(6486002)(52116002)(2906002)(36756003)(66946007)(66476007)(6512007)(8676002)(316002)(86362001)(966005)(6506007)(66556008)(26005)(83380400001)(38100700002)(186003)(1076003)(6666004)(5660300002)(2616005)(8936002)(38350700002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?xp2hXyCMTbAZMsavkBNmJqF6wvgSg1ZDwwUc5UWs67e8JdhgNYaNFh1VZM7P?=
 =?us-ascii?Q?H5uwE8EwYhh5kxgGBhJmuEelqOKu3DNbHntv5CtGWmBDEmoBZOe1BSogCSS+?=
 =?us-ascii?Q?L1ib9/quqrD/+EAs0Y4U5B1cYQYjeye6MN+5F27mJZiphTBf8T9Jvf4lBne/?=
 =?us-ascii?Q?eg30qtI/4L89m2KLnY2gxWqFinYUAxrUkjMDr/jk6kt2qzYsYicIrTBW9GOB?=
 =?us-ascii?Q?NcQuX23a81I/PfRorml4C4tkclIrfQWkZpIS5WMSh2meZOox+j/vDNWztUZz?=
 =?us-ascii?Q?iq99VovIaGtGcvraoBzs4SJ1zKw3kWgNxvnU7AMfIYCrJExdbMdV4Qz66+zs?=
 =?us-ascii?Q?yoQG8lP0geBvnG96T2IhFzBESIBWTGd3vkUfx9S0mXy4it9z5gjnqoOZ8RV1?=
 =?us-ascii?Q?I3lF2xJwiigsfr2UZrcq6M3JA4101K1pP5FLpELjQAvE8RtGjXdA1zbcr20n?=
 =?us-ascii?Q?AqMMaFwBEdZ4wH+W2MDanXuPI7lARRheRZDQBbHJ+pdGfaO6iYII5HOifjfl?=
 =?us-ascii?Q?VKN5FpH0QchtF1kXz/ZiLHMfULTbyrU7IXrvyaNv1jPzzjTqT5UsDJwMkdLn?=
 =?us-ascii?Q?5785jCsCqat2p7R5C8VaaPmGFWmmzylfhMBvlADBrfpoTySUvxQ6+a+/ruaX?=
 =?us-ascii?Q?bG86lhVpsLMl5E6OY+gvZNHgl3j5ZKki9dih++Cei2M2JG5ik7vp15t219ok?=
 =?us-ascii?Q?XxLWxiQBxar20n5vWSaCAephdGRIzTf5tpFVT7PY8xUlNGzvBNcxvPSIuKE9?=
 =?us-ascii?Q?8YZ+iUaQnAPb4EIkUB4StxxZNIaM439QM8DBOQF1hsTx34CnHzpM8BDinbp8?=
 =?us-ascii?Q?9cwuWXTkf1K4R43JpDkiqk/sHLRhpN51lCpaplxxT48qiU7Wjpy/DK47H380?=
 =?us-ascii?Q?NasS4mA4b/yOo4JKaNswY9nOqSTjnQ4C8HKJ/zo+ZBRpSyZQFFD1ZFiedXfI?=
 =?us-ascii?Q?hPUmmJiLPZ+kTVYr5LVpDsm+A/tjFbArb7tbobfy00vMQNKw0DFUl2zNqnjz?=
 =?us-ascii?Q?k+s89VyuG9jbpbih1qxBWQMedYP21//JP6tgCLoe9H7O30cC6IKxVtP+IitJ?=
 =?us-ascii?Q?IcZ4zqkTLiONmii1mGHLHsBo3EwudyiFc21IH9egIcypzFPbXbMAUlW65DYc?=
 =?us-ascii?Q?Qhca4W7F6HDhGyfQWtg8zQvPbix+61X9JjnUwFHmgxFBErSA8kFmGjaOTjjN?=
 =?us-ascii?Q?O3rDD0sGhv2YiFSzegyWxwlW74OvzD2xeSHveYzU4C8dGidm1HL0mSi4Eii6?=
 =?us-ascii?Q?0eB0Fgs9vOxQO0LD9TjqLhDfhsOT7tHNZG8bF2rPdLrGbuP8LvE+5e5O6nue?=
 =?us-ascii?Q?GnFzRF0WfS2BemXjblk9t1Df2hefRt3zNwVJV00Mihmb3ehb/ZP3wJTT5R5d?=
 =?us-ascii?Q?P0ZxzCd2DOBJA9TKx9UL4mKbr3lMF/hWcewzIa7PAKlindG2Bxo42asevYCi?=
 =?us-ascii?Q?XShyjczMGzQ4rEk8B/ZqqRvP46NES2TnGpPB04AkwQTYghq9M5p32el2mKHp?=
 =?us-ascii?Q?gqjEIympC8NPXCHRs6v/jMMCjvlEDI0CRoW3cKXzUCFped/BzprpykoENX1Z?=
 =?us-ascii?Q?Lr81CzZBrXHe/rNzg/7tcGPwF2q9529ZyEDeCeJCLRlBfS0WMzT/fh3Gg7f6?=
 =?us-ascii?Q?Ylx47zFoFxDBUDfbrLpwTc4=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 cff57d1e-1571-42d0-8635-08d9c4f06229
X-MS-Exchange-CrossTenant-AuthSource: CO6PR11MB5602.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Dec 2021 02:11:36.8969
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 +4d2enoEZ56UjhixuQQu/z9aEKTJJg8bXUFd2l7FaY2Mq+sW/b3sEEDlfb7XsAksZxAgPGoVuciYR5Do0BD1Ew==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO6PR11MB5602
X-Proofpoint-GUID: qPViKUoYRfKrOkXsrCtbSs6SZsMPlk_y
X-Proofpoint-ORIG-GUID: qPViKUoYRfKrOkXsrCtbSs6SZsMPlk_y
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2021-12-21_07,2021-12-21_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 clxscore=1015
 lowpriorityscore=0 priorityscore=1501 phishscore=0 mlxlogscore=999
 impostorscore=0 bulkscore=0 malwarescore=0 adultscore=0 spamscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2112220012
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 22 Dec 2021 02:11:40 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/159935

From: Pavel Zhukov <pavel.zhukov@huawei.com>

A NULL pointer dereference in Busybox's hush applet leads to denial of service
when processing a crafted shell command, due to missing validation after
a \x03 delimiter character.
This may be used for DoS under very rare conditions of filtered command input.

Reference: https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-42376

(From OE-Core rev: 58e49c94d5305875188110aecdefe77c0afdfcb7)

Signed-off-by: Pavel Zhukov <pavel.zhukov@huawei.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 .../busybox/busybox/CVE-2021-42376.patch      | 138 ++++++++++++++++++
 meta/recipes-core/busybox/busybox_1.33.1.bb   |   1 +
 2 files changed, 139 insertions(+)
 create mode 100644 meta/recipes-core/busybox/busybox/CVE-2021-42376.patch

diff --git a/meta/recipes-core/busybox/busybox/CVE-2021-42376.patch b/meta/recipes-core/busybox/busybox/CVE-2021-42376.patch
new file mode 100644
index 0000000000..c913eaee9c
--- /dev/null
+++ b/meta/recipes-core/busybox/busybox/CVE-2021-42376.patch
@@ -0,0 +1,138 @@
+From 56a335378ac100d51c30b21eee499a2effa37fba Mon Sep 17 00:00:00 2001
+From: Denys Vlasenko <vda.linux@googlemail.com>
+Date: Tue, 15 Jun 2021 16:05:57 +0200
+Subject: hush: fix handling of \^C and "^C"
+
+function                                             old     new   delta
+parse_stream                                        2238    2252     +14
+encode_string                                        243     256     +13
+------------------------------------------------------------------------------
+(add/remove: 0/0 grow/shrink: 2/0 up/down: 27/0)               Total: 27 bytes
+
+Signed-off-by: Denys Vlasenko <vda.linux@googlemail.com>
+(cherry picked from commit 1b7a9b68d0e9aa19147d7fda16eb9a6b54156985)
+
+Signed-off-by: Pavel Zhukov <pavel.zhukov@huawei.com>
+
+CVE: CVE-2021-42376
+Upstream-Status: Backport [https://git.busybox.net/busybox/patch/?id=56a335378ac100d51c30b21eee499a2effa37fba]
+Comment: No changes in any hunk
+---
+ shell/ash_test/ash-misc/control_char3.right   |  1 +
+ shell/ash_test/ash-misc/control_char3.tests   |  2 ++
+ shell/ash_test/ash-misc/control_char4.right   |  1 +
+ shell/ash_test/ash-misc/control_char4.tests   |  2 ++
+ shell/hush.c                                  | 11 +++++++++++
+ shell/hush_test/hush-misc/control_char3.right |  1 +
+ shell/hush_test/hush-misc/control_char3.tests |  2 ++
+ shell/hush_test/hush-misc/control_char4.right |  1 +
+ shell/hush_test/hush-misc/control_char4.tests |  2 ++
+ 9 files changed, 23 insertions(+)
+ create mode 100644 shell/ash_test/ash-misc/control_char3.right
+ create mode 100755 shell/ash_test/ash-misc/control_char3.tests
+ create mode 100644 shell/ash_test/ash-misc/control_char4.right
+ create mode 100755 shell/ash_test/ash-misc/control_char4.tests
+ create mode 100644 shell/hush_test/hush-misc/control_char3.right
+ create mode 100755 shell/hush_test/hush-misc/control_char3.tests
+ create mode 100644 shell/hush_test/hush-misc/control_char4.right
+ create mode 100755 shell/hush_test/hush-misc/control_char4.tests
+
+diff --git a/shell/ash_test/ash-misc/control_char3.right b/shell/ash_test/ash-misc/control_char3.right
+new file mode 100644
+index 000000000..283e02cbb
+--- /dev/null
++++ b/shell/ash_test/ash-misc/control_char3.right
+@@ -0,0 +1 @@
++SHELL: line 1: : not found
+diff --git a/shell/ash_test/ash-misc/control_char3.tests b/shell/ash_test/ash-misc/control_char3.tests
+new file mode 100755
+index 000000000..4359db3f3
+--- /dev/null
++++ b/shell/ash_test/ash-misc/control_char3.tests
+@@ -0,0 +1,2 @@
++# (set argv0 to "SHELL" to avoid "/path/to/shell: blah" in error messages)
++$THIS_SH -c '\' SHELL
+diff --git a/shell/ash_test/ash-misc/control_char4.right b/shell/ash_test/ash-misc/control_char4.right
+new file mode 100644
+index 000000000..2bf18e684
+--- /dev/null
++++ b/shell/ash_test/ash-misc/control_char4.right
+@@ -0,0 +1 @@
++SHELL: line 1: -: not found
+diff --git a/shell/ash_test/ash-misc/control_char4.tests b/shell/ash_test/ash-misc/control_char4.tests
+new file mode 100755
+index 000000000..48010f154
+--- /dev/null
++++ b/shell/ash_test/ash-misc/control_char4.tests
+@@ -0,0 +1,2 @@
++# (set argv0 to "SHELL" to avoid "/path/to/shell: blah" in error messages)
++$THIS_SH -c '"-"' SHELL
+diff --git a/shell/hush.c b/shell/hush.c
+index 9fead37da..249728b9d 100644
+--- a/shell/hush.c
++++ b/shell/hush.c
+@@ -5235,6 +5235,11 @@ static int encode_string(o_string *as_string,
+ 	}
+ #endif
+ 	o_addQchr(dest, ch);
++	if (ch == SPECIAL_VAR_SYMBOL) {
++		/* Convert "^C" to corresponding special variable reference */
++		o_addchr(dest, SPECIAL_VAR_QUOTED_SVS);
++		o_addchr(dest, SPECIAL_VAR_SYMBOL);
++	}
+ 	goto again;
+ #undef as_string
+ }
+@@ -5346,6 +5351,11 @@ static struct pipe *parse_stream(char **pstring,
+ 			if (ch == '\n')
+ 				continue; /* drop \<newline>, get next char */
+ 			nommu_addchr(&ctx.as_string, '\\');
++			if (ch == SPECIAL_VAR_SYMBOL) {
++				nommu_addchr(&ctx.as_string, ch);
++				/* Convert \^C to corresponding special variable reference */
++				goto case_SPECIAL_VAR_SYMBOL;
++			}
+ 			o_addchr(&ctx.word, '\\');
+ 			if (ch == EOF) {
+ 				/* Testcase: eval 'echo Ok\' */
+@@ -5670,6 +5680,7 @@ static struct pipe *parse_stream(char **pstring,
+ 		/* Note: nommu_addchr(&ctx.as_string, ch) is already done */
+ 
+ 		switch (ch) {
++		case_SPECIAL_VAR_SYMBOL:
+ 		case SPECIAL_VAR_SYMBOL:
+ 			/* Convert raw ^C to corresponding special variable reference */
+ 			o_addchr(&ctx.word, SPECIAL_VAR_SYMBOL);
+diff --git a/shell/hush_test/hush-misc/control_char3.right b/shell/hush_test/hush-misc/control_char3.right
+new file mode 100644
+index 000000000..94b4f8699
+--- /dev/null
++++ b/shell/hush_test/hush-misc/control_char3.right
+@@ -0,0 +1 @@
++hush: can't execute '': No such file or directory
+diff --git a/shell/hush_test/hush-misc/control_char3.tests b/shell/hush_test/hush-misc/control_char3.tests
+new file mode 100755
+index 000000000..4359db3f3
+--- /dev/null
++++ b/shell/hush_test/hush-misc/control_char3.tests
+@@ -0,0 +1,2 @@
++# (set argv0 to "SHELL" to avoid "/path/to/shell: blah" in error messages)
++$THIS_SH -c '\' SHELL
+diff --git a/shell/hush_test/hush-misc/control_char4.right b/shell/hush_test/hush-misc/control_char4.right
+new file mode 100644
+index 000000000..698e21427
+--- /dev/null
++++ b/shell/hush_test/hush-misc/control_char4.right
+@@ -0,0 +1 @@
++hush: can't execute '-': No such file or directory
+diff --git a/shell/hush_test/hush-misc/control_char4.tests b/shell/hush_test/hush-misc/control_char4.tests
+new file mode 100755
+index 000000000..48010f154
+--- /dev/null
++++ b/shell/hush_test/hush-misc/control_char4.tests
+@@ -0,0 +1,2 @@
++# (set argv0 to "SHELL" to avoid "/path/to/shell: blah" in error messages)
++$THIS_SH -c '"-"' SHELL
+-- 
+cgit v1.2.3
+
diff --git a/meta/recipes-core/busybox/busybox_1.33.1.bb b/meta/recipes-core/busybox/busybox_1.33.1.bb
index 5f574e7f49..e01d4df946 100644
--- a/meta/recipes-core/busybox/busybox_1.33.1.bb
+++ b/meta/recipes-core/busybox/busybox_1.33.1.bb
@@ -49,6 +49,7 @@ SRC_URI = "https://busybox.net/downloads/busybox-${PV}.tar.bz2;name=tarball \
            file://0001-gen_build_files-Use-C-locale-when-calling-sed-on-glo.patch \
            file://0001-mktemp-add-tmpdir-option.patch \
            file://CVE-2021-42374.patch \
+           file://CVE-2021-42376.patch \
            "
 SRC_URI_append_libc-musl = " file://musl.cfg "
 
-- 
2.33.0


