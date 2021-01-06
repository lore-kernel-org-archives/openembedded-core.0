Received: from NAM10-DM6-obe.outbound.protection.outlook.com (NAM10-DM6-obe.outbound.protection.outlook.com [40.107.93.57])
 by mx.groups.io with SMTP id smtpd.web10.6936.1609935006756585984
 for <openembedded-core@lists.openembedded.org>;
 Wed, 06 Jan 2021 04:10:07 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=BVnKVr/1;
 spf=pass (domain: windriver.com, ip: 40.107.93.57, mailfrom: liezhi.yang@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TIZs2gTPesZS5gnPbnwXTX6SIm9YwcDAiHsxuliK1vbpB9j+HurdG+Yv8+gXGUuZTf4LUPgvl64NnM4FgmtfVLXDzPDNk2z6nsTDYB1neCFKwJlF/GT+vvfhT01T//ZeT/VPpG8ZRr4XPJjoxz1bcHwxKoJftQDLvVn3TvkWTs76yfq7NbM8PIsxXN5+Elkgh5CHG2SY4hW5sVIYTZiu/40VKoXPQi4IWWCCLFUrfXbGuGIhEMmZ9kr52tw0kQdxN7nV8p2+KMqQa8ip+XkGd+fJoXGOWf4+dsfZ8RbFYlKkayJ9OFyUrRDB5RxbDMoJHjDbRRPF6mYO7lWEh25vuw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ozlLgz7kXQTd3W4pYGbraAxgSDDY990UIkO3W2ePYS8=;
 b=bUSb2V7qRsN/ZZyHkwCnC4gbmct0QXpOCOE2+WtKJaERwWIRJFPP7IImnf+WoezUhZmMPsUP07tl9osroQ0/rHnlxigisbulTjFVk5AX914llzrYgc94CEQgplPwG0qMq9Hcr4GkJqiO1Mr3YVRZee2IfiW907dmWIAbPw7hmlEQRLsa8CWpZMERsalbheTFxiDUfMLoLYUFh4vNyiVp0XZAb8MPgMQumzmvYZm0rgklYeju7LLjls3CZzOxVz9XF43N7Xi8zKGLhDSAPym0vsseoGijSchAM5TtkuG4Wq3y1ToNBp2RbAbiPcjeIIiKJkz7xaxkqNRiij1FwvuelQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ozlLgz7kXQTd3W4pYGbraAxgSDDY990UIkO3W2ePYS8=;
 b=BVnKVr/1R18HG4jSqtPw/Qs7xQyEpbYRbLGBIBj76EWT7/OkDejsaxdTGBb8KWICSz/8SZ+IXmcio+XdI8wIhAo1cAz+smYsn2WmSdnBKm2AYgq07nLhvVfu2R0y2rGGqbad3obDJDHtbZqeAhktJj/ACn2gFMFIsrlZfhs8Vqo=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from SN6PR11MB2909.namprd11.prod.outlook.com (52.135.126.77) by
 SN6PR11MB3088.namprd11.prod.outlook.com (52.135.124.150) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3721.20; Wed, 6 Jan 2021 12:10:05 +0000
Received: from SN6PR11MB2909.namprd11.prod.outlook.com
 ([fe80::acc9:68df:558c:94e1]) by SN6PR11MB2909.namprd11.prod.outlook.com
 ([fe80::acc9:68df:558c:94e1%6]) with mapi id 15.20.3742.006; Wed, 6 Jan 2021
 12:10:05 +0000
From: "Robert Yang" <liezhi.yang@windriver.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 0/3] ccache: Fixes for 4.1
Date: Wed,  6 Jan 2021 04:09:49 -0800
Message-Id: <cover.1609934927.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.17.1
X-Originating-IP: [147.11.105.124]
X-ClientProxiedBy: YT1PR01CA0110.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:2c::19) To SN6PR11MB2909.namprd11.prod.outlook.com
 (2603:10b6:805:d5::13)
Return-Path: liezhi.yang@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from ala-lpggp3.wrs.com (147.11.105.124) by YT1PR01CA0110.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:2c::19) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3742.6 via Frontend Transport; Wed, 6 Jan 2021 12:10:04 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: da76f7a1-d3bd-4b4a-1bbd-08d8b23c00de
X-MS-TrafficTypeDiagnostic: SN6PR11MB3088:
X-Microsoft-Antispam-PRVS: 
	<SN6PR11MB308873B85D760F836CD3F786FFD00@SN6PR11MB3088.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:826;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	MJh07c5T0H6K3+wHLyGE92UZ1DktVHqUmc+cg7GZtv/qAOqOI1VDJBoWS2CAQaf0l5UV42C5YQL5g6D0KPYdwYsfnkbCFOWsrEcu6YnP6CN/R7v1Fvj/hI4KPCM89WE03ZL0K0gfVBGlwYfrUav7TTlfVuSwjl86ThPRDx9ZpmttMc0zfUf7LzDPIMqJ9I/LQWh9PTFDtJ8HklflcY9MfQPJuSXDxUctBli3AcTVHOCAGOFMcj+ysUb0d8b31leXDo/+Hd+yq/1CtItngArXJ0jqCNaNJZxXOU0noeuMBaAutttEbE3T2JQ7ssUI8oVbmKJrJfxlCFoDOKriN9UxsSiCkDYl84M8XsbCO/W/H+D9IaqPNa6XNBx6r5zNcczy9NgYB5cUNBAFFRst0MlhO1FORH0WE1FLG2rGss19PPq7tEk6MEQXophoFiqCYSNl05YM6Es6G1gieR9w6Y9xag==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN6PR11MB2909.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(376002)(396003)(39850400004)(366004)(136003)(5660300002)(478600001)(8676002)(966005)(956004)(8936002)(2616005)(6486002)(36756003)(83380400001)(6512007)(4744005)(26005)(186003)(66476007)(66556008)(66946007)(6916009)(52116002)(6666004)(16526019)(2906002)(6506007)(86362001)(316002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?us-ascii?Q?VQm0+4Le1n4k2OZWwpWO2ZAI9yDXMgvitZRt5j/IA6oH8J/vsiHmNYAfk6F6?=
 =?us-ascii?Q?iwYCgUtqsE51ka7ixrXG60e77Z/EUExUqpjtVN7A6Nag5kJjmxbC1UmaUMs0?=
 =?us-ascii?Q?otxB3ykjTZUJluoCdfGUxBUiJS2qWmlIY5H0H2ECK8kmEfBlWFYqPBSy/y7e?=
 =?us-ascii?Q?qz+marlYarL0/jLoH8zJZJsNXGa+fgpC+5tdqT+8etAJNYJ9zKFlbKz2zOSb?=
 =?us-ascii?Q?OCE0/4Eq0MRcgMZx11KhjUhZDj0WwM1ay1n+pAUQKGjqhC5Y9rJkSPH8PpHf?=
 =?us-ascii?Q?sUMN3PVQ3Aew3RIpPyYFqxsYv1UdAxk/ymzd+WaWAwEb01ilnsLR7QRqaktU?=
 =?us-ascii?Q?dVT8CYWDRKCMxvxMtFROFi2nMTbg3uQ3CPP2mREPakFnxJ9ZIZefg0QAg2YN?=
 =?us-ascii?Q?H9Fhu0p3l2w4ZghqYxcKiMJXS7/+CUxX6pJ5cvi9KVUzpSutPGlmvcDb0Oa8?=
 =?us-ascii?Q?lvlsHfKzI20V6On0SzEAjm3i2bbl4zCC4ZQoY/T0tzBOSGEeSDRQIHdxq/Mv?=
 =?us-ascii?Q?iC2AOW0TOWRyIJmXlfwm4NmtfWR1tQEQ1ecwJ2sRuiNDJpsqtumM0ih0foQt?=
 =?us-ascii?Q?SiXCl+eCq/ljG840gdCMi0aYdcN3PeErtkary/8QrfEyKJcLx/oqcvHrQan/?=
 =?us-ascii?Q?DOj1ACJtP6rJ33tw4kmI8srYKLCctU7i6cJcc1CUeeq0UfoOlvM98dq/4Lh5?=
 =?us-ascii?Q?uJeTX6VIOleRhaxSj0kOqpSGXhteN3jcQnaN5mEYx2tmIGKL83yBqB8RjAOq?=
 =?us-ascii?Q?xDelTcjEtSXLkHrGUUi0uMwofUdHoAA7sng5WdArrXFHVOEK2SoxFsrgRNNY?=
 =?us-ascii?Q?ogeueYTBFlT5+Jd0xBJhcY2Xhgqmd779HJpInx/cpqvqQY1PxUhaypmAOc0A?=
 =?us-ascii?Q?QtFiIYV0kg6oQ2pcYSFN1Dne4LNQNPaHDWRV/fGLGVRNhThvta+34TXi/OAd?=
 =?us-ascii?Q?EVAqzJD3mjV8SAnaufLjkBU3qRDHG4b379n2mkhQrPf+lHWXH0TOCTkc/2qG?=
 =?us-ascii?Q?LQPl?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-AuthSource: SN6PR11MB2909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jan 2021 12:10:05.3764
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-Network-Message-Id: da76f7a1-d3bd-4b4a-1bbd-08d8b23c00de
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sXQmp2jVqrLGwvXjm8WWSPE1rMb8Fee5jyYVekiFG+Ah2JoIZUqdIWnPfyS69+PrBNExj9em3jIzPsxDcN7ega3GkeAbyZqBFqPn/BQzH5s=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR11MB3088
Content-Type: text/plain

The following changes since commit 23cb39a5fa2a55681e7bc2605f435135cec9173b:

  diffstat: point the license checksum at the license (2021-01-05 13:48:07 +0000)

are available in the Git repository at:

  git://git.openembedded.org/openembedded-core-contrib rbt/ccache
  http://cgit.openembedded.org/openembedded-core-contrib/log/?h=rbt/ccache

Robert Yang (3):
  ccache: Extend to nativesdk
  buildtools-tarball: Add nativesdk-ccache
  ccache.bbclass: Set CCACHE_TEMPDIR

 meta/classes/ccache.bbclass                  | 4 ++++
 meta/recipes-core/meta/buildtools-tarball.bb | 1 +
 meta/recipes-devtools/ccache/ccache_4.1.bb   | 2 +-
 3 files changed, 6 insertions(+), 1 deletion(-)

-- 
2.17.1

