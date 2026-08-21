Return-Path: <jaipaul.cheernam@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 58D3FC5DF87
	for <webhook@archiver.kernel.org>; Fri, 21 Aug 2026 09:08:52 +0000 (UTC)
Received: from AM0PR02CU008.outbound.protection.outlook.com (AM0PR02CU008.outbound.protection.outlook.com [52.101.72.67])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.3626.1787303323475631503
 for <openembedded-core@lists.openembedded.org>;
 Fri, 21 Aug 2026 02:08:43 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=V1oR15Wa;
 spf=pass (domain: est.tech, ip: 52.101.72.67, mailfrom: jaipaul.cheernam@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=V0tT86a01+ynRee5chXt2RA5pjmth3HwcN5C7rO/5G4PbZkOiu+zCUWhHI5ex2tVntA0DB5C1BpAt00eJFTO53GIBm2kbsQcJNrPCwhtVllp1x+Z1QqLswyMfXwwYWX4acRZOawbxTWJ0XqPa6MKdFzOqbzWxQ3QMNJx6yTDQRbhTeEd60AdcOopEWZ1azYpbeUBEjVy/+hXQUFw3GbtUc/7PXrlWLsEFj2vog8LoA2KoBE3ZB16tHrHXxVdd5Z9KIqIAAUH1FNDba04LVCgBhjiDRt8HJU6wFIT9lmg77nEApRL6CW/mi/u8BlU0/Cd6kdFL+unXZjKQ/fBwh/CyA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=03eE/GcnmqM1UgpbvxWxvJyucX/qpVHxXw9HJHwOZHc=;
 b=vALMgK0q8yM3HdnOKwF7p4ZOQk9Ea7BsZul0iI06SF5sazKqQdREw7f8RkrFsjmMWFnSjk5igAxGEs/SCEsRuR6+cZAMEfho1K81NB7nhT1BLAu+Hdq1lWTkCpAX7NMDdY4jXrCFe6XH6pa9E/YPXfZEQCUMY3qtkJlPjIy4K4PCwHYQsp5tWewJdJUlsDGGrdEb5upuirAAsBmRvj2MT6w37WPJ6lWOrI2/kG7P/hqRg89GdcDn9uch7N71+xHz7TRi1ySWSEVistIg9tRe+XnIV6OtRHy6/mbsLkY8N5/Mc4b+KBVYCE6FDHwP826ZWOhofigiRX9jo9ShUbJDdg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=03eE/GcnmqM1UgpbvxWxvJyucX/qpVHxXw9HJHwOZHc=;
 b=V1oR15WaMI0wiOhNw/Q/WjPyqIlP+/pwiTl4kTSI77Bsdi4CB0HyH/esFksgvZtYNrXrEXOIzLmo+UahA7YdDUSehagyoO/1lmkrbme0ktj3ZwfiWHT/EyE/6SB/nTNThub4yGGnDr1cSqfNAeszvLhPOwtIxV8p/bLxom8RvpwF8BY+cwxCJQjaBuE1nemctCHyHYNQImxAdh2uumhDVYKMiIpjZ9CMytmLG5jWK6ESsv8tYXexaH/5YO8eN4VD73eS0YuwqnFwMMs4pJFXbQ/1gQVKYCkJec2/iQZym1WTn7iQoEMmLDPDihDiP7nWg+55GIi3MM0jqB1gY8onIA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM (2603:10a6:18:3::ad4)
 by PA3P189MB3366.EURP189.PROD.OUTLOOK.COM (2603:10a6:102:4b7::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.3; Fri, 21 Aug
 2026 09:08:38 +0000
Received: from DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
 ([fe80::7ab2:c6af:6760:5c85]) by DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
 ([fe80::7ab2:c6af:6760:5c85%7]) with mapi id 15.21.0360.003; Fri, 21 Aug 2026
 09:08:38 +0000
From: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap][PATCH v2] systemd: Fix CVE-2026-29111
Date: Fri, 21 Aug 2026 11:08:37 +0200
Message-ID: <20260821090837.79383-1-jaipaul.cheernam@est.tech>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: DUZPR01CA0055.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:469::19) To DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:18:3::ad4)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU7PPF66507B2D7:EE_|PA3P189MB3366:EE_
X-MS-Office365-Filtering-Correlation-Id: f28777e1-abd2-424a-230d-08deff63c9d7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|1800799024|376014|23010399003|18002099003|13003099007|56012099006|11063799006|10067099003;
X-Microsoft-Antispam-Message-Info: 
	8Km91SKQDuzJKiuRHoGGsE0ZyMkjTIrUTKqSpmI0g3zvU6z09hJJxKZl4hNtMcVl2tv27KIBQsyJua/O+pggXgc+u6+uzGkQ84CQ4ChJ/GKAIDnNYHAJddrz8E8wMnsXOfTdiqvpyemUjqtgZ28f2kDGLZcbq8bmDjq+c/PnTUrteKhkRloiJNyM4oKFJ2sFqn7xY0oBJqIN+4/RJPpGfYJfjylH/jYjR1NcPyOqpXLPsd2YQig1AluAUjmiG2LBxRzY02iN96yyvExhxiqolW3qAiGjpxJ5RTk4WiBxuzEjznF3+Lx7/rHSGwTxTcxYsMjs1uBivqNG89YtnGnZYlDy//HE9xHO5tShaWvAs8uVpJx9RWnjixyrIU4XYu828KegOktKUWMapBNm6GMgjqyaTIgBSah0K1/aCeP4sRRQC+uMpk6viEvMHqxLs1DcSZEz1fZWQZ2x5HKECwfDXR6ZEs+IjF2MBd2XjAVWox8AUIfJgmH5LFuGwrrHnRQpV1+RFj97otuBlFFCh5LQJTxVWl4CcPX7GpVEs9bqD1OL9ZXKIGmzS+ulx85pNDLSljAidoefOk/yar5GehRdr3hIEwcMiGp4+LKQkJol8ZcihECnn0ELUG0dq8GM6IGuv3/sm57EPbN/oUQwJb+4ESfFsd4+oYzJ8IcH/54UE00=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(23010399003)(18002099003)(13003099007)(56012099006)(11063799006)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?+MFKB2bIVx+VNvdgOOA+dNFQzdvPt7aSJ4tdaZQJYsXXboisKk1NEMjGrvlM?=
 =?us-ascii?Q?6lhO/ztnyRp42pP+viu0wYHuJZjEoc2Co/WOtcKqbgT4vu+gTjK1GyEZSBE/?=
 =?us-ascii?Q?6IUr37XmutsRnSClrgfsvLFns+pNuBI4ZOkavPOuentYzfgwLlXaCnzBNRxb?=
 =?us-ascii?Q?D2xR7kyUxIVYswbRFCpfdOvCC6ih1zNmRt4WtLlGVwTTAoq1u1FoEjAo/jnQ?=
 =?us-ascii?Q?8ttQCZCLV45KhQQyADCS/msUeIXr5lLu+wf0GG63hocJ182tjgB2yASiYqlQ?=
 =?us-ascii?Q?s3+zU6sq623eNwU4KHowS2hoX7L3RehkzeNBJtes4dpGESULgissiDv3cOH2?=
 =?us-ascii?Q?HbqxSQwSvkHc8EG6H2hYf72Hr9fOCz934Sm6OfWcpETRmt3BNkCtkGpVs+O4?=
 =?us-ascii?Q?mzfEkTOGa/3VRdgigbXGAeh4tEK3KfMeKBnqIOS5c1EhB/ElDaYKrjBSDGXI?=
 =?us-ascii?Q?yXFGSEd2uvoxQj5ClK+oEthTUmgyMlnpQXPtMYpLD0iWbNrZhA3OeVTlvvNF?=
 =?us-ascii?Q?ugfwwa0EVh882YL9krVN0lQP3TJEPgeBPR3ZtEmYqxyJhIONeI/TodPeCp6X?=
 =?us-ascii?Q?WZ/ZKnu0C27O/lNbCMtvl+063ZhxGygvMKwDLCvMxapD0wrdufY4/hbMApq4?=
 =?us-ascii?Q?IllV5FL2rnfgTuT8dAgTR8CeeLU5r5rkt5Z8K2alh1a5JzoOnQLW50/arbHD?=
 =?us-ascii?Q?SAnAjKhmuZ/e2Vz2Kiut33LCZ7bb/XA1Nh8igwS3foXrHFrs+LN8Dqh17CZy?=
 =?us-ascii?Q?7/WoFrcXsYwIhaWvEdRzEh3DmDHHsiBCzsijRzk7zbK+V3+qxHfDnnvk8U7i?=
 =?us-ascii?Q?+baGpeEQXVVXIcdsAOsLyQe33LY+zuAwWv1i8GGAJGMz4IsvQU6nSP6EGTAv?=
 =?us-ascii?Q?EI+GbCdaSOtIBBsJF8clM8IcEiu/F8tPYscNKi7R0sELrcPJPlN+iDKSIFoE?=
 =?us-ascii?Q?/WwzdqCq2kQNf7oQkBBTW7GksWM7BTSPw8GaYBiNBVXvkD/oBfi1V6Y5TMQz?=
 =?us-ascii?Q?kwCsQBwascKRTqoMO7jEQ5mAEDr9mEguKd0HJzJeZxdqr//cGbdnKnniDt5W?=
 =?us-ascii?Q?ZHCGq2+2zm4FEvYOtYyYa3L4Onpl6SFX4PGlwAonlci5kgtmYdYJ4Szd9U0u?=
 =?us-ascii?Q?84ttrtJPMKvH6x20dMNP92/MIK4s52hmK3PaIP/FQvV+LZ1aAKQTxH6kK3a6?=
 =?us-ascii?Q?uRBA7hFzwHYgHfCFStTSbipl4VG25/vf7Usm8RWKhdMYv4bvYYcWxr10LeV0?=
 =?us-ascii?Q?oyBQlv0i8I0AGujBHG6l9Te94ss89NklchFCCBofU0JLjmXADtoetHQrWKcN?=
 =?us-ascii?Q?qBz8Vq1w+e/CroESrhF76utAwkhpUWu3EghytbZ+3xK1SXZ0/oeiEsyd7HFj?=
 =?us-ascii?Q?2PFPoj8FBTlL8geJqY5/sBh6ghYFEKq4XL5MFZMHQkg3Bi/SREETBrQw7Op7?=
 =?us-ascii?Q?yOd0oSX0F9Y97KVvk6le3re5yxpVnmwXhoNrSqLPx1GQIv1MgS6+M4RtswzD?=
 =?us-ascii?Q?FL1JjckXXbcJUf1aGT630m+zHHfxYdO78pzRHarNiCkV0UkeIzf7VyPXmH+E?=
 =?us-ascii?Q?2AuWdx3BRSVs2Ctx45ZC/yVLRqqksJFZueqLedFNALpEsq6Xd9DZjgDFVbmH?=
 =?us-ascii?Q?UWfjVWKDsTkrYu7MeThSiMOyJRAwMGczCd8fr9xCc3+FSa+XL2aDPA/ZbuA2?=
 =?us-ascii?Q?LKG2AhPKiCyovuMtFg3U23+6mWFk2wm3N/ylch7lKoXTZ1CRD1FSIu5brdgC?=
 =?us-ascii?Q?zE9cR7emxzySzc0ncm+FkRgrfK6la88=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: f28777e1-abd2-424a-230d-08deff63c9d7
X-MS-Exchange-CrossTenant-AuthSource: DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Aug 2026 09:08:38.7850
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2d/+tPSRwPckgFJzt6S2pXxkAjfSFwgoBsvdpf5XFMoQB7fws1HpXNwBCEIOVdfky46fC8+FO/8gfaQL4Di4C2mLLIV6baQ7BlkjuH/XVDU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA3P189MB3366
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 21 Aug 2026 09:08:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/243907

Backport patches from upstream systemd to fix CVE-2026-29111, where
systemd (as PID 1) hits an assert and freezes execution when an
unprivileged IPC API call is made with spurious data.

Pick patches from [1], [2], [3] and [4] as referenced in [5].

Note: As scarthgap is using 255 version picked fixes from 257

[1] https://github.com/systemd/systemd/commit/20021e7686426052e3a7505425d7e=
12085feb2a6
[2] https://github.com/systemd/systemd/commit/7ac3220213690e8a8d6d2a6e81e43=
bd1dce01d69
[3] https://github.com/systemd/systemd/commit/21167006574d6b83813c7596759b4=
74f56562412
[4] https://github.com/systemd/systemd/commit/54588d2dedff54bfb603667082065=
0e4ea74628f
[5] https://security-tracker.debian.org/tracker/CVE-2026-29111

Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
---
Changes since v1:
  - Use Debian security tracker link instead of NVD as [5]
  - Simplify note in patch 03: removed confusing EINVAL/EOWNERDEAD
    explanation, only mention crt->cgroup_path vs u->cgroup_path difference

 .../systemd/systemd/CVE-2026-29111-01.patch   | 170 ++++++++++++++++++
 .../systemd/systemd/CVE-2026-29111-02.patch   |  85 +++++++++
 .../systemd/systemd/CVE-2026-29111-03.patch   | 106 +++++++++++
 .../systemd/systemd/CVE-2026-29111-04.patch   |  35 ++++
 meta/recipes-core/systemd/systemd_255.21.bb   |   4 +
 5 files changed, 400 insertions(+)
 create mode 100644 meta/recipes-core/systemd/systemd/CVE-2026-29111-01.pat=
ch
 create mode 100644 meta/recipes-core/systemd/systemd/CVE-2026-29111-02.pat=
ch
 create mode 100644 meta/recipes-core/systemd/systemd/CVE-2026-29111-03.pat=
ch
 create mode 100644 meta/recipes-core/systemd/systemd/CVE-2026-29111-04.pat=
ch

diff --git a/meta/recipes-core/systemd/systemd/CVE-2026-29111-01.patch b/me=
ta/recipes-core/systemd/systemd/CVE-2026-29111-01.patch
new file mode 100644
index 0000000000..4f6ef76aa9
--- /dev/null
+++ b/meta/recipes-core/systemd/systemd/CVE-2026-29111-01.patch
@@ -0,0 +1,170 @@
+From 284fd279f9e9c199982aea51aee59a02e90a2eda Mon Sep 17 00:00:00 2001
+From: Lennart Poettering <lennart@poettering.net>
+Date: Mon, 19 May 2025 12:58:52 +0200
+Subject: [PATCH 1/4] path-util: add flavour of path_startswith() that leav=
es a
+ leading slash in place
+
+(cherry picked from commit ee19edbb9f3455db3f750089082f3e5a925e3a0c)
+
+Note: The test uses assert_se(streq_ptr()) instead of the upstream
+ASSERT_STREQ() macro because ASSERT_STREQ was introduced in systemd v256
+and is not available in v255.
+
+CVE: CVE-2026-29111
+Upstream-Status: Backport [https://github.com/systemd/systemd/commit/20021=
e7686426052e3a7505425d7e12085feb2a6]
+Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
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
+                 assert(*slash =3D=3D '/');
+                 *slash =3D '\0';
+=20
+-                if (path_startswith_full(stop, p, /* accept_dot_dot=3D */=
 false))
++                if (path_startswith_full(stop, p, /* flags=3D */ 0))
+                         return 0;
+=20
+                 if (rmdir(p) < 0 && errno !=3D ENOENT)
+diff --git a/src/basic/mkdir.c b/src/basic/mkdir.c
+index c770e5ed32..7bc73361a5 100644
+--- a/src/basic/mkdir.c
++++ b/src/basic/mkdir.c
+@@ -155,7 +155,7 @@ int mkdir_parents_internal(const char *prefix, const c=
har *path, mode_t mode, ui
+         assert(_mkdirat !=3D mkdirat);
+=20
+         if (prefix) {
+-                p =3D path_startswith_full(path, prefix, /* accept_dot_do=
t=3D */ false);
++                p =3D path_startswith_full(path, prefix, /* flags=3D */ 0=
);
+                 if (!p)
+                         return -ENOTDIR;
+         } else
+diff --git a/src/basic/path-util.c b/src/basic/path-util.c
+index 6810bf66aa..e73f5d708e 100644
+--- a/src/basic/path-util.c
++++ b/src/basic/path-util.c
+@@ -403,8 +403,8 @@ char* path_simplify_full(char *path, PathSimplifyFlags=
 flags) {
+         return path;
+ }
+=20
+-char* path_startswith_full(const char *path, const char *prefix, bool acc=
ept_dot_dot) {
+-        assert(path);
++char* path_startswith_full(const char *original_path, const char *prefix,=
 PathStartWithFlags flags) {
++        assert(original_path);
+         assert(prefix);
+=20
+         /* Returns a pointer to the start of the first component after th=
e parts matched by
+@@ -417,28 +417,45 @@ char* path_startswith_full(const char *path, const c=
har *prefix, bool accept_dot
+          * Returns NULL otherwise.
+          */
+=20
++        const char *path =3D original_path;
++
+         if ((path[0] =3D=3D '/') !=3D (prefix[0] =3D=3D '/'))
+                 return NULL;
+=20
+         for (;;) {
+                 const char *p, *q;
+-                int r, k;
++                int m, n;
+=20
+-                r =3D path_find_first_component(&path, accept_dot_dot, &p=
);
+-                if (r < 0)
++                m =3D path_find_first_component(&path, FLAGS_SET(flags, P=
ATH_STARTSWITH_ACCEPT_DOT_DOT), &p);
++                if (m < 0)
+                         return NULL;
+=20
+-                k =3D path_find_first_component(&prefix, accept_dot_dot, =
&q);
+-                if (k < 0)
++                n =3D path_find_first_component(&prefix, FLAGS_SET(flags,=
 PATH_STARTSWITH_ACCEPT_DOT_DOT), &q);
++                if (n < 0)
+                         return NULL;
+=20
+-                if (k =3D=3D 0)
+-                        return (char*) (p ?: path);
++                if (n =3D=3D 0) {
++                        if (!p)
++                                p =3D path;
++
++                        if (FLAGS_SET(flags, PATH_STARTSWITH_RETURN_LEADI=
NG_SLASH)) {
++
++                                if (p <=3D original_path)
++                                        return NULL;
++
++                                p--;
++
++                                if (*p !=3D '/')
++                                        return NULL;
++                        }
++
++                        return (char*) p;
++                }
+=20
+-                if (r !=3D k)
++                if (m !=3D n)
+                         return NULL;
+=20
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
+ int path_make_relative_parent(const char *from_child, const char *to, cha=
r **ret);
+-char* path_startswith_full(const char *path, const char *prefix, bool acc=
ept_dot_dot) _pure_;
++
++typedef enum PathStartWithFlags {
++        PATH_STARTSWITH_ACCEPT_DOT_DOT       =3D 1U << 0,
++        PATH_STARTSWITH_RETURN_LEADING_SLASH =3D 1U << 1,
++} PathStartWithFlags;
++
++char* path_startswith_full(const char *path, const char *prefix, PathStar=
tWithFlags flags) _pure_;
+ static inline char* path_startswith(const char *path, const char *prefix)=
 {
+-        return path_startswith_full(path, prefix, true);
++        return path_startswith_full(path, prefix, PATH_STARTSWITH_ACCEPT_=
DOT_DOT);
+ }
+=20
+ int path_compare(const char *a, const char *b) _pure_;
+diff --git a/src/test/test-path-util.c b/src/test/test-path-util.c
+index f5a425689a..71056b08c1 100644
+--- a/src/test/test-path-util.c
++++ b/src/test/test-path-util.c
+@@ -754,6 +754,22 @@ TEST(path_startswith) {
+         test_path_startswith_one("/foo/bar/barfoo/", "/fo", NULL, NULL);
+ }
+=20
++static void test_path_startswith_return_leading_slash_one(const char *pat=
h, const char *prefix, const char *expected) {
++        const char *p;
++
++        log_debug("/* %s(%s, %s) */", __func__, path, prefix);
++
++        p =3D path_startswith_full(path, prefix, PATH_STARTSWITH_RETURN_L=
EADING_SLASH);
++        assert_se(streq_ptr(p, expected));
++}
++
++TEST(path_startswith_return_leading_slash) {
++        test_path_startswith_return_leading_slash_one("/foo/bar", "/", "/=
foo/bar");
++        test_path_startswith_return_leading_slash_one("/foo/bar", "/foo",=
 "/bar");
++        test_path_startswith_return_leading_slash_one("/foo/bar", "/foo/b=
ar", NULL);
++        test_path_startswith_return_leading_slash_one("/foo/bar/", "/foo/=
bar", "/");
++}
++
+ static void test_prefix_root_one(const char *r, const char *p, const char=
 *expected) {
+         _cleanup_free_ char *s =3D NULL;
+         const char *t;
+--=20
+2.43.0
diff --git a/meta/recipes-core/systemd/systemd/CVE-2026-29111-02.patch b/me=
ta/recipes-core/systemd/systemd/CVE-2026-29111-02.patch
new file mode 100644
index 0000000000..9ab94000e6
--- /dev/null
+++ b/meta/recipes-core/systemd/systemd/CVE-2026-29111-02.patch
@@ -0,0 +1,85 @@
+From ed86ee8a7cc82fe1c68e3fb17be71c9c8e62ca87 Mon Sep 17 00:00:00 2001
+From: Lennart Poettering <lennart@poettering.net>
+Date: Fri, 23 May 2025 06:45:40 +0200
+Subject: [PATCH 2/4] path-util: invert PATH_STARTSWITH_ACCEPT_DOT_DOT flag
+
+As requested: https://github.com/systemd/systemd/pull/37572#pullrequestrev=
iew-2861928094
+
+(cherry picked from commit ceed11e465f1c8efff1931412a85924d9de7c08d)
+
+CVE: CVE-2026-29111
+Upstream-Status: Backport [https://github.com/systemd/systemd/commit/7ac32=
20213690e8a8d6d2a6e81e43bd1dce01d69]
+Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
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
+                 assert(*slash =3D=3D '/');
+                 *slash =3D '\0';
+=20
+-                if (path_startswith_full(stop, p, /* flags=3D */ 0))
++                if (path_startswith_full(stop, p, PATH_STARTSWITH_REFUSE_=
DOT_DOT))
+                         return 0;
+=20
+                 if (rmdir(p) < 0 && errno !=3D ENOENT)
+diff --git a/src/basic/mkdir.c b/src/basic/mkdir.c
+index 7bc73361a5..8f14c47214 100644
+--- a/src/basic/mkdir.c
++++ b/src/basic/mkdir.c
+@@ -155,7 +155,7 @@ int mkdir_parents_internal(const char *prefix, const c=
har *path, mode_t mode, ui
+         assert(_mkdirat !=3D mkdirat);
+=20
+         if (prefix) {
+-                p =3D path_startswith_full(path, prefix, /* flags=3D */ 0=
);
++                p =3D path_startswith_full(path, prefix, PATH_STARTSWITH_=
REFUSE_DOT_DOT);
+                 if (!p)
+                         return -ENOTDIR;
+         } else
+diff --git a/src/basic/path-util.c b/src/basic/path-util.c
+index e73f5d708e..a65a5c32f6 100644
+--- a/src/basic/path-util.c
++++ b/src/basic/path-util.c
+@@ -426,11 +426,11 @@ char* path_startswith_full(const char *original_path=
, const char *prefix, PathSt
+                 const char *p, *q;
+                 int m, n;
+=20
+-                m =3D path_find_first_component(&path, FLAGS_SET(flags, P=
ATH_STARTSWITH_ACCEPT_DOT_DOT), &p);
++                m =3D path_find_first_component(&path, !FLAGS_SET(flags, =
PATH_STARTSWITH_REFUSE_DOT_DOT), &p);
+                 if (m < 0)
+                         return NULL;
+=20
+-                n =3D path_find_first_component(&prefix, FLAGS_SET(flags,=
 PATH_STARTSWITH_ACCEPT_DOT_DOT), &q);
++                n =3D path_find_first_component(&prefix, !FLAGS_SET(flags=
, PATH_STARTSWITH_REFUSE_DOT_DOT), &q);
+                 if (n < 0)
+                         return NULL;
+=20
+diff --git a/src/basic/path-util.h b/src/basic/path-util.h
+index e0ec05f4db..11a1078df9 100644
+--- a/src/basic/path-util.h
++++ b/src/basic/path-util.h
+@@ -55,13 +55,13 @@ int path_make_relative(const char *from, const char *t=
o, char **ret);
+ int path_make_relative_parent(const char *from_child, const char *to, cha=
r **ret);
+=20
+ typedef enum PathStartWithFlags {
+-        PATH_STARTSWITH_ACCEPT_DOT_DOT       =3D 1U << 0,
++        PATH_STARTSWITH_REFUSE_DOT_DOT       =3D 1U << 0,
+         PATH_STARTSWITH_RETURN_LEADING_SLASH =3D 1U << 1,
+ } PathStartWithFlags;
+=20
+ char* path_startswith_full(const char *path, const char *prefix, PathStar=
tWithFlags flags) _pure_;
+ static inline char* path_startswith(const char *path, const char *prefix)=
 {
+-        return path_startswith_full(path, prefix, PATH_STARTSWITH_ACCEPT_=
DOT_DOT);
++        return path_startswith_full(path, prefix, 0);
+ }
+=20
+ int path_compare(const char *a, const char *b) _pure_;
+--=20
+2.43.0
diff --git a/meta/recipes-core/systemd/systemd/CVE-2026-29111-03.patch b/me=
ta/recipes-core/systemd/systemd/CVE-2026-29111-03.patch
new file mode 100644
index 0000000000..8b9b4d4075
--- /dev/null
+++ b/meta/recipes-core/systemd/systemd/CVE-2026-29111-03.patch
@@ -0,0 +1,106 @@
+From 7a1749753b4853866f90ef25d48192e4d1563543 Mon Sep 17 00:00:00 2001
+From: Mike Yuan <me@yhndnzj.com>
+Date: Thu, 26 Feb 2026 11:06:00 +0100
+Subject: [PATCH 3/4] core/cgroup: avoid one unnecessary strjoina()
+
+(cherry picked from commit 42aee39107fbdd7db1ccd402a2151822b2805e9f)
+(cherry picked from commit 80acea4ef80a4bb78560ed970c34952299b890d6)
+(cherry picked from commit b5fd14693057e5f2c9b4a49603be64ec3608ff6c)
+
+Note: This backport uses u->cgroup_path directly instead of the upstream
+CGroupRuntime *crt / crt->cgroup_path pattern because the CGroupRuntime
+struct was introduced in systemd v256 (commit 1d9cc876). In v255, the
+cgroup_path is still a direct member of the Unit struct.
+
+CVE: CVE-2026-29111
+Upstream-Status: Backport [https://github.com/systemd/systemd/commit/21167=
006574d6b83813c7596759b474f56562412]
+Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
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
+=20
+-static int unit_attach_pid_to_cgroup_via_bus(Unit *u, pid_t pid, const ch=
ar *suffix_path) {
++static int unit_attach_pid_to_cgroup_via_bus(Unit *u, const char *cgroup_=
path, pid_t pid) {
+         _cleanup_(sd_bus_error_free) sd_bus_error error =3D SD_BUS_ERROR_=
NULL;
+-        char *pp;
+         int r;
+=20
+         assert(u);
++        assert(cgroup_path);
++        assert(pid_is_valid(pid));
+=20
+         if (MANAGER_IS_SYSTEM(u->manager))
+                 return -EINVAL;
+@@ -2581,17 +2582,13 @@ static int unit_attach_pid_to_cgroup_via_bus(Unit =
*u, pid_t pid, const char *suf
+         if (!u->manager->system_bus)
+                 return -EIO;
+=20
+-        if (!u->cgroup_path)
+-                return -EINVAL;
+-
+         /* Determine this unit's cgroup path relative to our cgroup root =
*/
+-        pp =3D path_startswith(u->cgroup_path, u->manager->cgroup_root);
++        const char *pp =3D path_startswith_full(cgroup_path,
++                                              u->manager->cgroup_root,
++                                              PATH_STARTSWITH_RETURN_LEAD=
ING_SLASH|PATH_STARTSWITH_REFUSE_DOT_DOT);
+         if (!pp)
+                 return -EINVAL;
+=20
+-        pp =3D strjoina("/", pp, suffix_path);
+-        path_simplify(pp);
+-
+         r =3D bus_call_method(u->manager->system_bus,
+                             bus_systemd_mgr,
+                             "AttachProcessesToUnit",
+@@ -2630,8 +2627,10 @@ int unit_attach_pids_to_cgroup(Unit *u, Set *pids, =
const char *suffix_path) {
+                 return r;
+=20
+         if (isempty(suffix_path))
+-                p =3D u->cgroup_path;
++                p =3D empty_to_root(u->cgroup_path);
+         else {
++                assert(path_is_absolute(suffix_path));
++
+                 joined =3D path_join(u->cgroup_path, suffix_path);
+                 if (!joined)
+                         return -ENOMEM;
+@@ -2649,7 +2648,7 @@ int unit_attach_pids_to_cgroup(Unit *u, Set *pids, c=
onst char *suffix_path) {
+                  * before we use it */
+                 r =3D pidref_verify(pid);
+                 if (r < 0) {
+-                        log_unit_info_errno(u, r, "PID " PID_FMT " vanish=
ed before we could move it to target cgroup '%s', skipping: %m", pid->pid, =
empty_to_root(p));
++                        log_unit_info_errno(u, r, "PID " PID_FMT " vanish=
ed before we could move it to target cgroup '%s', skipping: %m", pid->pid, =
p);
+                         continue;
+                 }
+=20
+@@ -2660,7 +2659,7 @@ int unit_attach_pids_to_cgroup(Unit *u, Set *pids, c=
onst char *suffix_path) {
+=20
+                         log_unit_full_errno(u, again ? LOG_DEBUG : LOG_IN=
FO,  r,
+                                             "Couldn't move process "PID_F=
MT" to%s requested cgroup '%s': %m",
+-                                            pid->pid, again ? " directly"=
 : "", empty_to_root(p));
++                                            pid->pid, again ? " directly"=
 : "", p);
+=20
+                         if (again) {
+                                 int z;
+@@ -2670,9 +2669,9 @@ int unit_attach_pids_to_cgroup(Unit *u, Set *pids, c=
onst char *suffix_path) {
+                                  * Since it's more privileged it might be=
 able to move the process across the
+                                  * leaves of a subtree whose top node is =
not owned by us. */
+=20
+-                                z =3D unit_attach_pid_to_cgroup_via_bus(u=
, pid->pid, suffix_path);
++                                z =3D unit_attach_pid_to_cgroup_via_bus(u=
, p, pid->pid);
+                                 if (z < 0)
+-                                        log_unit_info_errno(u, z, "Couldn=
't move process "PID_FMT" to requested cgroup '%s' (directly or via the sys=
tem bus): %m", pid->pid, empty_to_root(p));
++                                        log_unit_info_errno(u, z, "Couldn=
't move process "PID_FMT" to requested cgroup '%s' (directly or via the sys=
tem bus): %m", pid->pid, p);
+                                 else {
+                                         if (ret >=3D 0)
+                                                 ret++; /* Count successfu=
l additions */
+--=20
+2.43.0
diff --git a/meta/recipes-core/systemd/systemd/CVE-2026-29111-04.patch b/me=
ta/recipes-core/systemd/systemd/CVE-2026-29111-04.patch
new file mode 100644
index 0000000000..ebf2ba9d5b
--- /dev/null
+++ b/meta/recipes-core/systemd/systemd/CVE-2026-29111-04.patch
@@ -0,0 +1,35 @@
+From 0d2c41d0f024088a275ac0c02d50205c800dec8a Mon Sep 17 00:00:00 2001
+From: Mike Yuan <me@yhndnzj.com>
+Date: Thu, 26 Feb 2026 11:06:34 +0100
+Subject: [PATCH 4/4] core: validate input cgroup path more prudently
+
+(cherry picked from commit efa6ba2ab625aaa160ac435a09e6482fc63bdbe8)
+(cherry picked from commit 3cee294fe8cf4fa0eff933ab21416d099942cabd)
+(cherry picked from commit 1d22f706bd04f45f8422e17fbde3f56ece17758a)
+
+CVE: CVE-2026-29111
+Upstream-Status: Backport [https://github.com/systemd/systemd/commit/54588=
d2dedff54bfb6036670820650e4ea74628f]
+Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
+---
+ src/core/dbus-manager.c | 6 ++++++
+ 1 file changed, 6 insertions(+)
+
+diff --git a/src/core/dbus-manager.c b/src/core/dbus-manager.c
+index c7372ca033..cb84ba9866 100644
+--- a/src/core/dbus-manager.c
++++ b/src/core/dbus-manager.c
+@@ -646,6 +646,12 @@ static int method_get_unit_by_control_group(sd_bus_me=
ssage *message, void *userd
+         if (r < 0)
+                 return r;
+=20
++        if (!path_is_absolute(cgroup))
++                return sd_bus_error_setf(error, SD_BUS_ERROR_INVALID_ARGS=
, "Control group path is not absolute: %s", cgroup);
++
++        if (!path_is_normalized(cgroup))
++                return sd_bus_error_setf(error, SD_BUS_ERROR_INVALID_ARGS=
, "Control group path is not normalized: %s", cgroup);
++
+         u =3D manager_get_unit_by_cgroup(m, cgroup);
+         if (!u)
+                 return sd_bus_error_setf(error, BUS_ERROR_NO_SUCH_UNIT,
+--=20
+2.43.0
diff --git a/meta/recipes-core/systemd/systemd_255.21.bb b/meta/recipes-cor=
e/systemd/systemd_255.21.bb
index 9c5f8af240..e5a0fd9170 100644
--- a/meta/recipes-core/systemd/systemd_255.21.bb
+++ b/meta/recipes-core/systemd/systemd_255.21.bb
@@ -33,6 +33,10 @@ SRC_URI +=3D " \
            file://CVE-2026-40225-02.patch \
            file://CVE-2026-40226-01.patch \
            file://CVE-2026-40226-02.patch \
+           file://CVE-2026-29111-01.patch \
+           file://CVE-2026-29111-02.patch \
+           file://CVE-2026-29111-03.patch \
+           file://CVE-2026-29111-04.patch \
            "
=20
 # patches needed by musl

