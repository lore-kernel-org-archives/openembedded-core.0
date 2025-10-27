Return-Path: <Qi.Chen@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1D794CCF9E5
	for <webhook@archiver.kernel.org>; Mon, 27 Oct 2025 05:08:01 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.25261.1761541677069391825
 for <openembedded-core@lists.openembedded.org>;
 Sun, 26 Oct 2025 22:07:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=RtS1cWTV;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=2395211154=qi.chen@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 59R4KgLL4108210
	for <openembedded-core@lists.openembedded.org>; Sun, 26 Oct 2025 22:07:56 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=PPS06212021;
	 bh=EyLBF2CHo2mkbrfBF52sGt88q71fLa+cW+dOHWSQhQ8=; b=RtS1cWTVPYeD
	ilj7Sx3tGgOQ7vX6nIB1f6carmLsNOJVBLPCUjXi3cl+rfavXkQ0RDXh/VD2YvIe
	jPIEsVnxQ4dfsDOqk1kmYUZvaZ/uVUZUy1Zu6IhNBLw4q2QGiCACe93nzQkiYqQV
	uH3J+BJh2+pjqzzjN4Dz9uvpPukRnkKW10l+AHvwjIcYpDcQ8xQAvH/oStAcNGC6
	fcAYBaftLhBQ8ugoYMKlxwDN5q/lbPuKxdzmtEJtgp/C5YL56OvVYtyayrTD5rLN
	jLg5BP2GZ1IiceXxqBQAmKhF/jbRL1g1zPez7iP4Qjyh9s2dkSH8R/uDKr6nduTo
	VDwE7ueWIA==
Received: from byapr05cu005.outbound.protection.outlook.com (mail-westusazon11010017.outbound.protection.outlook.com [52.101.85.17])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4a0x2e15kq-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Sun, 26 Oct 2025 22:07:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VWSKK9l4hYD27H6Gu+dDjeC7yg78CoJDTOSzAt33NFK+AS98/4XmHKyG3I/JS3BtVf2KGRIq7rQ1yd6/NP2hsx8VlGTltSVvtEFw2aSM7h8U5aggVXBhJfpm5RG560xG3I8ARCMaQaviOKlbOcy3DT8cN9vpIF+tGtMRwZqYX7u966AoZwlxAjHLaNENXwSat+uATPGRq2KI/x+qbn6AhIFFeUO7OGDLrsWyhMWGMgWugPUUNDvFZF3VbSUR53yCrZ8a9Dz+y7xYfQHLnO2IuS88zaR48pdoonvTqtspvLomNWHDMsSTRxKCRaK2TQrc2evarMm2yP8ZoIRQhs5KBg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EyLBF2CHo2mkbrfBF52sGt88q71fLa+cW+dOHWSQhQ8=;
 b=Y9FksE0fns0AS6cNymJ1BIfG4WZWC8y2Ab810f4pmbG6eLU1X2eScC93zlJ23XR1fWLUYmkqYyPVW0HqHux0tev481EKYggqXY8nqBF3RhXaoAE0QBUOxm4UvaPDcetjL/uRYkGrp+kBiGz2yJ1kXpwS7O0GnqZKBPef2KRQLqq17pw4TeNR0uXzOQ9Ql6uKi5TyxRNmBu3zcjHn+RSqG0xrmDfKHkddHIX8C4ZAEZ5Lp9r8yFFs9WcPck5R0mf7PO6LI4szkVgXkhvx/l/WtMDy79hIaz2Ekb6qmULCQPPNS5qJLpcEKi1K3Ll+4XdQrK08btJFQLwvZ6K/9MdzvQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO6PR11MB5602.namprd11.prod.outlook.com (2603:10b6:303:13a::5)
 by CO1PR11MB5122.namprd11.prod.outlook.com (2603:10b6:303:95::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.18; Mon, 27 Oct
 2025 05:07:53 +0000
Received: from CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::5ad6:8f90:b01d:2c62]) by CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::5ad6:8f90:b01d:2c62%4]) with mapi id 15.20.9253.017; Mon, 27 Oct 2025
 05:07:53 +0000
Message-ID: <853d6229-767d-45a0-83a2-0f8e1bf3b2b5@windriver.com>
Date: Mon, 27 Oct 2025 13:07:48 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core][PATCH V3 2/2] systemd: upgrade from 257.8 to 258
To: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>,
        openembedded-core@lists.openembedded.org
References: <20251016084700.1537381-1-Qi.Chen@windriver.com>
 <20251016084700.1537381-2-Qi.Chen@windriver.com>
 <DDKQEKP5R8RA.185ZCAGQ6EA07@bootlin.com>
 <DDLHVDCXIV53.3EI69FW87CCB8@bootlin.com>
 <20c03386-14b5-46d6-b72b-24a1957ee15b@windriver.com>
 <DDPQZWRSRHB7.112430EANEZH8@bootlin.com>
Content-Language: en-US
From: ChenQi <Qi.Chen@windriver.com>
In-Reply-To: <DDPQZWRSRHB7.112430EANEZH8@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SI1PR02CA0034.apcprd02.prod.outlook.com
 (2603:1096:4:1f6::10) To CO6PR11MB5602.namprd11.prod.outlook.com
 (2603:10b6:303:13a::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR11MB5602:EE_|CO1PR11MB5122:EE_
X-MS-Office365-Filtering-Correlation-Id: d63b0262-64a9-43db-a3c3-08de1516c889
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?WEVqSFcxSlhKVm5lSExXaEZycXRqdjg0SkEyTEtadWpDbnUrUlNaanJEL3Rj?=
 =?utf-8?B?Vjhuc2FPSnhrTmVPS3dXcjAwSkZ1cXBQNGZJaUxqY2k3aHhLcXBtK1cwa2Fk?=
 =?utf-8?B?UTZmeGJSeFdKYW5DUmdEeklmRTYzVER2bnF1TS93dEtuaExSQ2FYc3NhUHI3?=
 =?utf-8?B?Mncwek5hQTlkaHhDQWM5V0JIM1pub202U3dvYVpmRURQeW5qT3BDSzFpamN0?=
 =?utf-8?B?Ylo0K3VLRmxUdUJsVFRtUjNmN2svNkFkNHJ1RzY2NEs1b1ZkVXpkLzVQNCtq?=
 =?utf-8?B?M2pTaFBVNTVSYVI2c3Z5Rk5oRXJkNlZjSVdhejRGQllMQjdMbFlFN1FielA4?=
 =?utf-8?B?QlZJNURidVlUby9pNFp1b0lpVk5yc0JnZEtSK0ZYMGN6eEU5a3gzbEpOdXdP?=
 =?utf-8?B?L3lPN0w2RTR5d0ZJOXR0TmhIUWtkRDg0OWswei9iY0JCWGhpQTVPc2RIdzFI?=
 =?utf-8?B?ekdqVmhWN2lNaHJ3RmRFdXhqYUdmSTViQWsrNGxBSncrZVVKajZxU21SWUJi?=
 =?utf-8?B?UWI1MC8zSUxQREQyRDJnMjkyM1Q5M3p4d21sOGhNRFZHT21hL1ZLKzZyaXhn?=
 =?utf-8?B?Z1ZzUm9pZHZBRzNiVGNGTWtRTHlHSXByRm1ydjA0Zlh0T3ErVmZ5WkFXSHZ4?=
 =?utf-8?B?TnYvV1gvUUxKWXJwcmhVUkJRaUpPMWJDUnkyWXVoZEJJd04wd0xxSzBEeHFF?=
 =?utf-8?B?SDZvU1BhTkRWdHE5bldUTi91UzJTdldlS01ZNm1odGRhV24zaWYyZDQwemxu?=
 =?utf-8?B?ZUZwNDJ4NCtSTmZYRm5xbGVoNVpaWllmNzFWOU04c3c3YnhDWnMxY3VKWk5U?=
 =?utf-8?B?cXpiVGpwM2dLQnpPcDJjdEtucjRxaTRIWmdVRTY3L2RBdWpDSTV1YThhMk5S?=
 =?utf-8?B?THNxQ0hFeFZybSs2K203by9BMVNtSVdTQkc0ZUxJZHgvRW1GUmtlRjM1aGhN?=
 =?utf-8?B?TS9IaEI3TFhRc1RnenhZcXVuQ0t1My9SaDhiSCs1eEs3YWFjR0I4bWd1Qk9w?=
 =?utf-8?B?RkJGUllDRWs1UkVDVXRTRVQxR1NRZ3h0Njl1OGZDQzA0ZzMyTUxib2NUdkZa?=
 =?utf-8?B?TnNqOWxyNkVTVjNxUjdhRXhJZ3JmNmFFYVN0YWo0L3FyT0kyVlZjYm5PZWcx?=
 =?utf-8?B?cUFoOTE5VHYzelBHdWtCWm1iUkRZaGFoZXl0aHNLWG15WkkydzlhNkxNdWp2?=
 =?utf-8?B?RFVPcXRyeUhCMEZUbFlKbWhia0kxcWVJYnBKdmxTaXQweGgxTFR4NHRUNi9p?=
 =?utf-8?B?VmlKaHN5Y2lZQkV4M1IyRmJsUEcvYTNzTVljSXRyLy9xRFlxUFRmNm5QTGUy?=
 =?utf-8?B?TWhrdTcyQ293WksvcXZwV1ZxeG9sbjdySDcxRWJGL2NQU1BsVlg5ZlV6aFVj?=
 =?utf-8?B?aGQ1MEJ4K0dwVVhtRUw0RkRuWUtnd1VGcUoxWnhPcUZBU1FNV3ZHa3gvS01n?=
 =?utf-8?B?ekphT3dBaWw0ZVR5dGpZQ2NPRVAxOUk5RVUzaW9KU0xQM2NnNjBZT0thaVZM?=
 =?utf-8?B?T0tmV0ErRWp0dWpJbTZXTy9pV2Q3Q3lhTEhuZkFJRERKcXcvQlovV0NFcllU?=
 =?utf-8?B?M0psMXg4dXJJcnZXVFBocVZscVpaMWNZT1c4UUpUMkE0ZlFRTWRQMVRDNGFi?=
 =?utf-8?B?TkhDMUo2REVhakE4L0Q2TlFFUXRIT0d1cEFFR0FMN2hSVjlZejdMd1kvN09i?=
 =?utf-8?B?aWdkVkkrdGJQUjhkbkdSWENJYk1nVHFjQTgrOTBReW9sMmRCTUtBZ1dpMjVu?=
 =?utf-8?B?ZkVlbmgwWHFsanhwQ1lyTldtY2I2WkNRNkw5YjhUQkdza0QyQzltajhkU2pz?=
 =?utf-8?B?T0hVRWdyS2VBME5UejRLMDZBOWV1TWFPMzIyeEZ3bkM5VklOSXNualNIbmR1?=
 =?utf-8?B?ZFVkd1RHaDFIRTBSYUhWV244M2JYdUg1VlBhRmxNR3dyMmc9PQ==?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR11MB5602.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?d2xoekJ2ZEhxOXRRekZEUVJrdzlKMkZSZ0grTTBPZEVLTmVid1J6S09KbzNu?=
 =?utf-8?B?MEo5OUM1WlZKN0xXeGJ2cEdxdDhqaUh6RytBMTl4eTRkQmFVcHZZN3pCblRx?=
 =?utf-8?B?cmdodVZjc293Z0szL1NLOGwyRHFHVS95ekg3b3BiMnF0eXo0V1YrNS9mOUJy?=
 =?utf-8?B?MzZleTV1YVJLL0s0K21PVEVVTzZPSGRMWE9GK2ZaUnB2eE9PZ29Gd1Z1ckRH?=
 =?utf-8?B?QkJqMVQ4TDRSNGVMNlIyVkp4SjRJUFpYYVc5Rko0RzVaSEdVQng0cVNpNjc0?=
 =?utf-8?B?NStndHA5eFU1RXU4SjlWYytLQ1p4WkFnRkw5UGEyN1NUODZZMFN0OEFHYmlT?=
 =?utf-8?B?V0lrSGNTaml4QUNWYUhYTUI2eWNxQ0E5ZlI1YksrcFBLbHkxcm00VmYxMXN0?=
 =?utf-8?B?SEk2NHNmdUd1MS9FNDkrM3paSXZLRDVGcFhUR0FidHB0Znh3bnRiNWd4dU5m?=
 =?utf-8?B?K21QZjZnVCtzellJNitVV2dFTTJ3RlAvdUFRYm1wTGpzamJQUThmdDlKdXdy?=
 =?utf-8?B?bzFpYmhjenpEa2R1MVhFdFhWOGgrdGVQRWVLeE5JaVR5ZUI0aVVhd2I0NGZ5?=
 =?utf-8?B?M2V5d25reTdyWm43eVRlVnVvV3FVTnRpQy8xK0MrUGI3RHNpQ2pCVS8rWjhq?=
 =?utf-8?B?Ym9EcEI5QU9sTUMrSmd6K0xrZ0tDcStYVjJkcTNvem9FbFFObEVwaEhHcHAv?=
 =?utf-8?B?L0h0b0YyT201eWtld2dTRDY0R2ZSQ20wSURlaWRQUTBJa1I5T1R2VGR3NHhH?=
 =?utf-8?B?eCtZQlZiVmcwL1pyNm1uZEwwUWVKdkRZZEZ0UGtrVDdLdHAxWlFkazhUYktT?=
 =?utf-8?B?cUpjNnZ5d0RvTFoyaVQwZzhoV01razY4enVqZTQ5bXlaQ3l3Ym1XZmM1aytl?=
 =?utf-8?B?TGtpM1cxSW05Vm9lMHpiTUF5MUl2SHdIK3hYYTZ1cHU1TmhkNHJZRktGcy9k?=
 =?utf-8?B?S3ZKQklXNEFuNDJnZ3dNcFJIQzZ4TldHeUpobnlBemJvK2o5d29ucFhGdzJ5?=
 =?utf-8?B?NVNIQTJ0Y3JUZE5USGdzYXBqNDR0bWlhekxjL0o3dGxkR3oxVFcwMm01QkJa?=
 =?utf-8?B?U0JGN0E0U0pIN0QzdWpPTU5xTW1RYzUrOGw4V0x0VG5CN2pXb1VZZ2E4a1hM?=
 =?utf-8?B?aHVsbHBOK2pHMGZjOC9wOFJtOGd0S0htQlg3UjNwQ3ZqVXRMbUJYMHExU1Ry?=
 =?utf-8?B?eWpWUnhZQ2FQVEZ2YmErNGZWYVRsdUJ3S2ROUm9xMzc3LzJsckJQT3I5VjJx?=
 =?utf-8?B?TXErY3ZnTG83cHlWNG4yWENwWFRrYi9BbWNmR3R6ZmxmUFJFeklrcE54Ymoz?=
 =?utf-8?B?c2RMVFBmZWxzdUhhUEhiMm5kbGhMVEMrd213aW9WYk1BT0J0ekxZUldrUjA4?=
 =?utf-8?B?UDkvSEhTeExmYVViZ1hVTDZKVFpyUVRZSm1EbXc3UHV0L3NLdkFJUXdJc3FP?=
 =?utf-8?B?QVF4TWExOTlFb1NBOTZ3K2YzdXVNQmpOQ1V3UVRMbEV0T1pRMC9CY1lGMWRy?=
 =?utf-8?B?aUppbXI3WnJ5WktoeDBmTURueloyVHlHKzdCWGdTaWFWOXV4blJWN3JpSjht?=
 =?utf-8?B?ZU9lQjBWaGJpUW1ORk92ZUEyaFQ1aXRBVlJiejZxemVPVXVsdTZkWHo0RkNL?=
 =?utf-8?B?OXcrZU5yaHM0QWJ1Wnh5MlVyOHdaRDBXdi9zeHJidFdHQUpON3U3bXY4VWNo?=
 =?utf-8?B?YjhYcWNLeWlqNUlWY3dCTlFqaEllbDBtazB2QW5GeFBDTjBHeHZFUy9FcG1z?=
 =?utf-8?B?Qyt1RmJVUCtGTk1TelY2RWpRbkMvK0VjblVxcCtra2ppM21NdmkxcWNXVlRq?=
 =?utf-8?B?dXdXc0lsa1VpQXVQV0svNCtncHQ4YTdQSTM3dzR1NUtlcjYyUFZYRXNRTG1M?=
 =?utf-8?B?cU83a0ZVcWphN3ZybGFWbnNjeUZRVjBtOWc4cDJKRkhkZGpEc1ZOU1Y3aVh2?=
 =?utf-8?B?YnB3UnpQc3RNS2lwNi9EdGRnZlJ5b1MwU0lEUEpnZXVtWDdPUS8zbzJnN1NF?=
 =?utf-8?B?OVZncmp3bldsaTRLRG9pSXhsNVpvTGlKTldydVo3eWcyOVhvZE5kNFVtVVdw?=
 =?utf-8?B?S0llZFJuNXpNNldOZDE5K2NPQk1rUVk1YU1MMnd5QkRSSWRVTjZpd3o5VEYy?=
 =?utf-8?Q?sxJc8rE2godEVI7yHM7/4TvL4?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d63b0262-64a9-43db-a3c3-08de1516c889
X-MS-Exchange-CrossTenant-AuthSource: CO6PR11MB5602.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Oct 2025 05:07:53.8010
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YRi0MLO7ByPZpEoy5aAXV8HBDyMvd37wTKlFiflxLU0031Iad94E+WaH+iSf6OlIV7niyBVFNI8n8fFJtJS9Fg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB5122
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-ORIG-GUID: LPU4YZbrsKcIbkN40D5P9k4rlveDdV16
X-Proofpoint-GUID: elJoTwddJftu_p2JjuXl3Wa24zZSWe_F
X-Authority-Analysis: v=2.4 cv=F6Zat6hN c=1 sm=1 tr=0 ts=68fefe2c cx=c_pps
 a=+9lCAQqCkh6G/pz+5LnHJg==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=NEAV23lmAAAA:8 a=iGHA9ds3AAAA:8 a=Q4-j1AaZAAAA:8
 a=t7CeM3EgAAAA:8 a=alN6Qs2wofvBZIGtXcgA:9 a=QEXdDO2ut3YA:10
 a=nM-MV4yxpKKO9kiQg6Ot:22 a=9H3Qd4_ONW2Ztcrla5EB:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDI3MDA0NCBTYWx0ZWRfXysnMttHMUk8Q
 9F1TsRw4xdZ1OqSlK90bvHEWJO4yvWhom37X0MYaXWR9YPs1UUK9vsG10ETfya4bzcxYCN1EdZi
 XfMK8qw44wzN7JMrCLC6kMXDO33ESvztFF+POmNmNLjdZX/eQoiS3GKBstr0t6zkvcFy0qxElDl
 ii6ynxvkeEZ4wmFpRiofp862//x2HtcMVvoPuhXH3NRY7tee5cZD352rQEO/Pav91xBnyNNY1Y+
 DZTbdaijYLXp4LziET8fZRMaJr9cqOUBenfrxnjstg8hhdfvAXOxDkZzc2HzssyaTvx116R3nTk
 WrjWo4k3y/mY3GzpetcJk1zo10pYeHfneZWvTVrUIRk52nuaw8l6cvBoGEgtM2jXoh3/ieV/SwM
 oWEf5T6c0wi1De6T0ueTp5Po3C5PtQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-27_02,2025-10-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 suspectscore=0 clxscore=1015 adultscore=0
 impostorscore=0 spamscore=0 phishscore=0 malwarescore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510020000 definitions=main-2510270044
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 27 Oct 2025 05:08:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/225318

On 10/23/25 21:49, Mathieu Dubois-Briand wrote:
> On Wed Oct 22, 2025 at 5:28 AM CEST, Chen Qi via lists.openembedded.org wrote:
>> On 10/18/25 21:49, Mathieu Dubois-Briand via lists.openembedded.org wrote:
>>> On Fri Oct 17, 2025 at 6:18 PM CEST, Mathieu Dubois-Briand wrote:
>>>> On Thu Oct 16, 2025 at 10:47 AM CEST, Chen Qi via lists.openembedded.org wrote:
>>>>> From: Chen Qi <Qi.Chen@windriver.com>
>>>>>
>>>>> 258 Release Changes:
>>>>> https://github.com/systemd/systemd/releases/tag/v258
>>>>>
>>>>> The 'runlevel', 'initctl', 'telinit' related contents are removed
>>>>> because they are offically removed in v258.
>>>>>
>>>>> Disable tests explicitly. This is because we're not installing any
>>>>> tests. There's no point building them out. And this puts extra burden
>>>>> on making things compile for musl.
>>>>>
>>>>> gcrypt and gnutls PACKAGECONFIGs are removed as "OpenSSL is now the only
>>>>> supported cryptography backend for systemd-resolved and systemd-importd."
>>>>>
>>>>> musl changes:
>>>>> 1. This version has big changes in musl patches. The goal is to
>>>>>      help maintenance. I want patches to be more easily applied
>>>>>      to new versions. The count of files modified by musl specific
>>>>>      patches decreased from 113 (v257) to 34 (v258).
>>>>> 2. All patches are re-evaluated.
>>>>>      This version of systemd introduces big changes in header
>>>>>      files and other places. So the previous musl patches are
>>>>>      re-evaluated one by one. Those that are dropped are considered not
>>>>>      needed. A few new ones are added. There are some notable ones.
>>>>>      0012-do-not-disable-buffer-in-writing-files.patch is dropped because
>>>>>      there is not runtime error.
>>>>>      0016-Fix-the-segfault-for-glob-related-codes-and-define-d.patch is
>>>>>      added because this version of systemd uses strv_free to free gl_pathv
>>>>>      instead of relying on globfree provided by libc.
>>>>>
>>>>> Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
>>>>> ---
>>>> Hi Chen,
>>>>
>>>> Thanks for the new version. Still, we get some errors with post install
>>>> scripts:
>>>>
>>>> ERROR: core-image-sato-1.0-r0 do_rootfs: Postinstall scriptlets of ['bluez5', 'ofono', 'connman', 'xserver-nodm-init', 'avahi-daemon', 'rpcbind', 'run-postinsts'] have failed. If the intention is to defer them to first boot,
>>>> then please place them into pkg_postinst_ontarget:${PN} ().
>>>> Deferring to first boot via 'exit 1' is no longer supported.
>>>> Details of the failure are in /srv/pokybuild/yocto-worker/qa-extras2/build/build/tmp/work/qemux86_64-poky-linux/core-image-sato/1.0/temp/log.do_rootfs.
>>>> ERROR: Logfile of failure stored in: /srv/pokybuild/yocto-worker/qa-extras2/build/build/tmp/work/qemux86_64-poky-linux/core-image-sato/1.0/temp/log.do_rootfs.2882514
>>>> NOTE: recipe core-image-sato-1.0-r0: task do_rootfs: Failed
>>>> ERROR: Task (/srv/pokybuild/yocto-worker/qa-extras2/build/layers/openembedded-core/meta/recipes-sato/images/core-image-sato.bb:do_rootfs) failed with exit code '1'
>>>>
>>>> https://autobuilder.yoctoproject.org/valkyrie/#/builders/26/builds/2590
>>>>
>>>> Can you have a look at these, please?
>>>>
>>>> Thanks,
>>>> Mathieu
>>> Sorry, another issue that I've just identified, during image tests:
>>>
>>> Traceback (most recent call last):
>>>     File "/srv/pokybuild/yocto-worker/qemuarm-alt/build/layers/openembedded-core/meta/lib/oeqa/core/decorator/__init__.py", line 35, in wrapped_f
>>>       return func(*args, **kwargs)
>>>              ^^^^^^^^^^^^^^^^^^^^^
>>>     File "/srv/pokybuild/yocto-worker/qemuarm-alt/build/layers/openembedded-core/meta/lib/oeqa/runtime/cases/parselogs.py", line 185, in test_parselogs
>>>       self.assertEqual(errcount, 0, msg=self.msg)
>>> AssertionError: 1 != 0 : Log: /srv/pokybuild/yocto-worker/qemuarm-alt/build/build/tmp/work/qemuarm-poky-linux-gnueabi/core-image-sato/1.0/target_logs/Xorg.0.log
>>> -----------------------
>>> Central error: [    27.402] failed to find screen to remove
>>> ***********************
>>> [    26.897] (**) Option "Device" "/dev/input/event1"
>>> [    26.955] (II) event1  - QEMU QEMU USB Keyboard: is tagged by udev as: Keyboard
>>> [    26.956] (II) event1  - QEMU QEMU USB Keyboard: device is a keyboard
>>> [    26.959] (II) event1  - QEMU QEMU USB Keyboard: device removed
>>> [    26.991] (**) Option "config_info" "udev:/sys/devices/platform/3f000000.pcie/pci0000:00/0000:00:02.0/usb1/1-2/1-2:1.0/0003:0627:0001.0002/input/input1/event1"
>>> [    26.991] (II) XINPUT: Adding extended input device "QEMU QEMU USB Keyboard" (type: KEYBOARD, id 7)
>>> [    27.049] (II) event1  - QEMU QEMU USB Keyboard: is tagged by udev as: Keyboard
>>> [    27.051] (II) event1  - QEMU QEMU USB Keyboard: device is a keyboard
>>> [    27.401] (II) config/udev: removing GPU device /sys/devices/platform/3f000000.pcie/pci0000:00/0000:00:03.0/drm/card0 /dev/dri/card0
>>> [    27.402] xf86: remove device 0 /sys/devices/platform/3f000000.pcie/pci0000:00/0000:00:03.0/drm/card0
>>> [    27.402] failed to find screen to remove
>>> [    27.428] (II) config/udev: removing device QEMU QEMU USB Keyboard
>>> [    27.431] (II) event1  - QEMU QEMU USB Keyboard: device removed
>>> [    27.472] (II) UnloadModule: "libinput"
>>> [    27.508] (II) config/udev: Adding input device QEMU QEMU USB Keyboard (/dev/input/event1)
>>> [    27.509] (**) QEMU QEMU USB Keyboard: Applying InputClass "libinput keyboard catchall"
>>> [    27.509] (II) Using input driver 'libinput' for 'QEMU QEMU USB Keyboard'
>>> [    27.509] (**) QEMU QEMU USB Keyboard: always reports core events
>>> [    27.509] (**) Option "Device" "/dev/input/event1"
>>> [    27.567] (II) event1  - QEMU QEMU USB Keyboard: is tagged by udev as: Keyboard
>>> [    27.568] (II) event1  - QEMU QEMU USB Keyboard: device is a keyboard
>>>
>>> ***********************
>>> 1 errors found in logs.
>>>
>>> https://autobuilder.yoctoproject.org/valkyrie/#/builders/74/builds/2588
>>>
>>> Thanks,
>>> Mathieu
>> Hi Mathieu,
>>
>> I reproduced the postinstall error you mentioned in another email.
>>
>> But I cannot reproduce this one. I used 'poky-altfcfg + qemuarm' as in
>> the above link. Is there any other config I need to use? I referred to
>> the 'Write config' step.
>>
>> Regards,
>> Qi
>>
>>>
>>>
> Hi Qi,
>
> I've been able to reproduce the test failure with this branch:
> https://git.openembedded.org/openembedded-core-contrib/log/?h=mathieu/systemd-upgrade-tests
>
> Following config in my local.conf:
>
> ---
> SDKMACHINE = "x86_64"
> OE_FRAGMENTS += "machine/qemuarm distro/poky-altcfg"
> EXTRA_IMAGE_FEATURES ?= 'allow-empty-password empty-root-password allow-root-login'
> IMAGE_CLASSES += "testimage"
> ---
>
> And then just:
> bitbake core-image-sato && bitbake core-image-sato:do_testimage
>
> Hope this can help you!
>
> Thanks,
> Mathieu
>
Hi Mathieu,

I finally reproduced the error! It has to use OE_FRAGMENTS to reproduce 
the issue. I'll fix this issue ASAP. Other issues have been fixed. 
Thanks a lot for your help.

Regards,
Qi


