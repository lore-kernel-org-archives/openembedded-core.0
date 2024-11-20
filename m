Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1710CD711C9
	for <webhook@archiver.kernel.org>; Wed, 20 Nov 2024 16:52:06 +0000 (UTC)
Received: from EUR02-AM0-obe.outbound.protection.outlook.com (EUR02-AM0-obe.outbound.protection.outlook.com [40.107.247.60])
 by mx.groups.io with SMTP id smtpd.web10.18703.1732121520213637068
 for <openembedded-core@lists.openembedded.org>;
 Wed, 20 Nov 2024 08:52:00 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=A6E7Vcw2;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=A6E7Vcw2;
 spf=pass (domain: arm.com, ip: 40.107.247.60, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=d7bNCPw3BXsJ0SxCDRfUv35/6+/fXCWCdn0QnjiIq30vzjSJ+2YyH1ipelPEK54t5467BIatXmlwFt0tge1J7MNwvbmeMgAR7jLt/A9YD5cbUp5OMqGKwqaHiGFGk8W9GRMu5mnzErGutIboauYBpMuFey9A2uOky6avxiI9J+Jo0+SAfX3PNbWL9dbkPEb3I6oDDyTaOG4YLwk3PZMIvEUGxqfWW+OyGRnA1IkLLpBxDepibNQFFOj92d/TjoIKICr6pj0EkDh8TAF1zDx8AZ+esd/SBMEALUo+JbW+fdzh39tsW3evx6qf0Pa+msBdmnv+OfwNnA+LwPRhk+zXYQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8PkVLhKJ4byViOO4B/ttd4AWETU/mUpq8TSZ9kv2+uw=;
 b=lF9x4qrFD2klpZ7Vocs38AC4wUYu2BW13ziiq2v7LcGUFYDaIKkK8DuyhDLp56RnEyLPboQFAx3SFr/+eJwtR9CKbqH+RyfZF7Gcy/K4L8UTD/dLG3DyrufTyyJFZ5UFDxGth1qpivZ4MFJgnOWMD9cdjDX78pPaEV1Cl8+q6KgaweYEKYLlA6esFbpMRFtxvQAUbR3OMJ/5sILOLanEk2FTYWgbAZ23fV9GzEHwP5FpzTo62m08h63eSGKt+TfeeRC3sbv7Nmu6EdH3N2ZBs4uwKySwQyrQzBBKKCIdv+tFOzoyxFEYWGtbnutyFAbivqalpnm1d46JaVNoLKxPsw==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.openembedded.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8PkVLhKJ4byViOO4B/ttd4AWETU/mUpq8TSZ9kv2+uw=;
 b=A6E7Vcw2EK+ZDGs16FcSG7kn5KjM4fMCZqWnPjgccKSKr/yuX4r5spb6v3v9WlRRvPkxFfwdkkGUp4FcV4yJVwoXZtzhPjgMZ8GZcARlxuRfWnZBeNSlhHD62saIOnv8hnaLWiRwzU5rmVBG1PD7rz7FvgIiMkwFj5rtm6OhodI=
Received: from DBBPR09CA0033.eurprd09.prod.outlook.com (2603:10a6:10:d4::21)
 by PAWPR08MB10260.eurprd08.prod.outlook.com (2603:10a6:102:369::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8158.22; Wed, 20 Nov
 2024 16:51:56 +0000
Received: from DB1PEPF000509F7.eurprd02.prod.outlook.com
 (2603:10a6:10:d4:cafe::26) by DBBPR09CA0033.outlook.office365.com
 (2603:10a6:10:d4::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8182.15 via Frontend
 Transport; Wed, 20 Nov 2024 16:51:56 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB1PEPF000509F7.mail.protection.outlook.com (10.167.242.153) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8182.16
 via Frontend Transport; Wed, 20 Nov 2024 16:51:56 +0000
Received: ("Tessian outbound 23e15691b630:v490"); Wed, 20 Nov 2024 16:51:56 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: ac8fd7513f65030b
X-TessianGatewayMetadata: mdo4vPaH24H/7Wd9ACOyRhuNseOR2/fUQv+7xQz05tdX9AMuiZXkWLUfMIW4Vv8cVl+iCTSbEsbu5e4jwHy8rVjRX4lmzNUNakgZNnZWBoV4QGYzCyEPXv5BKqjd1vPE0Jg/Lci7eQV4I8YwxAkV2s9Sl3NITzYWBaxr1x+mEnk=
X-CR-MTA-TID: 64aa7808
Received: from L3833be91face.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id ACF183C1-E501-40E8-9751-A91DDBC9BF66.1;
	Wed, 20 Nov 2024 16:51:48 +0000
Received: from EUR02-DB5-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id L3833be91face.1
    (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
    Wed, 20 Nov 2024 16:51:48 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kCdKIRp4irQlge2FtI3Q0TMkRJlr7JGvWtIxDVthABYW0R787zOzwVHMP0L61KKBTqXinhrmL9PTKD4i6fFqK86L6xgYHAof1YgFgTNXEmo84fkm2dvbgW/10SI3rwDN8u6di+M5Are6XoTqU/COEow43mC8OkOlfesbVQmTppt6+mvQA5i519JVpsWMOm4XTHCZpJgPiSrPazL8AK65i3qY3ctHwXG7CzNR9/vuHqLT0XzIPQ0hg+UrHIwIXeQK+j7JI69PAEX10ap4kT8G64+UpLFuA5JdbrS5MEoo7MePJlpJ68BDTWs6h0I9O5kU3uUlBsZDjcZMI4VdbYZO/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8PkVLhKJ4byViOO4B/ttd4AWETU/mUpq8TSZ9kv2+uw=;
 b=Cg9DY8ntqAxz31nBcaDADijbLgGzfoWemAUblW51UWDW/3bJU/13TC5RxyI+J7XBI/vzeBssJZH9AY3ViTRiAts92R1QkPM+kq7BVRdaYJWoGufI0khesTj+2faBilGacS7wtVH0jTwBThbhEwXzvHmpL8GpzAt6hcZaa1tOdP/nvPRoUKReWPKZ5xHp7AfmQ98KVORCMPwYDEUVU2nHTUfKQF7QvC6mXEl96N1xR3Ba1M2pbMudaex3MT4wfB6gh9lPpzojzva9oRcB4lxQ6beel9f+BcqUhJp1u8LlTvBB7hj9d4JQumopnU34MN+w6uY234NE+EU2CG7gz9CkOA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8PkVLhKJ4byViOO4B/ttd4AWETU/mUpq8TSZ9kv2+uw=;
 b=A6E7Vcw2EK+ZDGs16FcSG7kn5KjM4fMCZqWnPjgccKSKr/yuX4r5spb6v3v9WlRRvPkxFfwdkkGUp4FcV4yJVwoXZtzhPjgMZ8GZcARlxuRfWnZBeNSlhHD62saIOnv8hnaLWiRwzU5rmVBG1PD7rz7FvgIiMkwFj5rtm6OhodI=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by GV2PR08MB8028.eurprd08.prod.outlook.com (2603:10a6:150:79::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8158.22; Wed, 20 Nov
 2024 16:51:46 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::9206:40ba:ef7e:729e]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::9206:40ba:ef7e:729e%3]) with mapi id 15.20.8158.021; Wed, 20 Nov 2024
 16:51:46 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: "changqing.li@windriver.com" <changqing.li@windriver.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH] rxvt-unicode.inc: disable the terminfo
 installation by setting TIC to :
Thread-Topic: [OE-core] [PATCH] rxvt-unicode.inc: disable the terminfo
 installation by setting TIC to :
Thread-Index: AQHbL2s6CnzL5EdTBU+cJbaqCJn+/7LAeK6A
Date: Wed, 20 Nov 2024 16:51:46 +0000
Message-ID: <B3814EDD-D5B5-423E-AD39-BC71478CBAF7@arm.com>
References: <20241105101214.4095063-1-changqing.li@windriver.com>
In-Reply-To: <20241105101214.4095063-1-changqing.li@windriver.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3826.200.121)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|GV2PR08MB8028:EE_|DB1PEPF000509F7:EE_|PAWPR08MB10260:EE_
X-MS-Office365-Filtering-Correlation-Id: a2909a29-1b95-4316-5f16-08dd0983a494
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: 
 BCL:0;ARA:13230040|1800799024|376014|366016|38070700018;
X-Microsoft-Antispam-Message-Info-Original: 
 =?utf-8?B?ZDRRSXNMWHZkcVNGQ0Q2NG5QeXpGZUZiYjN1LzZrSkdLWFRXUWhXL3VPanlZ?=
 =?utf-8?B?L1hwL1FJbVVxbldhblFvY0RYMDNmWWJKZU83b3M5U01PbHVNTmdRa2ZoeWlu?=
 =?utf-8?B?ai9HOEhHTGZ3ZVNSWWxxMyt0dGV2akdRb1N1Zmh6SUp2SXZzWTFDQlJHckhN?=
 =?utf-8?B?SytLbTdFVVQwRWdCSkVWTlpSTENBOUVza1FZTGdjQTg1YUt0dDhZWFV0UUQ5?=
 =?utf-8?B?RXlXTVRwa2FQOS9OcnJzdVo5MnI2OFhzWktMTmZOS04rd1JMQ1ZxTEVBbTF4?=
 =?utf-8?B?ZVhKUDZLYjNGWmljN1pNWjBxVW56UksrR1BsMHJlU1J6M0pwa3FsMUJKZkRr?=
 =?utf-8?B?QUZLUU5adENwTlk0VUhRMXdTaWI2UmhDd2dDY3J0bHB0TjdUYWpZRTdHMTda?=
 =?utf-8?B?ZnBzMkM3RnI3Q3VmQkFwOWJXL1FUZW9tSmQrQzFYejNhMWN1MnhPbjdJbVpw?=
 =?utf-8?B?Y3djSXFNVG1zS3ZyWlNnVlUxcmJHUzNreXJDSGVldWRzbWhXNzcwVVhRRnZv?=
 =?utf-8?B?OXY5U1VBdjBOZTR4c3RVRjdWbHhTazhMTHJ6Y3hMYkUzMUVGT2RiRlQyRXBl?=
 =?utf-8?B?UzJUVGloMTlLV3NTVUdaYjFIUGRrNTRaUE8zZFNiemM1WnJMc3lZTjdadytX?=
 =?utf-8?B?eUFLYVhLQndqenArZnMwaG1pNmQrUlBxQzhiUzRvV2RDditzdjNEcXl4R0Rn?=
 =?utf-8?B?cDNtcFYzSmZ4WXM4MW52b01kNVNOVSthQ1pyUUlvaVVhR21VdjFMbTdBU1ls?=
 =?utf-8?B?SlR0V1ZONXhEbVdwNzVTa0YwUU85bC9KSE1TZkZMVy9KWVFHK1IyMEw2OVlG?=
 =?utf-8?B?ZDVoME1aME1ZRXdjcmRmb3RJZkRGQ2pqdjF6OEpteTQ3QUQzZkpnalcraG0x?=
 =?utf-8?B?QjllMFVkeVBKVHo2QVdhMVprRDhscFBzd2VvY1JPdE4rZldkaDVoVnBJWS9l?=
 =?utf-8?B?dGswYndaTlczR3NFMFRhamNLdmxjcldVTHNuM0dqbWhRellRN0VhSXNDWUhV?=
 =?utf-8?B?THZOckNweGZMMk9jbUIvMTMyamQxVG95SjNHRnk0YWNqUzNnVmxycHRBYVdH?=
 =?utf-8?B?Q0tVUHQ2cHpRRy9qMzRHckxEbFdNNndkQXdEUGVwbWtKeFp5SGphUkpaNldY?=
 =?utf-8?B?T29xRmdsR2tjUEI0VzZKQ3h1VHNKZmUxeXFycnhEWFNkNW92WmlOU0lsbTNW?=
 =?utf-8?B?UHM2ZDlENVJMcnQvbGVKekErYi9aMTlzTXBaNytFMTdaRzl4OTRkdFRCQlhv?=
 =?utf-8?B?RHRsa2lwaTVobmZ6aHh5b3BEV2Rkb3NNQmR6eXVBMzdCbkZGRFJoZzJNbVhr?=
 =?utf-8?B?VUgrU3ZoLzhqUllTVDkyRFRzQVFJc3JZRTlkbDQxSElxN3JRa0NObHJTY3NJ?=
 =?utf-8?B?blRjdFhIKzF5YklmaHY0alBnNXdUTkRkbWVLSXJFNDMwMVlqVGoxZDJIZDU0?=
 =?utf-8?B?WU5yNEFEaFh2RTVpZWZsUHl2aEoxaFNlZHcwa1FMTkZxWjN6L3JnZ2lrOEY0?=
 =?utf-8?B?aGg1aXVuS3FWQWVheVlJbDNwQi82MlhPK3dhMkRqN0hidWxoSktaeEZWenlr?=
 =?utf-8?B?ZnB1R3lqaTFmbzFEUTJCQ3BWNXBveUl4Y1J6M0J4TFdoUmpZc3V4UXYrQ1ky?=
 =?utf-8?B?Wk1yU0Vvdjd4OXVGMTNIcHJIY1lHUmxveWN3Qk82ck44R3FGeS9ySlpPbHUz?=
 =?utf-8?B?VDArMmdiSWNoYjgwM3Y2KzA0SW81aTJJMUZna0I4ZDJwY3lGRU03RnFjU3p6?=
 =?utf-8?B?OU91dnJweEFHeXNXazhsNW5qUExEQmZvbGxLdGZiR05EdnVVMldGRjc5emVj?=
 =?utf-8?Q?vkPf3IQBzu+Fn0P1Oue8Lo1k9AToZwZ7lMzaE=3D?=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(38070700018);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <2B0EC35743CE6E448A7AE9A34913E5C2@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR08MB8028
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-SkipListedInternetSender: 
 ip=[2603:10a6:102:2a3::12];domain=PA4PR08MB7411.eurprd08.prod.outlook.com
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DB1PEPF000509F7.eurprd02.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	079cde5b-62eb-4a67-7d58-08dd09839ea9
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|376014|14060799003|36860700013|82310400026|35042699022;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?aGhKWURUNXFWSG5JSUM1dnlLdmsrbHh2WFZYSmxMUFVzcTdicHdRZmFSb05u?=
 =?utf-8?B?RGU1dTJ1UHRreFBHOTVyaGxod25MZzJoOHFGUXlBZTRDYy9najZZQVU3KzBZ?=
 =?utf-8?B?Q0FpdmN5bFdLTFRVSExmVi9oNGhOVHduU1psUEVRSjlGcDhqQTRRVksrUEF6?=
 =?utf-8?B?YXBKSWNDa28xV1NBeWNWSUVQU0VRL1lVNnpwNkE5UzBsMUpxUHJXUWVVdkhH?=
 =?utf-8?B?OTdjLzVmZEp6aS9LVXJMODZNaXBJWXZZeTM0dUZYTDBpV0dqSFMxRmwxZXNI?=
 =?utf-8?B?MTU4UFR2dTVBZzVTWCt4OFRlMHM4K003OE1BOWU2QThkS1NHZEtHc04zK2pv?=
 =?utf-8?B?L2ZZMDE0M0ZaZlg3QVVHZzg0WXBERWZ0c2VIbUtnNXBOTmdQOFN5Wks3RHBi?=
 =?utf-8?B?Q1NqK0VNdXlpc0NwZDBuVHB3RjlIZ1I5dmcyYTQzVVk0Nzl5cWF4OU1sakhW?=
 =?utf-8?B?akwxZU82Z0VRSnhVcGR3MHJaOU14bUtPL2lqcEVUaGNZU09aeW5VaVIxSnRh?=
 =?utf-8?B?SVp5SitCc09zVnRWektwc3dPcmk3bHRzNFRFd0ZMeDBtc3MrcnBkRnNzU1Ru?=
 =?utf-8?B?MjhJZDd0YXhBUi9UR0ZoRDJXS2s4MjlqVFBiaW9qa1gwUFJDSFZjMVJFaWky?=
 =?utf-8?B?NGFZSERxTHRGMGdjNWhiL25zWXd4V0pGczNkSnJJVk04akJxRFpGbEpTMVZ1?=
 =?utf-8?B?aHVTRVN0TWNvVTdxSjdLTlA0WUd5UW1jWHkxbFA0ZUVwcnhyNVI1UWQ5bzFL?=
 =?utf-8?B?UlJ4NHRaampYTUo2Sit2ZTZFMVhOdzVrZFRGajV0OEtwRXFvOTNOTCtCQ3JM?=
 =?utf-8?B?N0RJcnQrT1dkRjF1cFJ0Nm5uckU5TWQwa1h2YjRBN1ExWFc5MUR0Y2o4RzZz?=
 =?utf-8?B?eUpkTGR5QmhVNW5ZOFJJN29TMW9XUVIrd1U0Q1JML05DYjBwSzM5Z2I3aWdP?=
 =?utf-8?B?S3dGWXVqV04vdmJGWkFUN1k4dXdWNmhiVDhlTWpHNjIrcXNXb00wNjhiNnZO?=
 =?utf-8?B?Y01zNXd4T09GbCtoQ0lUeFk2U1ZaTytSTG1QdndvV2FaZ3oxZU5SaGZHWnNk?=
 =?utf-8?B?S0MreGtydnQ4UWpVNHFpMWhoVklwUHVxNzV0QnREcW5QK3ArSWs1Tis5eDBB?=
 =?utf-8?B?ODcyNXQ4cjhUNXo4bWJQNFcxTGMwaHlWTGw0Q1NCcVFoRUlWdzlycEgvV3Fm?=
 =?utf-8?B?WnNoOHZSVklNeWVJOVY5N3dMVDZFbHh4WlQ1ajNQVTFaZXRRZ3ovSE5OWFpR?=
 =?utf-8?B?OGo5RndWM05SNmY4T01UMkZtdk1JOTU1bFhvQk5VUkJQM0E5bk9jeHZIak0x?=
 =?utf-8?B?UXdTMmU4ZlgxV3FKOHBGa05aaGlxRTQrYTFmREZvM0d0dDY0cHU1MURUV3c1?=
 =?utf-8?B?cFZoSkdtN05Pb3cyRWl6SUc2aWdDbGJxMnVnVTVPblFQWDdFMTN5TTJHdVhu?=
 =?utf-8?B?ZHNLN0lDWUpFQUw3azV3VjNpL1k0dVhIVzdxbDN2VUtmRk5uaXlTeWlJaFhY?=
 =?utf-8?B?R21JVXJoQ3creUhlZmwwbklMSFJnM3RSNEZDTXRrSzg2K2NuQi9mbnd5VkdP?=
 =?utf-8?B?RmFEaVZYWW1yd3JFY09jY05tcm1YbW5LaDEzdThjRnA1N3FTbytSRVk0S0hl?=
 =?utf-8?B?aGk5cTNBZFNvdnRCVVQ3T25WdzFVYXFGWk95NkFtRHo0WEVwb0RONHgrOWM4?=
 =?utf-8?B?bVk0TFNNN1ZjWUdTdVpGNzg3dGhlR2EwVFRyWW5vYUJCQTNXdEp1dkxRQ05R?=
 =?utf-8?B?TlJESktZcFlCYmw0QzE2NnY4YUdwUkRrTSt6S21pOWNvVVp6cnlueTlmOE1M?=
 =?utf-8?B?YVQzV0wvdGY3dDRqa1ExNmxxQU5mTnpTalJ1dUQrVTgyekFENzl2S2QzWWZF?=
 =?utf-8?B?dzhvcEY3eEtVU0piVWVhNVN4b0Q3S2QwRHZiUDZkSFNhVVE9PQ==?=
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:64aa7808-outbound-1.mta.getcheckrecipient.com;CAT:NONE;SFS:(13230040)(1800799024)(376014)(14060799003)(36860700013)(82310400026)(35042699022);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Nov 2024 16:51:56.2718
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a2909a29-1b95-4316-5f16-08dd0983a494
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DB1PEPF000509F7.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR08MB10260
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 20 Nov 2024 16:52:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/207466

T24gNSBOb3YgMjAyNCwgYXQgMTA6MTIsIENoYW5ncWluZyBMaSB2aWEgbGlzdHMub3BlbmVtYmVk
ZGVkLm9yZyA8Y2hhbmdxaW5nLmxpPXdpbmRyaXZlci5jb21AbGlzdHMub3BlbmVtYmVkZGVkLm9y
Zz4gd3JvdGU6DQo+IC0tLSBhL21ldGEvcmVjaXBlcy1zYXRvL3J4dnQtdW5pY29kZS9yeHZ0LXVu
aWNvZGUuaW5jDQo+ICsrKyBiL21ldGEvcmVjaXBlcy1zYXRvL3J4dnQtdW5pY29kZS9yeHZ0LXVu
aWNvZGUuaW5jDQo+IEBAIC0zNyw2ICszNyw3IEBAIGRvX2NvbmZpZ3VyZTpwcmVwZW5kICgpIHsN
Cj4gaWYgWyAhIC1lICR7U30vYWNpbmNsdWRlLm00IF07IHRoZW4NCj4gY3AgJHtTfS9hY2xvY2Fs
Lm00ICR7U30vYWNpbmNsdWRlLm00DQo+IGZpDQo+ICsgc2VkIC1pIC1lICdzI0BUSUNAIzojZycg
JHtTfS9kb2MvTWFrZWZpbGUuaW4NCj4gfQ0KDQpBIGJydXRlLWZvcmNlIHNlZCBmZWVscyB1Z2x5
IGFuZCBwcm9uZSB0byBzaWxlbnQgYnJlYWthZ2UuICBXb3VsZG7igJl0IHRoaXMgd29yayBqdXN0
IGFzIHdlbGw6DQoNCkVYVFJBX09FTUFLRSA9IOKAnFRJQz10cnVl4oCdDQoNClJvc3M=

