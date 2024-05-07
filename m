Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EDA90C10F1A
	for <webhook@archiver.kernel.org>; Tue,  7 May 2024 16:02:26 +0000 (UTC)
Received: from EUR01-HE1-obe.outbound.protection.outlook.com (EUR01-HE1-obe.outbound.protection.outlook.com [40.107.13.40])
 by mx.groups.io with SMTP id smtpd.web10.15711.1715097746178886216
 for <openembedded-core@lists.openembedded.org>;
 Tue, 07 May 2024 09:02:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=R/28KSO5;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=R/28KSO5;
 spf=pass (domain: arm.com, ip: 40.107.13.40, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=QhZFTgt0rTpgZ+5Pmsrui1wA98nMh7qgd3MQV8RAByE8FIcX7LWxzVMxqu7PMqyHwk1tPRFub1LskoXt9AyazxIaMtw/q8RAAe6oSOWio2PuH/ruqf2qSG9OE7Q8HexCt3n1kxyg5xd4xqdIQjwA+/bMlDYzjqBBAK/YEZ1fxf6aUlSq7eGr8o7GnW8y1mRvVqd2op0hGwC5+K8XPRybPYdUUGwdEU+RA/tLAvCuOyQ5a/ivFokgHNJKyv9SE3bxsTgKho0A6aNdeTZMKZ/KsjkW4/IV+r6IploX7nv5GXGRNusl7+PDT/1jcZUf+XFMsmIgrHv078Ux7abAkJqUlQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=J9nuXmfP6a3wfogY3jthAtGIji7PhaUKjwiEDroz3OM=;
 b=FVogPOkjJwkjYv6qrgB/dxeOHkK9HBU1LnFbfaxD0zK/IETwGLUCn5gXm7ARTJQSjXwUb6BBBhGFT8Wp/sbmQSDWh12IDpD0GwSUfI4XlADzFV/8VjEMhiCMIa/AVgngMbyCXI3Cdu3jfdfEJC4z+6lTTM5NLAZUq6AU12fhmLvUmiwP7+NZs+0eCoBZ5Rx5HhQnqwnAZretiIylYQMeuOubj++RnoMZsi1sxi/ZxbqAmbFUVUyLfQbPrqHA1tvXDMyyNf/8ewPnlBfBjrdlxNGeETlQvQBTUAmsBpxFFInviAJ3zb9ehIJ4zD3qkpk7hRf4M6GpgFqZQwsRUg4zUg==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.openembedded.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=J9nuXmfP6a3wfogY3jthAtGIji7PhaUKjwiEDroz3OM=;
 b=R/28KSO5waYJj+S13jLva4J3X+059aT/hK4EFn0CgepMF8Jor9dvfbaLyHAQVCfmIgR8H93DgQpmdIGaaUwvmnXU/24kF7DL7NEXyo5sLlxmV3KUHpez9OoZUVfrIRwdMsB0AJ93TLlaZ2XbWnwaXIju/9sRQiPfpuJksMiSn7w=
Received: from AS9PR05CA0323.eurprd05.prod.outlook.com (2603:10a6:20b:491::13)
 by AS2PR08MB9197.eurprd08.prod.outlook.com (2603:10a6:20b:57b::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7544.41; Tue, 7 May
 2024 16:02:20 +0000
Received: from AMS1EPF00000046.eurprd04.prod.outlook.com
 (2603:10a6:20b:491:cafe::8a) by AS9PR05CA0323.outlook.office365.com
 (2603:10a6:20b:491::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7544.41 via Frontend
 Transport; Tue, 7 May 2024 16:02:20 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AMS1EPF00000046.mail.protection.outlook.com (10.167.16.43) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.7544.18
 via Frontend Transport; Tue, 7 May 2024 16:02:19 +0000
Received: ("Tessian outbound 85e363419cbe:v315"); Tue, 07 May 2024 16:02:18 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: db62195db79e9b58
X-CR-MTA-TID: 64aa7808
Received: from eb5d6c032f2c.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 4A756528-DAD1-48D8-9D1C-B8261C9AC076.1;
	Tue, 07 May 2024 16:02:12 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id eb5d6c032f2c.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Tue, 07 May 2024 16:02:12 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MfIFtFFdCIzgLp5BnK4ATMLXNDF1nd/zki2D7rNam4i2hU9BpHfDF9bkEPWQTBjbb2ldbPEkup+d9Hd7oALQjyF2CNPZp/8qVZcMazTmX19FfCQCG0ciQ/RSAVP/+7MaX780tjKErUM7iuce5b/UCVCb8XpBOxodZFlAmjMVU6q3I8bU0B2GpcMZTi/WLpHrla2oEeyfFdx+CK5LhrqlcqGyps9nTKsTStReXftHprvCr20iNl/F+ZPPFiPGKV4thpOdpVN/DTvic+rWK1yNEqROZgmfWGYGlzHdgHcq1AzTE+lV3+stPl3fzXfVmLnipbmA2NJSyeizDPvPJBQv+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=J9nuXmfP6a3wfogY3jthAtGIji7PhaUKjwiEDroz3OM=;
 b=Q0IXL24CDB+ZTmQchvaOfIgWeBQggID2J6RIR68vOsJ0gmLV0ZzRo66CEaitM2y/PmQUw3NICmkb0OEYy9QI6rYWaAhr0c25a7JpfjHkMdCBrj4NfloDC7niouP1QsxWxJkM5IxfH4BMtcJZqZyWtohhfySW9qB/GdHlm0DafPOqVJnbpgKl1CU7k/sgTA5aGESyjfvdEsTjm8zdNk2w9P+J2qAJ8zl0z/a2oZrG5TnblCbbQKErtdXAvc2alaLca6UEgrTh1BHseX7wTTeOYBboYMvqFOTAI3MyL4OWWnz5hoONV0poGJ7m8wwzIAKuYrqWE5UnqY+qzsQ9MbkjUQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=J9nuXmfP6a3wfogY3jthAtGIji7PhaUKjwiEDroz3OM=;
 b=R/28KSO5waYJj+S13jLva4J3X+059aT/hK4EFn0CgepMF8Jor9dvfbaLyHAQVCfmIgR8H93DgQpmdIGaaUwvmnXU/24kF7DL7NEXyo5sLlxmV3KUHpez9OoZUVfrIRwdMsB0AJ93TLlaZ2XbWnwaXIju/9sRQiPfpuJksMiSn7w=
Received: from AS4PR08MB7429.eurprd08.prod.outlook.com (2603:10a6:20b:4e1::9)
 by PR3PR08MB5660.eurprd08.prod.outlook.com (2603:10a6:102:8d::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7544.42; Tue, 7 May
 2024 16:02:09 +0000
Received: from AS4PR08MB7429.eurprd08.prod.outlook.com
 ([fe80::bbc3:7fff:f224:c584]) by AS4PR08MB7429.eurprd08.prod.outlook.com
 ([fe80::bbc3:7fff:f224:c584%3]) with mapi id 15.20.7544.041; Tue, 7 May 2024
 16:02:09 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: "alex.kanavin@gmail.com" <alex.kanavin@gmail.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>, Alexander Kanavin
	<alex@linutronix.de>
Subject: Re: [OE-core] [PATCH v2] glib/gobject-introspection: update 2.78.4 ->
 2.80.0, 1.78.1 -> 1.80.0
Thread-Topic: [OE-core] [PATCH v2] glib/gobject-introspection: update 2.78.4
 -> 2.80.0, 1.78.1 -> 1.80.0
Thread-Index: AQHanHwq3o9YIJa6xkieUqjnpyfnG7GL9tCA
Date: Tue, 7 May 2024 16:02:09 +0000
Message-ID: <67975856-DA2C-4263-9B7F-90583C4F37F4@arm.com>
References: <20240502103252.1102710-1-alex.kanavin@gmail.com>
In-Reply-To: <20240502103252.1102710-1-alex.kanavin@gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3774.500.171.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	AS4PR08MB7429:EE_|PR3PR08MB5660:EE_|AMS1EPF00000046:EE_|AS2PR08MB9197:EE_
X-MS-Office365-Filtering-Correlation-Id: a1bd9977-7804-40c9-4739-08dc6eaf12ac
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: 
 BCL:0;ARA:13230031|366007|376005|1800799015|38070700009;
X-Microsoft-Antispam-Message-Info-Original: 
 =?utf-8?B?d3ZnMmpxSjZ1eXFac0tJQnBOOHVkaUNlcWZkWGNXNi9HSUREdjhoNHZVU2pX?=
 =?utf-8?B?b0NUek9NK3BhczhiSzdjQmIwOGI0YlZIVW9tYmNyaVErN1BDOXdCclpGUjg4?=
 =?utf-8?B?MThLb3BiL3cya2FOYUZUVXhzbWNkWWEyT0IxSWJGZTk2QnAwWmlxcjZuZ2JT?=
 =?utf-8?B?Ykx4a2RRZEUxdzMvQktmdkkyK1ExNFlxemNRNlpLb2Y3TTN1cHo2Q1FWcVZj?=
 =?utf-8?B?OTFTRmRZY25Wc2FrSjJuNS9tZFNXeHE0M3BmRVJScG4rUkpibUtQU3JzSUZa?=
 =?utf-8?B?eEFVUXFQalJFcEFWUngvTFBoNkJiTDB4YWQ2b09qK0pzYkZ1YmRHcFg2RjVE?=
 =?utf-8?B?WUhHZEx2K24vdDJaUFhsM2lCcCtOZ0JTd0plZ0VQYmk2S2JjU0R4ZDE5T1l5?=
 =?utf-8?B?K1NqQU5yeTNTWVBhbTU4YnpweWI4ZGpPSVlzc2lmRHRPNEpYS2dXWDF6SjFZ?=
 =?utf-8?B?L0hYWW56WU5pYS9yaThUUTRUckVDU3EvMTRYMGJmRjkzcDNVZXVkWSttOFpp?=
 =?utf-8?B?cTBjaXhqdFVIZUdqL2ljQ0hIL1ZoVFpWdngrcEt6NCtZQ2JoY1NWaHFyaEF0?=
 =?utf-8?B?aldvelRIWGg0Q3AwQm9zczdjWUZBRk1ldUhQY09EMmNWVENXM1RGWE0xYU50?=
 =?utf-8?B?cnlsTTlxZXdoWHBtSVJOVXJBZFhFZ3NuU2dBTnFTYnY0TVgzemloaWp4SkRH?=
 =?utf-8?B?a1ZiQmdqV1RLSmVNUnlnSjRYSEcxRFBPa2YrRlE0aGY5RmUyQ3ppQS9xOW83?=
 =?utf-8?B?TTNweUVTYjlXYzFtKzdUeE5xREFjUTRubkRjUGtGUThLaVJGeU9EeEJmQ3NH?=
 =?utf-8?B?VDZoNCtxTTJON2dBbmZiRUVyRTdkdW9lSFJmOUJYT21zYlNyOHlHK0RxdjQx?=
 =?utf-8?B?blRMVXdUeUlkeURrR3NTS2NlNFIvY3ZzSElHYlVJWnhQMDJUd2w1Q1Z4ak5m?=
 =?utf-8?B?SUpUYTRNTVJoV29uM21FcWpVQ2t3UUNkU1FROXRhNXd3a0prajBZcnFGQmZO?=
 =?utf-8?B?Ymt1OWVqTWFWdEFKam15ajl2SG1TTWhpcTN1TEtPQnYyMkdzLzBJNmY4bmla?=
 =?utf-8?B?R2RWcjgwUDJHVFU4QmRhS0IvSTRiVDFwMkdZL2hjR05QWnNrVW1YK2o3cE9a?=
 =?utf-8?B?Szd5ZlNNVHNMOU54dE5Ndjg2Q0VQTGRmaWpPMUszNE1MdjIwMndWT0l1VFFC?=
 =?utf-8?B?MWNubXFYdlJoUHdTRWFZNDFWYUxXM0NNcjRNaHBuOVdqcDJvNmpIZkFiTnc1?=
 =?utf-8?B?UURjNTM0NHlxQk9ONkxwRWx2T1hMRVlBcm92VEhaVVc2RnRMczZEQ05zY0Ur?=
 =?utf-8?B?a3NXZDk5WW8rRkZWTGd1b01CeVpEMGFaQnRjL0pNVEdVa0FMZjJlL21uM2Y3?=
 =?utf-8?B?TFU3TzM3ODdYWHlaamQ5S1dmTHZFQW9KaXN6S3U2QnpkTzJXeW5nUnVGdDJ0?=
 =?utf-8?B?TllqNjI4Q280dmtrSnlLWU9UN05OTkpndDRLcDBIL0U4eU5JNFN4aVd4WnRr?=
 =?utf-8?B?eGdxN3ZuOG9Yd3lwQ3lHMysxcVVXTzlEZS9oTXlJSzR4enNoWjFqaTRSR3F4?=
 =?utf-8?B?MERsSWJmK3IxSFVCa0FsVlVDWkEraWNNdnZ1RENwWW8wS01mQ0ZBckhmaVZX?=
 =?utf-8?B?eEUyNlVDOWREbmJNN0RMOUpXazRuN3QyVGhqSzVPZnJSVndQS1pxZ3FWV3Vo?=
 =?utf-8?B?dUZMT2V6UzZPVVZ0MWtOWmpDT3psOHBtWTNzZ3V2VHNZd0diQUhRV1BuM1BS?=
 =?utf-8?B?QkJVYm9UeVhEREV6WldMN1hBRkdFYUlnYWt4b2Q3NkQrdHYxQmwxN3EyaERm?=
 =?utf-8?B?U1ozbVdMU0dtVk9yYlpZdz09?=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS4PR08MB7429.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366007)(376005)(1800799015)(38070700009);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <0271FA43A44402449B0CEE03D4D9E677@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR08MB5660
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 AMS1EPF00000046.eurprd04.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	6f7cb503-1ad6-480f-dd4b-08dc6eaf0d22
X-Microsoft-Antispam: 
	BCL:0;ARA:13230031|36860700004|35042699013|82310400017|376005|1800799015;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?T3RkaDdnc0hpVXFybkJhVGVmeEpySEhXRks3OHVldTFZVEpTYzFSdm9zNzBh?=
 =?utf-8?B?QmxMQnNPekVLbmJaQW1WWmhoT1hsMzVteUdwVmpJU2FwWmJqWXhsY216SGdi?=
 =?utf-8?B?TGNGNkZuSmVkcUsvSkRsM2U0ckxsbElLTE92dVFyOXI0Z0d4b09GOEJkdFFX?=
 =?utf-8?B?R255N1pLU0g0TU1OdWNUNUt6ZHhmcWtvajBUVGdycm5RQnA2OGV4LzNXdkV2?=
 =?utf-8?B?OWVNdjEwbXJZd2pkNWJUbzZub2xYNTRtY05mYkdWb3ZjYnUwckU2a01mTXEr?=
 =?utf-8?B?T1NYcXo2OXpvUFdJQTFiL2F5emhra1hLQjUrOUhqSVRpZWhJM243aG9STFpt?=
 =?utf-8?B?THRrOXFJdXMvSHBGZk9TSzVDWlVNNE5IZVBWSjNLVjRKN0ZCYjZ2bFJwWDhm?=
 =?utf-8?B?aUpnaGNKS2R0L0dTT0JYWHpSSUVSczFNb2JCaThSVTlVK3VFMEh3SVQrNWsz?=
 =?utf-8?B?MytYdmJvZ1hwYTVSeEhtUlRyTU9rQ0JMM2lraUtidWlnU0p3c1QzTktVNmdO?=
 =?utf-8?B?QWRsVXhFcVBwSmc1azZSeGhtN3E2TE96N2hFYmtjRmxmYVZ3NGNhWWpwWUlI?=
 =?utf-8?B?R2p2aHROUGtuYzdUdDRscHJxcWZpRjlwbkIySmxZZXkzOStKaDR0cnBXclBu?=
 =?utf-8?B?aFc3VEplYXRoTDZhdUJkN3B1ajlHRnV4bUxETDZ5MWJVNDNaaDU2WmxjeXVD?=
 =?utf-8?B?THNES3htOEV0ZDloN1RENndPNmxhTG9mamNxMWpVWWxWQUxqUXF2dDBscWc1?=
 =?utf-8?B?dGFYS1NzOFgzckc5Vk8xaXRkMko2WG5YMjhHZStXV3o5cUN4TjdmeGdWRzJU?=
 =?utf-8?B?NVlTM2x5TDhDVHNteTM2U3pRcHhxYkJxdC9HVkc2THBZeVIxb0gyVzFLRHAw?=
 =?utf-8?B?Vmc4VjVrWnZpQS9YOXpoWGdyRys1VXJtcHRxK2NqZm9iMVArNGZ0T2pNQXl6?=
 =?utf-8?B?ZE5oLzNibUgyNnZnWXJqWU1MZS9naDgyQ3FQVUU5aTRhNzBhaEFWOU04QzQx?=
 =?utf-8?B?czExSVpSNkZ4L1JPaWVIM2MvOEx0KzJyTkRjUzhObGFHUjBEVzZ6ZGJQaHQx?=
 =?utf-8?B?UmY5N21rT00zL2N1N09MQkVQdWg0QTFXN045TW9JYjdvKzYyd0ZzRVNFV0xK?=
 =?utf-8?B?VEgrZTNEZE9ZUGRaeEdpbHNzazhnODBjTmFkdUZiWUtQMzhqL2gyMFo1RzhK?=
 =?utf-8?B?VlVxRk1KUlFYTVVwL1V2T3hEQk9FbjhJR1dObGR5S092WDBuQm45M2Vvc0Qz?=
 =?utf-8?B?WGcvMVhyaFFRajFKTlJld3pkRldaaFU4SjQwWWgxSWNXSTlKVVVGeXdnYytC?=
 =?utf-8?B?YTY0T2JMT294MVdLNVppWURsOW9iN0NKTTVWVkwySGlpOExZaW9OWTNXVGVS?=
 =?utf-8?B?SERXY1ZjQ3ZJa0dTa21NcTFhNWFkTW9HcTQzZzVNRkhpNDd4d0xnNk1vVkI2?=
 =?utf-8?B?UGNFWWVSWjVMS0JuWDdwUDFWL1VEQWdFaEE4eldqUDg4VVVveExkcGNraWdH?=
 =?utf-8?B?Y1NPa0doYUxuTG1lRmZML0xYWlhqMVE1QUlSck9CUkpkSXpqMlZiUXQ3c0g4?=
 =?utf-8?B?djVVODFYWE5VY0FZRmgzWmhSQ2FQZkl1dUI1dDNLaDYxUDFQZTZGSVhwTjJo?=
 =?utf-8?B?eGtZbklNRlY2ZFB3TU8xdmMvT2Q3Smg1bHMzS1ZaUHpsbkNWdHY3SHBsVUFj?=
 =?utf-8?B?TlkyNUhwNUVFc0JzRDdyamNJU1VSSlU5Mzl4ZGQ4UWxjSTVDZjR0Ymh2L01v?=
 =?utf-8?B?cEtDUkRPU3M2S0dMRnh6Um9yRFRhM3FvWjJuWkhXOWdpSERCckl0UVVZTC9k?=
 =?utf-8?B?MzB0RDVmZ0JidlBKZEh1UlAxTmpjVXVEKzZHaldTeDBNK0lXUnF6Qi9Gek5o?=
 =?utf-8?Q?1FhVSOvyl5Z1V?=
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230031)(36860700004)(35042699013)(82310400017)(376005)(1800799015);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 May 2024 16:02:19.0911
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a1bd9977-7804-40c9-4739-08dc6eaf12ac
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AMS1EPF00000046.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR08MB9197
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 07 May 2024 16:02:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/199100

DQoNCj4gT24gMiBNYXkgMjAyNCwgYXQgMTE6MzIsIEFsZXhhbmRlciBLYW5hdmluIHZpYSBsaXN0
cy5vcGVuZW1iZWRkZWQub3JnIDxhbGV4LmthbmF2aW49Z21haWwuY29tQGxpc3RzLm9wZW5lbWJl
ZGRlZC5vcmc+IHdyb3RlOg0KPiAtR1RLRE9DX01FU09OX09QVElPTiA9ICJndGtfZG9jIg0KPiAr
aW5oZXJpdCBtZXNvbiBnZXR0ZXh0IGdpLWRvY2dlbiBwa2djb25maWcgcHRlc3QtZ25vbWUgdXBz
dHJlYW0tdmVyc2lvbi1pcy1ldmVuIGJhc2gtY29tcGxldGlvbiBnaW8tbW9kdWxlLWNhY2hlIG1h
bnBhZ2VzIGdvYmplY3QtaW50cm9zcGVjdGlvbi1kYXRhDQoNCllvdeKAmWxsIHdhbnQgdG8gc2V0
IEdJRE9DR0VOX01FU09OX09QVElPTiA9IOKAnGRvY3VtZW50YXRpb27igJ0sIHRoZSBkZWZhdWx0
IG9mIOKAmGd0a19kb2PigJkgaXMgZGVwcmVjYXRlZC4NCg0KQWxzbywgYW5kIEkga25vdyBpdOKA
mXMgYSBwYWluLCBidXQgc3BsaXR0aW5nIHRoZSDigJxyZWFycmFuZ2UgaW5jL2Ji4oCdIGNoYW5n
ZXMgaW50byBhIHNlcGFyYXRlIGNvbW1pdCB3b3VsZCBtYWtlIHRoaXMgZWFzaWVyIHRvIHJldmll
dy4NCg0KUm9zcw==

