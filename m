Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EDCE1C7115B
	for <webhook@archiver.kernel.org>; Thu, 29 Aug 2024 01:22:30 +0000 (UTC)
Received: from esa11.fujitsucc.c3s2.iphmx.com (esa11.fujitsucc.c3s2.iphmx.com [216.71.156.121])
 by mx.groups.io with SMTP id smtpd.web10.2607.1724894541198676370
 for <openembedded-core@lists.openembedded.org>;
 Wed, 28 Aug 2024 18:22:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj1 header.b=OcA0dY/j;
 spf=neutral (domain: fujitsu.com, ip: 216.71.156.121, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj1;
  t=1724894541; x=1756430541;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=BvMd/o85zYcWS7u53wfgKHzk5mq2o90kfDN6C9VfNKs=;
  b=OcA0dY/jyUiM6hSrQpFV2cbLn9Xxvh4k/bHpuc74aYH6PyMfF+ov/aeP
   2WGtC0P3e4Fw3fIWmmb9FhyYXtCToDKP/yQiI9stTGSoJrKjOi/Exboru
   uNkpA8b2s4tF7yPj3q3iFC4VRY5K/PdZNiwB3okbyoHJAje4rrT0MzUW/
   YUaMG46Rp0bXnx6LFVORFySdin/klAsXq8m6/tNGhqQ8P+ZpKOhvMZjue
   XhrwKHbI+Lu/E9jnH8qYHVO4K5pZhFSXe3paGvlFaBpA3VMzgLDQkbPsr
   BHngjXHN3oLM87bXV1Jup3nNzi30xdNwtJJvrlVQYAba+GK/VLBRgZSsx
   A==;
X-CSE-ConnectionGUID: N57iJ80DTS2Jcf8w62NicA==
X-CSE-MsgGUID: OtC+M+diTX+jiB2xIWgzGw==
X-IronPort-AV: E=McAfee;i="6700,10204,11178"; a="130117471"
X-IronPort-AV: E=Sophos;i="6.10,184,1719846000"; 
   d="scan'208";a="130117471"
Received: from mail-japanwestazlp17010001.outbound.protection.outlook.com (HELO OS0P286CU011.outbound.protection.outlook.com) ([40.93.130.1])
  by ob1.fujitsucc.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Aug 2024 10:22:17 +0900
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Oh1UVfYuqXFfDrouooXKysLuTXJK6SmgzYaWPmLRgcTRSF3MjzdAlIXnvXexXjxw8FADcPEZf5mxCgxJdfH95BXSn1sGO0izox1hh4V08O1hzKwxO5LXDkYvx4MvqmJYs3MF2EkoYF++LKTdlOiM33Iwz0oWtyZ8/9NB0sQEcobe8VBZ7Ql+xM2nSd2/XnW3tom8xaEkKjL7t8crX9Fi5ATJYoAyf3GkdQDqOzhMkgvISfDNplzGrjz1+VmFaU5JCkNj5YeupYEs8nT1wNKgO9b+a/zEncZyp2iuMdz+OU2yOYH2JEDxdL9INK3Litt49shQ1BN3+1H/AUvS+manZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BvMd/o85zYcWS7u53wfgKHzk5mq2o90kfDN6C9VfNKs=;
 b=GUNeAiN3h8gfO40uROuwg6+cxTxtsy/yFlQEc+XANvrxGKrOFFh6p/P1IPcEQlt20oXvij4tUS39shD9x3jvPQf0XDtm0Fc/6hK3m+l15et6PHxlZV/ZbMd69fjoxHxixMA7xc7ffqnsphQkkg2foje9u3SVfHEZ1kPjtsZbPCLCPAlzE7q2+M0oSCSk2Sh/dFFyxAy8R5JCdgovEaKdoq8yToWRFnLnGPuZI4UD8HleVoB9l1HrB5tetH9AUmYOLBzPKvALisD+3bVboaaaiKJcDsRQLdg6nn5LYz65DlwSGN5iOj969s75wcQiAMxdMeicspahTjxKECObxFrOXQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fujitsu.com; dmarc=pass action=none header.from=fujitsu.com;
 dkim=pass header.d=fujitsu.com; arc=none
Received: from TYWPR01MB11861.jpnprd01.prod.outlook.com
 (2603:1096:400:3fb::13) by TYWPR01MB11308.jpnprd01.prod.outlook.com
 (2603:1096:400:3f9::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7897.28; Thu, 29 Aug
 2024 01:22:15 +0000
Received: from TYWPR01MB11861.jpnprd01.prod.outlook.com
 ([fe80::e0dd:28e5:6a6e:2342]) by TYWPR01MB11861.jpnprd01.prod.outlook.com
 ([fe80::e0dd:28e5:6a6e:2342%7]) with mapi id 15.20.7897.027; Thu, 29 Aug 2024
 01:22:14 +0000
From: "Mingyu Wang (Fujitsu)" <wangmy@fujitsu.com>
To: Alexander Kanavin <alex.kanavin@gmail.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: RE: [PATCH] [OE-core] [PATCH] systemd: use update-alternatives to
 solve conflicts with polkit
Thread-Topic: [PATCH] [OE-core] [PATCH] systemd: use update-alternatives to
 solve conflicts with polkit
Thread-Index: AQHa+SVOBmoTIhBWCEaVtQtu7OseBLI8XT3ggAAF3oCAAPrQAA==
Date: Thu, 29 Aug 2024 01:22:14 +0000
Message-ID: 
 <TYWPR01MB118613BE06C6CFD075C898628DC962@TYWPR01MB11861.jpnprd01.prod.outlook.com>
References: <1724833600-2270-1-git-send-email-wangmy@fujitsu.com>
 <CANNYZj9KSfNg=VOBHqFAFOHpoGTPJe7s8rEii-gDxp-t5K=Uig@mail.gmail.com>
 <TYWPR01MB11861DF67DC120A05FD4373A6DC952@TYWPR01MB11861.jpnprd01.prod.outlook.com>
 <CANNYZj-hhrupgJeDZim3SbDsEOXabPUJ-mqs1DBye0x4BzFF+Q@mail.gmail.com>
In-Reply-To: 
 <CANNYZj-hhrupgJeDZim3SbDsEOXabPUJ-mqs1DBye0x4BzFF+Q@mail.gmail.com>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
 =?utf-8?B?TVNJUF9MYWJlbF9hNzI5NWNjMS1kMjc5LTQyYWMtYWI0ZC0zYjBmNGZlY2Uw?=
 =?utf-8?B?NTBfQWN0aW9uSWQ9OWNjNzY2YmItYTY1OS00YTljLTkyYTgtMTE1MjgxN2Q4?=
 =?utf-8?B?YTQxO01TSVBfTGFiZWxfYTcyOTVjYzEtZDI3OS00MmFjLWFiNGQtM2IwZjRm?=
 =?utf-8?B?ZWNlMDUwX0NvbnRlbnRCaXRzPTA7TVNJUF9MYWJlbF9hNzI5NWNjMS1kMjc5?=
 =?utf-8?B?LTQyYWMtYWI0ZC0zYjBmNGZlY2UwNTBfRW5hYmxlZD10cnVlO01TSVBfTGFi?=
 =?utf-8?B?ZWxfYTcyOTVjYzEtZDI3OS00MmFjLWFiNGQtM2IwZjRmZWNlMDUwX01ldGhv?=
 =?utf-8?B?ZD1TdGFuZGFyZDtNU0lQX0xhYmVsX2E3Mjk1Y2MxLWQyNzktNDJhYy1hYjRk?=
 =?utf-8?B?LTNiMGY0ZmVjZTA1MF9OYW1lPUZVSklUU1UtUkVTVFJJQ1RFROKAiztNU0lQ?=
 =?utf-8?B?X0xhYmVsX2E3Mjk1Y2MxLWQyNzktNDJhYy1hYjRkLTNiMGY0ZmVjZTA1MF9T?=
 =?utf-8?B?ZXREYXRlPTIwMjQtMDgtMjlUMDA6MTI6MTZaO01TSVBfTGFiZWxfYTcyOTVj?=
 =?utf-8?B?YzEtZDI3OS00MmFjLWFiNGQtM2IwZjRmZWNlMDUwX1NpdGVJZD1hMTlmMTIx?=
 =?utf-8?Q?d-81e1-4858-a9d8-736e267fd4c7;?=
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=fujitsu.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYWPR01MB11861:EE_|TYWPR01MB11308:EE_
x-ms-office365-filtering-correlation-id: fb2dfc19-f234-44a3-ea8f-08dcc7c903fb
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|366016|376014|1800799024|38070700018|1580799027;
x-microsoft-antispam-message-info: 
 =?utf-8?B?TWVTblNnYXkxMFdMcTNKcEtJVDl4azI5SUlGME9yWGVVVkd3Z29FSDdLMnYx?=
 =?utf-8?B?bk56UmFCd0lrNG5YMHdYa1FmdmRNYUJDMkRGc09yNGdBdTFzMlhqK0YvUjVE?=
 =?utf-8?B?bGFoMUZEZDBncy94SkZuMzB4NnIvSWQxRWh2SEZwcmRaN0dELzBrN1JhczZR?=
 =?utf-8?B?Y3I1UFBIVmtJUm40U2VTOUpHTzhBd0tMK1dDdkxBbHl3TGVHdzVwNDVCNEZY?=
 =?utf-8?B?UGVGWE9la211amo3U2tiYjg3cWxvbnZMLzJxQ1JKbjliMmZaZ2VLRFd1alZS?=
 =?utf-8?B?ODBJVml4ckFrU3QxRTZHcWVJMDZvVDRsczNvWGFYNzM1Y2h2U3JWWUtwZUFK?=
 =?utf-8?B?Sy9GOTVKVWM1ZW42cjFEUTR5ZFNUb0poTTVpWElnVFlBVks5cEdGanJIS0Mr?=
 =?utf-8?B?VGx2dXZtSlNVY3BQQXJTd0MzazlPclFNTW9OeW5YaThGSXFNeEFIVlR3aHJG?=
 =?utf-8?B?cVpORlpIMWhYejkyNjl1K1dnSHo1U25FdnpNdHRhV3ppZ1NCR2lzOEFVNFdm?=
 =?utf-8?B?cnk0QnYzVG9yMUJORkdtQ3dETXBsZlo0enhrd3l0eitYQlR3akFsc1pCTllw?=
 =?utf-8?B?NVNyMXZCeU8rS0lzdUM4UDk4cnVBZUR4UndpSitSWjlqQnkvSHRrZjJwRjFC?=
 =?utf-8?B?RUVrYVpEV0luYmx2UURHNld5QlVETCthdkVsbGFIb2R5Y1c1VHFibThDbmFy?=
 =?utf-8?B?VzNUbW9ma0RROGIvMXp0NHdaSUtaMW5LK1pqVThNUmo5SUtTenRzdWRsWkM0?=
 =?utf-8?B?R3d3b2dkem1oNXpXVm5EYnlTRG11SmNJZFpxdk10RUY2L1UxWVozL0pNSVlo?=
 =?utf-8?B?SUhZdFlCMVViaFVBajdCYzRNR2VocE5VNlJBUE0xb09IdXNOODFZNWVYbDIr?=
 =?utf-8?B?REo3K0dLemR1cStvM3BUV1ZMZnlWSjdCYi8zd1AyOFlmZnB2am9SK1ZhSGZX?=
 =?utf-8?B?K3h1Y3o4aHBLMDZWTU9lZkdienJTOGJ3dnFyTWl6eVVqWExXcFZYQ1pIZTFz?=
 =?utf-8?B?Y3ZTNTl0bnkwc1lvWFhTcDlxTVpmcnFZWFNqd3hNS0RSWUtVSjdhVjE3NU9K?=
 =?utf-8?B?d2YrZnVJMU1XVXJQSzU5ZHFrSzllNzNBbkI2Y0RoUzlHUEh3WFY2WTR2ZTgv?=
 =?utf-8?B?ZC82RVNZWFJJYlhRTzMvVmxNakZYOUtTQi9MSTZKdVBkbVVOaUNPUmovRkhv?=
 =?utf-8?B?WXp0TUpZcW1URDYvZXZSVXFMQVByRXB4czR1UVRXTmlEZHd3RUZYWmRveHBn?=
 =?utf-8?B?bWJ3VFAzbFVYd1ZKMVpHWllLMHRiOE5yczBpTU9UUGNJL2ZOZ0xYeXNLYkxY?=
 =?utf-8?B?UVdSNmVDRVNlOTF6V3pPcU5lMHltbURUWmNKSXdOcEQ0N2pLbS9WTU90TklN?=
 =?utf-8?B?ZnV3cnNoWGVMbHF0bEdNNHJCcU44T0V2ZlZoRkZBL0krZzJMN1p4cVJkc1Vn?=
 =?utf-8?B?aFhkdE1xcGF2SjhCVTNUcFVhUHZWZ2JYbnFNT0JWeHAxaTQ4bk9CLzJCU1VT?=
 =?utf-8?B?aDVUc2hzWkJVZHRNamg1QU1ncjdvSXZ0bzJxaElkRmFhMGxSWnZHRlUwZFFN?=
 =?utf-8?B?OUVERGZOeWFRQVVjK2NxcGttbG5xTXlTYW1oQ3JURUxlazU2clNKQkkvRWpu?=
 =?utf-8?B?b1R2TWZka09DY2hjYjZKRm9seTBRbVpaOER2cUY5TXRrQ1VHdll1Z3FOVThK?=
 =?utf-8?B?NlhjT3czK3VjMWluOXdpdDAxaUdIVjZUeFIyQmg2ZXZBRm9yUkFod3FaVExG?=
 =?utf-8?B?Q2NNbWNZQnZYd0dPeVlHV21EdEJZMUtSY2NjajNlaVc4eWJKSStoY0NKcThq?=
 =?utf-8?B?YUNVandHc2JGWTFveUhpWkgwaUNadTQ1aks2NXlTeVdoSStFNlpxUmxTOFpz?=
 =?utf-8?B?QzZyUXJSQlNzWXdsbDQyL1hteHpmc2Rza0NsRVBMd1cvcG51TkVFSFJxL2U0?=
 =?utf-8?Q?6C+zTIY52zc=3D?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:zh-cn;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYWPR01MB11861.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(38070700018)(1580799027);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?OFc1bkEyWVlSWHBrL1VqZEcyeHl2TGZlWE4vT1ZYNHN4K1pKR05oWGdHTXZj?=
 =?utf-8?B?ZTk0T2M3UXBzMmpxM3ZhYUdtTSs2LzdONzFPT25nR1BEYjZ2Vzg1WVJ5c2xn?=
 =?utf-8?B?YWs5SjIwSUpRUjdWUk5tbzR0bVlqckZCemdBN0VXRE9OTHpRZnZIbkhaVTlG?=
 =?utf-8?B?by9NZVFCQm9PYlc1REdaRWdvQzR2UWw0ajF0NDduOWVwOUJTam9QcVNpWFd4?=
 =?utf-8?B?Y3A1b01rZzRjRDlPQkx5d0xJTjlRbXBLWENESGZhN05tb0N6QmtpNXJ5cGM5?=
 =?utf-8?B?RG1NaFpSTkFySmlPcElaQmJIeGh4WnRrOVg4NHg2ODRtTU80b29mSjY1UWpM?=
 =?utf-8?B?aTBwRlVDTDNSWjVhbTBFQSswUEFVaVpRbENYY0NqZ0pNa0x5aVRYWVBIUG54?=
 =?utf-8?B?djhlczdjcUltVFJmZUJSbHRKeTZYWmREOXhtZDdpaGF5NFQzcnV5ajVkR1l4?=
 =?utf-8?B?U1k4YWdld3ZnMno3MVZFRTY2dEVhL3lEdmVXWDl1L01rNTJRcmh3RENYOXJi?=
 =?utf-8?B?bTMxczVSM3M4V09oaVU2UWNTTTJvYUlmNXBGWHc0NUlUOVN1aHJkc0xvTGRL?=
 =?utf-8?B?cEprZDBzZUxJaVpCR2RBWG9mNnZiWU9SZUVjdjVNdkQzNVhmZlZob1V6bFNl?=
 =?utf-8?B?UWFpR3B1eE9ab1lTMk15dzdpa0VOOSt3V0tpMDM1NVdYYk1OckJGK09vSjNa?=
 =?utf-8?B?aUNCeUk3N1FYZ1RQblpzOFh2cUpzZC91WENTOXIrM09iZUtaWGkvRHo2NnRI?=
 =?utf-8?B?alJsajBjYk5nU0xDNzZia2tqZnZ2ODlGVFZ6Ymk1K3BDd2lOSFM0WHA4ckpn?=
 =?utf-8?B?bnBONDRKV0RMSDdhK1AvKzJqVnI4TUY3K2RPNjFic0Z0dkJpNGMzc3U1Sllj?=
 =?utf-8?B?eFRiTHdxSVZ4K3RhY2FzWjBzVmsydU1Ka0o1WnQyOXFKU0FQTFFaNlJuK2sy?=
 =?utf-8?B?T0lzayt1UmNVR0RWbThvOWE2SUNBazhneTIrSVlSby9QazA0eG5ueHJyeDhw?=
 =?utf-8?B?K0wwSmtReTEvTW5qam5zdTJTOU5QeC85MjRkZWpwRnFqSXVqekVyd1FCN1ZW?=
 =?utf-8?B?c1JBTktDWW1rT3YrYzlvSEpTTzNzRTlnM0IwWnlpMkFDZnhTNlJLckJHcm5a?=
 =?utf-8?B?M1MrTmI1b3J3VU9oRkx5MDExdXZzb3BLZUpTSmlLTVBIMkJ2VDNIem9yb3JI?=
 =?utf-8?B?c3Nna0JaQlIwVmphdmZoVmVMcVhNWGtHZ3V3NG9jTk1jcGtXdmgvY0VCQmll?=
 =?utf-8?B?VjBmVlZrT1lOOWh5THczNzBLenU3NE9hcUFpcDhnQzAyazlPM09wZEp6c0FN?=
 =?utf-8?B?ZVVUNkFUTEc4b2h3Wlg2NTJrbjg2TWRrd2ZaQW01RjRhOXg3VFp2ckJZSnBw?=
 =?utf-8?B?WjZ0aHJsalNHdFpHVXY2YW9PaVd0REQ5YlJTclVTVmd1VjlteVBhS3Urb0lL?=
 =?utf-8?B?b0pSM2Z1TW5tZ3JVTzF4WlJKSVNySVNvUHp5Uzd4cHY0RFdlUExPOVRZMmtz?=
 =?utf-8?B?NGpDZ0FteE85YU5sTkdWbUJCTS9jNGMycWpQaFZ2bE50QzdyOU9nZTcvNytl?=
 =?utf-8?B?TGJpTk90aHI4T0Q3YWRkUGhqb0kwclY2aFQyTVNCdFE5VG4xVlF0U09aY1pp?=
 =?utf-8?B?MVR5TjVhV09RT0RHMU03Tit5RVBLWm1lajF5ZGMvVldlS2V3blNIc2hDRzlp?=
 =?utf-8?B?cVQvSXNsZE81Vi94Sy9DRTJGckhvQjNTVTdKOWZXbFB4d0dXWFgxckFSMzJa?=
 =?utf-8?B?d2ZIaGFVeGpGRmdEc2RIMnZMK2JkWGZ1VWtxMUZxU2FqSUE1MG52TDZTUHFo?=
 =?utf-8?B?Lys0ZU5Sc3JLWHp3Qm1XUnpyY2FTNXFwVGdpL21pblFONXB0M3FjOFNVNkFz?=
 =?utf-8?B?MmV0TUtaWUhFcHBIK1gwVFpyemVLcndIR2ZyTVF3YnY3QzdLeVNsNVM3WU9W?=
 =?utf-8?B?alA0WFEyZC95UlEwMTlUZVBhOVl1YS9HeEFuTnZNZlRKaTcwMUZEb0RMSEFo?=
 =?utf-8?B?SURBQkwwQlhWNGVZcXBPbVY1dUZ1b0psQVZDMkNkZzVuTmNmNjB5RWdBcGxV?=
 =?utf-8?B?N0NKcnQvRDRYWit0TDB1VnBHcDBTekpqTVJWWm1HNkpBTnV6ZSt4ZTVTVzRu?=
 =?utf-8?Q?d368VYmYVPfgpg2luFpNl9PmX?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 
	I7kOUftQHDwbnugLDqf/P4N148wEJCFHo6hwVovzMGper4Dx26vovS7dOIS+k7qvTrIMGF6t/2z9U9wgq7mKVAe5RM6GzQtSK/oF/PvKVN60H1KvMhcE4vS5nqTGfVcIzx8MoF9NGFsVGPjQ9RvXu8ciBqkTeFOB+nwyZ9QWE+6LoniVtmLytoO6QF0vw2HsrU2slhR2hWoNSeeuS7cPn/5snfJQXEidQjTnpHgNcpukjloH+nNPVHE98L74BttgRRaUZEpyAd0tLPgVBza+Y7oufsELCHmrbBEIZxiZA/LOfvcpNRKE4i+HkXVp46lCPgnUflL/Gbzk4FgR0BMRd4STTsLbSFyHssd/j4LVxv8GSMyqBUq0WQOuTGZx4ZMlNhNTy+2MMiVBq2V1dOs75cIvoSqZfseSP/a8Lg675gbEOuTObcAUe6ozvaKop7Mre54pNb5p3R70iXYXJMKuGxghof6o5AL0I2SxH/OlyxldwKUBsInLJ5NmkNkwDaE1MxmauxQH71yVQlwsnBB3XkeiIA8OKI3sYBKiYp5F8aqr2eZ7RcGeGu/CUqZMOVsm/eNKyrxae6Ztc6Vn5FIGuoZnb9dYLG8YbWB4f1jRM3oMFkUyUxBRANYXC6HWcil2
X-OriginatorOrg: fujitsu.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYWPR01MB11861.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fb2dfc19-f234-44a3-ea8f-08dcc7c903fb
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Aug 2024 01:22:14.8457
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a19f121d-81e1-4858-a9d8-736e267fd4c7
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: FFxfM4hnj6Q+xMx1FlO97PRVPQSoWLlmf+kYlofp+yaFrxNvlY92y+5eacTQ1nHUa3TM+wM3MXo4sKS2p4Zbsg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYWPR01MB11308
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 29 Aug 2024 01:22:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/203898

fCBBcmUgeW91IHVzaW5nIHBhY2thZ2VfcnBtIGFuZCBkbmYgdG8gY29tcG9zZSB0aGUgaW1hZ2U/
IA0KWWVzLg0KDQpJIGNoZWNrZWQgdGhlIHBlcm1pc3Npb24gb2YgcnVsZXMuZCwgdGhleSBhcmUg
ZGlmZmVyZW50Og0KDQpzeXN0ZW1kOiAlYXR0cig3MDAscG9sa2l0ZCxyb290KSAlZGlyICIvdXNy
L3NoYXJlL3BvbGtpdC0xL3J1bGVzLmQiIA0KcG9sa2l0OiAgJWF0dHIoNzU1LHJvb3Qscm9vdCkg
JWRpciAiL3Vzci9zaGFyZS9wb2xraXQtMS9ydWxlcy5kIg0KDQpJZiB0aGUgcGVybWlzc2lvbiBu
ZWVkIHRvIGJlIHVuaWZpZWQsIHdoaWNoIG9uZSBzaG91bGQgYmUgdW5pZmllZCBpbnRvPw0KDQog
IC0tDQpCZXN0IFJlZ2FyZHMNCi0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLQ0KV2FuZyBNaW5neXUNCkZVSklUU1UgTkFOSklORyBTT0ZUV0FSRSBURUNI
Tk9MT0dZIENPLiwgTFRELiAoRk5TVCkNCk5vLjYgV2Vuemh1IFJvYWQsIE5hbmppbmcsIDIxMDAx
MiwgQ2hpbmENClRFTO+8mis4NisyNS04NjYzMDU2Ni0tODU2OA0KQ09JTlM6IDc5OTg4NTQ4DQpG
QVg6ICs4NisyNS04MzMxNzY4NQ0KTUFJTDogd2FuZ215QGZ1aml0c3UuY29tDQoNCj4gLS0tLS1P
cmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogQWxleGFuZGVyIEthbmF2aW4gPGFsZXgua2Fu
YXZpbkBnbWFpbC5jb20+DQo+IFNlbnQ6IFdlZG5lc2RheSwgQXVndXN0IDI4LCAyMDI0IDU6MTUg
UE0NCj4gVG86IFdhbmcsIE1pbmd5dS/njosg6bij55GcIDx3YW5nbXlAZnVqaXRzdS5jb20+DQo+
IENjOiBvcGVuZW1iZWRkZWQtY29yZUBsaXN0cy5vcGVuZW1iZWRkZWQub3JnDQo+IFN1YmplY3Q6
IFJlOiBbUEFUQ0hdIFtPRS1jb3JlXSBbUEFUQ0hdIHN5c3RlbWQ6IHVzZSB1cGRhdGUtYWx0ZXJu
YXRpdmVzIHRvDQo+IHNvbHZlIGNvbmZsaWN0cyB3aXRoIHBvbGtpdA0KPiANCj4gT24gV2VkLCAy
OCBBdWcgMjAyNCBhdCAxMTowNCwgTWluZ3l1IFdhbmcgKEZ1aml0c3UpIDx3YW5nbXlAZnVqaXRz
dS5jb20+DQo+IHdyb3RlOg0KPiA+DQo+ID4gVGhlIG5hbWUgb2YgL3Vzci9zaGFyZS9wb2xraXQt
MS9ydWxlcy5kIGFyZSB0aGUgc2FtZSwgYnV0IHRoZSBmaWxlcyBjb250YWluZWQNCj4gaW4gdGhl
IHBhdGggYXJlIGRpZmZlcmVudC4NCj4gPiBXaGF0IG1ldGhvZHMgY2FuIGJlIGNob3NlbiB0byBz
b2x2ZSB0aGlzIHByb2JsZW0gaW4gdGhpcyBzaXR1YXRpb24/DQo+IA0KPiBBcmUgeW91IHVzaW5n
IHBhY2thZ2VfcnBtIGFuZCBkbmYgdG8gY29tcG9zZSB0aGUgaW1hZ2U/IElmIHNvLCB5b3UgY2Fu
IGxvb2sgYXQNCj4gdGhlIHNwZWMgZmlsZXMgdXNlZCB0byBwcm9kdWNlIHRoZSBwYWNrYWdlcyBp
biAke1dPUktESVJ9IG9mIHN5c3RlbWQgYW5kDQo+IHBvbGtpdCB0byBzZWUgaG93IC91c3Ivc2hh
cmUvcG9sa2l0LTEvcnVsZXMuZCBpcyBzcGVjaWZpZWQgaW4gYm90aC4gSXQgbWlnaHQgYmUgdGhh
dA0KPiBwZXJtaXNzaW9ucyBvciBvd25lcnNoaXAgYXJlIGRpZmZlcmVudCBhbmQgZG5mIGNhbid0
IHJlc29sdmUgdGhhdC4NCj4gDQo+IEFsZXgNCg==

