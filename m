Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 05E9FC369C2
	for <webhook@archiver.kernel.org>; Thu, 17 Apr 2025 10:10:07 +0000 (UTC)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (EUR05-DB8-obe.outbound.protection.outlook.com [40.107.20.42])
 by mx.groups.io with SMTP id smtpd.web11.5267.1744884600858448333
 for <openembedded-core@lists.openembedded.org>;
 Thu, 17 Apr 2025 03:10:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=XMKKLO+Z;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=XMKKLO+Z;
 spf=pass (domain: arm.com, ip: 40.107.20.42, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=qDjAa7B5HFQCJVcykIRPYMSLRardFKyp6BoqP9aFQjZi/FSSV71I7iuzlTpDhSrhEtkYoAjUoIID4E/bHptv/1mVYov2ZtP6cVCceq5VeuWtuI0Wa838fDy72aOdnGvgLSVY+AKXp+BEa/6VA7SrNwhFs6vrm2vPVrIZ81+r6Vdnl6XYjPrpiLpMRIfFGuLeC4nPtDAj8FWD1Cz0FiWrEi0S47ZWxu3n/IX7yy5biksyWyDkLrf1a3ocIDP+bStoOIFIUfxebX0LhWaxNebyfFno+tWAA6pr0ArDc6iEe/wfPDy2uSwXe77mk0Ty1G+dzQ4kwawQpNCC8m0yB9laAA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5BBKxupWYCS6oU2KN4fVb8tCwHhXh5SSqI1Uxi3ZHtU=;
 b=RIzNMR8RNx6J8rWjfNdz3TKLpp2Xsrhz1Udd5m6NyBPpNZQOu7781f5RWc4FaVMMFXZym5mJ6bGFYM66iHBm3pJwblpT1FCmdnsGKiTZ7STPzmYfGk4PgtbScQzD0EoJ7hIA7G1zUhLGL0G66l9AE7TdYXy/o0eS+n3bzHyj7csQg2gLNS+T1CKl7DB7si3p3VfA6nRnpZopUIbRGt82W8CMp1yCVYIwb29+oR6/2N2usLyDeuEhcy1cppnR+Isiqu8PUKyBY9Dk+lxD2bs0iQ+6d5C8SdGaMoUYHFGrkI6BYm0DwAieDVT0ttdanodrNLVcCiBS4v4V16rtCjv6OQ==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=fujitsu.com smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5BBKxupWYCS6oU2KN4fVb8tCwHhXh5SSqI1Uxi3ZHtU=;
 b=XMKKLO+ZBdBsEs3JXSZjpQ50MsGeRCcVc1wP61a2W8R+U9DcBs4ybzNIhfoZS7iH4H/AOJj30MIU5ny8kP4xaF8bIDOYwrnoJ72ERxTwhXr9kMQfA0gu0WgbS0ZOAdqKAzniABmHZmL2k6Gagfdc7R4yPvujCUD9XuppqgNeUl0=
Received: from DB8PR09CA0012.eurprd09.prod.outlook.com (2603:10a6:10:a0::25)
 by AS4PR08MB8189.eurprd08.prod.outlook.com (2603:10a6:20b:58c::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.34; Thu, 17 Apr
 2025 10:09:57 +0000
Received: from DB5PEPF00014B89.eurprd02.prod.outlook.com
 (2603:10a6:10:a0:cafe::2f) by DB8PR09CA0012.outlook.office365.com
 (2603:10a6:10:a0::25) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8655.18 via Frontend Transport; Thu,
 17 Apr 2025 10:09:57 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 DB5PEPF00014B89.mail.protection.outlook.com (10.167.8.197) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8655.12
 via Frontend Transport; Thu, 17 Apr 2025 10:09:55 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pJsYpwNSdeHK+P1fJ7K4Gzan6tKXDMpUDL5gYG6f71fCBtLtMdGLJHstwTbT28dTRZuh9JG2oF3CjT7/4KIvLobnFqT5r354oXKKLtKmoU7hJWfN7roX4CzwLdzH7xNkj+PavUzvJwQYCih/HnkA1YAp8okmot/6C/ZdUL/PDKvSd0+rnC29T69Qg2ON0JK4XJBiw5F68tRzoa+CKhBedFw2nJy3yTLF5ta1iahytXpm4h9IRrWvLOQnQr92h3ztfQhAgquFbguvi1MYf8JSji/gzlfAifHECZj+maV43iejqhT0tkkwi9Fs9nvjflTwJFUslJJvZkfBSP1+imbzdg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5BBKxupWYCS6oU2KN4fVb8tCwHhXh5SSqI1Uxi3ZHtU=;
 b=LZNoA6Q1O8SDymiefLMmA8W/MCYbsiwbH2IQF98E4hWGHJje7fyk4tu7i6kDeIzs7Xih7oArtVEUdh6P2DDcUI/uuRg0r535Be2ZnOXv7RyUGbqmM73g9lR4qVNIlKb2oNF+B1VCS1Rp3WM/IF5fstFbo3D3d1bUCVcTxuSQgzaXVVhyxgKlAkH8hSbYJA4KuZc0cNU9z1PqCnsKa77ohEabMp87fVmvGI+aJA3c1ceA3jkpO1qPW1LgF8OI3A/qPrXJ5aGCA3DlYCXs+ZXvKzxuepJg5wm7t+dQuK1iycVkqSmWqv3qxvD76NZ43gpCJhKQY3OkAgOfYFlewS2qYw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5BBKxupWYCS6oU2KN4fVb8tCwHhXh5SSqI1Uxi3ZHtU=;
 b=XMKKLO+ZBdBsEs3JXSZjpQ50MsGeRCcVc1wP61a2W8R+U9DcBs4ybzNIhfoZS7iH4H/AOJj30MIU5ny8kP4xaF8bIDOYwrnoJ72ERxTwhXr9kMQfA0gu0WgbS0ZOAdqKAzniABmHZmL2k6Gagfdc7R4yPvujCUD9XuppqgNeUl0=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by GV1PR08MB8713.eurprd08.prod.outlook.com (2603:10a6:150:82::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8655.26; Thu, 17 Apr
 2025 10:09:23 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::9206:40ba:ef7e:729e]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::9206:40ba:ef7e:729e%5]) with mapi id 15.20.8632.035; Thu, 17 Apr 2025
 10:09:22 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: "leimaohui@fujitsu.com" <leimaohui@fujitsu.com>
CC: Jose Quaresma <quaresma.jose@gmail.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH v2] gstreamer1.0-dev: Fix install conflict when
 enable multilib
Thread-Topic: [OE-core] [PATCH v2] gstreamer1.0-dev: Fix install conflict when
 enable multilib
Thread-Index: AQHbr361L9l5cXgRKkCvF5Lcf85+l7OnoooA
Date: Thu, 17 Apr 2025 10:09:22 +0000
Message-ID: <B405C158-14A8-4AAD-9F0E-302D53EFB8A9@arm.com>
References: <20250417095402.762-1-leimaohui@fujitsu.com>
In-Reply-To: <20250417095402.762-1-leimaohui@fujitsu.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3826.500.181.1.5)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|GV1PR08MB8713:EE_|DB5PEPF00014B89:EE_|AS4PR08MB8189:EE_
X-MS-Office365-Filtering-Correlation-Id: a0c5d98a-4ef6-4a3f-24f5-08dd7d98007d
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: 
 BCL:0;ARA:13230040|376014|366016|1800799024|38070700018;
X-Microsoft-Antispam-Message-Info-Original: 
 =?utf-8?B?Y0xUVjNMOURYU0s1YTQ1STZoRk82Uk42SVBic1VMMisrTzJCRTBxamhaT1l6?=
 =?utf-8?B?YU9Pc0kzOUVaMWRFMFoweENvV3RCeWU0QjE5V2JZd2FrVVIzZEh1OVZsSWtH?=
 =?utf-8?B?d3ZHT1NuUm5rM2ViTWR3SDZqQTB1SUtpMjF4dHNYVHp5UDhjOGdqUzMvakpk?=
 =?utf-8?B?Q0lvdktNT2RUT1Z5RjBzMG5nTzRwN0c0dlpJOXlod2FJTTM2V2psajhhSnBo?=
 =?utf-8?B?WERmVVhRMEhmZ0ZUamRITko5eDdVb2NSYkxvVVlxc1MvQXdjRjhDZmsrTE8z?=
 =?utf-8?B?d0FwUWs0QzZuVGUxdEtuZlBDa09TbFNZMUUzVi94NkdObWltMktTcTZZS2wr?=
 =?utf-8?B?SXN3dmVnS3FjYW5sQW0zei9MRkN1YjBEdkFaSmIrei81NGpsZGxiN3ViM09m?=
 =?utf-8?B?bGh4azM2Mmt6R3R1Y3h5bVRyem5TcFRocHo4MUF1Q0R6dzVwejJ2MjZpTDBl?=
 =?utf-8?B?cWgzaExsWDhlKzdUT2lpNFR1VmRnTy9wNkdlMUtKUHFEeFI2SGIxRkdQeTYz?=
 =?utf-8?B?RndZWG9oQTVhbG11dkQ5MFNJZjdkQ3lEcTdTc2R3ZWROR3luUTFVREtkOFh5?=
 =?utf-8?B?MzRqUDFvYTN6aFlCc1lRVFFrTEE5SEVYQkRJSmpPU1lleVpCYVBya0UzRUp0?=
 =?utf-8?B?a202UUVSZmZjbE1iZ2xTTU80T3NPeWZBWG5nMkZlU2dHNXAwcVlzRldCZGFH?=
 =?utf-8?B?UExaUzJxaldya3MxVndsdll2TUE3Uzc5SDFMNFhKbW9MWWdNM0lxb2pPc3Yx?=
 =?utf-8?B?WWdwTXBYSXhjMHB2ckdZQkthNHc3Wms3YTYzQ0FQTTlsM2h4QnkydFdJRXU5?=
 =?utf-8?B?Y3lSNXkyZGQvd04wRVo1R3FIeit4N1lpM0VMc1hXcmd4bXZFSVBXcWJJZEhm?=
 =?utf-8?B?OVJLZHYwZ1NWUXdSRVdXM1dvRVRLbDhBZFFpRDVPV0dXTUl1a0JQL3ZDU241?=
 =?utf-8?B?aGF4UmFrYTZyMXd4bVdIMzI0YklrRzNNbmJhUUs2VXpTdW5sdTU1TFFGc0Ru?=
 =?utf-8?B?UzNjemc4T2t4enBxRlVzQVlLSGNHRVN0T3VZYUZndW1ZV2VoTjdlWW1vR0Vi?=
 =?utf-8?B?aWcvdTBzSFNQNjQzRmhCVTM0TFpESDFld2hOaTNqanJZWkNIenV6L0JuVWVo?=
 =?utf-8?B?MmtXNUlVU0xpUTZuVmNSUEZvakNmVGJBVHlRcFk4bVIxRldkN2Y3MFBraGhq?=
 =?utf-8?B?NmF0dEF5UnBLMzdZMGg5OEpEWUpkUEtuNzJMTzFBaFkyZjZEZXlpVTN1TVBR?=
 =?utf-8?B?ZUdmR0hmZ21zeHI3bk5Fc2dkdGkzUEEvcUhwb2VvN2ZhbTF6K3dUOXlpNnM0?=
 =?utf-8?B?VDFuN0VxSlRjYjdVb00wVjVLUGtMRE1iU3plQmJ3QTBuK2RFNmJKdlJ6R3NQ?=
 =?utf-8?B?dHdqNDl2Tkd6eVJPQXh4UmVEWUJOenEwVkpNbjdzZUFtckZGNWFiclhFVWpH?=
 =?utf-8?B?ZTdEWEZzNEhFUmt1TDZSV09uU1dIN0dmOVY2RmdhZzIxZjhPenFEelVIaHVv?=
 =?utf-8?B?QUwxRUpXb3Q3SCtoK2dnd3JrYkVxeHZ3aHNhWFZJVWh3NU9QWlFHanM5d2JE?=
 =?utf-8?B?TjR3NktJSHhMSkZvUHAzK0NBRkFUdXF0L3VRMU9xQ1h3VjJzZHVDcFk2TG1P?=
 =?utf-8?B?T2pNbU1kemU3bHltdEhHUUJSTUlVWTlBTFMvNzdsczhBclYvK0NSdzBCQTlN?=
 =?utf-8?B?akZSd3d0eW9raGJYdm5SQWJ2RUJKMFJaUkRIeEsrWmk3cXIvU1loQTJrZTB1?=
 =?utf-8?B?WGhzc01lN1cyK3Yxb1NuUVhsd2dVbHplT0NSS3pOdTAzM25WSU1PQnloUTF4?=
 =?utf-8?B?RmZLbCtJL0pCcHdiQXlVN2x3eG5rUGdxRTVCcmRvejVMNmxCYk5xZFkrcnow?=
 =?utf-8?B?Kys5Z1Bxa1dUcjRCN3lWMDFYZmFaR0ZHUlNDV1l5MmRKWG1uelo3Nk5yYXlv?=
 =?utf-8?B?MDJUaEdHbzZWKzdOQkVOSUNCcWlBdjhSdkY0UDBhMXlPZHp5Nys4QXUySmZD?=
 =?utf-8?B?emtFOHFyUDJ3PT0=?=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(38070700018);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <FBF172D77DC2FC4CBDAC7654A8CCD407@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR08MB8713
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DB5PEPF00014B89.eurprd02.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	1330aab1-0b26-41d8-f073-08dd7d97ed18
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|376014|35042699022|14060799003|82310400026|36860700013;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?UThvM3VrNjBlS2pIWm1Qb1RyUzN4akYzd2pwYjgyWGtmTzVCRFl3Y0xHMTlo?=
 =?utf-8?B?cGhrK1V5NkhSQ25iNzlmNXJlekFFYU9XMVhZT0pRMElTNFJuK1htTmYydWtt?=
 =?utf-8?B?MjNVWXlQKzFpZkVzOWR1bWMyN0RJSUpmcjArU28zQzVRNGtEc2t4M1I4bzI5?=
 =?utf-8?B?ZStBNEVkajlCOE4wUTVrMnlXOWdjeWlIZFgvc3BvQnhEWjU4d0cxdmsrK3FM?=
 =?utf-8?B?SWJnZTd2d2dWc3dROUI2d2hRbXVwUEdkaXFEeENJNkhkSC9ONHVVdDZXREZr?=
 =?utf-8?B?eTZpWkJhcnd6a2wzUXgySHZIRytVTnUvZjEwNnF4QXhIaGNYODJnUzlGUUl0?=
 =?utf-8?B?ajhrTUFIbGVqRE50cGlDNzRXTTFic21TNVZlT3B5ZlhaeHVjSFIrcTZhcUEr?=
 =?utf-8?B?RGc5QkF0OXRyTWJVMnZkbzNmWFMyVEhUYWZxZzgxY2JmOVNrZHo0Mjc0bDJG?=
 =?utf-8?B?SG9wMFJ4ZDZQblBjWDQ0OHZmMGFUNVlUeURkQ1d2UnpzczlrK2wzUnFwWlBp?=
 =?utf-8?B?SjZwMU9KL0NlM3kvQUw4M0RuL3lVVnZQRFZRdUg5aURQZXJMdmR2RndlMWdt?=
 =?utf-8?B?UzZWckhjc1JaSnpYdHQ1NHQvY250YnYreU9CWDlieklDNC9GM0J1NmZkSTdR?=
 =?utf-8?B?RUwxS1VWbDRQZXJVM3NBR1JEREF1NWEzWnFkYU50bGZmclA3QW1MeHlyMEhO?=
 =?utf-8?B?OFZRYS9pay95VDJwcVVUKzVHZnFXRE56SlJ2ZmxJMG9IUGN4S0NxdlJMYS9U?=
 =?utf-8?B?RGMzZzNOUnI1RnNkWlpjMndmSHRFa2Q2ZWFmZUkvOEtWTnJoNnhTZ0ZoZTls?=
 =?utf-8?B?cWxhNE8zcEZSWUo2WHZaQkpyZ1RFM2FEREZlcFdGRzFVYVptTytWT0NCSXRl?=
 =?utf-8?B?SHN6ZmlIaW9FZnJuM1ZVOFBBL3RqZVlKbUd1Y3hxd2VKRzlDQXhvbVJuQnBC?=
 =?utf-8?B?UmNxelVYeGJ5clNBK2pUcnNRZTNERkZzUEozOVNKUnB4MlhUNUpCVVcrUUVm?=
 =?utf-8?B?b2V4YUcvMWNSeVZhd3lTUXk4U2NUQnd3M2w4UnREbVYrYjV6L3VFS1NqTktK?=
 =?utf-8?B?amUvMlRmWmtnT1JWMkd0cm1lY3ZYcEJrSUVBSGdtZEMzc2Q1NE5tZ0R4SEN3?=
 =?utf-8?B?SGpSMXVlQ21KQks2NE12N0tFTTBLSHJYVjVaRlA1VkpsdkxINUVKRnJnanJq?=
 =?utf-8?B?aXpzaE85c3BKeEtZS045WUR2VytYSzQ4NmJwRXBBOVhFRk0xZkY0VmJhRUUv?=
 =?utf-8?B?RDNmQ21yOCtZN1NPaGZ5c0s2b0xrR1NRWDgremJoWllHZUQ2RTBRUHRUOUI1?=
 =?utf-8?B?REswcXhHY2V4OXlrc042TkdzSGpDQkRRUjA3M2hBdWNiTlZJQ1VCZlI1QlZS?=
 =?utf-8?B?UmxpS2s5SVd0NjEyMDFRYmRvRGVoRUdDaTU4eFk3VGpzMk5rdWN0YTBBdnJu?=
 =?utf-8?B?VmxWNDl3UUNPUVp2elZ4c3RLS0orTW9yVkNiN1pqaVNNak5lcHlLQmZLV0tp?=
 =?utf-8?B?WDkyOFF6cjEvU2plUElNOXd0czVVMEFHV2hMOW52TTFZWTBuM0wwUlZVSUhj?=
 =?utf-8?B?b0tNZkJtM2dEZ0VkRE42cTEwMFI3b0FsZUFoazdwTVk3RTRKMys2TGw3SFQ5?=
 =?utf-8?B?MzJwb3hXbEEyT0N3WkluL0kvMTREUVVrVUpMOWdWYXNScTNQQWk4TWN4NXRC?=
 =?utf-8?B?WHd1eXpPRTlyRy8yck53ZktOWUl1ei9KL1U0VzBQNVRKVGhWbURNZUcrYk9Q?=
 =?utf-8?B?c1pZQ2ZJV2VYaWZtOG1wcUk0T25GSExJQ0kzTTRSRFM5bnp6K0lwVnZGSUhy?=
 =?utf-8?B?Y3JRWnZ2d0J3Vm13ZXp2VXNBdWdCdE1idFVkTi9VZVF6U2ZRVVBxZUljelcy?=
 =?utf-8?B?T09zNHFiMzZhSm40d0FLVXVuTWNBdzlOallnd09MZ3RqQVhNdHh3bzY5Zzdn?=
 =?utf-8?B?QWh5aHlNaC9nanJlMjRGTTdkejdLbzE0RHcwTFlIY2wwOW11YlRSRmFucDFK?=
 =?utf-8?B?TXJjQnNPRm5SNjlOcndCc1BlR1NyN2c0dk1hanBVc1JNMENzcGwxbnlsejBm?=
 =?utf-8?Q?ndx8EN?=
X-Forefront-Antispam-Report: 
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(376014)(35042699022)(14060799003)(82310400026)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Apr 2025 10:09:55.2233
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a0c5d98a-4ef6-4a3f-24f5-08dd7d98007d
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DB5PEPF00014B89.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4PR08MB8189
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 17 Apr 2025 10:10:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/215051

T24gMTcgQXByIDIwMjUsIGF0IDEwOjU0LCBsZWltYW9odWkgdmlhIGxpc3RzLm9wZW5lbWJlZGRl
ZC5vcmcgPGxlaW1hb2h1aT1mdWppdHN1LmNvbUBsaXN0cy5vcGVuZW1iZWRkZWQub3JnPiB3cm90
ZToNCj4gDQo+IEVycm9yOiBUcmFuc2FjdGlvbiB0ZXN0IGVycm9yOg0KPiAgZmlsZSAvdXNyL3No
YXJlL2dpci0xLjAvR3N0LTEuMC5naXIgY29uZmxpY3RzIGJldHdlZW4gYXR0ZW1wdGVkIGluc3Rh
bGxzIG9mIGxpYjMyLWdzdHJlYW1lcjEuMC1kZXYtMS4yNi4wLXIwLmNvcmUyXzMyIGFuZCBnc3Ry
ZWFtZXIxLjAtZGV2LTEuMjYuMC1yMC5jb3JlMl82NA0KPiANCj4gZml4ZWQtc2l6ZSBkaWZmZXJz
IGJldHdlZW4gMzIgYml0IGFuZCA2NCBiaXQgc3lzdGVtDQoNCklmIHRoaXMgZmlsZSBpcyBkaWZm
ZXJlbnQgb24gYWNyb3NzIGFyY2hpdGVjdHVyZXMgdGhlbiBpdCBzaG91bGRu4oCZdCBiZSBpbnN0
YWxsZWQgaW50byAkZGF0YWRpciwgYnV0ICRsaWJkaXIuICBBYnVzaW5nIG11bHRpbGliX3Njcmlw
dHMgbGlrZSB0aGlzIGlzIG5vdCBjb3JyZWN0Lg0KDQpSb3Nz

