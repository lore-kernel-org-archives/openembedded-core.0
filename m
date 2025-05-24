Return-Path: <Qi.Chen@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 61361C54ED0
	for <webhook@archiver.kernel.org>; Sat, 24 May 2025 03:01:21 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.879.1748055680808910702
 for <openembedded-core@lists.openembedded.org>;
 Fri, 23 May 2025 20:01:20 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=7239b82250=qi.chen@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54O2wMQe000549
	for <openembedded-core@lists.openembedded.org>; Fri, 23 May 2025 20:01:20 -0700
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 46rwfrcf04-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Fri, 23 May 2025 20:01:20 -0700 (PDT)
Received: from m0250809.ppops.net (m0250809.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 54O31JHZ005536;
	Fri, 23 May 2025 20:01:19 -0700
Received: from nam11-co1-obe.outbound.protection.outlook.com (mail-co1nam11on2069.outbound.protection.outlook.com [40.107.220.69])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 46rwfrcf03-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 23 May 2025 20:01:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=R5XseoTbiXROqO84IqNxHSrcz9sqtt1XAF0zuB5G3YHUoXDl4dvYr9/a1lgzLAVkpMIa8IhCdclq8ArdYTYeD+/AonToefNeLXN4Cn1VTPeOQERMQpn8QoBMLVeEA+UoLsoVQ09Rdv+QJGA11EoKgqAsXWYIExffVnopxffcPMBFK7B4dA7x+F8fq23AwBaQmz61kXBWQ/b90ZAVZv1pa7ZDDUHR2jyVvKYHphmKXNYt1yteFu5Fq1VU+7tyYjLigc4UT0e4mxH1lICjHKWDeRCNk/W5a3zgL7aroGlAZuZSGhXhZDIA6rmf3ojxFbfUXnbN/deqqjUGGNNaIAmDNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=E1/rX4I/uyCfVA69e6XEBQ05e2vu+BSLHEhy7zluPIk=;
 b=LeEz9L/DpPMXVLcJrqrzUIIaD0+J/xocF0iEl4NhKwWAEzuhlvK9oBr+kZJQQBvDgofLE8zSLq/jiHuvyerTbqfP4xyDG0XJlwc/8U7GR75krqAZCVLNfN7rxVOsPkvDPhXdMVInFnBJxE5jZji7wDGD5Nx7OtKCp88osKOEfKbq7ov6VrTt95iXgLXdIukP0vSTuobAeDmSnJtpfgo33wFl5vqmumNJ5Ii+MaVpZp458HBtbe+x30T9FvpS21BSz9N2W+MqTsV5KR0L+NHe7gVptjA8142haTKgLEsj7YORnbl0uKbLq4bCAhtb6zGgAIsA+8NuXqRILaS8cWR1JQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO6PR11MB5602.namprd11.prod.outlook.com (2603:10b6:303:13a::5)
 by SA1PR11MB7015.namprd11.prod.outlook.com (2603:10b6:806:2b8::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.24; Sat, 24 May
 2025 03:01:15 +0000
Received: from CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::a7e3:721d:9cec:6093]) by CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::a7e3:721d:9cec:6093%5]) with mapi id 15.20.8769.022; Sat, 24 May 2025
 03:01:15 +0000
From: "Chen, Qi" <Qi.Chen@windriver.com>
To: Ross Burton <Ross.Burton@arm.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: RE: [OE-core][PATCH] util-linux/util-linux-libuuid: upgrade from
 2.40.4 to 2.41
Thread-Topic: [OE-core][PATCH] util-linux/util-linux-libuuid: upgrade from
 2.40.4 to 2.41
Thread-Index: AQHbxgesHxOHUGCEuk+Au2ZIV6ejv7PerN0AgAJ2tfA=
Date: Sat, 24 May 2025 03:01:15 +0000
Message-ID: 
 <CO6PR11MB56026E9F927EF6F9534F31C8ED9BA@CO6PR11MB5602.namprd11.prod.outlook.com>
References: <20250516021005.781630-1-Qi.Chen@windriver.com>
 <81C42383-FFC0-4D6A-A541-2419FC216FD9@arm.com>
In-Reply-To: <81C42383-FFC0-4D6A-A541-2419FC216FD9@arm.com>
Accept-Language: en-US, zh-CN
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CO6PR11MB5602:EE_|SA1PR11MB7015:EE_
x-ms-office365-filtering-correlation-id: 3227db34-d183-4f8a-a366-08dd9a6f3f73
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|366016|376014|38070700018;
x-microsoft-antispam-message-info: 
 =?utf-8?B?Z29BSFhPcWNTUjBoUjRna2h6VlloeWtJREVlTWJ1SlJIZVpPUFRkcFhXWjlF?=
 =?utf-8?B?bnk4dnltVExieWhidFMybmZGQm5DN2YwQ1hvRittL2JDQ1d6dGhKWHRvcGsr?=
 =?utf-8?B?UFlFcHBmaGxLWXpPRWM3eVlEdVhUZy9GL0piZ25XTEF3MkZCOVM3VzN6dDha?=
 =?utf-8?B?dDJpMmZpZVZJMTBVeG1tUDBReUlVakt2bXJiUFZvTHAyUVUwOHN1SG1LNlpM?=
 =?utf-8?B?cWRnL3FzUitzelJmZ0tmbTdHMU9ENkJ4cUxtamtHQktOVkRpUzNZZER6TGpx?=
 =?utf-8?B?L0d6Y1A0MzdsdHVNcTZBQTdKc0xxMWd4VWo2S25jYTJ6Mk15QWZtM2QyNHQ4?=
 =?utf-8?B?VmlOSmlscFF2OUM4b3EzWmpaUHFhamxwdmwyY1JNUmY0cUFpYVBrL0sxMHUx?=
 =?utf-8?B?bmYvcHdVUlJWTW1MRS95Ujh3dFJWL1RIQUo0NjB6Nmt3YXZhQlhiWllBd3lT?=
 =?utf-8?B?NEVyZDhYNzFOM0IvZ1ZLWXBuTlNPZmF5d0FzM2VqayszdEZOK2g2ZWkyUkFv?=
 =?utf-8?B?MldFVHJSVUxPVm1vdWw3MUMxaU9DSVFGallFRDZMVjFDbXplTTA3SXZ1ejBK?=
 =?utf-8?B?TzFBVFM5a2gxMUdWbE02bGk1SGRPalQ5ZDlJQ0FPanE2cFJSeWwyS3NXS1pw?=
 =?utf-8?B?eDk3RyttS04rUTNjYlBOMzZLdXdPWnNKZ2ZwYmo0NENHR3Q1TmM0VW1qMVY4?=
 =?utf-8?B?UndDeVI5MGEvSTFiVzFIZlA2Q0M4SzY5T3VJdzNpZWtuQjlJMnJXdG9HdU80?=
 =?utf-8?B?RW0rR2ljQWVtUmM2WjdjMjlBT3VlalVNNkcvQzJWNVRmaFlkaWc0ak9VQmtY?=
 =?utf-8?B?RmErS04yN3Z0d1U3M1R4RXFLUVRyMVQ2cXdyU1UrMjF5YlNFbGZzcGJRMkQ4?=
 =?utf-8?B?blZ1Q2MzcnplMmIzRzBGb2p1aVREVWxpV09mQWZwVFRPQUFGekFSdDZIbkhJ?=
 =?utf-8?B?TEtEVFp3LzNYUzRqbG83c0d6am9aWTFuU1NtWmhXQlhveGl0dVlDMHNqM2lJ?=
 =?utf-8?B?TlNORjZkaEJyYmt5WHhYVWJwWENVazRhMTVvOVluZTNMdk0ycm44clRrdk94?=
 =?utf-8?B?OTJUZ2hGNUUrY2FKaDZscXFObjZiSW1PTnBKa0xUQmdSV0MwdSt6WjFSeHpr?=
 =?utf-8?B?UWN5YmNFWnNKR0d0eGVJN0UzZDNIU2VyYUF3WVhRWTF4ajFVU0ZydU4wNnpL?=
 =?utf-8?B?UWt2UE9mQVNlSUJ1M3NtZ3pzaG5oenZMSHRzL3dZcjJwVTMyQ3VhT1NDZWpj?=
 =?utf-8?B?cHFvbU1xQ3BqN2krN1Y1c28wL2toemcrVVRjMTVhTU1odFp4bkdGckZQU25a?=
 =?utf-8?B?SUJ2VUN6VEFXaHkzRGdBa1QzQWtLNnF0ZmN5UGE4SHJ3cFJuN05FZkhBSFU4?=
 =?utf-8?B?bjVXVHFmSHlFSWFGMmVWZkkrVmZRL3lQWUpXUUttNUpIaHlGb0FIZDhPNFQ4?=
 =?utf-8?B?NDcxdmxVaUpFQlVFR2FDTTI1OTFOZVRYYVZRQXR0aFdOQWo0bGhjaTRUWFZw?=
 =?utf-8?B?UEdCZkQveW1RdE8xZzFGalVRdncrNDBVMDIvYWlNWUl3ejkxWk5PY3R4S3pQ?=
 =?utf-8?B?aStKT2ZXeTdEK2pYTXNHTStFN1ZQbFlMdE9oMzhZZ0hIeldlMHRVSnhHOWw4?=
 =?utf-8?B?V3VUMFpMYzN0bGNDZ2MzcDJObmRoUER5b2NGQ1JDVHZLV2RkeVBpS3Bxbng0?=
 =?utf-8?B?SS9NN0xLUlBZWWUvREFYbFpqK3JjSDRwdEV4RGQvQUx2ZkR0KzFoQ1d1VHRq?=
 =?utf-8?B?NlptQ0lXLzk3bGhEUUhNYmVnK0RnNWN6TXlGcDYya1YvT0hpUnNCYVE1R0tU?=
 =?utf-8?B?clM1Yk96UHRUY1RMbENNVmI5M1F0c2VLYjYxNC9TNkFub0VsbW1mV05VK0M2?=
 =?utf-8?B?TDYxVVd5L1YrOExOK1ZBb2Z4NnFQZWVjQnMyQ040UzBQNnZFS3k1ZHg4MFM4?=
 =?utf-8?B?eVpzZ2tUUUZWVWgzaTY3UzJ3Zng0Y0cwZWR4eFRrU1hXYklxKzgwRWNlWDZo?=
 =?utf-8?B?RjlCUlp6UW1RPT0=?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR11MB5602.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?TXhzbVo1a0o3UVA0SjJDWkJXMnloOFVVM3JDKzJtckp5MG53NEVsREVKb1Jo?=
 =?utf-8?B?bjlsZXZVWDUyL0FueE4rRGhDaktzQ2ZQVGIxUmRYNkRsRCtQWXNkdnlxRUNT?=
 =?utf-8?B?YS9BcWwxZ01aTEpvS05ZQW9TdEo1TDNEa3dnYy9kMlBza3ZvdUVpdnJkYnNQ?=
 =?utf-8?B?WVRaQTNNcDh4TWNvSnZPYnFNVnRwT1l0S0I2cXdnZEtWSHh3Z0NDME96L0h3?=
 =?utf-8?B?Z0VTaC81aFFaL3piUmlVZ25zNXdJWEtSQWtiNTBTVy9SZE5FNUw2eExhM0M0?=
 =?utf-8?B?cHVBQWw4N1l1c2JTVDBPalU4YUdmS0xIMDFSMzdTZkhYdjZUOUxINWVVY2tq?=
 =?utf-8?B?V05DdytaOGhGY2pENk9tblU0V0hJMUtXOG92d0lUZHFNUUZGUThrbVIyd0Ez?=
 =?utf-8?B?ZHVuT2RuUVJ3Q3hIbUllSnR0a2prTTRiWHZhSk9DVTI1emxwLy9xQTBhenJZ?=
 =?utf-8?B?bElKRmlGVXBDYVkyWWdCT2lZUzdndGhZenFnYzZlMjBMSDVBWEJWNitwODM3?=
 =?utf-8?B?VGxUL3NXa3BzYTNFTHlqM3JMWlI2QSs3dXAyTU1LUmVBSS9ORTJTYURYZlpo?=
 =?utf-8?B?dWcrMlZlZDlqd3dFT08vWU05c1RLZTBpWVpvNnFqNGNjNTNMZzZ1T05ranBO?=
 =?utf-8?B?WEQ1VTZnVlJ1RHQxTWdEcHlZaUNzVWNCN3EyNk9FUXpuZVVqekN2dm43cmNC?=
 =?utf-8?B?T3hzRkNIaWFLWHFwYjBKZmVjQVVRZVJwdkVSc2UwZk9iUHlFa3VTSCt1REVi?=
 =?utf-8?B?RitEc2xlNXVTcXNpNm9BTjRydU1aY1JXbXByVkFLeHh6VlRaaXVSSDJJMDdo?=
 =?utf-8?B?MEl0ZHprbWErRVpIc25RNGMzSlBnWVJvRk5Xc0tNSUl5c1FGZjhrdGJqZEE5?=
 =?utf-8?B?SERwbVlMNXlsNGl5cms5dDNMUm42bTFqRG45Z2VBRG1OajA0bnU5TVh2cmh4?=
 =?utf-8?B?VjlJYktpcmhYNVdCUldpOHh2dkZ1ck0wYzlWeXNPeFhJaFZ5ZktvY3Q5NHli?=
 =?utf-8?B?blAwMk9ZTG1UbXZHZXlBTGlQYVh3bVlHVzh5emVGTGdhMnBGMTRzMEY3anFr?=
 =?utf-8?B?YkdPQ1RXM0JOSFRtbzlVNDFuNmErK1pCY1BjdGpIeGlXRVdyTHV5NDhaMXh4?=
 =?utf-8?B?TFEvQkRCTWJwYU0vYkU5T215dUFXSUd5dEVMRjYzMmNXalQ2NWhNQURkZjYy?=
 =?utf-8?B?cUoxQ1pJN1QraThsYVZMZnJ6Rnd0eis4M2M2VEVtL3ZGcDlQYk5GWGExMStK?=
 =?utf-8?B?anVLQ0pwSG5zdlBCVG5aWDJ4NUJVejZtRzdHdWFsYVN6aStUSklDcG80QnJK?=
 =?utf-8?B?UWVsLzNGamYvMmN5Q3pYVzc3cjMrT25UZi8zK3laRnBnTmNxRkU3NzY1Y2pD?=
 =?utf-8?B?SGprUThIbzBlK2lEclp6MDlUTWJtckVkVFc1TmREQ0FPcFVMK2twRWdRaWE2?=
 =?utf-8?B?U0EwM240VHpiNlNXZ3BicVhTdkdaNlpFeUNpSm5FUVhFVTZIQVpqajY4TjNF?=
 =?utf-8?B?a3RtekxaWnJ5RDhLNUpwRFRjZnp4VWp2WXA4ZG53YWVySjNaa2RjOTlCUjha?=
 =?utf-8?B?TFU0REhTSFgybGNZcFNVdGFrQWhNVlB1MUMyRkdwR1ZpU0N3MUl3MEdPYjgx?=
 =?utf-8?B?VnBMa3RSQkMydG5UNVdGazdFMjN5SGhNQmxpWHJvd1NpcUhab1Z1MnNlSzZY?=
 =?utf-8?B?MzhvZEZVRy9pT3lpOENIMWhxRldSTTUwaDM3a2lVc0FQSUpYbzJxck5tV1g3?=
 =?utf-8?B?V3ExWWYzSXBzaTlUTUh0Zm5tWHBUeWN2R0hERTNUWDcwOS9ZaEdOcis1dnUz?=
 =?utf-8?B?akVKYkhaUmlrWDFFck8rdEVkVXBFVGU2U0w5WmUydEJSeXZicm1EWkFDeVll?=
 =?utf-8?B?U3U0ZDBaZFJoeWQwUDIwbGhZQ2ZnaVRXSlM2ZmlSL01JWFgrdzhSNWp4aS9v?=
 =?utf-8?B?dlhMRU0wRURDRWkzQ21oNlRWdHN1VTFhcGl5bVljOU9wb3Z4OTZ3Y01mMStE?=
 =?utf-8?B?WUZPenF2VUxwWncrQnRSbVB2UkJrQTk2cFJXdXh4blJHR28rRVhjT0RsRTk5?=
 =?utf-8?B?aFNTV3hpbDBFMUI4SDhCQTVsOC9KSDFTUi95UHhrdWNrY21ocGs1SUc2MFgy?=
 =?utf-8?Q?dQ5lszJnvDJOTDGRPt5iPBl8+?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CO6PR11MB5602.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3227db34-d183-4f8a-a366-08dd9a6f3f73
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 May 2025 03:01:15.2800
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: BqYdfdnSN5IsfTxWMd5wfjmVOZqMizteFuAlsHTV4fmmYrwh6O7inP7WyEsx9wYwCh7jZh2wm/TEIjcl1H+qhw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB7015
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTI0MDAyOCBTYWx0ZWRfXxypKGUSiqcwc CC7u8+/Fqh2jQ65RIkWBsOi4wIJwD9ki0vGHkCMn5C3nvx644GUMC+Xv6ooFgzDbbKyOpR1+SYC 0PIWC4S1akXWE9PJnR4Ub+55Xm6bg/I/akl0RYmaEaQcR62u8RbiQXV5+3hTrBLbsTigcs2kmJO
 nJGg9/3qf5W1H/fCBYEzoaP3ncti77AFxXR3FxnlFncmhi3bpnjsBLKHxMyb8EvM/HYyJ/niL4Z TBq3AtJuRzbodb59QhVMZK1nI8W7jeQmEleJ08ays6J17WqUfzq4ZP8RYZ2AxS9L80BzTWmxsoC kLVaOo0SPAf74nqJUf6186yU8Um9XDp9U43uiLApGmFtsTrh/tfuGbWOZijuvvAO5bSvGDLwHZA
 kT/L2TE9OJHbO6//ufvIbqsNgWkE5/5B3v1hvzxa3u3X8BTJ3rpq1uKKocbtSX926jbyq4P9
X-Proofpoint-ORIG-GUID: TPM5EBFz1Qer9eGTyzGD3I3Wa3syFXMM
X-Proofpoint-GUID: nMfUCmz4ynCEtTg0K_tgSIf-KahTXITl
X-Authority-Analysis: v=2.4 cv=TrPmhCXh c=1 sm=1 tr=0 ts=68313680 cx=c_pps a=2YSX14ZrjOSyU1cAXfcFLw==:117 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=dt9VzEwgFbYA:10 a=7CQSdrXTAAAA:8 a=t7CeM3EgAAAA:8 a=Q4-j1AaZAAAA:8 a=heFt0y6kn02BLcCBB_YA:9 a=QEXdDO2ut3YA:10 a=a-qgeE7W1pNrGK8U0ZQC:22 a=FdTzh2GWekK77mhwV6Dw:22 a=9H3Qd4_ONW2Ztcrla5EB:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-24_02,2025-05-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 mlxlogscore=999
 malwarescore=0 impostorscore=0 phishscore=0 priorityscore=1501
 lowpriorityscore=0 mlxscore=0 suspectscore=0 clxscore=1015 spamscore=0
 adultscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.21.0-2505160000
 definitions=main-2505240028
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 24 May 2025 03:01:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/217219

VGhhbmtzIGZvciBzcG90dGluZyB0aGlzLiBJIHNhdyBzb21lICJQQVNTIiBpbiB0ZXN0IHJlc3Vs
dCwgc28gSSB0aG91Z2h0IHRoaW5ncyB3b3JrZWQuDQpJJ2xsIHJlLXdvcmsgb24gdGhpcyBBU0FQ
Lg0KDQpSZWdhcmRzLA0KUWkNCg0KLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCkZyb206IFJv
c3MgQnVydG9uIDxSb3NzLkJ1cnRvbkBhcm0uY29tPiANClNlbnQ6IFRodXJzZGF5LCBNYXkgMjIs
IDIwMjUgOToyMiBQTQ0KVG86IENoZW4sIFFpIDxRaS5DaGVuQHdpbmRyaXZlci5jb20+DQpDYzog
b3BlbmVtYmVkZGVkLWNvcmVAbGlzdHMub3BlbmVtYmVkZGVkLm9yZw0KU3ViamVjdDogUmU6IFtP
RS1jb3JlXVtQQVRDSF0gdXRpbC1saW51eC91dGlsLWxpbnV4LWxpYnV1aWQ6IHVwZ3JhZGUgZnJv
bSAyLjQwLjQgdG8gMi40MQ0KDQpPbiAxNiBNYXkgMjAyNSwgYXQgMDM6MTAsIENoZW4gUWkgdmlh
IGxpc3RzLm9wZW5lbWJlZGRlZC5vcmcgPFFpLkNoZW49d2luZHJpdmVyLmNvbUBsaXN0cy5vcGVu
ZW1iZWRkZWQub3JnPiB3cm90ZToNCj4gDQo+IFRoZSBydW4tcHRlc3Qgc2NyaXB0IGlzIGNoYW5n
ZWQgdG8gdXNlIC0tYnVpbGRkaXIuIFRoaXMgaXMgYmVjYXVzZSANCj4gdXRpbC1saW51eCB1cHN0
cmVhbSBkb2VzIG5vdCBoYXZlIG11Y2ggcHJpb3JpdHkgb24gdGVzdGluZyB0aGUgDQo+IC0tdXNl
LXN5c3RlbS1jb21tYW5kcyBvcHRpb24NCg0KV2Ugc3BlbnQgYWJvdXQgZml2ZSBtaW51dGVzIHN0
YXJpbmcgYXQgdGhpcyBpbiB0aGUgcGF0Y2ggcmV2aWV3IGNhbGwsIHdvbmRlcmluZyBob3cgaXQg
d291bGQgd29yayBhcyAtLWJ1aWxkZGlyPUBQVEVTVF9QQVRIQCBwb2ludHMgYXQgL3Vzci9saWIv
dXRpbC1saW51eC9wdGVzdCBidXQgdGhlIGJpbmFyeSBzeW1saW5rcyBhcmUgaW4gL3Vzci9saWIv
dXRpbC1saW51eC9wdGVzdC9iaW4uDQoNCkFuZCBpbmRlZWQsIGl0IGRvZXNu4oCZdDoNCg0KU0tJ
UDogICAgICAgICAgICBzdTogZW52aXJvbiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgIChzdSBub3QgZm91bmQpDQpTS0lQOiAgICAgICAgc3dhcG9uOiBieSBkZXZuYW1lICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgKG1rc3dhcCBub3QgZm91bmQpDQpTS0lQ
OiAgICAgICAgc3dhcG9uOiBmaXggcGFnZSBzaXplICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgKG1rc3dhcCBub3QgZm91bmQpDQpTS0lQOiAgICAgICAgc3dhcG9uOiBmaXggc2lnbmF0
dXJlICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgKG1rc3dhcCBub3QgZm91bmQpDQpT
S0lQOiAgICAgICAgc3dhcG9uOiBieSBsYWJlbCAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgKG1rc3dhcCBub3QgZm91bmQpDQpTS0lQOiAgICAgICAgc3dhcG9uOiBieSB1dWlk
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgKG1rc3dhcCBub3QgZm91bmQp
DQpTS0lQOiAgICAgICAgICAgIHVsOiBiYXNpYyB0ZXN0cyAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgKHVsIG5vdCBmb3VuZCkNClNLSVA6ICAgICAgICAgICAgdWw6IHVsICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAodWwgbm90IGZvdW5kKQ0KU0tJ
UDogICAgICAgICAgdXRtcDogbGFzdCAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgIChsYXN0IG5vdCBmb3VuZCkNClNLSVA6ICAgICAgICAgIHV0bXA6IGxhc3QgaXB2NiAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAobGFzdCBub3QgZm91bmQpDQpTS0lQ
OiAgICAgICAgICB1dG1wOiBjaXJjbGUgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgKHV0bXBkdW1wIG5vdCBmb3VuZCkNClNLSVA6ICAgICAgICAgIHV0bXA6IHN1YnNlY29u
ZCAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAodXRtcGR1bXAgbm90IGZvdW5k
KQ0KU0tJUDogICAgICAgICAgdXRtcDogdG8gYmluYXJ5ICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICh1dG1wZHVtcCBub3QgZm91bmQpDQpTS0lQOiAgICAgICAgICB1dG1wOiBJ
UHY2IHRvIGJpbmFyeSAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgKHV0bXBkdW1wIG5v
dCBmb3VuZCkNClNLSVA6ICAgICAgICAgIHV0bXA6IHRvIHRleHQgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAodXRtcGR1bXAgbm90IGZvdW5kKQ0KU0tJUDogICAgICAgICAg
dXRtcDogSVB2NiB0byB0ZXh0ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICh1dG1w
ZHVtcCBub3QgZm91bmQpDQoNCkkgdGhpbmsgaXQgd291bGQgYmUgYmVzdCB0byBzd2l0Y2ggYmFj
ayB0byB1c2luZyDigJRzeXN0ZW0tY29tbWFuZHMgYW5kIGZpeGluZyB0aGF0IGxhc3QgZmFpbHVy
ZS4NCg0KUm9zcw0K

