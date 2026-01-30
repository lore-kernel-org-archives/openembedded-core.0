Return-Path: <liuyd.fnst@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A48CAD73EB3
	for <webhook@archiver.kernel.org>; Fri, 30 Jan 2026 02:19:56 +0000 (UTC)
Received: from TYVP286CU001.outbound.protection.outlook.com (TYVP286CU001.outbound.protection.outlook.com [52.101.125.23])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.1739.1769739583229181710
 for <openembedded-core@lists.openembedded.org>;
 Thu, 29 Jan 2026 18:19:43 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=selector1 header.b=TCJlE9sn;
 spf=pass (domain: fujitsu.com, ip: 52.101.125.23, mailfrom: liuyd.fnst@fujitsu.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LoLxK07Vo8GxB+zIYQVDFtPkePs37iiheO3bCphr74aKwRULnJzk1eS6fCw0BcDUQs2Dta1Dt1nZZxhjtnTbRRvgvPqZ8Lqc7wQBMkoPl4ckJTcm96KMo6i23yYJnjfUmBK/jgOvoUpWbjtroZ5lfM/IITLRGZAQ6S/ol4wB4WiC0N2FsP87lUxMChytB16yKTg3a8it3rMr6abCZLY7HnpNebuGZ4iW/UfaNLnfGSRq6fw2dRoqCoq4ZnHEom7axO1qR33EoOUMA3u5kD2b34RjYy3A4mHgzQjWRpKhAnefYSdFDBcF2K1qEiy8JLKQlBfKgc8/+0/Fo+XivQB3/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CArHKGN6RMHIrTSVLSJsmaOjPya5/U4ggPg1iAzjMUI=;
 b=fpzkkwKEibWNrUgAcFPRKYxl07pQJPIGC5BsWZJvy3bSlPcRb3CkSWtd7bXdR/R4A85s3HDq/tBU1238SX/ZwvJSLnCOlYNi0ZnQcZG4RrbDqwik4RmTLnNsqrEasYwPY+wLY/9zim2e0X5wluKkOMud3I+RrG58N9jBPXDb0cFo0vBDGac/TYcwBX9FnDNhpoSTFRRftl02EAppm8jwktMm8Tw2AAH85sgLGL6DcMEsIZ59rkZBmjdDNhV+3WAD8GeUvHYBNmbSZpKdVKKzxop0ZUChUwWi8rkYyJu/gtDnZYG1QEyZwT0Giaw1Sen99oXecVomI7mgF/16rxTcPw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fujitsu.com; dmarc=pass action=none header.from=fujitsu.com;
 dkim=pass header.d=fujitsu.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CArHKGN6RMHIrTSVLSJsmaOjPya5/U4ggPg1iAzjMUI=;
 b=TCJlE9snpuw65/9LVHu318nVZCCmtEzVI5q2dCnFnbypUP8lWNLdSCtYsWCLlUpBJt7KuygEYB3j16zYoIQdnOmAmNqX4RzjC0nTGlufgjqdimDQg37eUHXuqJGnJAYJ0HVTMUEiLlcOq0Jj4jV8F4t3WZD3Bo8+HJN4ar7M13SDagkEi9ibypbftLJr8qakPsCEXHarLkeGYlRhelTUChrrXzaIzCkLbn6DpyUwGu/3ADWMPagKVVMBw07W67QAWtk0CEgEQV9w/Wi1GU+x/7CqRBn0wbXPL7Py2hZqTniep3V0s2NazVKfXsw+2onJZFd08oWz2m/phDvsqbffOQ==
Received: from TY3PR01MB10110.jpnprd01.prod.outlook.com (2603:1096:400:1d9::5)
 by TYCPR01MB12095.jpnprd01.prod.outlook.com (2603:1096:400:43a::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.7; Fri, 30 Jan
 2026 02:19:38 +0000
Received: from TY3PR01MB10110.jpnprd01.prod.outlook.com
 ([fe80::65d2:5fd:bb96:1df2]) by TY3PR01MB10110.jpnprd01.prod.outlook.com
 ([fe80::65d2:5fd:bb96:1df2%5]) with mapi id 15.20.9564.006; Fri, 30 Jan 2026
 02:19:38 +0000
From: "Yiding Liu (Fujitsu)" <liuyd.fnst@fujitsu.com>
To: Alexander Kanavin <alex.kanavin@gmail.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: 
 =?gb2312?B?u9i4tDogW09FLWNvcmVdW1BBVENIIDYvNl0gb3JjOiBFbmFibGUgaG90ZG9j?=
 =?gb2312?Q?_to_produce_doc?=
Thread-Topic: [OE-core][PATCH 6/6] orc: Enable hotdoc to produce doc
Thread-Index: AQHckRIdFxGjs2+yRkygseyoFd9O5LVp+IWb
Date: Fri, 30 Jan 2026 02:19:38 +0000
Message-ID: 
 <TY3PR01MB1011061788269D6E4EAC2C8999B9FA@TY3PR01MB10110.jpnprd01.prod.outlook.com>
References: <20260129035353.8982-1-liuyd.fnst@fujitsu.com>
 <20260129035353.8982-7-liuyd.fnst@fujitsu.com>
 <CANNYZj9TRt0GqyafY0eD+bwuTBUb3iEeBFD16po7kxPHwQJ-Kg@mail.gmail.com>
In-Reply-To: 
 <CANNYZj9TRt0GqyafY0eD+bwuTBUb3iEeBFD16po7kxPHwQJ-Kg@mail.gmail.com>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
 MSIP_Label_a7295cc1-d279-42ac-ab4d-3b0f4fece050_Enabled=True;MSIP_Label_a7295cc1-d279-42ac-ab4d-3b0f4fece050_SiteId=a19f121d-81e1-4858-a9d8-736e267fd4c7;MSIP_Label_a7295cc1-d279-42ac-ab4d-3b0f4fece050_SetDate=2026-01-30T02:19:37.718Z;MSIP_Label_a7295cc1-d279-42ac-ab4d-3b0f4fece050_Name=FUJITSU-RESTRICTED;MSIP_Label_a7295cc1-d279-42ac-ab4d-3b0f4fece050_ContentBits=1;MSIP_Label_a7295cc1-d279-42ac-ab4d-3b0f4fece050_Method=Standard;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=fujitsu.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB10110:EE_|TYCPR01MB12095:EE_
x-ms-office365-filtering-correlation-id: 57556e7c-3c9a-4afa-bb33-08de5fa60514
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|4022899009|376014|1800799024|366016|7053199007|38070700021|8096899003|1580799027|13003099007;
x-microsoft-antispam-message-info: 
 =?gb2312?B?TFE3V0tYUlU1Lzhsc3VySFJZSmNoeFErUC9lRUVnZGRtQmoxa0xlTjJBdm9K?=
 =?gb2312?B?WkFlL2wydG1hV1A0YzRha0VpdTRvbWZZMGlHc3c2aFUzVGdUQ0RBRnE0RnhV?=
 =?gb2312?B?WC9ILzdCVXQvRkROdUZzam94cWQ0cVRScU1zTHFGTFNsQkt0VzV6Z2hPNm8x?=
 =?gb2312?B?SC8wc0t4clB3djBxSnp6eWhIaDdvcll0dE5oOVptRXVpbEYrOEJlTFRiTFJR?=
 =?gb2312?B?RHlQZ1pyanphUEJFRlJONHY4eC83Z21uMCtCWEpYd2ZsdEYxL1ZURzNMUGk1?=
 =?gb2312?B?dUlGK2ZtSTdTL2lLQTA5R0RxK0lHTTJYeGRleUJHT016NUZJMjB2dVc2bmtU?=
 =?gb2312?B?bkJQNjlvYmU3KzcvaDZCSjFhd1g2R2VqNWNZM1RYbnU5cm1KbkF3clpUS002?=
 =?gb2312?B?R0liNW03NWJaYjBYSHdDVk0vcUIyS2NoQkhHcnBSLzNaRk1FdHpPSzNhZ3V1?=
 =?gb2312?B?RHAxbGZwb2NmOGJCMDArOHVLZmVoMFJPUmVZbVNoS2l0aGc2U3pHYjUzZDNP?=
 =?gb2312?B?OVZ1UWdxRDI4TXBWbktNY1Jpb0R4U09xQ1d6UlYxUTVTMENuYytyb1BiRmt2?=
 =?gb2312?B?MlBPZXI1eFFIQUlHN3dzSURLSCtsVXk5MzhYZTM3OXNzWGw2S1hpekdDdm44?=
 =?gb2312?B?dTJCN29XYjkxd0Q0dmlsZm9uUEk0eE1ZRjM0aHlvNVh3SzdnK0UweDcweEd1?=
 =?gb2312?B?a2M3NllrN3pyUmFJU0NRb0J1c0x1RGVWd3BmTHE1NkFOc2xwVGZUZmJ5R2VG?=
 =?gb2312?B?bzJCMnVqV3h1anYwQTFzV0RDV1E0TzNVNTd3Tys3YVluU3pUc1ZiR3hNQ2k3?=
 =?gb2312?B?V0tsTGU0bVpMTStQM3dNZ0gwdy9YQm0ycVo2NGF4bXFHM2lrWGhxcmFkSTll?=
 =?gb2312?B?a0kxZDM2cnpSbHhWcWgxTk1kYlRLbUdEZXVUb2o2RzlOeVljWGtvSG82d2tI?=
 =?gb2312?B?SWtudlRUZE1jdURTdjhyNlRISVJacFkxUHhKMG5QbHdIRnpJRmNnZFQ2RnFz?=
 =?gb2312?B?alVhVzM5cXlpRk1yYS9XQm9pOWxNa0xHcTRGS2FTcGtuTllTbmtBOXljZ0o1?=
 =?gb2312?B?U2tsYytNcDBTU2xsbmZmd2tqUStOZklDUUdYSXNyOGpUS3k5b1ZhQll1UmFZ?=
 =?gb2312?B?NmlRNExSbXAzREdOaFhDeXExZ1Vjb0o3aVUzTmQwekxqQm80MnFwRGs3MFlV?=
 =?gb2312?B?d2RzU0JnQU45V3I1S21SaEJCYjlqMTFEb1NvOTVnajRrVnpCeXVrVDFIQXNl?=
 =?gb2312?B?WW4zVkRlcHUzOXRvSS83SnQ0VWg5U05uU2pmRVRkdVhPQVgweWlFanJZNU9K?=
 =?gb2312?B?WHhDRVZrWmpmSHpabCtWYUd5b0lvY0FzVlBhQ3UxQ3ZoSGlWVWs3YXU3MXhy?=
 =?gb2312?B?bXRFbHFZVEhhdm41T3dZbCs5NXhCQ2ZiMlhXR2FCWmZPalFFejY4QU4xRzJP?=
 =?gb2312?B?a3JxSkw3dDhlL0YwOW9qWUdCQ3NCT2xJc2dDcTl6VzNuNmJteVBrWTRodFVL?=
 =?gb2312?B?ajBjSnozcEpzOUZtdEl6Z2lja0JBcVZaNXNhK2FQRVBubjBhbm4vTGdMWDFE?=
 =?gb2312?B?WWd0OTF3OUxmcGZYeGJOM0pVY3JnbGZRbDE2RS9oTmJqcEkyK1RMVUhlSHI0?=
 =?gb2312?B?T3NQek0rVjJoTUdITXc5QXFoTC9SSkRtMDRuajZZTCt5UHAyV2R6bmdjVXE3?=
 =?gb2312?B?dko0QThVYnJtMmxGb0MrcWlZR2J5TlcyNE1kUEh5L2NpM2NtNHFSQTlEaWh3?=
 =?gb2312?B?SWtIRHBkeFFiYXNRcDBFOHdoOVpHS2R0STl3MnNhMGZ1RVlWRHQ1M2VDNXNN?=
 =?gb2312?B?QnN1WFJHenFaMHROVG13RlNJQ0JZbVhCNmpTZ3liL3M0RFJqUzQyeDUrSXg4?=
 =?gb2312?B?RjhhRWlDR29qdmlLZk9YekxZcGpqcHBibFpQUC82T3JyNkxHR3ZpbHUyRWdl?=
 =?gb2312?B?SVhEK2hqTERXL3grV25mNWlMUWVEb2pLRVc2emZMbUQzQ1ZGd1N0THRzQWFL?=
 =?gb2312?B?WldRTzBYKzVMeTJkdkN5YWFNcFdzbi9XV2QrZnFlQnRyNWJLVmtvTGhDWnM1?=
 =?gb2312?B?RitpejNJRjhjZkV1RU9GK09HN3FaMzgwU2lXUnBjWnRyMmE0SDMvWmtMSVNV?=
 =?gb2312?B?VHFZQUNsTG40Q0orY0Y2cTBVdStDdHVOdmRlWXBiTG9xbHN1OElCWE9zZGJF?=
 =?gb2312?B?NlE9PQ==?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:zh-cn;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB10110.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(4022899009)(376014)(1800799024)(366016)(7053199007)(38070700021)(8096899003)(1580799027)(13003099007);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?gb2312?B?VkZLMjFmaGR1cWUvMmw5TlhWaGVURHVYdDc5SnlNZElsQlB4cXpUcGc1VTlt?=
 =?gb2312?B?czduSmVlalBFci9RaklzMWg5MUtoTk1Xd0U0aGF0WGtWT21hTTFVcHRQVjBa?=
 =?gb2312?B?RU1UYVBaNmdybTJJcjVVZmNYeDBMRmNsR1JHT1RWQXVWRmN0VkhtaDlEaFVN?=
 =?gb2312?B?VTlGUXlUQ05jUy9zVStMdDBQVkp1Q2Fva25ocDJFanhwR1dYUjdpVWZCeHVX?=
 =?gb2312?B?TTBhb3d2d2xGTThITmFaOFpIOFp1dXA0MXJ5VHNuNG40L0hGYVdkTUdXSHkr?=
 =?gb2312?B?bEVCNFNVRWhDdzdYaDNmdlZSbFFDZDFRSVJtL0N6T1hWaktFMFFBMms3a2JF?=
 =?gb2312?B?VVhwcW50VDZrNE83b1lhamJpRC9rZVpaNnFnTjh2Ymd2dTBaSW5kSkdsZlBN?=
 =?gb2312?B?R05CMlNtamJmWWNwOVJTNDZpNFlOTU1wTGtramEwWXIvbEdjWTVnZ0F4Nnp1?=
 =?gb2312?B?RmQ4ajJEMSt0ekx4eUVCdk5jQU9QWllhdTJNVnQvVFVHRkFQQzQ2SzZxNDM4?=
 =?gb2312?B?azNWcndQTU1VaGFFbERGR2hDV0JJZWtuT2s1T0NaMkh1RDNTZ1FNMFRGcWZ3?=
 =?gb2312?B?dXFPRFlUZHBJcHlUa0x5SmZjWlhsRmVqdk9zUGk0b1hIOHRRTnVhTUxSMVhH?=
 =?gb2312?B?QitpN0ZZU3AzYy9HR1Y4aTJ4U2hsb1JiSUhDLyt6MVNBNXZTVlJ0WWRZeXcz?=
 =?gb2312?B?a3BNbGV6WCszREZHYU5BZjE4WHRzR0xaTElyQXlvWWh5bmNXaHhxVFVPb3Jn?=
 =?gb2312?B?NjJhUDB0RUxyTTFPYXlvNnhqS1ZQU01ncHZxNFFLN0I4WlY1SDFIelE5M09a?=
 =?gb2312?B?Yzc1UFZmdG9lN3ZJaVoyY2lsbzRQajQ5S1oycHZFMW9XMm1CbkU5RGtHcmE0?=
 =?gb2312?B?WDRkU3ZFZzJxcGxUSHBDVzdqRmJHalFHRWpDRGo5cURlZ09DQ1dQZUdSRkJq?=
 =?gb2312?B?OFNiMlE5bjE3anhvR21TS0ZuQnlyK2dzVG5VUURxSVp3MmxnTmV5UjJ4R1NF?=
 =?gb2312?B?Tm1ER2szVlNkbEVodGxxdU10Z1E0M2RTUWhjUXQ4UkVzUkl2c0dDN3lsVkJD?=
 =?gb2312?B?VlYyQXZmWHBOWTRlRVhqL1NPTXRkbTM1N0lxdWl1Q2U2MEdweWUvdk1ZUXJM?=
 =?gb2312?B?TDRjNkdyS0Y5NUNJQ2kzMkZDWDFTNHl5OWdMRWxsUGRSTXZzMUlxYnpvQmpq?=
 =?gb2312?B?WEcxN0hOTWlyR0ZsOWQ0RjVBZS9CM2NYNzc3MENNckZDZmc2VndJTUl0ZkVD?=
 =?gb2312?B?ZGsrU3dwWjc3RUord0JrUk90WFFPMTlMMVo4NjY2U0IySUp2RVAzczQ3NkVW?=
 =?gb2312?B?TFlQMVF0ZElDcnAvWUlhdURYTFNMWnN6TUxHc0hFb1RyT0NybXlOK0trMzJI?=
 =?gb2312?B?bExoV0Q5b3RjWXZ2KzB6aWVLVVRIZUh2ckxvbGtUTUdiMHdDVGFvbUtNc3Fu?=
 =?gb2312?B?aEFtZ2N1YkJaVWkyY0NpK2gyTTdsRmM4VUMyTWNKNDYzWDRSS2EzOEhPQjQz?=
 =?gb2312?B?VTA4d2RTRVkwY3RVK0lvalUzZDVUc29Ya3lrM1lVblFKNURia3JPMUx6NkRh?=
 =?gb2312?B?c0VkenN2bjhMSzhKS3dTNEd3bk9SUzU4aTd3TUhoVm1jY1FOOXlFZUV2ZGRR?=
 =?gb2312?B?YVViNWI5Z2Ntd2ZUOUlsTVBNb1pRWno1Rm1BbTFXMW5LWVFycENhSGkxWXd0?=
 =?gb2312?B?YXNzdzFWaEgyNFNZWW1tRE9pRVYyV3ZTRGtWWCtjOW9XVm5pbkdvTWtuSEpt?=
 =?gb2312?B?RjNERjlUVjFna0Q1eDV1bFdoOHFXRUZkcVp4M0s5NlE1ZFcreVlZRWtlNjZT?=
 =?gb2312?B?QnFmQU5oaGJkeUtXOXMxaU41VkowendVWWRiZEhXWnltVWh3YSttaURUOGZR?=
 =?gb2312?B?TlpWaTRxdDY0QVVjVFQySVNHMjJ4aEF3SlhQekJaMVN0dktJQXR6MzlxMDFr?=
 =?gb2312?B?a0JnNVZDUFNmaU9ZUTJkbFVXRUpYV2JMVmJBUTUxSll2dVo3YWphdTVjNldV?=
 =?gb2312?B?OGU2N2dJK2UwdHllNi9aRUpGYTZLTXR0V28ra0VLbitISHUrNUZBUGZDSmJ6?=
 =?gb2312?B?QWlwT2Rjekd3NGZBZS90cFhLUXhGZWozT1NnNUdtbEo1QlVnd29ITGwzU244?=
 =?gb2312?B?aUx2eEkySlRzNnIwSWhvREp1ZnlZVTkyYWs4R2JTdGwySHdjV25nQnVPeXRP?=
 =?gb2312?B?NjZ6V2V3eFRkdVU3ZUFocGlqUG9FQ2tQUnJzZGYrVGRNVWlITmQvaktEaUs1?=
 =?gb2312?B?azZsekdHcjhvOHUxR1NCUHM1MmVGaVY2Z0dUaXNpZzJJRGZxekN5M2pUK0d1?=
 =?gb2312?B?UHZJSVNvTmR3QmtKZ1R4aTF4R2RNWUhjV3ZyS3ErWWVmNHFlekVuUT09?=
Content-Type: multipart/alternative;
	boundary="_000_TY3PR01MB1011061788269D6E4EAC2C8999B9FATY3PR01MB10110jp_"
MIME-Version: 1.0
X-OriginatorOrg: fujitsu.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TY3PR01MB10110.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 57556e7c-3c9a-4afa-bb33-08de5fa60514
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Jan 2026 02:19:38.7071
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a19f121d-81e1-4858-a9d8-736e267fd4c7
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: JAUq2pgNdp0jz1mnuPsE+VROI+4TDdZEuf4luGBMRP6jkTsCk7rzrOz42qEoiPsjPNFRjB5vzq4/LvrkPzuQnQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB12095
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 30 Jan 2026 02:19:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/230174

--_000_TY3PR01MB1011061788269D6E4EAC2C8999B9FATY3PR01MB10110jp_
Content-Type: text/plain; charset="gb2312"
Content-Transfer-Encoding: base64

SGkgQWxleA0KDQogICAgIEkgc2VhcmNoIHRoZSBjaGFuZ2Vsb2cgaW4gZ2l0IGxvZywgYW5kIGZv
dW5kIHRoYXQgYmVzaWRlcyBvcmMsIGdzdHJlYW1lcjEuMC12YWFwaSwgIGdzdHJlYW1lcjEuMC1w
bHVnaW5zLWJhc2UgYW5kIGdzdHJlYW1lcjEuMCB1c2VkIGhvdGRvYyBpbiBuZXcgdmVyc2lvbi4N
Cg0KTGl1DQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXw0Kt6K8/sjLOiBBbGV4YW5k
ZXIgS2FuYXZpbiA8YWxleC5rYW5hdmluQGdtYWlsLmNvbT4NCreiy83KsbzkOiAyMDI2xOox1MIy
OcjVIDE5OjI2DQrK1bz+yMs6IExpdSwgWWlkaW5nL8H1INLStqEgPGxpdXlkLmZuc3RAZnVqaXRz
dS5jb20+DQqzrcvNOiBvcGVuZW1iZWRkZWQtY29yZUBsaXN0cy5vcGVuZW1iZWRkZWQub3JnIDxv
cGVuZW1iZWRkZWQtY29yZUBsaXN0cy5vcGVuZW1iZWRkZWQub3JnPg0K1vfM4jogUmU6IFtPRS1j
b3JlXVtQQVRDSCA2LzZdIG9yYzogRW5hYmxlIGhvdGRvYyB0byBwcm9kdWNlIGRvYw0KDQpUaGFu
a3MgZm9yIGxvb2tpbmcgaW50byB0aGlzLiBBcmUgdGhlcmUgb3RoZXIgcmVjaXBlcyBpbiBvZS1j
b3JlIHRoYXQNCmhhdmUgaG90ZG9jIHN1cHBvcnQ/IFlvdSBjYW4gcGVyaGFwcyB1bnBhY2sgZXZl
cnl0aGluZyAod2l0aG91dA0KYnVpbGRpbmcgaXQpLCBhbmQgdGhlbiBncmVwIGluIFdPUktESVIg
Zm9yIGhvdGRvYy4NCg0KSWYgdGhlcmUncyBqdXN0IG9yYywgd2UgY291bGQgcHJvYmFibHkgYWRk
IGhvdGRvYyB0byBtZXRhLW9wZW5lbWJlZGRlZCBmaXJzdC4NCg0KVGhlIHBlbmRpbmcgcGF0Y2gg
bmVlZHMgdG8gYmUgc3VibWl0dGVkIHVwc3RyZWFtLg0KDQpBbGV4DQoNCk9uIFRodSwgMjkgSmFu
IDIwMjYgYXQgMDQ6NTQsIFlpZGluZyBMaXUgKEZ1aml0c3UpIHZpYQ0KbGlzdHMub3BlbmVtYmVk
ZGVkLm9yZyA8bGl1eWQuZm5zdD1mdWppdHN1LmNvbUBsaXN0cy5vcGVuZW1iZWRkZWQub3JnPg0K
d3JvdGU6DQo+DQo+IFNpZ25lZC1vZmYtYnk6IExpdSBZaWRpbmcgPGxpdXlkLmZuc3RAZnVqaXRz
dS5jb20+DQo+IC0tLQ0KPiAgLi4uL29yYy9vcmMvMDAwMS1GaXgtaG90ZG9jLXJ1bi1lcnJvci5w
YXRjaCAgIHwgMzcgKysrKysrKysrKysrKysrKysrKw0KPiAgbWV0YS9yZWNpcGVzLWRldnRvb2xz
L29yYy9vcmNfMC40LjQyLmJiICAgICAgIHwgIDUgKystDQo+ICAyIGZpbGVzIGNoYW5nZWQsIDQx
IGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkNCj4gIGNyZWF0ZSBtb2RlIDEwMDY0NCBtZXRh
L3JlY2lwZXMtZGV2dG9vbHMvb3JjL29yYy8wMDAxLUZpeC1ob3Rkb2MtcnVuLWVycm9yLnBhdGNo
DQo+DQo+IGRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvb3JjL29yYy8wMDAxLUZp
eC1ob3Rkb2MtcnVuLWVycm9yLnBhdGNoIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL29yYy9vcmMv
MDAwMS1GaXgtaG90ZG9jLXJ1bi1lcnJvci5wYXRjaA0KPiBuZXcgZmlsZSBtb2RlIDEwMDY0NA0K
PiBpbmRleCAwMDAwMDAwMDAwLi4yNzdjZTAzOGY4DQo+IC0tLSAvZGV2L251bGwNCj4gKysrIGIv
bWV0YS9yZWNpcGVzLWRldnRvb2xzL29yYy9vcmMvMDAwMS1GaXgtaG90ZG9jLXJ1bi1lcnJvci5w
YXRjaA0KPiBAQCAtMCwwICsxLDM2IEBADQo+ICtTdWJqZWN0OiBbUEFUQ0hdIEZpeCBob3Rkb2Mg
cnVuIGVycm9yLg0KPiArDQo+ICtGaXggdGhlIGZvbGxvd2luZyBlcnJvci4NCj4gK3wgUnVubmlu
ZyBjdXN0b20gaW5zdGFsbCBzY3JpcHQgJ3RtcC93b3JrL3g4Ni02NC12My1wb2t5LWxpbnV4L29y
Yy8wLjQuNDIvcmVjaXBlLXN5c3Jvb3QtbmF0aXZlL3Vzci9iaW4vbWVzb24ucmVhbCAtLWludGVy
bmFsIGhvdGRvYyAtLWluc3RhbGwgb3JjLWRvYy9odG1sIC0tZG9jZGlyIC91c3Ivc2hhcmUvZG9j
L29yYy9odG1sIC0tbmFtZSBvcmMgLS1idWlsZGRpciB0bXAvd29yay94ODYtNjQtdjMtcG9reS1s
aW51eC9vcmMvMC40LjQyL2J1aWxkL2RvYyB0bXAvd29yay94ODYtNjQtdjMtcG9reS1saW51eC9v
cmMvMC40LjQyL3JlY2lwZS1zeXNyb290LW5hdGl2ZS91c3IvYmluL2hvdGRvYyBydW4gLS1jb25m
LWZpbGUgb3JjLWRvYy5qc29uJw0KPiArfCAtLS0gc3Rkb3V0IC0tLQ0KPiArfA0KPiArfCAtLS0g
c3RkZXJyIC0tLQ0KPiArfCBFUlJPUjogW2RvYy10cmVlXTogKGluZGV4LWV4dGVuc2lvbi1ub3Qt
Zm91bmQpOiB0bXAvd29yay94ODYtNjQtdjMtcG9reS1saW51eC9vcmMvMC40LjQyL3NvdXJjZXMv
b3JjLTAuNC40Mi9kb2Mvc2l0ZW1hcC50eHQ6ODoxMDogTm8gZXh0ZW5zaW9uIG5hbWVkIGMgZm9y
IGluZGV4IHBhZ2UNCj4gK3wgMDAwMDY6ICAgICAgICAgICAgICAgIHR1dG9yaWFsLm1kDQo+ICt8
IDAwMDA3OiAgICAgICAgICAgICAgICBvcGNvZGVzLm1kDQo+ICt8IDAwMDA4OiAgICAgICAgYy1p
bmRleA0KPiArfCAgICAgICAgICAgICAgIF4NCj4gK3wgMDAwMDk6DQo+ICt8DQo+ICsNCj4gK1Jl
bW92ZSBjLWluZGV4IGFzIGl0IGlzIG5vdCBpbiB0aGUgZG9jIGRpcmVjdG9yeS4NCj4gKw0KPiAr
VXBzdHJlYW0tU3RhdHVzOiBQZW5kaW5nDQo+ICsNCj4gK1NpZ25lZC1vZmYtYnk6IExpdSBZaWRp
bmcgPGxpdXlkLmZuc3RAZnVqaXRzdS5jb20+DQo+ICstLS0NCj4gKyBkb2Mvc2l0ZW1hcC50eHQg
fCAxIC0NCj4gKyAxIGZpbGUgY2hhbmdlZCwgMSBkZWxldGlvbigtKQ0KPiArDQo+ICtkaWZmIC0t
Z2l0IGEvZG9jL3NpdGVtYXAudHh0IGIvZG9jL3NpdGVtYXAudHh0DQo+ICtpbmRleCA1NjhiMzY3
Li40MGE3Zjk5IDEwMDY0NA0KPiArLS0tIGEvZG9jL3NpdGVtYXAudHh0DQo+ICsrKysgYi9kb2Mv
c2l0ZW1hcC50eHQNCj4gK0BAIC01LDQgKzUsMyBAQCBpbmRleC5tZA0KPiArICAgICAgICAgICAg
ICAgY29uY2VwdHMubWQNCj4gKyAgICAgICAgICAgICAgIHR1dG9yaWFsLm1kDQo+ICsgICAgICAg
ICAgICAgICBvcGNvZGVzLm1kDQo+ICstICAgICAgYy1pbmRleA0KPiArLS0NCj4gKzIuNDMuMA0K
PiArDQo+IGRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvb3JjL29yY18wLjQuNDIu
YmIgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvb3JjL29yY18wLjQuNDIuYmINCj4gaW5kZXggZjU2
YjkwNThjMi4uYjczYzhkZjA0ZCAxMDA2NDQNCj4gLS0tIGEvbWV0YS9yZWNpcGVzLWRldnRvb2xz
L29yYy9vcmNfMC40LjQyLmJiDQo+ICsrKyBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9vcmMvb3Jj
XzAuNC40Mi5iYg0KPiBAQCAtNCwxMSArNCwxNCBAQCBERVNDUklQVElPTiA9ICJPcHRpbWlzZWQg
SW5uZXIgTG9vcCBSdW50aW1lIENvbXBpbGVyIGlzIGEgTGlicmFyeSBhbmQgc2V0IG9mIHRvbw0K
PiAgTElDRU5TRSA9ICJCU0QtMi1DbGF1c2UgJiBCU0QtMy1DbGF1c2UiDQo+ICBMSUNfRklMRVNf
Q0hLU1VNID0gImZpbGU6Ly9DT1BZSU5HO21kNT0xNDAwYmQ5ZDA5ZThhZjU2YjllYzk4MmIzZDg1
Nzk3ZSINCj4NCj4gLVNSQ19VUkkgPSAiaHR0cDovL2dzdHJlYW1lci5mcmVlZGVza3RvcC5vcmcv
c3JjL29yYy9vcmMtJHtQVn0udGFyLnh6Ig0KPiArU1JDX1VSSSA9ICJodHRwOi8vZ3N0cmVhbWVy
LmZyZWVkZXNrdG9wLm9yZy9zcmMvb3JjL29yYy0ke1BWfS50YXIueHogXA0KPiArICAgICAgICAg
ICBmaWxlOi8vMDAwMS1GaXgtaG90ZG9jLXJ1bi1lcnJvci5wYXRjaCBcDQo+ICsgICAgICAgICAg
Ig0KPiAgU1JDX1VSSVtzaGEyNTZzdW1dID0gIjdlYzkxMmFiNTlhZjNjYzk3ODc0YzQ1NmE1NmE4
YWUxZWVjNTIwYzM4NWVjNDQ3ZThhMTAyYjJiZDEyMmM5MGMiDQo+DQo+ICBpbmhlcml0IG1lc29u
IHBrZ2NvbmZpZw0KPg0KPiArREVQRU5EUyA9ICJob3Rkb2MtbmF0aXZlIg0KPiAgIyBkaXN0aW5n
dWlzaCBmcm9tIGFwYWNoZTpvcmMNCj4gIENWRV9QUk9EVUNUID0gImdzdHJlYW1lcjpvcmMiDQo+
DQo+IC0tDQo+IDIuNDMuMA0KPg0KPg0KPiAtPS09LT0tPS09LT0tPS09LT0tPS09LQ0KPiBMaW5r
czogWW91IHJlY2VpdmUgYWxsIG1lc3NhZ2VzIHNlbnQgdG8gdGhpcyBncm91cC4NCj4gVmlldy9S
ZXBseSBPbmxpbmUgKCMyMzAxMTgpOiBodHRwczovL2xpc3RzLm9wZW5lbWJlZGRlZC5vcmcvZy9v
cGVuZW1iZWRkZWQtY29yZS9tZXNzYWdlLzIzMDExOA0KPiBNdXRlIFRoaXMgVG9waWM6IGh0dHBz
Oi8vbGlzdHMub3BlbmVtYmVkZGVkLm9yZy9tdC8xMTc1MjE0NTQvMTY4NjQ4OQ0KPiBHcm91cCBP
d25lcjogb3BlbmVtYmVkZGVkLWNvcmUrb3duZXJAbGlzdHMub3BlbmVtYmVkZGVkLm9yZw0KPiBV
bnN1YnNjcmliZTogaHR0cHM6Ly9saXN0cy5vcGVuZW1iZWRkZWQub3JnL2cvb3BlbmVtYmVkZGVk
LWNvcmUvdW5zdWIgW2FsZXgua2FuYXZpbkBnbWFpbC5jb21dDQo+IC09LT0tPS09LT0tPS09LT0t
PS09LT0tDQo+DQo=

--_000_TY3PR01MB1011061788269D6E4EAC2C8999B9FATY3PR01MB10110jp_
Content-Type: text/html; charset="gb2312"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dgb2312">
<style type=3D"text/css" style=3D"display:none;"> P {margin-top:0;margin-bo=
ttom:0;} </style>
</head>
<body dir=3D"ltr">
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif;" class=3D"elementToProof">
<span style=3D"font-size: 12pt; color: rgb(0, 0, 0);">Hi Alex<br>
<br>
&nbsp; &nbsp; &nbsp;I search the changelog in git log, and found that besid=
es&nbsp;</span><span style=3D"font-size: 11pt; color: rgb(0, 0, 0);">orc, g=
streamer1.0-vaapi, &nbsp;gstreamer1.0-plugins-base and gstreamer1.0 used ho=
tdoc in new version.<br>
<br>
Liu</span></div>
<div id=3D"appendonsend"></div>
<hr style=3D"display:inline-block;width:98%" tabindex=3D"-1">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" st=
yle=3D"font-size:11pt" color=3D"#000000"><b>=B7=A2=BC=FE=C8=CB:</b> Alexand=
er Kanavin &lt;alex.kanavin@gmail.com&gt;<br>
<b>=B7=A2=CB=CD=CA=B1=BC=E4:</b> 2026=C4=EA1=D4=C229=C8=D5 19:26<br>
<b>=CA=D5=BC=FE=C8=CB:</b> Liu, Yiding/=C1=F5 =D2=D2=B6=A1 &lt;liuyd.fnst@f=
ujitsu.com&gt;<br>
<b>=B3=AD=CB=CD:</b> openembedded-core@lists.openembedded.org &lt;openembed=
ded-core@lists.openembedded.org&gt;<br>
<b>=D6=F7=CC=E2:</b> Re: [OE-core][PATCH 6/6] orc: Enable hotdoc to produce=
 doc</font>
<div>&nbsp;</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt;=
">
<div class=3D"PlainText">Thanks for looking into this. Are there other reci=
pes in oe-core that<br>
have hotdoc support? You can perhaps unpack everything (without<br>
building it), and then grep in WORKDIR for hotdoc.<br>
<br>
If there's just orc, we could probably add hotdoc to meta-openembedded firs=
t.<br>
<br>
The pending patch needs to be submitted upstream.<br>
<br>
Alex<br>
<br>
On Thu, 29 Jan 2026 at 04:54, Yiding Liu (Fujitsu) via<br>
lists.openembedded.org &lt;liuyd.fnst=3Dfujitsu.com@lists.openembedded.org&=
gt;<br>
wrote:<br>
&gt;<br>
&gt; Signed-off-by: Liu Yiding &lt;liuyd.fnst@fujitsu.com&gt;<br>
&gt; ---<br>
&gt;&nbsp; .../orc/orc/0001-Fix-hotdoc-run-error.patch&nbsp;&nbsp; | 37 +++=
++++++++++++++++<br>
&gt;&nbsp; meta/recipes-devtools/orc/orc_0.4.42.bb&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp; |&nbsp; 5 ++-<br>
&gt;&nbsp; 2 files changed, 41 insertions(+), 1 deletion(-)<br>
&gt;&nbsp; create mode 100644 meta/recipes-devtools/orc/orc/0001-Fix-hotdoc=
-run-error.patch<br>
&gt;<br>
&gt; diff --git a/meta/recipes-devtools/orc/orc/0001-Fix-hotdoc-run-error.p=
atch b/meta/recipes-devtools/orc/orc/0001-Fix-hotdoc-run-error.patch<br>
&gt; new file mode 100644<br>
&gt; index 0000000000..277ce038f8<br>
&gt; --- /dev/null<br>
&gt; +++ b/meta/recipes-devtools/orc/orc/0001-Fix-hotdoc-run-error.patch<br=
>
&gt; @@ -0,0 +1,36 @@<br>
&gt; +Subject: [PATCH] Fix hotdoc run error.<br>
&gt; +<br>
&gt; +Fix the following error.<br>
&gt; +| Running custom install script 'tmp/work/x86-64-v3-poky-linux/orc/0.=
4.42/recipe-sysroot-native/usr/bin/meson.real --internal hotdoc --install o=
rc-doc/html --docdir /usr/share/doc/orc/html --name orc --builddir tmp/work=
/x86-64-v3-poky-linux/orc/0.4.42/build/doc
 tmp/work/x86-64-v3-poky-linux/orc/0.4.42/recipe-sysroot-native/usr/bin/hot=
doc run --conf-file orc-doc.json'<br>
&gt; +| --- stdout ---<br>
&gt; +|<br>
&gt; +| --- stderr ---<br>
&gt; +| ERROR: [doc-tree]: (index-extension-not-found): tmp/work/x86-64-v3-=
poky-linux/orc/0.4.42/sources/orc-0.4.42/doc/sitemap.txt:8:10: No extension=
 named c for index page<br>
&gt; +| 00006:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp; tutorial.md<br>
&gt; +| 00007:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp; opcodes.md<br>
&gt; +| 00008:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; c-index<br>
&gt; +|&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp; ^<br>
&gt; +| 00009:<br>
&gt; +|<br>
&gt; +<br>
&gt; +Remove c-index as it is not in the doc directory.<br>
&gt; +<br>
&gt; +Upstream-Status: Pending<br>
&gt; +<br>
&gt; +Signed-off-by: Liu Yiding &lt;liuyd.fnst@fujitsu.com&gt;<br>
&gt; +---<br>
&gt; + doc/sitemap.txt | 1 -<br>
&gt; + 1 file changed, 1 deletion(-)<br>
&gt; +<br>
&gt; +diff --git a/doc/sitemap.txt b/doc/sitemap.txt<br>
&gt; +index 568b367..40a7f99 100644<br>
&gt; +--- a/doc/sitemap.txt<br>
&gt; ++++ b/doc/sitemap.txt<br>
&gt; +@@ -5,4 +5,3 @@ index.md<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp; concepts.md<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp; tutorial.md<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp; opcodes.md<br>
&gt; +-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; c-index<br>
&gt; +--<br>
&gt; +2.43.0<br>
&gt; +<br>
&gt; diff --git a/meta/recipes-devtools/orc/orc_0.4.42.bb b/meta/recipes-de=
vtools/orc/orc_0.4.42.bb<br>
&gt; index f56b9058c2..b73c8df04d 100644<br>
&gt; --- a/meta/recipes-devtools/orc/orc_0.4.42.bb<br>
&gt; +++ b/meta/recipes-devtools/orc/orc_0.4.42.bb<br>
&gt; @@ -4,11 +4,14 @@ DESCRIPTION =3D &quot;Optimised Inner Loop Runtime C=
ompiler is a Library and set of too<br>
&gt;&nbsp; LICENSE =3D &quot;BSD-2-Clause &amp; BSD-3-Clause&quot;<br>
&gt;&nbsp; LIC_FILES_CHKSUM =3D &quot;<a href=3D"file://COPYING;md5=3D1400b=
d9d09e8af56b9ec982b3d85797e">file://COPYING;md5=3D1400bd9d09e8af56b9ec982b3=
d85797e</a>&quot;<br>
&gt;<br>
&gt; -SRC_URI =3D &quot;<a href=3D"http://gstreamer.freedesktop.org/src/orc=
/orc-${PV}.tar.xz">http://gstreamer.freedesktop.org/src/orc/orc-${PV}.tar.x=
z</a>&quot;<br>
&gt; +SRC_URI =3D &quot;<a href=3D""></a>http://gstreamer.freedesktop.org/s=
rc/orc/orc-${PV}.tar.xz \<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a href=
=3D"file://0001-Fix-hotdoc-run-error.patch">file://0001-Fix-hotdoc-run-erro=
r.patch</a> \<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;<br>
&gt;&nbsp; SRC_URI[sha256sum] =3D &quot;7ec912ab59af3cc97874c456a56a8ae1eec=
520c385ec447e8a102b2bd122c90c&quot;<br>
&gt;<br>
&gt;&nbsp; inherit meson pkgconfig<br>
&gt;<br>
&gt; +DEPENDS =3D &quot;hotdoc-native&quot;<br>
&gt;&nbsp; # distinguish from apache:orc<br>
&gt;&nbsp; CVE_PRODUCT =3D &quot;gstreamer:orc&quot;<br>
&gt;<br>
&gt; --<br>
&gt; 2.43.0<br>
&gt;<br>
&gt;<br>
&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt; Links: You receive all messages sent to this group.<br>
&gt; View/Reply Online (#230118): <a href=3D"https://lists.openembedded.org=
/g/openembedded-core/message/230118">
https://lists.openembedded.org/g/openembedded-core/message/230118</a><br>
&gt; Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/11752145=
4/1686489">
https://lists.openembedded.org/mt/117521454/1686489</a><br>
&gt; Group Owner: openembedded-core+owner@lists.openembedded.org<br>
&gt; Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-=
core/unsub">
https://lists.openembedded.org/g/openembedded-core/unsub</a> [alex.kanavin@=
gmail.com]<br>
&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt;<br>
</div>
</span></font></div>
</body>
</html>

--_000_TY3PR01MB1011061788269D6E4EAC2C8999B9FATY3PR01MB10110jp_--

