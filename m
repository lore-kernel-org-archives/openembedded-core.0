Return-Path: <xiangyu.chen@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CD9E2C43217
	for <webhook@archiver.kernel.org>; Mon, 28 Nov 2022 01:55:26 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.107490.1669600517871273580
 for <openembedded-core@lists.openembedded.org>;
 Sun, 27 Nov 2022 17:55:18 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=83315c2324=xiangyu.chen@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 2AS1hBho029626
	for <openembedded-core@lists.openembedded.org>; Mon, 28 Nov 2022 01:55:17 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3m381315mb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Mon, 28 Nov 2022 01:55:16 +0000
Received: from m0250811.ppops.net (m0250811.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 2AS1tGo2024008
	for <openembedded-core@lists.openembedded.org>; Mon, 28 Nov 2022 01:55:16 GMT
Received: from nam12-mw2-obe.outbound.protection.outlook.com (mail-mw2nam12lp2042.outbound.protection.outlook.com [104.47.66.42])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3m381315m9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 28 Nov 2022 01:55:16 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CPtxsPgjcSODNY2dXGX5W3FJMdQ/7GMCSLBcKeAYroS2byefzDVaDEWP13ufCfNr/E4nIBlYxNo/O20GB1gpe3byU3T9q4gO4dIlYmpHHyDjOcFKV+2V0U2F1uhhJI1rjlQTgBKuv/5A63HtKdk7qYPHu8LHfgjDnrxUs+4qEF8Wx7my60NmsjjlByaE+FEooA1R6Ht1S0unPbOHx9rDTGuU7LPXH408QZcgLuTbxlgcid+bRa7Emz1x7Vt+t5WIf9nwUwSOdRy7LlPYqi56xqdu0ws+p6fSTF/iQvy5VygbpiN9pcXVUfaX5FDU/joGGU2wsVkEkasOeC+Rpjm/hQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aokpm6k73RPZoyuJ+gS/eNNZs8tI2BhroKBMj2fnqPE=;
 b=V6e/F9fSNNkTBn5OH29aU60qZj/5v+v4o+HKunvQ1qKcPaVEhA2sNgzH+xceHCu0GYd+7mP1MeqaLzD+y0Emp8VezGJMZIyNxLsHZhr1jqlozrnsbfUSEwnGq+oACp2uzg4h2OTYnQJ6PgJYSeiNxnOaBeIN68ydjl88Rn6hZ5W5RZrAzJzxciNPXb9QVl7n9c2fHMLnwuSuWknVO2SvNty3TzsJxuQc9xz7nbRq0QFIpn3joe/8oIWm6ayASNZ8z0ksPTAUHo99HMwcriegc6XU2Rubfwn0tABOs2RyVTuAr6W3ZUInQt9xRfXmsdQItownhIO77XTe1+J/W3uJqg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=eng.windriver.com; dkim=pass header.d=eng.windriver.com; arc=none
Received: from MW4PR11MB5824.namprd11.prod.outlook.com (2603:10b6:303:187::19)
 by SN7PR11MB6899.namprd11.prod.outlook.com (2603:10b6:806:2a7::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5857.22; Mon, 28 Nov
 2022 01:55:14 +0000
Received: from MW4PR11MB5824.namprd11.prod.outlook.com
 ([fe80::d252:a0d:467e:ad16]) by MW4PR11MB5824.namprd11.prod.outlook.com
 ([fe80::d252:a0d:467e:ad16%3]) with mapi id 15.20.5857.023; Mon, 28 Nov 2022
 01:55:13 +0000
From: Xiangyu Chen <xiangyu.chen@eng.windriver.com>
To: openembedded-core@lists.openembedded.org, peter.kjellerstedt@axis.com
Subject: [OE-Core][kirkstone][PATCH v2] dbus: upgrade 1.14.0 -> 1.14.4
Date: Mon, 28 Nov 2022 09:54:56 +0800
Message-Id: <20221128015456.183046-1-xiangyu.chen@eng.windriver.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SL2P216CA0136.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:1::15) To MW4PR11MB5824.namprd11.prod.outlook.com
 (2603:10b6:303:187::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR11MB5824:EE_|SN7PR11MB6899:EE_
X-MS-Office365-Filtering-Correlation-Id: f2fc05b7-cd03-4af3-91e5-08dad0e39712
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	JI/5ffdW758myBIfcmOzDZB4ScA1RauYZUXNycB3Gtu+sl7wOYE+M3+9MpsbB/Qvij7S1A2otts3hTFiECiqqoL7TvxjiQKpV+vIrspAep1Fl5dBjvdScUQL9hHMvs+VZWOT3R8vtFffYCww57yICyOM4zjFzGCHnj40tuG529YWMQcRbWNTDz82cAlaAGvYHawB8rWpEG52lRXL+bBNt8GLioe97WFpzdWael/l65F4cMyYf7nWrZZmHgzlXGRaBRpNZQBGakd0jPkuWPrHKgis0DGdi3MrwTK5Z20sGBOjMJQwxwNrOSZ/aGgREGuwvzkmVc4oGuvGGNbvCUNiDzZIIqKT7w3QwGGjNBUC5ks5GWATsLfyYxXed/Txa+yHegnEVwW2J7m/IEo3EXkPrqPHgkVY8CzgTABxNi3nlBMbw/Iur7hYzyd0BYW6kWDbitiC0uvmbFFF76oOrjDEugoxNOGFIuQar6WIko1ubAuqlpMWjK1Tbwc3rU2nfOd4ByQPSLMsz6LAzjk9GObUS4YGDuAonkpEaEKeFePLcSyy+UC5ukvuDYVseHiaJYfz+4F4EhyAr/yZMtEbrEzYgxyxXvvygwc5PYlpbE25+suqHHZyUO2wrigXaT2DdYnkmvqg210Nv85QD4vgcTJuJMM35xOT8w6DPL39pdI4hfbUCNe6DhWj5sQ+VSqcq+dMVLJVRBOU0TB05TG5Zc4G6s3N1P4vviryZ7w8bFsHI81vFEGfitn4CNmXYNzlkju/nOldy55igyJixWKqPlpPoA==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW4PR11MB5824.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(366004)(376002)(136003)(39840400004)(346002)(396003)(451199015)(316002)(6512007)(5660300002)(26005)(52116002)(30864003)(41300700001)(1076003)(2616005)(186003)(66476007)(66946007)(8676002)(66556008)(8936002)(83170400001)(38100700002)(83380400001)(2906002)(38350700002)(44832011)(6666004)(478600001)(6486002)(966005)(6506007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?g2dg+HxMQ+tXZ+vavIq0ySYkFBH9paJvhjUNhHPPT8TEu0QzfdLYhOT3boiA?=
 =?us-ascii?Q?LyEOEz0bvlIpEap4qVdhjsVQHAqtuQ1WyhYACJd03pNbj4pFePrTQEUsFCdJ?=
 =?us-ascii?Q?WaJ818jAM9AKhKhjZF23f1IF1kZ3fdBrtXyAE+4XmfwUYzkXfoY+fKoQr0DR?=
 =?us-ascii?Q?I7kX89sWneKO9FazHsW16RNOYIZdJHPt60fGDA3VmnLS+bJINejpz2ie1d1b?=
 =?us-ascii?Q?F3LirJyNG+q5ydmmrBDoJstEumU8f+NctXyVEFNCfVSV8S36rZywB/zqiPz5?=
 =?us-ascii?Q?mXNnXHpODxfIabV8i+zJzxJkF2f0ecWpY4EGMCPB8+XSaUEJSf28V0qldg1t?=
 =?us-ascii?Q?FH59gKAEaCFkPmGFcSB8ZVF3LhXzEEO4bgNa/zfOmqAuUJMFCgvjI1P415Xa?=
 =?us-ascii?Q?CJ1L66WchM8i6hKGRDCh5ywIxxp6ke9ETcIZphaIHZIfKKodO1hJW+d/hlL9?=
 =?us-ascii?Q?ytOhP0xcOE4zdGoDU35HkOG0JHYOTwUoNAmHO3QkVK08Efg+g4V/MkgZSLh7?=
 =?us-ascii?Q?q2xh/BxxFQX0IM1omGGLXLGnE9IuaubIny6XD5OhK6NsjHc40ajX2olavdmg?=
 =?us-ascii?Q?PB6TQsP0J95FaDGSvDQ50c59bnBbm8YHPTudIu5PHYuH7hRhDzURGVXR8VA+?=
 =?us-ascii?Q?ib56urYBdylVX7jyizvjCnF77DpuD9nh+I9C41aqpWJbFHrclL61HP0WjLpe?=
 =?us-ascii?Q?YWoVjjaI7cLitJ42qCut5FIdSEwEb0wcRy2DvGwR1R1uF4y35srF4MX0ozJL?=
 =?us-ascii?Q?9GLBG4vV1cDjzxxI+M3xzldsfCR5N1Kr7Mztx1vdN6wvsw3+bbkwOr/dxdp/?=
 =?us-ascii?Q?JBzJgNfIydzlZCL+NbJ3b3+/vJpnx64PTP7AggFQxIRcLwifnlGL8x8OrT0q?=
 =?us-ascii?Q?LlVLx9qIQh/fN7gDwa3L0oAIjIL+kfOX96lXCHlahZeTx/SUeMkcQ92u9n13?=
 =?us-ascii?Q?y+SYtE87POaqtjeHSQv9+gKwT4AdLhGlM3bbSdJsfqS6zBbwWnTGBz9ad1d3?=
 =?us-ascii?Q?ayW8BfKbRuB5+UwPtJASUGBcc6InR/29HEbNQEhGGBX5EjAoabCvU2R6Quus?=
 =?us-ascii?Q?BOk11l0QDn+mp947CP1iWPQd39+YZrgfldl2Ihvct/Y5eiGI7kn1Q6PLM76Y?=
 =?us-ascii?Q?NZkkYsU8QMK5jFo+9JTQdA1uHmKr/GF2xJ/5w54nlyhEwjmQB/lEYcL044X3?=
 =?us-ascii?Q?arlvPdwtSKYEj5JVrElYx1QK5ahw+7VITWmjLELbmA7ADEYZZdvc0wB+cUX4?=
 =?us-ascii?Q?zkybB1pkmJ1kKGNKOKdi5pQTWQY0CBAWa7Cb7lIARh6oXPkJHAuvpcob2Npy?=
 =?us-ascii?Q?Wg49IEX9OSw/wHNIY8VpIdv1om7Nee/j7Nu7DpILojxic0Fk9oViNyBmk2We?=
 =?us-ascii?Q?bU2IqzAfvWsqHKfQdRnKlYEjT7hrcYCz7fdOr7GyGR2fgLIHPGTFFfuYHcCZ?=
 =?us-ascii?Q?XVW++qwkwsAezbELMtv27cXYSpnkOpxDEInRf3Zwd/+c3qaMy4ie+JujqeRa?=
 =?us-ascii?Q?3gQGCpPGW5PRTm6YN9gf3gsrB6KH4xrWMykaR6GvanujDA5PPx1GE8hD8nCT?=
 =?us-ascii?Q?vGKdBCWgj3zh+bXfmNpNbVqcsDr/C3MI9wobK3Rhhyv8cfvZrVppT04fxiOs?=
 =?us-ascii?Q?2w=3D=3D?=
X-OriginatorOrg: eng.windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f2fc05b7-cd03-4af3-91e5-08dad0e39712
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB5824.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Nov 2022 01:55:13.9107
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZcnIKnKB4SsiyK2LTV2TbhNCIdwJ514w/du076C6nDUQiSrRrk4lH26j+GD/dQVTySDO0g63AsqQN9MOFQQxIbX46m+w3ilIhC2c4rTeOA0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB6899
X-Proofpoint-GUID: RO99qw5nDPHHSk8jJDo53OrUFgXt4Z8A
X-Proofpoint-ORIG-GUID: 4QQZqgcAAQbs4gxtS2Zoj0aaVMV97_z7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-11-28_02,2022-11-25_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 bulkscore=0
 phishscore=0 spamscore=0 clxscore=1015 priorityscore=1501
 lowpriorityscore=0 mlxlogscore=999 impostorscore=0 adultscore=0
 malwarescore=0 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2210170000 definitions=main-2211280013
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 28 Nov 2022 01:55:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/173894

License-Update: D-Bus changed to dbus.
1.14.4 has contians following CVEs, removing local patches:

CVE-2022-42012: 0001-dbus-marshal-byteswap-Byte-swap-Unix-fd-indexes-if-n.patch
[https://github.com/freedesktop/dbus/commit/3fb065b0752db1e298e4ada52cf4adc414f5e946]

CVE-2022-42011: 0001-dbus-marshal-validate-Validate-length-of-arrays-of-f.patch
[https://github.com/freedesktop/dbus/commit/b9e6a7523085a2cfceaffca7ba1ab4251f12a984]

CVE-2022-42010: 0001-dbus-marshal-validate-Check-brackets-in-signature-ne.patch
[https://github.com/freedesktop/dbus/commit/3e53a785dee8d1432156188a2c4260e4cbc78c4d]


Signed-off-by: Xiangyu Chen <xiangyu.chen@eng.windriver.com>
---
Changes in v2:
  Added a License-Update line to the commit message.
  Added explanation of removing patches in commit message.
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


