Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9A94EE9A02C
	for <webhook@archiver.kernel.org>; Wed, 18 Feb 2026 21:28:40 +0000 (UTC)
Received: from AM0PR83CU005.outbound.protection.outlook.com (AM0PR83CU005.outbound.protection.outlook.com [52.101.69.45])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.207.1771450111163372507
 for <openembedded-core@lists.openembedded.org>;
 Wed, 18 Feb 2026 13:28:31 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@siemens.com header.s=selector2 header.b=EPbXGn3b;
 spf=pass (domain: siemens.com, ip: 52.101.69.45, mailfrom: peter.marko@siemens.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oez6OLvn5W1wSb9TC45Dr32iAIJ8VQj5VPCunQ4HK7brk1b4Upeq854p56Je2CElT/kOwX40DesvKVSV4C8+ffMK8pxGf0k/FRF5jYNA73te6n3kESbYarv++/btiYRoCeQiecW4jeFXezabjrJe2UpaGPw82a5Dh75WtgW6mPAyMyk7WkA9gL5sBxCFyN2QjymOzllNo11lnnjoWZMzULjQyDORjPl19nC8hlR+CRkVTrbM/QEVAjV8uXhUAbDUfbuiiMDx2F6LaEpO3B3bzMUuAc2btVWTzPm1aq9jqKnA9/0dpLuMb29LImxp1fOxXICsLxY7oJNB+HIfd64MIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CNGUv7jBZMugC0W1pjR8gZStIox/JV+PeslbrNY+AI4=;
 b=Xwb1HD5yeAzh/V2lsE4upAL04J42lzHeGRwDTUaFTKENOfdgz7XqdI+7XVe2Pio2opyczRF/gwCidyfriN2KjB7xIc81TMXehAceFfmpbLlu44w9XqHsDFZoqFGgWjUh0YW4nNocF+YxAeqIZHERUBprUBjCVf0WlceUUZu8sXGuvc3q2EVEmHWhhrxw/gdJ+0f5JnnDReoSRKRbdx1eKIC/zK/V5M57Z9fj9ay+N2Q1hcl/ufOMAkClHYzRRSJv5Yo8AJmCsC+s64ek9PsZWlyoKlCv/lhJM+OBo4P+fMa1jdDO39ZYuLqUlS/edVWhzb+1xVy1kFyw+PqqgiB8Lg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siemens.com; dmarc=pass action=none header.from=siemens.com;
 dkim=pass header.d=siemens.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siemens.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CNGUv7jBZMugC0W1pjR8gZStIox/JV+PeslbrNY+AI4=;
 b=EPbXGn3b2tg2IAbdSov3Iw5AhUnW47i7zRvZ2UKJsdLBl11PUen5EenuSfoB2K17t+r/+klvFZmyLvc2oArgLlGLWd0Ev5Cq+6WqzIrE7mX5Amg0Vj2F4a5NSuEnitSGLcwXe38RPAfHYEkLBAgjSnndhJC6K5Sr0OIqFLLgpTQLZTnHWbVNT9EawtFnEQLT+0Y9VtP4h+nLKvnUENjkG0CKhzBLqOml+KJuvHK1WchdE2MrEsweJHlLRQLo8N2SW5COydoJUPL1tj+BgO0kDrVDuO/WllGgqt9C0mKyn9/5bnCerZ+/VXCTYdH9bKN7L8Tgh7C9f3FHg6PJSuwljQ==
Received: from AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:479::20)
 by PAWPR10MB8186.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:102:390::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.14; Wed, 18 Feb
 2026 21:28:27 +0000
Received: from AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::b54d:255a:1abf:2dc7]) by AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::b54d:255a:1abf:2dc7%6]) with mapi id 15.20.9632.010; Wed, 18 Feb 2026
 21:28:26 +0000
From: "Marko, Peter" <Peter.Marko@siemens.com>
To: Yoann Congal <yoann.congal@smile.fr>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: RE: [OE-core][scarthgap][PATCH] gnupg: upgrade 2.4.8 -> 2.4.9
Thread-Topic: [OE-core][scarthgap][PATCH] gnupg: upgrade 2.4.8 -> 2.4.9
Thread-Index: AQHcgoLSd/xb6VB2+kibOlzZzEZhlbVyd+4AgBa9QBA=
Date: Wed, 18 Feb 2026 21:28:25 +0000
Message-ID: 
 <AS1PR10MB5697F71F42D54E6DF1DBDA63FD6AA@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
References: <20260110224453.395105-1-peter.marko@siemens.com>
 <DG63GSU9MVS3.304EAXA47JAF9@smile.fr>
In-Reply-To: <DG63GSU9MVS3.304EAXA47JAF9@smile.fr>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
 MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ActionId=43c12ece-949a-43b9-a128-b426eb0e6010;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ContentBits=0;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Enabled=true;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Method=Standard;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Name=restricted;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SetDate=2026-02-18T21:25:27Z;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SiteId=38ae3bcd-9579-4fd4-adda-b42e1495d55a;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Tag=10,
 3, 0, 1;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siemens.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS1PR10MB5697:EE_|PAWPR10MB8186:EE_
x-ms-office365-filtering-correlation-id: 6d33ca21-817b-413b-20b4-08de6f34a704
x-ms-exchange-atpmessageproperties: SA
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|366016|376014|38070700021;
x-microsoft-antispam-message-info: 
 =?utf-8?B?WGpJQ1F3T0h1M29xL09oT3JIZFNuejhsTDlpWlkxZlpqT3Y4Ly9DZ0U1VTFr?=
 =?utf-8?B?VDg1a1p1aENmTWxIQkh0SlVlZzFYYUxESUlWOGl4TjNHQjc4REsxSndMSTly?=
 =?utf-8?B?VW1NczA5QjQ3SFcxRW5iNzFkaHVORlBiOVNYR1FHSXdETVRmZDByRWF6VXFP?=
 =?utf-8?B?L0xQTHdJWmQvcnBYS2FBc05xdzRTUVpLeUhGY0JiRStKa1ZzcUVkZnV5MDB4?=
 =?utf-8?B?UW1Yb0M2WTlVOUVrdCswUzlmMVE5cGg2aGs5b0llejhOL1BLQmJmMnZrVHRR?=
 =?utf-8?B?YnM1ZUZmTDdlQVRyNWZBSTlIVS9jaDkva1YrWGhncWNYbGViUm1ObVVWdHdp?=
 =?utf-8?B?RzFLdi94YjRRMStkK01WRE5PM3lvUk1WUFZIcHd6Z0pVYXhZV21qejUzcFpG?=
 =?utf-8?B?amhtTWdHTWVKd3lwM01vaE8xbGFjcHNWRVBMQ0k4OFVtc21qaFJycDRFZWJZ?=
 =?utf-8?B?SmNZeFlPS1gyYmlaUUF2d1pUYk90SHdmUklIMVQxS2VFY01KRzdWOFdRckEy?=
 =?utf-8?B?Z0FkMDVLd0h6WGgreUxxTU85ZTVSM0dEV2FZdEx4SHBCaE9uWmZpQ0plWGlS?=
 =?utf-8?B?OFVlNDg0RGtSUUFVdjNmUmkvSzI2cjFiNUpwWTBsSDFkSEl6SGFlSjFOQTc0?=
 =?utf-8?B?R012WDZyUkpPSFZHWVlCMk1nSVJBNWZhR1FNcm1OUzJyZUhwcitPVlV4S0Ns?=
 =?utf-8?B?TVhGUy9lM0RRVlAxd1k2TFhNOHJoNDNrS0RVbENRai9rSitjdU5Ma2VtUTQv?=
 =?utf-8?B?OG1hQWZrczcxYVBpRG4vVzdSMjQ3bFNBUkhuMENpREg4L2ZrMkRuMzhqSS9u?=
 =?utf-8?B?aTZUeWEybCtXQlE5bElyeWR1dEo4VDFPUGdUdlFiNElBcmtubmhlR1NpODBG?=
 =?utf-8?B?bEdrZGxHdlE2RWlJMVI2ckJvMjBmcC9wNTJrUGIyeWE5MHo4dXFJN1NIQS9V?=
 =?utf-8?B?TW85VTBKVThmWlJKV09HWG5hYXhPb2p3RjRtQkJadWhiUy81LzF3Um9ObjEr?=
 =?utf-8?B?UUkxVmdWUzJJU1hWK1VZdTNUTUpidFd3bVVmUGtGZnQ0VFc5MVFKcHhBcWpD?=
 =?utf-8?B?V1VXMFlKLzAwcFMzdXZvT0UvYXVncDNVUGRHbE5UYXcvZDZ6ZGtQNU5TNEpC?=
 =?utf-8?B?L3B1REVQWVJRNzVZY3RIZ0FDK1U0L3lnT2JhNGtnMlFZanVQb2wvdnRFTWUw?=
 =?utf-8?B?TEN2eVhSWWh5NTY4VFl2TExSaHdWd1Q4NHB6cVhlU2NXSkkwSkNwMHJSWWZo?=
 =?utf-8?B?Q3luL3hFSWFyNlVudVJVVktVUk5WaUNUYXhiL21nV29DM0tCdEpGTkdqSmZu?=
 =?utf-8?B?WUVRdUlhc0dEMWxCaVdHNGpRZWErMXg3aWxWTEliQ0I0YzcwRVkrZnFTTmxY?=
 =?utf-8?B?eU1DbFlVbnkwWDgzYjhDeGxGYm1UQ1Foc3o5azB5aGdNT1hacUtGUE9oU0d5?=
 =?utf-8?B?M0ZSem03UjRRWW1tSTBuVFNLc0JGUlJoRnFTWnR1clROY2UrN3JHbkxVNngz?=
 =?utf-8?B?NjViVklHV3hhSEsvTHFrNWgrdVBsZnRCSVFiQjBKL0dNOTI4QnFXa3hMd3Rk?=
 =?utf-8?B?ejMvNDVhR1BXOTRXYmNJOFlOYjF1OTV5RkUvWTRPeVdXaWFvSERzd3BseUpv?=
 =?utf-8?B?RnRWbUpldGdtdG0rUXhxS1pCZkZmUlRhTDM4eS9kTENpZkhkTzNKeFdVczA2?=
 =?utf-8?B?aTNIT29IcEdodVF3M3l1aXFNTWxaMXR1UFIrMGRlaFdCNGV2TGZjRWsvaG5W?=
 =?utf-8?B?QzRESlBVU3JZcUtEbG9RYUl6cTVGUlBrd216QkowR2ZTK1NJYmI4dU9uamVx?=
 =?utf-8?B?QnhlMmRXZTBzbHNnY2FhVHVscERGeXFSYUpIQnF3Y0lKNlV6RUpOYktpVkhs?=
 =?utf-8?B?VnM3UG82dXFHbGEyNHo1T3hMRjJUMllmNHV6Qmh0SFdQeWdiUW9KNU5Ma3I4?=
 =?utf-8?B?LzVBTDg3d2VUYkFUWXJZems3NDQ2dmxqNVV2OUxSYXJFRGRySkZ2K2RYN2ha?=
 =?utf-8?B?YThNRXdhZkhBSUlYS2xJL1lYWXE3M1RrMkY0UTFXamJEYUhRRnNZMmZvTWpr?=
 =?utf-8?B?SVIvbUlIZW4rWkl5YjVqSXFDQUlQdWVTallXOTZybndiZWh3RE92bkJyQThj?=
 =?utf-8?Q?tbwFwWkx+XAOKaaPhT9hyWvcu?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?N24vcTV3VWYvTVdjVUtESlVRV1VUc21EVG53OHhMWjdXL0lCVXRHVmNXTkNn?=
 =?utf-8?B?NGVzSFhZdWt2MUtha2xwd1VIL0NOTDdrcnB5MkpIT3VSR2V1cWpWTWJMTkZZ?=
 =?utf-8?B?aVA5T3lZYlBQR014VGJMMGVnN2Q3aUlIUXNxRytqVFkrdzRyNE5pa2d4VnE3?=
 =?utf-8?B?U1B0Z3FIY1JqL04xcldQcTJlRjBWM0c2VURreXp5WGsxN0FXbXhDTU5EYkFP?=
 =?utf-8?B?MlprUE1XUUl1VmZ6R2hXUHZIS0tJdWQ0bDBrWmxRejdJbEdvcnlTTGJZRmxP?=
 =?utf-8?B?Vk5YaGdpOG44MGw3MHVkL0dRZHpkekwzWWJKQ0hjaUhrbjlTa0FzRW11dGxz?=
 =?utf-8?B?ZEY5bklTYzZvcERoSW44ZUtYKzd3M2hhWXNiUDZOYVFMazg2WXBCaUJCYnFJ?=
 =?utf-8?B?QXM5QTNBbkxLb2x6WEpIdVZYK1RnYmUyNmJaWDNtSVNsUmlZbmEyajNhZFVP?=
 =?utf-8?B?RzBFdkxFSkFCejE3RU9yTGQwWUpzbFpYS3RXQlFwQXlvZGpqM2VMU3dSd3cv?=
 =?utf-8?B?WFVzQmtBK3IzYW16S280alZ0RTFMdjRVanNuZllaSEZzZzRyME5qakZYWXR3?=
 =?utf-8?B?RFRPcnJrdVNpRU9KOU95cFdKOVo0bUgzVmI2WlVvRC85UDJoWFlWN3liSkNQ?=
 =?utf-8?B?L1pNVHQ4eG01YU5EaWFMYmNBV0RTdkw4cmtFMHhsU0R1Rm96eWpFK2lkcXRH?=
 =?utf-8?B?UjJhb3R1VXY3WWJnM3gzenlXWTZOQU82aTZ0dXB1cG04NmJ4ZlE5SFpQaHh5?=
 =?utf-8?B?NnZDRnkzRzJzTUVFb0hRdXJkZ3ZYaHVmWUtjdFRER0EzQ0lid2x5R2xLMjRE?=
 =?utf-8?B?d1FsbUNGWm82TERhTFE5WFdVbHpNUk5zeUFPM1h1OUk2ZUhTbU14MUxUOGo4?=
 =?utf-8?B?RWo0WEE3ZGxGSkJiMDNKNjV6NmkxdzhoMGJSWkV2Y2g2RWVEREJsbVlJOVc4?=
 =?utf-8?B?K1U2N1c1WTZhWkwvNGJzVmsrcnExcHh1Zy9JUE5JZG9vTnBnS09NZUN1cWZD?=
 =?utf-8?B?Q01xaFVqcWY0aTcvQmlFQVVCQ1l2SWltdTg2R1JPc0F3OEg3VnNzS0dCVnpI?=
 =?utf-8?B?VjZqL1BFQ2NBL0F2NE1WdFpBYlQ2emJlQTl2UFpsRDErZjg0OFlBVFQ3Tktq?=
 =?utf-8?B?WTFtTDhoN0s0ekViR0Y2TE85aUpZa3V5OGYyYUtRTE1MOUl3bDNOeWpueHZM?=
 =?utf-8?B?QzBybDVGd0x6VnBFM3dsZkFQNndMRVRxd0NMNVhMcFRTNVlDcVZJK3hHaEhj?=
 =?utf-8?B?OG5tQjdaV0lZRGNIU0k4anZMb2d2RHh1WGoyTSt5aUR0TGtObEZHaUc0SEtq?=
 =?utf-8?B?d3hVYzRKWGg3WWFpKzRtZ1BJcGJSM0crS25kWjYrbFF1dVZZZ2xxOXJoUDNW?=
 =?utf-8?B?ZjZuSnhRVWkydGt5YmpmYlYrL3JsMTM4TjhoSFN0VmFYTUdQcjF2TEFseEdO?=
 =?utf-8?B?a1RpNlVhcnpjNENWank2ZWVlUEhienVHa3llcVNXY21BMWpoVW9idlRySnJ4?=
 =?utf-8?B?TVp1NE5tYTFvdFpmMk1CcG9BaW1LaER5YkRZZWo2ZzJQc0dvN28ybzV1Snk0?=
 =?utf-8?B?UWtPSlVJZ2JmTXdtYndrd1k1ZHJQWkhjb0VmN25TOVN3bWpyQy9DejRndE1q?=
 =?utf-8?B?Wml3WVVncHlsK1dqSi85ejJBeWVuMVRoUE5Vei9zOEF3enJ1Y0krT01mNUJo?=
 =?utf-8?B?Y0JrTkZYMHhQZE15dllHKzdNY0xpemhEY2svUE1ReEpKTk1BQzZZQUJhSTEz?=
 =?utf-8?B?MGFVVGZWUzEvcTlHT08yNWd2UVZCMDdUVTQyTU5LNTI4RU1UeFV4dlFhQjNs?=
 =?utf-8?B?YzgzWm0yRU1QOTBBVCsrcnhiallRNlZaTWhZeFJyL21qUnZaR1J4YjQwMXVO?=
 =?utf-8?B?WEpyd1JzeWdON2VEUllXdTJCZ2lkb3ZwWkQ2LzVCTEI3SXVXRGY3WGgyWEhk?=
 =?utf-8?B?SHBOZFRmdkx5eDN5anZBNVdBajQxRHJOZjkvUkUyKzhEMGM5SVo4a3ZVaEtE?=
 =?utf-8?B?RC9Ua3F3K2FzNWN0cm9rRUxEWVRLbndqdlNBZHhtMzJBNEUxWk5nZllkTUpa?=
 =?utf-8?B?bHpDS2ZpUWkzNGZpVkg5MHcyRHJQWHl0eGdXUmlHRzhub0hJOGszR0dadTVS?=
 =?utf-8?B?NTZLb1lpeldVeUZtbWt0dlVwUWRLNjREL21XMDluekJ6YmtTdndaZEdXNE1n?=
 =?utf-8?B?ZTFkTmxVUit0VmRGb3lHc2hMTllLRWw2MmpNa0RzZ3ZZb01HbzA5UEp4MExQ?=
 =?utf-8?B?a0g2VzRtbGFYN3hjODB4cGtYdlQzTkI1TCs1R1NLSWw3TFFuS1hyUWNDeUdi?=
 =?utf-8?B?MlR4VEY2TGs5UGZUcDdSZFRZdjFSUFE4MjRaK3RsYklUblU3bjFTQT09?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 6d33ca21-817b-413b-20b4-08de6f34a704
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Feb 2026 21:28:26.3626
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: CbCIrHmXlrb+KKh7i47DxYVaK1YDad7dZ4aPRWLec0QS/vML2HZZP03l6p7PF8DSfZDvxB+nxiGJIdC19OvYZg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR10MB8186
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 18 Feb 2026 21:28:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/231413

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogWW9hbm4gQ29uZ2FsIDx5
b2Fubi5jb25nYWxAc21pbGUuZnI+DQo+IFNlbnQ6IFdlZG5lc2RheSwgRmVicnVhcnkgNCwgMjAy
NiAxMToxMA0KPiBUbzogTWFya28sIFBldGVyIChGVCBEIEVVIFNLIEJGUzEpIDxQZXRlci5NYXJr
b0BzaWVtZW5zLmNvbT47DQo+IG9wZW5lbWJlZGRlZC1jb3JlQGxpc3RzLm9wZW5lbWJlZGRlZC5v
cmcNCj4gU3ViamVjdDogUmU6IFtPRS1jb3JlXVtzY2FydGhnYXBdW1BBVENIXSBnbnVwZzogdXBn
cmFkZSAyLjQuOCAtPiAyLjQuOQ0KPiANCj4gT24gU2F0IEphbiAxMCwgMjAyNiBhdCAxMTo0NCBQ
TSBDRVQsIFBldGVyIE1hcmtvIHZpYSBsaXN0cy5vcGVuZW1iZWRkZWQub3JnDQo+IHdyb3RlOg0K
PiA+IEZyb206IFBldGVyIE1hcmtvIDxwZXRlci5tYXJrb0BzaWVtZW5zLmNvbT4NCj4gPg0KPiA+
IEhhbmRsZXMgQ1ZFLTIwMjUtNjg5NzMuDQo+ID4NCj4gPiBSZWZyZXNoIHBhdGNoZXMuDQo+ID4N
Cj4gPiBTaWduZWQtb2ZmLWJ5OiBQZXRlciBNYXJrbyA8cGV0ZXIubWFya29Ac2llbWVucy5jb20+
DQo+ID4gLS0tDQo+ID4gIG1ldGEvcmVjaXBlcy1zdXBwb3J0L2dudXBnL2dudXBnL3JlbG9jYXRl
LnBhdGNoICAgIHwgMTQgKysrKysrKy0tLS0tLS0NCj4gPiAgLi4uL2dudXBnL3tnbnVwZ18yLjQu
OC5iYiA9PiBnbnVwZ18yLjQuOS5iYn0gICAgICAgfCAgMiArLQ0KPiA+ICAyIGZpbGVzIGNoYW5n
ZWQsIDggaW5zZXJ0aW9ucygrKSwgOCBkZWxldGlvbnMoLSkNCj4gPiAgcmVuYW1lIG1ldGEvcmVj
aXBlcy1zdXBwb3J0L2dudXBnL3tnbnVwZ18yLjQuOC5iYiA9PiBnbnVwZ18yLjQuOS5iYn0NCj4g
KDk3JSkNCj4gDQo+IEhlbGxvLA0KPiANCj4gSSd2ZSB0ZXN0ZWQgdGhhdCBvbiBhdXRvYnVpbGRl
ciBidXQgZ290IGFuIGVycm9yIGluIG9lLXNlbGZ0ZXN0LWRlYmlhbjoNCj4gaHR0cHM6Ly9hdXRv
YnVpbGRlci55b2N0b3Byb2plY3Qub3JnL3ZhbGt5cmllLz8jL2J1aWxkZXJzLzM1L2J1aWxkcy8z
MTM4DQo+ICAgRVJST1I6IGF1dG9jb25mLW5hdGl2ZS0yLjcyZS1yMCBkb19yZWNpcGVfcWE6IEdQ
RyBleGl0ZWQgd2l0aCBjb2RlIDI6IGdwZzoNCj4gc2lnbmluZyBmYWlsZWQ6IENvcnJ1cHRlZCBw
cm90ZWN0aW9uDQo+ICAgZ3BnOiBzaWduaW5nIGZhaWxlZDogQ29ycnVwdGVkIHByb3RlY3Rpb24N
Cj4gICBFUlJPUjogcGF0Y2gtbmF0aXZlLTIuNy42LXIwIGRvX3JlY2lwZV9xYTogR1BHIGV4aXRl
ZCB3aXRoIGNvZGUgMjogZ3BnOg0KPiBzaWduaW5nIGZhaWxlZDogQ29ycnVwdGVkIHByb3RlY3Rp
b24NCj4gICBncGc6IHNpZ25pbmcgZmFpbGVkOiBDb3JydXB0ZWQgcHJvdGVjdGlvbg0KPiANCj4g
SSd2ZSBzdGFydGVkIGEgYnVpbGQgd2l0aCB0aGlzIGdudXBnIHVwZ3JhZGUgcmV2ZXJ0ZWQgdG8g
Y29uZmlybSB0aGF0DQo+IHRoaXMgaXMgaW5kZWVkIHRoZSBjYXVzZToNCj4gaHR0cHM6Ly9hdXRv
YnVpbGRlci55b2N0b3Byb2plY3Qub3JnL3ZhbGt5cmllLz8jL2J1aWxkZXJzLzM1L2J1aWxkcy8z
MTQyDQo+IA0KPiBDYW4geW91IGxvb2sgYXQgdGhpcz8NCj4gVGhhbmtzIQ0KDQpVbmZvcnR1bmF0
ZWx5LCBJJ20gbm90IGFibGUgdG8gcmVwcm9kdWNlIHRoaXMgZmFpbHVyZS4NCg0KT24gbXkgRGVi
aWFuIDExIEkgaGF2ZToNClNBTklUWV9URVNURURfRElTVFJPUyA9ICIiDQpQQUNLQUdFX0NMQVNT
RVMgPSAicGFja2FnZV9ycG0iDQpSUE1fR1BHX1NJR05fQ0hVTksgPSAiMSINCklNQUdFX0NMQVNT
RVMgKz0gJ3Rlc3RpbWFnZScNCkFuZCBydW46DQpvZS1zZWxmdGVzdCAtciBzaWduaW5nIC1qIDE2
DQpBbmQgZ2V0Og0Kb2Utc2VsZnRlc3QgLSBJTkZPIC0gUkVTVUxUUyAtIHNpZ25pbmcuTG9ja2Vk
U2lnbmF0dXJlcy50ZXN0X2xvY2tlZF9zaWduYXR1cmVzOiBQQVNTRUQgKDEyMi4zNXMpDQpvZS1z
ZWxmdGVzdCAtIElORk8gLSBSRVNVTFRTIC0gc2lnbmluZy5TaWduaW5nLnRlc3Rfc2lnbmluZ19w
YWNrYWdlczogUEFTU0VEICgxNTUuMzRzKQ0Kb2Utc2VsZnRlc3QgLSBJTkZPIC0gUkVTVUxUUyAt
IHNpZ25pbmcuU2lnbmluZy50ZXN0X3NpZ25pbmdfc3N0YXRlX2FyY2hpdmU6IFBBU1NFRCAoMTIx
LjExcykNCm9lLXNlbGZ0ZXN0IC0gSU5GTyAtIG9lLXNlbGZ0ZXN0IC0gT0sgLSBBbGwgcmVxdWly
ZWQgdGVzdHMgcGFzc2VkIChzdWNjZXNzZXM9Mywgc2tpcHBlZD0wLCBmYWlsdXJlcz0wLCBlcnJv
cnM9MCkNCg0KU28gSSBndWVzcyBJIGp1c3QgYmFja3BvcnQgdGhlIENWRSBmaXggaW5zdGVhZCBv
ZiB0aGlzIHVwZ3JhZGUuDQoNClBldGVyDQoNCj4gDQo+IFJlZ2FyZHMsDQo+IA0KPiAtLQ0KPiBZ
b2FubiBDb25nYWwNCj4gU21pbGUgRUNTDQoNCg==

