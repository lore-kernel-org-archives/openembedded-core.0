Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F1325CF34D3
	for <webhook@archiver.kernel.org>; Wed, 19 Nov 2025 15:11:48 +0000 (UTC)
Received: from AM0PR83CU005.outbound.protection.outlook.com (AM0PR83CU005.outbound.protection.outlook.com [52.101.69.27])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.9313.1763565095996894435
 for <openembedded-core@lists.openembedded.org>;
 Wed, 19 Nov 2025 07:11:41 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@siemens.com header.s=selector2 header.b=eWz+mQoD;
 spf=none, err=SPF record not found (domain: siemens.com, ip: 52.101.69.27, mailfrom: peter.marko@siemens.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mbuhGv+MJSmjdf7VE22ZMyhtuz67h9ldqlJVotIUFyovRyPR0k8fwYbgl8do+wcL+PSKqk1nT1/GBpnN8wzh349jx4NFZ7mpRdLfqXLkmX/Uiq4o1Wdj/2fycH8nW5KkCplMvP9eibMqgktR5CTxZY4CJvsMJFWxPV3ixWIA0jIxoSCLQu0v3H+/rkz7IWC1R5kJzP09WZzsfdy6WhkRwtjJFAUPjdWnccFWVeKWGukcSmPeIvTuiqge8tRf/gwGOwYEPHXF6rngq3pNoqzF/jsq0XsirHDst3CXDkg9MG6ZIMOoHE1GvfeJLaf3PVZ/joQEk2E6pXzBpbjkAtn6ww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=D0V7fycL0n2JjcnIYjDHvciYs1iTPGBrXR2N1NcL5Yw=;
 b=ma61nWKJXns7JUKWkUqkbzGp/FvejZhaar+Ypifn+ijaHL6fKBj9j+MPrPm+0RqNzt/RsciYNazBo2gSXOue63oaaBjK9bIcbYmujbgLwT07X+RbzXwXjdzPY1EtztWp2nxaYbXnWhu+pQgvRYNN9UvLHILftQ0Nv6lKmGNOFexmOD9gGjcoVqGKY5EyigUgt8po4pCKdZ5ixw0OQzfhQSclNRz2W6U5Uyx1+C7NeUuaTAm5ynJNu8fWgdPPjAI8cMpac8xRpc6va9Yh80YHUrKYsXp5YVV9ikLXCIsvwrA+bDNS42tOgwl0TDqiSr680nN/7ZJlE1H2U+MIRxifpg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siemens.com; dmarc=pass action=none header.from=siemens.com;
 dkim=pass header.d=siemens.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siemens.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=D0V7fycL0n2JjcnIYjDHvciYs1iTPGBrXR2N1NcL5Yw=;
 b=eWz+mQoDMJelYAMHTLY1ulTK1I9jtGO2s4RDQxCoKoRyl7txSVLwskWkcrRQNSpS0+b2y8ZHwiu6waa96KHgaxKL2NOWVcnc6HlNGSOJZVTFpjcelnru0KEPkXBR0tB27RjSUnlffE/sRZUyEj8B08owLNxhvGavDAYTt9AU6AiYOzj09o+qDhI3jYl7uNXc3qz6WC8A/oZEyyOG4OEYSjjBShwusZMNfUKH6VxhjS/KH1P8c6Jg1/Jk0/MQ1J/TjeuwBzFJg+3WWpYAS10flHPWqy1JrSMzK4/+qleYvSK+OlAYja3sop/neKtmq0hHL8k+U69qjicov4DuGuMuOw==
Received: from AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:479::20)
 by GV2PR10MB6090.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:150:aa::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.22; Wed, 19 Nov
 2025 15:10:46 +0000
Received: from AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::6c68:267b:6fd1:d3f2]) by AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::6c68:267b:6fd1:d3f2%6]) with mapi id 15.20.9320.021; Wed, 19 Nov 2025
 15:10:46 +0000
From: "Marko, Peter" <Peter.Marko@siemens.com>
To: Steve Sakoman <steve@sakoman.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: RE: [OE-core][scarthgap][PATCH 0/9] go tests backports
Thread-Topic: [OE-core][scarthgap][PATCH 0/9] go tests backports
Thread-Index: AQHcVJj9fzTiCW5Kr0SVqdTEVnfEz7T6IbcAgAACKMA=
Date: Wed, 19 Nov 2025 15:10:46 +0000
Message-ID: 
 <AS1PR10MB5697111637A8A6076BCD808DFDD7A@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
References: <20251113122806.16769-1-peter.marko@siemens.com>
 <CAOSpxdYgTSZ=8fR4eYotZugp1edZu0qaXg8-yPbGCrZgqMVv6Q@mail.gmail.com>
In-Reply-To: 
 <CAOSpxdYgTSZ=8fR4eYotZugp1edZu0qaXg8-yPbGCrZgqMVv6Q@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
 MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ActionId=50900547-4d35-4493-86cf-2b1e41247b51;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ContentBits=0;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Enabled=true;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Method=Standard;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Name=restricted;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SetDate=2025-11-19T15:09:42Z;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SiteId=38ae3bcd-9579-4fd4-adda-b42e1495d55a;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Tag=10,
 3, 0, 1;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siemens.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS1PR10MB5697:EE_|GV2PR10MB6090:EE_
x-ms-office365-filtering-correlation-id: 5cdd435e-c150-4431-a855-08de277dd121
x-ms-exchange-atpmessageproperties: SA
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|376014|366016|38070700021;
x-microsoft-antispam-message-info: 
 =?utf-8?B?YndENXZoMzhSZmM5NFNFUUo5ZGx2cm1LY1d1anVCNGZjYllUb01qWXkxMXNy?=
 =?utf-8?B?N2tSTXdDZm4wMWtDbVdjNWxmZmRvaEFZWVI1cVkycy9MdVRQL1ZnYS9BQWRG?=
 =?utf-8?B?TTVzbUlnN2ZnaENXQ3RzY1ZXQnJIbkNBSWF0YUl3Mk9aSjN3OU9NbVlSRFcy?=
 =?utf-8?B?Ykl0UmFHU1h2WFJCR0xsUnRiSWVlYkxTbmdQR2F0Z2tRN3VFSzJ1VEhPMDdS?=
 =?utf-8?B?b2M5MUsyQlFwUmp0ODE2Tk1NYUdTcG5CMkIwOGZrMjVibE9WKyt6S0hEV0M5?=
 =?utf-8?B?R0R0YkdYZWNucndXRmw3Um5QcXZUZnRsbm5pWmpsTzE5ZlF4MmVjNDV1TXkx?=
 =?utf-8?B?TkZUcEs5ZEVVWGk1YXgzR29xc09nd3ArNDd3b3I4cVlTbWROWXp6NmVhLzYv?=
 =?utf-8?B?VDloMnFPN3VtQjc4dDhxSzdVYkxwWXJuMUZoVG5iUDMxZVFKZDYwL3BjaktX?=
 =?utf-8?B?MFpnVC9tSmVQL3lvMGRKQ2gxNWNXRDlRNERKSzlLUlpWc2VwZytTeUZHVDd5?=
 =?utf-8?B?dU43YnJRUHcyV2hPOG9MZjBNY1lsVVhTQ3ZBL0RYeHpubjFaejJ0emowT1Zl?=
 =?utf-8?B?UGxsdnVSVzRoMGpJRHdEdmZVNkQvb3MyUXVJMDhJSjR3Ly8vRU9Bb1lOcDVM?=
 =?utf-8?B?T1JUd3JZUU9YUnlESHc0VkVmY2F1R3dzRlY2cFRPTGlyWDBpQWFGZ0o5M3hr?=
 =?utf-8?B?S0xYc2hab05LVVJ3MDIxWTJYMzdLZTZhMWFsaTV5SDB1ZkZ1eXIvN2R5Q0FI?=
 =?utf-8?B?RGthU0NFbXdGVVFSQzJvRmZZUGkxcjJzUWEvY09aV040SkxPS2Z5ajZXS3hS?=
 =?utf-8?B?SG5lcjl3b2g2YjBCc3owd2JDWVZ0SDJXTnFlS3R1b3lzVlVEZDNsWFVEV3lT?=
 =?utf-8?B?dW5iTTVabm5TV2JoQTRoTzBjU0loZmZ6Tm9mS0xjcUY5ckQ4OWdDOVdIZVZV?=
 =?utf-8?B?anRjdjc2bFJXY2plNnpxaVk2bmdSVHZiWWpkalZSNGtzNmI0MGw3WW5HNjY3?=
 =?utf-8?B?akxRaTBUZTMyQWRvOXVWbFFVdFNGZ21MWER5a0hrKzZINEtUeDB6WXZxeXdW?=
 =?utf-8?B?dTdKc0p2Vk9aMllVMkFROXZab1ZPMW1HVzQzQ1o1UzJYOEt6ZHhKSGl0MlNI?=
 =?utf-8?B?bVBDNStINEk3dURYaXpkMmIrTDFPTm5HM0t5N3UrbkRLQjZQSmp4RnRWZTRM?=
 =?utf-8?B?TStqKzhLRDMvQ0tSaGFaeVZXUTBra2RoWk5KdGtPWVpJSHJad2RpejVpUzVH?=
 =?utf-8?B?UDE4b2NweDFxV0hzUWFhN0M0OHNmSEZMSEMvRGw1MlVnU1N0c3paL0RlcTY3?=
 =?utf-8?B?bEZlSURYeFR2TDY1WjdHNjRnWjlsRmJyY0NURmNha3lYMWZ4Y0dITUg4Rzdw?=
 =?utf-8?B?ZzBoOXd1SHFjWG5JUjFuRDFwc3ExUjVTV2ZGL1pyNzFhRWxHcWpYQ2Zsd0wr?=
 =?utf-8?B?ZHVOcnhDd2lBWGZqMUNOQWZ4andGZk9aajZ0TkhpWWF4Q1lvUjhxOC91VUts?=
 =?utf-8?B?T3B3aTFLeEpOZzdPT2JJdUxybzQweXdzY1R5ZGlKM250Wk1mV0F4ZG54QnQr?=
 =?utf-8?B?dDkxdVJEcGEzYTdrK29HVXc0YWdPU0krS3pUMmdMOUppMW12V1k5UzFTdGRm?=
 =?utf-8?B?YXEzR1huL1lVMFFzazZUZnh1dTNRZVR6dFVNamhSQWwwK01KVmQ2Wm92MVZo?=
 =?utf-8?B?RzF3K2NYdmpuV0ZKdk95MTlJYlpVelNjKzV5bUEvS0tjaEJVekRSMzdSdHQr?=
 =?utf-8?B?TkFBQWUwYjJiTElhVHljeHlLMjJEM0R2UUxLS2JwbmxhanFvRHFlaDZ2R3Bn?=
 =?utf-8?B?M09oZVlrQU1vT2hzZ1lhZWp2clQ3SEtKRnZJYnJnUVdqZGJXang1a2hNRCtI?=
 =?utf-8?B?MkdLTmVvTUc2WWVUT0xJNW1jUG5Nc3V3a1hRck5KOWI5a2xuL3lxQlV4eFJm?=
 =?utf-8?Q?zI382chDDlESOyOO0sJxEiNTscBXoX0T?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?b1c5azZQQnZXV3JUZjFFdU41MGJObVpFVVBQK3pRaDgxa3dHbVBjcDQ0ZVMw?=
 =?utf-8?B?SUQxU0hFLzdxSEtXYjJETXBNRWxPZDduNG1MbGVXR3ZUdWtLb0MxczVIUW1W?=
 =?utf-8?B?b3R2a0Ird1BwRm8ydDQ4dFY0UWh0WkprVDA0OW9pMVlGT0dObEp6bTZDVUs2?=
 =?utf-8?B?WlVxTk94aHlqR2FJbUl6MDFlelo5bG0zSG83eWhEc3hLNHM2UTVRSzRweVJk?=
 =?utf-8?B?MlM2S3ZlMWdhNDNZVmZ5N0pKa1JPL09wVCs4ZVdXUWlwbEh3M1BtNW9leHVi?=
 =?utf-8?B?QVZoZk5QQ3FJdmlaSnN5N3oyVlpaaTF5NndGOXU4QmszTEtEdUVwNktyZUNK?=
 =?utf-8?B?T2V2SXZoNTJNa0FCSkVTbjBweCtpZlg4V1F5Ui9UdFZES3JJeGtrSXJmT2JF?=
 =?utf-8?B?S3BNUmdScHNPWTlpVFRZV2kvUHY0MXVjUG9zY3JFd1JPSGc1anBSR3hVZ3Fk?=
 =?utf-8?B?Zjh4RE4zWlc2SDQ3czdEZnlROTVHVmNOMjZLNXFOUXVuSHdNVzNmVW5SdE81?=
 =?utf-8?B?TVA3VDBGT055NnBWdThSWVAyMnYrc3pMZnJFRlIxNUVITXJkZG5DeU9Namlz?=
 =?utf-8?B?SktXY1FzSWpsU1E0bUR5bXB4MjZBajJtYnJvNzY2cXI0L25ZUE54ZVdyRklL?=
 =?utf-8?B?ZlFRYU1PQmtpR1dpakQyTldjajY4SDB4MnNkZDQxdlJrYVpsVHFEcXk5dlB0?=
 =?utf-8?B?MWl1WEU0S29kazliR0NMdmhwaGYrUVB5MWlWd1p1TVJrbS9WOGh5V0VTZ0cw?=
 =?utf-8?B?aHgwdFVZb1kwcERKeTIrWHRmVW0xN2Zlc1B0OGdhdGZsTjhKUG5pQjVjS2Iv?=
 =?utf-8?B?UXpPUlR5TDVTMmI5b0JBeHNQQitiTkhoaDNFQUVXaFp4cWR1Z01xQkRoRXN3?=
 =?utf-8?B?R3ZwTVp0Q2FwTmRuemU5aGZac2FwT1ROWTN5SHc0RldpQkFqWlhCM3NTQTFV?=
 =?utf-8?B?VFU1OEJhSnVkR1hqSjZUN2VlMWlFNjJJUzl1K0NJL1lUN3VieE1YVEptNkp3?=
 =?utf-8?B?RlRJTlN2MWR0b3VhY2V5NCt1Y0t6VHJJdlFrc0hxU1RPTFUyRldPeUxPM2Fo?=
 =?utf-8?B?aFlWTzlMMXo1QVZiL1hRQndlaFJYdEY2ZHpkY2ZMMEtTWVpqRE1GMll1UGxn?=
 =?utf-8?B?dmZqUlBaMXVMOXBXNGYxWGwzZzI4aXBXK2lKN3VrTWoweW5EellKMmZnRFhw?=
 =?utf-8?B?OUlVQmxCSis3UWZ2MUN2QTFOYm5VcjJEdUQrVmFUZFRuY2YrTlpmVFcvWjdQ?=
 =?utf-8?B?WTVIRklESWJiV3VOa2dVYktnRHJlazhLZXRYb2F2OVZiVWxTd3pRVU1aSzI5?=
 =?utf-8?B?QjNVcmpkYjhyblNMMk9kV3V6cVlkZGhRckFXMjNscEVtaTZENTNKaUxCWm9a?=
 =?utf-8?B?eC9KNzdVRnRRQ3VHZUtOcnFKdHlDMitxMjVHcm0rakdnZVhMOE5nWkpRZU9s?=
 =?utf-8?B?YkZqcjRpT3cvN0lMdXhFOEg3eE1veUwxc1dFMXV5cWg0NXFlYVVwU1lKcHYr?=
 =?utf-8?B?SnZvSU1IalVicktjZDE1VWZ0NS9DUUs2N21ib2Zra0hnUE1kSHB4N2hOM3FE?=
 =?utf-8?B?T1JWMU8zZVcvcEc2NjZiZVN0WHh6dnhlM3B6cS9XNVB4eVA0T2VhRXZiRVpQ?=
 =?utf-8?B?eFI3QlNsOE1ZQklSRDZLNG8wc1E1bU1mcU5MZ0VrVDhsdkc1ZlFkNm9JVUpy?=
 =?utf-8?B?Q0xKWk1sL0xHeGhEVUdOZXVhdnVCSUJUKzBzWlJRcVhRdmpRVUxUM2ZoblRa?=
 =?utf-8?B?QzV1cklMTkMwOXFQQTNZa2lrRUlFbjJibVpKSnNzWU5Hd1NUTmhUUUJLWnVz?=
 =?utf-8?B?clJIVzBNck9HdjcwUzV3SjI0ZHlJUlZxM0NJWUZTaDA0OGtuejhMZTlaWXpG?=
 =?utf-8?B?WkV3a0ptdW5xYVV5cWpUZWlhaWtQR1ZIYUR0dlJFeHhtQVdBQXVucjg1dlBj?=
 =?utf-8?B?dDlTSDZwT1Zhck8wc0RWTHVndFpONWxkUDdKcmhnenRsb1Fqb1lYdXJ4MGJq?=
 =?utf-8?B?YWdseWdYaDJkZXFadURIc0tQeEQ3b1J3bXlXT2o5TFJmcTRuUUNHZHN2Vnc3?=
 =?utf-8?B?WG5UdVA4NXcwM2pwZjhtY1JLWHVFZzYxd1d1dEhqRVU4S2VEc2Myek8rak8z?=
 =?utf-8?Q?A+D1a/kiJtJK61JLVAlEblcpa?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 5cdd435e-c150-4431-a855-08de277dd121
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Nov 2025 15:10:46.5608
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: z2hgu3mtqRjJNHpFbNaVcCS75im6W5P5QksHRuifU6OBIrE7dqdS4KjW8NLARzSyYV1dIwwzr/weaQxDaf3jhw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR10MB6090
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 19 Nov 2025 15:11:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/226557

T0ssIEknbGwgdGFrZSBhIGxvb2sgdG9tb3Jyb3cuDQpQZXRlcg0KDQo+IC0tLS0tT3JpZ2luYWwg
TWVzc2FnZS0tLS0tDQo+IEZyb206IG9wZW5lbWJlZGRlZC1jb3JlQGxpc3RzLm9wZW5lbWJlZGRl
ZC5vcmcgPG9wZW5lbWJlZGRlZC0NCj4gY29yZUBsaXN0cy5vcGVuZW1iZWRkZWQub3JnPiBPbiBC
ZWhhbGYgT2YgU3RldmUgU2Frb21hbg0KPiBTZW50OiBXZWRuZXNkYXksIE5vdmVtYmVyIDE5LCAy
MDI1IDE2OjAyDQo+IFRvOiBNYXJrbywgUGV0ZXIgKEZUIEQgRVUgU0sgQkZTMSkgPFBldGVyLk1h
cmtvQHNpZW1lbnMuY29tPg0KPiBDYzogb3BlbmVtYmVkZGVkLWNvcmVAbGlzdHMub3BlbmVtYmVk
ZGVkLm9yZw0KPiBTdWJqZWN0OiBSZTogW09FLWNvcmVdW3NjYXJ0aGdhcF1bUEFUQ0ggMC85XSBn
byB0ZXN0cyBiYWNrcG9ydHMNCj4gDQo+IFVuZm9ydHVuYXRlbHkgSSdtIGdldHRpbmcgYSBsb3Qg
b2YgZmFpbHVyZXMgd2hlbiB0ZXN0aW5nIHRoaXMgc2VyaWVzDQo+IG9uIHRoZSBhdXRvYnVpbGRl
cjoNCj4gDQo+IGh0dHBzOi8vYXV0b2J1aWxkZXIueW9jdG9wcm9qZWN0Lm9yZy92YWxreXJpZS8j
L2J1aWxkZXJzLzI5L2J1aWxkcy8yNzQxDQo+IA0KPiBUaGV5IGFsbCBzZWVtIHRvIGJlIG9mIHRo
aXMgdHlwZToNCj4gDQo+IGh0dHBzOi8vZXJyb3JzLnlvY3RvcHJvamVjdC5vcmcvRXJyb3JzL0Rl
dGFpbHMvODg4NDg1Lw0KPiANCj4gU3RldmUNCj4gDQo+IE9uIFRodSwgTm92IDEzLCAyMDI1IGF0
IDQ6MjjigK9BTSBQZXRlciBNYXJrbyB2aWEgbGlzdHMub3BlbmVtYmVkZGVkLm9yZw0KPiA8cGV0
ZXIubWFya289c2llbWVucy5jb21AbGlzdHMub3BlbmVtYmVkZGVkLm9yZz4gd3JvdGU6DQo+ID4N
Cj4gPiBJJ20gd29ya2luZyBvbiBzY2FydGhnYXAvZ28gbWl4aW4gbGF5ZXIgd2hlcmUgSSBhbHNv
IHdhbnQgdG8gcnVuIHByb3BlciB0ZXN0cy4NCj4gPiBUaGlzIHNlcmllcyBtYWtlcyB0ZXN0aW5n
IGVxdWl2YWxlbnQgdG8gdGhhdCB3aGF0IGlzIGF2YWlsYWJsZSBvbiB0aGUgbWFzdGVyDQo+IGJy
YW5jaC4NCj4gPg0KPiA+IFRoZSB0d28gcGF0Y2hlcyBmcm9tIG1lIGFyZSBub3QgYmFja3BvcnRz
IHlldCwgYnV0IGFyZSBhbHJlYWR5IHN1Ym1pdHRlZC4NCj4gPg0KPiA+IEFsZXhhbmRlciBLYW5h
dmluICgxKToNCj4gPiAgIGdvYXJjaC5iYmNsYXNzOiBkbyBub3QgbGVhayBUVU5FX0ZFQVRVUkVT
IGludG8gY3Jvc3NzZGsgdGFzaw0KPiA+ICAgICBzaWduYXR1cmVzDQo+ID4NCj4gPiBPc2FtYSBB
YmRlbGthZGVyICgzKToNCj4gPiAgIGdvOiBhZGQgc2RrIHRlc3QNCj4gPiAgIGdvOiBleHRlbmQg
cnVudGltZSB0ZXN0DQo+ID4gICBnbzogcmVtb3ZlIGR1cGxpY2F0ZSBhcmNoIG1hcCBpbiBzZGsg
dGVzdA0KPiA+DQo+ID4gUGV0ZXIgTWFya28gKDIpOg0KPiA+ICAgb2VxYTogZml4IHBhY2thZ2Ug
ZGV0ZWN0aW9uIGluIGdvIHNkayB0ZXN0cw0KPiA+ICAgb2VxYTogZHJvcCB1bm5lY2Vzc2FyeSBk
ZXBlbmRlbmN5IGZyb20gZ28gcnVudGltZSB0ZXN0cw0KPiA+DQo+ID4gUm9zcyBCdXJ0b24gKDMp
Og0KPiA+ICAgdGVzdHNkazogYWxsb3cgdXNlciB0byBzcGVjaWZ5IHdoaWNoIHRlc3RzIHRvIHJ1
bg0KPiA+ICAgb2Uvc2RrOiBmaXggZW1wdHkgU0RLIG1hbmlmZXN0cw0KPiA+ICAgbGliL29lL2dv
OiBkb2N1bWVudCBtYXBfYXJjaCwgYW5kIHJhaXNlIGFuIGVycm9yIG9uIHVua25vd24NCj4gPiAg
ICAgYXJjaGl0ZWN0dXJlDQo+ID4NCj4gPiAgbWV0YS9jbGFzc2VzLXJlY2lwZS9nb2FyY2guYmJj
bGFzcyAgfCAgIDMgKw0KPiA+ICBtZXRhL2NsYXNzZXMtcmVjaXBlL3Rlc3RzZGsuYmJjbGFzcyB8
ICAgMyArDQo+ID4gIG1ldGEvbGliL29lL2dvLnB5ICAgICAgICAgICAgICAgICAgIHwgICA2ICst
DQo+ID4gIG1ldGEvbGliL29lL3Nkay5weSAgICAgICAgICAgICAgICAgIHwgICAzICstDQo+ID4g
IG1ldGEvbGliL29lcWEvZmlsZXMvdGVzdC5nbyAgICAgICAgIHwgICA3ICsrDQo+ID4gIG1ldGEv
bGliL29lcWEvcnVudGltZS9jYXNlcy9nby5weSAgIHwgIDY2ICsrKysrKysrKysrKysrKysrDQo+
ID4gIG1ldGEvbGliL29lcWEvc2RrL2Nhc2VzL2dvLnB5ICAgICAgIHwgMTA3ICsrKysrKysrKysr
KysrKysrKysrKysrKysrKysNCj4gPiAgbWV0YS9saWIvb2VxYS9zZGsvdGVzdHNkay5weSAgICAg
ICAgfCAgIDMgKy0NCj4gPiAgbWV0YS9saWIvb2VxYS9zZGtleHQvdGVzdHNkay5weSAgICAgfCAg
IDMgKy0NCj4gPiAgOSBmaWxlcyBjaGFuZ2VkLCAxOTcgaW5zZXJ0aW9ucygrKSwgNCBkZWxldGlv
bnMoLSkNCj4gPiAgY3JlYXRlIG1vZGUgMTAwNjQ0IG1ldGEvbGliL29lcWEvZmlsZXMvdGVzdC5n
bw0KPiA+ICBjcmVhdGUgbW9kZSAxMDA2NDQgbWV0YS9saWIvb2VxYS9zZGsvY2FzZXMvZ28ucHkN
Cj4gPg0KPiA+DQo+ID4NCj4gPg0K

