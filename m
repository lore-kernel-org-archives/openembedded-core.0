Return-Path: <changqing.li@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 086B5F5544E
	for <webhook@archiver.kernel.org>; Wed, 25 Feb 2026 03:28:29 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.38191.1771990101858252590
 for <openembedded-core@lists.openembedded.org>;
 Tue, 24 Feb 2026 19:28:22 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@windriver.com header.s=PPS06212021 header.b=JoDf5/Rh;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=65164714d9=changqing.li@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61ONMtwU616694
	for <openembedded-core@lists.openembedded.org>; Wed, 25 Feb 2026 03:28:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	PPS06212021; bh=n9dafbRWIFwr2yZPOjMpQ+yPgyNI4Vf/7E5K1lXa25c=; b=
	JoDf5/RhZ7gi4GUE/oMtaN3qPyrT7jsxu3KCNGclDwXU4KnHB3FF48Xo7AEuCMXJ
	z5gsibluK9La1ESXY3rIGYwf7YiqFYixfvcOiSyqANA9iegQwflhqA55k6NCLs6f
	E1T4cBu6lKYMDpeYhZjf1ZiMZgecQrjcp4UOe1VUD6b2ukxT7RhZzQdkiXAXH9E4
	2K3vmmu15n9Ww9aFNyxM3VZEN3IOyOzNmuNPv7XwnXsxJA2HEmGjvQYzVUFmOMxk
	aMJ1AuGZsxcOSKDUhkL8RMO20KSEMfBBUAfkKINdCS5Ct+x00qfni7goza5YCgxR
	napGaqmygdPafThv/3wOiw==
Received: from bn1pr04cu002.outbound.protection.outlook.com (mail-eastus2azon11010071.outbound.protection.outlook.com [52.101.56.71])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4cf1wvccqg-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 25 Feb 2026 03:28:20 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=p/tJypy/8xmzy/SDbupJmGZj0ULUjPMdzLkZ/pH1SdWYUH3j7YvE/QkGeCor1RlcNiYuCifNuj8R6hRjHqwhP4GmV8P2B9245PVY00NO2wU9sUju2ulZzswk1M/2msjDfL9v08tBPfuWdp89FKPUX2iApHFCjKpr+0qoNHELNAVkOooTWjozcOvXVFqK3iLU4Sfn1LhorpB3S2kVcVyb+nyQAr+X8Ht65eKZPKINQhuHV6B4/+dPVHQtQnvAUXlfr7sKsr78TBiXEYVfhEIjaWAXwcwJ/oW3xMukJ0SL7HBnqbd+d+ccYqYB7OVJK52JkhPrA4EdMYT1mIx4hEy9hg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=n9dafbRWIFwr2yZPOjMpQ+yPgyNI4Vf/7E5K1lXa25c=;
 b=CgWwj7ZP/h/5XhpURvZHaPKpWB4Z946sFY09+qdXqKp4//+i5q63iyG6UWKXqSlK+YDXn8bHrWLkAR+zeJI2oXsXPXTehPHUqXZKqyQbIfhr/6m2EDfjr2GtMSmut9xctN/Qiw1pnxXTfayeBvQRjNlH0pPcm/q+TKdVmmTscb780hk9iUn4gm0jOlm5X7Dv8iJuWYsheCJd1t8utwtw+o5Czmqo0kY5Aa207+dqTbReDHliCYaHe1mGwTRV2TBK8yIzIQX4bf+Wjt6r5LN60Zj1yKkqQSLAEDxb6/T5iYaNPkGVe9ooslq6RsPpy9AVGB96nMP9C/gqB6w/wWkAbQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS0PR11MB7312.namprd11.prod.outlook.com (2603:10b6:8:11f::18)
 by IA1PR11MB8788.namprd11.prod.outlook.com (2603:10b6:208:597::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.21; Wed, 25 Feb
 2026 03:28:12 +0000
Received: from DS0PR11MB7312.namprd11.prod.outlook.com
 ([fe80::531e:6ef5:812b:48f6]) by DS0PR11MB7312.namprd11.prod.outlook.com
 ([fe80::531e:6ef5:812b:48f6%5]) with mapi id 15.20.9632.017; Wed, 25 Feb 2026
 03:28:11 +0000
Message-ID: <cb25c981-4623-4c95-87f5-c6677414d4be@windriver.com>
Date: Wed, 25 Feb 2026 11:28:05 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH 2/2] appstream: upgrade from 1.0.6 to 1.1.2
To: Peter Kjellerstedt <peter.kjellerstedt@axis.com>,
        "alex.kanavin@gmail.com" <alex.kanavin@gmail.com>
Cc: "openembedded-core@lists.openembedded.org"
 <openembedded-core@lists.openembedded.org>
References: <20260224014148.3328393-1-changqing.li@windriver.com>
 <20260224014148.3328393-2-changqing.li@windriver.com>
 <CANNYZj9RjdkAp326jT1RmeQFEUYyaE_wG6RROeWvtX7xdgMGFw@mail.gmail.com>
 <DB5PR02MB102138725558AB810833F8DFCEF74A@DB5PR02MB10213.eurprd02.prod.outlook.com>
Content-Language: en-US
From: Changqing Li <changqing.li@windriver.com>
In-Reply-To: <DB5PR02MB102138725558AB810833F8DFCEF74A@DB5PR02MB10213.eurprd02.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-ClientProxiedBy: SI2PR02CA0013.apcprd02.prod.outlook.com
 (2603:1096:4:194::21) To DS0PR11MB7312.namprd11.prod.outlook.com
 (2603:10b6:8:11f::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7312:EE_|IA1PR11MB8788:EE_
X-MS-Office365-Filtering-Correlation-Id: 779c10f2-3a60-4274-4ec2-08de741de734
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?SklFcGNFUmNoQUMxUFRDc3BPcjJybndPblZOUVdTV3hPVDdXd2N0eUxqMVVN?=
 =?utf-8?B?MXF2alJTRHM2RXJRbzBuUWUvUUpLREdaNHpUSE9kRGhjMy9aRUNhek9IS2FO?=
 =?utf-8?B?cnc5d0xveDkxMVkxbVFYZVV6WjJRN1FxMFBtZlpZelZQL1dFV1h6NDd1U1NC?=
 =?utf-8?B?T2lvVkFzTXd0Q3J5clBxa2JGeVZwQ0t1R2FoSEZEei9idENpWkRQTEpuNmZ2?=
 =?utf-8?B?azNDSy8raGl1QWkxbnNPUXdLZXh2aHI3eGpGc3VnRjMrOHNwTmdHcG9NRHJh?=
 =?utf-8?B?SFlqSmpXK3EzTHNubkpDTE9DWjFXMDJNR08vb3NvTCtIdStqUG9SMnNKTm93?=
 =?utf-8?B?L3J1Ukd4QTNMOEZFSkNPQzg1MUw3ZW9mcll0OEFyKy9xRDFvakltOVprcTBY?=
 =?utf-8?B?UG83OUhDbW4vQWQzYnp2SDlIanpBQk9mVUlnNW1HWisvajN1V3BQMTk3ZWJ4?=
 =?utf-8?B?WUZtS1pSeHN4d3h2QW9WV1RxYUdEdWxLSUFsOWpndWdpLyt0aEdZbGphZlk0?=
 =?utf-8?B?ME5lQmwrZTBtSTVUOEZSdDdTUkp5N1dsUFJZd2FtdURxUGxXQ2pGWEoxNW1m?=
 =?utf-8?B?RnhJQjlDcVA2Qml4c3VDWHhjOEIweFhRZlptVGsvOUE3d1VaVWF0eFRuc2FD?=
 =?utf-8?B?V3NXbk1rd1h1NmxRdUZ3Qm5odjI5SzhMYVo4c3l3VnV5ZElvc3Y5OXBDRkJL?=
 =?utf-8?B?aFpQcENhSU5nWEdRdFNRQUdhOHAxditTSWVlK3JTMk52QXRpblJXbERrYmhn?=
 =?utf-8?B?QTkrV2E2aXhDYmVUWi84a2pISHFMdjJMaHBJVU9xcFRZMGkzNW5TdkU5VTV2?=
 =?utf-8?B?eE55VEVlUVdxcVpsYi8xU0VBTnhUeS81K0tLdzJlL0Ewa0xNRE1vaXlCR3hT?=
 =?utf-8?B?Zkt5SWZTN3pMeE5WRTN5Q0dHUk5Cc2VyaUIzN0xXSDEyY1VaMkk5a24zQkNU?=
 =?utf-8?B?Qit5VEdTOXBmNW9WWjdHQTBYc3IySXdicnJJd1EzSjVPbktkNmtRSUFUeHdq?=
 =?utf-8?B?UlpUUGErZ3dYUkxDclR3TDJtVWpWYmZLbjVlZ1ZjQ1AvTlVaZXB1TndOQ2NC?=
 =?utf-8?B?OHVUV0V2WDRIQ2x3b2JpVUpWOG1UN3dyNnVBNG9vVVA4RW9UaVJUWE80aVZQ?=
 =?utf-8?B?U2Z1N2YvdlptNUdSSEhudm5XQ2lPVnRHa2laZjdkbXlrc0JBV3BpTDBDYVlP?=
 =?utf-8?B?VDdjanorUUtsQWhnNVg2Z3pza0ZDSStid0hud0JHZlNrYkhpTmNuVzUvNUZU?=
 =?utf-8?B?VVpuL0xsZG84LzZld1RGL2xzc3BwbUxuTlFkOE1QcHB4aHNBcjZKUVhBZXV6?=
 =?utf-8?B?MWF6RWUzMWYzWlIvTkpRdHpKVXhqS3cxMGxiRUFhQVJzV204QWZaYlNWby9o?=
 =?utf-8?B?Q3paUFdkNUFpNkJTbVRUOHl4MFlveG5uK2xVamRmSFJTLzRleC9HMEI4YWhJ?=
 =?utf-8?B?YXdvV3BISi85cGVhNHBYbkFKM3djL3dBaEJBelVXSnI4a2JOcnhhd0FEY0tV?=
 =?utf-8?B?Q0NyZUhyM1FWdkpLeFFody9MSy9BZnJDbGhyWGswU2tiMFlQM3I2NmFIejIz?=
 =?utf-8?B?QjhLZWgwYWpJeHhUb2pRa2Fzb0IwRFJxUXJ1MXI0eGN3WXQvc1VJQlhzSUd5?=
 =?utf-8?B?eFJtWlBCVUJPYUVoaFZ0OHJxODZYTWxtM3BBM1MxY2RVSW12WjE5RjNtMnoy?=
 =?utf-8?B?WE5ZQmZIK2xRTng5T3A4dnhmdDlzcTN5Y0cyMkdTalhkTS82OTlsL1BnczZO?=
 =?utf-8?B?ODVkRnd2MDduQ1JDdkpOVDEyQ1ZtOVE1V1lmN3dOeWJ4MTZiZ3VzNkVqSWRZ?=
 =?utf-8?B?ZitPKy9aLzlRRHNjcURYdEdCcDU4ZjVZTnkwekRJK3BtN2R1Nll0YUNrYldn?=
 =?utf-8?B?WldnRkRVZHMwa2pINGhtV0YwVkM0bmJRSkNXd3VyS3kzcGhNL0pHUTU3M3do?=
 =?utf-8?B?U2M1SVpRZU0wRnNNZzlSVDIrK1UvMnN3NDRjSlpLamkyTkhJeitUTGhtRWhk?=
 =?utf-8?B?Mm5oRHFveS8zTkVXUy9sREpGZjFITlREdkUrcHFnQ0FqRlNuTm5FdmpvajIr?=
 =?utf-8?B?QUNGNktlRGJ3bWk4dGR1dnROeW9NYkdYb2k0N3dWQXdYOUd6ejUvd3RwQk92?=
 =?utf-8?Q?JA8c=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB7312.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?NVNoajdJY2JBc1BtTmU1STRMbWtyNUU1UmZiY2taL0pUT25vVGd5bE1xSnpD?=
 =?utf-8?B?UUMvZStWSDJERDJiWGp1Q1FPNlFpMXZTVjAxaWJuekVrZXRKL05TbmFNY3FB?=
 =?utf-8?B?RmhDYVpiTHpjUDgvSlBpYmc1ZnFyU05TK0J0bEhGQW05aHdqQVRuaERyeGEx?=
 =?utf-8?B?OXNLZ25Jc3hWZ3JUSW1CRWs5enpUNVM3UXk3RXZlMGpFVEw2YXlTTWE3R3I2?=
 =?utf-8?B?MkMwR0d1cnhhaGlpT0Y1TDJyM0JlL1VMNGJ4SXR5K0ExOXRoYXA0TzcwUitp?=
 =?utf-8?B?ZCtCeWZLLzJoV2J4SVRyT0ZZT2RvNG94NXUyQVJEWHdTTUJEYldQTUFpaEQ5?=
 =?utf-8?B?VEVrL0cvRlBaSmp6UEpHSHBtalNCdW5TTVVXRC9VeGE0ZWsrMyttYmYyRElJ?=
 =?utf-8?B?cjVxRHJGRjE1UDRIdG0xazd1UUNveWMyZHZzUDdCZC9LRW1KUjcvRjdZc0hp?=
 =?utf-8?B?UnhTYzRaakY2a3QrQXlPb1pNSVVjUjN2UnZ3YTBYa2dqa1VEREM4azA3QVND?=
 =?utf-8?B?Y014bG1WT2QwRWhGZCtBZEJrSjB2M1JEWU9VUEE5K2VZRVVIWEZOT21YZWox?=
 =?utf-8?B?R0N4VThGZ2hjU1NQZTNRVDY2NnNKb2FjTGpNa3pscEtSVFI3ZG9QbnkzZXVT?=
 =?utf-8?B?QTRtUlBVcW9Vc05OS1A3NUVPcU8rUnlkWStrQVNidjRsWkFncDN0QW0rdCtt?=
 =?utf-8?B?dSticmRwUndYZkU2NXdLV2dwWXV4dE5Ua2tORjFQT1B3NDAvQkg0Yi9zcWtV?=
 =?utf-8?B?T1FnbEtROUxjUG9XUHVOM3dsNm9Ic2FuNnBCdGFRaXRuOE5lNThjVTgvbDAy?=
 =?utf-8?B?Z0RVMUZqN01NNHN0S0Joazl4ZzV3NXF5UEFyeGxnM2JuWGtEQi9DVXZ3cUVH?=
 =?utf-8?B?ZTNpZkNPYk9kZk5CdnJOWFBXWjFHSFZkMXNsc2E4VUNmTjRYMVVhakcrUWli?=
 =?utf-8?B?bzNlY05RdUVPLysyWEozVnV5eGRMU0JPelplRXUwUVJBZ29EZGR2K3d2MUc4?=
 =?utf-8?B?UHFsMzZqMEp0N1RwbFR3VG5tZmNMN1BEU1ArbTk2eXNvZER1dmV4dzBwUXlz?=
 =?utf-8?B?cHhpMjE2bmxpY2FQbUkwRzB0SDltZXRua2ZkUnJ0NklNdnFYMWt3NlhnazVs?=
 =?utf-8?B?T05qMlZVVGYzVmxnS0M0dEk5cVcraGZRRWJ1bXQzdUF5a0Nxc1pLbHVQTHpq?=
 =?utf-8?B?RklMSVB6Q2xrTjE5d0RocVRYZVh4UDkrQ2kvakNzekJHL2tZQUdjTEhsVXFY?=
 =?utf-8?B?dEIxUTZSaTBjRkJrREQ0elZpdERoSmtvcHFOcWV1U3FCT3RhblZSNVNWdC9Q?=
 =?utf-8?B?Y3lYUGZYRXVGUEdQemE1cnNXODB1Y3BjTGF4WXNkYWtzOGkvdnF0WVd6QkZZ?=
 =?utf-8?B?YjNoUitvK0RocG13L1oxUkpVZnFwNUpaVms5WHZyZW50WjdDaXBld09WbWo4?=
 =?utf-8?B?cUx1cWVyZ0ZZSE9WSzJJMnYxdnorREFBSWJXQkJtdlExTGVDZU51TGxyb1lH?=
 =?utf-8?B?Yjdta2VyV0hZcURUS00vSGtJZHJ6NGsxMmYwR25sV2JJaFJwb1dlcDlnRUZO?=
 =?utf-8?B?MUQwc21OT0lrbGVFV0w0VFZ1MVNZM3F5bzJkcXJKM3Qwc3E1Qm9lRVpCT0pD?=
 =?utf-8?B?NWRQNmJpM1RjYy9hYjdITkVwRDNzTzRUQjlCNDd0STY2VXFNNWtLRk40TUFB?=
 =?utf-8?B?RllWN3JueGViN0FXaTl5YkNKR296M3JnZjVXMk1LUDh2aHlmaERsK0drYWxR?=
 =?utf-8?B?VmwzckdmMTJQTXcrbFpnM1Q5Tm8yNnlud2hnUE4zY2Q4RTd6WmFoanM0YWFr?=
 =?utf-8?B?aFdCZDdneXZrN2FBRkcvdWJBVmZOZit6VlFDb1NCYnJHTEpBUVI3dm5LNTNN?=
 =?utf-8?B?VXVseS9Nem5RRGR4a20vaGJGcGhNUEk5RzlhdFlqalc0MjYzTGFDWW5QdTdB?=
 =?utf-8?B?UUhubzh6aVBYL3FoNDd3aGc2N1dxcFBGUm9wTnV2UGFzb1BSZWhrbmhOd1BZ?=
 =?utf-8?B?MWRZRkhCeGpuWUpQNDdHSkV2SlVrUmdMOUJ2cVM0QlRHRTRkd2pOdFZUUVJw?=
 =?utf-8?B?Q0NpcXFSSXVKdXkvZTMwV0VSZFdQSEo4NjU0aG1YckhaOUVZTUFzNzBGeW8z?=
 =?utf-8?B?RHVmRTQydGJQNjFHVXpBVDFJWTVUWEpBQ05OWnNrSVUwQ2xnZHJMZ20zVGdF?=
 =?utf-8?B?cFp0cm9lTUgrbGFuMEdoR3M1NW9yMjRMdWpjZ0JrSFowa0RpTysvNEFZU2U3?=
 =?utf-8?B?TjNyb1laeVJ5OGM2NTdoU2gvb3NaYWhrdGhkaVJ6dkhJMk5lTVI3VXFnT0da?=
 =?utf-8?B?TzNjRGRmSVRZeG9XRHA0ZzU3SUY0aUxDK0pvb0lYaFU2ZnN2QS8yMW1mOVZD?=
 =?utf-8?Q?HaF1Eq48yLu9JQ8c=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 779c10f2-3a60-4274-4ec2-08de741de734
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7312.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Feb 2026 03:28:11.8631
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cV1a/TkVoWUS3Dq8Nl2x+mvQhJuuFlLzezmahr4ayA4dTSQ9pLTWr/vmBEK3jGDnZhJQk33C/48gM6UbPx+Q5aMTkmqy69QgbTc4TuIGjsk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB8788
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjI1MDAzMCBTYWx0ZWRfX67LZUUsv5OpE
 6dwJlZ2uvEv0Bfd1Q4Am6OwJBkS11s1XIwtK52lF4HE3TujxDqMixvF1xwwCUsZr3EJeJDZLdNz
 pFAVXuMktw7VfQdrrKHAyMWzQlPelo9DAY2AdgalssZAE2zBipu9azQVHbFKgDnWixfuLlE7sem
 pQ4/Ak5fxKibF7kLBQAd1JA3Fw5DYoMwQSC5MvpM2FxZUYk6SGQogkrkIFQE368IgkIZ8S93DXW
 Gj6Dm5K9dpoTKAKi2OGflK9G77+IPBRBJBigsR38cEbRVEcxk3o2UpQ6eiF8LvkPd5mjTKxdwCF
 KZ6TF59sgDzHEag9niW+XuwcAPVPfmGSHHUf5VODLTgsS93Y3qiih5lyZIdBx0o50Kp71b/dldd
 fw7Fgg8Zvf1XVyxtRy9GZ/+HwVLjfrIxa2tK9LhXYzES0ND0jMys/GrzVF2WcPfMEbeJIU7d2oi
 J02nfs9uQU/vyCo4W/Q==
X-Proofpoint-GUID: 48ydV9DCRXAorkdfo18H24EfsquVFFfB
X-Proofpoint-ORIG-GUID: ywqvd07L-1Sp-VUjHZBisOAlQ0ejfysB
X-Authority-Analysis: v=2.4 cv=F+hat6hN c=1 sm=1 tr=0 ts=699e6c54 cx=c_pps
 a=ht+bKkBNmLq2ln/DE6MnYA==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10
 a=VkNPw1HP01LnGYTKEx00:22 a=bi6dqmuHe4P4UrxVR6um:22 a=klDOsUkWDRETUCZYPvoE:22
 a=Q4-j1AaZAAAA:8 a=t7CeM3EgAAAA:8 a=OP38QO1LZeMvsAOxz9kA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=9H3Qd4_ONW2Ztcrla5EB:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-24_03,2026-02-23_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 phishscore=0 lowpriorityscore=0 malwarescore=0
 clxscore=1015 impostorscore=0 bulkscore=0 priorityscore=1501 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2602250030
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 61ONMtwU616694
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 25 Feb 2026 03:28:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/231923


On 2/24/26 23:44, Peter Kjellerstedt wrote:
> CAUTION: This email comes from a non Wind River email account!
> Do not click links or open attachments unless you recognize the sender =
and know the content is safe.
>
>> -----Original Message-----
>> From: openembedded-core@lists.openembedded.org <openembedded-core@list=
s.openembedded.org> On Behalf Of Alexander Kanavin via lists.openembedded=
.org
>> Sent: den 24 februari 2026 10:59
>> To: changqing.li@windriver.com
>> Cc: openembedded-core@lists.openembedded.org
>> Subject: Re: [OE-core] [PATCH 2/2] appstream: upgrade from 1.0.6 to 1.=
1.2
>>
>> On Tue, 24 Feb 2026 at 02:42, Changqing Li via lists.openembedded.org =
<changqing.li=3Dwindriver.com@lists.openembedded.org> wrote:
>>
>>> +PACKAGECONFIG:class-target +=3D "bash-completion"
> That should be:
>
> PACKAGECONFIG:append:class-target =3D " bash-completion"
>
> or it will replace the PACKAGECONFIG for target rather than
> add to it.
>
>>>   PACKAGECONFIG[systemd] =3D "-Dsystemd=3Dtrue,-Dsystemd=3Dfalse,syst=
emd"
>>>   PACKAGECONFIG[stemming] =3D "-Dstemming=3Dtrue,-Dstemming=3Dfalse,l=
ibstemmer"
>>>   PACKAGECONFIG[qt6] =3D "-Dqt=3Dtrue,-Dqt=3Dfalse,qtbase"
>>> +PACKAGECONFIG[bash-completion] =3D "-Dbash-completion=3Dtrue,-Dbash-=
completion=3Dfalse,bash-completion"
> Remove the dependency on bash-completion (see below).
>
>> bash-completion can perhaps stay disabled for both native and target?
>>
>> Alex
> No, better is to instead inherit the bash-completion bbclass so the
> file(s) are packaged separately, and installed automatically when
> the bash-completion-pkgs feature is enabled.

Thanks=C2=A0 Peter and Alex.=C2=A0 I will send a V2 according to the comm=
ents.

//Changqing

>
> //Peter
>

