Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 16BAEC2BA1A
	for <webhook@archiver.kernel.org>; Tue, 18 Jun 2024 18:54:28 +0000 (UTC)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (EUR05-VI1-obe.outbound.protection.outlook.com [40.107.21.41])
 by mx.groups.io with SMTP id smtpd.web11.2439.1718736862078615664
 for <openembedded-core@lists.openembedded.org>;
 Tue, 18 Jun 2024 11:54:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=MnVe6lBi;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=MnVe6lBi;
 spf=pass (domain: arm.com, ip: 40.107.21.41, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=TqH9fiw4sHLxGy+Qcq3Ga4p5jMOoFO9MSaAoZiIYbE5C9UqEc2PMIhGEQrDPiG4bjfhHV0b6YWA/JceW/Kym8x0Bl8XBN5S2xwnp37A0vbJmlZcdHzeEBlzpErS0z3Lut95iLok+pcJ2HqFonmxNvGmvR5m40zkiIh7Xat1DFbpG/zAK8yJf03pnTLA/wHhji4fX03tUdLoXeRTXBIjKGKSap31RSvvF82iQP6qyx64rGaWyCnc9KEvxQUvLB4SegUSEgxjRhDq11p0WNDGIfmUrAE7TMFNbptfw6reNanBHyGNc1wchr2XZJvfV1I55A8Q/8RNSsZdenK7kvTZmFw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9q92eoqNlb1F/yYKLQKZxMP4j4NZ3oM6JhhS9FIB2NM=;
 b=eqZXmkPgpTd9bsopsM3uZf9kG8FG90lMA21HZ8HyU+vmhTAGvmfiDXJWriQhn1Q8y6CZLuaGdJG/gnfujI0MfdWBikfW/eAqOVwjzT4vq8zWe8zCU/ZoqAM4oIg3/B0sWXUB7NDVXhwfOdD1OsM4KmvQX/LtbFYZMmA5J69kmbDI72UxCwOG/+Y1QzIxMQDdw7yVUS0crqLfyv4GHXVze+cylA3alH4LkpRgglPN3SXp8321MZFXpW0vVriZrTN/zgTWNPAZO+z/NMvjfLynuI1VoGhmqXQR5yWMIgiw4z9NrlEGze4bsxDhhxCUpKWTqFzRTn6F3qComu0OOHEnWA==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.openembedded.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9q92eoqNlb1F/yYKLQKZxMP4j4NZ3oM6JhhS9FIB2NM=;
 b=MnVe6lBiTOjapEDJe9qzHODyvTfykbIOyWyLUR3Mpw9VIMqD3efEsa9oqoRZ+92nKOK6H5mAsXAXtxVYQNSDUMrgViRlKVLQN8xfYYtMydielpozlZXhZR5tK+XAEZTC2GsM26ZaXCknPtu9gZGpPkP7Hj8J15YgNhH9FoggFng=
Received: from AM6PR04CA0035.eurprd04.prod.outlook.com (2603:10a6:20b:92::48)
 by PAVPR08MB9308.eurprd08.prod.outlook.com (2603:10a6:102:303::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7677.30; Tue, 18 Jun
 2024 18:54:17 +0000
Received: from AMS1EPF00000047.eurprd04.prod.outlook.com
 (2603:10a6:20b:92:cafe::d2) by AM6PR04CA0035.outlook.office365.com
 (2603:10a6:20b:92::48) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7677.31 via Frontend
 Transport; Tue, 18 Jun 2024 18:54:17 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AMS1EPF00000047.mail.protection.outlook.com (10.167.16.135) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.7677.15
 via Frontend Transport; Tue, 18 Jun 2024 18:54:16 +0000
Received: ("Tessian outbound fcd698738a24:v339"); Tue, 18 Jun 2024 18:54:16 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 82716a0dd5d2c64f
X-CR-MTA-TID: 64aa7808
Received: from d122d3b663e3.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id C4112A37-BAF1-4757-943B-AFEEEF3BC11A.1;
	Tue, 18 Jun 2024 18:54:10 +0000
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id d122d3b663e3.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Tue, 18 Jun 2024 18:54:10 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ApTlRU0xbckYiMreCmAcQH6oX9AgMV2ZMnv99tnwTSfXhLChgCHvH3feBAD2S/V1Me7zB01yHJI/KrExD95BZTqDmkj1H/2mi4PWKg2d7FeJFUnE6289Zi0yHlttuVxIPwTUiQ2/TMKGl0NlAfphgdp3t2hnYcA8GYUmgfVbcZqdzLwOcfIsSVomxPH6DIT0dY8lyqQ3v3F13AKLUzPsZB/TtxO3OfN/3dm4FNdr4xoChUH8gaSqGXZZJKxpCqhDcwUpIbYLduUfcubrPIEgzDCG7lPYdB6xX8edvkMn6FdEXuwj/EE9JgJT+dtlzubDcra7oWdjPNrLirgRvgjWLw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9q92eoqNlb1F/yYKLQKZxMP4j4NZ3oM6JhhS9FIB2NM=;
 b=QBk2h2CJnavA6/rLoJfXMibI4M/qntnIVO0HBsJCszZYdNZcXfSIkoQ3slG6AEn+5Cf9COVRE2vHVx0dGX6VmETx0k7iVhQwI3SSC89ePm7CBRvoOnfhM06Ek7LpPmP3iJxC/NJ5vM90sGwZxusg28EQZUD9eVflOQoLw5TAaSIZukECaH5uAj+qa0lk0nkCbW+e9pIeI7DoMVH3YirsQEqCNeUOeG4NQ2+DK2igniv1ku4ZYTGyFvqiNQ+ntZZzraZ9lCWlQtbeVW7yJDCdTByfYK4TGDn9rVxyhKnfyQVY8BbyY2TvihzeamxVyhUkhVzwOyRgVXPtz7ttaz8opw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9q92eoqNlb1F/yYKLQKZxMP4j4NZ3oM6JhhS9FIB2NM=;
 b=MnVe6lBiTOjapEDJe9qzHODyvTfykbIOyWyLUR3Mpw9VIMqD3efEsa9oqoRZ+92nKOK6H5mAsXAXtxVYQNSDUMrgViRlKVLQN8xfYYtMydielpozlZXhZR5tK+XAEZTC2GsM26ZaXCknPtu9gZGpPkP7Hj8J15YgNhH9FoggFng=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by VE1PR08MB5744.eurprd08.prod.outlook.com (2603:10a6:800:1af::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7677.30; Tue, 18 Jun
 2024 18:54:07 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::9206:40ba:ef7e:729e]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::9206:40ba:ef7e:729e%4]) with mapi id 15.20.7677.030; Tue, 18 Jun 2024
 18:54:06 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: "johannes.schneider@leica-geosystems.com"
	<johannes.schneider@leica-geosystems.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH v1 2/2] systemd: bpf-framework: pass
 STAGING_INCDIR to eBPF compiler
Thread-Topic: [OE-core] [PATCH v1 2/2] systemd: bpf-framework: pass
 STAGING_INCDIR to eBPF compiler
Thread-Index: AQHaukkoYBoo53hI1kWdeIfRxFLAVbHNzIQAgAAgpwA=
Date: Tue, 18 Jun 2024 18:54:06 +0000
Message-ID: <651F4B44-70FD-422E-8F10-559D118AB389@arm.com>
References: <20240609084321.1070686-1-johannes.schneider@leica-geosystems.com>
 <9E1C8B14-8015-4691-9BB0-B02F401895E5@arm.com>
In-Reply-To: <9E1C8B14-8015-4691-9BB0-B02F401895E5@arm.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3774.600.62)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|VE1PR08MB5744:EE_|AMS1EPF00000047:EE_|PAVPR08MB9308:EE_
X-MS-Office365-Filtering-Correlation-Id: adb7b339-7380-42c4-99ea-08dc8fc80df4
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: 
 BCL:0;ARA:13230037|1800799021|376011|366013|38070700015;
X-Microsoft-Antispam-Message-Info-Original: 
 =?utf-8?B?ZmxRZGlIZVhmVXBFZVV0UmhwZjB0SU81b0ROUUI0VlVtQkU4SW92MEVIQ2Ex?=
 =?utf-8?B?V3BnS0VkTStYYVdQOGI2MmhXZll6YXJaZEhmRFFOZ0dyRHdwS0pZN21yb2s1?=
 =?utf-8?B?eUpUc0RHcDc3Q0xGcitkUUFUUXJFRlVpbWh4LzZ4SmhJN3RzSUJUNlVYM25U?=
 =?utf-8?B?QVF4aXp4SHYrdmFHbmNOc2RFNzNZTXR5eGxVZlEwY3ZNejhSWnhvRVJLSEtL?=
 =?utf-8?B?LzkyOFcrL2w4dU9UN05PcENpbHdsU3FTdlFBcWM4YkFBME85NU1LRHVJcWp6?=
 =?utf-8?B?TkxwMXZCNnRzVVRpOGU5WWw4WXcreU1XemM5a3h2RU5SdkJWWWtzQ0lhcE1S?=
 =?utf-8?B?R2EwRGNKWW1CRE13Z3RqTWRJMVJXTVBRV1RIOFhTK2g4ZFQ2L1Urb0dJOGYz?=
 =?utf-8?B?N2R5Unp4L2ZQdmNidHBBQmlTQTBQNWk4WGM5YUtaY2hEL0VZRUJzUGtFTUNZ?=
 =?utf-8?B?VW5MOXNKM3J4Vm1IMWpYVCt1KzVLeXpEQ3NpQk1ZbW1jbEpsVzF4VVhmNzJB?=
 =?utf-8?B?cnNBUncxaXRNSlpWc0xqci9LK0t2TGplQU51a1BSM0pmUTFBd0lZaE5VbVo3?=
 =?utf-8?B?eFFSU1dXeWo3dExxVElpTitVWjdZMStBaklVYW1nTVlneWNkK1dkcFUxRlN3?=
 =?utf-8?B?U0RlajBmdUNPUnFEWGs5VDh0UFVCN2dFZjlLREdiN0xYSUE0cDdwQjN3OHBi?=
 =?utf-8?B?MDBCby9tcEJ6SmVNRWdpcDFJRFl4Q0ZRb1lwQ3lZSE1ZejdsYXF5MC9EODVu?=
 =?utf-8?B?MVJnV0RiL2hpcjlZWSs0Wlo2S0k3VXk1TGkwUDYvd1RjNzhQMVhvcSszVXpS?=
 =?utf-8?B?bE05UkEzdVNsQXNkK0haVmw4L2FJdEFSRjBiRWdlWGdVb1FXWlZpeVRJZHA5?=
 =?utf-8?B?emhnUytRVlAxditaQUh4VzhEcnhic0poa0U2T01UZkJlZkY5SmhJRlQyNitR?=
 =?utf-8?B?QlBkZDlDb1JQMEFJL0lnOTFsdGJRM2dNWDFMUjRTZWJGTTFxZWJKYjlsOXJF?=
 =?utf-8?B?a1h6dW9XTXZtRTNzODRwOEpqcitNOGpwTDhZVGdIb21wVFBlbzh2aHVodlZn?=
 =?utf-8?B?ejVjMU0yZ2lVbktIYVM3aWFlQW9IMGxBa3drRzdTS2N2bmRTbTlkQnhSek1o?=
 =?utf-8?B?WjdOeUkrOUZ0cjBSeGNNRFlRL1B5bVZ2UWdOZ2FYMW5GREp5UEN5YkVoYmhz?=
 =?utf-8?B?b09jWTNPbkJFUk5oYnhmOGQ2Z2F4U29tYXRpV0wwdEhqd3JHNkx3aFp5UHBo?=
 =?utf-8?B?L0gxSG0wVjJENVR3MXlORVBlMTNsUmxBRDQwbkp1aFF5S0tnWHFtNi9uZ0Qr?=
 =?utf-8?B?Vmd5b2ZZMS9vMldxcCt6eHVoZGlNK3VsM1F4OW1JbzFiVllOTUhwVmhjR0Y5?=
 =?utf-8?B?a0Q2Z1pBWHBOdHlHZ3JMclI1dlp6N1dYeCt0ajdYcXZKZzVnWnoxTUY0U2tW?=
 =?utf-8?B?b2VsdEtSYTRYYVRCZTI1WWswSHZKU3lCUkRxaWd4dTNKaXlNNXplMFpvZVB3?=
 =?utf-8?B?WkgvbFBvUSswL1NKb0dSTm90Mk5rRTJSQkwzeXJoaDkzdG1IdWJKOHFyNDcz?=
 =?utf-8?B?YldrcDVQRk8zaVRFcFh3SjNJUlkyeVVBL294ZFZjSXpIWklWZW93Wk5lU000?=
 =?utf-8?B?Z3piYUc0THhZbTB6MDVXeUM5QkVHTWpPVVFTallZZURGdm9BUkRQdmZ3cHZw?=
 =?utf-8?B?MkE2Y2o5dXZLUDhNTjRFUSs5clloNmozcElBVWtrMUVreENPcVpRd0NBenEy?=
 =?utf-8?B?MWMvR0YvalZrUGsyRXlNaEhsRlF6MnRBQndpa1F4b3FDOUNRYUovSEFwWEJZ?=
 =?utf-8?Q?sz2NA9uePrTiiwN34S8+QVm42dBJ2avvi6Tz8=3D?=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230037)(1800799021)(376011)(366013)(38070700015);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <09F9FDD5C11B4B40A9872A13CA78C86D@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR08MB5744
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 AMS1EPF00000047.eurprd04.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	da1ab950-9041-4627-a41a-08dc8fc807f7
X-Microsoft-Antispam: 
	BCL:0;ARA:13230037|36860700010|34020700013|35042699019|376011|82310400023|1800799021;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?WkRpNzhaUlF4UEU3bnIxN0VhRHJoMENqRkcyVHlrOHlheFUxYSs0ak1qWFA1?=
 =?utf-8?B?WGd2TS9UUGZWQWxxa2FSV0lXc1ZMWFB6b0dtenNJUWtWTGJ0ajlsclNZU0U2?=
 =?utf-8?B?U05XLzRGbjZqRFViQ1dlNk82R290R0xZOTg5V1l2Q0M2eitDRS9KdngvSnhr?=
 =?utf-8?B?ci9rT2hTOVI2M2h6SnRuWFNiMWpBVjRJU1dRbnRPQW9mclRVTjBlMmJuRm1q?=
 =?utf-8?B?enRUK25yM2Y1eDlpSDVVTnl6KzVveFBkWmpzNFVWTE5Mc001VTEyQnhWRFNU?=
 =?utf-8?B?b0laaHMxcjBBTytKM1M3TExkNzl0UDFwblQ0c2pOOUxQZitHeDV0WE9rckJn?=
 =?utf-8?B?QmRRcnJoR1Vzd2VsMUJyY0FBNGk4b3RqMUgxR0ZNbTlSTExEcDMyVURLWWJY?=
 =?utf-8?B?RHNteU9RcXZZbDAzVU04QWhoNmV0TzBGK0RYWGhiZXlJekM3U0ZLUENRdnpY?=
 =?utf-8?B?dnBEaUVuSG93VjRsQ0VXWFh3dGNOUzE0MTZKd2xXdzJXU1lSc3RoUmtaSWh2?=
 =?utf-8?B?K3k4U2N5ZkxyV2JIZG50em9YOWI0aUEyQ0c4emNqbmFsUGhWOUdPMHNBNGhV?=
 =?utf-8?B?QzN0bjE5SWN5b0UyNmpmS25TU1pWYzE3U0lQc1JUTUR3bjkrMitkR1kySkpt?=
 =?utf-8?B?S1RmbkJObnBPZWozNDF4dDkyaTZicnVPbmpzUHR1QWdzeTYrb2I1akU2b1p5?=
 =?utf-8?B?OHVjTUNpcDhFejJPQXp2ZEN0anhPcmZSVlZnOHBIL2t2bzJybkgwbWc3UEc1?=
 =?utf-8?B?bjcyOVNNQzYzcG9kYkZOcU41ajBuclJReDFJQVlHZlNYWDVXMkJvVlNZSzB4?=
 =?utf-8?B?d1ZHem1RVXBVdy9waCs5UFNxTG9zWWhOKzZ5aXNoSWtSbVRCcllCWGpGblB5?=
 =?utf-8?B?YUtjNTlSQ1pPVE95R2kveGRqeGQra1MrMWRtaGduTEZ1eHN3UmJoMnZ6MHcx?=
 =?utf-8?B?U3Y0Qm8vK3J3emhJY1Fkc2JXMEZoandVVGM4YXhxNlRuSlNtcnBSNjNqclY3?=
 =?utf-8?B?anBKMzFmSW9tcENhYkpZYVZTOFlUa29CZ2dDZU1Ia2M3bXNRUVV1a05CeUN1?=
 =?utf-8?B?eEs3M0R1QVgvWW1nQVMrL2NSc2NWdDF1SXlRcTFGWEExQ2tPK0dlempVRDcz?=
 =?utf-8?B?cmNWdk9iTDJzZEhmSkpJU3N6R1NkQ25KaFlIa0NwcUpIOXlBZ2xjRHZXLzRx?=
 =?utf-8?B?eXdWbmNWdXh1K0Y1Qjlvd3BRb0hwaUdnOWFINExuUVN6VCtLL3dONStqS0cz?=
 =?utf-8?B?MmUyR3V6aW4vK1dITStHVlRzZHUxUEhpVTJYbTNlbTlsZVRmaW4xYWVWSU0v?=
 =?utf-8?B?cjBsWm8wWjFKNTRYaENaUGlYWXBZdS9rZWp4VGc1WEZqc2FBZjRzaWVDUGF5?=
 =?utf-8?B?MVlkMUdha29sb2dRM3h2QVkwejJDMTY1WVROdGJic0lvaUlRRXpvZEdObGFE?=
 =?utf-8?B?TytkbklmZm5wVnh4elBwSnJ4VWowdHRFYm43aW5KUTA5Znd0RzFTV0VGUnJq?=
 =?utf-8?B?NGVxaGd1SDBIQXpGRDdwdGtsN3ZsU0xJRkliaGZWOVZjM3dWVC9IRUhxZWZR?=
 =?utf-8?B?U2V2YTFLZk15SlV3NjllTUluN3VGSjE3NlB5SXpsR2p2TSt1aGRrZWtDT085?=
 =?utf-8?B?L3A5TkpYNXh0QXpJRlZyaXJXN01pL3RoZUc0aUJBTmJDYXpvZWlBZDkrTHIr?=
 =?utf-8?B?Um5KSnpXUEZZR0lwM1loZGlwL2xmNUxvQllOMTFqVWVUSkhUOGt4Um5kVkw1?=
 =?utf-8?B?ZkpUdlY1TEhmdTZuMkdsSldIMjJic2tSdDE3NVIzb1JoNnQrdldUYTFFYjRQ?=
 =?utf-8?B?MkZzcXhCTmpKam9wUkhLZllZdEkrY2M1YmI5TmhtZG40RjNNcjl0VlkwcXdY?=
 =?utf-8?B?MG8xQ1FLemI1dG5HeGJGQ3g2RkZiTm50RFRaWVA2VTlrVUE9PQ==?=
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230037)(36860700010)(34020700013)(35042699019)(376011)(82310400023)(1800799021);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jun 2024 18:54:16.9507
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: adb7b339-7380-42c4-99ea-08dc8fc80df4
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AMS1EPF00000047.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAVPR08MB9308
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 18 Jun 2024 18:54:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/200884

T24gMTggSnVuIDIwMjQsIGF0IDE3OjU3LCBSb3NzIEJ1cnRvbiB2aWEgbGlzdHMub3BlbmVtYmVk
ZGVkLm9yZyA8cm9zcy5idXJ0b249YXJtLmNvbUBsaXN0cy5vcGVuZW1iZWRkZWQub3JnPiB3cm90
ZToNCj4gDQo+IEkgd2VudCB0byBoYXZlIGEgcXVpY2sgbG9vayBhdCB0aGlzIGJ1dCBjYW7igJl0
IGJ1aWx0IGJwZnRvb2w6DQo+IA0KPiBFUlJPUjogYnBmdG9vbC1uYXRpdmUtMS4wLXIwIGRvX2Nv
bXBpbGU6IG9lX3J1bm1ha2UgZmFpbGVkDQo+IEVSUk9SOiBicGZ0b29sLW5hdGl2ZS0xLjAtcjAg
ZG9fY29tcGlsZTogRXhlY3V0aW9uRXJyb3IoJy93b3JrL3Jvc3MvYnVpbGQvdG1wL3dvcmsvYWFy
Y2g2NC1saW51eC9icGZ0b29sLW5hdGl2ZS8xLjAvdGVtcC9ydW4uZG9fY29tcGkpDQo+IEVSUk9S
OiBMb2dmaWxlIG9mIGZhaWx1cmUgc3RvcmVkIGluOiAvd29yay9yb3NzL2J1aWxkL3RtcC93b3Jr
L2FhcmNoNjQtbGludXgvYnBmdG9vbC1uYXRpdmUvMS4wL3RlbXAvbG9nLmRvX2NvbXBpbGUuMTA1
MjYzNQ0KPiBMb2cgZGF0YSBmb2xsb3dzOg0KPiB8IERFQlVHOiBFeGVjdXRpbmcgc2hlbGwgZnVu
Y3Rpb24gZG9fY29tcGlsZQ0KPiB8IE5PVEU6IG1ha2UgLWogNjQgVj0xIC1DIC93b3JrL3Jvc3Mv
YnVpbGQvdG1wL3dvcmstc2hhcmVkL3FlbXVhcm02NC9rZXJuZWwtc291cmNlL3Rvb2xzL2JwZi9i
cGZ0b29sIE89L3dvcmsvcm9zcy9idWlsZC90bXAvd29yay9hYXJjbg0KPiB8IG1ha2U6IEVudGVy
aW5nIGRpcmVjdG9yeSAnL3dvcmsvcm9zcy9idWlsZC90bXAvd29yay1zaGFyZWQvcWVtdWFybTY0
L2tlcm5lbC1zb3VyY2UvdG9vbHMvYnBmL2JwZnRvb2wnDQo+IHwgZ2NjOiBlcnJvcjogdW5yZWNv
Z25pemVkIGNvbW1hbmQtbGluZSBvcHRpb24g4oCYLWZjYW5vbi1wcmVmaXgtbWFw4oCZOyBkaWQg
eW91IG1lYW4g4oCYLWZtYWNyby1wcmVmaXgtbWFwPeKAmT8NCj4gfA0KPiB8IEF1dG8tZGV0ZWN0
aW5nIHN5c3RlbSBmZWF0dXJlczoNCj4gfCAuLi4gICAgICAgICAgICAgICAgICAgICAgICAgY2xh
bmctYnBmLWNvLXJlOiBbIE9GRiBdDQo+IHwgLi4uICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgbGx2bTogWyBPRkYgXQ0KPiB8IC4uLiAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICBsaWJjYXA6IFsgT0ZGIF0NCj4gfCAuLi4gICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgbGliYmZkOiBbIE9GRiBdDQo+IHwNCj4gfCBtYWtlIC1DIC93b3JrL3Jvc3MvYnVp
bGQvdG1wL3dvcmstc2hhcmVkL3FlbXVhcm02NC9rZXJuZWwtc291cmNlL3Rvb2xzL2xpYi9icGYg
T1VUUFVUPS93b3JrL3Jvc3MvYnVpbGQvdG1wL3dvcmsvYWFyY2g2NC1saW51eC9icGZ0b1wNCj4g
fCBERVNURElSPS93b3JrL3Jvc3MvYnVpbGQvdG1wL3dvcmsvYWFyY2g2NC1saW51eC9icGZ0b29s
LW5hdGl2ZS8xLjAvYnBmdG9vbC0xLjAvbGliYnBmIHByZWZpeD0gL3dvcmsvcm9zcy9idWlsZC90
bXAvd29yay9hYXJjaHMNCj4gfCBtYWtlWzFdOiBFbnRlcmluZyBkaXJlY3RvcnkgJy93b3JrL3Jv
c3MvYnVpbGQvdG1wL3dvcmstc2hhcmVkL3FlbXVhcm02NC9rZXJuZWwtc291cmNlL3Rvb2xzL2xp
Yi9icGYnDQo+IHwgZ2NjOiBlcnJvcjogdW5yZWNvZ25pemVkIGNvbW1hbmQtbGluZSBvcHRpb24g
4oCYLWZjYW5vbi1wcmVmaXgtbWFw4oCZOyBkaWQgeW91IG1lYW4g4oCYLWZtYWNyby1wcmVmaXgt
bWFwPeKAmT8NCj4gfCBnY2M6IGVycm9yOiB1bnJlY29nbml6ZWQgY29tbWFuZC1saW5lIG9wdGlv
biDigJgtZmNhbm9uLXByZWZpeC1tYXDigJk7IGRpZCB5b3UgbWVhbiDigJgtZm1hY3JvLXByZWZp
eC1tYXA94oCZPw0KPiANCj4gTG9va3MgbGlrZSBhIHByb2JsZW0gd2l0aCB0aGUgaG9zdCBjb21w
aWxlciBiZWluZyBwYXNzZWQgdGFyZ2V0IGZsYWdzLiAgSGF2ZSB5b3Ugc2VlbiB0aGlzPw0KDQpZ
ZXMsIGJwZnRvb2wgaXMgcGFzc2luZyBERUJVR19QUkVGSVhfTUFQIHRvIHRoZSBob3N0IGNvbXBp
bGVyIHdoZW4gYnVpbGRpbmcgbmF0aXZlbHksIHdoaWNoIHdvbuKAmXQgd29yay4NCg0KSSB3b3Jr
ZWQgYXJvdW5kIHRoYXQgYW5kIGhhZCBhIGxvb2suICBBIGxlc3MgdWdseSBhbmQgcHJvYmFibHkg
dXBzdHJlYW1hYmxlIHNvbHV0aW9uIG1pZ2h0IGJlIHRvIGFkZCDigJRzeXNyb290IHRvIHByb3Bh
Z2F0ZV9jZmxhZ3MgaW4gbWVzb24uYnVpbGQsIGFuZCBhZGQgdGhlIHN5c3Jvb3QgdG8gQ0ZMQUdT
IGRpcmVjdGx5IGluIHRoZSByZWNpcGUuICBGb3IgaGlzdG9yaWNhbCByZWFzb25zIHdlIHBhc3Mg
dGhlIHN5c3Jvb3QgdmlhIENDLCBidXQgc3BlY2lmeWluZyBpdCB0d2ljZSB3b27igJl0IGh1cnQu
DQoNClJvc3M=

