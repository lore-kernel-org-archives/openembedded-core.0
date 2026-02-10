Return-Path: <david.partain@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DFEC4EB2710
	for <webhook@archiver.kernel.org>; Tue, 10 Feb 2026 20:05:21 +0000 (UTC)
Received: from OSPPR02CU001.outbound.protection.outlook.com (OSPPR02CU001.outbound.protection.outlook.com [40.107.159.40])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.24041.1770741331140388300
 for <openembedded-core@lists.openembedded.org>;
 Tue, 10 Feb 2026 08:35:31 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=oiL8tqlC;
 spf=pass (domain: est.tech, ip: 40.107.159.40, mailfrom: adarsh.jagadish.kamini@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Xtl+xI08255VJPuc58T/VtEXDgwn8iCLfdy8WW6yLKRpjuCZUF7xLbMZlf+CPoMk4M9DW/hNbyaz14yoWj/9ue52yPDY2b40VBivMfT79V8EY0gFJ8xmGPOKCny5GT4dZn5a8uVqllYTNEukB8LAM3DkfH/VYVUvgwekNzucX6c/2Njp5j7pwhy9EP/5t68IBGT0iwN3cXwoKfpmawN3q3xZx4+1dFpnC5W1Jekrpirq5CY2tETl8DhO7TbqaL7AopdgS0X6A208spKyG0YWNHsaJMwtPYBtNtTUrdX6k5v65HGoKqNNCR/oij+V6pyPGsKV4MOAL60YiGXCTFXuxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4da5lcTU+smsom2NaQMKvKpZ2gQsTfRup+QeTWrc7Nc=;
 b=S+QqXOAovVKCul7VnGs/wFjkzeeRT2gjS8thhRlCj/ZYMKC66K1assnmcdfOyqbAfmVV0TEzF8zbQxGc+z0O/ELqMRE2PlkOrXfHMLJweEA7o8g75fwFFNnLsf52oBf6gmJwKbludAcZ/sJUz0dfT3qNKl85n6Rcfpx42LqCKCqrUodrxQMAa5IIgttk3lDaIzRUuuUF5yCX8tcT2D7p1zZy5OlrMjAwKluiM+PizwY/ie+uY6DQX6mRSFuifh93lVvrWbq2BnDMICDBCWsP3J8Rsydmib2hWvZbFMO4pnPNx2aXjBFjtz5ZzztjtpZE9xILiPEam74m6G0qM1oNfg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4da5lcTU+smsom2NaQMKvKpZ2gQsTfRup+QeTWrc7Nc=;
 b=oiL8tqlChH/Fsp322cDF1EIyoi5g8qFlk/4cWXThRKtsYrfzwNLzCe6NhnrDmlJwsIWZiVK5sB/ZIPq0HY3Uh9DvkNJbzzycprqYtSmgZD098FHsvxBe21qsVDbXBLN0ET1v8rgtG7M6Pp+KPij1PI0LXC/k9vBx6DD170bwnsvuVlzQ9L96Qwy5uYmS5E04oHfGvydwh5hxzlYuc1/x3f6UM1Db7jh4CnAMLOVPgjGmOgsp2m3Pg6YfvMfIakXMJJ6a+FNynX0BcUhPq7AByIqgn8t+iY1zAwSmyYYzhOPHkmqvV8vMeoeK746lm8+OGqnOvLUEShY9agTgR1Pc+Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from AS8P189MB1672.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:396::9)
 by AS8P189MB1240.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:2a5::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.19; Tue, 10 Feb
 2026 16:35:26 +0000
Received: from AS8P189MB1672.EURP189.PROD.OUTLOOK.COM
 ([fe80::f147:85e5:34de:eeff]) by AS8P189MB1672.EURP189.PROD.OUTLOOK.COM
 ([fe80::f147:85e5:34de:eeff%5]) with mapi id 15.20.9587.017; Tue, 10 Feb 2026
 16:35:26 +0000
From: "Adarsh Jagadish Kamini" <adarsh.jagadish.kamini@est.tech>
To: openembedded-core@lists.openembedded.org
CC: Adarsh Jagadish Kamini <adarsh.jagadish.kamini@est.tech>
Subject: [OE-core][scarthgap][PATCH v2] python3-pip: Backport fix CVE-2026-1703
Date: Tue, 10 Feb 2026 17:35:20 +0100
Message-ID: <20260210163523.92013-1-adarsh.jagadish.kamini@est.tech>
X-Mailer: git-send-email 2.43.0
X-ClientProxiedBy: LO4P265CA0151.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:2c7::6) To AS8P189MB1672.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:20b:396::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8P189MB1672:EE_|AS8P189MB1240:EE_
X-MS-Office365-Filtering-Correlation-Id: 2b4dffac-1746-4876-2a14-08de68c26532
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|13003099007;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?0n9TFvkOrKFaJCTXe6Y7cv1EQjjCCNdww369oZw9M90q2XdL9NMPxYSBg9Mu?=
 =?us-ascii?Q?CzfZbpqKlPZda9L9tERK30Q9TJiQFco27WjjOjlMz4T7bZvfUuGIv+frbR1j?=
 =?us-ascii?Q?yRD34IP43eHgS9ckARLgK/Du/wVCu464AzahYSG06S/2MYdxhzu3PPbJj47g?=
 =?us-ascii?Q?AQe/6uVsFlGPGi0xdbJGf9iRyW2VzGcHAJzz3bx8HdcXBVClq6UC7B7hSk0N?=
 =?us-ascii?Q?JQZ6PJhiFHgcKHvwym7dwle8y0jSDKM3CRUBWH6qnUoiKuWvKr6OB3dvZYqk?=
 =?us-ascii?Q?3APGtiQQNvgzxNKtTAuBlF8V+VxllmplZ03wYc9QoHpO8ExNSwMdB/YssmWs?=
 =?us-ascii?Q?xYeWXDnblXJu0av6cgfPrcYw3mtYzRT3RwID0Pcv1MwgGclPk0ARsZmz4TR8?=
 =?us-ascii?Q?r5F89A5Gi3u9tpo3+vHHDN74WhMFlt8MIDzzLX6oBcHDIGrv4/NL9xJo/cBi?=
 =?us-ascii?Q?Km6668T6NmwWR6/VZEWDDdVvIUW4PrJkdr2AMe/b0QlrcTiw8tuGRbIe4IZR?=
 =?us-ascii?Q?ZlGtPAppEuxKWiWCJ778PBGWw0Ezi+mbylJcFD7joXDG1IqC0Ek1r/ak0B9G?=
 =?us-ascii?Q?9KYXTg/gKL6x7UTX+4RmckR18wNtqnb9XyZP1PhLHShaUUq6Mm9YW7OzGQq6?=
 =?us-ascii?Q?7f83u4LJo8ehzyJqgfyBEiUXWX1vOZzTmA7eJhFW3oY+2ZVXgWQKH59tXKLf?=
 =?us-ascii?Q?BgHIEJDi/gPR+oZj+EfiG3+ihx+K0rM4f+Bcd3Nuznmg5aQpqR7/+QtvIRsK?=
 =?us-ascii?Q?WiiohZD08y0SyxfFxRpcMzvRaoIvgMWVn30W6lYDWZ3YU95nA3TrhMDa8XB0?=
 =?us-ascii?Q?oa2Y5G6hAwTDV3o489QgKYrKWNyE5CBkl4L25c0RANRwAjp2lfVeOL08huD3?=
 =?us-ascii?Q?fyPsHlwhJkNGQjCCqp1M9JESsHYlbg1xZnOSKjzAIpJJ8Ur1We4+MfYXMG5j?=
 =?us-ascii?Q?b38tB0OuoCUD8K4kide1ynlwVXXbOPISqFFyZZxVTPQjO9/3KfYurZ9ON6dc?=
 =?us-ascii?Q?V0PVpNaYxmW1rPYONs15El9B0WuVfWsK0YWvtlwURrKpdtMd6Z5mGUvncr9u?=
 =?us-ascii?Q?B5OEIHcEod717VBxQjXGjpFQEbt4ewCVQQmDZHB741p02oyEnV0hG+plFCvO?=
 =?us-ascii?Q?6LU4pv2wNqUcSBba2X6cf6QY7kmqQ2ck+qdpHto5MN56UHSxbNQYAwGWYAsX?=
 =?us-ascii?Q?vCELWDJ1gudhj9gkLZzxBjdeNqUCDzmviGmOmjPtrFkLEaeZYy3pK9Bb0iKb?=
 =?us-ascii?Q?WvDq09gJq8h9FiBhMuuTooIbJsaDefTG2s685k9TDKdJVHq808yKHcX38bYE?=
 =?us-ascii?Q?9Wxgo444shrlSWz1QJWYh1Mfzh+HXARjazlUVX4I9Q8XYxhenNpxH/bjzYlW?=
 =?us-ascii?Q?pB0MKcDADd9PPWfghbgJp1CCac5ynB5x4BlVhRoOn5qyMaABGfblbkHPXwi2?=
 =?us-ascii?Q?J0U02DbP+YLiNamV3Uknm8sq//tmU0cHOHRrlGTLVX8qEQs81QdvNtcrIkgH?=
 =?us-ascii?Q?zIBnLvOS9+NFk3Kc0b1AkaYueAOh6bQWsPEo?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8P189MB1672.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?29sU6+TqHd0qTApxLYwzLVBBATDDRDWNcjesPxehS8oq3fbvmk17k3tcRW1q?=
 =?us-ascii?Q?tVzklhIGhv8F2mCInb82uK/u1D1vLtkb/UKZuj7+jTvg7d5RRlVJ7iqmaa+t?=
 =?us-ascii?Q?LbMKX47Ydxrvap4hbFgmT21K+pH3y6zQrivGnl+0xD+czz9om5x4l8+fvp00?=
 =?us-ascii?Q?zPkhGfkaV+fP2i5Kabn6nmBmFTVznrQMatTr6hoDjQFYJt4wJLrLmWwqy2CQ?=
 =?us-ascii?Q?eqy808jB5/BTLEme7RgFM1SCcVHaGihR67f93qf7fy7jXMvfapvz/xioDqTx?=
 =?us-ascii?Q?UuNM1Bgcg5gIxGUMdbIPfkmMTMCwUEnCUdSHvcLYXUArGSi2baPTAHJnLNA+?=
 =?us-ascii?Q?FoHwbTr5esQYicgkbbKQ2FVDVoQevw3S9cHb4kX3V9OXfs+N/Vu6mDK1UNNL?=
 =?us-ascii?Q?D7T+R18SLIfgMadJYF5GKp4LFJhwjHrCpyK1NytsPdDrq8RRb2BvAjjC5jZn?=
 =?us-ascii?Q?kx0fvki4yNq6d3QvYD4S64NoA59KmUh5vrKLVo7B13Ub7acezsiEm+mIYWvZ?=
 =?us-ascii?Q?A9f+GzsqOgJmTMFsLXuIDSNam/je4DRcFDqdRoAw33MG2kPBoEMZn8JWE7Z7?=
 =?us-ascii?Q?EHzjVA/ZUIra95xEEV8Od1Cp5FI4OCqjs1gJrRr8UHU3aCHvVDxdOM/f4vOU?=
 =?us-ascii?Q?UTaEhA5Bs6YMS9bHcEJ/rxTAFYmQ8MJ7i9yF38uCqaz7XieOZeNbXUONvJf3?=
 =?us-ascii?Q?BSjgV4Gm1tTVGMig6lmOK4n3xE0oq+nHNf/aY1+XHkUzHC1dK8d9YYZR1Iew?=
 =?us-ascii?Q?bYDOo94+Ap2V03z8GwbJ+R8+DufHXuW50YBP6iXDY4FpKnxfZicGAZkbfQa3?=
 =?us-ascii?Q?DgyAKV6lpOhW7qS0n9azCYnBs6pGmZ2esxozlbkQ6nSs6E7tmS9NeekXVAmk?=
 =?us-ascii?Q?Qnrvtp1JTl0XPQTts2SAqglKgNQ7KoLrepCZgpIW0Fy9hMid1XQe7GySWOtS?=
 =?us-ascii?Q?AKIb4jHt/1AL2jZSWGKyX1J7flvGukH0gV4Prka41d0PvW/vvjIpqN82gpqD?=
 =?us-ascii?Q?8+mcOVEXwHiWTaN1sK+j/1UrPjNZi/E+gZ9pUV2G94fxg6Mnb4Zk29UzXPgz?=
 =?us-ascii?Q?5PVZihsQ8EwzbA1e8/Qd0probXZagWU9t5XxHD6xWTo1emGa8VvHxh+tgoqU?=
 =?us-ascii?Q?eOs/M6+bGdvPmIowI2+LCnO6s+PMkayu+ePnhLhhCYAFgP8Q6GyX+OW7QfcL?=
 =?us-ascii?Q?8cJXYgZnFLsk1jYAaLkIqADuRNcFpu2tGQVC04GI0iN5n6iKK5gS90hMi2be?=
 =?us-ascii?Q?c9KwhEUcKa0bYl+tZF7c7fZgEKr0KSYfjC2HyAixNsQGol6fCEOAUllLNqw/?=
 =?us-ascii?Q?2DBokU6KUjqLRjNtCJvgyiqom5lE17hPwBYSYb7moyZG9ruB53xf/fYL/EJJ?=
 =?us-ascii?Q?YSqtXRed6ruYo4PRDJGoXrGMqbq22/D+T9YwcTNXZXtMksQpDjaj0WIezhfQ?=
 =?us-ascii?Q?RawjeSZ/aJwQqxZN4cC/+9RhP0aA11HpSWtcXaQAtbWiG+s2oYPK5byzBCGL?=
 =?us-ascii?Q?PzhCiiaPeJPBM2XmF1ypFpYpxF7jcry3TLwaM4EnnKH1KYsLcs/kUG0AgP6u?=
 =?us-ascii?Q?Qo5DOMMDuZhrcp/dsItPasnSDAjKTNzKg9KeHO5HW0I9Y4FRGXGAwg4KnW/4?=
 =?us-ascii?Q?1N2Tk6snHwdOrLGQHKmxVW0/3jNUiiG+zJSjrNXVqYWXaAipXmnkTxhlD5Ym?=
 =?us-ascii?Q?GpWtG1ckyO4I4wF93rReVDBpUoDHWULwE4r76jWTOGqABPRuKpdYYBIo0J/+?=
 =?us-ascii?Q?p3lY7jJ+EQrRXXjgqsT4OAoi3AJeOYc=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: 2b4dffac-1746-4876-2a14-08de68c26532
X-MS-Exchange-CrossTenant-AuthSource: AS8P189MB1672.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Feb 2026 16:35:26.4918
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: eRgXbU2UwJLrgefk7QzQm/M1noxQ8HQcbk19fMDhG3hpdPUvCbXcwJkyeB9HTLZUBZirHopp1kHa6uigGi3OdfF0bERMENDCGIZlyfp32pA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8P189MB1240
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 10 Feb 2026 20:05:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/230935

From: Adarsh Jagadish Kamini <adarsh.jagadish.kamini@est.tech>

Include the patch linked in the NVD report: https://github.com/pypa/pip/com=
mit/8e227a9be4faa9594e05d02ca05a413a2a4e7735

Signed-off-by: Adarsh Jagadish Kamini <adarsh.jagadish.kamini@est.tech>
---
 .../python/python3-pip/CVE-2026-1703.patch    | 55 +++++++++++++++++++
 .../python/python3-pip_24.0.bb                |  4 +-
 2 files changed, 58 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-devtools/python/python3-pip/CVE-2026-1703.=
patch

diff --git a/meta/recipes-devtools/python/python3-pip/CVE-2026-1703.patch b=
/meta/recipes-devtools/python/python3-pip/CVE-2026-1703.patch
new file mode 100644
index 0000000000..8d34d2acb4
--- /dev/null
+++ b/meta/recipes-devtools/python/python3-pip/CVE-2026-1703.patch
@@ -0,0 +1,55 @@
+From ed41e052ebe78fcf043c43ea05bf16f73dfbb581 Mon Sep 17 00:00:00 2001
+From: Damian Shaw <damian.peter.shaw@gmail.com>
+Date: Fri, 30 Jan 2026 16:27:57 -0500
+Subject: [PATCH] Merge pull request #13777 from sethmlarson/commonpath
+
+Use os.path.commonpath() instead of commonprefix()
+
+CVE: CVE-2026-1703
+
+Upstream-Status: Backport [https://github.com/pypa/pip/commit/8e227a9be4fa=
a9594e05d02ca05a413a2a4e7735]
+
+Signed-off-by: Adarsh Jagadish Kamini <adarsh.jagadish.kamini@est.tech>
+---
+ news/+1ee322a1.bugfix.rst            | 1 +
+ src/pip/_internal/utils/unpacking.py | 2 +-
+ tests/unit/test_utils_unpacking.py   | 2 ++
+ 3 files changed, 4 insertions(+), 1 deletion(-)
+ create mode 100644 news/+1ee322a1.bugfix.rst
+
+diff --git a/news/+1ee322a1.bugfix.rst b/news/+1ee322a1.bugfix.rst
+new file mode 100644
+index 000000000..edb1b320c
+--- /dev/null
++++ b/news/+1ee322a1.bugfix.rst
+@@ -0,0 +1 @@
++Use a path-segment prefix comparison, not char-by-char.
+diff --git a/src/pip/_internal/utils/unpacking.py b/src/pip/_internal/util=
s/unpacking.py
+index 78b5c13ce..0b26525fb 100644
+--- a/src/pip/_internal/utils/unpacking.py
++++ b/src/pip/_internal/utils/unpacking.py
+@@ -81,7 +81,7 @@ def is_within_directory(directory: str, target: str) -> =
bool:
+     abs_directory =3D os.path.abspath(directory)
+     abs_target =3D os.path.abspath(target)
+=20
+-    prefix =3D os.path.commonprefix([abs_directory, abs_target])
++    prefix =3D os.path.commonpath([abs_directory, abs_target])
+     return prefix =3D=3D abs_directory
+=20
+=20
+diff --git a/tests/unit/test_utils_unpacking.py b/tests/unit/test_utils_un=
packing.py
+index 1f0b59dbd..724ca0be8 100644
+--- a/tests/unit/test_utils_unpacking.py
++++ b/tests/unit/test_utils_unpacking.py
+@@ -202,6 +202,8 @@ def test_unpack_tar_unicode(tmpdir: Path) -> None:
+         (("parent/", "parent/sub"), True),
+         # Test target outside parent
+         (("parent/", "parent/../sub"), False),
++        # Test target sub-string of parent
++        (("parent/child", "parent/childfoo"), False),
+     ],
+ )
+ def test_is_within_directory(args: Tuple[str, str], expected: bool) -> No=
ne:
+--=20
+2.44.0
+
diff --git a/meta/recipes-devtools/python/python3-pip_24.0.bb b/meta/recipe=
s-devtools/python/python3-pip_24.0.bb
index be4a29500a..35428260c3 100644
--- a/meta/recipes-devtools/python/python3-pip_24.0.bb
+++ b/meta/recipes-devtools/python/python3-pip_24.0.bb
@@ -31,7 +31,9 @@ LIC_FILES_CHKSUM =3D "file://LICENSE.txt;md5=3D63ec52baf9=
5163b597008bb46db68030 \
=20
 inherit pypi python_setuptools_build_meta
=20
-SRC_URI +=3D "file://no_shebang_mangling.patch"
+SRC_URI +=3D "file://no_shebang_mangling.patch \
+            file://CVE-2026-1703.patch \
+            "
=20
 SRC_URI[sha256sum] =3D "ea9bd1a847e8c5774a5777bb398c19e80bcd4e2aa16a4b301b=
718fe6f593aba2"
=20
--=20
2.34.1


