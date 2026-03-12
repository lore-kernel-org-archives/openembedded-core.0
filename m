Return-Path: <liezhi.yang@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 06AD21067037
	for <webhook@archiver.kernel.org>; Thu, 12 Mar 2026 14:15:32 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.22552.1773324928496694243
 for <openembedded-core@lists.openembedded.org>;
 Thu, 12 Mar 2026 07:15:28 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@windriver.com header.s=PPS06212021 header.b=gSpLszOn;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=75312aa6c1=liezhi.yang@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62C9er3o021416
	for <openembedded-core@lists.openembedded.org>; Thu, 12 Mar 2026 14:15:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	PPS06212021; bh=6fcwcibrh4csso9fhgOsJDTJbOiLma0IOrbV7Bted5o=; b=
	gSpLszOnsHP4EPkG0x82VRbYjudbI2xRryI2PPCewJfK04dg3odoDRg5rGR4iiYx
	0yR+S2kIqHpfOoZxwnBbWSPdyV1TPP28tLW4gcPCqej+LIZURVUWKtIq9Ay0LQQX
	/fJM0vUpOXPW9hgWsIWCO1gvyuok+uXucbwbmcIcNcADYbRx+pc28Tm/IhAHt9bY
	Mxp7PGfNYkNZuU4ZyeElWvh9FKn9214EOKpZOcXQmp09fRoQtT44ayYdDpm9dZ1I
	jEAYyY8TCwimS1Ueaqq0VhwczNQ8osEF/zDimXqDVogmyDjlSLrf9EkP899ZoSHs
	XMV2xgPXS4o/uE3OGUcmaQ==
Received: from sn4pr0501cu005.outbound.protection.outlook.com (mail-southcentralusazon11011067.outbound.protection.outlook.com [40.93.194.67])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4cutxqra5e-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 12 Mar 2026 14:15:27 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FesYx19vTNR96oflzQcVeBQ4zcB4SlHJ7mXdp3IOog9CO+LzHYfR3/UGBvokP5ZpzDHuRXW57TfTah6H3slZKaaRh2+0P364goSoWqF/tZgRpuYD47Uer92VViIsehM5IQ+ceIUmaFIz8VzUQDzklRXCDxehQ5BgCLk3zaSob4461v1UzMCKfj7Xk8TIPY5mvWzBKdGRS8Dl/MFbnmMMhmXEj2mcaDMU8uo6crcuUeqsRtL1Vvc5RFTGsry3nJsBbJErm3BejdfHlQS69cOhs29/AGN3Q2dyYyWOc3skCq7hXeQhTroF0N+M2VR6WMD+3O4EWNImRN9o4yYSm622Kw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6fcwcibrh4csso9fhgOsJDTJbOiLma0IOrbV7Bted5o=;
 b=gkWSPeomOocqCvft1LBQcFMCgfYvJxiutZrzwy2m5uaWUCWFyylP/Kk13+o2bcSNbjU7U8CrmJ8sxbhI/1nE/MuUkcN+vcPT5Ci/yRnEU0ahWflIdPVXLfYFtzxBud1pofs2KiSAT34FS0DTtoQd0bElyYShQCNMeFjdc+mZ3JAhr4RL0h+bDYgqqqBS0qXBJE4Q7REtVHC4i2EgEMohKUxyaPrHx0ce7W4iMWQFWIJG89DiVkd/nIcwCDF/opHAZyj4q8o3t6rwbYIX/30onVufN4sUisc74DG+gk2jSU0GSWpI1ng+NjuCBUqLxGVFccpr6oz66tBEq/sPW7N0Ew==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from LV3PR11MB8531.namprd11.prod.outlook.com (2603:10b6:408:1b6::15)
 by DM4PR11MB6017.namprd11.prod.outlook.com (2603:10b6:8:5c::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.6; Thu, 12 Mar
 2026 14:15:23 +0000
Received: from LV3PR11MB8531.namprd11.prod.outlook.com
 ([fe80::f908:c07a:c64d:67a3]) by LV3PR11MB8531.namprd11.prod.outlook.com
 ([fe80::f908:c07a:c64d:67a3%6]) with mapi id 15.20.9723.004; Thu, 12 Mar 2026
 14:15:23 +0000
Message-ID: <8b79a7e5-d706-4d4d-ab23-6933eece6c93@windriver.com>
Date: Thu, 12 Mar 2026 22:15:15 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] RPM 6 in Wrynose
To: "Matthew Ware (mattware)" <mattware@cisco.com>,
        Alexander Kanavin <alex.kanavin@gmail.com>
Cc: "openembedded-core@lists.openembedded.org"
 <openembedded-core@lists.openembedded.org>,
        "Elliot Sparling (esparlin)" <esparlin@cisco.com>,
        Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>,
        "adam.duskett@amarulasolutions.com" <adam.duskett@amarulasolutions.com>
References: <SN7PR11MB770572B1859AB0B7EB592DE3CD46A@SN7PR11MB7705.namprd11.prod.outlook.com>
 <CANNYZj9Y0Fk_DHxTcP-2cqmYnzcD4_VSg5eihwXp1Vc10HbREg@mail.gmail.com>
 <SN7PR11MB770587ED31BE8EE18D973740CD46A@SN7PR11MB7705.namprd11.prod.outlook.com>
 <SN7PR11MB77056419029EAA594968E1DECD46A@SN7PR11MB7705.namprd11.prod.outlook.com>
 <CANNYZj8uCJWnkhvh=CecWiawWd57k15wdqcfzc3mtbxoMFqSHg@mail.gmail.com>
 <SN7PR11MB77053FF5985F085C57270866CD46A@SN7PR11MB7705.namprd11.prod.outlook.com>
 <f2209b0a-c297-463c-97bc-7139732c498c@windriver.com>
 <SN7PR11MB7705A4E28D635E7CA5B10512CD47A@SN7PR11MB7705.namprd11.prod.outlook.com>
Content-Language: en-US
From: Robert Yang <liezhi.yang@windriver.com>
In-Reply-To: <SN7PR11MB7705A4E28D635E7CA5B10512CD47A@SN7PR11MB7705.namprd11.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-ClientProxiedBy: SI1PR02CA0013.apcprd02.prod.outlook.com
 (2603:1096:4:1f7::7) To LV3PR11MB8531.namprd11.prod.outlook.com
 (2603:10b6:408:1b6::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV3PR11MB8531:EE_|DM4PR11MB6017:EE_
X-MS-Office365-Filtering-Correlation-Id: e8e1e9f9-4bc8-457b-0a32-08de8041ccc5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|1800799024|376014|7053199007|56012099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: 
	xpxs9uEAxxsS2pl3XlgaJTXdZ2ULcU3lrG8ZiOIIJ3o83Qu1eLDaQooNIpzCwdTeuIJJj/KCOhQiDeeVgq1ks1ICz+kdzNbcM9LQcS3BuRQY7/qc2Nd3lzC2fog0ActG4nkrna0pq2f2RsgeDKXWZoENc3KEG7NR45wMjrEQ6t6ToZO5zHWQonXjYY520PB73sX4bX4YbXGLFY9nO0v4oCoo5WE9eVa04abU9n7H418L4WpR2rNgo9CDNgcSET4otI9t0nTSbSPThqI63VuSWF0opAFxhh9zacW/YIcOL6m2+8mtLFLPVMUXiTB8AWBI712fCNywYbUTCtJ0PbjOjvDCXpp/4gcwjH1pfPYwR8YYRyDhSQFQxNVpSu4rASjY3IjlM9mQRa9bDfApJskFZ8NYgaKEdZ6hSAF+RN7eGhqrkxiUVoETp2fBWk9KB7/18WNQK7Qrk4NZOzsRiUbcUDXmxPpGB8M6cY0QQU/75L76MNNPrsJkPpXYK/Gt6U4B2YTcjVOO+XStQJj0Rx+Cy1dteW4/zQImrXczsvx+dsrZe48OsSqd7mlDbI1fjAokQeA3SeBZwLVQ32X6JQ7ULW+MUOlkzmyDLxT62Vcelc5L7mV6gyqK7Akp4jnMiMAb3j5ponZNw2QZE/LlbIdPYWBWQGY+jr8a11reKzgPOO2ssEm1EUjlCuJCj5mpWS02
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV3PR11MB8531.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7053199007)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?T1QxSElBUHRuTkQvbmRoTWJlUWg4OEwwZ1hORHpIeGNsRVFhU3AwMnN1eElw?=
 =?utf-8?B?N2owbGsvemZBNEJXQWdVOUd4eW95WUxCUjIzZnljaFRpczFXM25CV1BIZlBD?=
 =?utf-8?B?a0NMcEhnT2ZsOFdicWtGV0t0Y0RUdGpiZit2TlV6VEovcGZBb3VNdkErMTRl?=
 =?utf-8?B?Q2J5ZU1RTE1aTUtTT2NEMjkzQmthdEpPUXExZzYwRDhEamlBY2cxSVFvMU9X?=
 =?utf-8?B?cjFMKzRzdXF5cCtkSVdVbUpCR0l0SzYzOXVkcnVwcUhWTElPV0hHWmhjOHpX?=
 =?utf-8?B?YlQwcG5ncUg1VTluOE1LTFA4bXdLaE9HTzk2STN3YVgwaG9nMFlMUGZ0aFBm?=
 =?utf-8?B?WjMwMlhIcThnK05VUFJMQkRKOFpqekJ4a0s2QXY2eHcvRjdjZFlpYmJqQWkr?=
 =?utf-8?B?K2lhUXRYR011dXVRRWhVZ0Vxdm9tMURRWHUxNTZaZkVxdm9RejA1a29ha0hp?=
 =?utf-8?B?bUJURm1KV05zV2lwSHVtV0wvL0xGREUyYlFpdG1XL2h2czg5eXN5aWJJUzE0?=
 =?utf-8?B?SVpGZ3dLcEhFN3U1WGZ2UTlPNm1wWFl3b1pyRGFBU2VYRnlURjhISWExbmtr?=
 =?utf-8?B?YXpPOGtCdjkvTjZmbGF5Uy9TUHVnL25NNkx4NUVaOEJ0TzZueWpTVllZRExh?=
 =?utf-8?B?UXM1OWpRYmMwTkpSQ1ArZWFwRUpZQ0cxd2dBampsR3dEZStRWmFGdHoreXE4?=
 =?utf-8?B?dXFHRGs2cDk5QS9HU2JURTNBWXV5N2Q5ZGRFLytjMUl2MDg1eEdad0QzL2No?=
 =?utf-8?B?NVBlOTF0U3RCdjhidDZGbkVoQUMwZ2FjSG9BcGorbEJEcHpkOEpycW5YNEZY?=
 =?utf-8?B?cytLSEhvWGQ5YTdDdTZVVVAwdmcyTysyWkhodUxySlkrTGFTT0FvVjFOVyth?=
 =?utf-8?B?Z3BmaERoV1QzRjZDdzQvb3l0T2RCQmZFL3ZZcUZaZkxuZXNWbjBqK01sSy8y?=
 =?utf-8?B?S0Y0T25BdXlJM1Y0OGtEbmpidVRkNmNUZXRqdkduUG15eTJiNVNLZkhIMkR5?=
 =?utf-8?B?aEpybjZ6SmtTTVRZR040TlV2bUtjVVVBS2dYMisrdU1zZ05hb1dYbStWSjlV?=
 =?utf-8?B?OFpaR1hlZ05YQ3BwandKMzVFWjg2Z3hUVk9pWGx5QzFTakh0U1FZTmU0WElI?=
 =?utf-8?B?Yk9HZ1ZlVERaY1I1SmpQVnl5SG40aytacG54N2w3bGRLY2lFYisyakY3YXBj?=
 =?utf-8?B?c0J2OTNadkJPb0dqTmZSenIySTN1YWtXUWx2MzRlQnNDbDkwTkp2dGM5WXJE?=
 =?utf-8?B?VmZwMER3bFJPellKZzhOMGY0RmZGaVpDRmJveGxxLzN1bExHTFVaS1BYRFdC?=
 =?utf-8?B?c0NLc0RjTGZsVkVyU1EwUUkrQlF2Sk44ZkRKVE43Y2VTbmNFY3NWcGRHbFAw?=
 =?utf-8?B?bjgyWGUwd3FoSEwvMnhwZTd3ZVc0NmR6TzhqaEhWaDdFUGMrcnFjaG1NMndV?=
 =?utf-8?B?Ry9CQWZaeWJNRWFnVFlsQzZwT1hsZ2dBSU96N28vUXlxRXB1a0xYQmh6YnFO?=
 =?utf-8?B?akFrNVZxTmE2SnZmd200U2dUb28yTzV3RmJnRVhmUGtNZENCYnRsM3pWcnBO?=
 =?utf-8?B?RWZnbXh4RzlSbFJFT3JRWDByemlsMENaL3MrSS83YnpCaFRVMXlTcE1UUDVr?=
 =?utf-8?B?S0t4aE9yOUZ6T2xYdHZraVVjRG1RVHBCVUdNdmVwcXdXQnRLbGFQRjZiQlNU?=
 =?utf-8?B?cHVqcDVscXRlYWEzcWk0MTdVVXN1TnFLYkRXbU8wYWh2L01OK1h0WHFiVG1t?=
 =?utf-8?B?UGMwamZicURFTHdtWU9XcUlyQkFtUDA1b0JQM09wNkp2d0gvbnZBNmc1VHRY?=
 =?utf-8?B?SmZRQWxPcG95ckVCSkV3VGtMUis2U0hOZ2RpakZuNHRyenEvcUNjM2YzWllu?=
 =?utf-8?B?NzR3aTc0SStIdUR5S2NoSHVxRU10RHJoR2k1SHNCNU1LaEMxaStqU29qVFRl?=
 =?utf-8?B?aHMyWXlld3p6R291a3VtcURRaGphSTFGZUhWWTJxRFpnbUhnTUNOTHo5dXVh?=
 =?utf-8?B?dWRXWFd4enBlZExmM3RibWtrMlFNaVBpVEpVZTIrS2xnN2o4LzFiQU1OSXg3?=
 =?utf-8?B?TFViY0pJS3lNSHF2QkREYXBYNWdVZnN4d3JCYmtKN2hnSENmUFg1VDJjVGta?=
 =?utf-8?B?MERNT0toRCtweGQza1lPUGprc0pSbHVyK3A1YVphVEdrUkVkamhVRUVzb2Rm?=
 =?utf-8?B?R09pZnh4L0JjeElVbkZCL1ZqZktxblBWUWlVRm5xU3RRSXROcjNjUnM2VmlL?=
 =?utf-8?B?WS9SU3F1REQ3RFBDUm51OCt4R0FmcFJ1a0RuTTQ2eCt6cm8wQXI1d3dHV1pW?=
 =?utf-8?B?dGpXZDJWK0JOUXVycC9VRVlhMFZBMUFXTndzRXRsdStFTUtOd1ZYc2xrVUlW?=
 =?utf-8?Q?6k2Zlq83f4JkahF8=3D?=
X-Exchange-RoutingPolicyChecked: 
	P88FoscuvLaJaGem3SfPBcRITkpTErpzFjN1gBWXu7Lua60xmTN+nmgSqK3HWIKtViamTP1IfgC5ATuzfCb2Ts3bLnVtWXIsuYEW79mFruCvAjCqZCt0E44+RL7BV/LE2Qiujx/ZwRr8Z1ELxCqOEwQ/PxVfijVWlOYUOIRpAO1HKaoDBFnGzRUiFBvI/kLjhi88FisiGLjSdeNji23up9mQLri8REc05fS1umok80ZfENOaghNj8JkVgjb6Fz+V3LMuH3jDWbjvX1YZM6+okTBevB+R8r7gF5ivpFYBQn2O0ebdFJsIUm5bn3DeR43422irm/XyyrGhTtKb5TBkfw==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e8e1e9f9-4bc8-457b-0a32-08de8041ccc5
X-MS-Exchange-CrossTenant-AuthSource: LV3PR11MB8531.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Mar 2026 14:15:23.3093
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 06ez2Pptc47ExcBQVSAu9ThJP6gaI2lY4HN+GvLM2TN7LXbvvqVkdthnPiwvdtY2QKNv/dyK30fweWdpEvFtjb3he+Jkp3ROldqy+lW9UX0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB6017
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-ORIG-GUID: 6Hxv8XNjDmlZmm84B8w3etbWFVXO2Y_C
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzEyMDExMyBTYWx0ZWRfXzSL2eJmRhRWZ
 /qJKkBkJD988NMHUEhoArUORB0Rpj8sYZ6fi+ajz+z4q+TxQ6R1v22OPYettj4z7LVY6iiO4AUP
 Vx54EriNb9OGUM6dyiqOy6GcNYRyCR54PxHFGdTnrENdpLwZf6dSVxtXlcEQ/nFU22xSIKJvO+X
 tA6AHyZG8/A7VdbcxRfRtYR9c2ITiDepdKaY2MHVgp3vIKCeQZCfeKwunlvg5iYUAu145Y0iXbm
 EWg64YDnKb0+o+POb9liMHdYogFNt5z+D9CjOwBMWJDoblmFShsHqavj5zG2h5HRHhDOHsqUGQM
 gHf/m5zS3WX92MqbTg0la5GQiomPASJ7UUMKrpHH7bGO5HlNzRwgkHailn7p7CDjAjmY763E1t2
 z51gmC8NL2oyDzLAws3hIRq6smeBQU3r6xvvxN1TwC8vWG4hforvDfnXpjRq9OPpB0jqsvU2FC4
 lIWmpj//rUcACp6UobQ==
X-Proofpoint-GUID: yaSnoJuhL9w-p5J6g2ZkuzQZ_kzfuazw
X-Authority-Analysis: v=2.4 cv=feegCkQF c=1 sm=1 tr=0 ts=69b2ca7f cx=c_pps
 a=m7Xu73pz8xWBtfo2USfVfA==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=bi6dqmuHe4P4UrxVR6um:22 a=klDOsUkWDRETUCZYPvoE:22
 a=Q4-j1AaZAAAA:8 a=NEAV23lmAAAA:8 a=uherdBYGAAAA:8 a=t7CeM3EgAAAA:8
 a=AUd_NHdVAAAA:8 a=pGLkceISAAAA:8 a=P-IC7800AAAA:8 a=iP-xVBlJAAAA:8
 a=rWPO94yTYL2vs6sf7iMA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=9H3Qd4_ONW2Ztcrla5EB:22 a=FdTzh2GWekK77mhwV6Dw:22 a=d3PnA9EDa4IxuAV0gXij:22
 a=lHLH-nfn2y1bM_0xSXwp:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-12_01,2026-03-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 priorityscore=1501 suspectscore=0 spamscore=0
 bulkscore=0 phishscore=0 adultscore=0 impostorscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603120113
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 62C9er3o021416
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 12 Mar 2026 14:15:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/232970

Hello,

On 3/11/26 23:42, Matthew Ware (mattware) wrote:
> Thanks Robert,
>=20
> I'm looking internally within the team for whether we have the resource=
s and=20
> expertise to be able to help at all :)
>=20
> If we do find the time/ability to help, we would likely need guidance o=
n what's=20
> been tested already, what needs testing still, how to test, etc.
>=20

I've fixed all the known issues and sent V8:

https://lists.openembedded.org/g/openembedded-core/message/232960

Thanks for everyone's great help, especially Mathieu Dubois-Briand.

This is the most difficult work that I've met in the past 17 years.

// Robert

> Thanks,
> Matt
>=20
>=20
> -----------------------------------------------------------------------=
---------
> *From:*=C2=A0Robert Yang <liezhi.yang@windriver.com>
> *Sent:*=C2=A0Wednesday, March 11, 2026 12:18 PM
> *To:*=C2=A0Matthew Ware (mattware) <mattware@cisco.com>; Alexander Kana=
vin=20
> <alex.kanavin@gmail.com>
> *Cc:*=C2=A0openembedded-core@lists.openembedded.org <openembedded-=20
> core@lists.openembedded.org>; Elliot Sparling (esparlin) <esparlin@cisc=
o.com>;=20
> Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>;=20
> adam.duskett@amarulasolutions.com <adam.duskett@amarulasolutions.com>
> *Subject:*=C2=A0Re: [OE-core] RPM 6 in Wrynose
>=20
>=20
>=20
> On 3/11/26 20:00, Matthew Ware (mattware) wrote:
>  > Hi Alex,
>  >
>  > Fair question! My team are looking at using yocto 6.0 when it's rele=
ased, and
>  > rpm6 has some features we're interested in. If rpm 6 makes it into y=
octo 6.0 we
>=20
> I'm still working on upgrading to 6, here is the latest tmp code:
>=20
> $ git fetch https://github.com/robertlinux/yocto <https://urldefense.co=
m/v3/=20
> __https://github.com/robertlinux/yocto__;!!AjveYdw8EvQ!d1UZR5NKHPP7CMaf=
-=20
> i8ietOYQm27QGloqRWeE0sM1Cjx3zDXxt8QfFSJfb9x-Xs80wt8QxoYvsIjj0HPNtGH$>=C2=
=A0rbt/rpm_tmp
>=20
> Currently, it can't provides the pkgconfig files correctly when the pc =
files are
> /usr/share/pkgconfig/, any help is appreciated, for example, help to do=
 more
> testing to find the corner cases.
>=20
> // Robert
>=20
>  > can start taking advantage of those features, and I want to plan for=
 that :).
>  > Similar with dnf 5.
>  >
>  > Thanks,
>  > Matt
>  >
>  >
>  > --------------------------------------------------------------------=
------------
>  > *From:*=C2=A0Alexander Kanavin <alex.kanavin@gmail.com>
>  > *Sent:*=C2=A0Tuesday, March 10, 2026 5:26 PM
>  > *To:*=C2=A0Matthew Ware (mattware) <mattware@cisco.com>
>  > *Cc:*=C2=A0openembedded-core@lists.openembedded.org <openembedded-
>  > core@lists.openembedded.org>; Elliot Sparling (esparlin) <esparlin@c=
isco.com>;
>  > Robert Yang <liezhi.yang@windriver.com>; Mathieu Dubois-Briand <math=
ieu.dubois-
>  > briand@bootlin.com>; adam.duskett@amarulasolutions.com
>  > <adam.duskett@amarulasolutions.com>
>  > *Subject:*=C2=A0Re: [OE-core] RPM 6 in Wrynose
>  >
>  > On Tue, 10 Mar 2026 at 18:24, Matthew Ware (mattware)
>  > <mattware@cisco.com> wrote:
>  >=C2=A0 > Also, since we're here: is there any plan to move to DNF 5? =
I see Wrynose is
>  > staying on 4.x, but wondered if there was a plan/aim for DNF 5.
>  >
>  > Yes, there are WIP patches for it too. Adam is working on it.
>  >
>  > I have to ask: can you give us some context? What makes you interest=
ed
>  > in having these versions in Yocto?
>  >
>  > Alex
>=20


