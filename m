Return-Path: <quentin.schulz@theobroma-systems.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AC7DEC433EF
	for <webhook@archiver.kernel.org>; Wed,  1 Dec 2021 16:14:01 +0000 (UTC)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (EUR05-VI1-obe.outbound.protection.outlook.com [40.107.21.78])
 by mx.groups.io with SMTP id smtpd.web11.93756.1638375239580946498
 for <openembedded-core@lists.openembedded.org>;
 Wed, 01 Dec 2021 08:14:00 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify"
 header.i=@cherrycloud.onmicrosoft.com
 header.s=selector2-cherrycloud-onmicrosoft-com header.b=nlP6geCP;
 spf=pass (domain: theobroma-systems.com, ip: 40.107.21.78,
 mailfrom: quentin.schulz@theobroma-systems.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=W532qpT4z+vVF5PcaRDTtEXbWZ0smUIdcUR1TAb+SgClgK19tbQqXkvfFLCqMDb8cXft5vFnPlPGD/IB/8MBvuQeK2Q+R4w665QpMI3vxeCF6nzKLbe80HA1SKJg7QNfPgeH4WtmaQk3F455nla1rqgLZ2K7J7xqJs5oNLoeCboyFoxiAAR2X+lsJ2Dav20T4zONG4Vovm9kYjFOryCOsPU7H4+dCpvuxT9z9WrwsScmgFe+7ZsDejvnRixytPJ/KW8/Sr0AwQnvq3S0/KyMcwqEscgZwb0hKmXIIp2/kxy9dxPprwrGlAWkabmxBc8vF9pkmM6DVFuwWVutM0E6rg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0Mr8UdaiMTHlumVaj19REYJwe6XQRiodssryBGE4nrA=;
 b=PMp5U2wfIOL0C58WbYmKPwdz2NPTzRpp9w/WgL7+kc1fc0HopUp25+TvcAUyKbMR0JqfFmfpWtmQTxkniE6FFJOHZq2FqpFPtqjKdI/WPruPvpF6/9OA8319fgj3AwxMuERPX0/oVGd4zLsxZvrR/wp26XKTQ9aLS8/JH1t9txcrI+KS10jiwaDxCixxaoBplt4yuIarJMqJxgiBF8zljTjXw4FrdBakdwHevW0zHJaqUAH7BX4Ctz/C6SZ1MBuMFG10Twzm6neOzMAOvpqQAZXU/g/5zsPVEqQKV9/iqeouXPIAxFCtNgE2njNkrMX974O8yXZiJBUjCIyTmjxt0g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=theobroma-systems.com; dmarc=pass action=none
 header.from=theobroma-systems.com; dkim=pass header.d=theobroma-systems.com;
 arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cherrycloud.onmicrosoft.com; s=selector2-cherrycloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0Mr8UdaiMTHlumVaj19REYJwe6XQRiodssryBGE4nrA=;
 b=nlP6geCP+goS/89EDwSrS3cgtjyhLUZZidaj/HKmY7Ch6mLAiGalRrxkcttCC15I9RKKSfSXQDp89jPw7n1HvbfjG1QRH7zy7fDk82j+z4aDfzpBcFQcXkttiEKjDhJ+Clp0rKXxxV6pYW017j46IrPqBekbNp+PuOB9I2+72bM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=theobroma-systems.com;
Received: from AM0PR0402MB3348.eurprd04.prod.outlook.com
 (2603:10a6:208:24::24) by AM0PR04MB4979.eurprd04.prod.outlook.com
 (2603:10a6:208:c7::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4755.11; Wed, 1 Dec
 2021 16:13:56 +0000
Received: from AM0PR0402MB3348.eurprd04.prod.outlook.com
 ([fe80::d56f:ec59:3bd0:6d7a]) by AM0PR0402MB3348.eurprd04.prod.outlook.com
 ([fe80::d56f:ec59:3bd0:6d7a%5]) with mapi id 15.20.4755.015; Wed, 1 Dec 2021
 16:13:56 +0000
From: Quentin Schulz <quentin.schulz@theobroma-systems.com>
To: openembedded-core@lists.openembedded.org
CC: bruce.ashfield@gmail.com,
	Quentin Schulz <quentin.schulz@theobroma-systems.com>,
	Quentin Schulz <foss+yocto@0leil.net>
Subject: [PATCH] python: python3-idna: fix non-existent Unicode license
Date: Wed,  1 Dec 2021 17:13:35 +0100
Message-ID: <20211201161335.3110181-1-quentin.schulz@theobroma-systems.com>
X-Mailer: git-send-email 2.33.1
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: FRYP281CA0016.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10::26)
 To AM0PR0402MB3348.eurprd04.prod.outlook.com (2603:10a6:208:24::24)
MIME-Version: 1.0
Received: from localhost.localdomain (92.42.140.82) by
 FRYP281CA0016.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10::26) with Microsoft
 SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4755.8 via Frontend
 Transport; Wed, 1 Dec 2021 16:13:55 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 9da7c1b2-97c2-4a90-64fd-08d9b4e5934f
X-MS-TrafficTypeDiagnostic: AM0PR04MB4979:
X-Microsoft-Antispam-PRVS: 
	<AM0PR04MB49793723C7E3F5919C6FB64CC2689@AM0PR04MB4979.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	vdzkSqfEkxG+Lpfp3WVdQ0GuxJt/7ajlTxON2AVVfy5B91bkZWUwCjPECUKRM/Gd3ajJ8nwTMnP4Huk4jip7ARkHp23dRtKpmMiCrL1o3mujQv4OeIXuZP+SfDSyVmvAxN+v4CkwaY8eG06mt2Oclp9C49r5KpnnkmeJNXGR8MKH2aluLOW+jSwPg8nZ1aljuxVmkGHBrq3BM264Qz+zQW+OS2rEvFA0ZYi9DOjFo5xd5LqxU8QfY8ZypKRaQbGzKzsOOfxfS1ZpHUbhwy/V7+wfm5Xw6ylsw39Z5ZK2wkv4ZLi6nBQj7KYEE109yX6q8QspTMvOSnICUQ0C32VkofHpuTcJipqnINz4pPtBFfrXg04QvNrBh1WtCzoYOi/ZwckDWVpFENV6sE86eEOjkHy8m41heSNuKo/d5Xt/vdJPdf5rGMbVKp+hR8FJyJgG0XQnzS/oh+S2LIhTjJIcNemUBVoLOvWIrmW6yAZWds4bOYqOK3ocp1AX93fg7JBxTY/YXOxSOQPEr1L7ePeyUX2fzOY8jZ7kF1fTXQBE/bUHmmf7+YDd0GMQ/u/owgM6ELXJSuEJtjs/njYNsFr48gm3IVI4r+uHEjXEyD84yjFhF8txlUIIxfh7gokOGWFN/MM5BiFpPPCkpPPZPxDUOgMR8xZGIhlK1psFXr66LVz2HKJlUR/nL5QQZEEIEzoFs9EtEaOMdwMscqvLGB0hreKA0ebBpnhhAsnhTVqz7z37EvYP/tk83MDb4cb1+aMClyaxSCWrwqK5zCsI4TyG4FTYGC7ZPOHMeKP95bnAyi4=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR0402MB3348.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(186003)(2616005)(956004)(36756003)(83380400001)(86362001)(6506007)(5660300002)(52116002)(1076003)(54906003)(6486002)(2906002)(4326008)(8676002)(44832011)(38100700002)(66946007)(66476007)(66556008)(38350700002)(508600001)(6666004)(6916009)(6512007)(966005)(26005)(8936002)(316002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?CzM1uaQFWbw8O66mSE7Nm7d6KbbFTVQ/fcRm1/kBjjRreU4W5aZQE2wluhgc?=
 =?us-ascii?Q?G6a5gAkFhGlJAVL0gFMCGYyf0R4I2bj9ahOqyL+mwkFU7NbPiyQLD+/DAO+k?=
 =?us-ascii?Q?TjGaSlr7Jt2LpAaXm+P4T6jr309BADL4qYxg3fffWXaTUg0rHgOjYINxE0hc?=
 =?us-ascii?Q?y3OjzGF2DO/IUtHaHZ+LoMId6VoJlak9ep3TzJw5PG5qbIILit5GeFRmKzYn?=
 =?us-ascii?Q?8tsOQI+QwzaZvf/0ihBgQIx9Dbrxao+saVrLlibsxmUOn1cHLGBS50QjSgbG?=
 =?us-ascii?Q?iQ9WFSQTbIm5sx8/ws8bjZETJ37MxYj/P02MjxO4fAGrsG3QPNw5xztxFw4y?=
 =?us-ascii?Q?V22XZBu7jmdF39isrRxXxrc9sJ3ji+B2M67vxjZiHnVAK5ZI7qlXHjC88qgF?=
 =?us-ascii?Q?eKwyS6wd4fFOvvWmkq8gy8LjbMQToiEMPGKHqH30/hmkHSztnSYMA4xpxncI?=
 =?us-ascii?Q?4uojAcUiL/TQNqjhy9vHFxDYQSlnimGQ7S5FAzrGHGT8d95dtGlTDpf2MHr7?=
 =?us-ascii?Q?Cn9OSxzF76aqB3K5x9ZGjd89yAeQa5PbiRRjo8IhhdL1GjqDj85jFGhl+6Pv?=
 =?us-ascii?Q?On7p5hb7LXY1LzKPPuhv2m/Z76GmR/MzFa689HcFHno9YtKjzzbZzwbHV8mt?=
 =?us-ascii?Q?BfTCbT6T2APr8TxsNS1oqH48FDKIlNrEo4obpfqr3o9E/ZbFQGZ1STLoGdDe?=
 =?us-ascii?Q?N8GGv8wRrJXJtvKpvCGqKW5qow6MRLh6fU1E8rI6PUez3gUfBw59of6iEfA2?=
 =?us-ascii?Q?cZRNK/wQ88IPI7WylrkkIgq1Kq10NE/QvXMqc2kYvRTRXBDgoEl/3xoPqW1k?=
 =?us-ascii?Q?rGmnr7s1mzihIz4rMrw7k722aJ8ZQ1WTYdu/OfUKdw1o+7tzWnOE1lBtbUdJ?=
 =?us-ascii?Q?tsxANyGU8X/LUzUOGI/gpuvPOXcHaenu4a0Ou947xD3Rix+ljPqiMNzp9iWO?=
 =?us-ascii?Q?auN/D3QzN0EeUb8infvrubQe/NT9DoF/GixwNAHpCRQa7j/tgyDtzgCm0Dns?=
 =?us-ascii?Q?cDHeq2qL3IAoO1Zk2uN6WkBK7MDZN50jvtvrADrsPMjqZ48EGloRRZOrdJjF?=
 =?us-ascii?Q?SIdyQKNh2DhfTr/TsUJUkq6rTvJSCO+JE03OkHVbjZURfRCfhp4n+Cr9A36H?=
 =?us-ascii?Q?favadGSKf2rSPSgV2uMvTDp6UA184m4FfI7nNleyuXsdgoVK72bckTOVqU+N?=
 =?us-ascii?Q?mWzWf2/vV7eNk2aeuB1PRLRpA7b7JWj/QyxSbuIdSzhJ+MKE7Z+9+9Ak6MMS?=
 =?us-ascii?Q?SJXAFgCvdLvwFBlNYuEGJND2/BXsDTUs960yMA0TIbtspSPzk0dCghpbXTnn?=
 =?us-ascii?Q?hxgQ1djLY1F/ol/QOyip7VQ8kWtVhnOUMUZOoxrczMa2UOr7yDLohnIKumPB?=
 =?us-ascii?Q?NpIc0SNnrUFgb5/rTFEMq3rUGH75XE09bWdVliqd/Ah0hyag/NVrEjOa94Uq?=
 =?us-ascii?Q?+Ed9zhAXs2E8reXv8f8G29Ud8OB32GTTfLcmcAo+uUktarmyaSqDFsVP45Rq?=
 =?us-ascii?Q?bd7FmPnaNT3c/R6rfMNxNx+N3Q25Mim3I++GZQ3inv2Wt8dh49rnwKHzqM33?=
 =?us-ascii?Q?RQNgC1/U38GnrKFT+uPBKkEpEp2evS078mco4EOhUlC/MpTwjZF97UeaepiL?=
 =?us-ascii?Q?yK02JnPKCH7qGnK88zGtNvCbTVM+Ftd6hw4hVvlHtq6b8zJHnEJdoGxWA2t2?=
 =?us-ascii?Q?k/gFjtSKPV+YaR/zlzemrqPQoYdJP9TRlqg/GDglI08ltZj89RRjOFy4LTGd?=
 =?us-ascii?Q?AhuU1t5jDQ=3D=3D?=
X-OriginatorOrg: theobroma-systems.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 9da7c1b2-97c2-4a90-64fd-08d9b4e5934f
X-MS-Exchange-CrossTenant-AuthSource: 
 AM0PR0402MB3348.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Dec 2021 16:13:56.4488
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 RUOKOZou97aGQkb7y8+/o5rj1Fvxb+TIe0Od/w4PwAnx8OGu5bYEDkXOAhA2qw0DcWop5E5py+/bVORDE+b+R3MnFjwv0R+ODXeQTqFsisZQzyRv2ir9o6Zam7QQYJgB
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB4979
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 01 Dec 2021 16:14:01 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/159041

In addition to not being an SPDX license, Unicode license also isn't
available in any of the LICENSE_PATH available in openembedded, meaning
the following warning is printed:

python3-idna: No generic license file exists for: Unicode in any provider [=
license-exists]

Unfortunately the license is not really explicit in the project. After
looking at the code, it seems that this license gets pulled by
idna/idnadata.py and idna/uts46data.py which are auto-generated by
tools/idna-data which downloads data from
http://www.unicode.org/Public/{version}/ucd/ and
http://www.unicode.org/Public/idna/ which are covered by
https://www.unicode.org/license.txt as mentioned in
https://www.unicode.org/copyright.html.

Comparing https://www.unicode.org/license.txt to Unicode-DFS-2016
resulted in a match so let's point to that SPDX license instead.

Cc: Quentin Schulz <foss+yocto@0leil.net>
Signed-off-by: Quentin Schulz <quentin.schulz@theobroma-systems.com>
---
 meta/recipes-devtools/python/python3-idna_3.3.bb | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/python/python3-idna_3.3.bb b/meta/recipe=
s-devtools/python/python3-idna_3.3.bb
index a0e6b79a56..f3c53a8717 100644
--- a/meta/recipes-devtools/python/python3-idna_3.3.bb
+++ b/meta/recipes-devtools/python/python3-idna_3.3.bb
@@ -1,6 +1,11 @@
 SUMMARY =3D "Internationalised Domain Names in Applications"
 HOMEPAGE =3D "https://github.com/kjd/idna"
-LICENSE =3D "BSD-3-Clause & Python-2.0 & Unicode"
+# Note: Unicode license is pulled in by idna/idnadata.py and idna/uts46dat=
a.py
+# files auto-generated by tools/idna-data which downloads data from
+# http://www.unicode.org/Public/{version}/ucd/ and http://www.unicode.org/=
Public/idna/
+# which are covered by https://www.unicode.org/license.txt as mentioned by
+# https://www.unicode.org/copyright.html
+LICENSE =3D "BSD-3-Clause & Python-2.0 & Unicode-DFS-2016"
 LIC_FILES_CHKSUM =3D "file://LICENSE.md;md5=3D239668a7c6066d9e0c5382e9c8c6=
c0e1"
=20
 SRC_URI[sha256sum] =3D "9d643ff0a55b762d5cdb124b8eaa99c66322e2157b69160bc3=
2796e824360e6d"
--=20
2.33.1


