Return-Path: <david.partain@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 55B57F9EDCF
	for <webhook@archiver.kernel.org>; Wed, 22 Apr 2026 13:35:19 +0000 (UTC)
Received: from PA4PR04CU001.outbound.protection.outlook.com (PA4PR04CU001.outbound.protection.outlook.com [40.107.162.23])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.81969.1776863044147366096
 for <openembedded-core@lists.openembedded.org>;
 Wed, 22 Apr 2026 06:04:04 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=fB2KsA5q;
 spf=pass (domain: est.tech, ip: 40.107.162.23, mailfrom: adarsh.jagadish.kamini@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HGzx0kiO0O0/775C46v5sVwKXM9hfAuLhsinMKrVzDtVg3R+Yj4qiLN02iQeHx+n2PGFCDQduVBHgSa3mYkMu6FCCnpf9xqeX/EwDVqfZArOcRLPp7BjIhZJrYqeQqN83O4f2P7lcaxeHLVS2zBq12sH6GRejhgsojtnRYMjnlv5hJREEXzyBGrTJRZ+ZqhXGna9cNWKSSGl29R3rxhqyq/1wApV7RmVEQ0rTNfET/5ntbZs8H5SGOjyXPPRkObZY2lXTLN83A2LYoUCfMpbz5mGt+SqC9YKBQCGePh9I514OCi/1le8brrD7wgXAuRIG4HUoynTMJy9exwCUSp9Bg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AxqIYnIpQY+3TsH8MX9Hxr6wkkIOkwjF7f3fWSSoVzE=;
 b=mRw6wC91+hk3NBdBKXdwH1lekEtk+F1MOaE/89Tc4Ih0UHTJR6j+MOjCxiEgSPmb8G7EHdoeeO7Nu+NIlygjIeHrkHdzCzaCoPKk08FIEYA0n8z9vC+ScbVORllN4a1AbrjRi/RJ6NWs1RQDlBsNwgtpGPh3hbchhnPFcTl2u+cLlqSFNhTffo5uJ4GUTDM/sidKMONF2n4siUr09rNvYchOPJUc2e9A7Cp4pf6FKJDVo9TzAfgX9lIrk+srXn6W6jNi/7y4mGg9xug2I0XauLxgUtXavWrODI++LHSPqJbl2DUQWevNWRXA2lToavn9OGpG04x+EHQSxIN7xwCW5Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AxqIYnIpQY+3TsH8MX9Hxr6wkkIOkwjF7f3fWSSoVzE=;
 b=fB2KsA5qRBMgRohL2NSItHUdjJXHQEyF0DTutu+rrp+8uF8pcnnQQc3xO5WYdtWDq1aJW0Mr7Ye2CZfXuqhG4rruVDei0CKDK8rbpUWUixhDzYQ8DqhYC1xrcET60pDoIV1ZBL4JCAmaxHNcsRISsEJ21anwY9kuc0BxVCpAQGu1mIPEOAaVE7qLiAyoudyapybMn4F8eBLnAVrEYjCoLYf8EtyWBrL0Yw8BTLuDm7VmWY3e+e/X+G7FhRTP4+Wc+oE0NtT559MUNH5CAtnYNRtMQoEhVg0M9Zhca/1pjZ7HN3mgWAnKlkB/WfZElAG1MbrrDf+8i3ZnJITWhwGQTg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from AS8P189MB1672.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:396::9)
 by GV1P189MB2812.EURP189.PROD.OUTLOOK.COM (2603:10a6:150:1f4::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9846.18; Wed, 22 Apr
 2026 13:04:01 +0000
Received: from AS8P189MB1672.EURP189.PROD.OUTLOOK.COM
 ([fe80::f147:85e5:34de:eeff]) by AS8P189MB1672.EURP189.PROD.OUTLOOK.COM
 ([fe80::f147:85e5:34de:eeff%6]) with mapi id 15.20.9846.016; Wed, 22 Apr 2026
 13:04:01 +0000
From: "Adarsh Jagadish Kamini" <adarsh.jagadish.kamini@est.tech>
To: openembedded-core@lists.openembedded.org
CC: Adarsh Jagadish Kamini <adarsh.jagadish.kamini@est.tech>
Subject: [OE-core][scarthgap][PATCH 3/4] binutils: fix CVE-2025-69649
Date: Wed, 22 Apr 2026 15:03:53 +0200
Message-ID: <20260422130358.386475-1-adarsh.jagadish.kamini@est.tech>
X-Mailer: git-send-email 2.43.0
X-ClientProxiedBy: LO4P123CA0343.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:18d::6) To AS8P189MB1672.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:20b:396::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8P189MB1672:EE_|GV1P189MB2812:EE_
X-MS-Office365-Filtering-Correlation-Id: 40cbf931-05b5-4944-c962-08dea06f9fa9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|366016|1800799024|18002099003|13003099007|56012099003;
X-Microsoft-Antispam-Message-Info: 
	IXINaiPsBcNfhK+UAOe6w/g2/dY7bM0kHovq1XjBoCN5YoPYDrKS+foUvcGVCoHIQa90B8XdyrdqLVm/n955BWDaqJAYBf3Lv1rPB2bB1rpHhgW9RDoXoWbYrW8srMZF3mt8UCISqSAul1MUr+PAAv8ajTRL9WmbvUiedPk/932X0g3mYG+aMljR/TJo+qsUYO6cApNDmPfLtf2FJO5nzPNDxpdzqIbs7P4IkrEd6qj0RbIbri6ZBArpeCQqKQQSZs3YY1qLV1FUC0wRhQVSzfK2t8TagpT6YafpKlm92DTRJeM9f+/CHJShOCgkaTP4l4iQcv91VAHjmOzq4o/MaP3Ck4dQfigQQNsQj6Tlv9eXKFWgTCPZmfX4Yn7DfaC/D8ZTolDziE1a1iXxKH3sPONicxoNLMbL63IxrfI83qpZGswKAX0dVBF1fbEGGL78vndoSFZ/AId5KDLApk2YSyUV6fWpy0CXP1H3JffxqnOzefwFNJuX/peVo4kraV168Ruz6V9mzVyo6pEtWQf4oFBInXM16bGyB0KrxAcMBFrZrh9SMYqhM/hRpvoRET/B/vWbtRupwg0cBF1fH6NOXMSv3mwhN5fgjlKjxZOyuJa9NOLFrmY6KWk3uOBnH2m8Q9UbhgZQJ67jEn7BHZ5crLEp3owgbZwT0PCLoVugdrcYRlzzpw9mtw6s32zeY9js9vSWciMicttzzJbTO5tyZjj8OK4EUP5AqLC+Lio8RU8=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8P189MB1672.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(18002099003)(13003099007)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?CEqiSOOr95HGuy803wFcnogsg2n6cdUwtXEDkpna008Iong49HaOoazvOhHx?=
 =?us-ascii?Q?kiP6C3jsJqN3B8ydGhocN6aQz37DsFqYgqj+3bHhzT/DPyzilCDeB9crVp4y?=
 =?us-ascii?Q?YZxL4aN+zQ+RaA+KVS1z2tNvhHBwpdyU/8GWv0Ys22IdD5+ePQfez/mkz0AI?=
 =?us-ascii?Q?2m+qqA4h6XjesMoyChxWEj0cb66t9CKtp4NFyIJ1kyR0pXv9OIn3YJx4aWfn?=
 =?us-ascii?Q?IbL5CNRVnmdnX/Ehoot91+fziF04RVelN3WZ0iMec2nUWKnxh7b5RGfCzTgY?=
 =?us-ascii?Q?wv83+GTbHSccMQHfBFw9IddaduLWH3y1wZhGYnk8gpxy3a82AokSWt6SN4Gx?=
 =?us-ascii?Q?zel4qYen+P/lM40wSPJFW7cDmu4RLL833EtsPynkSHB5VpXXlUX2Il0CdN1f?=
 =?us-ascii?Q?spvXulovms6r0vTCDf0pWv2vWFbJZLQyYSFctJ69ZsEKQnzwX9J0L5W1Ge5c?=
 =?us-ascii?Q?TrwSWNhedYYaIEV0i9qtDiJA9S7ghEpU5YGj9pXbJWU/L5bS4YlHoA38sJFL?=
 =?us-ascii?Q?n/5DVArnaasSa7Z7luuzPlOTQKa6gJbD/aSMm5BHeOqweIIJQxnsPFDL4UO3?=
 =?us-ascii?Q?SSDyCsHQLj/7HAcsopz/qCIfc4dsuYRgniqCnDP25jGn6NiCp0ukJudReled?=
 =?us-ascii?Q?Rf2X0/WVKjYPH505RSesr4pGRswsdAIdQLVavLn9MCrRcRIYUuBuheAKYd83?=
 =?us-ascii?Q?rdgcHGKsQVBXYYf1SwVrII9stGq6uxxsN4ygq094RANaJWYgk2c5/LRh+Vjl?=
 =?us-ascii?Q?FG7u5IcsUwnjR/Jrdb0w5S4+D1ZzrEQg1pHAtFnQgai+Y+lO1+WvjMhowskW?=
 =?us-ascii?Q?JNOhQeLQfmyZD+FWfUQH9JojsXKZJ2bJ6E6rLmLsjX1RphE/tPDL+JZNhlKv?=
 =?us-ascii?Q?xZngpUtfXFoI7pN0Wd2pavYiPrjE6jJUaKuCx13IH2KGXexwjOrkgJdY4r9s?=
 =?us-ascii?Q?DopMD3rRP3f7cQv5xzKqyFfQ/0o6lWMToaqFVSFvlU+Vcyjoqk3j6p1UjGZl?=
 =?us-ascii?Q?vJJJGBbN4VbSybT/94WcxOR072v+wc4vjMq/a3VtSdE2fnug0ANJvD94+g3B?=
 =?us-ascii?Q?XAm9TuewkioEYahIbAqpbKcQu/EOi6XBI2x8wvEFoy6J9FuYVwY6VqktAbW5?=
 =?us-ascii?Q?rKogfC01x4S1HjRkfNoWBndS73qAWESsgZuRtsmb/Kh0gkRyF0gU2Ht3BpcE?=
 =?us-ascii?Q?gR1bZZFRYYNx4VsUwfQQQ6Odjnou6NlzsFxgjAijdU+sWgvPxe5/FYMY0MJw?=
 =?us-ascii?Q?EzIjDqnIBottHqLDk6nImHAneoEss1lxDbanvZz2gNf3zy28vP5qj9DqdpXC?=
 =?us-ascii?Q?fOS09SSshPQ+MR4SuufX7X2K7ea2sUcTBCbT4ziWNgyf483cATnoelIbA9k7?=
 =?us-ascii?Q?jDVQVOBTs1hKvgWmRLljSsiBGIq5gsP7FXrnZRCQXaDKhjkM+s7jpiGug6tU?=
 =?us-ascii?Q?dm+GY+3DyOlhaFk2jTPskj0HnaVdBwDtDQ+5gQgocr9LvtNYQzSZWbXZL+Dm?=
 =?us-ascii?Q?e/eK/eTd9yxi/u8POPBguk5onRJpmcABrxYnssjERcyYUsJ4hPFeQvfyz3Ig?=
 =?us-ascii?Q?eEeq6NZMF0VqBswdQwXFOfPinwmoCd2A6ITSBlFXZc/7o0SsqY4B8UIBwlj/?=
 =?us-ascii?Q?6NEe3bB9s2C9ejwDycQY2rRoWw1xtAQdRooZwQ4Y2binmbkN9N0dDYRa14Ci?=
 =?us-ascii?Q?q9R/Ye/6IfnnjDT1fypxw+EO/MZr7kkceOYU+cx7jZT8+Ouvsy2r2tP/6NSY?=
 =?us-ascii?Q?z/Hnov0BI6/Gi2XO/MFf7QiXqtruoIc=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: 40cbf931-05b5-4944-c962-08dea06f9fa9
X-MS-Exchange-CrossTenant-AuthSource: AS8P189MB1672.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Apr 2026 13:04:01.4521
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mDW6zFBS9C5diVcKxgCfl+hKZQgmYhxAbMxuGml5DROZu60Wm9QxGqzBjuGcUYAAkk5r3KCyIZASiSSUiDZc5yQrnVL6pP3/UySICVd8x1E=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1P189MB2812
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 22 Apr 2026 13:35:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/235722

From: Adarsh Jagadish Kamini <adarsh.jagadish.kamini@est.tech>

Backport upstream fix for CVE-2025-69649 [1].

[1] https://sourceware.org/git/gitweb.cgi?p=3Dbinutils-gdb.git;h=3D66a3492c=
e68e1ae45b2489bd9a815c39ea5d7f66

Signed-off-by: Adarsh Jagadish Kamini <adarsh.jagadish.kamini@est.tech>
---
 .../binutils/binutils-2.42.inc                |  1 +
 .../binutils/binutils/CVE-2025-69649.patch    | 42 +++++++++++++++++++
 2 files changed, 43 insertions(+)
 create mode 100644 meta/recipes-devtools/binutils/binutils/CVE-2025-69649.=
patch

diff --git a/meta/recipes-devtools/binutils/binutils-2.42.inc b/meta/recipe=
s-devtools/binutils/binutils-2.42.inc
index 6c1f9dc870..8a92807f30 100644
--- a/meta/recipes-devtools/binutils/binutils-2.42.inc
+++ b/meta/recipes-devtools/binutils/binutils-2.42.inc
@@ -73,5 +73,6 @@ SRC_URI =3D "\
      file://0030-CVE-2025-11840.patch \
      file://CVE-2025-69647.patch \
      file://CVE-2025-69648.patch \
+     file://CVE-2025-69649.patch \
 "
 S  =3D "${WORKDIR}/git"
diff --git a/meta/recipes-devtools/binutils/binutils/CVE-2025-69649.patch b=
/meta/recipes-devtools/binutils/binutils/CVE-2025-69649.patch
new file mode 100644
index 0000000000..bf27987625
--- /dev/null
+++ b/meta/recipes-devtools/binutils/binutils/CVE-2025-69649.patch
@@ -0,0 +1,42 @@
+From cc53801dff2ba4bc62eaa666b3b7d9401232089c Mon Sep 17 00:00:00 2001
+From: Alan Modra <amodra@gmail.com>
+Date: Mon, 8 Dec 2025 15:58:33 +1030
+Subject: [PATCH] PR 33697, fuzzer segfault
+
+	PR 33697
+	* readelf.c (process_relocs): Don't segfault on no sections.
+
+CVE: CVE-2025-69649
+Upstream-Status: Backport [https://sourceware.org/git/gitweb.cgi?p=3Dbinut=
ils-gdb.git;h=3D66a3492ce68e1ae45b2489bd9a815c39ea5d7f66]
+
+(cherry picked from commit 66a3492ce68e1ae45b2489bd9a815c39ea5d7f66)
+Signed-off-by: Deepak Rathore <deeratho@cisco.com>
+Signed-off-by: Adarsh Jagadish Kamini <adarsh.jagadish.kamini@est.tech>
+---
+ binutils/readelf.c | 8 +++-----
+ 1 file changed, 3 insertions(+), 5 deletions(-)
+
+diff --git a/binutils/readelf.c b/binutils/readelf.c
+index 8f188e8c3e2..8d28b1c30e4 100644
+--- a/binutils/readelf.c
++++ b/binutils/readelf.c
+@@ -9621,13 +9621,11 @@ process_relocs (Filedata * filedata)
+       size_t i;
+       bool found =3D false;
+=20
+-      for (i =3D 0, section =3D filedata->section_headers;
+-	   i < filedata->file_header.e_shnum;
+-	   i++, section++)
+-	{
++      section =3D filedata->section_headers;
++      if (section !=3D NULL)
++	for (i =3D 0; i < filedata->file_header.e_shnum; i++, section++)
+ 	  if (display_relocations (section, filedata))
+ 	    found =3D true;
+-	}
+=20
+       if (! found)
+ 	{
+--=20
+2.35.6
+
--=20
2.34.1


