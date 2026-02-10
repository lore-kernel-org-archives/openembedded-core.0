Return-Path: <Qi.Chen@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AC447EA3F35
	for <webhook@archiver.kernel.org>; Tue, 10 Feb 2026 09:53:53 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.16317.1770717232250479511
 for <openembedded-core@lists.openembedded.org>;
 Tue, 10 Feb 2026 01:53:52 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=IJi4ZMU8;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=65019f41a7=qi.chen@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61A6Vsja3693458
	for <openembedded-core@lists.openembedded.org>; Tue, 10 Feb 2026 09:53:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=PPS06212021;
	 bh=qma8qrE+b2DZ1UskK57HR4WZfcjY9IY+cco9qSmPDHk=; b=IJi4ZMU83ID1
	rNZt/H93UU9DVOj5HUryogR03CqsK6zeGiBZHdoX5FhBxAUahGDdopzyeI5J5dTy
	0OK26oI6vukSBKNPWOaojh8WtowSq97C5IlbdhXk0aQHUt4ZLgjNwSI7KOcP0NxN
	XLlnAavHVf9kS2VRYhT8GoN9VD2BWzRcS47KUdE5Ty+jNwQw5rSa+zVKeEZepkY2
	xAPajAqgtZNyARgY5bUXabjwrjkrWjLv72Sb5EN6LShl/IzVgFDlcixvE+QWIQAz
	QE6fxnNB10vdcrXDaM07Nw8DZk0wcOAEix6HvOJ5dqvPyycteYAG61MkZu7kcQo7
	vxdpKyahVw==
Received: from co1pr03cu002.outbound.protection.outlook.com (mail-westus2azon11010065.outbound.protection.outlook.com [52.101.46.65])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4c5vc5b2ww-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 10 Feb 2026 09:53:50 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YVbtZHNDBfm2g9KHOIKOY3I9yOY3TdVOvKrl32NsDV85KYF6BWk3Kpgoaso2kX6F0twbtZAmkARqYy4y32wQlfkolQF/491wj9hZILgZVD3KQTgRLnwsK2hWi03Z6n9fw6Y7h0JYycWCvMi3APveBx6DW1+5IgCghkgOAgAmkchr0odlvHTuPSM/Fnf9nQllnGBknDK57zKjIa6Sd3tP0qqaDFaM2OPijNLKvbJZq2eWI4KbEG+8nJc6DhFzl8MCdq3xGtnV0uycjQbp0R2t35upqsybbt2cOUyouB98nomP9rYDbkImCEgYG79QW6vDn+nMvCWCnldLb/OdeDt2/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qma8qrE+b2DZ1UskK57HR4WZfcjY9IY+cco9qSmPDHk=;
 b=JfWzLJ2Zs0/3h2VeUznMnOQxKe+JzZCWQCSNDP1KB0UkiWJUGzPg1iS/apNWgO+qfJQwly4ampbjRYVXhLrWdzZgJx/g5DtA9c2aU5ZWRZadhJbV+7bjJlaMM3ZJxHlYtO0Fgm8JGMfImJFvB1963KYEv8GZUKw67CZiOywGmylDZYH5FmcC18mz+u8zH3Cz/0WEDs6tDER+LgoYnkwZmOzDItIqQo9vi92NaX9ZAgPdySZCfZeN7nfq0z+IXVdRUPDFuM6rf4z7j5jHahlrVc6VbC5OpVXrSiiQ9QHPTU4esiKIKBC4yL+MpunGCCoxztUtq1TEaUgWVK4hUsRcuw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO6PR11MB5602.namprd11.prod.outlook.com (2603:10b6:303:13a::5)
 by DM6PR11MB4723.namprd11.prod.outlook.com (2603:10b6:5:2a0::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9611.8; Tue, 10 Feb
 2026 09:53:47 +0000
Received: from CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::5ad6:8f90:b01d:2c62]) by CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::5ad6:8f90:b01d:2c62%4]) with mapi id 15.20.9587.017; Tue, 10 Feb 2026
 09:53:47 +0000
From: "Chen, Qi" <Qi.Chen@windriver.com>
To: "jaeyoon.jung@lge.com" <jaeyoon.jung@lge.com>,
        Richard Purdie
	<richard.purdie@linuxfoundation.org>,
        "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: RE: [OE-core] [PATCH] systemd: fix libsystemd LICENSE for multilib
Thread-Topic: [OE-core] [PATCH] systemd: fix libsystemd LICENSE for multilib
Thread-Index: AQHcmlAKDWYYjVvOa0Sw+Zgfmk1r5bV7myYAgAAIoACAAAsj0A==
Date: Tue, 10 Feb 2026 09:53:47 +0000
Message-ID: 
 <CO6PR11MB56022C6DD92B00B1FDA3E329ED62A@CO6PR11MB5602.namprd11.prod.outlook.com>
References: <20260210054147.838158-1-jaeyoon.jung@lge.com>
 <9f46cb53a43c6f01135b8a8e18269e92cceb1725.camel@linuxfoundation.org>
 <PU4P216MB11330708E3BBE2CC8996C2859A62A@PU4P216MB1133.KORP216.PROD.OUTLOOK.COM>
In-Reply-To: 
 <PU4P216MB11330708E3BBE2CC8996C2859A62A@PU4P216MB1133.KORP216.PROD.OUTLOOK.COM>
Accept-Language: en-US, zh-CN
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
 MSIP_Label_3ea094ce-8c76-406f-84c8-0af1663f74b7_ActionId=236d897a-e22f-4a38-b3ee-6b26a7e7f387;MSIP_Label_3ea094ce-8c76-406f-84c8-0af1663f74b7_ContentBits=0;MSIP_Label_3ea094ce-8c76-406f-84c8-0af1663f74b7_Enabled=true;MSIP_Label_3ea094ce-8c76-406f-84c8-0af1663f74b7_Method=Standard;MSIP_Label_3ea094ce-8c76-406f-84c8-0af1663f74b7_Name=INTERNAL;MSIP_Label_3ea094ce-8c76-406f-84c8-0af1663f74b7_SetDate=2026-02-10T09:43:53Z;MSIP_Label_3ea094ce-8c76-406f-84c8-0af1663f74b7_SiteId=8ddb2873-a1ad-4a18-ae4e-4644631433be;MSIP_Label_3ea094ce-8c76-406f-84c8-0af1663f74b7_Tag=10,
 3, 0, 1;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CO6PR11MB5602:EE_|DM6PR11MB4723:EE_
x-ms-office365-filtering-correlation-id: d4904a6e-c684-42fc-5126-08de688a492e
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|10070799003|366016|1800799024|376014|38070700021;
x-microsoft-antispam-message-info: 
 =?utf-8?B?QmplK1lTZGxKUUlHNnBxQnlxWVViV1R6cXk4NXA0LzV1WGVYYXZHS3JUYjhG?=
 =?utf-8?B?TS8xUUI3dGpRcC80MUdmZ21zL3V0QVphLzVycXNTc0F3K3h5cm5LWEMwNmJW?=
 =?utf-8?B?RjJ4WGxjQlpIOTd1MFE2Wjc0eHBEL2RTdm9JSE5WS1M2eThtWnBSa3g5eTV5?=
 =?utf-8?B?dVBod1p1Y290dWdDOXhYbHF3ZkxLenA3UGM5NXdBcDYzTnFSZDRWWlMzQ0dS?=
 =?utf-8?B?Uzdma0psNzRDY1VZMks5UmEyK3JLVEoyVlVvajU3SmFjWC9LM2w1S21OUlAx?=
 =?utf-8?B?cDh3Q2Nqa2RTdVhTNkxtSVRudTRWSVFvbG1CaEF4UkZBdzRLdkJwOHlUaENV?=
 =?utf-8?B?dHA0QlIrZ1ZxZ3JUYlM1eUZwenZ1RFhKR3NVLy9pTXcwQTR2QjQ0Vi9wbDVF?=
 =?utf-8?B?NHV4bm9VN3RaY2R2ZHBLNUtiSnBhSmg5azh4Q0NXbTZxbEVFdG9yM3VIbXJ1?=
 =?utf-8?B?TWg4UUtaVXVRMy9DMWZpQWxtcHlGejliT2p5bWlvaGJ6K3RjZ1lvNlM5OGpX?=
 =?utf-8?B?M2RmSjBvS1RhTFMrS2JGcUIzSG4xaE96TXY5dy8rSVdtUTZiUXdheFNnSXdi?=
 =?utf-8?B?T0RjY0xydlV0TVZ5aC9MRlBYQ3JzUmg5a0ltY0xXQ0ErZWpBd2c5Ymljejdk?=
 =?utf-8?B?UWVKSndSbFVNd2YyM1hwL1EwbXlSc2Z6TlJBKzVTNzBaakxRUEI5bEU3amV5?=
 =?utf-8?B?cmo0NjZEdFFJSmJJV0ZXY3VuQ01WTUZ6L2JGemZXN215NUR0Zzg4OENlcDF2?=
 =?utf-8?B?YlpkOFpPcjhtM0tVczRpQzIzRncwNkoyditYUVAwaks3bUZGWVVSL2JNY3hK?=
 =?utf-8?B?S2ROWkkvZXFJcGYwMWxYN1JtSmNSZDdFZzYxZktnWkxIWlVyQVlGQWNYVG9y?=
 =?utf-8?B?Rk04ZC85Mk0yN1ZlWFI4dm1DZHZTQzM4ZzdZNVhUTEo3eDZldTl4UVBFcjhF?=
 =?utf-8?B?YlRKK0hrdDNYcm14bCt2ZzBGbmF2cFVjaFVJaStDZmRvY29ZVkh5TEx2VlJr?=
 =?utf-8?B?WnB0MDBKVWRxN0ZiMG5pZzN2QXdBYkllek5tVW1oTlBnNmFUUmFZZUdVUWpq?=
 =?utf-8?B?L2Y2SEYwTXFQaUJScjFpWUd4eEJDRjNlRUNUSmRsNTlPTzRMNUVhay9CeHpq?=
 =?utf-8?B?Mjg1NDBEUDNvdEF6TjhHSzNkZ01vN0N4WUlhQW5XczZ3WU5OOEhNTVkwODZT?=
 =?utf-8?B?VkpLNFB5ZUl6Y05hZ3E3eEZWUjV0TWU3ODB3VDJPNXVOWUlObXc3aWRleWd2?=
 =?utf-8?B?ZFE2VU4zOExvRTJVN3dLMGV0SUpueFhpNno0ZWFEMy9xcHQyM3FTdDBhRk1z?=
 =?utf-8?B?eTNYbG8zRVJ2cS96bVQ5RjVNNDh2WGxxVWlqM2Q4UGJVWnk3Mm9yK1pZaklC?=
 =?utf-8?B?OUsrRHdNYlZaZHpjWW1JR01SZHVKNGVjblA0ZkxLZ2MyWVFqcFBIR3Vta045?=
 =?utf-8?B?RmJhWjhNNDBuUnArTFd5WnRzQnRTa08raGsyanBrMmtaTGk4bGhVZ2pOeG1X?=
 =?utf-8?B?dXBHQjl0NGQ0WVg5bmV3K1RqZ01TYUltRnhxblMrMW4yQkIvTGx3REtLYVcy?=
 =?utf-8?B?eHNqUGJEZlg2RnpSaXUrbHNReDd2aFQ1U2FTL245RmpEcWJ4cVg3L0daZXQw?=
 =?utf-8?B?K0VZYmtEalc2WVFSbjNsaXJiVkJqaDNKeW1INUdZMGFxaTM0L3QzcVptR0lR?=
 =?utf-8?B?RjN1Y2VFNDdSTmltcUVMYXpnb2d4blpOMU12MFUwN0ZTczJQa09ETVlNQkpw?=
 =?utf-8?B?ajVnMjBPTDJ6V1hTZHI4aHBZOW5JQ0NqVTR3REtJS3Q1UEZYSmxrSVRkVkls?=
 =?utf-8?B?YURtTk5NUUlmSHA0UDdjMUdOQXhhQWpyOHA1d3FiM1czODEza2MvWmpFd2JP?=
 =?utf-8?B?UTVmODUzSW5NM0IvaVRBbE1ROVFUd2psTWo4MTlGbWNlaFVHYlV3KytOVlln?=
 =?utf-8?B?aTZ2NHVOa2NiMDFwenhYcm9Qd1lSbXQ3Mk9KRVF2V2VUbU5ydUF5VDNJRXIw?=
 =?utf-8?B?OHZvV1Roa1FtSmF5emlHbVFjVjFQaDZWcGJVakd4OGlra0pTdzFVbDRLd0x4?=
 =?utf-8?B?ejBlNGZaQjdVcHZHUXkyV2NCY0x4d21lMldJQXF2aFd1elZwTXdhVHBkUHhS?=
 =?utf-8?B?Z05xb09UUnVVSW5Vdm5IdlhVd0FMMnFUTGIxWUkrUVo2N0ZZYk1qckdEOGVW?=
 =?utf-8?Q?VJXM9OlGlGdkFUNvCXvyBOE=3D?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR11MB5602.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(366016)(1800799024)(376014)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 2
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?SVN2eW1Ma2ZoZEpUcEtROUhJVHJJTTJoSGZaSVAzK1paeHA1VVNGdStCdElL?=
 =?utf-8?B?bFUxRHlhK2dJb2JJOFNLeUNlWFFHMHVhZFlVakFOU3dLS3FsYmZzNitvMlR3?=
 =?utf-8?B?NDMyOWFqdEJHWUpEaFVSOHcxSllNb1Z3TXBjQ1NrL094VXR2OG5pSFZ5VjRB?=
 =?utf-8?B?ZytJNDNzVzBpcC94MGQvZ0JXQUhtdVpzaUNCQWVCSEd6bG1pc01sdUFlaFd3?=
 =?utf-8?B?WHduenV4Zm16UWM1WEJ2MTJSa0V4NDNuZlJPMVp0Ly85RmdkY2tISlZaa29I?=
 =?utf-8?B?SUFXQTQ1M3UzRElOcXhaQmRKWElNSnEzd3I2cVJ1cEt1SXJlSGhONTFNSm5k?=
 =?utf-8?B?VnJLWmljZWN5dkRtUEgyUHFJZ2NRNGZPZGF4YXA3ajZFajBDa2c4UGo2Lysx?=
 =?utf-8?B?eThLTkhVbmdRZll0QnJvZlRqNkg0SzROOCs1NzdpcDQxaXZXbXRub0M2Nlg5?=
 =?utf-8?B?am8wbXl5T3d1dG1tdk5kY2RMY2h0RDF1TlVrajBNWUtZMGpJZGNUc1hSbWxB?=
 =?utf-8?B?ZEVYbVdMSU0rM0tLMTE4bGZuazF5RW03SFVkOWJCS0NlakRjZTBuVkQ2cVpL?=
 =?utf-8?B?ZTJYRExGbXNaVFZWeFJFMDNlcWlLcDVGQStWRzJVOFZXOWtMV0dZNXFLeFlR?=
 =?utf-8?B?dmY0Y3FBSjJsM0VSRlE4UXlZUlc5Yy94aURRYkN4aTVocjJWSmhMT21kOGlM?=
 =?utf-8?B?VUUrdFNOZVNtTVd0UkpGd3p3alM3d3pITVd0YVJBZVVleDFGR3AvcTR5N0NB?=
 =?utf-8?B?ek0yVVI5OXI4VHBJeWg0NmxoUmhVOFBRZ0FIWWpIY095MFBzNEk1R1N5NFdP?=
 =?utf-8?B?N3IrUVVsa1VrL2tPdGJKMnlQNFRTeHNjd3E2NnRZTzFPRjdLSlJDRDVqLzJh?=
 =?utf-8?B?UFBpa2FnRWRLUGgvNldmNEpURVkvOFBKNXhpVXlSL1F4ZWNtYXhwT1ZvbXVw?=
 =?utf-8?B?bThZcnF4TElSOUVNWmRqWUxkVk5pNjhQOHFpUXJUSHlzams3aFlVcFdxdTNB?=
 =?utf-8?B?SXZ3UVRldGt3blc0R0tHMytZTGFuT0RQWnU3U05LRGk4TUZqeDdhNHdsM0px?=
 =?utf-8?B?UklUZCtFRGFwSW41WUNJZlJueFdTSHM3THg0bUJmeHNGdktzVVBOWlNEc3hp?=
 =?utf-8?B?MmVsZWxsaGpIMVIwc0tpYjV5UFE2aXNVL3QwUmsxckx1YmpQM3huVDFjWmdH?=
 =?utf-8?B?aFdsNytEQzJpVXFQSlB0U2xFbEZRS2xyUy9pWTBvQ0lhYWVRUkNESXdUQUoz?=
 =?utf-8?B?NDJHNVNFTUUxb3V4ZmVjb0tVdE5RQ2pGaHBRN3ovakgwbk9XRUdtNk9oM1BR?=
 =?utf-8?B?dDFOeDZKaThqYU5nYUs2cW9jbDZGdGlqYmlCZG9OQzFnZURtbzUzdmdlOVZM?=
 =?utf-8?B?SlZ4MTVBWFo5TDh4Qi82Zkk3anc4a3pqSUQ5UzN6R0UxRTZIUTRoS3NSRDl1?=
 =?utf-8?B?c0RrUjB6eCtCTm9OMUlMUGxMNnU5UTY3d2tDckNmR0NzQkRQU1Vpd0F6clR4?=
 =?utf-8?B?YWhDS0E4MUc0N1BqUmlnK09IakRrKzVya1cvVVMzWW42eUJhWGRXOVJpbDlo?=
 =?utf-8?B?cmFEZE42VVR2UUpUZnBvSU9nUmZYeGVlc1Jva24yRWVmL214VVMxcG9hMGtz?=
 =?utf-8?B?aHU2aWY3VGsraUVWUklsdU50UUkzREFSUFJqelYrWWRJZWNVWUxHWWU2dGhN?=
 =?utf-8?B?UGQxT0hrOXNEaTd1V0IvekZrNlEvQkdPVWErclRpcTQyVnZQSFdEbXAwZDdC?=
 =?utf-8?B?WjR0SWV5V2dJaCtUQ2NCZFRieG5PTHo1MEd3MGxJbDFLTjJSajZCc1NzQVl1?=
 =?utf-8?B?YkRsYXQ1MXBsWHozVWwyR2tEMlJyMTllemJ2ZjdKc1lwQkJkUkZYQVVaakRu?=
 =?utf-8?B?TWtRZElXMCtPaDJ6Q3prVGlzNmhPVFUvdFFzcVMzVGQwckpmeW14VEwzaGU1?=
 =?utf-8?B?aXRNWFc2bW05Vlh3RWdBcXZMUXlmZzBoSmJZWTNiYXpXRTJ1dFdRM3ZYRTA5?=
 =?utf-8?B?Q0FtYXQxSGlwcUUxVmVjd1BPU1R4SHo4M1lWQzJXUEgxYUp3Zm1Xa3FML3Ry?=
 =?utf-8?B?S1k0M3JqZ0pEdkJSbnR2cUFhOWxNc2Qzb0grRHN0L0VERXNTZ2V6eXl6S2tj?=
 =?utf-8?B?MGYzNXJWWDlPbzV3U2pDZ0ZtbWpBcDNDUnc5MHRXa3J6bFdNV3o4WGM0Wlcr?=
 =?utf-8?B?TzFJUGs2SFEzSk5WbmJOWFpBMTBOeVZOTk1FUmErZ0tYYUtmS3ozeG1JWUZ2?=
 =?utf-8?B?SXdVdnVZMFJ5QjZ4THArYWxGVGllRC9xRzVJcjNrTVIxNHZCVWk0V0dER3Qw?=
 =?utf-8?B?UTNDb2IxdGtVV0ZwMkRyNlptY0x1eFNsWjFTbkJ0eU5OUGQvaHFiSWVsMVpv?=
 =?utf-8?Q?t20HKG+Q8Ymt34KMDIFAertwp6OIUJTCEcfkHRiLIIClS?=
x-ms-exchange-antispam-messagedata-1: ADXsyRWFXSRCyw==
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CO6PR11MB5602.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d4904a6e-c684-42fc-5126-08de688a492e
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Feb 2026 09:53:47.5675
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: BeaZw821hTYmubPCBNp5Ix51aBgnzRBDkrrUL0akqlBSLGGCuwTNb1kIRTlZ4SbftcmjIOSMO0yE6viwySuxdw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB4723
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Authority-Analysis: v=2.4 cv=dPyrWeZb c=1 sm=1 tr=0 ts=698b002e cx=c_pps
 a=0FlYyfQadWprtAtRvkXThA==:117 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=HzLeVaNsDn8A:10 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22
 a=GgsMoib0sEa3-_RKJdDe:22 a=Q4-j1AaZAAAA:8 a=ag1SF4gXAAAA:8 a=57SyGIRnAAAA:8
 a=PWVdk0iQQFGqHFhWyroA:9 a=QEXdDO2ut3YA:10 a=9H3Qd4_ONW2Ztcrla5EB:22
 a=Yupwre4RP9_Eg_Bd0iYG:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjEwMDA4MiBTYWx0ZWRfXyTdrNQEK4iXK
 oYKloNtyo1ivfNJb+mwwftVidtF5hKbEEvGBATpPNxe1D7ZNBtrLW1ixRisdyfjGeWNnEwVbjoe
 Jk+ZoneSEqUDODTPLLYC3DnJg5vW/Ie9Uk9mnWESsjuknXLlVr94qa19o1joAKK88M6mlZnm8K2
 iBrQutTWul11P75qYkHVeI3HQ34MUeg6D068aACoGOYFzl567BE0nACdyzeA+2uLTLhFffFpXpc
 s1ZgMuhikUm5nHgROrKaUi8H2fqJ///LbQZvQQ6G4f2kc7rbC8KlrA6g9l2GgAmlNhYT/S1YDt+
 2RymDey+hjfZvN+3pIsb6VAFhAJC2m88c+r8x9Bm5DGA7tNi/oOY5j+EVYWdFlsv3OjTxUDCO1X
 d278JBiZliIvBFScTsb/Tj4RQY9GF3uGoZciscZ8Y6ZzLDiJvhwReGIwBVfzr0LhAEMT97Thls/
 jXDKkdY6bjJ0rm38mkw==
X-Proofpoint-GUID: TWS0UfqbLZAhNEenn5xZKsMrryVX9MoN
X-Proofpoint-ORIG-GUID: evrO7CRbBWa7OLPe9o7rriLwTnnhm8sz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-09_01,2026-02-09_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 spamscore=0 lowpriorityscore=0 bulkscore=0
 priorityscore=1501 clxscore=1015 phishscore=0 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602100082
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 10 Feb 2026 09:53:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/230875

SGkgSmFleW9vbiwNCg0KSSBjaGVja2VkIHRoZSByZWxhdGVkIGNvZGVzIHdpdGggUEFDS0FHRVNf
RFlOQU1JQyBpbiBtdWx0aWxpYi5iYmNsYXNzIGFuZCBwYWNrYWdlLmJiY2xhc3MuDQpJIHN1c3Bl
Y3QgdGhhdCBpdCdzIHRoZSBkb19zcGxpdF9wYWNrYWdlcyBmdW5jdGlvbiBpbiBwYWNrYWdlLmJi
Y2xhc3MgdGhhdCBuZWVkcyB0byBiZSBmaXhlZC4NClRoaXMgZnVuY3Rpb24gbWF5IGFsc28gbmVl
ZCB0byB1c2UgcmVuYW1lX3BhY2thZ2VfdmFyaWFibGVzIG9uIHRoZSBkeW5hbWljYWxseSBnZW5l
cmF0ZWQgcGFja2FnZXMuDQpZb3UgY2FuIHJlZmVyIHRvIHRoZSBtdWx0aWxpYl92aXJ0Y2xhc3Nf
aGFuZGxlcl9wb3N0a2V5ZXhwIGZ1bmN0aW9uIGluIG11bHRpbGliLmJiY2xhc3MuIE5vdGUgdGhh
dCBMSUNFTlNFIGlzIGFscmVhZHkgaW4gIlBBQ0tBR0VWQVJTIi4NCkNvdWxkIHlvdSBwbGVhc2Ug
Y2hlY2sgaWYgdGhlIGFib3ZlIG1ldGhvZCB3b3Jrcz8NCg0KUmVnYXJkcywNClFpDQoNCg0KLS0t
LS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCkZyb206IG9wZW5lbWJlZGRlZC1jb3JlQGxpc3RzLm9w
ZW5lbWJlZGRlZC5vcmcgPG9wZW5lbWJlZGRlZC1jb3JlQGxpc3RzLm9wZW5lbWJlZGRlZC5vcmc+
IE9uIEJlaGFsZiBPZiBKYWV5b29uIEp1bmcgKExHRSkgdmlhIGxpc3RzLm9wZW5lbWJlZGRlZC5v
cmcNClNlbnQ6IFR1ZXNkYXksIEZlYnJ1YXJ5IDEwLCAyMDI2IDU6MDQgUE0NClRvOiBSaWNoYXJk
IFB1cmRpZSA8cmljaGFyZC5wdXJkaWVAbGludXhmb3VuZGF0aW9uLm9yZz47IG9wZW5lbWJlZGRl
ZC1jb3JlQGxpc3RzLm9wZW5lbWJlZGRlZC5vcmcNClN1YmplY3Q6IFJlOiBbT0UtY29yZV0gW1BB
VENIXSBzeXN0ZW1kOiBmaXggbGlic3lzdGVtZCBMSUNFTlNFIGZvciBtdWx0aWxpYg0KDQo+IEZy
b206wqBSaWNoYXJkIFB1cmRpZSA8cmljaGFyZC5wdXJkaWVAbGludXhmb3VuZGF0aW9uLm9yZz4N
Cj4gU2VudDrCoFR1ZXNkYXksIEZlYnJ1YXJ5IDEwLCAyMDI2IDE3OjMzDQo+IFRvOsKg7KCV7J6s
7JykL1Rhc2sgTGVhZGVyL1NXIFBsYXRmb3JtKOyXsCnshKDtlolQbGF0Zm9ybeqwnOuwnOyLpCBM
aWdodHdlaWdodCBTeXN0ZW0gDQo+IFRhc2sgPGphZXlvb24uanVuZ0BsZ2UuY29tPjsgb3BlbmVt
YmVkZGVkLWNvcmVAbGlzdHMub3BlbmVtYmVkZGVkLm9yZyANCj4gPG9wZW5lbWJlZGRlZC1jb3Jl
QGxpc3RzLm9wZW5lbWJlZGRlZC5vcmc+DQo+IFN1YmplY3Q6wqBSZTogW09FLWNvcmVdIFtQQVRD
SF0gc3lzdGVtZDogZml4IGxpYnN5c3RlbWQgTElDRU5TRSBmb3IgDQo+IG11bHRpbGliDQo+IMKg
DQo+IE9uIFR1ZSwgMjAyNi0wMi0xMCBhdCAxNDo0MSArMDkwMCwgSmFleW9vbiBKdW5nIChMR0Up
IHZpYSBsaXN0cy5vcGVuZW1iZWRkZWQub3JnIHdyb3RlOg0KPiA+IEZyb206IEphZXlvb24gSnVu
ZyA8amFleW9vbi5qdW5nQGxnZS5jb20+DQo+ID4NCj4gPiBQcmVwZW5kICR7TUxQUkVGSVh9IHRv
IExJQ0VOU0UgZm9yIGxpYnN5c3RlbWQuDQo+ID4NCj4gPiBTaWduZWQtb2ZmLWJ5OiBKYWV5b29u
IEp1bmcgPGphZXlvb24uanVuZ0BsZ2UuY29tPg0KPiA+IC0tLQ0KPiA+IMKgbWV0YS9yZWNpcGVz
LWNvcmUvc3lzdGVtZC9zeXN0ZW1kLmluYyB8IDIgKy0NCj4gPiDCoDEgZmlsZSBjaGFuZ2VkLCAx
IGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQ0KPiA+DQo+ID4gZGlmZiAtLWdpdCBhL21ldGEv
cmVjaXBlcy1jb3JlL3N5c3RlbWQvc3lzdGVtZC5pbmMgDQo+ID4gYi9tZXRhL3JlY2lwZXMtY29y
ZS9zeXN0ZW1kL3N5c3RlbWQuaW5jDQo+ID4gaW5kZXggZGFmMzcwNjBkNy4uODBhNTI3ZGQyNSAx
MDA2NDQNCj4gPiAtLS0gYS9tZXRhL3JlY2lwZXMtY29yZS9zeXN0ZW1kL3N5c3RlbWQuaW5jDQo+
ID4gKysrIGIvbWV0YS9yZWNpcGVzLWNvcmUvc3lzdGVtZC9zeXN0ZW1kLmluYw0KPiA+IEBAIC0x
MSw3ICsxMSw3IEBAIGVsYWJvcmF0ZSB0cmFuc2FjdGlvbmFsIGRlcGVuZGVuY3ktYmFzZWQgc2Vy
dmljZSANCj4gPiBjb250cm9sIGxvZ2ljLiBJdCBjYW4gXA0KPiA+IMKgd29yayBhcyBhIGRyb3At
aW4gcmVwbGFjZW1lbnQgZm9yIHN5c3Zpbml0LiINCj4gPiDCoA0KPiA+IMKgTElDRU5TRSA9ICJH
UEwtMi4wLW9ubHkgJiBMR1BMLTIuMS1vci1sYXRlciINCj4gPiAtTElDRU5TRTpsaWJzeXN0ZW1k
ID0gIkxHUEwtMi4xLW9yLWxhdGVyIg0KPiA+ICtMSUNFTlNFOiR7TUxQUkVGSVh9bGlic3lzdGVt
ZCA9ICJMR1BMLTIuMS1vci1sYXRlciINCj4gPiDCoExJQ19GSUxFU19DSEtTVU0gPSANCj4gPiAi
ZmlsZTovL0xJQ0VOU0UuR1BMMjttZDU9YzA5Nzg2MzYzNTAwYTlhY2MyOWIxNDdlNmU3MmQyYzbC
oFwNCj4gPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIFtmaWxlOi8v
TElDRU5TRS5MR1BMMi4xO21kNT1iZTBhYWY0YTM4MGY3M2Y3ZTAwYjQyMGEwMDczNjhmMiJdZmls
ZTovL0xJQ0VOU0UuTEdQTDIuMTttZDU9YmUwYWFmNGEzODBmNzNmN2UwMGI0MjBhMDA3MzY4ZjIi
DQo+ID4gwqANCj4gDQo+IFRoZSBjb21taXQgbWVzc2FnZSBkb2Vzbid0IGV4cGxhaW4gd2h5Lg0K
PiANCj4gSW4gbW9zdCBjYXNlcyB0aGUgY29kZSBzaG91bGQgYXV0b21hdGljYWxseSBoYW5kbGUg
TUxQUkVGSVguIEFyZSB0aGVyZSANCj4gb3RoZXIgc2ltaWxhciBpc3N1ZXMgZWxzZXdoZXJlIGFu
ZCBzaG91bGQgd2UgYmUgZml4aW5nIHNvbWV0aGluZyBpbiANCj4gdGhlIG11bHRpbGliIGNsYXNz
IGV4dGVuc2lvbiBjb2RlIGluc3RlYWQ/DQo+IA0KPiBDaGVlcnMsDQo+IA0KPiBSaWNoYXJkDQoN
Clllcywgd2UgaGF2ZSBvbmUgaW4gb3VyIG1ldGEgbGF5ZXIgdGhhdCBwZXJmb3JtcyBhIGNoZWNr
IGEgYml0IGRlZXBlciBvbiBMSUNFTlNFIGZvciBlYWNoIHBhY2thZ2UgYW5kIGl0IGVuZHMgdXAg
d2l0aCBmYWxsaW5nIGJhY2sgdG8gTElDRU5TRSB3aXRoIG5vIHBlci1wYWNrYWdlIG92ZXJyaWRl
Lg0KSXQncyBhbHNvIGFuIG9wdGlvbiBmb3IgdXMgdG8gZml4IG91cnMgYnV0IEkgdGhvdWdodCB0
aGF0IGEgaGFyZGNvZGVkIHBlci1wYWNrYWdlIG92ZXJyaWRlIGxpa2UgdGhpcyBzaG91bGQgYWxz
byB0YWtlIGFjY291bnQgaW50byBtdWx0aWxpYiwgbGlrZSBvdGhlciBMSUNFTlNFOiR7UE59IGNh
c2VzLg0KDQoNCkJlc3QgcmVnYXJkcywNCi0tLQ0KSmFleW9vbiBKdW5nDQpTb2Z0d2FyZSBQbGF0
Zm9ybSBMYWIuIC8gQ29ycG9yYXRlIFImRCAvIExHIEVsZWN0cm9uaWNzIEluYy4NCg0K

