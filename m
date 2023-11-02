Return-Path: <lukas.funke-oss@weidmueller.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2AB58C4167B
	for <webhook@archiver.kernel.org>; Thu,  2 Nov 2023 15:53:29 +0000 (UTC)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (EUR05-AM6-obe.outbound.protection.outlook.com [40.107.22.59])
 by mx.groups.io with SMTP id smtpd.web10.34981.1698940405841993678
 for <openembedded-core@lists.openembedded.org>;
 Thu, 02 Nov 2023 08:53:27 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@weidmueller.onmicrosoft.com header.s=selector1-weidmueller-onmicrosoft-com header.b=q8WCn+a/;
 spf=pass (domain: weidmueller.com, ip: 40.107.22.59, mailfrom: lukas.funke-oss@weidmueller.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TEBlWXpYbMIg22MsqWOgRUjZG9LF2JMYsCJ+bw+vRtLfMFUEtpmaR5UmAygzP88U+Z9ARud9B3VxqpeKjnk1p3rqCN+QO0b06/IaG4FV9tPHM757K1/sMV8pDLSRr7HaIaaKRO6JyXEfxjX7T+8v7TE4Z3NzLIh5PQ2kME5uDcVpojPAhWc4GJHA0wQZxrz1yG6mHD2ezM/Z1SKgL7/Pt/MkLPqiZqNuHO5ibivmefdOwWBU1t4iyMHvmM+jztmOgw+2Hzjn66/z+w5R0eArteDRYv8f90XDTX9GgP+MXAJ5D3M8dWSBf8yec3+b3P18JsQH9XP447SpPy/Mky6r8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=o/lXrWNO/YCdvmgpVTU4r6PhRtaUTgyKPGXMX+860ko=;
 b=bXmfnMo5nEqR9ZnLzrr6y1mVvMZNz/MHPdpP40NcsdhPUNKPl+qv6qqYQOLnR94Au4JUCpNRFeDwT9xDneHAF/bzLMCCP8KvqIndno4QEoPWk54apfeZbe9XJpHUp1fZ611kevjMJHQTik6X/uRT6BSn7BsZJOmoo8+HqU0LWQl4S+6z6EOreFfITCDWwCCHP6OemtrVpkFQxxVae85daSf++2Xjxtu9V0CUiH3tAwlkAKi9txlET7AL/C9Hyb8wKH2LWzjSxY888pKJBpAzwnqWQY1Ux2BK3zk02DUzgtMqd+8IBONDky/hXGmKFT0PCC+1TKTmv05XSS2NAr4BYA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=weidmueller.com; dmarc=pass action=none
 header.from=weidmueller.com; dkim=pass header.d=weidmueller.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=weidmueller.onmicrosoft.com; s=selector1-weidmueller-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=o/lXrWNO/YCdvmgpVTU4r6PhRtaUTgyKPGXMX+860ko=;
 b=q8WCn+a/7btaBmWQWKKZTnhjvbGzlTf+5Tdy4BusXBCDYmbGOQYPI/Hr2R72ek38yfBbIbY7Z8G55hXmUvCYtfIIKhEPlopXzcHFaLJ9sgBDqH4gB7XujODtGkrf+cpDOxxiLyDIVxF7LSJiB6ZOrKVKnaR83U/juqnNiWcmcJw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=weidmueller.com;
Received: from AS2PR08MB8431.eurprd08.prod.outlook.com (2603:10a6:20b:55a::18)
 by PAWPR08MB10059.eurprd08.prod.outlook.com (2603:10a6:102:35d::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6954.21; Thu, 2 Nov
 2023 15:53:21 +0000
Received: from AS2PR08MB8431.eurprd08.prod.outlook.com
 ([fe80::c337:aad3:ff97:b20c]) by AS2PR08MB8431.eurprd08.prod.outlook.com
 ([fe80::c337:aad3:ff97:b20c%7]) with mapi id 15.20.6954.019; Thu, 2 Nov 2023
 15:53:21 +0000
From: lukas.funke-oss@weidmueller.com
To: openembedded-core@lists.openembedded.org
CC: Bruce Ashfield <bruce.ashfield@gmail.com>,
	Vyacheslav Yurkov <uvv.mail@gmail.com>,
	Martin Jansa <martin.jansa@gmail.com>,
	Peter Kjellerstedt <peter.kjellerstedt@axis.com>,
	u.oelmann@pengutronix.de,
	Lukas Funke <lukas.funke@weidmueller.com>
Subject: [OE-Core][PATCH v3 0/4] recipetool: Add handler to create go recipes
Date: Thu,  2 Nov 2023 16:53:09 +0100
Message-ID: <20231102155313.309534-1-lukas.funke-oss@weidmueller.com>
X-Mailer: git-send-email 2.30.2
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: FR0P281CA0189.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:ab::20) To AS2PR08MB8431.eurprd08.prod.outlook.com
 (2603:10a6:20b:55a::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS2PR08MB8431:EE_|PAWPR08MB10059:EE_
X-MS-Office365-Filtering-Correlation-Id: b501b761-6873-4274-50c0-08dbdbbbd6ae
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	CcV8qxNthI9VMQBJxu0fjZF8EcS1flRaXR9nzY5zpBJU82KWy+3Rwg9K5fzocK32UvElDllabiqoMju9SqEXIH1kuE0Z0lvGIEpwlXOvPnWlR/MOkS06kFPn0HAWvWnhvd64qPYfPcnZMBk/5Z8eFBAG2we5W6o0yGEMAdIUGptRKVXTcSg0OdnrxhIw0PE/YFI3VQMKp01pHpXD7untOj4PdbuZ7daAJnULHb1npf5JApMCYdjUHoYLM/eyw0axAU2Y4/5SwYDevoA30xlhxljAqJMAdfc+JZX0tYOK9DLecu87muw8yVwOPQiZeW7Dbh8tx8bPv30M2zgME2TljcsboCjRE2n0SVQBfDJsuAD35+HEKLjunr6CD/Nv0b9KhXE5V9BV480Kmvlw7Bc52I1LP5klyJwtuWaJiKQLNnDHJ5RSEEwqv0GHs/ZImz65++rZrcTqxxje09mLpARzpQBJxxQlbKazeRdVZzEAsXXAZmk9QCdcNQhmlZ5Pxwcav2Mc4zi43Bvapn1K4MgKfiTXVFkgBHRobM8LXeba0FOpduCp/reBv7NWbVBRYpTTpcBB/mE2u8Fyjo4gz2PDhgqVCGiL1TPa479b1WmH6BDsr80/F+5oimVz/uFPHz5Z
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS2PR08MB8431.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(136003)(346002)(39860400002)(366004)(396003)(376002)(230922051799003)(1800799009)(186009)(451199024)(64100799003)(478600001)(6506007)(52116002)(83380400001)(38100700002)(1076003)(107886003)(2616005)(6512007)(9686003)(41300700001)(2906002)(86362001)(36756003)(5660300002)(4326008)(8936002)(8676002)(6666004)(38350700005)(66556008)(66476007)(66946007)(6916009)(54906003)(316002)(26005)(6486002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?wrwWyPen97QZSKI1XdLDC6Tt7n4+wUYw3TIBoPYuKD9IPc7fqZtti/J5d8CZ?=
 =?us-ascii?Q?OsV1wqqGbZj3e6osLfgzzUOfQ0JNRulUpD4gXarVBCUV0FM+EZ9d7pEGAMJA?=
 =?us-ascii?Q?ggYxQW+nX9bYf05A/9QAwy69qaxf4wO2puqF9+xHGfQbriA09WZ4myT/+HTO?=
 =?us-ascii?Q?97mo61H1TGd5KXXXK2bbs5CP5wuIwptbJHzG8bf+WBTyXgDwLkw0W+PPCoF7?=
 =?us-ascii?Q?+eZ9EAh/juMeMYME865XntjLbsolQsiA48HSx9CT2wHNrn7VdFsDjQkJG2ws?=
 =?us-ascii?Q?q6UFJY/+KH/T9qEAjsmCxLGRhAONhZM58V6XS6GAaHcecKhWoawTzUkfzdeh?=
 =?us-ascii?Q?EceOTkKyROmIhCxOZewEaslvURbPZyTURNNVoLtMMrkmcmAUio8aWLq/u4l3?=
 =?us-ascii?Q?IfQAjwsZ0Voamtm8yt5AO//dLtfugR3qikKjQW8T3Q79CLc1/mzegFW38Sma?=
 =?us-ascii?Q?RRk0Krp8/rLuibQEHlUkvoeFr0MTVEKc9W0dwrmhskTsBPtKb2JdBi2gI6aT?=
 =?us-ascii?Q?4I01oShyqPR2mR3lE8DyrcLAcPLh01W0Qso+DLZUgGlz+/YvnH0yORFj9zlX?=
 =?us-ascii?Q?ZtJNwxOguiVsjXAXwUw6mVc5eG0Ho9JdJn4M8FZpKlV1i7v93h5Vscrkk86Y?=
 =?us-ascii?Q?L1CL1JPMYPOPS97JBmE0QyrFu+UsOio12sajMlRGtI2M4IG7CvuSA3yoLCtv?=
 =?us-ascii?Q?T2LZwvGejLshIe/EILH8dRU0YGwNg1HPn2vNAHwBvkcnQVpV06vSUxfZePs1?=
 =?us-ascii?Q?/HV6dcstICM5jFWz1EUmcObqJIgFNAoe/+LSAgQwtsK03TlvS7tK9BzQ2S90?=
 =?us-ascii?Q?HruysVNH0ij9bUxDWL0NeGaFW4G/aUwPZb9I18z/LLDd86dB2/1kUM+8UQ9O?=
 =?us-ascii?Q?9ZzNoOhNAj/svGSe4AzCIEdtqMRlQZpIYujZI1RF3Ojgoyp2IhDizSJ8iuPS?=
 =?us-ascii?Q?orv5LxvD0pkymyJ2F9BECV/39adFubsN4keZxLm5N3I78aG1OZA6wWrt2XhZ?=
 =?us-ascii?Q?9qSJ99uKAYeQh/rbNIaTO2U6iloyG9qRKbg6zgk3NEOdzUfDUMNdTGU8Dv0Q?=
 =?us-ascii?Q?qJ68PP30sscjoMvFTc7ns3+KPo+ooSV3OJDCjp+gY+g/qTykEyv1c4ALyMsw?=
 =?us-ascii?Q?d3OyVWS8oPnM4fBovq6Sebabzqa3JLFbnhONuBqYNkEO/NwcQLozp7mnhLMG?=
 =?us-ascii?Q?GM/6E2yOOGrvCVsEBnBnrpkBYOS/3LuGSGzJM9daDLwzsFvlDg0e3FJ+8Omh?=
 =?us-ascii?Q?UPCfASPB3DqaykFc2mVmfDlivx5Ba5QZ0sF+ap1UZtCPxQd2a8xKCX46dYct?=
 =?us-ascii?Q?Y3HAYNS+mrA0GtjW/8vLbfE3taAXTvANKloAF2ET9ZfLQnaVtv4huB6EPBAL?=
 =?us-ascii?Q?USX2KPAo+zEO05iWzS18ATQBeNyizqA6fWXGWYhskUZKQ/ZNPzBmsoN9R2jn?=
 =?us-ascii?Q?KkuM4TPNl1iEO2RfWFraDFrgc4t5kHZrWPtN0dCNvx/JdzUFO6MlF7obxEWK?=
 =?us-ascii?Q?LhhnoXAM3S0p/rtWr5B5ZV9DTyYQfR7QARv71Q5I9jHJQ4hnckrUo2ekdAUw?=
 =?us-ascii?Q?dtYqP8nSV8vAxPGlZekuZ6KzSMvSK2EK6Xtg4XyGx9iBuR/S9b+R6/jSb2BF?=
 =?us-ascii?Q?LQ=3D=3D?=
X-OriginatorOrg: weidmueller.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b501b761-6873-4274-50c0-08dbdbbbd6ae
X-MS-Exchange-CrossTenant-AuthSource: AS2PR08MB8431.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Nov 2023 15:53:21.1864
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: e4289438-1c5f-4c95-a51a-ee553b8b18ec
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dLDUTm/+uc1hBjKBv5wF9yQeLoPkjds+cEYBVmBaUyEO111SawmCz6C42Z/dBO5x2OFedHRuHNDud6bAU2Ow6g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR08MB10059
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 02 Nov 2023 15:53:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/190082

From: Lukas Funke <lukas.funke@weidmueller.com>

This patch series adds a recipetool handler in order to create 'go' recipes=
.
Each recipe contains a list of dependencies in their SRC_URI.
Dependencies are derived from the projects `go.mod` file. For each
dependency the corresponding license file uri/hash is added.

The recipe may not work ad-hoc, but is a good starting point to create
a working recipe and have a working offline-build.

In addition to the main recipe three additional files will be generated:
  - $pn-modules.inc
  - $pn-license.inc
  - modules.txt

Changes from v2:
  - Generate separate *.inc for go dependencies and licenses
  - Adapted oe-selftest according to change above
  - Incorparate community suggestions

Lukas Funke (4):
  classes: go-vendor: Add go-vendor class
  selftest: recipetool: Add test for go recipe handler
  recipetool: Ignore *.go files while scanning for licenses
  recipetool: Add handler to create go recipes

 meta/classes/go-vendor.bbclass             | 135 ++++
 meta/lib/oeqa/selftest/cases/recipetool.py | 163 +++++
 scripts/lib/recipetool/create.py           |   2 +-
 scripts/lib/recipetool/create_go.py        | 730 +++++++++++++++++++++
 4 files changed, 1029 insertions(+), 1 deletion(-)
 create mode 100644 meta/classes/go-vendor.bbclass
 create mode 100644 scripts/lib/recipetool/create_go.py

--=20
2.30.2


