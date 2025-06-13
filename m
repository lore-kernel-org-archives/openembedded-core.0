Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 26386C71136
	for <webhook@archiver.kernel.org>; Fri, 13 Jun 2025 13:33:02 +0000 (UTC)
Received: from MRWPR03CU001.outbound.protection.outlook.com (MRWPR03CU001.outbound.protection.outlook.com [40.107.130.63])
 by mx.groups.io with SMTP id smtpd.web10.10472.1749821575071238915
 for <openembedded-core@lists.openembedded.org>;
 Fri, 13 Jun 2025 06:32:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@siemens.com header.s=selector2 header.b=sMSp3NvS;
 spf=pass (domain: siemens.com, ip: 40.107.130.63, mailfrom: peter.marko@siemens.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OvzV1YE43lcEGctX7QT2ISvciuWFDS8Yv0IdekMO0wSz3OEhkUTR4zTh/h5b+0VBwbaK3KM44KYqbiwN+3GkLEXy8wOZMAPfHrHW+KeodjS+sxaQKqGpuFCWXKISz0mGPKvcfmn5ncPyVVFI/WDuBEgN/7lFt9Qf3uSy99CSKNOw6XKOrOJ1J4klFHiDej1csZm1oElbkQmhu7yyxuXG1Ks8fqaO07mAe4AgGCZL1smgw8AxUB1BnQM7DsQcBINx7zXST5ukyRb5d3XNxqoB6tSc2Gf7SPkLr0XhqWeqkBuAMLwTi5xiuKqJ401Mn7EMzGVLpKSkJPbyKfN/IW92wg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=J7chI4FMpWLLmO0zEJnXOf2Rc36jPDxQiRzYE9HiMfM=;
 b=SAL5LHqU+lUzt+dvMK6ori0hJOBMVJ046y1BECnXBwrAWWFgQhlBlQPjTVIWnalpTLE8ZuHIWKbV8cSaRCIjVrTDTpEr01JG4mr7JJgyIRZcQHfV4vZHUaDCdLcztg7LIlRtwpniYbLtuFV2Vw54bmELfYfSQ5RUQ3QLVJaLo+S1vG6f6CzxRb/gzgwBcDKXDDC26kLkoiaSHDxUMBszHHus6z2Vhr9b5g0rc/C5kXqrbWbryvd6dD//a6CkM+x+xtV2and6V8qIE/KzHYiZ0+VjAXFQKVYBKAU+wL2JYN3K/zIg13vNC0wRh0X0Yq43qNnxHXsI3isHY8EAoiorRg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siemens.com; dmarc=pass action=none header.from=siemens.com;
 dkim=pass header.d=siemens.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siemens.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=J7chI4FMpWLLmO0zEJnXOf2Rc36jPDxQiRzYE9HiMfM=;
 b=sMSp3NvSNAT8ULU81+9SVXK2pqOklkxXOZK7N8vFBm3QaIJtGngH0ZrCPr1415CGnCeqr6LEY6NNOwQ7O1ZbVujWun2AN52LapsCSupViNXvEtfeV0eTcYIhg4foB6+OBtk1AH0vFp+D7KG+bdg3eRImJoBLkX1ZnIqb/bOmbMWe1RMsfkUZ8/zWwWpxqqR2X/JI24e/dFmU4h+Zy3N/OaR6sKGEmLTZEKKh8+i0UmfHfUSh97rXIyzsb3jYX4YNSyX4zCGxpSjUkPUrg7Mh1bI7x+46WZoSVJbLXquhOjmmQpXD81GrxJKTEAAt1vCge9L9NWv4xr7GTS9d2SQc2Q==
Received: from AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:479::20)
 by AS2PR10MB6517.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:559::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.22; Fri, 13 Jun
 2025 13:32:51 +0000
Received: from AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::6c68:267b:6fd1:d3f2]) by AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::6c68:267b:6fd1:d3f2%4]) with mapi id 15.20.8835.018; Fri, 13 Jun 2025
 13:32:51 +0000
From: "Marko, Peter" <Peter.Marko@siemens.com>
To: "setairidis@gmail.com" <setairidis@gmail.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: RE: [OE-core] [scarthgap] Recipe systemd version was changed
 #scarthgap
Thread-Topic: [OE-core] [scarthgap] Recipe systemd version was changed
 #scarthgap
Thread-Index: AQHb3GZInG3R16UkC0mRoIA05Id4p7QBFYkA
Date: Fri, 13 Jun 2025 13:32:50 +0000
Message-ID: 
 <AS1PR10MB5697551BBA8C496394E275D5FD77A@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
References: <Ely1.1749820976286643166.pmUL@lists.openembedded.org>
In-Reply-To: <Ely1.1749820976286643166.pmUL@lists.openembedded.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
 MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ActionId=31257d48-4a5b-41ea-b54e-091ea48e4b0c;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ContentBits=0;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Enabled=true;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Method=Standard;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Name=restricted;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SetDate=2025-06-13T13:29:20Z;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SiteId=38ae3bcd-9579-4fd4-adda-b42e1495d55a;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Tag=10,
 3, 0, 1;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siemens.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS1PR10MB5697:EE_|AS2PR10MB6517:EE_
x-ms-office365-filtering-correlation-id: c4f79b53-de5f-4032-b1ad-08ddaa7ecb57
x-ms-exchange-atpmessageproperties: SA
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|376014|366016|38070700018;
x-microsoft-antispam-message-info: 
 =?utf-8?B?K3dMY1RkYnhWVGFSakozUG1ncVVQZlQvVGFBbm1yUmZMdy9OL1hhRWtIOTBj?=
 =?utf-8?B?MjJpWUVrNnh2L1lSOVRaZmhNN041T1FhTkxhWnhteVhyK3F6SGhtbnZENjNz?=
 =?utf-8?B?eTQ2SVhCUC9ya293MEdjSkRzeXRnVERldmZueklhRnEzU2NKelRHS2poZWQ4?=
 =?utf-8?B?MFRQalBCQUJnNWhOVXdHSU8veDJLaFNPZURhODZpaE1SYVB3TWJCY2Q4Tk9i?=
 =?utf-8?B?enNwbGdqSUN2K2lNUDRzWnVuVllQRTB1NGxZbGt4di9OdnZ6NFBYSUFLdXAz?=
 =?utf-8?B?K0V3dXVjVnRKSjN3QWtkVVlnVEhndGR3M2tpd09VYTFGcmRnODlYem1MWnh2?=
 =?utf-8?B?MytUdEtpMjV3eElkVXMrSzcrUVVMbWdmbWZMMThVZGM1cDNjQ2lKZllWbkkr?=
 =?utf-8?B?YmxjbWl5a2ZNTVJsTTBuSCtmNHZXMkF3RDVDUm1JalVvZ1JVUEdLSk84WGQy?=
 =?utf-8?B?Q3ZVbnJVZEpaQ1JOdUJXb0J5NEFnTi9zbmFWM3o5MWpKQnY3K3UrL3FCZzRz?=
 =?utf-8?B?MmdTT3k5Z0NYWll2aElzM2tvNVNNemt1bURReGl2c0pzK0hXSmRCM3dFM0Na?=
 =?utf-8?B?V2NhNXA4M2hWK296YlVYWHl0amlHNy9hb2F6N0twQ0MydDY5Yk05OFo3T1lw?=
 =?utf-8?B?Q2VkWkovbFg5WXlTTkVWeVVvaVptN2lTV3RQYm91alVvT0ZSbkY2T3Z3aGU1?=
 =?utf-8?B?dlZtdExyVSs2N2JhcGQ0VXorY21sSHFvc0lwTkt6OU0rbVBkUWVJUGxmZE0z?=
 =?utf-8?B?MG9PSVJpMHk0dkR3aEdZSlVOVWtDQmlDTkoxd2ZHUmJUeTFmZ2pEWUdJS3NI?=
 =?utf-8?B?ZllzUFJaaStJc3FsS2ZBemtUWDJhQ2tZSGNlbTd2ZHd4U0w3ZkdiaVlTRDVR?=
 =?utf-8?B?VUFxaWNmMTJscVQ1Yi85TWtEckoycW9vM1I0RVMyZFhqbzNxZk5SdzVwdGx2?=
 =?utf-8?B?ZDljNkZCY0lEWHI1OFd6WEtEZXEvUXNwNWdTWGEvaWxhcWM4SEczL0hlRFJB?=
 =?utf-8?B?czVtY0dQMXlYZ1dNUjhsMmZjYXNkQkVyQnZHQjVzcEVWNVdGQ0pWellKZVZt?=
 =?utf-8?B?UVpNb3AzVmxqaU5TSTA2VmVqeHNad0ZYam1RN1o2bmQ4V3NQRWx1OExOYVA1?=
 =?utf-8?B?TzZYallXTWRzZjBSSFpkN1pSTy9KOENkZmFYWGZrZFVIRG9nVjlpbzNrQXg1?=
 =?utf-8?B?MjBkR1h3VVFPWFBYQzBMRGZmNE1aWHJVMjJseHhBMjlvOE9ZMng3b0cxcVJL?=
 =?utf-8?B?dWY1T3ZiR3AvVTFQWnA4eFU2VEtUN2l3dDNCOXgzM0Zpb29qa00yODZaT2VW?=
 =?utf-8?B?TW5lTXpwM3JRM2k5Z2ZlWlRtSHFnbm5ib3FIVDlla25LWktuYXdVT2ZFcXBG?=
 =?utf-8?B?OG9sRWdtcC9PZFBuTzVDbEFGdzZkWE9rK0RuVFVlQzNCSVpjemVoMEJmTEMr?=
 =?utf-8?B?U1RMQkM1UmNtRUNWeTFIWDE3VHBRUTZncEFjQTNEWUowU1VGZjZISm1RWHN1?=
 =?utf-8?B?MzFSMTQyQkwvalIvalB4akhIbUpPRnY5SnN1eW1VcVRsajUwOGRkeUpiQi9k?=
 =?utf-8?B?QUN6R3p6T0FiSnNrSEhXaXZhSmp1R2ppU2Y2QjZNa2JsMTlUbkQyV2dKNlk0?=
 =?utf-8?B?aGVqdEt4OTdYTHhDUzVGM2toU0QrTmhVWjNuNXNPOTVCTG52c1VEYURyRXBh?=
 =?utf-8?B?d3pCYWpXbEdNd0ZmSUt6UkNHUmpWdktGZGhBRysrYXdBK3IxMlB2UGpzNUgv?=
 =?utf-8?B?cFJ4TDlYRjRPVVEwVFdMR3hHektNNXpYb0RFYXZTQ2prMjA4UERKMDdQUlBa?=
 =?utf-8?B?MXBjemhVYnFLbzdmODNpVVJ5clFva0VDUEc1SjdrcFRjMU9RWm96cUtUMWFp?=
 =?utf-8?B?cGtRR2h4WWppMGNHTjV1WUNLeVZ2RjIrd3lXZkN1TFBXdmpMak5tSDZJYllY?=
 =?utf-8?B?cEZ5MHZlWmtWOXlNRE9ISEhHL0lzNTFyRnBxYTlGVDZIa2xESWJ3SjVnOXlP?=
 =?utf-8?Q?SsVGq/rWqoOmXpz9d168uepfEiHZ98=3D?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?WmorN05KelNGbjl5aGtNMWtFdnNYUVJiRldPNnU4aUJIcFB6QmdqUnhYTmU3?=
 =?utf-8?B?bDc5WmMrTWFJdEw0YzFwcVhvV0lXTjltVlQybEVWWkJIclRIenFCMFkrb3NP?=
 =?utf-8?B?N2NCYlBpSXBHR0hSMVkzOXZQUG5FRHJLUkhPM29BcmhPMkxSUEI0a2hYWWR4?=
 =?utf-8?B?cmszU0lTTERNZ3djM0MrSnNBM3BkdDNsVHllcVU3azF6djBNS2xKS1ZhbkNI?=
 =?utf-8?B?bzREbEtBUEhKVXM3bU5jVFZrclhJekpKckhoQWwrNU9KejYveXR5b1JQYW5R?=
 =?utf-8?B?NCt1NVcvY1grQkp0MmU1WGV4NlJyTjVNWDVtQmU4M1AyMnB6VmJQcEpBc0FQ?=
 =?utf-8?B?MTBhVFNWTDA2bFFnVkJsbnRmVmF4ZkROYUF6MG85cFgyTXA5ZEEvU1RTdEty?=
 =?utf-8?B?elphL3VqWndJWFBzM2gzYkQ2RE5LaUw3RWZ6WjdkV053Q3lWLzNIMHlVV3Bq?=
 =?utf-8?B?T0RRbDdnTXEvZFBrTU1aZk1zOFYwSlVwMzdsbUdVVndwM1BDWS9uMlhHdXFk?=
 =?utf-8?B?S2NlYXB0bHM0MmhUR3ppUmx6YTJ2NGoxOEtHRzljeXJFQi94U1hzOGNHaHUr?=
 =?utf-8?B?dUFHbG9NYkh3OUl3S0FpazBZMk5hbWlLQnZCNkN2eHdJNVRodjZMSjI0M1Jj?=
 =?utf-8?B?U2pwdDg5TjA4NDdDS0FZV1pHbmVQRzJ1N3E0WU8xMjMyTHBFQTNTZmJUOWJT?=
 =?utf-8?B?b1FBRG1qWWo3VEcvUnQxMWdDSlBRWVNmaG1ESjhheDhRendMSW92Qmlvbyta?=
 =?utf-8?B?ME5ZUk02RFdXODVlRjlvdmV5TkNBd1BQaDNwOFVSZVAzeEdwNjliZklEVExt?=
 =?utf-8?B?c0ZDQTdvNTdZa3huRlI1OW90ajVGZk1qU3FWS252QVg0ampkWUFsV0dzQ0pz?=
 =?utf-8?B?em9pMkcvQ0NrbDU2WFl3QlN3K3BUUEdHa2NESmEzVnFDVmUxRzhsanVPM1E5?=
 =?utf-8?B?em1EdmZ0UE9UdWlMY1FnS0IwVVIzdUNQWUovckJqVjRLVUduQllPRFlFc3hP?=
 =?utf-8?B?UWVUcXFJVnJZYVZpWEQzTGhoQmY5UDlUMlVQYmNWdVBpb0RDVExvNUdyTjM0?=
 =?utf-8?B?cE5UOEdMZlRMRkdOdGlPUjVGdER5UU1GbmR6T0dNTndxQjNHdVF5Nnk3eWI1?=
 =?utf-8?B?WFlJQlpxRHFDQ09yR2dIanRMN2V3clJGVzlhWW0wSnVDWGZNNGxqRmUyd3Fx?=
 =?utf-8?B?eDRnVVVIZkZmSGZycHZlamhUcmxUcWRSd2R5R2FxRWdjVXJwOTBkeDJYeXNu?=
 =?utf-8?B?VS80S0dLMkVyS2NQR1VtbzFHS2MrdjZjOVh2eTJWYWZEbFJGQW5Nd2pDc0oy?=
 =?utf-8?B?RDZFK2s1bGZ1REpyalpRS1dWUzFBNm12N2Z1bW9mMCtMUENjbVdXYkl2Y2Jn?=
 =?utf-8?B?RWd3bjA5SjlTaWFVQnRDdFFGY3BiV1FDTEhRVE1YaFNOV21uWitKMHdCMEFK?=
 =?utf-8?B?OUdyU0tXMWpGaWJ1UVdyWE9JejYwZHhKSjhHa3YzUWpYVDlObk9DNGEvb0tp?=
 =?utf-8?B?Mk40dVRnNU0vMFpWZ1BnYUxCWnJOc3I1V2NydjNpN2w3SS9vL0c4dWJBd0Rl?=
 =?utf-8?B?amJpY0FXUDIzOFFBcG04Z3ZUdTdyTDZ2M2lNajUrNUNwakt5Q3BvRml1Tkpp?=
 =?utf-8?B?WStsWmwrQnhUZU9oZmVGSW5rV2Z0YjIrVXJEemh3NldwQXVPQ2ZVbkNvTDZ6?=
 =?utf-8?B?aGNXa2RIeTBveGVTOUQ3d1FFVlk3dVJFZWVYTG0vempkTE5NeWRQN29sbWkz?=
 =?utf-8?B?eHRrS3kzR1Y4VmR3YUFScE82Q1gvcXlSM3VtNy9GaTA4Q25hM2hCUGlVdXBi?=
 =?utf-8?B?clNVRFY1ZG8xTGhhdXQ4OHRIQnJobEZBSVV4SmRtRGFCeEh5VFNjb1dhcitU?=
 =?utf-8?B?REo4c1Y2UGdRa1MzbjEzS1RwMUhBQ0RNQ29SRG1yRW1GbE1DTDdLMTRVY3V0?=
 =?utf-8?B?K0lxU1NRanlReTFNYllpdXViWkZZSzRuM3NLY1djTlBIMFAzZ2dBN29NelRH?=
 =?utf-8?B?TFl4bmhWUFRDUkN4L3VXdEIxWWNQdG5BZjBLZ1RHWnpGSUV4YS8vbWI1aFVR?=
 =?utf-8?B?S2I3ZUpKbVZDRUd0dWZqMWN0VG5tVGpPZUQ3QUp0VzVXZERQVk15V1hXNU54?=
 =?utf-8?Q?XDaDAk9tPiBm67uwu0NyGyShN?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: c4f79b53-de5f-4032-b1ad-08ddaa7ecb57
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Jun 2025 13:32:51.0200
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 1r4JqVGp7xSS3TRfT7w0UXh6h2hO1Rg3JCsje0Ym842XvqcURrBdO6CxYKif4zd19DjF9Pcas+PuafqBryKN0w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR10MB6517
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 13 Jun 2025 13:33:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/218612

WWVzLCB0aGF0IG5lZWRzIHRvIGJlIGNvcnJlY3RlZCBmcm9tIF92MjU1LjIxIHRvIF8yNTUuMjEu
DQoNCkF1dG9idWlsZGVyIGpvYnMgd2lsbCBoYXZlIHByb2JsZW0gd2l0aCAidmVyc2lvbi1nb2lu
Zy1iYWNrd2FyZHMiIHdhcm5pbmcvZXJyb3Igc2luY2UgdGhlICJ2IiB3YXMgYWxyZWFkeSBtZXJn
ZWQsDQpJIGd1ZXNzIGJ1bXBpbmcgUEUgdG8gIjIiIHdpbGwgZG8gdGhlIGpvYi4NCg0KUGV0ZXIN
Cg0KPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBvcGVuZW1iZWRkZWQtY29y
ZUBsaXN0cy5vcGVuZW1iZWRkZWQub3JnIDxvcGVuZW1iZWRkZWQtDQo+IGNvcmVAbGlzdHMub3Bl
bmVtYmVkZGVkLm9yZz4gT24gQmVoYWxmIE9mIFNhdnZhcyBFdGFpcmlkaXMgdmlhDQo+IGxpc3Rz
Lm9wZW5lbWJlZGRlZC5vcmcNCj4gU2VudDogRnJpZGF5LCBKdW5lIDEzLCAyMDI1IDE1OjIzDQo+
IFRvOiBvcGVuZW1iZWRkZWQtY29yZUBsaXN0cy5vcGVuZW1iZWRkZWQub3JnDQo+IFN1YmplY3Q6
IFtPRS1jb3JlXSBbc2NhcnRoZ2FwXSBSZWNpcGUgc3lzdGVtZCB2ZXJzaW9uIHdhcyBjaGFuZ2Vk
ICNzY2FydGhnYXANCj4gDQo+IEhpIGFsbCwNCj4gDQo+IHdlIG5vdGljZWQgdGhhdCB0aGUgc3lz
dGVtZCByZWNpcGUgaW4gdGhlIHNjYXJ0aGdhcCBicmFjaCB3YXMgcmVuYW1lZCBmcm9tDQo+IHN5
c3RlbWRfMjU1LjE4LmJiIHRvIHN5c3RlbWRfdjI1NS4yMS5iYiB3YXMgdGhpcyBpbmRldGlvbmFs
Pw0KPiBUaGUgcmVhbm1lIGFkZHMgYSB2IGJlZm9yZSB0aGUgdmVyc2lvbiBudW1iZXIuIFRoaXMg
Y2hhbmdlIGhhcyBpbmZsdWVuY2Ugb24gdGhlDQo+IENWRSB0YXNrIHdlIGhhdmUgcnVubmluZy4N
Cj4gU2hvdWxkIEkgY3JlYXRlIGEgY29tbWl0IHRvIHJldmVydCB0aGlzIG5hbWUgY2hhbmdlPw0K
PiANCj4gVGhhbmtzIGluIGFkdmFuY2UsDQo+IFNhdnZhcw0K

