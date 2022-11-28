Return-Path: <xiangyu.chen@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A0FDBC433FE
	for <webhook@archiver.kernel.org>; Mon, 28 Nov 2022 01:00:06 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.106445.1669597197442386127
 for <openembedded-core@lists.openembedded.org>;
 Sun, 27 Nov 2022 16:59:57 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=83315c2324=xiangyu.chen@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 2AS0xuqP025225
	for <openembedded-core@lists.openembedded.org>; Sun, 27 Nov 2022 16:59:57 -0800
Received: from nam12-mw2-obe.outbound.protection.outlook.com (mail-mw2nam12lp2047.outbound.protection.outlook.com [104.47.66.47])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3m3ey90yh2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Sun, 27 Nov 2022 16:59:56 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dARavcWELwGD1cPYcRCocFMEjYeYBjfm7uuRIVUJnVKRFCxXVSFc+iAddcQUyDcRdJOs8s+b4v8baKizaDvXyaWm1kr9ykYpPWfYifF5OPVeMAEHn6ptS/iEwum+9DqY1ATccDF6ACwFwE8eIGDSS6lK64J70C5vaiUI98mVzH42Y5ogXpr9w8zxFdsGOkf/MD1iIhhwN4H0YdL4cDdGD8KgAsJ+Uwk+YEV3fzOukvTjQnoXcZAXugPwpYGhIzEHr70AWkJaFqzgODIS03J8dmG79lF4igcSH1RbI7FD/WiYmReaQYVSJ0HNZdcXaRdIWJwFgxFcynh1dsWtFG/H5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iLjR6TdYL/usxx3ZOsuvXLzAoAbFMadT22moibXycLY=;
 b=htxvgKcZ2uINMD14gxUOYakZU+pf7zm8cgHIZxE7PZNuLw8FtddIUB+D+HYuSdK1M9zxP9rNe3ao6LGU4P1mHR1NQOw1mrncH82zt2FcMhRV6l0G6xjYMs6pZKP1r1BF8iYii1MoN3qjeirHnGHdlC1mG4wsSARLRq/4OA5kRyc2g89pM4I89w/TjPJp3AjMdOLLWRl31oArHzRiNPRVkGzx+TOhASeJFXlJ9xFG0vMZWTpTixwO/xtP8hbq0Gw4l9HOEVz+bIPFmCqu7H+/PQw73XTsq9PB1wHYTsFQIi/PJLjRTS4WCbpjyFQMXuP7jHa5bEdYOs1P9C4KS9g5bg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=eng.windriver.com; dkim=pass header.d=eng.windriver.com; arc=none
Received: from MW4PR11MB5824.namprd11.prod.outlook.com (2603:10b6:303:187::19)
 by PH0PR11MB5061.namprd11.prod.outlook.com (2603:10b6:510:3c::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5857.23; Mon, 28 Nov
 2022 00:59:54 +0000
Received: from MW4PR11MB5824.namprd11.prod.outlook.com
 ([fe80::d252:a0d:467e:ad16]) by MW4PR11MB5824.namprd11.prod.outlook.com
 ([fe80::d252:a0d:467e:ad16%3]) with mapi id 15.20.5857.023; Mon, 28 Nov 2022
 00:59:54 +0000
From: Xiangyu Chen <xiangyu.chen@eng.windriver.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-Core][kirkstone][PATCH] dbus: upgrade 1.14.0 -> 1.14.4
Date: Mon, 28 Nov 2022 08:59:38 +0800
Message-Id: <20221128005938.146187-1-xiangyu.chen@eng.windriver.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SL2P216CA0124.KORP216.PROD.OUTLOOK.COM (2603:1096:101::21)
 To MW4PR11MB5824.namprd11.prod.outlook.com (2603:10b6:303:187::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR11MB5824:EE_|PH0PR11MB5061:EE_
X-MS-Office365-Filtering-Correlation-Id: a05b0e02-7d93-4af5-887e-08dad0dbdc58
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	EfcfbF/qa7cZS0FbDxPzFjjgOFtha0Le0QAPcVdKof5oLoJEmyT8NENez/nqfRdwGehKmLLu48ECIarAoH6YmR1Y42k1I+r2vgy2XD8Jdn0ANdSFi2KIWNCzg8neQQRLF8cUy4ro8Qp3MJQh8fxF9E3fk3sKpGN7jsJAomU9mrT7kmygM/TxCPk87c3hWQi+2U6bc/RI1bOrt0JwgvbK1qqLDxJ6ePyRSM/NUk8mLPmen4yPLXhYhUz+0faE5E/SZHYxYfQJcemXe9SvUFfDm7yubWLDSjHcUDeykjGro/oF/uGLzxdBybVDEUr0waKrzUrkTcgDQwkzHvT1Y6ySvm8i9SWyZUgvreqUFBDOTv3OD9jllVuICSDHGS+iQ743sb8DgoCKFeuo424pwO9Fiq/LWwNuBQmnd1sBv93m6km6wzcl0m86YxHvHXG1aych135drwrOr8i/udiIB6GhrypWbuPb4wiWTY8Hrv0U0JFqI/5Ef4Ubol5bInaoT5M/N/9gL4UMW4f3VtQsxrlpP/aMj0Qes3vSd6HsiH+74ZoyI/pnyutCvNSa7bLJIv/m/BO2ESwW/4crgpciNp0pXsAPTw/k1PD1iHNo1Wjd8vDulmsUO0p7mtsFijncDVZ+jUkLmU9XQNGl3VCJ+07Z2w==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW4PR11MB5824.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(136003)(396003)(39830400003)(366004)(376002)(346002)(451199015)(2616005)(2906002)(83380400001)(478600001)(38350700002)(52116002)(38100700002)(6486002)(966005)(41300700001)(66476007)(66946007)(66556008)(8676002)(6512007)(6506007)(6666004)(26005)(186003)(5660300002)(8936002)(1076003)(6916009)(30864003)(44832011)(316002)(83170400001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?xOwljLcikHiCrSOjAZhZgxLkzK7pNPdUtyOR3CiEB4t0h/Sc7MmcpdBch/av?=
 =?us-ascii?Q?hFFaITVSIXyueiDO+kTBIsk9/g7SdEFY87SafygeHUjHlDtQFFhAoEZMndf0?=
 =?us-ascii?Q?dfmLFUTmotRisdDhTpUVLTGtq91S8qDj2Y/O9J70hbk2RUNQqge9/T2X0ut0?=
 =?us-ascii?Q?2z/uHeSpN/1QhQzsaWB0Yusj4xqDQvO233pJZwHJWzicwj/bOx/R881nN3Zh?=
 =?us-ascii?Q?4f3heLrRd6yjpPLjRKFp3SpzPl7UUNT03wJ/u+uiJ2R3PDHVJr9VAhQ0LGLD?=
 =?us-ascii?Q?5T2qVfgZC76JkxT9kwWe+4wnG6X5lZf5unXRhffukD9CCmknAWSdC1fvowoG?=
 =?us-ascii?Q?XQEMjoAlEcleGVg+g5Cn7gC0Y4oKz1FGzEj9IcV5tSo6J1rlBo3otTX1V9MC?=
 =?us-ascii?Q?RABBmgwW1/HfA9eWI4GCGaK/Hz3jbFI5PDbiMZbdlmiCjrspJKuHA5z/cnhc?=
 =?us-ascii?Q?RASUv2e519WlXVqhpXAqsITYSK5/2iDkd94Qhifp/wW52uxT+iC1yJkNGjy1?=
 =?us-ascii?Q?5QxgHcp+yBJj9VeIYXk4UQ2/LhQ2r+S8KnmDXZfl9g/vROIkYC+HM24ZZieS?=
 =?us-ascii?Q?Dur55BKaN1fObgjEzi4AHvmgvBfdKZwQBpX3DkTC922Ns2yqb09Q7HB3OO8i?=
 =?us-ascii?Q?CGZtsyN73o/t9WCDXRm8IIp7F2uYmKxwq/KqGF/zi2HKzx4FWIyanm7DzvbY?=
 =?us-ascii?Q?KZB2s16B86qCvkd/hygjeeZknkJ43k4sVkd9mD7Xarf5ALDcTrjJmYRjw2wO?=
 =?us-ascii?Q?mUG5Kec9f0uxlAkT7ZhQkrMqTMSW1Y2bI45N7PbiuM7AmxmVP4YqGz10SxQh?=
 =?us-ascii?Q?vHUSSrzL1K72VY5DdxT2qT1dTsiOYa56zmjg1JoF9vGhwAXD5ES8s31chPeN?=
 =?us-ascii?Q?5V9iBGgdKrtvK7z7pQHp7rNlHXsUuQDSOI12s3JOtpEPYwciGha2GosR/JGf?=
 =?us-ascii?Q?DBRxwHabNWQjTO9LbXqG1JjyoY8nL3Z+PJaR+GJZiKuoAn5YW2if9gPx8IiH?=
 =?us-ascii?Q?KIEP0EZ56kvRQgRgpxJ7ySOFM6+F+7j2nB/t6dYfx+cP0jE5i16tgzAtS5DB?=
 =?us-ascii?Q?xMdagdKUeOTNaIMZB8bS/NfIVnSU6TvkMZnT5Lt7SCgVz8sUcvEjCeyCUEc3?=
 =?us-ascii?Q?D3kxIWBgVISZbCBP1iEzpW9BE4hpFk1a4CKlAaZaFX3EccNVOQ95U5QVZyhk?=
 =?us-ascii?Q?MqJ56GBiE+zSYJj6TBsXPDnowStWLtDK0ekYRIUTS+9O4VZdtWCfvSNY3lNo?=
 =?us-ascii?Q?M4hah+j/HCJZhIPlViZLXGhFiE1LYCsmqRVcFQaxwQCOKLe6pXz7pawuZysN?=
 =?us-ascii?Q?RDli3Bj2HRv880yvJO8T4aptba6v8kPPpQQmi3EltdZmWIz4LXqHfxjSwPKn?=
 =?us-ascii?Q?DBl0jk06qbRsGGBLLa3WN7MDdotl9WD8y4fFIYUsAA7nLuVHqktOwWNa4joR?=
 =?us-ascii?Q?IUkbm5OEsb3G5AtWpLVmm3J4mM+rPdhYlZkT/Fk0bNcIospUwTA9rQasv+88?=
 =?us-ascii?Q?dPOYZmqQ3MR7gvjyrOrCIorVzo+E5ep29liDGsPvBVGPYwcmZnZBidT0sKzg?=
 =?us-ascii?Q?twoUfGFn+zeJ3eqCsta6I8Tf/xpfLnfxTtina5ZC97VdlviRMJxF0gukpJ9r?=
 =?us-ascii?Q?iw=3D=3D?=
X-OriginatorOrg: eng.windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a05b0e02-7d93-4af5-887e-08dad0dbdc58
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB5824.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Nov 2022 00:59:54.2675
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hDSYz7VF1/DNDCqpssYj3GxE4SHEvfYvrW1vfrk2Ob738bHKIIfSTtM8KcqVCuxPFFW/24WT7zTszzgIpfKVrmw2X8jJWEmZslInYqy7RpU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5061
X-Proofpoint-GUID: puAH4O4H2DfiC0Slu1V8iQHS9XyYvvFz
X-Proofpoint-ORIG-GUID: puAH4O4H2DfiC0Slu1V8iQHS9XyYvvFz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-11-27_10,2022-11-25_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 bulkscore=0
 spamscore=0 phishscore=0 suspectscore=0 priorityscore=1501 impostorscore=0
 malwarescore=0 lowpriorityscore=0 mlxscore=0 mlxlogscore=999 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2210170000
 definitions=main-2211280006
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 28 Nov 2022 01:00:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/173891

From: Xiangyu Chen <xiangyu.chen@windriver.com>

Signed-off-by: Xiangyu Chen <xiangyu.chen@eng.windriver.com>
---
 ...eswap-Byte-swap-Unix-fd-indexes-if-n.patch |  76 -----------
 ...idate-Check-brackets-in-signature-ne.patch | 119 ------------------
 ...idate-Validate-length-of-arrays-of-f.patch |  61 ---------
 .../dbus/{dbus_1.14.0.bb => dbus_1.14.4.bb}   |  10 +-
 4 files changed, 4 insertions(+), 262 deletions(-)
 delete mode 100644 meta/recipes-core/dbus/dbus/0001-dbus-marshal-byteswap-Byte-swap-Unix-fd-indexes-if-n.patch
 delete mode 100644 meta/recipes-core/dbus/dbus/0001-dbus-marshal-validate-Check-brackets-in-signature-ne.patch
 delete mode 100644 meta/recipes-core/dbus/dbus/0001-dbus-marshal-validate-Validate-length-of-arrays-of-f.patch
 rename meta/recipes-core/dbus/{dbus_1.14.0.bb => dbus_1.14.4.bb} (93%)

diff --git a/meta/recipes-core/dbus/dbus/0001-dbus-marshal-byteswap-Byte-swap-Unix-fd-indexes-if-n.patch b/meta/recipes-core/dbus/dbus/0001-dbus-marshal-byteswap-Byte-swap-Unix-fd-indexes-if-n.patch
deleted file mode 100644
index 47f4f1e0d3..0000000000
--- a/meta/recipes-core/dbus/dbus/0001-dbus-marshal-byteswap-Byte-swap-Unix-fd-indexes-if-n.patch
+++ /dev/null
@@ -1,76 +0,0 @@
-From 3fb065b0752db1e298e4ada52cf4adc414f5e946 Mon Sep 17 00:00:00 2001
-From: Simon McVittie <smcv@collabora.com>
-Date: Fri, 30 Sep 2022 13:46:31 +0100
-Subject: [PATCH] dbus-marshal-byteswap: Byte-swap Unix fd indexes if needed
-
-When a D-Bus message includes attached file descriptors, the body of the
-message contains unsigned 32-bit indexes pointing into an out-of-band
-array of file descriptors. Some D-Bus APIs like GLib's GDBus refer to
-these indexes as "handles" for the associated fds (not to be confused
-with a Windows HANDLE, which is a kernel object).
-
-The assertion message removed by this commit is arguably correct up to
-a point: fd-passing is only reasonable on a local machine, and no known
-operating system allows processes of differing endianness even on a
-multi-endian ARM or PowerPC CPU, so it makes little sense for the sender
-to specify a byte-order that differs from the byte-order of the recipient.
-
-However, this doesn't account for the fact that a malicious sender
-doesn't have to restrict itself to only doing things that make sense.
-On a system with untrusted local users, a message sender could crash
-the system dbus-daemon (a denial of service) by sending a message in
-the opposite endianness that contains handles to file descriptors.
-
-Before this commit, if assertions are enabled, attempting to byteswap
-a fd index would cleanly crash the message recipient with an assertion
-failure. If assertions are disabled, attempting to byteswap a fd index
-would silently do nothing without advancing the pointer p, causing the
-message's type and the pointer into its contents to go out of sync, which
-can result in a subsequent crash (the crash demonstrated by fuzzing was
-a use-after-free, but other failure modes might be possible).
-
-In principle we could resolve this by rejecting wrong-endianness messages
-from a local sender, but it's actually simpler and less code to treat
-wrong-endianness messages as valid and byteswap them.
-
-Thanks: Evgeny Vereshchagin
-Fixes: ba7daa60 "unix-fd: add basic marshalling code for unix fds"
-Resolves: https://gitlab.freedesktop.org/dbus/dbus/-/issues/417
-Resolves: CVE-2022-42012
-
-Upstream-Status: Backport from [https://gitlab.freedesktop.org/dbus/dbus/-/commit/3fb065b0752db1e298e4ada52cf4adc414f5e946]
-
-Signed-off-by: Simon McVittie <smcv@collabora.com>
-(cherry picked from commit 236f16e444e88a984cf12b09225e0f8efa6c5b44)
-Signed-off-by: Xiangyu Chen <xiangyu.chen@eng.windriver.com>
----
- dbus/dbus-marshal-byteswap.c | 6 +-----
- 1 file changed, 1 insertion(+), 5 deletions(-)
-
-diff --git a/dbus/dbus-marshal-byteswap.c b/dbus/dbus-marshal-byteswap.c
-index 27695aaf..7104e9c6 100644
---- a/dbus/dbus-marshal-byteswap.c
-+++ b/dbus/dbus-marshal-byteswap.c
-@@ -61,6 +61,7 @@ byteswap_body_helper (DBusTypeReader       *reader,
-         case DBUS_TYPE_BOOLEAN:
-         case DBUS_TYPE_INT32:
-         case DBUS_TYPE_UINT32:
-+        case DBUS_TYPE_UNIX_FD:
-           {
-             p = _DBUS_ALIGN_ADDRESS (p, 4);
-             *((dbus_uint32_t*)p) = DBUS_UINT32_SWAP_LE_BE (*((dbus_uint32_t*)p));
-@@ -188,11 +189,6 @@ byteswap_body_helper (DBusTypeReader       *reader,
-           }
-           break;
- 
--        case DBUS_TYPE_UNIX_FD:
--          /* fds can only be passed on a local machine, so byte order must always match */
--          _dbus_assert_not_reached("attempted to byteswap unix fds which makes no sense");
--          break;
--
-         default:
-           _dbus_assert_not_reached ("invalid typecode in supposedly-validated signature");
-           break;
--- 
-2.34.1
-
diff --git a/meta/recipes-core/dbus/dbus/0001-dbus-marshal-validate-Check-brackets-in-signature-ne.patch b/meta/recipes-core/dbus/dbus/0001-dbus-marshal-validate-Check-brackets-in-signature-ne.patch
deleted file mode 100644
index f2e14fb8d5..0000000000
--- a/meta/recipes-core/dbus/dbus/0001-dbus-marshal-validate-Check-brackets-in-signature-ne.patch
+++ /dev/null
@@ -1,119 +0,0 @@
-From 3e53a785dee8d1432156188a2c4260e4cbc78c4d Mon Sep 17 00:00:00 2001
-From: Simon McVittie <smcv@collabora.com>
-Date: Tue, 13 Sep 2022 15:10:22 +0100
-Subject: [PATCH] dbus-marshal-validate: Check brackets in signature nest
- correctly
-
-In debug builds with assertions enabled, a signature with incorrectly
-nested `()` and `{}`, for example `a{i(u}` or `(a{ii)}`, could result
-in an assertion failure.
-
-In production builds without assertions enabled, a signature with
-incorrectly nested `()` and `{}` could potentially result in a crash
-or incorrect message parsing, although we do not have a concrete example
-of either of these failure modes.
-
-Thanks: Evgeny Vereshchagin
-Resolves: https://gitlab.freedesktop.org/dbus/dbus/-/issues/418
-Resolves: CVE-2022-42010
-
-Upstream-Status: Backport [https://gitlab.freedesktop.org/dbus/dbus/-/commit/3e53a785dee8d1432156188a2c4260e4cbc78c4d]
-
-Signed-off-by: Simon McVittie <smcv@collabora.com>
-(cherry picked from commit 9d07424e9011e3bbe535e83043d335f3093d2916)
-Signed-off-by: Xiangyu Chen <xiangyu.chen@eng.windriver.com>
----
- dbus/dbus-marshal-validate.c | 38 +++++++++++++++++++++++++++++++++++-
- 1 file changed, 37 insertions(+), 1 deletion(-)
-
-diff --git a/dbus/dbus-marshal-validate.c b/dbus/dbus-marshal-validate.c
-index 4d492f3f..ae68414d 100644
---- a/dbus/dbus-marshal-validate.c
-+++ b/dbus/dbus-marshal-validate.c
-@@ -62,6 +62,8 @@ _dbus_validate_signature_with_reason (const DBusString *type_str,
- 
-   int element_count;
-   DBusList *element_count_stack;
-+  char opened_brackets[DBUS_MAXIMUM_TYPE_RECURSION_DEPTH * 2 + 1] = { '\0' };
-+  char last_bracket;
- 
-   result = DBUS_VALID;
-   element_count_stack = NULL;
-@@ -93,6 +95,10 @@ _dbus_validate_signature_with_reason (const DBusString *type_str,
- 
-   while (p != end)
-     {
-+      _dbus_assert (struct_depth + dict_entry_depth >= 0);
-+      _dbus_assert (struct_depth + dict_entry_depth < _DBUS_N_ELEMENTS (opened_brackets));
-+      _dbus_assert (opened_brackets[struct_depth + dict_entry_depth] == '\0');
-+
-       switch (*p)
-         {
-         case DBUS_TYPE_BYTE:
-@@ -136,6 +142,10 @@ _dbus_validate_signature_with_reason (const DBusString *type_str,
-               goto out;
-             }
- 
-+          _dbus_assert (struct_depth + dict_entry_depth >= 1);
-+          _dbus_assert (struct_depth + dict_entry_depth < _DBUS_N_ELEMENTS (opened_brackets));
-+          _dbus_assert (opened_brackets[struct_depth + dict_entry_depth - 1] == '\0');
-+          opened_brackets[struct_depth + dict_entry_depth - 1] = DBUS_STRUCT_BEGIN_CHAR;
-           break;
- 
-         case DBUS_STRUCT_END_CHAR:
-@@ -151,9 +161,20 @@ _dbus_validate_signature_with_reason (const DBusString *type_str,
-               goto out;
-             }
- 
-+          _dbus_assert (struct_depth + dict_entry_depth >= 1);
-+          _dbus_assert (struct_depth + dict_entry_depth < _DBUS_N_ELEMENTS (opened_brackets));
-+          last_bracket = opened_brackets[struct_depth + dict_entry_depth - 1];
-+
-+          if (last_bracket != DBUS_STRUCT_BEGIN_CHAR)
-+            {
-+              result = DBUS_INVALID_STRUCT_ENDED_BUT_NOT_STARTED;
-+              goto out;
-+            }
-+
-           _dbus_list_pop_last (&element_count_stack);
- 
-           struct_depth -= 1;
-+          opened_brackets[struct_depth + dict_entry_depth] = '\0';
-           break;
- 
-         case DBUS_DICT_ENTRY_BEGIN_CHAR:
-@@ -178,6 +199,10 @@ _dbus_validate_signature_with_reason (const DBusString *type_str,
-               goto out;
-             }
- 
-+          _dbus_assert (struct_depth + dict_entry_depth >= 1);
-+          _dbus_assert (struct_depth + dict_entry_depth < _DBUS_N_ELEMENTS (opened_brackets));
-+          _dbus_assert (opened_brackets[struct_depth + dict_entry_depth - 1] == '\0');
-+          opened_brackets[struct_depth + dict_entry_depth - 1] = DBUS_DICT_ENTRY_BEGIN_CHAR;
-           break;
- 
-         case DBUS_DICT_ENTRY_END_CHAR:
-@@ -186,8 +211,19 @@ _dbus_validate_signature_with_reason (const DBusString *type_str,
-               result = DBUS_INVALID_DICT_ENTRY_ENDED_BUT_NOT_STARTED;
-               goto out;
-             }
--            
-+
-+          _dbus_assert (struct_depth + dict_entry_depth >= 1);
-+          _dbus_assert (struct_depth + dict_entry_depth < _DBUS_N_ELEMENTS (opened_brackets));
-+          last_bracket = opened_brackets[struct_depth + dict_entry_depth - 1];
-+
-+          if (last_bracket != DBUS_DICT_ENTRY_BEGIN_CHAR)
-+            {
-+              result = DBUS_INVALID_DICT_ENTRY_ENDED_BUT_NOT_STARTED;
-+              goto out;
-+            }
-+
-           dict_entry_depth -= 1;
-+          opened_brackets[struct_depth + dict_entry_depth] = '\0';
- 
-           element_count = 
-             _DBUS_POINTER_TO_INT (_dbus_list_pop_last (&element_count_stack));
--- 
-2.34.1
-
diff --git a/meta/recipes-core/dbus/dbus/0001-dbus-marshal-validate-Validate-length-of-arrays-of-f.patch b/meta/recipes-core/dbus/dbus/0001-dbus-marshal-validate-Validate-length-of-arrays-of-f.patch
deleted file mode 100644
index f953326f78..0000000000
--- a/meta/recipes-core/dbus/dbus/0001-dbus-marshal-validate-Validate-length-of-arrays-of-f.patch
+++ /dev/null
@@ -1,61 +0,0 @@
-From b9e6a7523085a2cfceaffca7ba1ab4251f12a984 Mon Sep 17 00:00:00 2001
-From: Simon McVittie <smcv@collabora.com>
-Date: Mon, 12 Sep 2022 13:14:18 +0100
-Subject: [PATCH] dbus-marshal-validate: Validate length of arrays of
- fixed-length items
-
-This fast-path previously did not check that the array was made up
-of an integer number of items. This could lead to assertion failures
-and out-of-bounds accesses during subsequent message processing (which
-assumes that the message has already been validated), particularly after
-the addition of _dbus_header_remove_unknown_fields(), which makes it
-more likely that dbus-daemon will apply non-trivial edits to messages.
-
-Thanks: Evgeny Vereshchagin
-Fixes: e61f13cf "Bug 18064 - more efficient validation for fixed-size type arrays"
-Resolves: https://gitlab.freedesktop.org/dbus/dbus/-/issues/413
-Resolves: CVE-2022-42011
-
-Upstream-Status: Backport from
-[https://gitlab.freedesktop.org/dbus/dbus/-/commit/b9e6a7523085a2cfceaffca7ba1ab4251f12a984]
-
-Signed-off-by: Simon McVittie <smcv@collabora.com>
-(cherry picked from commit 079bbf16186e87fb0157adf8951f19864bc2ed69)
-Signed-off-by: Xiangyu Chen <xiangyu.chen@eng.windriver.com>
----
- dbus/dbus-marshal-validate.c | 13 ++++++++++++-
- 1 file changed, 12 insertions(+), 1 deletion(-)
-
-diff --git a/dbus/dbus-marshal-validate.c b/dbus/dbus-marshal-validate.c
-index ae68414d..7d0d6cf7 100644
---- a/dbus/dbus-marshal-validate.c
-+++ b/dbus/dbus-marshal-validate.c
-@@ -503,13 +503,24 @@ validate_body_helper (DBusTypeReader       *reader,
-                  */ 
-                 if (dbus_type_is_fixed (array_elem_type))
-                   {
-+                    /* Note that fixed-size types all have sizes equal to
-+                     * their alignments, so this is really the item size. */
-+                    alignment = _dbus_type_get_alignment (array_elem_type);
-+                    _dbus_assert (alignment == 1 || alignment == 2 ||
-+                                  alignment == 4 || alignment == 8);
-+
-+                    /* Because the alignment is a power of 2, this is
-+                     * equivalent to: (claimed_len % alignment) != 0,
-+                     * but avoids slower integer division */
-+                    if ((claimed_len & (alignment - 1)) != 0)
-+                      return DBUS_INVALID_ARRAY_LENGTH_INCORRECT;
-+
-                     /* bools need to be handled differently, because they can
-                      * have an invalid value
-                      */
-                     if (array_elem_type == DBUS_TYPE_BOOLEAN)
-                       {
-                         dbus_uint32_t v;
--                        alignment = _dbus_type_get_alignment (array_elem_type);
- 
-                         while (p < array_end)
-                           {
--- 
-2.34.1
-
diff --git a/meta/recipes-core/dbus/dbus_1.14.0.bb b/meta/recipes-core/dbus/dbus_1.14.4.bb
similarity index 93%
rename from meta/recipes-core/dbus/dbus_1.14.0.bb
rename to meta/recipes-core/dbus/dbus_1.14.4.bb
index 484629e987..9684f0c6e2 100644
--- a/meta/recipes-core/dbus/dbus_1.14.0.bb
+++ b/meta/recipes-core/dbus/dbus_1.14.4.bb
@@ -6,19 +6,17 @@ SECTION = "base"
 inherit autotools pkgconfig gettext upstream-version-is-even ptest-gnome
 
 LICENSE = "AFL-2.1 | GPL-2.0-or-later"
-LIC_FILES_CHKSUM = "file://COPYING;md5=10dded3b58148f3f1fd804b26354af3e \
-                    file://dbus/dbus.h;beginline=6;endline=20;md5=866739837ccd835350af94dccd6457d8"
+LIC_FILES_CHKSUM = "file://COPYING;md5=6423dcd74d7be9715b0db247fd889da3 \
+                    file://dbus/dbus.h;beginline=6;endline=20;md5=866739837ccd835350af94dccd6457d8 \
+                    "
 
 SRC_URI = "https://dbus.freedesktop.org/releases/dbus/dbus-${PV}.tar.xz \
            file://run-ptest \
            file://tmpdir.patch \
            file://dbus-1.init \
-           file://0001-dbus-marshal-validate-Check-brackets-in-signature-ne.patch \
-           file://0001-dbus-marshal-validate-Validate-length-of-arrays-of-f.patch \
-           file://0001-dbus-marshal-byteswap-Byte-swap-Unix-fd-indexes-if-n.patch \
 "
 
-SRC_URI[sha256sum] = "ccd7cce37596e0a19558fd6648d1272ab43f011d80c8635aea8fd0bad58aebd4"
+SRC_URI[sha256sum] = "7c0f9b8e5ec0ff2479383e62c0084a3a29af99edf1514e9f659b81b30d4e353e"
 
 EXTRA_OECONF = "--disable-xml-docs \
                 --disable-doxygen-docs \
-- 
2.34.1


