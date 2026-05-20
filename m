Return-Path: <hsimeliere.opensource@witekio.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 47926CD4F54
	for <webhook@archiver.kernel.org>; Wed, 20 May 2026 10:49:20 +0000 (UTC)
Received: from mx-relay135-hz1-if1.hornetsecurity.com (mx-relay135-hz1-if1.hornetsecurity.com [94.100.128.145])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.9356.1779274153879380353
 for <openembedded-core@lists.openembedded.org>;
 Wed, 20 May 2026 03:49:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@witekio.com header.s=selector1 header.b=SbwjHqbW;
 spf=permerror, err=parse error for token &{10 18 spf.hornetsecurity.com}: limit exceeded (domain: witekio.com, ip: 94.100.128.145, mailfrom: hsimeliere@witekio.com)
Received: from mail-northeuropeazon11022128.outbound.protection.outlook.com ([52.101.66.128]) by mx-gate135-hz1;
 Wed, 20 May 2026 12:00:39 +0200
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=m9ZqEAf3c9GzWV46QbnFmib4Pa5Q1yrJOB+0yC2qE8TwK7R+zLZOngT6hqj5iKHxhu7KxTDsLCuuHPVPKZoTwLSPYz7jmlts1V1jd0CRU4oMtf3679FS/ALO5FVhLsoX44QieGmG+s5Z2tZvVoSQIxoAe6kXTWwo74tPUIl4Qy10hy4tgSvBdGslrAMOvefCVsmGvzKCLKTilUsqn4FQVs+jLpsPhz1DH7maEhRMKNhR+Okr62lyQS35vecHMsl+EZNHg4SNixzcbWm5jfYhq686NC4qkOr1lTING3B3HUlbQiAlse6Z1W8gtMw03T3P+dSRy+fkOqUl6ZTpoPnhXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NbnN/ZgD/1TfyOz1zDFQq6FceEn8hJU6Be9EMAnuzco=;
 b=B/rcCezYSKf63dxYj4o/qoyrN4jXkrqdl7Isjgl6Vb2ybtlxr5tYEEJ1G4yfMf6NY97fuv0jE0F0lfCffQSmQGn1J93/hy05uSNkXPCvi2ReMq4dftlw+CA1mf83iWIiI6ILa/LH6eKFt8vVO5kvmsjMoNTCIXOsct7cmGKd3pSJNWRsjb0EmIZ288hnLleAkS+of2szmt58TPr6jGYFAGElOxLqc0O5DyC8MeqMhly3+FukvyAD5MLZ2RUkqD2VvAb84i1pKx4JmrmmKUylJiVqEDJRtKILPy6q5FRFd5gAZ9XNc/JyXMX/zswy6ptgtfWj7/8zjJIE5lsLrVTkNA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=witekio.com; dmarc=pass action=none header.from=witekio.com;
 dkim=pass header.d=witekio.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=witekio.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NbnN/ZgD/1TfyOz1zDFQq6FceEn8hJU6Be9EMAnuzco=;
 b=SbwjHqbWS1MQV+K0ceSGjDqQLu9BLndOCZoGgPAKccckglddEglIvvF+Cw0Qx0/VSTpNyXAAEHduDj4S1wCfB256H5ITs+rqhXXPW7/pPtfeV/b/E1Ns/RusQAqK70RaZ5CXHV0HIUsGMjQ658F8GwlYqz3mVF1zddVlnQ7yBdo8wNQxoXN1AQkDqNzs+PeJcYxmMp6JiN/rTIyQ/LGbdWYD8q2sU7wiRyiF+chSPA8hpfxH0CEI8RFxEl0nIZ7yJEbQWlrvd+2cyKjtIVANKIWOL9gsFbcv8ayDaBNjiVYdYKjIFNx5yfatBP60k6HJMO63meOCYAc7BgtA2RlwSA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=witekio.com;
Received: from MRWP192MB3504.EURP192.PROD.OUTLOOK.COM (2603:10a6:501:87::6) by
 DU2P192MB2171.EURP192.PROD.OUTLOOK.COM (2603:10a6:10:495::18) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.25.24; Wed, 20 May 2026 10:00:07 +0000
Received: from MRWP192MB3504.EURP192.PROD.OUTLOOK.COM
 ([fe80::e437:672a:5abc:a0f4]) by MRWP192MB3504.EURP192.PROD.OUTLOOK.COM
 ([fe80::e437:672a:5abc:a0f4%6]) with mapi id 15.21.0025.020; Wed, 20 May 2026
 10:00:07 +0000
From: hsimeliere.opensource@witekio.com
To: openembedded-core@lists.openembedded.org
Cc: "Hugo SIMELIERE (Schneider Electric)" <hsimeliere.opensource@witekio.com>,
	Bruno VERNAY <bruno.vernay@se.com>
Subject: [OE-core][scarthgap][PATCH] systemd: Fix CVE-2026-29111
Date: Wed, 20 May 2026 11:59:57 +0200
Message-ID: <20260520095957.3092276-1-hsimeliere.opensource@witekio.com>
X-Mailer: git-send-email 2.43.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: PR1P264CA0079.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:102:2cc::15) To MRWP192MB3504.EURP192.PROD.OUTLOOK.COM
 (2603:10a6:501:87::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MRWP192MB3504:EE_|DU2P192MB2171:EE_
X-MS-Office365-Filtering-Correlation-Id: cf27640e-f6e1-433f-9b84-08deb656926b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|10070799003|376014|52116014|366016|13003099007|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info: 
	etzZ1N3UWsXOcs0HBNbec0tUydnEBTwZLu8DIOmiLs4spcVOhJlblwklKsNzxlzOgsyaz0MsjZ+ayGLge0CPOanGmXdlZPL/IX/rAaE4V15PrA5dMRvjWtb/afYM7zRSWpMZjjHQMRUjwsI+rjOyVkgQ7ALAyJmx6TuisVJsfsqHRcvXSabm5Une+dLPes7gAWMPwX4GxUDkoeZG6MhQkmuJeBS/oU7CXCeSaEC7V7RUvd4tWM6qRX0iD9rFa4Ft2Dhdei9QR8iDMAOEFoamge3XqWRLFQxB9Mlz/wRydWkooIp5QRvEWdtTEwDKEMx39yVppZ5K6sFF9+iqCsoGbEdUAqmDFPQlpuhg3THVulw/pm4A492UtQSyxN/r/Uy+4wPp566ou4mVQBumDJeWPVE8ef1Vn/ox8mT71O8r+9cMye3HfFZg0pgcVBMLKyEmlMYZpqrP/PptVgtMkQwjI4FGEcQBiz+xkHpcn4DWlLBG8DPQOpxS0qUa6xQQHWZwSCSOvEer/u4Ve3toxdhC9l8iSuEvukeOWDmw8y5YEzDLqTMGKp8BwdR0Qtb3LEjqWr6IUOXYdy8Z1aSXleUgEk+UtfM0QLt3yyWvTciANzNZOE3TOfSsFF/ifTedV0FRM2aLrTmgz1jhVr7rZ137dA==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MRWP192MB3504.EURP192.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(10070799003)(376014)(52116014)(366016)(13003099007)(56012099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?tnLZ3AAdZSw2rvNU7RUIsXGWrfio19LcW/6Gx2L6gjT3IKNU1s0jS8rJTX4i?=
 =?us-ascii?Q?PPYLeCXYEslX9/c0aenEd5l7jtlybTdxVCkCEcYY8LXUNVB0HkHvQ0Ntt11s?=
 =?us-ascii?Q?kxyhilM0PrQ2au3X8GegJpQ9aJ6WloEQ1QjcNVrzWC8bJSjNcgru1zEJ6pQv?=
 =?us-ascii?Q?fBPqkEMtZvxgBKonTyVf4GaT14LvBRYxe6wGGIzg8TJD5EyLZIWCaReg+yui?=
 =?us-ascii?Q?Xn+dZDQ9iBiYT1qKlmswN5e1yLj+4s6iSiGWVbgg8CwOlHsgurGqblh3nzod?=
 =?us-ascii?Q?/j712hGc4rxpEmHVFvUZeDK4iaGFcW+JpvAvm7eCI09ou0rmVbJbyIJC4DHl?=
 =?us-ascii?Q?kh0hMbFATcubNtw8F/mUruT+KRrJPQixKfqzpt9+x7eReRUySkH4iXeZkwib?=
 =?us-ascii?Q?oJR1LrkRiNKXqL1pvzo/9ciAy176K9xzKcb7v1hIeseRVDXBrHa4BuygXemZ?=
 =?us-ascii?Q?fpYRlS+70npoM2kRLF4gpx4a9cS3vmpCJMFLpI7DO15Tp+F7dtAMgjq8okZK?=
 =?us-ascii?Q?Hs3hLzEpcpY4uICJe2x06eCMj5q56TZAhWlz2v7OiJHR0y3W6+YxHfh+hBej?=
 =?us-ascii?Q?9XJ4vG/JPVJjJv3gv4afelOnyJItvWUHxBfsMGGOGBSquV+SiseEnt5KV6x9?=
 =?us-ascii?Q?6M5S0VZFkike1DI4QFFwCKhXakA6ouHz9iVLXdnEhHR1WVM8AjOlmn1NoQn/?=
 =?us-ascii?Q?ld8FjYffrrX9MZuuZEmp2wJhDr1vMPe3qYBdYGrPdxYvfWpgBne0kwW/Vl4r?=
 =?us-ascii?Q?FDiKm9pBhh8i+usoru98tS31tFGFtXBPDraFRjgIrdCpDYAFPpe8rbqK2RZY?=
 =?us-ascii?Q?F38ajnvA81omJhG64Cf2TJDL2z9mKV11l2x5lv7uw8nm/5KUum4q1mjef27U?=
 =?us-ascii?Q?Wa+BUihNU4869dD4u57L7Pow0whEVQARC9nSd+CyNsYHwE5WEB+dgYeKwhfu?=
 =?us-ascii?Q?fCR1NufwfwT2Oij1FBm5+3UrkKhutehtBd/GUU0q+osGG0ntqt2KKCZcPLug?=
 =?us-ascii?Q?GVFiEef8SabBjC5w8Pg8TqAMuacfb/FseFohePxMOQ8mnvdo6+FyuVOWmRYd?=
 =?us-ascii?Q?7kRcVyhVcaWbL6GBkFYKU8MpTEXq+86vxoWKIBO2nFzcPSHgqo+VeRr8y4Q1?=
 =?us-ascii?Q?r/YAn4UoJj5/Ci9fdvcG17GwEXtMr18h2Tkr6wEFF7oR9MGe/XqxT4IwbX3m?=
 =?us-ascii?Q?zYaKH6RrDq/SvR9BNHbfoIyljLL3OsI5yAA8uyDhSsXf5gztsCYYOzaqz74T?=
 =?us-ascii?Q?S3i2B1eoxo4AI5xGQW/7yAAvgcHvKQw/Q9iZDSMO5gpPwCm79nhIGiY4iYaQ?=
 =?us-ascii?Q?qbUiDwItj+8sxXhhcejZO2o8Vnv7F9IJHgFCo72ZuPY+iYIAxiBjDPdOCwUz?=
 =?us-ascii?Q?3iydLoDNc2r6/ELXE8E85otNz2ClyO5IWvItSOzQNB3MKh6dblJqWMb24psF?=
 =?us-ascii?Q?cTINsBkOiGynEtxYO8jJDxZYbeiVfvzmq3DR3jIug1GBAqQr9DCWSzVIDzzO?=
 =?us-ascii?Q?lsUfOwuXHylKsPOZbHi1P+ZMGHQj5QsFhN7IGko5zlwj4AKxh4FpuIZMJ7nu?=
 =?us-ascii?Q?mSGhYvXylzRIfdNeX/eLLVodl2QYMer7BO2s2/3mCwml1dkKLbMO1mxodSC2?=
 =?us-ascii?Q?XP2PTjWAAyKq3RbQfoBRt7nMcRCx10qBqzwCa1XU280T/6H/HU5bMapp/oTY?=
 =?us-ascii?Q?yMQPv+VlsNEF90571v6IAsD9CI4zuJGv46LPatSV3wV/5aKA8W0RcWPVq6Di?=
 =?us-ascii?Q?Mv3IFBkWkmxoLRUj433hvyaIlQ1JbF66d3JATGru5Ui3//wf6HWnjbDcJ9ys?=
X-MS-Exchange-AntiSpam-MessageData-1: ihgQmZyBc+Eimg==
X-Exchange-RoutingPolicyChecked: 
	qoqu5S34HX7TBCdW61xeS3AACZ16iFW4oATVvPSas6oJy96yv5wPtVZ5U5a5doFI19qyJj0ieiUcDgmQYX32GTsYMDgS42fXc+VYbg5TzcvdCAkZ3noyU3j2SdNObOJ3/tCZO2yDlqQTSsqPofheNa/thG1uypMCXpsXnJ7wYkw693PfstVwz54N4Loob9SIVxvQhMBVK8vEln2vYTA3h0fdAAAYwwdKcr33uDfw/+ffb5tfEFG0aLA7Zj4JjtPmk2D8QZcJfcNX4SQvqUhu80xlHHslW0qLaLAv3Tp7k9o6fW5TBDOpUe/Sccf0sP3H7EV9NoX4DoTaqUqpoEnqmA==
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 
	op2vGDjNg+sn/Eoo7miD1x1VSNHKWD5/JxougnckBV4CFnORCyyhGKYnBaury22qVesEwFFdPrIdE3jdSN+hsJZ48T9XFDNdZos7NKreywSO7WkFGETPhna1WAcPvzFNnYZjcKHhEYIUxYvNtIB400c8jNatyQSOHhGmLlYknk031Cl9V0fwtlN7QxDLPjLgLDq0pkTctqpyXNtPSYzvLdTf/dy0dIetp6TM4i+mCQ0sogVWujkVGNHAhF9Qnc8XBOlNUDGI8Dyy1g+TDYGSNTVadFaYDGX0LKOMg5soI4srwxMmiAiBclmEXvCSKOyIpsES40cHQA5Uab2nUQBiTMFs6xXMmbA86rVHU7/Gr/X13eeEzq0hwDMI7VNQGjFojMgP5uoH3hTfGLIiHGeyyh19uyvhA8Gyf5hvBivECQhGou89d6FPWLKYfRAnvu5bW4KyE+/F9iCcYXw3AJRxuRiiIhmsssNqRzMsBIWDPi7wSbbAtU5goFhEYZPB8rCJAY9l6cf3aJuisLTcHhAFoyZGptJwTV+6/28AQ5pXHqrBlmyvTlUW+hF54ZIB6hxshfFo/fZQ+Hg68RALzRCENCucr2ZWFSifHdVXIRSQkb68yiU9YDtJn1VGozPL2CGE
X-OriginatorOrg: witekio.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cf27640e-f6e1-433f-9b84-08deb656926b
X-MS-Exchange-CrossTenant-AuthSource: MRWP192MB3504.EURP192.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 May 2026 10:00:07.4202
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 317e086a-301a-49af-9ea4-48a1c458b903
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HCccvQHAxPFlyHY/FpG4Gb1zE8oV8Wb04SFkHG7YDlW9QtYpRvQcBU+rPDsO9UbZFaUDsZ4fTs/v/T83rZFcHQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2P192MB2171
X-cloud-security-sender: hsimeliere@witekio.com
X-cloud-security-recipient: openembedded-core@lists.openembedded.org
X-cloud-security-crypt: load encryption module
X-cloud-security-Mailarchiv: E-Mail archived for: hsimeliere.opensource@witekio.com
X-cloud-security-Mailarchivtype: outbound
X-cloud-security-Virusscan: CLEAN
X-cloud-security-disclaimer: This E-Mail was scanned by E-Mailservice on mx-gate135-hz1 with 4gL6V20252zQmZb
X-cloud-security-connect: mail-northeuropeazon11022128.outbound.protection.outlook.com[52.101.66.128], TLS=1, IP=52.101.66.128
X-cloud-security-Digest: 2636a5cbb0303c495e0d48f12763ba5a
X-cloud-security: scantime:9.786
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 20 May 2026 10:49:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/237445

From: "Hugo SIMELIERE (Schneider Electric)" <hsimeliere.opensource@witekio.com>

Pick patches from [1], [2], [3] and [4] as mentioned in Debian report in [5].

[1] https://github.com/systemd/systemd/commit/20021e7686426052e3a7505425d7e12085feb2a6
[2] https://github.com/systemd/systemd/commit/7ac3220213690e8a8d6d2a6e81e43bd1dce01d69
[3] https://github.com/systemd/systemd/commit/21167006574d6b83813c7596759b474f56562412
[4] https://github.com/systemd/systemd/commit/54588d2dedff54bfb6036670820650e4ea74628f
[5] https://security-tracker.debian.org/tracker/CVE-2026-29111

Signed-off-by: Hugo SIMELIERE (Schneider Electric) <hsimeliere.opensource@witekio.com>
Reviewed-by: Bruno VERNAY <bruno.vernay@se.com>
---
 .../systemd/systemd/CVE-2026-29111-01.patch   | 168 ++++++++++++++++++
 .../systemd/systemd/CVE-2026-29111-02.patch   |  87 +++++++++
 .../systemd/systemd/CVE-2026-29111-03.patch   | 103 +++++++++++
 .../systemd/systemd/CVE-2026-29111-04.patch   |  37 ++++
 meta/recipes-core/systemd/systemd_255.21.bb   |   4 +
 5 files changed, 399 insertions(+)
 create mode 100644 meta/recipes-core/systemd/systemd/CVE-2026-29111-01.patch
 create mode 100644 meta/recipes-core/systemd/systemd/CVE-2026-29111-02.patch
 create mode 100644 meta/recipes-core/systemd/systemd/CVE-2026-29111-03.patch
 create mode 100644 meta/recipes-core/systemd/systemd/CVE-2026-29111-04.patch

diff --git a/meta/recipes-core/systemd/systemd/CVE-2026-29111-01.patch b/meta/recipes-core/systemd/systemd/CVE-2026-29111-01.patch
new file mode 100644
index 0000000000..b358f5b021
--- /dev/null
+++ b/meta/recipes-core/systemd/systemd/CVE-2026-29111-01.patch
@@ -0,0 +1,168 @@
+From 284fd279f9e9c199982aea51aee59a02e90a2eda Mon Sep 17 00:00:00 2001
+From: Lennart Poettering <lennart@poettering.net>
+Date: Mon, 19 May 2025 12:58:52 +0200
+Subject: [PATCH 1/4] path-util: add flavour of path_startswith() that leaves a
+ leading slash in place
+
+CVE: CVE-2026-29111
+Upstream-Status: Backport [https://github.com/systemd/systemd/commit/20021e7686426052e3a7505425d7e12085feb2a6]
+
+(cherry picked from commit ee19edbb9f3455db3f750089082f3e5a925e3a0c)
+(cherry picked from commit 20021e7686426052e3a7505425d7e12085feb2a6)
+Signed-off-by: Hugo SIMELIERE (Schneider Electric) <hsimeliere.opensource@witekio.com>
+---
+ src/basic/fs-util.c       |  2 +-
+ src/basic/mkdir.c         |  2 +-
+ src/basic/path-util.c     | 39 ++++++++++++++++++++++++++++-----------
+ src/basic/path-util.h     | 10 ++++++++--
+ src/test/test-path-util.c | 16 ++++++++++++++++
+ 5 files changed, 54 insertions(+), 15 deletions(-)
+
+diff --git a/src/basic/fs-util.c b/src/basic/fs-util.c
+index 5bc7d2f95b..4633a5cd72 100644
+--- a/src/basic/fs-util.c
++++ b/src/basic/fs-util.c
+@@ -65,7 +65,7 @@ int rmdir_parents(const char *path, const char *stop) {
+                 assert(*slash == '/');
+                 *slash = '\0';
+ 
+-                if (path_startswith_full(stop, p, /* accept_dot_dot= */ false))
++                if (path_startswith_full(stop, p, /* flags= */ 0))
+                         return 0;
+ 
+                 if (rmdir(p) < 0 && errno != ENOENT)
+diff --git a/src/basic/mkdir.c b/src/basic/mkdir.c
+index c770e5ed32..7bc73361a5 100644
+--- a/src/basic/mkdir.c
++++ b/src/basic/mkdir.c
+@@ -155,7 +155,7 @@ int mkdir_parents_internal(const char *prefix, const char *path, mode_t mode, ui
+         assert(_mkdirat != mkdirat);
+ 
+         if (prefix) {
+-                p = path_startswith_full(path, prefix, /* accept_dot_dot= */ false);
++                p = path_startswith_full(path, prefix, /* flags= */ 0);
+                 if (!p)
+                         return -ENOTDIR;
+         } else
+diff --git a/src/basic/path-util.c b/src/basic/path-util.c
+index 6810bf66aa..e73f5d708e 100644
+--- a/src/basic/path-util.c
++++ b/src/basic/path-util.c
+@@ -403,8 +403,8 @@ char* path_simplify_full(char *path, PathSimplifyFlags flags) {
+         return path;
+ }
+ 
+-char* path_startswith_full(const char *path, const char *prefix, bool accept_dot_dot) {
+-        assert(path);
++char* path_startswith_full(const char *original_path, const char *prefix, PathStartWithFlags flags) {
++        assert(original_path);
+         assert(prefix);
+ 
+         /* Returns a pointer to the start of the first component after the parts matched by
+@@ -417,28 +417,45 @@ char* path_startswith_full(const char *path, const char *prefix, bool accept_dot
+          * Returns NULL otherwise.
+          */
+ 
++        const char *path = original_path;
++
+         if ((path[0] == '/') != (prefix[0] == '/'))
+                 return NULL;
+ 
+         for (;;) {
+                 const char *p, *q;
+-                int r, k;
++                int m, n;
+ 
+-                r = path_find_first_component(&path, accept_dot_dot, &p);
+-                if (r < 0)
++                m = path_find_first_component(&path, FLAGS_SET(flags, PATH_STARTSWITH_ACCEPT_DOT_DOT), &p);
++                if (m < 0)
+                         return NULL;
+ 
+-                k = path_find_first_component(&prefix, accept_dot_dot, &q);
+-                if (k < 0)
++                n = path_find_first_component(&prefix, FLAGS_SET(flags, PATH_STARTSWITH_ACCEPT_DOT_DOT), &q);
++                if (n < 0)
+                         return NULL;
+ 
+-                if (k == 0)
+-                        return (char*) (p ?: path);
++                if (n == 0) {
++                        if (!p)
++                                p = path;
++
++                        if (FLAGS_SET(flags, PATH_STARTSWITH_RETURN_LEADING_SLASH)) {
++
++                                if (p <= original_path)
++                                        return NULL;
++
++                                p--;
++
++                                if (*p != '/')
++                                        return NULL;
++                        }
++
++                        return (char*) p;
++                }
+ 
+-                if (r != k)
++                if (m != n)
+                         return NULL;
+ 
+-                if (!strneq(p, q, r))
++                if (!strneq(p, q, m))
+                         return NULL;
+         }
+ }
+diff --git a/src/basic/path-util.h b/src/basic/path-util.h
+index 6d943e967f..e0ec05f4db 100644
+--- a/src/basic/path-util.h
++++ b/src/basic/path-util.h
+@@ -53,9 +53,15 @@ int safe_getcwd(char **ret);
+ int path_make_absolute_cwd(const char *p, char **ret);
+ int path_make_relative(const char *from, const char *to, char **ret);
+ int path_make_relative_parent(const char *from_child, const char *to, char **ret);
+-char* path_startswith_full(const char *path, const char *prefix, bool accept_dot_dot) _pure_;
++
++typedef enum PathStartWithFlags {
++        PATH_STARTSWITH_ACCEPT_DOT_DOT       = 1U << 0,
++        PATH_STARTSWITH_RETURN_LEADING_SLASH = 1U << 1,
++} PathStartWithFlags;
++
++char* path_startswith_full(const char *path, const char *prefix, PathStartWithFlags flags) _pure_;
+ static inline char* path_startswith(const char *path, const char *prefix) {
+-        return path_startswith_full(path, prefix, true);
++        return path_startswith_full(path, prefix, PATH_STARTSWITH_ACCEPT_DOT_DOT);
+ }
+ 
+ int path_compare(const char *a, const char *b) _pure_;
+diff --git a/src/test/test-path-util.c b/src/test/test-path-util.c
+index f5a425689a..71056b08c1 100644
+--- a/src/test/test-path-util.c
++++ b/src/test/test-path-util.c
+@@ -754,6 +754,22 @@ TEST(path_startswith) {
+         test_path_startswith_one("/foo/bar/barfoo/", "/fo", NULL, NULL);
+ }
+ 
++static void test_path_startswith_return_leading_slash_one(const char *path, const char *prefix, const char *expected) {
++        const char *p;
++
++        log_debug("/* %s(%s, %s) */", __func__, path, prefix);
++
++        p = path_startswith_full(path, prefix, PATH_STARTSWITH_RETURN_LEADING_SLASH);
++        assert_se(streq_ptr(p, expected));
++}
++
++TEST(path_startswith_return_leading_slash) {
++        test_path_startswith_return_leading_slash_one("/foo/bar", "/", "/foo/bar");
++        test_path_startswith_return_leading_slash_one("/foo/bar", "/foo", "/bar");
++        test_path_startswith_return_leading_slash_one("/foo/bar", "/foo/bar", NULL);
++        test_path_startswith_return_leading_slash_one("/foo/bar/", "/foo/bar", "/");
++}
++
+ static void test_prefix_root_one(const char *r, const char *p, const char *expected) {
+         _cleanup_free_ char *s = NULL;
+         const char *t;
+-- 
+2.43.0
+
diff --git a/meta/recipes-core/systemd/systemd/CVE-2026-29111-02.patch b/meta/recipes-core/systemd/systemd/CVE-2026-29111-02.patch
new file mode 100644
index 0000000000..465d1e619d
--- /dev/null
+++ b/meta/recipes-core/systemd/systemd/CVE-2026-29111-02.patch
@@ -0,0 +1,87 @@
+From ed86ee8a7cc82fe1c68e3fb17be71c9c8e62ca87 Mon Sep 17 00:00:00 2001
+From: Lennart Poettering <lennart@poettering.net>
+Date: Fri, 23 May 2025 06:45:40 +0200
+Subject: [PATCH 2/4] path-util: invert PATH_STARTSWITH_ACCEPT_DOT_DOT flag
+
+As requested: https://github.com/systemd/systemd/pull/37572#pullrequestreview-2861928094
+
+CVE: CVE-2026-29111
+Upstream-Status: Backport [https://github.com/systemd/systemd/commit/7ac3220213690e8a8d6d2a6e81e43bd1dce01d69]
+
+(cherry picked from commit ceed11e465f1c8efff1931412a85924d9de7c08d)
+(cherry picked from commit 7ac3220213690e8a8d6d2a6e81e43bd1dce01d69)
+Signed-off-by: Hugo SIMELIERE (Schneider Electric) <hsimeliere.opensource@witekio.com>
+---
+ src/basic/fs-util.c   | 2 +-
+ src/basic/mkdir.c     | 2 +-
+ src/basic/path-util.c | 4 ++--
+ src/basic/path-util.h | 4 ++--
+ 4 files changed, 6 insertions(+), 6 deletions(-)
+
+diff --git a/src/basic/fs-util.c b/src/basic/fs-util.c
+index 4633a5cd72..21cd6ddcde 100644
+--- a/src/basic/fs-util.c
++++ b/src/basic/fs-util.c
+@@ -65,7 +65,7 @@ int rmdir_parents(const char *path, const char *stop) {
+                 assert(*slash == '/');
+                 *slash = '\0';
+ 
+-                if (path_startswith_full(stop, p, /* flags= */ 0))
++                if (path_startswith_full(stop, p, PATH_STARTSWITH_REFUSE_DOT_DOT))
+                         return 0;
+ 
+                 if (rmdir(p) < 0 && errno != ENOENT)
+diff --git a/src/basic/mkdir.c b/src/basic/mkdir.c
+index 7bc73361a5..8f14c47214 100644
+--- a/src/basic/mkdir.c
++++ b/src/basic/mkdir.c
+@@ -155,7 +155,7 @@ int mkdir_parents_internal(const char *prefix, const char *path, mode_t mode, ui
+         assert(_mkdirat != mkdirat);
+ 
+         if (prefix) {
+-                p = path_startswith_full(path, prefix, /* flags= */ 0);
++                p = path_startswith_full(path, prefix, PATH_STARTSWITH_REFUSE_DOT_DOT);
+                 if (!p)
+                         return -ENOTDIR;
+         } else
+diff --git a/src/basic/path-util.c b/src/basic/path-util.c
+index e73f5d708e..a65a5c32f6 100644
+--- a/src/basic/path-util.c
++++ b/src/basic/path-util.c
+@@ -426,11 +426,11 @@ char* path_startswith_full(const char *original_path, const char *prefix, PathSt
+                 const char *p, *q;
+                 int m, n;
+ 
+-                m = path_find_first_component(&path, FLAGS_SET(flags, PATH_STARTSWITH_ACCEPT_DOT_DOT), &p);
++                m = path_find_first_component(&path, !FLAGS_SET(flags, PATH_STARTSWITH_REFUSE_DOT_DOT), &p);
+                 if (m < 0)
+                         return NULL;
+ 
+-                n = path_find_first_component(&prefix, FLAGS_SET(flags, PATH_STARTSWITH_ACCEPT_DOT_DOT), &q);
++                n = path_find_first_component(&prefix, !FLAGS_SET(flags, PATH_STARTSWITH_REFUSE_DOT_DOT), &q);
+                 if (n < 0)
+                         return NULL;
+ 
+diff --git a/src/basic/path-util.h b/src/basic/path-util.h
+index e0ec05f4db..11a1078df9 100644
+--- a/src/basic/path-util.h
++++ b/src/basic/path-util.h
+@@ -55,13 +55,13 @@ int path_make_relative(const char *from, const char *to, char **ret);
+ int path_make_relative_parent(const char *from_child, const char *to, char **ret);
+ 
+ typedef enum PathStartWithFlags {
+-        PATH_STARTSWITH_ACCEPT_DOT_DOT       = 1U << 0,
++        PATH_STARTSWITH_REFUSE_DOT_DOT       = 1U << 0,
+         PATH_STARTSWITH_RETURN_LEADING_SLASH = 1U << 1,
+ } PathStartWithFlags;
+ 
+ char* path_startswith_full(const char *path, const char *prefix, PathStartWithFlags flags) _pure_;
+ static inline char* path_startswith(const char *path, const char *prefix) {
+-        return path_startswith_full(path, prefix, PATH_STARTSWITH_ACCEPT_DOT_DOT);
++        return path_startswith_full(path, prefix, 0);
+ }
+ 
+ int path_compare(const char *a, const char *b) _pure_;
+-- 
+2.43.0
+
diff --git a/meta/recipes-core/systemd/systemd/CVE-2026-29111-03.patch b/meta/recipes-core/systemd/systemd/CVE-2026-29111-03.patch
new file mode 100644
index 0000000000..d0ff3fb64c
--- /dev/null
+++ b/meta/recipes-core/systemd/systemd/CVE-2026-29111-03.patch
@@ -0,0 +1,103 @@
+From 7a1749753b4853866f90ef25d48192e4d1563543 Mon Sep 17 00:00:00 2001
+From: Mike Yuan <me@yhndnzj.com>
+Date: Thu, 26 Feb 2026 11:06:00 +0100
+Subject: [PATCH 3/4] core/cgroup: avoid one unnecessary strjoina()
+
+CVE: CVE-2026-29111
+Upstream-Status: Backport [https://github.com/systemd/systemd/commit/21167006574d6b83813c7596759b474f56562412]
+
+(cherry picked from commit 42aee39107fbdd7db1ccd402a2151822b2805e9f)
+(cherry picked from commit 80acea4ef80a4bb78560ed970c34952299b890d6)
+(cherry picked from commit b5fd14693057e5f2c9b4a49603be64ec3608ff6c)
+(cherry picked from commit 21167006574d6b83813c7596759b474f56562412)
+Signed-off-by: Hugo SIMELIERE (Schneider Electric) <hsimeliere.opensource@witekio.com>
+---
+ src/core/cgroup.c | 27 +++++++++++++--------------
+ 1 file changed, 13 insertions(+), 14 deletions(-)
+
+diff --git a/src/core/cgroup.c b/src/core/cgroup.c
+index d398655b0a..e5e7f032c2 100644
+--- a/src/core/cgroup.c
++++ b/src/core/cgroup.c
+@@ -2568,12 +2568,13 @@ static int unit_update_cgroup(
+         return 0;
+ }
+ 
+-static int unit_attach_pid_to_cgroup_via_bus(Unit *u, pid_t pid, const char *suffix_path) {
++static int unit_attach_pid_to_cgroup_via_bus(Unit *u, const char *cgroup_path, pid_t pid) {
+         _cleanup_(sd_bus_error_free) sd_bus_error error = SD_BUS_ERROR_NULL;
+-        char *pp;
+         int r;
+ 
+         assert(u);
++        assert(cgroup_path);
++        assert(pid_is_valid(pid));
+ 
+         if (MANAGER_IS_SYSTEM(u->manager))
+                 return -EINVAL;
+@@ -2581,17 +2582,13 @@ static int unit_attach_pid_to_cgroup_via_bus(Unit *u, pid_t pid, const char *suf
+         if (!u->manager->system_bus)
+                 return -EIO;
+ 
+-        if (!u->cgroup_path)
+-                return -EINVAL;
+-
+         /* Determine this unit's cgroup path relative to our cgroup root */
+-        pp = path_startswith(u->cgroup_path, u->manager->cgroup_root);
++        const char *pp = path_startswith_full(cgroup_path,
++                                              u->manager->cgroup_root,
++                                              PATH_STARTSWITH_RETURN_LEADING_SLASH|PATH_STARTSWITH_REFUSE_DOT_DOT);
+         if (!pp)
+                 return -EINVAL;
+ 
+-        pp = strjoina("/", pp, suffix_path);
+-        path_simplify(pp);
+-
+         r = bus_call_method(u->manager->system_bus,
+                             bus_systemd_mgr,
+                             "AttachProcessesToUnit",
+@@ -2630,8 +2627,10 @@ int unit_attach_pids_to_cgroup(Unit *u, Set *pids, const char *suffix_path) {
+                 return r;
+ 
+         if (isempty(suffix_path))
+-                p = u->cgroup_path;
++                p = empty_to_root(u->cgroup_path);
+         else {
++                assert(path_is_absolute(suffix_path));
++
+                 joined = path_join(u->cgroup_path, suffix_path);
+                 if (!joined)
+                         return -ENOMEM;
+@@ -2649,7 +2648,7 @@ int unit_attach_pids_to_cgroup(Unit *u, Set *pids, const char *suffix_path) {
+                  * before we use it */
+                 r = pidref_verify(pid);
+                 if (r < 0) {
+-                        log_unit_info_errno(u, r, "PID " PID_FMT " vanished before we could move it to target cgroup '%s', skipping: %m", pid->pid, empty_to_root(p));
++                        log_unit_info_errno(u, r, "PID " PID_FMT " vanished before we could move it to target cgroup '%s', skipping: %m", pid->pid, p);
+                         continue;
+                 }
+ 
+@@ -2660,7 +2659,7 @@ int unit_attach_pids_to_cgroup(Unit *u, Set *pids, const char *suffix_path) {
+ 
+                         log_unit_full_errno(u, again ? LOG_DEBUG : LOG_INFO,  r,
+                                             "Couldn't move process "PID_FMT" to%s requested cgroup '%s': %m",
+-                                            pid->pid, again ? " directly" : "", empty_to_root(p));
++                                            pid->pid, again ? " directly" : "", p);
+ 
+                         if (again) {
+                                 int z;
+@@ -2670,9 +2669,9 @@ int unit_attach_pids_to_cgroup(Unit *u, Set *pids, const char *suffix_path) {
+                                  * Since it's more privileged it might be able to move the process across the
+                                  * leaves of a subtree whose top node is not owned by us. */
+ 
+-                                z = unit_attach_pid_to_cgroup_via_bus(u, pid->pid, suffix_path);
++                                z = unit_attach_pid_to_cgroup_via_bus(u, p, pid->pid);
+                                 if (z < 0)
+-                                        log_unit_info_errno(u, z, "Couldn't move process "PID_FMT" to requested cgroup '%s' (directly or via the system bus): %m", pid->pid, empty_to_root(p));
++                                        log_unit_info_errno(u, z, "Couldn't move process "PID_FMT" to requested cgroup '%s' (directly or via the system bus): %m", pid->pid, p);
+                                 else {
+                                         if (ret >= 0)
+                                                 ret++; /* Count successful additions */
+-- 
+2.43.0
+
diff --git a/meta/recipes-core/systemd/systemd/CVE-2026-29111-04.patch b/meta/recipes-core/systemd/systemd/CVE-2026-29111-04.patch
new file mode 100644
index 0000000000..d6c3f5ccdc
--- /dev/null
+++ b/meta/recipes-core/systemd/systemd/CVE-2026-29111-04.patch
@@ -0,0 +1,37 @@
+From 0d2c41d0f024088a275ac0c02d50205c800dec8a Mon Sep 17 00:00:00 2001
+From: Mike Yuan <me@yhndnzj.com>
+Date: Thu, 26 Feb 2026 11:06:34 +0100
+Subject: [PATCH 4/4] core: validate input cgroup path more prudently
+
+CVE: CVE-2026-29111
+Upstream-Status: Backport [https://github.com/systemd/systemd/commit/54588d2dedff54bfb6036670820650e4ea74628f]
+
+(cherry picked from commit efa6ba2ab625aaa160ac435a09e6482fc63bdbe8)
+(cherry picked from commit 3cee294fe8cf4fa0eff933ab21416d099942cabd)
+(cherry picked from commit 1d22f706bd04f45f8422e17fbde3f56ece17758a)
+(cherry picked from commit 54588d2dedff54bfb6036670820650e4ea74628f)
+Signed-off-by: Hugo SIMELIERE (Schneider Electric) <hsimeliere.opensource@witekio.com>
+---
+ src/core/dbus-manager.c | 6 ++++++
+ 1 file changed, 6 insertions(+)
+
+diff --git a/src/core/dbus-manager.c b/src/core/dbus-manager.c
+index c7372ca033..cb84ba9866 100644
+--- a/src/core/dbus-manager.c
++++ b/src/core/dbus-manager.c
+@@ -646,6 +646,12 @@ static int method_get_unit_by_control_group(sd_bus_message *message, void *userd
+         if (r < 0)
+                 return r;
+ 
++        if (!path_is_absolute(cgroup))
++                return sd_bus_error_setf(error, SD_BUS_ERROR_INVALID_ARGS, "Control group path is not absolute: %s", cgroup);
++
++        if (!path_is_normalized(cgroup))
++                return sd_bus_error_setf(error, SD_BUS_ERROR_INVALID_ARGS, "Control group path is not normalized: %s", cgroup);
++
+         u = manager_get_unit_by_cgroup(m, cgroup);
+         if (!u)
+                 return sd_bus_error_setf(error, BUS_ERROR_NO_SUCH_UNIT,
+-- 
+2.43.0
+
diff --git a/meta/recipes-core/systemd/systemd_255.21.bb b/meta/recipes-core/systemd/systemd_255.21.bb
index 9c5f8af240..e5a0fd9170 100644
--- a/meta/recipes-core/systemd/systemd_255.21.bb
+++ b/meta/recipes-core/systemd/systemd_255.21.bb
@@ -33,6 +33,10 @@ SRC_URI += " \
            file://CVE-2026-40225-02.patch \
            file://CVE-2026-40226-01.patch \
            file://CVE-2026-40226-02.patch \
+           file://CVE-2026-29111-01.patch \
+           file://CVE-2026-29111-02.patch \
+           file://CVE-2026-29111-03.patch \
+           file://CVE-2026-29111-04.patch \
            "
 
 # patches needed by musl
-- 
2.43.0


