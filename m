Return-Path: <adrian.freihofer@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2E42FE6BF13
	for <webhook@archiver.kernel.org>; Fri, 30 Jan 2026 13:57:00 +0000 (UTC)
Received: from DB3PR0202CU003.outbound.protection.outlook.com (DB3PR0202CU003.outbound.protection.outlook.com [52.101.84.8])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.10831.1769781414131660868
 for <openembedded-core@lists.openembedded.org>;
 Fri, 30 Jan 2026 05:56:54 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@siemens.com header.s=selector2 header.b=O6pSjJ0d;
 spf=pass (domain: siemens.com, ip: 52.101.84.8, mailfrom: adrian.freihofer@siemens.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Pstpx3jL3Q8r9EqKVEfGrQgcVW20k+2JpoIFSgMn/lkJUu+0WIQCqF0Y6KJwYy3x1poMh9Wm+sWy5mZHt50rB+iSphpOBcBlH+f0SgtuqNX1Zgr6fB1Co9Lp8C5NXuMyTyDRnEJAhbXSpAYKTie1KjKiZr+kQS8odaaYAPTc6k4GCb48O/1BsrkCxv1L3dgGFFgOAZyfn/WtSQZX0dFqdgBIDcLlzONzUJDGhY4eOJz7snESHKO0c3x1StSZjJC1sXf9DhWABYVvWqemZThQyIdHjh9eepPAAcN7qp2Uzw2cVPZ5UydYtR9OsdOKcLT+hDf9zgXekHs4T/xTruZ54w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MaJl+79u7QCV11GOiTLyHw/YpD/sShNPuf+ELqz5GYE=;
 b=t+vlPYnCfhSthqOPhWaDjUTH5AswprgEUKgbqPiB4QNHjuv0JBIGaCpul1WZ83Sq80X6IewKRoC/AJrqt4hSzQRrzclk496KglWyofj48rKbuk1NVUHkgcE7EuYCQcoXnyKxsK47hgqfL8hqencU6YrdiLvHbKWCSfn2JHKNFQv9umGasdx5STWPvBZW+Du2kUWy9q7g2ReFhv7NzhhHUK/ecptTM3/L+jAVdlZ++XzTJTF/CNN1lvUshhMAWNFqduPZZHij0Z6e9QAICI5NMs7sYKGYuM9p58FboZ6LHPenZgZzXdcrsYwqZKHXq4sYzX6oNvUhkMy2iaSlCR4tRw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siemens.com; dmarc=pass action=none header.from=siemens.com;
 dkim=pass header.d=siemens.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siemens.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MaJl+79u7QCV11GOiTLyHw/YpD/sShNPuf+ELqz5GYE=;
 b=O6pSjJ0dsdbIM6jXN+1J6AGWEzcsijKSaLI0pwFrcW57/1mMlcoSq/wcyuNXjf/P17g+ulzfIbkhXXcycAYY0BDcHUIAk23q06GyzirqHYySdemPP3mBUhlfd1KIXiX3mpwVsCPiah1ChyU6H1yG9bDXrtsL9FD0HxT4OJZ0W1zk5exw0zo4q5mBn8S+HKzakfeyyxT9jFTHsmwnpVFGv+2AEuY8eApuWTYggQGxKTYeHMY1rIc2e/8x07UnqmBrvYGgJP239Kb3sFatOZ4dbbbTBlIbg8ai+EVDFWX6G50zzyn2FmqWIhUCXbTWn6H7jFeHOZ7VihGoGShFDN7M0g==
Received: from AS1PR10MB5724.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:47f::8)
 by AM0PR10MB3329.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:208:185::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.11; Fri, 30 Jan
 2026 13:56:50 +0000
Received: from AS1PR10MB5724.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::d515:f4e4:e935:ee4f]) by AS1PR10MB5724.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::d515:f4e4:e935:ee4f%4]) with mapi id 15.20.9564.006; Fri, 30 Jan 2026
 13:56:50 +0000
From: "Freihofer, Adrian" <adrian.freihofer@siemens.com>
To: "Marko, Peter" <Peter.Marko@siemens.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH 0/2] fix bug 16135 - useradd/groupadd debug
 output includes PATH
Thread-Topic: [OE-core] [PATCH 0/2] fix bug 16135 - useradd/groupadd debug
 output includes PATH
Thread-Index: AQHckb2RlEdHgqEo8U6me1Iwe8B5X7VqbuKAgABOMYA=
Date: Fri, 30 Jan 2026 13:56:50 +0000
Message-ID: <7b5b1150b57a0264708faafd2e45693aa7eec098.camel@siemens.com>
References: <20260130075333.940897-1-adrian.freihofer@siemens.com>
	 <AS1PR10MB5697329513C17C6B6199FB66FD9FA@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
In-Reply-To: 
 <AS1PR10MB5697329513C17C6B6199FB66FD9FA@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
Accept-Language: en-US, de-CH
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.56.2 (3.56.2-2.fc42) 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siemens.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS1PR10MB5724:EE_|AM0PR10MB3329:EE_
x-ms-office365-filtering-correlation-id: 3bedbb75-4244-4b1b-0400-08de60076ac6
x-ms-exchange-atpmessageproperties: SA
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|1800799024|366016|376014|7053199007|38070700021;
x-microsoft-antispam-message-info: 
 =?utf-8?B?N2ZOaEdnaEt6dmZhOHpLQjY1SW90T1ZTV3hzcllqb0M4YktUNXF2MkN4NmVW?=
 =?utf-8?B?ZkRNUzhYUHpxcUx6SmdTY2FtTUQzTmV5U3IrOHduVHJIMWI2dzZUbGVTVHVy?=
 =?utf-8?B?S0lWQzZVMjJpZVdKRUtVL28wY0JVY09OWXY3eVpHRzJDdlhaUXg5UU9nYVlR?=
 =?utf-8?B?V1F5SW5rS3hoQnp3SXdHZ3JKWmd0bEdVUFp2R1BwOFVGcWs4ZFVMWVphQ2dv?=
 =?utf-8?B?NXVVS0tLdDUxaTB2Q1NBQVBsUGlFMDVMYVcwNGQxNGJ2RGs4WjNSdkYxa0VS?=
 =?utf-8?B?Zlh6ZUpNMWFBdng5UzVXdTRBUVhIODNPTGJmTEMzV2V4RXJESk5STTBYdko2?=
 =?utf-8?B?cnZGaTFaZkUvMXdmZnlYcThkbVlTclZVMFlCTGJqTHFPM2hmK09ydTRnMDdy?=
 =?utf-8?B?OFpTRUhwaVFwYzBDZlZqQXVEQk5UbkpZOUhZeExYSVJ1VGdFbmx3cmttaVpj?=
 =?utf-8?B?cnFnMTgyRDY0eWRnMVRHQ2dUZlRWZDdrWlQ2ZERuVTFqR3c1VEpzbXlDOTlt?=
 =?utf-8?B?M1psWTlxRmM0cFhyc0xQNDlCYzFnZmJMZnNGbXJrWXhmaXYxaU9NbzF1WElo?=
 =?utf-8?B?bUx4am5lMGVBb0s4ZkJwTTV4cVE4VnRNRHZ2SVE3QlhTT21WOTZsRitSbU9O?=
 =?utf-8?B?dDhUU2NzbG5aRU1hY1R2YmY1MjlXMmZGNmJ0QzRsMlVoNmdYb3FwSG5uay9D?=
 =?utf-8?B?NjNFZ2U0TEZwc05YaFdqL2Y2dzdML1BQZDdxQmNwRVhYSHZmZ1dVRmJWaXFS?=
 =?utf-8?B?VWVLQWpYQWwxM1AyZmZtOTFkUFBOSjdWbmZvNzVUZitTRy9nUmhxcFpMWHVN?=
 =?utf-8?B?czZ4OUtFNmorU3VrbHpKOTdKS05qN21ZOUxURG1NWXMxa1JETkwzcnkvd3Ex?=
 =?utf-8?B?eWxrdkFHWDh2bHdPZnZJUGgxRXJwUktCc2JFdFdzSnQ4VGFVcDdFL0V2Wis1?=
 =?utf-8?B?dDZtZkFBYmpCOW1XTVI1aU8zRkwyNU5KNm5mOHZUVEFsU2dZM0dWWmdEdGpw?=
 =?utf-8?B?WFNtN3pPYVIxbzRwOE42RjBhNmhsWStzNEp3WmdXREVORGNDeEhvaklYSDdC?=
 =?utf-8?B?dlZZNjgzWnBXWktTS3dpcEtMZEw4VWpMVVZuWENuT2NSN0RGR3JBZWN4emhl?=
 =?utf-8?B?YThtUHBLK0FJR3ZWbGxXbkYyS05UNyt4U3hwRFRrOXpVMGxEQ28wYUF3eWZY?=
 =?utf-8?B?NjZ6UHJuZzZBajNhMEtMN1JUTFdwN0NtOW5WcXdBdHZTY1ZZbytNUjZEaGFY?=
 =?utf-8?B?aUpLbnJJSWo1bmpYc2pQZWlTK2QrWnhYemR2RFhTaFFHVnBVQlo3YWRyWHJ1?=
 =?utf-8?B?aGdvZjJxZ1ZqSlZRN0N0UzNhVlNUL2NyMHFkZGJWdTlob2FlYUx3R21VaTFL?=
 =?utf-8?B?Qm1qRUNNR3lGbWllMDRmTDFLdDN0QkJ3SDM3VWpkblpnSnFYMCttS2pGMXVE?=
 =?utf-8?B?YTFHNy9pNFJBMEw5bHhibmhkU3N2dXdsYmtKMHBIdHJjWnRDNmxRNUx3Q3pE?=
 =?utf-8?B?MjFURUZROWttTzFCQXJzcVNDdHpQRVFMNWxOWGx0S3lzcGlmQ2MzZDBUQVZP?=
 =?utf-8?B?RWVxaGVteVFmL040YkZCbjgvaVVXWVZkSHlaVU5pazZ3NGkrQWkwRzc3bHh0?=
 =?utf-8?B?RjcxVGVUcG0yaitKK1dzMUdhdmR2bDlnVXpGdVdJVG01NGo0TWJ0MWVRM1h0?=
 =?utf-8?B?c0xWNkVnOEM2SU00alVOQzJDL0NvVWh1aXowRnU1bUJSeExRS2dtZzdOeGlo?=
 =?utf-8?B?N2RRRVZzdDNZZHQyUUNseWEvb0xpUlM4VkM0eVVqaXFueVZ1WGFjaDFKaGwr?=
 =?utf-8?B?UnpxeTByWVlNd1BwSUVZam5uczBBUzdKVWhZNmZDMlp6ejdyaEwyL3daQTZN?=
 =?utf-8?B?L0syampuQjdEVUd6UjlRRXVLMm5NTnMvV3ExdGx5dndpTlh6dERhR2ZIR1N5?=
 =?utf-8?B?TmRlRlZpZlpmUGsxOUxmYWtCTFh6RTNqMG50SHRycS9FeDZBT1lib0lzTDk4?=
 =?utf-8?B?MXlkVzFPNUprOERJOHRtKzFUVVVQbmMrSEtCb0NudGoyczBXTW5JNVJkK1Zz?=
 =?utf-8?B?UEdQaDQwQXJ4SmRHcmJtWGF4azR5MHZLM1VJYjF5L25Jcmlaem8xbHNsZmZD?=
 =?utf-8?Q?4Pr+ONw5HwfibQve+D8I5o836?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS1PR10MB5724.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7053199007)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?Tk5JQlZmOHpiWHBzaytKNXRNUEJzd003UXJJWUIwbnRyZEYyZ1dHdGNscU04?=
 =?utf-8?B?SEpoemlQRzVOMkkrR1RhZ1lvUWxaTXpzaldzempWYkhBT1BIcU1paWFzcDBm?=
 =?utf-8?B?QzdUdWRhZWlQRGErbldtVWYvQ1hWU0tyY0RRcmFRMGF0aGhObnYwUHhqbnBJ?=
 =?utf-8?B?cklvSUpFQkZzaTUzd21iV1pQUTVzVndaaXBKdDJiRktVZXVsVDNzODVPLzg4?=
 =?utf-8?B?REp0YThyNGYxK2JuRXdMSVV4bi8rbkRoSk1ZWG8wMFBxWGlJQjhOcVpOZHJL?=
 =?utf-8?B?ZnAvcW9WN1VzbHFSZ2dxWG9FbStpS1RiRGs0ayszSGp4SXdmS3AyWktlRGxW?=
 =?utf-8?B?MnpJNWtOL2N3UWtwbm16RXByTXdUK1N1YThMUDI5YnlaamU3RTVvK0IzU3NL?=
 =?utf-8?B?ZGFubDhvMFUySjZOblZ0dmVDN0orSmg4ekpvVkwwRWhMWU1zOERFTEUyYnNO?=
 =?utf-8?B?K2VzdWZtNnNsaWErZU1FUVBtMWczYjYycG9KRDFlOUNxbnRtQXhPSlVKeVpC?=
 =?utf-8?B?VTFCTVB4dHJ5UTVuV2lLaUF5RjBKdmxmOVp5bjJOc2oxcDZOd25QUlg4R2wv?=
 =?utf-8?B?RWhhdlZ3bityWGZsbG5ObDVQNzJBMGN2Rkg0N00zazROOTk4Z0cvaGdSWksw?=
 =?utf-8?B?L3NXOW0yN0h1NnRwb2JjNFYwWExjL3ExZ1laaE1UY1RXZENPTzEwNXc5eDIz?=
 =?utf-8?B?SGtVRzl5cHVvakk1WVlZUkNxYmoweDIrNzZTdG1YRGNZclZGZDU5RytKVzJ6?=
 =?utf-8?B?c0RZL0VqTCtoc00zVUdtdTE2MzFnaDEyTzZnQ0U3QUFqeUsxckE0cU9SYThJ?=
 =?utf-8?B?OWFRVnpPMkRBekViMC9UK2dwSW4rQlhyQ2NNMTVaa25yRXJXMVBKNWZqd1Zr?=
 =?utf-8?B?VC9RejBjeDNEUzFZd1hWUHBtSFdrUGJPc2VZeVFYNEJhTERvK1U0VlNwWGI0?=
 =?utf-8?B?ZE5CYkR4OGFta085T1NHR0FyQlh1clJwZGJ5RTZxOFh2cUgyNE9nUU1haVk0?=
 =?utf-8?B?YUUwVTlUSzM1YWlUc1hueTFGemlQbE1YZ25iY3dJOEtsOGNvcUhVWDNlSWUx?=
 =?utf-8?B?dHdIVVhjR3lKeUx6VitrWjZyalRWaU5ZNHBWVjh1dTZyY3dLWkNIc3ZLNzJ0?=
 =?utf-8?B?b0JnektTUENXQkRtaWR6aFQ5NWx4Ri96RGpuaFYyM1l3WE9TQU9OZ0p5VzQz?=
 =?utf-8?B?ZEpGd1kwbkhoazU5QStySHZsTU9wWEhvcUZZK1NwUE1tSHN6NzZ6cnhhT1lV?=
 =?utf-8?B?a3NnWHcxOHY2V2dFZVZJcVE2VXdOR1c3Ri9pczZMd3ZvSm4rZ2RLM1dXY0Rs?=
 =?utf-8?B?WFZHQXpBRVhlM3NwNTN6UFUwUGhoWVBNSW0rbUZnY21zZU9ZREEzVVR4TkN5?=
 =?utf-8?B?ZEc5Q0RrUzdrR1p3MldidW5Xd1V4RHd2QzNsK1Q0emwzZWRVYVczTlA5OWpy?=
 =?utf-8?B?UVhsUW5YbVBQU3EwVDROSlBDbGJjaEp4NWRMNGwzNkVPVFBIRTJqVDE1OFBR?=
 =?utf-8?B?ZGQ4R0VSYS9VcUJGWUxVSDZ2Yit1dk1EQTB1a2dSOFI2OUpwU0FrcC9xOXJ2?=
 =?utf-8?B?aXkwd0JjbTZCcnhJOW4wTkM4dEpLSUQydlhQRTVsVFY4ZTRwY3R0OUtIaUxJ?=
 =?utf-8?B?TC9PZnJRb203VjROMmFILzBWaTZyQitBK0s2YnVaR296Z0FOOE5kSTlNYmk5?=
 =?utf-8?B?aytZbm8wNEVvM2p0bkZUMENKVjJXeFBUOFgzVlp4bE5rcWlkM2dyQ1lvS3Yr?=
 =?utf-8?B?elB0ZWxQVk5LL0Zhc1Z1WWhaQVdITWNoWkUwWFlMRk9vY3J3K2lUM2pSWE1p?=
 =?utf-8?B?RWhmTnNTV1BoSndpMUIxQ3drR3VsSVdHRk9QN09ZWmZjcTJ0cnlwRitmMk9J?=
 =?utf-8?B?MWFGbjVmS3lhK2NoVEZyVkpvNjdJaG41T01yYUVocGtXM2pLQ0FVZkZQMUVP?=
 =?utf-8?B?TGd3N3VJa0lmdnZ6MEEzTW1tamR2ei81OVkwZkRxd0JmNkNIUXJGUzNpSENt?=
 =?utf-8?B?eld3SENpNGM2R1N1NlI4bEhYSkhWdDZZMzN6c0srVG14aFRvdU5GODM4QndO?=
 =?utf-8?B?bERoZzBDRWNuSXFFclpubmFxa3VpQ1hlbEpSMXp5OFhObTUwTUpOMkUwOEF2?=
 =?utf-8?B?TG93dlNWdEh0WE5GVG5VdVBWQ2VOS0x6dWNtNTNUZzJHVGNZMWQ3ejBva2pM?=
 =?utf-8?B?WDN3MUpFWm96UWVobEJkcTRZVUgrUGc1dGpEODBhQlZIVEtsUWZQRGt1RmIx?=
 =?utf-8?B?eHV4a3ZBZXJrMzBHdC9idEtSeDN3VlRiUGhYajB1QnJ6bFczVWxOMm92NEt3?=
 =?utf-8?B?RXlEUzVrU3JNRlZVeG5JN2oxMkplN2lNUFRoTzVvTEpFajdjRm83dz09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <B65E3033522A344BA10D7308419B17D9@EURPRD10.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS1PR10MB5724.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 3bedbb75-4244-4b1b-0400-08de60076ac6
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Jan 2026 13:56:50.5560
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ynXJd7B0vJ1MBUd5haDQUIzyFfgtjuC1PzZRxIOuqAaTl/ZQV/bRsrxU2NbD0UOJIjR3udDWsqOgYw7PJCvBi43wGSDhixmnqgE7c4JPKnM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR10MB3329
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 30 Jan 2026 13:57:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/230198

T24gRnJpLCAyMDI2LTAxLTMwIGF0IDA5OjE2ICswMDAwLCBNYXJrbywgUGV0ZXIgKEZUIEQgRVUg
U0sgQkZTMSkNCndyb3RlOg0KPiBEb2VzIHRoaXMgYWxzbyBoYW5kbGUNCj4gaHR0cHM6Ly9idWd6
aWxsYS55b2N0b3Byb2plY3Qub3JnL3Nob3dfYnVnLmNnaT9pZD0xNTQ0NA0KPiAgPw0KPg0KDQpQ
cm9iYWJseSBub3QuDQpXaGF0IGl0IHNvbHZlcyBpcyBkb2N1bWVudGVkIGZyb20NCmh0dHBzOi8v
Y29kZS5zaWVtZW5zLmNvbS9jY3AvbWV0YS1zaWVtZW5zLy0vdHJlZS9tYWluL21ldGEtY2NwL3Jl
Y2lwZXMtY2NwL2NjcC1pbml0cmFtZnMtbW9kdWxlcy9jY3AtaW5pdHJhbWZzLXRlbGluaXQ/cmVm
X3R5cGU9aGVhZHMNCm9ud2FyZHMuDQoNClN1bW1hcnk6IFRoZXJlIGlzIGEgcmFjZSBjb25kaXRp
b24gd2hlbg0KYnVpbGQtc3lzcm9vdHM6ZG9fYnVpbGRfdGFyZ2V0X3N5c3Jvb3QgYW5kDQpidWls
ZC1zeXNyb290czpkb19idWlsZF9uYXRpdmVfc3lzcm9vdA0KcnVuIGluIHBhcmFsbGVsLg0KDQpC
dXQgaXQgZG9lcyBub3Qgc29sdmUgd2hhdA0KaHR0cHM6Ly9idWd6aWxsYS55b2N0b3Byb2plY3Qu
b3JnL3Nob3dfYnVnLmNnaT9pZD0xNTQ0NCNjMA0KZGVzY3JpYmVzLg0KDQpBZHJpYW4NCg0KDQo+
IEFsc28gZG9lcyB0aGlzIG5lZWQgZG9jdW1lbnRhdGlvbiB1cGRhdGU/DQo+IGh0dHBzOi8vZG9j
cy55b2N0b3Byb2plY3Qub3JnL3NpbmdsZWluZGV4Lmh0bWwjc2V0dGluZy11cC10aGUtZXh0ZW5z
aWJsZS1zZGstZW52aXJvbm1lbnQtZGlyZWN0bHktaW4tYS15b2N0by1idWlsZA0KPg0KPiBQZXRl
cg0KPg0KPiA+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+ID4gRnJvbTogb3BlbmVtYmVk
ZGVkLWNvcmVAbGlzdHMub3BlbmVtYmVkZGVkLm9yZyA8b3BlbmVtYmVkZGVkLQ0KPiA+IGNvcmVA
bGlzdHMub3BlbmVtYmVkZGVkLm9yZz4gT24gQmVoYWxmIE9mIEFkcmlhbiBGcmVpaG9mZXIgdmlh
DQo+ID4gbGlzdHMub3BlbmVtYmVkZGVkLm9yZw0KPiA+IFNlbnQ6IEZyaWRheSwgSmFudWFyeSAz
MCwgMjAyNiA4OjUzDQo+ID4gVG86IG9wZW5lbWJlZGRlZC1jb3JlQGxpc3RzLm9wZW5lbWJlZGRl
ZC5vcmcNCj4gPiBDYzogRnJlaWhvZmVyLCBBZHJpYW4gKFNJIEIgUFJPIFRJIEVBQyBDQ1ApDQo+
ID4gPGFkcmlhbi5mcmVpaG9mZXJAc2llbWVucy5jb20+DQo+ID4gU3ViamVjdDogW09FLWNvcmVd
IFtQQVRDSCAwLzJdIGZpeCBidWcgMTYxMzUgLSB1c2VyYWRkL2dyb3VwYWRkDQo+ID4gZGVidWcg
b3V0cHV0DQo+ID4gaW5jbHVkZXMgUEFUSA0KPiA+DQo+ID4gRnJvbTogQWRyaWFuIEZyZWlob2Zl
ciA8YWRyaWFuLmZyZWlob2ZlckBzaWVtZW5zLmNvbT4NCj4gPg0KPiA+IE1vcmUgZGV0YWlscyBh
cmUgYXZhaWxhYmxlIGF0DQo+ID4gaHR0cHM6Ly9idWd6aWxsYS55b2N0b3Byb2plY3Qub3JnL3No
b3dfYnVnLmNnaT9pZD0xNjEzNSNhZGRfY29tbWVudA0KPiA+DQo+ID4gQWRyaWFuIEZyZWlob2Zl
ciAoMik6DQo+ID4gICBidWlsZC1zeXNyb290czogU2VyaWFsaXplIG5hdGl2ZSBhbmQgdGFyZ2V0
IHN5c3Jvb3QgcG9wdWxhdGlvbg0KPiA+ICAgYnVpbGQtc3lzcm9vdHM6IEFkZCBzeXNyb290IHRh
c2tzIHRvIGRlZmF1bHQgYnVpbGQgYW5kIHJlbW92ZQ0KPiA+IHdhcm5pbmcNCj4gPg0KPiA+ICBt
ZXRhL3JlY2lwZXMtY29yZS9tZXRhL2J1aWxkLXN5c3Jvb3RzLmJiIHwgMTQgKysrKy0tLS0tLS0t
LS0NCj4gPiAgMSBmaWxlIGNoYW5nZWQsIDQgaW5zZXJ0aW9ucygrKSwgMTAgZGVsZXRpb25zKC0p
DQo+ID4NCj4gPiAtLQ0KPiA+IDIuNTIuMA0K

