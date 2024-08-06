Return-Path: <pedro.silva.ferreira@criticaltechworks.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 94961C49EA1
	for <webhook@archiver.kernel.org>; Tue,  6 Aug 2024 13:00:10 +0000 (UTC)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (EUR05-AM6-obe.outbound.protection.outlook.com [40.107.22.78])
 by mx.groups.io with SMTP id smtpd.web11.6628.1722949207745802626
 for <openembedded-core@lists.openembedded.org>;
 Tue, 06 Aug 2024 06:00:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@criticaltechworks.com header.s=selector1 header.b=arMv+sPN;
 spf=pass (domain: criticaltechworks.com, ip: 40.107.22.78, mailfrom: pedro.silva.ferreira@criticaltechworks.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=D5YQUpo0g/MOzwSDVmNYIFoemTyUF3TQDfFsHHBvMUZyrqOIy+SA3haSHyILaUmF9dGjRoj95agYJ4vCBmsqLiP0/kMJBjobaCeZmlyNbLjb3uTSM8mmiDa7bUmu1hs/c2ovWDgM9J78i3M+cN28bzA1sys0f4JUXmRZZzd2jiNcEBEW6SY0ix2C7Q2NKtTj6ovc1iudhU7FpBagPqg3lbg/nCPexU+046LC1NmqJ2HaE07gQdZxapeZw7cWvAOwvNekqrn7zzK14lLsKpIj3lXVG9mZBSieYJbyZsTFMxAN01iyY/TlY3F+CLnkbVAyTDjW2YDxZvOeBzC3fQBLxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wxdEJEjX+ZoGwpfSOjcJ/jb36j8jjpPQ304ta626Kew=;
 b=AZd0yC2Sw2NeYtQhOkUIycMyKc5m/Z5Hv/YtsemD6r1Kc2kUq5XOhP7BJrzo3UzWBmLT1cA0qRLdfkSrZgMG894vSdtqeDjsVB9fs83wdWSIEAtPNFHM4Y/IP9P9PmGK93fIdG7FzwA5aHr2hiiouP9PkP4iEdYU6vekl4T//CSRUZkGtzVmcF5e9D2ZGm5+556ZefWlMMwlSayeoP9R3xkXb9eaiH5axiXk0D6HsWEbi5gN4GSbxvrBj0jDytTKgmWYwpqMKJa7C5xjDyM9zOrvP4Q0bAKczxMluCsIyEGLbBfd1Z5I9oozhEfuirq3rKcTRuKumLpDf925vDvqZA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=criticaltechworks.com; dmarc=pass action=none
 header.from=criticaltechworks.com; dkim=pass header.d=criticaltechworks.com;
 arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=criticaltechworks.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wxdEJEjX+ZoGwpfSOjcJ/jb36j8jjpPQ304ta626Kew=;
 b=arMv+sPNX5GQjc5iQgFElGnZ7z0UQldehz8ifQa0SLveHp/9Hh1c2IfcX6UbrP0aMLCXi3yMbeSTErkGk4LcBA0XguPMdXGx+W5pebdVu0hab6XhMD7bsnm8mbmvUT0w5viqUIOX3bDTZoHo0DilPUZ5Q0nRNGMlzkKuKI4bYnEy8YCHxIwsd1dghSWQLcRBn2ZM5gsEUJbLQyBZeYP1fZXfV4cUSone7EjDkO9tUNn13+6Fgsf0QKXNFUPYNSx9W7DkUrbUXOCjBB0InD5tH+g1gSnQItqdk3wBdFpYMubC/7Pm3q0DTSkpnIzAweWJUvrxjkVERkCMpcInsQXppg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=criticaltechworks.com;
Received: from AM8P193MB0900.EURP193.PROD.OUTLOOK.COM (2603:10a6:20b:1ed::9)
 by VI1P193MB0557.EURP193.PROD.OUTLOOK.COM (2603:10a6:800:151::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.26; Tue, 6 Aug
 2024 13:00:03 +0000
Received: from AM8P193MB0900.EURP193.PROD.OUTLOOK.COM
 ([fe80::c359:f497:ed59:65a1]) by AM8P193MB0900.EURP193.PROD.OUTLOOK.COM
 ([fe80::c359:f497:ed59:65a1%7]) with mapi id 15.20.7828.023; Tue, 6 Aug 2024
 13:00:03 +0000
From: Pedro Ferreira <pedro.silva.ferreira@criticaltechworks.com>
To: openembedded-core@lists.openembedded.org
Cc: Pedro Ferreira <pedro.silva.ferreira@criticaltechworks.com>,
	Pedro Silva Ferreira <Pedro.Silva.Ferreira@criticaltechworks.com>
Subject: [PATCH v2 1/2] buildhistory: fix package output folder creation
Date: Tue,  6 Aug 2024 13:59:54 +0100
Message-Id: <20240806125955.160835-1-pedro.silva.ferreira@criticaltechworks.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: LO2P265CA0229.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:b::25) To AM8P193MB0900.EURP193.PROD.OUTLOOK.COM
 (2603:10a6:20b:1ed::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM8P193MB0900:EE_|VI1P193MB0557:EE_
X-MS-Office365-Filtering-Correlation-Id: c7712e21-9be6-42bf-3fcc-08dcb617b010
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|52116014|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?gcK+cQGhSna1IRTzHFMb5G+D43CpJaBIYNLpyzqwaTfx1Uz9LGJZHQIBdixr?=
 =?us-ascii?Q?C0wPSV6QSDN7ShZ9DDGQJraFyujjvhruNhXgckOs6fWPd2ucXBD0QNNHxn76?=
 =?us-ascii?Q?AoX5bK37he93NxLxYZM2VGf+etD8aV7mUQBGEuVX8hsCgQJY2osXG0cw5j6H?=
 =?us-ascii?Q?gR/kCHqImtLu9vBFCtR/PLW/W3unF0DJn+eN/1+FQK9jOEfn1pF9NhjmgCUL?=
 =?us-ascii?Q?JaHfqfioDT5HCPn4lMwM+4GHTUboX1cUhFyKMCVz1NuQsfONn4ahFQr6dQlA?=
 =?us-ascii?Q?NIi/Wy1EahCsvCwbsUafNgVO/+mdQy5Srx62zNdvvdSQbHxXW2+lEp92a3y6?=
 =?us-ascii?Q?2lIYOKqOQO114D0lBvTra0hYMR+4+NdMhg7csR0NJ5VwR1yoYVB7NnbxiddH?=
 =?us-ascii?Q?YtS/1WZd7eYjEvfikit2JsJufyOg4RPJtKIf7hZlFD7bNWg4zUndsJnvu0nY?=
 =?us-ascii?Q?ELcmnVCbZUjhgWi3Q7MWaL1JH+ztux+3uIqWXL0FUsalmbqd8aeSnlfrqfbg?=
 =?us-ascii?Q?oR5k6NwnXRnhEoJt+EMFG9t0goHDR69/xl5Bm1nsGanTpzj2goabV6g5GeSf?=
 =?us-ascii?Q?mInzyQMBzvKtrfyaYFaDEn6UvBC0dGOCCnQI4e6rgNbTTgr3rKdf3ruo0yuI?=
 =?us-ascii?Q?Z2yb3pVgY/8YIHX0BcXlFKfSwiBoq7pFJCFfZ2zmPnAV7nbEJi54lSHpFVB9?=
 =?us-ascii?Q?lnla+O1ihsvPMq2dcVTIEIqbSQmMYg0R6/gwn8V2mVL6N/s+rwQEOrdENcOu?=
 =?us-ascii?Q?jYm0LQARaHgXnV3txvbXQlyytPY5BVSIaSQyndyAOyEprWjfv/AQbOA4wkzB?=
 =?us-ascii?Q?jyrMTs8HcBcvuKl8f7U0iiccO5DosqC/Zov6b7sjxjRkgpM821HN4zejFqp5?=
 =?us-ascii?Q?UxbJZZoLr2WRpnj9qRBajL19/BLzF2fXyxRjNJQHR4+X2cyRB2flndTC07IX?=
 =?us-ascii?Q?rYXG1X2Aym/txfxsJxMmuKhFRD/v5XUsGX7zbYTNNGJ5l3ewkTBYHQWOY7dv?=
 =?us-ascii?Q?9pJGCB3v6La3CkElqq5C86tHGceSxYayeVOolLJ/yG1h8D/jO59PeRh0DE67?=
 =?us-ascii?Q?Xs+9iVMVGErXrwQd6wzREN8ghxhnH6DRklJGvIGeK+0H0qOE7ZeGhCeQaPpC?=
 =?us-ascii?Q?D4JLKORLV9ZXGMphbY7y7x7oZdnsIE69LLhDLZYl7heJOdwLH78q8xMue6kC?=
 =?us-ascii?Q?+4BiQ9EM6RaGmhhQ28wTiiePZRCOJW/oe2FCW5pZkmEEfUtXnS73KMM4TAvg?=
 =?us-ascii?Q?oe7OK6FgD47Zq7hl8NYzRmzCNiBBQJWEAwfife61XdB/hdwEZhMa+QF7zs3Z?=
 =?us-ascii?Q?jJpNTR4aFcMtyCrWa4xL4x4xffEb8dbw+sqmRHvX4cqtmYDR81iG3fs6MU2X?=
 =?us-ascii?Q?asN6l59zkaPQOV/UsL/4jIBzr3s7ufk+0IlFQCVQN8LDjtmGYw=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM8P193MB0900.EURP193.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(366016)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?GTNeXIUPTPB8cTepqXyV8pRE5kvQ9zzTUcXbGik91Y/mcWw2JdtaD9mFaLOc?=
 =?us-ascii?Q?GjqmuFVSyounO3/8jCExMqNczNU9IicViVIBn+31zQpttC9PQW7UTmOIBMSq?=
 =?us-ascii?Q?jO0q8YnNxlNcbkdYASBQswopaqi1hO/44Ho0GRqzfDO7SsGO08D45BXatRL3?=
 =?us-ascii?Q?BxEIJL/uyV9JBClNAO0kBkH2oKrda0RPseZ09ntJ/jKAQHAdtF1wXphQTNUH?=
 =?us-ascii?Q?9/PdnwJ2qfoFUpmDwq4vQpFyMaJoXKg8cpP3RHOzolXvg6Y1Odb0a0tX6vCI?=
 =?us-ascii?Q?rZY6hmyuvHpA8gaalFzJSFMd6UphRi8lbyBkyLN0K+PHITz5VXY08O9cGdeg?=
 =?us-ascii?Q?YBYuO1OD3u9zjpmfO0pLDk5WKuEZ8F7nuxGK9uMT1m8ROkqY/1TkAyc2994h?=
 =?us-ascii?Q?CP08BsPal53gOmfFmPXaH6T2RTwWadm4L6hSamTFjfu00URT4sejWb1T3e56?=
 =?us-ascii?Q?WUFnNJRjlmihOy3DckSrIstvYG1888SJXpsK/vxrLZgxLMvgBY/WA5WToGeA?=
 =?us-ascii?Q?B8aOFEjuQIfT7TGzx9ESKUrYG252bZNcyvl2LOBU0EwaQ89QkAUqBG3nwXKA?=
 =?us-ascii?Q?sfeSLSfZ1wOEoC0f6TZIf9ylkI037N7+UJ+FI18UbEh3m4cr+JMxImJpskAE?=
 =?us-ascii?Q?P/5sop14ULniYDIVqanwaZOn5ykLntag224aEAwOZIWOYH9APgicF4Mm3dme?=
 =?us-ascii?Q?9K2WdeE11zyZ7DZ7FS8fHR9ow4kkIFSjITdzvPtTy80eZFJEuUh8fJqaRE4K?=
 =?us-ascii?Q?Z/m+1EOPdSv16SmhWcHhcr9/0cR8Ep7yWwXikWAl0C9EaCGiqgCZtui3rjcl?=
 =?us-ascii?Q?AHQ9ou2Bb9bVBcxo0jHPIJgygH8dxwkKU9qR0b/szVXiBLhm1YJJls6zkSUB?=
 =?us-ascii?Q?Uq0CQXvP4al5I5bZwRe4YPuCduCcWrLBilHX/0ixu/N6hMiLzMFteRJtoRNg?=
 =?us-ascii?Q?Rj+OaYw2mw5X9mf2Ykz/4nKrZxETh1+c77pUmtwYRSn5lZ8gwQM2h4w/AyKx?=
 =?us-ascii?Q?RsgDrYanBehxI9OJgjtOJ5LsfPwFJHUcOOXyieqHcJCBPAiouCthPfnXdHcc?=
 =?us-ascii?Q?1pof5luyvtZfndpxQJWUu15JtQ9Lch+tiANUf1od6qybZPCJ0X92CKIlSe+S?=
 =?us-ascii?Q?GSCG57O5fREy3diImKZNOjZNH6c7cqqx+pK8C2ashkL24w53A2xN1uSGLhE7?=
 =?us-ascii?Q?3j5bNXOd048J0veXIlSaeH81ZsROdQuGoyU5gzPrvqqhw1uum/lVj5BmTILT?=
 =?us-ascii?Q?RPTQCJjNupphCFREygzRN7XLuJMRY0ZnQYY0iIFdW0nJ6vcVF52KvHJQTJL8?=
 =?us-ascii?Q?3GVDvNW6yAPwYVOt78x+44JG6nExyTviJERZQIoCZhkPl17RLfY4eHUzPYwM?=
 =?us-ascii?Q?Yj95zgV/0zG5Dh0R5gI1FEgYUOXLi6kihaJK4CDGkoVNgAqe9B8bbMHJ7ES8?=
 =?us-ascii?Q?Zi6HgBU0f1bPycrWkeeTl5vOmCV3jMZN6Z9aiLrSzOKkYSAGw2Z4wd5KSpu8?=
 =?us-ascii?Q?IPKKgycsurnytkKGU4pA+GD1h4CAtycuK+1iwUUYkGSpdKwBhyUqLvCUzQul?=
 =?us-ascii?Q?o4dGPVzUVIhB1L2UiEnkEIj1yCXGPCdTSXCyaDV6UFxE6s8Nw3PDIuyncNuB?=
 =?us-ascii?Q?Fqp0pSrPG4xDEX4I57xFOxw=3D?=
X-OriginatorOrg: criticaltechworks.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c7712e21-9be6-42bf-3fcc-08dcb617b010
X-MS-Exchange-CrossTenant-AuthSource: AM8P193MB0900.EURP193.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Aug 2024 13:00:03.5297
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 61f30b8e-4f6b-44fe-9bc2-041e3a9f7346
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: aq/o+QwP6j0TUguoe6elMzammtb1yay0T4sXHBHsUf/90fNIo67yDGjU4eB2CVFnIH/kusl3GXY3loAda5OAjXPteQJg+EkpNIPH2CYLywk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1P193MB0557
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 06 Aug 2024 13:00:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/203019

This fix garantees that output package folder exists on
buildhistory folder to avoid missing files-in-package.txt
creation during task `package` execution.

This issue happens because the output folder is being
created on task `packagedata` before generating `latest` file.

Also it ensures that in case of `find` fails we leave with
a hard error instead of hidding the error on the for loop.

Signed-off-by: Pedro Silva Ferreira <Pedro.Silva.Ferreira@criticaltechworks=
.com>
---
v2 changes:

Fixed Signed-off-by to the correct email
---
 meta/classes/buildhistory.bbclass | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/meta/classes/buildhistory.bbclass b/meta/classes/buildhistory.=
bbclass
index c3d049aea3..ad151092c9 100644
--- a/meta/classes/buildhistory.bbclass
+++ b/meta/classes/buildhistory.bbclass
@@ -599,15 +599,13 @@ buildhistory_list_files_no_owners() {

 buildhistory_list_pkg_files() {
        # Create individual files-in-package for each recipe's package
-       for pkgdir in $(find ${PKGDEST}/* -maxdepth 0 -type d); do
+       pkgdirlist=3D$(find ${PKGDEST}/* -maxdepth 0 -type d)
+       for pkgdir in $pkgdirlist; do
                pkgname=3D$(basename $pkgdir)
                outfolder=3D"${BUILDHISTORY_DIR_PACKAGE}/$pkgname"
                outfile=3D"$outfolder/files-in-package.txt"
                # Make sure the output folder exists so we can create the f=
ile
-               if [ ! -d $outfolder ] ; then
-                       bbdebug 2 "Folder $outfolder does not exist, file $=
outfile not created"
-                       continue
-               fi
+               mkdir -p $outfolder
                buildhistory_list_files $pkgdir $outfile fakeroot
        done
 }
--
2.34.1

The information in this communication may contain confidential or legally p=
rivileged information. It is intended solely for the use of the individual =
or entity it addresses and others authorized to receive it. If you are not =
an intended recipient, you are hereby notified that any disclosure, copying=
, distribution or action in reliance on the contents of this information is=
 strictly prohibited and may be unlawful. If you have received this communi=
cation by error, please notify us immediately by responding to this e-mail =
and then delete it from your system. Critical TechWorks is not liable for t=
he proper and complete transmission of the information in this communicatio=
n nor for any delay in its receipt

This e-mail is environmentally friendly, just like Critical TechWorks, whic=
h lives in a paper-free atmosphere. Therefore, please consider the environm=
ent before printing it!

