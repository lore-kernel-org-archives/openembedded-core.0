Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 27CB6D58067
	for <webhook@archiver.kernel.org>; Mon, 25 Nov 2024 11:30:53 +0000 (UTC)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (EUR05-DB8-obe.outbound.protection.outlook.com [40.107.20.87])
 by mx.groups.io with SMTP id smtpd.web11.16814.1732534242743966819
 for <openembedded-core@lists.openembedded.org>;
 Mon, 25 Nov 2024 03:30:43 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=arhiHxp4;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=arhiHxp4;
 spf=pass (domain: arm.com, ip: 40.107.20.87, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=X7uuZmF1ER04f8CE2AQM74M1Fe1pQLzBhaocy9V3SDHf9KVZ5DrOFBg7nss4DCDNKMjOcoajYoM8qhYzM/5q57XRrb6DwjdDDssg5CW7WY/8GFuLP5XdS8sLCdHMIB1CvlJCFws1nHciXP4xg+z67xPkQ4KuqR/mCVDIBIZQBi2hwU4OjD9sOY+5Feo0XzZdXGSAbzSkprlCjfCN6VwZdDWhPOxPAGFKaSEck2N3pMwPYJEgmfjlOzoGpYOYn8vIjqlWB3MM/4ve5o/ai6jUm9Vq+t2jOcSnLk0gN8q1g1dH59q5JKF2Q8dlwROP6y+Zq2EUz68PUJvUbV3Qe+9qHg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8rBenmJY51DjIaduIjpAL04UMCNH9P9YGVUHVGcRbcM=;
 b=OvnP+oCxQL1RJ6JNY3oijdnJ/luG47SZ1VMzjkgTJ8YH54dbmRZoZ0uQ3JII1BbGHpDSPr+OGWUzQyDs/k73N5IkC51+HP4mTlxVkGTGsgUnYiyM7QTyydbapE8oLZd7l+LWanTSP1+0YrvInJx8fzOFnfWJtMwEj8V+u1EYFVCSnkeaoNsEQW9+mUkPnq/GI2neQ9/245AGb3trnYXXWdTKwQnQw7eN0aXRDXpJtmJqW0Fnhle+Xhf1B2v1xcUdSshGiGd9R/fY7tA15TBEcbFilfwzn22n7VKTrtVeBvGuevF0QByYzwazBUMhK1EV6qpNVtihmEpDB/H694HLbA==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.openembedded.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8rBenmJY51DjIaduIjpAL04UMCNH9P9YGVUHVGcRbcM=;
 b=arhiHxp4WoDDqmDoE1zsrwQTihQDGCatdHw5xbj9yA/P2tILXhIzx0OKYKOSQzNwmsHptDbMekL4nfSdTFjnIlrC1T4UbbgnYAbXbGU5E3o85P03cD0wLKvL1RQFyit1XpIU+enAPgsFhTluIMFq3S5BWf5uhgT7NS/d4eJ0DFg=
Received: from DU7P194CA0011.EURP194.PROD.OUTLOOK.COM (2603:10a6:10:553::17)
 by DU0PR08MB8688.eurprd08.prod.outlook.com (2603:10a6:10:400::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8182.20; Mon, 25 Nov
 2024 11:30:37 +0000
Received: from DB1PEPF000509FF.eurprd03.prod.outlook.com
 (2603:10a6:10:553:cafe::f8) by DU7P194CA0011.outlook.office365.com
 (2603:10a6:10:553::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8182.20 via Frontend
 Transport; Mon, 25 Nov 2024 11:30:36 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB1PEPF000509FF.mail.protection.outlook.com (10.167.242.41) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8182.16
 via Frontend Transport; Mon, 25 Nov 2024 11:30:36 +0000
Received: ("Tessian outbound 70f2252b2aaa:v490"); Mon, 25 Nov 2024 11:30:36 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: a9a788b7e22fd1bb
X-TessianGatewayMetadata: 1VfJiDXCAZDIlArQcv73BrrdQ2ktKaH3ig3xzfOHFouuyj5gvWELda6MKRUX/DwjciwM/Vh6BpyP60Nc0bjzxd9+KazUWDvp09/9roQVpTY9FP/F9xPi/Rq2iWWZ0+a95uDozMcgRgm0XcSsC1GLyWvmqn9mZLwmAfD/9dMr6Ik=
X-CR-MTA-TID: 64aa7808
Received: from L0164e3eb7f14.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id F82E9075-B610-40F3-9C1B-EE9483F3FE4B.1;
	Mon, 25 Nov 2024 11:30:17 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id L0164e3eb7f14.1
    (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
    Mon, 25 Nov 2024 11:30:17 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XlzB65V/rbdlFQuE3vDRdfERIEMidPdc4kY5AUDykOvTuoq91L7QwGQH+qOwtXMOgwnN4W/6Ke5POVxZZh8hJbQguq6AZuntQf6IyZHAMM7s7qMgmnKP3kT2lTIZIXFp0uy6TL55GxRgDZCN4JnxOSUKZrGbPhhHagYPjytS02sWjOHUkxwNdYpM21kOgsjsihylJ2TORTM322KeA2gc1zjxnlP40vhe7sc/Xi4ARXQewT8xoEChUpFd6Yt89JB11nEMry8gZS5f+yQa65Db9GGfF05ypVCVUCcy+5O0aPEeT+d/SazcUclEeBkWfcj9GV7WJ9Wr43647b661RFPxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8rBenmJY51DjIaduIjpAL04UMCNH9P9YGVUHVGcRbcM=;
 b=bTbUO3mxpUPqEc3VtKb4j7kSKpUhY072wk5Yfu+hASlHfjIOqaxC1VAeOGy5yEv+X5dMqpsjvzfLzkx6FTKaeu/7rdR0eSnoduGe6lSpxo4poxsLpvKp9PcHK1XjWmPsoEXu2u5H+kvAGb/QTRpVldn+vQhtkn6MlEBz9/DZmMysimDkQ8sDqKeOSgDQIRyuwy3ASrLLf0qV8JFXIaykY2i6Sb0dFinEL5nATTcx1FceaurlBJnfhT5TVv+pZ5pFncd8xVYH+NKSusgwuCYk0+ZxELDvs/CtkGGJWkVdpaK4K+Ue4Cd1lyrseLFDVP9opty5RnolwJDEyhaoU/9ctQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8rBenmJY51DjIaduIjpAL04UMCNH9P9YGVUHVGcRbcM=;
 b=arhiHxp4WoDDqmDoE1zsrwQTihQDGCatdHw5xbj9yA/P2tILXhIzx0OKYKOSQzNwmsHptDbMekL4nfSdTFjnIlrC1T4UbbgnYAbXbGU5E3o85P03cD0wLKvL1RQFyit1XpIU+enAPgsFhTluIMFq3S5BWf5uhgT7NS/d4eJ0DFg=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by DBAPR08MB5640.eurprd08.prod.outlook.com (2603:10a6:10:1a3::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8182.20; Mon, 25 Nov
 2024 11:30:14 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::9206:40ba:ef7e:729e]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::9206:40ba:ef7e:729e%3]) with mapi id 15.20.8182.018; Mon, 25 Nov 2024
 11:30:14 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: "peter.marko@siemens.com" <peter.marko@siemens.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core][PATCH] builder: set CVE_PRODUCT
Thread-Topic: [OE-core][PATCH] builder: set CVE_PRODUCT
Thread-Index: AQHbPmxbrSpPDvceJEGcx0zVJ2h7NrLH3eUA
Date: Mon, 25 Nov 2024 11:30:14 +0000
Message-ID: <7E848D03-BCBA-4C6D-8986-3B4DC9135287@arm.com>
References: <20241124122711.18001-1-peter.marko@siemens.com>
In-Reply-To: <20241124122711.18001-1-peter.marko@siemens.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3826.200.121)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|DBAPR08MB5640:EE_|DB1PEPF000509FF:EE_|DU0PR08MB8688:EE_
X-MS-Office365-Filtering-Correlation-Id: 44d058ce-123f-4ecb-6de4-08dd0d4494d4
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: 
 BCL:0;ARA:13230040|376014|1800799024|366016|38070700018;
X-Microsoft-Antispam-Message-Info-Original: 
 =?utf-8?B?Vm1FVmUyYjVoMnFyK3FaOGl5cFJhR29iVWF2YXNMYkc0azJaTitNNkFFUmQw?=
 =?utf-8?B?SEQyZXB2MFZsaU15UDMyZlBNanlPcEJMclIzSkkvU0l0M3ZxV082TXhKNHRx?=
 =?utf-8?B?YXNTTitDM3dIWjgrU2pQVnN5QXo5bGdKdkJRZ1NIaDQvVkRUMStSV3pZZVdx?=
 =?utf-8?B?eFViNlpYK2VOUkZYZWIxdVpQVTkxSVczQU1JcFg1WFIwTnFROThCaFVPUXor?=
 =?utf-8?B?NkN3SW9Ha1g5SlI4SzhucnVocHZjVzhVaTFlcVNYc3JUSDF2cTJFU1RRNnIz?=
 =?utf-8?B?d2dzNWVEQnlwVUwvbll6Qmh6d1J1NGZGOTlZR2NjYlJJUk1jU1hKZHcwUDlU?=
 =?utf-8?B?QlhETnE5MnRRRXliZGxpM3BqV25hTmx2R2VRbVZlZlJ4TWJYQW15TWFoeitH?=
 =?utf-8?B?QVp0Q3Y2SlBzaERSYmsxQ1I1RFRHTUUrM1Rjd3JPQlZ2YTY2a2RqbDVDMWQx?=
 =?utf-8?B?eXAwS2I0L013d0NYaXJNR3BOY3B3dG50Tm9XcnhKOCtxNnNBZzBONUpBUDNl?=
 =?utf-8?B?djZVOS9GVXl0TmRhaytoNzRyS1JVaXlxWDRzSXY0TEo0VGhOSDYzSjV3TUdl?=
 =?utf-8?B?d0xWUjJpS05sblViODdrU2ViWC82OHNqTVpYaWNQYW9vd2E5cUhnaUh4V0ZY?=
 =?utf-8?B?bTh1cEl5Z1JvWnJsTFlZNld3RndkSkMzdGxoUHR5YzhRbDNQYTE5UDVjeG42?=
 =?utf-8?B?RUxQRmxROHBpem1sUDA2UVpjVlpvZW12andLeURQY01OYWVsRVF5TEtzdk0z?=
 =?utf-8?B?TmpmYjdodXRVTEJkaEx3MkRNY2NhRTRFS1dyVEk2N3ExalRkNUdnMzE3eGlm?=
 =?utf-8?B?OG1MMnJrUzFpZWpJWVNoelcvT0pXVEVMRGxBTHI2b1QrdkxKK0JkVC9GNlBs?=
 =?utf-8?B?SWgwc1pySEJZc0JGYVFITE1iT0tMSmRRNTBGRlo4Z29FN241SmxPZFdQVGpS?=
 =?utf-8?B?bUNJbE9zQlVFUjRxbitmMnF6Um9INFRnczJPM0ZNcCt1Q3h5YXZKWHFPV2hT?=
 =?utf-8?B?am9UNHpscmpVUzNhTlB5T0dlZnk0azhrQktpaTg0eDV2eUdDREhNYmYwdGl2?=
 =?utf-8?B?Tkh6VTZ1dlRUWVF0a2xzL3cvTWVWQnNNSGFLK3MxcFZ2K1QrZFQ3SmJPd3Ur?=
 =?utf-8?B?cmwwdXBkajVUanUyTThCVVhFM0M4TjdHTDQ5MldjeEhPWVdSVkhRQmNPOHlO?=
 =?utf-8?B?OWtwQ0U1NndnamZmT0FZVzZJY2EybG5UWFh3UURDazcwWEJjaHM2NkdqNnAz?=
 =?utf-8?B?b3ZYUEZ0ZXhETm4xYzE1SkllclR4cVRQN29GZi96Q3ExdHRVaEZGSHMvcDRV?=
 =?utf-8?B?eElLbHlMZVYyck94UWdZbC9ENzdRbC9SWG5FSC8yRG0yT0hqQkVqQWxtdHov?=
 =?utf-8?B?T0J3RWluNmlwbU8yNUZDaFdoblRqNVRyN2E4c1REK2JiVHk0d2RsejQ2UEtq?=
 =?utf-8?B?bERSZkdlTm03R2x5L1BDVWdZb1YzTmVDRWV0ZXNaWmZwS3hSenl3NnZibFpk?=
 =?utf-8?B?Sk9CajJacHBYRTBNZ2VPdXBlZ043Tys3cCtKR1FZY09wbXR2VmRGdGpXSllO?=
 =?utf-8?B?bkRzSitTU2N3VVZ3ZWJJdTF3a3BUdXV6MmRyQ3hDMFFkbk50WmJMTjJzYVNN?=
 =?utf-8?B?Y0xpTkg2bmgxallFeVBLa3lLYUszQXJBRTNLOXE3Qi9XT1I5VmVlU25POGh6?=
 =?utf-8?B?UE5NYWRhY0hzRk9iNUx5YmNwN2hzeXdlbXhteitpRFdsc1RtcDQ1bEFibC9D?=
 =?utf-8?B?NWx0UFI5ZXk0ZWZ2dHRYQXpTdUNVMnphbkRLU3JMVVNkVmdJUHgxNGVSbjZh?=
 =?utf-8?B?U3lXNzJ4VFhlckRCNEYwNnI1bXpKcGRLZXIyYXZ6TXZNSmtHbmxwOVFORWRu?=
 =?utf-8?B?MG5keVdDVnVUL25ocU9XRE1OTC9KV0J4aytnejJ1Unk2Vnc9PQ==?=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(38070700018);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <F07656FE78B7B246B63AF883B7F88BD2@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBAPR08MB5640
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-SkipListedInternetSender: 
 ip=[2603:10a6:102:2a3::12];domain=PA4PR08MB7411.eurprd08.prod.outlook.com
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DB1PEPF000509FF.eurprd03.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	220a013e-ffc9-4166-79e0-08dd0d44880e
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|82310400026|14060799003|376014|36860700013|35042699022|1800799024;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?OXJ5amRGN09pbHlISkQyT1VlSnkyaC96eG5ySC8rREIvT3pnemRqS0R3T1A3?=
 =?utf-8?B?QXI0NlljTUsyWDJxYzM5SEp5QUV2bnFjRnFjaWFwRGVNVGF0NHM4dGdhK3Zi?=
 =?utf-8?B?eEFDN1BRb1IyOVIzNk5SN0ZXeFZaWHpoMEIvWXN5a1UxTFp6Y0Urc1dlSXVX?=
 =?utf-8?B?cnVRUk5RN0NINktUSlVzejY4d2lta245NWdKVG8zQkVITXFEN0dnMkIyci90?=
 =?utf-8?B?NTRvVjdwNVZiZk4zQjNBMmpHTUFzTXJsTkQvUkc3S0NhbW55S1J1d3Awd1N5?=
 =?utf-8?B?L1c0bHlqVW1QTVc3NitSUE1vUXFhRnU2ZlNzM3ZYTXIyb0dBTDBrZG12aktE?=
 =?utf-8?B?c0kwamt3K1dkS2pMVkRYem5STVRySW85dElWQ0ZOaXJ6a0hESXMrNnRjWkRP?=
 =?utf-8?B?SFJ3dlgwVVNxZExYdmkvcnM5S0twM3NVcW9Ba2p4TDFkQWhkRXE2dzBKekM4?=
 =?utf-8?B?VVVjTGJlTmdtblZFbkVNRzJvSXBISHozb3gxVnhady9VeHJSSms1anlzV0Qw?=
 =?utf-8?B?NlF2a1NSMkRJSGpMTUp3bjFSaUlsQ0xzZE1sbTE4MUNac3RsVENmWUYzSTNo?=
 =?utf-8?B?cnl1WHBkUGhmajZ4WTF4NUVuTlVTNXlEV1VHaEZ3M3NHZ0Z5OGhDL3NqejRR?=
 =?utf-8?B?VEJrallETFR6YU1UTWx2Tzh5T3MrM2prT21HYW93M1MzeU9IMWNHWDA5NE53?=
 =?utf-8?B?a01EVGtFZlAwdEVuelVpS200bEJIRnpQMXdnRmVsai9zMVBuYnhDTExZT0xu?=
 =?utf-8?B?VVFab0tXZ2xGNEp3WHBDOC9NM0tPSVNmZEhkeU00MFlYOXREYlFUWUdVR290?=
 =?utf-8?B?ZXRicW9PaDVOTmxFS1h2YWljRG53VFlxYWNwQ2R0eC9KVzNJZU41R2RkWTlw?=
 =?utf-8?B?MVFka2c5NHM3bGR5TFVXbVUxMWp5c1pXWmFvVWFVRkhwd0U2T1EzUXZtZnNy?=
 =?utf-8?B?R0ZiUFYrS1BlalNvVy9TQlJZN0lPYVVWRnUzbTloaDMvbU4razhQY3VSQmZy?=
 =?utf-8?B?ZHNVTzZySEptc1JNbmZPQVVOcCtQcGcvOFBUMTJRVEljV3dMODFlckwxTjEx?=
 =?utf-8?B?eTBWUGQ2RHpoODUzY05pMWVjSWNtckUra1dmWWVPaW1hUlFFZ04rT1NOY1Yx?=
 =?utf-8?B?cjVnQU9FckNLYVJGTWpHL1FEM3RwZi9ydHZNNGk1UnNLWU1NOXQvV2VjV0c5?=
 =?utf-8?B?UlBXNGpPcksyeUd4d3loUlhZaFJJNzJ6SG9VUHQ2ZVVWYlVBcTdnTXkzSGlH?=
 =?utf-8?B?ZUt5dEtxQWdIRGhVTm96MEM4N2dwS0podTk0aERyaGkzb29WUUxZNnord093?=
 =?utf-8?B?SElzTWNhTGxRV1ZJcUJkdUxWNWFncDh4Q1laWmRxMUEvZ1RoeUEzUTZpbytN?=
 =?utf-8?B?NDlBTThoQ3VnOS9VU1F4Z2dqQUgwa3lhWllVU3ZhTWtVQjB6ZWcwVXB6VVlO?=
 =?utf-8?B?OGdtS2ZnTkM3dWZNZUhCL2p0cDFTallFWVR5SmlhV1ZNYVdMZ1JScklxY3VV?=
 =?utf-8?B?bEFyUFQxeXNGZDczK2dPUE1qN2NkQ2ZrV0dMOWtGamJGeGlVL2M5V2RIQ1Fz?=
 =?utf-8?B?dGtCTnBXMGhxdnRXTmE4dU00OVNoRVpEQlZNWGJUVTlnVHZWVnRqOVZLVHpT?=
 =?utf-8?B?bVFuWDFhUlE1S3ZOMGlTSFhTZFdya21LQ0RDQXpaSG9ud21BMzRMVWVGZWht?=
 =?utf-8?B?RldNTk5XeDdPNTA2Wng5NGFqRWNBMlVmMFpHYXVZY1lrTTZEWUN3bTFYdlhK?=
 =?utf-8?B?UnVNMFhwN0p5WC9OTTVTamUrZTlZWjFublpQVEhmc25Zdmw4cWJIOTFaV2RJ?=
 =?utf-8?B?SnRkanBhN09ENWdMb1lFOUVDTUtabDVKYUs4RnBMUXFyRmdtZVdrRmd1eEdD?=
 =?utf-8?B?TjJGMmpHdnVCUS9LWHk4blZKYXllbFhNdm1yV25aZHJYM2E5WlVCNDczNCtr?=
 =?utf-8?Q?t1moipGU0bz3PAA1unz0qjiSZI8j5jm4?=
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:64aa7808-outbound-1.mta.getcheckrecipient.com;CAT:NONE;SFS:(13230040)(82310400026)(14060799003)(376014)(36860700013)(35042699022)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Nov 2024 11:30:36.2365
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 44d058ce-123f-4ecb-6de4-08dd0d4494d4
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DB1PEPF000509FF.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR08MB8688
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 25 Nov 2024 11:30:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/207741

T24gMjQgTm92IDIwMjQsIGF0IDEyOjI3LCBQZXRlciBNYXJrbyB2aWEgbGlzdHMub3BlbmVtYmVk
ZGVkLm9yZyA8cGV0ZXIubWFya289c2llbWVucy5jb21AbGlzdHMub3BlbmVtYmVkZGVkLm9yZz4g
d3JvdGU6DQo+IC1DVkVfU1RBVFVTW0NWRS0yMDA4LTQxNzhdID0gImNwZS1pbmNvcnJlY3Q6IFRo
aXMgQ1ZFIGlzIGZvciBhbiB1bnJlbGF0ZWQgYnVpbGRlciINCj4gKyMgZG8gbm90IHJlcG9ydCBD
VkVzIGZvciBvdGhlciBidWlsZGVyIGFwcHMNCj4gK0NWRV9QUk9EVUNUID0gInlvY3RvOmJ1aWxk
ZXIiDQoNClBsZWFzZSBkb27igJl0IG1ha2UgdXAgdmVuZG9yIG5hbWVzLiBUaGVyZSBhcmUgYWxy
ZWFkeSB5b2N0b19wcm9qZWN0IGFuZCB5b2N0b3Byb2plY3QgdmVuZG9ycyBzbyBsZXQncyBub3Qg
YWRkIGFub3RoZXIgdmFyaWF0aW9uLiAgUGVyc29uYWxseSwgSSBsZWFuIHRvd2FyZHMgeW9jdG9w
cm9qZWN0Lg0KDQpSb3Nz

