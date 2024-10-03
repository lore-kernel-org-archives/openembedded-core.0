Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 13D75CF34C1
	for <webhook@archiver.kernel.org>; Thu,  3 Oct 2024 19:49:59 +0000 (UTC)
Received: from EUR02-DB5-obe.outbound.protection.outlook.com (EUR02-DB5-obe.outbound.protection.outlook.com [40.107.249.54])
 by mx.groups.io with SMTP id smtpd.web11.6123.1727984994382884045
 for <openembedded-core@lists.openembedded.org>;
 Thu, 03 Oct 2024 12:49:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=B+gM8zVe;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=B+gM8zVe;
 spf=pass (domain: arm.com, ip: 40.107.249.54, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=hDcdxHk1wbaws9iWYRnEBoHT4PFbdX/zJDv5ksyrqZfLg9uMXjCJOkEABIVHBbZDJO7EywjQQQNebSg6n6cqgu9X+g7nfsIirfSHO31thArfXsLMEe2NBkbmPlyjPVMoG/V2JpVwO2JT0Emt6iuAZPO3hL1NStoqtGfRf+nPCFOLJOjwR9u9nfHYbAMh55WUJS/dnnLjpskszjQbTrDb1Q0EovLiZEb/qNgTJtycuWhpmPtLwbFhqrERAMABs8JRFsTmWaQ+Vx0TO3ZGJet9DXW+PDeB26Gn+8EctkzZt85QjuTye6uDPuJDY9B9XpApyoqhKItY4GqjJ3c7UsvgjQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BeIvHo92pwVf+v2jG0SeyM1DZWFT2ZpdJ4pMp5HHNT4=;
 b=A6iyh96vlI9tjFBgHSEWLwOxkqzcSG0q/H9QkbzIU14KjCGzOnTufxQH/otxtK2Rfl3tbFxDsHXSvJR/WYFvhhW9kiSzm0sXB45/ua8sqlWIERNg4IlYrTy5vqdyv1LTXfOVyeuY/DNo+sRtTOn8apixxF+ArsN8F1o7gJj3FlMmHNXfWAlHHcIMcQ1BH2aMWW98BE7wF6SgHGZFMFrOd/TN14jXsj3sD8SPVysSrliKTnK11FTvP4qbViNj5vcglKEPrR8RLbr077TSbzY7Zs9DuB1ZBt25tDWGiEyomcULTRT+1rTxDYrm8VuR9+LbeX578KCwF8hzWlziN9mdhA==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.openembedded.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BeIvHo92pwVf+v2jG0SeyM1DZWFT2ZpdJ4pMp5HHNT4=;
 b=B+gM8zVeMTrVwIKk3c8gfio3UT1xQ+N7aOLLY/nNnWG5nA1AjseCzO4Yo7R1NoMH9Q/V3W8ShqclKwu3PkdNtuEwhD7hcMWpu4+13YzBBHZNlCxb5wcZuDfHOEkhdIE5HsLaMkxpW6/UGu/SpxQyyRm7ZZ6mW93Rtk5glBXVUdY=
Received: from AM6PR08CA0037.eurprd08.prod.outlook.com (2603:10a6:20b:c0::25)
 by DB9PR08MB8290.eurprd08.prod.outlook.com (2603:10a6:10:3de::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8026.16; Thu, 3 Oct
 2024 19:49:50 +0000
Received: from AMS0EPF00000192.eurprd05.prod.outlook.com
 (2603:10a6:20b:c0:cafe::b4) by AM6PR08CA0037.outlook.office365.com
 (2603:10a6:20b:c0::25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8026.17 via Frontend
 Transport; Thu, 3 Oct 2024 19:49:50 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AMS0EPF00000192.mail.protection.outlook.com (10.167.16.218) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.7918.13
 via Frontend Transport; Thu, 3 Oct 2024 19:49:50 +0000
Received: ("Tessian outbound 0362136859cb:v473"); Thu, 03 Oct 2024 19:49:49 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 023b69a98b47d6b6
X-TessianGatewayMetadata: Iv/kTfVExaVHXPz8PupRZ/YL5nu7fT27TIybGTBBRoHrjW55mshaA+4u9uaH0ASsA4/6nVS3ezPmXeOaeJEdN9EgnXS/dxoJZxvOJq9sGampLvYA4T759Jos9CYkuQDTYuETFbDjOQNcb5P8r3zsDjvOj1/JWNgkaZO/88sy2nU=
X-CR-MTA-TID: 64aa7808
Received: from L4968a04d8b0f.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 742E6BA2-3118-45E7-9BC7-E5DAAC3A0176.1;
	Thu, 03 Oct 2024 19:49:43 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id L4968a04d8b0f.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Thu, 03 Oct 2024 19:49:43 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=koO0hOuFLlCRZqiyAmdixYR940J92eIrmCLnM9lLlAkaZGuV5Hk1GGEXOF5nAW9JTMUtw96A5coH7/x3tTiuTaJ1GuKJzgwO5saSqAokby+l0B+54TjAwnpyaGqhJHSA7+qJxph1lh++iiU5gHJ2zythH4UAHTnKLI6vGUpriSXF4EbfvltrpSYt7kX+8C5vvddnFdIyWt2IPMup0bDhembxcQ1D7MmKLVDLD1w/uM++9CVw97odKIn0LX122WTSzP2FIqQtiGy7ylc/31klxHq1/kzzpy8lUE+G/7ZXpucnVaWs31hOYJg1hYs+Z6LfIPIFz4VgKlMs3Ie/4a3P7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BeIvHo92pwVf+v2jG0SeyM1DZWFT2ZpdJ4pMp5HHNT4=;
 b=MssEGBnh5UhOSA4UNpj56Tf6XxOkFuayBA5D+LGclyCdvVHGL9groJsu7sUDDzWIyiHo25RV+TJZPZ5qipOW5noyeh7ZfWOiXuWYc9jSr5ZA1dMqUK2PaNOr51J1EAL64rpdDi+fhwAcIuuCCcf1PxzBUMYj4JpgyaVoWZeKXU2q94yh7ThJTF6BxQaYKo4gzE7Jf4hPDthcOoqUvMsR379PWpWk0h125tTiMlaxPb0+/vEJyAOy+RtqZlF2h8/IF5cpl2pjeHoDAxxS6zXM8o/HgTtqGIQ3pfojRCNenrTaHiDPovuMcK2UN+nkARN/i33iWPfMuRZkUrhnWB2Lxg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BeIvHo92pwVf+v2jG0SeyM1DZWFT2ZpdJ4pMp5HHNT4=;
 b=B+gM8zVeMTrVwIKk3c8gfio3UT1xQ+N7aOLLY/nNnWG5nA1AjseCzO4Yo7R1NoMH9Q/V3W8ShqclKwu3PkdNtuEwhD7hcMWpu4+13YzBBHZNlCxb5wcZuDfHOEkhdIE5HsLaMkxpW6/UGu/SpxQyyRm7ZZ6mW93Rtk5glBXVUdY=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by DU5PR08MB10680.eurprd08.prod.outlook.com (2603:10a6:10:525::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8026.16; Thu, 3 Oct
 2024 19:49:41 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::9206:40ba:ef7e:729e]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::9206:40ba:ef7e:729e%3]) with mapi id 15.20.8026.016; Thu, 3 Oct 2024
 19:49:41 +0000
From: Ross Burton <Ross.Burton@arm.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH v2] strace: download release tarballs from
 GitHub
Thread-Topic: [OE-core] [PATCH v2] strace: download release tarballs from
 GitHub
Thread-Index: AQHbFcz7qsyj1147KEyWOzYMRihqerJ1byCA
Date: Thu, 3 Oct 2024 19:49:41 +0000
Message-ID: <F359E249-B289-45A9-BBF4-37934871A3D0@arm.com>
References: <20241003194631.3250792-1-ross.burton@arm.com>
In-Reply-To: <20241003194631.3250792-1-ross.burton@arm.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3776.700.51.11.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|DU5PR08MB10680:EE_|AMS0EPF00000192:EE_|DB9PR08MB8290:EE_
X-MS-Office365-Filtering-Correlation-Id: be16991d-d9ef-4c79-e829-08dce3e48ae1
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: 
 BCL:0;ARA:13230040|376014|1800799024|366016|4022899009|38070700018;
X-Microsoft-Antispam-Message-Info-Original: 
 =?us-ascii?Q?TD9k3d49RfsGhuNzrOLRqGqPBkof8eSAsy+ExUi4YuoJiA01nHi92/GvIUSC?=
 =?us-ascii?Q?CHjCt3B+41XMSkS6bAqFbkuzndQyc68zWwrvRzRp3I82/TtbdN75vA59D0eB?=
 =?us-ascii?Q?W8Wb432whAr2MGMFhYAhWjGe8OOmkNBeUE8sMiElX+UxHxDEzTGBP2rA1qWx?=
 =?us-ascii?Q?cFCpvzmMbfPLCp0ipQB9FSfCPlRSslPTj/dwMo7P5TyA+8+IbHUHwdjCXxFF?=
 =?us-ascii?Q?VWov+NpThJJNYdZuuSbkfNelsKXS573WgOM/McFINJCLKdNsMnl/2p8sDuk0?=
 =?us-ascii?Q?i+7r1Wq+C/4J0ydk+ZyNAG14aSnr7xqP0EJFDfy8eF164cG5Qir2ruEpJ9SX?=
 =?us-ascii?Q?pAL3IoDBKGob4Z0CUXqQV9usQtA+wzJtLnVJzy70jej2U/NxuZNE8LcZoX6c?=
 =?us-ascii?Q?Lr3It5AFk9V3/VympQg1KKtzCQpJYzvsNg/I0GJhXjqqxoB5sTGM8tcFIWKW?=
 =?us-ascii?Q?oajxIOLCzUjzP41U71tHqof6fJuIhNXnOKKi3Eku/nrNGnJC36BDejtXdY9u?=
 =?us-ascii?Q?rnIQJtlJlgVk7DZ8hRhjhJbNENB8k1gaeztVQKXTCr8L6BnUMdwf2FPXfsZE?=
 =?us-ascii?Q?xxhKQqNJ/j26DDRGdn1mFGX/RBgLledw2KRhfhcP6h/FhBKpj0xiyJ+2G7mq?=
 =?us-ascii?Q?ffm4QyAsUq/aV9Jf4vjQ/M1JVyqWiUzgljx2y9Hl5VEg8eB+4uIQaLYTyDDK?=
 =?us-ascii?Q?StG+AIDiI+Yss2BhOYseGgsAu7sVBF8EvEWoCIq+21EsTsuExZOtguMu9pYm?=
 =?us-ascii?Q?qkodq/dObD22Uq3lh9Dcr0Qn6c+RJBCcC3fUyPPWy2v/3DzfRJhgAVWovADC?=
 =?us-ascii?Q?lPhitqDFkHmfXFw4GzBBSx0UWQPQOzQViUdl1YUDkOSsJ2+1VI3FLzaQ0dML?=
 =?us-ascii?Q?XHegm45IJZW051s8sCc44SUK+gXOegkX63Kro5HaZL/QkWnTJcOVg3/0tjYC?=
 =?us-ascii?Q?wKTLpQ4CUQaFONAOxQPrwc0Hf6tSDy7c3gnuywoplbyjbm0z9isA2yRD5uhO?=
 =?us-ascii?Q?9bX2c1TK03p3T2y1J21CyHXlUIwMbw2S8YfWRvokpvYI8HYLi6aJNk4iHK/N?=
 =?us-ascii?Q?p+wmLRgWWfceonJp2OUErQ/N42ln961ATnFzc8Bi+hOXpvUxfhpv2XiqYyGX?=
 =?us-ascii?Q?Ve4GUGDGTytDbR92rYScZzz/Dt/OMrZMsgOIBf6dI9IFquIMWcDQvF8qajOy?=
 =?us-ascii?Q?66H08BNx1pTLiPGe9TbkrthSisNTXx+LoO6uijsFU/TydtPBP84Dn22rO3IR?=
 =?us-ascii?Q?VtKeQB5gdOW6rX3qSES3F5n+kJ06eRA6yKjq241JwbW1vmdbE4a2V8itLkHz?=
 =?us-ascii?Q?e3Q=3D?=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(4022899009)(38070700018);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <BE2A49127E739D45BA49579EC41B1BA8@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU5PR08MB10680
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-SkipListedInternetSender: 
 ip=[2603:10a6:102:2a3::12];domain=PA4PR08MB7411.eurprd08.prod.outlook.com
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 AMS0EPF00000192.eurprd05.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	0696ea58-6d70-4a33-8511-08dce3e48599
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|36860700013|1800799024|35042699022|4022899009|82310400026;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?0gk5LweYc+JIF5VLq5xuxr8U37nl46/ZRf4dQvlJ+u3sp9s2q8VB5q07Up3J?=
 =?us-ascii?Q?OhXwybxBERCriTbbWoi4A45g8flRMegwpTrOC6FEX4ZW9IXqmB9VmgOUy7Yg?=
 =?us-ascii?Q?51rnTb1dfFSBZzmFppwACqIfVDVv1CfMLglCH0qYoVnvPmhp5oZgvGAZxVoU?=
 =?us-ascii?Q?HNC6w3h4tXOCySdFeD7L53H/DNIxqW4QGaof5JYA4z4up7+7TgJAGD8wkWIL?=
 =?us-ascii?Q?f125On9x6MOmpTgcfm0zZtyiCyca2PjkP1YvrIFrJiRIqjblWJ8mSxGdmJ4v?=
 =?us-ascii?Q?cOuujfSEjk9efkUY9EewaycnjkuBPEUizN4N54eHnwMgSIOZO/hyMlFFb0w4?=
 =?us-ascii?Q?3sgky81iLzgdJpMYkUZps8Ycr6YvEQDb9CFi4SKhdrEFzeXhEOumky8DPxqS?=
 =?us-ascii?Q?WOScwuRY2LhLkeqpL+rFBtPEG4olTjzerRwycOwirbesqzwrS7ymIRDaubgl?=
 =?us-ascii?Q?86yeOHsLWiyosk/O21+Npa/DupTD8SNnJXILbYVAgtQKhE18ylh1qMB9cn4U?=
 =?us-ascii?Q?17/k03JNU8cker5uyq38x3nvb7cH+7SlLIspdnCRYCQ7VeDpQ2GkDWVzBkDz?=
 =?us-ascii?Q?HS5b4rjKK+ucjvD8DOFpjKshWVVf2BSpOBAVv2gGzPU3/HGD95T2I/VqVJm/?=
 =?us-ascii?Q?YS5Lfy1i0JmbrfrHDF5FuLP0aglNgFKYtgIV7yr4s/uuKR+pfWJPGDmnGiWB?=
 =?us-ascii?Q?9l0uDIyxOxXs7+9VfqEXWq17y3pG6ZFRHTOr1PI8qNEPPfXiEVfKklBFJQjX?=
 =?us-ascii?Q?6NlTAqs/5+COBQpSsLzHQuF0BK9qUazHX/m+7fiat8AoVs3WG/cCVx9tHNZq?=
 =?us-ascii?Q?Q1LqB8WOzPqO5aYTSTAq3y29xt4ps/3HnmKbd6fquifUu0kQGzKwziOnMHyw?=
 =?us-ascii?Q?nb1dHFeoguNnATq+dXjzAvbjnN59Y82gDy7KknGxxDlP8mmliC/YWpMP9aY2?=
 =?us-ascii?Q?b7dnLuqtKS4XnwRJ9UHdoOSC3fYDafuUSQo0O+WevvUOYG+cZwfcRCEXP0P8?=
 =?us-ascii?Q?MJwdHdb8umDffSBpslj15F1T+ATPt26THhYIn1SQ7MBn13Qm5OsX/FgSuvIQ?=
 =?us-ascii?Q?rEeC727R0rFWqgWuAdZunemPREmmIPVlKjAJ9O+eZckcAH+jT5nyN/C/o0no?=
 =?us-ascii?Q?3+uklBMsmBFpFijYz15rZhEiw+SdB3ykwYaQfcu7ZAg9GgekRT5Rf1H49wzC?=
 =?us-ascii?Q?J2kQcQ8wRMDKuX1MRjEeBp4M8Rn+WIXzzczRe9LJms3dqrh1Ga724QiopWtF?=
 =?us-ascii?Q?uel76croxvnxCfbfr9yzykrgjGuaoGTPEVcEdmYRgt7OIJNIjtO0/ikGzhCg?=
 =?us-ascii?Q?7Dj9Zs5QTH7bGP9TlXWPgQ5paZMLv+TcLSy8QqlkRu70JA=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230040)(376014)(36860700013)(1800799024)(35042699022)(4022899009)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Oct 2024 19:49:50.1408
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: be16991d-d9ef-4c79-e829-08dce3e48ae1
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AMS0EPF00000192.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB8290
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 03 Oct 2024 19:49:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/205214

Oh I see what happened!

> On 3 Oct 2024, at 20:46, Ross Burton via lists.openembedded.org <ross.bur=
ton=3Darm.com@lists.openembedded.org> wrote:
>=20
> Switch to downloading the release tarballs from GitHub.  Their CDN is
> rock solid, and strace.io is hosted inside Russia which some networks
> are blocking.
>=20
> Signed-off-by: Ross Burton <ross.burton@arm.com>
>=20
> diff --git a/meta/recipes-devtools/strace/strace_6.11.bb b/meta/recipes-d=
evtools/strace/strace_6.11.bb
> index d98b5fdec9a..a8f11ea8093 100644
> --- a/meta/recipes-devtools/strace/strace_6.11.bb
> +++ b/meta/recipes-devtools/strace/strace_6.11.bb
> @@ -5,7 +5,7 @@ SECTION =3D "console/utils"
> LICENSE =3D "LGPL-2.1-or-later & GPL-2.0-or-later"
> LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D2433d82e1432a76dc3eadd9002bfe3=
04"
>=20
> -SRC_URI =3D "https://strace.io/files/${PV}/strace-${PV}.tar.xz \
> +SRC_URI =3D "${GITHUB_BASE_URI}/download/v${PV}/strace-${PV}.tar.xz \
>            file://update-gawk-paths.patch \
>            file://Makefile-ptest.patch \
>            file://run-ptest \
> @@ -17,7 +17,7 @@ SRC_URI =3D "https://strace.io/files/${PV}/strace-${PV}=
.tar.xz \
>            "
> SRC_URI[sha256sum] =3D "83262583a3529f02c3501aa8b8ac772b4cbc03dc934e98bab=
6e4883626e283a5"
>=20
> -inherit autotools ptest
> +inherit autotools github-releases ptest
>=20
> # Not yet ported to rv32
> COMPATIBLE_HOST:riscv32 =3D "null"
> ---
> meta/recipes-devtools/strace/strace_6.11.bb | 4 ++--
> 1 file changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/meta/recipes-devtools/strace/strace_6.11.bb b/meta/recipes-d=
evtools/strace/strace_6.11.bb
> index d98b5fdec9a..a8f11ea8093 100644
> --- a/meta/recipes-devtools/strace/strace_6.11.bb
> +++ b/meta/recipes-devtools/strace/strace_6.11.bb
> @@ -5,7 +5,7 @@ SECTION =3D "console/utils"
> LICENSE =3D "LGPL-2.1-or-later & GPL-2.0-or-later"
> LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D2433d82e1432a76dc3eadd9002bfe3=
04"
>=20
> -SRC_URI =3D "https://strace.io/files/${PV}/strace-${PV}.tar.xz \
> +SRC_URI =3D "${GITHUB_BASE_URI}/download/v${PV}/strace-${PV}.tar.xz \
>            file://update-gawk-paths.patch \
>            file://Makefile-ptest.patch \
>            file://run-ptest \
> @@ -17,7 +17,7 @@ SRC_URI =3D "https://strace.io/files/${PV}/strace-${PV}=
.tar.xz \
>            "
> SRC_URI[sha256sum] =3D "83262583a3529f02c3501aa8b8ac772b4cbc03dc934e98bab=
6e4883626e283a5"
>=20
> -inherit autotools ptest
> +inherit autotools github-releases ptest
>=20
> # Not yet ported to rv32
> COMPATIBLE_HOST:riscv32 =3D "null"
> --=20
> 2.34.1
>=20
>=20
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#205212): https://lists.openembedded.org/g/openembedde=
d-core/message/205212
> Mute This Topic: https://lists.openembedded.org/mt/108805952/6875888
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [ro=
ss.burton@arm.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>=20


