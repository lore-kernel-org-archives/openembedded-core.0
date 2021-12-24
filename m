Return-Path: <akash.hadke@kpit.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 231EAC433F5
	for <webhook@archiver.kernel.org>; Fri, 24 Dec 2021 10:42:51 +0000 (UTC)
Received: from IND01-MA1-obe.outbound.protection.outlook.com
 (IND01-MA1-obe.outbound.protection.outlook.com [40.107.138.44])
 by mx.groups.io with SMTP id smtpd.web08.44030.1640342569389034836
 for <openembedded-core@lists.openembedded.org>;
 Fri, 24 Dec 2021 02:42:50 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kpit.com header.s=selector1 header.b=Oy30Z21o;
 spf=pass (domain: kpit.com, ip: 40.107.138.44,
 mailfrom: akash.hadke@kpit.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bt06O/ROD2h/dhuuDDMj8j/CAgEh/KxCW3jJf1zZOPTy0lNz6AVcoXjdc1jnYiETz58cQ+Yy6d5JCqVAiuDX6LhbHLVzp3cqwv5oSC6kWis3lemVYN8TnYp4OyP06aRIXu2R3fCoHOyzcJYtq1OBVYB3tcl6yVPUPm7+SqQYuR6w+lu49xYB1PpRMka9VPA1Bpx11QXxyIvUgnvT9LfhXffPlRv85mpYHXmUHDf02VfSSgWzdo+UaARBBIW/jdVDcSCmymtZajIni4gKHl476XhRaGkcOZHJKKlP2ZgzIFAlXORTrVx8H8XiRSn7l7td44fE6x9xAhlUB40FlWTpNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BLQAos8Rm6R6nNsqXpmg2ivEieKEOoz9mb5UjoE18pk=;
 b=Qvsahdfp3SXHjwQ/fX+2xpvyqvusiqn5MoSzRaAjs/Q17bluOiI84Fg4OOYnSToUAlGZhoaZmDfzdme83MZjq3yuRy1SLoP657Y5ifOuEgIYibc2QR2UDy3T9u/m3XC75y44d9qyNToUSJPtwJNL244qv+nDtqLsxBeSKHX+5X9NcevLK8vf2yoE+haHUi29Y10oc6ov9X2dEyQw21+bVAaKtC+9pdZ79cP95s4hiAe6GZFZ+8QR7AzMPb1Vd78/KTzrzP1Jkr4GR5SoYTQI/eUv9KcFxQVbPMStdI/n+PfxuTC3Iauy2z1/mk4f1oJry7wqYJr6nLAegsuyumO5UA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=kpit.com; dmarc=pass action=none header.from=kpit.com;
 dkim=pass header.d=kpit.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kpit.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BLQAos8Rm6R6nNsqXpmg2ivEieKEOoz9mb5UjoE18pk=;
 b=Oy30Z21oox1tKfnAhpf09AomqD9okMEZWP0wD6n833Z34unupNseJKwu96KMdd84r1KZ7sZ5ypE2Wc/LQxsasHbrZziPKW4owtLSTdf4uCbnPc9y1iLepvbXvUb+rrVCxUGlqIl2DUuFwcDDQnHOTzKvgGc+JhBS3elM8Kf9Gis=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=kpit.com;
Received: from PN3PR01MB6712.INDPRD01.PROD.OUTLOOK.COM (2603:1096:c01:89::13)
 by PN3PR01MB5966.INDPRD01.PROD.OUTLOOK.COM (2603:1096:c01:7e::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4823.19; Fri, 24 Dec
 2021 10:42:43 +0000
Received: from PN3PR01MB6712.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::9c99:7763:21f1:a5d4]) by PN3PR01MB6712.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::9c99:7763:21f1:a5d4%9]) with mapi id 15.20.4801.024; Fri, 24 Dec 2021
 10:42:43 +0000
From: Akash Hadke <akash.hadke@kpit.com>
To: openembedded-core@lists.openembedded.org
Cc: ranjitsinh.rathod@kpit.com,
	Akash Hadke <hadkeakash4@gmail.com>
Subject: [poky][dunfell][PATCH] glibc: Add fix for data races in
 pthread_create and TLS access
Date: Fri, 24 Dec 2021 16:12:28 +0530
Message-Id: <1640342548-4520-1-git-send-email-akash.hadke@kpit.com>
X-Mailer: git-send-email 2.7.4
Content-Type: text/plain
X-ClientProxiedBy: PN3PR01CA0098.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:9b::11) To PN3PR01MB6712.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:89::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 996358b1-e753-4551-e70b-08d9c6ca1ce3
X-MS-TrafficTypeDiagnostic: PN3PR01MB5966:EE_
X-Microsoft-Antispam-PRVS: 
	<PN3PR01MB596602DBC9E320732066E3E58E7F9@PN3PR01MB5966.INDPRD01.PROD.OUTLOOK.COM>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	akjqhQPhRL+UdqihFn+O2j9nb/AfYmf+rptWn7dBINJWPgyYLht1XSRtXY6MzTo+Ar2BV3s/CWFN0eVG1aoQsoOaW3NQHLnIyBe4iYza6vhlKv5Rv7D+CVT+69ob4JETuyIaj9KfK5lSvbL8/u0jTOXPeKbuPWcnMftgUdmq7Ty+ZIBk5V+zRYcPT/oTqUXV9RlOlAHebRN9gJOVTBDhByAqbIbxCSwO3J08u9rLdRiUAsD7QKLcfF61wFKL559WIydUiPSojNmgpPwKW/we+PKdrG8djYzJTUwII0IEl4a35eagRIk6ySB/pRZ7bKj3kcvbIyUqpJb1vnLdkMEoY21ebdRVMr62ye7XiMe2v8EsX5qIfZpOcKsO6VS6oXXavemzCwJfJ2xFKEd+jSsTefrxc+32j/vEAm5RyUGPXAhpws6pYCDf5h9vGcYqX7kGwAj7m58DLIdMgHnW4NBJoz4lg/o2sO7Sd6dTbsvIF6hD/yRzrDrZXYn8LZkQuj/IvCFHWOCbknY062Z3/6xYjqBzK3P2FG+UdlcwYmEMCrRYaKBuytF1tfiMIgjcIuH9ijbwKDCEch9uqUcxX4jcngX+Ka0fXQ/GTau4rf4ki69l9yoCMfsmhuWYigx30ZoyhmcGbSwAG9Q7K/bOFrcyHc2QLF8ky7IxwqHwi6iW5jDNfwilFqdKRQz95hZj0MunMSQnVYZAfTPvfKu6+7Dkvb5FiWl3Qqxrgq7XJtT92HzE496BiFyDPU5butCSJ6oY2jk9jtD29bW1lrFVPMwVRkhZRuJ24BAt0d83Eys6CZZb653AXnVkPQUHK1I7Xj5v
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PN3PR01MB6712.INDPRD01.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(4636009)(366004)(8676002)(2616005)(316002)(19627235002)(44832011)(6916009)(6666004)(83380400001)(86362001)(6486002)(2906002)(38100700002)(8936002)(6512007)(36756003)(66556008)(508600001)(52116002)(66946007)(6506007)(66476007)(186003)(4326008)(30864003)(5660300002)(966005)(2004002)(579004)(559001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?sVqYml70tv9Yq0G4sdtxTbK417Pse7I1t33G2FPJDU+dUGrK5BuC999/rDTN?=
 =?us-ascii?Q?rDB/3MXDQKZwg+wpxypKBNatzA6NRMxMFvG3luAP0eQNmgW/9VyIOR0FbbT0?=
 =?us-ascii?Q?nugSZa5F/Cwdbo9pF/ZpGObBgktMjOvTlc0YVM7sF3GPO+c0zoVogUuGeC6a?=
 =?us-ascii?Q?vvmeJW29YU6jAlbiiqiV0swLNolH5V/6QtpJRkrW68s3eGRmkFmjPyBFPNbv?=
 =?us-ascii?Q?v+kuZS+R1b73fwXuOWKjLUdL0yn6562q1nOTkXnuMfVc/dWggb7EHU5f/s9u?=
 =?us-ascii?Q?e7U1jaHV2GsPWS9siUWnNlt274GG5mSogR4ExqV6dc87HvUwVuG70pHSfifO?=
 =?us-ascii?Q?E9mFp9IM4EgHlEoaSiVmd9RTwY4+Xj+YQWCE9all8+L6Eul66UHggdWN1ToO?=
 =?us-ascii?Q?jk2E8xDm5GYGRfzZPZ3EP4cyF4eMDi/ImM79AI1/Yx0grqJ2HAUIrzUPBY3i?=
 =?us-ascii?Q?ZCiutPgq44ArRoAHHRtrUugzr42f9OtMvnO996MBFhx5ZfDzZL3SQZWLPX+t?=
 =?us-ascii?Q?3ii3mEz8tYe5kVuDFhv/JfzKkkO2XlUxiA4aUI+WVUNvtcdJJXbo8f4/LHYk?=
 =?us-ascii?Q?pV4kYdKXitgxOQ6MVMGFdFKABjN2JdH3CSA1iGl8ej/5niRlX1IVFMSPCEfr?=
 =?us-ascii?Q?1XydC/+jcWaSbyNCzUDTWyrw1boeicXlzx/+OR46qAG7Cbn9g5fgtE0+BADN?=
 =?us-ascii?Q?KUletRr0ABQI3+h40dTY36VgGHsfpf3SlcXO6hdI+BMHGMKOXVIMbEq2Cy7j?=
 =?us-ascii?Q?JpeoA/5XJ4RbMS9/pZVYCJ9vbcXrYzdLFUiuGjTL3vRopcLhuci6GU9BGzc/?=
 =?us-ascii?Q?zUIuzHxRbW1K8hijGuw0FdnkCstVP/wJ7AV7xe3c5NcQslGXSI4ccxKGl8vN?=
 =?us-ascii?Q?PuJxo5ylfUdkNzUzRpS5E2g5qZHMeP6kuDy4XuZi9jWnanB3tGxurFo2i2GQ?=
 =?us-ascii?Q?A3NRBK9R1eWfmu+2DAbMDVsb5JPhL4QGen57kgiiPfOo5c9CQom7tfMN/dIu?=
 =?us-ascii?Q?jdMLopQbPaknCB4BTzK/DhSL9fWzrEuJxA1XWr6fr6ht0SgZJd86wsHVU+S4?=
 =?us-ascii?Q?r+St+B9FgXOrXMJBMqwmtCT5yvAiD2FxiPzwe6TMmkvZmZ9phYRLidXlRoig?=
 =?us-ascii?Q?vNuOgvVhbToqzebBOk+lgtKO7bYF1ZmXp+TnMWBogkXd7YYnmVjTJYxSASlB?=
 =?us-ascii?Q?pk5M71osEEpKSCBSYqM/CubaERqckDSXiFRQ0/w97D/iPJOFfItHB3Poy+k6?=
 =?us-ascii?Q?kTZZrTM4mQl47jNw07nEBqsyBwutMmT4BPnGTySu25K+kOCAacAes1CHNLVJ?=
 =?us-ascii?Q?s33sihITEnXirWBfmjvrdK88PDhH0dBM3I1CDA3o7MQ8DoCisdsEwUBDPeNX?=
 =?us-ascii?Q?sQdxWw52PLjXzePkMNHeZCXNWME+C7PL2mmxzNKhQv8PUzALseri1wxy12Pg?=
 =?us-ascii?Q?95pViAjLSKn0ndG7/iC/AqDtfOVapTe+OnkrBGfSydLDe9w7SKhdXLZSYv+C?=
 =?us-ascii?Q?mzlW/Fs1DKYz14eEhj/80Fc3pGxEG2u+ONqdhMMskxihyI0BovsB90d2LT4h?=
 =?us-ascii?Q?HnHYAsKZF0eEkmJ8mSLxhzhIaTePGdGwd2b/cHhxcCxD+UDDDRDr5E/Cjm6W?=
 =?us-ascii?Q?yniSmEgxaL0ogULF9q+i5WRvwHd2V68jeKMH4/YX8ru31RQI+JsN+YHd9Wnt?=
 =?us-ascii?Q?9omWMUNhJO73W5ABQY94W5W9ocA=3D?=
X-OriginatorOrg: kpit.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 996358b1-e753-4551-e70b-08d9c6ca1ce3
X-MS-Exchange-CrossTenant-AuthSource: PN3PR01MB6712.INDPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Dec 2021 10:42:43.3005
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3539451e-b46e-4a26-a242-ff61502855c7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 VGJq8o0xdmjy6iZSeZ0YUvV/tvbR+7BsDd8HAkkSDdIzDHlBPWBqdfeWOCFK5qr96uggcH3q5ZbjRqapaD3wAQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PN3PR01MB5966
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 24 Dec 2021 10:42:51 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/160000

Inconsistency detected by ld.so: dl-tls.c: 493: _dl_allocate_tls_init: Assertion `listp->slotinfo[cnt].gen <= _rtld_local._dl_tls_generation' failed!
caused by dlopen (in _dl_add_to_slotinfo and in dl_open_worker) doing
  listp->slotinfo[idx].gen = GL(dl_tls_generation) + 1;
  //...
  if (any_tls && __builtin_expect (++GL(dl_tls_generation) == 0, 0))
while pthread_create (in _dl_allocate_tls_init) concurrently doing
  assert (listp->slotinfo[cnt].gen <= GL(dl_tls_generation));

Backported below patch that can fix the following bugs with a lock
that prevents DTV setup running concurrently with dlopen or dlclose.

Bug 19329: https://sourceware.org/bugzilla/show_bug.cgi?id=19329
Bug 27111: https://sourceware.org/bugzilla/show_bug.cgi?id=27111

Patch: 0031-elf-Fix-data-races-in-pthread_create-and-TLS-access-BZ-19329.patch
Link: https://sourceware.org/git/?p=glibc.git;a=patch;h=1387ad6225c2222f027790e3f460e31aa5dd2c54

It requires a supporting patch
0030-elf-Refactor_dl_update-slotinfo-to-avoid-use-after-free.patch
Link: https://sourceware.org/git/?p=glibc.git;a=patch;h=c0669ae1a629e16b536bf11cdd0865e0dbcf4bee

After adding the above fix there is a number of racy read accesses
to globals that will be changed to relaxed MO atomics in follow-up
patch given below.

This fixes the regressions and avoids cluttering the main part
of the fix.

0032-elf-Use-relaxed-atomics-for-racy-accesses-BZ-19329.patch
Link: https://sourceware.org/git/?p=glibc.git;a=patch;h=f4f8f4d4e0f92488431b268c8cd9555730b9afe9

Backported the below patch to add the test to check the added fix.
0033-elf-Add-test-case-for-BZ-19329.patch
Link: https://sourceware.org/git/?p=glibc.git;a=patch;h=9d0e30329c23b5ad736fda3f174208c25970dbce

Previously modids were never resused for a
different module, but after dlopen failure all gaps are reused
not just the ones caused by the unfinished dlopened.

The code has to handle reused modids already which seems to
work, however the data races at thread creation and tls access
(see bug 19329 and bug 27111) may be more severe if slots are
reused. Fixing the races are not simpler if reuse is disallowed
and reuse has other benefits so upstream added fix
https://sourceware.org/git/?p=glibc.git;a=commit;h=572bd547d57a39b6cf0ea072545dc4048921f4c3
for the following bug.

Bug 27135: https://sourceware.org/bugzilla/show_bug.cgi?id=27135

But in glibc upstream the commit 572bd547d57a was reverted as the
issue with 572bd547d57a patch was the DTV entry only updated on
dl_open_worker() with the update_tls_slotinfo() call after all
dependencies are being processed by _dl_map_object_deps(). However
_dl_map_object_deps() itself might call _dl_next_tls_modid(),
and since the _dl_tls_dtv_slotinfo_list::map was not yet set the
entry can be wrongly reused.

So added below patch to fix Bug 27135.
0034-elf-Fix-DTV-gap-reuse-logic-BZ-27135.patch
Link: https://sourceware.org/git/?p=glibc.git;a=patch;h=ba33937be210da5d07f7f01709323743f66011ce

Not all TLS access related data races got fixed by adding
0031-elf-Fix-data-races-in-pthread_create-and-TLS-access-BZ-19329.patch,
there are additional races at lazy tlsdesc relocations.
Bug 27137: https://sourceware.org/bugzilla/show_bug.cgi?id=27137

Backported below patches to fix this issue.

0035-x86_64-Avoid-lazy-relocation-of-tlsdesc-BZ-27137.patch
Link: https://sourceware.org/git/?p=glibc.git;a=patch;h=8f7e09f4dbdb5c815a18b8285fbc5d5d7bc17d86

0036-i386-Avoid-lazy-relocation-of-tlsdesc-BZ-27137.patch
Link: https://sourceware.org/git/?p=glibc.git;a=patch;h=ddcacd91cc10ff92d6201eda87047d029c14158d

The fix 0031-elf-Fix-data-races-in-pthread_create-and-TLS-access-BZ-19329.patch
for bug 19329 caused a regression such that pthread_create can
deadlock when concurrent ctors from dlopen are waiting for it
to finish.
Bug 28357: https://sourceware.org/bugzilla/show_bug.cgi?id=28357

Backported below patch to fix this issue.
0037-Avoid-deadlock-between-pthread_create-and-ctors.patch
Link: https://sourceware.org/git/?p=glibc.git;a=patch;h=024a7640ab9ecea80e527f4e4d7f7a1868e952c5

Signed-off-by: Akash Hadke <akash.hadke@kpit.com>
Signed-off-by: Akash Hadke <hadkeakash4@gmail.com>
---
 ...l_update-slotinfo-to-avoid-use-after-free.patch |  66 +++++
 ...in-pthread_create-and-TLS-access-BZ-19329.patch | 191 ++++++++++++++
 ...elaxed-atomics-for-racy-accesses-BZ-19329.patch | 206 +++++++++++++++
 .../0033-elf-Add-test-case-for-BZ-19329.patch      | 144 +++++++++++
 ...0034-elf-Fix-DTV-gap-reuse-logic-BZ-27135.patch | 180 ++++++++++++++
 ...Avoid-lazy-relocation-of-tlsdesc-BZ-27137.patch |  56 +++++
 ...Avoid-lazy-relocation-of-tlsdesc-BZ-27137.patch | 124 +++++++++
 ...deadlock-between-pthread_create-and-ctors.patch | 276 +++++++++++++++++++++
 meta/recipes-core/glibc/glibc_2.31.bb              |   8 +
 9 files changed, 1251 insertions(+)
 create mode 100644 meta/recipes-core/glibc/glibc/0030-elf-Refactor_dl_update-slotinfo-to-avoid-use-after-free.patch
 create mode 100644 meta/recipes-core/glibc/glibc/0031-elf-Fix-data-races-in-pthread_create-and-TLS-access-BZ-19329.patch
 create mode 100644 meta/recipes-core/glibc/glibc/0032-elf-Use-relaxed-atomics-for-racy-accesses-BZ-19329.patch
 create mode 100644 meta/recipes-core/glibc/glibc/0033-elf-Add-test-case-for-BZ-19329.patch
 create mode 100644 meta/recipes-core/glibc/glibc/0034-elf-Fix-DTV-gap-reuse-logic-BZ-27135.patch
 create mode 100644 meta/recipes-core/glibc/glibc/0035-x86_64-Avoid-lazy-relocation-of-tlsdesc-BZ-27137.patch
 create mode 100644 meta/recipes-core/glibc/glibc/0036-i386-Avoid-lazy-relocation-of-tlsdesc-BZ-27137.patch
 create mode 100644 meta/recipes-core/glibc/glibc/0037-Avoid-deadlock-between-pthread_create-and-ctors.patch

diff --git a/meta/recipes-core/glibc/glibc/0030-elf-Refactor_dl_update-slotinfo-to-avoid-use-after-free.patch b/meta/recipes-core/glibc/glibc/0030-elf-Refactor_dl_update-slotinfo-to-avoid-use-after-free.patch
new file mode 100644
index 0000000..dba491f
--- /dev/null
+++ b/meta/recipes-core/glibc/glibc/0030-elf-Refactor_dl_update-slotinfo-to-avoid-use-after-free.patch
@@ -0,0 +1,66 @@
+From c0669ae1a629e16b536bf11cdd0865e0dbcf4bee Mon Sep 17 00:00:00 2001
+From: Szabolcs Nagy <szabolcs.nagy@arm.com>
+Date: Wed, 30 Dec 2020 21:52:38 +0000
+Subject: [PATCH] elf: Refactor _dl_update_slotinfo to avoid use after free
+
+map is not valid to access here because it can be freed by a concurrent
+dlclose: during tls access (via __tls_get_addr) _dl_update_slotinfo is
+called without holding dlopen locks. So don't check the modid of map.
+
+The map == 0 and map != 0 code paths can be shared (avoiding the dtv
+resize in case of map == 0 is just an optimization: larger dtv than
+necessary would be fine too).
+
+Reviewed-by: Adhemerval Zanella  <adhemerval.zanella@linaro.org>
+---
+ elf/dl-tls.c | 21 +++++----------------
+ 1 file changed, 5 insertions(+), 16 deletions(-)
+---
+Upstream-Status: Backport [https://sourceware.org/git/?p=glibc.git;a=patch;h=c0669ae1a629e16b536bf11cdd0865e0dbcf4bee]
+Signed-off-by: Akash Hadke <akash.hadke@kpit.com>
+Signed-off-by: Akash Hadke <hadkeakash4@gmail.com>
+---
+diff --git a/elf/dl-tls.c b/elf/dl-tls.c
+index 24d00c14ef..f8b32b3ecb 100644
+--- a/elf/dl-tls.c
++++ b/elf/dl-tls.c
+@@ -743,6 +743,8 @@ _dl_update_slotinfo (unsigned long int req_modid)
+ 	{
+ 	  for (size_t cnt = total == 0 ? 1 : 0; cnt < listp->len; ++cnt)
+ 	    {
++	      size_t modid = total + cnt;
++
+ 	      size_t gen = listp->slotinfo[cnt].gen;
+ 
+ 	      if (gen > new_gen)
+@@ -758,25 +760,12 @@ _dl_update_slotinfo (unsigned long int req_modid)
+ 
+ 	      /* If there is no map this means the entry is empty.  */
+ 	      struct link_map *map = listp->slotinfo[cnt].map;
+-	      if (map == NULL)
+-		{
+-		  if (dtv[-1].counter >= total + cnt)
+-		    {
+-		      /* If this modid was used at some point the memory
+-			 might still be allocated.  */
+-		      free (dtv[total + cnt].pointer.to_free);
+-		      dtv[total + cnt].pointer.val = TLS_DTV_UNALLOCATED;
+-		      dtv[total + cnt].pointer.to_free = NULL;
+-		    }
+-
+-		  continue;
+-		}
+-
+ 	      /* Check whether the current dtv array is large enough.  */
+-	      size_t modid = map->l_tls_modid;
+-	      assert (total + cnt == modid);
+ 	      if (dtv[-1].counter < modid)
+ 		{
++		  if (map == NULL)
++		    continue;
++
+ 		  /* Resize the dtv.  */
+ 		  dtv = _dl_resize_dtv (dtv);
+ 
+-- 
+2.27.0
diff --git a/meta/recipes-core/glibc/glibc/0031-elf-Fix-data-races-in-pthread_create-and-TLS-access-BZ-19329.patch b/meta/recipes-core/glibc/glibc/0031-elf-Fix-data-races-in-pthread_create-and-TLS-access-BZ-19329.patch
new file mode 100644
index 0000000..25beee1
--- /dev/null
+++ b/meta/recipes-core/glibc/glibc/0031-elf-Fix-data-races-in-pthread_create-and-TLS-access-BZ-19329.patch
@@ -0,0 +1,191 @@
+From 1387ad6225c2222f027790e3f460e31aa5dd2c54 Mon Sep 17 00:00:00 2001
+From: Szabolcs Nagy <szabolcs.nagy@arm.com>
+Date: Wed, 30 Dec 2020 19:19:37 +0000
+Subject: [PATCH] elf: Fix data races in pthread_create and TLS access [BZ
+ #19329]
+
+DTV setup at thread creation (_dl_allocate_tls_init) is changed
+to take the dlopen lock, GL(dl_load_lock).  Avoiding data races
+here without locks would require design changes: the map that is
+accessed for static TLS initialization here may be concurrently
+freed by dlclose.  That use after free may be solved by only
+locking around static TLS setup or by ensuring dlclose does not
+free modules with static TLS, however currently every link map
+with TLS has to be accessed at least to see if it needs static
+TLS.  And even if that's solved, still a lot of atomics would be
+needed to synchronize DTV related globals without a lock. So fix
+both bug 19329 and bug 27111 with a lock that prevents DTV setup
+running concurrently with dlopen or dlclose.
+
+_dl_update_slotinfo at TLS access still does not use any locks
+so CONCURRENCY NOTES are added to explain the synchronization.
+The early exit from the slotinfo walk when max_modid is reached
+is not strictly necessary, but does not hurt either.
+
+An incorrect acquire load was removed from _dl_resize_dtv: it
+did not synchronize with any release store or fence and
+synchronization is now handled separately at thread creation
+and TLS access time.
+
+There are still a number of racy read accesses to globals that
+will be changed to relaxed MO atomics in a followup patch. This
+should not introduce regressions compared to existing behaviour
+and avoid cluttering the main part of the fix.
+
+Not all TLS access related data races got fixed here: there are
+additional races at lazy tlsdesc relocations see bug 27137.
+
+Reviewed-by: Adhemerval Zanella  <adhemerval.zanella@linaro.org>
+---
+ elf/dl-tls.c | 63 +++++++++++++++++++++++++++++++++++++++-------------
+ 1 file changed, 47 insertions(+), 16 deletions(-)
+---
+Upstream-Status: Backport [https://sourceware.org/git/?p=glibc.git;a=patch;h=1387ad6225c2222f027790e3f460e31aa5dd2c54]
+Signed-off-by: Akash Hadke <akash.hadke@kpit.com>
+Signed-off-by: Akash Hadke <hadkeakash4@gmail.com>
+---
+diff --git a/elf/dl-tls.c b/elf/dl-tls.c
+index 6baff0c1ea..94f3cdbae0 100644
+--- a/elf/dl-tls.c
++++ b/elf/dl-tls.c
+@@ -475,14 +475,11 @@ extern dtv_t _dl_static_dtv[];
+ #endif
+ 
+ static dtv_t *
+-_dl_resize_dtv (dtv_t *dtv)
++_dl_resize_dtv (dtv_t *dtv, size_t max_modid)
+ {
+   /* Resize the dtv.  */
+   dtv_t *newp;
+-  /* Load GL(dl_tls_max_dtv_idx) atomically since it may be written to by
+-     other threads concurrently.  */
+-  size_t newsize
+-    = atomic_load_acquire (&GL(dl_tls_max_dtv_idx)) + DTV_SURPLUS;
++  size_t newsize = max_modid + DTV_SURPLUS;
+   size_t oldsize = dtv[-1].counter;
+ 
+   if (dtv == GL(dl_initial_dtv))
+@@ -528,11 +525,14 @@ _dl_allocate_tls_init (void *result)
+   size_t total = 0;
+   size_t maxgen = 0;
+ 
++  /* Protects global dynamic TLS related state.  */
++  __rtld_lock_lock_recursive (GL(dl_load_lock));
++
+   /* Check if the current dtv is big enough.   */
+   if (dtv[-1].counter < GL(dl_tls_max_dtv_idx))
+     {
+       /* Resize the dtv.  */
+-      dtv = _dl_resize_dtv (dtv);
++      dtv = _dl_resize_dtv (dtv, GL(dl_tls_max_dtv_idx));
+ 
+       /* Install this new dtv in the thread data structures.  */
+       INSTALL_DTV (result, &dtv[-1]);
+@@ -600,6 +600,7 @@ _dl_allocate_tls_init (void *result)
+       listp = listp->next;
+       assert (listp != NULL);
+     }
++  __rtld_lock_unlock_recursive (GL(dl_load_lock));
+ 
+   /* The DTV version is up-to-date now.  */
+   dtv[0].counter = maxgen;
+@@ -734,12 +735,29 @@ _dl_update_slotinfo (unsigned long int req_modid)
+ 
+   if (dtv[0].counter < listp->slotinfo[idx].gen)
+     {
+-      /* The generation counter for the slot is higher than what the
+-	 current dtv implements.  We have to update the whole dtv but
+-	 only those entries with a generation counter <= the one for
+-	 the entry we need.  */
++      /* CONCURRENCY NOTES:
++
++	 Here the dtv needs to be updated to new_gen generation count.
++
++	 This code may be called during TLS access when GL(dl_load_lock)
++	 is not held.  In that case the user code has to synchronize with
++	 dlopen and dlclose calls of relevant modules.  A module m is
++	 relevant if the generation of m <= new_gen and dlclose of m is
++	 synchronized: a memory access here happens after the dlopen and
++	 before the dlclose of relevant modules.  The dtv entries for
++	 relevant modules need to be updated, other entries can be
++	 arbitrary.
++
++	 This e.g. means that the first part of the slotinfo list can be
++	 accessed race free, but the tail may be concurrently extended.
++	 Similarly relevant slotinfo entries can be read race free, but
++	 other entries are racy.  However updating a non-relevant dtv
++	 entry does not affect correctness.  For a relevant module m,
++	 max_modid >= modid of m.  */
+       size_t new_gen = listp->slotinfo[idx].gen;
+       size_t total = 0;
++      size_t max_modid  = atomic_load_relaxed (&GL(dl_tls_max_dtv_idx));
++      assert (max_modid >= req_modid);
+ 
+       /* We have to look through the entire dtv slotinfo list.  */
+       listp =  GL(dl_tls_dtv_slotinfo_list);
+@@ -749,12 +767,14 @@ _dl_update_slotinfo (unsigned long int req_modid)
+ 	    {
+ 	      size_t modid = total + cnt;
+ 
++	      /* Later entries are not relevant.  */
++	      if (modid > max_modid)
++		break;
++
+ 	      size_t gen = listp->slotinfo[cnt].gen;
+ 
+ 	      if (gen > new_gen)
+-		/* This is a slot for a generation younger than the
+-		   one we are handling now.  It might be incompletely
+-		   set up so ignore it.  */
++		/* Not relevant.  */
+ 		continue;
+ 
+ 	      /* If the entry is older than the current dtv layout we
+@@ -771,7 +791,7 @@ _dl_update_slotinfo (unsigned long int req_modid)
+ 		    continue;
+ 
+ 		  /* Resize the dtv.  */
+-		  dtv = _dl_resize_dtv (dtv);
++		  dtv = _dl_resize_dtv (dtv, max_modid);
+ 
+ 		  assert (modid <= dtv[-1].counter);
+ 
+@@ -793,8 +813,17 @@ _dl_update_slotinfo (unsigned long int req_modid)
+ 	    }
+ 
+ 	  total += listp->len;
++	  if (total > max_modid)
++	    break;
++
++	  /* Synchronize with _dl_add_to_slotinfo.  Ideally this would
++	     be consume MO since we only need to order the accesses to
++	     the next node after the read of the address and on most
++	     hardware (other than alpha) a normal load would do that
++	     because of the address dependency.  */
++	  listp = atomic_load_acquire (&listp->next);
+ 	}
+-      while ((listp = listp->next) != NULL);
++      while (listp != NULL);
+ 
+       /* This will be the new maximum generation counter.  */
+       dtv[0].counter = new_gen;
+@@ -986,7 +1015,7 @@ _dl_add_to_slotinfo (struct link_map *l, bool do_add)
+ 	 the first slot.  */
+       assert (idx == 0);
+ 
+-      listp = prevp->next = (struct dtv_slotinfo_list *)
++      listp = (struct dtv_slotinfo_list *)
+ 	malloc (sizeof (struct dtv_slotinfo_list)
+ 		+ TLS_SLOTINFO_SURPLUS * sizeof (struct dtv_slotinfo));
+       if (listp == NULL)
+@@ -1000,6 +1029,8 @@ cannot create TLS data structures"));
+       listp->next = NULL;
+       memset (listp->slotinfo, '\0',
+ 	      TLS_SLOTINFO_SURPLUS * sizeof (struct dtv_slotinfo));
++      /* Synchronize with _dl_update_slotinfo.  */
++      atomic_store_release (&prevp->next, listp);
+     }
+ 
+   /* Add the information into the slotinfo data structure.  */
+-- 
+2.27.0
diff --git a/meta/recipes-core/glibc/glibc/0032-elf-Use-relaxed-atomics-for-racy-accesses-BZ-19329.patch b/meta/recipes-core/glibc/glibc/0032-elf-Use-relaxed-atomics-for-racy-accesses-BZ-19329.patch
new file mode 100644
index 0000000..eb8ef31
--- /dev/null
+++ b/meta/recipes-core/glibc/glibc/0032-elf-Use-relaxed-atomics-for-racy-accesses-BZ-19329.patch
@@ -0,0 +1,206 @@
+From f4f8f4d4e0f92488431b268c8cd9555730b9afe9 Mon Sep 17 00:00:00 2001
+From: Szabolcs Nagy <szabolcs.nagy@arm.com>
+Date: Wed, 30 Dec 2020 19:19:37 +0000
+Subject: [PATCH] elf: Use relaxed atomics for racy accesses [BZ #19329]
+
+This is a follow up patch to the fix for bug 19329.  This adds relaxed
+MO atomics to accesses that were previously data races but are now
+race conditions, and where relaxed MO is sufficient.
+
+The race conditions all follow the pattern that the write is behind the
+dlopen lock, but a read can happen concurrently (e.g. during tls access)
+without holding the lock.  For slotinfo entries the read value only
+matters if it reads from a synchronized write in dlopen or dlclose,
+otherwise the related dtv entry is not valid to access so it is fine
+to leave it in an inconsistent state.  The same applies for
+GL(dl_tls_max_dtv_idx) and GL(dl_tls_generation), but there the
+algorithm relies on the fact that the read of the last synchronized
+write is an increasing value.
+
+Reviewed-by: Adhemerval Zanella  <adhemerval.zanella@linaro.org>
+---
+ elf/dl-close.c          | 20 +++++++++++++-------
+ elf/dl-open.c           |  5 ++++-
+ elf/dl-tls.c            | 31 +++++++++++++++++++++++--------
+ sysdeps/x86_64/dl-tls.c |  3 ++-
+ 4 files changed, 42 insertions(+), 17 deletions(-)
+---
+Upstream-Status: Backport [https://sourceware.org/git/?p=glibc.git;a=patch;h=f4f8f4d4e0f92488431b268c8cd9555730b9afe9]
+Comment: Hunks from elf/dl-open.c and elf/dl-tls.c are refreshed due to offset change.
+Signed-off-by: Akash Hadke <akash.hadke@kpit.com>
+Signed-off-by: Akash Hadke <hadkeakash4@gmail.com>
+---
+diff --git a/elf/dl-close.c b/elf/dl-close.c
+index c51becd06b..3720e47dd1 100644
+--- a/elf/dl-close.c
++++ b/elf/dl-close.c
+@@ -79,9 +79,10 @@ remove_slotinfo (size_t idx, struct dtv_slotinfo_list *listp, size_t disp,
+ 	{
+ 	  assert (old_map->l_tls_modid == idx);
+ 
+-	  /* Mark the entry as unused. */
+-	  listp->slotinfo[idx - disp].gen = GL(dl_tls_generation) + 1;
+-	  listp->slotinfo[idx - disp].map = NULL;
++	  /* Mark the entry as unused.  These can be read concurrently.  */
++	  atomic_store_relaxed (&listp->slotinfo[idx - disp].gen,
++				GL(dl_tls_generation) + 1);
++	  atomic_store_relaxed (&listp->slotinfo[idx - disp].map, NULL);
+ 	}
+ 
+       /* If this is not the last currently used entry no need to look
+@@ -96,8 +97,8 @@ remove_slotinfo (size_t idx, struct dtv_slotinfo_list *listp, size_t disp,
+ 
+       if (listp->slotinfo[idx - disp].map != NULL)
+ 	{
+-	  /* Found a new last used index.  */
+-	  GL(dl_tls_max_dtv_idx) = idx;
++	  /* Found a new last used index.  This can be read concurrently.  */
++	  atomic_store_relaxed (&GL(dl_tls_max_dtv_idx), idx);
+ 	  return true;
+ 	}
+     }
+@@ -571,7 +572,9 @@ _dl_close_worker (struct link_map *map, bool force)
+ 					GL(dl_tls_dtv_slotinfo_list), 0,
+ 					imap->l_init_called))
+ 		/* All dynamically loaded modules with TLS are unloaded.  */
+-		GL(dl_tls_max_dtv_idx) = GL(dl_tls_static_nelem);
++		/* Can be read concurrently.  */
++		atomic_store_relaxed (&GL(dl_tls_max_dtv_idx),
++				      GL(dl_tls_static_nelem));
+ 
+ 	      if (imap->l_tls_offset != NO_TLS_OFFSET
+ 		  && imap->l_tls_offset != FORCED_DYNAMIC_TLS_OFFSET)
+@@ -769,8 +772,11 @@ _dl_close_worker (struct link_map *map, bool force)
+   /* If we removed any object which uses TLS bump the generation counter.  */
+   if (any_tls)
+     {
+-      if (__glibc_unlikely (++GL(dl_tls_generation) == 0))
++      size_t newgen = GL(dl_tls_generation) + 1;
++      if (__glibc_unlikely (newgen == 0))
+ 	_dl_fatal_printf ("TLS generation counter wrapped!  Please report as described in "REPORT_BUGS_TO".\n");
++      /* Can be read concurrently.  */
++      atomic_store_relaxed (&GL(dl_tls_generation), newgen);
+ 
+       if (tls_free_end == GL(dl_tls_static_used))
+ 	GL(dl_tls_static_used) = tls_free_start;
+diff --git a/elf/dl-open.c b/elf/dl-open.c
+index 09f0df7d38..bb79ef00f1 100644
+--- a/elf/dl-open.c
++++ b/elf/dl-open.c
+@@ -387,9 +387,12 @@
+ 	}
+     }
+ 
+-  if (__builtin_expect (++GL(dl_tls_generation) == 0, 0))
++  size_t newgen = GL(dl_tls_generation) + 1;
++  if (__glibc_unlikely (newgen == 0))
+     _dl_fatal_printf (N_("\
+ TLS generation counter wrapped!  Please report this."));
++  /* Can be read concurrently.  */
++  atomic_store_relaxed (&GL(dl_tls_generation), newgen);
+ 
+   /* We need a second pass for static tls data, because
+      _dl_update_slotinfo must not be run while calls to
+diff --git a/elf/dl-tls.c b/elf/dl-tls.c
+index 94f3cdbae0..dc69cd984e 100644
+--- a/elf/dl-tls.c
++++ b/elf/dl-tls.c
+@@ -96,7 +96,9 @@
+       /* No gaps, allocate a new entry.  */
+     nogaps:
+ 
+-      result = ++GL(dl_tls_max_dtv_idx);
++      result = GL(dl_tls_max_dtv_idx) + 1;
++      /* Can be read concurrently.  */
++      atomic_store_relaxed (&GL(dl_tls_max_dtv_idx), result);
+     }
+ 
+   return result;
+@@ -279,10 +281,12 @@
+   dtv_t *dtv;
+   size_t dtv_length;
+ 
++  /* Relaxed MO, because the dtv size is later rechecked, not relied on.  */
++  size_t max_modid = atomic_load_relaxed (&GL(dl_tls_max_dtv_idx));
+   /* We allocate a few more elements in the dtv than are needed for the
+      initial set of modules.  This should avoid in most cases expansions
+      of the dtv.  */
+-  dtv_length = GL(dl_tls_max_dtv_idx) + DTV_SURPLUS;
++  dtv_length = max_modid + DTV_SURPLUS;
+   dtv = calloc (dtv_length + 2, sizeof (dtv_t));
+   if (dtv != NULL)
+     {
+@@ -687,7 +691,7 @@
+ 	      if (modid > max_modid)
+ 		break;
+ 
+-	      size_t gen = listp->slotinfo[cnt].gen;
++	      size_t gen = atomic_load_relaxed (&listp->slotinfo[cnt].gen);
+ 
+ 	      if (gen > new_gen)
+ 		/* Not relevant.  */
+@@ -699,7 +703,8 @@
+ 		continue;
+ 
+ 	      /* If there is no map this means the entry is empty.  */
+-	      struct link_map *map = listp->slotinfo[cnt].map;
++	      struct link_map *map
++		= atomic_load_relaxed (&listp->slotinfo[cnt].map);
+ 	      /* Check whether the current dtv array is large enough.  */
+ 	      if (dtv[-1].counter < modid)
+ 		{
+@@ -843,7 +848,12 @@
+ {
+   dtv_t *dtv = THREAD_DTV ();
+ 
+-  if (__glibc_unlikely (dtv[0].counter != GL(dl_tls_generation)))
++  /* Update is needed if dtv[0].counter < the generation of the accessed
++     module.  The global generation counter is used here as it is easier
++     to check.  Synchronization for the relaxed MO access is guaranteed
++     by user code, see CONCURRENCY NOTES in _dl_update_slotinfo.  */
++  size_t gen = atomic_load_relaxed (&GL(dl_tls_generation));
++  if (__glibc_unlikely (dtv[0].counter != gen))
+     return update_get_addr (GET_ADDR_PARAM);
+ 
+   void *p = dtv[GET_ADDR_MODULE].pointer.val;
+@@ -866,7 +876,10 @@
+     return NULL;
+ 
+   dtv_t *dtv = THREAD_DTV ();
+-  if (__glibc_unlikely (dtv[0].counter != GL(dl_tls_generation)))
++  /* This may be called without holding the GL(dl_load_lock).  Reading
++     arbitrary gen value is fine since this is best effort code.  */
++  size_t gen = atomic_load_relaxed (&GL(dl_tls_generation));
++  if (__glibc_unlikely (dtv[0].counter != gen))
+     {
+       /* This thread's DTV is not completely current,
+ 	 but it might already cover this module.  */
+@@ -961,7 +974,9 @@
+   /* Add the information into the slotinfo data structure.  */
+   if (do_add)
+     {
+-      listp->slotinfo[idx].map = l;
+-      listp->slotinfo[idx].gen = GL(dl_tls_generation) + 1;
++      /* Can be read concurrently.  See _dl_update_slotinfo.  */
++      atomic_store_relaxed (&listp->slotinfo[idx].map, l);
++      atomic_store_relaxed (&listp->slotinfo[idx].gen,
++			    GL(dl_tls_generation) + 1);
+     }
+ }
+ 
+diff --git a/sysdeps/x86_64/dl-tls.c b/sysdeps/x86_64/dl-tls.c
+index 6595f6615b..24ef560b71 100644
+--- a/sysdeps/x86_64/dl-tls.c
++++ b/sysdeps/x86_64/dl-tls.c
+@@ -40,7 +40,8 @@ __tls_get_addr_slow (GET_ADDR_ARGS)
+ {
+   dtv_t *dtv = THREAD_DTV ();
+ 
+-  if (__glibc_unlikely (dtv[0].counter != GL(dl_tls_generation)))
++  size_t gen = atomic_load_relaxed (&GL(dl_tls_generation));
++  if (__glibc_unlikely (dtv[0].counter != gen))
+     return update_get_addr (GET_ADDR_PARAM);
+ 
+   return tls_get_addr_tail (GET_ADDR_PARAM, dtv, NULL);
+-- 
+2.27.0
diff --git a/meta/recipes-core/glibc/glibc/0033-elf-Add-test-case-for-BZ-19329.patch b/meta/recipes-core/glibc/glibc/0033-elf-Add-test-case-for-BZ-19329.patch
new file mode 100644
index 0000000..f22e52e
--- /dev/null
+++ b/meta/recipes-core/glibc/glibc/0033-elf-Add-test-case-for-BZ-19329.patch
@@ -0,0 +1,144 @@
+From 9d0e30329c23b5ad736fda3f174208c25970dbce Mon Sep 17 00:00:00 2001
+From: Szabolcs Nagy <szabolcs.nagy@arm.com>
+Date: Tue, 13 Dec 2016 12:28:41 +0000
+Subject: [PATCH] elf: Add test case for [BZ #19329]
+
+Test concurrent dlopen and pthread_create when the loaded modules have
+TLS.  This triggers dl-tls assertion failures more reliably than the
+nptl/tst-stack4 test.
+
+The dlopened module has 100 DT_NEEDED dependencies with TLS, they were
+reused from an existing TLS test. The number of created threads during
+dlopen depends on filesystem speed and hardware, but at most 3 threads
+are alive at a time to limit resource usage.
+
+Reviewed-by: Adhemerval Zanella  <adhemerval.zanella@linaro.org>
+---
+ elf/Makefile       |  9 ++++--
+ elf/tst-tls21.c    | 68 ++++++++++++++++++++++++++++++++++++++++++++++
+ elf/tst-tls21mod.c |  1 +
+ 3 files changed, 76 insertions(+), 2 deletions(-)
+ create mode 100644 elf/tst-tls21.c
+ create mode 100644 elf/tst-tls21mod.c
+---
+Upstream-Status: Backport [https://sourceware.org/git/?p=glibc.git;a=patch;h=9d0e30329c23b5ad736fda3f174208c25970dbce]
+Comment: Hunks from elf/Makefile are refreshed as per glibc 2.31 codebase.
+Signed-off-by: Akash Hadke <akash.hadke@kpit.com>
+Signed-off-by: Akash Hadke <hadkeakash4@gmail.com>
+---
+diff --git a/elf/Makefile b/elf/Makefile
+index d3e909637a..3241cb6046 100644
+--- a/elf/Makefile
++++ b/elf/Makefile
+@@ -201,7 +201,7 @@
+ 	 tst-unwind-ctor tst-unwind-main tst-audit13 \
+ 	 tst-sonamemove-link tst-sonamemove-dlopen tst-dlopen-tlsmodid \
+ 	 tst-dlopen-self tst-auditmany tst-initfinilazyfail tst-dlopenfail \
+-	 tst-dlopenfail-2
++	 tst-dlopenfail-2 tst-tls21
+ #	 reldep9
+ tests-internal += loadtest unload unload2 circleload1 \
+ 	 neededtest neededtest2 neededtest3 neededtest4 \
+@@ -312,7 +312,7 @@
+ 		tst-auditmanymod7 tst-auditmanymod8 tst-auditmanymod9 \
+ 		tst-initlazyfailmod tst-finilazyfailmod \
+ 		tst-dlopenfailmod1 tst-dlopenfaillinkmod tst-dlopenfailmod2 \
+-		tst-dlopenfailmod3 tst-ldconfig-ld-mod
++		tst-dlopenfailmod3 tst-ldconfig-ld-mod tst-tls21mod
+ # Most modules build with _ISOMAC defined, but those filtered out
+ # depend on internal headers.
+ modules-names-tests = $(filter-out ifuncmod% tst-libc_dlvsym-dso tst-tlsmod%,\
+@@ -1697,5 +1697,10 @@
+   $(objpfx)tst-dlopen-nodelete-reloc-mod16.so
+ LDFLAGS-tst-dlopen-nodelete-reloc-mod17.so = -Wl,--no-as-needed
+ 
++# Reuses tst-tls-many-dynamic-modules
++$(objpfx)tst-tls21: $(libdl) $(shared-thread-library)
++$(objpfx)tst-tls21.out: $(objpfx)tst-tls21mod.so
++$(objpfx)tst-tls21mod.so: $(tst-tls-many-dynamic-modules:%=$(objpfx)%.so)
++
+ $(objpfx)tst-ldconfig-ld_so_conf-update.out: $(objpfx)tst-ldconfig-ld-mod.so
+ $(objpfx)tst-ldconfig-ld_so_conf-update: $(libdl)
+diff --git a/elf/tst-tls21.c b/elf/tst-tls21.c
+new file mode 100644
+index 0000000000..560bf5813a
+--- /dev/null
++++ b/elf/tst-tls21.c
+@@ -0,0 +1,68 @@
++/* Test concurrent dlopen and pthread_create: BZ 19329.
++   Copyright (C) 2021 Free Software Foundation, Inc.
++   This file is part of the GNU C Library.
++
++   The GNU C Library is free software; you can redistribute it and/or
++   modify it under the terms of the GNU Lesser General Public
++   License as published by the Free Software Foundation; either
++   version 2.1 of the License, or (at your option) any later version.
++
++   The GNU C Library is distributed in the hope that it will be useful,
++   but WITHOUT ANY WARRANTY; without even the implied warranty of
++   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
++   Lesser General Public License for more details.
++
++   You should have received a copy of the GNU Lesser General Public
++   License along with the GNU C Library; if not, see
++   <http://www.gnu.org/licenses/>.  */
++
++#include <dlfcn.h>
++#include <pthread.h>
++#include <stdio.h>
++#include <stdatomic.h>
++#include <support/xdlfcn.h>
++#include <support/xthread.h>
++
++#define THREADS 10000
++
++static atomic_int done;
++
++static void *
++start (void *a)
++{
++  /* Load a module with many dependencies that each have TLS.  */
++  xdlopen ("tst-tls21mod.so", RTLD_LAZY);
++  atomic_store_explicit (&done, 1, memory_order_release);
++  return 0;
++}
++
++static void *
++nop (void *a)
++{
++  return 0;
++}
++
++static int
++do_test (void)
++{
++  pthread_t t1, t2;
++  int i;
++
++  /* Load a module with lots of dependencies and TLS.  */
++  t1 = xpthread_create (0, start, 0);
++
++  /* Concurrently create lots of threads until dlopen is observably done.  */
++  for (i = 0; i < THREADS; i++)
++    {
++      if (atomic_load_explicit (&done, memory_order_acquire) != 0)
++	break;
++      t2 = xpthread_create (0, nop, 0);
++      xpthread_join (t2);
++    }
++
++  xpthread_join (t1);
++  printf ("threads created during dlopen: %d\n", i);
++  return 0;
++}
++
++#include <support/test-driver.c>
+diff --git a/elf/tst-tls21mod.c b/elf/tst-tls21mod.c
+new file mode 100644
+index 0000000000..206ece4fb3
+--- /dev/null
++++ b/elf/tst-tls21mod.c
+@@ -0,0 +1 @@
++int __thread x;
+-- 
+2.27.0
diff --git a/meta/recipes-core/glibc/glibc/0034-elf-Fix-DTV-gap-reuse-logic-BZ-27135.patch b/meta/recipes-core/glibc/glibc/0034-elf-Fix-DTV-gap-reuse-logic-BZ-27135.patch
new file mode 100644
index 0000000..a87afe3
--- /dev/null
+++ b/meta/recipes-core/glibc/glibc/0034-elf-Fix-DTV-gap-reuse-logic-BZ-27135.patch
@@ -0,0 +1,180 @@
+From ba33937be210da5d07f7f01709323743f66011ce Mon Sep 17 00:00:00 2001
+From: Adhemerval Zanella <adhemerval.zanella@linaro.org>
+Date: Fri, 25 Jun 2021 10:54:12 -0300
+Subject: [PATCH] elf: Fix DTV gap reuse logic (BZ #27135)
+
+This is updated version of the 572bd547d57a (reverted by 40ebfd016ad2)
+that fixes the _dl_next_tls_modid issues.
+
+This issue with 572bd547d57a patch is the DTV entry will be only
+update on dl_open_worker() with the update_tls_slotinfo() call after
+all dependencies are being processed by _dl_map_object_deps().  However
+_dl_map_object_deps() itself might call _dl_next_tls_modid(), and since
+the _dl_tls_dtv_slotinfo_list::map is not yet set the entry will be
+wrongly reused.
+
+This patch fixes by renaming the _dl_next_tls_modid() function to
+_dl_assign_tls_modid() and by passing the link_map so it can set
+the slotinfo value so a subsequente _dl_next_tls_modid() call will
+see the entry as allocated.
+
+The intermediary value is cleared up on remove_slotinfo() for the case
+a library fails to load with RTLD_NOW.
+
+This patch fixes BZ #27135.
+
+Checked on x86_64-linux-gnu.
+
+Reviewed-by: Szabolcs Nagy <szabolcs.nagy@arm.com>
+---
+ elf/dl-close.c             |   8 +-
+ elf/dl-load.c              |   2 +-
+ elf/dl-open.c              |  10 --
+ elf/dl-tls.c               |  17 +--
+ elf/rtld.c                 |   2 +-
+ sysdeps/generic/ldsodefs.h |   4 +-
+ 6 files changed, 349 insertions(+), 33 deletions(-)
+---
+Upstream-Status: Backport [https://sourceware.org/git/?p=glibc.git;a=patch;h=ba33937be210da5d07f7f01709323743f66011ce]
+Comment: Removed hunks those were related to test. Hunk from elf/rtld.c is refreshed.
+Signed-off-by: Akash Hadke <akash.hadke@kpit.com>
+Signed-off-by: Akash Hadke <hadkeakash4@gmail.com>
+---
+diff --git a/elf/dl-close.c b/elf/dl-close.c
+index 3720e47dd1..f39001cab9 100644
+--- a/elf/dl-close.c
++++ b/elf/dl-close.c
+@@ -77,8 +77,6 @@ remove_slotinfo (size_t idx, struct dtv_slotinfo_list *listp, size_t disp,
+ 	 object that wasn't fully set up.  */
+       if (__glibc_likely (old_map != NULL))
+ 	{
+-	  assert (old_map->l_tls_modid == idx);
+-
+ 	  /* Mark the entry as unused.  These can be read concurrently.  */
+ 	  atomic_store_relaxed (&listp->slotinfo[idx - disp].gen,
+ 				GL(dl_tls_generation) + 1);
+@@ -88,7 +86,11 @@ remove_slotinfo (size_t idx, struct dtv_slotinfo_list *listp, size_t disp,
+       /* If this is not the last currently used entry no need to look
+ 	 further.  */
+       if (idx != GL(dl_tls_max_dtv_idx))
+-	return true;
++	{
++	  /* There is an unused dtv entry in the middle.  */
++	  GL(dl_tls_dtv_gaps) = true;
++	  return true;
++	}
+     }
+ 
+   while (idx - disp > (disp == 0 ? 1 + GL(dl_tls_static_nelem) : 0))
+diff --git a/elf/dl-load.c b/elf/dl-load.c
+index a08df001af..650e4edc35 100644
+--- a/elf/dl-load.c
++++ b/elf/dl-load.c
+@@ -1498,7 +1498,7 @@ cannot enable executable stack as shared object requires");
+ 	     not set up TLS data structures, so don't use them now.  */
+ 	  || __glibc_likely (GL(dl_tls_dtv_slotinfo_list) != NULL)))
+     /* Assign the next available module ID.  */
+-    l->l_tls_modid = _dl_next_tls_modid ();
++    _dl_assign_tls_modid (l);
+ 
+ #ifdef DL_AFTER_LOAD
+   DL_AFTER_LOAD (l);
+diff --git a/elf/dl-open.c b/elf/dl-open.c
+index a066f39bd0..d2240d8747 100644
+--- a/elf/dl-open.c
++++ b/elf/dl-open.c
+@@ -899,16 +899,6 @@ no more namespaces available for dlmopen()"));
+ 	 state if relocation failed, for example.  */
+       if (args.map)
+ 	{
+-	  /* Maybe some of the modules which were loaded use TLS.
+-	     Since it will be removed in the following _dl_close call
+-	     we have to mark the dtv array as having gaps to fill the
+-	     holes.  This is a pessimistic assumption which won't hurt
+-	     if not true.  There is no need to do this when we are
+-	     loading the auditing DSOs since TLS has not yet been set
+-	     up.  */
+-	  if ((mode & __RTLD_AUDIT) == 0)
+-	    GL(dl_tls_dtv_gaps) = true;
+-
+ 	  _dl_close_worker (args.map, true);
+ 
+ 	  /* All l_nodelete_pending objects should have been deleted
+diff --git a/elf/dl-tls.c b/elf/dl-tls.c
+index 2b5161d10a..423e380f7c 100644
+--- a/elf/dl-tls.c
++++ b/elf/dl-tls.c
+@@ -126,8 +126,8 @@ oom (void)
+ }
+ 
+ 
+-size_t
+-_dl_next_tls_modid (void)
++void
++_dl_assign_tls_modid (struct link_map *l)
+ {
+   size_t result;
+ 
+@@ -157,7 +157,11 @@ _dl_next_tls_modid (void)
+ 	      }
+ 
+ 	    if (result - disp < runp->len)
+-	      break;
++	      {
++		/* Mark the entry as used, so any dependency see it.  */
++		atomic_store_relaxed (&runp->slotinfo[result - disp].map, l);
++		break;
++	      }
+ 
+ 	    disp += runp->len;
+ 	  }
+@@ -184,17 +188,14 @@ _dl_next_tls_modid (void)
+       atomic_store_relaxed (&GL(dl_tls_max_dtv_idx), result);
+     }
+ 
+-  return result;
++  l->l_tls_modid = result;
+ }
+ 
+ 
+ size_t
+ _dl_count_modids (void)
+ {
+-  /* It is rare that we have gaps; see elf/dl-open.c (_dl_open) where
+-     we fail to load a module and unload it leaving a gap.  If we don't
+-     have gaps then the number of modids is the current maximum so
+-     return that.  */
++  /* The count is the max unless dlclose or failed dlopen created gaps.  */
+   if (__glibc_likely (!GL(dl_tls_dtv_gaps)))
+     return GL(dl_tls_max_dtv_idx);
+ 
+diff --git a/elf/rtld.c b/elf/rtld.c
+index e3fb2a5b2a..d733359eaf 100644
+--- a/elf/rtld.c
++++ b/elf/rtld.c
+@@ -1612,7 +1612,7 @@
+   /* Add the dynamic linker to the TLS list if it also uses TLS.  */
+   if (GL(dl_rtld_map).l_tls_blocksize != 0)
+     /* Assign a module ID.  Do this before loading any audit modules.  */
+-    GL(dl_rtld_map).l_tls_modid = _dl_next_tls_modid ();
++    _dl_assign_tls_modid (&GL(dl_rtld_map));
+ 
+   /* If we have auditing DSOs to load, do it now.  */
+   bool need_security_init = true;
+diff --git a/sysdeps/generic/ldsodefs.h b/sysdeps/generic/ldsodefs.h
+index 176394de4d..9c15259236 100644
+--- a/sysdeps/generic/ldsodefs.h
++++ b/sysdeps/generic/ldsodefs.h
+@@ -1171,8 +1171,8 @@ extern ElfW(Addr) _dl_sysdep_start (void **start_argptr,
+ extern void _dl_sysdep_start_cleanup (void) attribute_hidden;
+ 
+ 
+-/* Determine next available module ID.  */
+-extern size_t _dl_next_tls_modid (void) attribute_hidden;
++/* Determine next available module ID and set the L l_tls_modid.  */
++extern void _dl_assign_tls_modid (struct link_map *l) attribute_hidden;
+ 
+ /* Count the modules with TLS segments.  */
+ extern size_t _dl_count_modids (void) attribute_hidden;
+-- 
+2.27.0
diff --git a/meta/recipes-core/glibc/glibc/0035-x86_64-Avoid-lazy-relocation-of-tlsdesc-BZ-27137.patch b/meta/recipes-core/glibc/glibc/0035-x86_64-Avoid-lazy-relocation-of-tlsdesc-BZ-27137.patch
new file mode 100644
index 0000000..899111b
--- /dev/null
+++ b/meta/recipes-core/glibc/glibc/0035-x86_64-Avoid-lazy-relocation-of-tlsdesc-BZ-27137.patch
@@ -0,0 +1,56 @@
+From 8f7e09f4dbdb5c815a18b8285fbc5d5d7bc17d86 Mon Sep 17 00:00:00 2001
+From: Szabolcs Nagy <szabolcs.nagy@arm.com>
+Date: Thu, 11 Feb 2021 11:29:23 +0000
+Subject: [PATCH] x86_64: Avoid lazy relocation of tlsdesc [BZ #27137]
+
+Lazy tlsdesc relocation is racy because the static tls optimization and
+tlsdesc management operations are done without holding the dlopen lock.
+
+This similar to the commit b7cf203b5c17dd6d9878537d41e0c7cc3d270a67
+for aarch64, but it fixes a different race: bug 27137.
+
+Another issue is that ld auditing ignores DT_BIND_NOW and thus tries to
+relocate tlsdesc lazily, but that does not work in a BIND_NOW module
+due to missing DT_TLSDESC_PLT. Unconditionally relocating tlsdesc at
+load time fixes this bug 27721 too.
+---
+ sysdeps/x86_64/dl-machine.h | 19 ++++++++++++++-----
+ 1 file changed, 14 insertions(+), 5 deletions(-)
+---
+Upstream-Status: Backport [https://sourceware.org/git/?p=glibc.git;a=patch;h=8f7e09f4dbdb5c815a18b8285fbc5d5d7bc17d86]
+Signed-off-by: Akash Hadke <akash.hadke@kpit.com>
+Signed-off-by: Akash Hadke <hadkeakash4@gmail.com>
+---
+diff --git a/sysdeps/x86_64/dl-machine.h b/sysdeps/x86_64/dl-machine.h
+index 103eee6c3f..9a876a371e 100644
+--- a/sysdeps/x86_64/dl-machine.h
++++ b/sysdeps/x86_64/dl-machine.h
+@@ -570,12 +570,21 @@ elf_machine_lazy_rel (struct link_map *map,
+     }
+   else if (__glibc_likely (r_type == R_X86_64_TLSDESC))
+     {
+-      struct tlsdesc volatile * __attribute__((__unused__)) td =
+-	(struct tlsdesc volatile *)reloc_addr;
++      const Elf_Symndx symndx = ELFW (R_SYM) (reloc->r_info);
++      const ElfW (Sym) *symtab = (const void *)D_PTR (map, l_info[DT_SYMTAB]);
++      const ElfW (Sym) *sym = &symtab[symndx];
++      const struct r_found_version *version = NULL;
+ 
+-      td->arg = (void*)reloc;
+-      td->entry = (void*)(D_PTR (map, l_info[ADDRIDX (DT_TLSDESC_PLT)])
+-			  + map->l_addr);
++      if (map->l_info[VERSYMIDX (DT_VERSYM)] != NULL)
++	{
++	  const ElfW (Half) *vernum =
++	    (const void *)D_PTR (map, l_info[VERSYMIDX (DT_VERSYM)]);
++	  version = &map->l_versions[vernum[symndx] & 0x7fff];
++	}
++
++      /* Always initialize TLS descriptors completely at load time, in
++	 case static TLS is allocated for it that requires locking.  */
++      elf_machine_rela (map, reloc, sym, version, reloc_addr, skip_ifunc);
+     }
+   else if (__glibc_unlikely (r_type == R_X86_64_IRELATIVE))
+     {
+-- 
+2.27.0
diff --git a/meta/recipes-core/glibc/glibc/0036-i386-Avoid-lazy-relocation-of-tlsdesc-BZ-27137.patch b/meta/recipes-core/glibc/glibc/0036-i386-Avoid-lazy-relocation-of-tlsdesc-BZ-27137.patch
new file mode 100644
index 0000000..ad0a114
--- /dev/null
+++ b/meta/recipes-core/glibc/glibc/0036-i386-Avoid-lazy-relocation-of-tlsdesc-BZ-27137.patch
@@ -0,0 +1,124 @@
+From ddcacd91cc10ff92d6201eda87047d029c14158d Mon Sep 17 00:00:00 2001
+From: Szabolcs Nagy <szabolcs.nagy@arm.com>
+Date: Thu, 11 Feb 2021 11:40:11 +0000
+Subject: [PATCH] i386: Avoid lazy relocation of tlsdesc [BZ #27137]
+
+Lazy tlsdesc relocation is racy because the static tls optimization and
+tlsdesc management operations are done without holding the dlopen lock.
+
+This similar to the commit b7cf203b5c17dd6d9878537d41e0c7cc3d270a67
+for aarch64, but it fixes a different race: bug 27137.
+
+On i386 the code is a bit more complicated than on x86_64 because both
+rel and rela relocs are supported.
+---
+ sysdeps/i386/dl-machine.h | 76 ++++++++++++++++++---------------------
+ 1 file changed, 34 insertions(+), 42 deletions(-)
+---
+Upstream-Status: Backport [https://sourceware.org/git/?p=glibc.git;a=patch;h=ddcacd91cc10ff92d6201eda87047d029c14158d]
+Signed-off-by: Akash Hadke <akash.hadke@kpit.com>
+Signed-off-by: Akash Hadke <hadkeakash4@gmail.com>
+---
+diff --git a/sysdeps/i386/dl-machine.h b/sysdeps/i386/dl-machine.h
+index 23e9cc3bfb..590b41d8d7 100644
+--- a/sysdeps/i386/dl-machine.h
++++ b/sysdeps/i386/dl-machine.h
+@@ -688,50 +688,32 @@ elf_machine_lazy_rel (struct link_map *map,
+     }
+   else if (__glibc_likely (r_type == R_386_TLS_DESC))
+     {
+-      struct tlsdesc volatile * __attribute__((__unused__)) td =
+-	(struct tlsdesc volatile *)reloc_addr;
+-
+-      /* Handle relocations that reference the local *ABS* in a simple
+-	 way, so as to preserve a potential addend.  */
+-      if (ELF32_R_SYM (reloc->r_info) == 0)
+-	td->entry = _dl_tlsdesc_resolve_abs_plus_addend;
+-      /* Given a known-zero addend, we can store a pointer to the
+-	 reloc in the arg position.  */
+-      else if (td->arg == 0)
+-	{
+-	  td->arg = (void*)reloc;
+-	  td->entry = _dl_tlsdesc_resolve_rel;
+-	}
+-      else
+-	{
+-	  /* We could handle non-*ABS* relocations with non-zero addends
+-	     by allocating dynamically an arg to hold a pointer to the
+-	     reloc, but that sounds pointless.  */
+-	  const Elf32_Rel *const r = reloc;
+-	  /* The code below was borrowed from elf_dynamic_do_rel().  */
+-	  const ElfW(Sym) *const symtab =
+-	    (const void *) D_PTR (map, l_info[DT_SYMTAB]);
++      const Elf32_Rel *const r = reloc;
++      /* The code below was borrowed from elf_dynamic_do_rel().  */
++      const ElfW(Sym) *const symtab =
++	(const void *) D_PTR (map, l_info[DT_SYMTAB]);
+ 
++      /* Always initialize TLS descriptors completely at load time, in
++	 case static TLS is allocated for it that requires locking.  */
+ # ifdef RTLD_BOOTSTRAP
+-	  /* The dynamic linker always uses versioning.  */
+-	  assert (map->l_info[VERSYMIDX (DT_VERSYM)] != NULL);
++      /* The dynamic linker always uses versioning.  */
++      assert (map->l_info[VERSYMIDX (DT_VERSYM)] != NULL);
+ # else
+-	  if (map->l_info[VERSYMIDX (DT_VERSYM)])
++      if (map->l_info[VERSYMIDX (DT_VERSYM)])
+ # endif
+-	    {
+-	      const ElfW(Half) *const version =
+-		(const void *) D_PTR (map, l_info[VERSYMIDX (DT_VERSYM)]);
+-	      ElfW(Half) ndx = version[ELFW(R_SYM) (r->r_info)] & 0x7fff;
+-	      elf_machine_rel (map, r, &symtab[ELFW(R_SYM) (r->r_info)],
+-			       &map->l_versions[ndx],
+-			       (void *) (l_addr + r->r_offset), skip_ifunc);
+-	    }
++	{
++	  const ElfW(Half) *const version =
++	    (const void *) D_PTR (map, l_info[VERSYMIDX (DT_VERSYM)]);
++	  ElfW(Half) ndx = version[ELFW(R_SYM) (r->r_info)] & 0x7fff;
++	  elf_machine_rel (map, r, &symtab[ELFW(R_SYM) (r->r_info)],
++			   &map->l_versions[ndx],
++			   (void *) (l_addr + r->r_offset), skip_ifunc);
++	}
+ # ifndef RTLD_BOOTSTRAP
+-	  else
+-	    elf_machine_rel (map, r, &symtab[ELFW(R_SYM) (r->r_info)], NULL,
+-			     (void *) (l_addr + r->r_offset), skip_ifunc);
++      else
++	elf_machine_rel (map, r, &symtab[ELFW(R_SYM) (r->r_info)], NULL,
++			 (void *) (l_addr + r->r_offset), skip_ifunc);
+ # endif
+-	}
+     }
+   else if (__glibc_unlikely (r_type == R_386_IRELATIVE))
+     {
+@@ -758,11 +740,21 @@ elf_machine_lazy_rela (struct link_map *map,
+     ;
+   else if (__glibc_likely (r_type == R_386_TLS_DESC))
+     {
+-      struct tlsdesc volatile * __attribute__((__unused__)) td =
+-	(struct tlsdesc volatile *)reloc_addr;
++      const Elf_Symndx symndx = ELFW (R_SYM) (reloc->r_info);
++      const ElfW (Sym) *symtab = (const void *)D_PTR (map, l_info[DT_SYMTAB]);
++      const ElfW (Sym) *sym = &symtab[symndx];
++      const struct r_found_version *version = NULL;
++
++      if (map->l_info[VERSYMIDX (DT_VERSYM)] != NULL)
++	{
++	  const ElfW (Half) *vernum =
++	    (const void *)D_PTR (map, l_info[VERSYMIDX (DT_VERSYM)]);
++	  version = &map->l_versions[vernum[symndx] & 0x7fff];
++	}
+ 
+-      td->arg = (void*)reloc;
+-      td->entry = _dl_tlsdesc_resolve_rela;
++      /* Always initialize TLS descriptors completely at load time, in
++	 case static TLS is allocated for it that requires locking.  */
++      elf_machine_rela (map, reloc, sym, version, reloc_addr, skip_ifunc);
+     }
+   else if (__glibc_unlikely (r_type == R_386_IRELATIVE))
+     {
+-- 
+2.27.0
diff --git a/meta/recipes-core/glibc/glibc/0037-Avoid-deadlock-between-pthread_create-and-ctors.patch b/meta/recipes-core/glibc/glibc/0037-Avoid-deadlock-between-pthread_create-and-ctors.patch
new file mode 100644
index 0000000..7a10131
--- /dev/null
+++ b/meta/recipes-core/glibc/glibc/0037-Avoid-deadlock-between-pthread_create-and-ctors.patch
@@ -0,0 +1,276 @@
+From 83b5323261bb72313bffcf37476c1b8f0847c736 Mon Sep 17 00:00:00 2001
+From: Szabolcs Nagy <szabolcs.nagy@arm.com>
+Date: Wed, 15 Sep 2021 15:16:19 +0100
+Subject: [PATCH] elf: Avoid deadlock between pthread_create and ctors [BZ
+ #28357]
+
+The fix for bug 19329 caused a regression such that pthread_create can
+deadlock when concurrent ctors from dlopen are waiting for it to finish.
+Use a new GL(dl_load_tls_lock) in pthread_create that is not taken
+around ctors in dlopen.
+
+The new lock is also used in __tls_get_addr instead of GL(dl_load_lock).
+
+The new lock is held in _dl_open_worker and _dl_close_worker around
+most of the logic before/after the init/fini routines.  When init/fini
+routines are running then TLS is in a consistent, usable state.
+In _dl_open_worker the new lock requires catching and reraising dlopen
+failures that happen in the critical section.
+
+The new lock is reinitialized in a fork child, to keep the existing
+behaviour and it is kept recursive in case malloc interposition or TLS
+access from signal handlers can retake it.  It is not obvious if this
+is necessary or helps, but avoids changing the preexisting behaviour.
+
+The new lock may be more appropriate for dl_iterate_phdr too than
+GL(dl_load_write_lock), since TLS state of an incompletely loaded
+module may be accessed.  If the new lock can replace the old one,
+that can be a separate change.
+
+Fixes bug 28357.
+
+Reviewed-by: Adhemerval Zanella  <adhemerval.zanella@linaro.org>
+---
+ elf/dl-close.c                   |   6 ++
+ elf/dl-open.c                    |  35 ++++++++-
+ elf/dl-support.c                 |   7 ++
+ elf/dl-tls.c                     |  16 ++---
+ elf/rtld.c                       |   1 +
+ sysdeps/nptl/fork.c              |   3 +
+ sysdeps/generic/ldsodefs.h       |   9 ++-
+ 10 files changed, 235 insertions(+), 12 deletions(-)
+---
+Upstream-Status: Backport [https://sourceware.org/git/?p=glibc.git;a=patch;h=024a7640ab9ecea80e527f4e4d7f7a1868e952c5]
+Comment: This patch is refreshed for glibc 2.31. In upstream glibc 2.34 multiple src files are shuffled, updated this patch as per the code present in glibc 2.31. Removed test case.
+Signed-off-by: Akash Hadke <akash.hadke@kpit.com>
+Signed-off-by: Akash Hadke <hadkeakash4@gmail.com>
+---
+diff --git a/elf/dl-close.c b/elf/dl-close.c
+index 93ff5c96e9..cfe0f1c0c9 100644
+--- a/elf/dl-close.c
++++ b/elf/dl-close.c
+@@ -551,6 +551,9 @@
+   size_t tls_free_end;
+   tls_free_start = tls_free_end = NO_TLS_OFFSET;
+ 
++  /* Protects global and module specitic TLS state.  */
++  __rtld_lock_lock_recursive (GL(dl_load_tls_lock));
++
+   /* We modify the list of loaded objects.  */
+   __rtld_lock_lock_recursive (GL(dl_load_write_lock));
+ 
+@@ -786,6 +789,9 @@
+ 	GL(dl_tls_static_used) = tls_free_start;
+     }
+ 
++  /* TLS is cleaned up for the unloaded modules.  */
++  __rtld_lock_unlock_recursive (GL(dl_load_tls_lock));
++
+ #ifdef SHARED
+   /* Auditing checkpoint: we have deleted all objects.  */
+   if (__glibc_unlikely (do_audit))
+diff --git a/elf/dl-open.c b/elf/dl-open.c
+index 5295e931b0..6ea5dd2457 100644
+--- a/elf/dl-open.c
++++ b/elf/dl-open.c
+@@ -57,6 +57,9 @@
+      (non-negative).  */
+   unsigned int original_global_scope_pending_adds;
+ 
++  /* Set to true if the end of dl_open_worker_begin was reached.  */
++  bool worker_continue;
++
+   /* Original parameters to the program and the current environment.  */
+   int argc;
+   char **argv;
+@@ -473,7 +473,7 @@
+ }
+ 
+ static void
+-dl_open_worker (void *a)
++dl_open_worker_begin (void *a)
+ {
+   struct dl_open_args *args = a;
+   const char *file = args->file;
+@@ -747,6 +747,36 @@
+   if (mode & RTLD_GLOBAL)
+     add_to_global_resize (new);
+ 
++  args->worker_continue = true;
++}
++
++static void
++dl_open_worker (void *a)
++{
++  struct dl_open_args *args = a;
++
++  args->worker_continue = false;
++
++  {
++    /* Protects global and module specific TLS state.  */
++    __rtld_lock_lock_recursive (GL(dl_load_tls_lock));
++
++    struct dl_exception ex;
++    int err = _dl_catch_exception (&ex, dl_open_worker_begin, args);
++
++    __rtld_lock_unlock_recursive (GL(dl_load_tls_lock));
++
++    if (__glibc_unlikely (ex.errstring != NULL))
++      /* Reraise the error.  */
++      _dl_signal_exception (err, &ex, NULL);
++  }
++
++  if (!args->worker_continue)
++    return;
++
++  int mode = args->mode;
++  struct link_map *new = args->map;
++
+   /* Run the initializer functions of new objects.  Temporarily
+      disable the exception handler, so that lazy binding failures are
+      fatal.  */
+diff --git a/elf/dl-support.c b/elf/dl-support.c
+index 02e2ed72f5..d99c1f1d62 100644
+--- a/elf/dl-support.c
++++ b/elf/dl-support.c
+@@ -219,6 +219,13 @@
+    list of loaded objects while an object is added to or removed from
+    that list.  */
+ __rtld_lock_define_initialized_recursive (, _dl_load_write_lock)
++/* This lock protects global and module specific TLS related data.
++   E.g. it is held in dlopen and dlclose when GL(dl_tls_generation),
++   GL(dl_tls_max_dtv_idx) or GL(dl_tls_dtv_slotinfo_list) are
++   accessed and when TLS related relocations are processed for a
++   module.  It was introduced to keep pthread_create accessing TLS
++   state that is being set up.  */
++__rtld_lock_define_initialized_recursive (, _dl_load_tls_lock)
+ 
+ 
+ #ifdef HAVE_AUX_VECTOR
+diff --git a/elf/dl-tls.c b/elf/dl-tls.c
+index d554ae4497..9260d2d696 100644
+--- a/elf/dl-tls.c
++++ b/elf/dl-tls.c
+@@ -443,7 +443,7 @@
+   size_t maxgen = 0;
+ 
+   /* Protects global dynamic TLS related state.  */
+-  __rtld_lock_lock_recursive (GL(dl_load_lock));
++  __rtld_lock_lock_recursive (GL(dl_load_tls_lock));
+ 
+   /* Check if the current dtv is big enough.   */
+   if (dtv[-1].counter < GL(dl_tls_max_dtv_idx))
+@@ -517,7 +517,7 @@
+       listp = listp->next;
+       assert (listp != NULL);
+     }
+-  __rtld_lock_unlock_recursive (GL(dl_load_lock));
++  __rtld_lock_unlock_recursive (GL(dl_load_tls_lock));
+ 
+   /* The DTV version is up-to-date now.  */
+   dtv[0].counter = maxgen;
+@@ -656,7 +656,7 @@
+ 
+ 	 Here the dtv needs to be updated to new_gen generation count.
+ 
+-	 This code may be called during TLS access when GL(dl_load_lock)
++	 This code may be called during TLS access when GL(dl_load_tls_lock)
+ 	 is not held.  In that case the user code has to synchronize with
+ 	 dlopen and dlclose calls of relevant modules.  A module m is
+ 	 relevant if the generation of m <= new_gen and dlclose of m is
+@@ -778,11 +778,11 @@
+   if (__glibc_unlikely (the_map->l_tls_offset
+ 			!= FORCED_DYNAMIC_TLS_OFFSET))
+     {
+-      __rtld_lock_lock_recursive (GL(dl_load_lock));
++      __rtld_lock_lock_recursive (GL(dl_load_tls_lock));
+       if (__glibc_likely (the_map->l_tls_offset == NO_TLS_OFFSET))
+ 	{
+ 	  the_map->l_tls_offset = FORCED_DYNAMIC_TLS_OFFSET;
+-	  __rtld_lock_unlock_recursive (GL(dl_load_lock));
++	  __rtld_lock_unlock_recursive (GL(dl_load_tls_lock));
+ 	}
+       else if (__glibc_likely (the_map->l_tls_offset
+ 			       != FORCED_DYNAMIC_TLS_OFFSET))
+@@ -794,7 +794,7 @@
+ #else
+ # error "Either TLS_TCB_AT_TP or TLS_DTV_AT_TP must be defined"
+ #endif
+-	  __rtld_lock_unlock_recursive (GL(dl_load_lock));
++	  __rtld_lock_unlock_recursive (GL(dl_load_tls_lock));
+ 
+ 	  dtv[GET_ADDR_MODULE].pointer.to_free = NULL;
+ 	  dtv[GET_ADDR_MODULE].pointer.val = p;
+@@ -802,7 +802,7 @@
+ 	  return (char *) p + GET_ADDR_OFFSET;
+ 	}
+       else
+-	__rtld_lock_unlock_recursive (GL(dl_load_lock));
++	__rtld_lock_unlock_recursive (GL(dl_load_tls_lock));
+     }
+   struct dtv_pointer result = allocate_and_init (the_map);
+   dtv[GET_ADDR_MODULE].pointer = result;
+@@ -873,7 +873,7 @@
+     return NULL;
+ 
+   dtv_t *dtv = THREAD_DTV ();
+-  /* This may be called without holding the GL(dl_load_lock).  Reading
++  /* This may be called without holding the GL(dl_load_tls_lock).  Reading
+      arbitrary gen value is fine since this is best effort code.  */
+   size_t gen = atomic_load_relaxed (&GL(dl_tls_generation));
+   if (__glibc_unlikely (dtv[0].counter != gen))
+diff --git a/elf/rtld.c b/elf/rtld.c
+index 8d2bba3d43..9642eb9c92 100644
+--- a/elf/rtld.c
++++ b/elf/rtld.c
+@@ -283,6 +283,7 @@
+ #ifdef _LIBC_REENTRANT
+     ._dl_load_lock = _RTLD_LOCK_RECURSIVE_INITIALIZER,
+     ._dl_load_write_lock = _RTLD_LOCK_RECURSIVE_INITIALIZER,
++    ._dl_load_tls_lock = _RTLD_LOCK_RECURSIVE_INITIALIZER,
+ #endif
+     ._dl_nns = 1,
+     ._dl_ns =
+diff --git a/sysdeps/nptl/fork.c b/sysdeps/nptl/fork.c
+index c471f7b15f..021691b9b7 100644
+--- a/sysdeps/nptl/fork.c
++++ b/sysdeps/nptl/fork.c
+@@ -125,6 +125,9 @@
+       /* Reset the lock the dynamic loader uses to protect its data.  */
+       __rtld_lock_initialize (GL(dl_load_lock));
+ 
++      /* Reset the lock protecting dynamic TLS related data.  */
++      __rtld_lock_initialize (GL(dl_load_tls_lock));
++
+       /* Run the handlers registered for the child.  */
+       __run_fork_handlers (atfork_run_child, multiple_threads);
+     }
+diff --git a/sysdeps/generic/ldsodefs.h b/sysdeps/generic/ldsodefs.h
+index d49529da0d..9ec1511bb0 100644
+--- a/sysdeps/generic/ldsodefs.h
++++ b/sysdeps/generic/ldsodefs.h
+@@ -369,6 +369,13 @@
+      list of loaded objects while an object is added to or removed
+      from that list.  */
+   __rtld_lock_define_recursive (EXTERN, _dl_load_write_lock)
++  /* This lock protects global and module specific TLS related data.
++     E.g. it is held in dlopen and dlclose when GL(dl_tls_generation),
++     GL(dl_tls_max_dtv_idx) or GL(dl_tls_dtv_slotinfo_list) are
++     accessed and when TLS related relocations are processed for a
++     module.  It was introduced to keep pthread_create accessing TLS
++     state that is being set up.  */
++  __rtld_lock_define_recursive (EXTERN, _dl_load_tls_lock)
+ 
+   /* Incremented whenever something may have been added to dl_loaded.  */
+   EXTERN unsigned long long _dl_load_adds;
+@@ -1153,7 +1160,7 @@
+ 
+ /* Add module to slot information data.  If DO_ADD is false, only the
+    required memory is allocated.  Must be called with GL
+-   (dl_load_lock) acquired.  If the function has already been called
++   (dl_load_tls_lock) acquired.  If the function has already been called
+    for the link map L with !do_add, then this function will not raise
+    an exception, otherwise it is possible that it encounters a memory
+    allocation failure.  */
+-- 
+2.27.0
diff --git a/meta/recipes-core/glibc/glibc_2.31.bb b/meta/recipes-core/glibc/glibc_2.31.bb
index 3a3586f..4a545cb 100644
--- a/meta/recipes-core/glibc/glibc_2.31.bb
+++ b/meta/recipes-core/glibc/glibc_2.31.bb
@@ -70,6 +70,14 @@ SRC_URI =  "${GLIBC_GIT_URI};branch=${SRCBRANCH};name=glibc \
            file://CVE-2021-33574_1.patch \
            file://CVE-2021-33574_2.patch \
            file://CVE-2021-38604.patch \
+           file://0030-elf-Refactor_dl_update-slotinfo-to-avoid-use-after-free.patch \
+           file://0031-elf-Fix-data-races-in-pthread_create-and-TLS-access-BZ-19329.patch \
+           file://0032-elf-Use-relaxed-atomics-for-racy-accesses-BZ-19329.patch \
+           file://0033-elf-Add-test-case-for-BZ-19329.patch \
+           file://0034-elf-Fix-DTV-gap-reuse-logic-BZ-27135.patch \
+           file://0035-x86_64-Avoid-lazy-relocation-of-tlsdesc-BZ-27137.patch \
+           file://0036-i386-Avoid-lazy-relocation-of-tlsdesc-BZ-27137.patch \
+           file://0037-Avoid-deadlock-between-pthread_create-and-ctors.patch \
            "
 S = "${WORKDIR}/git"
 B = "${WORKDIR}/build-${TARGET_SYS}"
-- 
2.7.4


