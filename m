Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 89347E7717F
	for <webhook@archiver.kernel.org>; Fri, 13 Dec 2024 18:07:18 +0000 (UTC)
Received: from EUR03-DBA-obe.outbound.protection.outlook.com (EUR03-DBA-obe.outbound.protection.outlook.com [40.107.104.75])
 by mx.groups.io with SMTP id smtpd.web11.1959.1734113234608741700
 for <openembedded-core@lists.openembedded.org>;
 Fri, 13 Dec 2024 10:07:15 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=JFgbB8Wr;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=JFgbB8Wr;
 spf=pass (domain: arm.com, ip: 40.107.104.75, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=NP77jB7VKFK1NIhg9xrHr382S4urgUR3I0FZ/xe26JQpugE2ZGoKGqKdBix0m/Azn3V+XU4dJeiQsSEWzF0tijcwLThOAfPDT1ePcpgzXjZ8a3oZZjRmWP1UuumHqaUrvpVhluz4tIq8edNqhFXHKyWiXFKEu51sAfDT8os3oRt2hhid186JvGixauEp/aIZLL4xRtmo08KXdNxG52b8m7bNU09+FmMR+zZtYdLX+JUS6nEyRNKeLpHXnYe7Y8GJ0X1MToG3CXZ5/GQt//LYhSVDcaqMP62ipOPCh4oWcGgQZ89VSivbwbS3vtXMIF6SWp/vHqy4BF1eqzHjm2YsMw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NzlR+v53JRe5NiDHPBxfq2Lks08VQG1iViHeOFadkMU=;
 b=fZSzBtnvblqd7tiK6bnR5S83qqtK7T6q34tdxNMXlQf9v4lyZL/nVYJKW9JcW+EgQcoTa2cxbSHQ1S2QxHM8D6h6B+BfgTWrxvXngjfdmS2DOspvOstxk6rquYSVWPEFkf7jTZzzZtsLvUbsQzTj5N/ZRS7lZ2wIM0S6dpB1zWCSKPtenSMc65VllTVJOLISbwa7snzSnohLj0d3MyXTRW0+YR8w8y3+lhERaBPhA7y4E9OVeSuWwkMtJYJhkNn9p53qx7lnofNXSwpQbd7YbJrdkkhsekx3YmMiXcSpyR4I9yl2pAOOQX7ui7Vg7dP56emb6RoEUwqb/9KYhbaZ8A==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.openembedded.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NzlR+v53JRe5NiDHPBxfq2Lks08VQG1iViHeOFadkMU=;
 b=JFgbB8WrJfKFEifeY5k1MF2mJ1SAnYQfyQyCjZimh6I+Gtprnfxl157/X+d+kKm7dcpkDeRIXd+y63v3WPITRrGNnF40b9Fm5EjGhYkTXVNW9WaU6Ip+e6fCQegTS5at2C2mk31Izj72PpD2+MFqQXP+KXeTGudhZ38MOxhkLrQ=
Received: from PA7P264CA0416.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:39b::24)
 by PAVPR08MB9841.eurprd08.prod.outlook.com (2603:10a6:102:31d::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8251.18; Fri, 13 Dec
 2024 18:07:10 +0000
Received: from AM1PEPF000252DD.eurprd07.prod.outlook.com
 (2603:10a6:102:39b:cafe::97) by PA7P264CA0416.outlook.office365.com
 (2603:10a6:102:39b::24) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8251.17 via Frontend Transport; Fri,
 13 Dec 2024 18:07:10 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM1PEPF000252DD.mail.protection.outlook.com (10.167.16.55) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8251.15
 via Frontend Transport; Fri, 13 Dec 2024 18:07:09 +0000
Received: ("Tessian outbound 9c6259131e4d:v524"); Fri, 13 Dec 2024 18:07:09 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 8e2e118f61329bd7
X-TessianGatewayMetadata: ECRsmK5HVtbrxpNMrbnQulbXlX6WnO8XtaWKa8mvXDubUekOCpqxDAPaYSeyRFSIfZJsz3D5Kar+Fwoh71uycR6gFhCO2NHtf8BLob7bRa4h2NNoNyLdds1U1g44MSOXsDR+8g6JRh6VDQLgI+9fF8DljR1jDPG8DHP7pL11PeY=
X-CR-MTA-TID: 64aa7808
Received: from L94bd5a368142.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 05371699-7817-4DB0-838A-23D8A0F28316.1;
	Fri, 13 Dec 2024 18:07:02 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id L94bd5a368142.1
    (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
    Fri, 13 Dec 2024 18:07:02 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XSJq+ZmUTRhKeK4QCfRS9EAI6BhXM8qd9JoYtUTbv5FuRFtb/onJzAZBYnEC2mnsAh/R3/vVh0EkBccNhvrvy9RRFR/G8kcuP2fteID9UTHi8EU/C8VkGFA1U5ofvXbynZpx36+6gFpWozcRslQJAw59MEWUNkCmfB2SsW5lweF5I02Mg58z3hCqFfsF7G9oGnYISnpoUI4PGvgzZ/kTACv04M6A8YpgvH39r1atBl30EbUEJxrpEF5iNURIbsZsSQO/JqIGMJlIH8LGa/ey0Fl+S/eF5krzltHS36Z7JsRD5fuswAyFGjxcDXo4SGS4wmeyeMwpqgXK0gSX7nwp/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NzlR+v53JRe5NiDHPBxfq2Lks08VQG1iViHeOFadkMU=;
 b=ptWaSWOIOguIlPqHjgKN4s9qXjr/nhfXtKY+SRKrNIOenbT5ma5bVvOndvM5oGmbI0HJh1MpMlxcQ5xUuXp+IVtpptkefbTVC7vZdE99P/pPlPiz06f7PvcBRLr/ZtJdTXmX2jR+GB6MUEwiAvfXauzN5eImH91wtP10KsI39jqX9Lf04/dR+bU2/0KOgisrJoT1xiiv1BaQ9dGCfmmHktuRpASZT5OLwUmeG1Mp6o6U4UQzjV7nEENB1WAE8w4x/zRzSIwB4QklqKxMetpD1IfA6fvgRUQTmla+nsyQPdJn+gn/ojp8mDjs6GO0reh0WWIS/UrRFmwA7P/YcuRiMA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NzlR+v53JRe5NiDHPBxfq2Lks08VQG1iViHeOFadkMU=;
 b=JFgbB8WrJfKFEifeY5k1MF2mJ1SAnYQfyQyCjZimh6I+Gtprnfxl157/X+d+kKm7dcpkDeRIXd+y63v3WPITRrGNnF40b9Fm5EjGhYkTXVNW9WaU6Ip+e6fCQegTS5at2C2mk31Izj72PpD2+MFqQXP+KXeTGudhZ38MOxhkLrQ=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by AS8PR08MB6344.eurprd08.prod.outlook.com (2603:10a6:20b:319::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8251.17; Fri, 13 Dec
 2024 18:07:00 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::9206:40ba:ef7e:729e]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::9206:40ba:ef7e:729e%6]) with mapi id 15.20.8251.015; Fri, 13 Dec 2024
 18:07:00 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: "alex.kanavin@gmail.com" <alex.kanavin@gmail.com>, Derek Straka
	<derek@asterius.io>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core][PATCH] classes/pypi: update the default
 UPSTREAM_CHECK_URI to use the simple repo API
Thread-Topic: [OE-core][PATCH] classes/pypi: update the default
 UPSTREAM_CHECK_URI to use the simple repo API
Thread-Index: AQHbTMeTzGDow6veJ0a2mfHPMKiBs7Lj2GsAgABrgwCAAAYCAIAAMBAA
Date: Fri, 13 Dec 2024 18:07:00 +0000
Message-ID: <DE3FC97A-159D-4603-9121-1A6C27FF9AEA@arm.com>
References: <20241212185619.1599668-1-derek@asterius.io>
 <CANNYZj8dnzzoQOcPUzMxh0mQSK5Xsd4QxAbegHFXn5fLBDmtWQ@mail.gmail.com>
 <CADNbA1puOQNd-YL3anMpdpfxGHxwYUWM803_2Ho++oNE==7vvQ@mail.gmail.com>
 <CANNYZj_bngoCTdTHjYmnptiSBu8SLV8SxVgr0ZgV1NyesmhHLg@mail.gmail.com>
In-Reply-To: 
 <CANNYZj_bngoCTdTHjYmnptiSBu8SLV8SxVgr0ZgV1NyesmhHLg@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3826.200.121)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|AS8PR08MB6344:EE_|AM1PEPF000252DD:EE_|PAVPR08MB9841:EE_
X-MS-Office365-Filtering-Correlation-Id: cbee8ef2-e6c0-48ae-9cb9-08dd1ba0f669
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: 
 BCL:0;ARA:13230040|366016|376014|1800799024|38070700018;
X-Microsoft-Antispam-Message-Info-Original: 
 =?utf-8?B?NHFjcDJDZjNCRGliYjkwOE1Zcmw0YndsZzMwT09yUnp4VHZLMlJlZy83SnEz?=
 =?utf-8?B?cXJVT1hUeWxTN01MZWZ4WmVGanFiVmtBaFV1enNhaU0rOFB6YWF2SWRlRnhN?=
 =?utf-8?B?ajR0TDJJOWhrNnNEblFPMlRmVDZKNE5lUzcxNlBYbzBJTDZwTDRyQk8vSU5Z?=
 =?utf-8?B?OWJKWFMvSXRnK0ZHeFNCbGhlU1UzdHRFTWNjdEhHNGNqdlJVc0dRbEdOd2g3?=
 =?utf-8?B?NVhXTjhKenZVc1JJOUlmRWFBQ2YzUitKNVlRUVl6dHFBMDhjeENJTmw5ME13?=
 =?utf-8?B?OWVLZzRUaUtrSFdGU1p0a3dJbnAwMEhKLzdLbzFTVEhYVHh0cnpQQjdYRUxL?=
 =?utf-8?B?YXFkcmI0R05ZMS81VWtVUHp5bkl4WE5sekttNi82ZndYdG9pelAwcS94ZDdJ?=
 =?utf-8?B?MTR4VUJVTno4MUUwRXdhb3gzVzBoazQ0bmNOWU5Wd1NXZnFKeng3cmUvK081?=
 =?utf-8?B?RVpleTJnR2ZKSVRUL1BIU0R1TjJ6d1Evb0NEa2h3VGE5UnBOZjJtZmdXcHZ0?=
 =?utf-8?B?UjJQVGk5by9TUk1qbng2WFIzcHA2cFlja3ordWtGRmgzaUhFTnRxYUJmZUVJ?=
 =?utf-8?B?Rmp5dlV6ZHpYL2JzQjFLMUxhbC9QZWxWSUxObXZ3cmJWcjk4MzhzaFRDK2dl?=
 =?utf-8?B?VTR1ekZXK3RSN2pBeXlNZHo0YmRqQU9EdUM1anM2MkZyTVdHeW8yQ2U2T2ZP?=
 =?utf-8?B?RU9odzZ0aTlFeWpTaEZ5aHllanZVZk5CLythSmZKRjU4eTZsa2d4N1NlNnJH?=
 =?utf-8?B?eHdVNUhaRXlMQzgreTQ2c29WaEl2b2lKNGQyYUsxaStVZkJGYVFzR2dGNE1u?=
 =?utf-8?B?dThjNHNRazIrYmdCS3dvR1l1YVIyNGEyaUVjUUVLZ296RzNWNXBqbWpudCs0?=
 =?utf-8?B?Rys0YmpXQlVSbm9UdXdQNlhtMVl0cWtEVkhSV3pub29QbXljNUxseGh0T1RP?=
 =?utf-8?B?anVmd1puMU1nVmdNUkdoZjNXVEtlZXNhaGhQSWxERHJIUTg0dDRmdFh3ZjF3?=
 =?utf-8?B?QlhCL1Zod1ord0N6R3Z5L2RtWEo1S3MzZk1VTUc4dVRvajZvN1ZSZ05ZWWR3?=
 =?utf-8?B?OTB0WWlpMmpCMDBQMkhFOGsyQk90QTZyWFBLVzFPeWVUbDc3bUI1bmw0YWtl?=
 =?utf-8?B?bkxoenErb2FPNzhlVkZtNHUyaE0yRUwxdGQ4dXBlU3JBci83dHpDMHYxeXFu?=
 =?utf-8?B?MDVRRlNJeHV1RDZzdkZOa2JrUm1rdmk4UWtzUXJWNE54WkQzeHhIRE5kODE5?=
 =?utf-8?B?M1NseVQzM2c0SkhsdnVMY3p3b2hNb05aUW54UkRvaEE1dklpNUpLYnIwL2J3?=
 =?utf-8?B?ZmY2OVloVzdWdWJYaDhLNlhnZitJKzBiQjRTMXpObWUrRDdSbldPb01pcURL?=
 =?utf-8?B?RHRrS2dLbjdTYkFTYVN4SnI4ajZrYlJWajhUeHk5RkwyQ1BSN21RWlR5cVpv?=
 =?utf-8?B?dE40Z2VQWmFLY3JMUG8xMkhWNGJ5OWd0bmxqRTFxbmVQVE9hbDhJVUtNc0tQ?=
 =?utf-8?B?bkIvK1pQTThaK0c1SjMwTzJRVEdKNHhnUGo5OEJIMU4ybExkcVJ0NHdKeHlx?=
 =?utf-8?B?dXMyTXA3NEtYblBNVkRoSDVkemhHZms0MzVpZEdLa0xNRk5LOXRvZDY3R2dp?=
 =?utf-8?B?bTNkWFRMWU9VaGVnakRNdjA5Mis1WE1JNEhkdXUwRGdWTUFZUUQ2ODZ4eXpz?=
 =?utf-8?B?YlJKNis4WUM2SHpoSStUVXhOMFRoSEI5alJQV2NVUHlNSVhZeXR5dlRzYmhB?=
 =?utf-8?B?ZFZJSTBid0U1RXpzNU1iaXF1bWVOQlkzdG8rSXlQUk5QTFBYdXhwcVRiQ08x?=
 =?utf-8?B?REN1VThUMnI3Qlo2RkUzWjBqeWtOV1FrblJvM0lScFk1eTZpOHJ0dS9BY1hN?=
 =?utf-8?B?clY5N0dEeDdrMFRqSldxbmpSdlJWaUIrdUdueFZCb1lJZEE9PQ==?=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(38070700018);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <19FE512529F5C6448688B19A3B91C131@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6344
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-SkipListedInternetSender: 
 ip=[2603:10a6:102:2a3::12];domain=PA4PR08MB7411.eurprd08.prod.outlook.com
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 AM1PEPF000252DD.eurprd07.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	bfc0c5a9-6726-45c7-fbf7-08dd1ba0f100
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|82310400026|35042699022|14060799003|376014|1800799024|36860700013;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?QUpiUDM4QWFYeVdIdGhBdXVVOTlld0hMWUhwbjlGOVhYSlh1a1JnUTF0ZkJu?=
 =?utf-8?B?UUVZWjNoWjhyNWJVcm9QNkZvSkRuUmlwdnptWHY0aFY2ZnlTR1VuWjdJNkd1?=
 =?utf-8?B?Vzh3Q0hUMjlkYW1VOXdoREdyTHZhdmdMc1RLczFrZjVWMnltWlJSRWxDRnVF?=
 =?utf-8?B?TXFNM2NoTmYybG9SemJ5K250dFlTNEV5M2Z6bDhyekZnTHpQaDlGSHRVaElr?=
 =?utf-8?B?RHFnWUM0cEEwVXowTG92b3hYQlZ1ZmpNamY1Qzdlb09nY0t6RHN6TTJQR3BO?=
 =?utf-8?B?SEtQWDFVN3FJU2JLN2QvbHRvRk9sL2lYVlJoWVlKeE9qem4zaEhzdVlPejND?=
 =?utf-8?B?N2FOYlZFOFVsRElLU2UvNk9xRVhHYkgyUW9jUmJYMTNRb21XR0QxeHZyUWJ3?=
 =?utf-8?B?UzFZd3dXMmpWVTJhRkRQN3NseStWdFlaVjU3aERkQkpHdDdtMXdNRlJYdXpV?=
 =?utf-8?B?cUM3VENIQjZWb0JYNm9KUmVSYTJ3cGw4ZVdaMmoveW5GRFFhblVmY3poZmRp?=
 =?utf-8?B?Sm9yRjBiS01GeHdsb1RBaUcvQk1heUlkQnZ2dUs3SmZ3Z2FjUzNkR3gwVTdu?=
 =?utf-8?B?VVpGdEFWZW9JeEszNGhmUGxzbUpxOFY3cnA5d3Z5Vm13bHI3U2JQZk42NG5u?=
 =?utf-8?B?QklqbjVqY25NdGdYMW41OGNnb0lJcVJpcTZRUU5MK3hnWkIzcEg0YXdZR3Bh?=
 =?utf-8?B?VUpEdXlRWlFSbm5JVHQwcHBqMU9yNGVOL21qdUJxend4ZUdicmRTM0oveUxU?=
 =?utf-8?B?ZnRXRnBOcG1ib3RKanlaK3VNcE1mMDZKTWpXcWEvdHZ5RWtUeFV1MG0xVU5P?=
 =?utf-8?B?N3FPZGhqRzZqby9QV2x4T2JNdHpSbXNBV0tCdVk1VTFJOWNFKzl1TUJlVDVU?=
 =?utf-8?B?Vm8yL3VQWkoyVTFnU0NlbVh3N1VBSmVqVXJ5RTRkQ25OazMvcGtqQ1pTMDZn?=
 =?utf-8?B?YitMYnFQSGU3RVJIWEFSNUN1N2JMQVJ0aHA2enpiUHBZSFh1amxQYzBvMTdB?=
 =?utf-8?B?YVd4emdNYzNaeGF5OVV0WWZuNVhEZ3o0UXRLTWV6a2Y0UldVQno4MEdDU3Ir?=
 =?utf-8?B?dGxoZkhDbWwrTFNXT2pSNkhZQ0ZkSVpZRVFiNG82UTg4cjlwSmp5YVU2SFU3?=
 =?utf-8?B?aTJFNldNd3VTR2dtT0NCTmc4TEY0Zk8wRC8vUmJSL01xVENHeW8xK2tmM0dG?=
 =?utf-8?B?dmJlTkgzYmRzejJ6TFNELzNqSjlvNFgrMnJQNmVXV28rRndmMDBadmRtYk9W?=
 =?utf-8?B?K2dFS2ZQaHM0OURiaWt2T0xsb2luVDJZcDlSTkRPdS84RWpZamNXWDF0TDZ4?=
 =?utf-8?B?SVVyampVRVY3SlFmM3lwWDhDVW5NQ3BIOWZvOUozZmNYN0xsWDFteG5ZdGZX?=
 =?utf-8?B?RUxFVVFoNDloVG1vT1NwUU9YN1VKZnFLVXVjMnQ1TFQvQlpLekhXMTIza21C?=
 =?utf-8?B?bXQ4cWVYbWJET3llZDM0d093VjA0eStQS1JNZy9haUJZOVBJZjlkejkxY25h?=
 =?utf-8?B?aFI1T01Tamlla1pKZnRCd1lodmE1U08vMC9rZEUrVTZmUWovRUpCLzVqZEcr?=
 =?utf-8?B?Um5ocGpXbkIyRUdXUFN5eVhyV2VTaTZMMk5IeC95WUxZczRtQXI4UDlSQUt4?=
 =?utf-8?B?V3NtRjB1YkRXN3U2RE8yQ2IrWUlzdnA5MzF5ejc0TmZ4VWNEL3RVdVgwZWtG?=
 =?utf-8?B?c0ZjVm5WT0NZVlZzNEh6VThBVzFBeEJXUnJQQ1VXM1A1UkZPUEtLei9lcW5I?=
 =?utf-8?B?REFDZkRTbWdpZWIrSFMvNjJpRmZoeExOS2xmcDlBdk1tSWVITmxUTW4vVXJT?=
 =?utf-8?B?djBnM3poU3VtMnV1VnhXczBjK3M4MWtlSXRFZHdoalVhTUhaTkFXTUE0RHVM?=
 =?utf-8?B?KzJGUWpmV3Blc1BaNDREN2hHL0hlRW5mcTlBWlpOWlNVNTZjR2M3WFRoNkJX?=
 =?utf-8?B?UEVZRTNpMDdHVWVtTHN3RmowdzZXbUJVejdFR1c5cCs3bFhsb1hlRVZ2VVJn?=
 =?utf-8?B?V1dJZnYwWit3PT0=?=
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:64aa7808-outbound-1.mta.getcheckrecipient.com;CAT:NONE;SFS:(13230040)(82310400026)(35042699022)(14060799003)(376014)(1800799024)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Dec 2024 18:07:09.8373
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: cbee8ef2-e6c0-48ae-9cb9-08dd1ba0f669
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AM1PEPF000252DD.eurprd07.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAVPR08MB9841
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 13 Dec 2024 18:07:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/208689

T24gMTMgRGVjIDIwMjQsIGF0IDE1OjE0LCBBbGV4YW5kZXIgS2FuYXZpbiB2aWEgbGlzdHMub3Bl
bmVtYmVkZGVkLm9yZyA8YWxleC5rYW5hdmluPWdtYWlsLmNvbUBsaXN0cy5vcGVuZW1iZWRkZWQu
b3JnPiB3cm90ZToNCj4gDQo+IE9uIEZyaSwgMTMgRGVjIDIwMjQgYXQgMTU6NTMsIERlcmVrIFN0
cmFrYSA8ZGVyZWtAYXN0ZXJpdXMuaW8+IHdyb3RlOg0KPj4gVGhhbmtzIGZvciB5b3VyIG5vdGUu
ICBJ4oCZbSB3b3JraW5nIHRocm91Z2ggdGhlIHJlbWFpbmluZyBkb3duc3RyZWFtIHJlY2lwZSBj
aGFuZ2VzIHRvZGF5IHdoaWNoIHNob3VsZCBhZGRyZXNzIHRoZSByZXN0IG9mIHRoZSBVTktOT1dO
X0JST0tFTiByZWNpcGVzLg0KPj4gDQo+PiBXaGlsZSBsb29raW5nIGF0IGl0IHllc3RlcmRheSwg
dGhlIGRvd25sb2FkIHBhY2thZ2VzIGNvbWUgcHJpbWFyaWx5IGluIHR3byBhcmNoZXR5cGVzOg0K
Pj4gMS4gVGhvc2UgdGhhdCByZXBsYWNlIOKAmF/igJkgd2l0aCDigJgt4oCYIGluIHRoZSBzb3Vy
Y2UgYXJjaGl2ZXMNCj4+IDIuIFRob3NlIHRoYXQgbGVhdmUgdGhlIOKAmF/igJkgT05MWSBpbiB0
aGUgYXJjaGl2ZXMNCj4+IA0KPj4gR2l2ZW4gdGhhdCwgSSB0aGluayBpdOKAmXMgdW5saWtlbHkg
dGhlcmXigJlzIGEgY2xlYW4gZml4IGluIHRoZSBiYmNsYXNzIHdpdGhvdXQgYSBtb3JlIGludmFz
aXZlIGNoYW5nZSB0byB0aGUgdXBzdHJlYW0gY2hlY2sgbG9naWMuICBJIGNhbiwgaG93ZXZlciwg
cGFja2FnZSBhbGwgdGhlIGNoYW5nZXMgZm9yIG9uZS1jb3JlIGludG8gYSBzaW5nbGUgcGF0Y2hz
ZXQgYW5kIHN1Ym1pdCBhIHYyLiAgVGhhdCB3aWxsIGF0IGxlYXN0IGFkZHJlc3MgYWxsIHRoZSBj
b3JlIHVwZGF0ZXMgaW4gb25lIGZlbGwgc3dvb3AuDQo+PiANCj4+IERvZXMgdGhhdCBzb3VuZCBy
ZWFzb25hYmxlPw0KPiANCj4gU2VlbXMgc28sIHllcy4NCj4gDQo+IEhpc3RvcmljYWxseSBweXBp
IHVwc3RyZWFtIGNoZWNrcyBoYXZlIGJlZW4gYSBwYWluLCBhcyB0aGVyZSBoYXMgYmVlbg0KPiBh
IGNvbnN0YW50IHN0cmVhbSBvZiBzZWVtaW5nbHkgcmFuZG9tIGJyZWFraW5nIGNoYW5nZXMsIG9m
IHR3byB0eXBlczoNCj4gDQo+IDEuIF8gYmVpbmcgcmVwbGFjZWQgYnkgLSBhbmQgdmljZSB2ZXJz
YQ0KPiAyLiBDYW1lbENhc2luZyBiZWluZyByZXBsYWNlZCBieSBsb3dlcmNhc2luZyBhbmQgdmlj
ZSB2ZXJzYS4NCj4gDQo+IEkgaGF2ZW4ndCBiZWVuIGFibGUgdG8gZmlndXJlIG91dCBhbnkgcGF0
dGVybiBpbiB0aGlzLCBvciBjb21lIHVwIHdpdGgNCj4gYSB1bml2ZXJzYWwgY2hlY2suIElmIHlv
dSBjYW4gc2ltcGx5IGZpeCB1cCBjb3JlIHJlY2lwZXMgdG8gbm90IHJldHVybg0KPiBVTktOT1dO
X0JST0tFTiwgSSdkIGFwcHJlY2lhdGUuDQoNCknigJl2ZSBzb21lIHBhcnRpYWwgYnJhbmNoZXMg
dGhhdCBhdHRlbXB0IHRvIGJyaW5nIHNhbml0eSB0byB0aGlzIGJ1dCB5ZXMsIGl04oCZcyBhIG1l
c3MuDQoNClRoZSBnb29kIG5ld3MgaXMgdGhhdCBodHRwczovL3BlcHMucHl0aG9uLm9yZy9wZXAt
MDYyNS8gc2F5cyB0aGF0IHNkaXN0IGZpbGVuYW1lcyBzaG91bGQgYmUgbm9ybWFsaXNlZCBhbmQg
ZnJvbSB3aGF0IEkgY2FuIHRlbGwgZXZlcnl0aGluZyBidXQgc2V0dXB0b29scyBkb2VzIG5vcm1h
bGlzZSwgYW5kIHRoZSB1c2Ugb2Ygc2V0dXB0b29scyBpcyBmYWxsaW5nLg0KDQpUaGUgc2ltcGxl
IHVwZGF0ZSBBUEkgc2F5cyB0aGF0IHRoZSBwcm9qZWN0IG5hbWUgaXMgbm9ybWFsaXNlZCwgc28g
d2UgY2FuIGFkZCBhIGxpdHRsZSBub3JtYWxpc2UgZnVuY3Rpb246DQoNCmRlZiBweXBpX25vcm1h
bGl6ZShzKToNCiAgICBpbXBvcnQgcmUNCiAgICByZXR1cm4gcmUuc3ViKHIiWy1fLl0rIiwgIl8i
LCBzKS5sb3dlcigpDQoNCkFuZCB1c2UgdGhhdCB0byB0dXJuIHRoZSBQWVBJX1BBQ0tBR0UgaW50
byB0aGUgcmlnaHQgdGhpbmcsIHN1cmVseT8NCg0KUmF0aW9uYWxpc2luZyB0aGlzIGlzIHRoZSBz
b3VyY2Ugb2YgYXQgbGVhc3QgdGhyZWUgd2lwIGJyYW5jaGVzIEkgaGF2ZSBsb2NhbGx5LCBzbyBJ
4oCZZCBsb3ZlIHRvIHNlZSBpdCBzb3J0ZWQuDQoNClJvc3M=

