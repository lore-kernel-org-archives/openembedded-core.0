Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4511B1049518
	for <webhook@archiver.kernel.org>; Wed, 11 Mar 2026 09:33:45 +0000 (UTC)
Received: from OSPPR02CU001.outbound.protection.outlook.com (OSPPR02CU001.outbound.protection.outlook.com [40.107.159.45])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.17167.1773221620706774404
 for <openembedded-core@lists.openembedded.org>;
 Wed, 11 Mar 2026 02:33:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@siemens.com header.s=selector2 header.b=QEM6Thj7;
 spf=pass (domain: siemens.com, ip: 40.107.159.45, mailfrom: peter.marko@siemens.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wbjjgttvMwMj3kVYtajyaDFbUS9ow6wtcxlkcuxEeEyuePBzP7TGB12Qy+QYM9l58WyF4yztAqD/MAHMLVRRi5i5U3/GHIf6tz+rAyEOxxMWv5dfoxDKKvcHkNrhUrIl+ScC2io5i3gnsd5IU/UiPXzBtqAW9KI9juy7xFnZe0fvebv72cX0RG+M7/BkMRY4S99DS8rznYwfupr3U6lWEnS3s7IwGLYyanqqKbXEY120O6tKrZ0IxiqbVLhIfhydOEscGdgbxoXgr54LP+n/VrsKiClmvHeqNUATkH6ljLi/DB5RHe5ao3+tJEUkNGx2Dw56kRC8S1dPy3D/QHmmKw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tUUJobFWFPi1UQigf/MxK6LiOByYHQSqYxXoA5PhV+U=;
 b=eDX91titImks2YceJrTGWckFeFNbIeNBUatSNS7zLIfEKunCQRQXvfmzM3MGDq/zH3xLvqt7Adm8hzIJRQFVJUk2y8VIu7lpqNS5Amu39xyXok1euJIOKVQeLoEMwTSlRFSEnE199LCz1ATjw6OE03lodNdX1JIodkorI7mSxaseaWEkgYEv2m15lgRkRMbq+kk27Lrd6esVk9YgaubkQrNGJ9z1gmN17fhNuoBV5LcMev4wgHv8MyO5/O720t1W2V8cqb0n4kysxK3UJZ4vxTI8WVihkEzIDZx2VFKOyw7JiK1WQysIymEoTTnMzO7j8R2szso+QjH8yHTT3QeYcw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siemens.com; dmarc=pass action=none header.from=siemens.com;
 dkim=pass header.d=siemens.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siemens.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tUUJobFWFPi1UQigf/MxK6LiOByYHQSqYxXoA5PhV+U=;
 b=QEM6Thj7N5WBr+JhiIL3G08Hi3k49yLBtzBlfBDpc3o5JzB1L45DCh4NIWPl2sGOX67HFSXoudG4L3rF7cHLyuCQvb34mneGmHyN249LGa0iQ46s896Ea1FzGbnTGiLEOXf9Y8Sl9Lc6CoXC2bTMfJ2Q5zEtJbjv/v3odkT1DHN2lxRDjF8s4FUMgoJzAoxZSCCQYSgN9kBsApOAGDSa3aVEfxoDoMefR01E+it4UzaT7BeP+EqPfW6vKi2iCJWEKQFwAbmU8Ma6GD/GPOxO3vqirnIW7hWG9lJAQUehBkuZVrPsRPzHAoAMztBHZuBXP6K/0FAXfCAE1YCEje1dQQ==
Received: from AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:479::20)
 by AM6PR10MB9205.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:6d1::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9678.23; Wed, 11 Mar
 2026 09:33:36 +0000
Received: from AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::b54d:255a:1abf:2dc7]) by AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::b54d:255a:1abf:2dc7%6]) with mapi id 15.20.9700.010; Wed, 11 Mar 2026
 09:33:36 +0000
From: "Marko, Peter" <Peter.Marko@siemens.com>
To: "mail2szahir@gmail.com" <mail2szahir@gmail.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: RE: [OE-core] [scarthgap 03/11] ffmpeg: set status for CVE-2025-12343
Thread-Topic: [OE-core] [scarthgap 03/11] ffmpeg: set status for
 CVE-2025-12343
Thread-Index: AQHcsTbcxK9sDolji0WzWd2afRe3NbWpEPCg
Date: Wed, 11 Mar 2026 09:33:36 +0000
Message-ID: 
 <AS1PR10MB56976278971462FACDFCA9DAFD47A@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
References: <cover.1772923420.git.yoann.congal@smile.fr>
 <4cc6f4302483d227c2e26223da43b8811165febf.1772923420.git.yoann.congal@smile.fr>
 <360188.1773220189767290718@lists.openembedded.org>
In-Reply-To: <360188.1773220189767290718@lists.openembedded.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
 MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ActionId=ebf1fcf3-8ce0-4faa-ab45-6fcd712d5de6;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ContentBits=0;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Enabled=true;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Method=Standard;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Name=restricted;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SetDate=2026-03-11T09:30:21Z;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SiteId=38ae3bcd-9579-4fd4-adda-b42e1495d55a;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Tag=10,
 3, 0, 1;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siemens.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS1PR10MB5697:EE_|AM6PR10MB9205:EE_
x-ms-office365-filtering-correlation-id: ab743ab0-3a44-4035-7c1b-08de7f514533
x-ms-exchange-atpmessageproperties: SA
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|366016|376014|1800799024|38070700021|8096899003|18002099003|56012099003|22082099003;
x-microsoft-antispam-message-info: 
 MM/W08nQw1SweHbW3BhRrtIpyjOsE0Uicpp9gDvZbnNs/kUSzlRUGmkrHDWxrYEWwJeQT5gXeC0JDNXXwRZDkwA9JnyBkBNWAa5G2T1U2QEEc7jupUy/G9jXRxRSmivls90O8ALobio+z0MP63rbged+pzYCR/bJHLPraP5p5QxgotbTzbJibKE9CST68hc5BT8FSOrokKXt1IWHdLMQACLsOohT/hyZADzlzI3PcMyhoaIV/c4ycRgSbH8L1+/9DS/m5DNB2N01ZWZ3lhLfnfBpbk5SZNr0yJAvacMGnn+BGIQCCy3l+6PHzZY7FXIAyCJnRXFrMFthzTy0E19q0Az//H7JSawEwEV15Fgz4EcZpchWTGkJB/WwmL+zMMEhwNp4OLoTgfqE2OsJL5/tuC0/jk/uruTHSDxqWYdLH2/mnqddBYxGjoZI5sOdNopoyrnErTac0izXS7TJOSN9l6bqhW9m5HGxtEci/um54EaxzOOxQQTrAOzzVZErM2YhvnLD/ucclD++A2gBe8widKnMC14yaL70bRWeUHysU8nIGXYjBfmnYj5Vs0JaAWGWsH+Q/iFNxJ6S3y+CNVC2CHSNNzC2bgvcDSae4RImjU28DiTsY9lX8BFMENs74JKlDxAqZEQ9SXBDjviP/CPEJwuZg8Qb17Izpns3MaJg/O+6ir7l3BskspenO5WKEx/3GRu7DgIYtrOu5cr93mWAtQh88NafDorDfYkfiamBWBGjv7yL+Iy1F6sGQuRNMgeZdOlF4exEGQDf0aKIX/lojPJe8C0wRiVmOTbO6cTlPyY=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(38070700021)(8096899003)(18002099003)(56012099003)(22082099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?bVBWRjN6cHY1UU9KNk1EUVVYTlphZHR1cEdNakdXTlkvZEtSZWhxc045WG5G?=
 =?utf-8?B?RnRTNTgxeHFxOXByYTFodGJFdTBvM2JSQng2cmxwbzRBdEgyVFdQT01VOGtl?=
 =?utf-8?B?TGluM1JQR3B2WkhpaVRlQkszclV4K01ubXNSY1E5YWRVbGVFZG5lcFJUNlc3?=
 =?utf-8?B?Q2VWU3BxaGNrOWZWdHBBb015UDNmR0JDRm13cStlWTlyQWYvOE4vM2xQNVhK?=
 =?utf-8?B?VTdGTXBYaDJvVUljbWJRUXRwSTM5U1N1NnZtMHE3OENUeCtpdENaOTRNZi91?=
 =?utf-8?B?K2hIMHpZZEJyTXpwaTJGQTNxeGFrNGpYeTcrZDF4bHdKeFJDS3ROVmd3NHVM?=
 =?utf-8?B?bHV1WWdXSVVETUsrWWJqT0ZaMUQ3ditPKzdXNkdBRTRCWG9TU0JYUXhGNmhL?=
 =?utf-8?B?VmdJRlFFTks1RXpHZEJvUmN5b3RSdFdvNnVSbisxSWNQOU1WVFhpRDkvZFNv?=
 =?utf-8?B?ZnVSTkJ4R3lMZmJ4b3QzM3RPYkZmeXZGQzZiYi9rdzFrUWw1SUF6V0s2OUpC?=
 =?utf-8?B?WlpsL1YzeUFKekNFSFNtZ2RDY21FR2REUWxwL3lVZEdzekxoalIyaEgrKyta?=
 =?utf-8?B?V0FwSnUxbjN5aklpZllBbkdVUjJZNkFWd1N0ejFGN29laUlodVdWSXBHenVD?=
 =?utf-8?B?bE5uRTRyRGduSXlIZ1lYR00vNnBVdDBRaTZtN2Rtc0xQb2lqV1YydEZicHBS?=
 =?utf-8?B?UjBxVGV2amVWY2l0RjQ1Ums3aFpSWW40VHQ4WjRON2lyb3p4Zk9jblpnWUxi?=
 =?utf-8?B?WUVnelkrTXJJdUxiSzl0UldNT1ZWZTRTekFCdEE3aFVPZnBmMWxIczlnbXcw?=
 =?utf-8?B?VXFlUTNqb1lBWFBtRUhjTTBINHJMeE5LQUdZZHdhRStCMEtXUkx6SFlmcGt1?=
 =?utf-8?B?QVQ3aW0rRzJkNlZwU3czZC93RG5xdjgxNXRZQ0pjOUJuTVJKdVd3UXZRTWxl?=
 =?utf-8?B?eWFmSDZSbGJTQVN3c3NaT0JCQmp1OXIwMVB2YW9FNi96MjVGUG9HTnRoQ3J0?=
 =?utf-8?B?ZUNDNk0zeFFiTlZaYkRpSmR2MXZWZ0dqWXFmZjhPNDUyZmJNRTUra1dTbmg0?=
 =?utf-8?B?NWRKdEZDV2NkZXplcTJFY1MyUUNIVHVrS2dRaVdxM2FFazF2ZmxEdmhHc0U5?=
 =?utf-8?B?TE9kWHpnK2xQTm56SFZtMXMvRkJQb2RjRlNnMUNXQVlTZThLVzZjSmpFL3VW?=
 =?utf-8?B?VW9HRmUxbjJFNE9wcVJQNkg0a2QrYVpGVnd3ZmhCdERyT1E3UzBVUTI5cUQ5?=
 =?utf-8?B?TVhQUzJaa2Z0YXNyaFdzTWxRTitPdy94YUdwSFlIWHR3TjhVVlJibkFWUUFV?=
 =?utf-8?B?N3UxUGxsYUduK1dobys4ZHZJVDRzN20yU0Q2azZXNEZKSUdYeVIwY2lGMTd2?=
 =?utf-8?B?eXF6Z2VuUysvUzhZNGM5WE5CYXNiMU9TWTA5K0c0U21TVVpKTys5cjBONUxy?=
 =?utf-8?B?d3BPNWgrbjRacjY5cmMySjZ2K1Mza2tNUDd6cVVLZTdySEZoSnhHa3BXZVRt?=
 =?utf-8?B?YmR6RzFrUHRxQTJkbjFLZkRWd1FkRHc2czhNYTZTK1RueU5Gb2tUczJqbWFp?=
 =?utf-8?B?QzNteGZTeEFBS3lKdXdGOWVIU2tWWUZxUFE3NDBYbFBocjRURFNXYTF5eVVE?=
 =?utf-8?B?cHpiOWY0T3BZU2ZKVUpYamNLMnZiYlZSWEJoc2pFTHpxR053SmIzMFFYSFpw?=
 =?utf-8?B?RnI3NjRqdkV0ZmRpMnJvb0JRVER6YWFwQmJJRVBlOFlaZHg0ajhlcmpBdTk4?=
 =?utf-8?B?V3JsTFdyK1Bla0sxL016WHptYnViWldNbGFxSDFqRldkaEM4Z3ZMR2VYLzJ4?=
 =?utf-8?B?UFJ3VFloSGV0WHpZaVZ3anpRTEdYZjlwa3ZYdnRoQ3ZtUEREQWJWYXBRaVo5?=
 =?utf-8?B?NVFVN2wveEhUNFNKYXBvUGw2V3RUbmUvbnc3a0M3U250OVFvQTNuRlg5Nzhw?=
 =?utf-8?B?T2pNSy9JQmNORTNoNnI5N0dvb2UvTVUyKzhCZDVTbGQ4Mm5EQVNpUEhQWWZY?=
 =?utf-8?B?K3dlZGxqelVyUVlaRE1qejZUK0VURTByVFNCQ3hxTWFVaGd5NDJSK0pGR0M4?=
 =?utf-8?B?Q2M2SUJ4RHlnZnFnNW9BNmZtUG5MWDIyVUc2cnpaMDNYTGJOZ1NldDJwbVhj?=
 =?utf-8?B?MnkydU9pbG5CditmZVBxak50NXhNaHZXVHdoNE9PYkhJZWJCU3B0cmxrUFlt?=
 =?utf-8?B?djllZ1BEWTQvU25Wd3E3bE95QlV1UjlUYURDUDM4NHBnRkJNTDQzdkRRaGI2?=
 =?utf-8?B?ekNVUzYwbXBMemhrS1BxTmZXS1ZNTUZ3WnE1eldMY3RibFN4VHE1NERZTGdJ?=
 =?utf-8?B?Rzl5V1RhMHNFK2wvd2FNREFjRnR0QTVjTi9Cd3Z3T3M3Y0NEWUlrZz09?=
Content-Type: multipart/alternative;
	boundary="_000_AS1PR10MB56976278971462FACDFCA9DAFD47AAS1PR10MB5697EURP_"
MIME-Version: 1.0
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: ab743ab0-3a44-4035-7c1b-08de7f514533
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Mar 2026 09:33:36.2955
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: VCkfInC+PjVSIBYjvVMO1daoGh40ihnSo24ykeUaDg8jLKebl7F+sNk/IpICeysL4KiXaiIzdX3Dof4DJr4dXw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR10MB9205
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 11 Mar 2026 09:33:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/232851

--_000_AS1PR10MB56976278971462FACDFCA9DAFD47AAS1PR10MB5697EURP_
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

VGhhdOKAmXMgYSByZWN1cnJpbmcgcXVlc3Rpb24gYW5kIG15IGFuc3dlciB0byBpdCBpcyB1bmNo
YW5nZWQgLSBuby4NCkhvd2V2ZXIsIGZlZWwgZnJlZSB0byBjb250cmlidXRlIHRvIHRoYXQgZGly
ZWN0aW9uIHlvdXJzZWxmLg0KDQpQZXRlcg0KDQpGcm9tOiBvcGVuZW1iZWRkZWQtY29yZUBsaXN0
cy5vcGVuZW1iZWRkZWQub3JnIDxvcGVuZW1iZWRkZWQtY29yZUBsaXN0cy5vcGVuZW1iZWRkZWQu
b3JnPiBPbiBCZWhhbGYgT2YgYXN6aDA3IHZpYSBsaXN0cy5vcGVuZW1iZWRkZWQub3JnDQpTZW50
OiBXZWRuZXNkYXksIE1hcmNoIDExLCAyMDI2IDEwOjEwDQpUbzogb3BlbmVtYmVkZGVkLWNvcmVA
bGlzdHMub3BlbmVtYmVkZGVkLm9yZw0KU3ViamVjdDogUmU6IFtPRS1jb3JlXSBbc2NhcnRoZ2Fw
IDAzLzExXSBmZm1wZWc6IHNldCBzdGF0dXMgZm9yIENWRS0yMDI1LTEyMzQzDQoNCkhpIFBldGVy
LA0KDQpBcyB5b3UgbWVudGlvbmVkLCB0aGVzZSBDVkVzIGRvIG5vdCBhZmZlY3QgdmVyc2lvbiA2
LjEueC4gWW91IHZlcmlmaWVkIHRoaXMuDQpIb3dldmVyLCBpbnN0ZWFkIG9mIGRvaW5nIHRoZXNl
IGNoYW5nZXMgaGVyZSwgY291bGQgd2UgcmVxdWVzdCB0aGF0IHRoZSBOVkQgZGF0YWJhc2UgYmUg
dXBkYXRlZD8NCg0KVGhhbmtzIGFuZCByZWdhcmRzLA0KWmFoaXINCg==

--_000_AS1PR10MB56976278971462FACDFCA9DAFD47AAS1PR10MB5697EURP_
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: base64

PGh0bWwgeG1sbnM6bz0idXJuOnNjaGVtYXMtbWljcm9zb2Z0LWNvbTpvZmZpY2U6b2ZmaWNlIiB4
bWxuczp3PSJ1cm46c2NoZW1hcy1taWNyb3NvZnQtY29tOm9mZmljZTp3b3JkIiB4bWxuczptPSJo
dHRwOi8vc2NoZW1hcy5taWNyb3NvZnQuY29tL29mZmljZS8yMDA0LzEyL29tbWwiIHhtbG5zPSJo
dHRwOi8vd3d3LnczLm9yZy9UUi9SRUMtaHRtbDQwIj4NCjxoZWFkPg0KPG1ldGEgaHR0cC1lcXVp
dj0iQ29udGVudC1UeXBlIiBjb250ZW50PSJ0ZXh0L2h0bWw7IGNoYXJzZXQ9dXRmLTgiPg0KPG1l
dGEgbmFtZT0iR2VuZXJhdG9yIiBjb250ZW50PSJNaWNyb3NvZnQgV29yZCAxNSAoZmlsdGVyZWQg
bWVkaXVtKSI+DQo8c3R5bGU+PCEtLQ0KLyogRm9udCBEZWZpbml0aW9ucyAqLw0KQGZvbnQtZmFj
ZQ0KCXtmb250LWZhbWlseToiQ2FtYnJpYSBNYXRoIjsNCglwYW5vc2UtMToyIDQgNSAzIDUgNCA2
IDMgMiA0O30NCkBmb250LWZhY2UNCgl7Zm9udC1mYW1pbHk6Q2FsaWJyaTsNCglwYW5vc2UtMToy
IDE1IDUgMiAyIDIgNCAzIDIgNDt9DQpAZm9udC1mYWNlDQoJe2ZvbnQtZmFtaWx5OkFwdG9zO30N
Ci8qIFN0eWxlIERlZmluaXRpb25zICovDQpwLk1zb05vcm1hbCwgbGkuTXNvTm9ybWFsLCBkaXYu
TXNvTm9ybWFsDQoJe21hcmdpbjowaW47DQoJZm9udC1zaXplOjEyLjBwdDsNCglmb250LWZhbWls
eToiQXB0b3MiLHNhbnMtc2VyaWY7fQ0Kc3Bhbi5FbWFpbFN0eWxlMTgNCgl7bXNvLXN0eWxlLXR5
cGU6cGVyc29uYWwtcmVwbHk7DQoJZm9udC1mYW1pbHk6IkFyaWFsIixzYW5zLXNlcmlmOw0KCWNv
bG9yOndpbmRvd3RleHQ7DQoJZm9udC13ZWlnaHQ6bm9ybWFsOw0KCWZvbnQtc3R5bGU6bm9ybWFs
Ow0KCXRleHQtZGVjb3JhdGlvbjpub25lIG5vbmU7fQ0KLk1zb0NocERlZmF1bHQNCgl7bXNvLXN0
eWxlLXR5cGU6ZXhwb3J0LW9ubHk7fQ0KQHBhZ2UgV29yZFNlY3Rpb24xDQoJe3NpemU6OC41aW4g
MTEuMGluOw0KCW1hcmdpbjoxLjBpbiAxLjBpbiAxLjBpbiAxLjBpbjt9DQpkaXYuV29yZFNlY3Rp
b24xDQoJe3BhZ2U6V29yZFNlY3Rpb24xO30NCi0tPjwvc3R5bGU+DQo8L2hlYWQ+DQo8Ym9keSBs
YW5nPSJFTi1VUyIgbGluaz0iIzQ2Nzg4NiIgdmxpbms9IiM5NjYwN0QiIHN0eWxlPSJ3b3JkLXdy
YXA6YnJlYWstd29yZCI+DQo8ZGl2IGNsYXNzPSJXb3JkU2VjdGlvbjEiPg0KPHAgY2xhc3M9Ik1z
b05vcm1hbCI+PHNwYW4gc3R5bGU9ImZvbnQtc2l6ZToxMC4wcHQ7Zm9udC1mYW1pbHk6JnF1b3Q7
QXJpYWwmcXVvdDssc2Fucy1zZXJpZiI+VGhhdOKAmXMgYSByZWN1cnJpbmcgcXVlc3Rpb24gYW5k
IG15IGFuc3dlciB0byBpdCBpcyB1bmNoYW5nZWQgLSBuby48bzpwPjwvbzpwPjwvc3Bhbj48L3A+
DQo8cCBjbGFzcz0iTXNvTm9ybWFsIj48c3BhbiBzdHlsZT0iZm9udC1zaXplOjEwLjBwdDtmb250
LWZhbWlseTomcXVvdDtBcmlhbCZxdW90OyxzYW5zLXNlcmlmIj5Ib3dldmVyLCBmZWVsIGZyZWUg
dG8gY29udHJpYnV0ZSB0byB0aGF0IGRpcmVjdGlvbiB5b3Vyc2VsZi48bzpwPjwvbzpwPjwvc3Bh
bj48L3A+DQo8cCBjbGFzcz0iTXNvTm9ybWFsIj48c3BhbiBzdHlsZT0iZm9udC1zaXplOjEwLjBw
dDtmb250LWZhbWlseTomcXVvdDtBcmlhbCZxdW90OyxzYW5zLXNlcmlmIj48bzpwPiZuYnNwOzwv
bzpwPjwvc3Bhbj48L3A+DQo8cCBjbGFzcz0iTXNvTm9ybWFsIj48c3BhbiBzdHlsZT0iZm9udC1z
aXplOjEwLjBwdDtmb250LWZhbWlseTomcXVvdDtBcmlhbCZxdW90OyxzYW5zLXNlcmlmIj5QZXRl
cjxvOnA+PC9vOnA+PC9zcGFuPjwvcD4NCjxwIGNsYXNzPSJNc29Ob3JtYWwiPjxzcGFuIHN0eWxl
PSJmb250LXNpemU6MTAuMHB0O2ZvbnQtZmFtaWx5OiZxdW90O0FyaWFsJnF1b3Q7LHNhbnMtc2Vy
aWYiPjxvOnA+Jm5ic3A7PC9vOnA+PC9zcGFuPjwvcD4NCjxkaXYgc3R5bGU9ImJvcmRlcjpub25l
O2JvcmRlci1sZWZ0OnNvbGlkIGJsdWUgMS41cHQ7cGFkZGluZzowaW4gMGluIDBpbiA0LjBwdCI+
DQo8ZGl2Pg0KPGRpdiBzdHlsZT0iYm9yZGVyOm5vbmU7Ym9yZGVyLXRvcDpzb2xpZCAjRTFFMUUx
IDEuMHB0O3BhZGRpbmc6My4wcHQgMGluIDBpbiAwaW4iPg0KPHAgY2xhc3M9Ik1zb05vcm1hbCI+
PGI+PHNwYW4gc3R5bGU9ImZvbnQtc2l6ZToxMS4wcHQ7Zm9udC1mYW1pbHk6JnF1b3Q7Q2FsaWJy
aSZxdW90OyxzYW5zLXNlcmlmIj5Gcm9tOjwvc3Bhbj48L2I+PHNwYW4gc3R5bGU9ImZvbnQtc2l6
ZToxMS4wcHQ7Zm9udC1mYW1pbHk6JnF1b3Q7Q2FsaWJyaSZxdW90OyxzYW5zLXNlcmlmIj4gb3Bl
bmVtYmVkZGVkLWNvcmVAbGlzdHMub3BlbmVtYmVkZGVkLm9yZyAmbHQ7b3BlbmVtYmVkZGVkLWNv
cmVAbGlzdHMub3BlbmVtYmVkZGVkLm9yZyZndDsNCjxiPk9uIEJlaGFsZiBPZiA8L2I+YXN6aDA3
IHZpYSBsaXN0cy5vcGVuZW1iZWRkZWQub3JnPGJyPg0KPGI+U2VudDo8L2I+IFdlZG5lc2RheSwg
TWFyY2ggMTEsIDIwMjYgMTA6MTA8YnI+DQo8Yj5Ubzo8L2I+IG9wZW5lbWJlZGRlZC1jb3JlQGxp
c3RzLm9wZW5lbWJlZGRlZC5vcmc8YnI+DQo8Yj5TdWJqZWN0OjwvYj4gUmU6IFtPRS1jb3JlXSBb
c2NhcnRoZ2FwIDAzLzExXSBmZm1wZWc6IHNldCBzdGF0dXMgZm9yIENWRS0yMDI1LTEyMzQzPG86
cD48L286cD48L3NwYW4+PC9wPg0KPC9kaXY+DQo8L2Rpdj4NCjxwIGNsYXNzPSJNc29Ob3JtYWwi
PjxvOnA+Jm5ic3A7PC9vOnA+PC9wPg0KPGRpdj4NCjxwIGNsYXNzPSJNc29Ob3JtYWwiPkhpIFBl
dGVyLDxicj4NCjxicj4NCkFzIHlvdSBtZW50aW9uZWQsIHRoZXNlIENWRXMgZG8gbm90IGFmZmVj
dCB2ZXJzaW9uIDYuMS54LiBZb3UgdmVyaWZpZWQgdGhpcy4mbmJzcDs8YnI+DQpIb3dldmVyLCBp
bnN0ZWFkIG9mIGRvaW5nIHRoZXNlIGNoYW5nZXMgaGVyZSwgY291bGQgd2UgcmVxdWVzdCB0aGF0
IHRoZSBOVkQgZGF0YWJhc2UgYmUgdXBkYXRlZD88YnI+DQo8YnI+DQpUaGFua3MgYW5kIHJlZ2Fy
ZHMsPGJyPg0KWmFoaXI8bzpwPjwvbzpwPjwvcD4NCjwvZGl2Pg0KPC9kaXY+DQo8L2Rpdj4NCjwv
Ym9keT4NCjwvaHRtbD4NCg==

--_000_AS1PR10MB56976278971462FACDFCA9DAFD47AAS1PR10MB5697EURP_--

