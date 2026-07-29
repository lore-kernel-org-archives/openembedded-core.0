Return-Path: <leonid.iziumtsev@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 88482C53200
	for <webhook@archiver.kernel.org>; Wed, 29 Jul 2026 09:37:50 +0000 (UTC)
Received: from MRWPR03CU001.outbound.protection.outlook.com (MRWPR03CU001.outbound.protection.outlook.com [40.107.130.28])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.7639.1785317865068272335
 for <openembedded-core@lists.openembedded.org>;
 Wed, 29 Jul 2026 02:37:45 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=JK4nJSEE;
 spf=pass (domain: est.tech, ip: 40.107.130.28, mailfrom: leonid.iziumtsev@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wEOd7obcHrVTPeoVjQMhchEioIY0CD06GAr2LB/S9IgJVe7AbQqwjnfFWegxB7GplFTdUYfzoKtEbc5jyWfZIZRFRPFzKPCxCK3ADqcVGv6Tt+LST6NbW4buTsXh+Z0vppuT212t0Q3Thd1kmx0SJFzRlQ2Yb8jLXHbRNLpCq45Hh/jOKl4vEKE7ndkBjNmeQwYwJBciHlMZNYx8iUobF657V3fCLSpQbPMYLrclqvtEb1iJTjI45lCIKw6YBWJnkfaRxKrNwhuKwCC7uK+b8GLAofpu6p454AWhb7HIaLWmghILSe+hx4aZUS6oFw7vpLGmcL1ElnrFhueR9merzQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DwZE2EC/lVLNL1gIlUGv4nXkjkEGly3jCX4CTtrcfhU=;
 b=Ocecvlzwzm1ZX7wnDKFzPZymcwOfKahxH6vfUD5qaEiH+VAA3gs1kIJD/nNrX4Rt5yLIGFTQWA2gKv2S55p03itCWbIAue6zQgki6ghdRgeHCHaPKObuyYkjFf9XE5u3dYSggcTcizfwUR/8MbC9v1S0wfB+TqUbm8qsOQyubQSVe0J3+hAwOShUEmfEgmy4ujj3gTWk6DC51kLW2q0NmBHefy/rz6uvwRrviihLX0Ipp6nh9V0UFfLyPnFtIBT55Je2CJE1DmEhV1S88CziAK9UftwG6zjvjXBrZzNcnYQ4aCNibYk0/t+9dL9/5teqQPje78uECd3Ga4R0r9nzeQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DwZE2EC/lVLNL1gIlUGv4nXkjkEGly3jCX4CTtrcfhU=;
 b=JK4nJSEE8gT4eCFJ84USw3MN+BBM/TMFIXW/FspQselE6W3AqT2bE4/sRMgdshU7QXdEydnQVZsV7GMWZKEABcfydw4DidYe3MJ+yfvKQitdXkstThLrywsuPFJqckLVZVZbA6BX47z5D9duTJOR/6c2TT0h3pKOQe+ib4lDsOGfu4aBvKurRSRNbBs3LkajWIcnCM3K7jD5wpMjEdLo5oTugi9DufrrYocjOaUat2uynWQmVmMwQcMGOm0In6m+eEO6Ii+nCd/WMK6OW+qskuzAyhWU7+7N/Kc4TZsBV0zR7SqE2fuPFXmXwv2WORuRj4s5nx3abepD9hQhv45HMQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from AM9P189MB1731.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:2ff::18)
 by PA3P189MB3367.EURP189.PROD.OUTLOOK.COM (2603:10a6:102:4b7::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.12; Wed, 29 Jul
 2026 09:37:41 +0000
Received: from AM9P189MB1731.EURP189.PROD.OUTLOOK.COM
 ([fe80::a809:5156:7172:6c1f]) by AM9P189MB1731.EURP189.PROD.OUTLOOK.COM
 ([fe80::a809:5156:7172:6c1f%4]) with mapi id 15.21.0292.005; Wed, 29 Jul 2026
 09:37:41 +0000
From: Leonid Iziumtsev <leonid.iziumtsev@est.tech>
To: openembedded-core@lists.openembedded.org
CC: Leonid Iziumtsev <leonid.iziumtsev@est.tech>
Subject: [OE-core][scarthgap][PATCH] python3: fix CVE-2026-4360
Date: Wed, 29 Jul 2026 11:37:26 +0200
Message-ID: <20260729093726.426192-1-leonid.iziumtsev@est.tech>
X-Mailer: git-send-email 2.53.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: DU2PR04CA0183.eurprd04.prod.outlook.com
 (2603:10a6:10:28d::8) To AM9P189MB1731.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:20b:2ff::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM9P189MB1731:EE_|PA3P189MB3367:EE_
X-MS-Office365-Filtering-Correlation-Id: 2c62710f-5ae4-40da-87a3-08deed5508c7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|23010399003|1800799024|10070799003|376014|366016|3023799007|6133799003|11063799006|12006099003|10067099003|56012099006|18002099003|13003099007;
X-Microsoft-Antispam-Message-Info: 
	v+ngEH74NKV+H6ZS/N3w8eqwj7gmTVQynnbnaEQjxHwxxgGiwnw4IK84Uqppl7aOuw735MZtYGbzZ2QSrNLb2UAOkSRQvPrBy3eLXxBkh1bZXJwnWP+SoEjFHI/j6JblN4jEqgnjqbBOLNd2BZ6eS8er9UcLJmoAZ0CqHpfr0mVwKA5lhTRLPbikAtypnut+wJjljN0RP9kC6SnDsxVxXmkN7lXOFRzj5VfhLgEFyNA6+YOR9+V/pDU4VoJFyFD5JESRFNccHKT2ueuiKEhwjTGpSrODhorlwG/vnKYkiIGVYlb+dkDfthoKEzh/iWpHgSmtpo8TP+GYfVrCXGUsrPzqE1IG8OYi+KjT7FwgMAp6ln3g6d1g8Jk2xHNGvVYiEotiGLPlmp2AZTNl7/boA3XkJjC34Y5RiPMjTGO+HDEGKz5zG7sw21o9JZg/JYDLZ3KJn8nm4YwgPaDo7g/lhMjPDBItOZR7nHqo7NM436uoqHuM0XTM/rGrLF4+x6B9HLl3bOcYJHlb0guOeP7HdRx7SZmY7zpOIuu0RaLYnJHwsVhdtlreaeUjwo61EZ3UlP09zd6YFmjckaDbQt0dh2JoeUxm5PTqBbzLrwOJCTwgWFY5yCj5Qph3+OezZ90r8na/gvYnAw29LedWY5Y/MVnvuCyfTcUNc/ej7NTNL50=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9P189MB1731.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(10070799003)(376014)(366016)(3023799007)(6133799003)(11063799006)(12006099003)(10067099003)(56012099006)(18002099003)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?j10iSPle9PETNEhfKCdoHM3NKs/PRQKMAxhodVmyV7c6W4QYgvQPcdeBBUU2?=
 =?us-ascii?Q?0ebGUYvHKivnTNTE4dOodJTXVNLG4smeNsbqKuCSVbqiEQ3EggivaobiSHJ+?=
 =?us-ascii?Q?1vcFMcqmVKIy3Skui6Qk8hPKurNiJEkBOVYB2IY5KnkKT9TcaUc12YFSRwXv?=
 =?us-ascii?Q?oRO9haHSZTk1Gjg7/hK9qv3/+OL3tyfErbvaleYQaPJ74DUmNkwAsYuIx0Nu?=
 =?us-ascii?Q?tcNzddL/naJoxAPhfOLahiNL7I251paE77iQicSlMD5ZASzhiZrpGgFR8VJK?=
 =?us-ascii?Q?8MyYaC4ICFmSB1txG/CFWT0G2tMLHQpfCoQ/Is0qJVz/J33NdIVp/5UdGTpJ?=
 =?us-ascii?Q?sidiewdf3OCnkq/AOT1O04yz+uvAq9WFTrpYlJXjNPpizUWazn1cyHKu2qoC?=
 =?us-ascii?Q?eT/42VeqasA3o6pzYAAg0nTLMTXue3QfZAIO4XDwcMeABUEYgkgvRqaBrOHl?=
 =?us-ascii?Q?cKBZ8sRZ6j/1Yp6IJKxAnClIkG724IBjuvCpqHG2qnC3o6ihIIwhjZkbYbVn?=
 =?us-ascii?Q?85wln+nh1dX2vVBrVSFqdMOR9tfln2TDfuux+isCyKPU5MUEZFVXJi7rgnaU?=
 =?us-ascii?Q?kCGNo/U7s+Mk/DogpkCSlQhrNNTOTSlLkzNGQ1ziMYypqdo/7cqKyDN8r3c/?=
 =?us-ascii?Q?3miu5xqjcbkriZ63uY0i9VFyVTN4ifHXg6p/+kHe5lK/NKSiq3Joq5CrXZkh?=
 =?us-ascii?Q?8nxnNUWza7yvb6J+i/ZeRBG1A2PsfhxkOJF5U7hKQLj7ENijaOGZJH9PjRk1?=
 =?us-ascii?Q?xw3s/5/1J1r+ravQbboBkwkRtfyaB94ipl5P8kdwMIT3Mw88KQ0UosL+g2X/?=
 =?us-ascii?Q?XZuKu+XZDMT4SDnbRbkCB/S7aCQc7UCxrBwJAxSl0G7R/kq8GPHsFMATKgpx?=
 =?us-ascii?Q?v3dqckTXSpLk3YsStLQYMm6PzOBtV3jWImWbcelQ3Gds8/b2uv+4ztJmSdRx?=
 =?us-ascii?Q?XR0eYFqJX37AxdviLOkPhAaZX17LZ5Wl5C/Ep7H1/9Bleogrg7WiGZvJcBR7?=
 =?us-ascii?Q?QaDpjx0BQZiCKWyDvm53ltwa3sZMt9O07fnf+QHJlfTFcCV+MtfmrIMR0bpe?=
 =?us-ascii?Q?EYNqQjcc5mw5yRoBp0JVaeenvf64gAliWPVzsmaWDxe2J+CzFhn/GAtMRRHU?=
 =?us-ascii?Q?AqLyiToSgqOpHudAPR/GUnfyEOoGLK+YhtJDJsDbIKNwbDJXCZbgTje3XMf+?=
 =?us-ascii?Q?dJLs0irsO10ndc/cbgRgggf/gVXVPi7t8yirDruHafaD4noxlaxia5Cdk74S?=
 =?us-ascii?Q?0n36GYDpXTmNoiNHoC5hto9Ghqgbs1b1z9Gv7EwZqfSa0REIa7qbpVcm5MEg?=
 =?us-ascii?Q?NqzFyum7UMzS18tOBcRIt57AX2YdQVfjzjQtV/RRHwvqig+/OB6baQuj27FB?=
 =?us-ascii?Q?Vt3h+H5MXO8aAneQG3Ual/yDOipfQ9xzmuPhW8kGPNW+Iqn/sSsNPjCqNu52?=
 =?us-ascii?Q?OZ+nFjRACryrW2MipfpWLgfHF68qTsGugqLnnhAvFuybShAbE16n0Fe19M27?=
 =?us-ascii?Q?Irp6j6fJtC+8NZxAHrUYUmbyZWpa1zsW5uLECMbGyo0q12fsKtThKeDw/P/J?=
 =?us-ascii?Q?NhP7k3uBhuIw8nSxygU1s1S/RSHLdiBDslZNbW13t0FM1+ISsMMW4sWFtME9?=
 =?us-ascii?Q?VL11HSaeKEKBTkAJmwep5LBJqL/VFsPDI2X9yWQMbsbmwl4Pgx9f22pbnsnj?=
 =?us-ascii?Q?O34cVvwUC+XlPSksTzVVnDYnyWb7Le4xsY+QV2aqO2Lk1L9cTJAiZF00APpQ?=
 =?us-ascii?Q?UNfrpavR61AY80QaH2QWn3VwyYNfZS4ZiMug7CMAJZjotC8g2NZvtEVFJjtw?=
X-MS-Exchange-AntiSpam-MessageData-1: H5pawBJwgBy0nMHy9p8QfQoOqkmvjhTZcIk=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: 2c62710f-5ae4-40da-87a3-08deed5508c7
X-MS-Exchange-CrossTenant-AuthSource: AM9P189MB1731.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jul 2026 09:37:40.9598
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cm8xQdFHbi7xE2MbVohVQrZwX/Gs3IgboPfX7XGTkNP+2PVbjJ0sG0Azhn6mYJufRqycr51sLbrJVPw4KX9w5kdSsHMn+mHKiL6i023Gxnw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA3P189MB3367
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 29 Jul 2026 09:37:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/242266

Backport patch to fix CVE-2026-4360.

Reference:
  https://nvd.nist.gov/vuln/detail/CVE-2026-4360

Upstream fix:
  https://github.com/python/cpython/commit/eee3ddf0ca10283cc7fea724aae9cd86=
65f8d15e

Signed-off-by: Leonid Iziumtsev <leonid.iziumtsev@est.tech>
---
 .../python/python3/CVE-2026-4360.patch        | 148 ++++++++++++++++++
 .../python/python3_3.12.13.bb                 |   1 +
 2 files changed, 149 insertions(+)
 create mode 100644 meta/recipes-devtools/python/python3/CVE-2026-4360.patc=
h

diff --git a/meta/recipes-devtools/python/python3/CVE-2026-4360.patch b/met=
a/recipes-devtools/python/python3/CVE-2026-4360.patch
new file mode 100644
index 0000000000..8bd6dd4aa6
--- /dev/null
+++ b/meta/recipes-devtools/python/python3/CVE-2026-4360.patch
@@ -0,0 +1,148 @@
+From 4b86e2500b47a9f2b2ea9281e2826e828feff2a2 Mon Sep 17 00:00:00 2001
+From: "Miss Islington (bot)"
+ <31488909+miss-islington@users.noreply.github.com>
+Date: Mon, 29 Jun 2026 21:11:44 +0200
+Subject: [PATCH] gh-151987: Pass filter_function to `TarFile._extract_one(=
)`
+ during `.extract()` (GH-151988) (#152610)
+
+(cherry picked from commit 7ccdbaba2c54250a70d7f25632152df7655a5e0a)
+
+Co-authored-by: Petr Viktorin <encukou@gmail.com>
+Co-authored-by: Seth Michael Larson <seth@python.org>
+
+CVE: CVE-2026-4360
+Upstream-Status: Backport [https://github.com/python/cpython/commit/eee3dd=
f0ca10283cc7fea724aae9cd8665f8d15e]
+
+Signed-off-by: Leonid Iziumtsev <leonid.iziumtsev@est.tech>
+---
+ Lib/tarfile.py                                |  3 +-
+ Lib/test/test_tarfile.py                      | 92 +++++++++++++++++++
+ ...-06-23-14-19-30.gh-issue-151987.8mNIMf.rst |  2 +
+ 3 files changed, 96 insertions(+), 1 deletion(-)
+ create mode 100644 Misc/NEWS.d/next/Security/2026-06-23-14-19-30.gh-issue=
-151987.8mNIMf.rst
+
+diff --git a/Lib/tarfile.py b/Lib/tarfile.py
+index 59d3f6e..4c70fd9 100755
+--- a/Lib/tarfile.py
++++ b/Lib/tarfile.py
+@@ -2381,7 +2381,8 @@ class TarFile(object):
+         tarinfo, unfiltered =3D self._get_extract_tarinfo(
+             member, filter_function, path)
+         if tarinfo is not None:
+-            self._extract_one(tarinfo, path, set_attrs, numeric_owner)
++            self._extract_one(tarinfo, path, set_attrs, numeric_owner,
++                              filter_function=3Dfilter_function)
+=20
+     def _get_extract_tarinfo(self, member, filter_function, path):
+         """Get (filtered, unfiltered) TarInfos from *member*
+diff --git a/Lib/test/test_tarfile.py b/Lib/test/test_tarfile.py
+index 759fa03..d8e8051 100644
+--- a/Lib/test/test_tarfile.py
++++ b/Lib/test/test_tarfile.py
+@@ -4135,6 +4135,98 @@ class TestExtractionFilters(unittest.TestCase):
+                     st_mode =3D cc.outerdir.stat().st_mode
+                     self.assertNotEqual(st_mode & 0o777, 0o777)
+=20
++    @symlink_test
++    @unittest.skipUnless(hasattr(os, 'chown'), "missing os.chown")
++    @unittest.skipUnless(hasattr(os, 'lchown'), "missing os.lchown")
++    @unittest.skipUnless(hasattr(os, 'geteuid'), "missing os.geteuid")
++    @support.subTests('link_type', (tarfile.SYMTYPE, tarfile.LNKTYPE))
++    def test_chown_links_on_extract(self, link_type):
++        with ArchiveMaker() as arc:
++            arc.add("test.txt",
++                    uid=3D1337, gid=3D1337, uname=3D"", gname=3D"", mode=
=3D'-rwxr-xr-x')
++            arc.add("link",
++                    type=3Dlink_type,
++                    linkname=3D'test.txt',
++                    uid=3D1337, gid=3D1337, uname=3D"", gname=3D"", mode=
=3D'-rwxr-xr-x')
++
++        with (
++            os_helper.temp_dir() as tmpdir,
++            arc.open() as tar,
++            unittest.mock.patch("os.chown") as mock_chown,
++            unittest.mock.patch("os.lchown") as mock_lchown,
++            unittest.mock.patch("os.geteuid") as mock_geteuid,
++        ):
++            # Set UID to 0 so chown() is attempted.
++            mock_geteuid.return_value =3D 0
++            tar.extract("link", path=3Dtmpdir, filter=3D'data')
++            extract_path =3D os.path.join(tmpdir, "link")
++
++            if link_type =3D=3D tarfile.SYMTYPE:
++                mock_chown.assert_not_called()
++                mock_lchown.assert_called_once_with(extract_path, -1, -1)
++            else:
++                mock_chown.assert_has_calls([
++                    unittest.mock.call(extract_path, -1, -1),
++                    unittest.mock.call(extract_path, -1, -1)
++                ])
++                mock_lchown.assert_not_called()
++
++    @symlink_test
++    @unittest.skipUnless(hasattr(os, 'chown'), "missing os.chown")
++    @unittest.skipUnless(hasattr(os, 'lchown'), "missing os.lchown")
++    @unittest.skipUnless(hasattr(os, 'geteuid'), "missing os.geteuid")
++    @support.subTests('link_type', (tarfile.SYMTYPE, tarfile.LNKTYPE))
++    def test_chown_links_on_extractall(self, link_type):
++        with ArchiveMaker() as arc:
++            arc.add("test.txt",
++                    uid=3D1337, gid=3D1337, uname=3D"", gname=3D"", mode=
=3D'-rwxr-xr-x')
++            arc.add("link",
++                    type=3Dlink_type,
++                    linkname=3D'test.txt',
++                    uid=3D1337, gid=3D1337, uname=3D"", gname=3D"", mode=
=3D'-rwxr-xr-x')
++
++        with (
++            os_helper.temp_dir() as tmpdir,
++            arc.open() as tar,
++            unittest.mock.patch("os.chown") as mock_chown,
++            unittest.mock.patch("os.lchown") as mock_lchown,
++            unittest.mock.patch("os.geteuid") as mock_geteuid,
++        ):
++            # Set UID to 0 so chown() is attempted.
++            mock_geteuid.return_value =3D 0
++            tar.extractall(path=3Dtmpdir, filter=3D'data')
++            extract_link_path =3D os.path.join(tmpdir, "link")
++            extract_file_path =3D os.path.join(tmpdir, "test.txt")
++
++            if link_type =3D=3D tarfile.SYMTYPE:
++                mock_chown.assert_called_once_with(extract_file_path, -1,=
 -1)
++                mock_lchown.assert_called_once_with(extract_link_path, -1=
, -1)
++            else:
++                mock_chown.assert_has_calls([
++                    unittest.mock.call(extract_file_path, -1, -1),
++                    unittest.mock.call(extract_link_path, -1, -1)
++                ])
++                mock_lchown.assert_not_called()
++
++    def test_extract_filters_target(self):
++        # Test that when extract() falls back to extracting (rather than
++        # linking) a hardlink target, it filters the target.
++        with ArchiveMaker() as arc:
++            arc.add("target")
++            arc.add("link", hardlink_to=3D"target")
++        def testing_filter(member, path):
++            if member.name =3D=3D 'target':
++                # target: set read-only
++                return member.replace(mode=3Dstat.S_IRUSR)
++            # link: don't overwrite the mode
++            return member.replace(mode=3DNone)
++        tempdir =3D pathlib.Path(TEMPDIR) / 'extract'
++        with os_helper.temp_dir(tempdir), arc.open() as tar:
++            tar.extract("link", path=3Dtempdir, filter=3Dtesting_filter)
++            path =3D tempdir / 'link'
++            if os_helper.can_chmod():
++                self.assertFalse(path.stat().st_mode & stat.S_IWUSR)
++
+     def test_link_fallback_normalizes(self):
+         # Make sure hardlink fallbacks work for non-normalized paths for =
all
+         # filters
+diff --git a/Misc/NEWS.d/next/Security/2026-06-23-14-19-30.gh-issue-151987=
.8mNIMf.rst b/Misc/NEWS.d/next/Security/2026-06-23-14-19-30.gh-issue-151987=
.8mNIMf.rst
+new file mode 100644
+index 0000000..9eea7b3
+--- /dev/null
++++ b/Misc/NEWS.d/next/Security/2026-06-23-14-19-30.gh-issue-151987.8mNIMf=
.rst
+@@ -0,0 +1,2 @@
++The :meth:`tarfile.TarFile.extract` method now applies the given filter w=
hen
++it extracts a link target from the archive as a fallback.
diff --git a/meta/recipes-devtools/python/python3_3.12.13.bb b/meta/recipes=
-devtools/python/python3_3.12.13.bb
index de174f7bfd..b5bafe6b3e 100644
--- a/meta/recipes-devtools/python/python3_3.12.13.bb
+++ b/meta/recipes-devtools/python/python3_3.12.13.bb
@@ -47,6 +47,7 @@ SRC_URI =3D "http://www.python.org/ftp/python/${PV}/Pytho=
n-${PV}.tar.xz \
            file://CVE-2026-11940.patch \
            file://CVE-2026-11972.patch \
            file://CVE-2026-9669.patch \
+           file://CVE-2026-4360.patch \
            "
=20
 SRC_URI:append:class-native =3D " \

