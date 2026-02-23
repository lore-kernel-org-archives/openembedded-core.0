Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 54D09EC1117
	for <webhook@archiver.kernel.org>; Mon, 23 Feb 2026 17:49:43 +0000 (UTC)
Received: from AS8PR04CU009.outbound.protection.outlook.com (AS8PR04CU009.outbound.protection.outlook.com [52.101.70.36])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.510.1771868973306478573
 for <openembedded-core@lists.openembedded.org>;
 Mon, 23 Feb 2026 09:49:33 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@siemens.com header.s=selector2 header.b=R37gSU3K;
 spf=pass (domain: siemens.com, ip: 52.101.70.36, mailfrom: peter.marko@siemens.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=I9GuRWDzaTZi8bpnCxpqmM078Ba3nnTLFYqqni/YDpxMOhXV2w/7omBH+n54loI4qKaD8O2AUCJzNUmS0JBtfyVL8T4Of56JWBHn+FY1gTl5cWzXiXZLG5PBFRTOiiXZ+ARZU0rgl3FKTVkcXpF1OFiDfVWSwZyWost2h+ErkAs9t1xHpLyBcm66CCrQe1U13+a5dK/lODzpRG4miJR5FoR3IADUOG56wVOfkKF6LSjYJcqOUs0v9VhxEsua5c1b80v8EwfzqVunqCpF+KRBh20Vnpx8PYZk+XhZ9T4pst9uGGBsFXGT8txcvYl/l/E6iyR2DHTd5iv3OgZ53nJZRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5inooErvoG1amDpU4WauG2+FV9tvLkL1zdanqXosgi4=;
 b=Q94Tzy/OBZBcmfej5i1PqG9GBCaDOtteJtDtAc1gLZvgMUYpYGVsR30IQMYFLp2Um7ljIayu6yRglKvdf6FobtZZMMZWKgVXoqENpIRWVgPWN8kMm4N/oIQifUW3RwuGLW0i8tjqX22g2nTPKwjov1BgbpwHmWYDkO7woBdNPlfw0/RCmmOzcZurUywTJMe9dFB7ago+VPPtXBS/4ihy9qD+j0XA2t5Qa1qDYGXeAkkveTcRgmfHFzGn8H3mLqgR6Hhujh9Zw4BnVpLrV/zzxoFLWtYJkrxSOc8VJpLhFrE5K8kRSoye7AaWbyBWO1Sf1zEIFTbSwVl5qdjMHHgFbw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siemens.com; dmarc=pass action=none header.from=siemens.com;
 dkim=pass header.d=siemens.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siemens.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5inooErvoG1amDpU4WauG2+FV9tvLkL1zdanqXosgi4=;
 b=R37gSU3Ky1QzTFmeDRjekh5JnoQhvDd/f87vA7PdWHyUbwzKgekDTinkAHtIZ9nPbvCl1A+XSsBdTyT0HowCIiIiiq/tG4NkuA4KRKACBq121ICrsAtKSf2QI9DKBNk1J7rowOCWZpP9RqI6g0psmG/xjfNH62lgBINMtFTDQvt/qCwtx+ERu/MMT/IXOnMBQrYxZ7eoykWkpyX7Fu0uml4SjWID1WHk46JWxyBSa/lpve1hfSbBWzJ1wnOFwHxS9EV4S/eathEFCKuzCbenfErVAVAFcXCom1Wfecp33gfJwMjeE+UBpABEBqK9Y6AQ2QlfpaN+iv3aPhoDf5vqtQ==
Received: from AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:479::20)
 by DU0PR10MB5702.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:315::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.17; Mon, 23 Feb
 2026 17:49:29 +0000
Received: from AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::b54d:255a:1abf:2dc7]) by AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::b54d:255a:1abf:2dc7%6]) with mapi id 15.20.9632.017; Mon, 23 Feb 2026
 17:49:29 +0000
From: "Marko, Peter" <Peter.Marko@siemens.com>
To: "yoann.congal@smile.fr" <yoann.congal@smile.fr>,
	"colin.mcallister@garmin.com" <colin.mcallister@garmin.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: RE: [OE-core] [kirkstone][PATCH] ffmpeg: ignore CVE-2025-25469
Thread-Topic: [OE-core] [kirkstone][PATCH] ffmpeg: ignore CVE-2025-25469
Thread-Index: AQHcpOUiIUL8lqCKC0+fhLjncPw+w7WQgzyAgAALUBA=
Date: Mon, 23 Feb 2026 17:49:29 +0000
Message-ID: 
 <AS1PR10MB5697CEEA094ACB0543A1F3ADFD77A@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
References: <20260223165403.799551-1-colin.mcallister@garmin.com>
 <DGMI6FDG7CU2.1A5CLEIO7VN88@smile.fr>
In-Reply-To: <DGMI6FDG7CU2.1A5CLEIO7VN88@smile.fr>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
 MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ActionId=d72c614a-90dd-4d24-b52d-1415a7c08e24;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ContentBits=0;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Enabled=true;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Method=Standard;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Name=restricted;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SetDate=2026-02-23T17:45:16Z;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SiteId=38ae3bcd-9579-4fd4-adda-b42e1495d55a;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Tag=10,
 3, 0, 1;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siemens.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS1PR10MB5697:EE_|DU0PR10MB5702:EE_
x-ms-office365-filtering-correlation-id: 7d0959e9-dbf0-4d38-2521-08de7303e4fd
x-ms-exchange-atpmessageproperties: SA
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|376014|1800799024|38070700021;
x-microsoft-antispam-message-info: 
 =?utf-8?B?SkUwakNXRUJueUpzdk5PVm8vcklZb2FBTHEzRXdJSE9QaWFyZmNvNjBRazRZ?=
 =?utf-8?B?aDJ2ZHpMT0lCNXdpTFRoNDB6WldYTFZEM29TUkdqcUVoeTdINGFwQlBBNEhO?=
 =?utf-8?B?L1dWMjZXNS9idSs3d1NhTWYwaUIzaXpuaDVOcEdYeHM5THAweVMzUGRBNmJm?=
 =?utf-8?B?NTZCU09Ka0cxOU5OcVBxcUIvWmFxbkFMdzhTWHByZE1GUHRZQ1lIcHQ5aXpC?=
 =?utf-8?B?MmFZbDY0c3ZNdXEwUlRacWxJa1dGZnNwWnk5a3gzcno1WThGallXbzEzaTRr?=
 =?utf-8?B?SnVFcEJNNEROUGZwWmtNT3FxSHEzcTF6NmVWdmRTV3doZWt3SWtFM3VMN3JQ?=
 =?utf-8?B?a29CN20zK0lGZFIyZHF5c3JPUnkydUJBcjg2bEZYOEV2enhTOXB1VmM1ZjY5?=
 =?utf-8?B?UTFSNjVJQ1FtRy8yY2c3bmw4am55UzRVN0RKbEc4UzZzOWJuT1ZyalRTR1dp?=
 =?utf-8?B?dWxKTGRteFhBc0RPWmc1UDNEN1ptMFZrbjlhTzY2R094VGI0ZmJWZEU4WkVY?=
 =?utf-8?B?ZkZtYlVpM1hBdTZkSnhQTmJIc3lQczJaanE2NmZyQ1B5MGxFMytUakNDL2NE?=
 =?utf-8?B?WmgyMkxqN203WlZ1NnJwZVl2cmk1dmZuYmJHa2k4Q3gyT0QzcG5MbHpURS84?=
 =?utf-8?B?TlBBdW5vbThaWE1abUpMYnJ4N21JMEMxQmxubmowTXRDV0RMOG9DcmtLcjEx?=
 =?utf-8?B?VmI4eHFqcyswQTdKZWVlZ2crKzRmTXhRVlJSK05xRXR1VXFzSDZkQmlkOVUv?=
 =?utf-8?B?d3NsS2ZxcDVna3JrRGJ4KzNKdWsxTlJLeFdEUURESm1vZUs5WW41Z1JITld2?=
 =?utf-8?B?bkNScTJNTFVndEpsSWxuMXRCNTJlM0FScXNhWWovVlNVaGQrbVZhd09xeEds?=
 =?utf-8?B?MGxTaldMTm5PMG1NVDdNSC9lQnlTOHNXS3FKVS9WcGdFY1VUSjhObmtiR0Rz?=
 =?utf-8?B?dkxobWs4dTdDanVzakVhL3M5VlZnbktpSUVJeG5qWEk2eElnOGdpREZ2eXV5?=
 =?utf-8?B?bGpHSm1BSExKaHpYdHRCcmpPZDlWYm5wN0gxRk01RzA5djFSRkExMlJpTk4v?=
 =?utf-8?B?ZnFrOGJPTkhNQ1FyeU1qQzIzYUNXYmtDV2FmWHJTOC9Mc3cyOWJabUpncUFk?=
 =?utf-8?B?d3JTNTBDaE9Rb2ZaSS9ld1pKVllVNkVrYURmWXk2dktJZ1JneW9JMHY5amJt?=
 =?utf-8?B?K3BrRko1T1JnaWNkaTdPUG55VFZmeFY0R0NOa1ZkQ1NkTkFNYkdCbmhrNGZG?=
 =?utf-8?B?eDYwSGVrY3RkZGJ2ck4rVXNKOCtPT2I2V1hFQnMvM3owWHhkZm1WY3B6dnNj?=
 =?utf-8?B?SEs5N2FENVBiK0U3MDJVRDl5bmN5T3FEdVhoVFhaRm1CMmN6amNGckhTQnhO?=
 =?utf-8?B?SXpOUERMdGhUQ1p4SFI3dXV4N09lSzFZbDU5c0FKSXgvR01wN3VFa3d6MWlr?=
 =?utf-8?B?NWRFdFZKSndsR1lQZVhYdTU5QnRGM1A0czJWMXliRGZjNkhwYTM5eGVWOFB4?=
 =?utf-8?B?UHFjYTI4ZHNuZ2VTMWRNMG43UEpmR0FINVJBajByL3lSK2diL0RuMkdSMVZx?=
 =?utf-8?B?MlpIZkJ0VWhocjhva2Z1dzJsdlFQQVY0Tk9GR0hRK0grc0pqK254cWhHZ1NV?=
 =?utf-8?B?QmVtU1JJUnR4MSs4S0FWaW1ZdFVsaFBmczVwUm9COVYwdHB3eXZxamhuSWdY?=
 =?utf-8?B?NWc1QTh3cXR2eUZDQlRoTi9IeDVXUlBTWXFjWTlHRGFaQnlndUI0emZ4cU5T?=
 =?utf-8?B?NStjM09VK3lxSmNSQ3BXVDh1WnBMTWUzWGdzRUFVa2UzM0wzdjM2NkswV0V2?=
 =?utf-8?B?U0dTQWkram9VT0pWT29rZ0FuN3pxUU9hQnl4Sm55S0g3Nnk2L1Z6VzQ2WW5O?=
 =?utf-8?B?YmlJVW40TVNxWnAyeDB0dUlBVXZhVUJoVFV6Wnk3alFUcy9hMHBFTit3eTFF?=
 =?utf-8?B?b0R2aXIvNVJ3VTRwN09uaXI2MnFsVHZaemNZd1ptOXozQkFPcGJrbUU5T3Ba?=
 =?utf-8?B?eU5ON00zRFpkSUVzRnR5dzNoSGhlaWJGOEdHY25DK1V0bXdTRys4eVBobWpH?=
 =?utf-8?B?dVFxK3QwR01QWmhjcC9VRzM4cGR5SzFTTUs5ellxdWlQaEdybHRMelRXZk1M?=
 =?utf-8?Q?ACX3fo/XJBX9OtOnaCyyYdvav?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?Mm5vWTE4dC9Lc014cE1NVlBuY1cwYmJKckhrKzdjQU5hSmxIV0RxVm1wSFEw?=
 =?utf-8?B?SmNOV2Nqd2ZzNit5RkJJeXdaZ2hiYWl0bVNCS3JvMmJac3dUaXVuZ3B2YzV1?=
 =?utf-8?B?M1Z4a2VMZzhlakloWS85c0xOdkdFam5CN3VaemJoNjJmSlFSTmxXNUx3Z2ly?=
 =?utf-8?B?SkNFODNGUVNaWFdOYlFmcWpsTk43eTg0aC9YZElraWJtMkIvZ0JtSFBmYk5y?=
 =?utf-8?B?N0NON1ovNkFYalJIdVMxOWJmNnpvK3JJT3FGNUpYS1M0aWxJUnE5ZmZ5S3hv?=
 =?utf-8?B?SVZ1VnpRbld5TnVoakoxVVFWaW5SVGtMWWxlWWl0RThmUlVJWTdqTHpyNUNS?=
 =?utf-8?B?blFUMWVENDlvR25NR2pkcFVPbWxTSStUUEcrc1NTWXZPakFDV0x0d0hPem5L?=
 =?utf-8?B?alRGU1pnTlNEMTdJcTZZdjBxRDVWVmtVUWhUUE92UXNVcTB5OGxJeXB2N0Fq?=
 =?utf-8?B?RTRCa0RJQ3NTVzArVXJiV1pCZEFwY2pVbTY0UGhOUEZLck1DUS8vUTZLcEpN?=
 =?utf-8?B?UXZreFE5a25uZWo4bm5lMHozS0NpVHZ4QVh4Qi9jWVo5S2hvbXNuVFhLbEV2?=
 =?utf-8?B?WGdYTXc2TEptbnlmd2NmaTZhZkdkYmNJaTA3NnhaVmNSd2R5bEFQVnVHSjI0?=
 =?utf-8?B?Q0huV1NTS0xnTFA0K045T25ZTjlZRTF0eGxRMk1YYm5uaW1CNWI2YmxBU1BB?=
 =?utf-8?B?U3NlTWRkcVJUWmx5ZVo5Y25kMWxIZUoydll4a3B1OHhJRUhzSGZ3Rm1MRG1n?=
 =?utf-8?B?T01sVkFYNDA2eGFjU01ITnFLQkMycUtpcXVEOUtkU1AwSjJzdXhoeWo3d296?=
 =?utf-8?B?MlVNZE8rVTRWSVBjNnpKUTgzRGViM2JsUUJnTHp2OTBKOGdHVloxMm8xUUg1?=
 =?utf-8?B?bCtuK2dYMStHaGMvYkYxMitFcURzbVRaZVp5eDZVMjBGNnp2RWNDdXpGMUc5?=
 =?utf-8?B?SjBFUG9la3pJTVRWbVJ2ZEVTMlh4cGd0Y1pDLzJJWW5JRFY5Q0F6cXBSWSsx?=
 =?utf-8?B?QXEySlJvb1dRQTlkK2planZCTDUxN1Mzekc1ZC9yR1Y4aWV1ZzBYd3Z4SmtW?=
 =?utf-8?B?Tmdza1lTYmQyRGRadkNjZll5Yk1LWDhLNVB1WTUvQm4zOS9MYy8vUnZ1UjFE?=
 =?utf-8?B?S2QxRis4L3I2SFcxcDlablRwMjhlQVJTK3FSVTZQbDIwS2UzTHM5bS9GV1Zs?=
 =?utf-8?B?b2ZWMHlUelZLTEJEUE9hTDhmM2FlTXlkQUxCZDhMT0FpZU4vclRVbGlSK1RR?=
 =?utf-8?B?WHF1UlZUN0ZUbzZNSVN3TmdiR3UvWDBnSVBwYVNmTmEvMGQ1L0N1VnpHN25H?=
 =?utf-8?B?dy9xbmhkZXJYT0JYeXJPQzhzemdOVEtrN1dHZTI3UytoZDkvRTNueHh5U2tq?=
 =?utf-8?B?SWlaT0Q2cGw2aVRNd3dSZzk3c2lvbW82cTltK01FNW9HQk9JVEVuVFArUkd6?=
 =?utf-8?B?UmpRb084SXluN2lheDBBa3oxZk9tUHFqV3AvYkt0V2RhTktDRFFjaDh6d3Q5?=
 =?utf-8?B?N2tLb3dRQytIc0RGTVV1UWUwQUFMQ0xhKzgvbU8yZW5WMlA4MUllMWxLSEtH?=
 =?utf-8?B?RG8wR25GTVJPcWRtMFo5Zm40L3lpQjh5NkZBWngwMXhIekdpeFE3NjZ1OXcx?=
 =?utf-8?B?N0NzNHBVWVJvSmUvM0k5ZHRRWFV6eklURnYyMllHd1lUVjZlQWFVTGMwcmhj?=
 =?utf-8?B?TXVlMno2UjRqcmlWZEFYd0ZYM1Vyd0lrcmkyUUVrQzZUU1FUcjZNb3Y5ODRP?=
 =?utf-8?B?QnhYZGlHd0tsVEhzSUpkUlhzZEFxMWVMNCtTRjZhK2oyMEp2ZFNKREw1V3Zy?=
 =?utf-8?B?NWJxT1dpSlhjMzVsU1lNVEl5T2h3NVpmeFJ6eGNBMGZPczY0Y25YWjB0Vlo4?=
 =?utf-8?B?ZStqTkFNVE9nUldlTi9HL1pyZk0vQUlOdjNWN3JxalF2M1FDa0tSNENFaVZE?=
 =?utf-8?B?ODdmSE9WZ3FhY0hJQTMyTlpVdGdpYW1PU3JJRXpiRFg0OWFIREY2QjZ6aG0x?=
 =?utf-8?B?Q1RlUWViQW1OTTBBeTdvY0JoL0hrSjNFZ01SZkJXZXlwTkROWmhReW5USTFa?=
 =?utf-8?B?elE5OGt6WVU1akVkdVNibzNaYjlqTjhldkJvOVZzcG9QRzlkS21hSUZjMzNT?=
 =?utf-8?B?U1dFemtXeG1yRlJJVEZrdGxCSDJmL2pBUzRUeG1Sa1RMaU04ampPWXZNUmxo?=
 =?utf-8?B?MXo3U3gwKzVrcFRLd1VGVHJ1bnlxeG02VXA2cDlreGdTZm0vcnFpQnNVRkRT?=
 =?utf-8?B?Ty9lT3l3Y1hLSVZuNWhPU0Uyc0JMd0lhM0thNDhxcGlkbU5JQi9yNURNaVI1?=
 =?utf-8?B?d3loVVoyQ2NrQ3pQMHJzWW5ucGFlMi9Hd0FSWmtXc1RDaExGaUxVUT09?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 7d0959e9-dbf0-4d38-2521-08de7303e4fd
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Feb 2026 17:49:29.6603
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: +vBejC8KZU4reGZgFODts1Ue5nCJaYDcNm8G3w2bRgIU/XId+7wEHWbFkBUh4cPBxaPSe1bUhPrlvhUpUjJtFQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR10MB5702
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 23 Feb 2026 17:49:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/231686

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogb3BlbmVtYmVkZGVkLWNv
cmVAbGlzdHMub3BlbmVtYmVkZGVkLm9yZyA8b3BlbmVtYmVkZGVkLQ0KPiBjb3JlQGxpc3RzLm9w
ZW5lbWJlZGRlZC5vcmc+IE9uIEJlaGFsZiBPZiBZb2FubiBDb25nYWwgdmlhDQo+IGxpc3RzLm9w
ZW5lbWJlZGRlZC5vcmcNCj4gU2VudDogTW9uZGF5LCBGZWJydWFyeSAyMywgMjAyNiAxODowNQ0K
PiBUbzogY29saW4ubWNhbGxpc3RlckBnYXJtaW4uY29tOyBvcGVuZW1iZWRkZWQtY29yZUBsaXN0
cy5vcGVuZW1iZWRkZWQub3JnDQo+IFN1YmplY3Q6IFJlOiBbT0UtY29yZV0gW2tpcmtzdG9uZV1b
UEFUQ0hdIGZmbXBlZzogaWdub3JlIENWRS0yMDI1LTI1NDY5DQo+IA0KPiBPbiBNb24gRmViIDIz
LCAyMDI2IGF0IDU6NTQgUE0gQ0VULCBDb2xpbiBNY0FsbGlzdGVyIHZpYQ0KPiBsaXN0cy5vcGVu
ZW1iZWRkZWQub3JnIHdyb3RlOg0KPiA+IE1pc3NpbmcgZnJlZSBpbnRyb2R1Y2VkIGJ5IGNvbW1p
dCBkMzhmYzI1IGFuZCBmaXhlZCBieSBjb21taXQgZDU4NzNiZS4NCj4gPiBUaGUgZmlyc3QgdmVy
c2lvbiB0YWcgdGhhdCBjb250YWlucyBib3RoIGNvbW1pdHMgaXMgaW4gbjguMCwgc28gbm8NCj4g
PiBmZm1wZWcgcmVsZWFzZSBpcyB2dWxuZXJhYmxlLg0KPiA+DQo+ID4gU2lnbmVkLW9mZi1ieTog
Q29saW4gUGlubmVsbCBNY0FsbGlzdGVyIDxjb2xpbi5tY2FsbGlzdGVyQGdhcm1pbi5jb20+DQo+
ID4gQ2hhbmdlLUlkOiBJOTFmMGFhYWQ4ZGRjZmFhMmFjYWM1NDE0NzBhZWJjOWFiZTg4YjBkNA0K
PiBIZWxsbywNCj4gDQo+IFRoaXMgd2FzIGFscmVhZHkgc2VudDogaHR0cHM6Ly9sb3JlLmtlcm5l
bC5vcmcvb3BlbmVtYmVkZGVkLQ0KPiBjb3JlLzIwMjYwMjIwMTgzNDU0LjE2MzE1LTEtcGV0ZXIu
bWFya29Ac2llbWVucy5jb20vDQo+IA0KPiBJJ20gcmV2aWV3aW5nIHRoZSBraXJrc3RvbmUgcGF0
Y2hlcyBub3csIEkgd2lsbCBzZW5kIHRoaXMgc29vbi4NCg0KSGVsbG8gWW9hbm4sDQoNClRoYW5r
cyBmb3IgdXBkYXRpbmcgdGhlIGJyYW5jaC4NCg0KSSdtIG1pc3NpbmcgZm9sbG93aW5nIHBhdGNo
ZXMgZnJvbSBtZSBpbiBzdGFibGUva2lya3N0b25lLW51dA0KKiBodHRwczovL2xpc3RzLm9wZW5l
bWJlZGRlZC5vcmcvZy9vcGVuZW1iZWRkZWQtY29yZS9tZXNzYWdlLzIyOTM3Nw0KKiBodHRwczov
L2xpc3RzLm9wZW5lbWJlZGRlZC5vcmcvZy9vcGVuZW1iZWRkZWQtY29yZS9tZXNzYWdlLzIyOTM3
OA0KKiBodHRwczovL2xpc3RzLm9wZW5lbWJlZGRlZC5vcmcvZy9vcGVuZW1iZWRkZWQtY29yZS9t
ZXNzYWdlLzIyOTkzOA0KQWxzbyBmb2xsb3dpbmcgcGF0Y2ggZm9yIENWRSBjdXJyZW50bHkgb3Bl
biBpbiBtZXRyaWNzIGlzIG1pc3Npbmc6DQoqIGh0dHBzOi8vbGlzdHMub3BlbmVtYmVkZGVkLm9y
Zy9nL29wZW5lbWJlZGRlZC1jb3JlL21lc3NhZ2UvMjI5ODc1DQoNClRoZSB0d28gbGlicG5nIHBh
dGNoZXMgSSdsbCByZWJhc2UgYW5kIHJlc2VuZCBsYXRlciB0b2RheS4NCkl0J3MgYSBiaXQgaGFy
ZCB0byBzZW5kIHBhdGNoZXMgd2l0aG91dCBjb25mbGljdHMgd2hlbiB0aGUgbnV0IGJyYW5jaCBp
cyBiZWluZyB1cGRhdGVkIHNvIGluZnJlcXVlbnRseS4uLg0KDQpUaGFua3MsDQogIFBldGVyDQoN
Cj4gDQo+IEFuZCwgYnkgdGhlIHdheSwgcGxlYXNlIHJlbW92ZSB0aGUgIkNoYW5nZS1JZDoiIGxp
bmUuIEkgZ3Vlc3MgaXQncyBhDQo+IGJ5LXByb2R1Y3Qgb2YgeW91IGludGVybmFsIHJldmlldyB0
b29sPw0KPiANCj4gVGhhbmtzIQ0KPiA+IC0tLQ0KPiA+ICBtZXRhL3JlY2lwZXMtbXVsdGltZWRp
YS9mZm1wZWcvZmZtcGVnXzUuMC4zLmJiIHwgNSArKysrKw0KPiA+ICAxIGZpbGUgY2hhbmdlZCwg
NSBpbnNlcnRpb25zKCspDQo+ID4NCj4gPiBkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLW11bHRp
bWVkaWEvZmZtcGVnL2ZmbXBlZ181LjAuMy5iYiBiL21ldGEvcmVjaXBlcy0NCj4gbXVsdGltZWRp
YS9mZm1wZWcvZmZtcGVnXzUuMC4zLmJiDQo+ID4gaW5kZXggZDY0Yjk3ZTc4Ny4uZWIyMWNkZTg5
YSAxMDA2NDQNCj4gPiAtLS0gYS9tZXRhL3JlY2lwZXMtbXVsdGltZWRpYS9mZm1wZWcvZmZtcGVn
XzUuMC4zLmJiDQo+ID4gKysrIGIvbWV0YS9yZWNpcGVzLW11bHRpbWVkaWEvZmZtcGVnL2ZmbXBl
Z181LjAuMy5iYg0KPiA+IEBAIC0xMDUsNiArMTA1LDExIEBAIENWRV9DSEVDS19JR05PUkUgKz0g
IkNWRS0yMDIyLTMzNDEiDQo+ID4gICMgYnVnZml4Og0KPiBodHRwczovL2dpdGh1Yi5jb20vRkZt
cGVnL0ZGbXBlZy9jb21taXQvMjhjODM1ODRlOGYzY2Q3NDdjMTQ3NmE3NGNjMjg0MQ0KPiBkM2Qx
ZmE3ZjMNCj4gPiAgQ1ZFX0NIRUNLX0lHTk9SRSArPSAiQ1ZFLTIwMjMtNjYwMyINCj4gPg0KPiA+
ICsjIFZ1bG5lcmFibGUgY29kZSBub3QgcHJlc2VudCBpbiBhbnkgcmVsZWFzZQ0KPiA+ICsjIGlu
dHJvZHVjZWQ6DQo+IGh0dHBzOi8vZ2l0LmZmbXBlZy5vcmcvZ2l0d2ViL2ZmbXBlZy5naXQvY29t
bWl0L2QzOGZjMjU1MTljZjEyYTkyMTJkYWRjYmExMjU4Zg0KPiBjMTc2ZmZiYWRlDQo+ID4gKyMg
YnVnZml4Og0KPiBodHRwczovL2dpdC5mZm1wZWcub3JnL2dpdHdlYi9mZm1wZWcuZ2l0L2NvbW1p
dC9kNTg3M2JlNTgzYWRhOWUxZmI4ODdlMmZlOGRjZmQNCj4gNGIxMmUwZWZjZA0KPiA+ICtDVkVf
Q0hFQ0tfSUdOT1JFICs9ICJDVkUtMjAyNS0yNTQ2OSINCj4gPiArDQo+ID4gICMgQnVpbGQgZmFp
bHMgd2hlbiB0aHVtYiBpcyBlbmFibGVkOg0KPiBodHRwczovL2J1Z3ppbGxhLnlvY3RvcHJvamVj
dC5vcmcvc2hvd19idWcuY2dpP2lkPTc3MTcNCj4gPiAgQVJNX0lOU1RSVUNUSU9OX1NFVDphcm12
NCA9ICJhcm0iDQo+ID4gIEFSTV9JTlNUUlVDVElPTl9TRVQ6YXJtdjUgPSAiYXJtIg0KPiANCj4g
DQo+IC0tDQo+IFlvYW5uIENvbmdhbA0KPiBTbWlsZSBFQ1MNCg0K

