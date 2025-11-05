Return-Path: <Jiaying.Song.CN@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 65462CCF9F8
	for <webhook@archiver.kernel.org>; Wed,  5 Nov 2025 07:07:24 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.3900.1762326433438266755
 for <openembedded-core@lists.openembedded.org>;
 Tue, 04 Nov 2025 23:07:13 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=Dht8jHXK;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=3404a64814=jiaying.song.cn@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5A55akIf808921
	for <openembedded-core@lists.openembedded.org>; Tue, 4 Nov 2025 23:07:13 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	PPS06212021; bh=FIhb8XpK1OZ54ivWUdauDOUME5YKewmr7m3zw9VlR7g=; b=
	Dht8jHXKeVGZLp5A2kx7jHn7Jxd+FD0DMh/QV5hQ4hYcl/W6awiOhFJwgvP5GKHQ
	kf0lMT2gPlLl3o74ZAQpNF7aCXbp8uJHvdgnt2anCzAs2UH9m0M2FPsYF4xtFMOi
	5jjbY68GsF5/bPn5JHwSr8ndiQTV0ptNOVoBB2gEJNJlBEmqCDhUb5mXzvmDReMB
	ccbdUDPbWUjWGVJMIGpDaGx3etuPaCosLHj7yMo2JAwb1ewVUcgQfHsov8Ly4Qjx
	viAb7cXOJg6ulpWG+gFPxAEU7J3K97l0xA2SZh/LBk0OUoLpka8foyfJ3Xtc/kKM
	EP3QXB29ncWCZ/RWyrqWTg==
Received: from mw6pr02cu001.outbound.protection.outlook.com (mail-westus2azon11012043.outbound.protection.outlook.com [52.101.48.43])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4a7w8k06kx-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 04 Nov 2025 23:07:12 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GqzwE3x7ExGZYQm8/E0jCdwnH2yueY0sfrLKCJG3/PERNtbr/q8T74ZQj+4SJU9Y5QwoGNzbD6hWVQ84r9Zr0L36QdV0MGreCola7n07yY/NSJx9YKapEq5cJh1XD0et5XHhD4kplGaL9QEiK2RU6IC3Z51UMKwX/1jnzmqJMsdvXV/bRX1AIN7gtf67dfNXh0mFb7smhHzLXLIA3i9Ekf52I9CgOZnbyKmmdyZk6y+ogwCwzhwGHjyYPtgYfVp6/dahD6gymUSlOGfgeARfsvr7lLYYZPBXrcguvICUEIJebKxh6h+fkCH8POQxGcLK+GHqnMXsFNjxNvf1yFhBcQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FIhb8XpK1OZ54ivWUdauDOUME5YKewmr7m3zw9VlR7g=;
 b=SKPhfHNbpGW0LIYe4ZY8mRxpI8N2DlYn9McB5HvjELBI3jeJzxFZqDnEDiqwRMC+Z4hr4lQT37hBjMPhrXwHA/bMaaoT84kbkItCJHdjTPfzaKxaeEUzAB021CVSH0ayozfj5ZUr2a73v29ZTvKKomjwX2jOQ8flxxonNCn+wsDYTOcA5X8Us8INMFwDHyJyWL8joC3y94mmUp43pPwnVaaPYgsSg675luZiz+7PNaZ6cySdMkGRQnH3173vwrFTJzQUcmbYGX3ECOI7vd/b17ma+auGopfbKDwHHlr0f+BS8+qwY6tbmVZeeVwHfRhKVIXy9ob5uW3EsKvEy72rzA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from IA4PR11MB9420.namprd11.prod.outlook.com (2603:10b6:208:563::13)
 by MW4PR11MB7163.namprd11.prod.outlook.com (2603:10b6:303:212::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9298.7; Wed, 5 Nov
 2025 07:07:10 +0000
Received: from IA4PR11MB9420.namprd11.prod.outlook.com
 ([fe80::2714:5169:aa4d:163e]) by IA4PR11MB9420.namprd11.prod.outlook.com
 ([fe80::2714:5169:aa4d:163e%4]) with mapi id 15.20.9275.013; Wed, 5 Nov 2025
 07:07:09 +0000
From: "Song, Jiaying (CN)" <Jiaying.Song.CN@windriver.com>
To: Alexander Kanavin <alex.kanavin@gmail.com>
CC: "Ross.Burton@arm.com" <Ross.Burton@arm.com>,
        "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: RE: [PATCH v3] icu: use automake ptest output format
Thread-Topic: [PATCH v3] icu: use automake ptest output format
Thread-Index: AQHcTLPA/3RocRDvoUCx7E9zzX43LbTjrAUw
Date: Wed, 5 Nov 2025 07:07:09 +0000
Message-ID: 
 <IA4PR11MB9420F9708C4476C6A8196F8AB8C5A@IA4PR11MB9420.namprd11.prod.outlook.com>
References: <20251103074354.4086836-1-jiaying.song.cn@windriver.com>
 <CANNYZj9bjE5jau7wbFdcZpDwrg0iphyDbDw61mQOZPY8mHwMpQ@mail.gmail.com>
In-Reply-To: 
 <CANNYZj9bjE5jau7wbFdcZpDwrg0iphyDbDw61mQOZPY8mHwMpQ@mail.gmail.com>
Accept-Language: en-AS, zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
 MSIP_Label_3ea094ce-8c76-406f-84c8-0af1663f74b7_ActionId=5b44a692-771d-453c-a767-c00e6fd6b712;MSIP_Label_3ea094ce-8c76-406f-84c8-0af1663f74b7_ContentBits=0;MSIP_Label_3ea094ce-8c76-406f-84c8-0af1663f74b7_Enabled=true;MSIP_Label_3ea094ce-8c76-406f-84c8-0af1663f74b7_Method=Standard;MSIP_Label_3ea094ce-8c76-406f-84c8-0af1663f74b7_Name=INTERNAL;MSIP_Label_3ea094ce-8c76-406f-84c8-0af1663f74b7_SetDate=2025-11-05T07:06:31Z;MSIP_Label_3ea094ce-8c76-406f-84c8-0af1663f74b7_SiteId=8ddb2873-a1ad-4a18-ae4e-4644631433be;MSIP_Label_3ea094ce-8c76-406f-84c8-0af1663f74b7_Tag=10,
 3, 0, 1;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA4PR11MB9420:EE_|MW4PR11MB7163:EE_
x-ms-office365-filtering-correlation-id: 0c2710e5-4733-46b6-3208-08de1c39efe9
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|1800799024|376014|38070700021;
x-microsoft-antispam-message-info: 
 =?utf-8?B?ZG9BS2I0aVNmVzA0Y2tlWTlaY21sME9KaWUyWnRMSi9tbkEzbjM4QWJPZTA5?=
 =?utf-8?B?azkzUmE1em5BZjRLQWFEQXVhU096TXFReHUvMUlxMjFaS21FQXpJNkdUK0Rx?=
 =?utf-8?B?T3ptck85TGtxTDk2RFZnNUNJZHM1M2lweUlhaE5LNDF4Um53VU1xTzY5T1hF?=
 =?utf-8?B?citJd2twRmtMb0FZR1FyTHBEa3JFdnI5MUFUTTFqekJsWWZVbmV2QW4zQ0dr?=
 =?utf-8?B?VUZPcUxxa0d4K3g4NFdod01aVEszZ041OXZtb1h5TDhrZG1Ca01DK2tYMjBk?=
 =?utf-8?B?aGk5eG1nM25CQldmKzZkbElKVnU0WUJ0NFp4KzYzRlRRTEZSaGlvQ25iaDNZ?=
 =?utf-8?B?MU91UTc3UnRxSzExeWdHUnMva1A2blEzVDBSOEFaYVN6YnN0NlJGVVNiWGtH?=
 =?utf-8?B?TVB5QjBOQTZ6RjVQOWhEWlU1V0NwODNIeXNBV3NqZkRWUm5YRXlGcFVmTDBq?=
 =?utf-8?B?WHRoajN4ZG1Cb2FDUUJDcXdGc0djYmVmOWdqcWRmZ3hMNDFqNzBhQlg3bnpR?=
 =?utf-8?B?NUZYYkNvOEszMlBCSmRZcE5Za09qM2VWQkVBbEJYVFVzZWVoMjNHMHZyNVFp?=
 =?utf-8?B?TDUzS2FiMnlhelR6bkdrRUJaNHA4VHlySDNxV1kzcVp6RVVJbENzUkV4MkJh?=
 =?utf-8?B?ZWhEMTk4QnlXUTR4Qzlsay9yWFE1aC9udU1MZzlZRXVtMHdZMXI2NTlDbE1p?=
 =?utf-8?B?aFlmakc1Sk54NlkzV1VzRmpMTEJTRStWN1FORFBSa21IeThaenNZYytXdzE5?=
 =?utf-8?B?T0wxRFc5YjN4dEc2d004bU1UajlpSTRySmpjcUwyTVlnZHFKdnZIZXFvVVZR?=
 =?utf-8?B?V1NaWUlZSjFkdm80WjEreERBR1U2bEtoRURZQks5ZUQxdXR6SWhBVmRYSXhz?=
 =?utf-8?B?VjFjb0pUbnZyMEw1b0k0cG51TXdGdGlVSnRRWGdVSi8vY2NGd1IxcWFhb3Bs?=
 =?utf-8?B?QmxyeG9HVjczUnJpOXZTbG1XdDdtb0xqZDJrdm9IOFRQOXRZRzNWUndHWGFr?=
 =?utf-8?B?VW5iK0JRUWJGTUgxRy9nMmdzM3MzYlh5bHlGaDdDaHgwTzF4WHY3NVQrd1hP?=
 =?utf-8?B?UmRaRWk2NHZXS3dxaHdsYnQraFdCemhVQjZlVEtpUXl4VDhVdlFtUHJZb0xy?=
 =?utf-8?B?WFNmaUNyYWs5WXgwWCtPVUxIUS9Xbk91NSt0NjVLY1pkQVBqMjJ3MjMvMG0z?=
 =?utf-8?B?cEJkRHNGVDJ6VSsrOVJKRVJocXR3MW5UNmpiS3VjbHIrZXZoTXlhVEhkUmNq?=
 =?utf-8?B?SldOR2VuUXZIVkJ0bi9OTURTaUNVZ3dlMjJlb0JQVG55Nm0rS1hpMGlHcGty?=
 =?utf-8?B?SWFSUFpqOW9NdDFDdmdyWVVMWFd1c2NybDZjVWNrVFM5UXJ2VXBzK1BCMUVp?=
 =?utf-8?B?UkZsQ3JqdmtBTUlLQkcwNHNxbDZUeTVrWHdTd0xEMDJJWVpGNDYrMFpvWmlG?=
 =?utf-8?B?L2lzTTRXSnZvczZBNW9meWtDZ3ErVWJ0eUI4N0pJdlY5YjVQenA2czNZMjNj?=
 =?utf-8?B?WXJXaml1Wkg0NkJCRGFkY3R4SUdQbjJDSnRuK2UzZkszSk50b09jVkx4cktD?=
 =?utf-8?B?RktHVk1pOGQyQW5aNGdsSFBBVURsWlFIUU1JWVlXbW9vUzlwamFyaTVtTmpR?=
 =?utf-8?B?SEFEWVBhR0ppTkd2TDZUUXVqclJIYkJoUVlsVW9rYXBuRnlZYW14RDBiam04?=
 =?utf-8?B?RE1VakRMKzdWZ2FQMDJBYlVZbFpoOEJRbWNNakcyaVhEd2pKWE1NSU9BZE5N?=
 =?utf-8?B?MmtDZXpybE1acnJ6MDg1MzBQK1hQZGFuYnF2UHVrc2I0QW04ZE42aXNyelpT?=
 =?utf-8?B?d21yOG5IQVNkazhYdk5YRDlEQndMdWNJWUlVN3c4UjRwbTQrQXFIOTB5UW84?=
 =?utf-8?B?VC9Mdmc2QTFVWmozYmFZaHpqSXZjZTRUNXo1NUZ3YUt0L09FcVY2N0hMaWNF?=
 =?utf-8?B?UmppdEp3WGQ2Z3dYOWIwbGg5OEFROVhQdGZ3RFd4dmNMYlpUWWV4Y0sxeXBz?=
 =?utf-8?B?TElYQzIxaVlKMW9pVm9EV0owRDBLWHpsWGsyb3NYbnFITE9sbWRUYmJTWkc1?=
 =?utf-8?Q?nXWzHg?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA4PR11MB9420.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?cEgzWG1wQWJ6cWRrdDBkakd4N3ZqWWJJV1NrMkZpaDNONjNlNysrRTVONVN0?=
 =?utf-8?B?K3RmTFcxVEV5OXJPTnZNVWxsai9Jb08yZFlzWTBVMkx2N241dk03K3Z2ZVZF?=
 =?utf-8?B?djNxT2JRajhxTTZubjJ3Um01bGN6WXRxaWE1RzJCM01nbW5IakFsNURiSSth?=
 =?utf-8?B?LzQ2aHNvYU1zVWpHZi9ZQnFEbks1aE1ROUg3c0JYWFJwbXlpNjRwZnYySjRQ?=
 =?utf-8?B?aFQ2aTVqM2ROZGpMRi85NWwvMFFXbFlNd09zTDh6aTJDRGgxSW5JNEhZNlJF?=
 =?utf-8?B?SWY4YjhKV0duZ2FFUGY3UHpubUpNb0RlT2lEbkpuWFZtbFhUb2EwL0VNQ2Rs?=
 =?utf-8?B?c0l2ZmZJMUxBY0Q0RHZheDhKdmRNNUtSZmlVYi9hUHFVZENpaEtzZXpjUkxi?=
 =?utf-8?B?bnk5SlJCWmlzbUtYZC9HNkZsS3dBUnEvdDhvTUZDcFFvQklIUElrZVBKSElw?=
 =?utf-8?B?NytoVEpKQVhqK3VrdlJGNEZ5b2xHQTd5MlZyd1F2Zkx4MmNjVUVuNFd1TFRq?=
 =?utf-8?B?bmFRazkrQ1B5NXM2NzlNdncvUm1IR0VFcU5nWmNMVUNpM0V1ekhtWm5CS1hW?=
 =?utf-8?B?dC8yck5TSGxpbFBCc3ExYjFMRUNLZ0NZKzlINXRDNU9HaUptVEt0NVRab0Np?=
 =?utf-8?B?TEcwOS90ZytSU1QwRWs4b0gvdXlIWkN5c3VhbnJLYTk1dHF6bmpmcnhXbHVu?=
 =?utf-8?B?NldhMzF0amlIMGEvOW5BSjhqOGd5eVR3aEl6MXBZZmRiWGFZZjMrb1M5VnpP?=
 =?utf-8?B?RnJxMDdYa2tWWWU0RW10NXowOHJMSzZFMzZkYk9kMzkyancwUnhnaUpkNExV?=
 =?utf-8?B?N2VSSVJVbDFHdDhtV1BSbE0vT3lvanBlSDFxR3JLRjNQRkhqcVF3dnFTYTVm?=
 =?utf-8?B?Z3BVS1VhSGRNb1ZkME5CQjNabTYva3JEb3VTbTFlNFR4TGFYOGRTTTlTQ3RF?=
 =?utf-8?B?d1VVM2hyU3M1UW5PbWZHMnROU3hYU1E4TDZVQ3BjWFV2c2xCdG9EWTB5cGhh?=
 =?utf-8?B?V2kyUHVYcklwMEFZTklrOHAxYjNGQ0pWMXlHNWJkYk5CZHBEMm1jbStUL2tn?=
 =?utf-8?B?TE81NWVKVjFrNndEMVVpWGI4V2Y4Y3NtbnJFU0ZNOG1IUjFQRis0U1BuRjlj?=
 =?utf-8?B?Zjl4S3N0c3ZwTHJhY3IvRHk4YVhZOWxpbjRDSVRIbXBIWWJvV05GSHpWR0Fj?=
 =?utf-8?B?Rmw3dTJRNlVuMDFRYngrL2ZDMjRyNEo3UUp3RE1UbEtMMmFXaWJGaFBnTTQx?=
 =?utf-8?B?eUsxdmh2bXM1SHZFMENJeGZkYnc4OHE4ZTZqTU5iSVBCN05ZVHpQakR5aGU0?=
 =?utf-8?B?SVVvcHI0Y2ErSUlYOWRmNFYya2crczM4NXF4WHJRaWtNK3gzZk9LT05RMWtp?=
 =?utf-8?B?Z0VaK2tSMHhMSWJlc0VuaExWMkRURnM2VFl5OEkydTFibW5OMkE1Q3RsdHhY?=
 =?utf-8?B?U29jZFZIOTVGMFIrQXVYQWt6b1MwbENXOWJESHlaUU95L1o4ZHRBdUZOalhh?=
 =?utf-8?B?c2l1cVVFUUdGTFJYZ0p4Y1Y3T2lNRUk2VllMNWhRemZUZ2hIUDhZQ3Y3L1Bx?=
 =?utf-8?B?blNTWXhsWlZkNlZBYzRheXJsTEdvWFE5dDUvTEUrNjhyTEk1VWhoSkt6b1RK?=
 =?utf-8?B?cDJJd3JZWk1XdlVENmdHNTQyTnl6Y09XTmVtQ1lyU1J4S2hVQTdZZWlvM21P?=
 =?utf-8?B?RytZNitrQlJ5a1g1MDd6MFRubkM1ekQ4VllGZGVqdDlUeW5HaU13Y1k5R09N?=
 =?utf-8?B?Vjg4WUs4dkFId01NQVFaN3N3dEJsZjJISmJMT2N1cXFwWk1hZ003U0J4ampo?=
 =?utf-8?B?K2d1Vkc2emJrWjQ3WFZjS0krSE8vYmQzMjF6OWk4d1BSdUwvTzZUL1czeXpz?=
 =?utf-8?B?eTF2dURadFNtVnhVUUVYTE9FY0pUTWw2dFhPcFVqQ2dhb3pZTSthcUdHOUFM?=
 =?utf-8?B?RjdtSVZoQ0hUMkhRRmV0YjVYNkpaZ1B0aWhLV1pXR3hRdmEySDJQL2ZHZ1ZB?=
 =?utf-8?B?akxTWTlyeXlGcXowMVlIQVA5UitqTkFqdE0zL1VHd3lJMm10WjdyOXlONko2?=
 =?utf-8?B?NVdCZTh6VjhQL0FsN1ZQLzF1LzNwOHlLdkttTlNIbFUwMUl2TWFuYmVXMFBG?=
 =?utf-8?B?SkdxcnU0RzZRWHVkVHd4RE1pT0lYaW1iVHdRUUMyR2JTbmhuOTZ6N3pnUkhz?=
 =?utf-8?B?RlE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA4PR11MB9420.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0c2710e5-4733-46b6-3208-08de1c39efe9
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Nov 2025 07:07:09.6566
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 6dkXP2LaC0LgC3RuBgwA1JsD7Kg/5z42ZMF5TSNRW9Npf1C4q2s6tdyGJJ1pOGxRMqWcYlYKRN909n4L91w1tz3Bkj/iNbOIe8Ffh9mT7yM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB7163
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTA1MDA1MCBTYWx0ZWRfX0cS5q2lq64Jt
 UOeGRbV8S2DWARPUmYA9rgblJjZgQ1zVMey6d5t+7AfHg3oMhuObf8jDPFAwoD6TOWBIx3A3K1f
 7rSDjWpyf9LZ9PfjhwHH1/gaELPGipbZJp7dkbBVkdw6IxTbULCvdPmA+/jX+Pv0HOaI6c8yp63
 XfblHVNEcYw4gqikWW1vtlUK1E17MY/2P5EjmzXNAFn2aYhL87B8fYP2Qr9la7MkFYVE+5PdxOk
 XoOO8g/6GztILBKRFKoSG9wtNST7BN/2OPMVszTe6JQxrAu+0Nbx67FEGBi4QU0AbtE4VBsXOyP
 mRn/MG0+fQXcYVFoNHIYvcxybGJeY1X0TSbmcCE85m2hknl1qJ2U2JAwf/kjvGvEr+xUmnby35f
 wd+E7mqMsYdSTvxmJr1WC/AyTBjlUA==
X-Proofpoint-GUID: rfc7gTq7WwAAgpKTLjXvtFA-1IUp6Ehm
X-Proofpoint-ORIG-GUID: FBMhIdEKCIttfZ-NTRgq2i5ztHQw2BHV
X-Authority-Analysis: v=2.4 cv=dovWylg4 c=1 sm=1 tr=0 ts=690af7a1 cx=c_pps
 a=5ROfPwdIRWh2zNeQ7OwrBw==:117 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=6UeiqGixMTsA:10 a=VkNPw1HP01LnGYTKEx00:22 a=NEAV23lmAAAA:8 a=pGLkceISAAAA:8
 a=t7CeM3EgAAAA:8 a=7CQSdrXTAAAA:8 a=Q4-j1AaZAAAA:8 a=wvPkM9v7g1_ikmSEda4A:9
 a=QEXdDO2ut3YA:10 a=FdTzh2GWekK77mhwV6Dw:22 a=a-qgeE7W1pNrGK8U0ZQC:22
 a=9H3Qd4_ONW2Ztcrla5EB:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-05_03,2025-11-03_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 adultscore=0 impostorscore=0 priorityscore=1501
 malwarescore=0 lowpriorityscore=0 suspectscore=0 clxscore=1015 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511050050
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 05 Nov 2025 07:07:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/225748

SGkgQWxleCwNCg0KSeKAmXZlIHNlbnQgdGhlIHY0IHBhdGNoIGFuZCB1cGRhdGVkIHRoZSBVcHN0
cmVhbS1TdGF0dXMgdG86DQoNClVwc3RyZWFtLVN0YXR1czogU3VibWl0dGVkIFtodHRwczovL2dp
dGh1Yi5jb20vdW5pY29kZS1vcmcvaWN1L3B1bGwvMzc2NF0NCg0KVGhhbmtzIGZvciB0aGUgc3Vn
Z2VzdGlvbiENCg0KQmVzdCByZWdhcmRzLA0KSmlheWluZw0KLS0tLS1PcmlnaW5hbCBNZXNzYWdl
LS0tLS0NCkZyb206IEFsZXhhbmRlciBLYW5hdmluIDxhbGV4LmthbmF2aW5AZ21haWwuY29tPiAN
ClNlbnQ6IE1vbmRheSwgTm92ZW1iZXIgMywgMjAyNSA3OjE5IFBNDQpUbzogU29uZywgSmlheWlu
ZyAoQ04pIDxKaWF5aW5nLlNvbmcuQ05Ad2luZHJpdmVyLmNvbT4NCkNjOiBSb3NzLkJ1cnRvbkBh
cm0uY29tOyBvcGVuZW1iZWRkZWQtY29yZUBsaXN0cy5vcGVuZW1iZWRkZWQub3JnDQpTdWJqZWN0
OiBSZTogW1BBVENIIHYzXSBpY3U6IHVzZSBhdXRvbWFrZSBwdGVzdCBvdXRwdXQgZm9ybWF0DQoN
CkNBVVRJT046IFRoaXMgZW1haWwgY29tZXMgZnJvbSBhIG5vbiBXaW5kIFJpdmVyIGVtYWlsIGFj
Y291bnQhDQpEbyBub3QgY2xpY2sgbGlua3Mgb3Igb3BlbiBhdHRhY2htZW50cyB1bmxlc3MgeW91
IHJlY29nbml6ZSB0aGUgc2VuZGVyIGFuZCBrbm93IHRoZSBjb250ZW50IGlzIHNhZmUuDQoNCk9u
IE1vbiwgMyBOb3YgMjAyNSBhdCAwODo0NCwgPGppYXlpbmcuc29uZy5jbkB3aW5kcml2ZXIuY29t
PiB3cm90ZToNCj4gK1N1YmplY3Q6IFtQQVRDSF0gTWFrZSBJQ1UgcHRlc3Qgb3V0cHV0IGNvbXBh
dGlibGUgd2l0aCBBdXRvbWFrZSANCj4gK2Zvcm1hdA0KPiArDQo+ICtDaGFuZ2UgdGVzdCByZXN1
bHQgZm9ybWF0IHRvIFBBU1MvRkFJTCBmb3IgQXV0b21ha2UgY29tcGF0aWJpbGl0eQ0KPiArDQo+
ICtVcHN0cmVhbS1TdGF0dXM6IEluYXBwcm9wcmlhdGUgW29lLXNwZWNpZmljXQ0KDQpUaGFua3Ms
IEkgdGhpbmsgdGhpcyBwYXRjaCBpcyBnb29kLg0KDQpEZXNwaXRlIHdoYXQgUm9zcyBzYWlkLCBj
YW4geW91IG5ldmVydGhlbGVzcyBzdGlsbCBzZW5kIGl0IHVwc3RyZWFtPw0KVGhlcmUgaXMgYSAo
c21hbGwpIGNoYW5jZSB0aGV5IHN0aWxsIHRha2UgaXQsIGFuZCBpZiBub3QsIHRoZXJlIGlzIGEg
KHNsaWd0bHkgYmlnZ2VyKSBjaGFuY2UgdGhleSBmaW5kIHNvbWUgb3RoZXIgd2F5IHRvIHN1cHBv
cnQgYXV0b21ha2Utc3R5bGUgb3V0cHV0cywgYXMgdGhpcyB3aWxsIG1ha2UgdGhlIGlzc3VlIGtu
b3duIHRvIHRoZW0uIElmIHRoZXkgcmVqZWN0IGl0IGFsdG9nZXRoZXIsIHRoYXQncyBmaW5lIHRv
bywgd2UnbGwgaGF2ZSBhIGxpbmsgdG8gdGhhdCBpbiB0aGUgcGF0Y2guDQoNCkFsZXgNCg==

