Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BA6ADC636B8
	for <webhook@archiver.kernel.org>; Sun, 22 Feb 2026 20:53:40 +0000 (UTC)
Received: from PA4PR04CU001.outbound.protection.outlook.com (PA4PR04CU001.outbound.protection.outlook.com [40.107.162.61])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.21661.1771793615200656865
 for <openembedded-core@lists.openembedded.org>;
 Sun, 22 Feb 2026 12:53:35 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@siemens.com header.s=selector2 header.b=mByVMY/J;
 spf=pass (domain: siemens.com, ip: 40.107.162.61, mailfrom: peter.marko@siemens.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hem3jMiPmgFpkk+EFNMWkCvIYgT/b3+eYXxvT4sop18FkOE4td7YPQcGmVY+qnD41KGEQnZEqGaCfK3FzwwKL8XwJ0eLnEdszf1f22Y5ixbs0HZW4pP9eWi3PdAfytQCn9Cqj3MeG+Zy/2t3krH/XG603q87P7gU31n8M1Xs1mjoctijWZhvp21ksWkEN2FWstR/YcHTsxXx+WsE9jkXpD0U3gK+oI+N7b7mkacpzQiaN05YBUsUFZ9kDpuKssOoZKYK4eSFr1YmWg6c6mGhtascqG+5mDOPvBNW3USOfWLuNBRsowdoey8koNc4kaltTnwvzDo4bvY0sbarVov+2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bdXGPNV3yN5SDzcquamLrFtAOVTzlnEjff5uqsBS5HE=;
 b=JrGYtxSdRwqW5pUbpOJpSkMmiXoo/NukaYs/56oeM1A00yh6E7Pl7c/1RBE6Wv05mZGBsbYd9wOMy34exeK4SdFPsGOv+8I083Ce3n2vZHH9Z5xwgYLdyvFkqgyY4qaPqBQeaHBF4ynGQI+QHAXDv9wPYL0zrXVbAOymLs7C3/KIFdaoZolR69rBwwJ+V+L7jhYAX4sUb9uq1U9BJGA8/fDlTtAQUizSy812aYq3gztGCIOtrUPiltL7jSJDxbe56KzDrnpWolPcLnBp1joWtSm4hDs7Nqm5oXc/SmrrHm6xyxFhyRYPjW9ZFTnZ+Qycv0TySIPPU/+Z4KLX1wPrcQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siemens.com; dmarc=pass action=none header.from=siemens.com;
 dkim=pass header.d=siemens.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siemens.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bdXGPNV3yN5SDzcquamLrFtAOVTzlnEjff5uqsBS5HE=;
 b=mByVMY/JkDZ269OCbbgZn5yvdfwLeixwc+ZXnkZ5AfAwVMBE4XIKgut7mvh3ZPAG/pO22Q9qzH6L9GU3dLDyhahFknaMfnUc6sw7eHZH15dZzQjqRxWccyyYHf6A1+fIbV6p8EXi3mdobRZhmbJw/w3FpmOmYGOvmnFCXXlTtKJYX05Sq2Z1EI+5Gt4YWbtHXUaAMijSgJ6jq9Is005he7TvJ0ihasSKssZ/o2QwUFxpwX8kMgtiOyQAFO6iLW4eUPSrHZFh3QLNJjF1L0rN8NfG/41tXs54MbSPHURBMst2vDgAytwB+VBvq8ajgkbkxNgizY6gFu2CdxF7QAayPQ==
Received: from AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:479::20)
 by VI0PR10MB8624.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:800:213::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.21; Sun, 22 Feb
 2026 20:53:28 +0000
Received: from AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::b54d:255a:1abf:2dc7]) by AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::b54d:255a:1abf:2dc7%6]) with mapi id 15.20.9632.017; Sun, 22 Feb 2026
 20:53:28 +0000
From: "Marko, Peter" <Peter.Marko@siemens.com>
To: Yoann Congal <yoann.congal@smile.fr>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: RE: [OE-core][scarthgap][PATCH] gnupg: upgrade 2.4.8 -> 2.4.9
Thread-Topic: [OE-core][scarthgap][PATCH] gnupg: upgrade 2.4.8 -> 2.4.9
Thread-Index: AQHcgoLSd/xb6VB2+kibOlzZzEZhlbVyd+4AgBa9QBCAARRjgIAFKMjw
Date: Sun, 22 Feb 2026 20:53:28 +0000
Message-ID: 
 <AS1PR10MB569707821CD8C3C3AA8DC9D8FD76A@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
References: <20260110224453.395105-1-peter.marko@siemens.com>
 <DG63GSU9MVS3.304EAXA47JAF9@smile.fr>
 <AS1PR10MB5697F71F42D54E6DF1DBDA63FD6AA@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
 <DGIZMOWN2GMB.2LUW1QWT0MLRW@smile.fr>
In-Reply-To: <DGIZMOWN2GMB.2LUW1QWT0MLRW@smile.fr>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
 MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ActionId=f44d1c2e-f572-4b22-9226-c4e7b1da52b2;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ContentBits=0;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Enabled=true;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Method=Standard;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Name=restricted;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SetDate=2026-02-22T20:41:56Z;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SiteId=38ae3bcd-9579-4fd4-adda-b42e1495d55a;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Tag=10,
 3, 0, 1;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siemens.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS1PR10MB5697:EE_|VI0PR10MB8624:EE_
x-ms-office365-filtering-correlation-id: a7ea7173-a5b8-474e-51a7-08de72546e66
x-ms-exchange-atpmessageproperties: SA
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|366016|376014|1800799024|38070700021|13003099007;
x-microsoft-antispam-message-info: 
 =?utf-8?B?UDMvYXp6MjV0RXhwTkgydENTcHRpVDFXOVdtNWVtb0wwOExzWWk0RVVoL2Ux?=
 =?utf-8?B?aTdITDZyN0ZtdlY4eWJvck8rR0N0UDRyYys0UmdNVE1tRXI5Q1hzU2IyQ3NW?=
 =?utf-8?B?VGN1ZnExa041eHlyRUJJMnB4bXFGb0sveHZwYWJGLzd6eVp0SkVTWXptODRq?=
 =?utf-8?B?SDdJQnZsVC9tUmk1a2RhRHFSVGhmcnJsaXoyeHM3RVF1VU9kQzYveUk0WnJX?=
 =?utf-8?B?Mm5acDVkSnRHUjdobDhpT2ZiRWxBMTh4WmlkbjZVN0Z6ZGowVDRYZldCTDNC?=
 =?utf-8?B?UWhPbGR0M2NZUkdrdWtMc2lRVnNGc05aajdaSm5lYzBxc3RzdWtFbVQ2RTRE?=
 =?utf-8?B?SXFUTmdNZlA5TWJTUHdReHpFd2RUTzRxMk12eUpuWDE0Qk12ZjRycy9JWTU0?=
 =?utf-8?B?TDFRdll3UGcxdXY5ZmJhU0g4dWNpa2dyOTY5cWd0K1RaMjJkcTdvY3h6R21F?=
 =?utf-8?B?Z2lFb3dvM0xSUzBHRkFDMy80RVREVUtISnNuU0prT1pRRGtyUGNrZlhndnNk?=
 =?utf-8?B?cFJHV1d3bDczdmZTZ0JmWXJGUW41ejRHUm85ODZ2RlBCRC9rQ2VDWEpLNXBn?=
 =?utf-8?B?QTQ5bVBSd25kekZLVmNKV21ScjYwRmsrQWRqalJQNHJ2UkF2QU9uandDRGhs?=
 =?utf-8?B?cVFFZXI5bHpGOUxWZTVLaUFIYW5yUzhEeC80WVdMYXNQR3pwWTUwSWJjL0VS?=
 =?utf-8?B?clBxV0RYUGprNWszQVg4MUlJTXJTTkZ6WlVuWEEzRklLRXhRL3VZTno4WHpj?=
 =?utf-8?B?Ry85cDZXS3graFIxc3FMOGN1dVRhanNXMngreExSWm9IWm5YMnk3UVhqcWNP?=
 =?utf-8?B?Q3B6Qy9QMXpGWHJXRkhPWWhBNVBMMVgwQnZMWDRsejlnRklaRTQ5SkhoVjZa?=
 =?utf-8?B?R0d2a2s5alRIWmVSdm1JVUtNR2JQT25mWS8yRFJCaUVFeGJJdWJrKzZieTVJ?=
 =?utf-8?B?alFsNEVwNkdlcERiU0U2R2pUdWFHWkdwYy9Xa1BKTHNSZTAveEkwZThINjl1?=
 =?utf-8?B?R0p3Vk04MDdDT2xxeDlnbG55UHVRckpJRmlQQUdncUs4alNNK0VYWU5ITVh3?=
 =?utf-8?B?aS95akJCckwzbnNSeDNvZ21RY3FSYng5S1NxbkovNG9oTXVhVGxjVDQzdmpB?=
 =?utf-8?B?WS9Gd1R2NHp4a0VRVDVIUFJzeFo1bUVidjVrdGFzV2Nlc0V4RDlXN0ZrQ1hi?=
 =?utf-8?B?V0F5bGgxU05qY01YaHQ5YkRvOE9LaDRGdE53d1lWOUdQYzRFdi9KMEFSamM3?=
 =?utf-8?B?Zmp2ZDRxeXJZU1prbXlxVU9ZT0c4Nk12MVg1RzNrMTJWOVM3ZTEvZHU3OHND?=
 =?utf-8?B?M3pFenRPYnNrUDNpZE5qanJGclJ2RmNZLzdaalpVZkxEL204ZkhCT3MrVGlI?=
 =?utf-8?B?d1NYbHRiWWlkdFBPbkQ5Y3NRbzZoeG96WHJlRHFOVWdPUEUrcHpHWjgvaWEv?=
 =?utf-8?B?QjZja0pabTllUXJMdU1Gb3h2ZDluOGlvVDQ3dm5aVW5CdmFqSkQrQmN1cnN3?=
 =?utf-8?B?OE95eVdWMnhZUWpnSzhlZzJpQjYrM2dQTmxSRDRHV01mdTl4OTN1ekJqRnlU?=
 =?utf-8?B?NTlyMHQ1MGVkWVBSUU9tbVluSDR6NzB0cEtzZEpGck5MckNtSUZhSGQ0TmRk?=
 =?utf-8?B?YTlqLzJhWHNIbU5PLzd6Qnl6ai9TeG5HdVgyZm91cnNjTzE5enJnaUYzMU1p?=
 =?utf-8?B?SGpzMUw3cTgwRUQ0UStWUUdWbXkxZ2hqQTlVTEJJMDNNUGJ0T05ia0FJREpj?=
 =?utf-8?B?d0JkNk9CR01STkNxZ0NIOS9BdEcyL3A3Q3BtRVdveitCbnQwcHpGT2dOU0VJ?=
 =?utf-8?B?R2ZGb2NiaXc0OFYwdjZjcjZ6NHFuaU9XYUlZOHRWMHZiczFFWVo2ckRORGFq?=
 =?utf-8?B?bWxLQnJ6bWhWYi9xUExrUS92aUJBZ1JNSmUxdkRzNFphRUZEdVpHeldCUFN4?=
 =?utf-8?B?OUhCSXhZa0RUc1dWNFJnNHc0RC9Gb2FIMkRnZkpKY2lqZGtRVHo4UzJjaEx4?=
 =?utf-8?B?OWdWVnBjYk9FWVBrdnhTZkFMVUtpNDF1aU81RHd2OHlPZ1ZDVGFGY0pIQnpD?=
 =?utf-8?B?ZEpBazN6bFc1SVZMY3ZHbUVsMGIvSDJVbHI5b1JaSkVONm9ud1NzYXFBY3li?=
 =?utf-8?Q?WWCPcq3faRxAojctIQRsZqr2P?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(38070700021)(13003099007);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?U0J1d2V6T0lwd0Y2YWJsaDFJc1lLN3ZXRS8xUjVtdk1IcW5WNTVlMDlTa0hu?=
 =?utf-8?B?eXFGbkJMeVJ3WS9ZWVNNMGJsZTlMTEpXM0JBVXV5ZSsxKytYeE5PZjB6RmVK?=
 =?utf-8?B?ZEsvYnMzdmdBdjIzM0NpR0I3YTVmN1daMWxOYS81WkJQZC9PejU4ajRWQklH?=
 =?utf-8?B?QWo2VU0xWHV3bStDbkVURkFTNXJvMGlXbFZVeUJZV3hQZ0ZqbnRPMGUyZ0FX?=
 =?utf-8?B?MEpBRGFzandsSmJaZDhVMXYxWGpYNjA2L29UVVAxWGNlZ3hyR3hVak43b2o2?=
 =?utf-8?B?Tm0yNnk2ZWk4a0lHMGRaOUQ2ZzBIM2F2dkFpVTRlTmhKaTRmaDg1d1VSM0Na?=
 =?utf-8?B?WktOK3M0aW1OVUdJTlNySDNWVWUvRzRYMS9VTFJCc2VzL1pzUnMrNFF2dFk5?=
 =?utf-8?B?TEZZNkpKN2JrT3E1R05mVzdDNmQvb3BIMU1ld0hQQmtPZXlwNHJya3I5SVFk?=
 =?utf-8?B?cHA4bUFUT1c4cDRJeWduZkxaSTEyTm1FRHZDR1haM2F0SnlDSHI4bVkrNjVJ?=
 =?utf-8?B?MmNTWWhhdHI4Q2NaOXE1bU5HQUhhODdNZmJvcHR2bEV6SkNWUlZ1Zy8vQWdv?=
 =?utf-8?B?dXZIbzQwcEdvTlNuMzZXQ0o4MHpMa2Q4N3FyVXF1ME9TQjBBVkNEdnVIR0cr?=
 =?utf-8?B?YUdsMys1QldBdzNxRHJIN1NOb1YvNzIveWFBbmg0L3ljakxEUEs5N0VtUzh5?=
 =?utf-8?B?OXRlSk9uczFCRytLdkxCbWtmazZrNUh3U29maDVXcVJUMlRUN2hvMXpzckFR?=
 =?utf-8?B?WkNBV1dvazdLMXpGSUhRMUlmY2QzV2tqU2hheUl2Ry9mS3AxaGlCZk5jM2Y0?=
 =?utf-8?B?Vkhuam4wRGduNzlOUWVrSkRPNVNpSlVNb0JxbVBWWlVDaGVGOUlkU2ptanBH?=
 =?utf-8?B?YnlMUG5lSUR6dDBINUp6UVZIRm1sL1YvbVNuNTk2UzNwZFdWSC85RXZSdTcz?=
 =?utf-8?B?MFpPbWhOZFJGTDRqc2c2UUNLcG5mK1pyRWpFdDV2NFB3QWdUZFJHV0p3M2RO?=
 =?utf-8?B?RkVUcUo2eUswT2xoWlJYS1A4b040MGFEbU5OdVgzUEtmVEg0bjhUSGZJMXJ3?=
 =?utf-8?B?NURuZmptcHh5dFA5Zm9wQkVxNG0rM2dpWXdtVXNVWVM1RjlBQ29wYzNoN0g1?=
 =?utf-8?B?Y000YU43N25HZ25ZV0dNSTdlODdHZ3hPUEpDWklXQlZES2hncEZVZmNQQ0FP?=
 =?utf-8?B?NnNuZ2gzemlXNEtwMXdpUFJ0RFlpN1U3NXl1NTc2bi9CQXV5ckI3aXRKelhp?=
 =?utf-8?B?R29sUEVjQnFLYnBvTm5mWmsxSjcwM1huMGRZWXQweWwweHM2UGszTjhPNXhY?=
 =?utf-8?B?NlFocDJ4UGJVZ2FkbFVCb0NwVUw0SStqUTdLUlJnWGhWeXI1RkJJdWNNZU1D?=
 =?utf-8?B?V2lTY2lRWEs5Y29MbnBPVExjRTVTcUlRSGZNb0o4dDAvaXdVQktVc2J1empH?=
 =?utf-8?B?aEszZHpHMDExOURiUTNCd2YyNVpYVkZLSk9DRlN3aDB2TjVQazhWVi91NmZZ?=
 =?utf-8?B?SzVmVVo0T2orUi9maGdwK0RodnFlbTFKTWJUYllIalFOV0JlUnJGQmJVaXZ0?=
 =?utf-8?B?SlIvOHRLRXRsR3ByVEM5d2h0VGVpODd0RlpCcTZ0TVdLK2ZFeW96VlpTelVu?=
 =?utf-8?B?amI4Y2M4WTljRlUvaGxZTnpaUXpsL0FsdjVoUENGNDZBYU5VaTQ4TWRPS3JH?=
 =?utf-8?B?UHpjV3RpUjNCcTgwNHFqOTBvZG40UVdGcEVHUlJpTHRUcTBtTEt1c0N5ZnpE?=
 =?utf-8?B?OXIzRXczSko2dTgrbFRNK1kybGxEVUFqbEhpNm56NytVNDN3VVl5TURSbHZs?=
 =?utf-8?B?S0JleWtlMlV5OGwvSkF0bWxQSm1PQzhsU3RHb2tyWVY5ZnVlTXdwcFowSTIr?=
 =?utf-8?B?WE5SNExwMFhWU1A1MTkxMlhJRXVGK1RZR1M5UVF3TjFnT0Z3YmRHRE5uVWth?=
 =?utf-8?B?RkpuTHlrUkE5MkkyN05UVVJYYktnSDM4QjByOW9scTdrLzZmVzlTSWF1ZDIr?=
 =?utf-8?B?TDd4cklRSDRnNFRIY3Q1TnZsWE9DdXFEeW9oSVFKUlJxU0t2M2ZoclI5bGhz?=
 =?utf-8?B?cEZpRE0rTElFU05adXhaZEZtQ1FmQXpmM3FnOWVzcnZVSlQrQ0d6RzFWSXlB?=
 =?utf-8?B?dzVYdDEyYWNNZ2tROXpnZGViNnI0WmJIeUZXM1BvWmJsWHRhZGlucXdMeUs4?=
 =?utf-8?B?T0dKczlCdWNVcHgzZGU1THllZnNIamg1dmZqZGhhUlM5bjk4T0JEYVc2RVBy?=
 =?utf-8?B?YUFuS0lSSSs5RUFLcDFoRy9pSUE1aDVYYkkvbmplWUR1V1FpVFVnQzlIQ2xY?=
 =?utf-8?B?ZlpuQkkzUGtzWlhMRU5LRmNURlJJS3B3Y3VtVXpablJnR0JoUlBtdz09?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: a7ea7173-a5b8-474e-51a7-08de72546e66
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Feb 2026 20:53:28.8054
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: OFm+ICyjnMfnKoDnlXdPphPB+5Nt990XISTGq2SzaTBQraqRmyUmnWIOznUaTQleyWWpe88R+IAMqJQ+c0bfHg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR10MB8624
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 22 Feb 2026 20:53:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/231636

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogWW9hbm4gQ29uZ2FsIDx5
b2Fubi5jb25nYWxAc21pbGUuZnI+DQo+IFNlbnQ6IFRodXJzZGF5LCBGZWJydWFyeSAxOSwgMjAy
NiAxNDo1NQ0KPiBUbzogTWFya28sIFBldGVyIChGVCBEIEVVIFNLIEJGUzEpIDxQZXRlci5NYXJr
b0BzaWVtZW5zLmNvbT47DQo+IG9wZW5lbWJlZGRlZC1jb3JlQGxpc3RzLm9wZW5lbWJlZGRlZC5v
cmcNCj4gU3ViamVjdDogUmU6IFtPRS1jb3JlXVtzY2FydGhnYXBdW1BBVENIXSBnbnVwZzogdXBn
cmFkZSAyLjQuOCAtPiAyLjQuOQ0KPiANCj4gT24gV2VkIEZlYiAxOCwgMjAyNiBhdCAxMDoyOCBQ
TSBDRVQsIFBldGVyIE1hcmtvIHdyb3RlOg0KPiA+DQo+ID4NCj4gPj4gLS0tLS1PcmlnaW5hbCBN
ZXNzYWdlLS0tLS0NCj4gPj4gRnJvbTogWW9hbm4gQ29uZ2FsIDx5b2Fubi5jb25nYWxAc21pbGUu
ZnI+DQo+ID4+IFNlbnQ6IFdlZG5lc2RheSwgRmVicnVhcnkgNCwgMjAyNiAxMToxMA0KPiA+PiBU
bzogTWFya28sIFBldGVyIChGVCBEIEVVIFNLIEJGUzEpIDxQZXRlci5NYXJrb0BzaWVtZW5zLmNv
bT47DQo+ID4+IG9wZW5lbWJlZGRlZC1jb3JlQGxpc3RzLm9wZW5lbWJlZGRlZC5vcmcNCj4gPj4g
U3ViamVjdDogUmU6IFtPRS1jb3JlXVtzY2FydGhnYXBdW1BBVENIXSBnbnVwZzogdXBncmFkZSAy
LjQuOCAtPiAyLjQuOQ0KPiA+Pg0KPiA+PiBPbiBTYXQgSmFuIDEwLCAyMDI2IGF0IDExOjQ0IFBN
IENFVCwgUGV0ZXIgTWFya28gdmlhDQo+IGxpc3RzLm9wZW5lbWJlZGRlZC5vcmcNCj4gPj4gd3Jv
dGU6DQo+ID4+ID4gRnJvbTogUGV0ZXIgTWFya28gPHBldGVyLm1hcmtvQHNpZW1lbnMuY29tPg0K
PiA+PiA+DQo+ID4+ID4gSGFuZGxlcyBDVkUtMjAyNS02ODk3My4NCj4gPj4gPg0KPiA+PiA+IFJl
ZnJlc2ggcGF0Y2hlcy4NCj4gPj4gPg0KPiA+PiA+IFNpZ25lZC1vZmYtYnk6IFBldGVyIE1hcmtv
IDxwZXRlci5tYXJrb0BzaWVtZW5zLmNvbT4NCj4gPj4gPiAtLS0NCj4gPj4gPiAgbWV0YS9yZWNp
cGVzLXN1cHBvcnQvZ251cGcvZ251cGcvcmVsb2NhdGUucGF0Y2ggICAgfCAxNCArKysrKysrLS0t
LS0tLQ0KPiA+PiA+ICAuLi4vZ251cGcve2dudXBnXzIuNC44LmJiID0+IGdudXBnXzIuNC45LmJi
fSAgICAgICB8ICAyICstDQo+ID4+ID4gIDIgZmlsZXMgY2hhbmdlZCwgOCBpbnNlcnRpb25zKCsp
LCA4IGRlbGV0aW9ucygtKQ0KPiA+PiA+ICByZW5hbWUgbWV0YS9yZWNpcGVzLXN1cHBvcnQvZ251
cGcve2dudXBnXzIuNC44LmJiID0+IGdudXBnXzIuNC45LmJifQ0KPiA+PiAoOTclKQ0KPiA+Pg0K
PiA+PiBIZWxsbywNCj4gPj4NCj4gPj4gSSd2ZSB0ZXN0ZWQgdGhhdCBvbiBhdXRvYnVpbGRlciBi
dXQgZ290IGFuIGVycm9yIGluIG9lLXNlbGZ0ZXN0LWRlYmlhbjoNCj4gPj4gaHR0cHM6Ly9hdXRv
YnVpbGRlci55b2N0b3Byb2plY3Qub3JnL3ZhbGt5cmllLz8jL2J1aWxkZXJzLzM1L2J1aWxkcy8z
MTM4DQo+ID4+ICAgRVJST1I6IGF1dG9jb25mLW5hdGl2ZS0yLjcyZS1yMCBkb19yZWNpcGVfcWE6
IEdQRyBleGl0ZWQgd2l0aCBjb2RlIDI6DQo+IGdwZzoNCj4gPj4gc2lnbmluZyBmYWlsZWQ6IENv
cnJ1cHRlZCBwcm90ZWN0aW9uDQo+ID4+ICAgZ3BnOiBzaWduaW5nIGZhaWxlZDogQ29ycnVwdGVk
IHByb3RlY3Rpb24NCj4gPj4gICBFUlJPUjogcGF0Y2gtbmF0aXZlLTIuNy42LXIwIGRvX3JlY2lw
ZV9xYTogR1BHIGV4aXRlZCB3aXRoIGNvZGUgMjogZ3BnOg0KPiA+PiBzaWduaW5nIGZhaWxlZDog
Q29ycnVwdGVkIHByb3RlY3Rpb24NCj4gPj4gICBncGc6IHNpZ25pbmcgZmFpbGVkOiBDb3JydXB0
ZWQgcHJvdGVjdGlvbg0KPiA+Pg0KPiA+PiBJJ3ZlIHN0YXJ0ZWQgYSBidWlsZCB3aXRoIHRoaXMg
Z251cGcgdXBncmFkZSByZXZlcnRlZCB0byBjb25maXJtIHRoYXQNCj4gPj4gdGhpcyBpcyBpbmRl
ZWQgdGhlIGNhdXNlOg0KPiA+PiBodHRwczovL2F1dG9idWlsZGVyLnlvY3RvcHJvamVjdC5vcmcv
dmFsa3lyaWUvPyMvYnVpbGRlcnMvMzUvYnVpbGRzLzMxNDINCj4gPj4NCj4gPj4gQ2FuIHlvdSBs
b29rIGF0IHRoaXM/DQo+ID4+IFRoYW5rcyENCj4gPg0KPiA+IFVuZm9ydHVuYXRlbHksIEknbSBu
b3QgYWJsZSB0byByZXByb2R1Y2UgdGhpcyBmYWlsdXJlLg0KPiA+DQo+ID4gT24gbXkgRGViaWFu
IDExIEkgaGF2ZToNCj4gPiBTQU5JVFlfVEVTVEVEX0RJU1RST1MgPSAiIg0KPiA+IFBBQ0tBR0Vf
Q0xBU1NFUyA9ICJwYWNrYWdlX3JwbSINCj4gPiBSUE1fR1BHX1NJR05fQ0hVTksgPSAiMSINCj4g
PiBJTUFHRV9DTEFTU0VTICs9ICd0ZXN0aW1hZ2UnDQo+ID4gQW5kIHJ1bjoNCj4gPiBvZS1zZWxm
dGVzdCAtciBzaWduaW5nIC1qIDE2DQo+ID4gQW5kIGdldDoNCj4gPiBvZS1zZWxmdGVzdCAtIElO
Rk8gLSBSRVNVTFRTIC0NCj4gc2lnbmluZy5Mb2NrZWRTaWduYXR1cmVzLnRlc3RfbG9ja2VkX3Np
Z25hdHVyZXM6IFBBU1NFRCAoMTIyLjM1cykNCj4gPiBvZS1zZWxmdGVzdCAtIElORk8gLSBSRVNV
TFRTIC0gc2lnbmluZy5TaWduaW5nLnRlc3Rfc2lnbmluZ19wYWNrYWdlczoNCj4gUEFTU0VEICgx
NTUuMzRzKQ0KPiA+IG9lLXNlbGZ0ZXN0IC0gSU5GTyAtIFJFU1VMVFMgLSBzaWduaW5nLlNpZ25p
bmcudGVzdF9zaWduaW5nX3NzdGF0ZV9hcmNoaXZlOg0KPiBQQVNTRUQgKDEyMS4xMXMpDQo+ID4g
b2Utc2VsZnRlc3QgLSBJTkZPIC0gb2Utc2VsZnRlc3QgLSBPSyAtIEFsbCByZXF1aXJlZCB0ZXN0
cyBwYXNzZWQgKHN1Y2Nlc3Nlcz0zLA0KPiBza2lwcGVkPTAsIGZhaWx1cmVzPTAsIGVycm9ycz0w
KQ0KPiANCj4gRllJLCB0aGUgZmFpbGluZyBidWlsZDoNCj4gaHR0cHM6Ly9hdXRvYnVpbGRlci55
b2N0b3Byb2plY3Qub3JnL3ZhbGt5cmllLz8jL2J1aWxkZXJzLzM1L2J1aWxkcy8zMTM4DQo+IC4u
LiB3YXMgb24gRGViaWFuIDEyDQo+IChJdCdzIHRoZSByZXRyeSB3aXRoIHRoaXMgcGF0Y2ggcmV2
ZXJ0ZWQgdGhhdCB3YXMgb24gRGViaWFuIDExKQ0KPiANCj4gU2NhcnRoZ2FwIGhhcyBzaW5jZSBi
ZWVuIHN1Y2Nlc3NmdWxseSByZXRyaWVkIG9uIERlYmlhbiAxMiAod2l0aG91dCB0aGlzDQo+IHBh
dGNoKToNCj4gaHR0cHM6Ly9hdXRvYnVpbGRlci55b2N0b3Byb2plY3Qub3JnL3ZhbGt5cmllLz8j
L2J1aWxkZXJzLzM1L2J1aWxkcy8zMjI2DQo+IA0KPiBDYW4geW91IGNoZWNrIHRoaXMgb24gRGVi
aWFuIDEyPw0KDQpJIGhhdmUgcmV0ZXN0ZWQgd2l0aCBEZWJpYW4gMTIgYW5kIDEzIGFuZCB0aGUg
dGVzdHMgd2VyZSBncmVlbi4NCkkgZ3Vlc3MgSSdtIG1pc3Npbmcgc29tZSBjb25maWd1cmF0aW9u
IGZyb20gQUIgc28gSSBoYXZlIG5vIGNsdWUgaG93IHRvIGZpeCBpdC4uLg0KU28gYWdhaW4sIEkn
bSBqdXN0IGdvaW5nIHRvIGJhY2twb3J0IHRoZSBDVkUgcGF0Y2ggZm9yIG5vdyBpbnN0ZWFkIG9m
IHVwZ3JhZGUuLi4NCg0KUGV0ZXINCg0KPiANCj4gVGhhbmtzIQ0KPiANCj4gPiBTbyBJIGd1ZXNz
IEkganVzdCBiYWNrcG9ydCB0aGUgQ1ZFIGZpeCBpbnN0ZWFkIG9mIHRoaXMgdXBncmFkZS4NCj4g
Pg0KPiA+IFBldGVyDQo+ID4NCj4gPj4NCj4gPj4gUmVnYXJkcywNCj4gPj4NCj4gPj4gLS0NCj4g
Pj4gWW9hbm4gQ29uZ2FsDQo+ID4+IFNtaWxlIEVDUw0KPiANCj4gDQo+IC0tDQo+IFlvYW5uIENv
bmdhbA0KPiBTbWlsZSBFQ1MNCg0K

