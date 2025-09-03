Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 94967CA1012
	for <webhook@archiver.kernel.org>; Wed,  3 Sep 2025 22:31:55 +0000 (UTC)
Received: from OSPPR02CU001.outbound.protection.outlook.com (OSPPR02CU001.outbound.protection.outlook.com [40.107.159.52])
 by mx.groups.io with SMTP id smtpd.web11.25980.1756938711064399982
 for <openembedded-core@lists.openembedded.org>;
 Wed, 03 Sep 2025 15:31:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@siemens.com header.s=selector2 header.b=hIYJ2fxv;
 spf=pass (domain: siemens.com, ip: 40.107.159.52, mailfrom: peter.marko@siemens.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RKiDWWV26yWbIAWeBT4VX8MczEdMaUwOVTPa8guWKA/vZWWvvYcJe2kvZGU10BoA/ELgu0clKlpVE/Hf4NQfCqjL8LX7sN2Ws6gLKCLnPuSyjp9i08c/gJWlNa1sDiwm0RtkfVflbY941yrGzQC0wEmhpprLl9NHfgzE5WfMsgorwz/o0MeYfjmbHkh+Djcy2BPOJjDzuirKwJ2xQnQtu5zkCjnTYP8DJBJ1gL/JF4rA/GPSMEQfzWHFIrFjFJKeY+/jRGmltpl8qnlgLJPpqUCmEQAwfllF44MqA7xbQADsstsOdYArVLL/HpoRF/rmOd1i7FRjlrFAsPU0Oa1hVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=V2WCQMpw/M7nngXuhAGyQ0WTcWOTduKi4kN6Fh9qb2s=;
 b=sGyY8LpRBc/Xh3P9K1MjTLjpIUO9qXRbkVX9bAWzvHBtuuzIE/6gF7AT1QYxbDOoE4z0gaLlHSXgX5kYrmgW68ifuLu9tCRHjgush4tFAC3BmDP+F4GjO+wy3/njf5KSQI45iEpJjyf0nl/nn9cQD1OVXp69qUF3h34HhYFkE6/wGFYR4s2mJJQ6gzkReL6QQtq7GsZgAFJt/2ZPCXTxO+jhjSpoFd857l5v3SgpANQBPo6T7b58HVO3mdAkAqAWEudoqYF2b7nJDf671RKVCVUTlup+CSfOj9LZSEIch3jLcYoiD73PpP00Iwe1qPmjztrvpHeNyvsY7pKEKFu7zA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siemens.com; dmarc=pass action=none header.from=siemens.com;
 dkim=pass header.d=siemens.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siemens.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=V2WCQMpw/M7nngXuhAGyQ0WTcWOTduKi4kN6Fh9qb2s=;
 b=hIYJ2fxvihPcK+pWx4NMtN7KZM789ZoAj8G8bEIc2+Zyg0v1uH9qiC5q9dDADjBO5Q6X6XbPi7u+BRw9Z6Uyj+UkNWBLBQ1PeHh7Trt3c8l0TkDYAcERMM3ZPv3XbJuqq53DFftzm+7/R2rNtEXrfBOh5JoHiQEAe9EQfka4rFJeCG2w0eUUlEPMZ9SNAWbeP/uVgAvIi8L14U1HbIJj1wGhg250TmMcHF8G5gPJtRiLTF8VBPd2N6614mp6sv47W93dgPec43Z3XhpEcuFFXQ/EXr1u+AOZ/4+PsKHYticpW/sE47jsM58dWSDPd048k70Y+AqFfNofwYx9p0YArA==
Received: from AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:479::20)
 by DB8PR10MB3724.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:136::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.17; Wed, 3 Sep
 2025 22:31:47 +0000
Received: from AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::6c68:267b:6fd1:d3f2]) by AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::6c68:267b:6fd1:d3f2%7]) with mapi id 15.20.9073.026; Wed, 3 Sep 2025
 22:31:47 +0000
From: "Marko, Peter" <Peter.Marko@siemens.com>
To: Alexander Kanavin <alex.kanavin@gmail.com>
CC: "skandigraun@gmail.com" <skandigraun@gmail.com>, "gudni.m.g@gmail.com"
	<gudni.m.g@gmail.com>, "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>, Richard Purdie
	<richard.purdie@linuxfoundation.org>
Subject: RE: [OE-core] [PATCH] sqlite3: upgrade 3.48.0 -> 3.50.2
Thread-Topic: [OE-core] [PATCH] sqlite3: upgrade 3.48.0 -> 3.50.2
Thread-Index: AQHb8zZREI1ivBFi3UehS4AuBGSEqrQuh3SAgAABajCAT+drM4AAGxR3gAPR/HA=
Date: Wed, 3 Sep 2025 22:31:46 +0000
Message-ID: 
 <AS1PR10MB569744B33E963F3885412EC0FD01A@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
References: <20250712140638.3099109-1-gudni.m.g@gmail.com>
 <24850.1752329523627965940@lists.openembedded.org>
 <AS1PR10MB5697C5226761702F5C7B4E68FD4AA@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
 <1860EED7D31477F1.5475@lists.openembedded.org>
 <1860F3C42441CCDB.24627@lists.openembedded.org>
 <64ec9cce-9ae9-4d0b-8be7-e1d0bec144cd@gmail.com>
 <186124667AD72DDE.24627@lists.openembedded.org>
 <CANNYZj9EF2g-XXU2231P0pb5Bv+yBWpFwLQqcbeGdNFO9UFcmw@mail.gmail.com>
In-Reply-To: 
 <CANNYZj9EF2g-XXU2231P0pb5Bv+yBWpFwLQqcbeGdNFO9UFcmw@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
 MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ActionId=1dd5f202-0d3a-4261-9977-7f69121f56f4;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ContentBits=0;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Enabled=true;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Method=Standard;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Name=restricted;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SetDate=2025-09-03T22:27:09Z;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SiteId=38ae3bcd-9579-4fd4-adda-b42e1495d55a;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Tag=10,
 3, 0, 1;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siemens.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS1PR10MB5697:EE_|DB8PR10MB3724:EE_
x-ms-office365-filtering-correlation-id: fec5a992-f94d-42ea-dab1-08ddeb39aafd
x-ms-exchange-atpmessageproperties: SA
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|376014|1800799024|366016|38070700018|7053199007;
x-microsoft-antispam-message-info: 
 =?utf-8?B?SndkRkdCZ3EzV3J3S1pCY3NEK3A1dktTY3dpZlludTFFS1JwaVcwbHkxRDlQ?=
 =?utf-8?B?Q3hsZGlCUk4zRDExbWhxUDU2bEpvNzhCbm1PUXVhSVFwemFUbDQ4UVd5eWhS?=
 =?utf-8?B?VjYxbUwwbnJBSTdhbmN1LytOV2Mwdy83ajVNd0Q0a0NzWDR3MDJ3NVdCdGlI?=
 =?utf-8?B?My9GUk90MEQxU1dPSnorZVRjdWwvU0tDUlVoaGczYTBaeUZwUWFoTDdUNjk2?=
 =?utf-8?B?MWp1R0o3cDdlZ2FFTVFPU1Y1eDZiZDVLbFpLMjcwcWs3N2JESWZmKzdVNVhC?=
 =?utf-8?B?aGZZZWM2MnFhdUdybXp4N0hxc1RNMjhRdGMxZWJBWTBZaHhiM2JxeCtneVdP?=
 =?utf-8?B?a2lPbk04MURkeXR3OXpPVmFzNDByTFZMUkh4SUNFOGxsRVFJSzdiTXlSamsy?=
 =?utf-8?B?citEMFNnMUd0Mm1id3RFQUdRTVN1S2tYcXU3clZpZFQxUEtLd21jK0gxNGo3?=
 =?utf-8?B?Vy84anhuTmZtZU50cUV0NFRRc3NZUkJIVzdaWFpwSVlHNG1vWEkwMHBuR3Zn?=
 =?utf-8?B?bUFZaGpGdzM3OEZyNHVWejZDWE5GQWsxWmswNFcxSXgxQ0QxczFWSUg4WUpp?=
 =?utf-8?B?VHFCZExGTFcwMlR4RkI4TFV2Z3RBaHYwSFVSOWI5NUFCNllnYTNUU1lsSDZJ?=
 =?utf-8?B?S3crYzhXdFc0UzhwMEtKRUoxMGxYd2kzTVJYRnYxK1V2WFZhK0EvYll4Slcr?=
 =?utf-8?B?WGMwY0lWSU0rNkJwSFBhZm8rRTR0d0FQVGhpQU52YTNjU0xWMTJKMmZJNjNC?=
 =?utf-8?B?SEtGR0xxSDVvYk1ROHRLZUN2Smt4aGJ6Nk5jeTl5SWdYM2dYOE1PWjVFanI4?=
 =?utf-8?B?QlpVZGhiRGRheURhRFFsaXRWOHlLeEZMY0NQT0N2SW11R1d1VFRmV3luUGJ0?=
 =?utf-8?B?K3cyaW9HZld3R0QrQzZEOWJ6Q0ZxakVxaGtHMmZib2FRbTJXVFFDcG9aL1Rs?=
 =?utf-8?B?WjdQclFVeXFYd1pzUGdhQktYKzdUenV5bGRtM0FRbFdaaVFkenJRdkowbzVj?=
 =?utf-8?B?MlBDNGZ2aEZHallxSmoxcy9QL09pczRHSjVzQ2tuVXZwaFZSQXYzQjI3RmNC?=
 =?utf-8?B?eUFuZnpwUGNlSk9Bb0NUMW92U0VTTC8wbDkweTFZaTBEMS9pRjlLVHAwTldZ?=
 =?utf-8?B?SE1SVFl3M0Q1cE40QUZLUTR0eFEwNGNUY2VVMENyS2VoN0NFbDc5K2cxbGN5?=
 =?utf-8?B?N3QvektRMTNjbm5Ba2ZOT014SEFWM1dXWTFDQTRnbE9CcWhYakJyeHo3UTZl?=
 =?utf-8?B?dy8wdEhHK0F2N3U2UzgrdzU3Tno0M1ltOWgwb29JUy8wVE9JL0cvU2hjZm1t?=
 =?utf-8?B?bGJ0c3pHK05NWFB1WlJLSGtSYzdKVjV3cThFQXBxaS8wd1o5RWFjM2xlTjlS?=
 =?utf-8?B?K0hTZ2NEM2tKSjVLVjJZcnJ0ZjFyWVBxM3RURUliKzVQclBISE5Mbm4vUEhv?=
 =?utf-8?B?NVlsWlE1dXgvaEFRdGVsU1JuTSs5VGQ0eGdmZ3FaOVNGNmdiVkJ4bWpwR3ZI?=
 =?utf-8?B?VUtKeXVxZW9VUzJtSU01MktZVVZCT3FwR1N1WFhxOVY5RGVqUUtZT3d4SGhI?=
 =?utf-8?B?eU90c3lIV1BwUDQ2NW9ZOVVpY3VVbVRVRGxiTGIzd2xPWkd4OFJxdGJxY2Jj?=
 =?utf-8?B?Z2hFQnpYTk0zQzYrLzkzenN3RDRwMnRDN1BhRmx2c24wUE5xSWRqZkhkdExC?=
 =?utf-8?B?WjNzek92N0Jxa3BGTWZUYkNsckNUNXJFN1BVc2diMDVCUXFhd0JLcHRNZ2hU?=
 =?utf-8?B?aWdBb3RrS0xneEo2UUlETjNxcC9NK0p1cnBLaGx4aC9OVTduUkg3ZldvdVFN?=
 =?utf-8?B?OXF6bU5UU0lvcWk2UCs2Nit1N0RvMFRubFB1V1pqdzljSWwxdk9UaStQWEhz?=
 =?utf-8?B?ZHFXbXBPSjVOWlpJVDljcy9YZnZ1YmpkSXMwbE51VmpNQ0dRcWpJOFpNa3Ez?=
 =?utf-8?B?aENZNldnakZzVVVKL2NYUWpUaUlnQnl0SkpOVEVpakdMdFhuTW1GY1REcUp5?=
 =?utf-8?B?eDVkYytabkF3PT0=?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(38070700018)(7053199007);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?Qk9KZXFmREN4R3NHRlMzVm1NNUpZdklrTDNKejdqams4WExGUGg1KzNJOHRT?=
 =?utf-8?B?RFR6aXd0ZXc2cUxnTmphWEh4c0JDMUxDcGEwdUZrMkltWVZtRkhtMlRPSVFk?=
 =?utf-8?B?VHVQRmE5TUJGa2t2MW1jUWljd04xM0oyL2x6cnRtSTBuUE9HNmltQUw4Zm9N?=
 =?utf-8?B?anVIU1dHZlg5WkVUSzJYRWZYQlE2bHNCTEl4OHNrbTB1OTh3amxDdEFnbXBS?=
 =?utf-8?B?c3k0bGlMR0MxV1VOUFpTcVRDN1BKbm9vMkZJZmtwbDVoWG80aFc1R2tqSWZP?=
 =?utf-8?B?UWkxSDlySHhSaVo1OWlUanRPa1NGanZsdlQ2d05VVDR6dHNGUHM0SWNrbzRS?=
 =?utf-8?B?WFRwbjh0Wlg3MTUzNWhJVG1xZVRzUm55VzhaZ3ZzTS9DMmtQbUY4L3Y0TGty?=
 =?utf-8?B?RmYrVjRnZDVBUTRQekovZVNjRnRCNnJDOCtFdngvQUZlQ2hBZnNoRm8xUHpz?=
 =?utf-8?B?S2g4eUZNQlRnZnpmTVNwNlU2RzJLZXh1dXhtM1pNOWY3K0xHV0VpTGVEd3pH?=
 =?utf-8?B?NVZ0eTBwUndQYldIc1orNDN0MzV0dGNwMzdWblFYMGkrQVR2VFJZaGM5Uzdp?=
 =?utf-8?B?czAwa1BTdVQ5U3Z4Y043enBtK2lJRXh6WjNLUnhtL2N4Um1abngvalFQYmJO?=
 =?utf-8?B?SWI4emNoMDV3OFUyK0dOYUs0T0Y4dFZhc1JialNSU0dPdTU0bkNIVWFCaExP?=
 =?utf-8?B?MmpFOWxzMUc2Z3ZEaEpNTGpFMEtOaGwwUkR2dG04cEIyUGdyakI5WDlHQjRK?=
 =?utf-8?B?eTNWcHpCSHlMcVZ2cTk0OUZmeW1PQWowdmN0VWkwSEV6cEZZUks5MGc4QzFm?=
 =?utf-8?B?NVlyQXlVVHg0dGNad281S2o5YVlxMEROZ1ZqaStlN1M0ejVta0psY3FFVHM5?=
 =?utf-8?B?RWtBTGNaRlNlem1Lc0xqOUo2eTBSd3RDdDI4WjFvdXFIclBXMlRwSFZFUmVK?=
 =?utf-8?B?Vnk1ZDNtTnFWc3A2bFNuY040dENPU2k5ZGhQQXVTZVBXRlkxTE96M05TK0hv?=
 =?utf-8?B?Q0pKTFV6aXFpV1BSNGNDcFNvRDhRdXowWkMxOXR5bDFJOU5sb001bU1IK1FS?=
 =?utf-8?B?VkFBTlJSZXdMa3M2eFhwRG5sNy9GUk1sVmlWRytob0FTQ2QzdmIyOTAvNDJV?=
 =?utf-8?B?ZUJLTk1CWDYzUTZrenhod1lsd3R0eFVqSjFud0R3MFMvOWk3aXloNE1xVzVr?=
 =?utf-8?B?dTRuaUdVbzRJd1Zuemx1Yk9BeDZ0WksyYUllMXNjVmN3ZkpnUmo0clBqMzFr?=
 =?utf-8?B?NXhtTjN6T2RrWUprdmt0aVFIZnpqSDlkVy9NRWpqdHZxNGtDb0ZhWWVQT01S?=
 =?utf-8?B?ZU92dXdTbEgxdFRPcDNQRzFnTjN5cFJNOWdNWW0wTFIxMzJMYXh1Uk5NbTVH?=
 =?utf-8?B?SG9UNjdMaWlZN0lxMGM3Z1lhcU5zUGU2OXp6dExqdUhFRDdJRE1DR0d5WTJ4?=
 =?utf-8?B?S29zSytQV25ITFJxTlZZdWVYeFozeVdBNFVUWU04WThxQ21ueGVTdzFieDF3?=
 =?utf-8?B?eDZsTlpOUHNaL2x1TWhJYnJ2TGFBeXQ0dkpIS1ZiMjFML3o2OFhyZkgrd2gy?=
 =?utf-8?B?ekhOd01XazliVTh3dWNrNWJsZVBRWnh6ZkVYQjBHSUoxT1BUelNPd09BR3Ar?=
 =?utf-8?B?RUVCenJnUzNFdG03cEhPbk94cGE1MHp0UEJjSm1uUFdEZ1FMNmpqeVNXZ2VY?=
 =?utf-8?B?Ujk0QzN4MkgrZDhFWDdLbVhrVGttb1Z5L3h2alFtUmhKYWIrWGNOZ1BkTE5W?=
 =?utf-8?B?U3JDRFAwYXYrQ2lWS2l5UEovZS8rM2wrd04yZmhHa0xyNG9aSy9zYm9ySU4x?=
 =?utf-8?B?R0pNT0N5Qm5jS1lpZnVvQTZhZCtHSFlGeHp1M3NyWHpvTVFYTFZZQ3NhZGdQ?=
 =?utf-8?B?TVJyOU40MkF5VEU3eWFHckFIV2F3OUlCZHVEaWxGRmY0emI4Vm8zYTFIRm5z?=
 =?utf-8?B?bGxLb3U0SGJHOE1mQXhrZlVxR1ZqVnZGRmFad2xtTTlVUVVsMjZuOE4zTlpX?=
 =?utf-8?B?SmNPc2hkMXNqTDlhMTlBdXJNZTVqVDVkMDA0SXI1bENmOVJPZ25IcFdGUmE1?=
 =?utf-8?B?S0hlR1BmMjBhL3BpTEtDQXkxMVR4NDlwVGlVSVBHTHpON0thUGtpRnlvbHJr?=
 =?utf-8?Q?Pn+r+o7qWiD5bBVha6QWEE/5Z?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: fec5a992-f94d-42ea-dab1-08ddeb39aafd
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Sep 2025 22:31:47.0789
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 7rNEGYpIAbhuLq7pe1yvdt+LT2jwNOfb2rjp5STNRFvDZglHRf5+PsQN+hajjF7WVG/UYxMRxY1N5nzk1OKvMQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR10MB3724
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 03 Sep 2025 22:31:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/222884

SSBoYXZlIHNlbnQgYSBuZXcgdmVyc2lvbiB3aXRoIHNvbmFtZT1sZWdhY3kgd2hpY2ggbGlua3Mg
YWdhaW5zdCAuMC4NClNvIHRoZSB1cGRhdGUgc2hvdWxkIGhvcGVmdWxseSBmaW5hbGx5IHdvcmsg
bm93Lg0KDQpCdXQgb2YgY291cnNlLCB0aGUgc2V0c2NlbmUgYmVoYXZpb3IgaXMgc3RpbGwgc29t
ZXRoaW5nIHdoaWNoIHNob3VsZCBiZQ0KYW5hbHl6ZWQuIE1heWJlIGJ1Z3ppbGxhIHRpY2tldCBz
aG91bGQgYmUgcmFpc2VkIHRvIG5vdCBmb3JnZXQgYWJvdXQgaXQuDQoNClBldGVyDQoNCj4gLS0t
LS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogQWxleGFuZGVyIEthbmF2aW4gPGFsZXgu
a2FuYXZpbkBnbWFpbC5jb20+DQo+IFNlbnQ6IE1vbmRheSwgU2VwdGVtYmVyIDEsIDIwMjUgMTQ6
MDcNCj4gVG86IGFsZXgua2FuYXZpbkBnbWFpbC5jb20NCj4gQ2M6IHNrYW5kaWdyYXVuQGdtYWls
LmNvbTsgTWFya28sIFBldGVyIChGVCBEIEVVIFNLIEJGUzEpDQo+IDxQZXRlci5NYXJrb0BzaWVt
ZW5zLmNvbT47IGd1ZG5pLm0uZ0BnbWFpbC5jb207IG9wZW5lbWJlZGRlZC0NCj4gY29yZUBsaXN0
cy5vcGVuZW1iZWRkZWQub3JnOyBSaWNoYXJkIFB1cmRpZQ0KPiA8cmljaGFyZC5wdXJkaWVAbGlu
dXhmb3VuZGF0aW9uLm9yZz4NCj4gU3ViamVjdDogUmU6IFtPRS1jb3JlXSBbUEFUQ0hdIHNxbGl0
ZTM6IHVwZ3JhZGUgMy40OC4wIC0+IDMuNTAuMg0KPiANCj4gT24gTW9uLCAxIFNlcHQgMjAyNSBh
dCAxMzoxNSwgQWxleGFuZGVyIEthbmF2aW4gdmlhDQo+IGxpc3RzLm9wZW5lbWJlZGRlZC5vcmcg
PGFsZXgua2FuYXZpbj1nbWFpbC5jb21AbGlzdHMub3BlbmVtYmVkZGVkLm9yZz4NCj4gd3JvdGU6
DQo+ID4gVGhhdCBzYWlkLCBub24tZGV0ZXJtaW5pc3RpY2FsbHkgZmFsbGluZyB0aHJvdWdoIHRv
IHRoZSBob3N0IGxpYnNxbGl0ZQ0KPiA+IGlzIHdyb25nIGFzIHdlbGwsIGl0IGp1c3Qgd2Fzbid0
IHByZXZpb3VzbHkgZXhwb3NlZC4gV2UgbmVlZCB0byBmaWd1cmUNCj4gPiBvdXQgdGhpcyBvbmUg
Zmlyc3QsIGFuZCBmaXggaXQgcHJvcGVybHksIGFuZCBvbmx5IHRoZW4gYWRkcmVzcyB0aGUNCj4g
PiBwc2V1ZG8gbGlua2luZyBpc3N1ZSBhYm92ZS4NCj4gDQo+IEkgZm91bmQgYSBiZXR0ZXIgd2F5
IHRvIHJlcHJvZHVjZSBhbmQgb2JzZXJ2ZSB0aGlzLg0KPiANCj4gMS4gVGhlIGlzc3VlIGNhbiBi
ZSBzZWVuIGV2ZW4gd2l0aG91dCB0aGUgc3FsaXRlIHVwZGF0ZS4NCj4gDQo+IFJ1biAnYml0YmFr
ZSBnY2MtcnVudGltZScsIHRoZW4gZGVsZXRlIHRtcC8gdGhlbiBydW4gJ2JpdGJha2UgLWMNCj4g
cGFja2FnZSBnY2MtcnVudGltZScuDQo+IA0KPiBUaGVuIHRha2UgYSBsb29rIGF0IHRtcC9sb2cv
Y29va2VyL3FlbXV4ODYtNjQvY29uc29sZS1sYXRlc3QubG9nLCBhbmQNCj4gaXQgc2hvdWxkIGhh
dmU6DQo+IA0KPiBOT1RFOiBFeGVjdXRpbmcgVGFza3MNCj4gTk9URTogUnVubmluZyBzZXRzY2Vu
ZSB0YXNrIDEgb2YgMzA0DQo+ICh2aXJ0dWFsOm5hdGl2ZTovc3J2L3dvcmsvYWxleC9wb2t5L21l
dGEvcmVjaXBlcy0NCj4gZGV2dG9vbHMvcHNldWRvL3BzZXVkb19naXQuYmI6ZG9fcG9wdWxhdGVf
c3lzcm9vdF9zZXRzY2VuZSkNCj4gTk9URTogcmVjaXBlIHBzZXVkby1uYXRpdmUtMS45LjIrZ2l0
LXIwOiB0YXNrDQo+IGRvX3BvcHVsYXRlX3N5c3Jvb3Rfc2V0c2NlbmU6IFN0YXJ0ZWQNCj4gTk9U
RTogcmVjaXBlIHBzZXVkby1uYXRpdmUtMS45LjIrZ2l0LXIwOiB0YXNrDQo+IGRvX3BvcHVsYXRl
X3N5c3Jvb3Rfc2V0c2NlbmU6IFN1Y2NlZWRlZA0KPiBOT1RFOiBSdW5uaW5nIHNldHNjZW5lIHRh
c2sgMiBvZiAzMDQNCj4gKC9zcnYvd29yay9hbGV4L3Bva3kvbWV0YS9yZWNpcGVzLWRldnRvb2xz
L2djYy9nY2MtDQo+IHJ1bnRpbWVfMTUuMi5iYjpkb19wYWNrYWdlX3NldHNjZW5lKQ0KPiBOT1RF
OiBSdW5uaW5nIHNldHNjZW5lIHRhc2sgNCBvZiAzMDQNCj4gKHZpcnR1YWw6bmF0aXZlOi9zcnYv
d29yay9hbGV4L3Bva3kvbWV0YS9yZWNpcGVzLQ0KPiBkZXZ0b29scy9wc2V1ZG8vcHNldWRvX2dp
dC5iYjpkb19yZWNpcGVfcWFfc2V0c2NlbmUpDQo+IE5PVEU6IHJlY2lwZSBwc2V1ZG8tbmF0aXZl
LTEuOS4yK2dpdC1yMDogdGFzayBkb19yZWNpcGVfcWFfc2V0c2NlbmU6IFN0YXJ0ZWQNCj4gTk9U
RTogcmVjaXBlIGdjYy1ydW50aW1lLTE1LjIuMC1yMDogdGFzayBkb19wYWNrYWdlX3NldHNjZW5l
OiBTdGFydGVkDQo+IA0KPiBXaGljaCBtZWFucywgcHNldWRvIGlzIGluc3RhbGxlZCwgYnV0IG5v
dCBzcWxpdGUuIFRoZW4gdGFza3MgdGhhdA0KPiBkZXBlbmQgb24gcHNldWRvIHN0YXJ0IHJ1bm5p
bmcsIGFuZCB0aGV5IHNlZW0gdG8gd29yayBieSBoYXBweQ0KPiBjb2luY2lkZW5jZSAoZmFsbC10
aHJvdWdoIHRvIGhvc3Qgc3FsaXRlKS4NCj4gDQo+IDIuIFdpdGggdGhlIHNxbGl0ZSB1cGRhdGUs
IHRoYXQgZmFsbC10aHJvdWdoIGJyZWFrcyAod2l0aCB0aGUgc2FtZQ0KPiBjb21tYW5kIHNlcXVu
Y2UpOg0KPiANCj4gTk9URTogRXhlY3V0aW5nIFRhc2tzDQo+IE5PVEU6IFJ1bm5pbmcgc2V0c2Nl
bmUgdGFzayAxIG9mIDMwNA0KPiAodmlydHVhbDpuYXRpdmU6L3Nydi93b3JrL2FsZXgvcG9reS9t
ZXRhL3JlY2lwZXMtDQo+IGRldnRvb2xzL3BzZXVkby9wc2V1ZG9fZ2l0LmJiOmRvX3BvcHVsYXRl
X3N5c3Jvb3Rfc2V0c2NlbmUpDQo+IE5PVEU6IHJlY2lwZSBwc2V1ZG8tbmF0aXZlLTEuOS4yK2dp
dC1yMDogdGFzaw0KPiBkb19wb3B1bGF0ZV9zeXNyb290X3NldHNjZW5lOiBTdGFydGVkDQo+IE5P
VEU6IHJlY2lwZSBwc2V1ZG8tbmF0aXZlLTEuOS4yK2dpdC1yMDogdGFzaw0KPiBkb19wb3B1bGF0
ZV9zeXNyb290X3NldHNjZW5lOiBTdWNjZWVkZWQNCj4gTk9URTogUnVubmluZyBzZXRzY2VuZSB0
YXNrIDMgb2YgMzA0DQo+ICh2aXJ0dWFsOm5hdGl2ZTovc3J2L3dvcmsvYWxleC9wb2t5L21ldGEv
cmVjaXBlcy0NCj4gZGV2dG9vbHMvcHNldWRvL3BzZXVkb19naXQuYmI6ZG9fcmVjaXBlX3FhX3Nl
dHNjZW5lKQ0KPiBOT1RFOiBSdW5uaW5nIHNldHNjZW5lIHRhc2sgNCBvZiAzMDQNCj4gKC9zcnYv
d29yay9hbGV4L3Bva3kvbWV0YS9yZWNpcGVzLWRldnRvb2xzL2djYy9nY2MtDQo+IHJ1bnRpbWVf
MTUuMi5iYjpkb19wYWNrYWdlX3NldHNjZW5lKQ0KPiBFUlJPUjogQW4gdW5jYXVnaHQgZXhjZXB0
aW9uIG9jY3VycmVkIGluIHJ1bnF1ZXVlDQo+IFRyYWNlYmFjayAobW9zdCByZWNlbnQgY2FsbCBs
YXN0KToNCj4gICBGaWxlICIvc3J2L3dvcmsvYWxleC9wb2t5L2JpdGJha2UvbGliL2JiL3J1bnF1
ZXVlLnB5IiwgbGluZSAxNjYxLCBpbg0KPiBleGVjdXRlX3J1bnF1ZXVlDQo+ICAgICByZXR1cm4g
c2VsZi5fZXhlY3V0ZV9ydW5xdWV1ZSgpDQo+ICAgICAgICAgICAgXl5eXl5eXl5eXl5eXl5eXl5e
Xl5eXl5eDQo+ICAgRmlsZSAiL3Nydi93b3JrL2FsZXgvcG9reS9iaXRiYWtlL2xpYi9iYi9ydW5x
dWV1ZS5weSIsIGxpbmUgMTYyNywgaW4NCj4gX2V4ZWN1dGVfcnVucXVldWUNCj4gICAgIHJldHZh
bCA9IHNlbGYucnFleGUuZXhlY3V0ZSgpDQo+ICAgICAgICAgICAgICBeXl5eXl5eXl5eXl5eXl5e
Xl5eXg0KPiAgIEZpbGUgIi9zcnYvd29yay9hbGV4L3Bva3kvYml0YmFrZS9saWIvYmIvcnVucXVl
dWUucHkiLCBsaW5lIDIzMTcsIGluIGV4ZWN1dGUNCj4gICAgIHNlbGYucnEuc3RhcnRfZmFrZXdv
cmtlcihzZWxmLCBtYykNCj4gICBGaWxlICIvc3J2L3dvcmsvYWxleC9wb2t5L2JpdGJha2UvbGli
L2JiL3J1bnF1ZXVlLnB5IiwgbGluZSAxNDM3LCBpbg0KPiBzdGFydF9mYWtld29ya2VyDQo+ICAg
ICBzZWxmLmZha2V3b3JrZXJbbWNdID0gc2VsZi5fc3RhcnRfd29ya2VyKG1jLCBUcnVlLCBycWV4
ZWMpDQo+ICAgICAgICAgICAgICAgICAgICAgICAgICAgXl5eXl5eXl5eXl5eXl5eXl5eXl5eXl5e
Xl5eXl5eXl5eXl5eDQo+ICAgRmlsZSAiL3Nydi93b3JrL2FsZXgvcG9reS9iaXRiYWtlL2xpYi9i
Yi9ydW5xdWV1ZS5weSIsIGxpbmUgMTQwNiwgaW4NCj4gX3N0YXJ0X3dvcmtlcg0KPiAgICAgUnVu
UXVldWUuc2VuZF9waWNrbGVkX2RhdGEod29ya2VyLCB3b3JrZXJkYXRhLCAid29ya2VyZGF0YSIp
DQo+ICAgRmlsZSAiL3Nydi93b3JrL2FsZXgvcG9reS9iaXRiYWtlL2xpYi9iYi9ydW5xdWV1ZS5w
eSIsIGxpbmUgMTM2NSwgaW4NCj4gc2VuZF9waWNrbGVkX2RhdGENCj4gICAgIHdvcmtlci5zdGRp
bi53cml0ZShtc2cpDQo+IEJyb2tlblBpcGVFcnJvcjogW0Vycm5vIDMyXSBCcm9rZW4gcGlwZQ0K
PiANCj4gDQo+IDMuIEkgZG9uJ3QgeWV0IGtub3cgaG93IHRvIHNvbHZlIHRoaXMgZWl0aGVyLiBU
aGlzIHdpbGwgd29yaywgYnV0DQo+IGhhcmRjb2RlcyBwc2V1ZG8ncyBwYXJ0aWN1bGFyIGRlcGVu
ZGVuY2llcyBpbnRvIGEgbG9jYXRpb24gd2hpY2gNCj4gcmVmZXJzIG9ubHkgdG8gYSBnZW5lcmlj
IGZha2Vyb290IGltcGxlbWVudGF0aW9uOg0KPiANCj4gZGlmZiAtLWdpdCBhL21ldGEvY2xhc3Nl
cy1nbG9iYWwvYmFzZS5iYmNsYXNzIGIvbWV0YS9jbGFzc2VzLWdsb2JhbC9iYXNlLmJiY2xhc3MN
Cj4gLi4uDQo+IC0gICAgICAgIGQuYXBwZW5kVmFyRmxhZygnZG9fcGFja2FnZV9zZXRzY2VuZScs
ICdkZXBlbmRzJywgJw0KPiB2aXJ0dWFsL2Zha2Vyb290LW5hdGl2ZTpkb19wb3B1bGF0ZV9zeXNy
b290JykNCj4gKyAgICAgICAgZC5hcHBlbmRWYXJGbGFnKCdkb19wYWNrYWdlX3NldHNjZW5lJywg
J2RlcGVuZHMnLCAnDQo+IHZpcnR1YWwvZmFrZXJvb3QtbmF0aXZlOmRvX3BvcHVsYXRlX3N5c3Jv
b3QNCj4gc3FsaXRlMy1uYXRpdmU6ZG9fcG9wdWxhdGVfc3lzcm9vdCcpDQo+IC4uLg0KPiANCj4g
SSdtIGFmcmFpZCwgUlAgbmVlZHMgdG8gc3RlcCBpbiA6LS8NCj4gDQo+IEFsZXgNCg==

