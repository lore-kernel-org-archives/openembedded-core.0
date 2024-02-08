Return-Path: <joerg.sommer@navimatix.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A1D40C48260
	for <webhook@archiver.kernel.org>; Thu,  8 Feb 2024 13:54:57 +0000 (UTC)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (EUR05-VI1-obe.outbound.protection.outlook.com [40.107.21.105])
 by mx.groups.io with SMTP id smtpd.web10.18060.1707400495782693112
 for <openembedded-core@lists.openembedded.org>;
 Thu, 08 Feb 2024 05:54:57 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@navimatix.de header.s=selector1 header.b=YfCRi5rI;
 spf=pass (domain: navimatix.de, ip: 40.107.21.105, mailfrom: joerg.sommer@navimatix.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YbHB/UKZnkysJPaz+yiwvrSmMlCLz7P7Azy31jJ5aa23/IJKWupfRn7tLXnzrqlGmrcQItkzYBDcY2sUbnhEKt+Yv715amxUParq64iWjK0uIbU0BNFSGra66gIrJAxL7rBWDPUFgOgkWI5ymnWXPsiwFs+ZNiGSmxsTswbZxqAm2KYCInTqAxOwlPXGuFM8hdaOHddfbebEDtHdL0APfYFPJ2Fb7UM2pYzoZo8wIuFGb6h2LU73Y6VWVRayljqexxfPsevx6YW/N0LM1fEOhql6urL8X0PtZXrww4EIKbxjPB8kxt8ULs0nlVu4S2w5DXUOPC+0q7+eaZhk9+i1fg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=X7kIStvii0cpwUgJviq/NNm582rT1IGwLTPVhY5DfHo=;
 b=GUn7Z4FQkFOy2rcnWvhK0klVjblSzyIXfKAkrJOm8lgcpiAQFJrb2053ks1eBtZNWxb44+ojwtZAFL/Ig8nYvOJkMXOsjLvN8vjDGMi33+tSly4zsXy9rjWr4AgkdU7S+EP079UVMRjXDVpMGgHZeuaWYUb/W7v+xpFSxh3vgRwANngQEKHybFiLi50l+JBJPO3tWqmP/XigNl9rYhJCKBVNTzEtNZIQZCVD5LTak6JfatVCfQhFzyktZzmahER8Q7RNZu3idGg91Znakd1vwgP7hHuuq5cxBGdveEkSYI28kUctblUJ1Yy+ShLNbtWCHnCS2xEuhlKXwiqHw27fiQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=navimatix.de; dmarc=pass action=none header.from=navimatix.de;
 dkim=pass header.d=navimatix.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=navimatix.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=X7kIStvii0cpwUgJviq/NNm582rT1IGwLTPVhY5DfHo=;
 b=YfCRi5rIS8wMPxFS+YaCYD4+TcYeb8ZcZUqBqtx2F9gjGonYpWEhEmmWR/rsstCAi6zerdyPx1xt91rK/SC2hvgX+dVGJmNXnQ8X3uWEfClfDj8hxk/TMUgW7yKt7/ueJsCjoOmwDfbFq+b4LtgPTXjVWCZW21k5lz2FgMQClgs=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=navimatix.de;
Received: from AM0PR01MB4627.eurprd01.prod.exchangelabs.com
 (2603:10a6:208:ed::32) by AM9PR01MB7299.eurprd01.prod.exchangelabs.com
 (2603:10a6:20b:2d2::24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7249.37; Thu, 8 Feb
 2024 13:54:51 +0000
Received: from AM0PR01MB4627.eurprd01.prod.exchangelabs.com
 ([fe80::ae81:b0ad:f122:4d00]) by AM0PR01MB4627.eurprd01.prod.exchangelabs.com
 ([fe80::ae81:b0ad:f122:4d00%4]) with mapi id 15.20.7249.039; Thu, 8 Feb 2024
 13:54:51 +0000
Message-ID: <104bcdd2-27f1-40fb-9ad0-0fd506af3041@navimatix.de>
Date: Thu, 8 Feb 2024 14:54:49 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH] kernel.bbclass: install .config to deploy dir
Content-Language: en-US, de-DE
To: matthias.schiffer@ew.tq-group.com,
 openembedded-core@lists.openembedded.org
CC: oss@ew.tq-group.com
References: <20240207102529.128369-1-matthias.schiffer@ew.tq-group.com>
From: =?UTF-8?Q?J=C3=B6rg_Sommer?= <joerg.sommer@navimatix.de>
In-Reply-To: <20240207102529.128369-1-matthias.schiffer@ew.tq-group.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: BE1P281CA0276.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:b10:84::15) To AM0PR01MB4627.eurprd01.prod.exchangelabs.com
 (2603:10a6:208:ed::32)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM0PR01MB4627:EE_|AM9PR01MB7299:EE_
X-MS-Office365-Filtering-Correlation-Id: d83c587f-2458-4448-f4d0-08dc28ad859e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	QMwPqGrKVTU4HgfAWMmGc5bG0Wmi97ETPCG5v5N4QXMYxHLv71yBqASrDlvNUu0H//YavUgJ7Hyt+aRJ+tAKsrWEgyyLRUsvXD43FpLP/rugM87mE7v6l7py/U436M5s2CVw2Stx8buLcJZa7IHVkOH2svKC4DdB9uaZzhFP6zZnY1Jpe+ZLa/ixx+PKaf4auRJ/1M/7AQlykExrIg0oXgOrSB4fl0DtiYwfybEFnZYtdEIHKTBdKhtkfMxg7c5us1gEiPmCbhwN2y7KU+Rf/c3Z2mmPq+Yt4Lr3ezN8cFfCE3caikqZcy5oFBfnPUjUTpEO2OoRBzKvLHDsTTd1BlF8JzZO9nf6nt+z15rxrhmrA47pd+TDKBYx85f+t1s99/rcjwG25+o3uge9l3jFAGTqnwIdR/9L5S4Myqrgw0scDwvKLKB4qrG2dZa8SBXEvHICsBQqhwgH+f+0Y5FdxjAsW8KHriUJvECqB/d/8SLk6zj4OE1m+pfpXz2LhD8gOEoacB8gdfnvKangiya4Xsh6g2gY7ujiCe9GV7PdK7G7HI8ixTCMkXC5p2uo8LSc
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR01MB4627.eurprd01.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230031)(136003)(396003)(376002)(39840400004)(366004)(346002)(230922051799003)(451199024)(64100799003)(186009)(1800799012)(66899024)(31696002)(36756003)(86362001)(31686004)(41300700001)(2906002)(4744005)(66574015)(26005)(38100700002)(83380400001)(5660300002)(478600001)(6506007)(53546011)(2616005)(316002)(6486002)(66946007)(66556008)(66476007)(4326008)(8936002)(6512007)(8676002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?R7mZprfyiIU17MSxgpIAWJSg4MaNld2h9qUWLR0mh3jDGNtL0m4jbd7lySSC?=
 =?us-ascii?Q?7FBD1/Detw/5SIUyhZxVHvB7VngXoIjAV3NoQHg1TibVQIap9lAqm43/Ektp?=
 =?us-ascii?Q?NonRPHQFa1k4UGS0cvThqzH61L7bdQSTyasrQX730oidYJsUH3tRr8qTV/1B?=
 =?us-ascii?Q?HZ7Lksx7j5sqbzUmCi6jvc/v428zrZvKURg+amClFYDfmGA5MLy77g9bOKQJ?=
 =?us-ascii?Q?BfwjmWa1C94UFhjaTvZJhPCSIHUk5uKJG1uVU2VDOBwr2CeRXjX9ZUQ1AzMu?=
 =?us-ascii?Q?dc7ITso0tj3TTVvEbTNtAEytNQ4TB3L5glCNr8G7o3ClCQ39du+XUC9nOVVe?=
 =?us-ascii?Q?8EOVl9iWRUPDccTjDlBUD05lK8JpMVXpREM381o0erIA/4IQGqRwCvBcaXVQ?=
 =?us-ascii?Q?JlTob9CDRPq1JFcE17WA9yq1GUEOVxs9Xx8xX1u1Oec6ip1um2s9iVlfwiMU?=
 =?us-ascii?Q?nw+1SWIwHOAPcwsBtJrYw+uLrZz+colPiT3RjuQDLGf4PYpkcE279zrBArBe?=
 =?us-ascii?Q?mL1sa4chEY6diZ8iyPfrJdnf3MxtTQkckDHeZDTP5LT3Je2pDVxHZm1YAjCU?=
 =?us-ascii?Q?D6FanpJzxxxmtDqSIoJacEkXFsPX2K3Ktj/vBuVFMu1dzoqQ8Xp72fqS0O3B?=
 =?us-ascii?Q?DpUbrkgYVXsqktd3yfJYJ0FVy+s9g38ABE7DmpBVSghE8ffog3ZpjKR78Iqa?=
 =?us-ascii?Q?HQtSt442D6fKyDAQ3s0aebXhh1pMpOW9gZCR/WwH95iZoeTb+jsmznlC2obw?=
 =?us-ascii?Q?LXnLehyLA/WD85+O5Z01S/Qan9Oq9rL6WMF9SD/lQgBmoe4yqGaAVcC82PiZ?=
 =?us-ascii?Q?drzAu6vyeZQBfK/5r9Tq18J+97M8UCI1eSXQ1joyPaOxv1pk9S5cT0Uc7Q1l?=
 =?us-ascii?Q?zkdGye5WjxZ0mmZrcNzHpGR3fL+1EtWyYutOSmS32d9yV5mOM7Cr/4j62zeb?=
 =?us-ascii?Q?itEfLjU2KlBGJ9zSN/U5AT6iKgdtD63UTkEMhGd329E0fkh0AvZjvwSEO+cz?=
 =?us-ascii?Q?u10ilrY57hgqwRjlHB/4qPdMkg8kA9NO8JR1FTd767OPqLOIsFRZefG5NS+Z?=
 =?us-ascii?Q?swsQauG5s20VQ1F9qEvtKpvTT9VcuSxVLNQ+7RzWv2CmB5zSPP7LkAReS9Yt?=
 =?us-ascii?Q?jYJhAkNSWgbBbG48kUpog/23CMoPXAYAMIoRXicBLi98YAunyHLnexCn5tMv?=
 =?us-ascii?Q?dkTYnUIrRurfnkABcwq85jCTh0pbdjkdzQjcz9jEIKsYkOBKKeFDMlXOuQSZ?=
 =?us-ascii?Q?pFISAnu4P6I+dnRb466EBSzqAjgvdNXK0vQfDWOSDZBk8TXebP4kxrbX7zPX?=
 =?us-ascii?Q?KDZG8d/YwSLCZpPf1uj3io+14FTC8KH3HsRDeq204cvVE8acgJqeQ2LutTgC?=
 =?us-ascii?Q?6TWF7D3QEvPFKjxH7L4U/nFdDLME4F8b6KRyRw87iKfBBOJMc4cR1aXQNx2I?=
 =?us-ascii?Q?BMxd/VrxhGe2qo2NKsPou2bjgAPPqyGJRwThBugXdYc82o6SZGVblWe9AvCU?=
 =?us-ascii?Q?Bpz6QhnGkhI7DYW2VHVHb65yRTfVPNuqBuNAI4444ZPFhfcb8KVG24diJXCo?=
 =?us-ascii?Q?Mq7s3GCLz68l/N0wp404UD5CeSzyr3y7vo33Eyw3pxRaftmL9PfH5dfcRhMi?=
 =?us-ascii?Q?UQ=3D=3D?=
X-OriginatorOrg: navimatix.de
X-MS-Exchange-CrossTenant-Network-Message-Id: d83c587f-2458-4448-f4d0-08dc28ad859e
X-MS-Exchange-CrossTenant-AuthSource: AM0PR01MB4627.eurprd01.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Feb 2024 13:54:51.7449
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: c87b4f54-b992-4813-8f3f-4a876324197f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gznDpX07jMIFhlAetyLnrliSq3S329eu8zDDT3nqximPXOx2Xf8MX2SaStgX0qisV/b2LD2DJ8HrjHQcjGSC6wNnQA0xkwq1ABu9YQJ+Yx8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR01MB7299
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 08 Feb 2024 13:54:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/195154

On 07.02.24 11:25, Matthias Schiffer via lists.openembedded.org wrote:
> Deploy the kernel configuration with the built images, so it is easy to
> check its contents, or rebuild the same configuration outside of the
> Yocto build system.

Isn't the kernel already in the -dev package included?

From a security point of view I wouldn't welcome the inclusion in the
main package, because the config should not be deployed by default. The
config contains many information about the available code in the kernel,
which an attacker can only guess otherwise.


Kind regards

J=C3=B6rg Sommer
--=20
Navimatix GmbH
Tatzendpromenade 2
D-07745 Jena
Gesch=C3=A4ftsf=C3=BChrer: Steffen Sp=C3=A4the, Jan Rommeley
Registergericht: Amtsgericht Jena, HRB 501480


