Return-Path: <david.partain@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6095CEF5872
	for <webhook@archiver.kernel.org>; Tue, 17 Feb 2026 13:22:56 +0000 (UTC)
Received: from GVXPR05CU001.outbound.protection.outlook.com (GVXPR05CU001.outbound.protection.outlook.com [52.101.83.6])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.11580.1771333717342812463
 for <openembedded-core@lists.openembedded.org>;
 Tue, 17 Feb 2026 05:08:37 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=cB9WL4vq;
 spf=pass (domain: est.tech, ip: 52.101.83.6, mailfrom: adarsh.jagadish.kamini@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=epgTejj7jbrZk82m3aIWTtzelVE9TegF3NzR2tndBhDBomLTk9WkR/A91uXxtQhMAAxX3xMvh9ym2a3O6UlomNY2NYyu+D7EuV3qJgVWU1d4SlH8HVS/wFVQF95qKcgXkqNuQJducu+0Zu6R/lL72pxh8A7iktf5yY/hX8wZf/56FurVHAVqEig+T3wy/6Q77mFvgRghxyTRf5qrw0Gk21vprDK4VAr8t0Dr5lO9eCo+x9iE2B9mX8T2tMCzdRQ9+wSrLtnZ0y2gvb9P3nY1H945knWXy00zP/1IueIjSMx2sduRZF4OLrEU9N8u716d56jDGRQTRZRnnKp87cpbew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=D38rlLxmeuHSQ+NPAzKjBdch/QTNQuwfSvek0oSHN58=;
 b=GcJcC7sswCUa6Kvt6acMl1GzmdCsBB6VP49wgW7RCH5VmTKcStCs2ysG1V04vKZiClGrHbHvqrtHMpCXYSoF5fUdfo3KZf7Mv9oL2n/E8ABChVrit3cw0WVylTt4OpjbmB36CMlFvA88gGhS8nrEeKpTS9thks8aiBrhuWGbTyqXy5M/lI9NH19zk8/eSO20sOhWg3jkxltKmJn9npeSydbELLRfxuAlwOXm1IhM2D8yER7jsTotCVZ2KNn9yzd2u7iphMTOUeOHBXMrXdZJoCdppNa0kDs7U5ieugCQvicPxW/ZHOWw31yq758uwMqQdEo41hRM4b+zRLPGDdf+Dw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=D38rlLxmeuHSQ+NPAzKjBdch/QTNQuwfSvek0oSHN58=;
 b=cB9WL4vqOyLdkYlY+KhR9x9ZlWWLFBqEwWS8lZfOI0pQOaGIRdItR62mri8kzj5ela0C8mXx0u3/lBRf7MNUSpKzQD3vWbGNmzNxSYUom8RldVpA+64w8lsVJZat030JBC/AXF+YTdUQvXonvVW/DvJwEc7AVyGwKH9S/PkEDJEA6VT3Kxzg351rVUXAFaac+5uaGVSOtDLgMxpA8esX5nd5DA64f8mYmgxPDBTgymeA0IxaP98Ti8cqhauSFHx0jUEy8eBnGIWPTs4meV+iDwOYcGUA7YQy67suqe0wxW5BO9g+XZ77CDaMoAVw+Ao9tLrsarFb1zT5kzq4WLj0Bg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from AM9P189MB1666.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:305::16)
 by VI0P189MB2726.EURP189.PROD.OUTLOOK.COM (2603:10a6:800:21b::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9611.16; Tue, 17 Feb
 2026 13:08:31 +0000
Received: from AM9P189MB1666.EURP189.PROD.OUTLOOK.COM
 ([fe80::806f:3b74:7216:3e92]) by AM9P189MB1666.EURP189.PROD.OUTLOOK.COM
 ([fe80::806f:3b74:7216:3e92%4]) with mapi id 15.20.9611.013; Tue, 17 Feb 2026
 13:08:31 +0000
From: "Adarsh Jagadish Kamini" <adarsh.jagadish.kamini@est.tech>
To: openembedded-core@lists.openembedded.org
CC: Adarsh Jagadish Kamini <adarsh.jagadish.kamini@est.tech>
Subject: [OE-core][scarthgap][PATCH v3] python3-pip: Backport fix CVE-2026-1703
Date: Tue, 17 Feb 2026 14:08:17 +0100
Message-ID: <20260217130823.393314-1-adarsh.jagadish.kamini@est.tech>
X-Mailer: git-send-email 2.43.0
X-ClientProxiedBy: DU2PR04CA0159.eurprd04.prod.outlook.com
 (2603:10a6:10:2b0::14) To AM9P189MB1666.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:20b:305::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM9P189MB1666:EE_|VI0P189MB2726:EE_
X-MS-Office365-Filtering-Correlation-Id: 72ddba65-2e08-4a7b-2272-08de6e25a615
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016|13003099007;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?0neyDCrOMhPtXcGZnnBJHsCJT4L0Scj2kq7wo+bxyEnsaAXXs6ySJaGRnmol?=
 =?us-ascii?Q?fs59u6ruEzKxWvnRwuDxDftHtkex9wAq3Ua/OKrBde4nS32fvrxXTVPyRULv?=
 =?us-ascii?Q?CZAeKPNq3dm7NPQ34w3zTkFpakrktKp3ZiwaywG6yevUuEGALICk4koVxj1k?=
 =?us-ascii?Q?qVteEfqhh45biJGbBixGWcS/+ClPAWq7hLI6xeS/txQvp7ml5wVXAEY2DKvZ?=
 =?us-ascii?Q?BrlkboFT0B9QfibCIKfXlrGT4PuQLj/nJQeW6IeFpII3mPxxrjk4EmRbM5wZ?=
 =?us-ascii?Q?tk6dgFsaj1ZRD0gBFVp3asDW1JttDOB5TAFjm6/j17aRAH/I8q9IqC4u8l3N?=
 =?us-ascii?Q?bKb2oa9N3KyqYDaJD+vxWltVj+s2H6Z3dfEaD566GkqhG8XD7TuRJnAZC6Vi?=
 =?us-ascii?Q?YnQx4yjo+e0O8eAQ4zncTc33I5PQju3NE/cuul+ZgE3M7Uu9I3YIt2779sL7?=
 =?us-ascii?Q?EF9SFe4diKbzWJHoG9V5QvWueGmhwQmvXowmYyWV1cC3C13RmK7NXjZVMFNz?=
 =?us-ascii?Q?yx5BkUwrO2DqN/HbjHpYMf4q7ElIOxy2/bMxsucwsQNau+PUdMg7azDrw3yv?=
 =?us-ascii?Q?BuQAnlL5VmJeWxFzJsDiBToLMvthdWG8wfujLfV0J7FtqgXitglXIz12xC8h?=
 =?us-ascii?Q?IVrwC63GGY0Aev1gZ5OypHdUS+eAbZpjcffWiRlsiFFHh/n/NDrOO9fHKn+N?=
 =?us-ascii?Q?thjJ+4NMxkcc1HA1whhXDX0vJAiEM813J5xcLhKCuoidNHdnuvZ/37Y/TtBb?=
 =?us-ascii?Q?aF0xgEPtZM3xxs6iDaxAGcHwM5hpCfBJcI0XN2ow8LXJUMLySqeZk4K2KxgA?=
 =?us-ascii?Q?hfrWyS46OLutgLhl+ENHciwBmNA/3Nk4eTwBOe8pRnTcEzl1m3uq8piBgeH2?=
 =?us-ascii?Q?pfmTAjhsRPpYZYM54DoSf4uKjHOi5Cli9LohUizJzCeFUq95PZKM7d8lHBzb?=
 =?us-ascii?Q?FOpnQUjRFE5D31YooBKJcm3cMQE0m8lN9+q0ZizEhV8aZfmEh3DmxF6tGD1k?=
 =?us-ascii?Q?bAZPkuWH7MgQx8iSPWiOAWlrAs77Boe2WQsr50s64sV8XUgUqgDfDIQ1FGKK?=
 =?us-ascii?Q?i8qOSvCFqtRxKrb2zEDINjOIBamsuzsxtCApOmGGSWOeOXdrYr5pysTLXWO/?=
 =?us-ascii?Q?+QIsXeIGCWS2B1i5+mDTPwpmle6di0dlWvc3z3iMGyhlQimVzbB11nWrzLb/?=
 =?us-ascii?Q?JHVRKjy67Jg1VHSu5KI3W/ZdtmKhQAvxHkYNwAghr+8HcTjMRUYxZQsyGyVm?=
 =?us-ascii?Q?jq54ywce/frrOTe9Jhq1kvK0f7zi4nnucszVBIdi/gD062U50/wh+r9Ryp8m?=
 =?us-ascii?Q?WfyWTZQm2KA8M8UqmoW4l9bnL1sTCxSLX1abb5SuOmaqGV1/OrGRPOwwzJ8G?=
 =?us-ascii?Q?gec9e6txfNfHJHvZBi20nU12h+qikhLgMeY0i9Y474bGUa/iZ6oNud006ZNW?=
 =?us-ascii?Q?2UUAks9tSz3za1eHzqEkxRCxNV+Y5C+vi3CWa3baub06UPhxu51yVVW0OEhj?=
 =?us-ascii?Q?zd4KzffAQ2hR3dVMHUEsrkp4TegBIIdsCIHgBHRVhk9yFkfNzkfk8meWTwnx?=
 =?us-ascii?Q?+ez13tQxhQQF4b7gAbQ=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9P189MB1666.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?5PWAFeXsgRm+rV5Vjl5LT+dlJS2W324EXPCU/WpvYHqRWE3Uxc6HXDIatr9L?=
 =?us-ascii?Q?ubsUKEQ5WVVFf8WY4Ba/zrIUmH3OR+GMno9Y1mvW9chDCfs5QiKPM3FUUQj7?=
 =?us-ascii?Q?wNCwNy25HqFQdzvVAw39sb7mSl5zTiggggzmfwJeMrFygrPMcZmL1//7rqZB?=
 =?us-ascii?Q?EFtGQJafNorxdmP/PNn2aPdsPV4sto2dukwOhBfROthesAnFqiQ/WnxdhN5y?=
 =?us-ascii?Q?AGX9s670FM5lHlccXfRU8DAY9twb4IUf5tYYEOGGPvteANbKjZsbSo3i3FTh?=
 =?us-ascii?Q?QoYqd+48PVTsGrey8+ob8hleC3bcnddSyHuRBuCYNi6bfk1ccbNnqGqX0V2e?=
 =?us-ascii?Q?krk0zX87TcIy0kcZ0I4l//Ic9IIfuWVxJB/Esvy9aaxJbJqq1uDQezjT800B?=
 =?us-ascii?Q?VVB0B95n4M9kJsSF76B9of/9m4cFZsFaO8dRsSgQx4OAtxVmsdXPJMMDYBgC?=
 =?us-ascii?Q?yqDoB0CaBCyyfw03UwPdetAc6sdYKLkx6KztoSDUCBxiBD2gf5AB0kFEIyi3?=
 =?us-ascii?Q?6Qn4scwfXJSZLTy8Z1qIJeqV5xooQ9Ib60wIeIc4URl/jqZLDCVdbtxLcsfr?=
 =?us-ascii?Q?3j3izQu3q91GbfmXmz/DxrphBnbUgUynap4SoXjstx35MudGDph3MYSFMeOy?=
 =?us-ascii?Q?m5C4e7l76VxjfE7hMwI8w/d/9Pc5uTRnyvdvKzZ29s5BgqFeRs1FmPf58xj1?=
 =?us-ascii?Q?CV/Rx+JhCDU/g1WdQnBshtdA+VKJ3Qud5LngZbz5nqLHNO2UGxNEs4gypB34?=
 =?us-ascii?Q?Gp6YUcaGZ//1LOqZLFJ5ZtwDNBFhGKVe7kbwpCqE2vIjBWQ7LHwvuqNL64rD?=
 =?us-ascii?Q?WXovsS1nc+aG3NNuLbCOpeGzsVDKuu1BxXE/iartH77aO2z95ax196VTlb7h?=
 =?us-ascii?Q?sDppNY/1AGH/J6PJUJdRSz74yh6Xt7Z7MpddV5pCfYymQiz4gApQHz2sl/s2?=
 =?us-ascii?Q?x86njmiF6S03/BeLbFgjIJzkD+Ki9OJI7MFXu5g4bxlQz7cPhD6VXYJwQ5Ev?=
 =?us-ascii?Q?M662WRhT1JffmUe9TS38NeLENLXjOXvApntVuXeqX685B3Z/I0vEEL3+XC/5?=
 =?us-ascii?Q?ZBleq1dwjAKNJSf3cBK0B/n6ZYc3G3jnGSfU+DpokXkeJYb4O9uCvDAP0p7v?=
 =?us-ascii?Q?vBXfi70g+6qMFJMex5/hYkjSrAUosdujPw0T0lnHXMtimVsAiWTLMAniv2Qo?=
 =?us-ascii?Q?Edfd9MHhVS0kVf99pI+xhMqecva71jDwVu7pMM9AnRoioFDiVpamoQw0SoZg?=
 =?us-ascii?Q?YXegnzQWdEZKcyHIYFXUCF9Hrb+diIpBhsmvpnZYcuTJJnmw78+aekTw6jhE?=
 =?us-ascii?Q?UZ6iyHYuugi6rSZcchkPlw+M0QlTBjLWOG9SGOwRyLaUaw94XQAp7b4fjP3D?=
 =?us-ascii?Q?vEeDciQe9weMYj3zH3nljByQ3c6m8hG+OmAeYnsc9ND01BkoO7biyqNPTTlS?=
 =?us-ascii?Q?sZftfd+2yMTyxivnHaEszVkFvRoHWF9TwSLPu/BHqBIf+inflPXiqeYucyPe?=
 =?us-ascii?Q?Xw5d61+Djpn9k8JpXi6ncdHj1CHZe1wDpFHFRz6G43DzKQ8qBBCwQL8+pr5X?=
 =?us-ascii?Q?bj73Vo8zbDMkgAWy+AvNTwD1DOKQKSOr1OWPwFU+qH90bFOWnnmmF6CRFCiN?=
 =?us-ascii?Q?8TB2OWUgqetCmczXf+kFo3AQLUI55kwlROHYzr0I8ogPmmswH3rcU2NYZifd?=
 =?us-ascii?Q?waNSsPkTmu915YYac4S4a3l2I8WF4SXih71bkr9eSTml2/tQhIrtgjaCv0oi?=
 =?us-ascii?Q?hzyEVRYE6EUiw4vhWmMEcfJWDDSZJaE=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: 72ddba65-2e08-4a7b-2272-08de6e25a615
X-MS-Exchange-CrossTenant-AuthSource: AM9P189MB1666.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Feb 2026 13:08:31.3957
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NusrNMkBqsJepawiccfEoSBs6VybWpIe3YJWjIFoQSO8a9G+7rx04Ez85+XTDgyXb602eXMyK3HQYfxjDAF+FHQaY1dEii1pde7OiP1XMfA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0P189MB2726
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 17 Feb 2026 13:22:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/231255

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
index 0000000000..a30475319c
--- /dev/null
+++ b/meta/recipes-devtools/python/python3-pip/CVE-2026-1703.patch
@@ -0,0 +1,55 @@
+From 2a89ce91220e50c1b667bd9d5075e1fd10c1fed2 Mon Sep 17 00:00:00 2001
+From: Damian Shaw <damian.peter.shaw@gmail.com>
+Date: Fri, 30 Jan 2026 16:27:57 -0500
+Subject: [PATCH v3] Merge pull request #13777 from sethmlarson/commonpath
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
+2.44.4
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
2.44.4


