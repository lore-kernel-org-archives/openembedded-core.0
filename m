Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0A5FAC83F25
	for <webhook@archiver.kernel.org>; Mon, 21 Jul 2025 17:51:15 +0000 (UTC)
Received: from DUZPR83CU001.outbound.protection.outlook.com (DUZPR83CU001.outbound.protection.outlook.com [52.101.66.48])
 by mx.groups.io with SMTP id smtpd.web10.47847.1753120264603370812
 for <openembedded-core@lists.openembedded.org>;
 Mon, 21 Jul 2025 10:51:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=TLqZHknh;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=TLqZHknh;
 spf=pass (domain: arm.com, ip: 52.101.66.48, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=kLdSuJZbj52bZd2Rq4t95wXZsVQ50t/OGhq4qgtNzyGuNujuIkzgvketCvPY7gvyoHXMK3LkBI0pIPljE6jV0+GOQHd1ZNulMzyOBEQqybOMBdirv+ZzAUViYb6Q42md7mDhW9vMCK7C1YbQKBxgCVwc86BVbQlPztRMDIgioTUHmtf2J5j1tydDRLpX1dUfPmV1L16APvcsUuIG5GSjg7IGmEh1QhdC7ygk2pTwYeGgROJwb4NUUpqucNNxfpRiq+IbbxdcTRMXYO2Zf9ciKK4vuyioj+0fmuF9sgd/PX+T6NImfRe1pfiMBD1T4/EaaY8nU5W7i3m4qYvqR+k+Lg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jCCOaRyvO18mcWEZ6kyRe1xdbqEwINXi2jHOvNsXrDg=;
 b=v6x5qswUj3PobAznKtpZhZ8w+8WdHeRdAxDdVzIxLjvHSbFp59gxhZlwyoZGWSukv3VwP+yAHsbWDIZZ+xdrL0jL7RrSYcLLMDj+x/XhN0xKDRKaGA7PSUe/1xaCctJEeTNv2ErkpsY8nqpWyIjcYWwCGSpYjqqGN6Beq/xvcs4wfZhzFSXPvIDijnFjkAww3AIKwJTaWJGIOaZNlOtph67DIwEX1r8O7iRxEzFEuVVYYgk9aUtQuKwPgbHemEOymHx3BmckD7fviBivm5fS9hy4CN9XLzCN2UszgnJTHE1ebUWmv7/oDTivfrN/8E9jRzeoB+F+SwxnZDUX/qxH7g==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=gmail.com smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jCCOaRyvO18mcWEZ6kyRe1xdbqEwINXi2jHOvNsXrDg=;
 b=TLqZHknh2usplEKLUHCWfXhUQWXQxsP8r4XvptPs26RBZ7IRc7CEdTRuzI2JWZA9y2ozj2Xie9A3Tv0HtrgwwADJfa5dshWVqBz4XL1J+2P15kj7o0nNZ/NqNrvO8DwdG9jVf5d1gTRw6FJpWEt78Gp0DeyPDC9Hh/UeNnzOkpI=
Received: from DBBPR09CA0043.eurprd09.prod.outlook.com (2603:10a6:10:d4::31)
 by DU0PR08MB9395.eurprd08.prod.outlook.com (2603:10a6:10:422::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8943.29; Mon, 21 Jul
 2025 17:50:57 +0000
Received: from DB1PEPF000509EF.eurprd03.prod.outlook.com
 (2603:10a6:10:d4:cafe::8f) by DBBPR09CA0043.outlook.office365.com
 (2603:10a6:10:d4::31) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8943.23 via Frontend Transport; Mon,
 21 Jul 2025 17:50:57 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 DB1PEPF000509EF.mail.protection.outlook.com (10.167.242.73) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8964.20
 via Frontend Transport; Mon, 21 Jul 2025 17:50:57 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Z2xiqltcPmKu1eadyQ9kOdDYmNhRL1xOTlgYVnS0ysNwVEBfAwMh+nHINgENTOz5scUe4Dv3FfH8CHaN6hjOMTQwnkrPY56uoqpXV1SLLCLewbLBbPJaSTzKV++KFkrDdcRM2Tf04avJgCY82i3S3niPb+gK+XhxoK+alC+5SPVk4N5PbXktg/fkIXo7+B5S8hcNxiPdGjhqYnMiCNGUextMeqqkFlC7VqF/BccURUY8zzsYcHIyE1m44V5kNnXRxm5rCJL+FjbWzEFlf45tWL/8nEK1F5nLDmyg2UrcwO8BvuHMSynY+w4t1m/VC9ClXX+nxEIlV//45RZO+jsBAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jCCOaRyvO18mcWEZ6kyRe1xdbqEwINXi2jHOvNsXrDg=;
 b=SMcp5gAZrQcJ3bP8uSICnIxszCCvjcTGaOyondYzn1ZzYWdU/uq2DTbsq8eeIhsVlVqxzOQpI3Xs4J8eIBs5lF23MMhsx/r+IHnfE2FHzzDAI1YWwigCibQNGZ4C4ZwDOKHFwMHpxHsnHQSStCSvXUH2LmNPwVK+4lAwVIYdi4akUfP3fhNVfWB7jLV6oyivVwB4D0Wl9dC7PkCeHSWdwovGcU5mXijCI0mV/KSDnWwHwpI2+kB/DvUmv/tysrCmiP1mg/B5oBm6P87u7swjJh1zpMUkwFKDWJAOYSPMncCbno26JlEgHjH4K8WG4pIw7HoqR/6D8oBJAVhtFH+0zg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jCCOaRyvO18mcWEZ6kyRe1xdbqEwINXi2jHOvNsXrDg=;
 b=TLqZHknh2usplEKLUHCWfXhUQWXQxsP8r4XvptPs26RBZ7IRc7CEdTRuzI2JWZA9y2ozj2Xie9A3Tv0HtrgwwADJfa5dshWVqBz4XL1J+2P15kj7o0nNZ/NqNrvO8DwdG9jVf5d1gTRw6FJpWEt78Gp0DeyPDC9Hh/UeNnzOkpI=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by AM0PR08MB5348.eurprd08.prod.outlook.com (2603:10a6:208:189::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8943.30; Mon, 21 Jul
 2025 17:50:25 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::9206:40ba:ef7e:729e]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::9206:40ba:ef7e:729e%5]) with mapi id 15.20.8943.028; Mon, 21 Jul 2025
 17:50:25 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: "hiagofranco@gmail.com" <hiagofranco@gmail.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>, Chen Qi <Qi.Chen@windriver.com>,
	Alexander Kanavin <alex.kanavin@gmail.com>, Hiago De Franco
	<hiago.franco@toradex.com>
Subject: Re: [OE-core] [PATCH v2 1/2] systemd: drop build dependency on
 util-linux
Thread-Topic: [OE-core] [PATCH v2 1/2] systemd: drop build dependency on
 util-linux
Thread-Index: AQHb92Aoh7ThbZ1MQE2kP+S5Faod77Q84RIA
Date: Mon, 21 Jul 2025 17:50:25 +0000
Message-ID: <EC140605-9289-4B3C-933A-BBDB36A6860E@arm.com>
References: <20250717211621.7122-1-hiagofranco@gmail.com>
 <20250717211621.7122-2-hiagofranco@gmail.com>
In-Reply-To: <20250717211621.7122-2-hiagofranco@gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3826.600.51.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|AM0PR08MB5348:EE_|DB1PEPF000509EF:EE_|DU0PR08MB9395:EE_
X-MS-Office365-Filtering-Correlation-Id: 0ee86d04-4658-4358-a3cf-08ddc87f258b
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: 
 BCL:0;ARA:13230040|1800799024|376014|366016|38070700018;
X-Microsoft-Antispam-Message-Info-Original: 
 =?utf-8?B?MVFuYy9pbXBiUlN4K081TXpiWHB3QkJEbHAydWloZGdROUY1Mi9hU1Iwc2FV?=
 =?utf-8?B?WkZBS2p0cmhrQTVqVkJ1dWcxcEd5N2dnTWwzNDNIazJsUW1Ocmo4QzI0M3NR?=
 =?utf-8?B?bU8xekkyTUU3OUdUdzNwTm1wVmNVZW14VndDSXBiWGFDNGJCRW14OGpYMFNN?=
 =?utf-8?B?VnVFeWtLbkk2UXVGcklIOW1hUGNkWGs5TEM5R2pFZ1QrejdvOWFEOE44NnRP?=
 =?utf-8?B?c2xLWWdZR2ppSGtPTElibzdoQUJIYU9RNCtQcDdwNkZQaWFUL08zZkJRbk1I?=
 =?utf-8?B?cFBUQm53Uy9pNlg2RDAyU0pvRnUyY2tNL2RNdlQzY0hubTMyYWg1Zno5bWp1?=
 =?utf-8?B?cXIxc3FXdXN6aGIrSm9QVDAwLzU1K3JiTnh2Z3BiZWszWStLQUcrK3ZDbERB?=
 =?utf-8?B?Vk5uY2hzMnpTUm0zelp6anFTY0hPMXBVcUJLWnlBOG1BNnNSUVZsWnBkNXNX?=
 =?utf-8?B?MFZyKzdGZFhzRmRnekxJenAvemFVdkNGdGx4WmYyTHU5ZTk3TFVmSUNOdHVE?=
 =?utf-8?B?THJ6bmMzL0pUdzRWMnQvM3d3VVlwZHBqY1ZwZXNUZnNYRU5ycGN3aDRQTW9E?=
 =?utf-8?B?VjZJL1QzZ3prRVFXS09nc3FPbkMyeCtNMUJ4TDFoRnM5TjIwOVQ3bGZxVHI4?=
 =?utf-8?B?bkkyT1VBWWhPT1JBSlcvalVHTk5CRnhXV2tmdFkxdi9YUGRmcXF5OEVDTmFE?=
 =?utf-8?B?Z3Y3eUZJa281bmo5K0pqVytWUmxYejFybnpUbEtRQ2tld05VcDhnNDg5bkd2?=
 =?utf-8?B?K2hvRmpUNVE5ZjQ0dkUyQ0k2VnJVaXVoVHVQdEc0WTZyZjV1MGxNWGFGRWtO?=
 =?utf-8?B?OHlGZHVsdWdMOUtyUmdnT3dpVWVlOGVLR3dJYkxEbUVka29pYzZLcGtvd0t3?=
 =?utf-8?B?ZktoR3UwYnRxREpQNGNGb0NlQnJuYW53eWtNYlFKdERFZDljbG5Pa3N2bWtB?=
 =?utf-8?B?eXduYWhMYzRiUDV0a3VHWHZFaTVTM2pEblIxSlc5SnN4YUFBUDU5SmNxT1Bu?=
 =?utf-8?B?MFREbGZNUVZBaWFwTTBQdkVpSzU3S1ZnODRWY3ZoZFlsaFdhL1pCakREQzJG?=
 =?utf-8?B?a3NLa1Z3YmNBQTJEd3JmVmFHMEl6b2NYcWs2a0hQNGhBc3VDVm5XWGlFNmQx?=
 =?utf-8?B?d2FMS2o4enpIdnpxMnh2blRxT0xJdGU5dEc2aXlCTDVhV04zeHh0QVdvYzM1?=
 =?utf-8?B?SGNGcTNDWmVwTVVMbHk4N1hsUVFOU29hU0hxVWlJV3E3cDluUG9SVndlU0xn?=
 =?utf-8?B?WmpWMVFudGlHdDIzQkVOZXhoTEwycFBJK29vbEt4RzRjQjIyNVhzeURGZ1Q3?=
 =?utf-8?B?c1VZUkdsMnlBallSU2pGMVd1UDVlTllnUkhYS3JNT1VwRWoxYUIrVEVUV1F5?=
 =?utf-8?B?SjRDT2U5eGtoeHNoemNTM01wQnd3dW8vZHhJVk02TFZtWWY2aERwMXBuUkU1?=
 =?utf-8?B?eExDSFFPWDMzWXYySGl2Z25JNDd3bFFycUZkODUxZUErUFRZd0tKVnlVTDRR?=
 =?utf-8?B?QUZGb0lYd2RvMDBBR0FFQ3dURHZzVUFnL2VpaTNNYnlpdk9DS0txTjYzU280?=
 =?utf-8?B?Yi9sSnVnMWVEdENtNGNCYXgwR05ka0J3by9wZ2J3Mk8wSkZNZVhKN1l5cUE5?=
 =?utf-8?B?ZXFGL1pKL3AzQnBKOFZhTGJObklQZTJqY0ltaGxvdzBkekx0YTI5ejZxVXpC?=
 =?utf-8?B?WHVFcHlpZlJjOG4rWVNtRWwxY1FxLzlnOGtYczNMUE1yV0l6SEFrUWJRM200?=
 =?utf-8?B?eW9IRU9sQTcvZjJwY1hpYlBnVGhxQW5EZHJWM3BrMkswSlZLTUFCWWpnQ1FR?=
 =?utf-8?B?WVBwZ1FwQko0WmxIYzJJN3VmUGU0Rkk2ZFJBQ1B2UDE4YUYwWVpJam8xbFFK?=
 =?utf-8?B?NHpHajlDTk1RQmJ3Lzc1bjdPdGhtTGNBY1VxYWRsQlRac0hkOEtQbytIZ0Vz?=
 =?utf-8?B?OUdCclVZZjJHMG9JNTlOR0REdXpSaVJLUGpiaVhtSGJ4TEtxaTg0R05vY3hi?=
 =?utf-8?B?TitVY3BaUVRRPT0=?=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(38070700018);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <B45ED5AD327B3044AEA465510D1494B6@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB5348
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DB1PEPF000509EF.eurprd03.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	614711ef-a478-4283-0b8b-08ddc87f125d
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|36860700013|35042699022|1800799024|82310400026|14060799003|376014;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?MGxDVU5ieFN5RzRtZHI5ZVFNa1ZWdk1pN0ZlSVJseXFKN3AzMWZwV2hWN0dZ?=
 =?utf-8?B?eXRtSGttTEpmTlVWVEY4TThuSEIvcXNOcEVtL0w2K1M5WjNDNzFMZlJmb1Yr?=
 =?utf-8?B?a0FoT0E2UGJIVjFqQjY1ZzB3WURqSUVaRlFlWTdEcEI1SjFwUi84WUFhSFZG?=
 =?utf-8?B?emViZGp3b2wrTGcwMkU4eTJiWjU2L2RMUzNjQnJzRG9CVnAyQk9POWM2SXFq?=
 =?utf-8?B?eUZIMHJhQ0pxMC9aSjJyZDUydHJRQUpTOGtMNFB0VGdXQW5uVTNuU2I5cWJ1?=
 =?utf-8?B?V2J4OGpyWm80NW9UbURCK3pZeTJwOTF4Y2xobFdQNHZ2MkF4MnpPdlJlSWVk?=
 =?utf-8?B?VW9MVGs4blBLMzAvSU8rZVFEQ081WTQ2MCtSa1ZUWVBnUDlWdUROYVJOeFdj?=
 =?utf-8?B?VlkxN3Awd24yQkRWSUVTWEdBNUNEQ3lLUzQwbmRENVhFLzRmQXZVVmw0bkhD?=
 =?utf-8?B?b3ViblZpd1pDdDVMbDE2Si91dWduRmJtKzNyVzZvSFkyckh0WHdtWnFGRzV4?=
 =?utf-8?B?b1lzeGExdWQ5ZXBiMjEzR3pzYjFHWGhCc095WUJKU3NTVTVBWmtQZkJhbGVV?=
 =?utf-8?B?T0wvTGVhOTI5SXlqbVQxOHlBM1ppWVppTXZtbGJielY4ckZYMGhVQmFFaUto?=
 =?utf-8?B?ZHhDWmpGdnZOdXVOU3FYRWU5SExZUXNlVlJhdlpVcE9od3BnNnZHRHNtVlVC?=
 =?utf-8?B?NVlaNkpJMUhnM2t3N1F4S0dleDdoUkVUUnNPZFBaQXR4N1F1NUdrVUNVa2Fx?=
 =?utf-8?B?VVpiNGNiNkFWNlBKdkxJUHhLTzRnRWFUWUtPZXlrK29RRUczeHZVZUQxWFdo?=
 =?utf-8?B?TS9aUnZtUEJJekZ2QUIyYUZ4SXdHc2diS1ZrYUYrRUVqUXBBbnVNYkdUQWMx?=
 =?utf-8?B?cU9GeVhFV2Jqc1BTT1FXc3VoUCtzTC9OeDQwUnZONXdiUFNycStvcEFIcmQx?=
 =?utf-8?B?QXUza1B5ZnJGb2ZrV0lYREt6UVFqa2hjS1Z2SytEbEJqdVhWaThRcHRCRjJr?=
 =?utf-8?B?b3dUR3FUV2tQVERTdVhqV0JqYkZoQ3h0T0ZOL3dCZDlkMmVHTTVta29GZkc4?=
 =?utf-8?B?R0ltaE5ueW1lMkFwR1hkRHhsWnVSZlcwSjBOVTNCRzEyamJqRk4yU2ZFSTI2?=
 =?utf-8?B?T3BmN0FHd1RnUXpPY1ZhVnFrZUFPWm9PQkhQYUtzS3ZyTkxSYUU0OGp4Y2ZV?=
 =?utf-8?B?d29pM0wwcGNYMEQzMURLd1o2SHVibmUxaGhueTYyZ2c5c3NtSXl5eE1wdzJ0?=
 =?utf-8?B?UjlpVWZybEtwejBXc2dnQkRIZzRWODhVN2lnK0l4bjRiRGUwTVFtSitqTkNR?=
 =?utf-8?B?UGtnUXpxMEw2aUdRS2EzbU1KUmtPcmYzbHJYSG96NXhKeG5IczNPcUp5Rjlo?=
 =?utf-8?B?bmlDNjJyR0hSN1FVK1JIa2NSNlU2K0dCa041amxqRG9tZ3lOMC8yb2NmMFRu?=
 =?utf-8?B?bTA3YlF0QkV2RzVNSTdkcFZNRCtZUTdKTGxQTDMza1hBL1puTGR3VE5JWUg2?=
 =?utf-8?B?VEUxNEJOR1JpMjJIMk00MWdwbGNvRi9PamJNS2IzU1Y5R2EzQkR3dFBRd0Zi?=
 =?utf-8?B?Wkh6NXQvLzlKbTNqZ3pMbWphVkdoQW9aVWt5S0N6QTN1SUJGamdJb1J6RjF1?=
 =?utf-8?B?V2tFQlI3Sk9oZ2pzcDV2R3RSNGNIZzhCQlhMTTM0UGhiaDhKTVd5QndsWEo2?=
 =?utf-8?B?VVR1clVNWEQycld6eHUxVlJBRmsvUGVuWFM5YXg3OUdqc1B6L3AyVk5tWlJI?=
 =?utf-8?B?T2JhS1NKZk54blJyWDZqalgwczlEbEJDcGk1aDB3UWZpRTl0R2hIUUpyRS9s?=
 =?utf-8?B?Nml0c0Y4MHJGckwwcEVwQUltUFlRZDVKQjZYblY5S2V4KzNvNEsvTzFZMGxp?=
 =?utf-8?B?QXpwQ0tvY0JVeTNaTWNpN3FQbnlzS0lhSGtaZDdWYnJnR3dnSHdmcWVJNWFl?=
 =?utf-8?B?UzVoU3RWa2RhbjhRVVM0RTR1NjRCYUtDdG5PSlltMHRCTnhYVzQ3OVBGWUhr?=
 =?utf-8?B?ZWtjSy9lRG96WmZNSmRIMHVoVmk2SFBNMU1tK01KdGZaMVJock5ZRCtuSWds?=
 =?utf-8?Q?JVZQVg?=
X-Forefront-Antispam-Report: 
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(35042699022)(1800799024)(82310400026)(14060799003)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jul 2025 17:50:57.1803
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0ee86d04-4658-4358-a3cf-08ddc87f258b
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DB1PEPF000509EF.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR08MB9395
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 21 Jul 2025 17:51:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/220709

T24gMTcgSnVsIDIwMjUsIGF0IDIyOjE2LCBIaWFnbyBEZSBGcmFuY28gdmlhIGxpc3RzLm9wZW5l
bWJlZGRlZC5vcmcgPGhpYWdvZnJhbmNvPWdtYWlsLmNvbUBsaXN0cy5vcGVuZW1iZWRkZWQub3Jn
PiB3cm90ZToNCj4gDQo+IEZyb206IEhpYWdvIERlIEZyYW5jbyA8aGlhZ28uZnJhbmNvQHRvcmFk
ZXguY29tPg0KPiANCj4gVGhlIGxpYm1vdW50IGRlcGVuZGVuY3kgd2FzIG1hZGUgb3B0aW9uYWwg
b24gc3lzdGVtZCB1cHN0cmVhbSBbMV0uIEJ5DQo+IGJhY2twb3J0aW5nIHRoaXMgdXBzdHJlYW0g
Y2hhbmdlLCB3ZSBjYW4gZHJvcCB1dGlsLWxpbnV4IGFzIGEgYnVpbGQNCj4gZGVwZW5kZW5jeSBm
b3Igc3lzdGVtZCwgbWFraW5nIGl0IG9ubHkgYXMgYSBydW50aW1lIGRlcGVuZGVuY3kuDQo+IA0K
PiBUaGlzIGlzIGltcG9ydGFudCB0byBmaXggYSBjaXJjdWxhciBkZXBlbmRlbmN5IGJldHdlZW4g
dXRpbC1saW51eCBhbmQNCj4gc3lzdGVtZCB3aGVuIHV0aWwtbGludXggaXMgYnVpbHQgd2l0aCB0
aGUgc3lzdGVtZCBQQUNLQUdFQ09ORklHIGVuYWJsZWQuDQo+IFdpdGhvdXQgdGhpcyBjaGFuZ2Us
IGVhY2ggcmVjaXBlIGRlcGVuZHMgb24gdGhlIG90aGVyLCB0cmlnZ2VyaW5nIHRoZQ0KPiBjaXJj
dWxhciBkZXBlbmRlbmN5IGVycm9yLg0KDQpIb3cgZGlkIHlvdSB0ZXN0IHRoaXM/ICBJZiBJIGRp
c2FibGUgdGhlIGxpYm1vdW50IFBBQ0tBR0VDT05GSUcgdGhlIGJ1aWxkIGZhaWxzIGluIGRvX2lu
c3RhbGwuDQoNCkFsc28geW91ciBwYXRjaCBtb3ZlcyB0aGUgdXRpbC1saW51eC1tb3VudCBhbmQg
dXRpbC1saW51eC11bW91bnQgUkRFUEVORFMgZnJvbSBQTiB0byBiZSBkZXBlbmRlbnQgb24gdGhp
cyBwYWNrYWdlY29uZmlnLiBJcyB0aGF0IGNvcnJlY3QgLSBkb2VzIGRpc2FibGluZyB0aGUgdXNl
IG9mIF9saWJtb3VudF8gYWxzbyBtZWFuIHRoYXQgc3lzdGVtZCB3aWxsIF9uZXZlcl8gY2FsbCBt
b3VudC91bW91bnQ/ICBUaGF0IHNvdW5kcyB1bmxpa2VseS4NCg0KTXkgdW5kZXJzdGFuZGluZyBv
ZiB0aGUgaW50ZW50aW9uIGJlaGluZCB0aGUgdXBzdHJlYW0gY2hhbmdlLCBhbmQgaG93IGl04oCZ
cyBpbXBsZW1lbnRlZCBoZXJlLCBkbyBub3QgbWF0Y2ggaW4gdGhlIHNsaWdodGVzdC4NCg0KUm9z
cw==

