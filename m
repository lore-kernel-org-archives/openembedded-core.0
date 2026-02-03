Return-Path: <changqing.li@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BA2C1E83050
	for <webhook@archiver.kernel.org>; Tue,  3 Feb 2026 04:47:02 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.10017.1770094017610647249
 for <openembedded-core@lists.openembedded.org>;
 Mon, 02 Feb 2026 20:46:58 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@windriver.com header.s=PPS06212021 header.b=Cd51WMou;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=6494bcb338=changqing.li@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 612NUh1u507457
	for <openembedded-core@lists.openembedded.org>; Mon, 2 Feb 2026 20:46:57 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	PPS06212021; bh=tJj0AXK4QTmbtWWZgJ3AqibA9GS+E+i47oxLhIEtdVg=; b=
	Cd51WMouZW9oWsoIq8oRQAohBxEWmeteOxCsRztfm9yt/GnYSPd4VuztId+0aq46
	uxGCQrNhH7hGkaynHscJDrt/8l73bD+tgpLK32IaVrMhqfjvzK2o3jZdiRSOdElz
	mtflvYV7OvbX0KWKuIB5VHEnpKke1jwDh8c/WPBmqnk9Y+qHCCbAbCp7/W/WpgEq
	SedsewJzz233bFmnIGPhNCHoOCM44dCagLRmafuvedBBhPWCBzVCGMSTkbpxmG4y
	R4hzmclpS3pTfB7wiEWkv2/8EhcrIo3aW0oP8vb5bnAiB8/XEoIX72wL/x8bt2ag
	bXYlwnDkp+DlDZLEaIsa5g==
Received: from co1pr03cu002.outbound.protection.outlook.com (mail-westus2azon11010039.outbound.protection.outlook.com [52.101.46.39])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4c1dw0tqd9-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 02 Feb 2026 20:46:56 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=opbxTnChReC3yJwCLI28IW8yNtE0kMwc09Wf7UbBr9YhPG+uutjhe/PotPS7k97KDACIjhZbnE7EslT3GeB9Xty3Tp6xA24xDogPmUqkeih/epl9PKG0qbhQBj5JogAphANteVXym+YNk12pzRcfWRfwqpUBCiylJaaktuqpSMDHTVdyNCvAZtyiQtsLC0aNzesyRnk4EOStl9zvxZmfohD1cd8332ZudjyD1cZotFylIfm91vfeVS354mGHrz0RJCwmN5bg9tVuYOFQjNqjCsF8bPuZv2gZig676jkYYRrxr0sKyZjUVsh1CxM+f7VLLGgbzXHTcR9Lirl01P5UBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tJj0AXK4QTmbtWWZgJ3AqibA9GS+E+i47oxLhIEtdVg=;
 b=x4qHKk/Xt5UBERPWJt+4iM0jS3mB1VIEP7I4kayeBHQh842xVtSag8jzHb60rFi6ECRUa9UL7nFwfEg/N948ZR0mmy1Gy5z65JJifTKbEW+vtecAuuy9xL20+clHq4zw8EUDgcPO6tg1BFXyyqFkEz6SfaJuvFXhTwopP/VNJbIkbME9ajTjcNPN1yHTAtdYHpBbNn9zIK63H+xjBUTWCAIIcFcMZ03GrGwQglN1LE1n++43YR8QAQiszjmPEh+w5bm5rsKAbC1lMD05Ltjmei9ENmoCvWiJVEkLkMo3utYUa0kanFSGfy06IdIdVGywE1oHx9mcWpC4h4tq9v1xaQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CH3PR11MB7297.namprd11.prod.outlook.com (2603:10b6:610:140::19)
 by PH0PR11MB5928.namprd11.prod.outlook.com (2603:10b6:510:144::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.16; Tue, 3 Feb
 2026 04:46:51 +0000
Received: from CH3PR11MB7297.namprd11.prod.outlook.com
 ([fe80::d512:ca9e:d0b9:f229]) by CH3PR11MB7297.namprd11.prod.outlook.com
 ([fe80::d512:ca9e:d0b9:f229%6]) with mapi id 15.20.9564.016; Tue, 3 Feb 2026
 04:46:44 +0000
Message-ID: <be095942-3b0f-4d62-97ff-590e7b6fbfbd@windriver.com>
Date: Tue, 3 Feb 2026 12:46:37 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [oe-core][PATCH] bitbake.conf: remove DEBUG_PREFIX_MAP from
 TARGET_LDFLAGS
To: "Ricardo de Araujo (Salveti)" <ricardo.salveti@oss.qualcomm.com>,
        Randolph Sapp <rs@ti.com>
Cc: raj.khem@gmail.com, openembedded-core@lists.openembedded.org
References: <20260122194959.13457-2-rs@ti.com>
 <8684a6b5-809b-41e4-a3b0-c99b424a1b2a@windriver.com>
 <0387b4a0-1457-4de6-9571-022b997199e4@cybernetics.com>
 <DFYTFOYS891P.2A5CKLOKP5KGI@ti.com>
 <117668c8-bc3b-46ea-9d2e-b205e3f2f827@windriver.com>
 <CAMKF1srfwp+o0FC5r+Y+NfmWV3hFCJr7ifO5rH1C0+Gos-HejQ@mail.gmail.com>
 <DFZIJWAQTT0R.2QPUKVEBUL8K7@ti.com>
 <CAMKF1spQbv-WCy9XEBxiK-Hzn1v=XZnGW8jWdOkk2axsx7r13A@mail.gmail.com>
 <CAA_5you6j=mVutd7JkF7Pxpsn+rhmg+NazFc0=pFXz8=LFW3Ww@mail.gmail.com>
 <DG1HOGASBF39.XTOA1VCZCPSR@ti.com>
 <CAA_5yotjKeeJHf+vio5e=KpojE=yOBAPem71SoZmNUwAUNT8xg@mail.gmail.com>
 <DG2EDPK1VQBE.3XAOY279FSGX@ti.com>
 <CAA_5yoszcBBMpcJ7iYkCOvUqGw21hbED1o5iK+w=EkDDhjYZAA@mail.gmail.com>
Content-Language: en-US
From: Changqing Li <changqing.li@windriver.com>
In-Reply-To: <CAA_5yoszcBBMpcJ7iYkCOvUqGw21hbED1o5iK+w=EkDDhjYZAA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-ClientProxiedBy: SI1PR02CA0002.apcprd02.prod.outlook.com
 (2603:1096:4:1f7::16) To CH3PR11MB7297.namprd11.prod.outlook.com
 (2603:10b6:610:140::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB7297:EE_|PH0PR11MB5928:EE_
X-MS-Office365-Filtering-Correlation-Id: 1e8eccee-131d-46e3-c2a6-08de62df3adc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?bGhYOGZXeU9yYkF6YllVSmwwTHNjN3VnU1QxK25xQncrUGp6TlhTcnVMOTlN?=
 =?utf-8?B?YVQyeEJrZlpacy9KZUgxN2RVMU85eWZwbDROTUNEaG10aHhUWWdISTFOa0lN?=
 =?utf-8?B?RmRhano2YkdDOXZZVVJlOUtaeTVKV0xhYUUzcmNUcWUwOWJnNVlMTjRwd2I3?=
 =?utf-8?B?aXp5VGFhMmRpNzRYeGNhcENUMlVLMkI3TVkxY0JZRk9IZ1ptSkpIdVJGalV2?=
 =?utf-8?B?N1ZTclFIYklEZXBOVjI4Ti9BNUtoMk1ja2M1N0ppbE82ZlBiSzk5UXhOUDB3?=
 =?utf-8?B?QWthNGFjVkNRL1ZZcmdHWjcyZm9RY0JjSnpYZEJDNXZwNTFrbWZHd2NWRnd0?=
 =?utf-8?B?OVNQUGRrQnBtb1l1U3FsWlV2UnhnaW5WWkJ3cE56WENyQVZNdE1jTXp3YlZy?=
 =?utf-8?B?NnJpb2Z2T3lUN01zNFRtNk9HTlRIclE1eVJCV3hTZnFadTQ3czc1Nm45SHNU?=
 =?utf-8?B?aWRxeHM4WnQ1V3lrdVViS3V1TVFRSzFLaHdnbkMxNlBpQTNmUkJnKzA1YjZr?=
 =?utf-8?B?ZHZ6c2E2UUQ4YVl3K3JXbEZWaVUzTnlHWGw0bG5VSHY4WmFFVjRuamRQNGM3?=
 =?utf-8?B?NHk4d1VzSk1CdzJSYTRCcXJRTFNhckIrdERwdVZPN3Q5OTFoTjhjYy8vYjRy?=
 =?utf-8?B?RUxFS3QyaW9ZdFU0M0w4YjJPeHNINEIwTjhqeDdnM01idHFOVFZ5M29oTGhz?=
 =?utf-8?B?NGJBd04veEo0NElXTmFKT3FBSklobE1oa09zTnVmQ1IrVWNlRVlrT2xKL1Ry?=
 =?utf-8?B?Z2g1TWNDejR3bXRrYitENW5uRkVucksxaHlZRmtRS3VQRUZrZkd3cnB4QmRY?=
 =?utf-8?B?TVRFb1JoZDV4eDdXbnhYRGQ4TnZPRlBUSUhSU1VFSnE1QmlPSllYcVVva29S?=
 =?utf-8?B?T3Y1amJKTVFGUGs4NWxJd3R3TUpyMXV0aWpEZ083WGRXT0MrVk9MTUVTd1gz?=
 =?utf-8?B?a3I5M3h1SmU4MEZQZ1ZqM0VESGZBbjJNVHFGVlpzL3djSG5naHFpTmpodUJa?=
 =?utf-8?B?dFlONkd2UVkwT1J1S0xKT1VPWXJiTnh3dnNVN081cGdqN1lrbDlLdS9wWDBS?=
 =?utf-8?B?SXVINkg0TWtBRzlkWTdOc2hBR0FaTFJKTHBYMGJ2Q3FjdkRuSW00c0k1YUFk?=
 =?utf-8?B?VnhQVmxGME1WRUw3K2pOdG12a3FBd2ZFaVE2UkV0T3YwdHRyaDkxOEFsY2dP?=
 =?utf-8?B?SERRT1RlQXJRRzRDc2hFSU1CR3JMNWhZcWYxSHBDaGQyZlpDbTdDMmZtS0Zi?=
 =?utf-8?B?c0ZBZFc0a0FSbzR6VjkyMmozTWRZWXVIUzNmWHkwOWcvRzVWMTM5Y0ZqY1NJ?=
 =?utf-8?B?aEM1RHN6V2RCZDB0cTdsVjYxaWVPQWVoK0d0THFlMWJGdU1OM2FsQ1FENENS?=
 =?utf-8?B?eit6bXp2Yy9PVGlEdURtYm90bXhRUmF1M2I1dnBtMWZqK1V5UjJOZmtSL3F3?=
 =?utf-8?B?ZmpJN1ZLdjd2Z3RQUlBkaTRXNDRRVmpZRUZNbk1RZVg3Sk11cnZ2NHFaMVRC?=
 =?utf-8?B?RC9CUTRteEFpRGdMbW9ZdEtTb2oyY3pVNlI0SVdRKzduV3dtb1oyUDBNaFBw?=
 =?utf-8?B?aDNyb25jeTNndjNua2VpK2FsSTVnclFETGhMVmZTZUhodHBwUExzMUMzRzg0?=
 =?utf-8?B?bFFtQVZMYXdvdG9KdTNhREVNWHp0UlpDSDI1NGtPZVoweVBKZVlyZ0VVWkNU?=
 =?utf-8?B?dUs0bW1OcmtGdjJIdm9hQTJVbUVoUkZMRUZoVjl5bDRPTXRhNmV5SURodno2?=
 =?utf-8?B?Mm9QMVV4SkcwSVBKWmVESUZJcEpYQ2JENkJLNXp2eU03bC9pcDdxVDluWjJW?=
 =?utf-8?B?bXJKb0l3elB2VHo2bkc4K0l4UmRXeU90eXM0R1pQZ2xFV0dtQ3lKZXMyK2M0?=
 =?utf-8?B?NDNMY3lnY2ZRZ3BQdWRtck1LL2VFUXBjcW1TUmNEaVBndEJCNmh2cVpYQXor?=
 =?utf-8?B?d3U0WGZKTU1jYW1HZmxPT2xBSkp1QTZyVU4vUDZZamJkM3l1VTVUOE9xaGhq?=
 =?utf-8?B?cVo5MEp2cmMyeFcwQlBRWnorbzdiUFhLVHRncm5CL3Y0Nng4MWR6YzZiWHZV?=
 =?utf-8?B?Rll5VDdFNFQ0NnQyZlBybEVJd0diRVhCQ2p4a1BibmZLUUF4WWpUVTRUemFW?=
 =?utf-8?Q?pHQb9Mqj01mAYQyqdaTjGJY2t?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR11MB7297.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?VFpETFdGSHRZalU3WlZGdnNlNmljMGZsNEk2R2pkeU1RNHJVM1NIS0dORFpz?=
 =?utf-8?B?SkR2aXFISnFhNHBMcmdTNm1PRFFFcCthcVVZNjNNQ3VQVVgzbmFkSDhxS0xD?=
 =?utf-8?B?RTZnR2kzNmF6NGlWVG5xdXBHL3orblBFR0NFTkFQTi81bU9SbkYzeXZNYnRO?=
 =?utf-8?B?V1BETFJNMjA1ZEo1Z3NYenBnN3djdUVpZXVrOGVwOFdUSDc5aHd5WWlkYkps?=
 =?utf-8?B?RGZBWCtBdEVjQmxHS25RSExSbEtwRWIxY0NTTGlMNmp2VXY5TmFGeEZSN2N1?=
 =?utf-8?B?ZWUxYzNYNHFRSWJObUF1NkdZajhLRFc5WWdXVDEweVF6N0pSU25iMllnRFQ2?=
 =?utf-8?B?b3MwNzExRVVNYmVFdVZhNmcwVVVpVEFscTQ4bXBiSmdLS2R1SlFxdGVmMXdv?=
 =?utf-8?B?YWtwc0ZHa1ZYTDdqbzRpK3Z6NkhVcGxOYmNTVWhmMjJJMGlMUERBQW5RYkdX?=
 =?utf-8?B?SGVEWGlZcW1Jd3JVRTlDS1hSak1PcGErZHphRlk3cUtydG4vL1E4SGx5WWxZ?=
 =?utf-8?B?bWw5LzdhUklPWjMvNkJmN1ZNVk0xU002bDVPWjNkWDRoS0hiTkxOZkwyU2J3?=
 =?utf-8?B?b2EzS0cyMWdMVDhGVjNURDFpbGdQRUNtdHE5VjZsZlVwNUFJVGZ2cU9yZlVx?=
 =?utf-8?B?Y0NCaWVxUTNvb0pUaVc3WjYwUHVxWVUwbDZjdituQ1RRUWNxRy9ienNRY2F6?=
 =?utf-8?B?NkRtb2IrU1MrMGFyVWVvWjBVbGdsc2lseEJEMldocC92K2VCSy9oK05XYnIr?=
 =?utf-8?B?T2lFN1psQi9lY2VObkFDSS9rcTI1OERsdzF4eEx5TjZHS0VwVEZ0ZnE3VDYy?=
 =?utf-8?B?eWRTY01TSXJCSDBoUnNpVG81bnpqM1MvL3p2QlYzOGZQY1hhOFJLdVZaSmhx?=
 =?utf-8?B?bXRyQ2JZbjdYbUVNaHFmTE5iMDFqQmxsdTFwYWFxQzFCZ1JYSDZWa0swL2xV?=
 =?utf-8?B?N3NoeFZ1cWJ5RzFXbVo0UGw0TWdLRWFrVUJMNDMvQmtMR0s3Q1dNQk1zbllQ?=
 =?utf-8?B?cHpXcnpsMU5VdUp3SzExYy8rbHVoSHN5a3BCRHZDYjlxbVdGNVpyV0g3UlBS?=
 =?utf-8?B?dCt4Wld2N2k5WWlib1NSc2ZXQ1hqVUptVlkrV21UNHcvL1NCV1pLcnVYUW1P?=
 =?utf-8?B?S1ROR29kQzkwS2lmUGxLWjFHS29teUpDWUxVMXVNUnltalFVYlAwRzhXWjZQ?=
 =?utf-8?B?ZHZNTVBiMmcxT1F1WFp6NThHcHBjWm5YMVVkODJOWlhlSEd0QjgvTGptM2x2?=
 =?utf-8?B?L0xsSU1zS0h0dG9FM0xOWVozV1luSTUraXh2MzlpaWxrdW9PbUhwZHZQaUZW?=
 =?utf-8?B?Z2pMb095MkRsNnZVN0k5ZXNQWjgvc0xyRW5hdWRhVkNHL3ptYVpVMDA4R3N5?=
 =?utf-8?B?eXMvbGcvdm5rSk0zRldnaitJR1krcGRGSFk5bTk4QmZVK3k0WG5OSjh4TnYy?=
 =?utf-8?B?eFRHeDJoWTJyNENWM1B5amUwN3BVNlMvcG40aWxjZCtqTjdZRUU0a2t5TENY?=
 =?utf-8?B?UkNhUnJGVTRuRTFGTEg5NnlTMVo5Z2JnVWkzdG9nSCtUbmx5YU5XbGhqRDJp?=
 =?utf-8?B?ZEhxb0t5YkY2blBrSkNkNC8rak9SZHZJSW9hd2VlNGlIK2ZHYWpBODZSYVhD?=
 =?utf-8?B?dXJXT1R5RUgySFJYYjJ4MXJUeHpUelpBWHJVTzJqS3A1ZHdQenpzSDhaRlZy?=
 =?utf-8?B?UTdUM3JtU2Y3aW55N0oxYWZsSlZCaW9TV2VOWVNjZ080SG9DS3F0OWUrWFRW?=
 =?utf-8?B?RlU1V0psbncxanZyREVvYVl2UlM2N3JJYzdvMDdrV0ltSzlqa28yZWxBRXcx?=
 =?utf-8?B?dG9BdEhHY0xsVGR6eW4yWDlwUDZiVm5wb0VPSEFzR252ZmtOZS96ZjZBZm5u?=
 =?utf-8?B?SEMvZXpUbjljUlJQeTRjb2FQM09xcFl6VlF0bXJ2bnEwTDFvOTlIVEtpNHh4?=
 =?utf-8?B?TDZMbVVFSzV5UXVMTk4wK3IwTEtJYnpOZXEzZG5KWjVmWmxBdzF2Q0ZIVU9m?=
 =?utf-8?B?VG5TdHVpSnFWaExtMkx1V0M4MUlLcXpBNHQrckJOK0grWEx3N2FrMFZZRk4v?=
 =?utf-8?B?V21ZVFo2NHRRcHI0TjFYTXBwb3lJMmlvaERNZlU4cG9WZ29xMFMvanU3TmxM?=
 =?utf-8?B?eVZiYk11aTQyVHZnRzJobm96WjRhajNzMFJKSGNqNVZtNlVpNGdZT0pUMytq?=
 =?utf-8?B?L3RNNlMvcksvaVVVZzFudUgxSURDL1c3RTIvWFgwMVFVZXhKT05QSDRrNzFF?=
 =?utf-8?B?aCszRzRlSHJlbDVVWFgrdlZ1WTZxYzZpRXVHUExTMlNZNnh6UWYraTV4Y1ZV?=
 =?utf-8?B?TlFEaWcwbFcvTjNwVkdIWE1yUUJNTTB4aUR5dC9CRlR4UjZnTUZMVklwRXNW?=
 =?utf-8?Q?iyTFZN78onoXgm3A=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1e8eccee-131d-46e3-c2a6-08de62df3adc
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB7297.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Feb 2026 04:46:44.1999
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VuqCN9t/2oA4q1eqwpNaq/7pLJZPsuohOWKsGcaqnPQx4oG35y61eORAWEEFP752dVSbAD4j3IkzXHCcrF40zjFhY0vpvHnbUfwHSBGJeaY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5928
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-GUID: nVHyfAxysdUm2UhJUYK5HiP2emNMNpxj
X-Proofpoint-ORIG-GUID: C_GFxSa3vCGv71HTMIlH9Dp1O-seXuBw
X-Authority-Analysis: v=2.4 cv=Htd72kTS c=1 sm=1 tr=0 ts=69817dc0 cx=c_pps
 a=yHj7y5KTVbbUXXBv8k4PkQ==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iGHA9ds3AAAA:8 a=Q4-j1AaZAAAA:8 a=sozttTNsAAAA:8
 a=Zv4IlEuk0AKdlI7XAgkA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=nM-MV4yxpKKO9kiQg6Ot:22 a=9H3Qd4_ONW2Ztcrla5EB:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjAzMDAzNSBTYWx0ZWRfXyOdy0UA+8BsH
 SeKJ04cUXi/pDRidTHferjeXpyJxuXo0oG3Fraw8oaOsXICFIywsdHWehCc4iUeeNRZ6DuMRkmk
 Ka6ciQh2tQzjtu0Sao+2lGuDCH7VvJiw/zKAV5QDPxkGympecMt7uPUd4qED/X7QUypJdkft3aS
 RVALtgPVwZTM5HYm2ZRSTG6RgY5Dbt4zlhjf1I4BGbilsNZ9bqCBGX0Z53Djr1MmBFPVFgNjYhZ
 zgWHJYp9NmkY1/nZKP7hm0US+qA/tTDNJAzod2snglpdCmGoRcU4H7KjyaVagQkSS7FfdHyk+Mv
 bluQdKPu9tS9uh4GddVxx7nEp1WlEJkSaCQr1uK5Ihz04nuqpGrKl+qHJAgYRlcjUl/AS+BkqNm
 DNY8w0mDhePMRuierFwXpe5lNCh5s28W/aeJdtby5zGzob8rQQ8z0aAK7ynhRJy2OfRrKdDZZXj
 c5+Apx4LZwvfB9+i7rQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-03_01,2026-02-02_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 clxscore=1015 impostorscore=0 priorityscore=1501
 malwarescore=0 suspectscore=0 adultscore=0 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602030035
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 612NUh1u507457
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 03 Feb 2026 04:47:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/230418


On 2/3/26 04:10, Ricardo de Araujo (Salveti) wrote:
> CAUTION: This email comes from a non Wind River email account!
> Do not click links or open attachments unless you recognize the sender =
and know the content is safe.
>
> On Fri, Jan 30, 2026 at 10:52=E2=80=AFPM Randolph Sapp <rs@ti.com> wrot=
e:
>> On Fri Jan 30, 2026 at 9:22 AM CST, Ricardo de Araujo (Salveti) wrote:
>>> On Thu, Jan 29, 2026 at 9:15=E2=80=AFPM Randolph Sapp <rs@ti.com> wro=
te:
>>>> On Thu Jan 29, 2026 at 5:45 PM CST, Ricardo Salveti via lists.openem=
bedded.org wrote:
>>>>> On Tue, Jan 27, 2026 at 1:50=E2=80=AFPM Khem Raj via lists.openembe=
dded.org
>>>>> <raj.khem=3Dgmail.com@lists.openembedded.org> wrote:
>>>>>> On Tue, Jan 27, 2026 at 8:31=E2=80=AFAM Randolph Sapp <rs@ti.com> =
wrote:
>>>>>>> On Tue Jan 27, 2026 at 12:12 AM CST, Khem Raj via lists.openembed=
ded.org wrote:
>>>>>>>> I am seeing some additional diagnostics see
>>>>>>>>
>>>>>>>> https://autobuilder.yoctoproject.org/valkyrie/api/v2/logs/511915=
3/raw_inline
>>>>>>>>
>>>>>>>> I wonder if this is related.
>>>>>>> Man, the mail clients are having fun with this thread.
>>>>>>>
>>>>>>> Yeah, I'm able to reproduce that issue locally now. Not sure why =
it's this
>>>>>>> package subset that's acting up, but it is directly related to th=
e LDFLAGS
>>>>>>> change unfortunately.
>>>>>> I think this is exposing the underlying issue in packages perhaps =
because they are
>>>>>> not respecting CFLAGS and when it's gone from LDFLAGS the mapping =
related
>>>>>> flags go missing. I have a local patch to fix memstat e.g in maste=
r-next, all failures
>>>>>> perhaps need to be looked into one by one and passed cflags from O=
E env which
>>>>>> might have been missed thus far.
>>>>> Just noticed a similar failure with lxc (meta-virtualization), but
>>>>> while the prefix-map options are provided via CFLAGS, it only works
>>>>> when provided via LDFLAGS, probably due LTO (enabled by default by
>>>>> lxc).
>>>>>
>>>>> Patch available at
>>>>> https://lists.yoctoproject.org/g/meta-virtualization/message/9553
>>>>>
>>>>> I guess recipes forcing LTO will probably have similar issues.
>>>> Ran a test locally. Looking at the do_compile log there are actually=
 several
>>>> compilation steps that do not have the macro prefixes passed as cc a=
rguments.
>>>>
>>>> That LTO bug has actually been addressed, it's just as Khem Raj poin=
ted out,
>>>> sometimes CFLAGS is ignored and passing the prefixes with LDFLAGS wa=
s masking
>>>> that problem.
>>> I did look into one of the binaries and it was built with the right
>>> cflags options, but didn't investigate too much.
>>>
>>> I can also confirm that it works fine after disabling LTO, that is wh=
y
>>> I think it could be related to it.
>> Oh boy. Looking into this more today, spending plenty of time trying t=
o make
>> sure it wasn't meson or some other argument combination causing issues=
, I
>> stumbled upon this thread [1]. They report the same issue with debug-p=
refixes,
>> but they also cite potentially package dependent behavior with LTO. Th=
ere are
>> quite a few open threads about LTO behavior in general that are concer=
ning.
>>
>> Maybe this should be reverted and the alternative solution for cgo bin=
ary
>> reproducibility should be taken instead [2]? I don't really have the r=
esources
>> to start on compiler development at the moment.
> Right, it might be indeed better to revert for now as we will probably
> face similar LTO issues with multiple recipes and layers, since the
> bug is still valid upstream.

I did a world build with this patch + LTO enabled with our distro,=C2=A0=20
there are many failures, and it should be related to

this change.=C2=A0 I did not check them all one by one, just check some o=
f=20
them.=C2=A0 Eg:=C2=A0 cups(oe-core)


Maybe we can only append DEBUG_PREFIX_MAP in TARGET_LDFLAGS when LTO=20
enabled. I will send a patch for this later.

So we don't need to revert this change,=C2=A0 and but we also need to tak=
e=20
the following commit:

https://lists.openembedded.org/g/openembedded-core/message/230059


Regards

Changqing

>
> Thanks,
>
> Ricardo

