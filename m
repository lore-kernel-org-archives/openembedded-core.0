Return-Path: <yi.zhao@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EE4EAC433F5
	for <webhook@archiver.kernel.org>; Tue,  9 Nov 2021 15:03:00 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com
 [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.13151.1636470180231092957
 for <openembedded-core@lists.openembedded.org>;
 Tue, 09 Nov 2021 07:03:00 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=ZJ0bNymS;
 spf=pass (domain: windriver.com, ip: 205.220.178.238,
 mailfrom: prvs=6947224753=yi.zhao@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id
 1A9D0BKl026810
	for <openembedded-core@lists.openembedded.org>; Tue, 9 Nov 2021 15:02:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=subject : to :
 references : from : message-id : date : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=PPS06212021;
 bh=ST2XEJ0Eg3uIvI75NEyW42GJLayCFW1bTLa4Uk4f3og=;
 b=ZJ0bNymSDfEB/vKysydKqz/PFW0tYRbf566mhZl7Y8VpmW3aq7aiiMXKyiM6Q/brmA3Y
 Qh+BO+w/pyiQf5t8QS6XPW9jBdy2djajdvj2CfdWjMON2eK7vwgzPMxJQxDZ9pOZKE6Q
 bYji6LO7ei9k+3M+BS+dPqNCgD0mpMrD+Apo3oFDj+VPpRUSAoKlMsFGhHWqZXErEyi6
 LbmYlYuEL4Cytn1G/IPnd+OKSvPZluTiuArNdz4xBtjt4zPDyFT2GrA56MwVlLPrj5jY
 ncq6+k3N//2scg4DbKYVIt8EkIdiKmUkra4kN+nySD/rEKj7D2hA+FuvRV0g3p0KbdYI NQ==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3c7sf1r4cp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
 Tue, 09 Nov 2021 15:02:57 +0000
Received: from m0250812.ppops.net (m0250812.ppops.net [127.0.0.1])
	by pps.reinject (8.16.1.2/8.16.1.2) with ESMTP id 1A9F1rGi029636
	for <openembedded-core@lists.openembedded.org>; Tue, 9 Nov 2021 15:02:56 GMT
Received: from nam11-bn8-obe.outbound.protection.outlook.com
 (mail-bn8nam11lp2171.outbound.protection.outlook.com [104.47.58.171])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3c7sf1r4cj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 09 Nov 2021 15:02:56 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JBOJ0dRCmwjM3tudI7T3yjsd2dfA2OtAKMhpA+DaWhyUkGZsmoEgqbs+xze5OQsm/XqeaT7l7nD2YGirVvvCrolELsxt1wQ/Yat5ZWAs7M0+3hYmQlwuEFFbFEDOcN1wvBIWEv845yCT+/JXDBrpYg/9ipx2xdr4OmgBPote9vvFgdZOWiLrHTaTzT3bNr8uke9R/BanWrh0M/+EekgRGy3ao4NzQmlLakNKrCYsNvOrMYfy1ZBiXg1zl69IS+IIDeRQ+f0ORTIt91mwC3Q5pYiPqR7SWUWdgCY+gvo7LgjXc5yoHQGEg05wYlz8bAPYDZlBdQD0TAZNvmCm0YKY6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ST2XEJ0Eg3uIvI75NEyW42GJLayCFW1bTLa4Uk4f3og=;
 b=mBc36d2Jm0eHpF62MBUQTtLaFwc9OxvkDUOd5rSQTzXsp9jnyqp9WLOU+Pv3vT/HTBrb8GwfCTQnFEHh2rwXJcThyJ6Fx123bnxJALgt+YDtsG4ehYu5j1m9qXPpvWY5jWWh//5AbgU1aGtRW8ez9PLLZl7g47BdftID+CxaCUn0icCebiDKYjJ2e0l0X+kjcM7UL5uH/o0dN3e+drsvEElSm+sML4KUuAhLX0ZzE9DnVqImL/fxXMOsRE6hZvl9T9vNNUFMo2vBNkjIM26cW/qKAuJ8gN0rMaVywJI7Hz3lkGXvoplUrUv75HoTJ5yNXIGJW+RL/a0gZOROMg6w4Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from CO1PR11MB4867.namprd11.prod.outlook.com (2603:10b6:303:9a::13)
 by MWHPR11MB1280.namprd11.prod.outlook.com (2603:10b6:300:2b::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4669.13; Tue, 9 Nov
 2021 15:02:53 +0000
Received: from CO1PR11MB4867.namprd11.prod.outlook.com
 ([fe80::455e:9cfb:d106:4480]) by CO1PR11MB4867.namprd11.prod.outlook.com
 ([fe80::455e:9cfb:d106:4480%9]) with mapi id 15.20.4669.016; Tue, 9 Nov 2021
 15:02:53 +0000
Subject: Re: [OE-core] [PATCH] python3-nose: translate to python3 code before
 build
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
        openembedded-core@lists.openembedded.org
References: <20211108065510.25048-1-yi.zhao@windriver.com>
 <5a504e34529cf69e28b9f1e3810ecdd3797cd1f3.camel@linuxfoundation.org>
From: Yi Zhao <yi.zhao@windriver.com>
Message-ID: <a4138f05-8136-1d34-f340-6d211d7bb38a@windriver.com>
Date: Tue, 9 Nov 2021 23:02:45 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
In-Reply-To: 
 <5a504e34529cf69e28b9f1e3810ecdd3797cd1f3.camel@linuxfoundation.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-ClientProxiedBy: HK2PR02CA0191.apcprd02.prod.outlook.com
 (2603:1096:201:21::27) To CO1PR11MB4867.namprd11.prod.outlook.com
 (2603:10b6:303:9a::13)
MIME-Version: 1.0
Received: from [128.224.162.174] (60.247.85.82) by
 HK2PR02CA0191.apcprd02.prod.outlook.com (2603:1096:201:21::27) with Microsoft
 SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4669.11 via Frontend
 Transport; Tue, 9 Nov 2021 15:02:52 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 0287976a-7618-4bb7-24ef-08d9a3920156
X-MS-TrafficTypeDiagnostic: MWHPR11MB1280:
X-Microsoft-Antispam-PRVS: 
	<MWHPR11MB128024045E3924046A6FE004F9929@MWHPR11MB1280.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1148;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	mRB1kNTkHoOvCKxxA2PwuxTer4InYxniDPCgrr0ZhKPq1M6cP+PMNG8RCd18rF8obvVFcmSlTCbBA+bVbZ2PzXfa+gywwjtX6HuywTEEM/RgaoX1NOASsZdzyTRqpKVQIbkN+Es3yHBbyeAY9v00yzeU17HlNK7fJ5kQZ9RSz/WI8lz9dcPa4cvgbx7vnmJONoHNnCgV+MBroXFQtOVOPfvbSb1uxwKRhlJIFQ3ejXcSG77TKuNtXmgT2dKUNBwaJalVI15gGiblAJ9BSSNjTM4d3QGHzYzikaOSJmz1YppcYW2enn9H2fImscdmiJJ+qq8dRC7MYxIcOImbP2txQ9HnEQrPxenizFlGBtwHFX1kCaZFk9vc80Dpm2fVK1wJQekwd/uN7WFiRuc9ZmiKiaH5cMsZq3QNqIlbEq4RzoeqaEkKnk5SiBDDd1cO9XyoYPtUS4UbyyDXjBRKtWUmnUvIcpH7SnE/HLhuUkD29uPK6dD5OA7uMyBcsOemFk99EfvGzmxlrlAFxm35Lw5b1OMmf62mupzaPf6khLQXBn0Bf2vU7GzRrnBRYdkRapDUHZL3lb0cqiDNhcjyGDiC6i16e2HUed3l6SrHkFaiZebW74gbGgJow+GYQlvQOSZh2UzfRh9TTej44vNHvIrT+7zRVcxcIOvuX9lhcSfx7RqdGesBz5Zm/UfKE/1slX2TXb4ciDFkQX2pnfvgP3rIomv9xlvSxF91BgkJHF3+pI490A2zqpNvj8HiqcUogGwUpOyOu9i+4JLCWAjYlEVBT3nQepVEsJNC2HHZUok+4gCR84krSwpkDKXffFiJ0G+CXLv+w1GZ52j7EiGKBO2M5ylf4Z7JLqKuPuZk9BhDEWyBxuMNisaNboF4aWRQYyuEFSxgbFndGgsJD8MmtU4Wd8gr8KMm2/a8YYRsWkjHW/8=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB4867.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(66476007)(31696002)(36756003)(66556008)(316002)(5660300002)(86362001)(8676002)(38100700002)(31686004)(2906002)(38350700002)(16576012)(966005)(66946007)(6666004)(26005)(44832011)(52116002)(6706004)(2616005)(6486002)(508600001)(956004)(53546011)(186003)(8936002)(78286007)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?S1hjYlNPSk55WTMvRnppTFVLV1Q1TFFJYVFiTkE4ZDhvRFYwdURhd2FCeFZm?=
 =?utf-8?B?L0lpSThiaC8reHFKZFZYMHVrMkZBWHFUOFdmdGVUK2RTR1o3bW1rdnF2SkRy?=
 =?utf-8?B?WjRYNHJjOS9FOHc3M1NZdlVOS2xhREFqdW1zS3A2VERZMjg0eVdzU1lUcXcz?=
 =?utf-8?B?K2pVYjZEdjFYQUZBWlhRMEJmd0pma1dXbFJUcThRV00wMDlianN1UTNPVmtj?=
 =?utf-8?B?NkNob3NwMnlFSjFVSUdVRU9tWEVyVEFqdVlocThkbFVvMTRVY2JUMDIxWHVL?=
 =?utf-8?B?S0xGQmF3NVl6RlE5eWM0RjZ3SGZ3VDBzSmYxeVZNdXVQWEdXZmRxT0FDY2Z4?=
 =?utf-8?B?Q0R3V3lQUUtTU0R2cW1FSGR3cmZFeTM2cmNLUVN0TmVCeFhBVURJM0tWVExw?=
 =?utf-8?B?NjUrNFhieXFKNmlaOVZtclZQZWZiWFFML3BYRjd4dFMwNXlEK3dmR0RrK01u?=
 =?utf-8?B?VzRYYW5ORzB5ZWlaMDdLc1FWUnlEMmJqRHdrTzhlR0o2VHpTYWhOZzBkQTNS?=
 =?utf-8?B?clBJeW9HMXBYZmZjT29WTW8xaDBPZGsweDB5UHpvQVFFVEpsOVpGdUpkN3Nx?=
 =?utf-8?B?c3JUMnBJRmJPc3RYdDVEakdVOG9MU2Nxak9PeCtHV3lBNzFjL21IdXkxVWds?=
 =?utf-8?B?MkZDWmVsbUl1NTlGWGtKTXBSM0pheVJ6NXFTYW5scEoyWVpnbThLVDBkeGJU?=
 =?utf-8?B?eGt3Yys2WXh1T0JPUkpBU0FHU3VHSkxNUVo0cHlyVVppZlNCc2UzYkxUdTdW?=
 =?utf-8?B?cnNuMWVQWHZSMXpwSXROc1JPN1JSazZSejI5UmRSQ0R3ZWRodHRaMC8vbWFw?=
 =?utf-8?B?RGJOVDVCeno0bXBPVUdadHlOcUhlYjY5NXlVRm9GRGhyMlFzZll3S0FZelRm?=
 =?utf-8?B?RUlrRTlwSXdPTFRURUVlOVp3bVh3OWFZazZxY2d0OWk3d0hNQXYxRU5RdDVw?=
 =?utf-8?B?SUJoazJnK3JMWXJBZlZKWUlDZFlMWlJjR0V6b1hLdDVveDZRb055M0tJWXhl?=
 =?utf-8?B?MUwvK2dnanY0eXpybG5kQ2hlaWJTNFdJSlpwMEFLNWpObXlHOEIvR1dDa1Nj?=
 =?utf-8?B?eGVDbENZVDhsWW5jc1E4ais5aGpJUldJN3FQY0RiUTgwOHBFemV1T0g1NVgz?=
 =?utf-8?B?eFhid0NIa01CUFhaRVRyM25QV0xFY0ZIZ3pibkxtanZ6dWFidXhkalN6MVl5?=
 =?utf-8?B?M2NDU0ZDdjhUeWplRFlKeW81MGd5T09hcW1NNWs5ZkE3aUJEMzBOQ3JPaVVJ?=
 =?utf-8?B?UTdYNjBwZFp1WnFTMFFtRXpIeStQQzdrc0tVSDhhdVRSeWVEME9xMEE0NjY2?=
 =?utf-8?B?TDhBNitoVzJLUGVDUEJnVDFzZjVnMmdvSVUyVnVKdnRTaGlZNkR3SGpxcmpo?=
 =?utf-8?B?dkk1L3EwZHVXeFlrcU1pMjcycmdrMXJ3Z3kxYkJCdTdSUlYraXZWN1ppeVph?=
 =?utf-8?B?dHhzbWNnWnV2Tmo2NnB3ZE9RcExRSjR6UXNxMmo4WU45eHFxaDFRNGlQb0ZL?=
 =?utf-8?B?akREMitHdEZOKzFqbEEvNW02TW5oYnR6MVZNS1lJZ2M4UWhYRUhFNEpvc3hi?=
 =?utf-8?B?c1d0SGpNN3JwSk54bVNtOGRtTzUrVUt3N3BQQU9uNzRtUHdaL2hTa1pxQjI3?=
 =?utf-8?B?bVAweXJSTWFlUU0xMVRmNXNSZm1vMVdKdkdFTU1FL01oemZtcFk3WUhlbnFv?=
 =?utf-8?B?OTVTdFNDK3NRODRYdW9OK1AxelBtOUlBaDNKSnZMb2czTjRGbTRPU3F2bmV4?=
 =?utf-8?B?L1g1Yy9WUDdzdXRkdGpHSjFyNHVaUmxaYStJUW1ETXNUVFpaUFYya3FjM3pu?=
 =?utf-8?B?RCtWNHBNbFFrVEhrWWVidjBkdkN5Tm42Snl5N1ppVGpXdkQ4anh5OEpjUkps?=
 =?utf-8?B?MlBMTnBQU1dDdTRtMzJXZS9OM1dKcldhaFRxTzd2RVFlaWJMc1NYVFdyZXBp?=
 =?utf-8?B?ZjdkeWtSdmhYR0hyNXpZNmRMc0hqUjEyWE5jUjFoV0VwcG1rT1dXVll3MUtJ?=
 =?utf-8?B?Nkt4cExaVlFnK0U1L0svNkQ3RDMwY3F4OHJvTkxBVHZRNmhwcFB6SSszSEdC?=
 =?utf-8?B?SGNoZHc4Y21yU05Vd0JsK3ZsZ1pRemRTcFBDZWR6eldrbzV3YzU0QkYxUUx5?=
 =?utf-8?B?QUtWUG1vcHZ4VHVlcUZVaDdtZUJTWHFMUUZpZEVTZnI0Z2dRVVBBeUlwYjFT?=
 =?utf-8?Q?N8O7bF4ue8vpQW02s/S7Trs=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 0287976a-7618-4bb7-24ef-08d9a3920156
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB4867.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Nov 2021 15:02:53.4154
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 jgSrCeAeBgOwQVMdbIo+EWRKPlJFj0zfbSa9P6pzb4GMDdArBZ6ydO3ssBxCY4wp8uLP7vJLkSKvtY9ihAshdQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR11MB1280
X-Proofpoint-GUID: uMWxeaNRbk8Bgd-bK3PONJf2JC7QSMDT
X-Proofpoint-ORIG-GUID: SwpdVn-xG9Y3UIEnMzOmsLGf9sw0h6Eg
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.0.607.475
 definitions=2021-11-09_03,2021-11-08_02,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=999
 impostorscore=0 lowpriorityscore=0 malwarescore=0 bulkscore=0 phishscore=0
 clxscore=1011 mlxscore=0 priorityscore=1501 suspectscore=0 spamscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2111090090
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 09 Nov 2021 15:03:00 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/158048


On 11/9/21 5:56 AM, Richard Purdie wrote:
> On Mon, 2021-11-08 at 14:55 +0800, Yi Zhao wrote:
>> Setuptools has removed support for 2to3 during builds since version
>> 58[1]. But the nose's setup.py relies on use_2to3 option in setuptools,
>> it is failing an import and building without running 2to3 and generating
>> valid python3 code. As a workaround, we use command line 2to3 tool to
>> translate to Python3 code before build it.
>>
>> Fixes:
>> $ python3
>>>>> import nose
>> Traceback (most recent call last):
>> File "<stdin>", line 1, in <module>
>> File "/usr/lib/python3.10/site-packages/nose/_init_.py", line 1, in <module>
>> from nose.core import collector, main, run, run_exit, runmodule
>> File "/usr/lib/python3.10/site-packages/nose/core.py", line 153
>> print "%s version %s" % (os.path.basename(sys.argv[0]), _version_)
>> ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
>> SyntaxError: Missing parentheses in call to 'print'. Did you mean print(...)?
>> [1] https://github.com/pypa/setuptools/issues/2086
>>
>> Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
>> ---
>>   meta/recipes-devtools/python/python-nose.inc  |  6 ++
>>   .../python3-nose/0001-Remove-use_2to3.patch   | 71 +++++++++++++++++++
>>   2 files changed, 77 insertions(+)
>>   create mode 100644 meta/recipes-devtools/python/python3-nose/0001-Remove-use_2to3.patch
> This failed in testing unfortunately:
>
> https://autobuilder.yoctoproject.org/typhoon/#/builders/40/builds/4323/steps/14/logs/stdio

Hi Richard,


I can not reproduce this issue in my local. Is there any detail log that 
I can find ? Maybe it is a parallel build issue.


Thanks,

Yi


> Cheers,
>
> Richard
>

